load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")
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

# ACTUALLY YOU NEED TO GET THE POPULATION LOOKING WAY WAY BETTER



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




# AT SOME POINT COUNT THE PEOPLE AGING OUT OF CARE AGE 17
mod_flows <- mod_states %>% 
  pivot_wider(names_from = lac,
              values_from = count) %>% 
  full_join(mod_params) %>% 
  mutate(NP2NRES = nev2nres*Never,
         NP2RES = nev2res*Never,
         
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



# 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_resnp, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)
# so this is almost exactly wrong - 10 year olds are at 20% and 16/17 year olds at 10%
# need to make age-varying parameters to solve this


# 15% going to res come direct from other care homes - 3% come at the expiry of a secure order
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_res2res, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)


# 3% going to res come from an adoption breakdown, lets say 6 for 10 year olds though plus 6% from family breakdown
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_prior2res, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)


# From the whole residential care sample, 12% returned home to live with someone with parental responsibility after their first residential care placement
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_res2exit, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)



# 50% of placements finishing for 10-17 year olds are their first ever placement
# (so basically there should always be approx equal numbers comeing into the wo lac states from either non-lac side?)

mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_pcpriors, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)





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


# mod_states %>% 
  filter(gender == "Boys",
         lac != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~lac)


mod_states %>% 
  filter(lac == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)