
# loading in data made in the cleaning scripts
load("/Users/katehayes/CLmodR/output/data/cleaned/care_10to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_placement.Rdata")

# first we'll take all the supplementary data, make percentages, then add these back into the main dataset and multiply
placement_pc <- care_11to22_placement %>%
group_by(level, end_period_year, end_period_month, period_length, placement) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                        "Residential schools",
                                        "Other residential settings"),
                            "Residential",
                            "Not residential")) 
# %>%
  # filter(residential == "Residential") # if you stop here you can see the percentages of each residential category

# quick graph of the pc's to see about the assumption ill be making
check_placement_pc <- placement_pc %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = placement)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_placement_pc
# secure units & 'other residential settings' growing as a pc of total care placements, residential schools shrikning
# think its probably ok to just apply the same pcs to 2010 as you have in 2011

placement_pc <- placement_pc  %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(pc = sum(pc)) %>%
  pivot_wider(names_from = residential, values_from = pc)

# ok..... do I need to leave non-residential in there too? probably not. probably you just need the categories
# you're using plus their percentages.

age_pc <- care_11to22_age %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  filter(age %in% c("10-15", "16+")) %>%
  select(-c(count, tot)) %>%
  pivot_wider(names_from = age, values_from = pc)

gender_pc <- care_11to22_gender %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot)) %>%
  pivot_wider(names_from = gender, values_from = pc)

# OK MAYBE IT SHOULDNT ACTUALLY ALL COME IN TOGETHER - YOU CAN REVISIT THIS....
care_pc <- placement_pc %>%
  full_join(age_pc) %>%
  full_join(gender_pc)

care_pc_2010 <- care_pc %>%
  filter(end_period_year == 2011) %>%
  mutate(end_period_year = end_period_year - 1)

care_pc <- care_pc %>%
  bind_rows(care_pc_2010)

# ADD BACK TO MAIN TIME SERIES

care <- care_10to22 %>%
  filter(period_length == "Day") %>%
  full_join(care_pc) %>%
  mutate(count = count * Residential) %>%
  select(-Residential) %>%
  mutate(Girls = count * Girls,
         Boys = count * Boys) %>%
  select(-count) %>%
  pivot_longer(c(Boys, Girls),
               names_to = "gender", values_to = "count") %>%
  mutate(`10-15` = count * `10-15`,
         `16+` = count * `16+`) %>%
  select(-count) %>%
  pivot_longer(c(`10-15`, `16+`),
               names_to = "age", values_to = "count")

save(care, file = "Output/Data/Processed/care.Rdata")

# NUMBER FOR THE YEAR 2010 ARE ESTIMATES BASED ON THE VALUE OF THE TOTAL
# NUMBERS IN 2010 AND THE PROPORTION OF TOTAL THAT WAS RESIDENTIAL IN THE YEAR 2011
# assuming that the gender and age breakdowns can simply be put together and applied.


