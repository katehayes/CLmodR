base_output <- mod_data


mod <- new_model$new(user = pars)
t <- seq(0, 520, length.out = 2081)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))



# for example, past bad school could mean heightened risk of custodial sentence if data sharing was on! but not if offf

school_states <- mod_data %>%
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
  select(-state)%>% 
  filter(age <= 15)



# check <- schools %>% 
#   filter(gender == "Boys",
#          age <= 15) %>% 
#   mutate(end_period_year = end_period_year - 1) %>% 
#   mutate(t = (end_period_year - 2010)*52,
#          pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU"),
#          poverty = ifelse(fsm == "FSM eligible", "P2", "P1")) %>% 
#   group_by(t, age, poverty, pru) %>% 
#   summarise(count = sum(count)) %>% 
#   ungroup() %>% 
#   group_by(t, age, poverty) %>% 
#   mutate(pc = count/sum(count)) %>% 
#   filter(pru == "PRU") %>% 
#   filter(poverty == "P1",
#          age == 15) %>% 
#   filter(t <= 520) %>% 
#   filter(t >= 0)


pr_unit <- check$pc*0.0028
  




pru_v_modout <- schools %>% 
  filter(gender == "Boys",
         age <= 15) %>% 
  mutate(t = (end_period_year - 2010)*52,
         pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU"),
         poverty = ifelse(fsm == "FSM eligible", "P2", "P1")) %>% 
  group_by(t, age, poverty, pru) %>% 
  summarise(count = sum(count)) %>% 
  mutate(compare = "Data") %>% 
  rbind(school_states %>% 
          mutate(pru = ifelse(school == "S2", "PRU", "Not PRU")) %>% 
          group_by(t, age, poverty, pru) %>% 
          summarise(count = sum(count)) %>% 
          mutate(compare = "model")) %>% 
  ungroup() %>% 
  group_by(t, compare, age, poverty) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(pru == "PRU") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = interaction(compare, age), color = interaction(compare, age))) +
  scale_colour_viridis(option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.1,
                       end = 0.9) +
  facet_wrap(~poverty) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  labs(x = "",
       y = "")+
  ggtitle("PRU compare")+
  theme(plot.title = element_text(size=12))

pru_v_modout



pru_v_modout <- schools %>% 
  filter(gender == "Boys",
         age <= 15) %>% 
  mutate(t = (end_period_year - 2010)*52,
         pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU"),
         poverty = ifelse(fsm == "FSM eligible", "P2", "P1")) %>% 
  group_by(t, poverty, pru) %>% 
  summarise(count = sum(count)) %>% 
  mutate(compare = "Data") %>% 
  rbind(school_states %>% 
          mutate(pru = ifelse(school == "S2", "PRU", "Not PRU")) %>% 
          group_by(t, poverty, pru) %>% 
          summarise(count = sum(count)) %>% 
          mutate(compare = "model")) %>% 
  ungroup() %>% 
  group_by(t, compare, poverty) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(pru == "PRU") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = compare, color = compare)) +
  scale_colour_viridis(option = "turbo",
                       discrete=T,
                       direction = -1,
                       begin = 0.1,
                       end = 0.9) +
  facet_wrap(~poverty) +
  theme_bw() +
  scale_x_continuous(breaks = seq(0, 520, 104),
                     labels = c("2010",  "2012", "2014", 
                                "2016",  "2018", "2020")) +
  labs(x = "",
       y = "")+
  ggtitle("PRU compare")+
  theme(plot.title = element_text(size=12))

pru_v_modout



# What if i feed in a) size and b) ratio of Cobs to other. 

check <- schools_school_level %>% 
  filter(gender == "Boys",
         age <= 15) %>% 
  mutate(cobs = ifelse(school %in% c("Virtual College", "Laces", "The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "COBs", "Not COBs")) %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU"),
         t = (end_period_year - 2010)*52) %>% 
  group_by(t, age, pru, cobs) %>% 
  summarise(count_fsm = sum(count_fsm),
            count_non_fsm = sum(count_non_fsm))
  

cobs <- schools_school_level %>% 
  filter(gender == "Boys",
         age <= 15) %>% 
  mutate(cobs = ifelse(school %in% c("Virtual College", "Laces", "The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "COBs", "Not COBs")) %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU"),
         t = (end_period_year - 2010)*52,
         count = count_non_fsm + count_fsm) %>% 
  filter(pru == "PRU") %>% 
  group_by(t, cobs) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count))


fsm <- schools_school_level %>% 
  filter(gender == "Boys",
         age <= 15,
         school_type == "Pupil referral unit") %>% 
  mutate(t = (end_period_year - 2010)*52) %>% 
  group_by(t) %>% 
  summarise(count_fsm = sum(count_fsm),
            count_non_fsm = sum(count_non_fsm)) %>% 
  ungroup() %>% 
  mutate(pc = count_fsm/ (count_fsm+count_non_fsm))

