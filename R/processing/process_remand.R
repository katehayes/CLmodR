# loading in datasets made in the cleaning scripts
# No Birmingham breakdown for all of remand...

# Main dataset as has WM for more years (from 2012)
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/custody_avpop_10to21_legal_basis.Rdata")

# these only have breakdown to WM level in 2010 and not again after - WON"T USE MOST
 load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10to21_remandtype.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10to21_age.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10to21_gender.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10to21_ethnicity.Rdata")

# only england wales
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_11to21_outcome.Rdata")

# only have breakdown to WM level in 2010 and not again after
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10192021_type_age.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10192021_type_gender.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/remand_count_10192021_type_ethnicity.Rdata") <- WONT USE FOR NOW, BUT COME BACK IF TIME

# age breakdown of custodial remands, some years england/wales, one year wm
age_pc <- remand_count_10192021_type_age %>%
  filter(remand_type == "Custodial remands" | remand == "Remand to Youth Detention Accommodation") %>%
  group_by(level, end_period_year, end_period_month, period_length, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot))


# quick graph to check what assumptions i could maybe make
check_age_pc <- age_pc %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc, fill = age),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_age_pc
# looks like the one wm value isn't v different from the e/w values,
# and the e/w values are consistent over time
# the one thing is maybe wm has a higher percentage of 10-14 year olds?

# not sure if this is reasonable at all but lets use the wm value for 2010,
# and the ew values for 2019 and 20 (when you had each year from 15-17),
# and take the average percentage across three years and call this maybe a constant split??
age_pc <- age_pc %>%
  filter(level == "West Midlands (region)" |
           end_period_year %in% 2019:2020) %>%
  pivot_wider(names_from = age, values_from = pc) %>%
  summarise(`10-14` = mean(`10-14`),
            `15` = mean(`15`),
            `16` = mean(`16`),
            `17` = mean(`17`))



gender_pc <- remand_count_10192021_type_gender %>%
  filter(remand_type == "Custodial remands" | remand == "Remand to Youth Detention Accommodation") %>%
  group_by(level, end_period_year, end_period_month, period_length, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot))


check_gender_pc <- gender_pc %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc, fill = gender),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_gender_pc

# will do the same as above here - take 2010 wm and the rest of e/w and make a constant.
# will just drop unknown

gender_pc <- gender_pc %>%
  filter(level == "West Midlands (region)" |
           end_period_year %in% 2019:2021) %>%
  group_by(gender) %>%
  summarise(pc = mean(pc)) %>%
  pivot_wider(names_from = gender, values_from = pc)



level_pc <- custody_avpop_10to21_legal_basis %>%
  filter(legal_basis == "Remand") %>%
  select(-legal_basis) %>%
  filter(end_period_year %in% 2012:2021) %>%
  ungroup() %>%
  group_by(end_period_year) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot))

check_level_pc <- level_pc %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = level)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_level_pc

# west mids steadily growing as a pc of eng/wales
# so lets just apply 2012 values for everything - looks steady till 2014 anyway
level_pc <- level_pc %>%
  filter(end_period_year == 2012) %>%
  filter(level == "West Midlands (region)") %>%
  select(pc) %>%
  unlist()

# count_level_pc <- remand_count_10to21_remandtype %>%
#   filter(end_period_year == 2010,
#          remand_type == "Custodial remands") %>%
#   group_by(level, end_period_year) %>%
#   summarise(count = sum(count)) %>%
#   ungroup() %>%
#   group_by(end_period_year) %>%
#   mutate(tot = sum(count)) %>%
#   mutate(pc = count / tot) %>%
#   ungroup() %>%
#   select(-c(count, tot))



remand <- custody_avpop_10to21_legal_basis %>%
  filter(legal_basis == "Remand") %>%
  select(-legal_basis) %>%
  pivot_wider(names_from = level, values_from = count) %>%
  mutate(`West Midlands (region)` =
           ifelse(end_period_year %in% 2010:2011,
         `Eng/Wales` * level_pc,
         `West Midlands (region)`)) %>%
  pivot_longer(c(`West Midlands (region)`, `Eng/Wales`),
               names_to = "level", values_to = "count") %>%
  mutate(Boys = count * gender_pc$Boys,
         Girls = count * gender_pc$Girls) %>%
  select(-count) %>%
  pivot_longer(c(Boys, Girls),
               names_to = "gender", values_to = "count") %>%
  mutate(`10-14` = count * age_pc$`10-14`,
         `15` = count * age_pc$`15`,
         `16` = count * age_pc$`16`,
         `17` = count * age_pc$`17`) %>%
  select(-count) %>%
  pivot_longer(c(`10-14`, `15`, `16`, `17`),
               names_to = "age", values_to = "count")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # #PARAMETERS # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

params_rem_outcome <- remand_count_11to21_outcome %>%
  group_by(level, end_period_year, end_period_month, period_length, outcome) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot)) %>%
  pivot_wider(names_from = outcome, values_from = pc) %>%
  mutate(`Non-custodial sentence` =
           `Non-custodial sentence - community` + `Non-custodial sentence - other`) %>%  #collapsing bc the distinction doesnt matter/exist in the model
  select(-c(`Non-custodial sentence - community`, `Non-custodial sentence - other`)) %>%
  pivot_longer(c(Acquitted, `Immediate custody`, `Non-custodial sentence`),
               names_to = "name", values_to = "value") %>%
  mutate(meaning = case_when(name == "Acquitted" ~ "Percentage of custodial remands that result in acquittal",
                             name == "Immediate custody" ~ "Percentage of custodial remands that result in custodial sentences",
                             name == "Non-custodial sentence" ~ "Percentage of custodial remands that result in non-custodial sentences"),
         name = case_when(name == "Acquitted" ~ "r2acquit",
                          name == "Immediate custody" ~ "r2cust",
                          name == "Non-custodial sentence" ~ "r2nc_sent"))

save(params_rem_outcome, file = "Output/Data/Processed/params_rem_outcome.Rdata")




