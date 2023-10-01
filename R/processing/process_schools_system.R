# YOU NEED TO COME BACK AND GET THE TOTAL COHORT NUMBERS FROM ALL THE NEET CLEANING



fsm_pc <- schools_10to22_fsm %>% 
  ungroup() %>% 
  filter(level == "Birmingham") %>% 
  group_by(end_period_year) %>% 
  mutate(school_headcount = sum(school_headcount, na.rm = T),
         school_fsm = sum(school_fsm, na.rm = T)) %>% 
  distinct(end_period_year, school_headcount, school_fsm) %>% 
  mutate(fsm_pc = school_fsm/school_headcount) %>% 
  select(fsm_pc, end_period_year) %>% 
  rename(pc = fsm_pc) %>% 
  mutate(measure = "fsm") %>% 
  bind_rows(poverty_rate %>% 
              filter(level == "Birmingham",
                     end_period_year %in% c(2010:2020)) %>% 
              select(end_period_year, pov_rate) %>% 
              rename(pc = pov_rate) %>% 
              mutate(measure = "child_pov"))

childpov_v_fsm <- fsm_pc %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = measure, colour = measure))
# FSM ELIGIBILITY LAGS BEHIND CHILD POVERTY???

childpov_v_fsm

ggsave(filename = "output/graphs/childpov_v_fsm.png", childpov_v_fsm)

# SO RATHER THAN LOOKING AT ABSOLUTES EACH YEAR, I SHOULD LOOK AT PC OF 
# TOTAL FSM THAT WERE IN MAINSTREAM VS IN PRU
# AND THEN APPLY THAT TO THE POPULATION FIGURES????????


school_system <- neet_smooth %>% 
  mutate(`FSM eligible`= 0.675*smooth_count,
         `Not FSM eligible` = 0.325*smooth_count) %>% 
  select(-smooth_count) %>% 
  pivot_longer(c(`FSM eligible`, `Not FSM eligible`),
               names_to = "fsm",
               values_to = "neet") %>% 
  full_join(school_pru) %>% 
  mutate(neet = ifelse(is.na(neet), 0, neet))
  # filter(end_period_year <= 2020)
  
  # STOP AND THINK FOR A SEC... WHAT ARE THE PARMAETERS & IC'S YOU EVEN MNEED???
  
  check <- school_pru %>% 
    filter(age == 15) %>% 
    mutate(pru2neet = PRU*0.1,
           notpru2neet = )
# ok and now what percent of what goes to neet and not neet? 
  #  and how does that compare with actual neet numbers?
  
  
  
# PRUS AND CARE????
pru_care <- care_ic %>% 
  mutate(care_experience = prior + nres + res) %>% 
  select(-c(starts_with("pc"), prior, nres, res)) %>% 
  full_join(school_pru %>%
              pivot_wider(names_from = fsm,
                          values_from = c(PRU, `Not PRU`))) %>% 
  mutate(pc_pru = (`PRU_FSM eligible` + `PRU_Not FSM eligible`)/
           (`PRU_FSM eligible` + `PRU_Not FSM eligible` + `Not PRU_FSM eligible` + `Not PRU_Not FSM eligible`),
         tot_pru = `PRU_FSM eligible` + `PRU_Not FSM eligible`,
         pc_pru_never = tot_pru/(never + 30*care_experience),
         pc_pru_care = pc_pru_never*30,
         count_pru_never = pc_pru_never*never,
         count_pru_care = pc_pru_care*care_experience) 

# PRU not eligible are comparative sizes to PRU care, which is good??
# also if care is bigger, that could be because those are prior care??
# so basically care (incl res, nres, prior) going to PRUs 30 times more is ok! i think!!

check <- pru_care %>% 
  select(c(end_period_year, gender, age, `PRU_FSM eligible`, `PRU_Not FSM eligible`, count_pru_never, count_pru_care))
  
check <- pru_care %>% 
  ungroup() %>% 
  group_by(end_period_year) %>% 
  summarise(check = sum(count_pru_care)/sum(care_experience))
# just checking here the whole about 5% of kids in care should be in PRUs...

care_v_all_pru_rate <- care_school_16to22 %>% 
  select(end_period_year, t_pru, t_secondary) %>% 
  mutate(pc = as.numeric(t_pru)/(as.numeric(t_secondary)+as.numeric(t_pru))) %>% 
  select(end_period_year, pc) %>% 
  mutate(group = "care") %>% 
  bind_rows(school_pru %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "all"))  %>% 
  bind_rows(school_pru %>% 
              filter(fsm == "FSM eligible") %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
              mutate(group = "FSM"))  %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = group, colour = group))
care_v_all_pru_rate

ggsave(filename = "output/graphs/care_v_all_pru_rate.png", care_v_all_pru_rate)
# so looks like pru rates for care do trend with pru rates for all, just high above them


check <- care_school_16to22 %>% 
  mutate(pc_care = as.numeric(t_pru)/(as.numeric(t_secondary)+as.numeric(t_pru))) %>% 
  select(end_period_year, pc_care) %>% 
  full_join(school_pru %>% 
              group_by(end_period_year) %>% 
              summarise(`Not PRU` = sum(`Not PRU`),
                        PRU = sum(PRU)) %>% 
              mutate(pc_all = PRU/(PRU +`Not PRU`))) %>%
    mutate(check = pc_care/pc_all)
# so i havent taken away care from the all thing, but it looks here like 
# care is about 8 times more likely not 30

pc_of_pru_in_care <- care_school_16to22 %>% 
  full_join(pru %>% 
              group_by(end_period_year) %>% 
              summarise(count = sum(count))) %>% 
  mutate(pc = as.numeric(t_pru)/count) %>% 
  filter(end_period_year >= 2016) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc))
pc_of_pru_in_care
ggsave(filename = "output/graphs/pc_of_pru_in_care.png", pc_of_pru_in_care)


school_pru %>% 
  group_by(end_period_year) %>% 
  summarise(`Not PRU` = sum(`Not PRU`),
            PRU = sum(PRU)) %>% 
  mutate(pc = PRU/(PRU +`Not PRU`)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc))




care_pov <- care_ic %>% 
  left_join(smooth_poverty) %>% 
  #   select(gender, age, never, nres, res, prior, spov_rate) %>%
  select(end_period_year, gender, age, count, never, nres, res, prior, spov_rate) %>% 
  mutate(count_incl = count*(1-spov_rate),
         count_excl = count*spov_rate) %>%
  mutate(mult_excl = count_excl*4) %>% 
  mutate(lac_pc_incl = count_incl/(count_incl + mult_excl),
         lac_pc_excl = mult_excl/(count_incl + mult_excl)) %>% 
  mutate(nres_incl = nres*lac_pc_incl,
         nres_excl = nres*lac_pc_excl,
         res_incl = res*lac_pc_incl,
         res_excl = res*lac_pc_excl,
         pri_incl = prior*lac_pc_incl,
         pri_excl = prior*lac_pc_excl) %>% 
  mutate(nev_incl = count_incl - nres_incl - res_incl - pri_incl,
         nev_excl = count_excl - nres_excl - res_excl - pri_excl) %>% 
  select(c(end_period_year, gender, age, count_incl, count_excl, 
           nev_incl, nres_incl, res_incl, pri_incl,
           nev_excl, nres_excl, res_excl, pri_excl))




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




pru_v_neet <- pov_care_school %>% 
  add_cohort()  %>% 
  group_by(cohort, age, gender, school) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(cohort, age, gender) %>% 
  mutate(rate = count/sum(count)) %>% 
  filter(school != "Mainstream") %>% 
  ggplot() + 
  geom_bar(aes(x = age, y = rate, fill = school), 
           stat = "identity", position = "stack") +
  facet_grid(rows = vars(gender),
             cols = vars(cohort))

ggsave(filename = "output/graphs/pru_v_neet.png", pru_v_neet)


rates <- pov_care_school %>%
  filter(age < 16) %>% 
  group_by(end_period_year, gender, state, school) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, gender, state) %>% 
  mutate(pru_rate = count/sum(count)) %>% 
  filter(school != "Mainstream") %>% 
  select(-c(school, count)) %>% 
  full_join(pov_care_school %>%
              filter(age >= 16) %>% 
              group_by(end_period_year, gender, state, school) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year, gender, state) %>% 
              mutate(neet_rate = count/sum(count)) %>% 
              filter(school != "Mainstream") %>% 
              select(-c(school, count))) %>% 
  full_join(pov_care_school %>%
              # mutate(care = ifelse(care == "Never", "No care experience", "Care experienced")) %>% 
              mutate(care = ifelse(care %in% c("Never", "Prior"), "Not in care", "Care")) %>% 
              group_by(end_period_year, gender, state, care) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year, gender, state) %>% 
              mutate(care_rate = count/sum(count)) %>% 
              filter(care != "Not in care") %>% 
              select(-c(care, count))) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pru_rate, colour = "PRU")) + 
  geom_line(aes(x = end_period_year, y = neet_rate, colour = "NEET")) + 
  geom_line(aes(x = end_period_year, y = care_rate, colour = "care")) + 
  facet_grid(rows = vars(gender),
             cols = vars(state))

rates

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# unsuccessful experiment # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

care_pov <- care_ic %>% 
  left_join(smooth_poverty) %>% 
  #   select(gender, age, never, nres, res, prior, spov_rate) %>%
  select(end_period_year, gender, age, count, never, nres, res, prior, spov_rate) %>% 
  mutate(count_incl = count*(1-spov_rate),
         count_excl = count*spov_rate) %>%
  mutate(mult_excl = count_excl*4) %>% 
  mutate(lac_pc_incl = count_incl/(count_incl + mult_excl),
         lac_pc_excl = mult_excl/(count_incl + mult_excl)) %>% 
  mutate(nres_incl = nres*lac_pc_incl,
         nres_excl = nres*lac_pc_excl,
         res_incl = res*lac_pc_incl,
         res_excl = res*lac_pc_excl,
         pri_incl = prior*lac_pc_incl,
         pri_excl = prior*lac_pc_excl) %>% 
  mutate(nev_incl = count_incl - nres_incl - res_incl - pri_incl,
         nev_excl = count_excl - nres_excl - res_excl - pri_excl) %>% 
  select(c(end_period_year, gender, age, count_incl, count_excl, 
           nev_incl, nres_incl, res_incl, pri_incl,
           nev_excl, nres_excl, res_excl, pri_excl)) %>% 
  mutate(pc_res_incl = res_incl/count_incl,
         pc_nres_incl = nres_incl/count_incl,
         pc_res_excl = res_excl/count_excl) %>% 
  ungroup() %>% 
  group_by(end_period_year, gender) %>% 
  arrange(age) %>% 
  mutate(smooth_pc_res_incl = smooth.spline(age, pc_res_incl)$y,
         smooth_pc_nres_incl = smooth.spline(age, pc_nres_incl)$y)

care_pov %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_nres_incl, group = age, colour = age)) +
  facet_grid(~gender)
            