# https://digital.nhs.uk/supplementary-information/2021/monthly-hospital-admissions-for-assault-by-sharp-object-august-2021
# Small numbers
# "In order to protect patient confidentiality '*' appears in the table above
# for all sub-national breakdowns, where it is possible to calculate a value
# between 1 and 7 from the data presented. All other sub-national data has
# been rounded to the nearest 5.
# If the national total is between 1 and 7 (inclusive), no sub-national
# breakdown will be displayed.
# If the national total is greater than or equal to 8;
# a. Sub-national counts between 1 and 7 (inclusive) will be displayed as ’*’.
# b. Zeroes will be unchanged.
# c. All other counts will be rounded to the nearest 5."

# this one is better actually
# https://digital.nhs.uk/supplementary-information/2022/hospital-admissions-for-assault-by-sharp-object-from-2012-13-to-march-2022


# COULD DO THE EXACT SAME FOR GENDER AND ETHNICITY SEPARATELY TOOO!!!!!


# so this sheet gives you region
i_data <- read_xlsx("/Users/katehayes/temp_data/Knife+Crime_GOR_LA_PFA_2122_provisional_full_year_Supressed+.xlsx",
                    sheet = 11, skip = 3, n_max = 2, col_names = F)

c_names <- paste(unlist(t(i_data[1,]) %>%
                          as.data.frame() %>%
                          mutate(V1 = vec_fill_missing(V1, direction = c("down")))), unlist(i_data[2,]), sep = "_")


i_data <- read_xlsx("/Users/katehayes/temp_data/Knife+Crime_GOR_LA_PFA_2122_provisional_full_year_Supressed+.xlsx",
                    sheet = 11, skip = 5, col_names = FALSE)

injury_data_r <- i_data %>%
  `colnames<-`(c_names) %>%
  as.data.frame() %>%
  rename(end_period_year = NA_Year,
         end_period_month = NA_Month,
         age = `NA_Age group`) %>%
  mutate(end_period_year = vec_fill_missing(end_period_year, direction = c("down")),
         end_period_month = vec_fill_missing(end_period_month, direction = c("down"))) %>%
  mutate(age = ifelse(age %in% c("Under 10", "0 to 9"), "0-9", age),
         age = ifelse(age == "10 to 19", "10-19", age),
         age = ifelse(age == "20 to 29","20-29", age)) %>%
  filter(age %in% c("0-9", "10-19", "20-29")) %>%
  select(end_period_year, age, end_period_month, `West Midlands_FAEs`, `West Midlands_FCEs`,
         England_FCEs, England_FAEs) %>%
  mutate(`West Midlands_FAEs` =  #suppressed 1-7: ill just replace all with 4, for now at least
           ifelse(`West Midlands_FAEs` == "*", 4, `West Midlands_FAEs`),
         `West Midlands_FCEs` =
           ifelse(`West Midlands_FCEs` == "*", 4, `West Midlands_FCEs`),
         England_FAEs =  #suppressed 1-7: ill just replace all with 4, for now at least
           ifelse(England_FAEs == "*", 4, England_FAEs),
         England_FCEs =
           ifelse(England_FCEs == "*", 4, England_FCEs)) %>%
  pivot_longer(!c(end_period_year, end_period_month, age),
               names_to = "level", values_to = "count") %>%
  mutate(measure = str_sub(level, start = -4)) %>%
  mutate(level = str_sub(level, end = -6)) %>%
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>%
  mutate(end_period_year = paste(str_sub(end_period_year, end = -6), str_sub(end_period_year, start = -2), sep = "")) %>%
  mutate(period_length = "Month")


# this sheet gives you local authority
i_data <- read_xlsx("/Users/katehayes/temp_data/Knife+Crime_GOR_LA_PFA_2122_provisional_full_year_Supressed+.xlsx",
                    sheet = 12, skip = 3, col_names = FALSE)

injury_data_la <- i_data %>%
  filter(!row_number() %in% c(3:420, 430:2188)) %>%
  select(-c(...1:...3)) %>%
  t() %>%
  as.data.frame() %>%
  select(V1:V5) %>%   #im just going to keep the 20-29 year olds for now bc its interesting
  mutate(V1 = vec_fill_missing(V1, direction = c("down"))) %>%
  rename(measure = V1,
         end_period_year = V2,
         `0-9` = V3,
         `10-19` = V4,
         `20-29` = V5) %>%
  filter(!row_number() == 1) %>%
  pivot_longer(!c(measure, end_period_year),
               names_to = "age",
               values_to = "count") %>%
  mutate(count = ifelse(count == "*", 4, count),
         count = ifelse(is.na(count), 0, count)) %>%
  mutate(level = "Birmingham") %>%
  mutate(end_period_year = paste(str_sub(end_period_year, end = -6), str_sub(end_period_year, start = -2), sep = "")) %>%
  mutate(period_length = "Year",
         end_period_month = "March")

# this sheet gives you police force
i2_data <- read_xlsx("/Users/katehayes/temp_data/Knife+Crime_GOR_LA_PFA_2122_provisional_full_year_Supressed+.xlsx",
                     sheet = 13, skip = 3, col_names = FALSE)

injury_data_p <- i2_data %>%
  filter(!row_number() %in% c(3:113, 123:352)) %>%
  select(-c(...1, ...2)) %>%
  t() %>%
  as.data.frame() %>%
  select(V1:V5) %>%   #im just going to keep the 20-29 year olds for now bc its interesting
  mutate(V1 = vec_fill_missing(V1, direction = c("down"))) %>%
  rename(measure = V1,
         end_period_year = V2,
         `0-9` = V3,
         `10-19` = V4,
         `20-29` = V5) %>%
  filter(!row_number() == 1) %>%
  pivot_longer(!c(measure, end_period_year),
               names_to = "age",
               values_to = "count") %>%
  mutate(count = ifelse(count == "*", 4, count),
         count = ifelse(is.na(count), 0, count)) %>%
  mutate(level = "West Midlands (police)") %>%
  mutate(end_period_year = paste(str_sub(end_period_year, end = -6), str_sub(end_period_year, start = -2), sep = "")) %>%
  mutate(end_period_month = "March",
         period_length = "Year")


# all together!
# note tht for england and west mids rehion we have monthly - the rest just yearly
injury_data <- injury_data_r %>%
  bind_rows(injury_data_la) %>%
  bind_rows(injury_data_p)


knife_injury_13to22_age <- injury_data %>%
  filter(age != "20-29")

save(knife_injury_13to22_age, file = "Output/Data/Cleaned/knife_injury_13to22_age.Rdata")
