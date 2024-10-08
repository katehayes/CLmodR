mod <- new_model$new(user = pars)
t <- seq(0, 520, length.out = 2081)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))


mod_states <- mod_data %>%
  select(c(starts_with("P1C"), starts_with("P2C"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "Not in poverty", "In poverty"),
         care = ifelse(grepl("C1", state), "C1", NA),
         care = ifelse(grepl("C2", state), "C2", care),
         care = ifelse(grepl("C3", state), "C3", care),
         care = ifelse(grepl("C4", state), "C4", care),
         school = ifelse(grepl("S1", state), "Never", "PRU"),
         school = ifelse(grepl("S3", state), "Prior", school),
         yjs = ifelse(grepl("J1", state), "No contact with YJS", NA),
         yjs = ifelse(grepl("J2", state), "Known to police", yjs),
         yjs = ifelse(grepl("J3", state), "In the YJS", yjs),
         yjs = ifelse(grepl("J4", state), "In custody", yjs)) %>% 
  select(-state)


neet_states <- mod_data %>%
  select(c(starts_with("P1C"), starts_with("P2C"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "P1", "P2"),
         care = ifelse(grepl("C1", state), "C1", NA),
         care = ifelse(grepl("C2", state), "C2", care),
         care = ifelse(grepl("C3", state), "C3", care),
         care = ifelse(grepl("C4", state), "C4", care),
         school = ifelse(grepl("S1", state), "S1", "S2"),
         school = ifelse(grepl("S3", state), "S3", school),
         yjs = ifelse(grepl("J1", state), "J1", NA),
         yjs = ifelse(grepl("J2", state), "J2", yjs),
         yjs = ifelse(grepl("J3", state), "J3", yjs),
         yjs = ifelse(grepl("J4", state), "J4", yjs)) %>% 
  select(-state) 





# neet16_params <- mod_data %>% 
#   select(c(starts_with("neet16_"), t)) %>% 
#   pivot_longer(-t, names_to = "param", values_to = "neet16") %>%
#   mutate(poverty = ifelse(grepl("p1", param), "P1", "P2"),
#          school = ifelse(grepl("s1", param), "S1", "S2"),
#          school = ifelse(grepl("s3", param), "S3", school),
#          care = ifelse(grepl("c1", param), "C1", NA),
#          care = ifelse(grepl("c2", param), "C2", care),
#          care = ifelse(grepl("c3", param), "C3", care),
#          care = ifelse(grepl("c4", param), "C4", care),
#          yjs = ifelse(grepl("j1", param), "J1", NA),
#          yjs = ifelse(grepl("j2", param), "J2", yjs),
#          yjs = ifelse(grepl("j3", param), "J3", yjs),
#          yjs = ifelse(grepl("j4", param), "J4", yjs)) %>% 
#   select(-param)
# 

# neet_s1s2 <- mod_data %>% 
#   select(c(starts_with("s1s2"), t)) %>% 
#   pivot_longer(-t, names_to = "param", values_to = "s1s2") %>%
#   mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
#          poverty = ifelse(grepl("p1", param), "P1", "P2"),
#          care = ifelse(grepl("c1", param), "C1", NA),
#          care = ifelse(grepl("c2", param), "C2", care),
#          care = ifelse(grepl("c3", param), "C3", care),
#          care = ifelse(grepl("c4", param), "C4", care),
#          yjs = ifelse(grepl("j1", param), "J1", NA),
#          yjs = ifelse(grepl("j2", param), "J2", yjs),
#          yjs = ifelse(grepl("j3", param), "J3", yjs),
#          yjs = ifelse(grepl("j4", param), "J4", yjs)) %>% 
#   select(-param) %>% 
#   filter(age <= 16)


neet_v_modout <- neet_states %>% 
  filter(age >= 16) %>% 
  mutate(neet = ifelse(school == "S2", "NEET", "not NEET")) %>% 
  group_by(t, neet, age) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t, age) %>% 
  mutate(pc_mod = count/sum(count)) %>% 
  filter(neet == "NEET") %>% 
  select(t, age, pc_mod) %>% 
  full_join(neet_11to23_age %>% 
          group_by(end_period_year, age) %>% 
          mutate(pc = count/sum(count)) %>% 
          mutate(pc_data = ifelse(age == 16, pc*1.15, pc*1.11)) %>% 
          ungroup() %>% 
          filter(neet == "NEET") %>% 
          mutate(t = (end_period_year - 2010)*52) %>% 
          select(t, age, pc_data))  %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc_mod, group = as.character(age), color = as.character(age))) +
  geom_point(aes(x = t, y = pc_data, group = as.character(age), color = as.character(age))) +
  scale_colour_viridis(option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.1,
                       end = 0.9) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 676, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020", "2022")) +
  labs(x = "",
       y = "")+
  ggtitle("% of 16, 17 year olds who are NEET in model vs. data")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())


neet_v_modout
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/neet_v_modout.png", neet_v_modout)


check <- neet_11to23_age %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  mutate(pc = ifelse(age == 16, pc*1.15, pc*1.11)) %>% 
  ungroup() %>% 
  filter(neet == "NEET") %>% 
  select(-count) %>% 
  pivot_wider(names_from = age,
              values_from = pc) %>% 
  mutate(smooth16 = smooth.spline(end_period_year, `16`)$y) %>% 
  mutate(smooth17 = smooth.spline(end_period_year, `17`)$y) %>% 
  mutate(smooth16 = (smooth16/2)/52) %>% 
  mutate(end_period_year = end_period_year -1) %>% 
  filter(end_period_year <= 2021)

s_16 <- check$smooth16




# neet_cohort_v_modout <- neet_states %>% 
#   filter(age >= 16) %>% 
#   mutate(neet = ifelse(school == "S2", "NEET", "not NEET")) %>% 
#   group_by(t, neet, age) %>% 
#   summarise(count = sum(count)) %>% 
#   ungroup() %>% 
#   mutate(end_period_year = 2010 + floor(t/52)) %>% 
#   add_cohort() %>% 
#   group_by(t, cohort) %>% 
#   mutate(pc = count/sum(count)) %>% 
#   filter(neet == "NEET") %>% 
#   select(t, cohort, count, pc) %>% 
#   # filter(t %in% c(45:60)) %>% 
#   ggplot() +
#   geom_line(aes(x = t, y = pc, group = cohort, color =cohort)) +
#   scale_colour_viridis(option = "turbo",
#                        discrete=T,
#                        direction = -1,
#                        begin = 0.1,
#                        end = 0.9) +
#   theme_bw() +
#   # scale_x_continuous(breaks = seq(0, 520, 104),
#   #                    labels = c("2010",  "2012", "2014", 
#   #                               "2016",  "2018", "2020")) +
#   labs(x = "",
#        y = "")+
#   ggtitle("NEET model v data")+
#   theme(plot.title = element_text(size=12))
# 
# neet_cohort_v_modout
# # 
# 
# neet_gender <- neet_16to23_age_gender %>% 
#   filter(gender == "Boys") %>% 
#   group_by(end_period_year, age) %>% 
#   mutate(pc = count/sum(count)) %>% 
#   filter(neet == "NEET") %>% 
#   ungroup() %>% 
#   select(end_period_year, pc, age) %>% 
#   rename(Boys = pc) %>% 
#   left_join(neet_16to23_age_gender %>% 
#               ungroup() %>% 
#               filter(gender != "Unknown") %>% 
#               group_by(end_period_year, age, neet) %>% 
#               summarise(count = sum(count)) %>% 
#               ungroup() %>% 
#               group_by(end_period_year, age) %>% 
#               mutate(pc = count/sum(count)) %>% 
#               filter(neet == "NEET") %>% 
#               ungroup() %>% 
#               select(end_period_year, pc, age) %>% 
#               rename(All = pc)) %>% 
#   mutate(ratio = Boys/All) %>% 
#   group_by(age) %>% 
#   summarise(ratio = mean(ratio))
#   
# 



# 
# neet_16to23_age_gender %>% 
#   filter(gender != "Unknown") %>% 
#   group_by(end_period_year, gender) %>% 
#   mutate(pc = count/sum(count)) %>% 
#   filter(neet == "NEET") %>% 
#   select(-count) %>% 
#   pivot_wider(names_from = gender,
#               values_from = pc) %>% 
#   mutate(ratio = Boys/Girls) 


neet_tests_again <- plot_grid(neet_t1, neet_t2, neet_t3, neet_t4, ncol = 1, align = "v")
neet_tests_again
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/neet_tests_again.png", neet_tests_again)



# NEET TEST ONE
#  in 2010, Connexions data showed that young people supervised by a 
# youth offending team were 2.6 times more likely to be NEET for 
# six months or more than those who were not


neet_t1 <- mod_data %>%
  select(c(starts_with("P1C"), starts_with("P2C"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "P1", "P2"),
         care = ifelse(grepl("C1", state), "C1", NA),
         care = ifelse(grepl("C2", state), "C2", care),
         care = ifelse(grepl("C3", state), "C3", care),
         care = ifelse(grepl("C4", state), "C4", care),
         school = ifelse(grepl("S1", state), "S1", "S2"),
         school = ifelse(grepl("S3", state), "S3", school),
         yjs = ifelse(grepl("J1", state), "J1", NA),
         yjs = ifelse(grepl("J2", state), "J2", yjs),
         yjs = ifelse(grepl("J3", state), "J3", yjs),
         yjs = ifelse(grepl("J4", state), "J4", yjs)) %>% 
  select(-state) %>% 
  filter(yjs != "J4",
         age >= 16) %>% 
  mutate(yot = ifelse(yjs == "J3", "YOT", "not YOT"),
         neet = ifelse(school == "S2", "NEET", "not NEET")) %>% 
  group_by(yot, neet, t) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(yot, t) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(neet == "NEET") %>% 
  select(-count) %>% 
  pivot_wider(names_from = yot,
              values_from = pc) %>% 
  mutate(ratio = YOT/`not YOT`) %>% 
  ggplot() +
  geom_line(aes(x = t, y = ratio)) +
  # scale_colour_viridis(name = "Age",
  #                      option = "turbo",
  #                      discrete=T,
  #                      direction = -1,
  #                      begin = 0.2,
  # #                      end = 0.8) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_y_continuous(limits = c(1, 3)) +
  labs(x = "",
       y = "")+
  ggtitle("NT1: Neet rate YOT v not")+
  theme(plot.title = element_text(size=12))

neet_t1
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/neet_t1.png", neet_t1)










# two fifths of a small sample of children supervised by youth offending teams were NEET

neet_t2 <- mod_data %>%
  select(c(starts_with("P1C"), starts_with("P2C"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "P1", "P2"),
         care = ifelse(grepl("C1", state), "C1", NA),
         care = ifelse(grepl("C2", state), "C2", care),
         care = ifelse(grepl("C3", state), "C3", care),
         care = ifelse(grepl("C4", state), "C4", care),
         school = ifelse(grepl("S1", state), "S1", "S2"),
         school = ifelse(grepl("S3", state), "S3", school),
         yjs = ifelse(grepl("J1", state), "J1", NA),
         yjs = ifelse(grepl("J2", state), "J2", yjs),
         yjs = ifelse(grepl("J3", state), "J3", yjs),
         yjs = ifelse(grepl("J4", state), "J4", yjs)) %>% 
  select(-state) %>% 
  filter(yjs != "J4",
         age >= 16,
         school == "S2") %>% 
  mutate(yot = ifelse(yjs == "J3", "YOT", "not YOT")) %>% 
  group_by(yot, t) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(yot == "YOT") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc)) +
  # scale_colour_viridis(name = "Age",
  #                      option = "turbo",
  #                      discrete=T,
  #                      direction = -1,
  #                      begin = 0.2,
  # #                      end = 0.8) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_y_continuous(limits = c(0, 0.25)) +
  labs(x = "",
       y = "")+
  ggtitle("NT2: % NEET in YJS")+
  theme(plot.title = element_text(size=12))

neet_t2
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/neet_t2.png", neet_t2)




# TEST 4
# nearly half of young people aged 18-24 in Birmingham who are NEET are
# disadvantaged (eligible for FSM in Year 11)
neet_t4 <- neet_states %>%
  filter(yjs != "J4",
         age >= 16,
         school == "S2") %>% 
  group_by(poverty, t) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(poverty == "P2") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc)) +
  # scale_colour_viridis(name = "Age",
  #                      option = "turbo",
  #                      discrete=T,
  #                      direction = -1,
  #                      begin = 0.2,
  # #                      end = 0.8) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_y_continuous(limits = c(0, 0.6)) +
  labs(x = "",
       y = "")+
  ggtitle("NT4: % NEET in poverty")+
  theme(plot.title = element_text(size=12))

neet_t4
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/neet_t4.png", neet_t4)



# in 2013/14, 4.8\% of eighteen year olds were long-term NEET (NEET for the entire year),
# rising to 8\% of those who lived in a deprived area (in area that was one of 
# the quarter most deprived areas by IMD) at 15, 12\% of those who had ever been
# FSM eligible, 27\% of those who had attended a PRU, and 37\% of those who had been
# a looked after child.
# 




neet_t3 <- neet_states %>% 
  filter(yjs != "J4",
         age >= 16) %>% 
  mutate(neet = ifelse(school == "S2", "NEET", "not NEET")) %>% 
  group_by(neet, t) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>%
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(neet == "NEET") %>% 
  rename(`Total` = pc) %>% 
  select(t, Total) %>% 
  left_join(neet_states %>% 
              filter(yjs != "J4",
                     age >= 16) %>% 
              mutate(neet = ifelse(school == "S2", "NEET", "not NEET")) %>% 
              group_by(neet, poverty, t) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              filter(poverty == "P2") %>% 
              group_by(t) %>% 
              mutate(pc = count/sum(count)) %>% 
              filter(neet == "NEET") %>% 
              rename(`In poverty` = pc) %>% 
              select(t, `In poverty`)) %>% 
  left_join(neet_states %>% 
              filter(yjs != "J4",
                     age >= 16) %>% 
              mutate(care = ifelse(care == "C1", "never_LAC", "ever_LAC"),
                     neet = ifelse(school == "S2", "NEET", "not NEET")) %>% 
              group_by(neet, care, t) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              filter(care == "ever_LAC") %>% 
              group_by(t) %>% 
              mutate(pc = count/sum(count)) %>% 
              filter(neet == "NEET") %>% 
              rename(`Ever LAC` = pc) %>% 
              select(t, `Ever LAC`)) %>% 
  pivot_longer(!t,
               names_to = "pop_group",
               values_to = "pc_neet") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc_neet, group = pop_group, color = pop_group)) +
  scale_colour_viridis(name = "Group",
                       option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.2,
                       end = 0.8) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_y_continuous(limits = c(0, 0.3)) +
  labs(x = "",
       y = "")+
  ggtitle("NT3: % NEET in poverty, in children ever looked after, vs overall")+
  theme(plot.title = element_text(size=12))

neet_t3
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/neet_t3.png", neet_t3)

# NOT EVERN NEARLY ENOUGH PEOPLE GOING TO LAC!!!!!!!
