
poverty_rate_year_0612 <- poverty_data_0612 %>%
  mutate(level = factor(level, levels = c("England", "West Midlands", "Birmingham"))) %>%
  ggplot() +
  geom_line(aes(x = as.numeric(year), y = pc)) +
  scale_x_continuous(name = "",
                     breaks = c(2006, 2008, 2010, 2012, 2014, 2016),
                     labels = c("2006", "2008", "2010", "2012", "2014", "2016")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, NA)) +
  facet_grid(~level) +
  theme_classic() +
  theme(strip.background = element_blank())

poverty_rate_year_0612

ggsave(filename = "Output/Graphs/poverty_rate_year_0612.png", poverty_rate_year_0612)


birm_poverty_acrossyears <- poverty_data_0612 %>%
  filter(level == "Birmingham") %>%
  select(-level, -count) %>%
  mutate(year = as.numeric(year)) %>%
  mutate(measure = "Local child poverty basket") %>%
  bind_rows(pop_pov_data %>%
              mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
              group_by(year, level) %>%
              summarise(pov = sum(pov),
                        pop = sum(pop)) %>%
              mutate(pc = pov / pop) %>%
              filter(level == "Birmingham") %>%
              select(year, pc) %>%
              mutate(measure = "Stat Xplore")) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = measure),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     breaks = c(2006, 2008, 2010, 2012, 2014, 2016, 2018, 2020),
                     labels = c("2006", "2008", "2010", "2012", "2014", "2016", "2018", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, NA)) +
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.5,
                     end = 0.6)

birm_poverty_acrossyears
ggsave(filename = "Output/Graphs/birm_poverty_acrossyears.png", birm_poverty_acrossyears)





poverty_summary <- poverty_data_1621 %>%
  filter(age %in% 10:17) %>%
  filter(level != "Wales") %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = level, values_from = count) %>%
  ungroup() %>%
  arrange(year) %>%
  mutate(Birmingham = (Birmingham - lag(Birmingham)) / lag(Birmingham),
         `West Midlands` = (`West Midlands` - lag(`West Midlands`)) / lag(`West Midlands`),
         England = (England - lag(England)) / lag(England)) %>%
  pivot_longer(c(Birmingham, `West Midlands`, England),
               names_to = "level", values_to = "change") %>%
  ggplot() +
      geom_bar(aes(x = year, y = change, fill = level),
               stat = "identity", position = "stack") +
      facet_wrap(~level) +
      scale_x_continuous(name = "",
                         expand = c(0,0),
                         breaks = c(2007:2022),
                         labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                    "2017", "2018", "2019", "2020", "2021","2022")) +
      scale_y_continuous(name = "",
                         expand = c(0,0)) +
      theme_classic() +
      theme(strip.background = element_blank(),
            plot.title = element_text(hjust = 0.5, size = 10)) +
      scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                         begin = 0.15,
                         end = 0.9)
# bad, useless, etc
poverty_summary


working_poverty_birm <-  poverty_data_1621 %>%
  filter(age %in% 10:17) %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = work_status),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.3)

working_poverty_birm
ggsave(filename = "Output/Graphs/working_poverty_birm.png", working_poverty_birm)


working_poverty_wm <-  poverty_data_1621 %>%
  filter(age %in% 10:17) %>%
  filter(level == "West Midlands") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = work_status),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.35,
                     end = 0.5)
working_poverty_wm


working_poverty_ew <-  poverty_data_1621 %>%
  filter(age %in% 10:17) %>%
  filter(level %in% c("England", "Wales")) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = work_status),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.55,
                     end = 0.7)
working_poverty_ew

lay_out <- rbind(c(1,2,3))

working_poverty_groups <- grid.arrange(working_poverty_ew, working_poverty_wm, working_poverty_birm,
                                    layout_matrix = lay_out)

ggsave(filename = "Output/Graphs/working_poverty_groups.png", working_poverty_groups)


working_poverty_birm_pc <-  poverty_data_1621 %>%
  filter(age %in% 10:17) %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = work_status),
           stat = "identity", position = "fill") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007:2022),
                     labels = c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.3)
working_poverty_birm_pc











poverty_rate_ageyear <- pop_pov_data %>%
  mutate(pc = pov / pop)  %>%
  filter(age %in% 10:17) %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_line(aes(x = year, y = pc)) +
  scale_x_continuous(name = "",
                     breaks = c(2016, 2018, 2020),
                     labels = c("2016","2018", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, NA)) +
  facet_grid(~as.character(age)) +
  theme_classic() +
  theme(strip.background = element_blank())

poverty_rate_ageyear
# increases over time AND increases with age -
# a spike between 13 and 14 - why?

poverty_rate_year <- pop_pov_data %>%
  mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  filter(age %in% 10:17) %>%
  group_by(year, level) %>%
  summarise(pov = sum(pov),
            pop = sum(pop)) %>%
  mutate(pc = pov / pop)  %>%
  ggplot() +
  geom_line(aes(x = year, y = pc)) +
  scale_x_continuous(name = "",
                     breaks = c(2016, 2018, 2020),
                     labels = c("2016","2018", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, NA)) +
  facet_grid(~level) +
  theme_classic() +
  theme(strip.background = element_blank())

poverty_rate_year


poverty_rate_yearage <- pop_pov_data %>%
  mutate(pc = pov / pop)  %>%
  filter(age %in% 10:17) %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_line(aes(x = age, y = pc)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, NA)) +
  facet_grid(~as.character(year)) +
  theme_classic() +
  theme(strip.background = element_blank())

poverty_rate_yearage


lay_out <- rbind(c(1),
                 c(2),
                 c(3))

poverty_rate_groups <- grid.arrange(poverty_rate_year, poverty_rate_yearage, poverty_rate_ageyear,
                                       layout_matrix = lay_out)

# the first is all levels, the 2nd and third just birmingham
ggsave(filename = "Output/Graphs/poverty_rate_ageandyear.png", poverty_rate_groups)



poverty_rate_yearage2 <- pop_pov_data %>%
  mutate(pc = pov / pop)  %>%
  filter(age %in% 0:17) %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_line(aes(x = age, y = pc)) +
  scale_x_continuous(name = "",
                     breaks = c(2016, 2018, 2020),
                     labels = c("2016","2018", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, NA)) +
  facet_grid(~as.character(year)) +
  theme_classic() +
  theme(strip.background = element_blank())

poverty_rate_yearage2
# england has that weird jump too
# must be how the benefit system works

# jsut looking at all ages, people are v poor as babies.




# this is england/wales
household_poverty_summary <- household_poverty_data %>%
  ggplot() +
  geom_bar(aes(x = year, y = as.numeric(count), fill = child_deprivation_status),
           stat = "identity", position = "fill") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2005:2021),
                     labels = c("2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)


household_poverty_summary






# this is just wm
wm_quintiles <- p_data_wm %>%
  mutate(decile = factor(decile, levels = c("Bottom decile", "Second decile", "Third decile",
                                            "Fourth decile", "Fifth decile", "Sixth decile",
                                            "Seventh decile", "Eighth decile", "Ninth decile",
                                            "Top decile"))) %>%
  mutate(ethnicity = factor(ethnicity, levels = c("White", "Asian or Asian British",
                                                  "Black or African or Caribbean or Black British",
                                                  "Mixed or Multiple Ethnic Groups",
                                                  "Other Ethnic Group"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(count), fill = fct_rev(decile)),
           stat = "identity", position = "fill") +
  facet_grid(~ethnicity) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(1995, 2005, 2015),
                     labels = c("1995", "2005", "2015")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.05,
                     end = 0.95)

wm_quintiles
ggsave(filename = "Output/Graphs/under19_householdquintiles_wm.png",wm_quintiles)




wm_quintiles_summary <- p_data_wm %>%
  mutate(decile = factor(decile, levels = c("Bottom decile", "Second decile", "Third decile",
                                            "Fourth decile", "Fifth decile", "Sixth decile",
                                            "Seventh decile", "Eighth decile", "Ninth decile",
                                            "Top decile"))) %>%
  mutate(age_cat = factor(age_cat, levels = c("Child aged under 16", "Child aged 16 to 19"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(count), fill = fct_rev(decile)),
           stat = "identity", position = "fill") +
  facet_wrap(~age_cat) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(1995, 2005, 2015),
                     labels = c("1995", "2005", "2015")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.05,
                     end = 0.95)

wm_quintiles_summary
ggsave(filename = "Output/Graphs/under19_wm_quintiles_summary.png",
       wm_quintiles_summary)
# can't really see too too too much of a trend in the children under 16,
# well, it might be there but it's more apparent in children 16-19:
# looks like west midlands are falling behind relative to the rest of the country
