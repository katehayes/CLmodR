

load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_1214to0322_reason_outcome_gen_ward.Rdata")

# supplementary data for a little more age detail
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_18to21_age.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_18to21_age_wmgirls.Rdata")

######------###first estimating how these searches are distributed across a few different domains###------######------######------######------######------######------


######------###age###------######------######------######------######------######------

age_pc <- stop_search_18to21_age %>%
  select(-age_pc) %>%
  group_by(age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  mutate(age_pc = count / sum(count))


age_cat <- c(10:17)
est_pc <- c(0.002, 0.008, 0.02, 0.07, 0.15, 0.2, 0.25, 0.3) #just kind of chose these...

age_est_pc <- data.frame(age_cat, est_pc) %>%
  pivot_wider(names_from = age_cat, values_from = est_pc) %>%
  unlist()


######------###gender###------######------######------######------######------######------

gen_pc <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  filter(!is.na(gender),
          gender != "") %>%
  mutate(date = ymd(date),
         month = format_ISO8601(date, precision = "ym")) %>%
  mutate(count = 1) %>%
  group_by(month, gender) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  pivot_wider(names_from = gender, values_from = count) %>%
  mutate(tot = Female + Male,
         Female = Female/tot,
         Male = Male/tot) %>%
  summarise(Female = mean(Female),
            Male = mean(Male)) %>%
  unlist()

######------###social class/deprivation/etc###------######------######------######------######------######------
# want to benchmark an answer to the question - what pc of these searches happened to 'deprived'/excluded children
# FOR OW MAYBE ask the q: what was the average deprivation score for a place a stop happened

cidi <- read_xls("/Users/katehayes/temp_data/CIDI_score.xls", sheet = 2)

cidi_score <- cidi %>%
  filter(lauaname == "Birmingham") %>%
  select(lsoaname, `CIDI Score, 2009`) %>%
  rename(lsoa = lsoaname,
         cidi = `CIDI Score, 2009`)

dep_pc <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(count = 1) %>%
  group_by(ward, lsoa) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  full_join(cidi_score) %>%
  filter(!is.na(cidi),
         cidi != "*") %>%
  mutate(cidi = as.numeric(cidi)) %>%
  mutate(av_cidi = cidi*count) %>%
  summarise(av_cidi = sum(av_cidi, na.rm=TRUE)/sum(count, na.rm=TRUE))
# answer - 36%

imd <- read_xlsx("/Users/katehayes/temp_data/File_1_-_IMD2019_Index_of_Multiple_Deprivation.xlsx", sheet = 2)

imd_score <- imd %>%
  filter(`Local Authority District name (2019)` == "Birmingham") %>%
  select(`LSOA name (2011)`, `Index of Multiple Deprivation (IMD) Decile`) %>%
  rename(lsoa = `LSOA name (2011)`,
         imd = `Index of Multiple Deprivation (IMD) Decile`)

imd_pc <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(count = 1) %>%
  group_by(ward, lsoa) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  full_join(imd_score) %>%
  filter(!is.na(imd)) %>%
  mutate(imd = as.numeric(imd)) %>%
  mutate(av_imd = imd*count) %>%
  summarise(av_imd = sum(av_imd, na.rm=TRUE)/sum(count, na.rm=TRUE))
# average imd decile for an area where a search happened is 2.407622 - 2nd/3rd most deprived decileish


cidi2019 <- read.csv("/Users/katehayes/temp_data/imd2019lsoa.csv")

cidi_score <- cidi2019 %>%
  filter(grepl("Income Deprivation Affecting Children Index", Indices.of.Deprivation),
         Measurement == "Score") %>%
  select(FeatureCode, Value) %>%
  rename(lsoa_code = FeatureCode,
         dep_dec = Value) %>%
  full_join(lsoa_shape %>%
              st_drop_geometry() %>%
              select(LSOA21CD, LSOA21NM) %>%
              rename(lsoa_code = LSOA21CD,
                     lsoa = LSOA21NM))

  cidi_pc <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(count = 1) %>%
  group_by(ward, lsoa) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  left_join(cidi_score %>%
              select(dep_dec, lsoa)) %>%
    filter(!is.na(dep_dec)) %>%
    mutate(dep_dec = as.numeric(dep_dec)) %>%
    mutate(av_dep = dep_dec*count) %>%
    summarise(av_dep = sum(av_dep, na.rm=TRUE)/sum(count, na.rm=TRUE))

  cidi_pc2 <- stop_search_1214to0322_reason_outcome_gen_ward %>%
    st_drop_geometry() %>%
    mutate(count = 1) %>%
    group_by(ward, lsoa) %>%
    summarise(count = sum(count)) %>%
    ungroup() %>%
    left_join(cidi_score %>%
                select(dep_dec, lsoa)) %>%
    filter(!is.na(dep_dec)) %>%
    mutate(dep_dec = as.numeric(dep_dec)) %>%
    mutate(av_dep = dep_dec*count)


    # summarise(av_dep = sum(av_dep, na.rm=TRUE)/sum(count, na.rm=TRUE))

# av is 	3.160485 index, 0.2636438 score... feel like you need to deal with the missing values

# this ranking is from here
# https://www.birmingham.gov.uk/downloads/file/2533/index_of_deprivation_2019

  text_list <- "Sparkbrook & Balsall Heath East 1 2 1 1 Bordesley Green 2 4 2 1 Lozells 3 3 - 1 Castle Vale 4 18 14 1 Alum Rock 5 5 - 1 Newtown 6 1 - 5 1 Heartlands 7 9 2 1 Gravelly Hill 8 10 2 1 Balsall Heath West 9 6 - 3 1 Birchfield 10 7 - 3 1 Shard End 11 12 1 1 Kingstanding 12 16 4 1 Garretts Green 13 14 1 1 Aston 14 11 - 3 1 Glebe Farm & Tile Cross 15 17 2 1 Handsworth 16 20 4 1 King's Norton South 17 13 - 4 1 Ward End 18 21 3 1 Bordesley & Highgate 19 15 - 4 1 Tyseley & Hay Mills 20 22 2 1 Small Heath 21 19 - 2 1 Frankley Great Park 22 24 2 1 Holyhead 23 23 - 1 Nechells 24 8 - 16 1 Druids Heath & Monyhull 25 27 2 1 Stockland Green 26 28 2 1 Yardley West & Stechford 27 26 - 1 1 Perry Common 28 29 1 2 Soho & Jewellery Quarter 29 25 - 4 2 Sparkhill 30 30 - 2 Bartley Green 31 31 - 2 Allens Cross 32 35 3 2 Bromford & Hodge Hill 33 33 - 2 Billesley 34 37 3 2 Weoley & Selly Oak 35 41 6 2 Acocks Green 36 34 - 2 2 Rubery & Rednal 37 40 3 2 Erdington 38 36 - 2 2 Pype Hayes 39 39 - 2 Longbridge & West Heath 40 42 2 2 North Edgbaston 41 38 - 3 2 Ladywood 42 32 - 10 2 Moseley 43 44 1 2 King's Norton North 44 46 2 2 Sheldon 45 52 7 3 Stirchley 46 50 4 3 Highter's Heath 47 47 - 3 South Yardley 48 45 - 3 3 Yardley East 49 43 - 6 3 Hall Green North 50 49 - 1 3 Quinton 51 51 - 3 Oscott 52 53 1 3 Brandwood & King's Heath 53 54 1 3 Handsworth Wood 54 48 - 6 3 Harborne 55 55 - 3 Perry Barr 56 58 2 4 Bournville & Cotteridge 57 56 - 1 4 Sutton Reddicap 58 60 2 4 Northfield 59 57 - 2 4 Bournbrook & Selly Park 60 61 1 5 Edgbaston 61 59 - 2 5 Hall Green South 62 62 - 6 Sutton Trinity 63 63 - 6 Sutton Walmley & Minworth 64 64 - 7 Sutton Vesey 65 65 - 7 Sutton Mere Green 66 66 - 7 Sutton Wylde Green 67 68 1 7 Sutton Four Oaks 68 67 - 1 8 Sutton Roughley 69 69 - 9"

  wards_dep <- data.frame(fix_list(text_list) %>%
                          unlist()) %>%
    mutate(rank = row_number()) %>%
    rename(ward = `fix_list.text_list......unlist..`) %>%
    mutate(ward = str_match(ward, "^[^A-Z]*(.+)[^a-z]*$")[,2],
           ward = gsub("[[:space:]]*$", "", ward))

  ward_pc <- stop_search_1214to0322_reason_outcome_gen_ward %>%
    st_drop_geometry() %>%
    mutate(count = 1) %>%
    group_by(ward) %>%
    summarise(count = sum(count)) %>%
    ungroup() %>%
    left_join(wards_dep) %>%
    arrange(rank) %>%
    mutate(pc = count/sum(count),
           csum = cumsum(count),
           cpc = csum/sum(count))

# ladywood has so so so so so much more stop and search than anywhere else

# just for now, going to say 75% of stop and search happens to close + excluded children

  class <- c("Included", "Excluded/Close")
  est_pc <- c(0.25, 0.75) #just kind of chose these...

  class_pc <- data.frame(class, est_pc) %>%
    pivot_wider(names_from = class, values_from = est_pc) %>%
    unlist()

  ######------###bringing together###------######------######------######------######------######------


stop_search <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(count = 1) %>%
  group_by(date, ward, lsoa) %>%
  summarise(count = sum(count)) %>%
  mutate(Boys = count*gen_pc[["Male"]],
         Girls = count*gen_pc[["Female"]]) %>%
  select(-count) %>%
  pivot_longer(c(Boys, Girls),
               names_to = "gender",
               values_to = "count") %>%
  mutate(`10` = count*age_est_pc[["10"]],
         `11` = count*age_est_pc[["11"]],
         `12` = count*age_est_pc[["12"]],
         `13` = count*age_est_pc[["13"]],
         `14` = count*age_est_pc[["14"]],
         `15` = count*age_est_pc[["15"]],
         `16` = count*age_est_pc[["16"]],
         `17` = count*age_est_pc[["17"]]) %>%
  select(-count) %>%
  pivot_longer(c(`10`:`17`),
               names_to = "age",
               values_to = "count") %>%
    mutate(`Included` = count*class_pc[["Included"]],
           `Excluded/Close` = count*class_pc[["Excluded/Close"]]) %>%
    select(-count) %>%
    pivot_longer(c(`Included`, `Excluded/Close`),
                 names_to = "class",
                 values_to = "count") %>%
    group_by(date, gender, age, class) %>%
    summarise(count = sum(count))

  # do this properly later, including the fact that you wont be ssed if you're incarcerated
  # each year of girls 7000 - 80/20 I/C+E - 5600/1400
  # each year or boys 7500 - 75/25 I/C+E - 5625/1875

  # trying to calculate the weekly rate
ss_boy <- stop_search %>%
  filter(gender == "Boys") %>%
  arrange(date) %>%
  mutate(date = ymd(date),
         year = format_ISO8601(date, precision = "y"),
         year_day = yday(date) - 1) %>%
  mutate(t = (as.numeric(year)-2010)*52 + floor(year_day/7)) %>%
  group_by(t, gender, age, class) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = class, values_from = count) %>%
  mutate(`Included` = `Included`/6412.5,
         `Excluded/Close` = `Excluded/Close`/2137.5) %>%
  pivot_longer(c(`Included`, `Excluded/Close`),
               names_to = "class", values_to = "rate")



  ss_girl <- stop_search %>%
    filter(gender == "Girls") %>%
    arrange(date) %>%
    mutate(date = ymd(date),
           year = format_ISO8601(date, precision = "y"),
           year_day = yday(date) - 1) %>%
    mutate(t = (as.numeric(year)-2010)*52 + floor(year_day/7)) %>%
    group_by(t, gender, age, class) %>%
    summarise(count = sum(count)) %>%
    pivot_wider(names_from = class, values_from = count) %>%
    mutate(`Included` = `Included`/6384,
           `Excluded/Close` = `Excluded/Close`/1596) %>%
    pivot_longer(c(`Included`, `Excluded/Close`),
                 names_to = "class", values_to = "rate")




stop_search <- bind_rows(ss_boy, ss_girl) %>%
  pivot_wider(names_from = gender, values_from = rate) %>%
  filter(t <= 520)

add_early <- stop_search %>%
  filter(t <= 262) %>%
  pivot_longer(c(Boys, Girls),
               names_to = "gender", values_to = "rate") %>%
  group_by(gender, age, class) %>%
  summarise(rate = mean(rate)) %>%
  mutate(t = 0) %>%
  pivot_wider(names_from = gender,
              values_from = rate)

stop_search <- stop_search %>%
  bind_rows(add_early)

add_early <- add_early %>%
  mutate(t = 254)

stop_search <- stop_search %>%
  bind_rows(add_early) %>%
  arrange(t)

t_ss <- stop_search %>%
  ungroup() %>%
  filter(class == "Included",
         age == 10)

t_ss <- t_ss$t

ss_i10 <- stop_search %>%
  filter(class == "Included",
         age == 10) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec10 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 10) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i11 <- stop_search %>%
  filter(class == "Included",
         age == 11) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec11 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 11) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i12 <- stop_search %>%
  filter(class == "Included",
         age == 12) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec12 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 12) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i13 <- stop_search %>%
  filter(class == "Included",
         age == 13) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec13 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 13) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i14 <- stop_search %>%
  filter(class == "Included",
         age == 14) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec14 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 14) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i15 <- stop_search %>%
  filter(class == "Included",
         age == 15) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec15 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 15) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i16 <- stop_search %>%
  filter(class == "Included",
         age == 16) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec16 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 16) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_i17 <- stop_search %>%
  filter(class == "Included",
         age == 17) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

ss_ec17 <- stop_search %>%
  filter(class == "Excluded/Close",
         age == 17) %>%
  ungroup() %>%
  select(Boys, Girls) %>%
  as.matrix()

save(t_ss, file = "Output/Data/Input/t_ss.Rdata")

save(ss_i10, file = "Output/Data/Input/ss_i10.Rdata")
save(ss_i11, file = "Output/Data/Input/ss_i11.Rdata")
save(ss_i12, file = "Output/Data/Input/ss_i12.Rdata")
save(ss_i13, file = "Output/Data/Input/ss_i13.Rdata")
save(ss_i14, file = "Output/Data/Input/ss_i14.Rdata")
save(ss_i15, file = "Output/Data/Input/ss_i15.Rdata")
save(ss_i16, file = "Output/Data/Input/ss_i16.Rdata")
save(ss_i17, file = "Output/Data/Input/ss_i17.Rdata")

save(ss_ec10, file = "Output/Data/Input/ss_ec10.Rdata")
save(ss_ec11, file = "Output/Data/Input/ss_ec11.Rdata")
save(ss_ec12, file = "Output/Data/Input/ss_ec12.Rdata")
save(ss_ec13, file = "Output/Data/Input/ss_ec13.Rdata")
save(ss_ec14, file = "Output/Data/Input/ss_ec14.Rdata")
save(ss_ec15, file = "Output/Data/Input/ss_ec15.Rdata")
save(ss_ec16, file = "Output/Data/Input/ss_ec16.Rdata")
save(ss_ec17, file = "Output/Data/Input/ss_ec17.Rdata")


stop_search_arrest <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  arrange(date) %>%
  mutate(date = ymd(date),
         year = format_ISO8601(date, precision = "y"),
         year_day = yday(date) - 1) %>%
  mutate(t = (as.numeric(year)-2010)*52 + floor(year_day/7)) %>%
  mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                             !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
  mutate(count = 1) %>%
  group_by(t, ward, lsoa, outcome) %>%
  summarise(count = sum(count)) %>%
  ungroup()



ss_arrest_rate <- stop_search_arrest %>%
  group_by(t, outcome) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t) %>%
  mutate(tot = sum(count),
         pc = count/tot) %>%
  select(-c(count, tot)) %>%
  pivot_wider(names_from = outcome,
              values_from = pc,
              values_fill = 0)

ss_arrest_rate %>%
  ggplot() +
  geom_bar(aes(x = t, y = Arrest),
           stat = "identity", position = "dodge")


ss_arrest <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(date = ymd(date)) %>%
  filter(date >= "2017-01-06",
         date <= "2022-02-04") %>%
  mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                             !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
  mutate(count = 1) %>%
  group_by(date, outcome) %>%
  summarise(count = sum(count)) %>%
  left_join(sec60_data %>%
              filter(grepl("Birmingham", NPU)) %>%
              select(`Stop Date`) %>%
              distinct() %>%
              rename(date = `Stop Date`) %>%
              mutate(date = ymd(date)) %>%
              arrange(date) %>%
              mutate(sec_60 = "Yes")) %>%
  mutate(sec_60 = ifelse(is.na(sec_60), "No", sec_60)) %>%
  group_by(date, sec_60) %>%
  mutate(tot = sum(count),
         pc = count/tot) %>%
  ungroup()


scatter_pl <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(date = ymd(date)) %>%
  filter(date >= "2017-01-06",
         date <= "2022-02-04") %>%
  mutate(outcome = case_when(outcome %in% c("Arrest", "Suspect arrested") ~ "Arrest",
                             !(outcome%in% c("Arrest", "Suspect arrested")) ~ "Other")) %>%
  mutate(count = 1) %>%
  group_by(date, outcome) %>%
  summarise(count = sum(count)) %>%
  left_join(sec60_data %>%
              filter(grepl("Birmingham", NPU)) %>%
              select(`Stop Date`) %>%
              distinct() %>%
              rename(date = `Stop Date`) %>%
              mutate(date = ymd(date)) %>%
              arrange(date) %>%
              mutate(sec_60 = "Yes")) %>%
  mutate(sec_60 = ifelse(is.na(sec_60), "No", sec_60)) %>%
  ungroup() %>%
  pivot_wider(names_from = outcome,
              values_from = count,
              values_fill = 0) %>%
  mutate(tot = Arrest + Other) %>%
  ggplot() +
  geom_point(aes(x = tot, y = Arrest))
  # geom_bin2d(aes(x = tot, y = Arrest))
scatter_pl




# check <- ss_arrest %>%
#   select(-count) %>%
#   pivot_wider(names_from = outcome,
#               values_from = pc,
#               values_fill = 0) %>%
#   group_by(sec_60) %>%
#   summarise(Arrest = mean(Arrest))

# average arrest rate under normal powers versus sec 60
# No - 0.15545784
# Yes - 0.08908092

check <- ss_arrest %>%
  select(date, tot, sec_60) %>%
  distinct(date, tot, sec_60) %>%
  group_by(sec_60) %>%
  summarise(tot = mean(tot))

# the average number of searches ON THE DAYS SEARCHES HAPPENED (of course some days no searches)
# when its normal v sec 60
# No - 4.974968
# Yes - 11.455446

