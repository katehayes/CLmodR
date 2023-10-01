load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_age.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_ethnicity.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_07to21_fsm.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/excl_susp_14to22_pru.Rdata")

s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/school_categories.csv")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_age_gender.Rdata")


cohort_excl1 <- plot_grid(excl_susp_pru_6, excl_susp_pru_7, excl_susp_pru_8, ncol = 1, align = "v")
cohort_excl2 <- plot_grid(excl_susp_pru_9, excl_susp_pru_1, excl_susp_pru_11, ncol = 1, align = "v")
cohort_excl3 <- plot_grid(excl_susp_pru_12, excl_susp_pru_13, excl_susp_pru_14, ncol = 1, align = "v")
cohort_excl4 <- plot_grid(excl_susp_pru_13, excl_susp_pru_14, check, ncol = 1, align = "v")

cohort_excl1
ggsave(filename = "output/graphs/cohort_excl1.png", cohort_excl1)
cohort_excl2
ggsave(filename = "output/graphs/cohort_excl2.png", cohort_excl2)
cohort_excl3
ggsave(filename = "output/graphs/cohort_excl3.png", cohort_excl3)
cohort_excl4
ggsave(filename = "output/graphs/cohort_excl4.png", cohort_excl4)

# one_plus_susp == Pupil enrolments with one or more suspension

# checking_twodatasets_match <-excl_susp_07to21_age %>% 
#   filter(level == "Birmingham",
#          age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
#          end_period_year >= 2010) %>% 
#   mutate(age = as.numeric(age),
#          end_period_year = as.numeric(end_period_year)) %>% 
#   group_by(age, end_period_year) %>% 
#   summarise(perm_excl = sum(perm_excl),
#             headcount = sum(headcount)) %>% 
#   full_join(schools_10to22_age_gender %>%
#               filter(level == "Birmingham",
#                      age %in% 10:17,
#                      end_period_year < 2022) %>% 
#               left_join(s_data) %>% 
#               filter(!(my_categories %in% c("Private school", "Pupil referral unit"))) %>% 
#               group_by(age, end_period_year) %>% 
#               summarise(count = sum(count, na.rm = T)) %>% 
#               rename(other_headcount = count)) %>% 
#   add_cohort() %>% 
#   mutate(count_diff = headcount - other_headcount)
  
# so exclusions are within the academic year...

excl_susp_pru <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  arrange(end_period_year) %>% 
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                       "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  ggplot() +
  # geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
  #           fill="#F7F7F7", alpha = 0.1) +
  # geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
  #           fill="#EEEEEE", alpha = 0.1) +
  # geom_vline(xintercept = 2014,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  # geom_vline(xintercept = 2022,  #linetype="dotted",
  #            color = "black", size=0.7, alpha = 0.05) +
  
  geom_line(aes(x = age, y = diff_pru), colour = "blue") +
  geom_line(aes(x = age, y = perm_excl), colour = "red") +
  facet_wrap(~cohort) +
  theme_bw() +
  # scale_x_continuous(limits = c(2009.5, 2022.5),
  #                    expand = c(0,0),
  #                    name = "", 
  #                    breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022), 
  #                    labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
  scale_y_continuous(name = "",
                     limits = c(0, 160),
                     expand = c(0,0)
                     # breaks = c(0,30,60),
                     # labels = c("0","30","60")
                     ) +
  theme(strip.text = element_blank())


excl_susp_pru

excl_susp_pru_1 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 10") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "", "", "11", "12", "13", "14", "15", "",  "", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 280),
                     expand = c(0,0),
                     breaks = c(0,50,100,150,200,250),
                     labels = c("0","50","100","150","200","250")
  ) 

excl_susp_pru_1

excl_susp_pru_6 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 6") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("12", "13", "14", "15", "","", "", "",  "", "", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 60),
                     expand = c(0,0)
                     # breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     # labels = c("0","","50","","100","","150","","200","","250","")
  ) 
excl_susp_pru_6


excl_susp_pru_7 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 7") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("11", "12", "13", "14", "15", "", "", "",  "", "", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 170),
                     expand = c(0,0)
                     # breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     # labels = c("0","","50","","100","","150","","200","","250","")
  ) 
# theme(strip.text = element_blank())
excl_susp_pru_7



excl_susp_pru_8 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 8") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "11", "12", "13", "14", "15", "", "", "",  "", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 170),
                     expand = c(0,0)
                     # breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     # labels = c("0","","50","","100","","150","","200","","250","")
  ) 
# theme(strip.text = element_blank())
excl_susp_pru_8


excl_susp_pru_9 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 9") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "", "11", "12", "13", "14", "15", "", "",  "", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 270),
                     expand = c(0,0),
                     breaks = c(0,50,100,150,200,250),
                     labels = c("0","50","100","150","200","250")
  ) 
excl_susp_pru_9


excl_susp_pru_11 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 11") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "", "", "", "11", "12", "13", "14", "15",  "", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 300),
                     expand = c(0,0),
                     breaks = c(0,50,100,150,200,250),
                     labels = c("0","50","100","150","200","250")
  ) 
# theme(strip.text = element_blank())
excl_susp_pru_11


excl_susp_pru_12 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 12") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "", "", "", "", "11", "12", "13", "14", "15", "", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 135),
                     expand = c(0,0)
                     # breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     # labels = c("0","","50","","100","","150","","200","","250","")
  )

# theme(strip.text = element_blank())
excl_susp_pru_12



excl_susp_pru_13 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 13") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "", "", "", "", "", "11", "12", "13", "14", "15", "", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 50),
                     expand = c(0,0)
                     # breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     # labels = c("0","","50","","100","","150","","200","","250","")
  ) 

# theme(strip.text = element_blank())
excl_susp_pru_13




excl_susp_pru_14 <-excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year)) %>% 
  group_by(age, end_period_year) %>% 
  summarise(perm_excl = sum(perm_excl),
            one_plus_susp = sum(one_plus_susp)) %>% 
  full_join(schools_10to22_age_gender %>%
              filter(level == "Birmingham",
                     age %in% 10:17,
                     end_period_year < 2022) %>% 
              left_join(s_data) %>% 
              filter(my_categories == "Pupil referral unit") %>% 
              group_by(age, end_period_year) %>% 
              summarise(count = sum(count, na.rm = T)) %>% 
              rename(pru_headcount = count)) %>% 
  mutate(pru_headcount = ifelse(is.na(pru_headcount), 0, pru_headcount)) %>% 
  add_cohort() %>%
  filter(age %in% c(11:15),
         !cohort %in% c("Cohort 3", "Cohort 4", "Cohort 5", "Cohort 15", "Cohort 16",
                        "Cohort 17", "Cohort 18")) %>%
  group_by(cohort) %>% 
  arrange(end_period_year) %>% 
  mutate(diff_pru = lead(pru_headcount) - pru_headcount) %>% 
  filter(cohort == "Cohort 14") %>% 
  ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  # geom_line(aes(x = end_period_year, y = diff_pru, colour = age)) +
  # geom_line(aes(x = end_period_year, y = perm_excl, colour = age)) +
  geom_line(aes(x = end_period_year, y = diff_pru), colour = "#0054FFFF") +
  geom_line(aes(x = end_period_year, y = perm_excl), colour = "#FF5500FF") +
  theme_bw() +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                     labels = c("", "", "", "", "", "", "", "11", "12", "13", "14", "15", "")) +
  scale_y_continuous(name = "",
                     limits = c(0, 50),
                     expand = c(0,0)
                     # breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     # labels = c("0","","50","","100","","150","","200","","250","")
                     ) 
# theme(strip.text = element_blank())
excl_susp_pru_14


check <- ggplot() +
  geom_rect(data=NULL,aes(xmin=2010.5,xmax=2014,ymin=-Inf,ymax=Inf),
            fill="#F7F7F7", alpha = 0.1) +
  geom_rect(data=NULL,aes(xmin=2014,xmax=2022,ymin=-Inf,ymax=Inf),
            fill="#EEEEEE", alpha = 0.1) +
  geom_vline(xintercept = 2014,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  geom_vline(xintercept = 2022,  #linetype="dotted",
             color = "black", size=0.7, alpha = 0.05) +
  scale_x_continuous(limits = c(2009.5, 2022.5),
                   expand = c(0,0),
                   name = "",
                   breaks = c(2010, 2012, 2014, 2016, 2018, 2020, 2022),
                   labels = c("2010", "2012", "2014", "2016", "2018", "2020", "2022")) +
  scale_y_continuous(name = "",
                     limits = c(0, 25),
                     expand = c(0,0),
                     breaks = c(0,25,50,75,100,125,150,175,200,225,250,275),
                     labels = c("0","","50","","100","","150","","200","","250","")) +
  theme_bw()

check

excl_susp_pru %>% 
  pivot_longer(c(diff_pru, perm_excl, one_plus_susp, pru_headcount),
               names_to = "count_type",
               values_to = "count") %>% 
  filter(cohort == "Cohort 11") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity", position = "dodge") +
  facet_grid(~count_type)

excl_susp_pru %>% 
  filter(cohort == "Cohort 11") %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = perm_excl),
           stat = "identity", position = "dodge") 



# 


susp_excl_age <- excl_susp_07to21_age %>% 
  filter(level == "Birmingham",
         age %in% c("10", "11", "12", "13", "14", "15", "16", "17"),
         end_period_year >= 2010) %>% 
  mutate(age = as.numeric(age)) %>% 
  group_by(end_period_year, age) %>% 
  mutate(headcount = sum(headcount),
         perm_excl = sum(perm_excl),
         suspension = sum(suspension),
         one_plus_susp = sum(one_plus_susp)) %>% 
  distinct(end_period_year, age, headcount, perm_excl,
           suspension, one_plus_susp) %>% 
  mutate(suspension_rate = suspension/headcount,
         one_plus_susp_rate = one_plus_susp/headcount,
         susp_rate_per_child_susp = suspension/one_plus_susp,
         perm_excl_rate = perm_excl/headcount)

susp_excl_fsm <- excl_susp_07to21_fsm %>% 
  filter(level == "Birmingham",
         fsm != "Unknown",
         school_type != "State-funded primary",
         end_period_year >= 2010) %>% 
  group_by(end_period_year, fsm) %>% 
  mutate(headcount = sum(headcount),
         perm_excl = sum(perm_excl),
         suspension = sum(suspension),
         one_plus_susp = sum(one_plus_susp)) %>% 
  distinct(end_period_year, fsm, headcount, perm_excl,
           suspension, one_plus_susp) %>% 
  mutate(suspension_rate = suspension/headcount,
         one_plus_susp_rate = one_plus_susp/headcount,
         susp_rate_per_child_susp = suspension/one_plus_susp,
         perm_excl_rate = perm_excl/headcount)

  
  

  




