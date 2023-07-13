birm <- all_children %>%
  filter(level == "Birmingham") %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.5,
                     end = 0.5)

birm


wmid <- all_children %>%
  filter(level == "West Midlands") %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.3)

wmid


ew <- all_children %>%
  filter(level == "Eng/Wales") %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.1)

ew

lay_out <- rbind(c(1,2,3))

child_group <- grid.arrange(ew, wmid, birm,
                           layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/child_group.png", child_group)




pc_ew <- pc_wm_ew %>%
  filter(level == "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.1)

pc_ew


pc_wm <- pc_wm_ew %>%
  filter(level == "West Midlands") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.3)
pc_wm


lay_out <- rbind(c(1,2))

child_group_pc <- grid.arrange(pc_ew, pc_wm,
                            layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/child_group_pc.png", child_group_pc)




child_v_fte_alllevels <- children_v_fte %>%
  mutate(level = factor(level,
        levels = c("Eng/Wales", "West Midlands", "Birmingham"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.5)
child_v_fte_alllevels
ggsave(filename = "Output/Graphs/child_v_fte_alllevels.png", child_v_fte_alllevels)


child_v_disp_alllevels_pc <- children_v_disposals %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands", "Birmingham"))) %>%
    ggplot() +
      geom_bar(aes(x = as.numeric(year), y = pc, fill = level),
               stat = "identity", position = "dodge") +
      facet_wrap(~level) +
      scale_x_continuous(name = "",
                         expand = c(0,0),
                         breaks = c(2010:2021),
                         labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                    "2017", "2018", "2019", "2020", "2021")) +
      scale_y_continuous(name = "",
                         expand = c(0,0)) +
      theme_classic() +
      theme(strip.background = element_blank(),
            legend.position = "none",
            plot.title = element_text(hjust = 0.5, size = 10)) +
      scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                         begin = 0.1,
                         end = 0.5)
child_v_disp_alllevels_pc
ggsave(filename = "Output/Graphs/child_v_disp_alllevels_pc.png", child_v_disp_alllevels_pc)


child_v_disp_gender <- children_v_disposals_bygender %>%
  filter(gender != "Not Known") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = gender),
           stat = "identity", position = "dodge") +
  facet_wrap(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.6)
child_v_disp_gender
ggsave(filename = "Output/Graphs/child_v_disp_gender.png", child_v_disp_gender)






child_v_disp_ew <- children_v_disposals %>%
  filter(level == "Eng/Wales") %>%
  pivot_longer(c(disposals, children),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = measure),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.5,
                     end = 0.5)
child_v_disp_ew


child_v_disp_wm <- children_v_disposals %>%
  filter(level == "West Midlands") %>%
  pivot_longer(c(disposals, children),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = measure),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.3)
child_v_disp_wm


child_v_disp_birm <- children_v_disposals %>%
  filter(level == "Birmingham") %>%
  ungroup() %>%
  add_row(level = "Birmingham", year = 2010,
          disposals = 0, children = 0, pc = 0) %>%
  pivot_longer(c(disposals, children),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = measure),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.1)
child_v_disp_birm



lay_out <- rbind(c(1),
                 c(2),
                 c(3))

child_v_disp_group <- grid.arrange(child_v_disp_ew, child_v_disp_wm, child_v_disp_birm,
                            layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/child_v_disp_group.png", child_v_disp_group)








child_v_fte_gender <- children_v_fte_bygender %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = gender),
           stat = "identity", position = "dodge") +
  facet_wrap(~gender) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.6)
child_v_fte_gender
ggsave(filename = "Output/Graphs/child_v_fte_gender.png", child_v_fte_gender)




child_v_fte_ew <- children_v_fte %>%
  filter(level == "Eng/Wales") %>%
  pivot_longer(c(ftes, children),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = measure),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.5,
                     end = 0.5)
child_v_fte_ew


child_v_fte_wm <- children_v_fte %>%
  filter(level == "West Midlands") %>%
  pivot_longer(c(ftes, children),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = measure),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.3)
child_v_fte_wm


child_v_fte_birm <- children_v_fte %>%
  filter(level == "Birmingham") %>%
  pivot_longer(c(ftes, children),
               names_to = "measure", values_to = "count") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = measure),
           stat = "identity", position = "dodge") +
  facet_wrap(~measure) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.1)
child_v_fte_birm



lay_out <- rbind(c(1),
                 c(2),
                 c(3))

child_v_fte_group <- grid.arrange(child_v_fte_ew, child_v_fte_wm, child_v_fte_birm,
                                   layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/child_v_fte_group.png", child_v_fte_group)


