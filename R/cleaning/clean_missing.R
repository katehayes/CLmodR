# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # LOOKED AFTER CHILDREN - MISSING EPISODES # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Children missing at 31 March
# Children who had a missing incident during the year
# Children who went missing more than once during the year
# Number of missing incidents during the year
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/children-looked-after-in-england-including-adoptions_2022/data/la_children_who_were_missing_or_away_from_placement_without_authorisation.csv")

cmiss_data_18to22 <- c_data %>%
  filter(la_name %in% LAs_in_WMPF_list) %>%
  filter(grepl("miss", cla_group)) %>%
  select(time_period, la_name, cla_group, number) %>%
  filter(cla_group %in% c("Children missing at 31 March",
                          "Children who had a missing incident during the year",
                          "Children who went missing more than once during the year",
                          "Number of missing incidents during the year")) %>%
  mutate(cla_group = case_when(cla_group == "Children missing at 31 March" ~ "Missing at 31 March",
                               cla_group == "Children who had a missing incident during the year" ~ "Missing children",
                               cla_group == "Children who went missing more than once during the year" ~ "Repeatedly missing children",
                               cla_group == "Number of missing incidents during the year" ~ "Missing incidents")) %>%
  rename(end_period_year = time_period,
         level = la_name,
         measure = cla_group,
         count = number) %>%
  mutate(count = as.numeric(count),
         count = ifelse(is.na(count), 0, count)) %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")



# Children who had a missing incident during the year
# Miss_Miss_DuringYear: Children looked after during the year ending 31 March 2017 who had a missing incident during the year

# Number of missing incidents during the year
# Miss_Miss_Incs: Number of missing incidents during the year for children looked after during the year ending 31 March 2017

# Children who went missing more than once during the year
# Miss_Miss_MoreOnce: Children looked after during the year ending 31 March 2017 who went missing more than once during the year

# Children missing at 31 March
# Miss_Miss_31Mar: Children looked after who were missing at 31 March 2017
# x is between 1 and 5 - will use midpoint ie 3
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/SFR50_2017_UnderlyingData/SFR50_Missing_2017.csv")
cmiss_data_17 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, starts_with("Miss_Miss")) %>%
  mutate(across(starts_with("Miss_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("Miss_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("Miss_Miss"), ~as.numeric(.x))) %>%
  pivot_longer(-geog_n,
               names_to = "measure",
               values_to = "count") %>%
  mutate(measure = case_when(measure == "Miss_Miss_DuringYear" ~ "Missing children",
                             measure == "Miss_Miss_Incs" ~ "Missing incidents",
                             measure == "Miss_Miss_MoreOnce" ~ "Repeatedly missing children",
                             measure == "Miss_Miss_31Mar" ~ "Missing at 31 March")) %>%
  rename(level = geog_n) %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-measure,
               names_to = "level", values_to = "count") %>%
  mutate(end_period_year = 2017)

# For confidentiality purposes, numbers from one to five inclusive have been suppressed and replaced by a cross (x).
# x is between 1 and 5 - will use midpoint ie 3
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/SFR41_2016_UD/SFR41_Missing2016.csv")
cmiss_data_16 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, starts_with("CLA_Miss")) %>%
  mutate(across(starts_with("CLA_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("CLA_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("CLA_Miss"), ~as.numeric(.x))) %>%
  pivot_longer(-geog_n,
               names_to = "measure",
               values_to = "count") %>%
  mutate(measure = case_when(measure == "CLA_MissDuringYear" ~ "Missing children",
                             measure == "CLA_MissIncs" ~ "Missing incidents",
                             measure == "CLA_MissMoreOnce" ~ "Repeatedly missing children",
                             measure == "CLA_Miss31Mar" ~ "Missing at 31 March")) %>%
  rename(level = geog_n) %>%
  mutate(end_period_year = 2016) %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")

# x is between 1 and 5 - will use midpoint ie 3
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/SFR34_2015_UnderlyingData/SFR34_Missing2015.csv")
cmiss_data_15 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, starts_with("CLA_Miss")) %>%
  mutate(across(starts_with("CLA_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("CLA_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("CLA_Miss"), ~as.numeric(.x))) %>%
  pivot_longer(-geog_n,
               names_to = "measure",
               values_to = "count") %>%
  mutate(measure = case_when(measure == "CLA_MissDuringYear" ~ "Missing children",
                             measure == "CLA_MissIncs" ~ "Missing incidents",
                             measure == "CLA_MissMoreOnce" ~ "Repeatedly missing children",
                             measure == "CLA_Miss31Mar" ~ "Missing at 31 March")) %>%
  rename(level = geog_n) %>%
  mutate(end_period_year = 2015) %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")


# here's where it gets generic
# CLA_Miss: Children looked after at 31 March 2014 missing from their agreed placement for more than 24 hours
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/UD_SFR36_2014/SFR36_CLA2014.csv")
cmiss_data_14 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, CLA_Miss) %>%
  mutate(across(starts_with("CLA_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("CLA_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("CLA_Miss"), ~as.numeric(.x))) %>%
  rename(level = geog_n,
         count = CLA_Miss) %>%
  mutate(end_period_year = 2014,
         measure = "Missing at 31 March") %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")

# CLA_Miss: Children looked after at 31 March 2013 missing from their agreed placement for more than 24 hours
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/SFR36_UnderlyingData/SFR36_CLA2013.csv")
cmiss_data_13 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, CLA_Miss) %>%
  mutate(across(starts_with("CLA_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("CLA_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("CLA_Miss"), ~as.numeric(.x))) %>%
  rename(level = geog_n,
         count = CLA_Miss) %>%
  mutate(end_period_year = 2013,
         measure = "Missing at 31 March") %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")

# CLA_Miss: Children looked after at 31 March 2012 missing from their agreed placement for more than 24 hours
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/UnderlyingData/SFR20_CLA2012.csv")
cmiss_data_12 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, CLA_Miss) %>%
  mutate(across(starts_with("CLA_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("CLA_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("CLA_Miss"), ~as.numeric(.x))) %>%
  rename(level = geog_n,
         count = CLA_Miss) %>%
  mutate(end_period_year = 2012,
         measure = "Missing at 31 March") %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")

# CLA_Miss: Children looked after at 31 March 2011 missing from their agreed placement for more than 24 hours
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/underlying_20data_20sfr212011/SFR21_CLA.csv")
cmiss_data_11 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, CLA_Miss) %>%
  mutate(across(starts_with("CLA_Miss"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("CLA_Miss"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("CLA_Miss"), ~as.numeric(.x))) %>%
  rename(level = geog_n,
         count = CLA_Miss) %>%
  mutate(end_period_year = 2011,
         measure = "Missing at 31 March") %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")


# MarPlace_M3_2010:	Children looked after at 31 March 2010 missing for more than 24 hours
# from agreed placement and whereabouts unknown
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/sfr27-2010ud (1)/SFR27_2010_March.csv")
cmiss_data_10 <- c_data %>%
  filter(geog_n %in% LAs_in_WMPF_list) %>%
  select(geog_n, MarPlace_M3_2010) %>%
  mutate(across(starts_with("MarPlace_M3"), ~ifelse(.x == "x", 3, .x)),
         across(starts_with("MarPlace_M3"), ~ifelse(.x == "..", 0, .x)),
         across(starts_with("MarPlace_M3"), ~as.numeric(.x))) %>%
  rename(level = geog_n,
         count = MarPlace_M3_2010) %>%
  mutate(end_period_year = 2010,
         measure = "Missing at 31 March") %>%
  pivot_wider(names_from = level,
              values_from = count) %>%
  mutate(`West Midlands (police)` = Birmingham + Coventry + Dudley + Sandwell + Solihull + Walsall + Wolverhampton) %>%
  select(-c(Coventry:Wolverhampton)) %>%
  pivot_longer(-c(end_period_year, measure),
               names_to = "level", values_to = "count")

care_miss_10to22 <- cmiss_data_18to22 %>%
  bind_rows(cmiss_data_17,
            cmiss_data_16,
            cmiss_data_15,
            cmiss_data_14,
            cmiss_data_13,
            cmiss_data_12,
            cmiss_data_11,
            cmiss_data_10)


save(care_miss_10to22, file = "Output/Data/Cleaned/care_miss_10to22.Rdata")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # #ALL MISSING CHILDREN # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ALL AT WEST MIDS POLICE LEVEL
# need to record the measure - whether its number of missing incidents or number of children who went missing



#  financial years 2017-2018 to 2020-21 yearly (01st April until 31st March)
# https://foi.west-midlands.police.uk/wp-content/uploads/2021/07/ATTACHMENT_-4.pdf



# 2019 2020 2021 yearly (calender year jan-dec)
# https://foi.west-midlands.police.uk/wp-content/uploads/2022/03/36A_22_attachment.pdf

# 1 April 2021 and 31 March 2022
# https://foi.west-midlands.police.uk/wp-content/uploads/2022/08/875A_22_attachment.pdf



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# from the missing persons unit statistical report download page
# 2016-17 and 2019-20: both have finer age detail than just 0-17
# https://missingpersons.police.uk/cy-gb/resources/downloads/missing-persons-statistical-bulletins#
# for earlier years its just a pdf

m_data <- read_xlsx("/Users/katehayes/CLmodelR/temp_data/Final  UKMPU_Statistics_Report_2019_2020.xlsx", sheet = 8, skip = 3)

miss_data_1920 <- m_data[42,2:4] %>%
  rename(level = `...2`,
         `0-11` = `0-11yrs...3`,
         `12-17` = `12-17yrs...4`) %>%
  mutate(level = "West Midlands (police)",
         end_period_year = 2020,
         end_period_month = "March",
         period_length = "Year",
         measure = "Missing incidents") %>%
  pivot_longer(c(`0-11`, `12-17`),
               names_to = "age",
               values_to = "count")


m_data <- read_xls("/Users/katehayes/CLmodelR/temp_data/UKMPU Missing Persons Data Report 2016-2017 v 1 Final.xls", sheet = 12, skip = 6)

miss_data_1617 <- m_data[44,2:7] %>%
  rename(level = `...2`,
         `0-4` = `0-4yrs...3`,
         `5-8` = `5-8yrs...4`,
         `9-11` = `9-11yrs...5`,
         `12-14` = `12-14yrs...6`,
         `15-17` = `15-17yrs...7`) %>%
  pivot_longer(-level,
               names_to = "age",
               values_to = "count") %>%
  mutate(level = "West Midlands (police)",
         end_period_year = 2017,
         end_period_month = "March",
         period_length = "Year",
         measure = "Missing incidents")





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# here is some FOI data
# 2018 2019 2020 monthly jan - dec
# https://foi.west-midlands.police.uk/wp-content/uploads/2021/01/40A_21_attachment.pdf
# "Count of missing person reports" --- going to call this number of incidents
m_list <- "January 398 414 907 February 342 383 850 March 349 402 804 April 440 340 536 May 425 450 630 June 376 425 672 July 347 465 702 August 370 364 753 September 344 377 750 October 368 425 791 November 440 579 689 December 397 799 690"

m_data <- fix_miss_list(m_list)

miss_data_18to20 <- m_data %>%
  rename(end_period_month = `...1`,
         `2018` = `...2`,
         `2019` = `...3`,
         `2020` = `...4`) %>%
  mutate(end_period_month = str_remove_all(end_period_month, " "),
         period_length = "Month",
         level = "West Midlands (police)",
         measure = "Missing incidents",
         age = '0-17') %>%
  pivot_longer(starts_with("20"),
               names_to = "end_period_year",
               values_to = "count")


# 2015/16
# 5060 - missing incidents
# 1850 - missing individuals
#
# 2014/15
# 2902 - missing incidents
# 1740 - missing individuals
#
# 2013/14
# 1722 - missing incidents
# 1232 - missing individuals

# 2012/13 - from then back we only have total missing at WMP level and then child/adult ratio at E/W level

missing_13to20_age <- bind_rows(miss_data_1617 %>%
                                  mutate(end_period_year = as.numeric(end_period_year)),
                                # miss_data_18to20 %>%
                                #   mutate(end_period_year = as.numeric(end_period_year)),
                                miss_data_1920 %>%
                                  mutate(end_period_year = as.numeric(end_period_year))) %>%
  mutate(count = as.numeric(count)) %>%
  add_row(level = "West Midlands (police)", age = "0-17", end_period_month = "March", period_length = "Year",
          end_period_year = 2016, measure = "Missing incidents", count = 5060) %>%
  add_row(level = "West Midlands (police)", age = "0-17", end_period_month = "March", period_length = "Year",
          end_period_year = 2016, measure = "Missing children", count = 1850) %>%
  add_row(level = "West Midlands (police)", age = "0-17", end_period_month = "March", period_length = "Year",
          end_period_year = 2015, measure = "Missing incidents", count = 2902) %>%
  add_row(level = "West Midlands (police)", age = "0-17", end_period_month = "March", period_length = "Year",
          end_period_year = 2015, measure = "Missing children", count = 1740) %>%
  add_row(level = "West Midlands (police)", age = "0-17", end_period_month = "March", period_length = "Year",
          end_period_year = 2014, measure = "Missing incidents", count = 1722) %>%
  add_row(level = "West Midlands (police)", age = "0-17", end_period_month = "March", period_length = "Year",
          end_period_year = 2014, measure = "Missing children", count = 1232)

save(missing_13to20_age, file = "Output/Data/Cleaned/missing_13to20_age.Rdata")
