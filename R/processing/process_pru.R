load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_age_gender.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_fsm.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_ethnicity.Rdata")


pru <- pru_10to22_age_gender %>%
  filter(level == "Birmingham") %>%
  group_by(level, end_period_year, end_period_month, period_length, gender, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  filter(age %in% 10:17)

save(pru, file = "Output/Data/Processed/pru.Rdata")

# come back if you want to put in FSM for the poverty overlap!
# or if decide to stratify by ehtnicity
