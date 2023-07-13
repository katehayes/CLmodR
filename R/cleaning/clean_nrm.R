load("/Users/katehayes/CLmodelR/Output/Data/Scraped/nrm_data.Rdata")

#
# check <- nrm_data %>%
#   mutate(check = ifelse(Exploiation_Type != Exploitation_Type_Mine, "CHECK", NA))


# There are a couple of columns in essential duplicate
# I think the _Mine subcript is a tag somebody is using to say 'this is my version of the columns, using the categories I like'
# Probably cleaning the names up really, to make graphs or something like that
# There is no difference in the exploitation type
# In the nationality, use the _Mine because it corrects a few errors (eg changes Holland to The Netherlands)
# With first responder,  _Mine loses a bit of info - esp around the specific Home Office team
# Same with  MS subtype
# For both of these ill stick to the first column, or make my own categories

# I dont know what correct status means - probably that theres been some check
# all of it says correct anyway
# Out_of_WM is whether the exploitation happened in or out of wm - unnecessary


# subtypes are many, difficult to think of simple consistent schemes of categorisation
# going focus attention on the CL relevant characteristics
# so make extra columns that are like -drug related. gang related. cl related.

nrm_19to22 <- nrm_data %>%
  rename(year = Year,
         f_year = FY,
         quarter = Quarter,
         month = Month,
         age = Age,
         adult_child = Adult_Child,
         nationality = Nationality_Mine,
         gender = Gender,
         nrm_dtn = NRM_DtN,
         first_responder = First_Responder,
         exploit_type = Exploiation_Type,
         exploit_subtype = MS_Sub_Type,
         exploit_location = Exploited_in_,
         overseas_out = If_Overseas,
         r_grounds = RG_Decision,
         c_grounds = Conclusive_Grounds,
         status = Current_Status) %>%
  mutate(age = as.numeric(ifelse(age == 999, NA, age))) %>%
  mutate(date = as.yearmon(paste(month, year, sep = " "))) %>%
  mutate(expl_loc_type = case_when(exploit_location %in% c("Overseas", "Unknown - Overseas") ~ "Overseas",
                                   exploit_location %in% c("Unknown - WMP", "Birmingham",
                                                           "Wolverhampton", "Coventry", "Sandwell",
                                                           "Walsall", "Dudley",
                                                           "Solihull") ~ "West Midlands Police Force Area",
                                   exploit_location %in% c("Out of Force", "Unknown - UK") ~ "Out of Force Area",
                                   exploit_location == "Unknown" ~ "Unknown"),
         expl_location = ifelse(expl_loc_type == "West Midlands Police Force Area", exploit_location, "place hold"),
         expl_location = ifelse(expl_loc_type == "Unknown", "Unknown", expl_location),
         expl_location = ifelse(expl_loc_type %in% c("Overseas", "Out of Force Area"), overseas_out, expl_location),
         expl_location = ifelse(exploit_location %in% c("Unknown - Overseas", "Unknown - UK", "Unknown - WMP"), "Unknown", expl_location),
         expl_location = ifelse((expl_location == "N/A" | is.na(expl_location)), "Unknown", expl_location)) %>%
  select(-c(exploit_location, overseas_out)) %>%
  select(year, f_year, quarter, month, date, gender, age,
         adult_child,  nationality, nrm_dtn, first_responder, exploit_type,
         exploit_subtype,  expl_loc_type, expl_location, r_grounds, c_grounds, status)

write.xlsx(nrm_19to22, file = "Output/Data/WMP_dashboard_scrape.xlsx", sheetName="NRM_data")

mutate(gangs_mention = ifelse(grepl("Gang Related", exploit_subtype), "Yes", "No"),
       fw_mention = ifelse(grepl("Firearms/Weapons", exploit_subtype), "Yes", "No"),
       drugs_mention = ifelse((grepl("Drugs", exploit_subtype) |
                                 exploit_subtype %in% c("County Lines", "Other (drugs)",
                                                        "Cannabis Cultivation", "Cuckooing")), "Yes", "No"),
       cl_mention = ifelse(grepl("County Lines", exploit_subtype), "Yes", "No"),
       cse_mention = ifelse(grepl("CSE", exploit_subtype), "Yes", "No"),
       acq_mention = ifelse((grepl("Acquisitive Crime", exploit_subtype) |
                               exploit_subtype =="Acquisitive crime"), "Yes", "No"),
       sw_mention = ifelse((grepl("Sex Work", exploit_subtype) |
                              grepl("Prostitution", exploit_subtype) |
                              grepl("Sex work", exploit_subtype)), "Yes", "No")) %>%




         # exploit_location %in% c("Overseas", "Unknown - Overseas") ~ "Overseas"))
check <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  distinct(exploit_subtype)


#
# check_sub <- check %>%
#   filter(grepl("Fire", exploit_subtype))

# wonder should i made the _mention colls NA whenever Type is unknown or subtype is unknown or not recorded
# the thing is - seperating those out from the rest is a bit odd - even if there is
# a recorded value that does NOT mention CL, this is not really evidence that there DEFINITELY cannot be a relation to CL
# i think all we really know is that when they mention it they mention it.

save(nrm_19to22, file = "Output/Data/Cleaned/nrm_19to22.Rdata")
