police_total <- police_data %>%
  filter(level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Worker.type),
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

police_total
ggsave(filename = "Output/Graphs/police_total_wm.png", police_total)

police_com_sup <- police_data %>%
  filter(Worker.type == "Police Community Support Officer") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
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
                     begin = 0.15,
                     end = 0.9)

police_com_sup
ggsave(filename = "Output/Graphs/police_com_sup_all_levels.png", police_com_sup)


misconduct <- misconduct_data %>%
  # filter(level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Case.type),
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

misconduct
ggsave(filename = "Output/Graphs/police_misconduct_ew_wm.png", misconduct)

