load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/custody_avpop_10to21_legal_basis.Rdata")
# this only has down to WM level
load("/Users/katehayes/CLmodR/output/data/processed/population.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/custodial_sentences.Rdata")
load("/Users/katehayes/CLmodR/output/data/processed/custodial_sentence_duration.Rdata")

cust_pop <- custodial_sentences %>%
  filter(gender == "Boys")  %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  mutate(age = as.character(age)) %>% 
  group_by(t, age) %>%
  summarise(count = sum(count)) %>% 
  left_join(custodial_sentence_duration %>% 
              filter(gender == "Boys")%>%
              select(-gender) %>% 
              mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
              mutate(age = as.character(age))) %>% 
  mutate(inc = count/52,
         dur = nights/7,
         prev = inc*dur) %>% 
  select(t, end_period_year, age, inc) %>% 
  pivot_wider(names_from = age,
              values_from = inc) %>% 
  mutate(`10` = `10-14`*0.05,
         `11` = `10-14`*0.1,
         `12` = `10-14`*0.15,
         `13` = `10-14`*0.25,
         `14` = `10-14`*0.45) %>% 
  rename(`17` = `17+`) %>% 
  select(-`10-14`) %>% 
  pivot_longer(!c(t, end_period_year),
               names_to = "age",
               values_to = "inc") %>% 
  mutate(age = as.numeric(age))

pop <- population %>% 
  filter(gender == "Boys", 
         end_period_year %in% c(2010:2021)) %>% 
  select(end_period_year, age, count) %>% 
  left_join(cust_pop) %>% 
  mutate(rate = inc/count,
         rate_pov = rate*5,
         rate_np = rate/1.5) 


cs_p1_10 <- pop %>% 
  filter(age == 10) %>% 
  select(rate_np) %>% 
  as.matrix()

cs_p1_11 <- pop %>% 
  filter(age == 11) %>% 
  select(rate_np) %>% 
  as.matrix()

cs_p1_12 <- pop %>% 
  filter(age == 12) %>% 
  select(rate_np) %>% 
  as.matrix()


cs_p1_13 <- pop %>% 
  filter(age == 13) %>% 
  select(rate_np) %>% 
  as.matrix()


cs_p1_14 <- pop %>% 
  filter(age == 14) %>% 
  select(rate_np) %>% 
  as.matrix()


cs_p1_15 <- pop %>% 
  filter(age == 15) %>% 
  select(rate_np) %>% 
  as.matrix()

cs_p1_16 <- pop %>% 
  filter(age == 16) %>% 
  select(rate_np) %>% 
  as.matrix()


cs_p1_17 <- pop %>% 
  filter(age == 17) %>% 
  select(rate_np) %>% 
  as.matrix()


cs_p2_10 <- pop %>% 
  filter(age == 10) %>% 
  select(rate_pov) %>% 
  as.matrix()

cs_p2_11 <- pop %>% 
  filter(age == 11) %>% 
  select(rate_pov) %>% 
  as.matrix()

cs_p2_12 <- pop %>% 
  filter(age == 12) %>% 
  select(rate_pov) %>% 
  as.matrix()


cs_p2_13 <- pop %>% 
  filter(age == 13) %>% 
  select(rate_pov) %>% 
  as.matrix()


cs_p2_14 <- pop %>% 
  filter(age == 14) %>% 
  select(rate_pov) %>% 
  as.matrix()


cs_p2_15 <- pop %>% 
  filter(age == 15) %>% 
  select(rate_pov) %>% 
  as.matrix()

cs_p2_16 <- pop %>% 
  filter(age == 16) %>% 
  select(rate_pov) %>% 
  as.matrix()


cs_p2_17 <- pop %>% 
  filter(age == 17) %>% 
  select(rate_pov) %>% 
  as.matrix()


save(cs_p1_10, file = "output/data/input/cs_p1_10.Rdata")
save(cs_p2_10, file = "output/data/input/cs_p2_10.Rdata")
save(cs_p1_11, file = "output/data/input/cs_p1_11.Rdata")
save(cs_p2_11, file = "output/data/input/cs_p2_11.Rdata")
save(cs_p1_12, file = "output/data/input/cs_p1_12.Rdata")
save(cs_p2_12, file = "output/data/input/cs_p2_12.Rdata")
save(cs_p1_13, file = "output/data/input/cs_p1_13.Rdata")
save(cs_p2_13, file = "output/data/input/cs_p2_13.Rdata")
save(cs_p1_14, file = "output/data/input/cs_p1_14.Rdata")
save(cs_p2_14, file = "output/data/input/cs_p2_14.Rdata")
save(cs_p1_15, file = "output/data/input/cs_p1_15.Rdata")
save(cs_p2_15, file = "output/data/input/cs_p2_15.Rdata")
save(cs_p1_16, file = "output/data/input/cs_p1_16.Rdata")
save(cs_p2_16, file = "output/data/input/cs_p2_16.Rdata")
save(cs_p1_17, file = "output/data/input/cs_p1_17.Rdata")
save(cs_p2_17, file = "output/data/input/cs_p2_17.Rdata")
