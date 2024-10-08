load("/Users/katehayes/CLmodR/output/data/processed/custodial_sentences.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/fte.Rdata")

# people in the known to police bit need to get searched and stuff

# YEARLY total disposals -- percentage that are custodial

mod <- new_model$new(user = pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))



yjs_states <- mod_data %>%
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



yjs_states <- mod_data %>%
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

yjs_base <- base_output %>% 
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







# 
# fte_params <- mod_data %>%
#   select(c(starts_with("fte_"), t)) %>% 
#   pivot_longer(-t, names_to = "param", values_to = "value") %>%
#   mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
#          poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
#          care = ifelse(grepl("c1", param), "Never", NA),
#          care = ifelse(grepl("c2", param), "Not residential", care),
#          care = ifelse(grepl("c3", param), "Residential", care),
#          care = ifelse(grepl("c4", param), "Prior", care),
#          school = ifelse(grepl("s1", param), "Never", "PRU"),
#          school = ifelse(grepl("s3", param), "Prior", school)) %>% 
#   select(-param)



j1j3 <- mod_data %>%
  select(c(starts_with("j1j3"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "j1j3") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         param = str_remove(param, "(\\d{2})"),
         poverty = ifelse(grepl("p1", param), "P1", "P2"),
         care = ifelse(grepl("c1", param), "C1", NA),
         care = ifelse(grepl("c2", param), "C2", care),
         care = ifelse(grepl("c3", param), "C3", care),
         care = ifelse(grepl("c4", param), "C4", care),
         school = ifelse(grepl("s1", param), "S1", "S2"),
         school = ifelse(grepl("s3", param), "S3", school)) %>% 
  select(-param)


j2j3 <- mod_data %>%
  select(c(starts_with("j2j3"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "j2j3") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         param = str_remove(param, "(\\d{2})"),
         poverty = ifelse(grepl("p1", param), "P1", "P2"),
         care = ifelse(grepl("c1", param), "C1", NA),
         care = ifelse(grepl("c2", param), "C2", care),
         care = ifelse(grepl("c3", param), "C3", care),
         care = ifelse(grepl("c4", param), "C4", care),
         school = ifelse(grepl("s1", param), "S1", "S2"),
         school = ifelse(grepl("s3", param), "S3", school)) %>% 
  select(-param)





fte_database <- yjs_states %>% 
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  left_join(j1j3) %>% 
  left_join(j2j3) %>% 
  mutate(fte_data = J2*j2j3,
         fte_unknown = J1*j1j3) 


# what pc in database had never been linked to a crime?
fte_from_database <- fte_database %>% 
  group_by(t) %>% 
  summarise(fte_data = sum(fte_data),
            fte_unknown = sum(fte_unknown)) %>% 
  # pivot_longer(!t,
  #              names_to = "source",
  #              values_to = "fte") %>% 
  mutate(ratio = fte_data/(fte_data+fte_unknown)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = ratio)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  theme_bw() +
  
  labs(x = "",
       y = "")+
  ggtitle("% of FTEs coming from police databases")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

fte_from_database 
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/fte_from_database.png", fte_from_database)




yjs_mod <- fte_database %>% 
  group_by(t) %>% 
  summarise(J1 = sum(J1),
            J2 = sum(J2),
            J3 = sum(J3),
            J4 = sum(J4)) %>% 
  pivot_longer(!t,
               names_to = "yjs",
               values_to = "count") %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = yjs, color = yjs)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  
  labs(x = "",
       y = "")+
  ggtitle("Population distribution across YJS states")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

yjs_mod


cs_pop <- custody_avpop_10to21_legal_basis %>% 
  filter(level != "Eng/Wales",
         legal_basis != "Remand") %>%
  group_by(end_period_year) %>% 
  summarise(custody_data = sum(count)) %>% 
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, custody_data) %>% 
  full_join(fte_database %>% 
              group_by(t) %>% 
              summarise(custody_mod = sum(J4))) %>%
  ggplot() +
  geom_line(aes(x = t, y = custody_mod)) +
  geom_point(aes(x = t, y = custody_data)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  
  labs(x = "",
       y = "")+
  ggtitle("Model population in custodial setting vs. yearly average custodial population, West Midlands level")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

cs_pop

# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/cs_pop.png", cs_pop)



# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/yjs_mod.png", yjs_mod)

# library(RcppRoll)


fte_v_modout <- fte_database %>% 
  mutate(J = J1+J2+J3+J4) %>% 
  group_by(t) %>% 
  summarise(fte_data = sum(fte_data),
            fte_unknown = sum(fte_unknown),
            J = sum(J)) %>%  
  mutate(compare = "Model output") %>% 
  filter(t %% 1 == 0) %>% 
  mutate(fte_inc = (fte_data+fte_unknown)/J) %>% 
  select(t, fte_inc, compare) %>% 
  rbind(fte %>%
  filter(gender == "Boys",
         end_period_year %in% 2009:2020) %>%
    mutate(end_period_year = end_period_year+1) %>% 
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  group_by(t) %>%
  summarise(count = sum(count)) %>% 
  mutate(fte = count/52) %>% 
  select(t, fte) %>% 
  left_join(population %>%
              filter(gender == "Boys",
                     age %in% c(10:17),
                     end_period_year >= 2010) %>%
              mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
              group_by(t) %>%
              summarise(count = sum(count)) %>% 
              select(t, count)) %>% 
  mutate(fte_inc = fte/count) %>% 
  mutate(compare = "Data") %>%
    select(compare, t, fte_inc)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = fte_inc*52*1000, group = compare, color =compare)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  
  labs(x = "",
       y = "")+
  ggtitle("FTE incidence (equivalent yearly incidence per 1000)")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())
# change to per 100,000 a year
fte_v_modout
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/fte_v_modout.png", fte_v_modout)
# install.packages("RcppRoll")
# library(RcppRoll)





# fte_data <- fte %>%
#   filter(gender == "Boys",
#          end_period_year %in% 2009:2020) %>%
#   mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
#   group_by(t) %>%
#   summarise(count = sum(count)) 
#   


fte_v_modout_roll <- fte_database %>% 
  mutate(J = J1+J2+J3+J4) %>% 
  group_by(t) %>% 
  summarise(fte_data = sum(fte_data),
            fte_unknown = sum(fte_unknown),
            J = sum(J)) %>%  
  filter(t %% 1 == 0) %>% 
  mutate(fte = fte_data+fte_unknown) %>% 
  arrange(t) %>% 
  mutate(yearly_mod = roll_sum(x = fte, 52, align = "right", fill = NA)) %>% 
  select(t, yearly_mod) %>% 
  full_join(fte %>%
                 filter(gender == "Boys",
                        end_period_year %in% 2009:2020) %>%
          mutate(end_period_year = end_period_year + 1) %>% 
                 mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
                 group_by(t) %>%
                 summarise(yearly_data = sum(count)) %>% 
                 select(t, yearly_data)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = yearly_mod)) +
  geom_point(aes(x = t, y = yearly_data)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  
  labs(x = "",
       y = "")+
  ggtitle("Total yearly FTEs (YJS data vs. model's rolling yearly count)")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())
# change to per 100,000 a year
fte_v_modout_roll
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/fte_v_modout_roll.png", fte_v_modout_roll)


cs_params <- mod_data %>%
  select(c(starts_with("cs_"), t)) %>%
  pivot_longer(-t, names_to = "param", values_to = "cs") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         param = str_remove(param, "(\\d{2})"),
         poverty = ifelse(grepl("p1", param), "P1", "P2"),
         care = ifelse(grepl("c1", param), "C1", NA),
         care = ifelse(grepl("c2", param), "C2", care),
         care = ifelse(grepl("c3", param), "C3", care),
         care = ifelse(grepl("c4", param), "C4", care),
         school = ifelse(grepl("s1", param), "S1", "S2"),
         school = ifelse(grepl("s3", param), "S3", school)) %>%
  select(-param)

  
  
  
cs_modout <- yjs_states %>% 
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  left_join(cs_params) %>% 
  mutate(cs_inc = cs*J3,
         J = J1+J2+J3+J4,
         age = ifelse(age %in% c(10:14), "10-14", age),
         age = ifelse(age == 17, "17+", age)) %>% 
  group_by(t, age) %>% 
  summarise(cs_inc = sum(cs_inc),
            J = sum(J)) %>% 
  filter(t %% 1 == 0) %>% 
  mutate(cs_inc_mod = cs_inc/J) %>% 
  select(t, age, cs_inc_mod) %>% 
  full_join(custodial_sentences %>%
          ungroup() %>% 
          filter(gender == "Boys")  %>%
          mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
          mutate(age = as.character(age)) %>% 
          group_by(t, age)  %>%
          summarise(count = sum(count)) %>% 
          mutate(cs = count/52) %>% 
          select(-count) %>% 
          left_join(population %>%
                      filter(gender == "Boys",
                             age %in% c(10:17),
                             end_period_year >= 2010) %>%
                      mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
                      mutate(age = ifelse(age %in% c(10:14), "10-14", age),
                             age = ifelse(age == 17, "17+", age)) %>% 
                      group_by(t, age) %>%
                      summarise(count = sum(count)) %>% 
                      select(t, age, count)) %>% 
          mutate(cs_inc_data = cs/count) %>% 
          select(t, age, cs_inc_data)) %>% 
  filter(t <= 520) %>% 
  ggplot() +
  geom_line(aes(x = t, y = cs_inc_mod*52*1000, group =age, color = age)) +
  geom_point(aes(x = t, y = cs_inc_data*52*1000, group =age, color = age)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  
  labs(x = "",
       y = "")+
  ggtitle("Custodial sentences (equivalent yearly incidence per 1,000 boys)")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())
# change to per 100,000 a year
cs_modout
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/cs_modout.png", cs_modout)



# WHAT KIND OF TOTAL AMOUNT OF CHILDREN IN CONTACT WITH THE YJS SHOULD THERE BE


in_yjs <- yjs_states %>% 
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  mutate(J3J4 = J3+J4,
         J = J1+J2+J3+J4,
         age = ifelse(age %in% c(10:14), "10-14", "15-17")) %>% 
  group_by(t, age) %>% 
  summarise(J = sum(J),
            J3J4 = sum(J3J4)) %>% 
  ungroup() %>% 
  mutate(yjs_prev_mod = J3J4/J) %>% 
  filter(t %% 1 == 0) %>% 
  select(t, age, yjs_prev_mod) %>% 
  full_join(children %>%
        ungroup() %>% 
        filter(gender == "Boys")  %>%
        mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
        group_by(t, age)  %>%
        summarise(children = sum(count)) %>% 
        left_join(population %>%
                    filter(gender == "Boys",
                           age %in% c(10:17),
                           end_period_year >= 2010) %>%
                    mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
                    mutate(age = ifelse(age %in% c(10:14), "10-14", "15-17")) %>% 
                    group_by(t, age) %>%
                    summarise(count = sum(count)) %>% 
                    select(t, age, count)) %>% 
        mutate(yjs_prev_data= children/count) %>% 
        select(t, age, yjs_prev_data)) %>% 
  filter(t <= 520) %>% 
  ggplot() +
  geom_line(aes(x = t, y = yjs_prev_mod, group = age, color =age)) +
  geom_point(aes(x = t, y = yjs_prev_data, group = age, color =age)) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  labs(x = "",
       y = "") +
  ggtitle("% of children in contact with the YJS in model vs. % of children recieving any caution or sentence")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

# the thing about this is that 30\% of the people in the YJS re-offend only. 
in_yjs
# ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/in_yjs.png", in_yjs)
# NEED MORE PEOPLE IN YJS AT THE START



YJS_t1 <- yjs_states %>% 
  filter(yjs %in% c("J3", "J4")) %>% 
  group_by(poverty, t) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(poverty == "P2") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc)) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  labs(x = "",
       y = "")+
  ggtitle("JT1: % YJS in poverty")+
  theme(plot.title = element_text(size=12))
YJS_t1



YJS_t1 <- yjs_base %>% 
  filter(yjs %in% c("J3", "J4")) %>% 
  group_by(poverty, t) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(poverty == "P2") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc)) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  labs(x = "",
       y = "")+
  ggtitle("JT1: % YJS in poverty")+
  theme(plot.title = element_text(size=12))
YJS_t1




pc_fte_of_disposals <- fte %>%
              filter(gender == "Boys",
                     end_period_year >= 2010) %>%
              mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
              group_by(t) %>%
              summarise(count = sum(count)) %>% 
              mutate(fte = count/52) %>% 
              select(t, fte) %>% 
              left_join(children %>%
                          filter(gender == "Boys")  %>%
                          mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
                          group_by(t) %>%
                          summarise(count = sum(count)) %>% 
                          select(t, count))











fte_pars_modout1 <- fte_params %>% 
  filter(school == "Never", care == "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = value, group = as.character(age), color = as.character(age))) +
  facet_wrap(~poverty)+
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       discrete=T,
                       direction = -1) +
  ggtitle("school == Never, care == Never") 

fte_pars_modout1
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/fte_pars_modout1.png", fte_pars_modout1)



# FTE PARAMETERS DONT CHANGE FROM CARE NEVER TO PRIOR TO RESIDENTIAL>>>>
fte_pars_modout2 <- fte_params %>% 
  filter(school == "Never", care == "Prior") %>% 
  ggplot() +
  geom_line(aes(x = t, y = value, group = as.character(age), color = as.character(age))) +
  facet_wrap(~poverty)+
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       discrete=T,
                       direction = -1) +
  ggtitle("school == Never, care == Prior") 

fte_pars_modout2
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/fte_pars_modout1.png", fte_pars_modout1)










fte_output <- mod_states %>% 
  filter(!(t %% 1)) %>%
  filter(yjs %in% c("In the YJS", "Known to police")) %>% 
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  left_join(fte_params %>% 
              filter(!(t %% 1))) %>% 
  mutate(inc = value*`Known to police`,
         prev = `In the YJS`)  %>% 
  # mutate(age = ifelse(age %in% c(10, 11, 12, 13, 14), "10-14", age),
  #        age = ifelse(age == 17, "17+", age)) %>% 
  # mutate(age = as.character(age)) %>% 
  group_by(t) %>% 
  summarise(prev = sum(prev),
            inc = sum(inc)) %>% 
  mutate(compare = "Model output") %>% 
  bind_rows(fte %>%
              filter(gender == "Boys")  %>%
              mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
              group_by(t) %>%
              summarise(count = sum(count)) %>% 
              mutate(inc = count/52) %>% 
              select(t, inc) %>% 
              mutate(compare = "Data") %>% 
              left_join(children %>%
                          filter(gender == "Boys")  %>%
                          mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
                          group_by(t) %>%
                          summarise(prev = sum(count)) %>% 
                          select(t, prev) %>% 
                          mutate(compare = "Data")))

compare_fte_inc <- fte_output %>% 
  ggplot() +
  geom_line(aes(x = t, y = inc, group = compare, color = compare)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_fte_inc
# WAY TOOO HIGH FOR FTE LOL

# note - number in the YJS in the community should be at least as big as children 
# that get sentenced each year
compare_yjs_comm_prev <- fte_output %>% 
  ggplot() +
  geom_line(aes(x = t, y = prev, group = compare, color = compare)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_yjs_comm_prev


cs_params <- mod_data %>%
  select(c(starts_with("cs_"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "value") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         care = ifelse(grepl("c1", param), "Never", NA),
         care = ifelse(grepl("c2", param), "Not residential", care),
         care = ifelse(grepl("c3", param), "Residential", care),
         care = ifelse(grepl("c4", param), "Prior", care),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school)) %>% 
  select(-param)


custody_output <- mod_states %>% 
  filter(!(t %% 1)) %>%
  filter(yjs %in% c("In the YJS", "In custody")) %>% 
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  left_join(cs_params %>% 
              filter(!(t %% 1))) %>% 
  mutate(inc = value*`In the YJS`,
         prev = `In custody`) %>% 
  mutate(age = ifelse(age %in% c(10, 11, 12, 13, 14), "10-14", age),
         age = ifelse(age == 17, "17+", age)) %>% 
  mutate(age = as.character(age)) %>% 
  group_by(t, age) %>% 
  summarise(prev = sum(prev),
            inc = sum(inc)) %>% 
  mutate(compare = "Model output") %>% 
  bind_rows(custodial_sentences %>%
              filter(gender == "Boys")  %>%
              mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
              mutate(age = as.character(age)) %>% 
              group_by(t, age) %>%
              summarise(count = sum(count)) %>% 
              left_join(custodial_sentence_duration %>% 
                          filter(gender == "Boys")%>%
                          select(-gender) %>% 
                          mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
                          mutate(age = as.character(age))) %>% 
              mutate(inc = count/52,
                     dur = nights/7,
                     prev = inc*dur) %>% 
              select(t, age, inc, prev) %>% 
              mutate(compare = "Data"))


# CUSTODY PREV TOO LOW? ESPCIALLY FOR YOUNG CHILDREN??????
compare_custody_prev <- custody_output %>% 
  ggplot() +
  geom_line(aes(x = t, y = prev, group = compare, color = compare)) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_custody_prev

compare_custody_inc <- custody_output %>% 
  ggplot() +
  geom_line(aes(x = t, y = inc, group = compare, color = compare)) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_custody_inc

# OK PROBLEM IS INCIDENCE RATES NEED TO BE BIGGER AT BEGINNING

yjs <- mod_states %>%
  group_by(t, poverty, age, yjs) %>% 
  summarise(count = sum(count)) %>%
  filter(yjs %in% c("Known to police", "In the YJS")) %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = age, color = age)) +
  facet_wrap(~interaction(yjs, poverty)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

yjs 