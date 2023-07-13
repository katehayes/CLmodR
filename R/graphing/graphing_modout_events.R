load("/Users/katehayes/CLmodelR/Output/Data/Output/CL_data.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Output/mod_states.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_1214to0322_reason_outcome_gen_ward.Rdata")

#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#MISSING#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##

miss_rates <- CL_data %>%
  select(t, starts_with("missing_")) %>%
  pivot_longer(-t, names_to = "state", values_to = "rate") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{4})")),
         gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl"),
         care = if_else(grepl("rc", state), "Residential Care", "Other"),
         class = if_else(care == "Residential Care", "Close", "Included")) %>%
  select(-state) %>%
  pivot_wider(names_from = class, values_from = rate) %>%
  mutate(Excluded = Included) %>%
  pivot_longer(c("Included", "Excluded", "Close"),
               names_to = "class", values_to = "rate") %>%
  filter(!is.na(rate)) %>%
  pivot_wider(names_from = age, values_from = rate) %>%
  mutate(`10` = `1014`,
         `11` = `1014`,
         `12` = `1014`,
         `13` = `1014`,
         `14` = `1014`,
         `15` = `1517`,
         `16` = `1517`,
         `17` = `1517`) %>%
  select(-c(`1014`, `1517`)) %>%
  pivot_longer(c(starts_with("1")),
               names_to = "age", values_to = "rate") %>%
  mutate(age = as.numeric(age))


miss_output <- mod_states %>%
  filter(cjs_pos %in% c("No contact", "Surveilled", "Non-custodial")) %>%
  group_by(t, age, gender, class) %>%
  summarise(count = sum(count)) %>%
  left_join(miss_rates) %>%
  filter(!(t %% 1)) %>%
  mutate(miss_weekly = count*rate)


miss_compare <- miss_output %>%
  group_by(t) %>%
  summarise(miss_weekly = sum(miss_weekly)) %>%
  ungroup() %>%
  filter(t <= 520) %>%
  ggplot() +
  geom_line(aes(x = t, y = miss_weekly)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

miss_compare
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#STOP AND SEARCH#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##

ss_rates <- CL_data %>%
  select(t, starts_with("s_s_")) %>%
  pivot_longer(-t, names_to = "state", values_to = "rate") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl"),
         state = str_remove(state, "(\\d{2})"),
         state = str_remove(state, "\\[\\d{1}\\]"),
         class = str_remove_all(state,"s_s_")) %>%
  select(-state) %>%
  mutate(class = case_when(class == "i" ~ "Included",
                           class == "ec" ~ "Excluded")) %>%
  pivot_wider(names_from = class, values_from = rate) %>%
  mutate(Close = Excluded) %>%
  pivot_longer(c("Included", "Excluded", "Close"),
               names_to = "class", values_to = "rate")


ss_output <- mod_states %>%
  filter(cjs_pos %in% c("No contact", "Surveilled", "Non-custodial")) %>%
  group_by(t, age, gender, class) %>%
  summarise(count = sum(count)) %>%
  left_join(ss_rates) %>%
  filter(!(t %% 1)) %>%
  mutate(ss_weekly = count*rate)


ss_data <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(date = ymd(date),
         year = format_ISO8601(date, precision = "y"),
         year_day = yday(date) - 1) %>%
  mutate(t = (as.numeric(year)-2010)*52 + floor(year_day/7)) %>%
  mutate(count = 1) %>%
  group_by(t) %>%
  summarise(ss_weekly = sum(count)) %>%
  ungroup() %>%
  filter(t <= 520) %>%
  mutate(compare = "Input data")


ss_compare <- ss_output %>%
  group_by(t) %>%
  summarise(ss_weekly = sum(ss_weekly)) %>%
  mutate(compare = "Model output") %>%
  bind_rows(ss_data) %>%
  # pivot_wider(names_from = compare, values_from = ss_weekly) %>%
  # mutate(diff = `Model output`/`Input data`) - about 13 rising to 15pc too high - because of the lazy division
  ggplot() +
  geom_line(aes(x = t, y = ss_weekly, group = compare, color = compare)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ss_compare

# its tracing it so exactly because there's no movement between class states
# ggsave(filename = "Output/Graphs/Model Output/ss_compare.png", ss_compare)



#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#ARRESTS#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##


#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#INJURIES#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##

#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#PRISON EVENTS#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
