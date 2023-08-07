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



mod_flows <- mod_states %>% 
  pivot_wider(names_from = lac,
              values_from = count) %>% 
  full_join(mod_params) %>% 
  mutate(NP2NRES = np2nres*np2lac*Never,
         NP2RES = np2res*np2lac*Never,
         
         NRES2NRES = nr2nr*end_nr*`Not residential`,
         NRES2RES = nr2res*end_nr*`Not residential`,
         NRES2PRIOR = nr2exit*end_nr*`Not residential`,
         
         RES2NRES = res2nr*end_res*Residential,
         RES2RES = res2res*end_res*Residential,
         RES2PRIOR = res2exit*end_res*Residential,
         
         PRIOR2NRES = prior2nres*prior2lac*Prior,
         PRIOR2RES = prior2res*prior2lac*Prior,
         
         NRESinflow = NP2NRES + NRES2NRES + RES2NRES + PRIOR2NRES,
         RESinflow = NP2RES + NRES2RES + RES2RES + PRIOR2RES,
         LACoutflow = NRES2PRIOR + RES2PRIOR) %>% 
  mutate(check_resnp = NP2RES/RESinflow)



# 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
mod_flows %>% 
  ggplot() +
  geom_line(aes(x = t, y = check_resnp, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)
# so this is almost exactly wrong - 10 year olds are at 20% and 16/17 year olds at 10%
# need to make age-varying parameters to solve this

















mod_states %>% 
  filter(gender == "Boys",
         lac != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~lac)


mod_states %>% 
  filter(gender == "Girls",
         lac != "Never") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~lac)

mod_states %>% 
  filter(lac == "Residential") %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = as.character(age), color = as.character(age))) +
  facet_grid(~gender)