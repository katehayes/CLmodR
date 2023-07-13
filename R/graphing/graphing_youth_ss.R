load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_1214to0322.Rdata")

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

ss_age_birm_18to21 <- ss_age %>%
  mutate(Year = as.numeric(Year),
         age = factor(age,
                      levels = c("7", "8", "10", "11", "12", "13", "14", "15", "16", "17"))) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = count, fill = age),
           stat = "identity", position = "dodge") +
  facet_grid(~`Neighbourhood Policing Unit`) +
  theme(plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.15,
                     end = 0.9)

ss_age_birm_18to21

ggsave(filename = "Output/Graphs/ss_age_birm_18to21.png", ss_age_birm_18to21)


ss_agepc_birm_18to21 <- ss_age %>%
  mutate(Year = as.numeric(Year),
         age = factor(age,
                      levels = c("7", "8", "10", "11", "12", "13", "14", "15", "16", "17"))) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = count, fill = age),
           stat = "identity", position = "fill") +
  facet_grid(~`Neighbourhood Policing Unit`) +
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

