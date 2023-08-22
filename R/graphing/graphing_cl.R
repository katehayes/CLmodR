load("/Users/katehayes/CLmodR/output/data/cleaned/cl_19to22.Rdata")


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
  scale_fill_manual(values = c("grey", "#99CCCC", "#9999CC"))
cl_categories

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
