load("/Users/katehayes/CLmodR/output/data/cleaned/poverty_06to12_15to21.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/poverty_15to21_workstatus_age.Rdata")

# poverty_06to12_15to21 - combines a point in time measure and a summary year measure
# the counts are all people between 0-20
# pretty poor/ imprecise for the model

poverty <- poverty_06to12_15to21 %>%
  filter(level != "Wales")


poverty_data <- pop_estimate_01to20_age_gender %>%
  filter(level == "Birmingham") %>%
  group_by(end_period_year) %>%
  summarise(pop = sum(count)) %>%
  full_join(poverty_06to12_15to21 %>%
              filter(level == "Birmingham") %>% 
              select(end_period_year, count) %>%
              rename(pov = count)) %>%
  ungroup() %>%
  mutate(pov_rate = pov / pop)




missing_pov <- poverty %>%
  filter(end_period_year %in% c(2012, 2015)) %>%
  select(end_period_year, level, count) %>%
  pivot_wider(names_from = end_period_year, values_from = count) %>%
  mutate(diff = `2015` - `2012`,
         increm = diff/3,
         `2013` = `2012` + increm,
         `2014` = `2013` + increm) %>%
  select(-c(diff, increm, `2012`, `2015`)) %>%
  pivot_longer(c(starts_with("20")),
               names_to = "end_period_year", values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year),
         end_period_month = "Unknown",
         period_length = "Year")

poverty <- poverty %>%
  bind_rows(missing_pov)

load("/Users/katehayes/CLmodR/output/data/cleaned/pop_estimate_01to20_age_gender.Rdata")

poverty_rate <- pop_estimate_01to20_age_gender %>%
  filter(level %in% c("Birmingham", "West Midlands (region)", "England")) %>%
  group_by(end_period_year, level) %>%
  summarise(pop = sum(count)) %>%
  full_join(poverty %>%
              select(end_period_year, level, count) %>%
              rename(pov = count)) %>%
  ungroup() %>%
  mutate(pov_rate = pov / pop)



smooth_poverty <- poverty_rate %>% 
  filter(level == "Birmingham",
         !is.na(pov_rate)) %>%
  arrange(end_period_year) %>% 
  mutate(spov_rate = smooth.spline(end_period_year, pov_rate)$y) %>% 
  select(-c(pov, pov_rate, level)) %>% 
  mutate(spov = pop*spov_rate) 



save(smooth_poverty, file = "output/data/processed/smooth_poverty.Rdata")


smooth_poverty_rate <- smooth_poverty %>% 
  arrange(end_period_year) %>% 
  mutate(excl_pc = spov_rate,
         incl_pc = 1-spov_rate) %>% 
  select(-c(spov_rate, spov)) %>% 
  mutate(excl_pop = excl_pc*pop,
         incl_pop = incl_pc*pop) %>% 
  # what if it was the new size with the old ratio
  mutate(if_excl = pop*lag(excl_pc),
         if_incl = pop*lag(incl_pc)) %>% 
  mutate(diff_excl = excl_pop - if_excl,
         diff_incl = incl_pop - if_incl) %>% 
  mutate(pc_of_excl = diff_excl/((excl_pop + lag(excl_pop))/2)) %>% 
  mutate(pc_of_incl = diff_incl/((incl_pop + lag(incl_pop))/2)) %>% 
  filter(end_period_year >= 2010) %>% 
  mutate(week = (end_period_year - 2010)*52) %>% 
  arrange(week) %>% 
  rename(rise = pc_of_excl, 
         fall = pc_of_incl) %>% 
  mutate(rise = ifelse(rise <0, -rise, 0)/52,
         fall = ifelse(fall <0, -fall, 0)/52)


# july_pov <- smooth_poverty_rate %>% 
#   arrange(week) %>% 
#   mutate(week2 = lag(week),
#          week2 = ifelse(week == 520, week, week2)) %>% 
#   filter(!is.na(week2)) %>% 
#   select(-week) %>% 
#   rename(week = week2)
  

july_pov <- smooth_poverty_rate %>% 
  arrange(week) %>% 
  mutate(rise = ifelse(week < 520, (rise + lead(rise))/2, rise),
         fall = ifelse(week < 520, (fall + lead(fall))/2, fall))

# 
# rise <- smooth_poverty_rate %>%
#   select(rise) %>% 
#   mutate(rise2 = rise) %>% 
#   as.matrix()
# 
# fall <- smooth_poverty_rate %>%
#   select(fall) %>% 
#   mutate(fall2 = fall) %>% 
#   as.matrix()
# 
# rf_t <- smooth_poverty_rate$week
# 
# save(rise, file = "output/data/input/rise.Rdata")
# save(fall, file = "output/data/input/fall.Rdata")
# save(rf_t, file = "output/data/input/rf_t.Rdata")
# 


rise <- july_pov %>%
  select(rise) %>% 
  mutate(rise2 = rise) %>% 
  as.matrix()

fall <- july_pov %>%
  select(fall) %>% 
  mutate(fall2 = fall) %>% 
  as.matrix()

rf_t <- july_pov$week

# save(rise, file = "/Users/katehayes/CLmodR/output/data/input/rise.Rdata")
# save(fall, file = "/Users/katehayes/CLmodR/output/data/input/fall.Rdata")
# save(rf_t, file = "/Users/katehayes/CLmodR/output/data/input/rf_t.Rdata")
# 



smooth_poverty_rate %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = excl_pc)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())




check <- poverty_rate %>% 
  filter(level == "Birmingham",
         !is.na(pov_rate)) %>%
  arrange(end_period_year) %>% 
  mutate(pov_rate_2 = smooth.spline(end_period_year, pov_rate)$y) %>%
  # mutate(pov_rate_2 = rollmean(rollmean(pov_rate, 3,  na.pad=TRUE, align="center"), 3,  na.pad=TRUE, align="center")) %>% 
  mutate(compare = "smooth") %>% 
  select(-pov_rate) %>% 
  bind_rows(poverty_rate %>% 
              filter(level == "Birmingham",
                     !is.na(pov_rate)) %>%
              arrange(end_period_year) %>% 
              rename(pov_rate_2 = pov_rate) %>% 
              mutate(compare = "data"))

check_pov_rate <- check %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pov_rate_2, colour = compare)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_pov_rate
# looks like the change of measure could easily be ruining everything but

# ggsave(filename = "output/graphs/assumption checks/check_pov_rate.png", check_pov_rate)



# SCENARIO SETTING
poverty_scenario <- pop_estimate_01to20_age_gender %>%
  group_by(end_period_year, level) %>%
  summarise(pop = sum(count)) %>%
  full_join(poverty %>%
              select(end_period_year, level, count) %>%
              rename(pov = count)) %>%
  ungroup() %>%
  mutate(pov_rate = pov / pop) %>% 
  filter(level == "Birmingham",
         end_period_year %in% c(2006:2020)) %>% 
  select(-level)

mod_pov <- lm(pov_rate ~ end_period_year, data = poverty_scenario %>%
            filter(end_period_year <= 2012))

poverty_scenario$pov_predict <- predict(mod_pov, newdata = poverty_scenario)

poverty_scenario <- poverty_scenario %>% 
  mutate(new_pov_rate = ifelse(end_period_year <= 2012, pov_rate, pov_predict)) %>% 
  mutate(new_pov_rate = smooth.spline(end_period_year, new_pov_rate)$y) 

poverty_scenario %>% 
  select(end_period_year, new_pov_rate) %>% 
  rename(pov_rate = new_pov_rate) %>% 
  mutate(scenario = "scenario") %>% 
  bind_rows(smooth_poverty_rate %>% 
              select(end_period_year, excl_pc) %>% 
              rename(pov_rate = excl_pc) %>% 
              mutate(scenario = "data")) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pov_rate, group = scenario, colour = scenario)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())


poverty_scenario <- poverty_scenario %>% 
  arrange(end_period_year) %>% 
  mutate(excl_pc = new_pov_rate,
         incl_pc = 1-new_pov_rate) %>% 
  select(-c(pov, pov_predict, pov_rate)) %>% 
  mutate(excl_pop = excl_pc*pop,
         incl_pop = incl_pc*pop) %>% 
  # what if it was the new size with the old ratio
  mutate(if_excl = pop*lag(excl_pc),
         if_incl = pop*lag(incl_pc)) %>% 
  mutate(diff_excl = excl_pop - if_excl,
         diff_incl = incl_pop - if_incl) %>% 
  mutate(pc_of_excl = diff_excl/((excl_pop + lag(excl_pop))/2)) %>% # getting the midpoint of the interval
  mutate(pc_of_incl = diff_incl/((incl_pop + lag(incl_pop))/2)) %>% # try this with other stuff too bc it seems nice here
  filter(end_period_year >= 2009) %>% 
  mutate(week = (end_period_year - 2010)*52) %>% 
  arrange(week) %>% 
  rename(rise = pc_of_excl, 
         fall = pc_of_incl) %>% 
  mutate(rise = ifelse(rise <0, -rise, 0)/52,
         fall = ifelse(fall <0, -fall, 0)/52)
  


rise_scenario <- poverty_scenario %>%
  filter(end_period_year >= 2010) %>% 
  select(rise) %>% 
  mutate(rise2 = rise) %>% 
  as.matrix()

fall_scenario <- poverty_scenario %>%
  filter(end_period_year >= 2010) %>% 
  select(fall) %>% 
  mutate(fall2 = fall) %>% 
  as.matrix()

rf_t_scenario <- poverty_scenario %>% 
  filter(end_period_year >= 2010)
rf_t_scenario <- rf_t_scenario$week

save(rise_scenario, file = "output/data/input/rise_scenario.Rdata")
save(fall_scenario, file = "output/data/input/fall_scenario.Rdata")
save(rf_t_scenario, file = "output/data/input/rf_t_scenario.Rdata")
