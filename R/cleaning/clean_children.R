child_data <- read_ods("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/Local_level_open_data (2) 2/Children_Table.ods", sheet = 3)


# Want to have birm, wm, ew
# have by age AND sex AND ethnicity... pretty crazy!!
# WEST MERCIA IS IN WM REGION BUT NOT PCC.....

child_13to21 <- child_data %>%
  clean_children_13to21()


# earlier year - 2012-13
# this time have either sex or age or gender

child_data <- read_xls("/Users/katehayes/temp_data/regional-tables-2013/Young People by region 2012-13 Table.xls",
                       sheet = 1, skip = 1, n_max = 160)

child1213 <- child_data %>%
  clean_children_11to13(current_end_year = 2013,
                        current_end_month = "Unknown",
                        current_period_length = "Year")

# check <- child1213[[1]]
# check <- child1213[[2]]
# check <- child1213[[3]]


# earlier year - 2011 -2012
child_data <- read_xls("/Users/katehayes/temp_data/local-level-data-11-12/Young People by region 2011-12 v1.0.xls",
                       sheet = 1, skip = 1, n_max = 158)

child1112 <- child_data %>%
  clean_children_11to13(current_end_year = 2012,
                        current_end_month = "Unknown",
                        current_period_length = "Year")

# check1 <- child1112[[1]]
# check1 <- child1112[[2]]
# check1 <- child1112[[3]]


# earlier year - 2010-11
child_data1 <- read_xls("/Users/katehayes/temp_data/young-people-regionally-2010-11.xls",
                        sheet = 1, skip = 1)

child_data2 <- read_xls("/Users/katehayes/temp_data/young-people-regionally-2010-11.xls",
                        sheet = 10, skip = 1, n_max = 1)

child_data <- child_data2 %>%
  rename(Regions = `West Midlands`) %>%
  bind_rows(child_data1[c(9,11),]) %>%
  rename(level = Regions) %>%
  mutate(level = if_else(level == "TOTAL FOR ENGLAND AND WALES", "Eng/Wales", level),
         level = if_else(level == "West Midlands", "West Midlands (region)", level))


c_data_age <- child_data %>%
  select(c(level, `10 - 14`, `15`, `16`, `17 - 18`)) %>%
  pivot_longer(-level,
               names_to = "age", values_to = "count") %>%
  mutate(end_period_year = 2011,
         end_period_month = "Unknown",
         period_length = "Year",
         age = remove_spaces(age))

c_data_eth <- child_data %>%
  select(c(level, White, Mixed, `Asian or Asian British`,
           `Black or Black British`, `Chinese or Other Ethnic Group`,
           `Not Known...16`)) %>%
  rename(`Unknown` = `Not Known...16`) %>%
  pivot_longer(-level,
               names_to = "ethnicity", values_to = "count") %>%
  mutate(end_period_year = 2011,
         end_period_month = "Unknown",
         period_length = "Year")

c_data_sex <- child_data %>%
  select(c(level, Female, Male, `Not Known...9`)) %>%
  rename(`Not Known` = `Not Known...9`) %>%
  pivot_longer(-level,
               names_to = "gender", values_to = "count") %>%
  mutate(end_period_year = 2011,
         end_period_month = "Unknown",
         period_length = "Year",
         gender = reconcile_gender(gender))

child1011 <- list()
child1011[[1]] <- c_data_age
child1011[[2]] <- c_data_sex
child1011[[3]] <- c_data_eth

check <- child1011[[2]]

# earlier year, 2009/10 - this year NO BIRMINGHAM LEVEL

child_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/New Tables for Website (1)/Regional tables.xls",
                       sheet = 5, skip = 4)

child0910 <- child_data[c(3,12),] %>%
  rename(level = ...1) %>%
  mutate(level = if_else(level == "TOTAL", "Eng/Wales", level),
         level = if_else(level == "West Midlands", "West Midlands (region)", level))


c_data_age <- child0910 %>%
  select(c(level, `10 - 14`, `15`, `16`, `17`)) %>%
  pivot_longer(-level,
               names_to = "age", values_to = "count") %>%
  mutate(end_period_year = 2010,
         end_period_month = "Unknown",
         period_length = "Year",
         age = remove_spaces(age))

c_data_eth <- child0910 %>%
  select(c(level, White, Mixed, `Asian or Asian British`,
           `Black or Black British`, `Chinese or Other Ethnic Group`,
           `Not Known...16`)) %>%
  rename(`Unknown` = `Not Known...16`) %>%
  pivot_longer(-level,
               names_to = "ethnicity", values_to = "count") %>%
  mutate(end_period_year = 2010,
       end_period_month = "Unknown",
       period_length = "Year")


c_data_sex <- child0910 %>%
  select(c(level, Female, Male, `Not Known...9`)) %>%
  rename(`Not Known` = `Not Known...9`) %>%
  pivot_longer(-level,
               names_to = "gender", values_to = "count") %>%
  mutate(end_period_year = 2010,
         end_period_month = "Unknown",
         period_length = "Year",
         gender = reconcile_gender(gender))

child0910 <- list()
child0910[[1]] <- c_data_age
child0910[[2]] <- c_data_sex
child0910[[3]] <- c_data_eth


# check <- child0910[[1]]
# check <- child0910[[2]]
# check <- child0910[[3]]

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# two sets - ffrom 2013 to 2021 we have broken down by age AND ethnicity AND gender# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # then the other years its sex OR age OR ethnicity# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# FIRST SET
# doesnt really need any work....
children_14to21_age_gen_eth <- child_13to21 %>%
  mutate(age = reconcile_age(age))
save(children_14to21_age_gen_eth, file = "Output/Data/Cleaned/children_14to21_age_gen_eth.Rdata")


# second SET
children_10to21_age <- child_13to21 %>%
  group_by(end_period_year, end_period_month, period_length,
           age, level) %>%
  summarise(count = sum(count)) %>%
  bind_rows(child1213[[1]]) %>%
  bind_rows(child1112[[1]]) %>%
  bind_rows(child1011[[1]]) %>%
  bind_rows(child0910[[1]]) %>%
  mutate(age = reconcile_age(age))

save(children_10to21_age, file = "Output/Data/Cleaned/children_10to21_age.Rdata")


children_10to21_gender <- child_13to21 %>%
  group_by(end_period_year, end_period_month, period_length,
           gender, level) %>%
  summarise(count = sum(count)) %>%
  bind_rows(child1213[[2]]) %>%
  bind_rows(child1112[[2]]) %>%
  bind_rows(child1011[[2]]) %>%
  bind_rows(child0910[[2]]) %>%
  mutate(gender = reconcile_gender(gender))

save(children_10to21_gender, file = "Output/Data/Cleaned/children_10to21_gender.Rdata")



children_10to21_ethnicity <- child_13to21 %>%
  group_by(end_period_year, end_period_month, period_length,
           ethnicity, level) %>%
  summarise(count = sum(count)) %>%
  bind_rows(child1213[[3]]) %>%
  bind_rows(child1112[[3]]) %>%
  bind_rows(child1011[[3]]) %>%
  bind_rows(child0910[[3]])
# COME BACK HERE WHEN YOU FIGURE OUT WHAT TO DO WITH THE ETHNICITY CATEGORIES

save(children_10to21_ethnicity, file = "Output/Data/Cleaned/children_10to21_ethnicity.Rdata")

