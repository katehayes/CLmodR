load("/sers/katehayes/CLmodR/output/data/scraped/cl_data.Rdata")
library(zoo)


cl_19to22 <- cl_data %>%
  rename(msoa21 = MSOA21NM,
         year = Year,
         month = Month,
         neighbourhood = Neighbourh,
         la = Local_Auth,
         active_area = ActiveArea,
         role = Involvemen,
         gender = Gender,
         age = Age,
         ethnicity = Ethnicity_,
         eth_detail = Ethnicit_1,
         csae = CSAE_M,
         firearm = Firearms_M,
         weapon = Weapon_Not,
         serious_violence = Serious_Ph, # ?
         cuckoo = Cuckoo_M,
         ocg = OCG_USG_M,
         missing = Misper_M,
         nrm_referral = NRM_Referr) %>%
  mutate(date = as.yearmon(paste(month, year, sep = " "))) %>%
  select(year, month, date, la, msoa21, neighbourhood,
         active_area, role, gender, age, ethnicity,
         eth_detail, csae, firearm, weapon, serious_violence,
         cuckoo, ocg, missing, nrm_referral) %>%
  mutate(across(c(serious_violence, firearm,
                  weapon, missing,
                  nrm_referral, cuckoo,
                  csae, ocg), ~reconcile_dashboard(.x)))

# probably doesnt meet the Cleaned criteria yet but whatever
save(cl_19to22, file = "Output/Data/Cleaned/cl_19to22.Rdata")

# install.packages("xlsx")
# library(xlsx)
write.xlsx(cl_19to22, file = "Output/Data/cl.xlsx", sheetName="CL_data")

# mutate(serious_violence = reconcile_dashboard(serious_violence),
  #        firearm = reconcile_dashboard(firearm),
  #        nrm_referral = reconcile_dashboard(nrm_referral),
  #        )
# check <- cl_data %>%
#   distinct(Cuckoo_M)
#
# check <- cl_data %>%
#   filter(Cuckoo_M == " No")


