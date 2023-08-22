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
  group_by(gender, age) %>% 
  summarise(pc = mean(pc))

ok!! essentially 60:40


neet <- neet_12to23_age %>% 
  mutate(Boys = 0.6*neet,
         Girls = 0.4*neet) %>% 
  select(-neet) %>% 
  pivot_longer(c(Boys, Girls),
               names_to = "gender",
               values_to = "count") %>% 
  ungroup() %>% 
  group_by(gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_count = smooth.spline(end_period_year, count)$y)

mod_b16 <- lm(smooth_count ~ end_period_year, data = neet %>% 
                       filter(end_period_year <= 2016,
                              gender == "Boys",
                              age == 16))

b16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
                  age = c(16, 16))

b16$smooth_count <- predict(mod_b16, newdata = b16)


mod_b17 <- lm(smooth_count ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Boys",
                       age == 17))

b17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Boys", "Boys"),
                  age = c(17, 17))

b17$smooth_count <- predict(mod_b17, newdata = b17)

mod_g16 <- lm(smooth_count ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Girls",
                       age == 16))

g16 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
                  age = c(16, 16))

g16$smooth_count <- predict(mod_g16, newdata = g16)

mod_g17 <- lm(smooth_count ~ end_period_year, data = neet %>% 
                filter(end_period_year <= 2016,
                       gender == "Girls",
                       age == 17))
  
g17 <- data_frame(end_period_year = c(2010, 2011), gender = c("Girls", "Girls"),
                  age = c(17, 17))

g17$smooth_count <- predict(mod_g17, newdata = g17)


check <- neet %>% 
  bind_rows(b16, b17, g16, g17) %>% 
  bind_rows(data_frame(end_period_year = c(2017, 2017, 2017, 2017),
                       gender = c("Boys", "Boys", "Girls", "Girls"),
                       age = c(16,17,16,17))) %>% 
  ungroup() %>% 
  select(-count) %>% 
  group_by(gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_count = na.approx(smooth_count)) %>% 
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
mutate(`FSM eligible`= 0.675*smooth_count,
       `Not FSM eligible` = 0.325*smooth_count) %>% 
  select(-smooth_count) %>% 
  pivot_longer(c(`FSM eligible`, `Not FSM eligible`),
               names_to = "fsm",
               values_to = "neet") %>% 
  full_join(school_pru) %>% 
  mutate(neet = ifelse(is.na(neet), 0, neet)) %>% 
  filter(end_period_year <= 2022)




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


# NO NO NO IN ALL OF THE BELOW I AM ASSUMINUG FROM 2016
# BIT I HAVE INFO ON EARLIER - AND THE TREND CHANGES

smooth_neet <- neet_16to23_age_gender %>% 
  filter(gender != "Unknown") %>% 
  ungroup() %>% 
  group_by(end_period_year, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  group_by(gender, age, neet) %>% 
  arrange(end_period_year) 

mod_neet_b16 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
                     filter(neet == "NEET",
                            gender == "Boys",
                            age == 16))

mod_neet_g16 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
                     filter(neet == "NEET",
                            gender == "Girls",
                            age == 16))

b16 <- smooth_neet %>% 
  ungroup() %>% 
  bind_rows(smooth_neet %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 8,
                   count = NA,
                   pc = NA)) %>%
              filter(end_period_year >= 2010,
                     neet == "NEET",
                     gender == "Boys",
                     age == 16)

b16$pc_predict <- predict(mod_neet_b16, newdata = b16)

g16 <- smooth_neet %>% 
  ungroup() %>% 
  bind_rows(smooth_neet %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 8,
                     count = NA,
                     pc = NA)) %>%
  filter(end_period_year >= 2010,
         neet == "NEET",
         gender == "Girls",
         age == 16)

g16$pc_predict <- predict(mod_neet_g16, newdata = g16)


mod_neet_b17 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
                     filter(neet == "NEET",
                            gender == "Boys",
                            age == 17))

mod_neet_g17 <- lm(pc ~ end_period_year, data = smooth_neet %>% 
                     filter(neet == "NEET",
                            gender == "Girls",
                            age == 17))

b17 <- smooth_neet %>% 
  ungroup() %>% 
  bind_rows(smooth_neet %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 8,
                     count = NA,
                     pc = NA)) %>%
  filter(end_period_year >= 2010,
         neet == "NEET",
         gender == "Boys",
         age == 17)

b17$pc_predict <- predict(mod_neet_b17, newdata = b17)

g17 <- smooth_neet %>% 
  ungroup() %>% 
  bind_rows(smooth_neet %>% 
              ungroup() %>% 
              mutate(end_period_year = end_period_year - 8,
                     count = NA,
                     pc = NA)) %>%
  filter(end_period_year >= 2010,
         neet == "NEET",
         gender == "Girls",
         age == 17)

g17$pc_predict <- predict(mod_neet_g17, newdata = g17)


