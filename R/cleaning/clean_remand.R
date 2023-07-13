# FIX NAMES HERE - YOU CURRENTLY HAVE LIKE REMAND0910, AND REMAND_0910
# ADD IN THE CARE DATA


# remand has two(?) kind of types of data that cCOULD have equal(?) claim to being 'main'
# 1. number of remands occuring yearly by type of remand
# 2. av monthly population in custodial remand WHICH IS IN THE OTHER FILE
# only that number 1. only has a west mid breakdown in 2010, and not again after.
# so number 2 is main

# then we also have outcomes of remand
# some remand info in care, some info in custody duration on the remand duration


# whats going to happen is, moving through chapter 6 in year order, pulling out
# remand counts by child characteristic, by remand type, by outcome of remand.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# REMAND  INCIDENCE DATA????????  ususally found in chapter 6 og youth justice supplementaries
# number of remands given yearly, have wm level for only first year
# have breakdown by remand type and by child characteristic  in 2009/10, 2018/19, 2019/20, and 2020/21
# for each year can breakdown total remands by age OR gender OR ethnicity, and also seperately break down by remand type
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2009-2010
# Youth justice annual statistics: 2009 to 2010, Workload tables, Regional Tables
# Sheet R.3: remands given to young people, by region, 2009/10
# WEST MIDS LEVEL
# getting col names
remand_data <- read_xls("/Users/katehayes/temp_data/New Tables for Website/Regional tables.xls",
                        sheet = 4, skip = 3, n_max = 1, col_names = TRUE)
col_names <- remand_data %>%
  get_colname(dat_type = "remand")


# west mids
remand_data <- read_xls("/Users/katehayes/temp_data/New Tables for Website/Regional tables.xls",
                        sheet = 4, skip = 252, n_max = 21, col_names = FALSE)
remand0910 <- remand_data %>%
  clean_remand(rem_type = remand_types, col_nm = col_names,
               current_level = "West Midlands (region)",
               current_end_year = 2010,
               current_end_month = "Unknown",
               current_period_length = "Year") %>%
  split_remand(current_group_types = group_types)

check <- remand0910[[3]]


# eng/wales
remand_data <- read_xls("/Users/katehayes/temp_data/New Tables for Website/Regional tables.xls",
                        sheet = 4, skip = 9, n_max = 21, col_names = FALSE)
remand0910_ew <- remand_data %>%
  clean_remand(rem_type = remand_types, col_nm = col_names,
               current_level = "Eng/Wales",
               current_end_year = 2010,
               current_end_month = "Unknown",
               current_period_length = "Year") %>%
  split_remand(current_group_types = group_types)
# check <- remand0910_ew[[3]]


# --------# 2015/16--------------------------------------------------------------------------------
# remand types - 2010/11 to 2015/16
remand_data <- read_xls("/Users/katehayes/temp_data/youth-justice-statistics-2015-to-2016-supplementary-tables/Ch6 - Use of Remand for young people.xls",
                        sheet = 2, skip = 3, n_max = 17, col_names = TRUE, na = "..")

remand_type10to16 <- remand_data %>%
  clean_remand_types()
# add that its at england(? plus wales?) level

# outcomes of remand - 2010/11 - 2015/16
remand_data <- read_xls("/Users/katehayes/temp_data/youth-justice-statistics-2015-to-2016-supplementary-tables/Ch6 - Use of Remand for young people.xls",
                        sheet = 6, skip = 3, n_max = 16, col_names = TRUE)

remand_outcome_10to16 <- remand_data %>%
  clean_remand_outcomes()



# --------# 2018/19--------------------------------------------------------------------------------
# youth-justice-stats-supplementary-tables-march-2019/Ch 6 - Use of remand for children.xlsx

# remand types by characteristic - just 2018/19
# getting col names
# NOTE!! had to resave as an xlsx to open
remand_data <- read_xlsx("/Users/katehayes/temp_data/youth-justice-stats-supplementary-tables-march-2019/Ch 6 - Use of remand for children.xlsx",
                         sheet = 2, skip = 2, n_max = 1, col_names = TRUE)
col_names <- remand_data %>%
  get_colname(dat_type = "remand")

# now reading in the dataset to use
remand_data <- read_xlsx("/Users/katehayes/temp_data/youth-justice-stats-supplementary-tables-march-2019/Ch 6 - Use of remand for children.xlsx",
                         sheet = 2, skip = 5, n_max = 15, col_names = FALSE)

remand1819 <- remand_data %>%
  clean_remand(col_nm = col_names,
               rem_type = remand_types,
               current_level = "Eng/Wales",
               current_end_year = 2019,
               current_end_month = "Unknown",
               current_period_length = "Year") %>%
  split_remand(current_group_types = group_types)


check <- remand1819[[2]]



# --------2019/20--------------------------------------------------------------------------------
# youth-justice-statistics-2019-20-supplementary-tables/Ch 6 - Use of remand for children.xls

# remand types by characteristic - just 2019/20
# getting col names
remand_data <- read_xls("/Users/katehayes/temp_data/youth-justice-statistics-2019-20-supplementary-tables/Ch 6 - Use of remand for children.xls",
                        sheet = 2, skip = 2, n_max = 1, col_names = TRUE)

col_names <- remand_data %>%
  get_colname(dat_type = "remand")


# now reading in the dataset to use
remand_data <- read_xls("/Users/katehayes/temp_data/youth-justice-statistics-2019-20-supplementary-tables/Ch 6 - Use of remand for children.xls",
                        sheet = 2, skip = 5, n_max = 15, col_names = FALSE)

remand1920 <- remand_data %>%
  clean_remand(col_nm = col_names,
               rem_type = remand_types,
               current_level = "Eng/Wales",
               current_end_year = 2020,
               current_end_month = "Unknown",
               current_period_length = "Year") %>%
  split_remand(current_group_types = group_types)

check <- remand1920[[1]]




# --------2020/21--------------------------------------------------------------------------------
# Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 6 - Use of remand for children.xls

# remand types by characteristic - just 2020/21
# getting col names -
remand_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 6 - Use of remand for children.xls",
                        sheet = 2, skip = 2, n_max = 1, col_names = TRUE)

col_names <- remand_data %>%
  get_colname(dat_type = "remand")


# now reading in the dataset to use
remand_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 6 - Use of remand for children.xls",
                        sheet = 2, skip = 5, n_max = 15, col_names = FALSE)

remand2021 <- remand_data %>%
  clean_remand(col_nm = col_names,
               rem_type = remand_types,
               current_level = "Eng/Wales",
               current_end_year = 2021,
               current_end_month = "Unknown",
               current_period_length = "Year") %>%
  split_remand(current_group_types = group_types)



# remand types - 16/17 to 2020/21
remand_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 6 - Use of remand for children.xls",
                        sheet = 3, skip = 3, n_max = 13, col_names = TRUE)

remand_type_17to21 <- remand_data %>%
  clean_remand_types()



# characteristics of children on remand - goes back to 2010/11
remand_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 6 - Use of remand for children.xls",
                        sheet = 4, skip = 3, n_max = 21, col_names = TRUE)

remand_child_10to21 <- remand_data[, 1:12] %>%
  rename(group = `Demographics for children on remand`) %>%
  mutate(group = sub("\\(1\\)", "", group)) %>%
  mutate(group_type = if_else(group %in% group_types, group, "")) %>%
  mutate(group_type = replace(group_type, group_type == "", NA)) %>%
  mutate(group_type = vec_fill_missing(group_type, direction = c("down"))) %>%
  filter(!is.na(`2011`)) %>%
  filter(!grepl("Total", group)) %>%
  pivot_longer(cols = starts_with("20"), names_to = "end_period_year", values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year),
         end_period_month = "Unknown",
         period_length = "Year",
         level = "Eng/Wales")


# outcomes of remand - 14/15 to 20/21
remand_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 6 - Use of remand for children.xls",
                        sheet = 7, skip = 3, n_max = 16, col_names = TRUE)

remand_outcome_15to21 <- remand_data %>%
  clean_remand_outcomes()



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ADDING TOGETHER - count of remands yearly # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# will have a number of outputs:
# 1. remands split by type and characteristic of child (age or gender or eth), in 2009/10, 2018/19, 2019/20, and 2020/21, eng/wales (wm in first year)
# so three outputs for this one
# 2. remand split by remand type, 2009/10 to 2020/21, eng/wales (wm in first year)
# 3. remand split by child characteristic (age or gender or eth), 2009/10 to 2020/21, eng/wales (wm in first year)
# so three outputs for this one too
# 4. remand split by court type and outcome, 2010/11 to 2020/21, eng/wales (no outcomes for 2010)


# GROUP ONE

remand_count_10192021_type_age <- remand0910[[1]] %>%
  bind_rows(remand0910_ew[[1]]) %>%
  bind_rows(remand1819[[1]]) %>%
  bind_rows(remand1920[[1]]) %>%
  bind_rows(remand2021[[1]]) %>%
  mutate(age = remove_spaces(age))

save(remand_count_10192021_type_age, file = "Output/Data/Cleaned/remand_count_10192021_type_age.Rdata")


remand_count_10192021_type_gender <- remand0910[[2]] %>%
  bind_rows(remand0910_ew[[2]]) %>%
  bind_rows(remand1819[[2]]) %>%
  bind_rows(remand1920[[3]] %>%
              rename(gender = sex)) %>%
  bind_rows(remand2021[[3]] %>%
              rename(gender = sex)) %>%
  mutate(gender = reconcile_gender(gender))

save(remand_count_10192021_type_gender, file = "Output/Data/Cleaned/remand_count_10192021_type_gender.Rdata")

remand_count_10192021_type_ethnicity <- remand0910[[3]] %>%
  bind_rows(remand0910_ew[[3]]) %>%
  bind_rows(remand1819[[3]]) %>%
  bind_rows(remand1920[[2]]) %>%
  bind_rows(remand2021[[2]])

save(remand_count_10192021_type_ethnicity, file = "Output/Data/Cleaned/remand_count_10192021_type_ethnicity.Rdata")


# GROUP TWO
remand_count_10to21_remandtype <- remand0910[[1]] %>%
  bind_rows(remand0910_ew[[1]]) %>%
  group_by(end_period_year, end_period_month, period_length,
           level, remand_type, remand) %>%
  summarise(count = sum(count)) %>%
  bind_rows(remand_type10to16) %>%
  bind_rows(remand_type_17to21)

save(remand_count_10to21_remandtype, file = "Output/Data/Cleaned/remand_count_10to21_remandtype.Rdata")


# GROUP THREE
remand_count_10to21_age <- remand0910[[1]] %>%
  bind_rows(remand0910_ew[[1]]) %>%
  group_by(end_period_year, end_period_month, period_length,
           level, age) %>%
  summarise(count = sum(count)) %>%
  bind_rows(remand_child_10to21 %>%
              filter(group_type == "Age") %>%
              select(-group_type) %>%
              rename(age = group)) %>%
  mutate(age = str_replace(age, "Aged", ""),
         age = str_replace_all(age, " ", ""))

save(remand_count_10to21_age, file = "Output/Data/Cleaned/remand_count_10to21_age.Rdata")


remand_count_10to21_gender <- remand0910[[2]] %>%
  bind_rows(remand0910_ew[[2]]) %>%
  group_by(end_period_year, end_period_month, period_length,
           level, gender) %>%
  summarise(count = sum(count)) %>%
  bind_rows(remand_child_10to21 %>%
              filter(group_type == "Sex") %>%
              select(-group_type) %>%
              rename(gender = group))

save(remand_count_10to21_gender, file = "Output/Data/Cleaned/remand_count_10to21_gender.Rdata")


remand_count_10to21_ethnicity <- remand0910[[3]] %>%
  bind_rows(remand0910_ew[[3]]) %>%
  group_by(end_period_year, end_period_month, period_length,
           level, ethnicity) %>%
  summarise(count = sum(count)) %>%
  bind_rows(remand_child_10to21 %>%
              filter(group_type == "Ethnicity",
                     group != "Ethnic minority groups") %>%
              select(-group_type) %>%
              rename(ethnicity = group))

# NEED TO FIX/RECONCILE THE ETHNICITY CATEGORIES HERE
save(remand_count_10to21_ethnicity, file = "Output/Data/Cleaned/remand_count_10to21_ethnicity.Rdata")


# group 4

remand_count_11to21_outcome <- remand_outcome_10to16 %>%
  bind_rows(remand_outcome_15to21 %>%
              filter(!(end_period_year %in% c(2015,2016))))

save(remand_count_11to21_outcome, file = "Output/Data/Cleaned/remand_count_11to21_outcome.Rdata")


# # #supplementary data # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# -------There is also some info in the care data----------------------------------------------------------------------
# -------2021/22----------------------------------------------------------------------
# children-looked-after-in-england-including-adoptions_2022/la_cla_who_started_to_be_looked_after.csv
# this is numbers of kids who started to be looked after because they get a remand -
# so you need to figure out exactly what this means - are these remanded to custody only?
# are they only the kids that weren't already looked after when they got a remand?
# they have 2017/18 to 2021/22 - "Reporting year"
# National and regional figures have been rounded to the nearest 10.  Local authority figures are unrounded.

# remand_data <- read.csv("/Users/katehayes/temp_data/children-looked-after-in-england-including-adoptions_2022/data/la_cla_who_started_to_be_looked_after.csv")
#
# remand_data_s <- remand_data %>%
#   clean_remand_care(char = "Remand", time_slice = "started")
#
#
# # Local authority level data for children looked after on 31 March by legal basis
# # 2017/18 to 2021/22
# # 'Youth Justice legal statuses' refers to children: remanded to LA
# # accommodation or youth detention accommodation under the Legal Aid,
# # Sentencing and Punishment of Offenders Act 2012; placed in LA accommodation
# # under the Police and Criminal Evidence Act 1984; or, sentenced to a
# # youth rehabilitation order with residence or intensive fostering requirement
# # under the Criminal Justice and Immigration Act 2008 (as amended).
# # National and regional numbers have been rounded to the nearest 10
# # Where any number is shown as zero, the original figure submitted was zero
# # ‘c’ is used to protect confidentiality. Secondary suppression may have been applied
#
# # so this is much less specific to remand than the other two
# remand_data <- read.csv("/Users/katehayes/temp_data/children-looked-after-in-england-including-adoptions_2022/data/la_cla_on_31_march_by_characteristics.csv")
#
# remand_data <- remand_data %>%
#   clean_remand_care(char = "Youth justice legal statuses", time_slice = "on_31_march")
#
# # Local authority level data for children who ceased to be looked after during the year
# # 2017/18 to 2021/22
# # National and regional numbers have been rounded to the nearest 10
# remand_data <- read.csv("/Users/katehayes/temp_data/children-looked-after-in-england-including-adoptions_2022/data/la_children_who_ceased_during_year.csv")
#
# remand_data_c1 <- remand_data %>%
#   clean_remand_care(char = "Accommodation on remand ended", time_slice = "ceased")
#
# remand_data_c2 <- remand_data %>%
#   clean_remand_care(char = "Sentenced to custody", time_slice = "ceased")
#
# # -------grouping them and checking stuff----------------------------------------------------------------------
#
# remand_data <- bind_rows(remand_data_s, remand_data_c1, remand_data_c2)
#
# remand_data <- remand_data %>%
#   select(-slice) %>%
#   pivot_wider(names_from = reason, values_from = count) %>%
#   mutate(pc_to_custody = as.numeric(`Sentenced to custody`)/as.numeric(Remand)) %>%
#   mutate(pc_to_elsewhere = as.numeric(`Accommodation on remand ended`)/as.numeric(Remand)) %>%
#   mutate(check = pc_to_custody + pc_to_elsewhere)
#
# # -------2016/17----------------------------------------------------------------------
# # The next three sheets are from SFR50_2017_National_tables
# # all numbers have been rounded to the nearest 10
#
# # Table A1:  All children looked after at 31 March by legal status
# # Coverage: England, Years ending 31 March 2013 to 2017
#
# # Youth Justice legal statuses:
# # Figures from 2013 onwards include children remanded by the court under
# # Legal Aid, Sentencing and Punishment of Offenders Act (LASPO)
# # which came into force on 3 December 2012.
# # Includes children detained in local authority accommodation under
# # section 38(6) of the Police and Criminal Evidence Act 1984.
#
# # Detained for child protection is also a category but it doesnt have a note
#
# remand_data <- read_xlsx("/Users/katehayes/temp_data/SFR50_2017_National_tables.xlsx",
#                          sheet = 2, skip = 22, n_max = 61, col_names = TRUE)
#
# remand_data <- remand_data[60:61, 2:10] %>%
#   select(where(not_all_na)) %>%
#   mutate(`...2` = sub("7,8", "", `...2`))
#
# names( remand_data) <- c("legal_basis", 2013:2017)
#
# remand_data1 <- remand_data %>%
#   pivot_longer(!legal_basis, names_to = "year", values_to = "count",
#                names_transform = as.character, values_transform = as.numeric) %>%
#   mutate(group = "on_31_march", level = "england")
#
#
# # Table C1: Children who started to be looked after during the years ending 31 March
# # by legal status
# # Coverage: England, Years ending 31 March 2013 to 2017
#
# # Detained for child protection:
# # Includes police protection, emergency protection and child assessment orders.
# # Figures from 2013 onwards include children remanded by the court
# # under Legal Aid, Sentencing and Punishment of Offenders Act (LASPO)
# # which came into force on 3 December 2012.
#
# # Youth Justice legal statuses:
# # Includes children on remand or committed for trial, those detained in
# # local authority accommodation under section 38(6) of the Police
# # and Criminal Evidence Act 1984, and those under a supervision order.
#
#
#
# remand_data <- read_xlsx("/Users/katehayes/temp_data/SFR50_2017_National_tables.xlsx",
#                          sheet = 10, skip = 9, n_max = 67, col_names = TRUE)
#
#
# remand_data <- remand_data[65:66, 2:10] %>%
#   select(where(not_all_na)) %>%
#   mutate(`...2` = sub("7", "", `...2`)) %>%
#   mutate(`...2` = sub("8", "", `...2`))
#
# names(remand_data) <- c("legal_basis", 2013:2017)
#
# remand_data2 <- remand_data %>%
#   pivot_longer(!legal_basis, names_to = "year", values_to = "count",
#                names_transform = as.character, values_transform = as.numeric) %>%
#   mutate(group = "started", level = "england")
#
# # Table D1: Children who ceased to be looked after during the years ending 31 March by legal status
# # Coverage: England, Years ending 31 March 2013 to 2017
#
# # at some point might want to come back here -
# # theres a reason category that includes remand ended and sentenced to custody.
#
# # Detained for child protection:
# # Figures from 2013 onwards include children remanded by the court under
# # Legal Aid, Sentencing and Punishment of Offenders Act (LASPO) which came
# # into force on 3 December 2012.
#
# # Youth Justice legal statuses:
# # Includes children detained in local authority accommodation under
# # section 38(6) of the Police and Criminal Evidence Act 1984.
#
# remand_data <- read_xlsx("/Users/katehayes/temp_data/SFR50_2017_National_tables.xlsx",
#                          sheet = 12, skip = 10, n_max = 55, col_names = TRUE)
#
#
# remand_data <- remand_data[54:55, 2:10] %>%
#   select(where(not_all_na)) %>%
#   mutate(`...2` = sub("9", "", `...2`)) %>%
#   mutate(`...2` = sub("10", "", `...2`))
#
# names( remand_data) <- c("legal_basis", 2013:2017)
#
# remand_data3 <- remand_data %>%
#   pivot_longer(!legal_basis, names_to = "year", values_to = "count",
#                names_transform = as.character, values_transform = as.numeric) %>%
#   mutate(group = "ceased", level = "england")
#
# # -------adding together???? ----------------------------------------------------------------------
#
# remand_data <- bind_rows(remand_data1, remand_data2, remand_data3)
#
#
#
