load("/Users/katehayes/CLmodR/output/data/cleaned/neet_16to23_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/neet_12to23_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/part_18to23_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/part_type_18to23.Rdata")

gender_pc <- neet_16to23_age_gender %>% 
  filter(gender != "Unknown",
         neet == "NEET") %>% 
  ungroup() %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  group_by(gender, age) 
 %>% 
  summarise(pc = mean(pc))

ok!! essentially 60:40



gender_pc <- neet_16to23_age_gender %>% 
  filter(gender != "Unknown") %>% 
  group_by(end_period_year, age, gender) %>% 
  mutate(neet_rate = count/sum(count)) %>% 
  ungroup() %>% 
  bind_rows(data_frame(end_period_year = c(2017, 2017, 2017, 2017),
                       gender = c("Girls", "Girls", "Boys", "Boys"),
                       age = c(16,17,16,17),
                       neet = c("NEET", "NEET", "NEET", "NEET"))) %>% 
  bind_rows(data_frame(end_period_year = c(2017, 2017, 2017, 2017),
                       gender = c("Girls", "Girls", "Boys", "Boys"),
                       age = c(16,17,16,17),
                       neet = c("Not NEET", "Not NEET", "Not NEET", "Not NEET"))) %>% 
  group_by(age, gender, neet) %>% 
  arrange(end_period_year) %>% 
  mutate(neet_rate = na.approx(neet_rate))
  
  
gen_mult_neet <- gender_pc %>% 
  select(-count) %>% 
  pivot_wider(names_from = gender,
              values_from = neet_rate) %>% 
  mutate(gen_mult = Boys/Girls) %>% 
  filter(neet == "NEET") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = gen_mult)) +
  facet_grid(~age)
gen_mult_neet
ggsave(filename = "output/graphs/gen_mult_neet.png", gen_mult_neet)

  
neet_rate <- neet_12to23_age %>% 
  group_by(end_period_year, age) %>% 
  mutate(neet_rate = count/sum(count)) %>% 
  ungroup() %>% 
  bind_rows(data_frame(end_period_year = c(2017, 2017, 2017, 2017),
                       age = c(16,17,16,17),
                       neet = c("NEET", "NEET", "Not NEET", "Not NEET"))) %>% 
  group_by(age, neet) %>% 
  arrange(end_period_year) %>% 
  mutate(neet_rate = na.approx(neet_rate)) %>% 
  filter(neet == "NEET")


neet_rate_bygen <- gender_pc %>% 
  filter(neet == "NEET") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = neet_rate, group = gender, colour = gender)) +
  geom_line(data = neet_rate, aes(x = end_period_year, y = neet_rate)) +
  facet_grid(~age)
neet_rate_bygen
ggsave(filename = "output/graphs/neet_rate_bygen.png", neet_rate_bygen)



check <- gender_pc %>% 
  select(-count) %>% 
  pivot_wider(names_from = gender,
              values_from = neet_rate) %>% 
  mutate(gen_mult = Boys/Girls) %>% 
  filter(neet == "NEET") %>% 
  group_by(age) %>% 
  summarise(gen_mult = mean(gen_mult))
# 1.4 and 1.3



neet <- neet_12to23_age %>% 
  group_by(end_period_year, age) %>% 
  mutate(neet_rate = count/sum(count)) %>% 
  ungroup() %>% 
  bind_rows(data_frame(end_period_year = c(2017, 2017, 2017, 2017),
                       age = c(16,17,16,17),
                       neet = c("NEET", "NEET", "Not NEET", "Not NEET"))) %>% 
  group_by(age, neet) %>% 
  arrange(end_period_year) %>% 
  mutate(neet_rate = na.approx(neet_rate)) %>% 
  filter(neet == "NEET") %>% 
  select(-c(count, neet)) %>% 
  full_join(gender_pc %>% 
              filter(neet == "NEET") %>% 
              select(-c(count, neet)) %>% 
              pivot_wider(names_from = gender,
                          values_from = neet_rate)) %>% 
  full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(16:17),
                     end_period_year >= 2010) %>% 
              group_by(end_period_year, gender, age) %>% 
              summarise(pop = sum(count)) %>% 
              pivot_wider(names_from = gender,
                          values_from = pop) %>% 
              rename(Boys_pop = Boys,
                     Girls_pop = Girls)) %>% 
  mutate(Boys = ifelse((end_period_year < 2016 & age == 16),
                       (neet_rate*(Boys_pop + Girls_pop)*1.4*Boys_pop/(1.4*Boys_pop + Girls_pop))/Boys_pop,
                       Boys),
         Boys = ifelse((end_period_year < 2016 & age == 17),
                       (neet_rate*(Boys_pop + Girls_pop)*1.3*Boys_pop/(1.3*Boys_pop + Girls_pop))/Boys_pop,
                       Boys),
         Girls = ifelse((end_period_year < 2016 & age == 16),
                        (neet_rate*(Boys_pop + Girls_pop)*Girls_pop/(1.4*Boys_pop + Girls_pop))/Girls_pop,
                       Girls),
         Girls = ifelse((end_period_year < 2016 & age == 17),
                       (neet_rate*(Boys_pop + Girls_pop)*Girls_pop/(1.3*Boys_pop + Girls_pop))/Girls_pop,
                       Girls)) %>% 
#   neet %>%
#     ggplot() +
#     geom_line(aes(x = end_period_year, y = neet_rate)) +
#     geom_line(aes(x = end_period_year, y = Boys, colour = "Boys")) +
#     geom_line(aes(x = end_period_year, y = Girls, colour = "Girls")) +
#     facet_grid(~age)
# # WEIRD SPIKE IN 16 YEAR OLDS IN 2015....
  group_by(age) %>% 
  arrange(end_period_year) %>% 
  mutate(Girls = ifelse(end_period_year == 2010, lead(Girls), Girls),
         Boys = ifelse(end_period_year == 2010, lead(Boys), Boys)) %>% 
  mutate(Boys_NEET = Boys_pop*Boys,
         `Boys_Not NEET` = Boys_pop - Boys_NEET,
         Girls_NEET = Girls_pop*Girls,
         `Girls_Not NEET` = Girls_pop - Girls_NEET) %>% 
  filter(end_period_year <= 2020) %>% 
  select(c(end_period_year, age, 
           starts_with("Girls_N"), starts_with("Boys_N"))) %>% 
  pivot_longer(c(starts_with("Girls"), starts_with("Boys")), 
               names_to = c("gender", ".value"),
               names_sep="_") %>% 
  pivot_longer(c(starts_with("N")),
               names_to = "neet",
               values_to = "count")
                        
                        
                        
                        
# SO NOW WE NEED TO ADD IN POVERTY AND CARE
# could do that,
# then check whether with the transition from pru percentages you got, see whether that all works


  # WORK OUT POVERTY PCS

pov_neet <- pop_estimate_01to20_age_gender %>%
  filter(level == "Birmingham",
         age %in% c(16:17),
         end_period_year >= 2010) %>% 
  group_by(end_period_year, gender, age) %>% 
  summarise(pop = sum(count)) %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate) %>% 
              filter(end_period_year %in% c(2010:2020))) %>% 
  full_join(neet %>% 
              ungroup() %>% 
              group_by(end_period_year, gender, age) %>% 
              mutate(neet_rate = count/sum(count)) %>% 
              filter(neet == "NEET") %>% 
              select(-c(neet, count))) %>% 
  mutate(count_neet = neet_rate*pop,
         incl_count = pop*(1-spov_rate),
         excl_count = pop*spov_rate,
         incl_neet = count_neet*(1-spov_rate)/((1-spov_rate) + 2.5*spov_rate),
         excl_neet = count_neet*2.5*spov_rate/((1-spov_rate) + 2.5*spov_rate)) %>% 
  select(c(end_period_year, gender, age, incl_count, excl_count, incl_neet, excl_neet)) %>% 
  pivot_longer(c(starts_with("incl"), starts_with("excl")), 
               names_to = c("state", ".value"),
               names_sep="_",
               values_to = "count") %>% 
  mutate(state = ifelse(state == "incl", "Not in poverty", "In poverty")) %>% 
  mutate(neet_rate = neet/count)


care_pov_neet <- care_pov %>% 
  filter(age >= 16) %>% 
  pivot_wider(names_from = care,
              values_from = count) %>% 
  full_join(pov_neet %>% 
              select(-c(count, neet))) %>% 
  mutate(tot = Never + Prior + Residential + `Not residential`) %>%
  mutate(neetcount_Prior = (neet_rate*tot)*3*Prior/(3*Prior + 5*(Residential + `Not residential`) + Never),
         neetcount_Residential = (neet_rate*tot)*5*Residential/(3*Prior + 5*(Residential + `Not residential`) + Never),
         `neetcount_Not residential` = (neet_rate*tot)*5*`Not residential`/(3*Prior + 5*(Residential + `Not residential`) + Never),
         neetcount_Never = neet_rate*tot - `neetcount_Not residential` - neetcount_Residential - neetcount_Prior) %>% 
  select(-neet_rate, -tot) %>% 
  rename(tot_Never = Never,
         tot_Prior = Prior,
         tot_Residential = Residential,
         `tot_Not residential` = `Not residential`) %>% 
  pivot_longer(c(starts_with("tot"), starts_with("neetcount")), 
               names_to = c("name", ".value"),
               names_sep="_") %>% 
  pivot_longer(c(Prior,Residential, `Not residential`, Never),
               names_to = "care",
               values_to = "count") %>% 
  pivot_wider(names_from = name,
              values_from = count) %>% 
  mutate(neet_rate = as.numeric(neetcount)/as.numeric(tot)) %>% 
  ungroup() %>% 
  group_by(gender, age, state, care) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_rate = smooth.spline(end_period_year, neet_rate, lambda = 0.001)$y) %>% # 0.0001 is decent
  # maybe its better to smooth out the insane spike,... i just dont know...
  mutate(smooth_count = tot*smooth_rate)
  
 
care_pov_neet %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = neet_rate, group = care, colour = care)) +
  geom_line(aes(x=end_period_year, y = smooth_rate, group = care, colour = care)) +
  # geom_line(aes(x=end_period_year, y = neetcount, group = care, colour = care)) +
  # geom_line(aes(x=end_period_year, y = smooth_count, group = care, colour = care)) +
  facet_grid(rows = vars(state),
             cols = vars(age)) 

care_pov_neet %>% 
  group_by(end_period_year, state, care) %>% 
  summarise(neet = sum(smooth_count),
            tot = sum(tot)) %>% 
  mutate(neet_rate = neet/tot) %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = neet_rate, group = state, colour = state)) +
  facet_grid(~care)


care_pov_neet %>% 
  group_by(end_period_year, state, care) %>% 
  summarise(neet = sum(smooth_count),
            tot = sum(tot)) %>% 
  mutate(neet_rate = neet/tot) %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = neet_rate, group = care, colour = care)) +
  facet_grid(~state)

# 27\% 13\%  fsm neet to mainstream neet
# disadvantaged about 50\% more likely to be neet
# so between 50pc and 100pc more then, are the two estimates


# and then CARE -
#   av from 2016 is 30pc of 17to18 yo care leavers neet, lets say 35pc of 19to20 yos
care_pov_neet %>% 
  filter(care %in% c("Residential", "Not residential")) %>% 
  group_by(end_period_year, age) %>% 
  summarise(neet = sum(smooth_count),
            tot = sum(tot)) %>% 
  mutate(neet_rate = neet/tot) %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = neet_rate, group = age, colour = age))
# this is currently too low


care_pov_neet %>% 
  group_by(end_period_year, state) %>% 
  summarise(neet = sum(neetcount),
            tot = sum(tot)) %>% 
  mutate(neet_rate = neet/tot) %>% 
  # filter(state == "In poverty") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = neet_rate, group = state, colour = state))




# REALLY NOT SURE ABOUT THIS BUT LETS LEAVE IT HERE UNTILL WE CHECK WHETHER THE TRANSITIONS
# FROM PRU TO NEET ETC WOULD WORK WITH THIS NEET DIST
care_pov_neet %>% 
  group_by(end_period_year, gender, age, care, state) %>% 
  summarise(neet = sum(smooth_count),
            tot = sum(tot)) %>% 
  mutate(neet_rate = neet/tot) %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = neet_rate, group = care, colour = care)) +
  facet_grid(rows = vars(age),
             cols = vars(state)) 



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # from recently but still the previous version # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


neet <- neet_12to23_age %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  mutate(boy_neet = 0.6*NEET,
         girl_neet = 0.4*NEET) %>% 
  full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(16:17),
                     end_period_year >= 2010) %>%
              pivot_wider(names_from = gender,
                          values_from = count) %>% 
              mutate(boy_pc = Boys / (Boys + Girls)) %>% 
              select(c(end_period_year, age, boy_pc))) %>% 
  mutate(boy_tot = (NEET+`Not NEET`)*boy_pc,
         boy_not_neet = boy_tot - boy_neet,
         girl_not_neet = `Not NEET` - boy_not_neet) %>% 
  select(c(end_period_year, age, starts_with("boy_"), starts_with("girl_"))) %>% 
  select(-c(boy_tot, boy_pc))%>% 
  pivot_longer(c(starts_with("boy_"), starts_with("girl_")),
               names_to = "neet",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("boy", neet), "Boys", "Girls"),
         neet = ifelse(grepl("not", neet), "Not NEET", "NEET"))%>% 
  filter(end_period_year <= 2020,
         end_period_year >= 2011,
         end_period_year != 2017) %>% 
  pivot_wider(names_from = neet,
              values_from = count) %>% 
  mutate(pc_neet = NEET/(`Not NEET`+NEET)) %>% 
  ungroup() %>% 
  group_by(gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc_neet, lambda = 0.0001)$y)

neet %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_neet, group = gender, colour = gender)) +
  geom_line(aes(x = end_period_year, y = smooth_pc, group = gender, colour = gender)) +
  facet_wrap(~age)
# seems fine



# neet <- neet_12to23_age %>% 
#   mutate(Boys = 0.6*count,
#          Girls = 0.4*count) %>% 
#   select(-count) %>% 
#   pivot_longer(c(Boys, Girls),
#                names_to = "gender",
#                values_to = "count") %>% 
#   ungroup() %>% 
#   group_by(gender, age, neet) %>% 
#   arrange(end_period_year) %>% 
#   mutate(smooth_count = smooth.spline(end_period_year, count)$y)

mod_b16 <- lm(smooth_pc ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Boys",
                       age == 16))

b16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
                  age = c(16, 16))

b16$smooth_pc <- predict(mod_b16, newdata = b16)


mod_b17 <- lm(smooth_pc ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Boys",
                       age == 17))

b17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
                  age = c(17, 17))

b17$smooth_pc <- predict(mod_b17, newdata = b17)

mod_g16 <- lm(smooth_pc ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Girls",
                       age == 16))

g16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
                  age = c(16, 16))

g16$smooth_pc <- predict(mod_g16, newdata = g16)

mod_g17 <- lm(smooth_pc ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Girls",
                       age == 17))

g17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
                  age = c(17, 17))

g17$smooth_pc <- predict(mod_g17, newdata = g17)



# 
# 
# 
# 
# mod_b16 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                        filter(end_period_year <= 2016,
#                               gender == "Boys",
#                               age == 16, 
#                               neet == "NEET"))
# 
# b16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
#                   age = c(16, 16), neet = c("NEET", "NEET"))
# 
# b16$smooth_count <- predict(mod_b16, newdata = b16)
# 
# 
# mod_b17 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Boys",
#                        age == 17, 
#                        neet == "NEET"))
# 
# b17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
#                   age = c(17, 17), neet = c("NEET", "NEET"))
# 
# b17$smooth_count <- predict(mod_b17, newdata = b17)
# 
# mod_g16 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Girls",
#                        age == 16, 
#                        neet == "NEET"))
# 
# g16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
#                   age = c(16, 16), neet = c("NEET", "NEET"))
# 
# g16$smooth_count <- predict(mod_g16, newdata = g16)
# 
# mod_g17 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Girls",
#                        age == 17), 
#               neet == "NEET")
#   
# g17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
#                   age = c(17, 17), neet = c("NEET", "NEET"))
# 
# g17$smooth_count <- predict(mod_g17, newdata = g17)
# 
# 
# 
# 
# totmod_b16 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Boys",
#                        age == 16, 
#                        neet == "Not NEET"))
# 
# totb16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
#                   age = c(16, 16), neet = c("Not NEET", "Not NEET"))
# 
# totb16$smooth_count <- predict(totmod_b16, newdata = totb16)
# 
# 
# totmod_b17 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Boys",
#                        age == 17, 
#                        neet == "Not NEET"))
# 
# totb17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
#                   age = c(17, 17), neet = c("Not NEET", "Not NEET"))
# 
# totb17$smooth_count <- predict(totmod_b17, newdata = totb17)
# 
# totmod_g16 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Girls",
#                        age == 16, 
#                        neet == "Not NEET"))
# 
# totg16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
#                   age = c(16, 16), neet = c("Not NEET", "Not NEET"))
# 
# totg16$smooth_count <- predict(totmod_g16, newdata = totg16)
# 
# totmod_g17 <- lm(smooth_count ~ end_period_year, data = neet %>% 
#                 filter(end_period_year <= 2016,
#                        gender == "Girls",
#                        age == 17), 
#               neet == "Not NEET")
# 
# totg17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
#                   age = c(17, 17), neet = c("Not NEET", "Not NEET"))
# 
# totg17$smooth_count <- predict(totmod_g17, newdata = totg17)
# 





neet_smooth <-  bind_rows(b16, b17, g16, g17) %>% 
  # bind_rows(totb16, totb17, totg16, totg17) %>% 
  filter(end_period_year != 2011) %>% 
  bind_rows(neet %>% 
              select(c(end_period_year, age, gender, pc_neet)) %>% 
              rename(smooth_pc = pc_neet)) %>% 
  bind_rows(data_frame(end_period_year = c(2017, 2017, 2017, 2017),
                       gender = c("Boys", "Boys", "Girls", "Girls"),
                       age = c(16,17,16,17))) %>% 
  ungroup() %>% 
  # select(-count) %>% 
  group_by(gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = na.approx(smooth_pc)) %>% 
  full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(16:17),
                     end_period_year >= 2010) %>% 
              select(c(end_period_year, gender, age, count))) %>% 
  mutate(NEET = count*smooth_pc,
         `Not NEET` = count*(1-smooth_pc)) %>% 
  select(-c(count, smooth_pc)) %>% 
  pivot_longer(c(NEET, `Not NEET`),
               names_to = "neet",
               values_to = "count")
  


neet_smooth %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = neet),
           stat = "identity", position = "fill") +
  facet_wrap(~interaction(age, gender))

# check_neet <- neet_smooth %>% 
#   group_by(end_period_year, gender, age) %>% 
#   summarise(neet_count = sum(smooth_count)) %>% 
#   full_join(pop_estimate_01to20_age_gender %>%
#                           filter(level == "Birmingham",
#                                  age %in% c(16:17),
#                                  end_period_year >= 2010) %>%
#                           group_by(end_period_year, gender, age) %>%
#                           summarise(pop_count = sum(count))) %>% 
#   mutate(check = pop_count - neet_count) %>% 
#   full_join(neet_16to23_age_gender %>% 
#               filter(gender != "Unknown") %>% 
#               ungroup() %>% 
#               group_by(end_period_year, age, gender) %>% 
#               summarise(gen_count = sum(count))) %>% 
#   mutate(check2 =  pop_count - gen_count)



# %>% 
  # full_join(pop_estimate_01to20_age_gender %>%
  #             filter(level == "Birmingham",
  #                    age %in% c(16:17),
  #                    end_period_year >= 2010) %>%
  #             group_by(end_period_year, gender, age) %>%
  #             summarise(pop = sum(count))) %>% 
  # mutate(pc = smooth_count/ pop) %>% 
  # left_join(smooth_poverty %>% 
  #             select(c(end_period_year, spov_rate))) %>% 
  # mutate(pov = spov_rate*pop,
  #        not_pov = (1- spov_rate)*pop,
  #        pov_share = 0.27*pov,
  #        not_pov_share = 0.13*not_pov,
  #        check = pov_share + not_pov_share - smooth_count) 


neet <- neet_smooth %>% 


mutate(`FSM eligible`= 0.675*smooth_count,
       `Not FSM eligible` = 0.325*smooth_count) %>% 
  select(-smooth_count) %>% 
  pivot_longer(c(`FSM eligible`, `Not FSM eligible`),
               names_to = "fsm",
               values_to = "neet") %>% 
  full_join(school_pru) %>% 
  mutate(neet = ifelse(is.na(neet), 0, neet)) %>% 
  filter(end_period_year <= 2020) 
  # THE PROBLEM IS THAT THE POPULATION IS DIFFERENT FROM THE TOTAL COHORT
  # CAPTURED IN THE SCHOOLS SYSTEMS DATA
  # full_join(pop_estimate_01to20_age_gender %>%
  #             filter(level == "Birmingham",
  #                    age %in% c(10:17),
  #                    end_period_year >= 2010) %>%
  #             group_by(end_period_year, gender, age) %>%
  #             summarise(pop = sum(count)) %>% 
  #             left_join(smooth_poverty %>% 
  #                         select(c(end_period_year,spov_rate))) %>% 
  #             mutate(pov = pop*spov_rate,
  #                    not_pov = pop - pov)) %>% 
  # # WHAT IF WE JUST SAY FSM ELIGIBLE IS THE SAME AS POVERTY.....
  # # NOT GREAT BUT LETS GO FOR NOW
  # mutate(pop = ifelse(fsm == "FSM eligible", pov, not_pov)) %>% 
  # select(-c(pov, not_pov, spov_rate)) %>% 
  # mutate(check = pop - PRU - `Not PRU` - neet) %>% 
  # arrange(end_period_year, age, gender, fsm)




neet %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = smooth_count, fill = gender),
           stat = "identity", position = "stack") +
  facet_wrap(~age)

# LOOKS CRAZY BUT AT A GLANCE AT THE ENGLAND LEVEL TRENDS IT COULD BE RIGHT


part <- part_18to23_age_gender %>% 
  filter(gender != "Unknown",
         part == "Not participating") %>% 
  select(-part) %>% 
  rename(`Not participating` = count)




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# oldish# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# 
# # NO NO NO IN ALL OF THE BELOW I AM ASSUMINUG FROM 2016
# # BIT I HAVE INFO ON EARLIER - AND THE TREND CHANGES
# 
# smooth_neet <- neet_16to23_age_gender %>% 
#   filter(gender != "Unknown") %>% 
#   ungroup() %>% 
#   group_by(end_period_year, gender, age) %>% 
#   mutate(pc = count/sum(count)) %>% 
#   ungroup() %>% 
#   group_by(gender, age, neet) %>% 
#   arrange(end_period_year) 
# 
# mod_neet_b16 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
#                      filter(neet == "NEET",
#                             gender == "Boys",
#                             age == 16))
# 
# mod_neet_g16 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
#                      filter(neet == "NEET",
#                             gender == "Girls",
#                             age == 16))
# 
# b16 <- smooth_neet %>% 
#   ungroup() %>% 
#   bind_rows(smooth_neet %>% 
#               ungroup() %>% 
#               mutate(end_period_year = end_period_year - 8,
#                    count = NA,
#                    pc = NA)) %>%
#               filter(end_period_year >= 2010,
#                      neet == "NEET",
#                      gender == "Boys",
#                      age == 16)
# 
# b16$pc_predict <- predict(mod_neet_b16, newdata = b16)
# 
# g16 <- smooth_neet %>% 
#   ungroup() %>% 
#   bind_rows(smooth_neet %>% 
#               ungroup() %>% 
#               mutate(end_period_year = end_period_year - 8,
#                      count = NA,
#                      pc = NA)) %>%
#   filter(end_period_year >= 2010,
#          neet == "NEET",
#          gender == "Girls",
#          age == 16)
# 
# g16$pc_predict <- predict(mod_neet_g16, newdata = g16)
# 
# 
# mod_neet_b17 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
#                      filter(neet == "NEET",
#                             gender == "Boys",
#                             age == 17))
# 
# mod_neet_g17 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
#                      filter(neet == "NEET",
#                             gender == "Girls",
#                             age == 17))
# 
# b17 <- smooth_neet %>% 
#   ungroup() %>% 
#   bind_rows(smooth_neet %>% 
#               ungroup() %>% 
#               mutate(end_period_year = end_period_year - 8,
#                      count = NA,
#                      pc = NA)) %>%
#   filter(end_period_year >= 2010,
#          neet == "NEET",
#          gender == "Boys",
#          age == 17)
# 
# b17$pc_predict <- predict(mod_neet_b17, newdata = b17)
# 
# g17 <- smooth_neet %>% 
#   ungroup() %>% 
#   bind_rows(smooth_neet %>% 
#               ungroup() %>% 
#               mutate(end_period_year = end_period_year - 8,
#                      count = NA,
#                      pc = NA)) %>%
#   filter(end_period_year >= 2010,
#          neet == "NEET",
#          gender == "Girls",
#          age == 17)
# 
# g17$pc_predict <- predict(mod_neet_g17, newdata = g17)
# 
# 
