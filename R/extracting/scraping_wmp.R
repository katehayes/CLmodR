library(jsonlite)
library(magrittr)
library(tidyverse)

https://www.westmidlands-pcc.gov.uk/commissioning-dashboard/
the above for later

https://services9.arcgis.com/juEJUtOqaunVxGHJ/ArcGIS/rest/services


# Data Last Edit Date: 3/26/2024 11:50:33 AM
AssetPlusSYVChartsv2 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/AssetPlusSYVChartsv2/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(AssetPlusSYVChartsv2, file = "/Users/katehayes/CLmodR/output/data/scraped/AssetPlusSYVChartsv2.Rdata")



SNA_MoJ_DfE_Mult_Risk_Factors <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/SNA_MoJ_DfE_Mult_Risk_Factors/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                           simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


save(SNA_MoJ_DfE_Mult_Risk_Factors, file = "/Users/katehayes/CLmodR/output/data/scraped/SNA_MoJ_DfE_Mult_Risk_Factors.Rdata")




County_Lines_msoa21 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/County_Lines_msoa21/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


VRPSurveyDashboardv2 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/VRPSurveyDashboardv2/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                           simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



Schools_Stats_June_2020 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Schools_Stats_June_2020/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(Schools_Stats_June_2020, file = "/Users/katehayes/CLmodR/output/data/scraped/Schools_Stats_June_2020.Rdata")




# Data Last Edit Date: 8/13/2021
Schools_Data <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Schools_Data/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                            simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(Schools_Data, file = "/Users/katehayes/CLmodR/output/data/scraped/Schools_Data.Rdata")

# Data Last Edit Date: 3/18/2022
Schools <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Schools/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                   simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
Schools_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Schools/FeatureServer/0/query?where=Rank>1000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Schools <- Schools %>% 
  rbind(Schools_1000)

save(Schools, file = "/Users/katehayes/CLmodR/output/data/scraped/Schools.Rdata")


# Data Last Edit Date: 9/21/2023
Education <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Education/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Education_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Education/FeatureServer/0/query?where=Rank>1000&0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Education <- Education %>% 
  rbind(Education_1000)


save(Education, file = "/Users/katehayes/CLmodR/output/data/scraped/Education.Rdata")



check <- Education %>% 
  filter(Safe_School == "Y")

check <- Education %>% 
  filter(Local_Authority == "Birmingham")

check <- Education %>% 
  filter(Local_Authority == "Birmingham") %>% 
  select(School)


# Data Last Edit Date: 3/25/2022
PriorityPlaces <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/PriorityPlaces/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(PriorityPlaces, file = "/Users/katehayes/CLmodR/output/data/scraped/PriorityPlaces.Rdata")



PrisonDashboardCharts <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/PrisonDashboardCharts/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))





County_Lines_Chartsv3 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/County_Lines_Chartsv3/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                           simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



YJSDemographic <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSDemographic/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

FTEDashboard <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/FTEDashboard/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



save(YJSDemographic, file = "output/scraped/YJSDemographic.Rdata")

YJS_Layer

YJS_Map <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/YJS_Map/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

wmp_vul_index <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/WM_VRU_Risk_index/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))

save(wmp_vul_index, file = "Output/Data/Scraped/wmp_vul_index.Rdata")

wmp_yp <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))





Relative_Low_Income_by_LSOA <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Relative_Low_Income_by_LSOA/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))



early_cl <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/CountyLines_Dashboard/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))



early_nrm <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


early_nrm_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

early_nrm_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>2000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


early_nrm_3000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>3000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


early_nrm_4000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>4000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


early_nrm_5000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>5000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

non_dashboard_nrm <- bind_rows(early_nrm, early_nrm_1000,
                               early_nrm_2000, early_nrm_3000,
                               early_nrm_4000, early_nrm_5000)

save(non_dashboard_nrm, file = "Output/Data/Scraped/non_dashboard_nrm.Rdata")


# https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Risk_Index


vru_risk_index <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Risk_Index/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))

save(vru_risk_index, file = "Output/Data/Scraped/vru_risk_index.Rdata")

# what they call "custody service"

wmp_custody_service <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/CustodyService/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(wmp_custody_service, file = "Output/Data/Scraped/wmp_custody_service.Rdata")

# NEED TO COME BACK HERE AND TAKE EVERYTHING....
misper v2 apparently

misper_v2 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Misper_V2/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))




vru_knife_vic <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Knife_Crime_Victim_Incident/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))

save(vru_knife_vic, file = "Output/Data/Scraped/vru_knife_vic.Rdata")


vru_pru_data <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Pupil_Referral_Units/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(vru_pru_data, file = "Output/Data/Scraped/vru_pru_data.Rdata")

vru_hospital_data <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/SO_HospitalAdmissions/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))

save(vru_hospital_data, file = "Output/Data/Scraped/vru_hospital_data.Rdata")


commissioning <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/9_June_Dashboard_1/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



commissioning_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/9_June_Dashboard_1/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



vru_project_data <- bind_rows(commissioning, commissioning_1000)
save(vru_project_data, file = "Output/Data/Scraped/vru_project_data.Rdata")





As of tuesday the 20th of June 2023

# this one has a weird list of data sources
data_sources <- jsonlite::fromJSON('https://www.arcgis.com/sharing/rest/content/items/92397132e509473883e1977d1db90a32/data?f=json',
                                   simplifyDataFrame=T)


cm <- jsonlite::fromJSON('https://www.arcgis.com/sharing/rest/content/items/92397132e509473883e1977d1db90a32/data?f=json',
                              simplifyDataFrame=T)





check <- jsonlite::fromJSON("https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRMRealData/FeatureServer/0/query?f=json",
                                  simplifyDataFrame=T)



data_sources_new <- jsonlite::fromJSON('https://www.arcgis.com/sharing/rest/content/items/535e9a9d63494215ab6087f46c091e06/data?f=json',
                                   simplifyDataFrame=T)




# returnGeometry=true


  # all of the county lines cases with full attributes????
  cl_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/CountyLines_Dashboard/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                             simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = c(attributes, geometry))

  cl_4000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/CountyLines_Dashboard/FeatureServer/0/query?where=FID>2000&0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = c(attributes, geometry))

  cl_6000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/CountyLines_Dashboard/FeatureServer/0/query?where=FID>4000&0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = c(attributes, geometry))

  cl_data <- bind_rows(cl_2000, cl_4000, cl_6000)
  save(cl_data, file = "Output/Data/Scraped/cl_data.Rdata")

  # education data
  ed_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Education/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = c(attributes, geometry))

  ed_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Education/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = c(attributes, geometry))

  ed_data <- bind_rows(ed_1000, ed_2000)
  save(ed_data, file = "Output/Data/Scraped/ed_data.Rdata")

  
  NRM_Data_WMP_V2
  

  
  # all of the national referral mechamism cases with full attributes?? "NRM_Data_WMP_V2" is null. NRM_Collated (Old) is also not in use
  nrm_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                             simplifyDataFrame=T)  %>%
    .$features %>%
    unnest(cols = attributes)

  nrm_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  nrm_3000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>2000&0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  nrm_4000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>3000&0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  nrm_5000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/National_Referral_Mechanism_Dashboard/FeatureServer/0/query?where=ObjectId>4000&0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  nrm_data <- bind_rows(nrm_1000, nrm_2000, nrm_3000, nrm_4000, nrm_5000)
  save(nrm_data, file = "Output/Data/Scraped/nrm_data.Rdata")



  # evidently not "MissingPersons_Collated" but "Missing_Collated"
  missing_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                             simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_3000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>2000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_4000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>3000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_5000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>4000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_6000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>5000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_7000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>6000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_8000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>7000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  missing_9000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>8000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  
  # took this on the 3rd of march 24
  missing_10000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>9000&0%3D0&outFields=%2A&f=json',
                                     simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)
  
  
  missing_11000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>10000&0%3D0&outFields=%2A&f=json',
                                      simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)
  
  
  missing_12000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>11000&0%3D0&outFields=%2A&f=json',
                                      simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)
  
  
  missing_13000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>12000&0%3D0&outFields=%2A&f=json',
                                      simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)
  
  
  missing_14000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>13000&0%3D0&outFields=%2A&f=json',
                                      simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)
  
  missing_15000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Missing_Collated/FeatureServer/0/query?where=ObjectId>14000&0%3D0&outFields=%2A&f=json',
                                      simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)
  
  
  
  missing_data <- bind_rows(missing_1000, missing_2000, missing_3000, missing_4000, missing_5000, missing_6000, missing_7000, missing_8000, missing_9000)
  save(missing_data, file = "Output/Data/Scraped/missing_data.Rdata")


  missing_noflag_data <- bind_rows(missing_1000, missing_2000, missing_3000, missing_4000, missing_5000, missing_6000, missing_7000, missing_8000, missing_9000,
                            missing_10000, missing_11000, missing_12000, missing_13000, missing_14000, missing_15000)
  save(missing_noflag_data, file = "Output/Data/Scraped/missing_noflag_data.Rdata")
  
  
# the couple of interventions:
  # expect respect
  er_data <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/ExpectRespect/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  save(er_data, file = "Output/Data/Scraped/er_data.Rdata")

  rhs_data <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/RHS_Collated/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  save(rhs_data, file = "Output/Data/Scraped/rhs_data.Rdata")

  ssp_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Safe_Spaces2/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  ssp_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/Safe_Spaces2/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  ssp_data <- bind_rows(ssp_1000, ssp_2000)
  save(ssp_data, file = "Output/Data/Scraped/ssp_data.Rdata")


  tm_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/TM_Grouped_Data2/FeatureServer/0/query?where=0%3D0&outFields=%2A&f=json',
                                 simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  tm_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/TM_Grouped_Data2/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                simplifyDataFrame=T) %>%
    .$features %>%
    unnest(cols = attributes)

  tm_data <- bind_rows(tm_1000, tm_2000)
  save(tm_data, file = "Output/Data/Scraped/tm_data.Rdata")



https://www.wmvru-sna.org/map/risk/additionalinfo/overallriskindex/notspecified/risk/52.505351,-1.806212,11


tm_2000 <- jsonlite::fromJSON('https://shoothillukwestgeneral.blob.core.windows.net/westmidsvru/tiles/wmmsoas/v2/11/1012/672.pbf')






project <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/9_June_Dashboard_1/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



project_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/9_June_Dashboard_1/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



vru_project_data_nov <- bind_rows(project, project_1000)
save(vru_project_data_nov, file = "Output/Data/Scraped/vru_project_data_nov.Rdata")



# march 24


AssetPlusSYVCharts <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/AssetPlusSYVCharts/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(AssetPlusSYVCharts, file = "Output/Data/Scraped/AssetPlusSYVCharts.Rdata")

YJS_Dashboard_Public_v2 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJS_Dashboard_Public_v2/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(YJS_Dashboard_Public_v2, file = "Output/Data/Scraped/YJS_Dashboard_Public_v2.Rdata")



YJSOffenceDashboard <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSOffenceDashboard/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

YJSOffenceDashboard_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSOffenceDashboard/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


YJSOffenceDashboard_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSOffenceDashboard/FeatureServer/0/query?where=ObjectId>2000&0%3D0&outFields=%2A&f=json',
                                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


YJSOffenceDashboard <- bind_rows(YJSOffenceDashboard, YJSOffenceDashboard_1000, YJSOffenceDashboard_2000)
save(YJSOffenceDashboard, file = "Output/Data/Scraped/YJSOffenceDashboard.Rdata")




SNA_MoJDfE <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/SNA_MoJDfE/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(SNA_MoJDfE, file = "Output/Data/Scraped/SNA_MoJDfE.Rdata")

MoJDfE <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/MoJDfE/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                 simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
MoJDfE

County_Lines_Chartsv2 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/County_Lines_Chartsv2/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                 simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(County_Lines_Chartsv2, file = "Output/Data/Scraped/County_Lines_Chartsv2.Rdata")

CL_Esri_LA_IMD_Charts <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/CL_Esri_LA_IMD_Charts/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                            simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(CL_Esri_LA_IMD_Charts, file = "Output/Data/Scraped/CL_Esri_LA_IMD_Charts.Rdata")


County_Lines_Trend <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/County_Lines_Trend/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                            simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(County_Lines_Trend, file = "Output/Data/Scraped/County_Lines_Trend.Rdata")


NRM_Dashboard <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRM_Dashboard/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


NRM_Dashboard_1000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRM_Dashboard/FeatureServer/0/query?where=ObjectId>1000&0%3D0&outFields=%2A&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


NRM_Dashboard_2000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRM_Dashboard/FeatureServer/0/query?where=ObjectId>2000&0%3D0&outFields=%2A&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


NRM_Dashboard_3000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRM_Dashboard/FeatureServer/0/query?where=ObjectId>3000&0%3D0&outFields=%2A&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

NRM_Dashboard_4000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRM_Dashboard/FeatureServer/0/query?where=ObjectId>4000&0%3D0&outFields=%2A&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

NRM_Dashboard_5000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/NRM_Dashboard/FeatureServer/0/query?where=ObjectId>5000&0%3D0&outFields=%2A&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


NRM_Dashboard <- bind_rows(NRM_Dashboard, NRM_Dashboard_1000, NRM_Dashboard_2000, NRM_Dashboard_3000,
                           NRM_Dashboard_4000, NRM_Dashboard_5000)
save(NRM_Dashboard, file = "Output/Data/Scraped/NRM_Dashboard.Rdata")

YJSCensusDashboard <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSCensusDashboard/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                            simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(YJSCensusDashboard, file = "Output/Data/Scraped/YJSCensusDashboard.Rdata")


# APRIL, back again



SNA_MoJ_DfE_Mult_Risk_Factors <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/SNA_MoJ_DfE_Mult_Risk_Factors/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(SNA_MoJ_DfE_Mult_Risk_Factors, file = "output/data/scraped/SNA_MoJ_DfE_Mult_Risk_Factors.Rdata")



# 
# WMVRU20202021ImportFINALCSV2 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/WMVRU20202021ImportFINALCSV2/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
#                                                                     simplifyDataFrame=T) %>%
#   .$features %>%
#   unnest(cols = c(attributes))
# 
# 

# Data updated: 27 Sept 2021, 13:12

West_Midlands_Provision_x_VRU_Risk_Index_WFL1 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/West_Midlands_Provision_x_VRU_Risk_Index_WFL1/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))
save(West_Midlands_Provision_x_VRU_Risk_Index_WFL1, file = "output/data/scraped/West_Midlands_Provision_x_VRU_Risk_Index_WFL1.Rdata")




WM_VRU_Risk_Index_x_Provision2_WFL1 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/WM_VRU_Risk_Index_x_Provision2_WFL1/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



WM_VRU_Risk_Index_x_Provision2_WFL1_2000 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/WM_VRU_Risk_Index_x_Provision2_WFL1/FeatureServer/0/query?where=ObjectID>2000&0%3D0&outFields=%2A&f=json',
                                         simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

save(WM_VRU_Risk_Index_x_Provision2_WFL1, file = "output/data/scraped/WM_VRU_Risk_Index_x_Provision2_WFL1.Rdata")



Young_People_Population_Size_by_LSOA_1 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


Young_People_Population_Size_by_LSOA_2 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>2000&0%3D0&outFields=%2A&f=json',
                                                           simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_4 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>4000&0%3D0&outFields=%2A&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_6 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>6000&0%3D0&outFields=%2A&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_8 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>8000&0%3D0&outFields=%2A&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_10 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>10000&0%3D0&outFields=%2A&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_12 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>12000&0%3D0&outFields=%2A&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_14 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>14000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_16 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>16000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_18 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>18000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_20 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>22000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_22 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>24000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


Young_People_Population_Size_by_LSOA_24 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>26000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_26 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>28000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_28 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>30000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_30 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>20000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))

Young_People_Population_Size_by_LSOA_32 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>32000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


Young_People_Population_Size_by_LSOA_34 <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=OBJECTID>34000&0%3D0&outFields=%2A&f=json',
                                                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


Young_People_Population_Size_by_LSOA <- bind_rows(Young_People_Population_Size_by_LSOA_1,
                                                  Young_People_Population_Size_by_LSOA_2,
                                                  
                                                  Young_People_Population_Size_by_LSOA_4,
                                              
                                                  Young_People_Population_Size_by_LSOA_6,
                                       
                                                  Young_People_Population_Size_by_LSOA_8,
                                     
                                                  Young_People_Population_Size_by_LSOA_10,
                                          
                                                  Young_People_Population_Size_by_LSOA_12,
                                     
                                                  Young_People_Population_Size_by_LSOA_14,
                                              
                                                  Young_People_Population_Size_by_LSOA_16,
                                           
                                                  Young_People_Population_Size_by_LSOA_18,
                                           
                                                  Young_People_Population_Size_by_LSOA_20,
                                                
                                                  Young_People_Population_Size_by_LSOA_22,
                                     
                                                  Young_People_Population_Size_by_LSOA_24,
                                               
                                                  Young_People_Population_Size_by_LSOA_26,
                                                  
                                                  Young_People_Population_Size_by_LSOA_28,
                                               
                                                  Young_People_Population_Size_by_LSOA_30,
                                          
                                                  Young_People_Population_Size_by_LSOA_32)

save(Young_People_Population_Size_by_LSOA, file = "output/data/scraped/Young_People_Population_Size_by_LSOA.Rdata")

WM_VRU_Risk_index <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/WM_VRU_Risk_index/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                          simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


IDACI_by_LSOA

IDACI_by_LSOA <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/IDACI_by_LSOA/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                                             simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


# https://www.arcgis.com/home/search.html?restrict=false&sortField=relevance&sortOrder=desc&searchTerm=owner%3A%22dgrice%22#content

