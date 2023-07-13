
# god, police are using 2011 LSOAs for the data release..
# https://webarchive.nationalarchives.gov.uk/ukgwa/20160110200248/http://www.ons.gov.uk/ons/guide-method/geography/products/census/spatial/2011/index.html
# this is the link from the police data website
lsoa_shape <- st_read("/Users/katehayes/THdata/Lower_layer_super_output_areas_(E+W)_2011_Boundaries_(Full_Extent)_V2/LSOA_2011_EW_BFE_V2.shp")

w_shape <- st_read("/Users/katehayes/CLmodelR/temp_data/Wards_December_2022_Boundaries_UK_BFC_-3416072881830331872/WD_DEC_2022_UK_BFC.shp")
lsoa2LA <- read_xlsx("/Users/katehayes/THdata/LSOA11_WD21_LAD21_EW_LU_V2.xlsx")



ss_geom <- extract_ss(common_path = "/Users/katehayes/CLmodelR/temp_data/bc285009488bfa668a43b86ba318bc626135d92d")  %>%
  bind_rows(extract_ss(common_path = "/Users/katehayes/CLmodelR/temp_data/2020-04")) %>%
  bind_rows(extract_ss(common_path = "/Users/katehayes/CLmodelR/temp_data/2017-06")) %>%
  filter(!is.na(Latitude),
         !is.na(Longitude)) %>%
  distinct(Latitude, Longitude) %>%
  st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326)


ss_geom$lsoa <- lonlat_to_lsoa(ss_sf = ss_geom)
ss_geom$lsoa_shape <- lonlat_to_lsoashape(ss_sf = ss_geom)

ss_geom <- ss_geom %>%
  left_join(lsoa2LA %>%
              select(LSOA11NM, LAD21NM, WD21NM) %>%
              rename(lsoa = LSOA11NM,
                     LA = LAD21NM,
                     ward = WD21NM))


ss_raw_1214to0322 <- extract_ss(common_path = "/Users/katehayes/CLmodelR/temp_data/bc285009488bfa668a43b86ba318bc626135d92d") %>%
  bind_rows(extract_ss(common_path = "/Users/katehayes/CLmodelR/temp_data/2020-04")) %>%
  bind_rows(extract_ss(common_path = "/Users/katehayes/CLmodelR/temp_data/2017-06")) %>%
  rename(outcome = Outcome,
         powers = Legislation,
         search_type = Type,
         date = Date,
         gender = Gender,
         age = `Age range`,
         ethnicity_self = `Self-defined ethnicity`,
         ethnicity_officer = `Officer-defined ethnicity`,
         operation = `Part of a policing operation`,
         link = `Outcome linked to object of search`,
         remove_clothing = `Removal of more than just outer clothing`,
         op_name = `Policing operation`,
         reason = `Object of search`) %>%
  st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326) %>%
  st_join(ss_geom)
# have not yet managed to add ward shape - but thats fine



stop_search_1214to0322 <- ss_raw_1214to0322 %>%
  mutate(long_date = ymd_hms(date),
         short_date = as.Date(date)) %>%
  mutate(time = hour(long_date),
         day = wday(long_date, label = TRUE),
         month = month(long_date, label = TRUE)) %>%
  arrange(date)

save(stop_search_1214to0322, file = "Output/Data/Cleaned/stop_search_1214to0322.Rdata")

ss_birm <- stop_search_1214to0322 %>%
  filter(LA == "Birmingham",
         age %in% c("under 10", "10-17"))

check <- ss_birm %>%
  distinct(age)

######------######------######------######------######------######------######------
######------######-first attempt at the geospatial sthings below ######------######------######------
######------######------######------######------######------######------######------

# i think something odd going on with some names - need to make sure you have the names of
#  the wards and lsoa's matching the same time as the data is collected or whatever
# ... otherwise i think youll have missing pieces

# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/stop_search_21to22_reason_outcome_link_gen_eth.Rdata")
# old data if you want to check it

#
# w_shape <- st_read("/Users/katehayes/temp_data/Wards_December_2022_Boundaries_UK_BFC_-3416072881830331872/WD_DEC_2022_UK_BFC.shp")
# lsoa_shape <- st_read("/Users/katehayes/temp_data/LSOA_Dec_2021_Boundaries_Full_Clipped_EW_BFC_2022_4005706377815092351/LSOA_2021_EW_BFC_V7.shp")
#
#
# common_path <- "/Users/katehayes/temp_data/bc285009488bfa668a43b86ba318bc626135d92d"
#
# files_to_read <- list.files(
#   path = common_path,        # directory to search within
#   pattern = "-west-midlands-stop-and-search.csv$",
#   recursive = TRUE,          # search subdirectories
#   full.names = TRUE          # return the full path
# )
#
# ss_raw_04_20_03_23 <- lapply(files_to_read, read.csv)
#
# ss_04_20_03_23 <- ss_clean(raw_list = ss_raw_04_20_03_23)
#
# ss <- bind_rows(ss_04_20_03_23)
#
#
# common_path <- "/Users/katehayes/temp_data/2020-04"
#
# files_to_read <- list.files(
#   path = common_path,        # directory to search within
#   pattern = "-west-midlands-stop-and-search.csv$",
#   recursive = TRUE,          # search subdirectories
#   full.names = TRUE          # return the full path
# )
#
# ss_raw_05_17_04_20 <- lapply(files_to_read, read.csv)
# ss_05_17_04_20 <- ss_clean(raw_list = ss_raw_05_17_04_20)
# ss2 <- bind_rows(ss_05_17_04_20)
#
# # checked this one as its by far the highest density month
# # ss_03_19 <- ss_raw_05_17_04_20[[23]] %>%
# #   filter(Age.range == "10-17")
#
# common_path <- "/Users/katehayes/temp_data/2017-06"
#
# files_to_read <- list.files(
#   path = common_path,        # directory to search within
#   pattern = "-west-midlands-stop-and-search.csv$",
#   recursive = TRUE,          # search subdirectories
#   full.names = TRUE          # return the full path
# )
#
#
# ss_raw_07_14_06_17 <- lapply(files_to_read, read.csv)
# ss_07_14_06_17  <- ss_clean(raw_list = ss_raw_07_14_06_17)
#
# ss3 <- bind_rows(ss_07_14_06_17)
#
#
#
# stop_search_1214to0322_reason_outcome_gen_ward <- bind_rows(ss, ss2, ss3) %>%
#   arrange(date)
#
# stop_search_1214to0322_reason_outcome_gen_ward <- stop_search_1214to0322_reason_outcome_gen_ward %>%
#
#
# save(stop_search_1214to0322_reason_outcome_gen_ward, file = "Output/Data/Cleaned/stop_search_1214to0322_reason_outcome_gen_ward.Rdata")

######------######------######------######------######------######------######------
# taking some WMP FoI data to just try get a rough idea of the age breakdown, rather than just 10-17

ss_data <- read_xlsx("/Users/katehayes/temp_data/1241A_Attachment.xlsx")

stop_search_18to21_age <- ss_data %>%
  filter(grepl("Birmingham", `Neighbourhood Policing Unit`),
         `Subject Age` != "Not recorded",
         `Subject Age` != "Accurate age not recorded") %>%
  rename(age = `Subject Age`) %>%
  mutate(age = as.numeric(age)) %>%
  filter(age <= 17) %>%
  mutate(count = 1) %>%
  group_by(Year, `Neighbourhood Policing Unit`, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(Year, `Neighbourhood Policing Unit`) %>%
  mutate(age_pc = count/sum(count))

save(stop_search_18to21_age, file = "Output/Data/Cleaned/stop_search_18to21_age.Rdata")


ss_data <- read_xlsx("/Users/katehayes/temp_data/103A_23_attachment.xlsx")

stop_search_18to21_age_wmgirls <-  ss_data %>%
  pivot_longer(-age, names_to = "year", values_to = "count")

save(stop_search_18to21_age_wmgirls, file = "Output/Data/Cleaned/stop_search_18to21_age_wmgirls.Rdata")

######------######------######------######------######------######------######------
# looking at arrests coming from stop and search, looking at all outcomes maybe
# just seeing what is there
# will be interesting maybe to see what places have different outcomes... whether there might be spatial/temporal trends in outcomes
######------######------######------######------######------######------######------

ss_outcomes <- stop_search_1214to0322_reason_outcome_gen_ward %>%
  st_drop_geometry() %>%
  mutate(count = 1) %>%
  ggplot() +
  geom_bar(aes(x = count, fill = outcome),
           stat = "count", position = "dodge")

ss_outcomes


# Nothing list:" Nothing found - no further action"
# Arrested list: "Suspect arrested", "Arrest"
#
# "A no further action disposal" <- this one is an interesting one bc it still goes on your record!
# there are far more no further action disposals then there are no further actions....

# Local resolution
# Offender given drugs possession warning
# Offender given penalty notice
# Article found - Detailed outcome unavailable
# Suspect summonsed to court
# Offender cautioned
# A no further action disposal
# Khat or Cannabis warning
# Community resolution
# Caution (simple or conditional)
# Summons / charged by post
# Penalty Notice for Disorder

# difficult from this info to find drug seizure information - probably will need to get rough pcs from other stop and search data


######------######------######------######------######------######------######------
######------######-SECTION 60 INFO ######------######------######------
######------######------######------######------######------######------######------

sec60_data <- read_xlsx("/Users/katehayes/CLmodelR/temp_data/188A_22_attachment.xlsx", skip = 3)

sec60_dates <- sec60_data %>%
  select(`Stop Date`) %>%
  distinct() %>%
  rename(date = `Stop Date`) %>%
  mutate(date = ymd(date))






# birm_shape <- ward_shape %>%
#   filter(LAD22NM == "Birmingham") %>%
#   select(WD22NM) %>%
#   rename(ward = WD22NM)
#
# ss_graph <- birm_shape %>%
#   st_transform(crs = 3857) %>%
#   st_join(ss_birm %>%
#             mutate(count = 1) %>%
#             group_by(ward) %>%
#             summarise(count = sum(count)) %>%
#             select(count) %>%
#             st_transform(crs = 3857)) %>%
#   mutate(count = if_else(is.na(count), 0, count))
#
# plot(ss_graph)


# 136/874 (15.56% missing)


######------######------######------######------######------######------######------
######------OLD - BEFORE I FOUND OTHER DATA SOURCE----------------------############
######------######------######------######------######------######------######------


ss_data <- read.csv("/Users/katehayes/temp_data/ss-open-data-tables-mar22.csv")

ss22_data <- ss_data %>%
  filter(self_defined_ethnicity != "N/A - vehicle search") %>%
  select(-c(geocode, self_defined_ethnicity)) %>%
  rename(end_period_year = financial_year) %>%
  mutate(end_period_year = paste(substr(end_period_year,1,2), substr(end_period_year,6,7), sep = ""))


ss_wmr <- ss22_data %>%
  filter(region == "West Midlands") %>%
  group_by(end_period_year, financial_year_quarter, legislation, reason_for_search,
           outcome, link, self_defined_ethnicity_group, sex, age_group) %>%
  summarise(count = sum(number_of_searches)) %>%
  mutate(level = "West Midlands (region)")

ss_wmp <- ss22_data %>%
  filter(police_force_area == "West Midlands") %>%
  group_by(end_period_year, financial_year_quarter, legislation, reason_for_search,
           outcome, link, self_defined_ethnicity_group, sex, age_group) %>%
  summarise(count = sum(number_of_searches)) %>%
  mutate(level = "West Midlands (police)")


ss22_data <- ss22_data %>%
  group_by(end_period_year, financial_year_quarter, legislation, reason_for_search,
           outcome, link, self_defined_ethnicity_group, sex, age_group) %>%
  summarise(count = sum(number_of_searches)) %>%
  mutate(level = "Eng/Wales") %>%
  bind_rows(ss_wmr) %>%
  bind_rows(ss_wmp) %>%
  rename(gender = sex,
         ethnicity = self_defined_ethnicity_group,
         age = age_group,
         end_period_month = financial_year_quarter) %>%
  mutate(end_period_month = reconcile_quarters(end_period_month),
         gender = reconcile_gender(gender),
         age = reconcile_age(age),
         period_length = "Quarter")


stop_search_21to22_reason_outcome_link_gen_eth <- ss22_data %>%
  filter(age == "10-17") %>%
  select(-age)

save(stop_search_21to22_reason_outcome_link_gen_eth, file = "Output/Data/Cleaned/stop_search_21to22_reason_outcome_link_gen_eth.Rdata")


