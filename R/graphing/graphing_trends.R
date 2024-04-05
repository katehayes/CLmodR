# install.packages("ggrepel")
library(ggrepel)

# install.packages("ggpubr")
library(ggpubr)

# install.packages("tidyr")
library(tidyr)

# install.packages("gtable")
library(gtable)

# install.packages("cowplot")
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

plot_grid(poverty_plot, care_levels_plot, pru_plot, neet_levels_plot, ncol = 1, align = "v")

p1 <- plot_grid(poverty_plot, care_levels_plot, neet_levels_plot, ncol = 1, align = "v")
p1
ggsave(filename = "output/graphs/p1.png", p1)


p2 <- plot_grid(poverty_plot, pru_plot, neet_levels_plot, ncol = 1, align = "v")
p2
ggsave(filename = "output/graphs/p2.png", p2)


care_trends <- plot_grid(care_poverty_plot, care_levels_plot, ncol = 1, align = "v")
care_trends
ggsave(filename = "output/graphs/care_trends.png", care_trends)


pru_trends <- plot_grid(care_poverty_plot, fsm_plot, pru_plot, ncol = 1, align = "v")
pru_trends
ggsave(filename = "output/graphs/pru_trends.png", pru_trends)


neet_trends <- plot_grid(care_poverty_plot, neet_levels_plot, ncol = 1, align = "v")
neet_trends
ggsave(filename = "output/graphs/neet_trends.png", neet_trends)

neet_nk_trends <- plot_grid(birm_poverty_plot, neet_nk_plot16, neet_nk_plot17, ncol = 1, align = "v")
neet_nk_trends
ggsave(filename = "output/graphs/neet_nk_trends.png", neet_nk_trends)



pru_gender_age_fsm <- plot_grid(pru_rate_byfsm_boy, pru_rate_byfsm_girl, ncol = 1, align = "v")

pru_gender_age_fsm
ggsave(filename = "output/graphs/pru_gender_age_fsm.png", pru_gender_age_fsm)


number_pru <- plot_grid(num_prus_small, num_pru_big, num_pru_big, ncol = 1, align = "v")
genage_pru_plot <- plot_grid(genage_pru_plot_g, genage_pru_plot_b, ncol = 1, align = "v")

genage_pru_plot
ggsave(filename = "output/graphs/genage_pru_plot.png", genage_pru_plot)

school_age_fsm_group <- plot_grid(age_check, fsm_check, ncol = 1, align = "v")

school_age_fsm_group
ggsave(filename = "output/graphs/school_age_fsm_group.png", school_age_fsm_group)

school_age_fsm_gen_group <- plot_grid(age_check, fsm_check, gen_check, ncol = 1, align = "v")

school_age_fsm_gen_group
ggsave(filename = "output/graphs/school_age_fsm_gen_group.png",school_age_fsm_gen_group)




care_at_pru <- plot_grid(care_1015, care_v_all_pru_rate, ncol = 1, align = "v")

care_at_pru
ggsave(filename = "output/graphs/care_at_pru.png",care_at_pru)










policy_plot <- poverty_series %>% 
  ggplot() +
  scale_y_continuous(name = "",
                     limits = c(0, 1),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022), 
                     labels = c("1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"),
                     limits = c(1996.5, 2022.5),
                     expand = c(0,0)) +
  theme_bw() +
  geom_vline(xintercept = 2019, #linetype="dashed", 
             color = "red", size=1, alpha = 0.4) +
  geom_vline(xintercept = 2013, #linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2012.1, label="\nPolicy change for 16+", y=0.02), colour="grey", angle=90) +
  geom_vline(xintercept = 2011, #linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2010.6, label="\n2011 Education Act ends required monitoring of participation", y=0.04), colour="grey", angle=90) +
  geom_vline(xintercept = 2014.5, #linetype="dashed", 
             color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2014.1, label="\nPolicy change for 17+", y=0.075), colour="grey", angle=90) +
 geom_text(aes(x=2018.6, label="\nCOVID", y=0.075), colour="red", angle=90)


# 

policy_plot 







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
  geom_vline(xintercept = 1998,  #linetype="dotted",
                         color = "black", size=0.7, alpha = 0.1) +
  geom_vline(xintercept = 2005,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2008,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
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
    scale_color_manual(values = c("#673AB7FF", "#1A9850FF"),
                       guide = FALSE) +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year %in% c(2012:2015)),
                aes(x = end_period_year, y = pc), alpha = 0.4, color = "#0054FFFF") +
  geom_line(data = poverty_series %>% 
              mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
              filter(measure != "HBAI - children 0-20") %>% 
              filter(level == "Birmingham",
                     end_period_year <= 2012),
            aes(x = end_period_year, y = pc), color = "#0054FFFF") +
  geom_line(data = poverty_series %>% 
              mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
              filter(measure != "HBAI - children 0-20") %>% 
              filter(level == "Birmingham",
                     end_period_year >= 2015),
            aes(x = end_period_year, y = pc), color = "#0054FFFF") +
  # geom_vline(xintercept = 2019,
  #            color = "white", size=1.2, alpha = 1) +
  geom_vline(xintercept = 2010.4, linetype="dashed", 
             color = "darkblue", size=1, alpha = 0.4) +
  geom_vline(xintercept = 1997.4, linetype="dashed", 
             color = "red", size=1, alpha = 0.4) +
  geom_vline(xintercept = 1998.6, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) +# national minimum wage act
geom_vline(xintercept = 2013.25, linetype="dashed", 
           color = "#FBC02DFF", size=1, alpha = 0.35) # start of the Universal Credit rollout
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

  # add universal credit rollout?  It has been rolling out (slowly) since April 2013
  poverty_plot
  ggsave(filename = "output/graphs/poverty_plot.png", poverty_plot)
  
  

  
  
  care_poverty_plot <- poverty_series %>% 
    mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
    filter(measure != "HBAI - children 0-20") %>% 
    filter(level != "Birmingham",
           end_period_year >= 2006) %>% 
    ggplot() +
    # ggtitle("Child poverty in Birmingham, West Midlands, England") +
    geom_rect(data=NULL,aes(xmin=1998,xmax=2005,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2008,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 1998,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.1) +
    geom_vline(xintercept = 2005,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2008,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    # geom_text(aes(x=2008, label="\nDecline from 2008-2014 due largely to a fall in median incomes", y=0.2), colour="#BDCFD6", angle=90) +
    # geom_text(aes(x=2008.5, label="\ncaused by the GFC", y=0.07), colour="#BDCFD6", angle=90) +
    geom_line(aes(x = end_period_year, y = pc, group = level, color = level)) + 
    scale_y_continuous(name = "",
                       limits = c(0, 0.45),
                       expand = c(0,0)) +
    scale_x_continuous(name = "", 
                       breaks = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022), 
                       labels = c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"),
                       limits = c(2005.5, 2022.5),
                       expand = c(0,0)) +
    theme_bw() +
    # scale_color_manual(values = c("#762A83FF", "#5AAE61FF", "#2166ACFF", "#9970ABFF", "#ACD39EFF", "#92C5DEFF"),
    scale_color_manual(values = c("#1A9850FF", "#673AB7FF"),
                       guide = FALSE) +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year %in% c(2012:2015)),
              aes(x = end_period_year, y = pc), alpha = 0.4, color = "#0054FFFF") +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year <= 2012),
              aes(x = end_period_year, y = pc), color = "#0054FFFF") +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year >= 2015),
              aes(x = end_period_year, y = pc), color = "#0054FFFF") 
    # geom_vline(xintercept = 2019,
    # #            color = "white", size=1.2, alpha = 1) +
    # geom_vline(xintercept = 2010.4, linetype="dashed", 
    #            color = "darkblue", size=1, alpha = 0.4) +
    #   geom_vline(xintercept = 2013.25, linetype="dashed", 
    #            color = "#FBC02DFF", size=1, alpha = 0.35) # start of the Universal Credit rollout
  care_poverty_plot
  
  
  birm_poverty_plot <- poverty_series %>% 
    ggplot(aes(x = end_period_year, y = pc)) +
    geom_rect(data=NULL,aes(xmin=2008,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2008,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year %in% c(2012:2015)),
              aes(x = end_period_year, y = pc), alpha = 0.4, color = "#0054FFFF") +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year <= 2012),
              aes(x = end_period_year, y = pc), color = "#0054FFFF") +
    geom_line(data = poverty_series %>% 
                mutate(measure = ifelse(level == "Birmingham", "Estimate", measure)) %>% 
                filter(measure != "HBAI - children 0-20") %>% 
                filter(level == "Birmingham",
                       end_period_year >= 2015),
              aes(x = end_period_year, y = pc), color = "#0054FFFF") +
    scale_y_continuous(name = "",
                       limits = c(0, 0.45),
                       expand = c(0,0)) +
    scale_x_continuous(name = "", 
                       breaks = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022), 
                       labels = c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"),
                       limits = c(2005.5, 2022.5),
                       expand = c(0,0)) +
    theme_bw() 
    
  birm_poverty_plot
  
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
  filter(level != "Birmingham") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(level, age), color = interaction(level, age))) +
  scale_color_manual(values = c("#3299FFFF", "#3299FFFF", "#0054FFFF", "#0054FFFF", "#66BD63FF","#1A9850FF", "#B39DDBFF", "#673AB7FF"),
                     guide = FALSE) +
  theme_bw() +
  geom_line(data = care_rates %>%
              select(end_period_year, age, pc_school, pc_census) %>% 
              pivot_longer(c(pc_census, pc_school),
                           names_to = "source",
                           values_to = "pc") %>% 
              group_by(age) %>% 
              arrange(end_period_year) %>% 
              mutate(pc = ifelse(source == "pc_school", na.approx(pc), pc)) %>% 
              filter(source == "pc_census"),
            aes(x = end_period_year, y = pc, group = interaction(age, source), color = interaction(age, source))) +
  geom_line(data = care_rates %>%
              select(end_period_year, age, pc_school, pc_census) %>% 
              pivot_longer(c(pc_census, pc_school),
                           names_to = "source",
                           values_to = "pc") %>% 
              group_by(age) %>% 
              arrange(end_period_year) %>% 
              mutate(pc = ifelse(source == "pc_school", na.approx(pc), pc)) %>% 
              filter(source == "pc_school",
                     end_period_year >= 2020),
            aes(x = end_period_year, y = pc, group = interaction(age, source), color = interaction(age, source)), alpha = 0.6) +
  
  # geom_vline(xintercept = 2019,
  #            color = "white", size=1.2, alpha = 1) +
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

  
  
0.007839777 


0.008166877

 

  ggplot() +
  geom_line(data = care_rates %>%
              select(end_period_year, age, pc_school, pc_census) %>% 
              pivot_longer(c(pc_census, pc_school),
                           names_to = "source",
                           values_to = "pc") %>% 
              group_by(age) %>% 
              arrange(end_period_year) %>% 
              mutate(pc = ifelse(source == "pc_school", na.approx(pc), pc)),
              aes(x = end_period_year, y = pc, group = interaction(age, source), color = interaction(age, source))) +
  scale_color_manual(values = c("#3299FFFF", "#0054FFFF", "#3299FFFF", "#0054FFFF"),
                     guide = FALSE) +
  










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



neet_levels_plot <- neet_levels_11to23_age  %>% 
  group_by(end_period_year, level, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  filter(neet == "NEET") %>% 
  select(-c(count, neet)) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(level, age), colour = interaction(level, age))) +
  # scale_color_manual(values = c("lightgrey", "#DE4434", "#399FE0", "darkgrey", "#9C2F24", "#246D9C")) +
  scale_color_manual(values = c("#3299FFFF", "#66BD63FF","#B39DDBFF", "#0054FFFF", "#1A9850FF", "#673AB7FF"),
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
            aes(x = end_period_year, y = pc), color = "#3299FFFF", alpha = 0.4) +
  geom_vline(xintercept = 2010.75, linetype="dashed",
             color = "#FBC02DFF", size=1, alpha = 0.35) + #EMA discontinued
  geom_vline(xintercept = 2013.67,  linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) +  #just guessing happened in sept
  # geom_text(aes(x=2012.1, label="\nPolicy change for 16+", y=0.02), colour="grey", angle=90) +
  geom_vline(xintercept = 2011, linetype="dashed",
             color = "#FBC02DFF", size=1, alpha = 0.35) +
  # geom_text(aes(x=2010.6, label="\n2011 Education Act ends required monitoring of participation", y=0.04), colour="grey", angle=90) +
  geom_vline(xintercept = 2015.67, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35)  #just guessing happened in sept
  # geom_text(aes(x=2014.1, label="\nPolicy change for 17+", y=0.075), colour="grey", angle=90) +
  # geom_vline(xintercept = 2019,
             # color = "white", size=1.2, alpha = 1)
# geom_text(aes(x=2018.6, label="\nCOVID", y=0.075), colour="grey", angle=90)

neet_levels_plot
# need to read maguire 2015 and fergusson 2014 
ggsave(filename = "output/graphs/neet_rates_plot.png", neet_rates_plot)



neet_nk_plot16 <- neet_nk_11to23_age %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  mutate(NEET = NEET/Total,
         NK = NK/Total) %>% 
  select(-Total) %>% 
  # pivot_longer(c(NEET, NK),
  #              names_to = "neet",
  #              values_to = "pc") %>% 
  # group_by(end_period_year, age) %>% 
  mutate(neet_nk = NEET + NK) %>% 
  filter(age == 16) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = neet_nk, color = as.character(age))) +
  geom_line(aes(x = end_period_year, y = NEET, color = as.character(age))) +
  geom_ribbon(aes(x = end_period_year, ymin=NEET, ymax=neet_nk, group = as.character(age)), fill = "#91A1BAFF", alpha=0.25) +
  geom_ribbon(aes(x = end_period_year, ymin=0,ymax=NEET, fill = as.character(age)), alpha=0.5) +
  # geom_line(aes(x = end_period_year, y = pc, group = interaction(age, neet), colour = interaction(age, neet))) +
  scale_color_manual(values = c("#3299FFFF"),
                     guide = F) +
  scale_fill_manual(values = c("#3299FFFF"),
                    guide = F) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     limits = c(2010.5, 2023.5),
                     expand = c(0,0),
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.45),
                     expand = c(0,0)) +
  geom_vline(xintercept = 2010.75, linetype="dashed",
             color = "#FBC02DFF", size=1, alpha = 0.35) + #EMA discontinued
  geom_vline(xintercept = 2013.67,  linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) +  #just guessing happened in sept
  # geom_text(aes(x=2012.1, label="\nPolicy change for 16+", y=0.02), colour="grey", angle=90) +
  geom_vline(xintercept = 2011, linetype="dashed",
             color = "#FBC02DFF", size=1, alpha = 0.35) 

neet_nk_plot16


neet_nk_plot17 <- neet_nk_11to23_age %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  mutate(NEET = NEET/Total,
         NK = NK/Total) %>% 
  select(-Total) %>% 
  # pivot_longer(c(NEET, NK),
  #              names_to = "neet",
  #              values_to = "pc") %>% 
  # group_by(end_period_year, age) %>% 
  mutate(neet_nk = NEET + NK) %>% 
  filter(age == 17) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = neet_nk, color = as.character(age))) +
  geom_line(aes(x = end_period_year, y = NEET, color = as.character(age))) +
  geom_ribbon(aes(x = end_period_year, ymin=NEET, ymax=neet_nk, group = as.character(age)), fill = "#91A1BAFF", alpha=0.25) +
  geom_ribbon(aes(x = end_period_year, ymin=0,ymax=NEET, fill = as.character(age)), alpha=0.5) +
  # geom_line(aes(x = end_period_year, y = pc, group = interaction(age, neet), colour = interaction(age, neet))) +
  scale_color_manual(values = c("#0054FFFF"),
                     guide = F) +
  scale_fill_manual(values = c("#0054FFFF"),
                    guide = F) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     limits = c(2010.5, 2023.5),
                     expand = c(0,0),
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.45),
                     expand = c(0,0)) +
  geom_vline(xintercept = 2010.75, linetype="dashed",
             color = "#FBC02DFF", size=1, alpha = 0.35) + #EMA discontinued
  geom_vline(xintercept = 2011, linetype="dashed",
             color = "#FBC02DFF", size=1, alpha = 0.35) +
  # geom_text(aes(x=2010.6, label="\n2011 Education Act ends required monitoring of participation", y=0.04), colour="grey", angle=90) +
  geom_vline(xintercept = 2015.67, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35)

neet_nk_plot17






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
  mutate(check = 1) %>% 
  group_by(end_period_year, level, academy) %>%
  summarise(count = sum(count),
            num_acad = sum(check)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = academy,
              values_from = c(count, num_acad),
              values_fill = 0) %>% 
  mutate(pc_pupils = count_Academy/(count_Academy + `count_Not academy`),
         pc_schools = num_acad_Academy/(num_acad_Academy + `num_acad_Not academy`)) %>% 
# %>% 
# %>% 
  # select(end_period_year, level, pc) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_pupils, color = level)) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2010","2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 1),
                     expand = c(0,0)) +
  # ggtitle("Percentage of children age 10-15 attending academies, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#1A9850FF", "#673AB7FF", "#0054FFFF"),
                     guide = FALSE)
  
academy
ggsave(filename = "output/graphs/academy.png", academy)
# ROUGH JOB, HAVENT DONE V THOROUGH CHECK ABOUT WHETHER IVE IDENTIFIED ALL THE ACADEMIES
https://birmingham.cmis.uk.com/Birmingham/Document.ashx?czJKcaeAi5tUFL1DTL2UE4zNRBcoShgo=usanmLdDA3wNIUjaYD4HgKfXiogrOpLpKud8nzmoUCUzIJ4znDqUxQ%3D%3D&rUzwRPf%2BZ3zd4E7Ikn8Lyw%3D%3D=pwRE6AGJFLDNlh225F5QMaQWCtPHwdhUfCZ%2FLUQzgA2uL5jNRG4jdQ%3D%3D&mCTIbCubSFf





























schools_fsm <- schools_10to22_fsm %>%
  left_join(s_data) 


fsm_plot <- schools_fsm %>% 
  group_by(end_period_year, level) %>%
  mutate(school_headcount = as.numeric(school_headcount),
         school_fsm = as.numeric(school_fsm)) %>% 
  summarise(count = sum(school_headcount, na.rm = T),
            fsm = sum(school_fsm, na.rm = T)) %>% 
  ungroup() %>% 
  pivot_longer(c(fsm, count),
               names_to = "fsm",
               values_to = "count") %>% 
  pivot_wider(names_from = level,
              values_from = count) %>% 
  mutate(`(rest of) England` = `(rest of) England` + `(rest of) West Midlands (region)` + `Birmingham`,
         `(rest of) West Midlands (region)` = `(rest of) West Midlands (region)` + `Birmingham`) %>%
  pivot_longer(c(`(rest of) England`, `(rest of) West Midlands (region)`, `Birmingham`),
               names_to = "level",
               values_to = "count") %>% 
  pivot_wider(names_from = fsm,
              values_from = count) %>% 
  mutate(pc = fsm/count) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
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
  scale_color_manual(values = c("#1A9850FF", "#673AB7FF", "#0054FFFF"),
                     guide = FALSE) +
  geom_vline(xintercept = 2018.15, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) +
  geom_vline(xintercept = 2010.75, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) 
  
  # frozen since 2010–11 for child tax credit recipients and since 2018–19
  
  # geom_vline(xintercept = 2019,
  #            color = "white", size=1.2, alpha = 1)



# This steep increase is partly due to the transitional protections introduced in April 2018 to cover the roll-out of universal credit. 



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
  pivot_wider(names_from = level,
              values_from = count) %>% 
  mutate(`(rest of) England` = `(rest of) England` + `(rest of) West Midlands (region)` + `Birmingham`,
         `(rest of) West Midlands (region)` = `(rest of) West Midlands (region)` + `Birmingham`) %>%
  pivot_longer(c(`(rest of) England`, `(rest of) West Midlands (region)`, `Birmingham`),
               names_to = "level",
               values_to = "count") %>% 
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
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
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
  scale_color_manual(values = c("#1A9850FF", "#673AB7FF",  "#0054FFFF","#66BD63FF", "#B39DDBFF",  "#3299FFFF"),
                     guide = FALSE) +
  geom_vline(xintercept = 2011.85, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) + #bill got royal assent in november
  # geom_text(aes(x=2010.6, label="\nEducation Act 2011", y=0.01364), colour="grey", angle=90) +
  geom_vline(xintercept = 2012.67, linetype="dashed", 
             color = "#FBC02DFF", size=1, alpha = 0.35) +#regulation in effect 1st sep
  # geom_text(aes(x=2011.6, label="\nSchool Discipline Regulations 2012", y=0.017), colour="grey", angle=90) +
geom_vline(xintercept = 2013.25, linetype="dashed", 
           color = "#FBC02DFF", size=1, alpha = 0.35) 
  # geom_vline(xintercept = 2018.17, linetype="dashed", 
  #            color = "#FBC02DFF", size=1, alpha = 0.35) 
  # geom_vline(xintercept = 2018, linetype="dashed", 
  #            color = "black", size=1, alpha = 0.3) +
  # geom_text(aes(x=2017.6, label="\n???", y=0.022), colour="grey", angle=90) +
  # geom_text(aes(x=2019, label="\nEngland:", y=0.022), hjust = 0, colour="black", angle=0) +
  # geom_text(aes(x=2019, label="\nWest Midlands:", y=0.0205), hjust = 0, colour="black", angle=0) +
  # geom_text(aes(x=2019, label="\nBirmingham:", y=0.019), hjust = 0, colour="black", angle=0) +
  # geom_text(aes(x=2020.1, label="\nEligible/", y=0.022), hjust = 0, colour="#468F5F", angle=0) +
  # geom_text(aes(x=2021.1, label="\nNot", y=0.022), hjust = 0, colour="#9BD4B1", angle=0) +
  # geom_vline(xintercept = 2019,
  #            color = "white", size=1.2, alpha = 1) +
  # geom_vline(xintercept = 2010.4, linetype="dashed", 
  #            color = "darkblue", size=1, alpha = 0.4)


pru_plot
ggsave(filename = "output/graphs/pru_plot.png", pru_plot)





segregation <- schools_10to22_age_gender %>%
  filter(age %in% 10:15) %>% 
  left_join(schools_fsm %>% 
              mutate(fsm_pc = school_fsm / school_headcount) %>% 
              mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc))) %>% 
  mutate(count_fsm = count * fsm_pc) %>% 
  group_by(end_period_year, level, school) %>% 
  summarise(school_headcount = sum(count),
            school_fsm = sum(count_fsm)) %>% 
  ungroup() %>% 
  group_by(end_period_year, level) %>% 
  mutate(tot_level_count = sum(school_headcount),
         tot_level_fsm = sum(school_fsm)) %>% 
  ungroup() %>% 
  mutate(isolation = (school_fsm/tot_level_fsm)*(school_fsm/school_headcount),
         iso_wide = tot_level_fsm/tot_level_count,
         iso_within = (school_fsm/tot_level_fsm)*((school_fsm/school_headcount) - (tot_level_fsm/tot_level_count))) %>% 
  group_by(end_period_year, level) %>% 
  summarise(isolation = sum(isolation),
            iso_wide = mean(iso_wide),
            iso_within = sum(iso_within)) %>% 
  mutate(level = factor(level, levels = c("Birmingham", "(rest of) West Midlands (region)", "(rest of) England"))) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = isolation)) +
  geom_line(aes(x = end_period_year, y = iso_within)) +
  geom_ribbon(aes(x = end_period_year, ymin=iso_within,ymax=isolation), fill="blue", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=0,ymax=iso_within), fill="red", alpha=0.5) +
  facet_grid(cols = vars(level))
segregation

ggsave(filename = "output/graphs/segregation.png", segregation)


care_age_check <- schools_10to22_age_gender %>%
  left_join(s_data) %>% 
  filter(age %in% c(10:15),
         level == "Birmingham",
         school == "Laces") %>% 
  group_by(end_period_year, gender, age) %>% 
  summarise(count = sum(count)) %>% 
  ungroup()



  care_calc <- care_school_16to22 %>% 
    select(end_period_year, t_pru, t_secondary) %>% 
    mutate(pc = as.numeric(t_pru)/(as.numeric(t_secondary)+as.numeric(t_pru))) %>% 
    select(end_period_year, pc) %>% 
    mutate(group = "care") %>% 
    bind_rows(schools_10to22_age_gender %>%
                left_join(s_data) %>% 
                filter(age %in% c(10:15),
                       level == "Birmingham",
                       school == "Laces") %>% 
                group_by(end_period_year) %>% 
                summarise(pru = sum(count)) %>% 
                ungroup() %>% 
                left_join(care_11to22_age %>% 
                            filter(age == "10-15",
                                   level == "Birmingham") %>% 
                            select(end_period_year, count)) %>% 
                mutate(pc = pru/count,
                       group = "care") %>% 
                filter(end_period_year %in% c(2011:2012)) %>% 
                select(end_period_year, pc, group)) %>% 
    bind_rows(school_pru %>% 
                group_by(end_period_year) %>% 
                summarise(`Not PRU` = sum(`Not PRU`),
                          PRU = sum(PRU)) %>% 
                mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
                mutate(group = "all"))  %>% 
    bind_rows(school_pru %>% 
                filter(fsm == "FSM eligible") %>% 
                group_by(end_period_year) %>% 
                summarise(`Not PRU` = sum(`Not PRU`),
                          PRU = sum(PRU)) %>% 
                mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
                mutate(group = "FSM")) %>% 
    select(end_period_year, pc, group) %>% 
    pivot_wider(names_from = group,
                values_from = pc) %>% 
    mutate(care_mult = care/all,
           fsm_mult = FSM/all) %>% 
    ggplot() +
    geom_line(aes(x = end_period_year, y = fsm_mult)) +
    geom_line(aes(x = end_period_year, y = care_mult)) 


  care_calc
  
  

care_v_all_pru_rate <- care_school_16to22 %>% 
  select(end_period_year, t_pru, t_secondary) %>% 
  mutate(pc = as.numeric(t_pru)/(as.numeric(t_secondary)+as.numeric(t_pru))) %>% 
  select(end_period_year, pc) %>% 
  mutate(group = "care") %>% 
  bind_rows(schools_10to22_age_gender %>%
              left_join(s_data) %>% 
              filter(age %in% c(10:15),
                     level == "Birmingham",
                     school == "Laces") %>% 
              group_by(end_period_year) %>% 
              summarise(pru = sum(count)) %>% 
              ungroup() %>% 
              left_join(care_11to22_age %>% 
                          filter(age == "10-15",
                                 level == "Birmingham") %>% 
                          select(end_period_year, count)) %>% 
              mutate(pc = pru/count,
                     group = "min_rate_care") %>% 
              filter(end_period_year %in% c(2011:2012)) %>% 
              select(end_period_year, pc, group)) %>% 
  bind_rows(school_pru %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "all"))  %>% 
  bind_rows(school_pru %>% 
              filter(fsm == "FSM eligible") %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "FSM")) %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc, group = group, colour = group)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2010","2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.052),
                     expand = c(0,0)) +
  # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
  scale_color_manual(values = c("#39B185FF", "#ED3F39FF", "#4CA5FFFF", "#ED3F39FF"),
                     guide = F) 
care_v_all_pru_rate

ggsave(filename = "output/graphs/care_v_all_pru_rate.png", care_v_all_pru_rate)


care_1015 <- care_11to22_age %>% 
  filter(level == "Birmingham",
         age %in% c("10-15","16+"))%>% 
  left_join(neet_11to23_age %>% 
              group_by(end_period_year) %>% 
              summarise(school_pop = sum(count)) %>% 
              mutate(age = "16+") %>% 
              bind_rows(schools_school_level %>% 
                          filter(level == "Birmingham",
                                 age %in% c(10:15)) %>%
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
         pc_census = count/census_pop) %>% 
  filter(age == "10-15") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y = pc_school), colour = "#762A83FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2010.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.0124),
                     expand = c(0,0)) 
care_1015









care_v_all_pru_rate <- care_school_16to22 %>% 
  select(end_period_year, t_pru, t_secondary) %>% 
  mutate(pc = as.numeric(t_pru)/(as.numeric(t_secondary)+as.numeric(t_pru))) %>% 
  select(end_period_year, pc) %>% 
  mutate(group = "care") %>% 
  bind_rows(school_pru %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "all"))  %>% 
  bind_rows(school_pru %>% 
              filter(fsm == "FSM eligible") %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "FSM")) %>% 
  select(end_period_year, pc, group) %>% 
  group_by(group) %>% 
  arrange(end_period_year) %>% 
  mutate(pc_diff = (lead(pc) - pc)/lead(pc)) %>% 
  pivot_wider(names_from = group,
              values_from = c(pc, pc_diff)) %>% 
  mutate(pc_diff_care = ifelse(end_period_year %in% c(2010:2016), (pc_diff_FSM + pc_diff_all)/2, pc_diff_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2016, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2015, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2014, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2013, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2012, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2011, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) %>% 
  mutate(pc_care = ifelse(end_period_year == 2010, lead(pc_care) + pc_diff_care*lead(pc_care), pc_care)) 
  
  
# assumption check graph - how much different was the year before compared to present year?
care_v_all_pru_rate <- care_school_16to22 %>% 
  select(end_period_year, t_pru, t_secondary) %>% 
  mutate(pc = as.numeric(t_pru)/(as.numeric(t_secondary)+as.numeric(t_pru))) %>% 
  select(end_period_year, pc) %>% 
  mutate(group = "care") %>% 
  bind_rows(school_pru %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "all"))  %>% 
  bind_rows(school_pru %>% 
              filter(fsm == "FSM eligible") %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "FSM")) %>% 
  select(end_period_year, pc, group) %>% 
  group_by(group) %>% 
  arrange(end_period_year) %>% 
  mutate(pc_diff = (pc - lag(pc))/lag(pc)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_diff, group = group, colour = group))

care_v_all_pru_rate


pru_rate_byfsm_boy <- school_pru %>% 
  mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pc_in_pru, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2010,  2012, 2014, 2016, 2018, 2020, 2022), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.1),
                     expand = c(0,0)) +
  scale_color_manual(values = c("#3A488AFF", "#8785B2FF"),
                     guide = F)
  
  
  
pru_rate_byfsm_boy
ggsave(filename = "output/graphs/pru_rate_byfsm_boy.png", pru_rate_byfsm_boy)


pru_rate_byfsm_girl <- school_pru %>% 
  mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
  filter(age <= 15,
         gender == "Girls") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pc_in_pru, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2010,  2012, 2014, 2016, 2018, 2020, 2022), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.045),
                     expand = c(0,0)) +
  scale_color_manual(values = c("#BE3428FF", "#D95F30FF"),
                     guide = F)
pru_rate_byfsm_girl
ggsave(filename = "output/graphs/pru_rate_byfsm_girl.png", pru_rate_byfsm_girl)


num_prus <-  schools_10to22_age_gender %>% 
  left_join(s_data) %>% 
  filter(age %in% c(10:15),
         level == "Birmingham",
         my_categories == "Pupil referral unit") %>% 
  group_by(end_period_year, school_type, school_subtype, school) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(check = 1) %>% 
  group_by(end_period_year) %>% 
  mutate(num_prus = sum(check)) %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = school),
           stat = "identity", position = "dodge")

num_prus

num_prus_small <-  schools_10to22_age_gender %>% 
  left_join(s_data) %>% 
  filter(age %in% c(10:15),
         level == "Birmingham",
         my_categories == "Pupil referral unit") %>% 
  mutate(school = ifelse(school == "The City of Birmingham School", "City of Birmingham School", school),
         school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
         school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school)) %>% 
  group_by(end_period_year, school_type, school_subtype, school) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(check = 1) %>% 
  group_by(end_period_year) %>% 
  mutate(num_prus = sum(check)) %>% 
  # filter(!school %in% c("The Behaviour Support Service", "City of Birmingham School")) %>% 
  mutate(school = factor(school, levels = c("Focus College", "Virtual College", "Laces", "East Birmingham Network Academy", "Reach School", "St Georges Academy", "The Edge Academy","CUL Academy Trust", "EBN Academy Phase 2", "Titan Aston Academy", "Titan St Georges Academy", "The Behaviour Support Service", "City of Birmingham School"))) %>% 
  ungroup() %>%
  select(end_period_year, school, count) %>% 
  pivot_wider(names_from = school,
              values_from = count,
              values_fill = 0) %>% 
  add_row(end_period_year = 2009) %>% 
  mutate(across(-end_period_year, ~ifelse(is.na(.x), 0, .x))) %>% 
  # pivot_longer(-end_period_year,
  #              names_to = "school",
  #              values_to = "count") %>% +
  ggplot() +
  # geom_ribbon(aes(x = end_period_year, ymin=iso_within,ymax=isolation), fill="blue", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=0,ymax=`Focus College`), fill="#A50021FF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`, ymax=`Focus College`+`Virtual College`), fill="#D82632FF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`, ymax=`Focus College`+Laces+`Virtual College`), fill="#D82632FF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+Laces+`Virtual College`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`), fill="#F76D5EFF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`), fill="#FFAD72FF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`), fill="#FFE099FF", alpha=0.5) +
geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`), fill="#FFFFBFFF", alpha=0.5) +
geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`), fill="#E0FFFFFF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`), fill="#AAF7FFFF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`), fill="#72D8FFFF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`+`Titan St Georges Academy`), fill="#3FA0FFFF", alpha=0.5) +
  # geom_ribbon(aes(x = end_period_year, ymin=`Focus College+`Virtual College``+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`+`Titan St Georges Academy`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`+`Titan St Georges Academy`), fill="#264CFFFF", alpha=0.5)
  geom_ribbon(aes(x = end_period_year, ymin=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`+`Titan St Georges Academy`, ymax=`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`+`Titan St Georges Academy`+`The Behaviour Support Service`+`City of Birmingham School`), fill="#264CFFFF", alpha=0.5)

          



#A16928FF #BD925AFF #D6BD8DFF #EDEAC2FF #B5C8B8FF #79A7ACFF #2887A1FF
  
  # geom_bar(aes(x = interaction(school, end_period_year), y = count, fill = school),
  #          stat = "identity", position = "dodge") +
  # scale_fill_manual(values = c("#1A9850FF", "#673AB7FF",  "#0054FFFF","#66BD63FF", "#B39DDBFF",  "#3299FFFF", "#1A9850FF", "#673AB7FF",  "#0054FFFF","#66BD63FF", "#B39DDBFF",  "#3299FFFF"))

  num_prus_small

  # the behaviour sipport serivce is at the city of birmingham school
  
  num_prus_small <-  schools_10to22_age_gender %>% 
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school == "The City of Birmingham School", "City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school)) %>% 
    group_by(end_period_year, school_type, school_subtype, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    mutate(check = 1) %>% 
    group_by(end_period_year) %>% 
    mutate(num_prus = sum(check)) %>% 
    # filter(!school %in% c("The Behaviour Support Service", "City of Birmingham School")) %>% 
    mutate(school = factor(school, levels = c("Focus College", "Virtual College", "Laces", "East Birmingham Network Academy", "Reach School", "St Georges Academy", "The Edge Academy","CUL Academy Trust", "EBN Academy Phase 2", "Titan Aston Academy", "Titan St Georges Academy", "The Behaviour Support Service", "City of Birmingham School"))) %>% 
    ungroup() %>%
    select(end_period_year, school, count) %>% 
    pivot_wider(names_from = school,
                values_from = count,
                values_fill = 0) %>% 
    # add_row(end_period_year = 2009) %>% 
    # mutate(across(-end_period_year, ~ifelse(is.na(.x), 0, .x))) %>% 
    # pivot_longer(-end_period_year,
    #              names_to = "school",
    #              values_to = "count") %>% +
    ggplot() + 
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=`The Behaviour Support Service`+`City of Birmingham School`), fill="#663000FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`,ymax=`Focus College`+`The Behaviour Support Service`+`City of Birmingham School`), fill="#A50021FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`), fill="#D82632FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+Laces+`Virtual College`), fill="#D82632FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+Laces+`Virtual College`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`), fill="#F76D5EFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`), fill="#FFAD72FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`), fill="#FFE099FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`), fill="#FFFFBFFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`), fill="#E0FFFFFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`), fill="#AAF7FFFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`), fill="#72D8FFFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`, ymax=`The Behaviour Support Service`+`City of Birmingham School`+`Focus College`+`Virtual College`+Laces+`East Birmingham Network Academy`+`Reach School`+`St Georges Academy`+`The Edge Academy`+`CUL Academy Trust`+`EBN Academy Phase 2`+`Titan Aston Academy`+`Titan St Georges Academy`), fill="#3FA0FFFF", alpha=0.5) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010,  2012, 2014, 2016, 2018, 2020, 2022), 
                       labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 700),
                       expand = c(0,0))

  
  
  
  ggsave(filename = "output/graphsnum_prus_small.png", num_prus_small)
  
  
  
  num_pru_big <-  schools_10to22_age_gender %>%
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school)) %>% 
    group_by(end_period_year, school_type, school_subtype, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    mutate(check = 1) %>% 
    group_by(end_period_year) %>% 
    mutate(num_prus = sum(check)) %>% 
    left_join(schools_fsm %>% 
                mutate(fsm_pc = school_fsm / school_headcount) %>% 
                mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc)) %>% 
                mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
                       school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
                       school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school))) %>% 
    mutate(count_fsm = count * fsm_pc,
           count_non_fsm = count * (1-fsm_pc)) %>% 
    filter(school == "Behaviour Support Service at The City of Birmingham School") %>% 
    ggplot() + 
    geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(aes(x = end_period_year, y=count_fsm), colour="#276785FF") +
    geom_line(aes(x = end_period_year, y=count_fsm+count_non_fsm), colour="#B48A2CFF") +
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=count_fsm), fill="#9BB0FEFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=count_fsm,ymax=count_fsm+count_non_fsm), fill="#DCD66EFF", alpha=0.5) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                       labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 400),
                       expand = c(0,0)) +
    theme(strip.text = element_blank())
    
  num_pru_big
  
      
      
      
      # %>% 
      
     
        num_prus_small <-  schools_10to22_age_gender %>%
        left_join(s_data) %>% 
        filter(age %in% c(10:15),
               level == "Birmingham",
               my_categories == "Pupil referral unit") %>% 
        mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
               school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
               school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school)) %>% 
        group_by(end_period_year, school_type, school_subtype, school) %>% 
        summarise(count = sum(count)) %>% 
        ungroup() %>% 
        mutate(check = 1) %>% 
        group_by(end_period_year) %>% 
        mutate(num_prus = sum(check)) %>% 
        left_join(schools_fsm %>% 
                    mutate(fsm_pc = school_fsm / school_headcount) %>% 
                    mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc)) %>% 
                    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
                           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
                           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school))) %>% 
        mutate(count_fsm = count * fsm_pc,
               count_non_fsm = count * (1-fsm_pc)) %>% 
        filter(school != "Behaviour Support Service at The City of Birmingham School") %>% 
        mutate(school = factor(school, levels = c("Focus College", "Virtual College", "Laces", "East Birmingham Network Academy", "Reach School", "St Georges Academy", "The Edge Academy","CUL Academy Trust", "EBN Academy Phase 2", "Titan Aston Academy", "Titan St Georges Academy"))) %>% 
        ggplot() + 
        geom_bar(aes(x = interaction(school,end_period_year), y = count_fsm, fill=school), stat = "identity", position = "dodge2")
      
      
      num_prus_small
      
  
      
      
      
      # %>% 
      
      
      num_prus_small <-  schools_10to22_age_gender %>%
        left_join(s_data) %>% 
        filter(age %in% c(10:15),
               level == "Birmingham",
               my_categories == "Pupil referral unit") %>% 
        mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
               school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
               school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
               school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>% 
        group_by(end_period_year, school_type, school_subtype, school) %>% 
        summarise(count = sum(count)) %>% 
        ungroup() %>% 
        mutate(check = 1) %>% 
        group_by(end_period_year) %>% 
        mutate(num_prus = sum(check)) %>% 
        left_join(schools_fsm %>% 
                    mutate(fsm_pc = school_fsm / school_headcount) %>% 
                    mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc)) %>% 
                    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
                           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
                           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
                           school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school))) %>% 
        mutate(count_fsm = count * fsm_pc,
               count_non_fsm = count * (1-fsm_pc)) %>% 
        filter(school != "Behaviour Support Service at The City of Birmingham School") %>% 
        filter(school != "Focus College") %>% 
        mutate(school = factor(school, levels = c("Virtual College", "Laces", "East Birmingham Network Academy", "Reach School", "St Georges Academy", "CUL Academy Trust","The Edge Academy", "EBN Academy Phase 2", "Titan Aston Academy"))) %>% 
        ggplot() + 
        geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
                  fill="#F7F7F7", alpha = 0.1) +
        geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
                  fill="#EEEEEE", alpha = 0.1) +
        geom_vline(xintercept = 2014,  #linetype="dotted",
                   color = "black", size=0.7, alpha = 0.05) +
        geom_vline(xintercept = 2022,  #linetype="dotted",
                   color = "black", size=0.7, alpha = 0.05) +
        geom_line(aes(x = end_period_year, y=count_fsm), colour="#276785FF") +
        geom_line(aes(x = end_period_year, y=count_fsm+count_non_fsm), colour="#B48A2CFF") +
        geom_ribbon(aes(x = end_period_year, ymin=0,ymax=count_fsm), fill="#9BB0FEFF", alpha=0.5) +
        geom_ribbon(aes(x = end_period_year, ymin=count_fsm,ymax=count_fsm+count_non_fsm), fill="#DCD66EFF", alpha=0.5) +
        facet_grid(rows = vars(school)) +
        theme_bw() +
        scale_x_continuous(limits = c(2009.5, 2022.5),
                           expand = c(0,0),
                           name = "", 
                           breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                           labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
        scale_y_continuous(name = "",
                           limits = c(0, 80),
                           expand = c(0,0),
                           breaks = c(0,30,60),
                           labels = c("0","30","60")) +
        theme(strip.text = element_blank())
   
      
      num_prus_small
      
      LACES IS Looked After Children Education Service!!  Virtual School for LAC (LACES).
      https://proceduresonline.com/trixcms/media/1688/ola-children-placed-in-birmingham-ct-160318-rev-270718.pdf
  
      
      
      genage_pru_plot_b <- schools %>% 
        mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
        filter(age %in% c(10:15)) %>% 
        # age != 11) %>% 
        group_by(end_period_year, level, gender, age, fsm, pru) %>%
        summarise(count = sum(count, na.rm = T)) %>% 
        ungroup() %>% 
        pivot_wider(names_from = level,
                    values_from = count,
                    values_fill = 0) %>% 
        mutate(`(rest of) England` = `(rest of) England` + `(rest of) West Midlands (region)` + `Birmingham`,
               `(rest of) West Midlands (region)` = `(rest of) West Midlands (region)` + `Birmingham`) %>%
        pivot_longer(c(`(rest of) England`, `(rest of) West Midlands (region)`, `Birmingham`),
                     names_to = "level",
                     values_to = "count") %>% 
        pivot_wider(names_from = pru,
                    values_from = count,
                    values_fill = 0) %>% 
        mutate(pc = PRU/(PRU + `Not PRU`)) %>% 
        select(end_period_year, level, gender, age, fsm, pc) %>% 
        filter(gender == "Boys") %>% 
        ggplot() +
        geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
                  fill="#F7F7F7", alpha = 0.1) +
        geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
                  fill="#EEEEEE", alpha = 0.1) +
        geom_vline(xintercept = 2014,  #linetype="dotted",
                   color = "black", size=0.7, alpha = 0.05) +
        geom_vline(xintercept = 2022,  #linetype="dotted",
                   color = "black", size=0.7, alpha = 0.05) +
        geom_line(aes(x = end_period_year, y = pc, color = interaction(level, fsm))) +
       facet_grid(rows = vars(gender),
                   cols = vars(age)) +
        theme_bw() +
        scale_x_continuous(limits = c(2009.5, 2022.5),
                           expand = c(0,0),
                           name = "", 
                           breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                           labels = c("'10", "'12", "'14", "'16", "'18", "'20", "'22")) +
        scale_y_continuous(name = "",
                           limits = c(0, 0.1),
                           expand = c(0,0)) +
        # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
        scale_color_manual(values = c("#1A9850FF", "#673AB7FF",  "#0054FFFF","#66BD63FF", "#B39DDBFF",  "#3299FFFF"),
                           guide = FALSE) +
        theme(strip.text = element_blank())
      
      
      genage_pru_plot_b
      
      
      genage_pru_plot_g <- schools %>% 
        mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
        filter(age %in% c(10:15)) %>% 
        # age != 11) %>% 
        group_by(end_period_year, level, gender, age, fsm, pru) %>%
        summarise(count = sum(count, na.rm = T)) %>% 
        ungroup() %>% 
        pivot_wider(names_from = level,
                    values_from = count,
                    values_fill = 0) %>% 
        mutate(`(rest of) England` = `(rest of) England` + `(rest of) West Midlands (region)` + `Birmingham`,
               `(rest of) West Midlands (region)` = `(rest of) West Midlands (region)` + `Birmingham`) %>%
        pivot_longer(c(`(rest of) England`, `(rest of) West Midlands (region)`, `Birmingham`),
                     names_to = "level",
                     values_to = "count") %>% 
        pivot_wider(names_from = pru,
                    values_from = count,
                    values_fill = 0) %>% 
        mutate(pc = PRU/(PRU + `Not PRU`)) %>% 
        select(end_period_year, level, gender, age, fsm, pc) %>% 
        filter(gender == "Girls") %>% 
        ggplot() +
        geom_rect(data=NULL,aes(xmin=2009.5,xmax=2014,ymin=-Inf,ymax=Inf),
                  fill="#F7F7F7", alpha = 0.1) +
        geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
                  fill="#EEEEEE", alpha = 0.1) +
        geom_vline(xintercept = 2014,  #linetype="dotted",
                   color = "black", size=0.7, alpha = 0.05) +
        geom_vline(xintercept = 2022,  #linetype="dotted",
                   color = "black", size=0.7, alpha = 0.05) +
        geom_line(aes(x = end_period_year, y = pc, color = interaction(level, fsm))) +
        facet_grid(rows = vars(gender),
                   cols = vars(age)) +
        theme_bw() +
        scale_x_continuous(limits = c(2009.5, 2022.5),
                           expand = c(0,0),
                           name = "", 
                           breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                           labels = c("'10", "'12", "'14", "'16", "'18", "'20", "'22")) +
        scale_y_continuous(name = "",
                           limits = c(0, 0.045),
                           expand = c(0,0)) +
        # ggtitle("Trends in PRU attendance rates, in Birmingham, the West Midlands, England") +
        scale_color_manual(values = c("#1A9850FF", "#673AB7FF",  "#0054FFFF","#66BD63FF", "#B39DDBFF",  "#3299FFFF"),
                           guide = FALSE) +
        theme(strip.text = element_blank())
      
      
      genage_pru_plot_g
      
      
      
schools_10to22_age_gender %>%
        left_join(s_data) %>% 
        filter(age %in% c(10:15),
               level == "Birmingham",
               my_categories == "Pupil referral unit") %>% 
        mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "CBS", school),
               school = ifelse(school != "CBS", "Not CBS", school)) %>% 
        group_by(end_period_year, school, pt_ft) %>% 
        summarise(count = sum(count)) %>% 
        ungroup() %>% 
        group_by(end_period_year) %>% 
        mutate(pc = count/sum(count)) %>% 
        ungroup() %>% 
        filter(school == "CBS") %>% 
        ggplot() +
        geom_line(aes(x = end_period_year, y = pc))



pru_ft_pt <-  schools_10to22_age_gender %>%
  left_join(s_data) %>% 
  filter(age %in% c(10:15),
         # level == "Birmingham",
         my_categories == "Pupil referral unit") %>% 
  # mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
  #        school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
  #        school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
  #        school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>% 
  group_by(end_period_year, pt_ft, school) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() 
# THAT CANNOT BE RIGHT THAT NONE OF THEM ARE PART TIME!!!!!!!!!!!!!!!!!!!!!


# %>% 
  filter(school != "Behaviour Support Service at The City of Birmingham School") %>% 
  filter(school != "Focus College") %>% 
  mutate(school = factor(school, levels = c("Virtual College", "Laces", "East Birmingham Network Academy", "Reach School", "St Georges Academy", "The Edge Academy","CUL Academy Trust", "EBN Academy Phase 2", "Titan Aston Academy"))) %>% 
  ggplot() + 
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_line(aes(x = end_period_year, y=count_fsm), colour="#276785FF") +
  geom_line(aes(x = end_period_year, y=count_fsm+count_non_fsm), colour="#B48A2CFF") +
  geom_ribbon(aes(x = end_period_year, ymin=0,ymax=count_fsm), fill="#9BB0FEFF", alpha=0.5) +
  geom_ribbon(aes(x = end_period_year, ymin=count_fsm,ymax=count_fsm+count_non_fsm), fill="#DCD66EFF", alpha=0.5) +
  facet_grid(rows = vars(school)) +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "", 
                     breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
  scale_y_continuous(name = "",
                     limits = c(0, 80),
                     expand = c(0,0),
                     breaks = c(0,30,60),
                     labels = c("0","30","60")) +
  theme(strip.text = element_blank())


  
  gen_check <-  schools_10to22_age_gender %>%
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
           school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>%
    mutate(school = ifelse(school == "Behaviour Support Service at The City of Birmingham School", "BSS-CBS", "AP-Free")) %>% 
    # mutate(age = ifelse(age == 15, age, "<15")) %>% 
    group_by(end_period_year, gender, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    # group_by(end_period_year, age) %>% 
    # mutate(pc = count/sum(count)) %>% 
    # filter(school == "AP-Free") %>% 
    pivot_wider(names_from = school,
                values_from = count) %>% 
    # filter(age == 15) %>% 
    ggplot() +
    geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(aes(x = end_period_year, y=`BSS-CBS`), colour="#204035FF") +
    geom_line(aes(x = end_period_year, y=`AP-Free`+`BSS-CBS`), colour="#803342FF") +
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=`BSS-CBS`), fill="#4A7169FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`BSS-CBS`,ymax=`AP-Free`+`BSS-CBS`), fill="#D7867FFF", alpha=0.5) +
    facet_grid(cols = vars(gender)) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                       labels = c("2010", "", "2012", "", "2014", "", "2016", "", "2018", "", "2020", "", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 510),
                       expand = c(0,0)) +
    theme(strip.text = element_blank())
  
  
  gen_check
  
  
  
  
  
  
  
  
  
  age_check <-  schools_10to22_age_gender %>%
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
           school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>%
    mutate(school = ifelse(school == "Behaviour Support Service at The City of Birmingham School", "BSS-CBS", "AP-Free")) %>% 
    mutate(age = ifelse(age == 15, age, "<15")) %>% 
    group_by(end_period_year, age, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    # group_by(end_period_year, age) %>% 
    # mutate(pc = count/sum(count)) %>% 
    # filter(school == "AP-Free") %>% 
    pivot_wider(names_from = school,
                values_from = count) %>% 
    # filter(age == 15) %>% 
    ggplot() +
    geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(aes(x = end_period_year, y=`BSS-CBS`), colour="#1A3399FF") +
    geom_line(aes(x = end_period_year, y=`AP-Free`+`BSS-CBS`), colour="#993F00FF") +
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=`BSS-CBS`), fill="#3979B7FF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`BSS-CBS`,ymax=`AP-Free`+`BSS-CBS`), fill="#CC5800FF", alpha=0.5) +
    facet_grid(cols = vars(age)) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                       labels = c("2010", "", "2012", "", "2014", "", "2016", "", "2018", "", "2020", "", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 400),
                       expand = c(0,0)) +
    theme(strip.text = element_blank())
  


  age_check
  ggsave(filename = "output/graphs/age_check.png", age_check)
        
  
  

  
  
  
  
  fsm_check <-   schools_10to22_age_gender %>%
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
           school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>% 
    group_by(end_period_year, school_type, school_subtype, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    mutate(check = 1) %>% 
    group_by(end_period_year) %>% 
    mutate(num_prus = sum(check)) %>% 
    left_join(schools_fsm %>% 
                mutate(fsm_pc = school_fsm / school_headcount) %>% 
                mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc)) %>% 
                mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
                       school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
                       school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
                       school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school))) %>% 
    mutate(count_fsm = count * fsm_pc,
           count_non_fsm = count * (1-fsm_pc)) %>% 
    select(end_period_year, school, count_non_fsm, count_fsm) %>% 
    mutate(school = ifelse(school == "Behaviour Support Service at The City of Birmingham School", "BSS-CBS", "AP-Free")) %>% 
    group_by(end_period_year, school) %>% 
    summarise(count_non_fsm = sum(count_non_fsm, na.rm = T),
              count_fsm = sum(count_fsm, na.rm = T)) %>% 
    ungroup() %>% 
    pivot_longer(c(count_non_fsm, count_fsm),
                 names_to = "fsm",
                 values_to = "count") %>% 
    pivot_wider(names_from = school,
                values_from = count) %>% 
    ggplot() +
    geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(aes(x = end_period_year, y=`BSS-CBS`), colour="#276785FF") +
    geom_line(aes(x = end_period_year, y=`AP-Free`+`BSS-CBS`), colour="#B48A2CFF") +
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=`BSS-CBS`), fill="#9BB0FEFF", alpha=0.5) +
    geom_ribbon(aes(x = end_period_year, ymin=`BSS-CBS`,ymax=`AP-Free`+`BSS-CBS`), fill="#DCD66EFF", alpha=0.5) +
    facet_grid(cols = vars(fsm)) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                       labels = c("2010", "", "2012", "", "2014", "", "2016", "", "2018", "", "2020", "", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 460),
                       expand = c(0,0)) +
  theme(strip.text = element_blank())
  
  fsm_check
  
  
  num_prus <- schools_10to22_age_gender %>%
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
           school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school),
           school = ifelse(school == "CUL Academy Trust", "Titan Aston Academy", school)) %>%
    group_by(end_period_year, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    add_row(school = "Virtual College", end_period_year = 2013.25, count = 0) %>% # closed 31 March 2013
    add_row(school = "Laces", end_period_year = 2013.25, count = 0) %>% # closed 31 March 2013
    add_row(school = "St Georges Academy", end_period_year = 2013.67, count = 0) %>% # opened 2 September 2013
    add_row(school = "The Edge Academy", end_period_year = 2015.67, count = 0) %>% # opened 1 September 2015
    add_row(school = "Reach School", end_period_year = 2013.67, count = 0) %>%  # opened 2 September 2013
    add_row(school = "Titan Aston Academy", end_period_year = 2014.67, count = 0) %>% 
    add_row(school = "Titan Aston Academy", end_period_year = 2018.75, count = 21) %>% 
    add_row(school = "Titan Aston Academy", end_period_year = 2018.83, count = 0) %>% 
    add_row(school = "Titan Aston Academy", end_period_year = 2018.85, count = 0) %>% 
    add_row(school = "EBN Academy Phase 2", end_period_year = 2015.67, count = 0) %>% 
    add_row(school = "East Birmingham Network Academy", end_period_year = 2012.67, count = 0) %>% 
    filter(school != "Behaviour Support Service at The City of Birmingham School") %>% 
    filter(school != "Focus College") %>% 
    mutate(school = factor(school, levels = c("Virtual College", "Laces", "East Birmingham Network Academy", "Reach School", "St Georges Academy",  "Titan Aston Academy" ,"The Edge Academy", "EBN Academy Phase 2"))) %>%
    ggplot() + 
    geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(aes(x = end_period_year, y=count, colour = school)) +
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=count, fill = school), alpha=0.5) +
    facet_grid(rows = vars(school)) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                       labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 80),
                       expand = c(0,0),
                       breaks = c(0,30,60),
                       labels = c("0","30","60")) +
    scale_color_manual(values = c("#A4661EFF", "#A4661EFF",  "#356EB2FF","#356EB2FF", "#356EB2FF",  "#BE3428FF", "#356EB2FF",  "#356EB2FF")) +
                       # guide = FALSE) +
  scale_fill_manual(values = c("#D9D6A6FF", "#D9D6A6FF",  "#9BB0FEFF","#9BB0FEFF", "#9BB0FEFF",  "#BE3428FF", "#9BB0FEFF", "#9BB0FEFF"),
                     guide = FALSE) +
    theme(strip.text = element_blank())

  num_prus
  ggsave(filename = "output/graphs/num_prus.png", num_prus)
  
  , colour="#B48A2CFF"
  , fill="#DCD66EFF"
  
  
  At the most recent on May 2017 it
  was rated “Inedequate” due to the
  quality of teaching,learning and
  assessment.  - The Edge
  Academy
  
  
  
  
  
  num_prus_big <- schools_10to22_age_gender %>%
    left_join(s_data) %>% 
    filter(age %in% c(10:15),
           level == "Birmingham",
           my_categories == "Pupil referral unit") %>% 
    mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
           school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
           school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
           school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school),
           school = ifelse(school == "CUL Academy Trust", "Titan Aston Academy", school)) %>%
    group_by(end_period_year, school) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    add_row(school = "Virtual College", end_period_year = 2013.25, count = 0) %>% # closed 31 March 2013
    add_row(school = "Laces", end_period_year = 2013.25, count = 0) %>% # closed 31 March 2013
    add_row(school = "St Georges Academy", end_period_year = 2013.67, count = 0) %>% # opened 2 September 2013
    add_row(school = "The Edge Academy", end_period_year = 2015.67, count = 0) %>% # opened 1 September 2015
    add_row(school = "Reach School", end_period_year = 2013.67, count = 0) %>%  # opened 2 September 2013
    add_row(school = "Titan Aston Academy", end_period_year = 2014.67, count = 0) %>% 
    add_row(school = "Titan Aston Academy", end_period_year = 2018.75, count = 21) %>% 
    add_row(school = "Titan Aston Academy", end_period_year = 2018.83, count = 0) %>% 
    add_row(school = "Titan Aston Academy", end_period_year = 2018.85, count = 0) %>% 
    add_row(school = "EBN Academy Phase 2", end_period_year = 2015.67, count = 0) %>% 
    add_row(school = "East Birmingham Network Academy", end_period_year = 2012.67, count = 0) %>% 
    filter(school == "Behaviour Support Service at The City of Birmingham School") %>% 
     ggplot() + 
    geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
              fill="#F7F7F7", alpha = 0.1) +
    geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
              fill="#EEEEEE", alpha = 0.1) +
    geom_vline(xintercept = 2014,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_vline(xintercept = 2022,  #linetype="dotted",
               color = "black", size=0.7, alpha = 0.05) +
    geom_line(aes(x = end_period_year, y=count, colour = school)) +
    geom_ribbon(aes(x = end_period_year, ymin=0,ymax=count, fill = school), alpha=0.5) +
    theme_bw() +
    scale_x_continuous(limits = c(2009.5, 2022.5),
                       expand = c(0,0),
                       name = "", 
                       breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
                       labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
    scale_y_continuous(name = "",
                       limits = c(0, 400),
                       expand = c(0,0),
                       breaks = c(0,30,60,90,120,150,180,210,240,270,300,330,360,390),
                       labels = c("0","","60","","120","","180","","240","","300","","360","")) +
    scale_color_manual(values = c("#356EB2FF"),
                       guide = FALSE) +
    scale_fill_manual(values = c("#9BB0FEFF"),
                      guide = FALSE) +
    theme(strip.text = element_blank())
  
  
  num_prus_big
  
  
  
  
  
  
  
  
  
  
  age_gen_fsm_layout <- school_pru %>% 
    mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
    filter(age <= 15,
           end_period_year == 2018) %>% 
    ggplot() + 
    geom_line(aes(x = age, y = pc_in_pru, colour = interaction(gender, fsm)))
  age_gen_fsm_layout  
  
  
  age_gen_fsm_layout <- school_pru %>%
    mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
    filter(age <= 15) %>% 
    mutate(period = ifelse(end_period_year %in% c(2010:2014), "pre-spike", NA),
           period = ifelse(end_period_year %in% c(2016:2018), "spike", period)
           # ,
           # period = ifelse(end_period_year %in% c(2020:2022), "post-spike", period)
           ) %>% 
    filter(!is.na(period)) %>% 
    group_by(gender, age, fsm, period) %>% 
    summarise(pc_in_pru = mean(pc_in_pru)) %>% 
    ggplot() + 
    geom_line(aes(x = age, y = pc_in_pru, colour = period)) +
    facet_grid(cols = vars(fsm), rows = vars(gender))
  age_gen_fsm_layout  
  
  age_gen_fsm_layout <- school_pru %>%
    mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
    filter(age <= 15) %>% 
    mutate(period = ifelse(end_period_year %in% c(2010:2014), "pre-spike", NA),
           period = ifelse(end_period_year %in% c(2016:2018), "spike", period)
           # ,
           # period = ifelse(end_period_year %in% c(2020:2022), "post-spike", period)
    ) %>% 
    filter(!is.na(period)) %>% 
    group_by(gender, age, fsm, period) %>% 
    summarise(pc_in_pru = mean(pc_in_pru)) %>% 
    ggplot() + 
    geom_line(aes(x = age, y = pc_in_pru, colour = interaction(gender, fsm))) +
    # geom_ribbon(aes(x = age, ymin=0,ymax=pc_in_pru, fill = interaction(gender, fsm)), alpha=0.1) +
    facet_grid(cols = vars(period))+
    scale_colour_manual(values = c("#3A488AFF", "#BE3428FF", "#8785B2FF", "#D95F30FF"),
                        guide = F) +
    # scale_fill_manual(values = c("#3A488AFF", "#BE3428FF", "#8785B2FF", "#D95F30FF"),
    #                   guide = F) +
    theme_bw() +
    theme(strip.text = element_blank()) +
    scale_x_continuous(name = "") +
    scale_y_continuous(name = "")
  age_gen_fsm_layout  

  ggsave(filename = "output/graphs/age_gen_fsm_layout.png", age_gen_fsm_layout)
  
  
  
  "#3A488AFF", "#BE3428FF", "#8785B2FF", "#D95F30FF"
  "#5D74A5FF" "#A8554EFF" "#B0CBE7FF"  "#EBA07EFF"