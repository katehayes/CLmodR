library(jsonlite)
library(magrittr)
library(tidyverse)

https://www.westmidlands-pcc.gov.uk/commissioning-dashboard/
the above for later





wmp_vul_index <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/WM_VRU_Risk_index/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                              simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))

save(wmp_vul_index, file = "Output/Data/Scraped/wmp_vul_index.Rdata")

wmp_yp <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Young_People_Population_Size_by_LSOA/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
                                    simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes, geometry))








wmp_rli <- jsonlite::fromJSON('https://services3.arcgis.com/tRh0agnyck3rPSQG/arcgis/rest/services/Relative_Low_Income_by_LSOA_2020_21_WFL1/FeatureServer/0/query?where=0%3D0&outFields=*&f=json',
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


YJSOffenceDashboard_3000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSOffenceDashboard/FeatureServer/0/query?where=ObjectId>3000&0%3D0&outFields=%2A&f=json',
                                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))


YJSOffenceDashboard_10000 <- jsonlite::fromJSON('https://services9.arcgis.com/juEJUtOqaunVxGHJ/arcgis/rest/services/YJSOffenceDashboard/FeatureServer/0/query?where=ObjectId>10000&0%3D0&outFields=%2A&f=json',
                                               simplifyDataFrame=T) %>%
  .$features %>%
  unnest(cols = c(attributes))



