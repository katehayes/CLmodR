
fte_v_pop <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "England") %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(level %in% c("Eng/Wales", "West Midlands (region)", "Birmingham")) %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2009:2020)) %>%
              group_by(end_period_year, level) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(pc = count/census_pop) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2008.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, color = level)) +
  # facet_grid(
  #            # rows = vars(gender),
  #            cols = vars(level)) +
  theme_bw() +
  scale_x_continuous(limits = c(2008.5, 2020.5),
                     expand = c(0,0),
                     name = ""
                     ,
                     breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"),
  ) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.0175),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#0054FFFF", "#1A9850FF", "#673AB7FF"),
                     guide = FALSE) +
  theme(strip.text = element_blank())

fte_v_pop

ggsave(filename = "output/graphs/fte_v_pop.png", fte_v_pop)


child_v_pop <- children_10to21_gender %>% 
  filter(gender != "Unknown") %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(level %in% c("Eng/Wales", "West Midlands (region)", "Birmingham")) %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2009:2020)) %>%
              group_by(end_period_year, gender, level) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(pc = count/census_pop) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, color = interaction(level, gender))) +
  # facet_grid(
  #             rows = vars(gender)) +
  #            cols = vars(level)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2020.5),
                     expand = c(0,0),
                     name = ""
                     ,
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"),
  ) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.045),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#0054FFFF", "#1A9850FF", "#673AB7FF", "#3299FFFF", "#66BD63FF","#B39DDBFF"),
                     guide = FALSE) +
  theme(strip.text = element_blank())

child_v_pop
ggsave(filename = "output/graphs/child_v_pop.png", child_v_pop)

fte_v_child <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "England") %>% 
  left_join(children_10to21_gender %>% 
              filter(gender != "Unknown") %>% 
              group_by(end_period_year, level) %>%
              summarise(child_count = sum(count))) %>% 
  mutate(pc = count/child_count) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, color = level)) +
  # facet_grid(
  #             rows = vars(gender)) +
  #            cols = vars(level)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2020.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.82),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#0054FFFF", "#1A9850FF", "#673AB7FF"),
                     guide = FALSE) +
  theme(strip.text = element_blank())

fte_v_child

ggsave(filename = "output/graphs/fte_v_child.png", fte_v_child)


fte_child_plot <- plot_grid(child_v_pop, fte_v_pop, fte_v_child, ncol = 1, align = "v")
fte_child_plot
ggsave(filename = "output/graphs/fte_child_plot.png", fte_child_plot)



fte_child_disp_ew <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "England") %>% 
  left_join(children_10to21_gender %>% 
              filter(gender != "Unknown") %>% 
              group_by(end_period_year, level) %>%
              summarise(child_count = sum(count))) %>% 
  left_join(disposals_10to21 %>% 
              group_by(end_period_year, level) %>%
              summarise(disp_count = sum(count))) %>% 
  filter(level == "Eng/Wales") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2008.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = count), color = "#ADE2C0") +
  geom_line(aes(x = end_period_year, y = child_count), color = "#51C47B") +
  geom_line(aes(x = end_period_year, y = disp_count), color =  "#1A9850FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2008.5, 2020.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     limits = c(0, 170000),
                     breaks = c(seq(0, 150000, 30000)),
                     expand = c(0,0)) +
  theme(strip.text = element_blank())

fte_child_disp_ew


fte_child_disp_wm <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "England") %>% 
  left_join(children_10to21_gender %>% 
              filter(gender != "Unknown") %>% 
              group_by(end_period_year, level) %>%
              summarise(child_count = sum(count))) %>% 
  left_join(disposals_10to21 %>% 
              group_by(end_period_year, level) %>%
              summarise(disp_count = sum(count))) %>% 
  filter(level == "West Midlands (region)") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2008.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = count), color = "#D8C6E7") +
  geom_line(aes(x = end_period_year, y = child_count), color = "#B39DDBFF") +
  geom_line(aes(x = end_period_year, y = disp_count), color = "#673AB7FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2008.5, 2020.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     limits = c(0, 15500),
                     breaks = c(seq(0, 15000, 3000)),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  theme(strip.text = element_blank())

fte_child_disp_wm

fte_child_disp_b <- fte_09to20 %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>% 
  filter(level != "England") %>% 
  left_join(children_10to21_gender %>% 
              filter(gender != "Unknown") %>% 
              group_by(end_period_year, level) %>%
              summarise(child_count = sum(count))) %>% 
  left_join(disposals_10to21 %>% 
              group_by(end_period_year, level) %>%
              summarise(disp_count = sum(count))) %>% 
  filter(level == "Birmingham") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2008.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = count), color = "#54CBFF") +
  geom_line(aes(x = end_period_year, y = child_count), color = "#3299FFFF") +
  geom_line(aes(x = end_period_year, y = disp_count), color = "#0054FFFF") +
  # facet_grid(
  #   #             rows = vars(gender)) +
  #   cols = vars(level)) +
  theme_bw() +
  scale_x_continuous(limits = c(2008.5, 2020.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020), 
                     labels = c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     breaks = c(seq(0, 2500, 500)),
                     limits = c(0, 2850),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  # scale_color_manual(values = c("#0054FFFF"),
  #                    guide = FALSE) +
  theme(strip.text = element_blank())

fte_child_disp_b

fte_child_disp_plot <- plot_grid(fte_child_disp_ew, fte_child_disp_wm, fte_child_disp_b, ncol = 1, align = "v")
fte_child_disp_plot
ggsave(filename = "output/graphs/fte_child_disp_plot.png", fte_child_disp_plot)




disp_graph <- disposals_10to21 %>% 
  filter(level != "England",
         disposal_type != "Other") %>% 
  group_by(end_period_year, disposal_type, level) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, level) %>% 
  mutate(pc = count/sum(count)) %>% 
  mutate(disposal_type = factor(disposal_type, 
                                levels = c("Pre-court",
                                           "First-tier",
                                           "Community",
                                           "Custody"))) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, color = level)) +
  scale_color_manual(values = c("#0054FFFF", "#1A9850FF", "#673AB7FF"),
                     guide = FALSE) +
  facet_grid(
    #             rows = vars(gender)) +
    cols = vars(disposal_type)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2020.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2012,  2014, 2016,  2018, 2020), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020")) +
  scale_y_continuous(name = "",
                     # breaks = c(seq(0, 2500, 500)),
                     limits = c(0, 0.65),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  # scale_color_manual(values = c("#0054FFFF"),
  #                    guide = FALSE) +
  theme(strip.text = element_blank())

disp_graph

ggsave(filename = "output/graphs/disp_graph .png", disp_graph)



x<- disposals_10to21 %>% 
  distinct(disposal_type)

c_v_nc_birm <- disposals_10to21 %>% 
  filter(level == "Birmingham",
         disposal_type != "Other") %>% 
  mutate(disposal_type = ifelse(disposal_type == "Custody", "Custodial", "Non-custodial")) %>% 
  group_by(end_period_year, disposal_type) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = disposal_type,
              values_from = count) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2020.5,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", linewidth=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  
  geom_line(aes(x = end_period_year, y = Custodial), color = "#91A1BAFF") +
  geom_line(aes(x = end_period_year, y = `Non-custodial`+Custodial), color ="#91A1BAFF") +
  geom_ribbon(aes(x = end_period_year, ymin=0, ymax=Custodial), fill = "#3299FFFF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=Custodial,ymax=Custodial+`Non-custodial`), fill =  "#54CBFF", alpha=0.5) +
  # geom_line(aes(x = end_period_year, y = pc, group = interaction(age, neet), colour = interaction(age, neet))) +
  # scale_color_manual(values = c("#0054FFFF"),
  #                    guide = F) +
  # scale_fill_manual(values = c("#0054FFFF"),
  #                   guide = F) +
  # theme_bw() +
  # geom_line(aes(x = end_period_year, y = count, color = disposal_type)) +
  # scale_color_manual(values = c("#3299FFFF", "#54CBFF"),
  #                    guide = FALSE) +
  theme_bw() +
  scale_x_continuous(limits = c(2010.5, 2020.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2012,  2014, 2016,  2018, 2020), 
                     labels = c("2012", "2014", "2016", "2018", "2020")) +
  scale_y_continuous(name = "",
                     # breaks = c(seq(0, 2500, 500)),
                    limits = c(0, 2800),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  # scale_color_manual(values = c("#0054FFFF"),
  #                    guide = FALSE) +
  theme(strip.text = element_blank())

c_v_nc_birm
ggsave(filename = "output/graphs/c_v_nc_birm .png", c_v_nc_birm)


# #  #  #  #  # #  #  #  #  OLDER WORK BELOW# #  #  #  #  # #  #  #  #
# breakdown of disposal types in ftes compared to total disposals eng/wales# number of FTEs in Birmingham
birm_fte <- fte_birm_pc %>%
  ggplot() +
  geom_bar(aes(x = year, y = Birmingham, fill = "blue"),
               stat = "identity") +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015,
                              2017, 2019),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.90,
                     end = 0.90)

birm_fte


# birm as a pc of wm, as a pc of e/w

birm_fte_pc_wm <- fte_birm_pc %>%
  ggplot() +
  geom_bar(aes(x = year, y = birm_pc_wm, fill = "blue"),
           stat = "identity") +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015,
                              2017, 2019),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.60,
                     end = 0.60)
birm_fte_pc_wm


birm_fte_pc_ew <- fte_birm_pc %>%
  ggplot() +
  geom_bar(aes(x = year, y = birm_pc_ew, fill = "blue"),
           stat = "identity") +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015,
                              2017, 2019),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.50,
                     end = 0.50)
birm_fte_pc_ew


lay_out <- rbind(c(1,NA),
                 c(2,3))


fte_group <- grid.arrange(birm_fte, birm_fte_pc_wm, birm_fte_pc_ew,
                          layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/birm_fte_pc_wmew.png", fte_group)


### ### ### ### ### ###eng/wales level ratios of boy/girl### ### ### ### ### ###

fte_bg <- fte_ew_bg %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = sex),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.8)
fte_bg

# if birmingham had the same gender ratios:
fte_birm_bg <- fte_ew_bg %>%
  ggplot() +
  geom_bar(aes(x = year, y = birm_bg, fill = sex),
           stat = "identity", position = "stack") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.8)

fte_birm_bg


# if birmingham had same offence breakdowns
# county lines flags

fte_birm_cl <- fte_cl %>%
  ggplot() +
  geom_bar(aes(x = year, y = birm_count, fill = cl),
           stat = "identity", position = "stack") +
  facet_wrap(~fct_rev(sex)) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.8)

fte_birm_cl


# #  #  #  #  # #  #  #  #  NEW SET OF GRAPHS# #  #  #  #  # #  #  #  #
# breakdown of disposal types in ftes compared to total disposals eng/wales
fte_pre <- fte_pc_tot %>%
  filter(disposal_type == "Pre-court") %>%
  ggplot() +
  geom_bar(aes(x = year, y = FTE, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.8,
                     end = 0.8)

fte_pre

fte_first_tier <- fte_pc_tot %>%
  filter(disposal_type == "First-tier") %>%
  ggplot() +
  geom_bar(aes(x = year, y = FTE, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.66,
                     end = 0.66)

fte_first_tier

fte_community <- fte_pc_tot %>%
  filter(disposal_type == "Community") %>%
  ggplot() +
  geom_bar(aes(x = year, y = FTE, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.53,
                     end = 0.53)

fte_community


fte_custody <- fte_pc_tot %>%
  filter(disposal_type == "Custody") %>%
  ggplot() +
  geom_bar(aes(x = year, y = FTE, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.4)

fte_custody





fte_disp <- fte_pc_tot %>%
  # filter(disposal_type == "Pre-court") %>%
  filter(!is.na(disposal_type)) %>%
  mutate(disposal_type = factor(disposal_type,
                                levels = c("Pre-court", "First-tier", "Community", "Custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = FTE, fill = disposal_type),
           stat = "identity") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.8)

fte_disp



tot_disp <- fte_pc_tot %>%
  # filter(disposal_type == "Pre-court") %>%
  filter(!is.na(disposal_type)) %>%
  mutate(disposal_type = factor(disposal_type,
                                levels = c("Pre-court", "First-tier", "Community", "Custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = `Total disposals`, fill = disposal_type),
           stat = "identity") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.8)

tot_disp




tot_pre <- fte_pc_tot %>%
  filter(disposal_type == "Pre-court") %>%
  ggplot() +
  geom_bar(aes(x = year, y = `Total disposals`, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.8,
                     end = 0.8)

tot_pre

tot_first_tier <- fte_pc_tot %>%
  filter(disposal_type == "First-tier") %>%
  ggplot() +
  geom_bar(aes(x = year, y = `Total disposals`, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.66,
                     end = 0.66)

tot_first_tier

tot_community <- fte_pc_tot %>%
  filter(disposal_type == "Community") %>%
  ggplot() +
  geom_bar(aes(x = year, y = `Total disposals`, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.53,
                     end = 0.53)

tot_community


tot_custody <- fte_pc_tot %>%
  filter(disposal_type == "Custody") %>%
  ggplot() +
  geom_bar(aes(x = year, y = `Total disposals`, fill = disposal_type),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2020),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.4)

tot_custody




fte_v_tot <- fte_pc_tot %>%
filter(!is.na(disposal_type)) %>%
mutate(disposal_type = factor(disposal_type,
       levels = c("Pre-court", "First-tier", "Community", "Custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = disposal_type),
           stat = "identity") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                    expand = c(0,0),
                   breaks = c(2010:2020),
                   labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                              "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.8)

fte_v_tot

lay_out1 <- rbind(c(1),
                 c(2),
                 c(3))

lay_out2 <- rbind(c(1,2,3,4),
                 c(5,6,7,8),
                 c(9))

fte_v_tot_group1 <- grid.arrange(fte_disp, tot_disp, fte_v_tot,
                                 layout_matrix = lay_out1)
ggsave(filename = "Output/Graphs/fte_v_tot_group1.png", fte_v_tot_group1)

fte_v_tot_group2 <- grid.arrange(tot_pre, tot_first_tier, tot_community, tot_custody,
                                 fte_pre, fte_first_tier, fte_community, fte_custody,
                                 fte_v_tot,
                                layout_matrix = lay_out2)
ggsave(filename = "Output/Graphs/fte_v_tot_group2.png", fte_v_tot_group2)




fte_v_tot2 <- fte_pc_tot %>%
  filter(!is.na(disposal_type)) %>%
  pivot_longer(c(pc_fte, pc_tot), names_to = "pc_group", values_to = "pc_value") %>%
  filter(pc_group == "pc_tot") %>%
  mutate(disposal_type = factor(disposal_type,
         levels = c("Pre-court", "First-tier", "Community", "Custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc_value, fill = disposal_type),
           stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2010:2020),
                   labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                              "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 0.83)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.8)

fte_v_tot2

fte_v_tot3 <- fte_pc_tot %>%
  filter(!is.na(disposal_type)) %>%
  pivot_longer(c(pc_fte, pc_tot), names_to = "pc_group", values_to = "pc_value") %>%
  filter(pc_group == "pc_fte") %>%
  mutate(disposal_type = factor(disposal_type,
                                levels = c("Pre-court", "First-tier", "Community", "Custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc_value, fill = disposal_type),
           stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2010:2020),
                   labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                              "2017", "2018", "2019", "2020")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.3,
                     end = 0.8)

fte_v_tot3



lay_out <- rbind(c(1),
                 c(2))

fte_v_tot_group <- grid.arrange(fte_v_tot3, fte_v_tot2,
                          layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/fte_v_tot_group.png", fte_v_tot_group)


# TOTAL DISPOSALS, COMPARING BIRMINGHAM, WEST MIDS, AND E/W

tot_pc_disp <- alllevel_disposals %>%
  group_by(year, level, disposal_type) %>%
  summarise(count = sum(count))  %>%
  filter(!is.na(disposal_type)) %>%
  pivot_wider(names_from = level, values_from = count,
              values_fill = 0) %>%
  ungroup() %>%
  group_by(year) %>%
  mutate(pc_birm = birmingham/sum(birmingham),
         pc_wm = west_midlands/sum(west_midlands),
         pc_ew = `Eng/Wales`/sum(`Eng/Wales`))%>%
  mutate(disposal_type = factor(disposal_type,
                                levels = c("Pre-court", "First-tier", "Community", "Custody")))


disp_birm <- tot_pc_disp %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc_birm, fill = disposal_type),
           stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
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

disp_birm



disp_wm <- tot_pc_disp %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc_wm, fill = disposal_type),
           stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 0.62)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="rocket", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.5)



# + scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
#                      begin = 0,
#                      end = 0.2)

disp_wm


disp_ew <- tot_pc_disp %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc_ew, fill = disposal_type),
           stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2010:2021),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 0.62)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.77,
                     end = 1)


# + scale_fill_viridis(option="mako", discrete = TRUE, direction = -1,
#                      begin = 0.5,
#                      end = 0.95)

disp_ew

lay_out <- rbind(c(1),
                 c(2),
                 c(3))

disp_group <- grid.arrange(disp_ew, disp_wm, disp_birm,
                                layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/disp_group.png", disp_group)




#########NEW SET OF GRAPHS
disp_birm_pre <- tot_pc_disp %>%
  filter(disposal_type == "Pre-court") %>%
  ggplot() +
  geom_bar(aes(x = year, y = birmingham, fill = disposal_type),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.5,
                     end = 0.5)

disp_birm_pre

disp_birm_first_tier <- tot_pc_disp %>%
  filter(disposal_type == "First-tier") %>%
  ggplot() +
  geom_bar(aes(x = year, y = birmingham, fill = disposal_type),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.36,
                     end = 0.36)

disp_birm_first_tier

disp_birm_community <- tot_pc_disp %>%
  filter(disposal_type == "Community") %>%
  ggplot() +
  geom_bar(aes(x = year, y = birmingham, fill = disposal_type),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.23,
                     end = 0.23)

disp_birm_community

disp_birm_custody <- tot_pc_disp %>%
  filter(disposal_type == "Custody") %>%
  ggplot() +
  geom_bar(aes(x = year, y = birmingham, fill = disposal_type),
           stat = "identity", position = "dodge") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.1)

disp_birm_custody


lay_out <- rbind(c(1,2,3,4))

disp_birm3 <- grid.arrange(disp_birm_pre, disp_birm_first_tier, disp_birm_community, disp_birm_custody,
                           layout_matrix = lay_out)

ggsave(filename = "Output/Graphs/disp_groups_birm2.png", disp_birm3)


disp_birm2 <- tot_pc_disp %>%
  ggplot() +
  geom_bar(aes(x = year, y = birmingham, fill = disposal_type),
              stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
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
disp_birm2
ggsave(filename = "Output/Graphs/disp_groups_birm.png", disp_birm2)



disp_ew2 <- tot_pc_disp %>%
  ggplot() +
  geom_bar(aes(x = year, y = `Eng/Wales`, fill = disposal_type),
           stat = "identity", position = "dodge") +
  facet_grid(~disposal_type) +
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
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.77,
                     end = 1)
disp_ew2
ggsave(filename = "Output/Graphs/disp_groups_ew.png", disp_ew2)







#########NEW SET OF GRAPHS
### total disposals at each level compared to total FTEs at each level


birm_fte <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = fte, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.90,
                     end = 0.90)

birm_fte

wm_fte <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "West Midlands") %>%
  ggplot() +
  geom_bar(aes(x = year, y = fte, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015,
                              2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.8,
                     end = 0.8)

wm_fte


ew_fte <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = year, y = fte, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015,
                              2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.7,
                     end = 0.7)

ew_fte




birm_tot <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = total, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.90,
                     end = 0.90)

birm_tot

wm_tot <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "West Midlands") %>%
  ggplot() +
  geom_bar(aes(x = year, y = total, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.8,
                     end = 0.8)

wm_tot


ew_tot <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = year, y = total, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.7,
                     end = 0.7)

ew_tot



birm_pc <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.90,
                     end = 0.90)

birm_pc

wm_pc <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "West Midlands") %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 0.5)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.8,
                     end = 0.8)

wm_pc


ew_pc <- fte_v_tot_disposals %>%
  mutate_all(~replace(., is.na(.), 0)) %>%  #just doing this so you can see the missing in the graph better
  filter(level == "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = year, y = pc, fill = level),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015,
                                2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 0.5)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.7,
                     end = 0.7)

ew_pc



lay_out <- rbind(c(6,5,4),
                 c(3,2,1),
                 c(9,8,7))

tot_fte_pc_group <- grid.arrange(birm_fte, wm_fte, ew_fte,
                           birm_tot, wm_tot, ew_tot,
                           birm_pc, wm_pc, ew_pc,
                           layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/tot_fte_pc_group.png", tot_fte_pc_group)



### ### ### ### ### ###OLD WORK BELOW### ### ### ### ### ###### ### ### ### ### ###
### ### ### ### ### ###   percentage they were of ftes that year### ### ### ###

#ft_data %>%
filter(level %in% c("Birmingham", "West Midlands")) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = level),
           position = "dodge", stat = "identity")



first_cs_data %>%
  group_by(year) %>%
  mutate(tot_yearly = sum(ft_entrants)) %>%
  group_by(year, sex, sentence_caution_type) %>%
  mutate(percent = ft_entrants/tot_yearly) %>%
  filter(sentence_caution_type != "Other(4)") %>%
  filter(sentence_caution_type == "Immediate custody") %>%
  ggplot() +
  geom_area(aes(x = as.numeric(year), y = percent, fill = sex)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
ggsave(filename = "Output/Graphs/eng_fte_custody.png")


first_cs_data %>%
  group_by(year) %>%
  mutate(tot_yearly = sum(ft_entrants)) %>%
  group_by(year, sex, sentence_caution_type) %>%
  mutate(percent = ft_entrants/tot_yearly) %>%
  filter(sentence_caution_type != "Other(4)") %>%
  filter(sentence_caution_type == "Community sentence") %>%
  ggplot() +
  geom_area(aes(x = as.numeric(year), y = percent, fill = sex)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
ggsave(filename = "Output/Graphs/eng_fte_commsent.png")

first_cs_data %>%
  group_by(year) %>%
  mutate(tot_yearly = sum(ft_entrants)) %>%
  group_by(year, sex, sentence_caution_type) %>%
  mutate(percent = ft_entrants/tot_yearly) %>%
  filter(sentence_caution_type != "Other(4)") %>%
  filter(sentence_caution_type == "youth_caution") %>%
  ggplot() +
  geom_area(aes(x = as.numeric(year), y = percent, fill = sex)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
ggsave(filename = "Output/Graphs/eng_fte_caut.png")

first_cs_data %>%
  group_by(year) %>%
  mutate(tot_yearly = sum(ft_entrants)) %>%
  group_by(year, sex, sentence_caution_type) %>%
  mutate(percent = ft_entrants/tot_yearly) %>%
  filter(sentence_caution_type != "Other(4)") %>%
  filter(sentence_caution_type == "youth_caution") %>%
  ggplot() +
  geom_area(aes(x = as.numeric(year), y = percent, fill = sex)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
ggsave(filename = "Output/Graphs/eng_fte_caut.png")





first_offence_data %>%
  filter(offence_type %in% c("Drug offences", "Possession of weapons",
                             "Violence against the person", "Sexual offences")) %>%
  ggplot() +
  geom_area(aes(x = as.numeric(year), y = ft_entrants, fill = sex)) +
  facet_wrap(~offence_type) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
ggsave(filename = "Output/Graphs/eng_fte_offence_tot.png")


first_offence_data %>%
  group_by(year) %>%
  mutate(tot = sum(ft_entrants)) %>%
  group_by(sex, offence_type, year) %>%
  summarise(percent = ft_entrants/tot) %>%
  filter(offence_type %in% c("Drug offences", "Possession of weapons",
                             "Violence against the person", "Sexual offences")) %>%
  ggplot() +
  geom_area(aes(x = as.numeric(year), y = percent, fill = sex)) +
  facet_wrap(~offence_type) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
ggsave(filename = "Output/Graphs/eng_fte_offence_percent.png")

