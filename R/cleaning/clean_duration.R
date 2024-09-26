library(readr)

duration_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/Supplementary_Tables/Ch 7 - Children in youth custody.xlsx", sheet = 23, skip = 3)


dur_data <- duration_data %>% 
  select(-c(starts_with("P"))) %>% 
  filter(`Legal basis` != "Remand",
         `Number\r\nof nights` != "Total") %>% 
  pivot_longer(!c(`Legal basis`, `Number\r\nof nights`),
               names_to = "end_period_year",
               values_to = "count") %>% 
  mutate(end_period_year =as.numberic(readr::parse_number(end_period_year)))

med <- dur_data %>% 
  filter(`Number\r\nof nights` == "Median number of nights")

dur_dist_plot <- dur_data %>% 
  mutate(`Number\r\nof nights` = factor(`Number\r\nof nights`, 
                                           levels = c("1 to 91 nights", "92 to 182 nights",
                                                      "183 to 273 nights", "274 to 365 nights",
                                                      "274+ nights"))) %>% 
  filter(`Number\r\nof nights` != "Median number of nights") %>% 
  group_by(end_period_year, `Legal basis`) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc, fill = `Number\r\nof nights`),
           stat = "identity", position = "dodge") +
  facet_grid(~`Legal basis`)

dur_dist_plot


dur_med_plot <- med %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity", position = "dodge") +
  facet_grid(~`Legal basis`)
  
dur_med_plot
# where is/how much do we have of duration data at west mids (or even birm) level??
# youth justice statistics supplementaries chapter 7 - Children in youth custody
# sheet 7.32 Legal basis episodes ending by Youth Justice Service region and nights, years ending March 2019 to 2021
# CHAPTER 7 - children in youth custody -Table 7.32: Custodial episodes ending by YOT
# region(1) and nights, years ending March 2015 to 2019


# just eyeballing and overall west mids looks a bit higher than overall country total
# but who knows whether this is a diffferent breakdown of legal basis for detention
# or whether its longer sentences for the same type of detention


# so we have: mean nights by legal basis at eng/wales
# breakdown of disposals by legal basis at eng/wales
# breakdown of disposals by legal basis at west mids
# mean nights overall at eng/wales
# mean nights overall at west mids

# prob enough to put ballpark on mean nights at west mids?



# youth-justice-stats-2013-14-supp-volumes/Ch7 - Young People in Custody.xls

time_data <- read_xls("/Users/katehayes/temp_data/youth-justice-stats-2013-14-supp-volumes/Ch7 - Young People in Custody.xls", sheet = 10, skip = 2, n_max = 3)
time_data <- time_data[,1:6]
colnames(time_data)[1] <- "legal_basis"
colnames(time_data)[2] <- "2010"
colnames(time_data)[3] <- "2011"
colnames(time_data)[4] <- "2012"
colnames(time_data)[5] <- "2013"
colnames(time_data)[6] <- "2014"

time_data_1014 <- time_data %>%
  pivot_longer(starts_with("20"),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
                                 legal_basis == "S90/91/226/226B/228 combined" ~ "Section 90-92 or 226-228",
                                 legal_basis == "Remand" ~ "Remand")) %>%
  mutate(measure = "Mean")

# only reading in the 2015 data to get the deflation factor
# youth-justice-statistics-supplementary-tables/Ch7 - Young people in custody in the youth secure estate.xls
time_data <- read_xls("/Users/katehayes/temp_data/youth-justice-statistics-supplementary-tables/Ch7 - Young people in custody in the youth secure estate.xls",
                      sheet = 11, skip = 3, n_max = 3)

time_data <- time_data[,1:6]
colnames(time_data)[1] <- "legal_basis"
colnames(time_data)[2] <- "2011"
colnames(time_data)[3] <- "2012"
colnames(time_data)[4] <- "2013"
colnames(time_data)[5] <- "2014"
colnames(time_data)[6] <- "2015"

time_data1115 <- time_data %>%
  pivot_longer(starts_with("20"),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
                                 legal_basis == "S90/91/226/226B/228 combined" ~ "Section 90-92 or 226-228",
                                 legal_basis == "Remand" ~ "Remand")) %>%
  mutate(measure = "Mean")



# STILL IN THE EARLIER ONESYouth justice statistics: 2018 to 2019
# CHAPTER 7 - children in youth custody
##Table 7.27b: Custodial episodes ending (for custodial episodes less than 91 nights) by custodial order type and nights, years ending March 2015 to 2019
# i think this is eng and wales
time_data <- read_xlsx("/Users/katehayes/temp_data/youth-justice-stats-supplementary-tables-march-2019/Ch 7 - Children in youth custody.xls", sheet = 28, skip = 3, n_max = 25)
time_data <- time_data[,1:7]

colnames(time_data)[1] <- "legal_basis"
colnames(time_data)[2] <- "number_nights"
colnames(time_data)[3] <- "2015"
colnames(time_data)[4] <- "2016"
colnames(time_data)[5] <- "2017"
colnames(time_data)[6] <- "2018"
colnames(time_data)[7] <- "2019"


time_data1519 <- time_data %>%
  mutate(legal_basis = vec_fill_missing(legal_basis, direction = c("down")))%>%
  filter(number_nights == "Median number of nights") %>%
  pivot_longer(starts_with("20"),
               names_to="end_period_year",
               values_to="nights") %>%
  select(-number_nights) %>%
  mutate(legal_basis = case_when(legal_basis == "Detention and Training Order only(2)" ~ "Detention and Training Order",
                                 legal_basis == "Other / Combination(3)" ~ "Section 90-92 or 226-228",
                                 legal_basis == "Remand only(1)" ~ "Remand")) %>%
  mutate(measure = "Median")






# DIFFERENT SET OF DATA
# GETTING TOTAL COUNTRY MEDIAN AND WEST MIDLANDS MEDIAN (OR MEAN)
# LATEST DATA
time_data <- read_xlsx("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 7 - Children in youth custody.xls", sheet = 26, skip = 3, n_max = 12)
time_data <- time_data[12,2:4] ##lol find a better name than 2
colnames(time_data)[1] <- "2019"
colnames(time_data)[2] <- "2020"
colnames(time_data)[3] <- "2021"

time_data1921ew <- time_data %>%
  pivot_longer(everything(),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(measure = "Median", level = "Eng/Wales")




time_data <- read_xlsx("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 7 - Children in youth custody.xls",
                       sheet = 33, skip = 65, n_max = 1, col_names = FALSE)
time_data <- time_data[1,2:4] ##lol find a better name than 2
colnames(time_data)[1] <- "2019"
colnames(time_data)[2] <- "2020"
colnames(time_data)[3] <- "2021"

time_data1921wm <- time_data %>%
  pivot_longer(everything(),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(measure = "Median", level = "West Midlands (region)")


# 2017/18
time_data <- read_xlsx("/Users/katehayes/temp_data/youth_justice_statistics_supplementary_tables_2017_2018/Ch 7 - Children in youth custody.xls",
                       sheet = 25, skip = 15, n_max = 1, col_names = FALSE)
time_data <- time_data[1,2:5] ##lol find a better name than 2
colnames(time_data)[1] <- "2015"
colnames(time_data)[2] <- "2016"
colnames(time_data)[3] <- "2017"
colnames(time_data)[4] <- "2018"


time_data1518ew <- time_data %>%
  pivot_longer(everything(),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(measure = "Median", level = "Eng/Wales")

# west midlaands level
time_data <- read_xlsx("/Users/katehayes/temp_data/youth_justice_statistics_supplementary_tables_2017_2018/Ch 7 - Children in youth custody.xls",
                       sheet = 32, skip = 74, n_max = 1, col_names = FALSE)
time_data <- time_data[1,2:5]
colnames(time_data)[1] <- "2015"
colnames(time_data)[2] <- "2016"
colnames(time_data)[3] <- "2017"
colnames(time_data)[4] <- "2018"


time_data1518wm <- time_data %>%
  pivot_longer(everything(),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(measure = "Median", level = "West Midlands (region)")


# that is the last breakdown to west mids level i think
# 2015 data - taking 'average between legal basis type' because it
# matches with average in 2013/14
time_data <- read_xls("/Users/katehayes/temp_data/youth-justice-statistics-supplementary-tables/Ch7 - Young people in custody in the youth secure estate.xls",
                      sheet = 11, skip = 7, n_max = 1, col_names = FALSE)

time_data <- time_data[1,2:6]
colnames(time_data)[1] <- "2011"
colnames(time_data)[2] <- "2012"
colnames(time_data)[3] <- "2013"
colnames(time_data)[4] <- "2014"
colnames(time_data)[5] <- "2015"


time_data1115ew <- time_data %>%
  pivot_longer(everything(),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(measure = "Mean", level = "Eng/Wales")


# 213/14data
time_data <- read_xls("/Users/katehayes/temp_data/youth-justice-stats-2013-14-supp-volumes/Ch7 - Young People in Custody.xls",
                      sheet = 10, skip = 6, n_max = 1, col_names = FALSE)

time_data <- time_data[1,2]
colnames(time_data)[1] <- "2010"

time_data10 <- time_data %>%
  pivot_longer(everything(),
               names_to="end_period_year",
               values_to="nights") %>%
  mutate(measure = "Mean", level = "Eng/Wales")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together, # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


custody_avduration_10to19_legal_basis <- time_data_1014 %>%
  bind_rows(time_data1115 %>%
              filter(end_period_year == "2015")) %>%
  bind_rows(time_data1519) %>%
  mutate(period_length = "Year",
         end_period_month = "March") %>%
  mutate(level = "Eng/Wales") %>%
  mutate(end_period_year = as.numeric(end_period_year))

save(custody_avduration_10to19_legal_basis, file = "Output/Data/Cleaned/custody_avduration_10to19_legal_basis.Rdata")



custody_avduration_10to21<- time_data10 %>%
  bind_rows(time_data1115ew) %>%
  bind_rows(time_data1518wm) %>%
  bind_rows(time_data1518ew) %>%
  bind_rows(time_data1921wm) %>%
  bind_rows(time_data1921ew) %>%
  mutate(period_length = "Year",
         end_period_month = "March") %>%
  mutate(end_period_year = as.numeric(end_period_year))

save(custody_avduration_10to21, file = "Output/Data/Cleaned/custody_avduration_10to21.Rdata")

