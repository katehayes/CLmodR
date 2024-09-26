load("/Users/katehayes/CLmodR/output/data/processed/custodial_sentences.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/fte.Rdata")

mod <- new_model$new(user = pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))


mod_states <- mod_data %>%
  select(c(starts_with("P1C"), starts_with("P2C"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "Not in poverty", "In poverty"),
         care = ifelse(grepl("C1", state), "Never", NA),
         care = ifelse(grepl("C2", state), "Not residential", care),
         care = ifelse(grepl("C3", state), "Residential", care),
         care = ifelse(grepl("C4", state), "Prior", care),
         school = ifelse(grepl("S1", state), "Never", "PRU"),
         school = ifelse(grepl("S3", state), "Prior", school),
         yjs = ifelse(grepl("J1", state), "No contact with YJS", NA),
         yjs = ifelse(grepl("J2", state), "Known to police", yjs),
         yjs = ifelse(grepl("J3", state), "In the YJS", yjs),
         yjs = ifelse(grepl("J4", state), "In custody", yjs)) %>% 
  select(-state)

# save(mod_states, file = "output/data/output/new_mod_states.Rdata")



compare_pop <- population %>%
  filter(end_period_year >= 2010,
         gender == "Boys") %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, age, count) %>%
  mutate(compare = "Data") %>%
  bind_rows(mod_states %>%
              group_by(t, age) %>% 
              summarise(count = sum(count)) %>% 
              mutate(compare = "Model output"))

compare_pop <- population %>%
  filter(end_period_year >= 2010,
         gender == "Boys") %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, age, count) %>%
  full_join(mod_states %>%
              group_by(t, age) %>% 
              summarise(count_mod = sum(count)))



pop_v_modout2 <- compare_pop %>%
  # filter(t %in% c(45:60)) %>%
  ggplot() +
  geom_line(aes(x = t, y = count_mod)) +
  geom_point(aes(x = t, y = count)) +
  facet_wrap(~age, nrow = 2) +
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
  # ggtitle("")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

pop_v_modout2
ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/pop_v_modout2.png", pop_v_modout2)

pop_v_modout <- compare_pop %>%
  # filter(t %in% c(45:60)) %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color =compare)) +
  facet_wrap(~age, nrow = 2) +
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
  # ggtitle("")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

pop_v_modout



compare_pov <- smooth_poverty %>%
  filter(end_period_year >= 2010) %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, spov_rate) %>%
  mutate(compare = "Data") %>%
  bind_rows(mod_states %>%
              group_by(t, poverty) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(t) %>% 
              mutate(spov_rate = count/sum(count)) %>% 
              filter(poverty == "In poverty") %>%
              mutate(compare = "Model output"))



poverty_data_mod <- pop_estimate_01to20_age_gender %>%
  filter(level == "Birmingham") %>%
  group_by(end_period_year) %>%
  summarise(pop = sum(count)) %>%
  full_join(poverty_06to12_15to21 %>%
              filter(level == "Birmingham") %>% 
              select(end_period_year, count) %>%
              rename(pov = count)) %>%
  ungroup() %>%
  mutate(pov_rate = pov / pop) %>% 
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, pov_rate) %>%
  full_join(mod_states %>%
              group_by(t, poverty) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(t) %>% 
              mutate(spov_rate = count/sum(count)) %>% 
              filter(poverty == "In poverty") %>% 
              select(!c(count, poverty))) %>% 
  mutate(year = 2010 + floor(t/52)) %>% 
  filter(t >= -220) %>% 
  filter(t <= 530) %>% 
  ggplot() +
  geom_line(aes(x = t, y = spov_rate)) +
  geom_point(aes(x = t, y = pov_rate)) +
  scale_x_continuous(breaks = seq(-208, 520, 104),
                     labels = c("2006", "2008", 
                                "2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  scale_colour_viridis(option = "turbo",
                       begin = 0.1,
                       end = 0.9,
                       discrete=T,
                       direction = -1) +
  theme_bw() +
  labs(x = "",
       y = "") +
  ggtitle("")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())
poverty_data_mod

ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/poverty_data_mod.png", poverty_data_mod)



# FIX WHY NOT ENOGH GOING INTO POVERTY?
# THIS SHOULD BE THE REAL POVERTY RATE NOT THE SMOOTH ONE. 
pov_v_modout <- compare_pov %>%
  ggplot() +
  geom_line(aes(x = t, y = spov_rate, group = compare, color =compare)) +
  # facet_wrap(~age, nrow = 2) +
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
  ggtitle("")+
  theme(plot.title = element_text(size=12),
        legend.title=element_blank())

 
pov_v_modout

ggsave(filename = "/Users/katehayes/CLmodR/output/graphs/model output/pov_v_modout.png", pov_v_modout)

compare_pov <- smooth_poverty %>%
  filter(end_period_year >= 2010) %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, spov_rate) %>%
  mutate(compare = "Data",
         age = 10) %>%
  bind_rows(mod_states %>%
              group_by(t, age, poverty) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(t, age) %>% 
              mutate(spov_rate = count/sum(count)) %>% 
              filter(poverty == "In poverty") %>%
              mutate(compare = "Model output"))


pov_v_modout <- compare_pov %>%
  ggplot() +
  geom_line(aes(x = t, y = spov_rate, group = interaction(compare, age), color =interaction(compare, age))) +
  # facet_wrap(~age, nrow = 2) +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020"))


pov_v_modout
# ignore the fact that this is slightly slighly off for now 


mod_params <- mod_data %>%
  select(!c(starts_with("P1"), starts_with("P2"))) %>% 
  pivot_longer(-t, names_to = "param", values_to = "value") %>%
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         poverty = ifelse(grepl("p1", param), "Not in poverty", "In poverty"),
         care = ifelse(grepl("c1", param), "Never", NA),
         care = ifelse(grepl("c2", param), "Not residential", care),
         care = ifelse(grepl("c3", param), "Residential", care),
         care = ifelse(grepl("c4", param), "Prior", care),
         school = ifelse(grepl("s1", param), "Never", "PRU"),
         school = ifelse(grepl("s3", param), "Prior", school),
         yjs = ifelse(grepl("j1", param), "No contact with YJS", NA),
         yjs = ifelse(grepl("j2", param), "Known to police", yjs),
         yjs = ifelse(grepl("j3", param), "In the YJS", yjs),
         yjs = ifelse(grepl("j4", param), "In custody", yjs)) %>% 
  select(-param)

fte_params <- mod_data %>%
  select(c(starts_with("fte_"), t)) %>% 
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

compare_care <- mod_states %>%
  group_by(t, poverty, age, care) %>% 
  summarise(count = sum(count)) %>% 
  mutate(compare = "Model") %>% 
  bind_rows(care_pov %>% 
              filter(gender == "Boys") %>% 
              mutate(t = (end_period_year - 2010)*52) %>% 
              select(t, age, count, state, care) %>% 
              rename(poverty = state) %>% 
              group_by(t, age, count, poverty, care) %>% 
              mutate(compare = "Est data"))
