missing_graph <- care_miss_10to22 %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure)

missing_graph
# something was going on with the data fro 2011 to 2016


missing2_graph <- care_miss_10to22 %>%
  filter(end_period_year >= 2015) %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity", position = "stack") +
  facet_grid(~measure)

missing2_graph


# the two years where we have some age data
missing_13to20_age %>%
  filter(end_period_month == "March" & period_length == "Year" &
           (end_period_year == 2017 | end_period_year == 2020)) %>%
  mutate(age = factor(age, levels = c("0-4", "5-8", "9-11", "0-11",
                                         "12-14", "15-17", "12-17"))) %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = age),
           stat = "identity", position = "fill") +
  facet_wrap(~end_period_year)

# check <- missing_13to20_age %>%
#   filter(end_period_month == "March" & period_length == "Year" &
#            end_period_year == 2017) %>%
#   ungroup() %>%
#   mutate(tot = sum(count),
#          age_pc = count/tot)

# 0.009278159 "0-4"
# 0.007051401 "5-8"
# 0.021339766 "9-11"
# 0.281128224 "12-14"
# 0.681202449 "15-17"

# check <- missing_13to20_age %>%
#   filter(end_period_month == "March" & period_length == "Year" &
#            end_period_year == 2020) %>%
#   ungroup() %>%
#   mutate(tot = sum(count),
#          age_pc = count/tot)

# 0.03014504 "0-11"
# 0.96985496 "12-17"

# for both years, 12-17 is about 96/97% of the total missing
# 9-11 is 2pc, so lets say extra 1.5 for 10 and 11 year olds. so thats say 98% in 10-17
# ugh i probably shouldnt do it like that... i should look at missing rates among each age group, compared to their populations..



# the one that has monthly
missing_wmp_monthly <- missing_13to20_age %>%
  filter(period_length == "Month") %>%
  mutate(end_period_month = factor(end_period_month, levels = c("January", "February", "March", "April",
                                      "May", "June", "July", "August", "September",
                                      "October", "November", "December"))) %>%
  ggplot() +
  geom_bar(aes(x = end_period_month, y = count),
           stat = "identity", position = "stack") +
  facet_wrap(~end_period_year) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
missing_wmp_monthly

ggsave(filename = "Output/Graphs/missing_wmp_monthly.png", missing_wmp_monthly)


check <- missing_wmp_monthly <- missing_13to20_age %>%
  filter(period_length == "Month") %>%
  ungroup() %>%
  group_by(end_period_year) %>%
  summarise(count = sum(count))
# 2018 - 4596, 2019 - 5423, 2020 - 8774



cmiss_rate %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_more_one),
           stat = "identity", position = "stack")
# ok around 60%

cmiss_rate %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = march_over_inc),
           stat = "identity", position = "stack")
# about 1%??
# check <- cmiss_rate %>%
#   ungroup() %>%
#   summarise(march_over_inc = mean(march_over_inc, na.rm = T))
# so 0.0111



cmiss_rate %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = av_inc_per_more_one),
           stat = "identity", position = "stack")

cmiss_rate %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = av_inc_per_child),
           stat = "identity", position = "stack")

cmiss_rate %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_missing),
           stat = "identity", position = "stack")
