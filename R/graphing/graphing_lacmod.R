
mod_states <- LAC_data %>%
  select(c(starts_with("ILAC"), starts_with("ELAC"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boys", "Girls")) %>% 
  mutate(lac = ifelse(grepl("nev", state), "Never", NA),
         lac = ifelse(grepl("nres", state), "Not residential", lac),
         lac = ifelse(grepl("Cres", state), "Residential", lac),
         lac = ifelse(grepl("prior", state), "Prior", lac)) %>% 
  mutate(state = ifelse(grepl("ILAC", state), "Included", "Excluded")) %>% 
  group_by(t, gender, age)

mod_states_scenario <- LAC_data_scenario %>%
  select(c(starts_with("ILAC"), starts_with("ELAC"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boys", "Girls")) %>% 
  mutate(lac = ifelse(grepl("nev", state), "Never", NA),
         lac = ifelse(grepl("nres", state), "Not residential", lac),
         lac = ifelse(grepl("Cres", state), "Residential", lac),
         lac = ifelse(grepl("prior", state), "Prior", lac)) %>% 
  mutate(state = ifelse(grepl("ILAC", state), "Included", "Excluded")) %>% 
  group_by(t, gender, age)


mod_params <- LAC_data %>%
  select(-c(starts_with("LAC"))) %>% 
  pivot_longer(-t,
               names_to = "param",
               values_to = "value") %>% 
  filter(grepl("\\[", param)) %>% 
  mutate(gender = if_else(grepl("\\[1\\]", param), "Boys", "Girls")) %>% 
  bind_rows(LAC_data %>%
              select(-c(starts_with("LAC"))) %>% 
              pivot_longer(-t,
                           names_to = "param",
                           values_to = "value") %>% 
              filter(!grepl("\\[", param)) %>%
              mutate(gender = "Boys")) %>% 
  bind_rows(LAC_data %>%
              select(-c(starts_with("LAC"))) %>% 
              pivot_longer(-t,
                           names_to = "param",
                           values_to = "value") %>% 
              filter(!grepl("\\[", param)) %>%
              mutate(gender = "Girls")) %>% 
  mutate(param = str_remove_all(param, "\\[1\\]")) %>% 
  mutate(param = str_remove_all(param, "\\[2\\]")) %>% 
  arrange(t) %>% 
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         age = ifelse(is.na(age), "constant", age),
         param = str_remove_all(param, "(\\d{2})")) %>% 
  pivot_wider(names_from = age,
              values_from = value) %>% 
  mutate(across(starts_with("1"), ~ifelse(is.na(.x), constant, .x))) %>% 
  select(-constant) %>% 
  pivot_longer(starts_with("1"),
               names_to = "age",
               values_to = "value") %>% 
  pivot_wider(names_from = param,
              values_from = value) %>% 
  mutate(age = as.numeric(age))


# AT SOME POINT COUNT THE PEOPLE AGING OUT OF CARE AGE 17
mod_flows <- mod_states %>% 
  pivot_wider(names_from = lac,
              values_from = count) %>% 
  full_join(mod_params) %>% 
  mutate(NP2NRES = nev2nres*Never,
         NP2RES = nev2res*Never,
         NP2LAC = NP2NRES + NP2RES,
         
         NRES2NRES = nr2nr*end_nr*`Not residential`,
         NRES2RES = nr2res*end_nr*`Not residential`,
         NRES2PRIOR = nr2exit*end_nr*`Not residential`,
         
         RES2NRES = res2nr*end_res*Residential,
         RES2RES = res2res*end_res*Residential,
         RES2PRIOR = res2exit*end_res*Residential,
         
         PRIOR2NRES = pri2nres*Prior,
         PRIOR2RES = pri2res*Prior,
         
         NRESinflow = NP2NRES + NRES2NRES + RES2NRES + PRIOR2NRES,
         RESinflow = NP2RES + NRES2RES + RES2RES + PRIOR2RES,
         LACoutflow = NRES2PRIOR + RES2PRIOR) %>% 
  mutate(check_resnp = NP2RES/RESinflow,
         check_res2res = RES2RES/RESinflow,
         check_prior2res = PRIOR2RES/RESinflow,
         check_res2exit = RES2PRIOR/RESinflow, #not clear that this is the right check
         check_pcpriors = (NP2NRES + NP2RES) /(NRES2NRES + NRES2RES + RES2NRES + RES2RES + PRIOR2NRES + PRIOR2RES))









compare <- care %>% 
  mutate(t = (end_period_year - 2010)*52) %>% 
  select(t, gender, residential, count) %>% 
  rename(measure = count) %>% 
  full_join(mod_states %>% 
              ungroup() %>% 
              filter(lac %in% c("Residential", "Not residential")) %>% 
              group_by(t, gender, lac) %>% 
              summarise(model = sum(count)) %>% 
              rename(residential = lac)) %>% 
  filter(!is.na(measure),
         !is.na(model)) %>% 
  arrange(t) %>% 
  pivot_longer(c(measure, model),
               names_to = "compare",
               values_to = "count")

compare %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color = compare)) +
  facet_grid(~interaction(gender, residential))
# WAY TOO MANY GOING INTO NOT RESIDENTIAL
# currently over nonresidential under residential



check <- mod_states %>% 
  pivot_wider(names_from = lac,
              values_from = count)



# 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_resnp, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)
# so this is almost exactly wrong - 10 year olds are at 20% and 16/17 year olds at 10%
# need to make age-varying parameters to solve this
# update - no longer is the above true ...



# 15% going to res come direct from other care homes - 3% come at the expiry of a secure order
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_res2res, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)
# WHAT IS THE FUCKING DEAL WITH THE BURN IN PERIOD/INITIAL CONDITION EFFECT!!
# big initial condition problem with age 10, why? - THIS ONE FIXED NOW THE ISSUE IS WITH OTHERS 

# PROPORTIONS OF 16 AND 17 STARTING OFF ARE WAY OFF

# 3% going to res come from an adoption breakdown, lets say 6 for 10 year olds though plus 6% from family breakdown
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_prior2res, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)
# FAR TOO MANY COMING FROM PRIOR!!!!!!!!!!!!
# the above still true - gets worse as the model goes on!!!!!!!!!!!!!!!!!!
# may need to undo that incidence reduction you did 
# & then try somehow to just stop so many people coming out of prior?
# just scale down prior??

# From the whole residential care sample, 12% returned home to live with someone with parental responsibility after their first residential care placement
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_res2exit, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)
# this is probably too high
# MORE INSANE BURN IN - esp for number 10

# 50% of placements finishing for 10-17 year olds are their first ever placement
# (so basically there should always be approx equal numbers comeing into the wo lac states from either non-lac side?)
# So the number should be around 1
# more 10 year old burn in
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_pcpriors, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)


# full_join(care_ic)
# AGE OF ENTERING CARE - distribution
mod_flows %>% 
  ggplot() +
  geom_bar(aes(x = t, y = NP2LAC, fill = as.character(age)),
           stat = "identity", position = "fill") +
  facet_grid(~gender)






# states
compare <- mod_states %>%
  group_by(t, gender, age, lac) %>% 
  summarise(count = sum(count)) %>% 
  mutate(compare = "Model") %>% 
  bind_rows(care_ic %>% 
              mutate(t = (end_period_year - 2010)*52) %>% 
              select(t, gender, age, never, nres, res, prior) %>% 
              pivot_longer(c(never, nres, res, prior),
                           names_to = "lac",
                           values_to = "count") %>% 
              mutate(lac = case_when(lac == "never" ~ "Never",
                                     lac == "nres" ~ "Not residential",
                                     lac == "res" ~ "Residential",
                                     lac == "prior" ~ "Prior")) %>% 
              mutate(compare = "Est data"))


compare %>% 
  filter(lac %in% c("Residential", "Not residential")) %>% 
  group_by(t, compare) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color = compare))
  
compare %>% 
  filter(lac == "Prior") %>% 
  ggplot() +
    geom_line(aes(x = t, y = count, group = compare, color = compare)) +
    facet_grid(~interaction(gender, age))

compare %>% 
  filter(lac == "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color = compare)) +
  facet_grid(~interaction(gender, age))
# boys and girls age 10 and 11 have way too much never....


compare %>% 
  filter(lac == "Not residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color = compare)) +
  facet_grid(~interaction(gender, age))
# THE PROBLEM WITH RESIDENTIAL IS ONLY WITH SIXTEEN AND SEVENTEEN YEAR OLDS!!
# TOO MANY OF THEM!! THE OTHERS ARE FINE!!!!!
# (when i scaled down incidence by 30% to 70% then the sixteen and seventeen were looking much better lol)


compare %>% 
  filter(lac == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color = compare)) +
  facet_grid(~interaction(gender, age))
# WAY OVERCOUNTING 17, UNDERCOUNTING EVERYTHING ELSE
# WHAT THE FUCK IS THE TEN INITAL CONDITION SO HIGH - FIXED


# below here 

mod_states %>% 
  group_by(t, gender, age) %>% 
  mutate(tot = sum(count)) %>% 
  mutate(pc = count/tot) %>% 
  filter(gender == "Boys",
         lac != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~lac)


mod_states %>% 
  group_by(t, gender, age) %>% 
  mutate(tot = sum(count)) %>% 
  mutate(pc = count/tot) %>% 
  filter(gender == "Girls",
         lac != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~lac)


# more obvious burn ins
# MAINLY FROM 15/16
mod_states %>% 
  group_by(t, gender, age) %>% 
  mutate(tot = sum(count)) %>% 
  mutate(pc = count/tot) %>% 
  filter(lac == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)


load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")
# compare_pop2 <- population %>%
#   filter(end_period_year >= 2010) %>%
#   mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
#   select(t, age, gender, count) %>%
#   mutate(compare = "Data") %>%
#   bind_rows(mod_states %>%
#               group_by(t, age, gender) %>% 
#               summarise(count = sum(count)) %>% 
#               mutate(compare = "Model output"))

compare_pop <- population %>%
  filter(end_period_year >= 2010) %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, age, gender, count) %>%
  mutate(compare = "Data") %>%
  bind_rows(mod_states %>%
              group_by(t, age, gender) %>% 
              summarise(count = sum(count)) %>% 
              mutate(compare = "Model output"))




compare_pop %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = interaction(gender, compare), color = interaction(gender, compare))) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020")) +
  scale_color_manual(values=c("skyblue","pink","navy", "red"))


mod_states %>% 
  group_by(t, gender, age, state) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = state, color = state)) +
  facet_wrap(~interaction(gender, age))

# looks like the move from pov to not is working more or less!!!
mod_states %>% 
  group_by(t, state) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count / sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = state, color = state))

mod_states_scenario %>% 
  group_by(t, state) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t) %>% 
  mutate(pc = count / sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = state, color = state))


mod_states %>% 
  group_by(t, state, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(lac == "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_wrap(~interaction(gender, state))


mod_states %>% 
  group_by(t, state, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(lac == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(gender, state))  +
  scale_colour_viridis(discrete=T,
                       direction = -1)

mod_states %>% 
  group_by(t, state, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(lac == "Not residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(gender, state)) +
  scale_colour_viridis(discrete=T,
                       direction = -1)

mod_states %>% 
  group_by(t, state, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(lac == "Prior") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(gender, state)) +
  scale_colour_viridis(discrete=T,
                       direction = -1)

  library(viridis)

\# ACTUALLY YOU NEED TO GET THE POPULATION LOOKING WAY WAY BETTER