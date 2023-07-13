load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pop_estimate_01to20_age_gender.Rdata")

# kind of doing it like divide by 52 to get number turning 10 each week?
# everyone who was 9 when you saw them in june will turn 10 by the time you see them same day next year
# should we say this measure happens on like the 28th week and try to interpolate it??
# six months form week 28 is the 2nd week. Lets start 2nd week 2010...
age_in <- pop_estimate_01to20_age_gender %>%
  filter(age == 9, level == "Birmingham") %>%
  mutate(turn10_wkly = count / 52) %>%
  select(-c(age, count)) %>%
  filter(end_period_year >= 2009) %>%
  pivot_wider(names_from = gender, values_from = turn10_wkly) %>%
  mutate(week = (end_period_year - 2009)*52) %>%
  select(-c(end_period_year, end_period_month, level, period_length))

v_turn10 <- age_in %>%
  select(-week) %>%
  as.matrix()

t_turn10 <- age_in$week



age_out <- pop_estimate_01to20_age_gender %>%
  filter(age == 18, level == "Birmingham") %>% #or should this be 17..
  select(-age)

population <- pop_estimate_01to20_age_gender %>%
  filter(age %in% 10:17, level == "Birmingham")

pop_IC <- population %>%
  filter(end_period_year == 2010) %>%
  select(-c(level, end_period_month, period_length)) %>%
  # pivot_wider(names_from = gender, values_from = count)
  mutate(pov = 0.3)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # output # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

save(age_in, file = "Output/Data/Processed/age_in.Rdata")

save(age_out, file = "Output/Data/Processed/age_out.Rdata")

save(population, file = "Output/Data/Processed/population.Rdata")

save(v_turn10, file = "Output/Data/Input/v_turn10.Rdata")

save(t_turn10, file = "Output/Data/Input/t_turn10.Rdata")

# birm_relative_pop_data <- pop_data %>%
#   pivot_wider(names_from = level, values_from = count) %>%
#   mutate(birm_over_wmp = Birmingham/`West Midlands (police)`,
#          birm_over_wmr = Birmingham/`West Midlands (region)`,
#          birm_over_eng = Birmingham/England,
#          birm_over_ew = Birmingham/`Eng/Wales`)
#
# save(birm_relative_pop_data, file = "Output/Data/birm_relative_pop_data.Rda")
#
# sum_for_diagram <- birm_relative_pop_data %>%
#   ungroup() %>%
#   filter(age %in% 10:17) %>%
#   summarise(across(`Eng/Wales`:Birmingham, ~ sum(.x))) %>%
#   mutate(birm_over_wmp = Birmingham/`West Midlands (police)`,
#          birm_over_wmr = Birmingham/`West Midlands (region)`,
#          birm_over_eng = Birmingham/England,
#          birm_over_ew = Birmingham/`Eng/Wales`)
