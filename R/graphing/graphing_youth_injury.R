
injury_wm_birm_fae <- injury_data %>%
  filter(age != "20-29",
         measure == "FAEs") %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)",
                                   "West Midlands (police)", "Birmingham"))) %>%
  filter(level != "England") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(count), fill = level),
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
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
injury_wm_birm_fae
ggsave(filename = "Output/Graphs/injury_wm_birm_fae.png", injury_wm_birm_fae)

injury_wm_birm_fce <- injury_data %>%
  filter(age != "20-29",
         measure == "FCEs") %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)",
                                   "West Midlands (police)", "Birmingham"))) %>%
  filter(level != "England") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(count), fill = level),
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
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
injury_wm_birm_fce
ggsave(filename = "Output/Graphs/injury_wm_birm_fce.png", injury_wm_birm_fce)







injury_wm_birm_age_fae <- injury_data %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)",
                                   "West Midlands (police)", "Birmingham"))) %>%
  filter(level != "England",
         measure == "FAEs") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(count), fill = age),
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
        # legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
injury_wm_birm_age_fae
ggsave(filename = "Output/Graphs/injury_wm_birm_age_fae.png", injury_wm_birm_age_fae)


injury_wm_birm_age_fce <- injury_data %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)",
                                   "West Midlands (police)", "Birmingham"))) %>%
  filter(level != "England",
         measure == "FCEs") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = as.numeric(count), fill = age),
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
        # legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
injury_wm_birm_age_fce
ggsave(filename = "Output/Graphs/injury_wm_birm_age_fce.png", injury_wm_birm_age_fce)














