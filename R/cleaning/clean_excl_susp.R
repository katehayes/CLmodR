# EXCLUSIONS AND SUSPENSIONS
es_data <- read.csv("/Users/katehayes/temp_data/permanent-and-fixed-period-exclusions-in-england_2020-21/data/exc_characteristics.csv")

exsus_data <- es_data %>%
  rename(end_period_year = time_period) %>%
  mutate(end_period_year = paste(str_sub(end_period_year, end = -5), str_sub(end_period_year, start = -2), sep = "")) %>%
  filter(school_type != "Total") %>%
  mutate(period_length = "Academic Year",
         end_period_month = "June?") #come back and figure out when the term ends


exsus_birm <- exsus_data %>%
  filter(la_name == "Birmingham") %>%
  mutate(level = "Birmingham")


exsus_wmr <- exsus_data %>%
  filter(geographic_level == "Regional" & region_name == "West Midlands") %>%
  mutate(level = "West Midlands (region)")

exsus_eng <- exsus_data %>%
  filter(geographic_level == "National" & country_name == "England") %>%
  mutate(level = "England")

exsus_data <- exsus_eng %>%
  bind_rows(exsus_wmr) %>%
  bind_rows(exsus_birm) %>%
  select(-c(geographic_level:la_name, ends_with("_rate")), -time_identifier)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together,# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

excl_susp_07to21_gender <- exsus_data %>%
  filter(characteristic_group == "Gender") %>%
  select(-characteristic_group) %>%
  rename(gender = characteristic) %>%
  mutate(gender = reconcile_gender(str_remove(gender, "Gender ")))
save(excl_susp_07to21_gender, file = "Output/Data/Cleaned/excl_susp_07to21_gender.Rdata")


excl_susp_07to21_age <- exsus_data %>%
  filter(characteristic_group == "Age") %>%
  select(-characteristic_group) %>%
  rename(age = characteristic) %>%
  mutate(age = ifelse(age == "Age unclassified", "Unknown", age),
         age = str_remove(age, "Age "),
         age = ifelse(age == "4 and under", "0-4", age),
         age = ifelse(age == "19 and over", "19+", age))
save(excl_susp_07to21_age, file = "Output/Data/Cleaned/excl_susp_07to21_age.Rdata")


excl_susp_07to21_ethnicity <- exsus_data %>%
  filter(characteristic_group == "Ethnicity group",
         characteristic != "Ethnicity Minority ethnic pupil") %>%
  select(-characteristic_group) %>%
  rename(ethnicity = characteristic) %>%
  mutate(ethnicity = ifelse(ethnicity == "Ethnicity Unclassified", "Unknown", ethnicity),
         ethnicity = str_remove(ethnicity, "Ethnicity Major "),
         ethnicity = str_remove(ethnicity, " Total"))
save(excl_susp_07to21_ethnicity, file = "Output/Data/Cleaned/excl_susp_07to21_ethnicity.Rdata")


excl_susp_07to21_fsm <- exsus_data %>%
  filter(characteristic_group == "FSM") %>%
  select(-characteristic_group) %>%
  rename(fsm = characteristic) %>%
  mutate(fsm = ifelse(fsm == "FSM - Unclassified", "Unknown", fsm),
         fsm = str_remove(fsm, "FSM - "))
save(excl_susp_07to21_fsm, file = "Output/Data/Cleaned/excl_susp_07to21_fsm.Rdata")

