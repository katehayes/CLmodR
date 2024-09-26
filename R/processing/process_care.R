load("/Users/katehayes/CLmodR/output/data/cleaned/care_10to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_placement.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_duration_14to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_convicted_15to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/care_cum_pc.Rdata")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# for care duration  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# making estimates of earlier years to fill back to 2010 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# p = i x d
# duration = prevalence(day count)/ incidence(per day - so years total div by 365)
birm_dur_adj <- care_10to22 %>%
  pivot_wider(names_from = period_length,
              values_from = count) %>%
  mutate(duration = Day / (Year / 365)) %>% 
  filter(!is.na(duration)) %>% 
  select(end_period_year, level, duration) %>% 
  pivot_wider(names_from = level,
              values_from = duration) %>% 
  mutate(adj = Birmingham/England)


care_duration_inc_prev <- care_10to22 %>%
  pivot_wider(names_from = period_length,
              values_from = count) %>%
  group_by(level) %>% 
  arrange(end_period_year) %>% 
  # mutate(Day = lag(Day)) %>% 
  mutate(duration = Day / (Year / 365)) %>% 
  filter(!is.na(duration)) %>% 
  select(end_period_year, level, duration) %>% 
  filter(level != "West Midlands (region)") %>% 
  mutate(hi = "b") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = duration, group =  interaction(hi,level), color = interaction(hi,level))) +
  geom_line(data = care_11to22_placement %>% 
              mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                                           "Residential schools",
                                                           "Other residential settings"),
                                          "Residential",
                                          "Not residential")) %>% 
              group_by(end_period_year, level, residential) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(level, end_period_year) %>% 
              mutate(pc_res = count/sum(count)) %>% 
              ungroup() %>% 
              left_join(care_duration_14to22) %>% 
              mutate(av = pc_res*mean_dur) %>% 
              group_by(level, end_period_year) %>% 
              summarise(av = sum(av)) %>% 
              mutate(hi = "a") %>% 
              filter(level != "West Midlands (region)"),
            aes(x = end_period_year, y = av, group =  interaction(hi,level), color = interaction(hi,level))) +
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_color_manual(values = c("#6FA7F9", "#9BD6A8", "#0A5FDD", "#49C364")) +
  scale_y_continuous(name = "",
                     limits = c(0, 390),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022), 
                     # labels = c("2012", "2014", "2016"),
                     limits = c(2010.5, 2022.5),
                     expand = c(0,0))
  

care_duration_inc_prev
ggsave(filename = "output/graphs/care_duration_inc_prev.png", care_duration_inc_prev)

duration_data <- care_duration_14to22 %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = mean_dur, group = residential, color = residential))
duration_data


dur_comp_plot <- care_duration_14to22 %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = mean_dur, group = residential, color = residential)) +
  geom_line(data = care_10to22 %>%
              pivot_wider(names_from = period_length,
                          values_from = count) %>%
              mutate(duration = Day / (Year / 365)) %>% 
              filter(!is.na(duration)) %>% 
              select(end_period_year, level, duration) %>% 
              filter(level == "England"),
              aes(x = end_period_year, y = duration))+
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_y_continuous(name = "",
                     limits = c(0, 420),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2010, 2012,  2014,  2016, 2018,2020,2022), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2009.5, 2022.5),
                     expand = c(0,0))
dur_comp_plot 


res_birm_v_eng <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                             "Residential schools",
                                             "Other residential settings"),
                       "Residential",
                       "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(age %in% c(0:17),
                     end_period_year %in% c(2011:2022),
                     level %in% c("Birmingham", "West Midlands (region)", "England")) %>%
              group_by(end_period_year, level) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(care_rate = count/census_pop) %>% 
  filter(level!= "West Midlands (region)") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = care_rate, 
                group = interaction(residential, level), color = interaction(residential, level))) +
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_color_manual(values = c("#6FA7F9", "#0A5FDD", "#9BD6A8", "#49C364")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.0075),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2012,  2014,  2016, 2018,2020), 
                     labels = c("2012", "2014", "2016", "2018", "2020"),
                     limits = c(2010.5, 2020.5),
                     expand = c(0,0))
res_birm_v_eng


res_dur_birmveng <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  left_join(care_duration_14to22) %>% 
  mutate(x = count*mean_dur) %>%
  group_by(level, end_period_year) %>% 
  mutate(average = sum(x)/sum(count)) %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = average, 
                group = level, color =  level))
  
res_dur_birmveng  

gen_pc_birmveng <- care_11to22_gender %>% 
  group_by(end_period_year, level, gender) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # left_join(care_duration_14to22) %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_gen = count/sum(count)) %>% 
  filter(gender == "Boys",
         level != "West Midlands (region)") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc_gen, 
                group = level, color =  level)) +
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_color_manual(values = c("#3F42B2", "#3FB271")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.7),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2012,  2014,  2016, 2018, 2020, 2022), 
                     labels = c("2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2010.5, 2022.5),
                     expand = c(0,0))

gen_pc_birmveng

age_pc_birmveng <- care_11to22_age %>% 
  group_by(end_period_year, level, age) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # left_join(care_duration_14to22) %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_age = count/sum(count)) %>% 
  filter(
         level != "West Midlands (region)") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc_age, 
                group = level, color =  level)) +
  facet_wrap(~age)+
  theme_bw() +
  # theme(legend.position = "none",
  #       strip.text = element_blank()) +
  scale_color_manual(values = c("#3F42B2", "#3FB271")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.7),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2012,  2014,  2016, 2018, 2020, 2022), 
                     labels = c("2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2010.5, 2022.5),
                     expand = c(0,0))

age_pc_birmveng



age_pc_birmveng <- care_11to22_age %>% 
  filter(age %in% c("10-15", "16+")) %>% 
  group_by(end_period_year, level, age) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # left_join(care_duration_14to22) %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_age = count/sum(count)) %>% 
  filter(age == "16+",
    level != "West Midlands (region)") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc_age, 
                group = level, color =  level)) +
  # facet_wrap(~age)+
  theme_bw() +
  # theme(legend.position = "none",
  #       strip.text = element_blank()) +
  scale_color_manual(values = c("#3F42B2", "#3FB271")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.7),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2012,  2014,  2016, 2018, 2020, 2022), 
                     labels = c("2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2010.5, 2022.5),
                     expand = c(0,0))

age_pc_birmveng


res_pc_birmveng <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # left_join(care_duration_14to22) %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_res = count/sum(count)) %>% 
  filter(residential == "Residential",
         level != "West Midlands (region)") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc_res, 
                group = level, color =  level)) +
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_color_manual(values = c("#3F42B2", "#3FB271")) +
  scale_y_continuous(name = "",
                     limits = c(0, 0.215),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2012,  2014,  2016, 2018, 2020, 2022), 
                     labels = c("2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2010.5, 2022.5),
                     expand = c(0,0))

res_pc_birmveng

res_birm_v_eng


res_dur_birmveng <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_res = count/sum(count)) %>% 
  ungroup() %>% 
  left_join(care_duration_14to22) %>% 
  mutate(av = pc_res*mean_dur) %>% 
  group_by(level, end_period_year) %>% 
  summarise(av = sum(av)) %>% 
  filter(level != "West Midlands (region)") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = av, 
                group = level, color =  level)) +
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_color_manual(values = c("#3F42B2", "#3FB271")) +
  scale_y_continuous(name = "",
                     limits = c(0, 390),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c( 2014,  2016, 2018, 2020, 2022), 
                     labels = c("2014", "2016", "2018", "2020", "2022"),
                     limits = c(2013.5, 2022.5),
                     expand = c(0,0))

res_dur_birmveng


birm_year_day <- care_10to22 %>%
  filter(level == "Birmingham") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = period_length),
           stat = "identity") +
  facet_grid(~period_length) +
  scale_fill_manual(values = c("#023785", "#0A5FDD")) +
  theme_bw() +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_y_continuous(name = "",
                     limits = c(0, 3020),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2010, 2012,  2014,  2016, 2018,2020,2022), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2009, 2023),
                     expand = c(0,0))

eng_year_day <- care_10to22 %>%
  filter(level == "England") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = period_length),
           stat = "identity") +
  facet_grid(~period_length) +
  theme_bw() +
  scale_fill_manual(values = c("#03741B", "#49C364")) +
  theme(legend.position = "none",
        strip.text = element_blank()) +
  scale_y_continuous(name = "",
                     limits = c(0, 112000),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(2010, 2012,  2014,  2016, 2018,2020,2022), 
                     labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022"),
                     limits = c(2009, 2023),
                     expand = c(0,0))



pop_estimate_01to20_age_gender %>% 
  filter(age %in% c(0:17)) %>% 
  group_by(level, end_period_year) %>% 
  summarise(count = sum(count)) %>% 
  filter(level == "England") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity")



age <- care_11to22_age %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(age %in% c(0:17)) %>% 
              mutate(age2 = ifelse(age == 0, "<1", NA),
                     age2 = ifelse(age %in% c(1:4), "1-4", age2),
                     age2 = ifelse(age %in% c(5:9), "5-9", age2),
                     age2 = ifelse(age %in% c(10:15), "10-15", age2),
                     age2 = ifelse(age %in% c(16:17), "16+", age2)) %>% 
              group_by(level, age2, end_period_year) %>% 
              summarise(pop_count = sum(count)) %>% 
              rename(age = age2) %>% 
              filter(level %in% c("Birmingham", "West Midlands (region)", "England"))) %>% 
  filter(level != "West Midlands (region)") %>% 
  mutate(pc = count/pop_count) %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc, 
                group = interaction(age,level), color = interaction(age,level))) +
  scale_color_manual(values = c( "#0A5FDD", "#0A5FDD",  "#0A5FDD", "#0A5FDD",  "#0A5FDD",   "#49C364", "#49C364",  "#49C364", "#49C364","#49C364"))

age






pc_res_v_poverty <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(age %in% c(0:17),
                     end_period_year %in% c(2011:2022),
                     level %in% c("Birmingham", "West Midlands (region)", "England")) %>%
              group_by(end_period_year, level) %>%
              summarise(census_pop = sum(count))) %>% 
  mutate(care_rate = count/census_pop) %>% 
  filter(level!= "West Midlands (region)") 




res_pc_birm  <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # left_join(care_duration_14to22) %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_res = count/sum(count)) %>% 
  filter(residential == "Residential",
         level == "Birmingham") %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate)) %>% 
  left_join(care_pc)

x <- lm(pc_res ~ spov_rate, data = res_pc_birm)



res_plus_age <- care_11to22_placement %>% 
  mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                               "Residential schools",
                                               "Other residential settings"),
                              "Residential",
                              "Not residential")) %>% 
  group_by(end_period_year, level, residential) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  # left_join(care_duration_14to22) %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc_res = count/sum(count)) %>% 
  filter(residential == "Residential",
         level == "Birmingham") %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate)) %>% 
  left_join(care_pc) %>% 
  left_join(care_11to22_age %>% 
              filter(level == "Birmingham",
                     age %in% c("10-15", "16+")) %>% 
              group_by(end_period_year) %>% 
              mutate(pc_age = count/sum(count)) %>% 
              filter(age == "16+") %>% 
              ungroup() %>% 
              select(end_period_year, pc_age)) %>% 
  ungroup() %>% 
  filter(end_period_year < 2020)


b <- lm(pc_res ~ spov_rate, data = res_plus_age %>% 
          select(pc_res, pc_age, spov_rate))

summary(b)


a <- lm(pc_res ~ pc_age, data = res_plus_age %>% 
          select(pc_res, pc_age))

summary(a)


poverty_range <- data.frame(spov = c(seq(0.2, 0.5, 0.01)))

# 
# res_pc_birm_predict  <- care_11to22_placement %>% 
#   mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
#                                                "Residential schools",
#                                                "Other residential settings"),
#                               "Residential",
#                               "Not residential")) %>% 
#   group_by(end_period_year, level, residential) %>% 
#   summarise(count = sum(count)) %>% 
#   ungroup() %>% 
#   # left_join(care_duration_14to22) %>% 
#   group_by(level, end_period_year) %>% 
#   mutate(pc_res = count/sum(count)) %>% 
#   filter(residential == "Residential",
#          level == "Birmingham",
#          end_period_year >= 2010) %>% 
#   left_join(smooth_poverty %>% 
#               select(end_period_year, spov_rate) %>% 
#               filter(end_period_year >= 2011)) %>% 
#   cbind(smooth_poverty %>% 
#           select(end_period_year) %>% 
#           filter(end_period_year >= 2011), data.frame(predict_pc = predict(x, smooth_poverty %>% 
#                                 select(end_period_year, spov_rate))))


care_pc <- care_11to22_age %>% 
  filter(age %in% c("10-15", "16+"),
         level == "Birmingham") %>% 
  group_by(end_period_year) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  left_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham") %>% 
               filter(age %in% c(10:17)) %>% 
               group_by(end_period_year) %>% 
               summarise(pop_count = sum(count)) %>% 
              ungroup()) %>% 
  mutate(care_pc = count/pop_count) %>% 
  select(end_period_year, care_pc)


age_pc_birm <- care_11to22_age %>% 
  filter(level == "Birmingham",
         age %in% c("10-15", "16+")) %>% 
              group_by(end_period_year) %>% 
              mutate(pc = count/sum(count)) %>% 
  filter(age == "16+") %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate)) %>% 
  left_join(care_pc %>% 
              filter(end_period_year <= 2020))

y <- lm(pc ~ spov_rate, data = age_pc_birm)


z <- lm(care_pc ~ spov_rate, data = age_pc_birm %>% 
          select(care_pc, spov_rate))



summary(y)

summary(z)

check <- data.frame(pred_pc = predict(a, res_plus_age),
                    end_period_year = res_plus_age %>% 
                      ungroup() %>% 
                      select(end_period_year))  %>%
  left_join(care_11to22_age %>% 
              filter(level == "Birmingham",
                     age %in% c("10-15", "16+")) %>% 
              group_by(end_period_year) %>% 
              mutate(pc_age = count/sum(count)) %>% 
              filter(age == "16+") %>% 
              select(end_period_year, pc_age)) %>% 
  left_join(care_11to22_placement %>% 
              mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                                           "Residential schools",
                                                           "Other residential settings"),
                                          "Residential",
                                          "Not residential")) %>% 
              group_by(end_period_year, level, residential) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              # left_join(care_duration_14to22) %>% 
              group_by(level, end_period_year) %>% 
              mutate(pc_res = count/sum(count)) %>% 
              filter(residential == "Residential",
                     level == "Birmingham",
                     end_period_year >= 2011) %>% 
              select(end_period_year, pc_res))  %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc_res), colour = "red") +
  geom_line(aes(x = end_period_year, y = pred_pc), colour = "blue") +
  geom_line(aes(x = end_period_year, y = pc_age), colour = "green") 

check

# FLAG
check <- data.frame(pred_pc = predict(y, smooth_poverty %>% 
                                        select(end_period_year, spov_rate) %>% 
                                        filter(end_period_year >= 2011) %>% 
                                        left_join(care_pc %>% 
                                                    filter(end_period_year <= 2020))), 
                    end_period_year = smooth_poverty %>% 
                      select(end_period_year) %>% 
                      filter(end_period_year >= 2011),
                    spov_rate = smooth_poverty %>%
                      filter(end_period_year >= 2011) %>% 
                      select(spov_rate),
                    carepc = care_pc %>% 
                      filter(end_period_year <= 2020) %>% 
                      select(care_pc)) %>% 
  left_join(care_11to22_age %>% 
          filter(level == "Birmingham",
                 age %in% c("10-15", "16+")) %>% 
          group_by(end_period_year) %>% 
          mutate(pc = count/sum(count)) %>% 
          filter(age == "16+") %>% 
          select(end_period_year, pc)) %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc), colour = "red") +
  geom_line(aes(x = end_period_year, y = pred_pc), colour = "blue") +
  geom_line(aes(x = end_period_year, y = spov_rate), colour = "green") +
  geom_line(aes(x = end_period_year, y = care_pc), colour = "black")


check
# FLAG
output <- data.frame(pred_pc = predict(y, smooth_poverty %>% 
                                        select(end_period_year, spov_rate) %>% 
                                        filter(end_period_year >= 2011) %>% 
                                        left_join(care_pc %>% 
                                                    filter(end_period_year <= 2020))), 
                    end_period_year = smooth_poverty %>% 
                      select(end_period_year) %>% 
                      filter(end_period_year >= 2011),
                    spov_rate = smooth_poverty %>%
                      filter(end_period_year >= 2011) %>% 
                      select(spov_rate),
                    carepc = care_pc %>% 
                      filter(end_period_year <= 2020) %>% 
                      select(care_pc)) %>% 
  left_join(care_11to22_age %>% 
              filter(level == "Birmingham",
                     age %in% c("10-15", "16+")) %>% 
              group_by(end_period_year) %>% 
              mutate(pc = count/sum(count)) %>% 
              filter(age == "16+") %>% 
              select(end_period_year, pc)) %>% 
  mutate(check = 0.17705+0.62697*spov_rate)




# FLAG
check3 <- data.frame(pred_pc = predict(z, smooth_poverty %>% 
                                        select(end_period_year, spov_rate) %>% 
                                        filter(end_period_year >= 2011)), 
                    end_period_year = smooth_poverty %>% 
                      select(end_period_year) %>% 
                      filter(end_period_year >= 2011),
                    spov_rate = smooth_poverty %>%
                      filter(end_period_year >= 2011) %>% 
                      select(spov_rate),
                    what = care_pc %>% 
                      filter(end_period_year <= 2020) %>% 
                      select(care_pc)) %>% 
  ggplot()+
  # geom_line(aes(x = end_period_year, y = pc), colour = "red") +
  geom_line(aes(x = end_period_year, y = pred_pc), color = "blue") +
  geom_line(aes(x = end_period_year, y = care_pc), color = "black")
  # geom_line(aes(x = end_period_year, y = spov_rate), colour = "green") +



# will look at res pc versus age pc


check3

check2 <- data.frame(pred_pc = predict(x, smooth_poverty %>% 
                                        select(end_period_year, spov_rate) %>% 
                                        filter(end_period_year >= 2011) %>% 
                                         left_join(care_pc %>% 
                                                     filter(end_period_year <= 2020))), 
                    end_period_year = smooth_poverty %>% 
                      select(end_period_year) %>% 
                      filter(end_period_year >= 2011),
                    spov_rate = smooth_poverty %>%
                      filter(end_period_year >= 2011) %>% 
                      select(spov_rate),
                    carepc = care_pc %>% 
                      filter(end_period_year <= 2020) %>% 
                      select(care_pc)) %>% 
  left_join(care_11to22_placement %>% 
              mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                                           "Residential schools",
                                                           "Other residential settings"),
                                          "Residential",
                                          "Not residential")) %>% 
              group_by(end_period_year, level, residential) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              # left_join(care_duration_14to22) %>% 
              group_by(level, end_period_year) %>% 
              mutate(pc_res = count/sum(count)) %>% 
              filter(residential == "Residential",
                     level == "Birmingham",
                     end_period_year >= 2011) %>% 
              select(end_period_year, pc_res)) %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc_res), colour = "red") +
  geom_line(aes(x = end_period_year, y = pred_pc), colour = "blue") +
  geom_line(aes(x = end_period_year, y = spov_rate), colour = "green") +
geom_line(aes(x = end_period_year, y = care_pc), colour = "black")

check2

# looked at diff between duration in birm/wm/eng by doing the p=id calculation
# looks fine, birm higher by like 10 days at most, not too bad
# 
# could multiply by 1.02 to bump birm dur by like 2 pc...
# 
# the one thing is that not residential tends to be shorter than res
# but birm is more likely to be residential than eng in general, yes?

care_11to22_placement %>% 
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                   "Residential schools",
                                   "Other residential settings"),
                  "Residential",
                  "Not residential")) %>%
  group_by(level, end_period_year, residential) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(level, end_period_year) %>% 
  mutate(pc = count/ sum(count)) %>% 
  filter(residential == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = level, color = level))

#   so does that mean that the birm durations are actually a good bit longer?





mod1 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Residential"))

est_r <- data.frame(end_period_year = rep(c(2010:2013)),
                    residential = rep(c("Residential"), times = 4))
est_r$mean_dur = predict(mod1, newdata = est_r)



mod2 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Not residential"))

est_nr <- data.frame(end_period_year = rep(c(2010:2013)),
                     residential = rep(c("Not residential"), times = 4))
est_nr$mean_dur = predict(mod2, newdata = est_nr)



care_duration <- care_duration_14to22 %>% 
  bind_rows(est_r, est_nr) %>% 
  ungroup() %>% 
  group_by(residential) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_mean_dur = smooth.spline(end_period_year, mean_dur, lambda = 0.0005)$y) %>% 
  mutate(smooth_mean_dur = smooth_mean_dur *1.02) # just for the craic, birm seems maybe a bit longer

care_duration %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = mean_dur, group = residential, colour = residential)) + 
  geom_line(aes(x = end_period_year, y = smooth_mean_dur, group = residential, colour = residential)) 
  
  # save(care_duration, file = "output/data/processed/care_duration.Rdata")


# changed this to the smoothed version but could as easily go back
endnr <- care_duration %>% 
  ungroup() %>% 
  filter(residential == "Not residential",
         end_period_year <= 2020) %>% 
  arrange(end_period_year) %>% 
  select(smooth_mean_dur) %>% 
  mutate(smooth_mean_dur = 1/(smooth_mean_dur/7)) %>% 
  rename(Boys = smooth_mean_dur) %>% 
  mutate(Girls = Boys) %>% 
  as.matrix()

endres <- care_duration %>% 
  ungroup() %>% 
  filter(residential == "Residential",
         end_period_year <= 2020) %>% 
  arrange(end_period_year) %>% 
  select(smooth_mean_dur) %>% 
  mutate(smooth_mean_dur = 1/(smooth_mean_dur/7)) %>% 
  rename(Boys = smooth_mean_dur) %>% 
  mutate(Girls = Boys) %>% 
  as.matrix()

# save(endnr, file = "output/data/input/endnr.Rdata")
# save(endres, file = "output/data/input/endres.Rdata")
# 


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# for care counts # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

care_age_pc <- care_11to22_age %>% 
  filter(level == "Birmingham", 
         age %in% c("10-15", "16+"),
         end_period_year <= 2020) %>%
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2022)) %>% 
              mutate(age = ifelse(age >=16, "16+", "10-15")) %>% 
              group_by(end_period_year, age) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop)  %>% 
  ungroup() %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.003)$y) %>% 
  select(end_period_year, age, smooth_pc) %>% 
  pivot_wider(names_from = age, values_from = smooth_pc)




care <- care_11to22_placement %>%
  filter(level == "Birmingham", 
         end_period_year <= 2020) %>% 
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                   "Residential schools",
                                   "Other residential settings"),
                  "Residential",
                  "Not residential")) %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  mutate(tot = Residential +`Not residential`) %>% 
  full_join(care_11to22_age %>%
              filter(level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year) %>%
              mutate(tot = sum(count)) %>%
              mutate(pc = count / tot) %>%
              ungroup() %>%
              filter(age %in% c("10-15", "16+")) %>%
              group_by(end_period_year) %>% 
              summarise(pc = sum(pc))) %>% 
  mutate(tenplus_tot = tot*pc,
         tenplus_res = 0.95*Residential, # ASSUMPTION - I read somewhere that like 95% of res care was over 10...find where 
         tenplus_nres = tenplus_tot-tenplus_res) %>% 
  select(end_period_year, tenplus_tot, tenplus_res, tenplus_nres) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2020)) %>% 
              group_by(end_period_year, gender) %>% 
              summarise(count = sum(count)) %>% 
              pivot_wider(names_from = gender,
                          values_from = count)) %>% 
  full_join(care_11to22_gender %>%
              filter(level == "Birmingham", 
                     end_period_year <= 2020) %>% 
              full_join(pop_estimate_01to20_age_gender %>% 
                          filter(level == "Birmingham",
                                 age <= 17,
                                 end_period_year %in% c(2011:2022)) %>% 
                          group_by(end_period_year, gender) %>% 
                          summarise(pop = sum(count))) %>%
              mutate(pc = count/pop) %>% 
              select(end_period_year, gender, pc) %>% 
              pivot_wider(names_from = gender, values_from = pc) %>% 
              mutate(boy2girl = Boys/Girls) %>% 
              select(end_period_year, boy2girl)) %>% 
  # having some difficulty because if i bump boys up in rescare 
  # but keep the same gender ratio then...
  # it will artificially depress boys in non-res....
  # maybe the best thing is to keep the correct ratio in non-res and then
  # just change the ratio in res
  mutate(maybe_res_boy2girl = boy2girl*1.4,#trying to say that the gender ratio can follow the general trend
         # boy2girl = ifelse(boy2girl < 1, 1, boy2girl),
         maybe_bpc_tot = Boys*boy2girl/(Boys*boy2girl+Girls),
         maybe_bpc_res = Boys*maybe_res_boy2girl/(Boys*maybe_res_boy2girl+Girls)) %>% 
  mutate(boy_res = maybe_bpc_res*tenplus_res,
         girl_res = (1-maybe_bpc_res)*tenplus_res,
         boy_nres = maybe_bpc_tot*tenplus_nres,
         girl_nres = (1-maybe_bpc_tot)*tenplus_nres) %>% 
  # ONE TOTAL IS COMING FROM RESIDENTIAL THE OTHER FROM AGE - PROBABLY THERE'S A SMALL DIFF IN THE UNDERLYING DATA
  # select(end_period_year, boy_nres, boy_res, girl_nres, girl_res, tenplus_res, tenplus_nres) %>% 
  # full_join(care_11to22_age %>% 
  #             filter(level == "Birmingham", 
  #                    age %in% c("10-15", "16+"),
  #                    end_period_year <= 2020) %>%
  #             select(end_period_year, age, count) %>% 
  #             pivot_wider(names_from = age,
  #                         values_from = count)) %>% 
  # mutate(check1 = boy_nres + boy_res + girl_nres + girl_res,
  #        check2 = `10-15` + `16+`,
#        check3 = tenplus_res + tenplus_nres)
select(end_period_year, boy_nres, boy_res, girl_nres, girl_res) %>% 
  # so we're putting the age on last
  # lets say no relation between age & gender
  # but yeah age does vary across res types
full_join(pop_estimate_01to20_age_gender %>% 
            filter(level == "Birmingham",
                   age %in% c(10:17),
                   end_period_year >= 2011) %>% 
            group_by(end_period_year, age) %>% 
            summarise(count = sum(count)) %>% 
            full_join(care_age_pc) %>% 
            mutate(pc = ifelse(age >=16, `16+`, `10-15`)) %>% 
            # # # mutate(smooth_pc = smooth.spline(age, pc, lambda = 0.08)$y) %>%
            # mutate(
            # # pc_adj = ifelse(age == 10, pc, pc),
            #        pc_adj = ifelse(age == 17, pc + 0.05*pc, pc)
            # # ,
            # #        pc_adj = ifelse(age == 17 & end_period_year == 2020, pc_adj - 0.05*pc_adj, pc_adj)
            # ) %>%
            # ungroup() %>%
            group_by(end_period_year) %>%
            arrange(age) %>%
            mutate(smooth_pc = smooth.spline(age, pc, lambda = 0.01)$y) %>%
            select(end_period_year, age, smooth_pc) %>%
            pivot_wider(names_from = age,
                        values_from = smooth_pc)) %>% 


# 
# care %>%
#   ggplot() +
#   geom_line(aes(x = end_period_year, y = `10`, colour = "10")) +
#   geom_line(aes(x = end_period_year, y = `11`, colour = "11")) +
#   geom_line(aes(x = end_period_year, y = `12`, colour = "12")) +
#   geom_line(aes(x = end_period_year, y = `13`, colour = "13")) +
#   geom_line(aes(x = end_period_year, y = `14`, colour = "14")) +
#   geom_line(aes(x = end_period_year, y = `15`, colour = "15")) +
#   geom_line(aes(x = end_period_year, y = `16`, colour = "16")) +
#   geom_line(aes(x = end_period_year, y = `17`, colour = "17"))



  mutate(`17to10` = `17`/`10`,
         `16to10` = `16`/`10`,
         `15to10` = `15`/`10`,
         `14to10` = `14`/`10`,
         `13to10` = `13`/`10`,
         `12to10` = `12`/`10`,
         `11to10` = `11`/`10`) %>%
  mutate(`res17to10` = 1.175*`17`/`10`,
         `res16to10` = 1.15*`16`/`10`,
         `res15to10` = 1.125*`15`/`10`,
         `res14to10` = 1.1*`14`/`10`,
         `res13to10` = 1.075*`13`/`10`,
         `res12to10` = 1.05*`12`/`10`,
         `res11to10` = 1.025*`11`/`10`) %>%
  mutate(`17pc_res` = `17`*`res17to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                          `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `16pc_res` = `16`*`res16to10`/ (`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                           `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `15pc_res` = `15`*`res15to10`/ (`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                           `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `14pc_res` = `14`*`res14to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                          `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `13pc_res` = `13`*`res13to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                          `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `12pc_res` = `12`*`res12to10`/ (`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                           `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `11pc_res` = `11`*`res11to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                                          `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `10pc_res` = `10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
                              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`)) %>% 
  mutate(girl_17res = girl_res*`17pc_res`,
         girl_16res = girl_res*`16pc_res`,
         girl_15res = girl_res*`15pc_res`,
         girl_14res = girl_res*`14pc_res`,
         girl_13res = girl_res*`13pc_res`,
         girl_12res = girl_res*`12pc_res`,
         girl_11res = girl_res*`11pc_res`,
         girl_10res = girl_res*`10pc_res`,
         boy_17res = boy_res*`17pc_res`,
         boy_16res = boy_res*`16pc_res`,
         boy_15res = boy_res*`15pc_res`,
         boy_14res = boy_res*`14pc_res`,
         boy_13res = boy_res*`13pc_res`,
         boy_12res = boy_res*`12pc_res`,
         boy_11res = boy_res*`11pc_res`,
         boy_10res = boy_res*`10pc_res`) %>% 
  mutate(`17pc` = `17`*`17to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `16pc` = `16`*`16to10`/ (`17`*`17to10` + `16`*`16to10` + `15`*`15to10` +`14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `15pc` = `15`*`15to10`/ (`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `14pc` = `14`*`14to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `13pc` = `13`*`13to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `12pc` = `12`*`12to10`/ (`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `11pc` = `11`*`11to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` +`14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `10pc` = `10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`)) %>% 
  mutate(girl_17 = (girl_res+girl_nres)*`17pc`,
         girl_16 = (girl_res+girl_nres)*`16pc`,
         girl_15 = (girl_res+girl_nres)*`15pc`,
         girl_14 = (girl_res+girl_nres)*`14pc`,
         girl_13 = (girl_res+girl_nres)*`13pc`,
         girl_12 = (girl_res+girl_nres)*`12pc`,
         girl_11 = (girl_res+girl_nres)*`11pc`,
         girl_10 = (girl_res+girl_nres)*`10pc`,
         boy_17 = (boy_res+boy_nres)*`17pc`,
         boy_16 = (boy_res+boy_nres)*`16pc`,
         boy_15 = (boy_res+boy_nres)*`15pc`,
         boy_14 = (boy_res+boy_nres)*`14pc`,
         boy_13 = (boy_res+boy_nres)*`13pc`,
         boy_12 = (boy_res+boy_nres)*`12pc`,
         boy_11 = (boy_res+boy_nres)*`11pc`,
         boy_10 = (boy_res+boy_nres)*`10pc`) %>% 
  mutate(girl_17nres = girl_17 - girl_17res,
         girl_16nres = girl_16 - girl_16res,
         girl_15nres = girl_15 - girl_15res,
         girl_14nres = girl_14 - girl_14res,
         girl_13nres = girl_13 - girl_13res,
         girl_12nres = girl_12 - girl_12res,
         girl_11nres = girl_11 - girl_11res,
         girl_10nres = girl_10 - girl_10res,
         boy_17nres = boy_17 - boy_17res,
         boy_16nres = boy_16 - boy_16res,
         boy_15nres = boy_15 - boy_15res,
         boy_14nres = boy_14 - boy_14res,
         boy_13nres = boy_13 - boy_13res,
         boy_12nres = boy_12 - boy_12res,
         boy_11nres = boy_11 - boy_11res,
         boy_10nres = boy_10 - boy_10res) %>% 
  select(c(end_period_year, starts_with("boy_"), starts_with("girl_"))) %>% 
  select(-c(boy_17:boy_10, girl_17:girl_10)) %>% 
  select(c(end_period_year, starts_with("boy_1"), starts_with("girl_1"))) %>% 
  pivot_longer(-end_period_year,
               names_to = "residential",
               values_to = "count") %>% 
  mutate(age = as.numeric(str_extract_all(residential, "(\\d{2})")),
         gender = ifelse(grepl("boy", residential), "Boys", "Girls"),
         residential = ifelse(grepl("nres", residential), "Not residential", "Residential")) 


care_10 <- care %>% 
  filter(end_period_year == 2011) %>% 
  mutate(end_period_year = 2010)


care <- care %>% 
  bind_rows(care_10) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
            filter(level == "Birmingham",
                   age %in% c(10:17),
                   end_period_year %in% c(2010:2022)) %>%
            group_by(end_period_year, gender, age) %>% 
            summarise(pop = sum(count))) %>% 
  mutate(pc = count/pop)  %>% 
  ungroup() %>% 
  group_by(age, gender, residential) %>%
  arrange(end_period_year) %>%
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.005)$y) %>%
  mutate(smooth_count = smooth_pc*pop) %>% 
  ungroup()



care %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = smooth_pc, colour = as.character(age))) +
  facet_grid(rows = vars(gender),
             cols = vars(residential))
  
  


care_pov <- care %>% 
  select(-c(count, pc, smooth_pc)) %>% 
  pivot_wider(names_from = residential,
              values_from = smooth_count) %>% 
  # CUM PC COMES IN FROM THAT PAPER
  full_join(care_cum_pc) %>% 
  mutate(cum_pc = cum_pc/100) %>% 
  mutate(pc_prior = cum_pc - ((Residential + `Not residential`)/pop)) %>% 
  mutate(Prior = pop*pc_prior) %>% 
  mutate(Never = pop - Prior - Residential - `Not residential`) %>% 
  select(-c(cum_pc, pc_prior)) 

care_pov <- care %>% 
  select(-c(count, pc, smooth_pc)) %>% 
  pivot_wider(names_from = residential,
              values_from = smooth_count) %>% 
  # CUM PC COMES IN FROM THAT PAPER
  full_join(care_cum_pc) %>% 
  mutate(cum_pc = cum_pc/100) %>% 
  mutate(pc_prior = cum_pc - ((Residential + `Not residential`)/pop)) %>% 
  mutate(Prior = pop*pc_prior) %>% 
  mutate(Never = pop - Prior - Residential - `Not residential`)%>% 
  select(-c(cum_pc, pc_prior)) %>% 
  # ASSUMPTION that poverty is evenly distributed across age & gender
  # ASSUMPTION that children in poverty are 4 times more likely to go to care... why did i decide this?
  # ASSUMPTION - ignorning the fact that child pov pc is changing across time...
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate) %>% 
              filter(end_period_year %in% c(2010:2020))) %>% 
  mutate(incl_Prior = Prior*(1-spov_rate)/(1 + 1*spov_rate),
         excl_Prior = Prior*spov_rate*2/(1 + 1*spov_rate),
         incl_Residential = Residential*(1-spov_rate)/(1 + 1*spov_rate),
         excl_Residential = Residential*spov_rate*2/(1 + 1*spov_rate),
         `incl_Not residential` = `Not residential`*(1-spov_rate)/(1 + 1*spov_rate),
         `excl_Not residential` = `Not residential`*spov_rate*2/(1 + 1*spov_rate),
         incl_Never = pop*(1-spov_rate) - incl_Prior - `incl_Not residential` - incl_Residential,
         excl_Never = pop*spov_rate - excl_Prior - `excl_Not residential` - excl_Residential) %>% 
  select(-c(pop, spov_rate, Never, Prior, `Not residential`, `Residential`)) %>% 
  pivot_longer(c(starts_with("incl"), starts_with("excl")), 
               names_to = c("state", ".value"),
               names_sep="_",
               values_to = "count") %>% 
  mutate(state = ifelse(state == "incl", "Not in poverty", "In poverty")) %>% 
  pivot_longer(c(Never, `Not residential`, `Residential`, Prior),
               names_to = "care",
               values_to = "count")



pc_fsm <- school_pru %>%
  filter(age <= 15,
         end_period_year <= 2020) %>% 
  mutate(count = PRU + `Not PRU`) %>% 
  select(-c(PRU, `Not PRU`)) %>% 
  group_by(end_period_year, gender, age) %>%
  mutate(pc_fsm = count/sum(count)) %>% 
  filter(fsm == "FSM eligible") %>% 
  select(-c(count, fsm))


pc_pru <- school_pru %>%
  filter(age <= 15,
         end_period_year <= 2020) %>% 
  group_by(end_period_year, gender, age) %>%
  summarise(PRU = sum(PRU),
            `Not PRU` = sum(`Not PRU`)) %>% 
  mutate(pc_pru = PRU/ (PRU + `Not PRU`)) %>% 
  select(-c(PRU, `Not PRU`))



fsm_pru_mult <- school_pru %>% 
  filter(age <= 15,
         end_period_year <= 2020) %>% 
  pivot_longer(c(PRU, `Not PRU`),
               names_to = "pru",
               values_to = "count") %>%
  group_by(end_period_year, gender, age, fsm) %>%
  mutate(pc_in_pru = count/sum(count)) %>%
  filter(pru == "PRU") %>% 
  pivot_wider(names_from = fsm,
              values_from = c(count, pc_in_pru)) %>% 
  mutate(
    # tot_pru = `count_FSM eligible` + `count_Not FSM eligible`,
    fsm_mult = `pc_in_pru_FSM eligible`/`pc_in_pru_Not FSM eligible`) %>% 
  mutate(fsm_mult = ifelse(is.na(fsm_mult), 0, fsm_mult)) %>% 
  select(-c(starts_with("count"), pru))


school_in_care <- pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(10:15),
         end_period_year %in% c(2010:2022)) %>%
  group_by(end_period_year, gender, age) %>% 
  summarise(pop = sum(count)) %>% 
  full_join(pc_fsm) %>% 
  full_join(pc_pru) %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate) %>% 
              filter(end_period_year %in% c(2010:2020))) %>% 
  full_join(fsm_pru_mult)  %>% 
  mutate(count_pru = pc_pru*pop,
         incl_count = pop*(1-spov_rate),
         excl_count = pop*spov_rate,
         incl_pru = count_pru*(1-spov_rate)/((1-spov_rate) + fsm_mult*spov_rate),
         excl_pru = count_pru*fsm_mult*spov_rate/((1-spov_rate) + fsm_mult*spov_rate)) %>% 
  select(c(end_period_year, gender, age, incl_count, excl_count, incl_pru, excl_pru)) %>% 
  pivot_longer(c(starts_with("incl"), starts_with("excl")), 
               names_to = c("state", ".value"),
               names_sep="_",
               values_to = "count") %>% 
  mutate(state = ifelse(state == "incl", "Not in poverty", "In poverty")) %>% 
  mutate(pru_rate = pru/count)



care_pov_pru <- care_pov %>% 
  filter(age <= 15) %>% 
  pivot_wider(names_from = care,
              values_from = count) %>% 
  full_join(school_in_care %>% 
              select(-c(count, pru))) %>% 
  mutate(tot = Never + Prior + Residential + `Not residential`) %>% 
  mutate(prucount_Prior = (pru_rate*tot)*2*Prior/(2*(Prior + Residential + `Not residential`) + Never),
         prucount_Residential = (pru_rate*tot)*2*Residential/(2*(Prior + Residential + `Not residential`) + Never),
         `prucount_Not residential` = (pru_rate*tot)*2*`Not residential`/(2*(Prior + Residential + `Not residential`) + Never),
         prucount_Never = pru_rate*tot - `prucount_Not residential` - prucount_Residential - prucount_Prior) %>% 
  select(-pru_rate, -tot) %>% 
  rename(tot_Never = Never,
         tot_Prior = Prior,
         tot_Residential = Residential,
         `tot_Not residential` = `Not residential`) %>% 
  pivot_longer(c(starts_with("tot"), starts_with("prucount")), 
               names_to = c("name", ".value"),
               names_sep="_") %>% 
  pivot_longer(c(Prior,Residential, `Not residential`, Never),
               names_to = "care",
               values_to = "count") %>% 
  pivot_wider(names_from = name,
              values_from = count) %>% 
  mutate(pru_rate = as.numeric(prucount)/as.numeric(tot)) %>% 
  ungroup() %>% 
  group_by(gender, age, state, care) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_rate = smooth.spline(end_period_year, pru_rate, lambda = 0.0001)$y) %>% # 0.0001 is decent
  mutate(smooth_rate = ifelse(smooth_rate < 0, 0, smooth_rate)) %>% 
  mutate(smooth_count = tot*smooth_rate)


pov_care_school <- care_pov_pru %>% 
  mutate(Mainstream = tot - smooth_count) %>% 
  select(-c(tot, pru_rate, prucount, smooth_rate)) %>% 
  rename(PRU = smooth_count) %>% 
  pivot_longer(c(PRU, Mainstream),
               names_to = "school",
               values_to = "count") %>% 
  bind_rows(care_pov_neet %>% 
              mutate(Mainstream = tot - smooth_count) %>% 
              select(-c(tot, neet_rate, neetcount, smooth_rate)) %>% 
              rename(NEET = smooth_count) %>% 
              pivot_longer(c(NEET, Mainstream),
                           names_to = "school",
                           values_to = "count")) %>% 
  arrange(end_period_year, age)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# fOK SO SAY YOU ALREADY HAD THE POV_CARE_SCHOOL DATA # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  # # # # # NOW MAKING CARE PARAMETERS # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


care_entry_param <-  care_pov %>% 
  # pov_care_school %>%
  group_by(end_period_year, gender, age, state, care) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = care,
              values_from = count) %>% 
  left_join(care_duration %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 1) %>% # because that was the average incidence for the year up to that point
              filter(end_period_year >= 2010) %>% 
              select(-mean_dur) %>% 
              pivot_wider(names_from = residential,
                          values_from = smooth_mean_dur) %>% 
              rename(res_dur = Residential,
                     nres_dur = `Not residential`)) %>% 
  group_by(state, gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(res_incidence = ((Residential + lead(Residential))/2)/(res_dur/7),
         nres_incidence = ((`Not residential` + lead(`Not residential`))/2)/(nres_dur/7)) %>% 
  mutate(res_incidence = ifelse(is.na(res_incidence), Residential/(res_dur/7), res_incidence),
         nres_incidence = ifelse(is.na(nres_incidence), `Not residential`/(nres_dur/7), nres_incidence)) %>% 
  ungroup() %>% 
  filter(end_period_year <= 2020) %>% 
  # WHAT DO WE KNOW ABOUT WHAT PERCENTAGE SHOULD BE REPEAT VERSUS FIRST TIME ENTRANTS
  # 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
  # 6 9 12 15 18 21 24 27
  add_cohort() %>% 
  mutate(ever_care = Prior + Residential + `Not residential`) %>% 
  group_by(gender, cohort, state) %>% 
  arrange(end_period_year) %>% 
  mutate(diff = lead(ever_care) - ever_care) %>% 
  mutate(p2care = (diff/Never)/52,
         p2care = ifelse(p2care < 0, 0, p2care)) %>% 
  ungroup()

  
care_entry_param %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = p2care, group = as.character(age), colour = as.character(age))) +
  facet_grid(rows = vars(gender),
             cols = vars(state)) +
  scale_fill_viridis()
  

care_entry_param %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = p2care, group = interaction(gender, state), colour = interaction(gender, state))) +
  facet_wrap(~cohort) +
  scale_fill_viridis()


pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(10:17)) %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, colour = gender)) +
  facet_wrap(~cohort) +
  scale_fill_viridis()


care_pov %>% 
  group_by(end_period_year, state, care) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, state) %>% 
  mutate(pc = count / sum(count)) %>% 
  filter(care != "Never") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = care)) +
  facet_grid(~state)
  
  