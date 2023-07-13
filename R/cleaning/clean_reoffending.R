# originally this was at the bottom of the FTE script
################################################################################################
########Chapter 9: Proven reoffending by children in England and Wales########################
# Reoffending is only ever at eng/wales level
# THEAGGREGATE ONE DOESNT SEEM TO GIVE ANYTHING THAT THE LATER ONES DONT
# we should really only keep number of reoffenders, number of reoffences, number of chilren in cohort.
# they cacolutate proportions and averages and stuff but i can do that later if i really want
# we can look at it by gender or offence or disposal or time to reoffence or number of previous offending


# Table 9.2: Proven reoffending data for children in England and Wales by sex,
# years ending March 2010 to 2020 and quarters for the year ending March 2020
reoffend_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 9 - Proven reoffending by children.xls",
                          sheet = 3, skip = 3, n_max = 13)

re_data <- reoffend_data

re_data_g <- re_data[9:13,] %>%
  mutate(gender = "Girls")

re_data_b <- re_data[2:6,] %>%
  mutate(gender = "Boys")

re_data <- rbind(re_data_g, re_data_b) %>%
  rename(measure = Sex) %>%
  filter(measure %in% c("Number of reoffences", "Number of reoffenders", "Number of children in cohort"))

re_y <- re_data %>%
  select(c(gender, measure, `Apr 2009-Mar 2010`:`Apr 2019-Mar 2020`)) %>%
  pivot_longer(!c(measure, gender),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(1\\)", "", end_period_year),
         end_period_year = as.numeric(substr(end_period_year, 14, 17)),
         end_period_month = "March",
         period_length = "Year")


reoffend_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 9 - Proven reoffending by children.xls",
                          sheet = 3, skip = 19, n_max = 13)

re_data_g <- reoffend_data[9:13,] %>%
  mutate(gender = "Girls")

re_data_b <- reoffend_data[2:6,] %>%
  mutate(gender = "Boys")

re_data <- rbind(re_data_g, re_data_b) %>%
  rename(measure = Sex) %>%
  filter(measure %in% c("Number of reoffences", "Number of reoffenders", "Number of children in cohort"))

re_m <- re_data %>%
  pivot_longer(!c(measure, gender),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_month = substr(end_period_year, 7, 9),
         end_period_year = as.numeric(substr(end_period_year, 11, 14)),
         period_length = "Quarter")


reoffending_10to20_gender <- bind_rows(re_y, re_m)


# Table 9.5: Proven reoffending data for children in England and Wales by
# index offence (based on new ONS crime classifications)(1), years ending
# March 2010 to 2020 and quarters for the year ending March 2020

# "*" = Proportions and averages based on less than 30 offenders are removed as they make data unreliable for interpretation
# ".." = Not applicable

r_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 9 - Proven reoffending by children.xls",
                          sheet = 6, skip = 3, n_max = 100)

re_data <- r_data %>%
  select(where(not_all_na)) %>%
  mutate(measure = `Index offence`) %>%
  mutate(measure = replace(measure, is.na(`Apr 2010-Mar 2011`), NA)) %>%
  rename(offence = `Index offence`) %>%
  mutate(offence = replace(offence, !is.na(`Apr 2010-Mar 2011`), NA))  %>%
  filter(if_any(everything(), ~ !is.na(.))) %>%
  mutate(offence = vec_fill_missing(offence, direction = c("down"))) %>%
  filter(if_any(!c(offence, `Apr 2009-Mar 2010`), ~ !is.na(.))) %>%
  select(-c(`Year ending March 2010 to March 2020`:`...17`)) %>%
  filter(measure %in% c("Number of reoffences", "Number of reoffenders", "Number of children in cohort"))

re_y <- re_data %>%
  select(c(offence, measure, `Apr 2009-Mar 2010`:`Apr 2019-Mar 2020`)) %>%
  pivot_longer(!c(measure, offence),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
         end_period_year = as.numeric(substr(end_period_year, 14, 17)),
         offence = sub("\\([0-9]\\)", "", offence),
         end_period_month = "March",
         period_length = "Year")


re_m <- re_data %>%
  select(c(offence, measure, `Apr - Jun 2019`:`Jan - Mar 2020`)) %>%
  pivot_longer(!c(measure, offence),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_month = substr(end_period_year, 7, 9),
         end_period_year = as.numeric(substr(end_period_year, 11, 14)),
         offence = sub("\\([0-9]\\)", "", offence),
         period_length = "Quarter")


# COME BACK TO THIS FUNCTION THAT YOU CANNOT GET RIGHT LOL
# check <- re_m %>%
#   mutate(end_period_month = full_month(end_period_month))


reoffending_10to20_offence <- bind_rows(re_y, re_m)







# Table 9.7: Proven reoffending data for children in England and Wales by index disposal(1),
# years ending March 2010 to 2020 and quarters for the year ending March 2020
reoffend_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 9 - Proven reoffending by children.xls",
                          sheet = 8, skip = 3, n_max = 118)

re_data <- reoffend_data %>%
  select(where(not_all_na)) %>%
  mutate(measure = `Index disposal`) %>%
  mutate(measure = replace(measure, is.na(`Apr 2010-Mar 2011`), NA)) %>%
  rename(disposal = `Index disposal`) %>%
  mutate(disposal= replace(disposal, !is.na(`Apr 2010-Mar 2011`), NA)) %>%
  filter(if_any(everything(), ~ !is.na(.))) %>%
  mutate(disposal = vec_fill_missing(disposal, direction = c("down"))) %>%
  filter(if_any(!c(disposal, `Apr 2009-Mar 2010`), ~ !is.na(.))) %>%
  select(-c(`Year ending March 2010 to March 2020`:`...17`)) %>%
  filter(measure %in% c("Number of reoffences", "Number of reoffenders", "Number of children in cohort"))



re_y <- re_data %>%
  select(c(disposal, measure, `Apr 2009-Mar 2010`:`Apr 2019-Mar 2020`)) %>%
  pivot_longer(!c(measure, disposal),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
         end_period_year = as.numeric(substr(end_period_year, 14, 17)),
         disposal = sub("\\([0-9]\\)", "", disposal),
         end_period_month = "March",
         period_length = "Year")


re_m <- re_data %>%
  select(c(disposal, measure, `Apr - Jun 2019`:`Jan - Mar 2020`)) %>%
  pivot_longer(!c(measure, disposal),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
          end_period_month = substr(end_period_year, 7, 9),
          end_period_year = as.numeric(substr(end_period_year, 11, 14)),
          disposal = sub("\\([0-9]\\)", "", disposal),
          period_length = "Quarter")


reoffending_10to20_disposal <- bind_rows(re_y, re_m)




# Table 9.9: Proven reoffending data for children in England and Wales by time
# to reoffence, years ending March 2010 to 2020 and quarters for the year ending March 2020

reoffend_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 9 - Proven reoffending by children.xls",
                          sheet = 10, skip = 3, n_max = 15)

re_data <- reoffend_data[3:14,] %>%
  select(where(not_all_na)) %>%
  select(-c(starts_with("Year ending"))) %>%
  rename(time_to_reoffence = `Time to reoffence(1)`)


re_y <- re_data %>%
  select(c(time_to_reoffence, `Apr 2009-Mar 2010`:`Apr 2019-Mar 2020`)) %>%
  pivot_longer(!time_to_reoffence,
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
         end_period_year = as.numeric(substr(end_period_year, 14, 17)),
         end_period_month = "March",
         period_length = "Year",
         measure = "Number of reoffences")


re_m <- re_data %>%
  select(c(time_to_reoffence, `Apr - Jun 2019`:`Jan - Mar 2020`)) %>%
  pivot_longer(!time_to_reoffence,
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
         end_period_month = substr(end_period_year, 7, 9),
         end_period_year = as.numeric(substr(end_period_year, 11, 14)),
         period_length = "Quarter",
         measure = "Number of reoffences")


reoffending_10to20_timetoreoffence <- bind_rows(re_y, re_m)
# this is reoffences not reoffenders.


# Table 9.6: Proven reoffending data for children in England and Wales by number
# of previous offences, years ending March 2010 to 2020 and quarters for the year ending March 2020

reoffend_data <- read_xls("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 9 - Proven reoffending by children.xls",
                          sheet = 7, skip = 3, n_max = 35)


re_data <- reoffend_data %>%
  select(where(not_all_na)) %>%
  mutate(measure = `Previous offences`) %>%
  mutate(measure = replace(measure, is.na(`Apr 2010-Mar 2011`), NA)) %>%
  rename(prev_offences = `Previous offences`) %>%
  mutate(prev_offences = replace(prev_offences, !is.na(`Apr 2010-Mar 2011`), NA)) %>%
  filter(if_any(everything(), ~ !is.na(.))) %>%
  select(-c(`Year ending March 2010 to March 2020`:`...17`)) %>%
  mutate(prev_offences = vec_fill_missing(prev_offences, direction = c("down"))) %>%
  filter(if_any(!c(prev_offences, `Apr 2009-Mar 2010`), ~ !is.na(.))) %>%
  filter(measure %in% c("Number of reoffences", "Number of reoffenders", "Number of children in cohort"))


re_y <- re_data %>%
  select(c(prev_offences, measure, `Apr 2009-Mar 2010`:`Apr 2019-Mar 2020`)) %>%
  pivot_longer(!c(prev_offences, measure),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
         end_period_year = as.numeric(substr(end_period_year, 14, 17)),
         end_period_month = "March",
         period_length = "Year")


re_m <- re_data %>%
  select(c(prev_offences, measure, `Apr - Jun 2019`:`Jan - Mar 2020`)) %>%
  pivot_longer(!c(prev_offences, measure),
               names_to = "end_period_year", values_to = "count",
               values_transform = as.numeric,
               names_transform = as.character) %>%
  mutate(end_period_year = sub("\\(2\\)", "", end_period_year),
         end_period_month = substr(end_period_year, 7, 9),
         end_period_year = as.numeric(substr(end_period_year, 11, 14)),
         period_length = "Quarter")


reoffending_10to20_prevoffences <- bind_rows(re_y, re_m)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# set one  (of one) - at england/wales level
save(reoffending_10to20_gender, file = "Output/Data/Cleaned/reoffending_10to20_gender.Rdata")

save(reoffending_10to20_offence, file = "Output/Data/Cleaned/reoffending_10to20_offence.Rdata")

save(reoffending_10to20_disposal, file = "Output/Data/Cleaned/reoffending_10to20_disposal.Rdata")

save(reoffending_10to20_timetoreoffence, file = "Output/Data/Cleaned/reoffending_10to20_timetoreoffence.Rdata")

save(reoffending_10to20_prevoffences, file = "Output/Data/Cleaned/reoffending_10to20_prevoffences.Rdata")


