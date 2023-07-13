


care_march_birm <- care_data_march %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = level),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 0.2)

care_march_birm


care_march_wm <- care_data_march %>%
  filter(level == "West Midlands (region)") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = level),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.4)
care_march_wm

care_march_eng <- care_data_march %>%
  filter(level == "England") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = level),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.6,
                     end = 0.6)
care_march_eng

lay_out <- rbind(c(1,2,3))

care_march_groups <- grid.arrange(care_march_eng, care_march_wm, care_march_birm,
                                           layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/care_march_groups.png", care_march_groups)

# so birmingham didnt increase in absolute number - what about the rate of children in care
# compared to total pop?


# MARCH VERSUS TOTAL

care_marchvtotal_birm <- care_marchvtotal %>%
  filter(level == "Birmingham") %>%
  pivot_wider(names_from = measure, values_from = count) %>%
  mutate(`Not present on March 31` = Total - March) %>%
  select(-Total) %>%
  pivot_longer(c(March, `Not present on March 31`),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(measure)),
           stat = "identity", position = "stack") +
  # facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0.2,
                     end = 0.3)

care_marchvtotal_birm


care_marchvtotal_wm <- care_marchvtotal %>%
  filter(level == "West Midlands (region)") %>%
  pivot_wider(names_from = measure, values_from = count) %>%
  mutate(`Not present on March 31` = Total - March) %>%
  select(-Total) %>%
  pivot_longer(c(March, `Not present on March 31`),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(measure)),
           stat = "identity", position = "stack") +
  # facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0.4,
                     end = 0.5)

care_marchvtotal_wm


care_marchvtotal_eng <- care_marchvtotal %>%
  filter(level == "England") %>%
  pivot_wider(names_from = measure, values_from = count) %>%
  mutate(`Not present on March 31` = Total - March) %>%
  select(-Total) %>%
  pivot_longer(c(March, `Not present on March 31`),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(measure)),
           stat = "identity", position = "stack") +
  # facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0.6,
                     end = 0.7)

care_marchvtotal_eng

lay_out <- rbind(c(1,2,3))

care_marchvtotal_groups <- grid.arrange(care_marchvtotal_eng, care_marchvtotal_wm, care_marchvtotal_birm,
                                  layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/care_marchvtotal_groups.png", care_marchvtotal_groups)


#PLACEMENT TYPES

care_placement_birm <- care_data_placement %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = characteristic),
           stat = "identity", position = "fill") +
  # facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0,
                     end = 1)

care_placement_birm


care_placement_res <- care_data_placement %>%
  mutate(residential = ifelse(characteristic %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>%
  mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(residential)),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0.1,
                     end = 0.3)

ggsave(filename = "Output/Graphs/care_placement_residential.png", care_placement_res)




birm_res <- residential_care_data %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = level),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0.1,
                     end = 0.3)
birm_res
ggsave(filename = "Output/Graphs/birm_residential_care.png", birm_res)


# GENDER

care_gender <- care_data_gender %>%
  mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = characteristic),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0.1,
                     end = 0.3)
care_gender

ggsave(filename = "Output/Graphs/care_gender.png", care_gender)




care_ethnicity <- care_data_ethnicity %>%
  mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  mutate(characteristic = factor(characteristic, levels = c("White", "Asian or Asian British", "Black, African, Caribbean or Black British",
                                                            "Mixed or Multiple ethnic groups", "Other ethnic group", "Refused or information not yet available"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(characteristic)),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.9)
care_ethnicity

ggsave(filename = "Output/Graphs/care_ethnicity.png", care_ethnicity)
# should probably find out what it is relative to their share of the population..
# seems like in england and wm, less so but maybe slightly in birmingham,
# non-white kids are growing as a proportion of kids in care


care_age <- care_data_age %>%
  mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  mutate(characteristic = factor(characteristic, levels = c("Under 1 year", "1 to 4 years", "5 to 9 years",
                                                            "10 to 15 years", "16 years and over"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(characteristic)),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.9)
care_age

ggsave(filename = "Output/Graphs/care_age.png", care_age)



# PRIVATE CARE

care_provider <- care_data_provider %>%
  mutate(level = factor(level, levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  mutate(characteristic = factor(characteristic, levels = c("Placement provider not reported", "Parents or other person with parental responsibility",
                                                            "Own provision (by the LA)", "Other LA provision",
                                                            "Other public provision (e.g. by a PCT etc)",
                                                            "Private provision", "Voluntary/third sector provision"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = fct_rev(characteristic)),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2022),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.9)
care_provider
ggsave(filename = "Output/Graphs/care_provider.png", care_provider)































