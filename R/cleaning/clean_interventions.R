load("/Users/katehayes/CLmodelR/Output/Data/Scraped/er_data.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Scraped/rhs_data.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Scraped/ssp_data.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Scraped/tm_data.Rdata")

stgiles_expect_respect <- er_data %>%
  rename(referral_route = Rou_Refer,
         site = Site,
         postcode = Postcode,
         month_of_referral = Refer_Mon,
         reason_for_referral = Rea_Refer,
         presenting_need = Need_YP,
         home_la = Home_LA,
         age = Age,
         ethnicity = Ethnicity,
         contact_with_service1 = Stat_Serv1,
         contact_with_service2 = Stat_Serv2,
         accom_status = Accom_stat,
         ete_status = ETE_Status,
         prev_ae = Prev_AE,
         engagement_type = EngageTyp,
         contacted = Contacted,
         family_support = Family_Sup,
         level = Interlevel,
         quarter = Quarter) %>%
  select(quarter, month_of_referral, age, ethnicity, home_la, site, postcode, referral_route, reason_for_referral, need,
         contact_with_service1, contact_with_service2, accom_status, ete_status, prev_ae, engagement_type, contacted,
         family_support, level)

write.xlsx(stgiles_expect_respect, file = "Output/Data/stgiles_expect_respect.xlsx", sheetName="ER_data")

return_home_service <- rhs_data %>%
  rename(financial_year = Year,
         quarter = Quarter,
         gender = Gender,
         age = Age,
         ethnicity = Ethnicity,
         la = Authority,
         referral_route = Source,
         reason_for_referral = Reason,
         presenting_need = Presenting_Need,
         engagement_status = Status,
         outcome = Outcome) %>%
  select(financial_year, quarter, gender, age, ethnicity,
         la, referral_route, reason_for_referral, presenting_need,
         engagement_status, outcome)

write.xlsx(return_home_service, file = "Output/Data/return_home_service.xlsx", sheetName="RHS_data")

safe_spaces <- ssp_data %>%
  rename(date = Date,
         time_period = TimePeriod,
         gender = Gender,
         age = Age_Group,
         la = LA,
         site = Site,
         first_contact = First_Cont,
         referral_route = Refer_Orig,
         presenting_need = Pres_Comp) %>%
  select(date, time_period, gender, age,
         la, site, first_contact,
         referral_route, presenting_need)
write.xlsx(safe_spaces, file = "Output/Data/safe_spaces.xlsx", sheetName="SS_data")

teachable_moments <- tm_data %>%
  rename(quarter = Quarter,
         hospital = Hospital,
         service_provider = Provider,
         number_of_people_served = People,
         data_quality = Complete)

teachable_moments_age <- teachable_moments %>%
  filter(Grouping == "Age") %>%
  rename(age = Category) %>%
  select(quarter, hospital, service_provider, data_quality, age, number_of_people_served)
write.xlsx(teachable_moments_age, file = "Output/Data/teachable_moments_age.xlsx", sheetName="data")

teachable_moments_engage <- teachable_moments %>%
  filter(Grouping == "Engagement Type") %>%
  rename(engagement_type = Category) %>%
  select(quarter, hospital, service_provider, data_quality, engagement_type, number_of_people_served)
write.xlsx(teachable_moments_engage, file = "Output/Data/teachable_moments_engage.xlsx", sheetName="data")

teachable_moments_ete <- teachable_moments %>%
  filter(Grouping == "ETE Status") %>%
  rename(ete_status = Category) %>%
  select(quarter, hospital, service_provider, data_quality, ete_status, number_of_people_served)
write.xlsx(teachable_moments_ete, file = "Output/Data/teachable_moments_ete.xlsx", sheetName="data")

teachable_moments_ethn <- teachable_moments %>%
  filter(Grouping == "Ethnicity Broad") %>%
  rename(ethnicity = Category) %>%
  select(quarter, hospital, service_provider, data_quality, ethnicity, number_of_people_served)
write.xlsx(teachable_moments_ethn, file = "Output/Data/teachable_moments_ethn.xlsx", sheetName="data")

teachable_moments_pn <- teachable_moments %>%
  filter(Grouping == "Presenting Need for YP") %>%
  rename(presenting_need = Category) %>%
  select(quarter, hospital, service_provider, data_quality, presenting_need, number_of_people_served)
write.xlsx(teachable_moments_pn, file = "Output/Data/teachable_moments_pn.xlsx", sheetName="data")

teachable_moments_rr <- teachable_moments %>%
  filter(Grouping %in% c("Reason for referral", "Reason for Referral")) %>%
  rename(reason_for_referral = Category) %>%
  select(quarter, hospital, service_provider, data_quality, reason_for_referral, number_of_people_served)
write.xlsx(teachable_moments_rr, file = "Output/Data/teachable_moments_rr.xlsx", sheetName="data")

