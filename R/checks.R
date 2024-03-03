fr_harm <- nrm_data %>% 
  distinct(First_Responder, First_Responder_Mine)
check <- nrm_data %>% 
  distinct(First_Responder)
check <- nrm_data %>% 
  distinct(First_Responder_Mine)


check <- nrm_data %>% 
  distinct(Exploiation_Type)
check <- nrm_data %>% 
  distinct(Exploitation_Type_Mine)


check <- nrm_data %>% 
  distinct(Nationality)
check <- nrm_data %>% 
  distinct(Nationality_Mine)
nat_harm <- nrm_data %>% 
  distinct(Nationality_Mine, Nationality)


st_harm <- nrm_data %>% 
  distinct(Sub_Type__Mine_, MS_Sub_Type)

check <- nrm_data %>% 
  distinct(Sub_Type__Mine_)
check <- nrm_data %>% 
  distinct(MS_Sub_Type)


library(tidyverse)
