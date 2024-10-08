
fte_levels <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "Eng/Wales") %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(level %in% c("England", "West Midlands (region)", "Birmingham")) %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2009:2020)) %>%
              group_by(end_period_year, level) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(pc = count/census_pop)

fte_levels_plot <- fte_levels %>%
  select(end_period_year, level, pc) %>% 
  arrange(end_period_year) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2008.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, group = level, color = level)) +
  scale_color_manual(values = c("#0054FFFF", "#1A9850FF", "#673AB7FF"),
                     guide = FALSE) +
  theme_bw() +
  scale_y_continuous(name = "",
                     limits = c(0, 0.018),
                     expand = c(0,0)) +
  scale_x_continuous(limits = c(2008.5, 2020.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) 
# ggtitle("Trends in care rates in Birmingham") 
fte_levels_plot
ggsave(filename = "output/graphs/fte_levels_plot.png", fte_levels_plot)



children_levels <- children_14to21_age_gen_eth %>% 
  filter(level == "Birmingham",
         gender != "Unknown") %>% 
  group_by(end_period_year, age, gender) %>% 
  summarise(count = sum(count)) %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(level %in% c("Birmingham")) %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2014:2020)) %>%
              mutate(age = ifelse(age %in% c(10:14), "10-14", "15-17")) %>% 
              group_by(end_period_year, age, gender) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(pc = count/census_pop)


children_levels_plot <- children_levels %>%
  arrange(end_period_year) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2008.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(age, gender), color = interaction(age, gender))) +
  scale_color_manual(values = c("#B0CBE7FF", "#0054FFFF", "#DCD66EFF", "#B48A2CFF"),
                     guide = FALSE) +

  theme_bw() +
  scale_y_continuous(name = "",
                     limits = c(0, 0.033),
                     expand = c(0,0)) +
  scale_x_continuous(limits = c(2013.5, 2020.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2014", "2015", "2016", "2017", "2018", "2019", "2020")) 
# ggtitle("Trends in care rates in Birmingham") 
children_levels_plot
ggsave(filename = "output/graphs/children_levels_plot.png", children_levels_plot)


fte_child_levels <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "England") %>% 
  left_join(children_10to21_age %>% 
              # filter(level %in% c("England", "West Midlands (region)", "Birmingham")) %>% 
              # filter(age %in% c(10:17),
              #        end_period_year %in% c(2009:2020)) %>%
              group_by(end_period_year, level) %>%
              summarise(count_children = sum(count))) %>% 
  mutate(pc = count/count_children)

fte_child_levels_plot <- fte_child_levels %>%
  select(end_period_year, level, pc) %>% 
  arrange(end_period_year) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, group = level, color = level)) +
  scale_color_manual(values = c("#0054FFFF", "#1A9850FF", "#673AB7FF"),
                     guide = FALSE) +
  theme_bw() +
  scale_y_continuous(name = "",
                     limits = c(0, 0.9),
                     expand = c(0,0)) +
  scale_x_continuous(limits = c(2009.5, 2020.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) 
# ggtitle("Trends in care rates in Birmingham") 
fte_child_levels_plot
ggsave(filename = "output/graphs/fte_child_levels_plot.png", fte_child_levels_plot)





