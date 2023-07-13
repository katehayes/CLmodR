# *1 January 2021 to 7 April 2021
# https://foi.west-midlands.police.uk/strip-searches-492a-22/
https://foi.west-midlands.police.uk/wp-content/uploads/2022/04/438A_ATTACHMENT_01.pdf
# STRIP SEARCHES IN CUSTODY


ss_data <- read_xlsx("/Users/katehayes/temp_data/492A_22-attachment.xlsx",
                          sheet = 2, skip = 8, n_max = 4, col_names = TRUE)

ssf_data <- ss_data %>%
  select(c(`...1`, `2019...2`:`2021*...4`)) %>%
  rename(age = `...1`) %>%
  pivot_longer(!age,
               names_to = "end_period_year",
               values_to = "count") %>%
  mutate(end_period_year = str_sub(end_period_year, 1, 4)) %>%
  mutate(outcome = "Item found")

ssnf_data <- ss_data %>%
  select(c(`...1`, `2019...6`:`2021*...8`)) %>%
  rename(age = `...1`) %>%
  pivot_longer(!age,
               names_to = "end_period_year",
               values_to = "count") %>%
  mutate(end_period_year = str_sub(end_period_year, 1, 4)) %>%
  mutate(outcome = "Item not found")

ss_data <- bind_rows(ssf_data, ssnf_data) %>%
  mutate(period_length = ifelse(end_period_year == "2021", "Quarter", "Year"),
         end_period_month = ifelse(end_period_year == "2021", "April", "December"),
         level = "West Midlands (police)")

# NEW FOI
# https://foi.west-midlands.police.uk/strip-searches-246a-22/
# Strip Searches following a Stop and Search
246A_22_attachment.xlsx

602A_Attachment.xlsx <- THIS ONE LOOKS GOOD



custody_strip_search_19to21_outcome_age <- ss_data %>%
  filter(age != "18+")

save(custody_strip_search_19to21_outcome_age, file = "Output/Data/Cleaned/custody_strip_search_19to21_outcome_age.Rdata")
