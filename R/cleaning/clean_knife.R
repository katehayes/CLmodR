
# NOTE TO SELF - THERE is a little piece of info on average length of sentence
# for children recieving custodial sentences for knife crime
# come back to this if you want

k_data <- read.csv("/Users/katehayes/temp_data/Pivot_Tool_Data.csv")


knife_data <- k_data %>%
  rename(end_period_year = Year_ending_March,
         offence_type = Table)


k_wmp <- knife_data %>%
  filter(Police_force == "West Midlands") %>%
  group_by(end_period_year, Disposal, Age_group, Previous_convictions_or_cautions,
           Gender, Officer_identified_ethnicity, offence_type) %>%
  summarise(count = sum(Count)) %>%
  mutate(level = "West Midlands (police)")


knife_data <- knife_data %>%
  group_by(end_period_year, Disposal, Age_group, Previous_convictions_or_cautions,
           Gender, Officer_identified_ethnicity, offence_type) %>%
  summarise(count = sum(Count)) %>%
  mutate(level = "Eng/Wales") %>%
  bind_rows(k_wmp) %>%
  rename(disposal = Disposal,
         age = Age_group,
         prev_convict_caut = Previous_convictions_or_cautions,
         gender = Gender,
         ethnicity = Officer_identified_ethnicity,
         offence = offence_type) %>%
  mutate(end_period_month = "March",
         period_length = "Year") %>%
  filter(offence != "All Knife and Offensive Weapon (P1)") %>%
  mutate(offence = str_remove(offence, " \\(P[0-9]\\)"),
         disposal = str_remove(disposal, "[0-9]\\) "),
         age = reconcile_age(age),
         gender = reconcile_gender(gender))


# FOR EARLIER YEARS HERE? - check later
# https://www.gov.uk/government/statistics/knife-possession-sentencing-quarterly-brief-earlier-editions-in-the-series


knife_offence_12to22_disposal_age_gen_eth <- knife_data %>%
  filter(age != "18+")

save(knife_offence_12to22_disposal_age_gen_eth, file = "Output/Data/Cleaned/knife_offence_12to22_disposal_age_gen_eth.Rdata")










