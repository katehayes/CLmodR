
# March year end 2022
# relevant topics - age, gender, type of placement provider(including whether private),
# type of placement (ie youth accomodation etc), legal status (including justice system)

c_data <- read.csv("/Users/katehayes/temp_data/children-looked-after-in-england-including-adoptions_2022/data/la_cla_on_31_march_by_characteristics.csv")


# ‘c’ to protect confidentiality. Secondary suppression may have been applied
# not very specific. will replace with 3 as this is what's done the other years?
# ‘z’ for not applicable
# ‘x’ for not available

care_data_18to22 <- c_data %>%
  mutate(number = ifelse(number == "c", 3, number),
         number = ifelse(number %in% c("z", "x"), NA, number)) %>%
  filter((geographic_level == "Local authority" & la_name == "Birmingham") |
           (geographic_level == "Regional" & region_name == "West Midlands") |
           (geographic_level == "National" & country_name == "England")) %>%
  mutate(level = case_when(geographic_level == "Local authority" & la_name == "Birmingham" ~ "Birmingham",
                           geographic_level == "Regional" & region_name == "West Midlands" ~ "West Midlands (region)",
                           geographic_level == "National" & country_name == "England" ~ "England")) %>%
  rename(end_period_year = time_period,
         count = number) %>%
  select(end_period_year, level, cla_group, characteristic, count) %>%
  mutate(end_period_month = "March",
         period_length = "Day")




# EARLIER, 2017
# x is between 1 and 5 - will use midpoint ie 3
c_data <- read.csv("/Users/katehayes/temp_data/SFR50_2017_UnderlyingData/SFR50_CLA2017.csv")



care_data_17 <- c_data %>%
  mutate(across(c(CLA_Mar2017:CLA_RPC_OTHER), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2017) %>%
  select(-c(LA_order:geog_n))

care_data_17_marchvtotal <- care_data_17 %>%
  select(c(end_period_year, level, CLA_Mar2017:CLA_stp2017)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_17_gender <- care_data_17 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_17_age <- care_data_17 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_17_eth <- care_data_17 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_17_placement <- care_data_17 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_OthPl)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)


care_data_17_provider <- care_data_17 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

# EARLIER, 2016
# x is between 1 and 5 - will use midpoint ie 3
c_data <- read.csv("/Users/katehayes/temp_data/SFR41_2016_UD/SFR41_CLA2016.csv")

care_data_16 <- c_data %>%
  mutate(across(c(CLA_Mar2016:CLA_NetGain), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2016) %>%
  select(-c(New_geog_code:geog_n))

care_data_16_marchvtotal <- care_data_16 %>%
  select(c(end_period_year, level, CLA_Mar2016:CLA_stp2016)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_16_gender <- care_data_16 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_16_age <- care_data_16 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_16_eth <- care_data_16 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_16_placement <- care_data_16 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_Miss)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_16_provider <- care_data_16 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)



# EARLIER, 2015
# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).

c_data <- read.csv("/Users/katehayes/temp_data/SFR34_2015_UnderlyingData/SFR34_CLA2015.csv")
care_data_15 <- c_data %>%
  mutate(across(c(CLA_Mar2015:CLA_NetGain), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2015) %>%
  select(-c(New_geog_code:geog_n))

care_data_15_marchvtotal <- care_data_15 %>%
  select(c(end_period_year, level, CLA_Mar2015:CLA_stp2015)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_15_gender <- care_data_15 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_15_age <- care_data_15 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_15_eth <- care_data_15 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_15_placement <- care_data_15 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_OthPl)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)


care_data_15_provider <- care_data_15 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

# EARLIER, 2014
# UD_SFR36_2014/SFR36_CLA2014.csv
# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).
c_data <- read.csv("/Users/katehayes/temp_data/UD_SFR36_2014/SFR36_CLA2014.csv")

care_data_14 <- c_data %>%
  mutate(across(c(CLA_Mar2014:CLA_NetGain), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2014) %>%
  select(-c(New_geog_code:geog_n))

care_data_14_marchvtotal <- care_data_14 %>%
  select(c(end_period_year, level, CLA_Mar2014:CLA_stp2014)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_14_gender <- care_data_14 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_14_age <- care_data_14 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_14_eth <- care_data_14 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_14_placement <- care_data_14 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_OthPl)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_14_provider <- care_data_14 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)



# EARLIER, 2013
# SFR36_UnderlyingData/SFR36_CLA2013.csv
# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).
c_data <- read.csv("/Users/katehayes/temp_data/SFR36_UnderlyingData/SFR36_CLA2013.csv")

care_data_13 <- c_data %>%
  mutate(across(c(CLA_Mar2013:CLA_NetGain), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2013) %>%
  select(-c(New_geog_code:geog_n))

care_data_13_marchvtotal <- care_data_13 %>%
  select(c(end_period_year, level, CLA_Mar2013:CLA_stp2013)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_13_gender <- care_data_13 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_13_age <- care_data_13 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_13_eth <- care_data_13 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_13_placement <- care_data_13 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_OthPl)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_13_provider <- care_data_13 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

# EARLIER, 2012
# UnderlyingData/SFR20_CLA2012.csv
# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).
c_data <- read.csv("/Users/katehayes/temp_data/UnderlyingData/SFR20_CLA2012.csv")

care_data_12 <- c_data %>%
  mutate(across(c(CLA_Mar2012:CLA_NetGain), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2012) %>%
  select(-c(New_geog_code:geog_n))

care_data_12_marchvtotal <- care_data_12 %>%
  select(c(end_period_year, level, CLA_Mar2012:CLA_stp2012)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_12_gender <- care_data_12 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_12_age <- care_data_12 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_12_eth <- care_data_12 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_12_placement <- care_data_12 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_OthPl)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_12_provider <- care_data_12 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

# EARLIER, 2011
# underlying_20data_20sfr212011/SFR21_CLA.csv
# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).

c_data <- read.csv("/Users/katehayes/temp_data/underlying_20data_20sfr212011/SFR21_CLA.csv")

care_data_11 <- c_data %>%
  mutate(across(c(CLA_Mar2011:CLA_NetGain), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "REGION" & geog_n == "WEST MIDLANDS") |
           (geog_l == "NATIONAL" & geog_n == "ENGLAND")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "REGION" & geog_n == "WEST MIDLANDS" ~ "West Midlands (region)",
                           geog_l == "NATIONAL" & geog_n == "ENGLAND" ~ "England"),
         end_period_year = 2011) %>%
  select(-c(New_geog_code:geog_n))

care_data_11_marchvtotal <- care_data_11 %>%
  select(c(end_period_year, level, CLA_Mar2011:CLA_stp2011)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)

care_data_11_gender <- care_data_11 %>%
  select(c(end_period_year, level, CLA_male:CLA_female)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_11_age <- care_data_11 %>%
  select(c(end_period_year, level, CLA_U1:CLA_16over)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_11_eth <- care_data_11 %>%
  select(c(end_period_year, level, CLA_White:CLA_Oth)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_11_placement <- care_data_11 %>%
  select(c(end_period_year, level, CLA_Fost:CLA_OthPl)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

care_data_11_provider <- care_data_11 %>%
  select(c(end_period_year, level, CLA_OwnP:CLA_Nrep)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "characteristic", values_to = "count",
               values_transform = as.numeric)

# EARLIER, 2010
# sfr27-2010ud (1)/SFR27_2010_March.csv
# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).

c_data <- read.csv("/Users/katehayes/temp_data/sfr27-2010ud (1)/SFR27_2010_March.csv")

care_data_10 <- c_data %>%
  mutate(across(c(MarTotal_2010:MarPlace_Z1_2010), ~ifelse(.x == "x", 3, .x))) %>%
  filter((geog_l == "LA" & geog_n == "Birmingham") |
           (geog_l == "GOR" & geog_n == "West Midlands") |
           (geog_l == "National" & geog_n == "England")) %>%
  mutate(level = case_when(geog_l == "LA" & geog_n == "Birmingham" ~ "Birmingham",
                           geog_l == "GOR" & geog_n == "West Midlands" ~ "West Midlands (region)",
                           geog_l == "National" & geog_n == "England" ~ "England"),
         end_period_year = 2010)

care_data_10_march <- care_data_10 %>%
  select(c(end_period_year, level, MarTotal_2010)) %>%
  pivot_longer(-c(end_period_year, level),
               names_to = "measure", values_to = "count",
               values_transform = as.numeric) %>%
  filter(!grepl("stp", measure)) %>%
  mutate(end_period_month = "March",
         period_length = ifelse(grepl("Mar", measure), "Day", "Year")) %>%
  select(-measure)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together, # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


care_10to22 <- care_data_18to22 %>%
  filter(cla_group == "Age group", characteristic == "Total") %>%  #all the totals are equal except for LA of placement, so well just use age
  select(end_period_year, end_period_month, period_length, level, count) %>%
  mutate(count = as.numeric(count),) %>%
  bind_rows(care_data_17_marchvtotal) %>%
  bind_rows(care_data_16_marchvtotal) %>%
  bind_rows(care_data_15_marchvtotal) %>%
  bind_rows(care_data_14_marchvtotal) %>%
  bind_rows(care_data_13_marchvtotal) %>%
  bind_rows(care_data_12_marchvtotal) %>%
  bind_rows(care_data_11_marchvtotal) %>%
  bind_rows(care_data_10_march)

save(care_10to22, file = "Output/Data/Cleaned/care_10to22.Rdata")


care_11to22_placement <- care_data_18to22 %>%
  filter(cla_group == "Placement") %>%
  select(level, characteristic, count, end_period_year, end_period_month, period_length) %>%
  mutate(count = as.numeric(count)) %>%
  bind_rows(care_data_17_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  bind_rows(care_data_16_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  bind_rows(care_data_15_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  bind_rows(care_data_14_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  bind_rows(care_data_13_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  bind_rows(care_data_12_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  bind_rows(care_data_11_placement %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_Fost" ~ "Foster placements",
                characteristic == "CLA_Adopt" ~ "Placed for adoption ",
                characteristic == "CLA_Parent" ~ "Placed with parents or other person with parental responsibility",
                characteristic == "CLA_Ocom" ~ "Other placements in the community",
                characteristic == "CLA_Secure" ~ "Secure units, children's homes and semi-independent living accommodation",
                characteristic == "CLA_Ores" ~ "Other residential settings",
                characteristic == "CLA_RSch" ~ "Residential schools",
                characteristic == "CLA_OthPl" | characteristic == "CLA_Miss" ~ "Other placements"))) %>%
  filter(characteristic != "Total")  %>%
  rename(placement = characteristic) %>%
  mutate(end_period_month = "March",
         period_length = "Day") %>%
  group_by(level, end_period_year, end_period_month, period_length, placement) %>%
  summarise(count = sum(count)) %>%
  ungroup()

save(care_11to22_placement, file = "Output/Data/Cleaned/care_11to22_placement.Rdata")

care_11to22_gender <- care_data_18to22 %>%
  filter(cla_group == "Gender",
         characteristic != "Total") %>%
  select(level, characteristic, count, end_period_year, end_period_month, period_length) %>%
  mutate(count = as.numeric(count)) %>%
  bind_rows(care_data_17_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  bind_rows(care_data_16_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  bind_rows(care_data_15_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  bind_rows(care_data_14_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  bind_rows(care_data_13_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  bind_rows(care_data_12_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  bind_rows(care_data_11_gender %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_male" ~ "Male",
                characteristic == "CLA_female" ~ "Female"))) %>%
  rename(gender = characteristic) %>%
  mutate(gender = reconcile_gender(gender)) %>%
  mutate(end_period_month = "March",
         period_length = "Day")

save(care_11to22_gender, file = "Output/Data/Cleaned/care_11to22_gender.Rdata")


care_11to22_ethnicity <- care_data_18to22 %>%
  filter(cla_group == "Ethnicity",
         characteristic != "Total") %>%
  select(level, characteristic, count, end_period_year, end_period_month, period_length) %>%
  mutate(count = as.numeric(count)) %>%
  bind_rows(care_data_17_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  bind_rows(care_data_16_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  bind_rows(care_data_15_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  bind_rows(care_data_14_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  bind_rows(care_data_13_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  bind_rows(care_data_12_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  bind_rows(care_data_11_eth %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_White" ~ "White",
                characteristic == "CLA_Asian" ~ "Asian or Asian British",
                characteristic == "CLA_Black" ~ "Black, African, Caribbean or Black British",
                characteristic == "CLA_Mixed" ~ "Mixed or Multiple ethnic groups",
                characteristic == "CLA_EOTH" ~ "Other ethnic group",
                characteristic == "CLA_Oth" ~ "Refused or information not yet available"))) %>%
  rename(ethnicity = characteristic) %>%
  mutate(end_period_month = "March",
         period_length = "Day")

save(care_11to22_ethnicity, file = "Output/Data/Cleaned/care_11to22_ethnicity.Rdata")

care_11to22_age <- care_data_18to22 %>%
  filter(cla_group == "Age group",
         characteristic != "Total") %>%
  select(level, characteristic, count, end_period_year, end_period_month, period_length) %>%
  mutate(count = as.numeric(count)) %>%
  bind_rows(care_data_17_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  bind_rows(care_data_16_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  bind_rows(care_data_15_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  bind_rows(care_data_14_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  bind_rows(care_data_13_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  bind_rows(care_data_12_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  bind_rows(care_data_11_age %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_U1" ~ "Under 1 year",
                characteristic == "CLA_1to4" ~ "1 to 4 years",
                characteristic == "CLA_5to9" ~ "5 to 9 years",
                characteristic == "CLA_10to15" ~ "10 to 15 years",
                characteristic == "CLA_16over" ~ "16 years and over"))) %>%
  rename(age = characteristic) %>%
  mutate(end_period_month = "March",
         period_length = "Day") %>%
  mutate(age = reconcile_age(age))

save(care_11to22_age, file = "Output/Data/Cleaned/care_11to22_age.Rdata")

care_11to22_provider <- care_data_18to22 %>%
  filter(cla_group == "Place providers",
         characteristic != "Total") %>%
  select(level, characteristic, count, end_period_year, end_period_month, period_length) %>%
  mutate(count = as.numeric(count)) %>%
  bind_rows(care_data_17_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  bind_rows(care_data_16_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  bind_rows(care_data_15_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  bind_rows(care_data_14_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  bind_rows(care_data_13_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  bind_rows(care_data_12_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  bind_rows(care_data_11_provider %>%
              mutate(characteristic = case_when(
                characteristic == "CLA_OwnP" ~ "Own provision (by the LA)",
                characteristic == "CLA_OthLA" ~ "Other LA provision",
                characteristic == "CLA_OthPP" ~ "Other public provision (e.g. by a PCT etc)",
                characteristic == "CLA_Priv" ~ "Private provision",
                characteristic == "CLA_Vol" ~ "Voluntary/third sector provision",
                characteristic == "CLA_Par" ~ "Parents or other person with parental responsibility",
                characteristic == "CLA_Nrep" ~ "Placement provider not reported"))) %>%
  rename(provider = characteristic) %>%
  mutate(end_period_month = "March",
         period_length = "Day")


save(care_11to22_provider, file = "Output/Data/Cleaned/care_11to22_provider.Rdata")
