# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_age_gender.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_fsm.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_ethnicity.Rdata")

load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_fsm.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_ethnicity.Rdata")


schools <- schools_10to22_age_gender %>%
  filter(level == "Birmingham") %>%
  filter(age %in% 10:17) %>% 
  group_by(end_period_year, end_period_month, period_length, school_type, gender, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>% 
  mutate(pru = ifelse(school_type %in% c("Pupil Referral Unit", "Pupil referral unit"), "PRU", "Not PRU"))

save(pru, file = "Output/Data/Processed/pru.Rdata")

# WHAT DOES THIS FSM DATA MEANNNN LOL - FIGURE THAT ONE OUT TOMORROW
schools_fsm <- schools_10to22_fsm %>%
  filter(level == "Birmingham") 



# %>% 
#   mutate(fsm_pc = school_fsm / school_headcount)

# come back if you want to put in FSM for the poverty overlap!
# or if decide to stratify by ehtnicity
