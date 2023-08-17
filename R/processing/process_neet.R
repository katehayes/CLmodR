load("/Users/katehayes/CLmodR/output/data/cleaned/neet_16to23_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/neet_12to23_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/part_18to23_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/part_type_18to23.Rdata")

smooth_neet <- neet_16to23_age_gender %>% 
  filter(gender != "Unknown") %>% 
  ungroup() %>% 
  group_by(end_period_year, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  group_by(gender, age, neet) %>% 
  arrange(end_period_year) 



neet_12to23_age







# NO NO NO IN ALL OF THE BELOW I AM ASSUMINUG FROM 2016
# BIT I HAVE INFO ON EARLIER - AND THE TREND CHANGES
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


