library(tidyverse)
library(lubridate)

# FLAG


check <- cl_19to22 %>% 
  filter(year != 0,
         date <= 2021.750) %>% 
  mutate(count = 1) %>% 
  group_by(neighbourhood) %>% 
  summarise(count = sum(count))


check <- cl_19to22 %>% 
  filter(year != 0,
         date <= 2021.750) %>% 
  mutate(count = 1) %>% 
  group_by(serious_violence) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))


check <- cl_19to22 %>% 
  filter(year != 0,
         date <= 2021.750) %>% 
  mutate(count = 1) %>% 
  group_by(firearm) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))


check <- cl_19to22 %>% 
  filter(year != 0,
         date <= 2021.750) %>% 
  mutate(count = 1) %>% 
  group_by(gender) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))





cl <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(!is.na(la),
         end_period_year != 0,
         nrm_referral == "Yes",
         gender == "Male") %>% 
  mutate(count = 1) %>% 
  group_by(date, age) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = date, y = count, fill = as.factor(age)),
           stat = "identity", position = "stack")
cl




check <- tm_data %>% 
  filter(Grouping == "Reason for Referral",
         Category %in% c("Child Criminal Exploitation", "(C)CE"))
  


check <- rhs_data %>% 
  mutate(count = 1) %>% 
  group_by(Authority, Reason) %>% 
  summarise(count = sum(count))






check <- cl_data %>% 
distinct(OBJECTID, MSOA21CD, MSOA21NM, MSOACD, MSOA_Count, Neighbourh) %>% 
  filter(MSOACD != " ") %>% 
  mutate(count = 1) %>% 
  group_by(Neighbourh) %>% 
  summarise(count = sum(count))



check <- cl_data %>% 
  distinct(SHAPE_Leng, SHAPE_Area, Shape__Area, Shape__Length, rings) %>% 
  # filter(MSOACD != " ") %>% 
  mutate(count = 1) %>% 
  group_by(rings) %>% 
  summarise(count = sum(count))


check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Ethnicit_1, Ethnicity_) %>% 
  summarise(count = sum(count))


# %>% 
  ungroup() %>% 
  group_by(Involvemen) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(OCG_USG_M == "Yes")


  
check <- cl_19to22 %>% 
    mutate(count = 1) %>% 
    filter(la != " ") %>% 
    group_by(ocg) %>% 
    summarise(count = sum(count)) %>% 
    ungroup() %>% 
    mutate(pc = count/sum(count)) 
  

check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Involvemen, OCG_USG_M) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(Involvemen) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(OCG_USG_M == "Yes")


check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Involvemen, CSAE_M) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(Involvemen) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(CSAE_M == "Yes")


check <- cl_19to22 %>% 
  mutate(count = 1) %>% 
  filter(la != " ",
         csae == "Yes") %>% 
  mutate(child = ifelse(age < 18, "child", "adult")) %>% 
  # group_by(role) %>% 
  # mutate(age2 = mean(age)) %>% 
  group_by(role) %>% 
  mutate(count2 = sum(count)) %>% 
  ungroup() %>% 
  group_by(role, child) %>% 
  mutate(count3 = sum(count)) %>% 
  mutate(pc = count3/count2) %>% 
  distinct(role, child, pc)

check <- cl_19to22 %>% 
  mutate(count = 1) %>% 
  filter(la != " ",
         csae == "Yes") %>% 
  mutate(child = ifelse(age < 18, "child", "adult"))
  


csae_role <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(la != " ",
         csae == "Yes",
         role %in% c("Workforce: A role that directly relates to the day-to-day running of the line e.g. runner, enforcer.",
                     "Management: Those who can be shown to be involved in running and managing the line such as phone holders, gang leaders etc")) %>% 
  mutate(role = ifelse(grepl("Workforce", role), "Workforce", "Management")) %>% 
  mutate(count = 1) %>% 
  group_by(role, age) %>% 
  summarise(count = sum(count)) %>% 
  # mutate(nrm_referral = factor(nrm_referral, 
  #                              levels = c("Unknown","No",  "Yes"))) %>% 
  # pivot_wider(names_from = nrm_referral,
  #             values_from = count,
  #             values_fill = 0) %>% 
  
  ggplot(aes(x = age, y = count, fill = role)) +
  geom_col(position = position_dodge2(width = 1, preserve = "single")) +
  # ggplot() +
  # geom_bar(aes(x = age, y = count, fill = role),
  #          stat = "identity", position = "dodge") +
  theme_bw() +
  scale_y_continuous(name = "",
                     limits = c(0, 50),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(10, 15, 20, 25, 30, 35, 40, 45), 
                     labels = c("10", "15", "20", "25", "30", "35", "40", "45"), 
                     limits = c(10, 47),
                     expand = c(0,0)) +
  scale_fill_manual(values = c("#942c25", "#c99e30")) 
# scale_x_continuous(name = "", 
#                    expand = c(0,0)) +
# scale_y_continuous(name = "",
#                    expand = c(0,0),
#                    limits = c(0, 45)) +
# scale_fill_manual(values = c("lightgrey", "#99CCCC", "#9999CC"))
csae_role


check <- tm_data %>% 
  distinct(Grouping)


csae_role <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(la != " ",
         csae == "Yes",
         role %in% c("Workforce: A role that directly relates to the day-to-day running of the line e.g. runner, enforcer.",
                     "Management: Those who can be shown to be involved in running and managing the line such as phone holders, gang leaders etc")) %>% 
  mutate(role = ifelse(grepl("Workforce", role), "Workforce", "Management")) %>% 
  mutate(count = 1) %>% 
  group_by(role, age) %>% 
  summarise(count = sum(count)) %>% 
  # mutate(nrm_referral = factor(nrm_referral, 
  #                              levels = c("Unknown","No",  "Yes"))) %>% 
  # pivot_wider(names_from = nrm_referral,
  #             values_from = count,
  #             values_fill = 0) %>% 
  
  ggplot() +
  # geom_bar(aes(x = age, y = count, fill = role),
  #          stat = "identity", position = "stack") +
  geom_bar(aes(x = age, y = count, fill = role),
           stat = "identity", position = "stack") +
  facet_wrap(~role) +
  theme_bw() +
  scale_y_continuous(name = "",
                     limits = c(0, 50),
                     expand = c(0,0)) +
  scale_x_continuous(name = "", 
                     breaks = c(10, 15, 20, 25, 30, 35, 40, 45), 
                     labels = c("10", "15", "20", "25", "30", "35", "40", "45"), 
                     limits = c(10, 47),
                     expand = c(0,0)) +
  scale_fill_manual(values = c("#942c25", "#c99e30")) 
csae_role


check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Involvemen, Cuckoo_M) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(Involvemen) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(Cuckoo_M == "Yes")


check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Cuckoo_M) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) 

check <- cl_19to22 %>% 
  mutate(count = 1) %>% 
  filter(la != " ") %>% 
  group_by(cuckoo) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) 

check <- cl_19to22 %>% 
  mutate(count = 1) %>% 
  filter(la != " ",
         cuckoo == "Yes") %>% 
  mutate(child = ifelse(age < 18, "child", "adult")) %>% 
  # group_by(role) %>% 
  # mutate(age2 = mean(age)) %>% 
  group_by(role) %>% 
  mutate(count2 = sum(count)) %>% 
  ungroup() %>% 
  group_by(role, child) %>% 
  mutate(count3 = sum(count)) %>% 
  mutate(pc = count3/count2)


check <- cl_19to22 %>% 
  mutate(count = 1) %>% 
  filter(la != " ",
         cuckoo == "Yes") %>% 
  group_by(role) %>% 
  mutate(count2 = sum(count)) %>% 
  ungroup() %>% 
  group_by(ethnicity, role) %>% 
  mutate(count3 = sum(count)) %>% 
  mutate(pc = count3/count2)
  
check <- cl_19to22 %>% 
  mutate(count = 1) %>% 
  filter(la != " ",
         cuckoo == "Yes") %>% 
  group_by(role) %>% 
  mutate(count2 = sum(count)) %>% 
  ungroup() %>% 
  group_by(active_area, role) %>% 
  mutate(count3 = sum(count)) %>% 
  mutate(pc = count3/count2)




# %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))

cl_data %>% 
filter(MSOACD != " ") %>% 
distinct(Serious_Ph)

cl_data %>% 
  filter(MSOACD != " ") %>% 
  distinct(CSAE_M)

cl_data %>% 
  filter(MSOACD != " ") %>% 
  distinct(Firearms_M)


cl_data %>% 
  filter(MSOACD != " ") %>% 
  distinct(Weapon_Not)


cl_data %>% 
  filter(MSOACD != " ") %>% 
  distinct(Cuckoo_M)

cl_data %>% 
  filter(MSOACD != " ") %>% 
  distinct(Misper_M)

cl_data %>% 
  filter(MSOACD != " ") %>% 
  distinct(NRM_Referr)








check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Involvemen) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))





check <- cl_data %>% 
  mutate(count = 1) %>% 
  filter(MSOACD != " ") %>% 
  group_by(Involvemen) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))










check <- cl_data %>% 
  as.data.frame() %>% 
  st_transform(rings, crs = 3857)
  


lonlat_to_lsoashape <- function(ss_sf,
                                LSOA_shape = lsoa_shape,
                                shape_col = "geometry") {
  lsoa_trans <- st_transform(lsoa_shape, crs = 3857)
  ss_trans <- st_transform(ss_sf, crs = 3857)
  shape <- lsoa_trans[[shape_col]]
  ii <- as.integer(st_intersects(ss_trans, lsoa_trans))
  shape[ii]
}