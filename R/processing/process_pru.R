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





check <- schools %>% 
  mutate(pru = ifelse(my_categories == "Pupil referral unit", "PRU", "Not PRU")) %>% 
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






