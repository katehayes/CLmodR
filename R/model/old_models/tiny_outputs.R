# tiny model outputs

# questions --
# what staying value and entry rate for those in the prior state can balance things
# when more comes from prior, the age naturally goes up
# can the rising age alone reproduce the correct res v non-res split

# 
# we can change: 
#   stays (change across time?) maybe yes, because of the decoupling at the end
#   r's (change across time?) -- change between first entry and subsequent?
#   c4c (change across time? - or let vary by age?

# i think res needs to get bigger over time

# 1. LOOK AT DISTRIBUTION OF FLOWS INTO RESCARE 
# 1.1compare first entry to res care with re-entry - compare flows in - look at first entry relative to re-entry
# Of the Ofsted residential care sample, 10\% of 10-13 year olds and 20\% of 14-16 year olds had no prior experience of care \cite{ofsted_why_2022}.
# In 2015 data, 25\% of children in residential care placements were on their first care episode
# 1.2 40% come straight from foster care breakdown.

# 2. of the first entries, what percentage goes to res-care vs nonres
# About 63\% of first entrants to care are given foster placements \cite{office_for_national_statistics_who_2022}. 
# 63 of first time are foster, so even more should be Non-res. but that is all children, not just over 10. so that means less. 

# 3. Age distribution in residential care 
# 75\% are between 14 and 17 years old,

# 4. What percentage of placements ended resulted in an exit

# 5. what percentage of the care system are in poverty


mod_states <- mod_data %>%
  select(c(starts_with("P1"), starts_with("P2"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "Not in poverty", "In poverty"),
         care = ifelse(grepl("C1", state), "Never", NA),
         care = ifelse(grepl("C2", state), "Not residential", care),
         care = ifelse(grepl("C3", state), "Residential", care),
         care = ifelse(grepl("C4", state), "Prior", care)) %>% 
  select(-state)

first_entry_params <- mod_data %>%
  select(c(starts_with("c1c1"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c1c") %>% 
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})"))) %>% 
  select(-param)


mod_states %>% 
  filter(care == "Residential") %>% 
  group_by(t, age) %>% 
  summarise(count = sum(count)) %>% 
  filter((t %% 52) == 0) %>% 
  ggplot() +
  geom_bar(aes(x = t, y = count, fill = age),
           stat = "identity", position = "dodge2")


mod_states %>% 
  group_by(t, age, care) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(care != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = care, color = care)) +
  facet_grid(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


poverty <- mod_states %>% 
  filter(care %in% c("Residential", "Non-residential")) %>% 
  group_by(t, poverty) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = poverty, color = poverty)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


poverty


re_entry_params <- mod_data %>%
  select(c(starts_with("c4c1"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "c4c") %>% 
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})"))) %>% 
  select(-param)



care_entry_flow <- mod_data %>%
  select(c(starts_with("from_"), t)) %>% 
  pivot_longer(-t, names_to = "care_entry", values_to = "flow") %>% 
  mutate(age = as.character(str_extract_all(care_entry, "(\\d{2})"))) %>% 
  mutate(care_entry = ifelse(grepl("care", care_entry), "from care", care_entry),
         care_entry = ifelse(grepl("reentry", care_entry), "from reentry", care_entry),
         care_entry = ifelse(grepl("first", care_entry), "from first entry", care_entry))




care_entry_flow %>% 
  filter(care_entry == "from first entry") %>% 
  ggplot() +
  geom_line(aes(x = t, y = flow, group = age, color = age)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


care_entry_flow %>% 
  filter(care_entry == "from reentry") %>% 
  ggplot() +
  geom_line(aes(x = t, y = flow, group = age, color = age)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

care_entry_flow %>% 
  filter(care_entry == "from care") %>% 
  ggplot() +
  geom_line(aes(x = t, y = flow, group = age, color = age)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


rem_params <- mod_data %>%
  select(c(starts_with("r"), t)) %>% 
  pivot_longer(-t, names_to = "rem", values_to = "value") %>% 
  mutate(age = as.character(str_extract_all(rem, "(\\d{2})"))) %>% 
  mutate(rem = ifelse(grepl("_e_", rem), "res first entry", "res reentry")) %>% 
  pivot_wider(names_from = rem, values_from = value)


res_v_nonres_care <- mod_states %>% 
  filter(care == "Residential") %>% 
  mutate(age = as.character(age)) %>% 
  group_by(t, age) %>% 
  summarise(count = sum(count)) %>% 
  left_join(care_entry_flow %>% 
              pivot_wider(names_from = care_entry,
                          values_from = flow)) %>% 
  left_join(rem_params) %>% 
  mutate(first2res = `from first entry`*`res first entry`,
         care2res = `from care`*`res reentry`,
         reent2res = `from reentry`*`res reentry`) %>% 
  mutate(first2nr = `from first entry`*(1-`res first entry`),
       care2nr = `from care`*(1-`res reentry`),
       reent2nr = `from reentry`*(1-`res reentry`)) 
  

res_v_nonres_care %>% 
  ggplot() +
  geom_line(aes(x = t, y = first2res/(first2res+care2res+reent2res)), color = "red") +
  geom_line(aes(x = t, y = care2res/(first2res+care2res+reent2res)), color = "blue") +
  geom_line(aes(x = t, y = reent2res/(first2res+care2res+reent2res)), color = "black") +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


res_v_nonres_care %>% 
  group_by(t) %>% 
  summarise(first2res = sum(first2res),
            care2res = sum(care2res),
            reent2res = sum(reent2res)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = first2res/(first2res+care2res+reent2res)), color = "red") +
  geom_line(aes(x = t, y = care2res/(first2res+care2res+reent2res)), color = "blue") +
  geom_line(aes(x = t, y = reent2res/(first2res+care2res+reent2res)), color = "black") +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

res_v_nonres_care %>% 
  filter(age != "17") %>% 
  mutate(age2 = ifelse(age <= 13, "10-13", "14-16")) %>% 
  group_by(t, age2) %>% 
  summarise(first2res = sum(first2res),
            care2res = sum(care2res),
            reent2res = sum(reent2res)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = first2res/(first2res+care2res+reent2res)), color = "red") +
  geom_line(aes(x = t, y = care2res/(first2res+care2res+reent2res)), color = "blue") +
  geom_line(aes(x = t, y = reent2res/(first2res+care2res+reent2res)), color = "black") +
    facet_grid(~age2) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

res_v_nonres_care %>% 
  ggplot() +
  geom_line(aes(x = t, y = first2res/(first2res+first2nr)), color = "red") +
  geom_line(aes(x = t, y = first2nr/(first2res+first2nr)), color = "blue") +
  facet_grid(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))



res_v_nonres_care %>% 
  group_by(t) %>% 
  summarise(first2res = sum(first2res),
            first2nr = sum(first2nr)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = first2res/(first2res+first2nr)), color = "red") +
  geom_line(aes(x = t, y = first2nr/(first2res+first2nr)), color = "blue") +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


re_entry <- mod_states %>% 
  filter(care == "Prior") %>% 
  mutate(age = as.character(age)) %>% 
  group_by(t, age) %>% 
  summarise(count = sum(count)) %>% 
  left_join(care_entry_flow %>% 
              filter(care_entry == "from reentry")) %>% 
  mutate(pc = flow/ count) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
re_entry

care_entry <- mod_states %>% 
  filter(care == "Never") %>% 
  left_join(care_entry_params) %>% 
  filter((t %% 1) == 0) %>%
  mutate(pov_mult = ifelse(poverty == "In poverty", 4, 1)) %>% 
  mutate(entered = count*c1c*pov_mult) %>% 
  group_by(t, age) %>% 
  summarise(entered = sum(entered)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = entered/sum(entered)) %>% 
  ggplot() +
  geom_bar(aes(x = t, y = entered, fill = as.character(age)),
           stat = "identity", position = "stack") +
  # geom_line(aes(x = t, y = pc, group = age, color = age)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

care_entry


care_rates <- mod_states %>%
  group_by(t, care, poverty) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t, poverty) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = poverty, color = poverty)) +
  facet_wrap(~care) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


care_rates

compare_care_age <- mod_states %>%
  rename(age2 = age,
         care2 = care) %>%
  mutate(age = ifelse(age2 %in% c(10:15), "10-15", "16+"),
         care = ifelse(care2 %in% c("Not residential", "Residential"), "in care", "not in care")) %>%
  group_by(t, care, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t, age) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care == "in care") %>%
  mutate(compare = "Model") %>%
  select(t, age, pc, compare)%>%
  bind_rows(care_11to22_age %>%
              ungroup() %>% 
              filter(age %in% c("10-15", "16+"),
                     level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year, age) %>% 
              summarise(count = sum(count)) %>% 
              left_join(gen_pc) %>% 
              mutate(count = count*pc) %>% 
              select(-pc) %>% 
              left_join(population %>% 
                          filter(age %in% c(10:17),
                                 gender == "Boys") %>% 
                          mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
                          group_by(end_period_year, age) %>% 
                          summarise(pop_count = sum(count))) %>% 
              mutate(pc = count/pop_count,
                     compare = "Data",
                     t = (end_period_year - 2010)*52) %>% 
              select(t, age, pc, compare)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = interaction(compare, age), color = interaction(compare, age))) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_care_age

compare_care_age_pc <- mod_states %>%
  filter(care %in% c("Not residential", "Residential")) %>% 
  mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
  group_by(t, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(age == "16+") %>%
  mutate(compare = "Model") %>%
  select(t, pc, compare)%>%
  bind_rows(care_11to22_age %>%
              ungroup() %>% 
              filter(age %in% c("10-15", "16+"),
                     level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year, age) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              left_join(gen_pc) %>% 
              mutate(count = count*pc) %>% 
              select(-pc) %>% 
              group_by(end_period_year) %>% 
              mutate(pc = count/sum(count),
                     compare = "Data",
                     t = (end_period_year - 2010)*52) %>% 
              filter(age == "16+") %>% 
              select(t, pc, compare)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group =compare, color = compare)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_care_age_pc



compare_care_res <- mod_states %>%
  filter(care %in% c("Not residential", "Residential")) %>%
  group_by(t, care) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care == "Residential") %>% 
  mutate(compare = "Model") %>%
  select(t, pc, compare) %>% 
  rbind(care_11to22_placement %>%
          ungroup() %>% 
          filter( level == "Birmingham",
                  end_period_year <= 2020) %>% 
          mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                                       "Residential schools",
                                                       "Other residential settings"),
                                      "Residential",
                                      "Not residential")) %>% 
          group_by(end_period_year, residential) %>% 
          summarise(count = sum(count)) %>% 
          ungroup() %>% 
          group_by(end_period_year) %>% 
          mutate(pc = count/sum(count)) %>%
          ungroup() %>%
          filter(residential == "Residential") %>% 
          mutate(compare = "Data",
                 t = (end_period_year - 2010)*52) %>% 
          select(t, pc, compare)) %>% 
  rbind(care_pov %>%
          ungroup() %>% 
          filter(gender == "Boys",
                 end_period_year <= 2020,
                 care %in% c("Residential",
                             "Not residential")) %>% 
          group_by(end_period_year, care) %>% 
          summarise(count = sum(count)) %>% 
          ungroup() %>% 
          group_by(end_period_year) %>% 
          mutate(pc = count/sum(count)) %>%
          ungroup() %>%
          filter(care == "Residential") %>% 
          mutate(compare = "adjData",
                 t = (end_period_year - 2010)*52) %>% 
          select(t, pc, compare)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = compare, color = compare)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


compare_care_res





cumulative_entry <- mod_states %>%
  rename(care2 = care) %>%
  mutate(care = ifelse(care2 %in% c("Not residential", "Residential", "Prior"), "Care experience", "No experience")) %>%
  group_by(t, care, age, poverty) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t, age, poverty) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care == "Care experience") %>%
  mutate(end_period_year = 2010 + floor(t/52)) %>% 
  filter((t %% 52) == 0) %>% 
  mutate(year_of_birth = end_period_year - age) %>% 
  # add_cohort() %>% 
  filter(poverty == "In poverty") %>% 
  ggplot() +
  geom_bar(aes(x = as.character(year_of_birth), y = pc, fill = as.character(year_of_birth)),
            stat = "identity") +
  facet_grid(~age)

cumulative_entry

cumulative_entry <- mod_states %>%
  filter((t %% 52) == 0) %>% 
  mutate(end_period_year = 2010 + floor(t/52)) %>% 
  mutate(year_of_birth = end_period_year - age) %>% 
  rename(care2 = care) %>%
  mutate(care = ifelse(care2 %in% c("Not residential", "Residential", "Prior"), "Care experience", "No experience")) %>%
  group_by(end_period_year, care, year_of_birth) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, year_of_birth) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care == "Care experience") %>%
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc),
           stat = "identity") +
  facet_grid(~as.character(year_of_birth))

cumulative_entry

# ggplot() +
#   geom_bar(aes(x = age, y = pc, fill = age),
#            stat = "identity") +
#   facet_grid(~as.character(year_of_birth))

