IC <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/IC.xlsx", sheet = 2)

init_c <- IC %>% 
  mutate(J1 = count*J1,
         J2 = count*J2,
         J3 = count*J3,
         J4 = count*J4) %>% 
  select(-count) %>% 
  pivot_longer(c(J1, J2, J3, J4),
               names_to = "yjs",
               values_to = "count") %>% 
  mutate(yjs = ifelse(grepl("J1", yjs), "No_contact_with_YJS", yjs),
         yjs = ifelse(grepl("J2", yjs), "Known_to_police", yjs),
         yjs = ifelse(grepl("J3", yjs), "In_the_YJS", yjs),
         yjs = ifelse(grepl("J4", yjs), "In_custody", yjs)) %>% 
  # NEW BASELINE is no one in the police database state ("known to police")
  # so making it so no children are in that state - assigning them to the no-contact
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  mutate(No_contact_with_YJS = No_contact_with_YJS + Known_to_police,
         Known_to_police = 0) %>% 
  pivot_longer(c( No_contact_with_YJS, Known_to_police, In_the_YJS, In_custody),
               names_to = "yjs",
               values_to = "count") %>% 
  # THEN realised not enough people were in the YJS to begin with 
  # so did another re-distribution - away from the no-contact, towards in YJS and In custody
  group_by(age, poverty, care, school) %>% 
  mutate(tot = sum(count)) %>% 
  mutate(x = ifelse(yjs %in% c("In_the_YJS", "In_custody"), 1.45, 1)) %>% 
  mutate(count_new = count*x) %>% 
  mutate(tot_new = sum(count_new)) %>% 
  mutate(ratio = ifelse(tot > 0, tot_new/tot, 1)) %>% 
  mutate(count_new = count_new/ratio) %>% 
  mutate(tot_new = sum(count_new)) %>% 
  select(age, poverty, care, school, yjs, count_new) %>% 
  rename(count = count_new) %>% 
  ungroup()


# save(init_c, file = "output/data/input/current/init_c.Rdata")


# WHAT IS THIS OLD STUFF HERE FOR???
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


save(pov_care_school, file = "/Users/katehayes/CLmodR/output/data/processed/pov_care_school.Rdata")
save(care_ic, file = "/Users/katehayes/CLmodR/output/data/input/care_ic.Rdata")




