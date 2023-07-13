social_workers <- social_worker_data %>%
  filter(level != "England") %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = social_worker_fte, fill = level),
           stat = "identity", position = "dodge") +
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
                     begin = 0.3,
                     end = 0.6)
social_workers
ggsave(filename = "Output/Graphs/social_workers_birm_wm.png", social_workers)


turnover_rate <- social_worker_data %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = turnover_rate_fte, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2013, 2015, 2017, 2019, 2021),
                     labels = c("2013", "2015", "2017", "2019","2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.6)
turnover_rate




vacancy_rate <- social_worker_data %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = vacancy_rate_fte, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2013, 2015, 2017, 2019, 2021),
                     labels = c("2013", "2015", "2017", "2019","2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.6)
vacancy_rate



agency_rate <- social_worker_data %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = agency_rate_fte, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2013, 2015, 2017, 2019, 2021),
                     labels = c("2013", "2015", "2017", "2019","2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.6)
agency_rate


caseload <- social_worker_data %>%
  mutate(level = factor(level,
                        levels = c("England", "West Midlands (region)", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = caseload_fte, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2013, 2015, 2017, 2019, 2021),
                     labels = c("2013", "2015", "2017", "2019","2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.6)
caseload




lay_out <- rbind(c(1),
                 c(2),
                 c(3),
                 c(4))

social_work_groups <- grid.arrange(turnover_rate, vacancy_rate, agency_rate, caseload,
                                     layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/social_work_groups.png", social_work_groups)







