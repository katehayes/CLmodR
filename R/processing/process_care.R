
# loading in data made in the cleaning scripts
load("/Users/katehayes/CLmodR/output/data/cleaned/care_10to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_placement.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_duration_14to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_convicted_15to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# for care duration  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# making estimates of earlier years to fill back to 2010 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

mod1 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Residential"))
summary(mod1)

mod2 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Not residential"))
summary(mod2)

care_duration <- care_duration_14to22 %>% 
  ungroup() %>% 
  add_row(end_period_year = 2013, residential = "Residential", mean_dur = (6.328*2013)-12540.394) %>% 
  add_row(end_period_year = 2012, residential = "Residential", mean_dur = (6.328*2012)-12540.394) %>% 
  add_row(end_period_year = 2011, residential = "Residential", mean_dur = (6.328*2011)-12540.394) %>%
  add_row(end_period_year = 2010, residential = "Residential", mean_dur = (6.328*2010)-12540.394) %>% 
  add_row(end_period_year = 2013, residential = "Not residential", mean_dur = (7.929*2013)-15637.629) %>%
  add_row(end_period_year = 2012, residential = "Not residential", mean_dur = (7.929*2012)-15637.629) %>%
  add_row(end_period_year = 2011, residential = "Not residential", mean_dur = (7.929*2011)-15637.629) %>%
  add_row(end_period_year = 2010, residential = "Not residential", mean_dur = (7.929*2010)-15637.629) 

save(care_duration, file = "output/data/processed/care_duration.Rdata")

care_duration %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = mean_dur, fill = residential),
           stat = "identity", position = "dodge")


endnr <- care_duration %>% 
  filter(residential == "Not residential",
         end_period_year <= 2020) %>% 
  arrange(end_period_year) %>% 
  select(mean_dur) %>% 
  mutate(mean_dur = 1/(mean_dur/7)) %>% 
  rename(Boys = mean_dur) %>% 
  mutate(Girls = Boys) %>% 
  as.matrix()

endres <- care_duration %>% 
  filter(residential == "Residential",
         end_period_year <= 2020) %>% 
  arrange(end_period_year) %>% 
  select(mean_dur) %>% 
  mutate(mean_dur = 1/(mean_dur/7)) %>% 
  rename(Boys = mean_dur) %>% 
  mutate(Girls = Boys) %>% 
  as.matrix()

save(endnr, file = "output/data/input/endnr.Rdata")
save(endres, file = "output/data/input/endres.Rdata")



# p = i x d
# duration = prevalence(day count)/ incidence(per day - so years total div by 365)
# check <- care_10to22 %>% 
#   pivot_wider(names_from = period_length,
#               values_from = count) %>% 
#   mutate(duration = Day / (Year / 365))
# 
# check %>% 
#   ggplot() +
#   geom_bar(aes(x = end_period_year, y = duration, fill = level),
#            stat = "identity", position = "dodge")
# looked at diff between duration in birm/wm/eng by doing the p=id calculation
# looks fine, birm higher by like 10 days usually, not too bad


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# THIS IS CURRENTLY A MESSY MIX OF OLD AND NEW # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# first we'll take all the supplementary data, make percentages, 
# then add these back into the main dataset

# this is placement, age, and gender

placement_pc <- care_11to22_placement %>%
group_by(level, end_period_year, end_period_month, period_length, placement) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                        "Residential schools",
                                        "Other residential settings"),
                            "Residential",
                            "Not residential")) 

# quick graph of the pc's to see about the assumption ill be making
# check_placement_pc <- placement_pc %>%
#   filter(level == "Birmingham") %>%
#   ggplot() +
#   geom_line(aes(x = end_period_year, y = pc, colour = placement)) +
#   scale_x_continuous(name = "") +
#   scale_y_continuous(name = "") +
#   theme_classic() +
#   theme(strip.background = element_blank())
# check_placement_pc
# secure units & 'other residential settings' growing as a pc of total care placements, residential schools shrikning
# think its probably ok to just apply the same pcs to 2010 as you have in 2011

placement_pc <- placement_pc  %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(pc = sum(pc)) %>%
  pivot_wider(names_from = residential, values_from = pc)

# ok..... do I need to leave non-residential in there too? probably not. probably you just need the categories
# you're using plus their percentages.

age_pc <- care_11to22_age %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  filter(age %in% c("10-15", "16+")) %>%
  select(-c(count, tot)) %>%
  pivot_wider(names_from = age, values_from = pc)

# age_pc %>% 
#   ggplot() +
#   geom_line(aes(x = end_period_year, y = `10-15`, group = level, color = level))
# 
# age_pc %>% 
#   ggplot() +
#   geom_line(aes(x = end_period_year, y = `16+`, group = level, color = level))
# birmingham much jumpier because less data - generally looks to be around english level

# at eng level:      97% of kids in res care are 10 or over - 2015

 rate10plus <- c(97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 97)
 names(rate10plus) <- c("2020", "2019", "2018", "2017", "2016", "2015", "2014", 
                        "2013", "2012", "2011", "2010")
 
 rate10plus <-stack(rate10plus) %>% 
   rename(end_period_year = ind,
          rate10plus = values) %>% 
   mutate(rate10plus = rate10plus/100) %>% 
   mutate(end_period_year = as.character(end_period_year)) %>% 
   mutate(end_period_year = as.numeric(end_period_year))
     
               

gender_pc <- care_11to22_gender %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>%
  select(-c(count, tot)) %>%
  pivot_wider(names_from = gender, values_from = pc)


gender_pc %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = Girls, group = level, color = level))
# OK - BIRMINGHAM HAS WAY MORE GIRLS IN CARE THEN THE REST OF ENGLAND

# at england level, rescare girl 38 in 2015 - 44.6 overall - 0.85
#                   rescare girl 37 in 2020 - 43.8 overall - 0.8447





# OK MAYBE IT SHOULDNT ACTUALLY ALL COME IN TOGETHER - YOU CAN REVISIT THIS....
care_pc <- placement_pc %>%
  full_join(age_pc) %>%
  full_join(gender_pc)

care_pc_2010 <- care_pc %>%
  filter(end_period_year == 2011) %>%
  mutate(end_period_year = end_period_year - 1)

care_pc <- care_pc %>%
  bind_rows(care_pc_2010)

# ADD BACK TO MAIN TIME SERIES

care <- care_10to22 %>%
  filter(period_length == "Day") %>%
  full_join(care_pc %>% 
              select(-c(Boys, Girls, `10-15`, `16+`))) %>% 
  mutate(Residential = count * Residential,
         `Not residential` = count * `Not residential`) %>%
  filter(level == "Birmingham") %>% 
  select(-level) %>% 
  full_join(care_pc %>% 
              ungroup() %>% 
              select(-c(`10-15`, `16+`, Residential, `Not residential`)) %>% 
              filter(level == "Birmingham") %>% 
              select(-level)) %>% 
  mutate(pc_resgirl = 0.85*Girls,
         pc_resboy = 1 - pc_resgirl,
         count_resgirl = pc_resgirl*Residential,
         count_resboy = pc_resboy*Residential,
         count_nresgirl = count*Girls - count_resgirl,
         count_nresboy = count*Boys - count_resboy) %>% 
  select(c(end_period_year, end_period_month, period_length, 
           count_resgirl, count_resboy, count_nresgirl, count_nresboy)) %>% 
  pivot_longer(c(count_resgirl, count_resboy, count_nresgirl, count_nresboy),
               names_to = "name",
               values_to = "count") %>% 
  mutate(residential = ifelse(grepl("nres", name), "Not residential", "Residential"),
         gender = ifelse(grepl("girl", name), "Girls", "Boys")) %>% 
  select(-name) %>% 
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  full_join(rate10plus) %>% 
  mutate(rate10plus = ifelse(is.na(rate10plus), 0.97, rate10plus)) %>% 
  full_join(care_pc %>% 
            ungroup() %>% 
            select(-c(Boys, Girls, Residential, `Not residential`)) %>% 
            filter(level == "Birmingham") %>% 
            select(-level)) %>% 
  mutate(`>10 CiC pc` = `10-15` + `16+`,
         `>10 res count` = rate10plus*Residential, # OK HERE IM ASSUMING 90% OF RES CARE ARE ABOVE 10 - this comes from the ofsted mini data set
         `>10 nonres count` = (Residential + `Not residential`)*`>10 CiC pc` - `>10 res count`) %>% 
  select(-c(Residential, `Not residential`, rate10plus,
            `>10 CiC pc`, `10-15`, `16+`)) %>% 
  pivot_longer(c(`>10 res count`, `>10 nonres count`),
               names_to = "residential", values_to = "count") %>% 
  mutate(residential = ifelse(grepl("non", residential), "Not residential", "Residential"))
# at this point you have - population only includes over tens, youve got a res to non res split and a gender split
# you've not got the distribution between 10-17 of each bit


# so its
# 10-13 - (56-34) - 22
# 14-15 - 34
# 16+ - 41
# Their average age was 14.6 years old

# OK the below mostly works
# 10-3
# 11-4
# 12-6
# 13-10
# 14 - 14
# 15 - 22
# 16 - 31
# 17- 10


age_15 <- c(3,4,6,10,14,22,32,9)
names(age_15) <- c("10", "11", "12", "13", "14", "15", "16", "17")
age_15 <- stack(age_15) %>% 
  rename(age = ind,
         pc = values) %>% 
  mutate(pc = pc/100)




care_agedetail <- care %>% 
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  mutate(res10 = Residential*age_15 %>% 
           filter(age == 10) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res11 = Residential*age_15 %>% 
           filter(age == 11) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res12 = Residential*age_15 %>% 
           filter(age == 12) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res13 = Residential*age_15 %>% 
           filter(age == 13) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res14 = Residential*age_15 %>% 
           filter(age == 14) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res15 = Residential*age_15 %>% 
           filter(age == 15) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res16 = Residential*age_15 %>% 
           filter(age == 16) %>% 
           select(pc) %>% 
           unlist()) %>% 
  mutate(res17 = Residential*age_15 %>% 
           filter(age == 17) %>% 
           select(pc) %>% 
           unlist()) 


care_agedetail2 <- care_agedetail %>% 
  mutate(res10to15 = res10 + res11 + res12 + res13 + res14 + res15,
         res16plus = res16 + res17) %>% 
  ungroup() %>% 
  select(-c(res10, res11, res12, res13, res14, res15, res16, res17,
            end_period_month, period_length)) %>% 
  full_join(care_pc %>% 
             ungroup() %>% 
             select(-c(Boys, Girls, Residential, `Not residential`)) %>% 
             filter(level == "Birmingham") %>% 
             select(-level)) %>%
  mutate(tot = `10-15` + `16+`,
         `10-15` = `10-15`/ tot,
         `16+` = `16+`/tot) %>% 
  mutate(nonres10to15 = (Residential + `Not residential`)*`10-15` -  res10to15,
         nonres16plus = (Residential + `Not residential`)*`16+` -  res16plus) %>% 
  select(c(end_period_year, nonres10to15, nonres16plus, gender)) %>% 
  # mutate(check = nonres10to15/ (nonres10to15 + nonres16plus)) %>% 
  # group_by(gender) %>% 
  # mutate(av_pc_bygen = mean(check))
# %>% 
  # HERE - WHAT IS THE DISTRIBUTION OF THE NON-RES AGE
  # I BASICLALY MADE UP THE BELOW
  mutate(nonres10 = nonres10to15*0.119403,
         nonres11 = nonres10to15*0.1343284,
         nonres12 = nonres10to15*0.1492537,
         nonres13 = nonres10to15*0.1641791,
         nonres14 = nonres10to15*0.1940299,
         nonres15 = nonres10to15*0.238806,
         nonres16 = nonres16plus*0.5151515,
         nonres17 = nonres16plus*0.4848485) %>% 
  select(-c(nonres10to15, nonres16plus)) %>% 
  pivot_longer(c(starts_with("nonres")),
               values_to = "count", names_to = "name") %>%
  mutate(age = as.numeric(str_extract_all(name, "(\\d{2})"))) %>% 
  mutate(residential = "Not residential") %>% 
  select(-name) 

  

care_agedetail3 <- care_agedetail %>% 
  select(c(end_period_year, gender, starts_with("res1"))) %>% 
  pivot_longer(c(starts_with("res")),
               values_to = "count", names_to = "name") %>%
  mutate(age = as.numeric(str_extract_all(name, "(\\d{2})"))) %>% 
  mutate(residential = "Residential") %>% 
  select(-name) 

care_agedetail4 <- bind_rows(care_agedetail3, care_agedetail2)


# THIS PROBABLY IS NOT RIGHT
care_agedetail4 %>% 
  group_by(end_period_year, gender, residential) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, group = residential, color = residential)) +
  facet_wrap(~gender)

care_agedetail4 %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(residential, gender))


# # %>% 
#   pivot_longer(c(nonres10to15, nonres16plus, res10to15, res16plus),
#                values_to = "count", names_to = "name") %>% 
#   mutate(residential = ifelse(grepl("non", name), "Not residential", "Residential"),
#          age = ifelse(grepl("15", name), "10-15", "16+")) %>% 
#   select(-name) %>% 
#   pivot_wider(names_from = residential,
#               values_from = count) %>% 
#   full_join(population %>% 
#               filter(end_period_year >= 2010) %>% 
#               pivot_wider(names_from = age, values_from = count) %>% 
#               mutate(`10-15` = `10` + `11` + `12` + `13` +`14` + `15`,
#                      `16+` = `16` + `17`) %>% 
#               select(end_period_year, gender, `10-15`, `16+`) %>% 
#               pivot_longer(c(`10-15`, `16+`),
#                            names_to = "age",
#                            values_to = "population")) %>% 
#   mutate(pc_res = Residential / population,
#          pc_notres = `Not residential` / population) %>% 
#   mutate(pc_lac = pc_res + pc_notres)
#   
  
# %>% 
#   mutate(`10-15` = `10-15`/`>10 CiC pc`,
#          `16+` = `16+`/`>10 CiC pc`,
#          count = `>10 res count` + `>10 nonres count`) %>% 
# full_join(care_pc %>% 
#             ungroup() %>% 
#             select(-c(Residential, `Not residential`, `10-15`, `16+`)) %>% 
#             filter(level == "Birmingham") %>% 
#             select(-level)) %>% 
#   mutate(res_boys = `>10 res count`*0.62,
#          res_girls = `>10 res count`*0.38,
#          nonres_boys = count*Boys - res_boys,
#          nonres_girls = count*Girls - res_girls) %>% 
#   select(c(end_period_year, end_period_month, period_length,
#            res_boys, res_girls, nonres_boys, nonres_girls)) %>% 
#   pivot_longer(c(res_boys, res_girls, nonres_boys, nonres_girls),
#                names_to = "name", values_to = "count") %>% 
#   mutate(residential = ifelse(grepl("non", name), "Not residential", "Residential"),
#          gender = ifelse(grepl("girl", name), "Girls", "Boys")) %>% 
#   select(-name) 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# NEED TO CALCULATE ENTRY RATE # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Should i try the p=id method?

entry_rate <- care_agedetail4 %>% 
  full_join(care_duration) %>% 
  mutate(incidence = count/(mean_dur/7)) %>% 
# ok so that's the incidence - now where does it come from?
  # 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
  # group_by(end_period_year) %>% 
  # mutate(tot_incidence = sum(incidence)) %>% 
  # ungroup() %>% 
  # ABSOLUTELY NO IDEA WHERE I PLUCKED THESE NUMBERS FROM EITHER
  mutate(pc_from_never = ifelse(residential == "Residential" & age %in% c(10, 11, 12, 13),
                                0.1, NA),
         pc_from_never = ifelse(residential == "Residential" & age %in% c(14, 15, 16, 17),
                                0.2, pc_from_never)) %>% 
  mutate(pc_from_res = ifelse(residential == "Residential" & age %in% c(10, 11, 12, 13),
                              0.16, NA),
         pc_from_res = ifelse(residential == "Residential" & age %in% c(14, 15, 16, 17),
                              0.3, pc_from_res)) %>% 
  mutate(pc_from_nres = ifelse(residential == "Residential" & age %in% c(10, 11, 12, 13),
                              0.5, NA),
         pc_from_nres = ifelse(residential == "Residential" & age %in% c(14, 15, 16, 17),
                               0.3, pc_from_nres)) %>% 
  mutate(pc_from_never = ifelse(residential == "Not residential" & age %in% c(10, 11, 12, 13, 14, 15),
                                0.7, pc_from_never),
         pc_from_never = ifelse(residential == "Not residential" & age %in% c(16, 17),
                                0.4, pc_from_never)) %>% 
  mutate(pc_from_nres = ifelse(residential == "Not residential",
                                0.15, pc_from_nres)) %>% 
  mutate(pc_from_res = ifelse(residential == "Not residential" & age %in% c(10, 11, 12, 13, 14, 15),
                               0.10, pc_from_res),
         pc_from_res = ifelse(residential == "Not residential" & age %in% c(16, 17),
                              0.20, pc_from_res))  %>% 
  mutate(pc_from_prior = 1 - (pc_from_never + pc_from_nres + pc_from_res)) %>% 
  mutate(count_from_never = incidence*pc_from_never,
         count_from_prior = incidence*pc_from_prior) %>% 
  select(end_period_year, gender, age, residential, 
         count_from_never, count_from_prior) %>% 
  pivot_wider(names_from = residential,
              values_from = c(count_from_prior, count_from_never)) %>% 
  full_join(care_agedetail4 %>% 
              pivot_wider(names_from = residential,
                          values_from = count))  %>% 
  full_join(population %>% 
              filter(end_period_year >= 2010) %>% 
              group_by(end_period_year, gender, age) %>% 
              summarise(population = sum(count))) %>% 
  filter(end_period_year <= 2020) %>% 
  mutate(pc_lac = (Residential + `Not residential`)/ population) %>% 
  mutate(pc_ever = case_when(gender == "Boys" & age == 10 ~ 1.62,
                             gender == "Boys" & age == 11 ~ 1.62+0.2628571,
                             gender == "Boys" & age == 12 ~ 1.62+2*0.2628571,
                             gender == "Boys" & age == 13 ~ 1.62+3*0.2628571,
                             gender == "Boys" & age == 14 ~ 1.62+4*0.2628571,
                             gender == "Boys" & age == 15 ~ 1.62+5*0.2628571,
                             gender == "Boys" & age == 16 ~ 1.62+6*0.2628571,
                             gender == "Boys" & age == 17 ~ 3.46,
                             gender == "Girls" & age == 10 ~ 1.47,
                             gender == "Girls" & age == 11 ~ 1.47+0.2228571,
                             gender == "Girls" & age == 12 ~ 1.47+2*0.2228571,
                             gender == "Girls" & age == 13 ~ 1.47+3*0.2228571,
                             gender == "Girls" & age == 14 ~ 1.47+4*0.2228571,
                             gender == "Girls" & age == 15 ~ 1.47+5*0.2228571,
                             gender == "Girls" & age == 16 ~ 1.47+6*0.2228571,
                             gender == "Girls" & age == 17 ~ 3.03)) %>% 
  mutate(pc_ever = pc_ever/100) %>% 
  mutate(pc_prior = pc_ever - pc_lac) %>% 
  mutate(count_prior = population*pc_prior) %>% 
  mutate(rate_prior2nres = `count_from_prior_Not residential`/count_prior,
         rate_prior2res = `count_from_prior_Residential`/count_prior,
         rate_never2nres = `count_from_never_Not residential`/population*(1-pc_ever),
         rate_never2res = `count_from_never_Residential`/population*(1-pc_ever)) %>% 
  select(c(end_period_year, gender, age, starts_with("rate_"))) %>% 
  ungroup()


entry_rate %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = rate_never2nres, group = as.character(age), color = as.character(age))) +
  facet_wrap(~gender)


entry_rate %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = rate_never2res, group = as.character(age), color = as.character(age))) +
  facet_wrap(~gender)

entry_rate %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = rate_prior2res, group = as.character(age), color = as.character(age))) +
  facet_wrap(~gender)

# THIS ONE IS PARTICULARLY FUCKED UP
entry_rate %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = rate_prior2nres, group = as.character(age), color = as.character(age))) +
  facet_wrap(~gender)


prior2nres10 <- entry_rate %>%
  filter(age == 10) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres11 <- entry_rate %>%
  filter(age == 11) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres12 <- entry_rate %>%
  filter(age == 12) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres13 <- entry_rate %>%
  filter(age == 13) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres14 <- entry_rate %>%
  filter(age == 14) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres15 <- entry_rate %>%
  filter(age == 15) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres16 <- entry_rate %>%
  filter(age == 16) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres17 <- entry_rate %>%
  filter(age == 17) %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()



prior2res10 <- entry_rate %>%
  filter(age == 10) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res11 <- entry_rate %>%
  filter(age == 11) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res12 <- entry_rate %>%
  filter(age == 12) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res13 <- entry_rate %>%
  filter(age == 13) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res14 <- entry_rate %>%
  filter(age == 14) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res15 <- entry_rate %>%
  filter(age == 15) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res16 <- entry_rate %>%
  filter(age == 16) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res17 <- entry_rate %>%
  filter(age == 17) %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()


never2nres10 <- entry_rate %>%
  filter(age == 10) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres11 <- entry_rate %>%
  filter(age == 11) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres12 <- entry_rate %>%
  filter(age == 12) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres13 <- entry_rate %>%
  filter(age == 13) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres14 <- entry_rate %>%
  filter(age == 14) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres15 <- entry_rate %>%
  filter(age == 15) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres16 <- entry_rate %>%
  filter(age == 16) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres17 <- entry_rate %>%
  filter(age == 17) %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()



never2res10 <- entry_rate %>%
  filter(age == 10) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res11 <- entry_rate %>%
  filter(age == 11) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res12 <- entry_rate %>%
  filter(age == 12) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res13 <- entry_rate %>%
  filter(age == 13) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res14 <- entry_rate %>%
  filter(age == 14) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res15 <- entry_rate %>%
  filter(age == 15) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res16 <- entry_rate %>%
  filter(age == 16) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res17 <- entry_rate %>%
  filter(age == 17) %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()










# 
# mutate(pc_ever = case_when(age == 10 ~ 1.55,
#                            age == 11 ~ 1.55+0.2428,
#                            age == 12 ~ 1.55+2*0.2428,
#                            age == 13 ~ 1.55+3*0.2428,
#                            age == 14 ~ 1.55+4*0.2428,
#                            age == 15 ~ 1.55+5*0.2428,
#                            age == 16 ~ 1.55+6*0.2428,
#                            age == 17 ~ 3.25)) %>% 
#   mutate(pc_ever = pc_ever/100) %>% 

# entry_rate <- care %>% 
#   mutate(count10 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 10) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count11 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 11) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count12 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 12) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count13 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 13) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count14 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 14) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count15 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 15) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count16 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 16) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(count17 = Residential*rescare_age_at_entry_20 %>% 
#            filter(age == 17) %>% 
#            select(pc) %>% 
#            unlist()) %>% 
#   mutate(res10to15 = res10 + res11 + res12 + res13 + res14 + res15,
#          res16plus = res16 + res17) %>% 
#   ungroup() %>% 
#   select(-c(res10, res11, res12, res13, res14, res15, res16, res17,
#             end_period_month, period_length)) %>% 
#   full_join(care_pc %>% 
#               ungroup() %>% 
#               select(-c(Boys, Girls, Residential, `Not residential`)) %>% 
#               filter(level == "Birmingham") %>% 
#               select(-c(level, end_period_month, period_length))) %>% 
#   mutate(tot = `10-15` + `16+`,
#          `10-15` = `10-15`/ tot,
#          `16+` = `16+`/tot) %>% 
#   mutate(nonres10to15 = (Residential + `Not residential`)*`10-15` -  res10to15,
#          nonres16plus = (Residential + `Not residential`)*`16+` -  res16plus) %>% 
#   select(-c(Residential, `Not residential`, `10-15`, `16+`, tot)) %>% 
#   pivot_longer(c(nonres10to15, nonres16plus, res10to15, res16plus),
#                values_to = "count", names_to = "name") %>% 
#   mutate(residential = ifelse(grepl("non", name), "Not residential", "Residential"),
#          age = ifelse(grepl("15", name), "10-15", "16+")) %>% 
#   select(-name) %>% 
#   pivot_wider(names_from = residential,
#               values_from = count) %>% 
#   full_join(population %>% 
#             filter(end_period_year >= 2010) %>% 
#             pivot_wider(names_from = age, values_from = count) %>% 
#             mutate(`10-15` = `10` + `11` + `12` + `13` +`14` + `15`,
#                    `16+` = `16` + `17`) %>% 
#             select(end_period_year, gender, `10-15`, `16+`) %>% 
#             pivot_longer(c(`10-15`, `16+`),
#                          names_to = "age",
#                          values_to = "population")) %>% 
#   mutate(pc_res = Residential / population,
#          pc_notres = `Not residential` / population) %>% 
#   mutate(pc_lac = pc_res + pc_notres)

# care_dist_agein <- care_calc %>% 
#   filter(age == "10-15") %>% 
#   ggplot() +
#   geom_bar(aes(x = end_period_year, y = pc_notres, fill = gender),
#            stat = "identity", position = "dodge")
# 
# care_dist_agein

care_calc <- care_agedetail4 %>% 
  filter(age == 10,
         end_period_year <= 2020) %>% 
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  select(-age) %>% 
  full_join(population %>% 
             filter(end_period_year >= 2010,
                    age == 10) %>% 
            rename(population = count) %>% 
              select(end_period_year, gender, population)) %>% 
  mutate(pc_res = Residential/population,
         pc_nres = `Not residential`/population) %>% 
  mutate(pc_ever = NA,
         pc_ever = ifelse(end_period_year == 2010 &
                            gender == "Boys",
                          1.62, pc_ever),
         pc_ever = ifelse(end_period_year == 2010 &
                            gender == "Girls",
                          1.47, pc_ever),
         pc_ever = ifelse(end_period_year == 2013 &
                            gender == "Boys",
                          1.97, pc_ever),
         pc_ever = ifelse(end_period_year == 2013 &
                            gender == "Girls",
                          1.73, pc_ever)) %>% 
  # 1.73-1.47, 1.97 -1.62
 mutate(pc_ever = ifelse(end_period_year == 2011 &
                          gender == "Girls",
                        1.47+0.08666667, pc_ever),
       pc_ever = ifelse(end_period_year == 2012 &
                          gender == "Girls",
                        1.47+2*0.08666667, pc_ever),
       pc_ever = ifelse(end_period_year == 2014 &
                          gender == "Girls",
                        1.73+0.05, pc_ever),
       pc_ever = ifelse(end_period_year == 2015 &
                          gender == "Girls",
                        1.73+2*0.05, pc_ever),
       pc_ever = ifelse(end_period_year == 2016 &
                          gender == "Girls",
                        1.73+3*0.05, pc_ever),
       pc_ever = ifelse(end_period_year == 2017 &
                          gender == "Girls",
                        1.73+4*0.05, pc_ever),
       pc_ever = ifelse(end_period_year == 2018 &
                          gender == "Girls",
                        1.73+5*0.05, pc_ever),
       pc_ever = ifelse(end_period_year == 2019 &
                          gender == "Girls",
                        1.73+6*0.05, pc_ever),
       pc_ever = ifelse(end_period_year == 2020 &
                          gender == "Girls",
                        1.73+7*0.05, pc_ever)) %>% 
  # NOW BOYS
  mutate(pc_ever = ifelse(end_period_year == 2011 &
                            gender == "Boys",
                          1.62+0.1166667, pc_ever),
         pc_ever = ifelse(end_period_year == 2012 &
                            gender == "Boys",
                          1.62+2*0.1166667, pc_ever),
         pc_ever = ifelse(end_period_year == 2014 &
                            gender == "Boys",
                          1.97+0.05, pc_ever),
         pc_ever = ifelse(end_period_year == 2015 &
                            gender == "Boys",
                          1.97+2*0.05, pc_ever),
         pc_ever = ifelse(end_period_year == 2016 &
                            gender == "Boys",
                          1.97+3*0.05, pc_ever),
         pc_ever = ifelse(end_period_year == 2017 &
                            gender == "Boys",
                          1.97+4*0.05, pc_ever),
         pc_ever = ifelse(end_period_year == 2018 &
                            gender == "Boys",
                          1.97+5*0.05, pc_ever),
         pc_ever = ifelse(end_period_year == 2019 &
                            gender == "Boys",
                          1.97+5*0.05, pc_ever),
         pc_ever = ifelse(end_period_year == 2020 &
                            gender == "Boys",
                          1.97+6*0.05, pc_ever)) %>% 
  mutate(pc_ever = pc_ever/100) %>% 
  mutate(pc_prior = pc_ever - pc_res - pc_nres) %>% 
  mutate(week = (end_period_year - 2010)*52) %>% 
  arrange(week) %>% 
  select(c(week, gender, pc_nres, pc_res, pc_prior)) %>% 
  pivot_wider(names_from = gender,
              values_from = c(pc_nres, pc_res, pc_prior)) %>% 
  arrange(week)

t_lac <- care_calc$week

nres <- care_calc %>% 
  select(c(pc_nres_Boys, pc_nres_Girls)) %>% 
  as.matrix()

res <- care_calc %>% 
  select(c(pc_res_Boys, pc_res_Girls)) %>% 
  as.matrix()

pri <- care_calc %>% 
  select(c(pc_prior_Boys, pc_prior_Girls)) %>% 
  as.matrix()


save(t_lac, file = "output/data/input/t_lac.Rdata")
save(nres, file = "output/data/input/nres.Rdata")
save(res, file = "output/data/input/res.Rdata")
save(pri, file = "output/data/input/pri.Rdata")


# trying to do initial conditions..
care_ic <- population %>% 
  filter(end_period_year >= 2010) %>% 
  select(end_period_year, gender, age, count) %>% 
  mutate(res = ifelse((age <= 15 & gender == "Girls"), count*0.0019257341, count),
         res = ifelse((age > 15 & gender == "Girls"), count*0.0005670682, res),
         res = ifelse((age <= 15 & gender == "Boys"), count*0.0030011218, res),
         res = ifelse((age > 15 & gender == "Boys"), count*0.0008835090, res)) %>% 
  mutate(nres = ifelse((age <= 15 & gender == "Girls"), count*0.006825878, count),
         nres = ifelse((age > 15 & gender == "Girls"), count*0.011319689, nres),
         nres = ifelse((age <= 15 & gender == "Boys"), count*0.005865848, nres),
         nres = ifelse((age > 15 & gender == "Boys"), count*0.011156836, nres)) %>% 
  mutate(pc_current = (res+nres)/count) %>% 
  mutate(pc_ever = case_when(gender == "Boys" & age == 10 ~ 1.62,
                             gender == "Boys" & age == 11 ~ 1.62+0.2628571,
                             gender == "Boys" & age == 12 ~ 1.62+2*0.2628571,
                             gender == "Boys" & age == 13 ~ 1.62+3*0.2628571,
                             gender == "Boys" & age == 14 ~ 1.62+4*0.2628571,
                             gender == "Boys" & age == 15 ~ 1.62+5*0.2628571,
                             gender == "Boys" & age == 16 ~ 1.62+6*0.2628571,
                             gender == "Boys" & age == 17 ~ 3.46,
                             gender == "Girls" & age == 10 ~ 1.47,
                             gender == "Girls" & age == 11 ~ 1.47+0.2228571,
                             gender == "Girls" & age == 12 ~ 1.47+2*0.2228571,
                             gender == "Girls" & age == 13 ~ 1.47+3*0.2228571,
                             gender == "Girls" & age == 14 ~ 1.47+4*0.2228571,
                             gender == "Girls" & age == 15 ~ 1.47+5*0.2228571,
                             gender == "Girls" & age == 16 ~ 1.47+6*0.2228571,
                             gender == "Girls" & age == 17 ~ 3.03)) %>% 
  mutate(pc_ever = pc_ever/100) %>% 
  mutate(pc_prior = pc_ever - pc_current) %>% 
  mutate(prior = count*pc_prior) %>% 
  mutate(never = count - res - nres - prior)

exact_ic <- care_ic %>% 
  filter(end_period_year == 2010) %>% 
  select(gender, age, never, nres, res, prior)

# 3.25-1.55
# 
# care %>% 
# ggplot() +
#   geom_bar(aes(x = end_period_year, y = count, fill = gender),
#            stat = "identity", position = "stack") +
#   facet_grid(~residential)
# 
# # %>% 
#   full_join(population %>% 
#              filter(end_period_year >= 2010) %>% 
#              group_by(end_period_year, gender) %>% 
#              summarise(population = sum(count)))
#  
# 
# 
# 
# # %>%
#   select(-Residential) %>%
#   mutate(Girls = count * Girls,
#          Boys = count * Boys) %>%
#   select(-count) %>%
#   pivot_longer(c(Boys, Girls),
#                names_to = "gender", values_to = "count") %>%
#   mutate(`10-15` = count * `10-15`,
#          `16+` = count * `16+`) %>%
#   select(-count) %>%
#   pivot_longer(c(`10-15`, `16+`),
#                names_to = "age", values_to = "count")

save(care, file = "Output/Data/Processed/care.Rdata")

# NUMBER FOR THE YEAR 2010 ARE ESTIMATES BASED ON THE VALUE OF THE TOTAL
# NUMBERS IN 2010 AND THE PROPORTION OF TOTAL THAT WAS RESIDENTIAL IN THE YEAR 2011
# assuming that the gender and age breakdowns can simply be put together and applied.








# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# in care conviction rates # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# making estimates of earlier years to fill back to 2010 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


care_convicted <- care_convicted_15to22 %>% 
  ungroup() %>% 
  select(end_period_year, pc_convicted) %>% 
  add_row(end_period_year = 2014, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2013, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2012, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2011, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) %>% 
  add_row(end_period_year = 2010, pc_convicted = care_convicted_15to22 %>% 
            filter(end_period_year < 2020) %>% 
            summarise(pc_convicted = mean(pc_convicted)) %>% 
            select(pc_convicted) %>% 
            unlist()) 

save(care_convicted, file = "output/data/processed/care_convicted.Rdata")










# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # COME BACK TO THIS - FIGURING OUT ATTRIBUTING PARTS TO POVERTY # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# https://lginform.local.gov.uk/reports/lgastandard?mod-metric=891&mod-area=E08000025&mod-group=AllMetropolitanBoroughLaInCountry_England&mod-type=namedComparisonGroup&mod-period=15&mod-groupType=namedComparisonGroup
# https://www.basw.co.uk/system/files/resources/basw_82151-10_0.pdf <- comes from here
# number of children who were LAC on 31st March 2015 per 10,000 children aged 0-17, by deprivation decile, England sample
LAC_rate <- c(15/10000, 17/10000, 25/10000, 34/10000, 34/10000, 47/10000, 64/10000, 75/10000, 100/10000, 159/10000, 62/10000)

names(LAC_rate) <- c("IMD decile 10", "IMD decile 9", "IMD decile 8", 
                     "IMD decile 7", "IMD decile 6", "IMD decile 5", 
                     "IMD decile 4", "IMD decile 3", "IMD decile 2", 
                     "IMD decile 1", "English average")

LAC_rate <-stack(LAC_rate)

LAC_rate %>% 
  ggplot() +
  geom_bar(aes(y = values, x = ind),
           stat = "identity")

# what combinations of LAC rates in poverty:not in birmingham across time adds up
# to the correct overall average LAC rate?

# over in process_poverty we said (lol) that in 2015 
# child poverty in england was 0.1447838 pc
# cp in birm was 0.2536112 pc





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # NOT SURE WHAT THIS WAS FOR # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


lac <- care_11to22_age %>%
  filter(level == "Birmingham",
         age %in% c("10-15", "16+"),
         end_period_year <= 2020) %>% 
  group_by(end_period_year) %>% 
  summarise(care = sum(count)) %>% 
  full_join(population %>% 
              filter(end_period_year >= 2010) %>% 
              group_by(end_period_year) %>% 
              summarise(population = sum(count))) %>% 
  mutate(lac_rate = care/population)

lac %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = lac_rate),
           stat = "identity", position = "stack")

care_11to22_age %>% 
  filter(level == "Birmingham") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = age),
           stat = "identity", position = "stack")


care_10to22 %>% 
  filter(level == "Birmingham") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = period_length),
           stat = "identity", position = "dodge")


