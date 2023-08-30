load("/Users/katehayes/CLmodR/output/data/cleaned/pop_estimate_01to20_age_gender.Rdata")

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



age_in <- pop_estimate_01to20_age_gender %>%
  filter(age == 10, level == "Birmingham")  %>% 
  # select(c(end_period_year, gender, count))  %>% 
  # pivot_wider(names_from = gender, values_from = count) %>% 
  # mutate(diff_boy = lead(Boys) - Boys,
  #        diff_girl = lead(Girls) - Girls) %>%
  mutate(turn10_wkly = count / 52) %>%
  select(-c(count, age)) %>%
  filter(end_period_year >= 2011) %>%
  pivot_wider(names_from = gender, values_from = turn10_wkly) %>%
  mutate(week = (end_period_year - 2011)*52) %>%
  select(-c(end_period_year, end_period_month, level, period_length)) %>% 
  add_row(Boys = 157, Girls = 143, week = 520) %>%
  add_row(Boys = 157, Girls = 143, week = 572)

v2_turn10 <- age_in2 %>%
  select(-week) %>%
  as.matrix()

v_turn10 <- age_in %>%
  select(-week) %>%
  as.matrix()

t_turn10 <- age_in$week


age_in_pov <- pop_estimate_01to20_age_gender %>%
  filter(age == 9, level == "Birmingham") %>%
  mutate(turn10_wkly = count / 52) %>%
  select(-c(age, count)) %>%
  filter(end_period_year >= 2009) %>%
  pivot_wider(names_from = gender, values_from = turn10_wkly) %>%
  left_join(smooth_poverty %>% 
              select(c(end_period_year, spov_rate))) %>% 
  mutate(boys_incl = Boys*(1-spov_rate),
         girls_incl = Girls*(1-spov_rate),
         boys_excl = Boys*spov_rate,
         girls_excl = Girls*spov_rate) %>% 
  mutate(week = (end_period_year - 2009)*52) %>%
  select(c(week, boys_incl, girls_incl, boys_excl, girls_excl)) %>% 
  arrange(week)

v_turn10_i <- age_in_pov %>%
  select(c(boys_incl, girls_incl)) %>%
  as.matrix()
v_turn10_e <- age_in_pov %>%
  select(c(boys_excl, girls_excl)) %>%
  as.matrix()


age_out <- pop_estimate_01to20_age_gender %>%
  filter(age == 18, level == "Birmingham") %>% #or should this be 17..
  select(-age)

population <- pop_estimate_01to20_age_gender %>%
  filter(age %in% 10:17, level == "Birmingham") %>% 
  mutate(end_period_year = as.numeric(end_period_year))

pop_IC <- population %>%
  filter(end_period_year == 2010) %>%
  select(-c(level, end_period_month, period_length)) %>%
  # pivot_wider(names_from = gender, values_from = count)
  mutate(pov = 0.3)



pop_estimate_01to20_age_gender %>%
  filter(age %in% 9:10, level == "Birmingham") %>% 
  mutate(end_period_year = as.numeric(end_period_year)) %>% 
  filter(end_period_year >= 2010) %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, age, gender, count) %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = as.character(age), color = as.character(age))) +
  facet_wrap(~gender)





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # output # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

save(age_in, file = "Output/Data/Processed/age_in.Rdata")

save(age_out, file = "Output/Data/Processed/age_out.Rdata")

save(population, file = "output/data/processed/population.Rdata")

save(v_turn10, file = "Output/Data/Input/v_turn10.Rdata")

save(t_turn10, file = "Output/Data/Input/t_turn10.Rdata")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # POVERTY STEADY FALL SCENARIO # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


age_in_pov_scenario <- pop_estimate_01to20_age_gender %>%
  filter(age == 9, level == "Birmingham") %>%
  mutate(turn10_wkly = count / 52) %>%
  select(-c(age, count)) %>%
  filter(end_period_year >= 2009) %>%
  pivot_wider(names_from = gender, values_from = turn10_wkly) %>%
  left_join(poverty_scenario %>% 
              select(c(end_period_year, new_pov_rate))) %>% 
  mutate(boys_incl = Boys*(1-new_pov_rate),
         girls_incl = Girls*(1-new_pov_rate),
         boys_excl = Boys*new_pov_rate,
         girls_excl = Girls*new_pov_rate) %>% 
  mutate(week = (end_period_year - 2009)*52) %>%
  select(c(week, boys_incl, girls_incl, boys_excl, girls_excl)) %>% 
  arrange(week)

v_turn10_i_scenario <- age_in_pov %>%
  select(c(boys_incl, girls_incl)) %>%
  as.matrix()
v_turn10_e_scenario <- age_in_pov %>%
  select(c(boys_excl, girls_excl)) %>%
  as.matrix()

save(v_turn10_i_scenario, file = "output/data/input/v_turn10_i_scenario.Rdata")
save(v_turn10_e_scenario, file = "output/data/input/v_turn10_e_scenario.Rdata")
