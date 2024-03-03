# https://twitter.com/_louisemurphy/status/1628766835561594882
https://explore-education-statistics.service.gov.uk/methodology/participation-in-education-training-and-neet-age-16-to-17-by-local-authority
# [1] Young adult offenders in custody are excluded from the denominator
# used to calculate participation, NEET and not known rates.
# IS THIS TRUE ALWAYS?????????????????



# The age of the learner is measured at the beginning of the academic year, 31 August
# NEET - want the age and gender bit
# want kind of to know what type of participation too...

# 2023

# These NEET figures are an average estimate from Dec/Jan/Feb for the NEET figures to give an end of year estimate
n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2022-23/data/ud_neet_characteristics.csv")

neet_19to23 <- n_data %>% 
  filter(la_name == "Birmingham",
         Characteristic_grouping == "gender",
         Age != "16-17") %>% 
  mutate(end_period_month = "December") %>% 
  select(-c(time_identifier:la_name, Characteristic_grouping, avgNEETNK, NEETNKprop:annual_change_NEETNK)) %>% 
  rename(end_period_year = time_period,
         gender = Characteristic,
         age = Age,
         count_neet = avgNEET,
         count_nk = avgNK,
         count_avg_tot = avgcohort) %>% 
  mutate(gender = reconcile_gender(gender))


neet_19to23 <- n_data %>% 
  filter(la_name == "Birmingham",
         Characteristic_grouping == "gender",
         Age != "16-17") %>% 
  mutate(end_period_month = "December",
         avgNEET = as.numeric(avgNEET),
         `Not NEET` = as.numeric(avgcohort) -avgNEET) %>% 
  select(-c(time_identifier:la_name, avgNK, avgcohort, Characteristic_grouping, avgNEETNK, NEETNKprop:annual_change_NEETNK)) %>% 
  rename(end_period_year = time_period,
         gender = Characteristic,
         age = Age,
         NEET = avgNEET) %>% 
    pivot_longer(c(NEET, `Not NEET`),
                 names_to = "neet",
                 values_to = "count") %>% 
  mutate(gender = reconcile_gender(gender))


neet_levels_19to23 <- n_data %>% 
filter(la_name == "Birmingham",
       Characteristic_grouping == "gender",
       Age != "16-17") %>% 
  mutate(end_period_month = "December") %>% 
  select(-c(time_identifier:la_name, Characteristic_grouping, avgNEETNK, NEETNKprop:annual_change_NEETNK)) %>% 
  rename(end_period_year = time_period,
         gender = Characteristic,
         age = Age,
         count_neet = avgNEET,
         count_nk = avgNK,
         count_avg_tot = avgcohort) %>% 
  mutate(gender = reconcile_gender(gender)) %>% 
  mutate(level = "Birmingham") %>% 
  bind_rows(n_data %>% 
              filter(geographic_level == "National",
                     country_name == "England",
                     Characteristic_grouping == "gender",
                     Age != "16-17") %>% 
              mutate(end_period_month = "December") %>% 
              select(-c(time_identifier:la_name, Characteristic_grouping, avgNEETNK, NEETNKprop:annual_change_NEETNK)) %>% 
              rename(end_period_year = time_period,
                     gender = Characteristic,
                     age = Age,
                     count_neet = avgNEET,
                     count_nk = avgNK,
                     count_avg_tot = avgcohort) %>% 
              mutate(gender = reconcile_gender(gender)) %>% 
              mutate(level = "England")) %>% 
  bind_rows(n_data %>% 
              filter(geographic_level == "Regional",
                     region_name == "West Midlands",
                     Characteristic_grouping == "gender",
                     Age != "16-17") %>% 
              mutate(end_period_month = "December") %>% 
              select(-c(time_identifier:la_name, Characteristic_grouping, avgNEETNK, NEETNKprop:annual_change_NEETNK)) %>% 
              rename(end_period_year = time_period,
                     gender = Characteristic,
                     age = Age,
                     count_neet = avgNEET,
                     count_nk = avgNK,
                     count_avg_tot = avgcohort) %>% 
              mutate(gender = reconcile_gender(gender)) %>% 
              mutate(level = "West Midlands (region)"))








n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2022-23/data/ud_participation_characteristics.csv")

part_19to23 <- n_data %>% 
  filter(la_name == "Birmingham",
         Characteristic_grouping == "gender",
         Age != "16-17") %>% 
  mutate(end_period_month = "December") %>% 
  select(-c(time_identifier:la_name, Characteristic_grouping, Proportion_in_education_and_training, annual_change)) %>% 
  rename(end_period_year = time_period,
         gender = Characteristic,
         age = Age,
         count_et = Total_in_education_and_training,
         count_co_tot = cohort) %>% 
  mutate(gender = reconcile_gender(gender))

neet_part_19to23 <- neet_19to23 %>% 
  full_join(part_19to23)


n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2022-23/data/ud_participation_by_type.csv")

part_type_19to23 <- n_data %>% 
  filter(la_name == "Birmingham",
         Participation_grouping == "Headline_participation") %>% 
  mutate(end_period_month = "December") %>% 
  select(-c(time_identifier:la_name, Participation_grouping, percent, annual_change)) %>% 
  rename(end_period_year = time_period) %>% 
  filter(!Participation_type %in% c("Activity not known", "cohort", "TOTAL participating in education and training")) %>% 
  rename(count = number,
         part_type = Participation_type) %>% 
  select(end_period_year, end_period_month, part_type, count)




# # 2022
# n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2021-22/data/ud_neetnk_la_dashboard_2022_final.csv")
# # 2021
# n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2021_NEET_and_participation_tables.xlsx")
# # 2020
# n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/Copy_of_Copy_of_2020_NEET_and_participation_tables_linked_V2_accesible_MB.xlsx")
# # 2019
# n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2019_NEET_and_participation_tables__2_.xlsx")




# 2018
# im unhiding some sheets, for unrounded figures
n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2018_NEET_and_participation_tables.xlsx",
                    sheet = 4, skip = 5)

part_18 <- n_data %>% 
  filter(`...3` == "Birmingham") %>% 
  select(-c(`ONS Geography code`:`...3`)) %>% 
  rename(count_16 = 1,
         girls_16_pcpart = 2,
         boys_16_pcpart = 3,
         tot_16_pcpart = 4,
         count_17 = 5,
         girls_17_pcpart = 6,
         boys_17_pcpart = 7,
         tot_17_pcpart = 8) %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  mutate(count_part_16 = count_16*tot_16_pcpart,
         count_part_17 = count_17*tot_17_pcpart) %>% 
  mutate(count_girls_16 = count_16*(count_part_16 - count_16*boys_16_pcpart)/(count_16*(girls_16_pcpart - boys_16_pcpart)),
         count_boys_16 = count_16 - count_girls_16) %>% 
  mutate(count_girls_part_16 = count_girls_16*girls_16_pcpart,
         count_boys_part_16 = count_boys_16*boys_16_pcpart) %>% 
  mutate(count_girls_17 = count_17*(count_part_17 - count_17*boys_17_pcpart)/(count_17*(girls_17_pcpart - boys_17_pcpart)),
         count_boys_17 = count_17 - count_girls_17) %>% 
  mutate(count_girls_part_17 = count_girls_17*girls_17_pcpart,
         count_boys_part_17 = count_boys_17*boys_17_pcpart) %>% 
  select(starts_with("count_girls"), starts_with("count_boys")) %>% 
  mutate(end_period_year = 2018) %>% 
  pivot_longer(-end_period_year,
               names_to = "part",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", part), "Girls", "Boys"),
         age = ifelse(grepl("16", part), 16, 17),
         part = ifelse(grepl("part", part), "Participating", "Total")) %>% 
  pivot_wider(names_from = part, 
              values_from = count) %>% 
  # mutate(pc = Participating/ Total) - was just checking everything lined up
  mutate(`Not participating` = Total - Participating) %>% 
  select(-Total) %>% 
  pivot_longer(c(Participating, `Not participating`),
               names_to = "part",
               values_to = "count")

n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2018_NEET_and_participation_tables.xlsx",
                    sheet = 11, skip = 7)

neet_levels_18 <- n_data %>% 
  filter(`...3` %in% c("Birmingham", "England", "West Midlands")) %>% 
  select(-c(1:2, 4:13)) %>% 
  select(-c(2, 5, 6, 8, 10, 11, 12)) %>% 
  select(-c(8, 9, 11, 13)) %>% 
  rename(level = 1,
         count_boys_16 = 2,
         count_girls_16 = 3,
         count_boys_neet_16 = 4,
         count_girls_neet_16 = 5,
         count_boys_17 = 6,
         count_girls_17 = 7,
         count_boys_neet_17 = 8,
         count_girls_neet_17 = 9) %>% 
  mutate(across(-level, ~as.numeric(.x))) %>% 
  mutate(end_period_year = 2018) %>% 
  pivot_longer(-c(end_period_year, level),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", neet), "Girls", "Boys"),
         age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("neet", neet), "NEET", "Total")) %>% 
  pivot_wider(names_from = neet, 
              values_from = count) %>% 
  mutate(nk_adjust = ifelse(level == "Birmingham", (2.2/9.2), ifelse(level == "West Midlands", (2.4/6.4), (2.7/6.0)))) %>% 
  mutate(NEET = nk_adjust*NEET) %>% 
  mutate(`Not NEET` = Total - NEET) %>% 
  select(-Total) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count") %>% 
  select(-nk_adjust)



neet_18 <- n_data %>% 
  filter(`...3` == "Birmingham") %>% 
  select(-c(1:13)) %>% 
  select(-c(1, 4, 5, 7, 9, 10, 11)) %>% 
  select(-c(7, 8, 10, 12)) %>% 
  rename(count_boys_16 = 1,
         count_girls_16 = 2,
         count_boys_neet_16 = 3,
         count_girls_neet_16 = 4,
         count_boys_17 = 5,
         count_girls_17 = 6,
         count_boys_neet_17 = 7,
         count_girls_neet_17 = 8) %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  mutate(end_period_year = 2018) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", neet), "Girls", "Boys"),
         age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("neet", neet), "NEET", "Total")) %>% 
  pivot_wider(names_from = neet, 
              values_from = count) %>% 
  mutate(NEET = (2.2/9.2)*NEET) %>% 
  mutate(`Not NEET` = Total - NEET) %>% 
  select(-Total) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")

neet_nk_18 <- n_data %>% 
  filter(`...3` == "Birmingham") %>% 
  select(-c(1:13)) %>% 
  select(-c(1, 4, 5, 7, 9, 10, 11)) %>% 
  select(-c(7, 8, 10, 12)) %>% 
  rename(count_boys_16 = 1,
         count_girls_16 = 2,
         count_boys_neet_16 = 3,
         count_girls_neet_16 = 4,
         count_boys_17 = 5,
         count_girls_17 = 6,
         count_boys_neet_17 = 7,
         count_girls_neet_17 = 8) %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  mutate(end_period_year = 2018) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", neet), "Girls", "Boys"),
         age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("neet", neet), "NEET", "Total")) %>% 
  pivot_wider(names_from = neet, 
              values_from = count) %>% 
  mutate(NEET = (2.2/9.2)*NEET) %>% 
  mutate(NK = (7/9.2)*NEET) %>% 
  pivot_longer(c(NEET, NK, Total),
               names_to = "neet",
               values_to = "count")



n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2018_NEET_and_participation_tables.xlsx",
                    sheet = 9, skip = 6)

neet_nk_18 <- n_data





n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2018_NEET_and_participation_tables.xlsx",
                    sheet = 2, skip = 4)

part_type_18 <- n_data %>% 
  filter(`...3` == "Birmingham") %>% 
  select(-c(1:3, 11:14)) %>% 
  rename(count = 1) %>% 
  mutate(across(-c(), ~as.numeric(.x))) %>% 
  mutate(across(!count, ~count*.x)) %>% 
  select(-count) %>% 
  mutate(end_period_year = 2018) %>% 
  pivot_longer(-end_period_year,
               names_to = "part_type",
               values_to = "count") %>% 
  mutate(part_type = str_replace(part_type, " time", "-time"),
         part_type = ifelse(part_type == "Other", "Other participation type", part_type),
         part_type = ifelse(part_type == "Full-time education and training", "Full-time education", part_type))



# 2017 - CAN'T FIND THIS ONE - MAYBE CHECK ONS IF BOTHERED
# n_data <- read_xlsx("")

# 2016 - NO MORE PARTICIPATION
n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/LA_NEET_and_Not_known_figures_2016 (1).xlsx",
                    sheet = 3, skip = 4)

neet_levels_16 <- n_data %>%
  filter(`...3` %in% c("Birmingham", "England", "West Midlands")) %>% 
  select(-c(1:2, 4:14, 17, 18, 20, 22:24, 27, 28, 30, 32, 33)) %>% 
  rename(level = 1,
         count_boys_16 = 2,
         count_girls_16 = 3,
         count_boys_neet_16 = 4,
         count_girls_neet_16 = 5,
         count_boys_17 = 6,
         count_girls_17 = 7,
         count_boys_neet_17 = 8,
         count_girls_neet_17 = 9) %>% 
  mutate(across(-level, ~as.numeric(.x))) %>% 
  mutate(end_period_year = 2016) %>% 
  pivot_longer(-c(level, end_period_year),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", neet), "Girls", "Boys"),
         age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("neet", neet), "NEET", "Total")) %>% 
  pivot_wider(names_from = neet, 
              values_from = count) %>% 
  mutate(nk_adjust = ifelse(level == "Birmingham", (2.8/10.2), ifelse(level == "West Midlands", (	2.7/7.3), (2.8/6.0)))) %>% 
  mutate(NEET = nk_adjust*NEET) %>% 
  mutate(`Not NEET` = Total - NEET) %>% 
  select(-Total) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count") 




neet_16 <- n_data %>% 
  filter(`...3` == "Birmingham") %>% 
  select(-c(1:14, 17, 18, 20, 22:24, 27, 28, 30, 32, 33)) %>% 
  rename(count_boys_16 = 1,
         count_girls_16 = 2,
         count_boys_neet_16 = 3,
         count_girls_neet_16 = 4,
         count_boys_17 = 5,
         count_girls_17 = 6,
         count_boys_neet_17 = 7,
         count_girls_neet_17 = 8) %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  mutate(end_period_year = 2016) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", neet), "Girls", "Boys"),
         age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("neet", neet), "NEET", "Total")) %>% 
  pivot_wider(names_from = neet, 
              values_from = count) %>% 
  mutate(NEET = NEET*(2.8/10.2)) %>% 
  mutate(`Not NEET` = Total - NEET) %>% 
  select(-Total) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count") 


neet_nk_16 <- n_data %>% 
  filter(`...3` == "Birmingham") %>% 
  select(-c(1:14, 17, 18, 20, 22:24, 27, 28, 30, 32, 33)) %>% 
  rename(count_boys_16 = 1,
         count_girls_16 = 2,
         count_boys_neet_16 = 3,
         count_girls_neet_16 = 4,
         count_boys_17 = 5,
         count_girls_17 = 6,
         count_boys_neet_17 = 7,
         count_girls_neet_17 = 8) %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  mutate(end_period_year = 2016) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("girls", neet), "Girls", "Boys"),
         age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("neet", neet), "NEET", "Total")) %>% 
  pivot_wider(names_from = neet, 
              values_from = count) %>% 
  mutate(NEET = NEET*(2.8/10.2)) %>% 
  mutate(NK = NEET*(7.4/10.2)) %>% 
  pivot_longer(c(NEET, NK, Total),
               names_to = "neet",
               values_to = "count") 





  # 10.2%	2.8%	7.4% 
  
# 2015 - HERE WE NO LONGER HAVE GENDER
n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2015_local_authority_NEET_figures.xls",
                   sheet = 2, skip = 4)

neet_levels_15 <- n_data %>% 
  filter(`...2` == "Birmingham" |
           `...1` == "WEST MIDLANDS") %>% 
  rename(level = `...2`) %>% 
  mutate(level = ifelse(is.na(level), "West Midlands", level))%>% 
  select(-c(1, 6, 10:13))  %>% 
  rename(level = 1,
         count_neet_16 = 2,
         pc_neet_16 = 3,
         pc_nk_16 = 4,
         count_neet_17 = 5,
         pc_neet_17 = 6,
         pc_nk_17 = 7) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2015) %>% 
  pivot_longer(-c(level,end_period_year),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")

neet_15 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2015) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")
  


neet_nk_15 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2015) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "Total"))) 

# 2014
n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2014_local_authority_NEET_figures.xls",
                   sheet = 2, skip = 4)


neet_levels_14 <- n_data %>% 
  filter(`...2` == "Birmingham" |
           `...1` == "WEST MIDLANDS") %>% 
  rename(level = `...2`) %>% 
  mutate(level = ifelse(is.na(level), "West Midlands", level)) %>% 
  select(-c(1, 6, 10:13))  %>% 
  rename(level = 1,
         count_neet_16 = 2,
         pc_neet_16 = 3,
         pc_nk_16 = 4,
         count_neet_17 = 5,
         pc_neet_17 = 6,
         pc_nk_17 = 7) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2014) %>% 
  pivot_longer(-c(level, end_period_year),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")
  
  
  
neet_14 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2014) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")


neet_nk_14 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2014) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "Total")))


# 2013
n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2013_local_authority_neet_figures.xlsx",
                    sheet = 2, skip = 4)

neet_levels_13 <- n_data %>% 
  filter(`...2` == "Birmingham" |
           `...1` == "WEST MIDLANDS") %>% 
  rename(level = `...2`) %>% 
  mutate(level = ifelse(is.na(level), "West Midlands", level)) %>% 
  select(-c(1, 6, 10:13))  %>% 
  rename(level = 1,
         count_neet_16 = 2,
         pc_neet_16 = 3,
         pc_nk_16 = 4,
         count_neet_17 = 5,
         pc_neet_17 = 6,
         pc_nk_17 = 7) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2013) %>% 
  pivot_longer(-c(level, end_period_year),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")





neet_13 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2013) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
    # mutate(NEET = NEET + NK,
    #        `Not NEET` = total - NEET) %>% 
    # select(-c(NK, total)) %>% 
    # pivot_longer(c(NEET, `Not NEET`),
    #              names_to = "neet",
    #              values_to = "count") %>% 
    mutate(`Not NEET` = total - NEET) %>% 
    select(-c(NK, total)) %>% 
    pivot_longer(c(NEET, `Not NEET`),
                 names_to = "neet",
                 values_to = "count")

neet_nk_13 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2013) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "Total")))

# TWNETY TWELVE
n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2012_local_authority_NEET_figures.xls",
                   sheet = 2, skip = 4)

neet_levels_12 <- n_data %>% 
  filter(`...2` == "Birmingham" |
           `...1` == "WEST MIDLANDS") %>% 
  rename(level = `...2`) %>% 
  mutate(level = ifelse(is.na(level), "West Midlands", level)) %>% 
  select(-c(1, 6, 10:13))  %>% 
  rename(level = 1,
         count_neet_16 = 2,
         pc_neet_16 = 3,
         pc_nk_16 = 4,
         count_neet_17 = 5,
         pc_neet_17 = 6,
         pc_nk_17 = 7) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2012) %>% 
  pivot_longer(-c(level, end_period_year),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")

neet_12 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100))%>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2012) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
    # mutate(NEET = NEET + NK,
    #        `Not NEET` = total - NEET) %>% 
    # select(-c(NK, total)) %>% 
    # pivot_longer(c(NEET, `Not NEET`),
    #              names_to = "neet",
    #              values_to = "count") %>% 
    mutate(`Not NEET` = total - NEET) %>% 
    select(-c(NK, total)) %>% 
    pivot_longer(c(NEET, `Not NEET`),
                 names_to = "neet",
                 values_to = "count")

neet_nk_12 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100))%>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2012) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "Total"))) 

# TWENTY ELEVEN
n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2011_local_authority_neet_figures.xls",
                   sheet = 2, skip = 3)

neet_levels_11 <- n_data %>% 
  filter(`...2` == "Birmingham" |
           `...1` == "WEST MIDLANDS") %>% 
  rename(level = `...2`) %>% 
  mutate(level = ifelse(is.na(level), "West Midlands", level)) %>% 
  select(-c(1, 6, 10:13))  %>% 
  rename(level = 1,
         count_neet_16 = 2,
         pc_neet_16 = 3,
         pc_nk_16 = 4,
         count_neet_17 = 5,
         pc_neet_17 = 6,
         pc_nk_17 = 7) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100)) %>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2011) %>% 
  pivot_longer(-c(level, end_period_year),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")

neet_11 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100))%>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
  # mutate(count_notneet_16 = ((1-pc_neet_16)*100)*(count_neet_16/(pc_neet_16*100)),
  #        count_notneet_17 = ((1-pc_neet_17)*100)*(count_neet_17/(pc_neet_17*100))) %>% 
  select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2011) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "total"))) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  # mutate(NEET = NEET + NK,
  #        `Not NEET` = total - NEET) %>% 
  # select(-c(NK, total)) %>% 
  # pivot_longer(c(NEET, `Not NEET`),
  #              names_to = "neet",
  #              values_to = "count") %>% 
  mutate(`Not NEET` = total - NEET) %>% 
  select(-c(NK, total)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")

neet_nk_11 <- n_data %>% 
  filter(`...2` == "Birmingham") %>% 
  select(-c(1, 2, 6, 10:13))  %>% 
  rename(count_neet_16 = 1,
         pc_neet_16 = 2,
         pc_nk_16 = 3,
         count_neet_17 = 4,
         pc_neet_17 = 5,
         pc_nk_17 = 6) %>% 
  mutate(count_nk_16 = (pc_nk_16*100)*count_neet_16/(pc_neet_16*100),
         count_nk_17 = (pc_nk_17*100)*count_neet_17/(pc_neet_17*100))%>% 
  mutate(count_16 = count_neet_16/pc_neet_16,
         count_17 = count_neet_17/pc_neet_17) %>% 
   select(-c(starts_with("pc"))) %>% 
  mutate(end_period_year = 2011) %>% 
  pivot_longer(-end_period_year,
               names_to = "neet",
               values_to = "count") %>% 
  mutate(age = ifelse(grepl("16", neet), 16, 17),
         neet = ifelse(grepl("nk", neet), "NK", 
                       ifelse(grepl("neet", neet), "NEET", "Total")))

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# VULNERABLE GROUPS# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
https://department-for-education.shinyapps.io/neet-comparative-la-scorecard/
  The cohort does not include young adult offenders in custody.


# A young person is said to be in a vulnerable group if they have any of the following characteristics (taken from IC01 of the NCCIS returns):
#   110 - Looked after/In care - Refugee/Asylum seeker - Carer-not own child- 
#   Disclosed substance misuse-  Care leaver - Supervised by YOT (Youth Offending Team) 
# Parent-not caring for own child - Alternative provision- Mental health flag

n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2022-23/data/ud_neetnk_la_dashboard_2023_final.csv")

neet_vul_23 <- n_data %>% 
  filter(la_name == "Birmingham") %>% 
  select(c(time_period, Cohort_DJFavg, starts_with("VG"))) %>% 
  rename(end_period_year = time_period,
         count = Cohort_DJFavg,
         count_vul = VG_cohort_DJF_avg,
         vul_pc_neet = VG_NEET_NK_percentage) %>% 
  select(-VG_cohort_percentage)

# the actual percentage of people they flag as vulberable is shockingly low
# but the NEET figure of those people is shockingly high
# they are rounding the percentages ill jsut use the total figures where poss

n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2021-22/data/ud_neetnk_la_dashboard_2022_final.csv")

neet_vul_22 <- n_data %>% 
  filter(la_name == "Birmingham") %>% 
  select(c(time_period, Cohort_DJFavg, starts_with("VG"))) %>% 
  rename(end_period_year = time_period,
         count = Cohort_DJFavg,
         count_vul = VG_cohort_DJF_avg,
         vul_pc_neet = VG_NEET_NK_percentage) %>% 
  select(-VG_cohort_percentage)

# 35.9 and 32.5

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# extra piece# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# https://ffteducationdatalab.org.uk/wp-content/uploads/2021/09/working_paper4.pdf
# Post-16 activities at ages 16 and 17, 1999/2000 cohort of pupils who
# experienced AP schools pre-16 
# Table 2: Post-16 activities at ages 16 and 17, 1999/2000 cohort of pupils who
# completed Key Stage 4 in state-funded mainstream schools 

# NOTE TO SELF ALSO LOOK AT THE CUSTODY!!!!

n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/schools_extra.xlsx",
                    sheet = 2)

pru_neet <- n_data %>% 
  mutate(destination = ifelse(destination == "Not in education, employment and training (NEET)",
                              "NEET", "Not NEET")) %>% 
  group_by(origin, age, term, destination) %>% 
  summarise(pc = sum(pc)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = destination,
              values_from = pc) %>% 
  group_by(origin) %>% 
  arrange(age, term) %>% 
  mutate(diff_NEET = lead(NEET) - NEET,
         pc_entering_NEET = diff_NEET/`Not NEET`)

entering_neet <- pru_neet %>% 
  ggplot() +
    geom_line(aes(x=interaction(term,age), y = pc_entering_NEET, group = origin, colour = origin))

entering_neet
ggsave(filename = "output/graphs/entering_neet.png", entering_neet)




pru_to_neet <- n_data %>% 
  filter(destination == "Not in education, employment and training (NEET)") %>% 
  ggplot() +
  geom_line(aes(x=term, y = pc, group = origin, colour = origin)) +
  facet_grid(~age)
pru_to_neet
ggsave(filename = "output/graphs/pru_to_neet.png", pru_to_neet)


# hhm so, every term some pc of the remainging students become neet



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together,# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

neet_16to23_age_gender <- neet_19to23 %>% 
  mutate(across(c(starts_with("count"), age), ~as.numeric(.x))) %>% 
  mutate(NEET = count_neet,
        # NEET = count_neet + count_nk,
         `Not NEET` = count_avg_tot - NEET) %>% 
  select(c(end_period_year, gender, age, NEET, `Not NEET`)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count") %>% 
  bind_rows(neet_18, neet_16) %>% 
  mutate(count = as.numeric(count))

save(neet_16to23_age_gender, file = "output/data/cleaned/neet_16to23_age_gender.Rdata")


neet_11to23_age <- neet_16to23_age_gender %>% 
  group_by(end_period_year, neet, age) %>% 
  summarise(count = sum(count)) %>% 
  bind_rows(neet_15, neet_14, neet_13, neet_12, neet_11) %>% 
  ungroup() %>% 
  # filter(neet != "Not NEET") %>% 
  # group_by(end_period_year, age) %>% 
  # summarise(neet = sum(count)) %>%
  # ungroup() %>% 
  arrange(end_period_year) 
save(neet_11to23_age, file = "output/data/cleaned/neet_11to23_age.Rdata")


neet_nk_11to23_age <- neet_19to23 %>% 
  mutate(across(c(starts_with("count"), age), ~as.numeric(.x))) %>% 
  rename(Total = count_avg_tot,
         NEET = count_neet,
         NK = count_nk) %>% 
  select(c(end_period_year, gender, age, NEET, NK, Total)) %>% 
  pivot_longer(c(NEET, NK, Total),
               names_to = "neet",
               values_to = "count") %>% 
  bind_rows(neet_nk_18, neet_nk_16) %>% 
  mutate(count = as.numeric(count)) %>% 
  group_by(end_period_year, neet, age) %>% 
  summarise(count = sum(count)) %>% 
  bind_rows(neet_nk_15, neet_nk_14,
            neet_nk_13, neet_nk_12,
            neet_nk_11)
  




neet_levels_11to23_age <- neet_levels_19to23 %>% 
  mutate(across(c(starts_with("count"), age), ~as.numeric(.x))) %>% 
  mutate(NEET = count_neet,
         # NEET = count_neet + count_nk,
         `Not NEET` = count_avg_tot - NEET) %>% 
  select(c(end_period_year, level, gender, age, NEET, `Not NEET`)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count") %>% 
  bind_rows(neet_levels_18, neet_levels_16) %>% 
  mutate(count = as.numeric(count)) %>% 
  group_by(end_period_year, level, neet, age) %>% 
  summarise(count = sum(count)) %>% 
  bind_rows(neet_levels_15, neet_levels_14, neet_levels_13, neet_levels_12, neet_levels_11) %>% 
  ungroup() %>% 
  arrange(end_period_year) %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level))
save(neet_levels_11to23_age, file = "output/data/cleaned/neet_levels_11to23_age.Rdata")





neet_v_pop <- neet_11to23_age %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = neet),
           stat = "identity", position = "stack") +
  geom_line(data = pop_estimate_01to20_age_gender %>%
                  filter(level == "Birmingham",
                         age %in% c(16:17),
                         end_period_year >= 2010) %>% 
                  group_by(end_period_year, age) %>% 
                  summarise(count = sum(count)),
aes(x = end_period_year, y = count)) +
  facet_wrap(~age)

neet_v_pop
ggsave(filename = "output/graphs/neet_v_pop.png", neet_v_pop)  
# JESUS CHRIST so annoying why is population so much bigger


part_18to23_age_gender <- part_19to23 %>% 
  mutate(across(c(starts_with("count"), age), ~as.numeric(.x))) %>% 
  mutate(Participating = count_et,
         `Not participating` = count_co_tot - count_et) %>% 
  select(c(end_period_year, gender, age, Participating, `Not participating`)) %>% 
  pivot_longer(c(Participating, `Not participating`),
               names_to = "part",
               values_to = "count") %>% 
  bind_rows(part_18)

save(part_18to23_age_gender, file = "output/data/cleaned/part_18to23_age_gender.Rdata")

part_type_18to23 <- part_type_19to23 %>% 
  select(-end_period_month) %>% 
  bind_rows(part_type_18) 

save(part_type_18to23, file = "output/data/cleaned/part_type_18to23.Rdata")






check <- neet_16to23_age_gender %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(age %in% c(16:17),
                     level == "Birmingham",
                     end_period_year >= 2016) %>% 
              rename(population = count) %>% 
              select(end_period_year, gender, age, population)) %>% 
  mutate(check = population - NEET - `Not NEET`) %>% 
  full_join(schools %>% 
              ungroup() %>% 
              filter(age %in% c(16, 17)) %>% 
              group_by(end_period_year, gender, age) %>% 
              summarise(school_count = sum(count)) %>% 
              filter(end_period_year >= 2016) %>% 
              ungroup()) %>% 
  full_join(part_18to23_age_gender %>% 
              pivot_wider(names_from = part,
                          values_from = count) %>% 
              ungroup()) %>% 
  ungroup()


check2 <- neet_16to23_age_gender %>% 
  group_by(end_period_year, neet) %>% 
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(age %in% c(16:17),
                     level == "Birmingham",
                     end_period_year >= 2016) %>% 
              group_by(end_period_year) %>% 
              summarise(population = sum(count))) %>% 
  mutate(check = population - NEET - `Not NEET`) %>% 
  full_join(schools %>% 
              ungroup() %>% 
              filter(age %in% c(16, 17)) %>% 
              group_by(end_period_year) %>% 
              summarise(school_count = sum(count)) %>% 
              filter(end_period_year >= 2016) %>% 
              ungroup()) %>% 
  full_join(part_18to23_age_gender %>% 
              group_by(end_period_year, part) %>% 
              summarise(count = sum(count)) %>% 
              pivot_wider(names_from = part,
                          values_from = count) %>% 
              ungroup()) %>% 
  ungroup() %>% 
  full_join(part_type_18to23 %>% 
              pivot_wider(names_from = part_type,
                          values_from = count) %>% 
              mutate(across(c(`Full-time education`:`Other participation type`), ~as.numeric(.x))) %>% 
              mutate(check_type = `Full-time education` + Apprenticeship + `Work based learning` +
                    `Part-time education` + `Employment combined with study` + `Other participation type`)) %>% 
  mutate(part_v_pop = population - `Not participating` - `Participating`)

