# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_age_gender.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_fsm.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_ethnicity.Rdata")

load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_fsm.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_ethnicity.Rdata")



s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/school_categories.csv")


secondary <- s_data %>% 
  filter(my_categories == "State-funded secondary") %>% 
  distinct(school_type, school_subtype)
# there is something wrong with school categories in 2010 and 2011

# initial conditions for the PRU population???

schools_fsm <- schools_10to22_fsm %>%
  filter(level == "Birmingham") %>% 
  left_join(s_data) 


schools_school_level <- schools_10to22_age_gender %>%
  filter(level == "Birmingham") %>%
  filter(age %in% 10:17) %>% 
  # left_join(s_data) 
  left_join(schools_fsm %>% 
              mutate(fsm_pc = school_fsm / school_headcount) %>% 
              mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc))) %>% 
  mutate(count_fsm = count * fsm_pc,
         count_non_fsm = count * (1-fsm_pc)) 

save(schools_school_level, file = "output/data/processed/schools_school_level.Rdata")


schools <- schools_school_level %>% 
  select(-c(count, school_headcount, school_fsm,
            fsm_pc)) %>% 
  pivot_longer(c(count_fsm, count_non_fsm),
               names_to = "fsm",
               values_to = "count") %>% 
  mutate(fsm = ifelse(grepl("non", fsm), "Not FSM eligible", "FSM eligible")) %>% 
  group_by(end_period_year, end_period_month, period_length,
           my_categories, age, gender, fsm) %>% 
  summarise(count = sum(count)) %>% 
  rename(school_type = my_categories) %>% 
  ungroup()

save(schools, file = "output/data/processed/schools.Rdata")


pru <- schools %>% 
  filter(school_type == "Pupil referral unit",
         age <= 15) %>% 
  select(-school_type) %>% 
  group_by(gender, age, fsm) %>% 
  arrange(end_period_year) %>% 
  # although no point really in smoothing until youve got the pcs of total?? not sure
  mutate(smooth_count = smooth.spline(end_period_year, count, lambda = 0.002)$y)


pru %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = fsm),
           stat = "identity", position = "stack") +
  facet_wrap(~interaction(gender, age))

pru %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = smooth_count, fill = fsm),
           stat = "identity", position = "stack")


school_pru <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0)



pru_rate <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  filter(age != 15) %>% 
  mutate(pru = factor(pru),
         fsm = factor(fsm),
         gender = factor(gender),
         age = factor(age))



mylogit <- glm(pru ~ gender + age + fsm, data = mydata, family = "binomial")




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # more recent than above - checking things for fitting# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



obs_pru_rate <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  filter(age %in% c(10:15)) %>% 
         # age != 11) %>% 
  group_by(end_period_year, age, gender, pru) %>%
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
  mutate(pc = PRU/(PRU + `Not PRU`)) %>% 
  select(end_period_year, age, gender, pc) %>% 
  ungroup() %>% 
  group_by(gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.02)$y)

# %>% 
#   pivot_wider(names_from = gender,
#               values_from = c(pc, smooth_pc)) %>% 
# 
# # %>% 
#   # group_by(age) %>% 
#   # mutate(Girls = ifelse(age %in% c(10,12) & Girls < 0.00000001, mean(Girls)/4, Girls)) %>% 
#   mutate(rel_rate = pc_Boys/pc_Girls,
#          rel_rate = ifelse(age == 11, 1, rel_rate),
#          rel_rate = ifelse(age %in% c(10,12) & pc_Girls < 0.00000001, NA, rel_rate)) %>% 
#   ungroup() %>% 
#   group_by(age) %>% 
#   arrange(end_period_year) %>% 
#   mutate(rel_rate = ifelse(age %in% c(10,12) & pc_Girls < 0.00000001, (lead(rel_rate) + lag(rel_rate))/2, rel_rate)) %>% 
#   ungroup() %>% 
#   mutate(smooth_rel_rate = smooth_pc_Boys/smooth_pc_Girls)

pc_pru_age_gen2 <- obs_pru_rate %>% 
  pivot_longer(c(Girls, Boys),
               names_to = "gender",
               values_to = "pc") %>% 
  ggplot() +
  geom_line(aes(x = age, y = pc, group = interaction(as.character(end_period_year), gender), color = interaction(as.character(end_period_year), gender))) + 
  # scale_color_manual(values = c("#FDEDEC",
  #                               "#FADBD8",
  #                               "#F5B7B1",
  #                               "#EC7063",
  #                               "#E74C3C",
  #                               "#CB4335",
  #                               "#B03A2E",
  #                               "#943126",
  #                               "#78281F",
  #                               "#641E16",
  #                               "#49150F",
  #                               "#2E0D09",
  #                               "#1A0705")) +
  scale_colour_viridis(option = "plasma",
                       discrete = T) +
  theme_bw()
pc_pru_age_gen2
ggsave(filename = "output/graphs/pc_pru_age_gen2.png", pc_pru_age_gen2)  

pc_pru_age_gen <- obs_pru_rate %>% 
  # filter(gender == "Boys") %>% 
  # pivot_longer(c(Girls, Boys),
  #              names_to = "gender",
  #              values_to = "pc") %>% 
  ggplot() +
  geom_line(aes(x = age, y = pc, group = gender, color = gender)) +
  # geom_line(aes(x = age, y = smooth_pc, group = gender, color = gender)) +
  facet_grid(~as.character(end_period_year)) +
  # scale_colour_viridis(option = "magma",
  #                    discrete = T) +
  theme_bw() +
  theme(panel.spacing.x = unit(0, "lines"),
        legend.position = "none")
pc_pru_age_gen

ggsave(filename = "output/graphs/pc_pru_age_gen.png", pc_pru_age_gen)  

rel_rate_pru_bygen <- obs_pru_rate %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = age, y = rel_rate, group = as.character(end_period_year), colour = as.character(end_period_year))) +
  geom_line(aes(x = age, y = smooth_rel_rate, group = as.character(end_period_year), colour = as.character(end_period_year))) +
  scale_colour_viridis(option = "turbo",
                       discrete = T) +
  theme_bw()
rel_rate_pru_bygen
ggsave(filename = "output/graphs/rel_rate_pru_bygen.png", rel_rate_pru_bygen)  


rel_rate_pru_bygen2 <- obs_pru_rate %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = as.character(end_period_year), y = rel_rate, group = as.character(age), colour = as.character(age))) +
  scale_colour_viridis(option = "turbo",
                       discrete = T) +
  theme_bw()
rel_rate_pru_bygen2
ggsave(filename = "output/graphs/rel_rate_pru_bygen2.png", rel_rate_pru_bygen2)  


rel_rate_pru_bygen3 <- obs_pru_rate %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = cohort, y = rel_rate, group = as.character(age), colour = as.character(age))) +
  scale_colour_viridis(option = "turbo",
                       discrete = T) +
  theme_bw()
rel_rate_pru_bygen3
ggsave(filename = "output/graphs/rel_rate_pru_bygen2.png", rel_rate_pru_bygen2)  




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # not sure what i was up to# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


check <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>% 
  group_by(end_period_year, age, gender, pru) %>% 
  mutate(count_fsm = sum(count_fsm),
         count_non_fsm = sum(count_non_fsm)) %>% 
  distinct(end_period_year, pru, age, gender, count_fsm, count_non_fsm) %>% 
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
                            end_period_year - age == 2012 ~"Cohort 20")) 

fsm_pru <- check %>% 
  select(-count_non_fsm) %>% 
  pivot_wider(names_from = pru, values_from = count_fsm, 
              values_fill = 0) %>%
  mutate(cohort = factor(cohort, 
                         levels = c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4",
                                    "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9",
                                    "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14",
                                    "Cohort 15", "Cohort 16", "Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"))) %>% 
  filter(age <= 15) %>% 
  ungroup() %>% 
  arrange(end_period_year) %>% 
  group_by(cohort, gender) %>% 
  mutate(diff_pru = PRU - lag(PRU),
         diff_non_pru = `Not PRU` - lag(`Not PRU`),
         rate_segregated = diff_pru / lag(`Not PRU`))


nonfsm_pru <- check %>% 
  select(-count_fsm) %>% 
  pivot_wider(names_from = pru, values_from = count_non_fsm, 
              values_fill = 0) %>%
  mutate(cohort = factor(cohort, 
                         levels = c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4",
                                    "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9",
                                    "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14",
                                    "Cohort 15", "Cohort 16", "Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"))) %>% 
  filter(age <= 15) %>% 
  ungroup() %>% 
  arrange(end_period_year) %>% 
  group_by(cohort, gender) %>% 
  mutate(diff_pru = PRU - lag(PRU),
         diff_non_pru = `Not PRU` - lag(`Not PRU`),
         rate_segregated = diff_pru / lag(`Not PRU`))







# %>% 
  # select(-count) %>% 
  # pivot_longer(c(count_fsm, count_non_fsm),
  #              names_to = "fsm", values_to = "count") %>% 
  # mutate(fsm = ifelse(fsm == "count_fsm", "FSM", "Not eligible"))

# save(pru, file = "Output/Data/Processed/pru.Rdata")

# i think i'm going to do a my_categories level fsm assignment... actually.. school-level?






