load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/disposals_10to21.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/disposals_10to17_gender.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/disposals_10to17_age.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/disposals_10to17_ethnicity.Rdata")



# %>%
  # filter(level == "Birmingham") %>%
  # select(-level)


# just for convencience sake, will split disposals into custody, which we'll do at the disposal level
# & then we'll do one at the disposal type level, which does include custody too
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# JUST CUTODY # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# so to make custodial sentences - we'll extend birmingham back to 2010 by comparing it to wm
# then we'll have the right percentages for gender and age for the years we have them
# and the years we dont we'll just blanket apply the average percentages?
# then after we know the estimated numbers of each type of custodial disposal for gen/age for each year
# we can figure out what the mean time will be for each combo(?) of gender and year.


c_age_pc <- disposals_10to17_age %>%
  filter(disposal_type == "Custody") %>%
  select(-disposal_type) %>%
  mutate(disposal = aggregate_custody_disposals(disposal)) %>%
  group_by(end_period_year, end_period_month, period_length, level, disposal, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  mutate(disposal = ifelse(disposal == "Detention and Training Order", # sec 226/228 doesnt have enough people to make useful percentages
                           "Detention and Training Order", "Section 90-92 or 226-228")) %>% # additionally, its only those two groups that we have duration averages for anyway
  group_by(end_period_year, end_period_month, period_length, level, disposal, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level, disposal) %>%
  mutate(tot = sum(count),
         pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot)) %>%
  mutate(pc = ifelse(is.nan(pc), 0, pc)) %>%
  pivot_wider(names_from = age, values_from = pc,
              values_fill = 0) %>%
  filter(level == "Birmingham") %>%
  select(-level) %>%
  mutate(`17+` = `17+` + `17`) %>%
  select(-`17`) %>%
  pivot_longer(starts_with("1"),
               names_to = "age", values_to = "pc")


check_c_age_pc <- c_age_pc %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = age)) +
  facet_grid(~disposal) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_c_age_pc

ggsave(filename = "Output/Graphs/assumption_checks/custodial_sentence_age_pc.png", check_c_age_pc)
# basically you have older kids making up higher percentages of all types of custodial sentences
# and a relatively even higher percentage of the more serious cutodial sentences.
# kind of perhaps looks like for DTO, older students are making up increasing amounts over time?
# BUT i think its variable enough that maybe i should just just the average across all the years i have.

av_age_pc <- c_age_pc %>%
  group_by(disposal, age) %>%
  summarise(pc = mean(pc)) %>%
  ungroup() %>%
  pivot_wider(names_from = age, values_from = pc)

dto_age_pc <- av_age_pc %>%
  filter(disposal == "Detention and Training Order") %>%
  select(-disposal)

sec_age_pc <- av_age_pc %>%
  filter(disposal == "Section 90-92 or 226-228") %>%
  select(-disposal)


c_gender_pc <- disposals_10to17_gender %>%
  filter(disposal_type == "Custody") %>% # its really tiny - so im just going to leave it out when calculating the percentages for girls v boys
  filter(gender != "Unknown") %>%
  select(-disposal_type) %>%
  mutate(disposal = aggregate_custody_disposals(disposal)) %>%
  group_by(end_period_year, end_period_month, period_length, level, disposal, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  mutate(disposal = ifelse(disposal == "Detention and Training Order", # sec 226/228 doesnt have enough people to make useful percentages
                           "Detention and Training Order", "Section 90-92 or 226-228")) %>% # additionally, its only those two groups that we have duration averages for anyway
  group_by(end_period_year, end_period_month, period_length, level, disposal, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level, disposal) %>%
  mutate(tot = sum(count),
         pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot)) %>%
  mutate(pc = ifelse(is.nan(pc), 0, pc)) %>%
  filter(level == "Birmingham")


check_c_gender_pc <- c_gender_pc %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = gender)) +
  facet_grid(~disposal) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_c_gender_pc
# will do an average of the years available like before

ggsave(filename = "Output/Graphs/assumption_checks/custodial_sentence_gender_pc.png", check_c_gender_pc)

av_gender_pc <- c_gender_pc %>%
  group_by(disposal, gender) %>%
  summarise(pc = mean(pc)) %>%
  pivot_wider(names_from = gender,
              values_from = pc)

dto_gender_pc <- av_gender_pc %>%
 filter(disposal == "Detention and Training Order") %>%
  select(-disposal)

sec_gender_pc <- av_gender_pc %>%
  filter(disposal == "Section 90-92 or 226-228") %>%
  select(-disposal)


# come back here and join gender in the same way as age, not this horrible way here.
custodial_sentences <- disposals_10to17_gender %>%
  filter(disposal_type == "Custody",
         level == "Birmingham") %>%
  select(-c(disposal_type, level)) %>%
  filter(gender != "Unknown") %>% # its really tiny - so im just going to leave it out when calculating the percentages for girls v boys
  mutate(disposal = aggregate_custody_disposals(disposal)) %>%
  group_by(end_period_year, end_period_month, period_length, disposal, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  mutate(disposal = ifelse(disposal == "Detention and Training Order", # sec 226/228 doesnt have enough people to make useful percentages
                           "Detention and Training Order", "Section 90-92 or 226-228")) %>% # additionally, its only those two groups that we have duration averages for anyway
  group_by(end_period_year, end_period_month, period_length, disposal, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = gender,
              values_from = count,
              values_fill = 0) %>%
  bind_rows(disposals %>%
              filter(disposal_type == "Custody") %>%
              select(-disposal_type) %>%
              filter(!(end_period_year %in% 2011:2016)) %>%
              mutate(disposal = ifelse(disposal == "Detention and Training Order", # sec 226/228 doesnt have enough people to make useful percentages
                                       "Detention and Training Order", "Section 90-92 or 226-228")) %>% # additionally, its only those two groups that we have duration averages for anyway
              group_by(end_period_year, end_period_month, period_length, disposal) %>%
              summarise(count = sum(count))) %>%
  mutate(Boys = ifelse(is.na(Boys) & disposal ==  "Detention and Training Order", count * dto_gender_pc$Boys, Boys),
         Boys = ifelse(is.na(Boys) & disposal ==  "Section 90-92 or 226-228", count * sec_gender_pc$Boys, Boys),
         Girls = ifelse(is.na(Girls) & disposal ==  "Detention and Training Order", count * dto_gender_pc$Girls, Girls),
         Girls = ifelse(is.na(Girls) & disposal ==  "Section 90-92 or 226-228", count * sec_gender_pc$Girls, Girls)) %>%
  select(-count) %>%
  full_join(c_age_pc %>%
              pivot_wider(names_from = age, values_from = pc)) %>%
  mutate(`10-14` = ifelse(is.na(`10-14`) & disposal ==  "Detention and Training Order", dto_age_pc$`10-14`, `10-14`),
         `10-14` = ifelse(is.na(`10-14`) & disposal ==  "Section 90-92 or 226-228", sec_age_pc$`10-14`, `10-14`),
         `15` = ifelse(is.na(`15`) & disposal ==  "Detention and Training Order", dto_age_pc$`15`, `15`),
         `15` = ifelse(is.na(`15`) & disposal ==  "Section 90-92 or 226-228", sec_age_pc$`15`, `15`),
         `16` = ifelse(is.na(`16`) & disposal ==  "Detention and Training Order", dto_age_pc$`16`, `16`),
         `16` = ifelse(is.na(`16`) & disposal ==  "Section 90-92 or 226-228", sec_age_pc$`16`, `16`),
         `17+` = ifelse(is.na(`17+`) & disposal ==  "Detention and Training Order", dto_age_pc$`17+`, `17+`),
         `17+` = ifelse(is.na(`17+`) & disposal ==  "Section 90-92 or 226-228", sec_age_pc$`17+`, `17+`)) %>%
  pivot_longer(c(Girls, Boys),
               names_to = "gender", values_to = "count") %>%
  mutate(across(starts_with("1"), ~ .x * count)) %>%
  select(-count) %>%
  pivot_longer(c(starts_with("1")),
               names_to = "age", values_to = "count")

save(custodial_sentences, file = "Output/Data/Processed/custodial_sentences.Rdata")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ALL DISPOSALS # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MOVING ON TO TREATING TOTAL DISPOSALS - ONLY DOING THIS AT DISPOSAL TYPE LEVEL



age_pc <- disposals_10to17_age %>%
  group_by(end_period_year, end_period_month, period_length, level, disposal_type, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level, disposal_type) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot)) %>%
  mutate(age = ifelse(age == "17", "17+", age))


check_age_pc <- age_pc %>%
  filter(level %in% c("Birmingham", "Eng/Wales"),
         disposal_type != "Other") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = age)) +
  facet_grid(~interaction(level, disposal_type)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_age_pc

ggsave(filename = "Output/Graphs/assumption_checks/disposal_age_pc.png", check_age_pc)

av_age_pc <-  age_pc %>%
  filter(level %in% c("Birmingham", "Eng/Wales")) %>%
  group_by(level, disposal_type, age) %>%
  summarise(pc = mean(pc)) %>%
  ungroup()


age_pc <- age_pc %>%
  filter(level %in% c("Birmingham", "Eng/Wales")) %>%
  bind_rows(av_age_pc %>%
              mutate(end_period_year = 2018,
                     end_period_month = "Unknown",
                     period_length = "Year")) %>%
  bind_rows(av_age_pc %>%
              mutate(end_period_year = 2019,
                     end_period_month = "Unknown",
                     period_length = "Year")) %>%
  bind_rows(av_age_pc %>%
              mutate(end_period_year = 2020,
                     end_period_month = "Unknown",
                     period_length = "Year")) %>%
  bind_rows(av_age_pc %>%
              mutate(end_period_year = 2021,
                     end_period_month = "Unknown",
                     period_length = "Year")) %>%
  bind_rows(av_age_pc %>%
              filter(level == "Birmingham") %>%
              mutate(end_period_year = 2010,
                     end_period_month = "Unknown",
                     period_length = "Year")) %>%
  bind_rows(av_age_pc %>%
              filter(level == "Birmingham") %>%
              mutate(end_period_year = 2017,
                     end_period_month = "Unknown",
                     period_length = "Year"))



gender_pc <- disposals_10to17_gender %>%
  group_by(end_period_year, end_period_month, period_length, level, disposal_type, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level, disposal_type) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot))

check_gen_pc <- gender_pc %>%
  filter(level %in% c("Birmingham", "Eng/Wales"),
         disposal_type != "Other") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = gender)) +
  facet_grid(~interaction(level, disposal_type)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_gen_pc

ggsave(filename = "Output/Graphs/assumption_checks/disposal_gender_pc.png", check_gen_pc)
# seems like a more obvious trend? then the internal custody things - maybe we should use the 2017 value


gender_pc <- gender_pc %>%
  filter(level %in% c("Birmingham", "Eng/Wales")) %>%
  bind_rows(gender_pc %>%
              filter(level== "Birmingham",
                     end_period_year == 2011) %>%
              mutate(end_period_year = end_period_year - 1)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Birmingham",
                     end_period_year == 2016) %>%
              mutate(end_period_year = end_period_year + 1)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Birmingham",
                     end_period_year == 2016) %>%
              mutate(end_period_year = end_period_year + 2)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Birmingham",
                     end_period_year == 2016) %>%
              mutate(end_period_year = end_period_year + 3)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Birmingham",
                     end_period_year == 2016) %>%
              mutate(end_period_year = end_period_year + 4)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Birmingham",
                     end_period_year == 2016) %>%
              mutate(end_period_year = end_period_year + 5)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Eng/Wales",
                     end_period_year == 2017) %>%
              mutate(end_period_year = end_period_year + 1)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Eng/Wales",
                     end_period_year == 2017) %>%
              mutate(end_period_year = end_period_year + 2)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Eng/Wales",
                     end_period_year == 2017) %>%
              mutate(end_period_year = end_period_year + 3)) %>%
  bind_rows(gender_pc %>%
              filter(level== "Eng/Wales",
                     end_period_year == 2017) %>%
              mutate(end_period_year = end_period_year + 4)) %>%
  arrange(end_period_year)



level_pc <- disposals_10to21 %>%
  filter(level %in% c("West Midlands (region)", "Birmingham")) %>%
  pivot_wider(names_from = level, values_from = count) %>%
  mutate(birm_of_wm = Birmingham / `West Midlands (region)`,
         birm_of_wm = ifelse(is.nan(birm_of_wm), 0, birm_of_wm)) %>%
  filter(end_period_year == 2011) %>%
  select(-c(Birmingham,`West Midlands (region)`)) %>%
  mutate(end_period_year = end_period_year - 1) %>%
  full_join(disposals_10to21 %>%
              filter(end_period_year == 2010) %>%
              pivot_wider(names_from = level, values_from = count) %>%
              mutate(disposal = ifelse(disposal == "Section 90-92 Detention",
                                       "Section 90-91 Detention", disposal))) %>%
  mutate(Birmingham = `West Midlands (region)` * birm_of_wm) %>%
  select(-birm_of_wm) %>%
  pivot_longer(c(Birmingham, `West Midlands (region)`, `Eng/Wales`),
               names_to = "level", values_to = "count")

disposals <- disposals_10to21 %>%
  filter(end_period_year != 2010) %>%
  bind_rows(level_pc) %>%
  ungroup() %>%
  group_by(level, end_period_year, end_period_month, period_length, disposal_type) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  filter(level %in% c("Eng/Wales", "Birmingham")) %>% # choosing just these bc they're all i need for now
  full_join(age_pc) %>%
  filter(!is.na(count)) %>%
  mutate(count = count * pc) %>%
  select(-pc) %>%
  full_join(gender_pc %>%
              filter(level %in% c("Eng/Wales", "Birmingham"))) %>%
  mutate(count = count * pc) %>%
  select(-pc) %>%
  arrange(end_period_year, level, disposal_type, gender, age)

save(disposals, file = "Output/Data/Processed/disposals.Rdata")

