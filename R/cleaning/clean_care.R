
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


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# looking at starting residential placements # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# data below is from https://www.gov.uk/government/publications/why-do-children-go-into-childrens-homes/why-do-children-go-into-childrens-homes#appendix-2-supplementary-tables-and-data
# i just put it in my own excel sheet
# its a one-off study in 2019, but gives a little useful detail - would be better to have it at brim level for every child but... hey

c_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/entering_res_care.xls", sheet = 1)

pc_res_first <- c_data %>% 
  filter(`Number of places before admission` == 0) %>% 
  select(`% of children in homes 31/03/2019`) %>% 
  unlist()

c_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/entering_res_care.xls", sheet = 3)



age_placements <- c_data %>% 
  select(-All) %>% 
  rename(num_placements = `Number of placements`) %>% 
  filter(num_placements != "Total") %>% 
  pivot_longer(-num_placements,
               names_to = "age", values_to = "count") %>% 
  mutate(age = str_remove(age, "Age "),
         age = str_remove(age, " at entry")) %>% 
  group_by(age) %>% 
  mutate(pc = count / sum(count))

age_placements %>% 
  ggplot() +
  geom_bar(aes(x = num_placements, y = count), stat = "identity") +
  facet_wrap(~age, ncol = 1)

# 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement


c_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/entering_res_care.xls", sheet = 2)

rescare_age_at_entry_20 <- c_data %>% 
  select(-`% of sample`) %>% 
  rename(age = `Age of children`,
         pc = `% of children in homes 31/03/2020`) %>% 
  filter(age >= 10) %>% 
  mutate(`>10pc` = pc/sum(pc))

save(rescare_age_at_entry_20, file = "output/data/cleaned/rescare_age_at_entry_20.Rdata")


age_at_rescare_entry <- age_at_entry %>% 
  ggplot() +
  geom_bar(aes(x = age, y = pc), stat = "identity")
ggsave(filename = "output/graphs/age_at_rescare_entry.png", age_at_rescare_entry)

age_at_rescare_entry 

c_data <- read_xls("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/entering_res_care.xls", sheet = 4)

pc_origin <-  c_data %>% 
  mutate(Frequency = Frequency/107) %>%
  filter(`Event that led to the child living at the home` %in% c("Foster placement breakdown",
                                                                 "Family breakdown",
                                                                 "Children’s home placement breakdown",
                                                                 "Adoption breakdown",
                                                                 "Secure order had expired")) %>% 
  rename(origin = `Event that led to the child living at the home`)


pc_missing <- c_data %>% 
  mutate(Frequency = Frequency/107) %>% # this is the total children in the sample
  filter(`Event that led to the child living at the home` == "Going missing") %>% 
  pivot_wider(names_from = `Event that led to the child living at the home`,
              values_from = Frequency) %>% 
  unlist()

pc_cce <- c_data %>% 
  mutate(Frequency = Frequency/107) %>% # this is the total children in the sample
  filter(`Event that led to the child living at the home` == "Child criminal exploitation") %>% 
  pivot_wider(names_from = `Event that led to the child living at the home`,
              values_from = Frequency) %>% 
  unlist()




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# entering care, all types (not just residential) # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#

c_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/children-looked-after-in-england-including-adoptions_2022 (1)/data (1)/national_cla_ceased_during_year_placements_care_periods.csv")

first_placement_18to22 <- c_data %>% 
  filter(cla_group == "Number of placements",
         periods_or_placements %in% c("1", "Total")) %>% 
  select(time_period, periods_or_placements, age_on_ceasing, number) %>% 
  pivot_wider(names_from = periods_or_placements, values_from = number) %>% 
  filter(age_on_ceasing %in% c("10 to 15 years", "16 to 17 years", "18 years and over")) %>% 
  mutate(pc = as.numeric(`1`)/ as.numeric(Total))

first_placement_18to22 %>% 
  ggplot() +
  geom_bar(aes(x = time_period, y = pc), stat = "identity") +
  facet_grid(~age_on_ceasing)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# DURATION # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#

c_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/children-looked-after-in-england-including-adoptions_2022 (1)/data (1)/national_duration_of_placements_ceasing.csv")

c_duration_18to22 <- c_data %>% 
  filter(placement_duration %in% c("Median duration (days)", "Average duration (days)", "All placements")) %>% 
  select(time_period, placement_duration, placement_group, number) %>% 
  pivot_wider(names_from = placement_duration, values_from = number) %>% 
  rename(headcount = `All placements`,
         end_period_year = time_period) %>% 
  rename(mean = `Average duration (days)`,
         median = `Median duration (days)`) %>% 
  # pivot_longer(c(`Median duration (days)`, `Average duration (days)`),
  #              names_to = "measure", values_to = "duration") %>% 
  filter(placement_group != "All placements") %>% 
  mutate(residential =
           ifelse(placement_group %in% c("Secure units, children’s homes and semi-independent living accommodation",
                                         "Residential schools",
                                         "Other residential settings"),
                  "Residential",
                  "Not residential")) %>% 
  mutate(headcount = as.numeric(headcount),
         mean = as.numeric(mean)) %>% 
  mutate(count_times_av = headcount * mean) %>% 
  group_by(end_period_year, residential) %>% 
  summarise(mean_dur = sum(count_times_av)/sum(headcount))

c_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR50_2017_National_tables (1).xlsx", 
                    sheet = 8, skip = 9, n_max = 15)

c_duration_17 <- c_data %>% 
  rename(headcount = `...2`,
         placement_group = `...1`,
         mean = `...13`) %>% 
  select(placement_group, headcount, mean) %>% 
  filter(!is.na(headcount),
         placement_group != "All placements") %>% 
  mutate(residential = ifelse(placement_group %in% c("Secure units, children's homes and",
                                                     "Residential schools",
                                                     "Other residential settings"),
                              "Residential",
                              "Not residential")) %>%
  mutate(headcount = as.numeric(headcount),
         mean = as.numeric(mean)) %>% 
  mutate(count_times_av = headcount * mean) %>% 
  group_by(residential) %>% 
  summarise(mean_dur = sum(count_times_av)/sum(headcount)) %>% 
  mutate(end_period_year = 2017)

c_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR41_2016_National_Tables.xlsx",
                    sheet = 9, skip = 9, n_max = 15)


c_duration_16 <- c_data %>% 
  rename(headcount = `...2`,
         placement_group = `...1`,
         mean = `...13`) %>% 
  select(placement_group, headcount, mean) %>% 
  filter(!is.na(headcount),
         placement_group != "All placements") %>% 
  mutate(residential = ifelse(placement_group %in% c("Secure units, children's homes and",
                                                     "Residential schools",
                                                     "Other residential settings"),
                              "Residential",
                              "Not residential")) %>%
  mutate(headcount = as.numeric(headcount),
         mean = as.numeric(mean)) %>% 
  mutate(count_times_av = headcount * mean) %>% 
  group_by(residential) %>% 
  summarise(mean_dur = sum(count_times_av)/sum(headcount)) %>% 
  mutate(end_period_year = 2016)


c_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR34_2015_National_Tables.xlsx",
                    sheet = 9, skip = 9, n_max = 15)

c_duration_15 <- c_data %>% 
  rename(headcount = `...2`,
         placement_group = `...1`,
         mean = `...13`) %>% 
  select(placement_group, headcount, mean) %>% 
  filter(!is.na(headcount),
         placement_group != "All placements") %>% 
  mutate(residential = ifelse(placement_group %in% c("Secure units, children's homes",
                                                     "Residential schools",
                                                     "Other residential settings"),
                              "Residential",
                              "Not residential")) %>%
  mutate(headcount = as.numeric(headcount),
         mean = as.numeric(mean)) %>% 
  mutate(count_times_av = headcount * mean) %>% 
  group_by(residential) %>% 
  summarise(mean_dur = sum(count_times_av)/sum(headcount)) %>% 
  mutate(end_period_year = 2015)


c_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR36_2014_National_tables_revised.xlsx",
                    sheet = 13, skip = 9, n_max = 15)

c_duration_14 <- c_data %>% 
  rename(headcount = `...2`,
         placement_group = `...1`,
         mean = `...13`) %>% 
  select(placement_group, headcount, mean) %>% 
  filter(!is.na(headcount),
         placement_group != "All placements",
         placement_group != "Missing - Absent for more than") %>% 
  mutate(residential = ifelse(placement_group %in% c("Secure units, children's homes",
                                                     "Residential schools",
                                                     "Other residential settings"),
                              "Residential",
                              "Not residential")) %>%
  mutate(headcount = as.numeric(headcount),
         mean = as.numeric(mean)) %>% 
  mutate(count_times_av = headcount * mean) %>% 
  group_by(residential) %>% 
  summarise(mean_dur = sum(count_times_av)/sum(headcount)) %>% 
  mutate(end_period_year = 2014)


# c_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR36_2013_NationalTables.xlsx",
                    # sheet = ..) oh got its in a really annoying format...

care_duration_14to22 <- bind_rows(c_duration_18to22, c_duration_17,
                                  c_duration_16, c_duration_15,
                                  c_duration_14)

save(care_duration_14to22, file = "output/data/cleaned/care_duration_14to22.Rdata")

care_dur <- care_duration_14to22 %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = mean_dur), stat = "identity") +
  facet_grid(~residential)
ggsave(filename = "output/graphs/care_dur.png", care_dur)

care_dur

mod1 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
              filter(residential == "Residential"))
summary(mod1)

mod2 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Not residential"))
summary(mod2)

care_duration <- care_duration_14to22 %>% 
  ungroup() %>% 
  add_row(end_period_year = 2013, residential = "Residential", mean_dur = (6.328*2013)-12540.394) %>% 
  add_row(end_period_year = 2012, residential = "Residential", mean_dur = (6.328*2012)-12540.394) %>% 
  add_row(end_period_year = 2011, residential = "Residential", mean_dur = (6.328*2011)-12540.394) %>%
  add_row(end_period_year = 2010, residential = "Residential", mean_dur = (6.328*2010)-12540.394) %>% 
  add_row(end_period_year = 2013, residential = "Not residential", mean_dur = (7.929*2013)-15637.629) %>%
  add_row(end_period_year = 2012, residential = "Not residential", mean_dur = (7.929*2012)-15637.629) %>%
  add_row(end_period_year = 2011, residential = "Not residential", mean_dur = (7.929*2011)-15637.629) %>%
  add_row(end_period_year = 2010, residential = "Not residential", mean_dur = (7.929*2010)-15637.629) 


care_duration %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = mean_dur), stat = "identity") +
  facet_grid(~residential)





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# CARE AND OFFENDING DATA# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# this set of data, the 'convictions and health outcomes' data, i believe only goes to 2018 << I WAS WRONG
# i think now it goes back to 2015, which is good
# if you want more about convictions among CLA and even remand, i think you can look at reasons children started and then ceased

# Local authority level data for children looked after on 31 March for at least 12 months,
# by OC2 indicators. These are whether the child:
# was convicted or subject to youth cautions, or youth conditional cautions during the year


c_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/children-looked-after-in-england-including-adoptions_2022 (1)/data (1)/la_conviction_health_outcome_cla.csv")

careconv_18to22 <- c_data %>%
  filter(la_name == "Birmingham",
         cla_group == "Convictions: Children looked after Ages 10 to 17 years") %>% 
  select(time_period, characteristic, number) %>% 
  mutate(characteristic = ifelse(characteristic == "Total ages 10 to 17 years",
                                 "count_total", "count_convicted")) %>% 
  rename(end_period_year = time_period) %>% 
  pivot_wider(names_from = characteristic, values_from = number) %>% 
  mutate(age = "10-17",
         count_total = as.numeric(count_total))


# OC2_10to17: Children looked after at 31 March 2017 for at least 12 months aged 10 to 17 years
# OC2_convicted: Children looked after at 31 March 2017 convicted or subject to a final warning or reprimand during the year aged 10 to 17 years
c_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR50_2017_UnderlyingData (1)/SFR50_OC22017.csv")

careconv_17 <- c_data %>% 
  filter(geog_n == "Birmingham") %>% 
  select(c(OC2_10to17, OC2_convicted)) %>% 
  rename(count_total = OC2_10to17,
         count_convicted = OC2_convicted) %>% 
  mutate(age = "10-17",
         end_period_year = 2017) %>% 
  mutate(count_total = as.numeric(count_total))


# CLA_10over: Children looked after at 31 March 2016 for at least 12 months aged 10 years and over
# CLA_convicted: Children looked after at 31 March 2016 convicted or subject to a final warning or reprimand during the year
c_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR41_2016_UD (1)/SFR41_OC22016.csv")

careconv_16 <- c_data %>% 
  filter(geog_n == "Birmingham") %>% 
  select(c(CLA_10over, CLA_convicted)) %>% 
  rename(count_total = CLA_10over,
         count_convicted = CLA_convicted) %>% 
  mutate(age = "10-17",
         end_period_year = 2016) %>% 
  mutate(count_total = as.numeric(count_total))


# CLA_10over: Children looked after at 31 March 2015 for at least 12 months aged 10 years and over
# CLA_convicted: Children looked after at 31 March 2015 convicted or subject to a final warning or reprimand during the year
c_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR34_2015_UnderlyingData (1)/SFR34_OC22015.csv")

careconv_15 <- c_data %>% 
  filter(geog_n == "Birmingham") %>% 
  select(c(CLA_10over, CLA_convicted)) %>% 
  rename(count_total = CLA_10over,
         count_convicted = CLA_convicted) %>% 
  mutate(age = "10-17",
         end_period_year = 2015) %>% 
  mutate(count_total = as.numeric(count_total))


# difference between final warning/reprimand and a caution? if any?
care_convicted_15to22 <- bind_rows(careconv_18to22, careconv_17, careconv_16, careconv_15) %>% 
  mutate(count_convicted = as.numeric(count_convicted)) %>% 
  mutate(pc_convicted = count_convicted / count_total)

save(care_convicted_15to22, file = "output/data/cleaned/care_convicted_15to22.Rdata")

pc_care_convicted <- careconv_15to22 %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_convicted), stat = "identity")
ggsave(filename = "output/graphs/pc_care_convicted.png", pc_care_convicted)




