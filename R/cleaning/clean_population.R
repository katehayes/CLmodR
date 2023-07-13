# https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland
# MYEB1_detailed_population_estimates_series_UK_(2020_geog20).csv
# the above, from the national statistics people. seems fine.
# mid-2000-unformatted-data-file.xls and then this for the final year, 2000

# NEED TO GET AN ETHNICITY BREAKDOWN FOR THIS

p_data <- read.csv("/Users/katehayes/temp_data/ukdetailedtimeseries2001to2020/MYEB1_detailed_population_estimates_series_UK_(2020_geog20).csv")


pop_data <- p_data %>%
  select(-X) %>%
  filter(age %in% 0:20) %>%
  pivot_longer(population_2001:population_2020,
               names_to = "end_period_year", values_to = "count") %>%
  mutate(end_period_year = str_sub(end_period_year, start = -4))

pop_birm <- pop_data %>%
  filter(laname20 == "Birmingham") %>%
  group_by(end_period_year, age, sex) %>%
  summarise(count = sum(count)) %>%
  mutate(level = "Birmingham")

pop_wmp <- pop_data %>%
  filter(laname20 %in% c("Birmingham", "Coventry", "Dudley",
                         "Sandwell", "Solihull", "Walsall", "Wolverhampton")) %>%
  group_by(end_period_year, age, sex) %>%
  summarise(count = sum(count)) %>%
  mutate(level = "West Midlands (police)")

pop_wmr <- pop_data %>%
  filter(laname20 %in% c("Birmingham", "Coventry", "Dudley", "Herefordshire",
                         "Sandwell", "Shropshire", "Solihull", "Staffordshire",
                         "Stoke-on-Trent", "Telford and Wrekin", "Walsall",
                         "Warwickshire", "Wolverhampton", "Worcestershire")) %>%
  group_by(end_period_year, age, sex) %>%
  summarise(count = sum(count)) %>%
  mutate(level = "West Midlands (region)")


pop_eng <- pop_data %>%
  filter(country == "E") %>%
  group_by(end_period_year, age, sex) %>%
  summarise(count = sum(count)) %>%
  mutate(level = "England")


pop_estimate_01to20_age_gender <- pop_data %>%
  filter(country %in% c("E", "W")) %>%
  group_by(end_period_year, age, sex) %>%
  summarise(count = sum(count)) %>%
  mutate(level = "Eng/Wales") %>%
  bind_rows(pop_eng) %>%
  bind_rows(pop_wmr) %>%
  bind_rows(pop_wmp) %>%
  bind_rows(pop_birm) %>%
  rename(gender = sex) %>%
  mutate(gender = case_when(gender == 1 ~ "Boys",
                         gender == 2 ~ "Girls"),
         end_period_month = "June",
         period_length = "Day",
         end_period_year = as.numeric(end_period_year)) %>%
  ungroup()

# ages 0-20, split by sex, 2001-2020 (try add more years)


save(pop_estimate_01to20_age_gender, file = "Output/Data/Cleaned/pop_estimate_01to20_age_gender.Rdata")

