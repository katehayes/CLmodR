arrest_levels <- arrest_data %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
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
                     begin = 0.3,
                     end = 0.6)
arrest_levels

arrest_ew <- arrest_data %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  filter(level == "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.3)
arrest_ew


arrest_wmr <- arrest_data %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  filter(level == "West Midlands (region)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.45,
                     end = 0.45)
arrest_wmr

arrest_wmp <- arrest_data %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  filter(level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.6,
                     end = 0.6)
arrest_wmp


lay_out <- rbind(c(1,2,3))

arrest_levels_group <- grid.arrange(arrest_ew, arrest_wmr, arrest_wmp,
                                  layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/arrest_levels_group.png", arrest_levels_group)







arrest_ew_g <- arrest_data %>%
  group_by(year, level, Gender) %>%
  summarise(count = sum(count)) %>%
  filter(level == "Eng/Wales",
         Gender %in% c("Male", "Female")) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Gender),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.3)
arrest_ew_g

arrest_wmr_g <- arrest_data %>%
  group_by(year, level, Gender) %>%
  summarise(count = sum(count)) %>%
  filter(level == "West Midlands (region)",
         Gender %in% c("Male", "Female")) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.45,
                     end = 0.45)
arrest_wmr_g

arrest_wmp_g <- arrest_data %>%
  group_by(year, level, Gender) %>%
  summarise(count = sum(count)) %>%
  filter(level == "West Midlands (police)",
         Gender %in% c("Male", "Female")) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(Gender)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.6,
                     end = 0.6)
arrest_wmp_g


lay_out <- rbind(c(1),
                 c(2),
                 c(3))

arrest_levels_gender <- grid.arrange(arrest_ew_g, arrest_wmr_g, arrest_wmp_g,
                                    layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/arrest_levels_gender.png",arrest_levels_gender)


arrest_gender <- arrest_data %>%
  group_by(year, level, Gender) %>%
  summarise(count = sum(count)) %>%
  filter(Gender %in% c("Male", "Female")) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = Gender),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.6,
                     end = 0.8)
arrest_gender


arrest_eth <- arrest_data %>%
  group_by(year, level, `Ethnic Group (self-defined)`) %>%
  summarise(count = sum(count)) %>%
  # filter(`Ethnic Group (self-defined)` != "Not stated") %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Ethnic Group (self-defined)`),
           stat = "identity", position = "fill") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 1)
arrest_eth
ggsave(filename = "Output/Graphs/arrest_levels_eth.png", arrest_eth)


arrest_age <- arrest_data %>%
  group_by(year, level, `Age group`) %>%
  filter(`Age group` == "Under 10 years",
         level != "Eng/Wales") %>%
  summarise(count = sum(count)) %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Age group`),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 1)
arrest_age
ggsave(filename = "Output/Graphs/arrest_age.png", arrest_age)



arrest_drug_race <- arrest_data %>%
  group_by(year, level, `Reason for arrest (offence group)`, `Ethnic Group (self-defined)`) %>%
  filter(level != "Eng/Wales",
         `Reason for arrest (offence group)` %in% c("Drug offences",
                                                    "2015/16 onwards - Drug offences")) %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "West Midlands (police)"))) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Ethnic Group (self-defined)`),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.8)
arrest_drug_race
ggsave(filename = "Output/Graphs/arrest_drug_race.png", arrest_drug_race)




arrest_drug_race_m <- arrest_data %>%
  filter(Gender == "Male") %>%
  group_by(year, level, `Reason for arrest (offence group)`, `Ethnic Group (self-defined)`, Gender) %>%
  filter(level != "Eng/Wales",
         `Reason for arrest (offence group)` %in% c("Drug offences",
                                                    "2015/16 onwards - Drug offences")) %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "West Midlands (police)"))) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Ethnic Group (self-defined)`),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.8)
arrest_drug_race_m


arrest_drug_race_f <- arrest_data %>%
  filter(Gender == "Female") %>%
  group_by(year, level, `Reason for arrest (offence group)`, `Ethnic Group (self-defined)`, Gender) %>%
  filter(level != "Eng/Wales",
         `Reason for arrest (offence group)` %in% c("Drug offences",
                                                    "2015/16 onwards - Drug offences")) %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "West Midlands (police)"))) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Ethnic Group (self-defined)`),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.8)
arrest_drug_race_f

lay_out <- rbind(c(1),
                 c(2))

arrest_drug_race_gender <- grid.arrange(arrest_drug_race_m, arrest_drug_race_f,
                                     layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/arrest_drug_race_gender.png", arrest_drug_race_gender)




arrest_violence_race <- arrest_data %>%
  group_by(year, level, `Reason for arrest (offence group)`, `Ethnic Group (self-defined)`) %>%
  filter(level != "Eng/Wales",
         `Reason for arrest (offence group)` %in% c("Violence against the person",
                                                    "2015/16 onwards - Violence against the person")) %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "West Midlands (police)"))) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Ethnic Group (self-defined)`),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.8)
arrest_violence_race
ggsave(filename = "Output/Graphs/arrest_violence_race.png", arrest_violence_race)



arrest_posession_race <- arrest_data %>%
  group_by(year, level, `Reason for arrest (offence group)`, `Ethnic Group (self-defined)`) %>%
  filter(level != "Eng/Wales",
         `Reason for arrest (offence group)` == "2015/16 onwards - Possession of weapons offences") %>%
  mutate(level = factor(level,
                        levels = c("West Midlands (region)", "West Midlands (police)"))) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = `Ethnic Group (self-defined)`),
           stat = "identity", position = "stack") +
  facet_wrap(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2008, 2010, 2012, 2014, 2016, 2018, 2020, 2022),
                     labels = c("2008", "2010", "2012", "2014","2016",
                                "2018","2020", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.8)
arrest_posession_race
ggsave(filename = "Output/Graphs/arrest_posession_race.png", arrest_posession_race)



# ARRESTS AND STOP AND SEARCHES
tot_v_ss_arrest <- arrest_v_search %>%
  filter(level == "West Midlands (police)") %>%
  filter(self_defined_ethnicity_group %in%
           c("Asian or Asian British", "Black or Black British",
             "Mixed", "White")) %>%
  group_by(year, self_defined_ethnicity_group) %>%
  summarise(tot_arrests = sum(tot_arrests, na.rm = T),
            ss_arrests = sum(ss_arrests, na.rm = T)) %>%
  mutate(pc = ss_arrests/ tot_arrests) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = self_defined_ethnicity_group),
           stat = "identity", position = "stack") +
  facet_grid(~self_defined_ethnicity_group) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2021, 2022),
                     labels = c("2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.8)

tot_v_ss_arrest

# this approx shows (maybe) what what percent of total arrests in each ethnic group
# comes from stop and searches
# noticably lower among white children
ggsave(filename = "Output/Graphs/tot_v_ss_arrest.png", tot_v_ss_arrest)




tot_v_ss_arrest_sex <- arrest_v_search %>%
  filter(level == "West Midlands (police)") %>%
  filter(sex %in%
           c("Male", "Female")) %>%
  group_by(year, sex) %>%
  summarise(tot_arrests = sum(tot_arrests, na.rm = T),
            ss_arrests = sum(ss_arrests, na.rm = T)) %>%
  mutate(pc = ss_arrests/ tot_arrests) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = sex),
           stat = "identity", position = "stack") +
  facet_grid(~fct_rev(sex)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2021, 2022),
                     labels = c("2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.55,
                     end = 0.7)

tot_v_ss_arrest_sex
ggsave(filename = "Output/Graphs/tot_v_ss_arrest_sex.png", tot_v_ss_arrest_sex)


tot_ss_arrest_summary <- arrest_v_search %>%
  group_by(year, level) %>%
  summarise(tot_arrests = sum(tot_arrests, na.rm = T),
            ss_arrests = sum(ss_arrests, na.rm = T)) %>%
  mutate(pc = ss_arrests/tot_arrests) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc, fill = level),
           stat = "identity", position = "stack") +
  facet_grid(~level) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2021, 2022),
                     labels = c("2021", "2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.55,
                     end = 0.75)

tot_ss_arrest_summary
ggsave(filename = "Output/Graphs/tot_ss_arrest_summary.png", tot_ss_arrest_summary)



drug_arrest_summary <- arrest_summary %>%
  filter(Gender %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_drug_arrest, fill = level),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(level, fct_rev(Gender))) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2010, 2013, 2016, 2019, 2022),
                     labels = c("2007", "2010", "2013", "2016",
                                "2019","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

drug_arrest_summary



weapon_arrest_summary <- arrest_summary %>%
  filter(Gender %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_weapon_arrest, fill = level),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(level, fct_rev(Gender))) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2010, 2013, 2016, 2019, 2022),
                     labels = c("2007", "2010", "2013", "2016",
                                "2019","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

weapon_arrest_summary


violence_arrest_summary <- arrest_summary %>%
  filter(Gender %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_violence_arrest, fill = level),
           stat = "identity", position = "dodge") +
  facet_grid(~interaction(level, fct_rev(Gender))) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2007, 2010, 2013, 2016, 2019, 2022),
                     labels = c("2007", "2010", "2013", "2016",
                                "2019","2022")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

violence_arrest_summary


lay_out <- rbind(c(1),
                 c(2),
                 c(3))

arrest_summary_groups <- grid.arrange(drug_arrest_summary, weapon_arrest_summary, violence_arrest_summary,
                                  layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/arrest_summary_groups.png", arrest_summary_groups)


