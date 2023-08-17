# https://twitter.com/_louisemurphy/status/1628766835561594882


# The age of the learner is measured at the beginning of the academic year, 31 August
# NEET - want the age and gender bit
# want kind of to know what type of participation too...

# 2023
n_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/participation-in-education-training-and-neet-age-16-to-17-by-local-authority_2022-23/data/ud_neetnk_la_dashboard_2023_final.csv")

neet_23 <- n_data %>% 
  filter(la_name == "Birmingham")

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
         count_avg_tot = avgcohort)


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
         count_co_tot = cohort)

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
  mutate(`Not NEET` = Total - NEET) %>% 
  select(-Total) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")


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
  mutate(part_type = str_replace(part_type, " time", "-time"))



# 2017 - CAN'T FIND THIS ONE - MAYBE CHECK ONS IF BOTHERED
# n_data <- read_xlsx("")

# 2016
n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/LA_NEET_and_Not_known_figures_2016 (1).xlsx",
                    sheet = 3, skip = 4)


neet_16 <- n_data %>% 
  filter(`...3` == "Birmingham") 

# %>% 
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
  mutate(`Not NEET` = Total - NEET) %>% 
  select(-Total) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")

# 2015
n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2015_local_authority_NEET_figures.xls")

# 2014
n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2014_local_authority_NEET_figures.xls")

# 2013
n_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2013_local_authority_neet_figures.xlsx")

n_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/2012_local_authority_NEET_figures.xls")
