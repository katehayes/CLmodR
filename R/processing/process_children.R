load("/Users/katehayes/CLmodR/output/data/cleaned/children_14to21_age_gen_eth.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/children_10to21_age.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/children_10to21_gender.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/children_10to21_ethnicity.Rdata")


children <- children_14to21_age_gen_eth %>% 
  filter(level == "Birmingham",
         end_period_year <= 2020,
         age != "Unknown",
         gender != "Unknown") %>% 
  group_by(end_period_year, gender, age) %>% 
  summarise(count = sum(count)) %>% 
  full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year >= 2014) %>% 
              mutate(age = ifelse(age >= 15, "15-17", "10-14")) %>% 
              group_by(end_period_year, gender, age) %>% 
              summarise(pop = sum(count))) %>% 
  mutate(rate = count / pop)


disposal_rate_age_gen <- children %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = rate, group = gender, colour = gender)) +
  facet_grid(~age)
disposal_rate_age_gen
ggsave(filename = "Output/Graphs/disposal_rate_age_gen.png", disposal_rate_age_gen)



child_age_10to13 <- children_10to21_age %>% 
  filter(level == "Birmingham") 
# god the age categories are really annoying earlier thatn 2014


  
child_gen_10to13 <- children_10to21_gender %>% 
    filter(level == "Birmingham",
           gender != "Unknown") %>% 
    group_by(end_period_year, gender) %>% 
    summarise(count = sum(count)) %>% 
    full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(16:17),
                     end_period_year >= 2010) %>% 
              select(c(end_period_year, gender, age, count)))





# we'll check the distribution of age groups across genders in the 14-21 set
# and then apply that to earlier years

# leaving out ethnicity for now
age_pc <- children_14to21_age_gen_eth %>%
  group_by(end_period_year, end_period_month, period_length, level, gender, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, end_period_month, period_length, level, gender) %>%
  mutate(tot = sum(count),
         pc = count / tot)


check_age_pc <- age_pc %>%
  filter(gender != "Unknown") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = age)) +
  facet_grid(~interaction(level, gender)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_age_pc

ggsave(filename = "Output/Graphs/assumption_checks/children_gender_age_pc.png", check_age_pc)
# i think maybe there are trends in brimingham towards younger people making up a higher pc?
# for girls & boys?
# so maybe we'll take the 2014 breakdown only & apply backwards

age_pc <- age_pc %>%
  bind_rows(age_pc %>%
              filter(end_period_year == 2014) %>%
              mutate(end_period_year = end_period_year - 1)) %>%
  bind_rows(age_pc %>%
              filter(end_period_year == 2014) %>%
              mutate(end_period_year = end_period_year - 2)) %>%
  bind_rows(age_pc %>%
              filter(end_period_year == 2014) %>%
              mutate(end_period_year = end_period_year - 3)) %>%
  bind_rows(age_pc %>%
              filter(end_period_year == 2014) %>%
              mutate(end_period_year = end_period_year - 4))


level_pc <- children_10to21_gender %>%
  filter(level != "Eng/Wales") %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(birm_pc = Birmingham / `West Midlands (region)`)


check_level_pc <- level_pc %>%
  filter(gender != "Unknown") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = birm_pc, colour = gender)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_level_pc

ggsave(filename = "Output/Graphs/assumption_checks/children_gender_birm_v_wm.png", check_level_pc)
# will take the 2011 pc

level_pc <- level_pc %>%
  ungroup() %>%
  filter(end_period_year == 2011) %>%
  select(gender, birm_pc) %>%
  pivot_wider(names_from = gender,
              values_from = birm_pc)



children <- children_10to21_gender %>%
  filter(level == "Birmingham") %>%
  bind_rows(children_10to21_gender %>%
              filter(level == "West Midlands (region)",
                     end_period_year == 2010) %>%
              mutate(count = ifelse(gender == "Boys", count * level_pc$Boys, count),
                     count = ifelse(gender == "Girls", count * level_pc$Girls, count),
                     count = ifelse(gender == "Unknown", count * level_pc$Unknown, count)) %>%
              mutate(level = "Birmingham")) %>%
  full_join(age_pc %>%
              filter(level == "Birmingham") %>%
              select(-c(count, tot))) %>%
  arrange(end_period_year) %>%
  mutate(count = count * pc) %>%
  select(-c(pc, level)) %>%
  filter(!is.na(age))

save(children, file = "Output/Data/Processed/children.Rdata")

load("/Users/katehayes/CLmodelR/Output/Data/Processed/children.Rdata")











check_children <- children %>%
  filter(gender != "Unknown") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, colour = age)) +
  facet_grid(~gender) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_children

ggsave(filename = "Output/Graphs/assumption_checks/estimated_children.png", check_children)


# COUPLE OF PROBLEMS WITH THIS - MAINLY FROM OVER-ASSIGNING FTE COUNTS TO GIRL GROUP I THINK
rep_offend <- children %>%
  group_by(end_period_year, gender) %>%
  summarise(children = sum(count)) %>%
  full_join(fte %>%
              filter(end_period_year != 2009) %>%
              group_by(end_period_year, gender) %>%
              summarise(fte = sum(count))) %>%
  mutate(repeat_offend = children - fte) %>%
  full_join(custodial_sentences %>%
              ungroup() %>%
              group_by(end_period_year, gender) %>%
              summarise(c_sent = sum(count))) %>%
  full_join(params_fte_custody %>%
              filter(measure == "pc_of_gender_group",
                     end_period_year != 2009) %>%
              select(-c(name, measure)) %>%
              rename(fte2c_sent_pc = value)) %>%
  mutate(fte2c_sent_count = fte * fte2c_sent_pc,
         rep2c_sent_count = c_sent - fte2c_sent_count,
         rep2c_sent_pc = rep2c_sent_count / repeat_offend)

# then this will be good once you've fixed the girl's fte's overestimation above.
params_rep_custody <- rep_offend %>%
  select(end_period_year, gender, rep2c_sent_pc) %>%
  filter(gender != "Unknown") %>%
  mutate(name = "rep2c_sent") %>%
  rename(value = rep2c_sent_pc)

save(params_rep_custody, file = "Output/Data/Processed/params_rep_custody.Rdata")
