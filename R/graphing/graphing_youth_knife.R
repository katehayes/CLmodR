knife_data

knife_summary_wmp <- knife_data %>%
  filter(offence_type == "All Knife and Offensive Weapon (P1)",
         level == "West Midlands (police)",
         Gender != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Officer_identified_ethnicity),
           stat = "identity", position = "stack") +
  facet_grid(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_summary_wmp
# i mean its interesting that they're making less nd less of an effort
# to record race.


knife_threat_wmp <- knife_data %>%
  filter(offence_type == "Threatening Offences Only (P3)",
         level == "West Midlands (police)",
         Gender != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Officer_identified_ethnicity),
           stat = "identity", position = "stack") +
  facet_grid(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_threat_wmp


knife_possession_wmp <- knife_data %>%
  filter(offence_type == "Possession Offences Only (P2)",
         level == "West Midlands (police)",
         Gender != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Officer_identified_ethnicity),
           stat = "identity", position = "stack") +
  facet_grid(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_possession_wmp



lay_out <- rbind(c(1),
                 c(2),
                 c(3))

knife_summary_group_wmp <- grid.arrange(knife_summary_wmp, knife_threat_wmp, knife_possession_wmp,
                                      layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/knife_summary_group_wmp.png", knife_summary_group_wmp)



knife_summary_ew <- knife_data %>%
  filter(offence_type == "All Knife and Offensive Weapon (P1)",
         level == "Eng/Wales",
         Gender != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Officer_identified_ethnicity),
           stat = "identity", position = "stack") +
  facet_grid(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_summary_ew



knife_disposal_wmp <- knife_data %>%
  filter(offence_type == "All Knife and Offensive Weapon (P1)",
         level == "West Midlands (police)",
         Gender != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Disposal),
           stat = "identity", position = "stack") +
  facet_wrap(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_disposal_wmp

knife_previous_wmp <- knife_data %>%
  filter(offence_type == "All Knife and Offensive Weapon (P1)",
         level == "West Midlands (police)",
         Gender != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Previous_convictions_or_cautions),
           stat = "identity", position = "stack") +
  facet_wrap(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_previous_wmp


knife_noprevious_wmp <- knife_data %>%
  filter(offence_type == "All Knife and Offensive Weapon (P1)",
         level == "West Midlands (police)",
         Gender != "Unknown",
         Previous_convictions_or_cautions == "0 Previous convictions/cautions") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Disposal),
           stat = "identity", position = "stack") +
  facet_wrap(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2012:2022),
                     labels = c("2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
knife_noprevious_wmp


lay_out <- rbind(c(1),
                 c(2),
                 c(3))

knife_disposals_priors_wmp <- grid.arrange(knife_disposal_wmp, knife_previous_wmp, knife_noprevious_wmp,
                                        layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/knife_disposals_priors_wmp .png", knife_disposals_priors_wmp )


