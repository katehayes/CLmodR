install.packages("scales")                         # Install & load scales
library("scales")


nrm_exploc_all <- nrm_19to22 %>%
  mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
                                                          "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(expl_loc_type)),
           stat = "count", position = "stack") +
  scale_fill_manual(values = c( "grey", "#99CCCC", "#9999CC", "#9966CC"))
nrm_exploc_all
ggsave(filename = "Output/Graphs/nrm_exploc_all.png", nrm_exploc_all)

# where would county lines kids from birmingham be classed as being exploited in?
nrm_exploc_child <- nrm_19to22 %>%
  filter(age <= 17) %>%
  mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
                                                          "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(expl_loc_type)),
           stat = "count", position = "stack") +
  scale_fill_manual(values = c( "grey", "#99CCCC", "#9999CC", "#9966CC"))
nrm_exploc_child
# comparatively less children overseas which makes sense

nrm_exploc_child_cl <- nrm_19to22 %>%
  filter(age <= 17,
         cl_mention == "Yes") %>%
  mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
                                                          "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(expl_loc_type)),
           stat = "count", position = "stack") +
  scale_fill_manual(values = c( "grey", "#9999CC", "#9966CC"))
nrm_exploc_child_cl

# no county lines children overseas

nrm_exploc_child_cl <- nrm_19to22 %>%
  filter(age <= 17,
         cl_mention == "Yes") %>%
  # mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
  #                                                         "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(expl_location)),
           stat = "count", position = "stack")
  # scale_fill_manual(values = c( "grey", "#9999CC", "#9966CC"))
nrm_exploc_child_cl


# birmingham nrm children who were flagged county lines
nrm_child_birm <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>%
  # mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
  #                                                         "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date2, fill = cl_mention),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
              limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
              date_labels="%b-%Y" ) +
  ggtitle("Child NRM referrals, exploited in Birmingham. In red if recorded as CL-related.") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(color="black", size=10)) +
  scale_fill_manual(values = c( "lightgrey", "#CC0033"))
nrm_child_birm
ggsave(filename = "Output/Graphs/nrm_child_birm_cl.png", nrm_child_birm)



nrm_cl <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham",
         cl_mention == "Yes") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>% 
  select(age, gender, nationality, date2) %>% 
  ggplot() +
  geom_bar(aes(x = age, fill = gender),
           stat = "count", position = "stack")





nrm_cl <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham",
         cl_mention == "No")

nrm_cl <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham",
         cl_mention == "Yes") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>% 
  select(age, gender, nationality, date2) %>% 
  ggplot() +
  geom_bar(aes(x = date2, fill = as.factor(age)),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y")
nrm_cl

cl_nrm <-  cl_19to22 %>%
  filter(year != 0,
         age <= 17,
         la == "Birmingham",
         nrm_referral == "Yes") %>% 
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>% 
  select(age, gender, ethnicity, date2) %>% 
  ggplot() +
  geom_bar(aes(x = date2, fill = as.factor(age)),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y")

cl_nrm

comp_cl_nrm <- 

# birmingham county lines children with an NRM referral
cl_child_birm <- cl_19to22 %>%
  filter(year != 0,
         age <= 17,
         la == "Birmingham") %>% # birmingham kids are younger than the other west midlands kids
  mutate(nrm_referral = factor(nrm_referral, levels = c("Unknown",
                                            "No",
                                            "Yes"))) %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>%
  ggplot() +
  geom_bar(aes(x = date2, fill = nrm_referral),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y" ) +
  ggtitle("Children in Birmingham marked as CL-involved. In red/dark grey if recorded as having/not having an NRM referral.") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(color="black", size=10)) +
  scale_fill_manual(values = c("lightgrey", "#ADAAAB", "#CC0033"))
cl_child_birm
ggsave(filename = "Output/Graphs/cl_child_birm_nrm.png", cl_child_birm)


# birmingham nrm children who were flagged gangs
nrm_child_birm_gangs <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>%
  # mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
  #                                                         "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date2, fill = gangs_mention),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y" ) +
  ggtitle("Child NRM referrals, exploited in Birmingham. In red if recorded as gangs-related.") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(color="black", size=10)) +
  scale_fill_manual(values = c( "lightgrey", "#CC0033"))

nrm_child_birm_gangs
ggsave(filename = "Output/Graphs/nrm_child_birm_gangs.png", nrm_child_birm_gangs)

# birmingham nrm children who were flagged drugs
nrm_child_birm_drugs <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>%
  # mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
  #                                                         "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date2, fill = drugs_mention),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y" ) +
  ggtitle("Child NRM referrals, exploited in Birmingham. In red if recorded as drugs-related.") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(color="black", size=10)) +
  scale_fill_manual(values = c( "lightgrey", "#CC0033"))
nrm_child_birm_drugs
ggsave(filename = "Output/Graphs/nrm_child_birm_drugs.png", nrm_child_birm_drugs)


# birmingham nrm children who were flagged weapons
nrm_child_birm_weapons <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>%
  # mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
  #                                                         "Out of Force Area", "Overseas", "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = date2, fill = fw_mention),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y" ) +
  ggtitle("Child NRM referrals, exploited in Birmingham. In red if recorded as firearms/weapons-related.") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(color="black", size=10)) +
  scale_fill_manual(values = c( "lightgrey", "#CC0033"))
nrm_child_birm_weapons
ggsave(filename = "Output/Graphs/nrm_child_birm_weapons.png", nrm_child_birm_drugs)




nrm_fr <- nrm_19to22 %>%
  mutate(first_responder2 = case_when(first_responder %in% c("Home Office", "Home Office - UKVI") ~ "Home Office",
                                      first_responder %in% c("Local Authority - Birmingham") ~ "LA - Birmingham",
                                      first_responder %in% c("Local Authority - Other") ~ "LA - not in West Midlands",
                                      first_responder %in% c("West Midlands Police") ~ "West Midlands Police Force",
                                      first_responder %in% c("Other Police Force") ~ "Other Police Force",
                                      first_responder %in% c("Barnardo’s") ~ "Barnardo’s",
                                      first_responder %in% c("Unknown") ~ "Unknown",
                                      first_responder %in% c("Local Authority - Coventry", "Local Authority - Dudley",
                                                             "Local Authority - Sandwell", "Local Authority - Solihull",
                                                             "Local Authority - Walsall", "Local Authority - Wolverhampton") ~ "LA - West Midlands")) %>%
  mutate(first_responder2 = factor(first_responder2, levels = c("LA - Birmingham", "LA - West Midlands",
                                                                "LA - not in West Midlands", "West Midlands Police Force", "Other Police Force",
                                                                "Home Office", "Barnardo’s", "Unknown"))) %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  ggplot() +
  geom_bar(aes(x = date, fill = fct_rev(first_responder2)),
           stat = "count", position = "stack") +
  scale_fill_viridis(option = "turbo", discrete = TRUE, direction = 1)
nrm_fr




nrm_child_birm_all <- nrm_19to22 %>%
  filter(age <= 17,
         expl_location == "Birmingham") %>%
  mutate(date2 = dmy(paste0("01 ", month, " ", year))) %>%
  # mutate(expl_loc_type = factor(expl_loc_type, levels = c("West Midlands Police Force Area",
  #                                                         "Out of Force Area", "Overseas", "Unknown"))) %>%
  mutate(all_flag = "No") %>% 
  mutate(all_flag = ifelse(cl_mention == "Yes", "Yes", all_flag)) %>% 
  mutate(all_flag = ifelse(gangs_mention == "Yes", "Yes", all_flag)) %>% 
  mutate(all_flag = ifelse(drugs_mention == "Yes", "Yes", all_flag)) %>%                   
  ggplot() +
  geom_bar(aes(x = date2, fill = all_flag),
           stat = "count", position = "stack") +
  scale_y_continuous(limits = c(0, 42)) +
  scale_x_date(date_breaks = "6 month",
               limits = c(as.Date('1/12/2018', format="%d/%m/%Y"), as.Date('1/3/2023', format="%d/%m/%Y")),
               date_labels="%b-%Y" ) +
  ggtitle("Child NRM referrals, exploited in Birmingham. In red if recorded as CL/gangs/drugs-related") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(color="black", size=10)) +
  scale_fill_manual(values = c( "lightgrey", "#CC0033"))
nrm_child_birm_all
ggsave(filename = "Output/Graphs/nrm_child_birm_all.png", nrm_child_birm_all)







