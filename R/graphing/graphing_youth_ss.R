
mutate(reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
       reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
       reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs")),
       outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                          "A no further action disposal"), "No", "Outcome - Yes"),
       outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
       link_yn = ifelse(link %in% c("True", "TRUE"), "Link - Yes", "No"),
       link_yn = ifelse(is.na(outcome), "Unknown", link_yn))


best_use_outcome <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17"),
         !is.na(powers)) %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         best_use = ifelse(short_date >= "2019-03-01", "Best use OFF", "Best use ON"),
         best_use = factor(best_use, levels = c("Best use ON", "Best use OFF"))) %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No", "Yes"),
         outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
         outcome_yn = factor(outcome_yn, levels = c("Unknown", "No", "Yes"))) %>% 
  mutate(count = 1) %>% 
  group_by(sec60, outcome_yn, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  filter(sec60 != "Other power") %>% 
  # group_by(sec60, best) %>% 
  # mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = best_use, y = count, fill = outcome_yn),
           stat = "identity", position = "fill") +
  facet_wrap(~sec60) +
  scale_fill_manual(values = c("lightgrey", "#DCD66EFF", "#B48A2CFF")) +
 theme_bw()
  

best_use_outcome

ggsave(filename = "Output/Graphs/best_use_outcome.png", best_use_outcome)


best_use_link <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17"),
         !is.na(powers)) %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         best_use = ifelse(short_date >= "2019-03-01", "Best use OFF", "Best use ON"),
         best_use = factor(best_use, levels = c("Best use ON", "Best use OFF"))) %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No", "Yes - Unlinked"),
         outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
         outcome_yn = ifelse(link %in% c("True", "TRUE"), "Yes - Linked", outcome_yn),
         outcome_yn = factor(outcome_yn, levels = c("Unknown", "No", "Yes - Unlinked", "Yes - Linked"))) %>% 
  mutate(count = 1) %>% 
  group_by(sec60, outcome_yn, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  filter(sec60 != "Other power") %>% 
  # group_by(sec60, best) %>% 
  # mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = best_use, y = count, fill = outcome_yn),
           stat = "identity", position = "fill") +
  facet_wrap(~sec60) +
  scale_fill_manual(values = c("lightgrey", "#DCD66EFF", "#B48A2CFF", "#934606")) +
  theme_bw()


best_use_link
ggsave(filename = "Output/Graphs/best_use_link.png", best_use_link)









best_use_link <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17"),
         !is.na(powers)) %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         best_use = ifelse(short_date >= "2019-03-01", "Best use OFF", "Best use ON"),
         best_use = factor(best_use, levels = c("Best use ON", "Best use OFF"))) %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No", "Yes"),
         outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
         outcome_yn = factor(outcome_yn, levels = c("Unknown", "No", "Yes"))) %>% 
  filter(outcome_yn == "Yes") %>% 
  mutate(link_yn = ifelse(link %in% c("True", "TRUE"), "Linked", link),
         link_yn = ifelse(link %in% c("False", "FALSE"), "Unlinked", link_yn),
         link_yn = ifelse(is.na(link), "Unknown", link_yn),
         link_yn = factor(link_yn, levels = c("Unknown", "Unlinked", "Linked"))) %>% 
  mutate(count = 1) %>% 
  group_by(sec60, best_use, link_yn) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  filter(sec60 != "Other power") %>% 
  # group_by(sec60, best) %>% 
  # mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = best_use, y = count, fill = link_yn),
           stat = "identity", position = "fill") +
  facet_wrap(~sec60) +
  scale_fill_manual(values = c("lightgrey", "#DCD66EFF", "#B48A2CFF")) +
  theme_bw()
  
  
best_use_link





best_use_power <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17"),
         !is.na(powers)) %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         sec60 = factor(sec60, levels = c( "Section 60", "Misuse of Drugs", "PACE", "Other power")),
         best_use = ifelse(short_date >= "2019-03-01", "Best use OFF", "Best use ON"),
         best_use = factor(best_use, levels = c("Best use ON", "Best use OFF"))) %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No", "Yes"),
         outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
         outcome_yn = factor(outcome_yn, levels = c("Unknown", "No", "Yes"))) %>% 
  mutate(count = 1) %>% 
  group_by(sec60, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 

  # group_by(sec60, best) %>% 
  # mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = best_use, y = count, fill = sec60),
           stat = "identity", position = "fill") +
  # scale_fill_manual(values = c("lightgrey", "#DCD66EFF", "#B48A2CFF")) +
  theme_bw()

best_use_power



weekly_av <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(week = cut.Date(short_date, breaks = "1 week", labels = FALSE)) %>% 
  mutate(count = 1) %>% 
  group_by(week) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = week, y = count),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 260))

weekly_av


powers_birm_u17 <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         sec60 = factor(sec60, levels = c( "Section 60", "PACE", "Misuse of Drugs", "Other power")),
         week = cut.Date(short_date, breaks = "1 week", labels = FALSE)) %>% 
  mutate(count = 1) %>% 
  group_by(week, sec60) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = week, y = count, fill = sec60),
           stat = "identity", position = "stack", width=1) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0),
                     breaks = seq(6, 422, 52),
                     labels = c("2015", "2016", "2017", "2018",
                                "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 240)) +
  scale_fill_manual(values = c("#A8554EFF", "#90CDE7", "#91A1BAFF", "lightgrey")) +
  theme(legend.position = "none")

powers_birm_u17
ggsave(filename = "output/graphs/powers_birm_u17.png", powers_birm_u17)



outcomes_birm_u17 <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No/Unknown", "Yes"),
         outcome_yn = ifelse(is.na(outcome), "No/Unknown", outcome_yn),
         week = cut.Date(short_date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  mutate(count = 1) %>% 
  group_by(week, best_use, outcome_yn) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = outcome_yn,
              values_from = count,
              values_fill = 0) %>% 
  mutate(count = Yes+`No/Unknown`,
         pc = Yes/count) 

linmod_birm_u17 <- lm(pc ~ count + best_use + count*best_use, data=outcomes_birm_u17)


pc_pred_birm_u17 <- outcomes_birm_u17 %>% 
  mutate(pc_model = predict(linmod_birm_u17, outcomes_birm_u17))

outcomes_reg_birm_u17 <- pc_pred_birm_u17 %>% 
  ggplot() +
  geom_point(aes(x = count, y = pc, colour = best_use)) +
  geom_line(aes(x = count, y = pc_model, colour = best_use))

outcomes_reg_birm_u17

ggsave(filename = "output/graphs/outcomes_reg_birm_u17.png", outcomes_reg_birm_u17)



outcomes_all <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)") %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No/Unknown", "Yes"),
         outcome_yn = ifelse(is.na(outcome), "No/Unknown", outcome_yn),
         week = cut.Date(short_date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  mutate(count = 1) %>% 
  group_by(week, best_use, outcome_yn) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = outcome_yn,
              values_from = count,
              values_fill = 0) %>% 
  mutate(count = Yes+`No/Unknown`,
         pc = Yes/count) 

linmod_all <- lm(pc ~ count + best_use + count*best_use, data=outcomes_all)


pc_pred_all <- outcomes_all %>% 
  mutate(pc_model = predict(linmod_all, outcomes_all))

outcomes_reg_full <- pc_pred_all %>% 
  ggplot() +
  geom_point(aes(x = count, y = pc, colour = best_use)) +
  geom_line(aes(x = count, y = pc_model, colour = best_use))

outcomes_reg_full

ggsave(filename = "output/graphs/outcomes_reg_full.png", outcomes_reg_full)



outcomes_all <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No/Unknown", "Yes"),
         outcome_yn = ifelse(is.na(outcome), "No/Unknown", outcome_yn),
         week = cut.Date(short_date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  mutate(count = 1) %>% 
  group_by(outcome_yn, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = outcome_yn,
              values_from = count,
              values_fill = 0) %>% 
  mutate(count = Yes+`No/Unknown`,
         pc = Yes/count) 


regimes <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(week = cut.Date(short_date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  mutate(count = 1) %>% 
  group_by(week, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(best_use) %>% 
  summarise(mean = mean(count),
         sd = sd(count))

ss_hist_daily <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(week = cut.Date(short_date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  mutate(count = 1) %>% 
  group_by(short_date, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  ggplot() + 
  geom_histogram(aes(x=count, color=best_use, fill=best_use),
                 binwidth=1, alpha=0.5) +
  theme_bw()
ss_hist_daily


ss_hist_weekly <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(week = cut.Date(short_date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  mutate(count = 1) %>% 
  group_by(week, best_use) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  ggplot() + 
  geom_histogram(aes(x=count, color=best_use, fill=best_use),
                 binwidth=1, alpha=0.5) +
  theme_bw()

ss_hist_weekly

ggsave(filename = "output/graphs/ss_hist_weekly.png", ss_hist_weekly)


ss_hist_daily <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(date = as.Date(short_date))  %>% 
  expand(LA, date = full_seq(date, 1)) %>% 
  left_join(stop_search_1214to0322 %>%
              st_drop_geometry() %>%
              filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
                     LA == "Birmingham",
                     age %in% c("under 10", "10-17", "Oct-17")) %>% 
              mutate(date = as.Date(short_date)) %>% 
              mutate(count = 1) %>% 
              group_by(date) %>% 
              summarise(count = sum(count))) %>% 
  mutate(count = ifelse(is.na(count), 0, count)) %>% 
  mutate(week = cut.Date(date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  ggplot() + 
  geom_histogram(aes(x=count, color=best_use, fill=best_use),
                 binwidth=1, alpha=0.5) +
  theme_bw()
ss_hist_daily
ggsave(filename = "output/graphs/ss_hist_daily.png", ss_hist_daily)



ss_hist_weekly <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(date = as.Date(short_date))  %>% 
  expand(LA, date = full_seq(date, 1)) %>% 
  left_join(stop_search_1214to0322 %>%
              st_drop_geometry() %>%
              filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
                     LA == "Birmingham",
                     age %in% c("under 10", "10-17", "Oct-17")) %>% 
              mutate(date = as.Date(short_date)) %>% 
              mutate(count = 1) %>% 
              group_by(date) %>% 
              summarise(count = sum(count))) %>% 
  mutate(count = ifelse(is.na(count), 0, count)) %>% 
  mutate(week = cut.Date(date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  group_by(week, best_use)%>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  ggplot() + 
  geom_histogram(aes(x=count, color=best_use, fill=best_use),
                 binwidth=1, alpha=0.5) +
  theme_bw() +
  # geom_histogram(data = data.frame(p = rpois(seq(1, 222, 1), 30)),
  #                aes(x = p),
  #                alpha=0.2)
  geom_histogram(data = data.frame(p = rnorm(seq(1, 222, 1), 25, 10)),
                 aes(x = p),
                 binwidth=1,
                 alpha=0.5) +
  geom_histogram(data = data.frame(p = rnorm(seq(1, 222, 1), 42, 16)),
                 aes(x = p),
                 binwidth=1,
                 alpha=0.5)


# ok so these are not normal distributions anyway... but lets go with that for now..
ss_hist_weekly
ggsave(filename = "output/graphs/ss_hist_weekly.png", ss_hist_weekly)


# # install.packages("lognorm")
# library(lognorm)
# # install.packages("prevalence")
# library(prevalence)
# meanlog <- -6.5
# sdlog <- 1
# lognorm_median <- getLognormMedian(meanlog)
# lognorm_mode <- getLognormMode(meanlog, sdlog)
# curve(dlnorm(x,meanlog,sdlog),from=0,to=0.015)
# abline(v=lognorm_median, col=2); abline(v=lognorm_mode, col=3); 


n <- seq(1, 222, 1)

x <- rpois(n, 4)

pois = data.frame(p = rpois(seq(1, 222, 1), 20)) 


# %>% 
  mutate(count = 1) %>% 
  group_by(p) %>% 
  summarise(count = sum(count))

# check10 <- stop_search_1214to0322 %>%
#   st_drop_geometry() %>%
#   filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
#          LA == "Birmingham",
#          age %in% c("under 10", "10-17", "Oct-17")) %>% 
#   mutate(date = as.Date(short_date))  %>% 
#   mutate(count = 1) %>% 
#   group_by(date, lsoa, age, outcome) %>% 
#   summarise(count = sum(count)) %>% 
#   ungroup() %>% 
#   group_by(date) %>% 
#   filter(sum(count) == 10)


load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_1214to0322.Rdata")


# this is the link from the police data website
lsoa_shape <- st_read("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/THdata/Lower_layer_super_output_areas_(E+W)_2011_Boundaries_(Full_Extent)_V2/LSOA_2011_EW_BFE_V2.shp")
# lsoa2LA <- read.csv("/Users/katehayes/THdata/OAs_to_LSOAs_to_MSOAs_to_LEP_to_LAD_(December_2022)_Lookup_in_England_(V2).csv")
lsoa2LA <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/THdata/LSOA11_WD21_LAD21_EW_LU_V2.xlsx")
w_shape <- st_read("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/Wards_December_2022_Boundaries_UK_BFC_-3416072881830331872 (1)/WD_DEC_2022_UK_BFC.shp")


lsoa_list <- lsoa2LA %>%
  filter(LAD21NM %in% LAs_in_WMPF_list) %>%
  select(LSOA11NM, WD21NM) %>%
  rename(lsoa = LSOA11NM,
         ward = WD21NM)

birm_lsoa_list <- lsoa2LA %>%
  filter(LAD21NM == "Birmingham") %>%
  select(LSOA11NM, WD21NM) %>%
  rename(lsoa = LSOA11NM,
         ward = WD21NM)


add_missing_lsoa <- function(ss_data, full_lsoa_list = lsoa_list, full_lsoa_shapes = lsoa_shape) {

  present_lsoa <- ss_data %>%
    st_drop_geometry() %>%
    distinct(lsoa)

  missing_shapes <- full_lsoa_list %>%
    filter(!(lsoa %in% present_lsoa$lsoa)) %>%
    left_join(full_lsoa_shapes %>%
                select(LSOA11NM) %>%
                rename(lsoa = LSOA11NM)) %>%
    rename(lsoa_shape = geometry) %>%
    mutate(count = 0) %>%
    st_as_sf() %>%
    st_transform(crs = 4326)

  return(missing_shapes)

}


map_lsoa <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  group_by(lsoa, lsoa_shape) %>%
  mutate(count = 0) %>%
  summarise(count = sum(count)) %>%
  st_as_sf() %>%
  st_transform(crs = 4326) %>%
  bind_rows(add_missing_lsoa(ss_data = stop_search_1214to0322,
                             full_lsoa_list = lsoa_list,
                             full_lsoa_shapes = lsoa_shape))

birm_map_lsoa <- ss_birm %>%
  st_drop_geometry() %>%
  group_by(lsoa, lsoa_shape) %>%
  mutate(count = 0) %>%
  summarise(count = sum(count)) %>%
  st_as_sf() %>%
  st_transform(crs = 4326) %>%
  bind_rows(add_missing_lsoa(ss_data = ss_birm,
                             full_lsoa_list = birm_lsoa_list,
                             full_lsoa_shapes = lsoa_shape))



map_ward <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  group_by(ward) %>%
  mutate(count = 0) %>%
  summarise(count = sum(count)) %>%
  left_join(w_shape %>%
              filter(LAD22NM %in%  LAs_in_WMPF_list) %>%
              select(WD22NM, geometry) %>%
              rename(ward = WD22NM)) %>%
  st_as_sf() %>%
  st_transform(crs = 4326)


wm_map <- ggplot() +
  geom_sf(data = map_lsoa, fill = "grey", colour="white", linewidth = 0.2) +
  geom_sf(data = map_ward, fill = NA, color = "black", linewidth = 0.5) +
  # geom_text(data =ward_coords, aes(x = X, y = Y, label = ward)) +
  # geom_sf_text(data = map_ward, aes(label = str_wrap(ward, 2)), colour = "black", size = 2.5) +
  theme_bw()

wm_map





ss_map <- ss_birm %>%
  st_drop_geometry() %>%
  group_by(lsoa, ward, lsoa_shape) %>%
  mutate(count = 1) %>%
  summarise(count = sum(count)) %>%
  st_as_sf() %>%
  st_transform(crs = 4326) %>%
  bind_rows(add_missing_lsoa(ss_data = ss_birm,
                             full_lsoa_list = birm_lsoa_list,
                             full_lsoa_shapes = lsoa_shape)) %>%
  ggplot(aes(fill=count)) +
  geom_sf(colour="white") +
  scale_fill_viridis(option = "magma")

ss_map

ggsave(filename = "Output/Graphs/ss_map.png", ss_map)




######------######------######------######------######------######------######------
######------######-new attempt at the geospatial sthings below ######------######------######------
######------######------######------######------######------######------######------

ss_map <- ss_birm %>%
  st_drop_geometry() %>%
  group_by(lsoa, ward, lsoa_shape) %>%
  mutate(count = 1) %>%
  summarise(count = sum(count)) %>% 
  # filter(!(lsoa %in% c("Birmingham 138A", "Birmingham 050E", "Birmingham 135C", "Birmingham 050F"))) %>%
  st_as_sf() %>%
  st_transform(crs = 4326) %>%
  bind_rows(add_missing_lsoa(ss_data = ss_birm,
                             full_lsoa_list = birm_lsoa_list,
                             full_lsoa_shapes = lsoa_shape)) %>%
  ggplot(aes(fill=count)) +
  geom_sf(colour="white") +
  scale_fill_viridis(option = "turbo",
                     begin = 0,
                     end = 1)

ss_map
ggsave(filename = "Output/Graphs/ss_map.png", ss_map)



ss_adult_child <- stop_search_1214to0322 %>%
  mutate(a_c = ifelse(age %in% c("under 10", "10-17", "Oct-17"), "Child", "Adult"),
         a_c = ifelse(is.na(age), "Unknown", a_c),
         a_c = factor(a_c, levels = c("Unknown", "Child", "Adult")),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(month, a_c) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = a_c),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 3500)) +
  scale_fill_manual(values = c("lightgrey", "#99CCCC", "#9999CC"))



ss_adult_child
   
ggsave(filename = "Output/Graphs/ss_adult_child.png", ss_adult_child)



ss_adult_child_daily <- stop_search_1214to0322 %>%
  mutate(a_c = ifelse(age %in% c("under 10", "10-17", "Oct-17"), "Child", "Adult"),
         a_c = ifelse(is.na(age), "Unknown", a_c),
         a_c = factor(a_c, levels = c("Unknown", "Child", "Adult")),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(short_date, a_c) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = short_date, y = count, fill = a_c),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 250)) +
  scale_fill_manual(values = c("lightgrey", "#99CCCC", "#9999CC"),
                    guide = "none")


ggsave(filename = "Output/Graphs/ss_adult_child_daily.png", ss_adult_child_daily)




check <- stop_search_1214to0322 %>%
  distinct(powers) 
# Criminal Justice and Public Order Act 1994 (section 60)

ss_sec60 

ss_sec60 <- stop_search_1214to0322 %>%
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(month, sec60) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = sec60),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 3500)) +
  scale_fill_manual(values = c("lightgrey", "#99CCCC"))

ss_sec60


ss_sec60 <- stop_search_1214to0322 %>%
  # filter(LA == "Birmingham") %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         sec60 = factor(sec60, levels = c( "Section 60", "PACE", "Misuse of Drugs", "Other power")),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(month, sec60) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = sec60),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 3500)) +
  scale_fill_manual(values = c("#A8554EFF", "#99CCCC", "#91A1BAFF", "lightgrey"))

ss_sec60
ggsave(filename = "Output/Graphs/ss_sec60.png", ss_sec60)


powers_birm_u17 <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(sec60 = ifelse(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                        "Section 60", "Other power"),
         sec60 = ifelse(powers == "Police and Criminal Evidence Act 1984 (section 1)",
                        "PACE", sec60),
         sec60 = ifelse(powers == "Misuse of Drugs Act 1971 (section 23)",
                        "Misuse of Drugs", sec60),
         sec60 = factor(sec60, levels = c( "Section 60", "PACE", "Misuse of Drugs", "Other power")),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(month, sec60) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = sec60),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 620)) +
  scale_fill_manual(values = c("#A8554EFF", "#99CCCC", "#91A1BAFF", "lightgrey"))

powers_birm_u17
ggsave(filename = "Output/Graphs/powers_birm_u17.png", powers_birm_u17)



ss_sec60 <- stop_search_1214to0322 %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)") %>% 
  mutate(count = 1) %>% 
  group_by(short_date, lsoa) %>% 
  summarise(count = sum(count)) 


ss_sec60 <- stop_search_1214to0322 %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)") %>% 
  mutate(count = 1) %>% 
  group_by(short_date) %>% 
  summarise(count = sum(count)) 


ss_sec60 <- ss_birm %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)") %>% 
  mutate(count = 1) %>% 
  group_by(lsoa) %>% 
  summarise(count = sum(count)) 

ss_sec60 <- ss_birm %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)") %>% 
  mutate(count = 1) %>% 
  group_by(lsoa, short_date) %>% 
  summarise(count = sum(count)) 


ss_sec60 <- ss_birm %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
         short_date >= "2019-02-26",
         short_date <= "2019-04-01") %>% 
  mutate(count = 1) %>% 
  group_by(lsoa) %>% 
  summarise(count = sum(count))

spike2019 <- ss_birm %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
         short_date >= "2019-02-26",
         short_date <= "2019-04-01") %>% 
  mutate(count = 1) %>% 
  group_by(short_date, lsoa) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = short_date, y = count, fill = lsoa),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 50)) +
  scale_color_viridis(option = "turbo",
                     begin = 0,
                     end = 1) +
  theme(legend.position = "none")

spike2019

ggsave(filename = "Output/Graphs/spike2019.png", spike2019)


fullspike2019 <- ggplot() + 
  geom_sf(data = birm_map_lsoa, fill = "black", color = "grey", linewidth = 0.1) +
  # geom_sf(data = birm_map_lsoa, fill = NA, color = "black", linewidth = 0.5) +
  geom_sf(data = ss_birm %>%
            filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                   short_date >= "2019-02-26",
                   short_date <= "2019-04-01") %>% 
            mutate(count = 1) %>% 
            group_by(lsoa, ward, lsoa_shape) %>%
            summarise(count = sum(count)) %>% 
            st_as_sf() %>%
            st_transform(crs = 4326), aes(fill=count, color = "white")) +
  scale_fill_viridis(option = "turbo",
                     direction = -1,
                     begin = 0.5,
                     end = 1)
fullspike2019

ggsave(filename = "Output/Graphs/fullspike2019.png", fullspike2019)


th_map <- ggplot() + 
  geom_sf(data = th_map_ward, fill = "grey", color = "grey") +
  geom_sf(data = th_map_lsoa, fill = NA, colour="white", linewidth = 0.2) +
  geom_sf(data = th_map_ward, fill = NA, color = "black", linewidth = 0.5) +
  # geom_text(data =ward_coords, aes(x = X, y = Y, label = ward)) +
  geom_sf_text(data = th_map_ward, aes(label = str_wrap(ward, 2)), colour = "black", size = 2.5) +
  theme_bw()

tight_spike2019 <- ggplot() + 
  geom_sf(data = birm_map_lsoa, fill = "black", color = "grey", linewidth = 0.1) +
  # geom_sf(data = birm_map_lsoa, fill = NA, color = "black", linewidth = 0.5) +
  geom_sf(data = ss_birm %>%
            filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
                   short_date >= "2019-02-26",
                   short_date <= "2019-03-14") %>% 
            mutate(count = 1) %>% 
            group_by(lsoa, ward, lsoa_shape) %>%
            summarise(count = sum(count)) %>% 
            st_as_sf() %>%
            st_transform(crs = 4326), aes(fill=count, color = "white")) +
  scale_fill_viridis(option = "turbo",
                     direction = -1,
                     begin = 0.5,
                     end = 1)
tight_spike2019

ggsave(filename = "Output/Graphs/tight_spike2019.png", tight_spike2019)


tight_spike2019 <- ss_birm %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)",
         short_date >= "2019-02-26",
         short_date <= "2019-03-14") %>% 
  mutate(count = 1) %>% 
  group_by(lsoa, ward, lsoa_shape) %>%
  summarise(count = sum(count)) %>% 
  st_as_sf() %>%
  st_transform(crs = 4326) %>%
  bind_rows(add_missing_lsoa(ss_data = ss_birm,
                             full_lsoa_list = birm_lsoa_list,
                             full_lsoa_shapes = lsoa_shape)) %>%
  ggplot(aes(fill=count)) +
  geom_sf(colour="white") +
  scale_fill_viridis(option = "turbo",
                     begin = 0,
                     end = 1)


tight_spike2019



ss_sec60 <- ss_birm %>%
  filter(powers == "Criminal Justice and Public Order Act 1994 (section 60)") %>% 
  st_drop_geometry() %>%
  group_by(lsoa, ward, lsoa_shape) %>%
  mutate(count = 1) %>%
  summarise(count = sum(count)) %>% 
  # filter(!(lsoa %in% c("Birmingham 138A", "Birmingham 050E", "Birmingham 135C", "Birmingham 050F"))) %>%
  st_as_sf() %>%
  st_transform(crs = 4326) %>%
  bind_rows(add_missing_lsoa(ss_data = ss_birm,
                             full_lsoa_list = birm_lsoa_list,
                             full_lsoa_shapes = lsoa_shape)) %>%
  ggplot(aes(fill=count)) +
  geom_sf(colour="white") +
  scale_fill_viridis(option = "turbo",
                     begin = 0,
                     end = 1)

ss_sec60
ggsave(filename = "Output/Graphs/ss_map.png", ss_map)

library(viridis)

# %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = sec60),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 3500)) +
  scale_fill_manual(values = c("#A8554EFF", "#99CCCC", "#91A1BAFF", "lightgrey"))





may_2017 <- stop_search_1214to0322 %>%
  filter(short_date >= "2017-02-01",
         short_date <= "2017-07-01") %>% 
  mutate(date = ymd(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(date, powers) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = date, y = count, fill = powers),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_date(date_breaks = "1 month") +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 130)) 

may_2017



ss_adult_child_birm <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham") %>% 
  mutate(a_c = ifelse(age %in% c("under 10", "10-17", "Oct-17"), "Child", "Adult"),
         a_c = ifelse(is.na(age), "Unknown", a_c),
         a_c = factor(a_c, levels = c("Unknown", "Child", "Adult")),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(month, a_c) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = a_c),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 3500)) +
  scale_fill_manual(values = c("lightgrey", "#99CCCC", "#9999CC"))

ss_adult_child_birm

ggsave(filename = "Output/Graphs/ss_adult_child_birm.png", ss_adult_child_birm)



ss_adult_child_pc <- stop_search_1214to0322 %>%
  mutate(a_c = ifelse(age %in% c("under 10", "10-17", "Oct-17"), "Child", "Adult"),
         a_c = ifelse(is.na(age), "Unknown", a_c),
         a_c = factor(a_c, levels = c("Unknown", "Child", "Adult")),
         # month = lubridate::floor_date(short_date, "month")) %>% 
         month = as.yearmon(short_date)) %>% 
  mutate(count = 1) %>% 
  group_by(month, a_c) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(month) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = month, y = pc, group = a_c, color = a_c)) +
  scale_color_manual(values = c("lightgrey", "#99CCCC", "#9999CC"))+
                     # guide = FALSE) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 1))


ss_adult_child_pc

ggsave(filename = "Output/Graphs/ss_adult_child_pc.png", ss_adult_child_pc)



ss_birm_dw <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(month = as.yearmon(short_date),
         reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
         reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
         reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs"))) %>% 
  mutate(count = 1) %>% 
  group_by(month, reason_dw) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = reason_dw),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 600)) +
  scale_fill_manual(values = c("grey",  "#EBA07EFF", "#A8554EFF"))

ss_birm_dw

ggsave(filename = "Output/Graphs/ss_birm_dw.png", ss_birm_dw)

ss_birm <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(month = as.yearmon(short_date),
         reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
         reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
         reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs"))) %>% 
  mutate(count = 1) %>% 
  group_by(month, reason_dw) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = month, y = count, group = reason_dw, color = reason_dw)) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 500)) +
  scale_color_manual(values = c("grey",  "#EBA07EFF", "#A8554EFF"))

ss_birm



check <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  distinct(outcome)





ss_birm_outcome <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(month = as.yearmon(short_date),
         outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                           "A no further action disposal"), "No further action", "Other"),
         outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn)) %>% 
         # outcome_yn = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs"))) %>% 
  mutate(count = 1) %>% 
  group_by(month, outcome_yn) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = outcome_yn),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 600)) +
  scale_fill_manual(values = c( "#EBA07EFF", "#A8554EFF", "grey"))

ss_birm_outcome

ggsave(filename = "Output/Graphs/ss_birm_outcome.png", ss_birm_outcome)


# ss_birm_outcome_link <- stop_search_1214to0322 %>%
#   filter(LA == "Birmingham",
#          age %in% c("under 10", "10-17", "Oct-17"),
#          !(outcome %in% c("Nothing found - no further action",
#                          "A no further action disposal")),
#          !is.na(outcome)) %>% 
#   mutate(month = as.yearmon(short_date),
#          reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
#          reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
#          reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs"))) %>% 
#   mutate(count = 1) %>% 
#   group_by(month, reason_dw) %>% 
#   summarise(count = sum(count)) %>% 
#   ggplot() +
#   geom_bar(aes(x = month, y = count, fill = reason_dw),
#            stat = "identity", position = "stack") +
#   theme_bw() +
#   scale_x_continuous(name = "", 
#                      expand = c(0,0)) +
#   scale_y_continuous(name = "",
#                      expand = c(0,0),
#                      limits = c(0, 60)) +
#   scale_fill_manual(values = c( "#EBA07EFF", "#A8554EFF", "grey"))
# 
# ss_birm_outcome_link



what percentage of drug weapons and other are NFA
what percentage of drug weapons and other are link

check <- stop_search_1214to0322 %>%
  distinct(link)


# check <- stop_search_1214to0322 %>%
#   mutate(month = as.yearmon(short_date),
#          reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
#           reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
#           reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs"))) %>% 
#   filter(LA == "Birmingham",
#          age %in% c("under 10", "10-17", "Oct-17"),
#          reason_dw == "Other",
#          month > "Dec 2018") %>% 
#   distinct(link)

ss_birm_dw_outcome <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(month = as.yearmon(short_date),
         link_yn = ifelse(link %in% c("True", "TRUE"), "Link - Yes", "No"),
         link_yn = ifelse(is.na(outcome), "Unknown", link_yn)) %>% 
  mutate(count = 1) %>% 
  group_by(month, link_yn) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(month) %>% 
  mutate(pc_link = count/sum(count)) %>% 
  ungroup() %>% 
  ggplot() +
  geom_line(aes(x = month, y = pc_link, group = link_yn, color = link_yn)) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 1)) +
  scale_colour_manual(values = c("grey",  "#EBA07EFF", "#A8554EFF"))

ss_birm_dw_outcome


ss_birm_dw_outcome <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17"),
         !is.na(reason)) %>% 
  mutate(month = as.yearmon(short_date),
         reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
         reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
         reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs")),
         outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                            "A no further action disposal"), "No", "Outcome - Yes"),
         outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
         link_yn = ifelse(link %in% c("True", "TRUE"), "Link - Yes", "No"),
         link_yn = ifelse(is.na(outcome), "Unknown", link_yn)) %>% 
  mutate(count = 1) %>% 
  group_by(month, reason_dw, outcome_yn) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(month, reason_dw) %>% 
  mutate(pc = count/sum(count)) %>%
  ungroup() %>% 
  filter(outcome_yn == "Outcome - Yes") %>% 
  ggplot() +
  geom_line(aes(x = month, y = pc), color = "blue") +
  geom_line(data = stop_search_1214to0322 %>%
              filter(LA == "Birmingham",
                     age %in% c("under 10", "10-17", "Oct-17")) %>% 
              mutate(month = as.yearmon(short_date),
                     reason_dw = ifelse(reason == "Controlled drugs", reason, "Other"),
                     reason_dw = ifelse(reason == "Offensive weapons", reason, reason_dw),
                     reason_dw = factor(reason_dw, levels = c("Other", "Offensive weapons",  "Controlled drugs")),
                     outcome_yn = ifelse(outcome %in% c("Nothing found - no further action",
                                                        "A no further action disposal"), "No", "Outcome - Yes"),
                     outcome_yn = ifelse(is.na(outcome), "Unknown", outcome_yn),
                     link_yn = ifelse(link %in% c("True", "TRUE"), "Link - Yes", "No"),
                     link_yn = ifelse(is.na(outcome), "Unknown", link_yn)) %>% 
              mutate(count = 1) %>% 
              group_by(month, reason_dw, link_yn) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(month, reason_dw) %>% 
              mutate(pc = count/sum(count)) %>%
              ungroup() %>% 
              filter(link_yn == "Link - Yes"),
            aes(x = month, y = pc), color = "red") +
  facet_grid(~reason_dw) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 0.65)) 

ss_birm_dw_outcome
ggsave(filename = "Output/Graphs/ss_birm_dw_outcome.png", ss_birm_dw_outcome)

######------######------######------######------######------######------######------
######------######-old attempt at the geospatial sthings below ######------######------######------
######------######------######------######------######------######------######------


lsoa_shape <- st_read("/Users/katehayes/temp_data/LSOA_Dec_2021_Boundaries_Full_Clipped_EW_BFC_2022_4005706377815092351/LSOA_2021_EW_BFC_V7.shp")
w_shape <- st_read("/Users/katehayes/temp_data/Wards_December_2022_Boundaries_UK_BFC_-3416072881830331872/WD_DEC_2022_UK_BFC.shp")

ss_gen_graph <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  filter(!is.na(gender),
         gender != "") %>%
  mutate(date = ymd(date),
         month = format_ISO8601(date, precision = "ym")) %>%
  mutate(count = 1) %>%
  group_by(month, gender) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_line(aes(x = month, y = count, group = gender, color = gender))

ss_gen_graph
ggsave(filename = "Output/Graphs/ss_gen_graph.png", ss_gen_graph)

ss_gen_pc_graph <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  filter(!is.na(gender),
         gender != "") %>%
  mutate(date = ymd(date),
         month = format_ISO8601(date, precision = "ym")) %>%
  mutate(count = 1) %>%
  group_by(month, gender) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = month, y = count, fill = gender),
           stat = "identity", position = "fill") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ss_gen_pc_graph
ggsave(filename = "Output/Graphs/ss_gen_pc_graph.png", ss_gen_pc_graph)


ss_graph <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  mutate(date = ymd(date),
         month = format_ISO8601(date, precision = "ym")) %>%
  mutate(count = 1) %>%
  group_by(month) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  ggplot() +
  geom_line(aes(x = month, y = count, group = 1)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

ss_graph
ggsave(filename = "Output/Graphs/ss_graph.png", ss_graph)

# why did they arrest so many people
# i think its not an error by me, i think they just did

######trying to get sense of age dist------######------######------######------######------######------######------

ss_age_birm_18to21 <- stop_search_18to21_age  %>%
  mutate(Year = as.numeric(Year),
         age = factor(age,
                      levels = c("7", "8", "10", "11", "12", "13", "14", "15", "16", "17"))) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = count, fill = age),
           stat = "identity", position = "dodge") +
  # facet_grid(~`Neighbourhood Policing Unit`) +
  theme(plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

ss_age_birm_18to21

library(viridis)

ggsave(filename = "Output/Graphs/ss_age_birm_18to21.png", ss_age_birm_18to21)


ss_agepc_birm_18to21 <- stop_search_18to21_age %>%
  mutate(Year = as.numeric(Year),
         age = factor(age,
                      levels = c("7", "8", "10", "11", "12", "13", "14", "15", "16", "17"))) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = count, fill = age),
           stat = "identity", position = "fill") +
  # facet_grid(~`Neighbourhood Policing Unit`) +
  theme(plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
ss_agepc_birm_18to21
ggsave(filename = "Output/Graphs/ss_agepc_birm_18to21.png", ss_agepc_birm_18to21)

# possibly children getting searched easlier? especially birm west?
# 16/17 drop from a little over 60 to a little over 50%


ss_age_girls_wm_18to21 <- ss_age_girls %>%
  mutate(age = factor(age,
                      levels = c("6", "7", "8", "10", "11", "12", "13", "14", "15", "16", "17"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = age),
           stat = "identity", position = "dodge") +
  theme(plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

ss_age_girls_wm_18to21
ggsave(filename = "Output/Graphs/ss_age_girls_wm_18to21.png", ss_age_girls_wm_18to21)

ss_agepc_girls_wm_18to21 <- ss_age_girls %>%
  mutate(age = factor(age,
                      levels = c("6", "7", "8", "10", "11", "12", "13", "14", "15", "16", "17"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = age),
           stat = "identity", position = "fill") +
  theme(plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

ss_agepc_girls_wm_18to21
ggsave(filename = "Output/Graphs/ss_agepc_girls_wm_18to21.png", ss_agepc_girls_wm_18to21)

# not too dissimilar, 16+17 year olds hovering around 50% of total searches

######------######------######------######------######------######------######------
######------looking a little at the wards w the most activity----------------------############
######------######------######------######------######------######------######------

sec60_dates <- sec60_data %>%
  filter(grepl("Birmingham", NPU)) %>%
  select(`Stop Date`) %>%
  distinct() %>%
  rename(date = `Stop Date`) %>%
  mutate(date = ymd(date)) %>%
  arrange(date) %>%
  mutate(diff = date - lag(date)) %>%
  mutate(x1 = ifelse(diff != 1, decimal_date(date), NA),
         x2 = ifelse((diff == 1 & lead(diff) != 1) | (diff != 1 & lead(diff) != 1),
                     decimal_date(date), NA),
         x2 = ifelse(date == "2022-01-14", decimal_date(date), x2))


sec60_start <- sec60_dates %>%
  select(x1) %>%
  filter(!is.na(x1)) %>%
  mutate(rank = row_number())

sec60_end <- sec60_dates %>%
  select(x2) %>%
  filter(!is.na(x2)) %>%
  mutate(rank = row_number())

sec60_dates <- full_join(sec60_start, sec60_end) %>%
  mutate(y1 = 0,
         y2 = 65)




ladywood <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  filter(ward == "Ladywood") %>%
  mutate(date = ymd(date)) %>%
  filter(date >= "2017-01-06",
         date <= "2022-02-04") %>%
  mutate(count = 1) %>%
  group_by(date) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_line(aes(x = decimal_date(date), y = count, group = 1)) +
  geom_rect(data = sec60_dates,
            mapping = aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2), color='grey', alpha=0.2)

ladywood

# sec60_graph <- stop_search_1214to0322_reason_outcome_gen_ward %>%
#   st_drop_geometry() %>%
#   mutate(date = ymd(date)) %>%
#   filter(date >= "2017-01-06",
#          date <= "2022-02-04") %>%
#   mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
#                              !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
#   mutate(count = 1) %>%
#   group_by(date, outcome) %>%
#   summarise(count = sum(count)) %>%
#   ggplot() +
#   # geom_line(aes(x = decimal_date(date), y = count, group = 1)) +
#   geom_rect(data = sec60_dates,
#             mapping = aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2), color='grey', alpha = 0.2) +
#   geom_line(aes(x = decimal_date(date), y = count, group = outcome, colour = outcome)) +
#   theme_classic()
#
# sec60_graph


sec60_plot <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(date = ymd(date)) %>%
  filter(date >= "2017-01-06",
         date <= "2022-02-04") %>%
  mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                             !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
  mutate(count = 1) %>%
  group_by(date, outcome) %>%
  summarise(count = sum(count)) %>%
  left_join(sec60_data %>%
              filter(grepl("Birmingham", NPU)) %>%
              select(`Stop Date`) %>%
              distinct() %>%
              rename(date = `Stop Date`) %>%
              mutate(date = ymd(date)) %>%
              arrange(date) %>%
              mutate(sec_60 = "Yes")) %>%
  mutate(sec_60 = ifelse(is.na(sec_60), "No", sec_60)) %>%
  ggplot() +
  geom_bar(aes(x = decimal_date(date), y = count, fill = interaction(sec_60, fct_rev(outcome))),
           stat = "identity", position = "stack") +
  theme_classic() +
  scale_fill_manual(values=c("grey", "black", "red", "red")) +
  scale_x_continuous(limits = c(2017, 2022.15), expand = c(0, 0)) +
  scale_y_continuous(limits = c(0,65), expand = c(0, 0)) +
  theme(legend.position="none")

sec60_plot

# what pc arrests under sec 60 - what pc arrests under normal powers


# NO THIS DOESNT WORK YET XXX
pc_arrest_plot <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(date = ymd(date)) %>%
  filter(date >= "2017-01-06",
         date <= "2022-02-04") %>%
  mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                             !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
  mutate(count = 1) %>%
  group_by(date, outcome) %>%
  summarise(count = sum(count)) %>%
  left_join(sec60_data %>%
              filter(grepl("Birmingham", NPU)) %>%
              select(`Stop Date`) %>%
              distinct() %>%
              rename(date = `Stop Date`) %>%
              mutate(date = ymd(date)) %>%
              arrange(date) %>%
              mutate(sec_60 = "Yes")) %>%
  mutate(sec_60 = ifelse(is.na(sec_60), "No", sec_60)) %>%
  ggplot() +
  geom_bar(aes(x = decimal_date(date), y = count, fill = interaction(sec_60, fct_rev(outcome))),
           stat = "identity", position = "fill") +
  theme_classic() +
  scale_fill_manual(values=c("grey", "black", "red", "red")) +
  scale_x_continuous(limits = c(2017, 2022.15), expand = c(0, 0)) +
  scale_y_continuous(limits = c(0,1), expand = c(0, 0)) +
  theme(legend.position="none")

pc_arrest_plot


# sec60_plot2 <- stop_search_1214to0322_reason_outcome_gen_ward %>%
#   st_drop_geometry() %>%
#   mutate(date = ymd(date)) %>%
#   filter(date >= "2017-01-06",
#          date <= "2022-02-04") %>%
#   mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
#                              !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
#   mutate(count = 1) %>%
#   group_by(date, outcome) %>%
#   summarise(count = sum(count)) %>%
#   left_join(sec60_data %>%
#               filter(grepl("Birmingham", NPU)) %>%
#               select(`Stop Date`) %>%
#               distinct() %>%
#               rename(date = `Stop Date`) %>%
#               mutate(date = ymd(date)) %>%
#               arrange(date) %>%
#               mutate(sec_60 = "Yes")) %>%
#   mutate(sec_60 = ifelse(is.na(sec_60), "No", sec_60)) %>%
#   # mutate(date = ymd(date),
#   #        month = format_ISO8601(date, precision = "ym")) %>%
#   group_by(outcome, sec_60) %>%
#   summarise(count = sum(count))

  # ggplot(sec60_plot2, aes(fill = interaction(outcome, sec_60), values = count)) +
  # geom_waffle(colour="LightBlue1", size = .25, n_rows=5, flip = TRUE, na.rm = TRUE) +
  # facet_wrap(~month, nrow=1, strip.position = "bottom") +
  # # scale_x_discrete() +
  # # scale_y_continuous(labels = function(x) x * 5,
  # #                    expand = c(0,0)) +
  # scale_fill_manual(values=c("forestgreen", "tan4", "white", "blue"), name="")+
  # coord_equal() +
  # theme_minimal()
  #
  # ggplot(sec60_plot2, aes(fill = outcome, values = count)) +
  # geom_waffle(size = .05, n_rows = 30, flip = T, na.rm = F) +
  #   facet_wrap(~sec_60, nrow=1, strip.position = "bottom")+
  #   scale_x_discrete() +
  #   scale_y_continuous(labels = function(x) x * 30,
  #                       expand = c(0,0)) +
  #   scale_fill_manual(values=c("red", "pink"), name="")
  #
  #



  # ggplot() +
#   geom_bar(aes(x = month, y = count, fill = interaction(sec_60, fct_rev(outcome))),
#            stat = "identity", position = "stack") +
#   theme_classic() +
#   scale_fill_manual(values=c("grey", "black", "red", "red")) +
#   scale_x_continuous(limits = c(2017, 2022.15), expand = c(0, 0)) +
#   scale_y_continuous(limits = c(0,65), expand = c(0, 0)) +
#   theme(legend.position="none")
#
# sec60_plot







wards10 <- stop_search_arrest %>%
  group_by(ward) %>%
  summarise(count = sum(count)) %>%
  arrange(-count) %>%
  mutate(rank = row_number())


ward_rank_graph <- wards10 %>%
  ggplot() +
  geom_bar(aes(x = reorder(ward, rank), y = count),
           stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ward_rank_graph

ladywood <- stop_search_arrest %>%
  group_by(t, ward, outcome) %>%
  summarise(count = sum(count)) %>%
  filter(ward == "Ladywood") %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = outcome, color = outcome))
  # facet_grid(~outcome)
ladywood
# ok so the massive spikes are sec 60s probably

# ggsave(filename = "Output/Graphs/ss_agepc_girls_wm_18to21.png", ss_agepc_girls_wm_18to21)



######------######------######------######------######------######------######------
######------trying to make maps----------------------############
######------######------######------######------######------######------######------


ss_map <- stop_search_1214to0322_reason_outcome_gen_ward %>%
st_drop_geometry() %>%
  arrange(date) %>%
  mutate(date = ymd(date),
         year = format_ISO8601(date, precision = "y"),
         year_day = yday(date) - 1) %>%
  mutate(t = (as.numeric(year)-2010)*52 + floor(year_day/7)) %>%
  mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                             !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
  mutate(count = 1) %>%
  group_by(t, ward, lsoa, outcome) %>%
  summarise(count = sum(count)) %>%
  left_join(lsoa_shape %>%
              select(LSOA21NM, geometry) %>%
              rename(lsoa = LSOA21NM)) %>%
  ungroup()

ss1_map <- ss_map %>%
st_as_sf() %>%
  group_by(ward) %>%
  summarise(count = sum(count)) %>%
  select(count, geometry)

ggplot(data = ss1_map, aes(fill = count, geometry = geometry))+
  geom_sf(colour = NA)





  ss_map <- stop_search_1214to0322_reason_outcome_gen_ward %>%
    st_drop_geometry() %>%
    arrange(date) %>%
    mutate(date = ymd(date),
           year = format_ISO8601(date, precision = "y"),
           year_day = yday(date) - 1) %>%
    mutate(t = (as.numeric(year)-2010)*52 + floor(year_day/7)) %>%
    mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                               !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
    mutate(count = 1) %>%
    group_by(t, ward, lsoa, outcome) %>%
    summarise(count = sum(count)) %>%
    left_join(w_shape %>%
                select(WD22NM, geometry) %>%
                rename(ward = WD22NM)) %>%
    ungroup()

  # something weird is going on with the wards
  ss_map <- ss_map %>%
    st_as_sf() %>%
    filter(grepl("Birmingham", lsoa)) %>%
    group_by(ward) %>%
    summarise(count = sum(count))


  ggplot(data = ss_map, aes(fill = count, geometry = geometry))+
    geom_sf()

  # +

  theme_classic()+
    theme(plot.title=element_text(face="bold", size=rel(1.2)),
          axis.line=element_blank(), axis.ticks=element_blank(), axis.text=element_blank(),
          axis.title=element_blank(), strip.background=element_blank(),
          strip.text=element_text(face="bold"))+
    labs(title="Healthy Life Expectancy varies hugely across the UK",
         subtitle="Average years of life lived in 'good' or 'very good' health in UK Local Authorities",
         caption="Data from ONS | Plot by @VictimOfMaths")
######------######------######------######------######------######------######------
######------OLD - BEFORE I FOUND OTHER DATA SOURCE----------------------############
######------######------######------######------######------######------######------



reason_wm <- ss22_data %>%
  filter(level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = reason_for_search),
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
reason_wm
ggsave(filename = "Output/Graphs/ss_reason_wm.png", reason_wm)


reason_wm_nofurther <- ss22_data %>%
  filter(level != "Eng/Wales", outcome == "No Further Action") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = reason_for_search),
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
reason_wm_nofurther






outcome_wm <- ss22_data %>%
  filter(level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = outcome),
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
outcome_wm
ggsave(filename = "Output/Graphs/ss_outcome_wm.png", outcome_wm)

# looks like the west miods just did more searches for fun - all the gain accrues to the no further action



link_wm <- ss22_data %>%
  filter(level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = link),
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
link_wm
ggsave(filename = "Output/Graphs/ss_link_wm.png", link_wm)



eth_wm <- ss22_data %>%
  filter(level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = self_defined_ethnicity_group),
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
eth_wm
ggsave(filename = "Output/Graphs/ss_eth_wm.png", eth_wm)




drugs_wm <- ss22_data %>%
  filter(level != "Eng/Wales", reason_for_search == "Drugs") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = outcome),
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
drugs_wm

drug_seizures <- ss22_data %>%
  filter(reason_for_search == "Drugs" &
           outcome == "Seizure of Property" &
           link == "Linked") %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
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
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
drug_seizures
# what the fuck??? west mids police is..... half the country in this???
ggsave(filename = "Output/Graphs/ss_drug_seizures.png", drug_seizures)


drug_arrests <- ss22_data %>%
  filter(reason_for_search == "Drugs" &
           outcome == "Arrest" &
           link == "Linked") %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = level),
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
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)
drug_arrests




lay_out <- rbind(c(1,2))

drug_arrests_seizures <- grid.arrange(drug_arrests, drug_seizures,
                                    layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/drug_arrests_seizures_ss.png", drug_arrests_seizures)







drug_sands_wmp <- ss22_data %>%
  filter(reason_for_search == "Drugs",
         level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = self_defined_ethnicity_group),
           stat = "identity", position = "stack") +
  facet_wrap(~sex) +
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
drug_sands_wmp



drug_seizures_wmp <- ss22_data %>%
  filter(reason_for_search == "Drugs" &
           outcome == "Seizure of Property" &
           link == "Linked",
         level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = self_defined_ethnicity_group),
           stat = "identity", position = "stack") +
  facet_wrap(~sex) +
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
drug_seizures_wmp


drug_arrests_wmp <- ss22_data %>%
  filter(reason_for_search == "Drugs" &
           outcome == "Arrest",
         level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = link),
           stat = "identity", position = "stack") +
  facet_wrap(~self_defined_ethnicity_group) +
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
drug_arrests_wmp









weapon_sands_wmp <- ss22_data %>%
  filter(reason_for_search == "Offensive Weapons",
         level == "West Midlands (police)",
         sex != "Unknown") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = self_defined_ethnicity_group),
           stat = "identity", position = "stack") +
  facet_wrap(~sex) +
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
weapon_sands_wmp



weapon_arrests_wmp <- ss22_data %>%
  filter(reason_for_search == "Offensive Weapons" &
           outcome == "Arrest",
         level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = link),
           stat = "identity", position = "stack") +
  facet_wrap(~self_defined_ethnicity_group) +
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
weapon_arrests_wmp


arrests_link_wmp <- ss22_data %>%
  filter(outcome == "Arrest",
         level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = link),
           stat = "identity", position = "stack") +
  # facet_wrap(~self_defined_ethnicity_group) +
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
arrests_link_wmp


arrests_reason_wmp <- ss22_data %>%
  filter(outcome == "Arrest",
         level == "West Midlands (police)") %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = count, fill = reason_for_search),
           stat = "identity", position = "stack") +
  facet_wrap(~link) +
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
arrests_reason_wmp


summary_arrest <- ss_summary %>%
  filter(sex %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_arrest, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(sex)) +
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

summary_arrest


summary_drug_arrest <- ss_summary %>%
  filter(sex %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_drug_arrest, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(sex)) +
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

summary_drug_arrest


summary_drug_seizure <- ss_summary %>%
  filter(sex %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_drug_seizure, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(sex)) +
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

summary_drug_seizure


summary_weapon_arrest <- ss_summary %>%
  filter(sex %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_weapon_arrest, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(sex)) +
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

summary_weapon_arrest


summary_weapon_seizure <- ss_summary %>%
  filter(sex %in% c("Male", "Female")) %>%
  mutate(level = factor(level,
                        levels = c("Eng/Wales", "West Midlands (region)", "West Midlands (police)"))) %>%
  ggplot() +
  geom_bar(aes(x = as.numeric(year), y = pc_weapon_seizure, fill = level),
           stat = "identity", position = "dodge") +
  facet_wrap(~fct_rev(sex)) +
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

summary_weapon_seizure






lay_out <- rbind(c(1),
                 c(2),
                 c(3),
                 c(4),
                 c(5))

ss_summary_groups <- grid.arrange(summary_arrest, summary_drug_arrest, summary_drug_seizure,
                                  summary_weapon_arrest, summary_weapon_seizure,
                                      layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/ss_summary_groups.png", ss_summary_groups)

