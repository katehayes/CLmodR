install.packages("ggrepel")
library(ggrepel)

install.packages("ggpubr")
library(ggpubr)

install.packages("tidyr")
library(tidyr)

install.packages("gtable")
library(gtable)

install.packages("cowplot")
library(cowplot)

# general idea is lets look at big picture trends in the sectors that make up the model componants
# add major changes in policy or in data collection that will have an effect on the figures



# 
# list of general trend graphs:
#   child poverty (eng/wm/birm)
#   pru rate (by fsm), fsm eligibility, academisation (eng/wm/birm)
#   neet rate (by age)
#   care rate (by age)
#   
#   poverty at the top - and the periods of rise and fall? running down?
#   covid running through all? (should maybe be red or yellow!)
#   May 2010 is the coalition govt (blue line?)
#   policy change in general - blue line? yellow line?


plot_grid(poverty_plot, fsm_plot, care_rates_plot, ncol = 1, align = "v")

plot_grid(poverty_plot, fsm_plot, pru_plot, ncol = 1, align = "v")

plot_grid(poverty_plot, pru_plot, neet_gender_pc, ncol = 1, align = "v")

plot_grid(poverty_plot, care_levels_plot, pru_plot, ncol = 1, align = "v")

#7E57C2FF #673AB7FF 

#702F8AFF #9063CDFF

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # poverty# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# poverty_plot <- poverty_rate %>% 
#   filter(level == "Birmingham",
#          end_period_year >= 2006) %>% 
#   ggplot() +
#   geom_rect(data=NULL,aes(xmin=2008,xmax=2014,ymin=-Inf,ymax=Inf),
#             fill="#E8F8FF", alpha = 0.1) +
#   geom_text(aes(x=2008, label="\nDecline from 2008-2014 due largely to a fall in median incomes", y=0.2), colour="#BDCFD6", angle=90) +
#   geom_text(aes(x=2008.5, label="\ncaused by the GFC", y=0.07), colour="#BDCFD6", angle=90) +
#   
#   geom_line(aes(x = end_period_year, y = pov_rate)) +
#   theme_bw() +
#   geom_vline(xintercept = 2019, linetype="dashed", 
#              color = "black", linewidth=1, alpha = 0.3) +
#   geom_text(aes(x=2018.6, label="\nCOVID", y=0.1), colour="grey", angle=90) +
#   scale_y_continuous(name = "",
#                      limits = c(0, 0.4),
#                      expand = c(0,0)) +
#   scale_x_continuous(name = "Year", 
#                      breaks = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
#                      labels = c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
#   # ggtitle("Child poverty in Birmingham") +
#   geom_vline(xintercept = 2015, linetype="dashed", 
#              color = "black", linewidth=1, alpha = 0.3) +
#   geom_text(aes(x=2014.6, label="\nNew small-area income-based child poverty data available", y=0.2), colour="grey", angle=90)
#   
# poverty_plot



poverty_series <- p_data_pc %>% 
  mutate(end_period_year = as.numeric(end_period_year)) %>% 
  select(-c(end_period_month, period_length)) %>% 
  bind_rows(poverty_1522 %>% 
              mutate(end_period_year = as.numeric(end_period_year)), 
            poverty_9520 %>% 
              mutate(end_period_year = as.numeric(end_period_year))) %>% 
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level))  %>% 
  add_row(level = "Birmingham", end_period_year = 2013, measure = "Estimate", pc = 0.2596145) %>%
  add_row(level = "Birmingham", end_period_year = 2014, measure = "Estimate", pc = 0.2468604)


# 
# check <- poverty_series %>% 
#   filter(level != "England",
#          end_period_year %in% c(2012:2015),
#          !(level == "West Midlands (region)" & 
#            measure == "HBAI - children 0-20")) %>% 
#   select(-measure) %>% 
#   pivot_wider(names_from = level,
#               values_from = pc) %>% 
#   ungroup() %>% 
#   arrange(end_period_year) %>% 
#   mutate(change = (`West Midlands (region)` - lag(`West Midlands (region)`))/lag(`West Midlands (region)`)) %>% 
#   # mutate(ratio = Birmingham/`West Midlands (region)`,
#   #        ratio = mean(ratio, na.rm = T)) %>% 
#   # mutate(Birmingham = ifelse(is.na(Birmingham), `West Midlands (region)`*ratio, Birmingham))
#   mutate(Birmingham = ifelse(end_period_year  == 2013, lag(Birmingham) + change*lag(Birmingham), Birmingham),
#          Birmingham = ifelse(end_period_year  == 2014, lag(Birmingham) + change*lag(Birmingham), Birmingham))
# 


poverty_plot <- poverty_series %>% 
  mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
  filter(measure != "HBAI - children 0-20") %>% 
  filter(level != "Birmingham") %>% 
  ggplot() +
    # ggtitle("Child poverty in Birmingham, West Midlands, England") +
  geom_rect(data=NULL,aes(xmin=1998,xmax=2005,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2008,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 1998, linetype="dotted",
                         color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2005, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2008, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
    # geom_text(aes(x=2008, label="\nDecline from 2008-2014 due largely to a fall in median incomes", y=0.2), colour="#BDCFD6", angle=90) +
    # geom_text(aes(x=2008.5, label="\ncaused by the GFC", y=0.07), colour="#BDCFD6", angle=90) +
    geom_line(aes(x = end_period_year, y = pc, group = level, color = level)) + 
    scale_y_continuous(name = "",
                       limits = c(0, 0.45),
                       expand = c(0,0)) +
    scale_x_continuous(name = "", 
                     breaks = c(1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022), 
                     labels = c("1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"),
                     limits = c(1996.5, 2022.5),
                     expand = c(0,0)) +
    theme_bw() +
  # scale_color_manual(values = c("#762A83FF", "#5AAE61FF", "#2166ACFF", "#9970ABFF", "#ACD39EFF", "#92C5DEFF"),
    scale_color_manual(values = c("#762A83FF", "#5AAE61FF"),
                       guide = FALSE) +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year %in% c(2012:2015)),
                aes(x = end_period_year, y = pc), linetype = "dashed", color = "#2166ACFF") +
  geom_line(data = poverty_series %>% 
              mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
              filter(measure != "HBAI - children 0-20") %>% 
              filter(level == "Birmingham",
                     end_period_year <= 2012),
            aes(x = end_period_year, y = pc), color = "#2166ACFF") +
  geom_line(data = poverty_series %>% 
              mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
              filter(measure != "HBAI - children 0-20") %>% 
              filter(level == "Birmingham",
                     end_period_year >= 2015),
            aes(x = end_period_year, y = pc), color = "#2166ACFF") +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4) 
  # geom_text(aes(x=2021.1, label="\nBirmingham", y=0.4), colour="#634E8B", angle=0) +
  # geom_text(aes(x=2021.4, label="\nWest Midlands", y=0.31), colour="#4CAEDB", angle=0) +
  # geom_text(aes(x=2020.8, label="\nEngland", y=0.24), colour="#1EBC4C", angle=0) 
  # 
  # 
    # scale_color_viridis(discrete = T,
    #                     guide = F) 
# +
  # geom_vline(xintercept = 2015, linetype="dashed",
  #            color = "black", size=1, alpha = 0.3) +
  # # geom_text(aes(x=2014.6, label="\nNew small-area income-based child poverty data available", y=0.2), colour="grey", angle=90) +
  # geom_vline(xintercept = 2006, linetype="dashed",
  #            color = "black", size=1, alpha = 0.3) +
  # geom_vline(xintercept = 2012.5, linetype="dashed",
  #            color = "black", size=1, alpha = 0.3) +
  # geom_vline(xintercept = 2022, linetype="dashed",
  #            color = "black", size=1, alpha = 0.3)
  # geom_bracket(xmin = "2006", xmax = "2012", y.position = 0.09,
  #   label = "local indicators")

  
  poverty_plot
  ggsave(filename = "output/graphs/poverty_plot.png", poverty_plot)
  
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # care # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


care_levels <- care_11to22_age %>% 
  filter(age %in% c("10-15","16+")) %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(level %in% c("England", "West Midlands (region)", "Birmingham")) %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2011:2023)) %>%
              mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
              group_by(end_period_year, level, age) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(pc = count/census_pop)

care_levels_plot <- care_levels %>%
  select(end_period_year, level, age, pc) %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(level, age), color = interaction(level, age))) +
  scale_color_manual(values = c("#3299FFFF", "#66BD63FF","#B39DDBFF", "#0054FFFF", "#1A9850FF", "#673AB7FF"),
                     guide = FALSE) +
  theme_bw() +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4) +
  # geom_text(aes(x=2018.6, label="\nCOVID", y=0.0025), colour="grey", angle=90) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.0275),
                     expand = c(0,0)) +
  scale_x_continuous(limits = c(2010.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"))
# ggtitle("Trends in care rates in Birmingham") 
care_levels_plot
ggsave(filename = "output/graphs/care_levels_plot.png", care_levels_plot)

  
  




 











care_11to22_age %>% 
  filter(level == "Birmingham",
         age %in% c("10-15","16+")) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, group = age, colour = age))


neet_pop <- neet_11to23_age %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count))

school_pop <- schools_school_level %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count)) %>% 
  filter(age %in% c(10:15))

neet_school_pop <- neet_11to23_age %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count)) %>% 
  bind_rows(schools_school_level %>% 
              group_by(end_period_year, age) %>% 
              summarise(count = sum(count)) %>% 
              filter(age %in% c(10:15))) %>% 
  mutate(source = "schools & neet") %>% 
  bind_rows(population %>% 
              group_by(end_period_year, age) %>% 
              summarise(count = sum(count)) %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2011:2023)) %>% 
              mutate(source = "census"))




neet_school_pop %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, group = interaction(age, source), colour = interaction(age, source)))


neet_school_pop %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, group = source, colour = source)) +
  facet_grid(~age)


care_rates <- care_11to22_age %>% 
  filter(level == "Birmingham",
         age %in% c("10-15","16+")) %>% 
  left_join(neet_11to23_age %>% 
              group_by(end_period_year) %>% 
              summarise(school_pop = sum(count)) %>% 
              mutate(age = "16+") %>% 
              bind_rows(schools_school_level %>% 
                          filter(age %in% c(10:15)) %>%
                          group_by(end_period_year) %>% 
                          summarise(school_pop = sum(count)) %>% 
                          mutate(age = "10-15"))) %>% 
  left_join(population %>% 
              filter(age %in% c(10:17),
                     end_period_year %in% c(2011:2023)) %>%
              mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
              group_by(end_period_year, age) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(pc_school = count/school_pop,
         pc_census = count/census_pop)

care_rates_plot <- care_rates %>%
  select(end_period_year, age, pc_school, pc_census) %>% 
  pivot_longer(c(pc_census, pc_school),
               names_to = "source",
               values_to = "pc") %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>% 
  mutate(pc = ifelse(source == "pc_school", na.approx(pc), pc)) %>% 
  mutate(label = ifelse(source == "pc_census", "Census data", "Schools/NEET data"),
         label = ifelse(age == "10-15", paste("10-15 - ", label, sep = ""), paste("16+ - ", label, sep = "")),
         label = ifelse((source == "pc_census" & end_period_year == 2020) |
                          (source == "pc_school" & end_period_year == 2022), label, NA)) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(age, source), color = interaction(age, source))) +
  # geom_label_repel(aes(label = label),
  #                  nudge_x = 1,
  #                  na.rm = TRUE) +
  scale_color_manual(values = c("#3299FFFF", "#0054FFFF", "#3299FFFF", "#0054FFFF"),
                     guide = FALSE) +
  theme_bw() +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4) +
  # geom_text(aes(x=2018.6, label="\nCOVID", y=0.0025), colour="grey", angle=90) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.02),
                     expand = c(0,0)) +
  scale_x_continuous(limits = c(2010.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"))
  # ggtitle("Trends in care rates in Birmingham") 
care_rates_plot
ggsave(filename = "output/graphs/care_rates_plot.png", care_rates_plot)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # NEET # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #







neet_rates_plot <- neet_11to23_age %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  filter(neet == "NEET") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  
  geom_line(aes(x = end_period_year, y = pc, group = as.character(age), colour = as.character(age))) +
  # scale_color_manual(values = c("lightgrey", "#DE4434", "#399FE0", "darkgrey", "#9C2F24", "#246D9C")) +
  scale_color_manual(values = c("#92C5DEFF", "#2166ACFF"),
                     guide = FALSE) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     limits = c(2010.5, 2023.5),
                     expand = c(0,0),
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.09),
                     expand = c(0,0)) +
  geom_line(data = neet_11to23_age %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              ungroup() %>% 
              filter(neet == "NEET",
                     age == 16) %>% 
              filter(end_period_year %in% c(2013, 2015)),
            aes(x = end_period_year, y = pc), color = "#92C5DEFF", linetype = "dashed") +
  # ggtitle("Percentage of 16 and 17 year olds not in employment, education, or training in Birmingham") +
  geom_vline(xintercept = 2012.5, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2012.1, label="\nPolicy change for 16+", y=0.02), colour="grey", angle=90) +
  geom_vline(xintercept = 2011, linetype="dashed", 
           color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2010.6, label="\n2011 Education Act ends required monitoring of participation", y=0.04), colour="grey", angle=90) +
  geom_vline(xintercept = 2014.5, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2014.1, label="\nPolicy change for 17+", y=0.075), colour="grey", angle=90) +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4) 
  # geom_text(aes(x=2018.6, label="\nCOVID", y=0.075), colour="grey", angle=90)

neet_rates_plot
# need to read maguire 2015 and fergusson 2014 
ggsave(filename = "output/graphs/neet_rates_plot.png", neet_rates_plot)




neet_gender_pc <- neet_16to23_age_gender %>% 
  filter(gender != "Unknown") %>% 
  ungroup() %>% 
  group_by(end_period_year, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  filter(neet == "NEET") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(age, gender), color = interaction(age, gender))) +
  geom_line(data = neet_11to23_age %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              ungroup() %>% 
              filter(neet == "NEET"),
            aes(x = end_period_year, y = pc, group = as.character(age), colour = as.character(age))) +
  # scale_color_manual(values = c("lightgrey", "#DE4434", "#399FE0", "darkgrey", "#9C2F24", "#246D9C")) +
  scale_color_manual(values = c("#3299FFFF", "#3299FFFF", "#3299FFFF",  "#0054FFFF", "#0054FFFF", "#0054FFFF"),
                     guide = FALSE) + 
  theme_bw() +
  scale_x_continuous(name = "", 
                     limits = c(2010.5, 2023.5),
                     expand = c(0,0),
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "") +
  # ggtitle("Trends in NEET rates in Birmingham") +
  geom_line(data = neet_11to23_age %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              ungroup() %>% 
              filter(neet == "NEET",
                     age == 16) %>% 
              filter(end_period_year %in% c(2013, 2015)),
            aes(x = end_period_year, y = pc), color = "#3299FFFF", alpha = 0.4) + 
  geom_vline(xintercept = 2012.5, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2012.1, label="\nPolicy change for 16+", y=0.02), colour="grey", angle=90) +
  geom_vline(xintercept = 2011, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2010.6, label="\n2011 Education Act ends required monitoring of participation", y=0.04), colour="grey", angle=90) +
  geom_vline(xintercept = 2014.5, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2014.1, label="\nPolicy change for 17+", y=0.075), colour="grey", angle=90) +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4) 
  

neet_gender_pc
ggsave(filename = "output/graphs/neet_gender_pc.png", neet_gender_pc)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # PRU # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# is it something going on with the education act 2011?

# Education Act 2011 – this is the main statute which sets out what a school should do when excluding a pupil.
# 
# School Discipline (Pupil Exclusions and Reviews) (England) Regulations 2012 (SI 2012/1033) – 
# this contains detailed provisions about exclusions, and applies to maintained schools, pupil referral units and Academies.
check <- schools_10to22_age_gender %>% 
  left_join(s_data) %>% 
  mutate(pru = ifelse(my_categories == "Pupil referral unit", "PRU", "Not PRU")) %>%
  filter(age %in% c(10:15)) %>% 
  # age != 11) %>% 
  group_by(end_period_year, level, pru) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # pivot_wider(names_from = level,
  #             values_from = count,
  #             values_fill = 0) %>% 
  # mutate(`(rest of) England` = `(rest of) England` + `(rest of) West Midlands (region)` + `Birmingham`,
  #        `(rest of) West Midlands (region)` = `(rest of) West Midlands (region)` + `Birmingham`) %>% 
  # pivot_longer(c(`(rest of) England`, `(rest of) West Midlands (region)`, `Birmingham`),
  #              names_to = "level",
  #              values_to = "count") %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
  mutate(pc = PRU/(PRU + `Not PRU`)) %>% 
  select(end_period_year, level, pc) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, color = level)) +
  theme_bw() +
  scale_x_continuous(name = "Year", 
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2010","2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.0125),
                     expand = c(0,0))

check

s_data <- s_data %>% 
  mutate(academy = ifelse(grepl("cadem", school_type) | grepl("cadem", school_subtype), "Academy", "Not academy"))

academy <- schools_10to22_age_gender %>%
  filter(age %in% 10:15) %>% 
  left_join(s_data) %>% 
  ungroup() %>% 
  group_by(end_period_year, level, academy) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = academy,
              values_from = count,
              values_fill = 0) %>% 
  mutate(pc = Academy/(Academy + `Not academy`)) %>% 
# %>% 
  # select(end_period_year, level, pc) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, color = level)) +
  theme_bw() +
  scale_x_continuous(name = "Year", 
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2010","2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 1),
                     expand = c(0,0)) +
  ggtitle("Percentage of children age 10-15 attending academies, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#468F5F", "#11537F", "#94231C"),
                     guide = FALSE)
  
academy
ggsave(filename = "output/graphs/academy.png", academy)
# ROUGH JOB, HAVENT DONE V THOROUGH CHECK ABOUT WHETHER IVE IDENTIFIED ALL THE ACADEMIES

schools_fsm <- schools_10to22_fsm %>%
  left_join(s_data) 


fsm_plot <- schools_fsm %>% 
  group_by(end_period_year, level) %>%
  mutate(school_headcount = as.numeric(school_headcount),
         school_fsm = as.numeric(school_fsm)) %>% 
  summarise(count = sum(school_headcount, na.rm = T),
            fsm = sum(school_fsm, na.rm = T)) %>% 
  ungroup() %>% 
  mutate(pc = fsm/count) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_line(aes(x = end_period_year, y = pc, color = level)) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2010","2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"),
                     limits = c(2009.5, 2022.5),
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.4),
                     expand = c(0,0)) +
  # ggtitle("Trends in FSM eligibility rates, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#5AAE61FF","#762A83FF", "#2166ACFF"),
                     guide = FALSE) +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4)

fsm_plot
ggsave(filename = "output/graphsfsm_plot.png", fsm_plot)

schools_school_level <- schools_10to22_age_gender %>%
  filter(age %in% 10:17) %>% 
  # left_join(s_data) 
  left_join(schools_fsm %>% 
              mutate(fsm_pc = school_fsm / school_headcount) %>% 
              mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc))) %>% 
  mutate(count_fsm = count * fsm_pc,
         count_non_fsm = count * (1-fsm_pc)) 


schools <- schools_school_level %>% 
  select(-c(count, school_headcount, school_fsm,
            fsm_pc)) %>% 
  pivot_longer(c(count_fsm, count_non_fsm),
               names_to = "fsm",
               values_to = "count") %>% 
  mutate(fsm = ifelse(grepl("non", fsm), "Not FSM eligible", "FSM eligible")) %>% 
  group_by(end_period_year, level, end_period_month, period_length,
           my_categories, age, gender, fsm) %>% 
  summarise(count = sum(count)) %>% 
  rename(school_type = my_categories) %>% 
  ungroup()


pru_plot <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  filter(age %in% c(10:15)) %>% 
  # age != 11) %>% 
  group_by(end_period_year, level, fsm, pru) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
  mutate(pc = PRU/(PRU + `Not PRU`)) %>% 
  select(end_period_year, level, fsm, pc) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_vline(xintercept = 2022, linetype="dotted",
             color = "black", size=0.7, alpha = 0.3) +
  geom_line(aes(x = end_period_year, y = pc, color = interaction(level, fsm))) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2010","2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.025),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#762A83FF", "#1A9850FF", "#0054FFFF", "#9970ABFF", "#66BD63FF", "#3299FFFF"),
                     guide = FALSE) +
  geom_vline(xintercept = 2011, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2010.6, label="\nEducation Act 2011", y=0.01364), colour="grey", angle=90) +
  geom_vline(xintercept = 2012, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2011.6, label="\nSchool Discipline Regulations 2012", y=0.017), colour="grey", angle=90) +
  geom_vline(xintercept = 2018, linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2017.6, label="\n???", y=0.022), colour="grey", angle=90) +
  # geom_text(aes(x=2019, label="\nEngland:", y=0.022), hjust = 0, colour="black", angle=0) +
  # geom_text(aes(x=2019, label="\nWest Midlands:", y=0.0205), hjust = 0, colour="black", angle=0) +
  # geom_text(aes(x=2019, label="\nBirmingham:", y=0.019), hjust = 0, colour="black", angle=0) +
  # geom_text(aes(x=2020.1, label="\nEligible/", y=0.022), hjust = 0, colour="#468F5F", angle=0) +
  # geom_text(aes(x=2021.1, label="\nNot", y=0.022), hjust = 0, colour="#9BD4B1", angle=0) +
  geom_vline(xintercept = 2019, linetype="dashed", 
             color = "red", size=1, alpha = 0.4)




pru_plot
ggsave(filename = "output/graphs/pru_plot.png", pru_plot)

