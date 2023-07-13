load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/reoffending_10to20_gender.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/reoffending_10to20_offence.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/reoffending_10to20_disposal.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/reoffending_10to20_timetoreoffence.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/reoffending_10to20_prevoffences.Rdata")

params_reoffend <- reoffending_10to20_gender %>%
  mutate(end_period_month = ifelse(end_period_month == "March", "Mar", end_period_month)) %>%
  pivot_wider(names_from = measure, values_from = count) %>%
  mutate(pc_reoffenders = `Number of reoffenders` / `Number of children in cohort`, # pc that will reoffend in a year
         reoff_per_reoff = `Number of reoffences` /`Number of reoffenders`)

check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_reoffenders, colour = gender)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff

ggsave(filename = "Output/Graphs/assumption_checks/check_genderpc_reoff.png", check_reoff)


check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = reoff_per_reoff, colour = gender)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff

ggsave(filename = "Output/Graphs/assumption_checks/check_gendernum_reoff.png", check_reoff)



params_reoffend <- reoffending_10to20_disposal %>%
  mutate(end_period_month = ifelse(end_period_month == "March", "Mar", end_period_month)) %>%
  mutate(custody = ifelse(disposal == "Custody", "Custodial", "Non-custodial")) %>%
  group_by(end_period_year, end_period_month, period_length, custody, measure) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = measure, values_from = count) %>%
  mutate(pc_reoffenders = `Number of reoffenders` / `Number of children in cohort`,
         reoff_per_reoff = `Number of reoffences` /`Number of reoffenders`)


check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_reoffenders, colour = custody)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff
ggsave(filename = "Output/Graphs/assumption_checks/check_custodypc_reoff.png", check_reoff)


check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = reoff_per_reoff, colour = custody)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff
ggsave(filename = "Output/Graphs/assumption_checks/check_custody_num_reoff.png", check_reoff)


params_reoffend <- reoffending_10to20_timetoreoffence %>%
  mutate(end_period_month = ifelse(end_period_month == "March", "Mar", end_period_month)) %>%
  select(-measure) %>%
  group_by(end_period_year, end_period_month, period_length) %>%
  mutate(tot = sum(count),
         pc = count / tot)


check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = time_to_reoffence)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff

ggsave(filename = "Output/Graphs/assumption_checks/check_time_to_reoff.png", check_reoff)


params_reoffend <- reoffending_10to20_offence %>%
  mutate(end_period_month = ifelse(end_period_month == "March", "Mar", end_period_month)) %>%
  filter(offence %in% c("Drugs", "Possession of weapons", "Violence against the person")) %>%
  pivot_wider(names_from = measure, values_from = count) %>%
  mutate(pc_reoffenders = `Number of reoffenders` / `Number of children in cohort`,
         reoff_per_reoff = `Number of reoffences` /`Number of reoffenders`)


check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_reoffenders, colour = offence)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff

ggsave(filename = "Output/Graphs/assumption_checks/check_offencepc_reoff.png", check_reoff)


check_reoff <- params_reoffend  %>%
  filter(period_length == "Year") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = reoff_per_reoff, colour = offence)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_reoff

ggsave(filename = "Output/Graphs/assumption_checks/check_offencenum_reoff.png", check_reoff)


#
#
#
# params_reoffend <- reoffending_10to20_gender %>%
#   mutate(end_period_month = ifelse(end_period_month == "March", "Mar", end_period_month)) %>%  # come back when time & put this in the cleaned bit instead
#   ungroup() %>%
#   filter(measure == "Number of children in cohort")  %>%
#   group_by(end_period_year, end_period_month, period_length) %>%
#   summarise(cohort = sum(count)) %>%
#   full_join(reoffending_10to20_timetoreoffence %>%
#               mutate(end_period_month = ifelse(end_period_month == "March", "Mar", end_period_month)) %>%
#               rename(num_reoffence = count) %>%
#               select(-measure))

