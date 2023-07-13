# figure out how to name, file, distribute this code later

# comparing FTE's to total children
load("/Users/katehayes/CLmodelR/Output/Data/Processed/fte.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Processed/children.Rdata")

child_v_fte <- children %>%
  group_by(end_period_year, gender) %>%
  summarise(count = sum(count)) %>%
  rename(children = count) %>%
  full_join(fte %>%
              group_by(end_period_year, gender) %>%
              summarise(count = sum(count)) %>%
              rename(fte = count)) %>%
  mutate(pc_fte = fte/children)

# there are inconsistencies - sometimes more FTE's than children total,
# maybe this is to do with how I did the gender split - too large a percentage attributed to girls
# - or maybe its also to do with mismatched yearly count periods

check_child_v_fte <- child_v_fte %>%
  filter(gender != "Unknown") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_fte, colour = gender)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_child_v_fte


# definitely need to scale down the relative number of girl FTEs for some of these years.







