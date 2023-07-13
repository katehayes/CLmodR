load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/care_miss_10to22.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Processed/care.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Processed/population.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/missing_13to20_age.Rdata")

# need missing rates per child in care, percentage of missing children who go missing more than once,
# average number of missing episodes per... child who goes missing more than once? or just per child?

# actually... i wonder how long is each missing ep... does that matter.. if we're not doing missing by components
# NB - IS THIS MISSING FROM CARE HOMES OR LAC CHILDREN MISSING, IN ANY PLACEMENT

#
# cmiss_rate <- care %>%
#   filter(level == "Birmingham") %>%
#   group_by(end_period_year, level) %>%
#   summarise(count = sum(count)) %>%
#   rename(tot_care_march = count) %>%
#   full_join(care_miss_10to22 %>%
#               filter(level == "Birmingham") %>%
#               pivot_wider(names_from = measure,
#                           values_from = count)) %>%
#   mutate(pc_more_one = `Repeatedly missing children`/
#            `Missing children`,
#          pc_missing_march = `Missing at 31 March` / tot_care_march, # this is pc missing on any given day
#          # av_inc_per_lac = `Missing incidents` / tot_care_march, NO - YOU CANT DO THAT - BC YOU DONT HAVE TOTAL CHILDREN IN CARE THROUGHOUT YEAR - JUST MARCH NUMBER
#          av_inc_per_lac = `Missing incidents`*(1/365) / tot_care_march, # is this something? the average daily missing rate?
#          av_inc_per_child_missing = `Missing incidents`/ `Missing children`,
#          av_inc_per_child_rep_missing = ((`Missing incidents` - ((1-pc_more_one)*`Missing children`))/`Repeatedly missing children`),
#          march_over_inc = `Missing at 31 March` / `Missing incidents`)

# maybe the question is - if this is the pc of LAC in residential care
# and if residential kids are 1.5 times more likely to go missing than other LAC
# then what pc of total incidents will be created by residential kids

age_pc <- population %>%
  filter(end_period_year %in% c(2010:2022)) %>%
  group_by(end_period_year, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = age, values_from = count) %>%
  mutate(`10-14` = `10`+`11`+`12`+`13`+`14`,
         `15-17` = `15`+`16`+`17`) %>%
  select(end_period_year, `10-14`, `15-17`) %>%
  mutate(tot = `10-14` + `15-17`,
         `10-14` = `10-14`/tot,
         `15-17` = `15-17`/tot) %>%
  summarise(`10-14` = mean(`10-14`),
            `15-17` = mean(`15-17`))

# so 15-17 year olds are on av 37% of the population and make up 0.681202449
# of the missing episodes.

# 0.68x/37 = 0.
# 37*missing1517 = 68
# missing1517 = 1.837838
# 63*missing1014 = 32
# missing1014 = 0.5079365
# so missing1517 is 3.618244 times bigger than missing1014



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
                  "Not residential")) %>%
  filter(residential == "Residential") %>%
  group_by(level, end_period_year, end_period_month, period_length, residential) %>%
  summarise(pc = sum(pc)) %>%
  ungroup() %>%
  pivot_wider(names_from = residential, values_from = pc) %>%
  filter(level == "Birmingham") %>%
  select(end_period_year, Residential) %>%
  add_row(end_period_year = 2010, Residential = 0.1299316)


cmiss_rate <- care %>%
  filter(level == "Birmingham") %>%
  group_by(end_period_year, level) %>%
  summarise(count = sum(count)) %>%
  rename(tot_care_march = count) %>%
  full_join(care_miss_10to22 %>%
              filter(level == "Birmingham") %>%
              pivot_wider(names_from = measure,
                          values_from = count)) %>%
  full_join(placement_pc) %>%
  rename(res_pc = Residential)

ratio <- cmiss_rate %>%
  ungroup() %>%
  mutate(check = `Missing at 31 March` / `Missing incidents`) %>%
  summarise(check = mean(check, na.rm = T)) %>%
  unlist()

cmiss_rate <- cmiss_rate %>%
  mutate(mark = ifelse(is.na(`Missing incidents`), "Estimate", "Data"),
         `Missing incidents` = ifelse(is.na(`Missing incidents`), `Missing at 31 March`/ratio, `Missing incidents`)) %>%
  mutate(day_incidents = `Missing incidents`/365,
         res_pc = res_pc*100,
         daily_other_rate = (`Missing incidents`/365)/(1.5*tot_care_march + (tot_care_march/res_pc)*(100-res_pc)),
         daily_res_rate = daily_other_rate*1.5,
         daily_res_missing_inc = daily_res_rate*tot_care_march,
         daily_other_missing_inc = daily_other_rate*(tot_care_march/res_pc)*(100-res_pc),
         check = daily_res_missing_inc + daily_other_missing_inc,
         yearly_res_missing_inc = daily_res_rate*tot_care_march*365,
         yearly_other_missing_inc = daily_other_rate*(tot_care_march/res_pc)*(100-res_pc)*365,
         check2 = yearly_res_missing_inc + yearly_other_missing_inc)


# saying that residential kids go missing 1.5 times more than non-residential
# total missing = x*(other LAC) + 1.5*x*(residential) = x*(other lac + 1.5*residential)



# https://foi.west-midlands.police.uk/wp-content/uploads/2020/12/1160A_20-attachment.pdf
# specific to children with a CSE risk marker
# but gives little comparison of WMP to Birmingham specificially
# Jan 1st – 31st Dec 2018
# 620/1415 = 0.4381625
#
# Jan 1st – 31st Dec 2019
# 964/1888 = 0.5105932
#
# Jan 1st – 25th November 2020
# 601/1503 = 0.3998669


# the birmingham percentage above is much bigger than the one calculated below.


birm_pc <- care_miss_10to22 %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(birm_pc = Birmingham/ `West Midlands (police)`) %>%
  filter(measure == "Missing incidents")

# check <- birm_pc %>%
#   summarise(birm_pc = mean(birm_pc, na.rm = T))
# 0.298235

# birm_pc %>%
# ggplot() +
#   geom_bar(aes(x = end_period_year, y = birm_pc),
#            stat = "identity", position = "dodge") +
#   facet_wrap(~measure)


# WORKING OUT VERY ROUGH AGE RATES
# avrate = missing/100, avrate*100 = missing
# missing = rate15*37 + rate10*63, avrate*100 = rate15*37 + rate10*63, avrate = rate15*0.37 + rate10*0.63
# rate15 = 3.6*rate10, avrate = 3.6*rate10*0.37 + rate10*0.63, avrate = rate10*(3.6*0.37 + 0.63)
# rate10 = avrate/1.962
# rate15 = (avrate/1.962)*3.6 = avrate*1.835


tot_miss_rate <- missing_13to20_age %>%
  ungroup() %>%
  group_by(end_period_year, end_period_month, period_length, level, measure) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  filter(measure == "Missing incidents") %>%
  full_join(cmiss_rate %>%
              select(end_period_year, tot_care_march, yearly_res_missing_inc, yearly_other_missing_inc, daily_res_rate)) %>%
  full_join(birm_pc %>%
              select(end_period_year, birm_pc)) %>%
  mutate(birm_pc = ifelse(is.na(birm_pc), 0.298235, birm_pc)) %>%
  mutate(birm_count = count*birm_pc) %>%
  full_join(population %>%
              filter(end_period_year %in% c(2010:2022)) %>%
              select(end_period_year, count) %>%
              group_by(end_period_year) %>%
              summarise(count = sum(count)) %>%
              rename(pop = count) %>%
              mutate(end_period_year = as.numeric(end_period_year))) %>%
  mutate(noncare_rate = (birm_count - yearly_res_missing_inc)/(pop - tot_care_march)/365) %>%
  select(end_period_year, noncare_rate, daily_res_rate) %>%
  mutate(check = daily_res_rate/noncare_rate,
         check = mean(check, na.rm = T),
         noncare_rate = ifelse(is.na(noncare_rate), daily_res_rate/check, noncare_rate),
         check = daily_res_rate/noncare_rate) %>% #if check is 83 its an estimate
  # WORKING OUT VERY ROUGH AGE RATES
  # avrate = missing/100, avrate*100 = missing
  # missing = rate15*37 + rate10*63, avrate*100 = rate15*37 + rate10*63, avrate = rate15*0.37 + rate10*0.63
  # rate15 = 3.6*rate10, avrate = 3.6*rate10*0.37 + rate10*0.63, avrate = rate10*(3.6*0.37 + 0.63)
  # rate10 = avrate/1.962
  # rate15 = (avrate/1.962)*3.6 = avrate*1.835
  mutate(daily_res_rate10 = daily_res_rate/1.962,
         daily_res_rate15 = daily_res_rate*1.835,
         noncare_rate10 = noncare_rate/1.962,
         noncare_rate15 = noncare_rate*1.835) %>%
  select(end_period_year, daily_res_rate10, daily_res_rate15, noncare_rate10, noncare_rate15) %>%
  pivot_longer(-end_period_year, names_to = "ageclass", values_to = "rate") %>%
  mutate(age = ifelse(grepl("10", ageclass), "10-14", "15-17"),
         class = ifelse(grepl("res", ageclass), "Residential care", "Other")) %>%
  select(-ageclass) %>%
  arrange(end_period_year) %>%
  filter(end_period_year <= 2020)

# at this point no seperation between excluded and included children!

t_miss <- tot_miss_rate %>%
  ungroup() %>%
  filter(class == "Residential care",
         age == "10-14") %>%
  mutate(t = (end_period_year - 2010)*52)

t_miss <- t_miss$t


miss_rc1014 <- tot_miss_rate %>%
  filter(class == "Residential care",
         age == "10-14") %>%
  mutate(rate2 = rate) %>%
  ungroup() %>%
  select(rate, rate2) %>%
  as.matrix()

miss_rc1517 <- tot_miss_rate %>%
  filter(class == "Residential care",
         age == "15-17") %>%
  mutate(rate2 = rate) %>%
  ungroup() %>%
  select(rate, rate2) %>%
  as.matrix()

miss_1014 <- tot_miss_rate %>%
  filter(class == "Other",
         age == "10-14") %>%
  mutate(rate2 = rate) %>%
  ungroup() %>%
  select(rate, rate2) %>%
  as.matrix()

miss_1517 <- tot_miss_rate %>%
  filter(class == "Other",
         age == "15-17") %>%
  mutate(rate2 = rate) %>%
  ungroup() %>%
  select(rate, rate2) %>%
  as.matrix()


# THIS IS A REALLY ROUGH JOB WITH A LOT OF STUFF WRONG WITH IT.....
save(t_miss, file = "Output/Data/Input/t_miss.Rdata")

save(miss_rc1014, file = "Output/Data/Input/miss_rc1014.Rdata")
save(miss_rc1517, file = "Output/Data/Input/miss_rc1517.Rdata")
save(miss_1014, file = "Output/Data/Input/miss_1014.Rdata")
save(miss_1517, file = "Output/Data/Input/miss_1517.Rdata")








# check <- tot_miss_rate %>%
#   filter((end_period_year == 2020 & end_period_month %in% c("January", "February", "March")) |
#           (end_period_year == 2019 & end_period_month %in% c("April", "May", "June", "July", "August",
#                                                              "September", "October", "November", "December")),
#          period_length == "Month") %>%
#   summarise(count = sum(count))
# 	- 6785 the monthly data from an FoI gives a total number that is about 60% of the number that is given in the missper unit's download


