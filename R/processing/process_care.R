
# loading in data made in the cleaning scripts
load("/Users/katehayes/CLmodR/output/data/cleaned/care_10to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_11to22_placement.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_duration_14to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/care_convicted_15to22.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/care_cum_pc.Rdata")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# for care duration  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# making estimates of earlier years to fill back to 2010 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

mod1 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Residential"))

est_r <- data.frame(end_period_year = rep(c(2010:2013)),
                     residential = rep(c("Residential"), times = 4))
est_r$mean_dur = predict(mod1, newdata = est_r)



mod2 <- lm(mean_dur ~ end_period_year, data = care_duration_14to22 %>%
             filter(residential == "Not residential"))

est_nr <- data.frame(end_period_year = rep(c(2010:2013)),
                    residential = rep(c("Not residential"), times = 4))
est_nr$mean_dur = predict(mod2, newdata = est_nr)



care_duration <- care_duration_14to22 %>% 
  bind_rows(est_r, est_nr) %>% 
  arrange(end_period_year)

save(care_duration, file = "output/data/processed/care_duration.Rdata")

care_duration %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = mean_dur, fill = residential),
           stat = "identity", position = "dodge")

smooth_care_duration <- care_duration %>% 
  group_by(residential) %>% 
  mutate(mean_dur = smooth.spline(end_period_year, mean_dur)$y)


smooth_care_duration %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = mean_dur, fill = residential),
           stat = "identity", position = "dodge")

# changed this to the smoothed version but could as easily go back
endnr <- smooth_care_duration %>% 
  ungroup() %>% 
  filter(residential == "Not residential",
         end_period_year <= 2020) %>% 
  arrange(end_period_year) %>% 
  select(mean_dur) %>% 
  mutate(mean_dur = 1/(mean_dur/7)) %>% 
  rename(Boys = mean_dur) %>% 
  mutate(Girls = Boys) %>% 
  as.matrix()

endres <- smooth_care_duration %>% 
  ungroup() %>% 
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







care_rate_by_age <- care_11to22_age %>% 
  filter(level == "Birmingham", 
         age %in% c("10-15", "16+"),
         end_period_year <= 2020) %>%
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2022)) %>% 
              mutate(age = ifelse(age >=16, "16+", "10-15")) %>% 
              group_by(end_period_year, age) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop)  %>% 
  ungroup() %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.003)$y) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = age, colour = age)) +
  geom_line(aes(x = end_period_year, y = smooth_pc, group = age, colour = age))
care_rate_by_age

ggsave(filename = "output/graphs/care_rate_by_age.png", care_rate_by_age)
# so .... care of 16 plus has definitely been climbing much faster than younger kids

care_age_pc <- care_11to22_age %>% 
  filter(level == "Birmingham", 
         age %in% c("10-15", "16+"),
         end_period_year <= 2020) %>%
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2022)) %>% 
              mutate(age = ifelse(age >=16, "16+", "10-15")) %>% 
              group_by(end_period_year, age) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop)  %>% 
  ungroup() %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.003)$y) %>% 
  select(end_period_year, age, smooth_pc) %>% 
  pivot_wider(names_from = age, values_from = smooth_pc)


     
               



# WHAT IF WE ASSUME THAT THE GENDER RELATION IS THE SAME NO MATTER THE AGE???
care_rate_by_gender <- care_11to22_gender %>%
  filter(level == "Birmingham", 
         end_period_year <= 2020) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age <= 17,
                     end_period_year %in% c(2011:2022)) %>% 
              group_by(end_period_year, gender) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop) %>% 
  ungroup() %>% 
  group_by(gender) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = gender, colour = gender)) +
  geom_line(aes(x = end_period_year, y = smooth_pc, group = gender, colour = gender))
care_rate_by_gender

ggsave(filename = "output/graphs/care_rate_by_gender.png", care_rate_by_gender)


gen_ratio_care <- care_11to22_gender %>%
  filter(level == "Birmingham", 
         end_period_year <= 2020) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age <= 17,
                     end_period_year %in% c(2011:2022)) %>% 
              group_by(end_period_year, gender) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop) %>% 
  ungroup() %>% 
  group_by(gender) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>% 
  select(end_period_year, gender, smooth_pc) %>% 
  pivot_wider(names_from = gender, values_from = smooth_pc) %>% 
  mutate(boy2girl = Boys/Girls) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = boy2girl))
gen_ratio_care
ggsave(filename = "output/graphs/gen_ratio_care.png", gen_ratio_care)


care_gender_pc <- care_11to22_gender %>%
  filter(level == "Birmingham", 
         end_period_year <= 2020) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age <= 17,
                     end_period_year %in% c(2011:2022)) %>% 
              group_by(end_period_year, gender) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop) %>% 
  ungroup() %>% 
  group_by(gender) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>%
  select(end_period_year, gender, smooth_pc) %>% 
  pivot_wider(names_from = gender, values_from = smooth_pc)



care_rate_byres <- care_11to22_placement %>%
  filter(level == "Birmingham", 
         end_period_year <= 2020) %>% 
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                   "Residential schools",
                                   "Other residential settings"),
                  "Residential",
                  "Not residential")) %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  mutate(tot = Residential +`Not residential`) %>% 
  full_join(care_11to22_age %>%
              filter(level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year) %>%
              mutate(tot = sum(count)) %>%
              mutate(pc = count / tot) %>%
              ungroup() %>%
              filter(age %in% c("10-15", "16+")) %>%
              group_by(end_period_year) %>% 
              summarise(pc = sum(pc))) %>% 
  mutate(tenplus_tot = tot*pc,
         tenplus_res = 0.95*Residential,
         tenplus_nres = tenplus_tot-tenplus_res) %>% 
  select(end_period_year, tenplus_res, tenplus_nres) %>% 
  pivot_longer(-end_period_year,
               names_to = "residential",
               values_to = "count") %>% 
  mutate(residential = ifelse(grepl("nres", residential),
                              "Not residential", "Residential")) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2022)) %>% 
              group_by(end_period_year) %>% 
              summarise(pop = sum(count))) %>%
  mutate(pc = count/pop) %>% 
  ungroup() %>% 
  group_by(residential) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = residential, colour = residential)) +
  geom_line(aes(x = end_period_year, y = smooth_pc, group = residential, colour = residential))
care_rate_byres
ggsave(filename = "output/graphs/care_rate_byres.png", care_rate_byres)




care <- care_11to22_placement %>%
  filter(level == "Birmingham", 
         end_period_year <= 2020) %>% 
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                   "Residential schools",
                                   "Other residential settings"),
                  "Residential",
                  "Not residential")) %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  mutate(tot = Residential +`Not residential`) %>% 
  full_join(care_11to22_age %>%
              filter(level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year) %>%
              mutate(tot = sum(count)) %>%
              mutate(pc = count / tot) %>%
              ungroup() %>%
              filter(age %in% c("10-15", "16+")) %>%
              group_by(end_period_year) %>% 
              summarise(pc = sum(pc))) %>% 
  mutate(tenplus_tot = tot*pc,
         tenplus_res = 0.95*Residential, # ASSUMPTION - I read somewhere that like 95% of res care was over 10...find where 
         tenplus_nres = tenplus_tot-tenplus_res) %>% 
  select(end_period_year, tenplus_tot, tenplus_res, tenplus_nres) %>% 
  # mutate(boy_res = tenplus_res*0.63, #you've got the source for this ASSUMPTION in the doc
  #        girl_res =  tenplus_res*0.27) %>% 
  # pivot_longer(-end_period_year,
  #              names_to = "residential",
  #              values_to = "count") %>% 
  # mutate(residential = ifelse(grepl("nres", residential),
  #                             "Not residential", "Residential")) 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2020)) %>% 
              group_by(end_period_year, gender) %>% 
              summarise(count = sum(count)) %>% 
              pivot_wider(names_from = gender,
                          values_from = count)) %>% 
  full_join(care_11to22_gender %>%
               filter(level == "Birmingham", 
                      end_period_year <= 2020) %>% 
               full_join(pop_estimate_01to20_age_gender %>% 
                           filter(level == "Birmingham",
                                  age <= 17,
                                  end_period_year %in% c(2011:2022)) %>% 
                           group_by(end_period_year, gender) %>% 
                           summarise(pop = sum(count))) %>%
               mutate(pc = count/pop) %>% 
               select(end_period_year, gender, pc) %>% 
               pivot_wider(names_from = gender, values_from = pc) %>% 
              mutate(boy2girl = Boys/Girls) %>% 
              select(end_period_year, boy2girl)) %>% 
  # having some difficulty because if i bump boys up in rescare 
  # but keep the same gender ratio then...
  # it will artificially depress boys in non-res....
  # maybe the best thing is to keep the correct ratio in non-res and then
  # just change the ratio in res
  mutate(maybe_res_boy2girl = boy2girl*1.4,#trying to say that the gender ratio can follow the general trend
    # boy2girl = ifelse(boy2girl < 1, 1, boy2girl),
         maybe_bpc_tot = Boys*boy2girl/(Boys*boy2girl+Girls),
         maybe_bpc_res = Boys*maybe_res_boy2girl/(Boys*maybe_res_boy2girl+Girls)) %>% 
  mutate(boy_res = maybe_bpc_res*tenplus_res,
         girl_res = (1-maybe_bpc_res)*tenplus_res,
         boy_nres = maybe_bpc_tot*tenplus_nres,
         girl_nres = (1-maybe_bpc_tot)*tenplus_nres) %>% 
  # ONE TOTAL IS COMING FROM RESIDENTIAL THE OTHER FROM AGE - PROBABLY THERE'S A SMALL DIFF IN THE UNDERLYING DATA
  # select(end_period_year, boy_nres, boy_res, girl_nres, girl_res, tenplus_res, tenplus_nres) %>% 
  # full_join(care_11to22_age %>% 
  #             filter(level == "Birmingham", 
  #                    age %in% c("10-15", "16+"),
  #                    end_period_year <= 2020) %>%
  #             select(end_period_year, age, count) %>% 
  #             pivot_wider(names_from = age,
  #                         values_from = count)) %>% 
  # mutate(check1 = boy_nres + boy_res + girl_nres + girl_res,
  #        check2 = `10-15` + `16+`,
  #        check3 = tenplus_res + tenplus_nres)
  select(end_period_year, boy_nres, boy_res, girl_nres, girl_res) %>% 
  # so we're putting the age on last
  # lets say no relation between age & gender
  # but yeah age does vary across res types
  # full_join(pop_estimate_01to20_age_gender %>% 
  #             filter(level == "Birmingham",
  #                    age %in% c(10:17),
  #                    end_period_year >= 2011) %>% 
  #             group_by(end_period_year, gender, age) %>% 
  #             summarise(count = sum(count)) %>%
  #             pivot_wider(names_from = c(gender, age),
  #                         values_from = count))  %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year >= 2011) %>% 
              group_by(end_period_year, age) %>% 
              summarise(count = sum(count)) %>% 
              full_join(care_age_pc) %>% 
              mutate(pc = ifelse(age >=16, `16+`, `10-15`)) %>% 
              # mutate(smooth_pc = smooth.spline(age, pc, lambda = 0.08)$y) %>%
              mutate(pc_adj = ifelse(age == 10, pc, pc),
                     pc_adj = ifelse(age == 17, pc_adj - 0.05*pc_adj, pc_adj),
                     pc_adj = ifelse(age == 17 & end_period_year == 2020, pc_adj - 0.05*pc_adj, pc_adj)) %>%
              ungroup() %>%
              group_by(end_period_year) %>%
              arrange(age) %>%
              mutate(smooth_pc = smooth.spline(age, pc_adj, lambda = 0.8)$y) %>%
              select(end_period_year, age, smooth_pc) %>%
              pivot_wider(names_from = age,
                          values_from = smooth_pc)) %>%
              # select(end_period_year, age, pc) %>%
              # pivot_wider(names_from = age,
              #              values_from = pc) %>%
  mutate(`17to10` = `17`/`10`,
         `16to10` = `16`/`10`,
         `15to10` = `15`/`10`,
         `14to10` = `14`/`10`,
         `13to10` = `13`/`10`,
         `12to10` = `12`/`10`,
         `11to10` = `11`/`10`) %>%
  mutate(`res17to10` = 1.175*`17`/`10`,
         `res16to10` = 1.15*`16`/`10`,
         `res15to10` = 1.125*`15`/`10`,
         `res14to10` = 1.1*`14`/`10`,
         `res13to10` = 1.075*`13`/`10`,
         `res12to10` = 1.05*`12`/`10`,
         `res11to10` = 1.025*`11`/`10`) %>%
  # mutate(`res17to10` = `17`/`10`,
  #        `res16to10` = `16`/`10`,
  #        `res15to10` = `15`/`10`,
  #        `res14to10` = `14`/`10`,
  #        `res13to10` = `13`/`10`,
  #        `res12to10` = `12`/`10`,
  #        `res11to10` = `11`/`10`) %>%
  mutate(`17pc_res` = `17`*`res17to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `16pc_res` = `16`*`res16to10`/ (`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `15pc_res` = `15`*`res15to10`/ (`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `14pc_res` = `14`*`res14to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `13pc_res` = `13`*`res13to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `12pc_res` = `12`*`res12to10`/ (`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `11pc_res` = `11`*`res11to10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`),
         `10pc_res` = `10`/(`17`*`res17to10` + `16`*`res16to10` + `15`*`res15to10` +
              `14`*`res14to10` + `13`*`res13to10` + `12`*`res12to10` + `11`*`res11to10` + `10`)) %>% 
  mutate(girl_17res = girl_res*`17pc_res`,
         girl_16res = girl_res*`16pc_res`,
         girl_15res = girl_res*`15pc_res`,
         girl_14res = girl_res*`14pc_res`,
         girl_13res = girl_res*`13pc_res`,
         girl_12res = girl_res*`12pc_res`,
         girl_11res = girl_res*`11pc_res`,
         girl_10res = girl_res*`10pc_res`,
         boy_17res = boy_res*`17pc_res`,
         boy_16res = boy_res*`16pc_res`,
         boy_15res = boy_res*`15pc_res`,
         boy_14res = boy_res*`14pc_res`,
         boy_13res = boy_res*`13pc_res`,
         boy_12res = boy_res*`12pc_res`,
         boy_11res = boy_res*`11pc_res`,
         boy_10res = boy_res*`10pc_res`) %>% 
  mutate(`17pc` = `17`*`17to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `16pc` = `16`*`16to10`/ (`17`*`17to10` + `16`*`16to10` + `15`*`15to10` +`14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `15pc` = `15`*`15to10`/ (`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `14pc` = `14`*`14to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `13pc` = `13`*`13to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `12pc` = `12`*`12to10`/ (`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `11pc` = `11`*`11to10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` +`14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`),
         `10pc` = `10`/(`17`*`17to10` + `16`*`16to10` + `15`*`15to10` + `14`*`14to10` + `13`*`13to10` + `12`*`12to10` + `11`*`11to10` + `10`)) %>% 
mutate(girl_17 = (girl_res+girl_nres)*`17pc`,
         girl_16 = (girl_res+girl_nres)*`16pc`,
         girl_15 = (girl_res+girl_nres)*`15pc`,
         girl_14 = (girl_res+girl_nres)*`14pc`,
         girl_13 = (girl_res+girl_nres)*`13pc`,
         girl_12 = (girl_res+girl_nres)*`12pc`,
         girl_11 = (girl_res+girl_nres)*`11pc`,
         girl_10 = (girl_res+girl_nres)*`10pc`,
       # girl_17 = (girl_res*`17pc`+girl_nres*`17pc`,
       # girl_16 = (girl_res*`17pc`+girl_nres*`16pc`,
       # girl_15 = (girl_res*`17pc`+girl_nres*`15pc`,
       # girl_14 = (girl_res*`17pc`+girl_nres*`14pc`,
       # girl_13 = (girl_res*`17pc`+girl_nres*`13pc`,
       # girl_12 = (girl_res*`17pc`+girl_nres*`12pc`,
       # girl_11 = (girl_res*`17pc`+girl_nres*`11pc`,
       # girl_10 = (girl_res*`17pc`+girl_nres*`10pc`,
       # mutate(girl_17 = (girl_17res+girl_17nres)*`17pc`,
       #        girl_16 = (girl_16res+girl_16nres)*`16pc`,
       #        girl_15 = (girl_15res+girl_15nres)*`15pc`,
       #        girl_14 = (girl_14res+girl_14nres)*`14pc`,
       #        girl_13 = (girl_13res+girl_13nres)*`13pc`,
       #        girl_12 = (girl_12res+girl_12nres)*`12pc`,
       #        girl_11 = (girl_11res+girl_11nres)*`11pc`,
       #        girl_10 = (girl_10res+girl_10nres)*`10pc`,
         boy_17 = (boy_res+boy_nres)*`17pc`,
         boy_16 = (boy_res+boy_nres)*`16pc`,
         boy_15 = (boy_res+boy_nres)*`15pc`,
         boy_14 = (boy_res+boy_nres)*`14pc`,
         boy_13 = (boy_res+boy_nres)*`13pc`,
         boy_12 = (boy_res+boy_nres)*`12pc`,
         boy_11 = (boy_res+boy_nres)*`11pc`,
         boy_10 = (boy_res+boy_nres)*`10pc`) %>% 
  mutate(girl_17nres = girl_17 - girl_17res,
         girl_16nres = girl_16 - girl_16res,
         girl_15nres = girl_15 - girl_15res,
         girl_14nres = girl_14 - girl_14res,
         girl_13nres = girl_13 - girl_13res,
         girl_12nres = girl_12 - girl_12res,
         girl_11nres = girl_11 - girl_11res,
         girl_10nres = girl_10 - girl_10res,
         boy_17nres = boy_17 - boy_17res,
         boy_16nres = boy_16 - boy_16res,
         boy_15nres = boy_15 - boy_15res,
         boy_14nres = boy_14 - boy_14res,
         boy_13nres = boy_13 - boy_13res,
         boy_12nres = boy_12 - boy_12res,
         boy_11nres = boy_11 - boy_11res,
         boy_10nres = boy_10 - boy_10res) %>% 
# mutate(check = `17pc` + `16pc` + `15pc` + `14pc` + `13pc` + `12pc` + `11pc` + `10pc`)
# %>% 
  # select(c(end_period_year, `17to10`, `res17to10`, `17pc_res`, `17pc`,
  #        girl_17res, boy_17res, girl_17, boy_17, girl_17nres, boy_17nres,
  #        `10pc_res`, `10pc`,
  #        girl_10res, boy_10res, girl_10, boy_10, girl_10nres, boy_10nres))
  
  select(c(end_period_year, starts_with("boy_"), starts_with("girl_"))) %>% 
  select(-c(boy_17:boy_10, girl_17:girl_10)) %>% 
  # mutate(check = boy_17nres + boy_16nres + boy_15nres + boy_14nres +
  #          boy_13nres + boy_12nres + boy_11nres + boy_10nres) %>% 
  # mutate(check2 = boy_17res + boy_16res + boy_15res + boy_14res +
  #          boy_13res + boy_12res + boy_11res + boy_10res) %>% 
  select(c(end_period_year, starts_with("boy_1"), starts_with("girl_1"))) %>% 
  pivot_longer(-end_period_year,
               names_to = "residential",
               values_to = "count") %>% 
  mutate(age = as.numeric(str_extract_all(residential, "(\\d{2})")),
         gender = ifelse(grepl("boy", residential), "Boys", "Girls"),
         residential = ifelse(grepl("nres", residential), "Not residential", "Residential")) 


care_10 <- care %>% 
              filter(end_period_year == 2011) %>% 
              mutate(end_period_year = 2010)


care <- care %>% 
  bind_rows(care_10) %>% 

# %>% 
  # check <- care_res_pc %>% 
  #   mutate(age = ifelse(age>= 16, "16+", "10-15")) %>% 
  #   group_by(end_period_year, age) %>% 
  #   summarise(count = sum(count)) %>% 
  #   rename(mod_count = count) %>% 
  #   full_join(care_11to22_age %>% 
  #               filter(level == "Birmingham",
  #                      age %in% c("16+", "10-15"),
  #                      end_period_year <= 2020) %>% 
  #               group_by(end_period_year, age) %>% 
  #               summarise(count = sum(count)) %>% 
  #               rename(dat_count = count)) %>% 
  #   ggplot() +
  #   geom_line(aes(x = end_period_year, y = mod_count, group = as.character(age), colour = as.character(age))) +
  #   geom_line(aes(x = end_period_year, y = dat_count, group = as.character(age), colour = as.character(age)))
  # 
  # check
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2010:2022)) %>%
              group_by(end_period_year, gender, age) %>% 
              summarise(pop = sum(count))) %>% 
  mutate(pc = count/pop)  %>% 
  ungroup() %>% 
  group_by(age, gender, residential) %>%
  arrange(end_period_year) %>%
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.005)$y) %>%
  mutate(smooth_count = smooth_pc*pop) %>% 
  ungroup()





check_age <- care %>% 
    mutate(age = ifelse(age>= 16, "16+", "10-15")) %>% 
    group_by(end_period_year, age) %>% 
    summarise(count = sum(smooth_count),
              pop = sum(pop),
              mod_pc = count/pop) %>% 
    rename(mod_count = count) %>% 
    select(-c(pop)) %>% 
    full_join(care_11to22_age %>% 
                filter(level == "Birmingham",
                       age %in% c("10-15", "16+"),
                       end_period_year <= 2020) %>% 
                group_by(end_period_year, age) %>% 
                summarise(count = sum(count)) %>% 
                full_join(pop_estimate_01to20_age_gender %>% 
                            filter(level == "Birmingham",
                                   age %in% c(10:17),
                                   end_period_year %in% c(2011:2022)) %>%
                            mutate(age = ifelse(age>= 16, "16+", "10-15")) %>% 
                            group_by(end_period_year, age) %>% 
                            summarise(pop = sum(count))) %>% 
                mutate(data_pc = count/pop) %>% 
                rename(data_count = count) %>% 
                select(-c(pop))) %>% 
     ggplot() +
      # geom_line(aes(x = end_period_year, y = mod_pc, group = as.character(age), colour = as.character(age))) +
      # geom_line(aes(x = end_period_year, y = data_pc, group = as.character(age), colour = as.character(age)))
        geom_line(aes(x = end_period_year, y = mod_count, group = age, colour = age)) +
        geom_line(aes(x = end_period_year, y = data_count, group = age, colour = age))

      # facet_grid(rows = vars(gender),
      #            cols = vars(residential)) +
      # scale_color_viridis(discrete = T)

check_age
smoothing_age_rate_check


check_age2 <- care %>% 
  group_by(end_period_year, residential, gender, age) %>% 
  summarise(count = sum(smooth_count),
            pop = sum(pop),
            mod_pc = count/pop) %>% 
  rename(mod_count = count) %>% 
  ggplot() +
  # geom_line(aes(x = end_period_year, y = mod_pc, group = as.character(age), colour = as.character(age))) +
  # geom_line(aes(x = end_period_year, y = data_pc, group = as.character(age), colour = as.character(age)))
  geom_line(aes(x = end_period_year, y = mod_pc, group = age, colour = age)) +
facet_grid(rows = vars(gender),
           cols = vars(residential)) +
scale_color_viridis(discrete = F)

check_age2

check <- care_11to22_age %>% 
  filter(level == "Birmingham",
         age %in% c("10-15", "16+"),
         end_period_year <= 2020) %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count)) %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year %in% c(2011:2022)) %>%
              mutate(age = ifelse(age>= 16, "16+", "10-15")) %>% 
              group_by(end_period_year, age) %>% 
              summarise(pop = sum(count))) %>% 
  mutate(data_pc = count/pop) %>% 
  rename(data_count = count) %>% 
  select(-c(pop))




# IGNORE THIS ONE IT SHOULD HAVE BEEN DISCOUNTED FOR THE 
# EXTRA WRONG AGE
check_gen <- care_res_pc %>% 
  group_by(end_period_year, gender) %>% 
  summarise(count = sum(smooth_count),
            pop = sum(pop),
            mod_pc = count/pop) %>% 
  rename(mod_count = count) %>% 
  select(-c(pop)) %>% 
  full_join(care_11to22_gender %>% 
              filter(level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year, gender) %>% 
              summarise(count = sum(count)) %>% 
              full_join(pop_estimate_01to20_age_gender %>% 
                          filter(level == "Birmingham",
                                 age %in% c(10:17),
                                 end_period_year %in% c(2011:2022)) %>%
                          group_by(end_period_year, gender) %>% 
                          summarise(pop = sum(count))) %>% 
              mutate(data_pc = count/pop) %>% 
              rename(data_count = count) %>% 
              select(-c(pop))) %>% 
  ggplot() +
  # geom_line(aes(x = end_period_year, y = mod_pc, group = gender, colour = gender)) +
  # geom_line(aes(x = end_period_year, y = data_pc, group = gender, colour = gender))
  geom_line(aes(x = end_period_year, y = mod_count, group = gender, colour = gender)) +
  geom_line(aes(x = end_period_year, y = data_count, group = gender, colour = gender))

# facet_grid(rows = vars(gender),
#            cols = vars(residential)) +
# scale_color_viridis(discrete = T)

check_gen



care_pov <- care %>% 
  select(-c(count, pc, smooth_pc)) %>% 
  pivot_wider(names_from = residential,
              values_from = smooth_count) %>% 
  # CUM PC COMES IN FROM THAT PAPER
  full_join(care_cum_pc) %>% 
  mutate(cum_pc = cum_pc/100) %>% 
  mutate(pc_prior = cum_pc - ((Residential + `Not residential`)/pop)) %>% 
  mutate(Prior = pop*pc_prior) %>% 
  mutate(Never = pop - Prior - Residential - `Not residential`) %>% 
  select(-c(cum_pc, pc_prior)) %>% 
  # ASSUMPTION that poverty is evenly distributed across age & gender
  # ASSUMPTION that children in poverty are 4 times more likely to go to care... why did i decide this?
  # ASSUMPTION - ignorning the fact that child pov pc is changing across time...
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate) %>% 
              filter(end_period_year %in% c(2010:2020))) %>% 
  mutate(incl_Prior = Prior*(1-spov_rate)/(1 + 3*spov_rate),
         excl_Prior = Prior*spov_rate*4/(1 + 3*spov_rate),
         incl_Residential = Residential*(1-spov_rate)/(1 + 3*spov_rate),
         excl_Residential = Residential*spov_rate*4/(1 + 3*spov_rate),
         `incl_Not residential` = `Not residential`*(1-spov_rate)/(1 + 3*spov_rate),
         `excl_Not residential` = `Not residential`*spov_rate*4/(1 + 3*spov_rate),
         incl_Never = pop*(1-spov_rate) - incl_Prior - `incl_Not residential` - incl_Residential,
         excl_Never = pop*spov_rate - excl_Prior - `excl_Not residential` - excl_Residential) %>% 
  select(-c(pop, spov_rate, Never, Prior, `Not residential`, `Residential`)) %>% 
  pivot_longer(c(starts_with("incl"), starts_with("excl")), 
                            names_to = c("state", ".value"),
                            names_sep="_",
                            values_to = "count") %>% 
  mutate(state = ifelse(state == "incl", "Not in poverty", "In poverty")) %>% 
  pivot_longer(c(Never, `Not residential`, `Residential`, Prior),
               names_to = "care",
               values_to = "count")


# NOW I NEED TO PUT ON THE SCHOOLS DATA

# HOW TO DEAL WITH THE INCONGRUETY BETWEEN FSM AND CHILD POV
# WHAT IF WE SAID THAT THE SAME RATIO BETWEEN FSM AND NOT FSM I WOULD USE FOR POV/NOT POV
# I WONDER WOULD THAT WORK OUT AS THE SAME OVERALL FIGURES..
# PC OG FIRLS AGE TEN ON FSM IN PRUS

school_in_care <- school_pru %>% 
  mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
  filter(age <= 15) 

  
school_in_care %>% 
  ungroup() %>% 
  group_by(gender, age, fsm) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc_in_pru, lambda = 0.0005)$y) %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = smooth_pc, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))



pru_rate_byfsm_boy <- school_pru %>% 
  mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pc_in_pru, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))
pru_rate_byfsm_boy
ggsave(filename = "output/graphs/pru_rate_byfsm_boy.png", pru_rate_byfsm_boy)


pru_rate_byfsm_girl <- school_pru %>% 
  mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
  filter(age <= 15,
         gender == "Girls") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pc_in_pru, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))
pru_rate_byfsm_girl
ggsave(filename = "output/graphs/pru_rate_byfsm_girl.png", pru_rate_byfsm_girl)

# WOW weird, pretty much all of the increase in PRU rates just came from the
# children who were FSM eligible - only exception being 15 year olds

school_pru %>% 
  mutate(pc_in_pru = PRU/(PRU + `Not PRU`)) %>% 
  select(-c(PRU, `Not PRU`)) %>% 
  pivot_wider(names_from = fsm,
              values_from = pc_in_pru) %>% 
  mutate(fsm_mult = `FSM eligible`/`Not FSM eligible`) %>% 
  filter(age <= 15) %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = fsm_mult, group = as.character(age), colour = as.character(age))) +
  facet_grid(~gender)

# this is a graph showing how much more likely kids eligible for FSM were to
# be in PRUs compared to those who weren't.
# what happened in 2018 lol

pc_fsm <- school_pru %>%
  filter(age <= 15,
         end_period_year <= 2020) %>% 
  mutate(count = PRU + `Not PRU`) %>% 
  select(-c(PRU, `Not PRU`)) %>% 
  group_by(end_period_year, gender, age) %>%
  mutate(pc_fsm = count/sum(count)) %>% 
  filter(fsm == "FSM eligible") %>% 
  select(-c(count, fsm))


pc_pru <- school_pru %>%
  filter(age <= 15,
         end_period_year <= 2020) %>% 
  group_by(end_period_year, gender, age) %>%
  summarise(PRU = sum(PRU),
            `Not PRU` = sum(`Not PRU`)) %>% 
  mutate(pc_pru = PRU/ (PRU + `Not PRU`)) %>% 
  select(-c(PRU, `Not PRU`))
  


fsm_pru_mult <- school_pru %>% 
  filter(age <= 15,
         end_period_year <= 2020) %>% 
  pivot_longer(c(PRU, `Not PRU`),
               names_to = "pru",
               values_to = "count") %>%
  group_by(end_period_year, gender, age, fsm) %>%
  mutate(pc_in_pru = count/sum(count)) %>%
  filter(pru == "PRU") %>% 
  pivot_wider(names_from = fsm,
              values_from = c(count, pc_in_pru)) %>% 
  mutate(
    # tot_pru = `count_FSM eligible` + `count_Not FSM eligible`,
         fsm_mult = `pc_in_pru_FSM eligible`/`pc_in_pru_Not FSM eligible`) %>% 
  mutate(fsm_mult = ifelse(is.na(fsm_mult), 0, fsm_mult)) %>% 
  select(-c(starts_with("count"), pru))


school_in_care <- pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(10:15),
         end_period_year %in% c(2010:2022)) %>%
  group_by(end_period_year, gender, age) %>% 
  summarise(pop = sum(count)) %>% 
  full_join(pc_fsm) %>% 
  full_join(pc_pru) %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate) %>% 
              filter(end_period_year %in% c(2010:2020))) %>% 
  full_join(fsm_pru_mult) %>% 
  mutate(count_pru = pc_pru*pop,
         incl_count = pop*(1-spov_rate),
         excl_count = pop*spov_rate,
         incl_pru = count_pru*(1-spov_rate)/((1-spov_rate) + fsm_mult*spov_rate),
         excl_pru = count_pru*fsm_mult*spov_rate/((1-spov_rate) + fsm_mult*spov_rate)) %>% 
  select(c(end_period_year, gender, age, incl_count, excl_count, incl_pru, excl_pru)) %>% 
  pivot_longer(c(starts_with("incl"), starts_with("excl")), 
             names_to = c("state", ".value"),
             names_sep="_",
             values_to = "count") %>% 
  mutate(state = ifelse(state == "incl", "Not in poverty", "In poverty")) %>% 
  mutate(pru_rate = pru/count)




pru_rate_bypov_girl <- school_in_care %>% 
  filter(gender == "Girls") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pru_rate, group = state, colour = state)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))
pru_rate_bypov_girl
pru_rate_byfsm_girl

ggsave(filename = "output/graphs/pru_rate_bypov_girl.png", pru_rate_bypov_girl)
  
  
  

pru_rate_bypov_boy <- school_in_care %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pru_rate, group = state, colour = state)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))
pru_rate_bypov_boy
pru_rate_byfsm_boy

ggsave(filename = "output/graphs/pru_rate_bypov_girl.png", pru_rate_bypov_girl)



# SO I'VE WORKED OUT A PRU RATE FOR POVERTY... NOW I NEED TO FIGURE OUT
# ABOUT THE CARE MULTIPLIER.....
# SHIT...SOME MULTIPLIER COMES FROM POVERTY.. SOME COMES FROM CARE...
# WHAT PERCENTAGE IS DOWN TO WHAT....

care_pov_pru <- care_pov %>% 
  pivot_wider(names_from = care,
              values_from = count) %>% 
  full_join(school_in_care %>% 
              select(-c(count, pru)))




















check <- pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(10:17),
         end_period_year >= 2011) %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count)) %>% 
  full_join(care_age_pc) %>% 
  mutate(pc = ifelse(age >=16, `16+`, `10-15`)) %>% 
  ungroup() %>% 
  group_by(end_period_year) %>% 
  arrange(age) %>% 
  mutate(smooth_pc = smooth.spline(age, pc, lambda = 0.015)$y) %>% 
  mutate(pc_adj = ifelse(age == 10, pc - 0.002, pc),
         pc_adj = ifelse(age == 17, pc + 0.002, pc_adj)) %>% 
  mutate(smooth_pc_adj = smooth.spline(age, pc_adj, lambda = 0.015)$y) %>% 
  select(end_period_year, age, smooth_pc_adj)


smoothing_age_rate <- pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(10:17),
         end_period_year >= 2011) %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count)) %>% 
  full_join(care_age_pc) %>% 
  mutate(pc = ifelse(age >=16, `16+`, `10-15`)) %>% 
  ungroup() %>% 
  group_by(end_period_year) %>% 
  arrange(age) %>% 
  mutate(smooth_pc = smooth.spline(age, pc, lambda = 0.015)$y) %>% 
  mutate(pc_adj = ifelse(age == 10, pc - 0.002, pc),
         pc_adj = ifelse(age == 17, pc + 0.002, pc_adj)) %>% 
  mutate(smooth_pc_adj = smooth.spline(age, pc_adj, lambda = 0.015)$y) %>% 
  ggplot() +
  geom_line(aes(x = age, y = pc, group = end_period_year, colour = end_period_year)) +
  geom_line(aes(x = age, y = smooth_pc_adj, group = end_period_year, colour = end_period_year)) 
smoothing_age_rate
ggsave(filename = "output/graphs/smoothing_age_rate.png", smoothing_age_rate)
# I think this looks ok....
# even though its a lot of just me eyeballing
# this is children in care not children entering care.



care_age <- pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(10:17),
         end_period_year >= 2011) %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count)) %>% 
  full_join(care_age_pc) %>% 
  mutate(pc = ifelse(age >=16, `16+`, `10-15`)) %>% 
  ungroup() %>% 
  group_by(end_period_year) %>% 
  arrange(age) %>% 
  mutate(pc_adj = ifelse(age == 10, pc - 0.002, pc),
         pc_adj = ifelse(age == 17, pc + 0.002, pc_adj)) %>% 
  mutate(smooth_pc_adj = smooth.spline(age, pc_adj, lambda = 0.015)$y) %>% 
  mutate(care = count*smooth_pc_adj) %>% 
  select(end_period_year, age, count, care)

smoothing_age_rate_check <- care_age %>% 
  mutate(age = ifelse(age >=16, "16+", "10-15")) %>% 
  group_by(end_period_year, age) %>% 
  summarise(count = sum(count),
            care = sum(care)) %>% 
  full_join(care_11to22_age %>% 
              filter(level == "Birmingham", 
                     age %in% c("10-15", "16+"),
                     end_period_year <= 2020) %>%
              group_by(end_period_year, age) %>% 
              summarise(count_caredata = sum(count))) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = care, group = age, colour = age)) +
  geom_line(aes(x = end_period_year, y = count_caredata, group = age, colour = age))
smoothing_age_rate_check
ggsave(filename = "output/graphs/smoothing_age_rate_check.png", smoothing_age_rate_check)

#

care_age_gen <- care_age %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
              filter(level == "Birmingham",
                     age %in% c(10:17),
                     end_period_year >= 2011) %>% 
              group_by(end_period_year, gender, age) %>% 
              summarise(count = sum(count)) %>%
              pivot_wider(names_from = gender,
                          values_from = count)) %>% 
  full_join(care_gender_pc %>% 
              rename(boy_pc = Boys,
                     girl_pc = Girls)) %>% 
  mutate(boy2girl_care = boy_pc/girl_pc,
         boy2girl_care = ifelse(boy2girl_care < 1, 1, boy2girl_care), # i had smoothed them and the lines cross at 2011..
         boy_pc_pop = Boys/(Boys+Girls),
         maybe_bpc_care = Boys*boy2girl_care/(Boys*boy2girl_care+Girls)) %>% 
  mutate(boy_care = maybe_bpc_care*care,
         girl_care = (1-maybe_bpc_care)*care) %>% 
  # mutate(boy_care_rate = boy_care/Boys,
  #        girl_care_rate = girl_care/Girls) %>% 
  # mutate(check = boy_care_rate/girl_care_rate)
  select(end_period_year, age, boy_care, girl_care) %>% 
  pivot_longer(c(boy_care, girl_care),
               names_to = "gender",
               values_to = "count") %>% 
  mutate(gender = ifelse(grepl("boy", gender), "Boys", "Girls"))



check_care_construct <- care_age_gen %>% 
  full_join(pop_estimate_01to20_age_gender %>% 
                        filter(level == "Birmingham",
                               age %in% c(10:17),
                               end_period_year >= 2011) %>% 
                        group_by(end_period_year, gender, age) %>% 
                        summarise(pop = sum(count))) %>%
  mutate(pc = count/pop) %>% 
  ggplot() +
    geom_line(aes(x = end_period_year, y = pc, group = as.character(age), colour = as.character(age))) +
  facet_grid(~gender)
check_care_construct
ggsave(filename = "output/graphs/check_care_construct.png", check_care_construct)





  
  
  
  
  
  
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # from today but still the previous version # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  
  
  
  care_11to22_placement %>%
  filter(level == "Birmingham") %>% 
  mutate(residential =
           ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                   "Residential schools",
                                   "Other residential settings"),
                  "Residential",
                  "Not residential")) %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(end_period_year, level) %>%
  mutate(tot = sum(count)) %>%
  mutate(pc = count / tot) %>%
  ungroup() %>% 
  select(end_period_year, residential, pc) %>% 
  pivot_wider(names_from = residential, values_from = pc)

rescare_pc <- care_res_pc %>%
  arrange(end_period_year) %>% 
  mutate(smooth_res_pc = smooth.spline(end_period_year, Residential, lambda = 0.005)$y,
         smooth_nres_pc = 1-smooth_res_pc) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = Residential, colour = "res")) +
  geom_line(aes(x = end_period_year, y = `Not residential`, colour = "not res")) + 
  geom_line(aes(x = end_period_year, y = smooth_res_pc, colour = "smooth res")) + 
  geom_line(aes(x = end_period_year, y = smooth_nres_pc, colour = "smooth nres"))

rescare_pc
ggsave(filename = "output/graphs/rescare_pc.png", rescare_pc)
# rescare pc gradually climbing

# ok..... do I need to leave non-residential in there too? probably not. probably you just need the categories
# you're using plus their percentages.







# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # OLDER BELOW # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
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
check_placement_pc <- placement_pc %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, colour = placement)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_placement_pc
# secure units & 'other residential settings' growing as a pc of total care placements, residential schools shrikning
# think its probably ok to just apply the same pcs to 2010 as you have in 2011

placement_pc <- placement_pc  %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(pc = sum(pc)) %>%
  pivot_wider(names_from = residential, values_from = pc)


# rescare pc gradually climbing

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

age_pc %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = `10-15`, group = level, color = level))
# 
age_pc %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = `16+`, group = level, color = level))
# birmingham much jumpier because less data - generally looks to be around english level
# at eng level:      97% of kids in res care are 10 or over - 2015




# ASSUMPTION - 97 PC OF RES CARE ARE OVER TEN!!!!!!
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


girl_care_birm_v_eng <- gender_pc %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = Girls, group = level, color = level))
girl_care_birm_v_eng
ggsave(filename = "output/graphs/girl_care_birm_v_eng.png", girl_care_birm_v_eng)
# OK - BIRMINGHAM HAS WAY MORE GIRLS IN CARE THEN THE REST OF ENGLAND

# at england level, rescare girl 38 in 2015 - 44.6 overall - 0.85
#                   rescare girl 37 in 2020 - 43.8 overall - 0.8447


# ADD BACK TO MAIN TIME SERIES


# OK MAYBE IT SHOULDNT ACTUALLY ALL COME IN TOGETHER - YOU CAN REVISIT THIS....
care_pc <- placement_pc %>%
  full_join(age_pc) %>%
  full_join(gender_pc)

care_pc_2010 <- care_pc %>%
  filter(end_period_year == 2011) %>%
  mutate(end_period_year = end_period_year - 1)

care_pc <- care_pc %>%
  bind_rows(care_pc_2010)









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
  mutate(pc_resgirl = 0.85*Girls, #where did this adjustment for girls come from lol!
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

save(care, file = "Output/Data/Processed/care.Rdata")


care %>%
  ggplot() +
    geom_bar(aes(x = end_period_year, y = count), 
             stat = "identity", position = "stack") +
    facet_grid(~interaction(gender, residential))

  smooth_care <- care %>% 
    group_by(residential, gender) %>% 
    arrange(end_period_year) %>% 
    mutate(count = smooth.spline(end_period_year, count)$y) %>% 
    ungroup()
  
  check <- care %>% 
    filter(gender == "Boys", residential == "Not residential") %>% 
    arrange(end_period_year) %>% 
    # mutate(count = smooth.spline(end_period_year, count)$y) %>% 
    ungroup()


  check %>% 
    ggplot() +
    geom_bar(aes(x = end_period_year, y = count), 
             stat = "identity", position = "stack")
  
smooth_care %>%
    ggplot() +
    geom_bar(aes(x = end_period_year, y = count), 
             stat = "identity", position = "stack") +
    facet_grid(~interaction(gender, residential))
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


age_15 <- c(3,4,7,11,16,18,20,21)
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
  # mutate(check = nonres16plus*0.2,
  #        nonres10to15 = nonres10to15,
  #        nonres16plus = nonres16plus - check) %>% 
  # select(-check) %>% 
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


care_est <- care_agedetail4 %>% 
  mutate(week = (end_period_year - 2010)*52) %>% 
  select(-end_period_year)

# 
# mod_care <- lm(count ~ residential + gender + age + week, data = care_est)

care_est_4 <- care_est %>% 
  mutate(week = week + 4) %>% 
  mutate(count = NA)

care_est_8 <- care_est %>% 
  mutate(week = week + 8) %>% 
  mutate(count = NA)

care_est_12 <- care_est %>% 
  mutate(week = week + 12) %>% 
  mutate(count = NA)

care_est_16 <- care_est %>% 
  mutate(week = week + 16) %>% 
  mutate(count = NA)

care_est_20 <- care_est %>% 
  mutate(week = week + 20) %>% 
  mutate(count = NA)

care_est_24 <- care_est %>% 
  mutate(week = week + 24) %>% 
  mutate(count = NA)

care_est_28 <- care_est %>% 
  mutate(week = week + 28) %>% 
  mutate(count = NA)

care_est_32 <- care_est %>% 
  mutate(week = week + 32) %>% 
  mutate(count = NA)

care_est_36 <- care_est %>% 
  mutate(week = week + 36) %>% 
  mutate(count = NA)

care_est_40 <- care_est %>% 
  mutate(week = week + 40) %>% 
  mutate(count = NA)

care_est_44 <- care_est %>% 
  mutate(week = week + 44) %>% 
  mutate(count = NA)

care_est_48 <- care_est %>% 
  mutate(week = week + 48) %>% 
  mutate(count = NA)

care_est_new <- bind_rows(care_est_4,
                          care_est_8,
                          care_est_12,
                          care_est_16,
                          care_est_20,
                          care_est_24,
                          care_est_28,
                          care_est_32,
                          care_est_36,
                          care_est_40,
                          care_est_44,
                          care_est_48)


care_est_blank <- care_est_new %>% 
  bind_rows(care_est) %>% 
  group_by(residential, gender, age) %>% 
  arrange(week) %>% 
  filter(week <= 624)

install.packages("imputeTS")
library(imputeTS)
# x <- zoo(care_est_blank$count, care_est_blank$week)
# x <- na_interpolation(x, option = "linear") %>% 
#   as.data.frame()

# care_est_blank$est <- na_interpolation(zoo(care_est_blank$count, care_est_blank$week), option = "linear")



res_girl_10 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 10) %>% 
  mutate(count = na.approx(count))

res_girl_11 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 11) %>% 
  mutate(count = na.approx(count))

res_girl_12 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 12) %>% 
  mutate(count = na.approx(count))

res_girl_13 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 13) %>% 
  mutate(count = na.approx(count))

res_girl_14 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 14) %>% 
  mutate(count = na.approx(count))

res_girl_15 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 15) %>% 
  mutate(count = na.approx(count))

res_girl_16 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 16) %>% 
  mutate(count = na.approx(count))

res_girl_17 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Girls",
         age == 17) %>% 
  mutate(count = na.approx(count))

res_boy_10 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 10) %>% 
  mutate(count = na.approx(count))

res_boy_11 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 11) %>% 
  mutate(count = na.approx(count))

res_boy_12 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 12) %>% 
  mutate(count = na.approx(count))

res_boy_13 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 13) %>% 
  mutate(count = na.approx(count))

res_boy_14 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 14) %>% 
  mutate(count = na.approx(count))

res_boy_15 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 15) %>% 
  mutate(count = na.approx(count))

res_boy_16 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 16) %>% 
  mutate(count = na.approx(count))

res_boy_17 <- care_est_blank %>% 
  filter(residential == "Residential",
         gender == "Boys",
         age == 17) %>% 
  mutate(count = na.approx(count))



nres_girl_10 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 10) %>% 
  mutate(count = na.approx(count))

nres_girl_11 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 11) %>% 
  mutate(count = na.approx(count))

nres_girl_12 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 12) %>% 
  mutate(count = na.approx(count))

nres_girl_13 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 13) %>% 
  mutate(count = na.approx(count))

nres_girl_14 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 14) %>% 
  mutate(count = na.approx(count))

nres_girl_15 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 15) %>% 
  mutate(count = na.approx(count))

nres_girl_16 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 16) %>% 
  mutate(count = na.approx(count))

nres_girl_17 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Girls",
         age == 17) %>% 
  mutate(count = na.approx(count))


nres_boy_10 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 10) %>% 
  mutate(count = na.approx(count))

nres_boy_11 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 11) %>% 
  mutate(count = na.approx(count))

nres_boy_12 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 12) %>% 
  mutate(count = na.approx(count))

nres_boy_13 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 13) %>% 
  mutate(count = na.approx(count))

nres_boy_14 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 14) %>% 
  mutate(count = na.approx(count))

nres_boy_15 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 15) %>% 
  mutate(count = na.approx(count))

nres_boy_16 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 16) %>% 
  mutate(count = na.approx(count))

nres_boy_17 <- care_est_blank %>% 
  filter(residential == "Not residential",
         gender == "Boys",
         age == 17) %>% 
  mutate(count = na.approx(count))






care_lin_int <- bind_rows(res_girl_10,
                   res_girl_11,
                    res_girl_12,
                          res_girl_13,
                          res_girl_14,
                          res_girl_15,
                          res_girl_16,
                          res_girl_17,
                          res_boy_10,
                          res_boy_11,
                          res_boy_12,
                          res_boy_13,
                          res_boy_14,
                          res_boy_15,
                          res_boy_16,
                          res_boy_17,
                          nres_girl_10,
                          nres_girl_11,
                          nres_girl_12,
                          nres_girl_13,
                          nres_girl_14,
                          nres_girl_15,
                          nres_girl_16,
                          nres_girl_17,
                          nres_boy_10,
                          nres_boy_11,
                          nres_boy_12,
                          nres_boy_13,
                          nres_boy_14,
                          nres_boy_15,
                          nres_boy_16,
                          nres_boy_17)




# 
# care_est_new$count = predict(mod_care, newdata = care_est_new %>% 
#                           select(-count))
# 
# care_est_new <- care_est_new %>% 
#   bind_rows(care_est)





# THIS PROBABLY IS NOT RIGHT
care_lin_int %>% 
  group_by(week, gender, residential) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = week, y = count, group = residential, color = residential)) +
  facet_wrap(~gender)

care_agedetail4 %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = count, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(residential, gender))

care_lin_int %>% 
  ggplot() +
  geom_line(aes(x = week, y = count, group = as.character(age), color = as.character(age))) +
  facet_wrap(~interaction(residential, gender))

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# NEED TO CALCULATE ENTRY RATE # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # #  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Should i try the p=id method?

# entry_rate <- care_lin_int %>% 
entry_rate <- care_agedetail4 %>% 
  mutate(count = ifelse(residential == "Not residential" & age %in% c(16, 17), 0.8*count, count)) %>% 
  # mutate(end_period_year = 2010 + floor(week/52)) %>% 
  full_join(smooth_care_duration %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 1) %>% 
              filter(end_period_year >= 2010)) %>% 
  mutate(incidence = count/(mean_dur/7)) %>% 
  filter(end_period_year <= 2020) %>% 

# %>% 
# %>% #scaling down by .. tried, 10, 30% lol
# ok so that's the incidence - now where does it come from?
  # 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
  # group_by(end_period_year) %>% 
  # mutate(tot_incidence = sum(incidence)) %>% 
  # ungroup() %>% 
  # ABSOLUTELY NO IDEA WHERE I PLUCKED THESE NUMBERS FROM EITHER
  mutate(pc_from_never = ifelse(residential == "Residential" & age %in% c(10, 11, 12, 13),
                                0.1, NA),
         pc_from_never = ifelse(residential == "Residential" & age %in% c(14, 15, 16, 17),
                                0.18, pc_from_never)) %>% 
  mutate(pc_from_res = ifelse(residential == "Residential" & age %in% c(10, 11, 12, 13),
                              0.16, NA),
         pc_from_res = ifelse(residential == "Residential" & age %in% c(14, 15, 16, 17),
                              0.3, pc_from_res)) %>% 
  mutate(pc_from_nres = ifelse(residential == "Residential" & age %in% c(10, 11, 12, 13),
                              0.5, NA),
         pc_from_nres = ifelse(residential == "Residential" & age %in% c(14, 15, 16, 17),
                               0.3, pc_from_nres)) %>% 
  mutate(pc_from_never = ifelse(residential == "Not residential" & age %in% c(10, 11, 12, 13, 14, 15),
                                0.6, pc_from_never),
         pc_from_never = ifelse(residential == "Not residential" & age %in% c(16, 17),
                                0.4, pc_from_never)) %>% 
  mutate(pc_from_nres = ifelse(residential == "Not residential" & age %in% c(10, 11, 12, 13, 14, 15),
                                0.25, pc_from_nres),
         pc_from_nres = ifelse(residential == "Not residential" & age %in% c(16, 17),
                               0.4, pc_from_nres)) %>% 
  mutate(pc_from_res = ifelse(residential == "Not residential" & age %in% c(10, 11, 12, 13, 14, 15),
                               0.05, pc_from_res),
         pc_from_res = ifelse(residential == "Not residential" & age %in% c(16, 17),
                              0.05, pc_from_res))  %>% 
  mutate(pc_from_prior = 1 - (pc_from_never + pc_from_nres + pc_from_res)) %>% 
  # changes from here, might go back
  mutate(inc_from_never = incidence*pc_from_never,
         inc_from_prior = incidence*pc_from_prior,
         inc_from_nres = incidence*pc_from_nres,
         inc_from_res = incidence*pc_from_res) %>% 

# %>% 

# %>% 

# %>% 
#   select(c(end_period_year, residential, gender, age, starts_with("inc_"))) %>% 
#   pivot_longer(starts_with("inc"), 
#                  names_to = "origin",
#                  values_to = "incidence")
# 
# entry_rate %>% 
#   filter(residential == "Not residential") %>% 
#   ggplot() +
#   geom_line(aes(x = end_period_year, y = incidence, group = origin, color = origin)) +
#   facet_wrap(~interaction(age, gender))
# 
# entry_rate %>% 
#   filter(residential == "Not residential") %>% 
#   ggplot() +
#   geom_bar(aes(x = end_period_year, y = incidence, fill = origin),
#            stat = "identity", position = "stack") +
#   facet_wrap(~interaction(age, gender))
# 
# entry_rate %>% 
#   filter(residential == "Residential") %>% 
#   ggplot() +
#   geom_bar(aes(x = end_period_year, y = incidence, fill = origin),
#            stat = "identity", position = "stack") +
#   facet_wrap(~interaction(age, gender))

# %>% 
# select(week, gender, age, residential,
#        inc_from_never, inc_from_prior) %>%
  select(end_period_year, gender, age, residential,
         inc_from_never, inc_from_prior) %>%
  pivot_wider(names_from = residential,
              values_from = c(inc_from_prior, inc_from_never)) %>% 
  full_join(care_agedetail4 %>% 
                       pivot_wider(names_from = residential,
                                   values_from = count)) %>%

# %>% 
  # full_join(care_lin_int %>% 
  #             pivot_wider(names_from = residential,
  #                         values_from = count))  %>% 
  # mutate(end_period_year = 2010 + floor(week/52)) %>% 
  full_join(population %>% 
              filter(end_period_year >= 2010) %>% 
              group_by(end_period_year, gender, age) %>% 
              summarise(population = sum(count))) %>% 
  mutate(pc_lac = (Residential + `Not residential`)/ population) %>% 
  full_join(care_cum_pc) %>% 
  rename(pc_ever = cum_pc) %>% 
  mutate(pc_ever = pc_ever/100) %>% 
  mutate(pc_prior = pc_ever - pc_lac) %>% 
  mutate(count_prior = population*pc_prior) %>% 
  mutate(rate_prior2nres = `inc_from_prior_Not residential`/count_prior,
         rate_prior2res = `inc_from_prior_Residential`/count_prior,
         rate_never2nres = `inc_from_never_Not residential`/population*(1-pc_ever),
         rate_never2res = `inc_from_never_Residential`/population*(1-pc_ever)) %>% 
  select(c(end_period_year, gender, age, starts_with("rate_"))) %>% 
  ungroup() %>% 
  filter(end_period_year <= 2020) %>% 
  arrange(end_period_year) 


# %>% 
  mutate(rate_prior2nres = smooth.spline(end_period_year, rate_prior2nres)$y)


entry_rate %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = rate_never2nres, group = as.character(age), color = as.character(age))) +
  facet_wrap(~gender)


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
  full_join(care_cum_pc %>% 
              filter(age == 10)) %>% 
  rename(pc_ever = cum_pc) %>% 
  mutate(pc_ever = pc_ever/100) %>% 
  mutate(pc_prior = pc_ever - pc_res - pc_nres) %>% 
  mutate(week = (end_period_year - 2010)*52) %>% 
  arrange(week) %>% 
  select(c(week, gender, pc_nres, pc_res, pc_prior)) %>% 
  pivot_wider(names_from = gender,
              values_from = c(pc_nres, pc_res, pc_prior)) %>% 
  mutate(week = ifelse(week == 0, 1, week)) %>% 
  add_row(week = 0) %>% 
  mutate(across(everything(), ~ifelse(is.na(.x), 0, .x))) %>% 
  arrange(week)

t_lac_adj <- care_calc$week

adj_back <- care_calc %>% 
  filter(week != 1)

t_lac <- adj_back$week

nres <- care_calc %>% 
  select(c(pc_nres_Boys, pc_nres_Girls)) %>% 
  as.matrix()

res <- care_calc %>% 
  select(c(pc_res_Boys, pc_res_Girls)) %>% 
  as.matrix()

pri <- care_calc %>% 
  select(c(pc_prior_Boys, pc_prior_Girls)) %>% 
  as.matrix()

save(t_lac_adj, file = "output/data/input/t_lac_adj.Rdata")
save(t_lac, file = "output/data/input/t_lac.Rdata")
save(nres, file = "output/data/input/nres.Rdata")
save(res, file = "output/data/input/res.Rdata")
save(pri, file = "output/data/input/pri.Rdata")


# trying to do initial conditions..
care_ic <- population %>% 
  filter(end_period_year >= 2010) %>% 
  select(end_period_year, gender, age, count) %>% 
  full_join(care_agedetail4 %>% 
              filter(end_period_year <= 2020) %>% 
              pivot_wider(names_from = residential,
                          values_from = count)) %>% 
  rename(nres = `Not residential`,
         res = Residential) %>% 
  mutate(pc_current = (res+nres)/count) %>% 
  full_join(care_cum_pc) %>% 
  rename(pc_ever = cum_pc) %>% 
  mutate(pc_ever = pc_ever/100) %>% 
  mutate(pc_prior = pc_ever - pc_current) %>% 
  mutate(prior = count*pc_prior) %>% 
  mutate(never = count - res - nres - prior)

# exact_ic <- care_ic %>% 
#   filter(end_period_year == 2010) %>% 
#   select(gender, age, never, nres, res, prior)
# 
# 
# exact_ic <- care_ic %>% 
#   filter(end_period_year == 2010) %>% 
#   left_join(smooth_poverty) %>% 
#   select(gender, age, never, nres, res, prior, spov_rate) %>% 
#   mutate(not_pov = 1 - spov_rate) %>% 
#   pivot_longer(c(spov_rate, not_pov),
#                names_to = "poverty",
#                values_to = "pc") 


exact_ic <- care_ic %>% 
  filter(end_period_year == 2010) %>% 
  left_join(smooth_poverty) %>% 
  #   select(gender, age, never, nres, res, prior, spov_rate) %>%
  select(gender, age, count, never, nres, res, prior, spov_rate) %>% 
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
  select(c(gender, age, nev_incl, nres_incl, res_incl, pri_incl,
            nev_excl, nres_excl, res_excl, pri_excl))




# from check below, in 2010 when multiplier is 4 
  # lac rate for incl is 0.005108891 lac rate for excl is 0.02043557
  
# check <- exact_ic %>% 
#   mutate(excl_rate = (nres_excl + res_excl)/(nev_excl + nres_excl + res_excl + pri_excl),
#          incl_rate = (nres_incl + res_incl)/(nev_incl + nres_incl + res_incl + pri_incl))

# NUMBER FOR THE YEAR 2010 ARE ESTIMATES BASED ON THE VALUE OF THE TOTAL
# NUMBERS IN 2010 AND THE PROPORTION OF TOTAL THAT WAS RESIDENTIAL IN THE YEAR 2011
# assuming that the gender and age breakdowns can simply be put together and applied.

ten_pc <- care_ic %>% 
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
  select(c(end_period_year, gender, age, nev_incl, nres_incl, res_incl, pri_incl,
           nev_excl, nres_excl, res_excl, pri_excl)) %>% 
  filter(age == 10) %>% 
  mutate(across(c(nres_incl, res_incl, pri_incl), ~.x/(nev_incl + nres_incl + res_incl + pri_incl))) %>% 
  mutate(across(c(nres_excl, res_excl, pri_excl), ~.x/(nev_excl + nres_excl + res_excl + pri_excl))) %>% 
  select(end_period_year, gender, nres_incl, res_incl, pri_incl, nres_excl, res_excl, pri_excl) %>% 
  pivot_wider(names_from = gender,
              values_from = c(nres_incl, res_incl, pri_incl, nres_excl, res_excl, pri_excl)) %>% 
  mutate(week = (end_period_year - 2010)*52) %>% 
  mutate(week = ifelse(week == 0, 1, week)) %>% 
  add_row(week = 0) %>% 
  mutate(across(everything(), ~ifelse(is.na(.x), 0, .x))) %>% 
  arrange(week) %>% 
  select(-end_period_year)

nresincl <- ten_pc %>% 
  select(c(nres_incl_Boys, nres_incl_Girls)) %>% 
  as.matrix()

resincl <- ten_pc %>% 
  select(c(res_incl_Boys, res_incl_Girls)) %>% 
  as.matrix()

priincl <- ten_pc %>% 
  select(c(pri_incl_Boys, pri_incl_Girls)) %>% 
  as.matrix()

nresexcl <- ten_pc %>% 
  select(c(nres_excl_Boys, nres_excl_Girls)) %>% 
  as.matrix()

resexcl <- ten_pc %>% 
  select(c(res_excl_Boys, res_excl_Girls)) %>% 
  as.matrix()

priexcl <- ten_pc %>% 
  select(c(pri_excl_Boys, pri_excl_Girls)) %>% 
  as.matrix()

# save(t_lac_adj, file = "output/data/input/t_lac_adj.Rdata")
# save(t_lac, file = "output/data/input/t_lac.Rdata")
# save(nres, file = "output/data/input/nres.Rdata")
# save(res, file = "output/data/input/res.Rdata")
# save(pri, file = "output/data/input/pri.Rdata")


entry_rate_pov <- care_ic %>% 
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
  select(c(end_period_year, gender, age, nev_incl, nres_incl, res_incl, pri_incl,
           nev_excl, nres_excl, res_excl, pri_excl)) %>% 
  pivot_longer(-c(end_period_year, gender, age), 
               names_to = "state",
               values_to = "count") %>% 
  mutate(residential = ifelse(grepl("nev", state), "Never", NA),
         residential = ifelse(grepl("res", state), "Residential", residential),
         residential = ifelse(grepl("nres", state), "Not residential", residential),
         residential = ifelse(grepl("pri", state), "Prior", residential)) %>% 
  mutate(state = ifelse(grepl("incl", state), "Included", "Excluded")) %>% 
  pivot_wider(names_from = residential,
              values_from = count) %>% 
  left_join(smooth_care_duration %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 1) %>% 
              filter(end_period_year >= 2010) %>% 
              pivot_wider(names_from = residential,
                          values_from = mean_dur) %>% 
              rename(res_dur = Residential,
                     nres_dur = `Not residential`)) %>%
  group_by(state, gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(res_incidence = lead(Residential)/(res_dur/7),
         nres_incidence = lead(`Not residential`)/(nres_dur/7)) %>% 
  mutate(res_incidence = ifelse(is.na(res_incidence), Residential/(res_dur/7), res_incidence),
         nres_incidence = ifelse(is.na(nres_incidence), 0.8*`Not residential`/(nres_dur/7), nres_incidence)) %>% 
  ungroup() %>% 
  mutate(nres_incidence = ifelse(age %in% c(16,17), 0.8*nres_incidence, nres_incidence)) %>% 
# changed it to 'lead' here 
  #sometimes do 20% haircut jhust because!!
  filter(end_period_year <= 2020) %>% 
  mutate(res_pc_from_never = ifelse(age %in% c(10, 11, 12, 13),
                                0.1, NA),
         res_pc_from_never = ifelse(age %in% c(14, 15, 16, 17),
                                0.18, res_pc_from_never)) %>% 
  mutate(res_pc_from_res = ifelse(age %in% c(10, 11, 12, 13),
                              0.16, NA),
         res_pc_from_res = ifelse(age %in% c(14, 15, 16, 17),
                              0.3, res_pc_from_res)) %>% 
  mutate(res_pc_from_nres = ifelse(age %in% c(10, 11, 12, 13),
                               0.5, NA),
         res_pc_from_nres = ifelse(age %in% c(14, 15, 16, 17),
                               0.3, res_pc_from_nres)) %>% 
  mutate(nres_pc_from_never = ifelse(age %in% c(10, 11, 12, 13, 14, 15),
                                0.6, NA),
         nres_pc_from_never = ifelse(age %in% c(16, 17),
                                0.4, nres_pc_from_never)) %>% 
  mutate(nres_pc_from_nres = ifelse(age %in% c(10, 11, 12, 13, 14, 15),
                               0.25, NA),
         nres_pc_from_nres = ifelse(age %in% c(16, 17),
                               0.4, nres_pc_from_nres)) %>% 
  mutate(nres_pc_from_res = ifelse(age %in% c(10, 11, 12, 13, 14, 15),
                              0.05, NA),
         nres_pc_from_res = ifelse(age %in% c(16, 17),
                              0.05, nres_pc_from_res)) %>% 
  mutate(res_pc_from_prior = 1 - (res_pc_from_never + res_pc_from_nres + res_pc_from_res),
         nres_pc_from_prior = 1 - (nres_pc_from_never + nres_pc_from_nres + nres_pc_from_res)) %>% 
  mutate(res_inc_from_never = res_incidence*res_pc_from_never,
         res_inc_from_prior = res_incidence*res_pc_from_prior,
         res_inc_from_nres = res_incidence*res_pc_from_nres,
         res_inc_from_res = res_incidence*res_pc_from_res,
         nres_inc_from_never = nres_incidence*nres_pc_from_never,
         nres_inc_from_prior = nres_incidence*nres_pc_from_prior,
         nres_inc_from_nres = nres_incidence*nres_pc_from_nres,
         nres_inc_from_res = nres_incidence*nres_pc_from_res) %>% 
  mutate(rate_prior2nres = nres_inc_from_prior/Prior,
         rate_prior2res = res_inc_from_prior/Prior,
         rate_never2nres = nres_inc_from_never/Never,
         rate_never2res = res_inc_from_never/Never) %>% 
  select(c(end_period_year, state, gender, age, starts_with("rate_"))) %>% 
  ungroup() %>% 
  group_by(state, gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(rate_prior2nres = smooth.spline(end_period_year, rate_prior2nres)$y,
         rate_prior2res = smooth.spline(end_period_year, rate_prior2res)$y,
         rate_never2nres = smooth.spline(end_period_year, rate_never2nres)$y,
         rate_never2res = smooth.spline(end_period_year, rate_never2res)$y) %>% 
ungroup()

prior2nres10i <- entry_rate_pov %>%
  filter(age == 10, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres11i <-entry_rate_pov %>%
  filter(age == 11, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres12i <-entry_rate_pov %>%
  filter(age == 12, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres13i <-entry_rate_pov %>%
  filter(age == 13, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres14i <-entry_rate_pov %>%
  filter(age == 14, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres15i <-entry_rate_pov %>%
  filter(age == 15, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres16i <-entry_rate_pov %>%
  filter(age == 16, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres17i <-entry_rate_pov %>%
  filter(age == 17, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()



prior2res10i <-entry_rate_pov %>%
  filter(age == 10, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res11i <-entry_rate_pov %>%
  filter(age == 11, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res12i <-entry_rate_pov %>%
  filter(age == 12, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res13i <-entry_rate_pov %>%
  filter(age == 13, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res14i <-entry_rate_pov %>%
  filter(age == 14, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res15i <-entry_rate_pov %>%
  filter(age == 15, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res16i <-entry_rate_pov %>%
  filter(age == 16, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res17i <-entry_rate_pov %>%
  filter(age == 17, state == "Included") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()


never2nres10i <-entry_rate_pov %>%
  filter(age == 10, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres11i <-entry_rate_pov %>%
  filter(age == 11, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres12i <-entry_rate_pov %>%
  filter(age == 12, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres13i <-entry_rate_pov %>%
  filter(age == 13, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres14i <-entry_rate_pov %>%
  filter(age == 14, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres15i <-entry_rate_pov %>%
  filter(age == 15, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres16i <-entry_rate_pov %>%
  filter(age == 16, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres17i <-entry_rate_pov %>%
  filter(age == 17, state == "Included") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()



never2res10i <-entry_rate_pov %>%
  filter(age == 10, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res11i <-entry_rate_pov %>%
  filter(age == 11, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res12i <-entry_rate_pov %>%
  filter(age == 12, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res13i <-entry_rate_pov %>%
  filter(age == 13, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res14i <-entry_rate_pov %>%
  filter(age == 14, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res15i <-entry_rate_pov %>%
  filter(age == 15, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res16i <-entry_rate_pov %>%
  filter(age == 16, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res17i <-entry_rate_pov %>%
  filter(age == 17, state == "Included") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()


prior2nres10e <- entry_rate_pov %>%
  filter(age == 10, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres11e <- entry_rate_pov %>%
  filter(age == 11, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres12e <- entry_rate_pov %>%
  filter(age == 12, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres13e <- entry_rate_pov %>%
  filter(age == 13, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres14e <- entry_rate_pov %>%
  filter(age == 14, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres15e <- entry_rate_pov %>%
  filter(age == 15, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres16e <- entry_rate_pov %>%
  filter(age == 16, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2nres17e <- entry_rate_pov %>%
  filter(age == 17, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()



prior2res10e <- entry_rate_pov %>%
  filter(age == 10, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res11e <- entry_rate_pov %>%
  filter(age == 11, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res12e <- entry_rate_pov %>%
  filter(age == 12, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res13e <- entry_rate_pov %>%
  filter(age == 13, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res14e <- entry_rate_pov %>%
  filter(age == 14, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res15e <- entry_rate_pov %>%
  filter(age == 15, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res16e <- entry_rate_pov %>%
  filter(age == 16, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

prior2res17e <- entry_rate_pov %>%
  filter(age == 17, state == "Excluded") %>% 
  select(end_period_year, gender, rate_prior2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_prior2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()


never2nres10e <- entry_rate_pov %>%
  filter(age == 10, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres11e <- entry_rate_pov %>%
  filter(age == 11, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres12e <- entry_rate_pov %>%
  filter(age == 12, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres13e <- entry_rate_pov %>%
  filter(age == 13, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres14e <- entry_rate_pov %>%
  filter(age == 14, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres15e <- entry_rate_pov %>%
  filter(age == 15, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres16e <- entry_rate_pov %>%
  filter(age == 16, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2nres17e <- entry_rate_pov %>%
  filter(age == 17, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2nres) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2nres) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()



never2res10e <- entry_rate_pov %>%
  filter(age == 10, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res11e <- entry_rate_pov %>%
  filter(age == 11, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res12e <- entry_rate_pov %>%
  filter(age == 12, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res13e <- entry_rate_pov %>%
  filter(age == 13, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res14e <- entry_rate_pov %>%
  filter(age == 14, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res15e <- entry_rate_pov %>%
  filter(age == 15, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res16e <- entry_rate_pov %>%
  filter(age == 16, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()

never2res17e <- entry_rate_pov %>%
  filter(age == 17, state == "Excluded") %>% 
  select(end_period_year, gender, rate_never2res) %>% 
  pivot_wider(names_from = gender,
              values_from = rate_never2res) %>% 
  arrange(end_period_year) %>% 
  select(c(Boys, Girls)) %>% 
  as.matrix()






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

check <- care %>%
  group_by(end_period_year) %>% 
  summarise(care_count = sum(count)) %>% 
  full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(10:17)) %>%
              group_by(end_period_year) %>%
              summarise(pop = sum(count))) %>% 
  filter(end_period_year %in% c(2010:2020)) %>% 
  mutate(scare_count = smooth.spline(end_period_year, care_count)$y) %>% 
  mutate(scare_pc = scare_count/pop) %>% 
  left_join(smooth_poverty %>% 
              select(end_period_year, spov_rate)) %>% 
  mutate(pop_excl = pop*spov_rate,
         pop_incl = pop*(1-spov_rate)) %>% 
  mutate(mult = 4) %>% 
  mutate(rate_incl = scare_count/(mult*pop_excl + pop_incl),
         rate_excl = rate_incl*mult)  %>% 
  mutate(care_excl = pop_excl*rate_excl,
         care_incl = pop_incl*rate_incl)

check %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = rate_excl),
           stat = "identity", position = "dodge")

check %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = rate_incl),
           stat = "identity", position = "dodge")


check %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pop_excl),
           stat = "identity", position = "dodge")

check %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pop_incl),
           stat = "identity", position = "dodge")





care %>%
  group_by(end_period_year) %>% 
  summarise(care_count = sum(count)) %>% 
  full_join(pop_estimate_01to20_age_gender %>%
              filter(level == "Birmingham",
                     age %in% c(10:17)) %>%
              group_by(end_period_year) %>%
              summarise(pop = sum(count))) %>% 
  filter(end_period_year %in% c(2010:2020)) %>% 
  mutate(scare_count = smooth.spline(end_period_year, care_count)$y) %>% 
  mutate(scare_pc = scare_count/pop) %>% 
  # mutate(scare_pc = smooth.spline(end_period_year, care_pc)$y) %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = scare_pc),
           stat = "identity", position = "dodge")


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







girl_res <- care_res_pc %>% 
  filter(gender == "Girls",
         residential == "Residential") %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>%
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>%
  mutate(smooth_count = smooth_pc*pop) %>% 
  ungroup()

girl_nres <- care_res_pc %>% 
  filter(gender == "Girls",
         residential == "Not residential") %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>%
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>%
  mutate(smooth_count = smooth_pc*pop) %>% 
  ungroup()


boy_res <- care_res_pc %>% 
  filter(gender == "Boys",
         residential == "Residential") %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>%
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>%
  mutate(smooth_count = smooth_pc*pop) %>% 
  ungroup()

boy_nres <- care_res_pc %>% 
  filter(gender == "Boys",
         residential == "Not residential") %>% 
  group_by(age) %>% 
  arrange(end_period_year) %>%
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.0025)$y) %>%
  mutate(smooth_count = smooth_pc*pop) %>% 
  ungroup()


care_res_pc2 <- bind_rows(girl_res, boy_res, girl_nres, boy_nres)

