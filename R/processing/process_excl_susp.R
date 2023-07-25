load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_ethnicity.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_fsm.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_14to22_pru.Rdata")

s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/school_categories.csv")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_age_gender.Rdata")


# one_plus_susp == Pupil enrolments with one or more suspension

# checking_twodatasets_match <-excl_susp_07to21_age %>% 
#   filter(level == "Birmingham",
#          age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
#          end_period_year >= 2010) %>% 
#   mutate(age = as.numeric(age),
#          end_period_year = as.numeric(end_period_year)) %>% 
#   group_by(age, end_period_year) %>% 
#   summarise(perm_excl = sum(perm_excl),
#             headcount = sum(headcount)) %>% 
#   full_join(schools_10to22_age_gender %>%
#               filter(level == "Birmingham",
#                      age %in% 10:17,
#                      end_period_year < 2022) %>% 
#               left_join(s_data) %>% 
#               filter(!(my_categories %in% c("Private school", "Pupil referral unit"))) %>% 
#               group_by(age, end_period_year) %>% 
#               summarise(count = sum(count, na.rm = T)) %>% 
#               rename(other_headcount = count)) %>% 
#   add_cohort() %>% 
#   mutate(count_diff = headcount - other_headcount)
  

excl_susp_pru <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  arrange(end_period_year) %>% 
  group_by(cohort) %>% 
  mutate(diff_pru = pru_headcount - lag(pru_headcount))






excl_susp_pru %>% 
  pivot_longer(c(diff_pru, perm_excl, one_plus_susp, pru_headcount),
               names_to = "count_type",
               values_to = "count") %>% 
  filter(cohort == "Cohort 11") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity", position = "dodge") +
  facet_grid(~count_type)

excl_susp_pru %>% 
  filter(cohort == "Cohort 11") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = perm_excl),
           stat = "identity", position = "dodge") 



# 


susp_excl_age <- excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age)) %>% 
  group_by(end_period_year, age) %>% 
  mutate(headcount = sum(headcount),
         perm_excl = sum(perm_excl),
         suspension = sum(suspension),
         one_plus_susp = sum(one_plus_susp)) %>% 
  distinct(end_period_year, age, headcount, perm_excl,
           suspension, one_plus_susp) %>% 
  mutate(suspension_rate = suspension/headcount,
         one_plus_susp_rate = one_plus_susp/headcount,
         susp_rate_per_child_susp = suspension/one_plus_susp,
         perm_excl_rate = perm_excl/headcount)

susp_excl_fsm <- excl_susp_07to21_fsm %>% 
  filter(level == "Birmingham",
         fsm != "Unknown",
         school_type != "State-funded primary",
         end_period_year >= 2010) %>% 
  group_by(end_period_year, fsm) %>% 
  mutate(headcount = sum(headcount),
         perm_excl = sum(perm_excl),
         suspension = sum(suspension),
         one_plus_susp = sum(one_plus_susp)) %>% 
  distinct(end_period_year, fsm, headcount, perm_excl,
           suspension, one_plus_susp) %>% 
  mutate(suspension_rate = suspension/headcount,
         one_plus_susp_rate = one_plus_susp/headcount,
         susp_rate_per_child_susp = suspension/one_plus_susp,
         perm_excl_rate = perm_excl/headcount)

  
  

  




