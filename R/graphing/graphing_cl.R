load("/Users/katehayes/CLmodR/output/data/cleaned/cl_19to22.Rdata")

library(ggplot2)
library(tidyverse)
library(viridis)


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  group_by(date, age) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_bar(aes(x = date, y = count, fill = as.character(age)),
           stat = "identity", position = "stack") 
  
cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  mutate(count = 1) %>% 
  group_by(date) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  summarise(av = mean(count))

# 16.28889 aaAPPROX 16 KIDS A MONTH


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  group_by(age) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))










cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  group_by(age) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))


# AGE
# 8- 0.001364256
# 12- 0.009549795
# 13 - 0.050477490
# 14 - 0.135061392
# 15 - 0.264665757
# 16 - 0.289222374
# 17 - 0.249658936


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  group_by(ethnicity) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)

# Asian
# 0.171896317
# Black
# 0.523874488
# Mixed
# 0.019099591
# Other
# 0.008185539
# Unknown
# 0.103683492
# White
# 0.173260573


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
filter(ethnicity == "Black") %>% 
  group_by(nrm_referral) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)
# No
# 0.27343750
# Unknown
# 0.66145833
# Yes
# 0.06510417


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "White") %>% 
  group_by(nrm_referral) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)

# No 0.2283465
# Unknown 0.6692913
# Yes 0.1023622

cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Asian") %>% 
  group_by(nrm_referral) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)

# No - 0.24603175
# Unknown - 0.69841270
# Yes - 0.05555556

cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Black") %>% 
  group_by(role) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)
# Management: Those who can be shown to be involved in running and managing the line such as phone holders, gang leaders etc
# 0.03906250
# Other: for any role that does not fit above criteria e.g. Cuckooed
# 0.04687500
# Unknown
# 0.01822917
# Workforce: A role that directly relates to the day-to-day running of the line e.g. runner, enforcer.
# 0.89583333

cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "White") %>% 
  group_by(role) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)
# Other: for any role that does not fit above criteria e.g. Cuckooed
# 0.06299213
# Unknown
# 0.01574803
# Workforce: A role that directly relates to the day-to-day running of the line e.g. runner, enforcer.
# 0.92125984
# 


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Asian") %>% 
  group_by(role) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)
# Management: Those who can be shown to be involved in running and managing the line such as phone holders, gang leaders etc
# 0.023809524
# Other: for any role that does not fit above criteria e.g. Cuckooed
# 0.055555556
# Unknown
# 0.007936508
# Workforce: A role that directly relates to the day-to-day running of the line e.g. runner, enforcer.
# 0.912698413



# AGE

cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Black") %>% 
  summarise(age = mean(age))

# 15.6276

cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "White") %>% 
  summarise(age = mean(age))
# 15.22047

cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Asian") %>% 
  summarise(age = mean(age))
# 15.54762





# MISSING
cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Black") %>% 
  group_by(missing) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)

# No
# 0.3385417
# Unknown
# 0.1562500
# Yes
# 0.5052083


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "White") %>% 
  group_by(missing) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)

# No
# 0.5039370
# Unknown
# 0.1023622
# Yes
# 0.3937008


cl <- cl_19to22 %>%
  filter(age <= 17,
         la == "Birmingham",
         gender == "Male") %>% 
  filter(ethnicity == "Asian") %>% 
  group_by(missing) %>% 
  mutate(count = 1) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count)) %>% 
  select(-count)

# No
# 0.4047619
# Unknown
# 0.1349206
# Yes
# 0.4603175




















wm_nrm_age <- cl_19to22 %>%
  filter(age <= 17)


wm_nrm_age <- cl_19to22 %>%
  filter(!is.na(la),
         year != 0,
         date <= "Dec 2020",
         age <= 17) %>% 


# %>% 
  mutate(count = 1,
         la = ifelse(la == "Birmingham", la, "Not Birmingham")) %>% 
  group_by(date, la) %>% 
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = la,
              values_from = count,
              values_fill = 0)



birm_nrm <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(!is.na(la),
         end_period_year != 0,
         la == "Birmingham",
         age <= 17) %>% 
  mutate(count = 1) %>% 
  group_by(date, nrm_referral) %>% 
  summarise(count = sum(count)) %>% 
  # ungroup() %>% 
  # group_by(nrm_referral) %>% 
  # arrange(date) %>% 
  # mutate(c = rollmean(count, k = 3, fill = 0, align = "center")) %>%
  # mutate(c = rollmean(c, k = 3, fill = 0, align = "center")) %>%
  pivot_wider(names_from = nrm_referral,
              values_from = count,
              values_fill = 0) %>% 
  ggplot() +
  geom_line(aes(x = date, y = Yes)) +
  geom_line(aes(x = date, y = Yes+No)) +
  geom_line(aes(x = date, y = Yes+No+Unknown)) +
  geom_ribbon(aes(x = date, ymin=0,ymax=Yes), alpha=0.5) +
  geom_ribbon(aes(x = date, ymin=Yes, ymax=Yes+No), fill = "#91A1BAFF", alpha=0.25) +
  geom_ribbon(aes(x = date, ymin=Yes+No, ymax=Yes+No+Unknown), fill = "#91A1BAFF", alpha=0.1) +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0))
birm_nrm


birm_nrm <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(!is.na(la),
         end_period_year != 0,
         end_period_year < 2021,
         la == "Birmingham",
         age <= 17) %>% 
  mutate(count = 1) %>% 
  group_by(nrm_referral) %>% 
  summarise(count = sum(count))

nrm_dec <- nrm_19to22 %>%
  filter(cl_mention == "Yes",
         age <= 17) %>% 
  mutate(count = 1) %>% 
  group_by(r_grounds) %>% 
  summarise(count = sum(count))

nrm_dec <- nrm_19to22 %>%
  filter(cl_mention == "Yes",
         age <= 17,
         r_grounds == "Positive") %>% 
  mutate(count = 1) %>% 
  group_by(c_grounds) %>% 
  summarise(count = sum(count))


birm_nrm <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(!is.na(la),
         end_period_year != 0,
         la == "Birmingham",
         age <= 17) %>% 
  mutate(count = 1) %>% 
  group_by(date, nrm_referral) %>% 
  summarise(count = sum(count)) %>% 
  mutate(nrm_referral = factor(nrm_referral, 
                               levels = c("Unknown","No",  "Yes"))) %>% 
  # pivot_wider(names_from = nrm_referral,
  #             values_from = count,
  #             values_fill = 0) %>% 
  ggplot() +
  geom_bar(aes(x = date, y = count, fill = nrm_referral),
           stat = "identity", position = "stack") +
  theme_bw() +
  scale_x_continuous(name = "", 
                     expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 45)) +
  scale_fill_manual(values = c("lightgrey", "#99CCCC", "#9999CC"))
birm_nrm

ggsave(filename = "Output/Graphs/birm_nrm.png", birm_nrm)



birm_wm_cl <- cl_19to22 %>%
  rename(end_period_year = year) %>% 
  filter(!is.na(la),
         end_period_year != 0) %>% 
  mutate(count = 1,
         la = ifelse(la == "Birmingham", la, "Not Birmingham")) %>% 
  group_by(date, la) %>% 
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = la,
              values_from = count,
              values_fill = 0) %>% 
  ggplot() +
  geom_line(aes(x = date, y = Birmingham)) +
  geom_line(aes(x = date, y = Birmingham+`Not Birmingham`)) +
  geom_ribbon(aes(x = date, ymin=Birmingham, ymax=Birmingham+`Not Birmingham`), fill = "#91A1BAFF", alpha=0.25) +
  geom_ribbon(aes(x = date, ymin=0,ymax=Birmingham), alpha=0.5) +
  theme_bw() +
  scale_x_continuous(name = "", 
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0))

birm_wm_cl
# +
  # geom_line(aes(x = end_period_year, y = pc, group = interaction(age, neet), colour = interaction(age, neet))) +
  scale_color_manual(values = c("#3299FFFF"),
                     guide = F) +
  scale_fill_manual(values = c("#3299FFFF"),
                    guide = F) +














cl_19to22 %>%
  filter(year != 0) %>%
  mutate(la = factor(la, levels = c("Birmingham",
                                    "Wolverhampton", "Coventry", "Sandwell",
                                    "Walsall", "Dudley",
                                    "Solihull"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(la)),
           stat = "count", position = "stack") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.9)







cl_19to22 %>%
  filter(year != 0) %>%
  mutate(la = factor(la, levels = c("Birmingham",
                                    "Wolverhampton", "Coventry", "Sandwell",
                                    "Walsall", "Dudley",
                                    "Solihull"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(la)),
           stat = "count", position = "fill") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.9)




cl_19to22 %>%
  filter(year != 0,
         age <= 17) %>%
  mutate(la = factor(la, levels = c("Birmingham",
                                    "Wolverhampton", "Coventry", "Sandwell",
                                    "Walsall", "Dudley",
                                    "Solihull"))) %>%
  ggplot() +
    geom_bar(aes(x = date, fill = fct_rev(la)),
             stat = "count", position = "fill") +
    scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
                       begin = 0.1,
                       end = 0.9)


cl_age <- cl_19to22 %>%
  filter(year != 0,
         age <= 17,
         la == "Birmingham") %>% # birmingham kids are younger than the other west midlands kids
  ggplot() +
  geom_bar(aes(x = date, fill = as.factor(age)),
           stat = "count", position = "stack") +
  scale_fill_viridis(option="rocket", discrete = TRUE, direction = -1,
                     begin = 0.1,
                     end = 0.95) +
  ggtitle("17 and under CL-involved in Birmingham by age")
cl_age


cl_gen <- cl_19to22 %>%
  filter(year != 0,
         age <= 17,
         la == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = date, fill = gender),
           stat = "count", position = "stack") +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 0.6) +
  ggtitle("17 and under CL-involved in Birmingham by gen")
cl_gen

cl_eth <- cl_19to22 %>%
  filter(year != 0,
         age <= 17,
         la == "Birmingham") %>%
  mutate(ethnicity = factor(ethnicity, levels = c("Black",
                                     "White", "Asian", "Mixed",
                                    "Other",
                                    "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(ethnicity)),
           stat = "count", position = "stack") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = 1,
                     begin = 0,
                     end = 0.9) +
  ggtitle("17 and under CL-involved in Birmingham by eth")
cl_eth
# black kids are really over-represented!!

cl_categories <- cl_19to22 %>%
  filter(year != 0,
         age <= 17
         ,
         la == "Birmingham"
         ) %>%
  select(date, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-date,
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "stack") +
  facet_wrap(~category, nrow = 2) +
  scale_fill_manual(values = c("grey",  "#EBA07EFF", "#A8554EFF")) +
  theme_bw() +
  # scale_x_continuous(name = "", 
  #                    limits = c(2010.5, 2023.5),
  #                    expand = c(0,0),
  #                    breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
  #                    labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")) +
  scale_y_continuous(name = "",
                     limits = c(0, 42),
                     expand = c(0,0)) +
  theme(strip.text = element_blank(),
        legend.position = "none")
cl_categories

"#B48A2CFF", "#DCD66EFF"

ggsave(filename = "Output/Graphs/birm_cl_category.png", cl_categories)


cl_categories2 <- cl_19to22 %>%
  filter(year != 0) %>%
  select(date, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-date,
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "stack") +
  facet_wrap(~category, nrow = 2) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC"))
cl_categories2
ggsave(filename = "Output/Graphs/wm_cl_category_adults_and_children.png", cl_categories)


cl_categories3 <- cl_19to22 %>%
  filter(year != 0,
         age >= 20) %>%
  select(date, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-date,
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "stack") +
  facet_wrap(~category, nrow = 2) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC")) +
  ggtitle("People aged 20 and up")
cl_categories3


cl_categories4 <- cl_19to22 %>%
  filter(year != 0,
         age < 20) %>%
  select(date, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-date,
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "stack") +
  facet_wrap(~category, nrow = 2) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC")) +
  ggtitle("Young people aged 8-19")
cl_categories4


cl_categories5 <- cl_19to22 %>%
  filter(year != 0,
         ethnicity == "Black") %>%
  select(date, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-date,
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "fill") +
  facet_wrap(~category, nrow = 2) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC"))
cl_categories5

cl_categories6 <- cl_19to22 %>%
  filter(year != 0,
         ethnicity == "White") %>%
  select(date, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-date,
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "fill") +
  facet_wrap(~category, nrow = 2) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC"))
cl_categories6


cl_categories7 <- cl_19to22 %>%
  filter(year != 0) %>%
  select(date, ethnicity, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-c(date, ethnicity),
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  filter(category == "ocg",
         ethnicity %in% c("Asian", "Black", "White")) %>% 
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "fill") +
  facet_wrap(~ethnicity) +
  scale_fill_manual(values = c("#99CCCC", "#9999CC")) +
  ggtitle("pc of cases with OCG flags by ethnicity")
cl_categories7

cl_categories7 <- cl_19to22 %>%
  filter(year != 0) %>%
  select(date, ethnicity, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-c(date, ethnicity),
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  filter(category == "firearm",
         ethnicity %in% c("Asian", "Black", "White")) %>% 
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "fill") +
  facet_wrap(~ethnicity) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC")) +
  ggtitle("pc of cases with firearm flags by ethnicity")
cl_categories7


cl_categories7 <- cl_19to22 %>%
  filter(year != 0) %>%
  select(date, ethnicity, serious_violence, missing, firearm, weapon, csae,
         nrm_referral, cuckoo, ocg) %>%
  pivot_longer(-c(date, ethnicity),
               names_to = "category",
               values_to = "status") %>%
  mutate(status = factor(status, levels = c("Unknown",
                                            "Yes",
                                            "No"))) %>%
  filter(category == "serious_violence",
         ethnicity %in% c("Asian", "Black", "White")) %>% 
  ggplot() +
  geom_bar(aes(x = date, fill = status),
           stat = "count", position = "fill") +
  facet_wrap(~ethnicity) +
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC")) +
  ggtitle("pc of cases with serious violence flags by ethnicity")
cl_categories7
