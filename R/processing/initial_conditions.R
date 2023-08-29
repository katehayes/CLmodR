care_ic <- pov_care_school %>% 
  filter(end_period_year == 2010) %>% 
  group_by(gender, age, state, care) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = c(state, care),
              values_from = count) %>% 
  rename(nev_excl = `In poverty_Never`,
         nres_excl = `In poverty_Not residential`,
         res_excl = `In poverty_Residential`,
         pri_excl = `In poverty_Prior`,
         nev_incl = `Not in poverty_Never`,
         nres_incl = `Not in poverty_Not residential`,
         res_incl = `Not in poverty_Residential`,
         pri_incl = `Not in poverty_Prior`)
