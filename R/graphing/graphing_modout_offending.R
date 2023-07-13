#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#FIRST TIME ENTRANTS#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##


fte_rates <- CL_data %>%
  select(t, starts_with("np2")) %>%
  pivot_longer(-t, names_to = "state", values_to = "rate") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl"),
         state = str_remove(state, "(\\d{2})"),
         state = str_remove(state, "\\[\\d{1}\\]"),
         class = str_remove_all(state,"np2nc_"),
         class = str_remove_all(class,"np2cust_"),
         state = str_remove_all(state,"np2"),
         state = str_remove_all(state,"_i"),
         state = str_remove_all(state,"_e"),
         state = str_remove_all(state,"_c")) %>%
  mutate(class = case_when(class == "i" ~ "Included",
                           class == "e" ~ "Excluded",
                           class == "c" ~ "Close"),
         state = case_when(state == "nc" ~ "Non-custodial",
                           state == "cust" ~ "Custody")) %>%
  pivot_wider(names_from = state, values_from = rate)


fte_output <- mod_states %>%
  filter(cjs_pos %in% c("Surveilled")) %>% # add this in, when you ouput remand parametervalues "Custodial remand (fte)"
  group_by(t, age, gender, class, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cjs_pos, values_from = count) %>%
  left_join(fte_rates) %>%
  mutate(`Non-custodial` = `Non-custodial`*Surveilled,
         `Custody` = `Custody`*Surveilled) %>%
  select(-Surveilled) %>%
  pivot_longer(c(`Non-custodial`,`Custody`),
               names_to = "FTE", values_to = "count") %>%
  pivot_wider(names_from = age, values_from = count) %>%
  mutate(`10-12` = `10` + `11` + `12`) %>%
  select(-c(`10`, `11`, `12`)) %>%
  pivot_longer(c(starts_with("1")),
               names_to = "age", values_to = "count")


fte_av_age <- mod_states %>%
  filter(cjs_pos %in% c("Surveilled")) %>% # add this in, when you ouput remand parametervalues "Custodial remand (fte)"
  group_by(t, age, gender, class, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cjs_pos, values_from = count) %>%
  left_join(fte_rates) %>%
  mutate(`Non-custodial` = `Non-custodial`*Surveilled,
         `Custody` = `Custody`*Surveilled) %>%
  select(-Surveilled) %>%
  pivot_longer(c(`Non-custodial`,`Custody`),
               names_to = "FTE", values_to = "count") %>%
  group_by(t, age, FTE) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  mutate(x = age*count) %>%
  group_by(t, FTE) %>%
  summarise(av_age = sum(x)/sum(count)) %>%
  ggplot() +
  geom_line(aes(x = t, y = av_age, group = FTE, color = FTE)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
fte_av_age
ggsave(filename = "Output/Graphs/Model Output/fte_av_age.png", fte_av_age)


fte_compare_cust <- fte_output %>%
  filter(FTE == "Custody") %>%
  filter(!(t %% 1)) %>%
  mutate(year = 2010 + floor(t/52)) %>%
  group_by(year, gender, FTE, age) %>%
  summarise(count = sum(count)) %>%
  filter(year <= 2019) %>%
  ggplot() +
  geom_line(aes(x = year, y = count, group = age, color = age)) +
  facet_grid(~gender) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
fte_compare_cust

fte_compare_nc <- fte_output %>%
  filter(FTE == "Non-custodial") %>%
  filter(!(t %% 1)) %>%
  mutate(year = 2010 + floor(t/52)) %>%
  group_by(year, gender, FTE, age) %>%
  summarise(count = sum(count)) %>%
  filter(year <= 2019) %>%
  ggplot() +
  geom_line(aes(x = year, y = count, group = age, color = age)) +
  facet_grid(~gender) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
fte_compare_nc

fte_compare <- fte_nc_cust %>%
  rename(dat_count = count) %>%
  left_join(fte_output %>%
              mutate(t = floor(t/52)*52) %>%
              mutate(gender = ifelse(gender == "Girl", "Girls", "Boys")) %>%
              rename(disposal_type = FTE) %>%
              group_by(t, gender, disposal_type) %>%
              summarise(mod_count = sum(count))) %>%
  filter(t != 520) %>%
  pivot_longer(c(mod_count, dat_count),
               names_to = "compare", values_to = "count") %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color = compare)) +
  facet_wrap(~interaction(gender, disposal_type))
theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
fte_compare

# ......NOPE!!!
ggsave(filename = "Output/Graphs/Model Output/fte_compare.png", fte_compare)


check <- fte_output %>%
  mutate(t = floor(t/52)*52) %>%
  group_by(t, gender) %>%
  mutate(gender = ifelse(gender == "Girl", "Girls", "Boys")) %>%
  summarise(mod_count = sum(count))


#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#CUSTODIAL POPULATION#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
cust_breakdown <- mod_states %>%
  filter(cjs_pos %in% c("Custodial remand (fte)", "Custodial remand (rep)", "Custodial sentence")) %>%
  pivot_wider(names_from = cjs_pos, values_from = count) %>%
  mutate(`Custodial remand` = `Custodial remand (fte)` + `Custodial remand (rep)`) %>%
  select(-c(`Custodial remand (fte)`, `Custodial remand (rep)`)) %>%
  pivot_longer(c(`Custodial remand`, `Custodial sentence`),
               names_to = "cjs_pos", values_to = "count")

custodial_pop <- cust_breakdown %>%
  group_by(t, gender) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = gender, color = gender)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

custodial_pop





cust_prop_gender <- cust_breakdown %>%
  group_by(t, gender, class) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = gender, values_from = count) %>%
  mutate(prop_girl = Girl/(Boy+Girl)) %>%
  ggplot() +
  geom_line(aes(x = t, y = prop_girl, group = class, color = class)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
cust_prop_gender # wrong!! try for 3%
ggsave(filename = "Output/Graphs/Model Output/cust_prop_gender.png", cust_prop_gender)

cust_prop_age <- cust_breakdown %>%
  group_by(t, age, class) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = age, values_from = count) %>%
  mutate(`10-14` = `10` + `11` + `12` + `13` + `14`) %>%
  select(-c(`10`, `11`, `12`, `13`, `14`)) %>%
  pivot_longer(-c(t, class),
               names_to = "age", values_to = "count") %>%
  group_by(t, class) %>%
  mutate(pc = count/sum(count)) %>%
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~class) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
cust_prop_age # in no way correct!!
# should be 3,11,25,61
ggsave(filename = "Output/Graphs/Model Output/cust_prop_age.png", cust_prop_age)


#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#REMAND#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##

prop_remand <- cust_breakdown %>%
  group_by(t, age, gender, class, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cjs_pos, values_from = count) %>%
  mutate(prop_on_remand = `Custodial remand`/(`Custodial remand` + `Custodial sentence`)) %>%
  ggplot() +
  geom_line(aes(x = t, y = prop_on_remand, group = interaction(gender, class), color = interaction(gender, class))) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
prop_remand

#  lower remand for younger years, its to much atm
ggsave(filename = "Output/Graphs/Model Output/prop_remand.png", prop_remand)


#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##
#-----# #-----#CUSTODIAL SENTENCE#-----##-----##-----##-----##-----##-----##-----#
#-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##-----##









# number of custodial sentences, both recieved by first times, and by repeat
# will need parameters and size, as above



