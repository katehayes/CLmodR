need_history <- needs_history_data %>%
  mutate(status = factor(status,
                        levels = c("Blank", "Yet to Clarify",
                                   "Withheld", "Never/No",
                                   "Previously", "Currently/Yes"))) %>%
  mutate(need = factor(need,
                       levels = c("Care order", "Siblings in care",
                                  "Child in need", "Child protection plan",
                                  "Eligible child", "Relevant child",
                                  "Remand to Youth Detention Accommodation",
                                  "Remand to Local Authority Accommodation"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = status),
           stat = "identity", position = "stack") +
  facet_grid(~need) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2019, 2020),
                     labels = c("2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
need_history
ggsave(filename = "Output/Graphs/need_history.png", need_history)


need_regional <- needs_regional_data %>%
  filter(group != "England") %>%
  ggplot() +
  geom_bar(aes(x = need, y = pc, fill = group),
           stat = "identity", position = "dodge") +
  # facet_grid(~year) +
  scale_x_discrete(name = "",
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

need_regional
# find a better order for this
ggsave(filename = "Output/Graphs/need_regional.png", need_regional)

need_sentence <- needs_bysentence_data %>%
  mutate(need = factor(need,
         levels = c("Care order", "Siblings in care",
                    "Child in need", "Child protection plan",
                    "Eligible child", "Relevant child",
                    "Remand to Youth Detention Accommodation",
                    "Remand to Local Authority Accommodation"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = group),
           stat = "identity", position = "dodge") +
  facet_grid(~need) +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2019, 2020),
                   labels = c("2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

need_sentence
ggsave(filename = "Output/Graphs/need_sentence.png", need_sentence)




need_age <- needs_demographic_data %>%
  filter(group_type == "Age Group") %>%
  mutate(need = factor(need,
                       levels = c("Care order", "Siblings in care",
                                  "Child in need", "Child protection plan",
                                  "Eligible child", "Relevant child",
                                  "Remand to Youth Detention Accommodation",
                                  "Remand to Local Authority Accommodation"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = group),
           stat = "identity", position = "dodge") +
  facet_grid(~need) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2019, 2020),
                     labels = c("2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

need_age
ggsave(filename = "Output/Graphs/need_age.png", need_age)


need_gender <- needs_demographic_data %>%
  filter(group_type == "Gender") %>%
  mutate(need = factor(need,
                       levels = c("Care order", "Siblings in care",
                                  "Child in need", "Child protection plan",
                                  "Eligible child", "Relevant child",
                                  "Remand to Youth Detention Accommodation",
                                  "Remand to Local Authority Accommodation"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = fct_rev(group)),
           stat = "identity", position = "dodge") +
  facet_grid(~need) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2019, 2020),
                     labels = c("2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

need_gender
ggsave(filename = "Output/Graphs/need_gender.png", need_gender)

need_ethnicity <- needs_demographic_data %>%
  filter(group_type == "Ethnicity") %>%
  mutate(need = factor(need,
                       levels = c("Care order", "Siblings in care",
                                  "Child in need", "Child protection plan",
                                  "Eligible child", "Relevant child",
                                  "Remand to Youth Detention Accommodation",
                                  "Remand to Local Authority Accommodation"))) %>%
  mutate(group = if_else(group == "Information not obtainable",
                         "Unknown Ethnicity", group),
          group = factor(group,
                             levels = c("White", "Black or Black British",
                                        "Asian or Asian British", "Mixed",
                                        "Other Ethnic Group", "Unknown Ethnicity"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = group),
           stat = "identity", position = "dodge") +
  facet_grid(~need) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2019, 2020),
                     labels = c("2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
need_ethnicity
ggsave(filename = "Output/Graphs/need_ethnicity.png", need_ethnicity)


