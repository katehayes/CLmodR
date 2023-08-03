
# loading in data made in the cleaning scripts
load("/Users/katehayes/CLmodR/output/data/cleaned/care_10to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_placement.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_duration_14to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_convicted_15to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")


lac <- care_11to22_age %>%
  filter(level == "Birmingham",
         age %in% c("10-15", "16+"),
         end_period_year <= 2020) %>% 
  group_by(end_period_year) %>% 
  summarise(care = sum(count)) %>% 
  full_join(population %>% 
              filter(end_period_year >= 2010) %>% 
              group_by(end_period_year) %>% 
              summarise(population = sum(count))) %>% 
  mutate(lac_rate = care/population)

lac %>% 
  ggplot() +
    geom_bar(aes(x = end_period_year, y = lac_rate),
             stat = "identity", position = "stack")

care_11to22_age %>% 
  filter(level == "Birmingham") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = age),
           stat = "identity", position = "stack")


care_10to22 %>% 
  filter(level == "Birmingham") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = period_length),
           stat = "identity", position = "dodge")


# https://lginform.local.gov.uk/reports/lgastandard?mod-metric=891&mod-area=E08000025&mod-group=AllMetropolitanBoroughLaInCountry_England&mod-type=namedComparisonGroup&mod-period=15&mod-groupType=namedComparisonGroup
# https://www.basw.co.uk/system/files/resources/basw_82151-10_0.pdf <- comes from here
# number of children who were LAC on 31st March 2015 per 10,000 children aged 0-17, by deprivation decile, England sample
LAC_rate <- c(15/10000, 17/10000, 25/10000, 34/10000, 34/10000, 47/10000, 64/10000, 75/10000, 100/10000, 159/10000, 62/10000)

names(LAC_rate) <- c("IMD decile 10", "IMD decile 9", "IMD decile 8", 
                    "IMD decile 7", "IMD decile 6", "IMD decile 5", 
                    "IMD decile 4", "IMD decile 3", "IMD decile 2", 
                    "IMD decile 1", "English average")

LAC_rate <-stack(LAC_rate)

LAC_rate %>% 
ggplot() +
  geom_bar(aes(y = values, x = ind),
           stat = "identity")

# what combinations of LAC rates in poverty:not in birmingham across time adds up
# to the correct overall average LAC rate?

# over in process_poverty we said (lol) that in 2015 
# child poverty in england was 0.1447838 pc
# cp in birm was 0.2536112 pc


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# for care duration & in care conviction rates # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# making estimates of earlier years to fill back to 2010 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# p = i x d
# duration = prevalence(day count)/ incidence(per day - so years total div by 365)

check <- care_10to22 %>% 
  pivot_wider(names_from = period_length,
              values_from = count) %>% 
  mutate(duration = Day / (Year / 365))

check %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = duration, fill = level),
           stat = "identity", position = "dodge")
# looked at diff between duration in birm/wm/eng by doing the p=id calculation
# looks fine, birm higher by like 10 days usually, not too bad

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

save(care_duration, file = "output/data/processed/care_duration.Rdata")

care_duration %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = mean_dur, fill = residential),
           stat = "identity", position = "dodge")


care_convicted <- care_convicted_15to22 %>% 
  ungroup() %>% 
  select(end_period_year, pc_convicted) %>% 
  add_row(end_period_year = 2014, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2013, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2012, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2011, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2010, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) 

save(care_convicted, file = "output/data/processed/care_convicted.Rdata")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# below here is older # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

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
  full_join(care_pc %>% 
              select(-c(Boys, Girls, `10-15`, `16+`))) %>%
  mutate(Residential = count * Residential,
         `Not residential` = count * `Not residential`) %>% 
  filter(level == "Birmingham") %>% 
 select(-c(count, level)) %>% 
 full_join(population %>% 
             filter(end_period_year >= 2010) %>% 
             group_by(end_period_year) %>% 
             summarise(population = sum(count)))
 



# %>%
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


