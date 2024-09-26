
library(stringr)

d_data <- read_ods("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/Local_level_open_data_tables/Outcome_Table.ods")

disposals_22to23 <- d_data %>% 
  filter(
    # Financial_Year %in% c("2021-22", "2022-23"),
         YJS == "Birmingham",
         Caution_or_sentence_tier == "Custody") %>% 
  rename(legal_basis = Caution_or_sentence_type) %>% 
  mutate(end_period_year = as.numeric(paste("20", substr(Financial_Year, 6,7), sep = ""))) %>% 
  mutate(legal_basis = ifelse(legal_basis == "Detention And Training Order", 
                              "Detention and Training Order", legal_basis)) %>% 
  group_by(end_period_year, legal_basis) %>% 
  summarise(count = sum(Number_Cautioned_Sentenced)) 



  
  # %>% 
  # mutate(legal_basis = ifelse(Caution_or_sentence_type == "Detention And Training Order", 
  #                             "Detention and Training Order", "Section 250/254/259 or YOI")) %>% 

# setting disposal, group(characteristic),
group_types <- c("Age", "Gender", "Ethnicity", "Sex")
disposal_types <- c("Pre-court", "First-tier", "Community", "Custody")


# start of data
# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2009-2010
# Youth justice annual statistics: 2009 to 2010, Workload tables, Regional Tables
# Sheet R.1: Disposals given to young people, by region, 2009/10
# WEST MIDS LEVEL
# getting col names and setting disposal types & the disposals within them
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/New Tables for Website (1)/Regional tables.xls", sheet = 2, skip = 3, n_max = 1, col_names = TRUE)

col_names <- disposal_data %>%
  get_colname(dat_type = "disposal")

# start of data
# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2009-2010
# Youth justice annual statistics: 2009 to 2010, Workload tables, Regional Tables
# Sheet R.1: Disposals given to young people, by region, 2009/10

# ENG/wales
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/New Tables for Website (1)/Regional tables.xls", sheet = 2, skip = 7, n_max = 32, col_names = FALSE)

disposal0910ew_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2010,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Eng/Wales") %>%
  split_disposal_09to14(current_group_types = group_types)

# check <- disposal0910ew_data[[3]]


# WEST MIDS LEVEL
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/New Tables for Website (1)/Regional tables.xls", sheet = 2, skip = 340, n_max = 32, col_names = FALSE)

disposal0910wm_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2010,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "West Midlands (region)") %>%
  split_disposal_09to14(current_group_types = group_types)

# check <- disposal0910wm_data[[3]]




########################NEW YEAR ################################################
# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2010-2011
# Youth justice annual statistics: 2010 to 2011, Disposals, regionally, 2010 - 11

# ew
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/disposals-regionally-2010-11 (1).xls", sheet = 1, skip = 4, n_max = 32, col_names = FALSE)

disposal1011ew_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2011,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Eng/Wales") %>%
  split_disposal_09to14(current_group_types = group_types)



# sheet 10 - west midlands
# WEST MIDS LEVEL
# exact same strcuture as above so using the above code
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/disposals-regionally-2010-11 (1).xls", sheet = 10, skip = 4, n_max = 32, col_names = FALSE)

disposal1011wm_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2011,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "West Midlands (region)") %>%
  split_disposal_09to14(current_group_types = group_types)


# BIRMINGHAM LEVEL
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/disposals-regionally-2010-11 (1).xls", sheet = 10, skip = 42, n_max = 32, col_names = FALSE)

disposal1011b_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2011,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Birmingham") %>%
  split_disposal_09to14(current_group_types = group_types)


########################NEW YEAR 11/12################################################
#https://www.gov.uk/government/statistics/youth-justice-statistics-2011-12
# Youth justice annual statistics: 2011 to 2012,Youth justice statistics - regional data, Disposals by region 2011-12 v1.1


# eng/wales
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data-11-12 (1)/Disposals by region 2011-12 v1.1.xls", sheet = 1, skip = 4, n_max = 33, col_names = FALSE)

disposal_data[6,1] <- "First-tier"
disposal_data[16,1] <- "Community"

disposal1112ew_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2012,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Eng/Wales") %>%
  split_disposal_09to14(current_group_types = group_types)

# check <- disposal1112ew_data[[1]]

# sheet 10 - west midlands
# WEST MIDS LEVEL
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data-11-12 (1)/Disposals by region 2011-12 v1.1.xls", sheet = 10, skip = 4, n_max = 33, col_names = FALSE)

disposal1112wm_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2012,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "West Midlands (region)") %>%
  split_disposal_09to14(current_group_types = group_types)

# BIRMINGHAM LEVEL
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data-11-12 (1)/Disposals by region 2011-12 v1.1.xls", sheet = 10, skip = 43, n_max = 33, col_names = FALSE)

disposal1112b_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2012,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Birmingham") %>%
  split_disposal_09to14(current_group_types = group_types)

########################NEW YEAR 12/13################################################
# https://www.gov.uk/government/statistics/youth-justice-statistics
# Youth justice annual statistics: 2012 to 2013,YRegional tables - 2013, Disposals by region 2012-13 Table.xls


# eng/wales
disposal_data <- read_xls("/Users/katehayes/temp_data/regional-tables-2013/Disposals by region 2012-13 Table.xls", sheet = 1, skip = 4, n_max = 26, col_names = FALSE)

disposal1213ew_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2013,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Eng/Wales") %>%
  split_disposal_09to14(current_group_types = group_types)


# sheet 10 - west midlands
# WEST MIDS LEVEL
disposal_data <- read_xls("/Users/katehayes/temp_data/regional-tables-2013/Disposals by region 2012-13 Table.xls", sheet = 10, skip = 4, n_max = 26, col_names = FALSE)

disposal1213wm_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2013,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "West Midlands (region)") %>%
  split_disposal_09to14(current_group_types = group_types)


# BIRMINGHAM LEVEL
disposal_data <- read_xls("/Users/katehayes/temp_data/regional-tables-2013/Disposals by region 2012-13 Table.xls", sheet = 10, skip = 36, n_max = 26, col_names = FALSE)

disposal1213b_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2013,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Birmingham") %>%
  split_disposal_09to14(current_group_types = group_types)

########################NEW YEAR 13/14################################################
# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2013-to-2014
# Youth justice annual statistics: 2013 to 2014, Regional tables - 2013, Disposals by region table 2013-14.xls

# eng/wales
disposal_data <- read_xls("/Users/katehayes/temp_data/regional-tables 2/Disposals by region table 2013-14.xls", sheet = 1, skip = 4, n_max = 22, col_names = FALSE)

disposal1314ew_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2014,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Eng/Wales") %>%
  split_disposal_09to14(current_group_types = group_types)


# sheet 10 - west midlands
# WEST MIDS LEVEL
disposal_data <- read_xls("/Users/katehayes/temp_data/regional-tables 2/Disposals by region table 2013-14.xls", sheet = 10, skip = 4, n_max = 22, col_names = FALSE)

disposal1314wm_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2014,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "West Midlands (region)") %>%
  split_disposal_09to14(current_group_types = group_types)


# BIRMINGHAM LEVEL
disposal_data <- read_xls("/Users/katehayes/temp_data/regional-tables 2/Disposals by region table 2013-14.xls", sheet = 10, skip = 32, n_max = 22, col_names = FALSE)

disposal1314b_data <- disposal_data %>%
  clean_disposal_09to14(col_nm = col_names,
                        disp_type = disposal_types,
                        current_end_year = 2014,
                        current_end_month = "Unknown",
                        current_period_length = "Year",
                        current_level = "Birmingham") %>%
  split_disposal_09to14(current_group_types = group_types)



########################NEW YEAR 14/15################################################
# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2014-to-2015
# Youth justice annual statistics: 2014 to 2015, local level data, disposal by YOT
# ODD HIDDEN SHEETS STARTS HERE
# CHANGE OF CODE BC DIFFERENT FORMAT
# excel_sheets("/Users/katehayes/temp_data/local-level-data (1)/Disposal_by_YOT.xls")

# ew
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data (2)/Disposal_by_YOT.xls", sheet = 6, col_names = TRUE)

disposal1415ew_data <- disposal_data %>%
  clean_disposal_1415_ew() %>%
  split_disposal_14to16_ew()

check <- disposal1415ew_data[[1]][[2]]



disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data (2)/Disposal_by_YOT.xls", sheet = 6, col_names = TRUE)

disposal_data <- disposal_data %>% 
  filter(YOT == "Birmingham") %>% 
  ggplot() +
  geom_bar(aes(x = Ethn, fill = as.factor(Age2)),
           stat = "count", position = "dodge") 

check <- disposal_data %>% distinct(Outcome)

# +
  facet_grid(~Outcome) 

disposal_data 

disposal1415_data <- disposal_data %>%
  clean_disposal_1415() %>%
  split_disposal_14to16()

check <- disposal1415_data[[1]][[2]]




########################NEW YEAR ################################################
# https://www.gov.uk/government/statistics/youth-justice-statistics-2015-to-2016

# EW
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data-2015-to-2016 (1)/Disposals_by_YOT.xls", sheet = 6, col_names = TRUE)
# col names are not the same as previous year - they're being less careful bc they expect it to be hidden

disposal1516ew_data <- disposal_data %>%
  clean_disposal_1516_ew() %>%
  split_disposal_14to16_ew()

check <- disposal1516ew_data[[1]][[2]]



# excel_sheets("/Users/katehayes/temp_data/local-level-data-2015-to-2016/Disposals_by_YOT.xls")
disposal_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local-level-data-2015-to-2016 (1)/Disposals_by_YOT.xls", sheet = 6, col_names = TRUE)
# col names are not the same as previous year - they're being less careful bc they expect it to be hidden

disposal1516_data <- disposal_data %>%
  clean_disposal_1516() %>%
  split_disposal_14to16()

# check <- disposal1516_data[[2]][[1]]

########################NEW YEAR ################################################
# https://www.gov.uk/government/statistics/youth-justice-annual-statistics-2016-to-2017
# had to resave as an xlsx - originally xls?

#EW
disposal_data <- read_xlsx("/Users/katehayes/temp_data/regional-level-tables.xlsx", sheet = 7, col_names = TRUE)

disposal1617ew_data <- disposal_data %>%
  clean_and_split_disposal_1617_ew()

check <- disposal1617ew_data[[1]][[2]]





#   NO BIRMINGHAM LEVEL
# excel_sheets("/Users/katehayes/temp_data/regional-level-tables.xlsx")
# is in a weird format
disposal_data <- read_xlsx("/Users/katehayes/temp_data/regional-level-tables.xlsx",
                           sheet = 7, col_names = TRUE)


disposal1617_data <- disposal_data %>%
  clean_and_split_disposal_1617()


##########MOST RECENT ONE###############################################################
# note this data does not let you dis-ggregate disposals into sex gender or ethnicity

# ew
disposal_data <- read_ods("/Users/katehayes/temp_data/Outcome_table.ods", sheet = 3)

later_disposals_ew <- disposal_data %>%
  clean_disposal_13to21_ew()


# wm, birm
disposal_data <- read_ods("/Users/katehayes/temp_data/Outcome_table.ods", sheet = 3)

later_disposals <- disposal_data %>%
  clean_disposal_13to21()



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together, three different sets w different agregations, # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# one set w broken down again, split into the different charcteristics # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# first output - all years time, no characteristics, all available levels.

disposals_10to21 <- bind_rows(disposal0910wm_data[[2]], disposal1011wm_data[[2]]) %>%
  bind_rows(disposal1011b_data[[2]]) %>%
  bind_rows(disposal1112wm_data[[2]]) %>%
  bind_rows(disposal1112b_data[[2]]) %>%
  bind_rows(disposal1213wm_data[[2]]) %>%
  bind_rows(disposal1213b_data[[2]]) %>%
  bind_rows(disposal0910ew_data[[2]]) %>%
  bind_rows(disposal1011ew_data[[2]]) %>%
  bind_rows(disposal1112ew_data[[2]]) %>%
  bind_rows(disposal1213ew_data[[2]]) %>%
  group_by(end_period_year, end_period_month, period_length, level, disposal_type, disposal) %>%
  summarise(count = sum(count)) %>%
  bind_rows(later_disposals) %>%
  bind_rows(later_disposals_ew) %>%
  filter(level != "Wales") %>%
  assign_disp_cat()


save(disposals_10to21, file = "Output/Data/Cleaned/disposals_10to21.Rdata")

# there is an 'other' disposal category with no disposal type.....
# check <- disposals_10to21 %>%
#   filter(is.na(disposal_type))
# made the function assign disposal categories which assigns these to a new disposal type "Other"




# SECOND SET OF OUTPUT - CATEGORY BREAKDOWNS FOR THE YEARS THAT ITS POSSIBLE
# disposals_10to17_gender 
disposals <- bind_rows(disposal1011b_data[[2]], disposal1011wm_data[[2]]) %>%
  bind_rows(disposal1112wm_data[[2]]) %>%
  bind_rows(disposal1112b_data[[2]]) %>%
  # bind_rows(disposal1213wm_data[[2]]) %>%
  # bind_rows(disposal1213b_data[[2]]) %>%
  # bind_rows(disposal1314wm_data[[2]]) %>%
  # bind_rows(disposal1314b_data[[2]]) %>%
  bind_rows(disposal1415_data[[1]][[2]]) %>%
  bind_rows(disposal1415_data[[2]][[2]]) %>%
  bind_rows(disposal1516_data[[1]][[2]]) %>%
  bind_rows(disposal1516_data[[2]][[2]]) %>%
  # bind_rows(disposal1617_data[[2]]) %>%
  bind_rows(disposal0910ew_data[[2]]) %>%
  bind_rows(disposal1011ew_data[[2]]) %>%
  bind_rows(disposal1112ew_data[[2]]) %>%
  # bind_rows(disposal1213ew_data[[2]]) %>%
  # bind_rows(disposal1314ew_data[[2]]) %>%
  bind_rows(disposal1415ew_data[[1]][[2]]) %>%
  bind_rows(disposal1516ew_data[[1]][[2]]) %>%
  # bind_rows(disposal1617ew_data[[1]][[2]]) %>%
  filter(level != "Wales") %>%
  assign_disp_cat() %>%
  mutate(gender = reconcile_gender(gender)) %>% 
  distinct(disposal, disposal_type)


save(disposals_10to17_gender, file = "Output/Data/Cleaned/disposals_10to17_gender.Rdata")



disposals_10to17_age <- bind_rows(disposal0910wm_data[[1]], disposal1011wm_data[[1]]) %>%
  bind_rows(disposal1011b_data[[1]]) %>%
  bind_rows(disposal1112wm_data[[1]]) %>%
  bind_rows(disposal1112b_data[[1]]) %>%
  bind_rows(disposal1213wm_data[[1]]) %>%
  bind_rows(disposal1213b_data[[1]]) %>%
  bind_rows(disposal1314wm_data[[1]]) %>%
  bind_rows(disposal1314b_data[[1]]) %>%
  bind_rows(disposal1415_data[[1]][[1]]) %>%
  bind_rows(disposal1415_data[[2]][[1]]) %>%
  bind_rows(disposal1516_data[[1]][[1]]) %>%
  bind_rows(disposal1516_data[[2]][[1]]) %>%
  bind_rows(disposal1617_data[[1]]) %>%
  bind_rows(disposal0910ew_data[[1]]) %>%
  bind_rows(disposal1011ew_data[[1]]) %>%
  bind_rows(disposal1112ew_data[[1]]) %>%
  bind_rows(disposal1213ew_data[[1]]) %>%
  bind_rows(disposal1314ew_data[[1]]) %>%
  bind_rows(disposal1415ew_data[[1]][[1]]) %>%
  bind_rows(disposal1516ew_data[[1]][[1]]) %>%
  bind_rows(disposal1617ew_data[[1]][[1]]) %>%
  filter(level != "Wales") %>%
  assign_disp_cat() %>%
  mutate(age = reconcile_age(age))

# some years have 17, others have 17+ as the category
save(disposals_10to17_age, file = "Output/Data/Cleaned/disposals_10to17_age.Rdata")


disposals_10to17_ethnicity <- bind_rows(disposal0910wm_data[[3]], disposal1011wm_data[[3]]) %>%
  bind_rows(disposal1011b_data[[3]]) %>%
  bind_rows(disposal1112wm_data[[3]]) %>%
  bind_rows(disposal1112b_data[[3]]) %>%
  bind_rows(disposal1213wm_data[[3]]) %>%
  bind_rows(disposal1213b_data[[3]]) %>%
  bind_rows(disposal1314wm_data[[3]]) %>%
  bind_rows(disposal1314b_data[[3]]) %>%
  bind_rows(disposal1415_data[[1]][[3]]) %>%
  bind_rows(disposal1415_data[[2]][[3]]) %>%
  bind_rows(disposal1516_data[[1]][[3]]) %>%
  bind_rows(disposal1516_data[[2]][[3]]) %>%
  bind_rows(disposal1617_data[[3]]) %>%
  bind_rows(disposal0910ew_data[[3]]) %>%
  bind_rows(disposal1011ew_data[[3]]) %>%
  bind_rows(disposal1112ew_data[[3]]) %>%
  bind_rows(disposal1213ew_data[[3]]) %>%
  bind_rows(disposal1314ew_data[[3]]) %>%
  bind_rows(disposal1415ew_data[[1]][[3]]) %>%
  bind_rows(disposal1516ew_data[[1]][[3]]) %>%
  bind_rows(disposal1617ew_data[[1]][[3]]) %>%
  filter(level != "Wales") %>%
  assign_disp_cat()

# some ethnicity is "Not known" some is "Not Known"
save(disposals_10to17_ethnicity, file = "Output/Data/Cleaned/disposals_10to17_ethnicity.Rdata")


# NEED A THRID SET - need to clean the data different for that, so.

