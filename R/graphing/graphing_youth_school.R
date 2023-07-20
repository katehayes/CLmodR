

schools %>% 
  mutate(cohort = case_when(end_period_year - age == 1993 ~"Cohort 1", 
                            end_period_year - age == 1994 ~"Cohort 2",
                            end_period_year - age == 1995 ~"Cohort 3",
                            end_period_year - age == 1996 ~"Cohort 4",
                            end_period_year - age == 1997 ~"Cohort 5",
                            end_period_year - age == 1998 ~"Cohort 6",
                            end_period_year - age == 1999 ~"Cohort 7",
                            end_period_year - age == 2000 ~"Cohort 8",
                            end_period_year - age == 2001 ~"Cohort 9",
                            end_period_year - age == 2002 ~"Cohort 10",
                            end_period_year - age == 2003 ~"Cohort 11",
                            end_period_year - age == 2004 ~"Cohort 12",
                            end_period_year - age == 2005 ~"Cohort 13",
                            end_period_year - age == 2006 ~"Cohort 14",
                            end_period_year - age == 2007 ~"Cohort 15",
                            end_period_year - age == 2008 ~"Cohort 16",
                            end_period_year - age == 2009 ~"Cohort 17",
                            end_period_year - age == 2010 ~"Cohort 18",
                            end_period_year - age == 2011 ~"Cohort 19",
                            end_period_year - age == 2012 ~"Cohort 20")) %>% 
  filter(fsm == "FSM") %>% 
  group_by(cohort, end_period_year, gender) %>% 
  mutate(tot = sum(count)) %>% 
  mutate(pc = count / tot) %>% 
  filter(my_categories == "Pupil referral unit") %>% 
  mutate(cohort = factor(cohort, levels = c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4",
                                            "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9",
                                            "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14",
                                            "Cohort 15", "Cohort 16", "Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"))) %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc),
           stat = "identity", position = "stack") +
  facet_grid(rows = vars(gender), cols = vars(cohort))

  
  

schools %>% 
  mutate(cohort = case_when(end_period_year - age == 1993 ~"Cohort 1", 
                            end_period_year - age == 1994 ~"Cohort 2",
                            end_period_year - age == 1995 ~"Cohort 3",
                            end_period_year - age == 1996 ~"Cohort 4",
                            end_period_year - age == 1997 ~"Cohort 5",
                            end_period_year - age == 1998 ~"Cohort 6",
                            end_period_year - age == 1999 ~"Cohort 7",
                            end_period_year - age == 2000 ~"Cohort 8",
                            end_period_year - age == 2001 ~"Cohort 9",
                            end_period_year - age == 2002 ~"Cohort 10",
                            end_period_year - age == 2003 ~"Cohort 11",
                            end_period_year - age == 2004 ~"Cohort 12",
                            end_period_year - age == 2005 ~"Cohort 13",
                            end_period_year - age == 2006 ~"Cohort 14",
                            end_period_year - age == 2007 ~"Cohort 15",
                            end_period_year - age == 2008 ~"Cohort 16",
                            end_period_year - age == 2009 ~"Cohort 17",
                            end_period_year - age == 2010 ~"Cohort 18",
                            end_period_year - age == 2011 ~"Cohort 19",
                            end_period_year - age == 2012 ~"Cohort 20")) %>%
  mutate(cohort = factor(cohort, levels = c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4",
                                            "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9",
                                            "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14",
                                            "Cohort 15", "Cohort 16", "Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"))) %>% 
  filter(!(my_categories %in% c("Nursery", "Unknown"))) %>% 
  # mutate(my_categories = factor(my_categories, 
  #                               levels = c("State-funded primary", "State-funded secondary",
  #                                          "State-funded special school", "Pupil referral unit", "Private school"))) %>% 
  # filter(my_categories == "Pupil referral unit") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = my_categories),
           stat = "identity", position = "fill") +
  facet_grid(rows = vars(cohort))
# THIS GRAPH IS NOT GOOD :)


fsm_pc_birm_byschooltype <- schools_fsm %>% 
  group_by(end_period_year, my_categories) %>% 
  summarise(fsm_pc = sum(school_fsm)/sum(school_headcount)) %>% 
  filter(!(my_categories %in% c("Nursery", "Private school", "Unknown"))) %>% 
  mutate(my_categories = factor(my_categories, 
                                levels = c("State - unknown", "State-funded primary", "State-funded secondary",
                                           "State-funded special school", "Pupil referral unit"))) %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = fsm_pc),
           stat = "identity", position = "stack") +
  facet_grid(~my_categories)

fsm_pc_birm_byschooltype

ggsave(filename = "output/graphs/fsm_pc_birm_byschooltype.png", fsm_pc_birm_byschooltype)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# NEWER STUFF ABOVE# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


birm_pru <- pru_data %>%
  filter(level == "Birmingham") %>%
  group_by(year, age, gender, ethnicity) %>%
  summarise(count = sum(count, na.rm = T)) %>%
  mutate(ethnicity = factor(ethnicity, levels = c("White", "Asian or Asian British", "Black, African, Caribbean or Black British",
                                                            "Mixed or Multiple ethnic groups", "Other ethnic group", "Refused or information not yet available"))) %>%
  filter(count != 0,
         age %in% 10:17) %>%
  ggplot() +
  geom_bar(aes(x = year, y = as.numeric(count), fill = fct_rev(ethnicity)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = T, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_pru

ggsave(filename = "Output/Graphs/birm_pru_gender_eth.png", birm_pru)




wm_pru <- pru_data %>%
  filter(level != "(rest of) England") %>%
  group_by(year, age, gender, ethnicity) %>%
  summarise(count = sum(count, na.rm = T)) %>%
  mutate(ethnicity = factor(ethnicity, levels = c("White", "Asian or Asian British", "Black, African, Caribbean or Black British",
                                                  "Mixed or Multiple ethnic groups", "Other ethnic group", "Refused or information not yet available"))) %>%
  filter(count != 0,
         age %in% 10:17) %>%
  ggplot() +
  geom_bar(aes(x = year, y = as.numeric(count), fill = fct_rev(ethnicity)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = T, direction = -1,
                     begin = 0.15,
                     end = 0.9)
wm_pru


eng_pru <- pru_data %>%
  group_by(year, age, gender, ethnicity) %>%
  summarise(count = sum(count, na.rm = T)) %>%
  mutate(ethnicity = factor(ethnicity, levels = c("White", "Asian or Asian British", "Black, African, Caribbean or Black British",
                                                  "Mixed or Multiple ethnic groups", "Other ethnic group", "Refused or information not yet available"))) %>%
  filter(count != 0,
         age %in% 10:17) %>%
  ggplot() +
  geom_bar(aes(x = year, y = as.numeric(count), fill = fct_rev(ethnicity)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = T, direction = -1,
                     begin = 0.15,
                     end = 0.9)
eng_pru






birm_pru_byschool <- pru_data %>%
  filter(level == "Birmingham") %>%
  mutate(school = ifelse(school == "The City of Birmingham School", "City of Birmingham School", school),
         school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school)) %>%
  mutate(ethnicity = factor(ethnicity, levels = c("White", "Asian or Asian British", "Black, African, Caribbean or Black British",
                                                  "Mixed or Multiple ethnic groups", "Other ethnic group", "Refused or information not yet available")),
         school = factor(school, levels = c("The Behaviour Support Service", "Virtual College", "Focus College", "Laces", "City of Birmingham School",
           "St Georges Academy", "Reach School", "EBN Free School", "CUL Academy Trust", "East Birmingham Network Academy",
           "EBN Academy Phase 2", "The Edge Academy", "Titan Aston Academy", "Titan St Georges Academy"))) %>%
  filter(count != 0,
         age %in% 10:17) %>%
  ggplot() +
  geom_bar(aes(x = year, y = as.numeric(count), fill = school),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  # scale_x_discrete() +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
  expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = T, direction = -1,
                     begin = 0,
                     end = 0.9)
birm_pru_byschool

ggsave(filename = "Output/Graphs/birm_pru_byschool.png", birm_pru_byschool)




# birm_pru_byschool2 <- pru_data %>%
#   ungroup() %>%
#   filter(level == "Birmingham") %>%
#   filter(count != 0,
#          age %in% 10:17) %>%
#   mutate(school = ifelse(school == "The City of Birmingham School", "City of Birmingham School", school),
#          school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school)) %>%
#   group_by(school, year) %>%
#   summarise(count = sum(count)) %>%
#   mutate(school = factor(school, levels = c("The Behaviour Support Service", "Virtual College", "Focus College", "Laces", "City of Birmingham School",
#                                             "St Georges Academy", "Reach School", "EBN Free School", "CUL Academy Trust", "East Birmingham Network Academy",
#                                             "EBN Academy Phase 2", "The Edge Academy", "Titan Aston Academy", "Titan St Georges Academy"))) %>%
#   ggplot() +
#   geom_line(aes(x = year, y = as.numeric(count), colour = school)) +
#   # scale_x_discrete() +
#   scale_x_continuous(name = "",
#                      expand = c(0,0),
#                      breaks = c(2007:2022),
#                      labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
#                                 "2017", "2018", "2019", "2020", "2021","2022")) +
#   scale_y_continuous(name = "",
#                      expand = c(0,0)) +
#   theme_classic() +
#   theme(strip.background = element_blank(),
#         plot.title = element_text(hjust = 0.5, size = 10)) +
#   scale_fill_viridis(option="magma", discrete = T, direction = -1,
#                      begin = 0,
#                      end = 0.9)
# birm_pru_byschool2





birm_pru_byage <- pru_data %>%
  filter(level == "Birmingham") %>%
  filter(count != 0,
         age %in% 10:17) %>%
  ggplot() +
  geom_bar(aes(x = year, y = as.numeric(count), fill = as.character(age)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  # scale_x_discrete() +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = T, direction = -1,
                     begin = 0,
                     end = 0.9)
birm_pru_byage

ggsave(filename = "Output/Graphs/birm_pru_byage.png", birm_pru_byage)










birm_school_summary <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age %in% 10:17,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
    ggplot() +
    geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
             stat = "identity", position = "stack") +
    facet_wrap(~gender) +
    scale_x_continuous(name = "",
                       expand = c(0,0),
                       breaks = c(2007:2022),
                       labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                  "2017", "2018", "2019", "2020", "2021","2022")) +
    scale_y_continuous(name = "",
                       expand = c(0,0)) +
    theme_classic() +
    theme(strip.background = element_blank(),
          plot.title = element_text(hjust = 0.5, size = 10)) +
    scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                       begin = 0.15,
                       end = 0.9)
birm_school_summary



birm_school_age10 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 10,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age10

birm_school_age11 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 11,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age11

birm_school_age12 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 12,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age12


birm_school_age13 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 13,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age13

birm_school_age14 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 14,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age14


birm_school_age15 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 15,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age15

birm_school_age16 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 16,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age16

birm_school_age17 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 17,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age17


birm_school_age18 <- school_data %>%
  filter(measure == "headcount") %>%
  filter(age == 18,
         phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "stack") +
  facet_grid(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
birm_school_age18


lay_out <- rbind(c(1,2,3,4,5),
                 c(6,7,8,9,NA))

birm_school_age_gender <- grid.arrange(birm_school_age10, birm_school_age11,
                                birm_school_age12, birm_school_age13,
                                birm_school_age14, birm_school_age15,
                                birm_school_age16, birm_school_age17,
                                birm_school_age18, layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/birm_school_age_gender.png", birm_school_age_gender)



# FREE SCHOOL MEALS
birm_fsm <- fsm_data %>%
  filter(phase_type_grouping != "State-funded nursery") %>%
  filter(level == "Birmingham") %>%
  mutate(phase_type_grouping = factor(phase_type_grouping,
                                      levels = c("State-funded primary",
                                                 "State-funded secondary",
                                                 "State-funded special school",
                                                 "Pupil referral unit",
                                                 "Independent school"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = official_fsm_pc, fill = fct_rev(phase_type_grouping)),
           stat = "identity", position = "dodge") +
  facet_grid(~fct_rev(phase_type_grouping)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

birm_fsm
ggsave(filename = "Output/Graphs/birm_fsm_byschool.png", birm_fsm)



# EXCLUSIONS AND SUSPENSIONS


birm_ex_fsm <- exsus_data %>%
  filter(level == "Birmingham",
         characteristic_group == "FSM",
         characteristic != "FSM - Unclassified") %>%
  mutate(school_type = factor(school_type,
                              levels = c("State-funded primary",
                                          "State-funded secondary",
                                          "State-funded special"))) %>%
  pivot_longer(c(perm_excl_rate, susp_rate, one_plus_susp_rate),
               names_to = "measure", values_to = "pc") %>%
  filter(measure == "perm_excl_rate") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(pc), fill = school_type),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(characteristic, school_type)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2011, 2015,  2019),
                     labels = c("2007",  "2011", "2015",
                                 "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

birm_ex_fsm

ggsave(filename = "Output/Graphs/birm_ex_fsm.png", birm_ex_fsm)


birm_sus_fsm <- exsus_data %>%
  filter(level == "Birmingham",
         characteristic_group == "FSM",
         characteristic != "FSM - Unclassified") %>%
  mutate(school_type = factor(school_type,
                              levels = c("State-funded primary",
                                         "State-funded secondary",
                                         "State-funded special"))) %>%
  pivot_longer(c(perm_excl_rate, susp_rate, one_plus_susp_rate),
               names_to = "measure", values_to = "pc") %>%
  filter(measure == "susp_rate") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(pc), fill = school_type),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(characteristic, school_type)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2011, 2015,  2019),
                     labels = c("2007",  "2011", "2015",
                                "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

birm_sus_fsm









birm_ex_gender <- exsus_data %>%
  filter(level == "Birmingham",
         characteristic_group == "Gender") %>%
  mutate(school_type = factor(school_type,
                              levels = c("State-funded primary",
                                         "State-funded secondary",
                                         "State-funded special"))) %>%
  pivot_longer(c(perm_excl_rate, susp_rate, one_plus_susp_rate),
               names_to = "measure", values_to = "pc") %>%
  filter(measure == "perm_excl_rate") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(pc), fill = school_type),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(fct_rev(characteristic), school_type)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2011, 2015,  2019),
                     labels = c("2007",  "2011", "2015",
                                "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

birm_ex_gender
ggsave(filename = "Output/Graphs/birm_exsus_fsm.png", birm_exsus_fsm)


birm_sus_gender <- exsus_data %>%
  filter(level == "Birmingham",
         characteristic_group == "Gender") %>%
  mutate(school_type = factor(school_type,
                              levels = c("State-funded primary",
                                         "State-funded secondary",
                                         "State-funded special"))) %>%
  pivot_longer(c(perm_excl_rate, susp_rate, one_plus_susp_rate),
               names_to = "measure", values_to = "pc") %>%
  filter(measure == "perm_excl_rate") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(pc), fill = school_type),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(fct_rev(characteristic), school_type)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2011, 2015,  2019),
                     labels = c("2007",  "2011", "2015",
                                "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

birm_sus_gender


























