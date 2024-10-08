mod <- new_model$new(user = pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
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


care_states <- mod_states %>% 
  pivot_wider(names_from = care,
              values_from = count) 


c1c2 <- mod_data %>%
  select(c(starts_with("c1c2"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c1c2") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)


c1c3 <- mod_data %>%
  select(c(starts_with("c1c3"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c1c3") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)


c4c2 <- mod_data %>%
  select(c(starts_with("c4c2"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c4c2") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)

c4c3 <- mod_data %>%
  select(c(starts_with("c4c3"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c4c3") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)


c2c3 <- mod_data %>%
  select(c(starts_with("c2c3"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c2c3") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)

c3c2 <- mod_data %>%
  select(c(starts_with("c3c2"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c3c2") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)

c3c4 <- mod_data %>%
  select(c(starts_with("c3c4"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c3c4") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)

end_nr <- mod_data %>%
  select(c(starts_with("end_nr"), t)) 

end_r <- mod_data %>%
  select(c(starts_with("end_r"), t)) 



care_output <- c1c2 %>% 
  left_join(c1c3) %>% 
  left_join(c4c2) %>% 
  left_join(c4c3) %>% 
  left_join(c2c3) %>% 
  left_join(c3c2) %>% 
  left_join(c3c4) %>% 
  left_join(end_r) %>% 
  left_join(end_nr) %>% 
  left_join(care_states) 
  
#  of all children in England entering care for the first time in the year ending March 2019,
# 14.6\% were aged between 13 and 15, and 13.3\% were 16 or older
# TEST 1 -- APPROX SAME FT_CARE flows age 13,14,15 and 16,17


care_t1 <- care_output %>% 
  filter(yjs != "In custody") %>% 
  mutate(ft_care = C1*(c1c2+c1c3)) %>% 
  mutate(end_period_year = 2011 + floor(t/52)) %>% 
  mutate(age_band = ifelse(age %in% c(10:12), "10-12", "16-17"),
         age_band = ifelse(age %in% c(13:15), "13-15", age_band)) %>% 
  group_by(end_period_year, age_band) %>% 
 summarise(ft_care = sum(ft_care)) %>% 
  filter(end_period_year <= 2020) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = ft_care, group = age_band, color = age_band)) +
  scale_colour_viridis(name = "Age",
                       option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.2,
                       end = 0.8) +
  theme_bw() +
  scale_x_continuous(breaks = c(2011, 2014, 2017, 2020),
                     labels = c("2011", "2014", 
                                "2017", "2020")) +
  labs(x = "",
       y = "")+
  ggtitle("CT1: Children entering care for the first time (yearly sum)")+
  theme(plot.title = element_text(size=12))

care_t1
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_t1.png", care_t1)


# RE-ENTRY
# TEST 2
# rate of re-entry increases with age; # Re-entry is greater with increasing deprivation


# TEST 2
# TURN THIS INTO A ROLLING AVERAGE OR SOMETHING
care_t2 <- care_output %>% 
  filter(yjs != "In custody") %>% 
  mutate(re_entry = C4*(c4c2+c4c3)) %>% 
  group_by(t) %>% 
  summarise(re_entry = sum(re_entry),
            C4 = sum(C4)) %>% 
  ungroup() %>% 
  mutate(end_period_year = 2011 + floor(t/52)) %>% 
  group_by(end_period_year) %>% 
  summarise(re_entry = sum(re_entry),
            C4 = mean(C4)) %>% 
  filter(end_period_year <= 2020) %>% 
  mutate(pc_reentry = re_entry/C4) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_reentry)) +
  labs(x = "",
       y = "")+
  theme_bw() +
  scale_x_continuous(breaks = c(2011, 2014, 2017, 2020),
                     labels = c("2011", "2014", 
                                "2017", "2020")) +
  scale_y_continuous(limits = c(0, 0.2)) +
  ggtitle("CT2: Re-entries (yearly sum) as % of prior care population")+
  theme(plot.title = element_text(size=12))

care_t2
 ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_t2.png", care_t2)

# NOT ENOUGH


# TEST 4
# at least 25\% of the flows into first care entry are going into residential in 2015
#  of all first-time care placements between 2011 and 2015, 19\% were in
# children’s homes and 10\% were in independent or semi-independent living 
# -- among just boys, the equivalent figures are 24\% and 11\%\
care_t3 <- care_output %>% 
  filter(yjs != "In custody") %>% 
  mutate(ft_nonres = C1*c1c2,
         ft_res = C1*c1c3) %>% 
  group_by(t) %>% 
  summarise(ft_res = sum(ft_res),
            ft_nonres = sum(ft_nonres)) %>% 
  mutate(ft_pc_res = ft_res/(ft_res+ft_nonres)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = ft_pc_res)) +
  labs(x = "",
       y = "")+
  theme_bw() +
  scale_y_continuous(limits = c(0.3, 0.45)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  ggtitle("CT3: % of first time care entrants entering residential care")+
  theme(plot.title = element_text(size=12))

care_t3
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_t3.png", care_t3)


# TEST 5
#  In 2019, of a small sample of children living in residential care, 
# about 10\% of 10-13 year olds and 20\% of 14-16 year olds had not 
# had a prior care placement.

# care_t4 <- care_output %>% 
#   filter(yjs != "In custody") %>% 
#   mutate(ft_res = C1*c1c3,
#          other_res = C2*c2c3 + end_r*C3 - C3*(c3c2+c3c4) + C4*c4c3) %>%
#   mutate(end_period_year = 2010 + floor(t/52)) %>% 
#   # check1 = C2*c2c3, 
#   # check2 = end_r*C3 - C3*(c3c2+c3c4), 
#   # check3 = C4*c4c3) 
# add_cohort() %>% 
#   group_by(t, cohort) %>% 
#   summarise(ft_res = sum(ft_res),
#             other_res = sum(other_res)) %>% 
#   mutate(no_prior = ft_res/(ft_res+other_res)) %>% 
#   filter(t <= 200) %>% 
#   ggplot() +
#   geom_line(aes(x = t, y = no_prior, group = cohort, color = cohort)) +
#   scale_colour_viridis(name = "Age",
#                        option = "turbo",
#                        discrete=T,
#                        direction = -1,
#                        begin = 0.2,
#                        end = 0.8) +
#   labs(x = "",
#        y = "")+
#   theme_bw() +
#   scale_x_continuous(breaks = seq(0, 520, 104),
#                      labels = c("2010",  "2012", "2014", 
#                                 "2016",  "2018", "2020")) +
#   ggtitle("CT4: % children in residential care without prior placements") +
#   theme(plot.title = element_text(size=12))
# # NOT WORKING -- PROBABLY WOULD NEED A SEPERATE RESIDENTIAL PROBABILITY FOR THE FIRST TIMERS. 
# # LIKE R10 AND FT_R10
# care_t4
# 




care_t4 <- care_output %>% 
  filter(yjs != "In custody") %>% 
  mutate(ft_res = C1*c1c3,
         other_res = C2*c2c3 + end_r*C3 - C3*(c3c2+c3c4) + C4*c4c3) %>% 
         # check1 = C2*c2c3, 
         # check2 = end_r*C3 - C3*(c3c2+c3c4), 
         # check3 = C4*c4c3) 
  mutate(age_band = ifelse(age %in% c(10:13), "10-13", "17"),
         age_band = ifelse(age %in% c(14:16), "14-16", age_band)) %>% 
  group_by(t, age_band) %>% 
  summarise(ft_res = sum(ft_res),
            other_res = sum(other_res)) %>% 
  mutate(no_prior = ft_res/(ft_res+other_res)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = no_prior, group = age_band, color = age_band)) +
  scale_colour_viridis(name = "Age",
                       option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.2,
                       end = 0.8) +
  labs(x = "",
       y = "")+
  theme_bw() +
  scale_y_continuous(limits = c(0, 0.4)) +
    scale_x_continuous(breaks = seq(0, 520, 104),
                       labels = c("2010",  "2012", "2014", 
                                  "2016",  "2018", "2020")) +
  ggtitle("CT4: % children in residential care without prior placements") +
  theme(plot.title = element_text(size=12))
# NOT WORKING -- PROBABLY WOULD NEED A SEPERATE RESIDENTIAL PROBABILITY FOR THE FIRST TIMERS. 
  # LIKE R10 AND FT_R10
care_t4

# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_t4.png", care_t4)



care_tests <- plot_grid(care_t1,  care_t2, care_t3,  care_t4, ncol = 1, align = "v")
care_tests
 ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_tests.png", care_tests)







# care_t6 <- care_output %>% 
#   filter(yjs != "In custody") %>% 
#   mutate(into_res = C1*c1c3 + C2*c2c3 + C3*(end_r - c3c2 - c3c4) + C4*c4c3) %>% 
#   mutate(end_period_year = 2011 + floor(t/52)) %>% 
#   filter(end_period_year <= 2020) %>% 
#   group_by(end_period_year, age) %>% 
#   summarise(into_res = sum(into_res)) %>% 
#   ggplot() +
#   geom_bar(aes(x = end_period_year, y = into_res, fill = as.character(age)),
#            position = "dodge2", stat = "identity") +
#   scale_fill_viridis(option = "turbo",
#                        discrete=T,
#                        direction = -1,
#                        begin = 0.1,
#                        end = 0.9) +
#   theme_bw() +
#   scale_x_continuous(breaks = c(2011, 2014, 2017, 2020),
#                      labels = c("2011", "2014", 
#                                 "2017", "2020")) +
#   ggtitle("CT6: age distribution at start of residential care episode")
# 
# care_t6
# 
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_t6.png", care_t6)
# 

# check <- init_c %>% 
#   mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
#   mutate(care = ifelse(care %in% c("Residential", "Not_residential"), "Care", "Not in care")) %>% 
#   group_by(age, care) %>% 
#   summarise(count = sum(count)) %>% 
#   ungroup()
# 
# check2 <-  mod_states %>% 
#   filter(t == 0) %>% 
#   mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
#   mutate(care = ifelse(care %in% c("Residential", "Not residential"), "Care", "Not in care")) %>% 
#   group_by(age, care) %>% 
#   summarise(count = sum(count)) %>% 
#   ungroup()
# 
# 
# check3 <- care_11to22_age %>% 
#   filter(level == "Birmingham") %>% 
#   filter(age %in% c("10-15","16+")) %>% 
#   left_join(pop_estimate_01to20_age_gender %>% 
#               filter(level == "Birmingham") %>% 
#               filter(age %in% c(10:17),
#                      end_period_year %in% c(2011:2023)) %>%
#               mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
#               group_by(end_period_year, level, age) %>%
#               summarise(census_pop = sum(count))) %>% 
#   mutate(pc = count/census_pop) %>% 
#   filter(!is.na(pc)) %>% 
#   mutate(t = (end_period_year - 2010)*52,
#          compare = "Data",
#          poverty = "Total") %>% 
#   select(t, age, count, pc, compare, poverty)
# 
# 
# check3 <- care_pov_pru %>% 
#   filter(gender == "Boys",
#          end_period_year == 2010) %>% 
#   mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
#   mutate(care = ifelse(care %in% c("Residential", "Not residential"), "Care", "Not in care")) %>% 
#   group_by(age, care) %>% 
#   summarise(count = sum(tot)) %>% 
#   ungroup()



care_v_modout <- mod_states %>% 
  mutate(age = ifelse(age %in% c(10:15), "10-15", "16+"))  %>% 
  mutate(care2 = ifelse(care %in% c("C2", "C3"), "Care", "Not in care")) %>% 
  group_by(t, poverty, age, care2) %>% 
  summarise(count_mod = sum(count)) %>% 
  ungroup() %>% 
  group_by(t, poverty, age)  %>% 
  mutate(pc_mod = count_mod/sum(count_mod)) %>% 
  filter(care2 == "Care")  %>% 
  select(t, age, count_mod, pc_mod, poverty) %>% 
  full_join(care_11to22_age %>% 
          filter(level == "Birmingham") %>% 
          filter(age %in% c("10-15","16+")) %>% 
          left_join(pop_estimate_01to20_age_gender %>% 
                      filter(level == "Birmingham") %>% 
                      filter(age %in% c(10:17),
                             end_period_year %in% c(2011:2023)) %>%
                      mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
                      group_by(end_period_year, level, age) %>%
                      summarise(census_pop = sum(count))) %>% 
          mutate(pc = count/census_pop) %>% 
          filter(!is.na(pc)) %>% 
          mutate(t = (end_period_year - 2010)*52,
                 poverty = "Total") %>% 
          select(t, age, count, pc, poverty)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc_mod, group = poverty, color = poverty)) +
  geom_point(aes(x = t, y = pc, group = poverty, color = poverty)) +
  facet_wrap(~age) +
  scale_colour_viridis(begin = 0.1,
                       end = 0.9,
    option = "turbo",
                       discrete=T,
                       direction = -1) +
  theme_bw()


care_v_modout
# WAY WAY TOO MANY KIDS IN CARE :)
# too few at the very start? then too many?



care_v_modout <- mod_states %>% 
  mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
  mutate(care = ifelse(care %in% c("C2", "C3"), "Care", "Not in care")) %>% 
  group_by(t, age, care) %>% 
  summarise(count_mod = sum(count)) %>% 
  ungroup() %>% 
  group_by(t,  age) %>% 
  mutate(pc_mod = count_mod/sum(count_mod)) %>% 
  filter(care == "Care") %>% 
  select(t, age, count_mod, pc_mod) %>% 
  full_join(care_11to22_age %>% 
          filter(level == "Birmingham") %>% 
          filter(age %in% c("10-15","16+")) %>% 
          left_join(pop_estimate_01to20_age_gender %>% 
                      filter(level == "Birmingham") %>% 
                      filter(age %in% c(10:17),
                             end_period_year %in% c(2011:2023)) %>%
                      mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
                      group_by(end_period_year, level, age) %>%
                      summarise(census_pop = sum(count))) %>% 
          mutate(pc = count/census_pop) %>% 
          filter(!is.na(pc)) %>% 
          mutate(t = (end_period_year - 2010)*52) %>% 
          select(t, age, count, pc)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc_mod, group = age, color = age)) +
  geom_point(aes(x = t, y = pc, group = age, color = age)) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  labs(x = "",
       y = "")+
  ggtitle("% LAC, model vs. data")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank()) +
  scale_colour_viridis(name = "Group",
                       option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.1,
                       end = 0.9) +
  scale_y_continuous(limits = c(0, 0.02))
care_v_modout
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/care_v_modout.png", care_v_modout)






care_mo1 <- mod_states %>% 
  group_by(t, poverty, care, age) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t, poverty, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(care != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_grid(cols = vars(care), rows = vars(poverty)) +
  scale_colour_viridis(option = "turbo",
                       discrete=T,
                       direction = -1)

care_mo1
# WAY TOO MUCH RES CARE FOR THE OLDER ONES IN POVERTY


mod_states %>% 
  group_by(t, poverty, age, care) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t, poverty, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(care == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_wrap(~poverty)  +
  scale_colour_viridis(discrete=T,
                       direction = -1)

mod_states %>% 
  group_by(t, state, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(lac == "Not residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(gender, state)) +
  scale_colour_viridis(discrete=T,
                       direction = -1)

mod_states %>% 
  group_by(t, state, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(lac == "Prior") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(gender, state)) +
  scale_colour_viridis(discrete=T,
                       direction = -1)
