load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/poverty_06to12_15to21.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/poverty_15to21_workstatus_age")

# poverty_06to12_15to21 - combines a point in time measure and a summary year measure
# the counts are all people between 0-20
# pretty poor/ imprecise for the model

poverty <- poverty_06to12_15to21 %>%
  filter(level != "Wales")

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

load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pop_estimate_01to20_age_gender.Rdata")

poverty_rate <- pop_estimate_01to20_age_gender %>%
  filter(level %in% c("Birmingham", "West Midlands (region)", "England")) %>%
  group_by(end_period_year, level) %>%
  summarise(pop = sum(count)) %>%
  full_join(poverty %>%
              select(end_period_year, level, count) %>%
              rename(pov = count)) %>%
  ungroup() %>%
  mutate(pov_rate = pov / pop)

check_pov_rate <- poverty_rate  %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pov_rate, colour = level)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_pov_rate
# looks like the change of measure could easily be ruining everything but

ggsave(filename = "Output/Graphs/assumption_checks/check_pov_rate.png", check_pov_rate)

params_impov <- poverty_rate %>%
  filter(level == "Birmingham") %>%
  arrange(end_period_year) %>%
  mutate(pov_change = lead(pov) - pov,
         pc_impov = pov_change / (pop - pov)) %>%  # this is in the form of - x pc of children in included will transition to excluded this year ie wil fall below poverty line
  select(end_period_year, level, pc_impov) %>%
  filter(!is.na(pc_impov)) %>%
  mutate(name = "impov",
         meaning = "(if pos) pc of included group that will transition to excluded (become impoverished) or (if neg) pc growth of included group as result of transitions from excluded group") %>%
  rename(value = pc_impov)

save(params_impov, file = "Output/Data/Cleaned/params_impov.Rdata")


check_impov_rate <- params_impov  %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = value)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_impov_rate
# doesnt look great.. but i guess it is vaguely like showing when the tories started, and when covid payments kicked int
ggsave(filename = "Output/Graphs/assumption_checks/check_impov_rate.png", check_impov_rate)

