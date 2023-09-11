# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_age_gender.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_fsm.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/pru_10to22_ethnicity.Rdata")

load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_age_gender.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_fsm.Rdata")
load("/Users/katehayes/CLmodR/output/data/cleaned/schools_10to22_ethnicity.Rdata")



s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/school_categories.csv")


secondary <- s_data %>% 
  filter(my_categories == "State-funded secondary") %>% 
  distinct(school_type, school_subtype)
# there is something wrong with school categories in 2010 and 2011

# initial conditions for the PRU population???

schools_fsm <- schools_10to22_fsm %>%
  filter(level == "Birmingham") %>% 
  left_join(s_data) 


schools_school_level <- schools_10to22_age_gender %>%
  filter(level == "Birmingham") %>%
  filter(age %in% 10:17) %>% 
  # left_join(s_data) 
  left_join(schools_fsm %>% 
              mutate(fsm_pc = school_fsm / school_headcount) %>% 
              mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc))) %>% 
  mutate(count_fsm = count * fsm_pc,
         count_non_fsm = count * (1-fsm_pc)) 

save(schools_school_level, file = "output/data/processed/schools_school_level.Rdata")


schools <- schools_school_level %>% 
  select(-c(count, school_headcount, school_fsm,
            fsm_pc)) %>% 
  pivot_longer(c(count_fsm, count_non_fsm),
               names_to = "fsm",
               values_to = "count") %>% 
  mutate(fsm = ifelse(grepl("non", fsm), "Not FSM eligible", "FSM eligible")) %>% 
  group_by(end_period_year, end_period_month, period_length,
           my_categories, age, gender, fsm) %>% 
  summarise(count = sum(count)) %>% 
  rename(school_type = my_categories) %>% 
  ungroup()

save(schools, file = "output/data/processed/schools.Rdata")


pru <- schools %>% 
  filter(school_type == "Pupil referral unit",
         age <= 15) %>% 
  select(-school_type) %>% 
  group_by(gender, age, fsm) %>% 
  arrange(end_period_year) %>% 
  # although no point really in smoothing until youve got the pcs of total?? not sure
  mutate(smooth_count = smooth.spline(end_period_year, count, lambda = 0.002)$y)


pru %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = fsm),
           stat = "identity", position = "stack") +
  facet_wrap(~interaction(gender, age))

pru %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = smooth_count, fill = fsm),
           stat = "identity", position = "stack")


school_pru <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0)



pru_rate <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  filter(age <= 15) %>% 
  mutate(pru = factor(pru),
         fsm = factor(fsm, levels = c("Not FSM eligible", "FSM eligible")),
         gender = factor(gender, levels = c("Girls", "Boys")),
         age = factor(age),
         year_sq = end_period_year^2) 

pru_decomp <- schools %>% 
  filter(age <= 15) %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
  pivot_longer(c(PRU, `Not PRU`),
               names_to = "pru",
               values_to = "count") %>% 
  group_by(end_period_year, age, gender, fsm) %>%
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  filter(pru == "PRU") %>% 
  select(-c(pru, count)) %>% 
  group_by(age, gender, fsm) %>%
  mutate(level = ifelse(end_period_year %in% c(2010:2013, 2021:2022),
                        pc, NA),
         level = mean(level, na.rm = T)) %>% 
  ungroup() %>% 
  group_by(fsm) %>% 
  mutate(mean_by_fsm = mean(level)) %>% 
  group_by(end_period_year, gender, age) %>% 
  mutate(mult = sum(mean_by_fsm) - mean_by_fsm) %>% 
  mutate(mult_byfsm = ifelse(fsm == "FSM eligible", mean_by_fsm/mult, 1)) %>% 
  ungroup() %>% 
  select(-c(mean_by_fsm, mult)) %>% 
  group_by(gender) %>% 
  mutate(mean_by_gen = mean(level)) %>%
  group_by(end_period_year, fsm, age) %>% 
  mutate(mult = sum(mean_by_gen) - mean_by_gen) %>%
  mutate(mult_bygen = ifelse(gender == "Boys", mean_by_gen/mult, 1)) %>% 
  select(-c(mean_by_gen, mult)) %>% 
  ungroup() %>% 
  group_by(age) %>% 
  mutate(mean_by_age = mean(level)) %>% 
  ungroup() %>% 
  mutate(ref10 = ifelse(age == 10, mean_by_age, NA),
         ref10 = mean(ref10, na.rm = T)) %>% 
  mutate(mult_byage = mean_by_age/ ref10) %>% 
  select(-c(mean_by_age, ref10)) %>% 
  ungroup() %>% 
  mutate(ref_level = ifelse(gender == "Girls" & age == 10 & fsm == "Not FSM eligible", level, NA),
         ref_level = mean(ref_level, na.rm = T)) %>% 
  mutate(re_compose = ref_level*mult_bygen*mult_byage*mult_byfsm,
         check = level - re_compose)


pru_decomp %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = check, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))

states <- schools %>% 
  filter(age <= 15) %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
 select(end_period_year, gender, age, fsm)
  
 

# interesting.... seems like there are many many interaction terms.  


candidate_pars <- c(0.0000785, 3, 2, 1.3, 0.25, 1.75, 3.43, 6.44, 10.2, 2.5, 0.00003, 0.9) 


install.packages("lognorm")
library(lognorm)
install.packages("prevalence")
library(prevalence)


meanlog <- -6.5
sdlog <- 1
lognorm_median <- getLognormMedian(meanlog)
lognorm_mode <- getLognormMode(meanlog, sdlog)
curve(dlnorm(x,meanlog,sdlog),from=0,to=0.015)
abline(v=lognorm_median, col=2); abline(v=lognorm_mode, col=3); 




candidate_pars <- data.frame(beta=rlnorm(n_samples,meanlog=2.85,sdlog=0.75),
                             prog_s=rbeta(n_samples,shape1=1.456131,shape2=456.6752), 
                             protection=rbeta(n_samples,shape1=77.88,shape2=20.7))



candidate_pars <- data.frame(`level` = rlnorm(n_samples,meanlog=0.0000785,sdlog=0.75), 
                             `Boys`, `FSM eligible`, `fsm_step`, `11`, `12`, `13`, `14`, `15`, `2017`, `near_change`, `damp`) 

candidate_pars <- as.data.frame(t(candidate_pars))

obs_data <- schools %>% 
  filter(age <= 15) %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  group_by(end_period_year, age, gender, pru, fsm) %>%
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
  pivot_longer(c(PRU, `Not PRU`),
               names_to = "pru",
               values_to = "count") %>% 
  group_by(end_period_year, age, gender, fsm) %>%
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  filter(pru == "PRU") %>% 
  select(-c(pru, count)) 


decomp_model <- function(candidate_pars, states) {
  
  output <- states %>% 
    mutate(level = candidate_pars$level,
           mult_gen = ifelse(gender == "Boys", candidate_pars$Boys, 1),
           mult_age = case_when(age == 10 ~ 1,
                                age == 11 ~ candidate_pars$`11`,
                                age == 12 ~ candidate_pars$`12`,
                                age == 13 ~ candidate_pars$`13`,
                                age == 14 ~ candidate_pars$`14`,
                                age == 15 ~ candidate_pars$`15`),
           mult_fsm = ifelse(fsm == "FSM eligible", candidate_pars$`FSM eligible`, 1),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 12, candidate_pars$`FSM eligible`*candidate_pars$fsm_step, mult_fsm),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 13, candidate_pars$`FSM eligible`*2*candidate_pars$fsm_step, mult_fsm),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 14, candidate_pars$`FSM eligible`*3*candidate_pars$fsm_step, mult_fsm),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 15, candidate_pars$`FSM eligible`*4*candidate_pars$fsm_step, mult_fsm),
           trend_switch = ifelse(fsm == "Not FSM eligible" & age != 15, 0, 1),
           mult_year = case_when(end_period_year %in% c(2010:2013, 2020:2022) ~ 0,
                                 end_period_year == 2014 ~ 0.6*candidate_pars$`2017`,
                                 end_period_year == 2015 ~ 0.77*candidate_pars$`2017`,
                                 end_period_year == 2016 ~ 0.91*candidate_pars$`2017`,
                                 end_period_year == 2017 ~ candidate_pars$`2017`,
                                 end_period_year == 2018 ~ 0.99*candidate_pars$`2017`,
                                 end_period_year == 2019 ~ 0.88*candidate_pars$`2017`),
           near_change = case_when(age %in% c(11:14) ~ 0,
                                   age %in% c(10,15) ~ candidate_pars$`near_change`),
           # near_change = ifelse(age == 10 & gender == "Girls" & fsm == "Not FSM eligible", 0, near_change),
           damp = ifelse(fsm == "Not FSM eligible", candidate_pars$`damp`, 1)) %>% 
  mutate(each_level = level*mult_gen*mult_age*mult_fsm,
         each_trend = trend_switch*mult_year*(each_level+near_change)*damp) %>% 
  mutate(sim_pc = each_level + each_trend) %>% 
  select(end_period_year, gender, age, fsm, each_level, each_trend, sim_pc, mult_fsm) 
  
  return(output)

}

decomp_distance <- function(model_output, observed_data) {
  
  distance <- observed_data %>% 
    full_join(model_output) %>% 
    ungroup() %>% 
    mutate(ss = ifelse(pc == 0, (pc - sim_pc)^2, ((pc - sim_pc)/pc)^2)) %>% 
    summarise(ss = mean(ss, na.rm = T)) %>% 
    unlist()
  
}

mod_out <- decomp_model(candidate_pars = candidate_pars, states = states)


d <- decomp_distance(model_output = mod_out, observed_data = obs_data)


distance <- obs_data %>% 
  full_join(mod_out) %>% 
  ungroup() %>% 
  mutate(ss = ifelse(pc == 0, (pc - sim_pc)^2, ((pc - sim_pc)/pc)^2))  



%>% 
  unlist()



# y_{g,a,f}(t) = lev*g*a*f + trend(t)*g*a*f ????

# f_{lev} = 1 when fsm = no, x when fsm = yes
# 
# meanlev_{fsm = no} = lev*g*a/12
# meanlev_{fsm = yes} = lev*g*a*x/12
# -> x = meanlev_{fsm = yes}/meanlev_{fsm = no}


pru_decomp %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = pc, group = fsm, colour = fsm)) +
  geom_line(aes(x=end_period_year, y = level, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))


mylogit <- glm(pru ~ gender*age*fsm + end_period_year + year_sq, data = pru_rate, family = "binomial")


summary(mylogit)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # more recent than above - checking things for fitting# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



obs_pru_rate <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>%
  filter(age %in% c(10:15)) %>% 
         # age != 11) %>% 
  group_by(end_period_year, age, gender, pru) %>%
  summarise(count = sum(count)) %>% 
  pivot_wider(names_from = pru,
              values_from = count,
              values_fill = 0) %>% 
  mutate(pc = PRU/(PRU + `Not PRU`)) %>% 
  select(end_period_year, age, gender, pc) %>% 
  ungroup() %>% 
  group_by(gender, age) %>% 
  arrange(end_period_year) %>% 
  mutate(smooth_pc = smooth.spline(end_period_year, pc, lambda = 0.02)$y)

# %>% 
#   pivot_wider(names_from = gender,
#               values_from = c(pc, smooth_pc)) %>% 
# 
# # %>% 
#   # group_by(age) %>% 
#   # mutate(Girls = ifelse(age %in% c(10,12) & Girls < 0.00000001, mean(Girls)/4, Girls)) %>% 
#   mutate(rel_rate = pc_Boys/pc_Girls,
#          rel_rate = ifelse(age == 11, 1, rel_rate),
#          rel_rate = ifelse(age %in% c(10,12) & pc_Girls < 0.00000001, NA, rel_rate)) %>% 
#   ungroup() %>% 
#   group_by(age) %>% 
#   arrange(end_period_year) %>% 
#   mutate(rel_rate = ifelse(age %in% c(10,12) & pc_Girls < 0.00000001, (lead(rel_rate) + lag(rel_rate))/2, rel_rate)) %>% 
#   ungroup() %>% 
#   mutate(smooth_rel_rate = smooth_pc_Boys/smooth_pc_Girls)

pc_pru_age_gen2 <- obs_pru_rate %>% 
  pivot_longer(c(Girls, Boys),
               names_to = "gender",
               values_to = "pc") %>% 
  ggplot() +
  geom_line(aes(x = age, y = pc, group = interaction(as.character(end_period_year), gender), color = interaction(as.character(end_period_year), gender))) + 
  # scale_color_manual(values = c("#FDEDEC",
  #                               "#FADBD8",
  #                               "#F5B7B1",
  #                               "#EC7063",
  #                               "#E74C3C",
  #                               "#CB4335",
  #                               "#B03A2E",
  #                               "#943126",
  #                               "#78281F",
  #                               "#641E16",
  #                               "#49150F",
  #                               "#2E0D09",
  #                               "#1A0705")) +
  scale_colour_viridis(option = "plasma",
                       discrete = T) +
  theme_bw()
pc_pru_age_gen2
ggsave(filename = "output/graphs/pc_pru_age_gen2.png", pc_pru_age_gen2)  

pc_pru_age_gen <- obs_pru_rate %>% 
  # filter(gender == "Boys") %>% 
  # pivot_longer(c(Girls, Boys),
  #              names_to = "gender",
  #              values_to = "pc") %>% 
  ggplot() +
  geom_line(aes(x = age, y = pc, group = gender, color = gender)) +
  # geom_line(aes(x = age, y = smooth_pc, group = gender, color = gender)) +
  facet_grid(~as.character(end_period_year)) +
  # scale_colour_viridis(option = "magma",
  #                    discrete = T) +
  theme_bw() +
  theme(panel.spacing.x = unit(0, "lines"),
        legend.position = "none")
pc_pru_age_gen

ggsave(filename = "output/graphs/pc_pru_age_gen.png", pc_pru_age_gen)  

rel_rate_pru_bygen <- obs_pru_rate %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = age, y = rel_rate, group = as.character(end_period_year), colour = as.character(end_period_year))) +
  geom_line(aes(x = age, y = smooth_rel_rate, group = as.character(end_period_year), colour = as.character(end_period_year))) +
  scale_colour_viridis(option = "turbo",
                       discrete = T) +
  theme_bw()
rel_rate_pru_bygen
ggsave(filename = "output/graphs/rel_rate_pru_bygen.png", rel_rate_pru_bygen)  


rel_rate_pru_bygen2 <- obs_pru_rate %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = as.character(end_period_year), y = rel_rate, group = as.character(age), colour = as.character(age))) +
  scale_colour_viridis(option = "turbo",
                       discrete = T) +
  theme_bw()
rel_rate_pru_bygen2
ggsave(filename = "output/graphs/rel_rate_pru_bygen2.png", rel_rate_pru_bygen2)  


rel_rate_pru_bygen3 <- obs_pru_rate %>% 
  add_cohort() %>% 
  ggplot() +
  geom_line(aes(x = cohort, y = rel_rate, group = as.character(age), colour = as.character(age))) +
  scale_colour_viridis(option = "turbo",
                       discrete = T) +
  theme_bw()
rel_rate_pru_bygen3
ggsave(filename = "output/graphs/rel_rate_pru_bygen2.png", rel_rate_pru_bygen2)  




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # not sure what i was up to# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


check <- schools %>% 
  mutate(pru = ifelse(school_type == "Pupil referral unit", "PRU", "Not PRU")) %>% 
  group_by(end_period_year, age, gender, pru) %>% 
  mutate(count_fsm = sum(count_fsm),
         count_non_fsm = sum(count_non_fsm)) %>% 
  distinct(end_period_year, pru, age, gender, count_fsm, count_non_fsm) %>% 
  mutate(cohort = case_when(end_period_year - age == 1993 ~"Cohort 1", 
                            end_period_year - age == 1994 ~"Cohort 2",
                            end_period_year - age == 1995 ~"Cohort 3",
                            end_period_year - age == 1996 ~"Cohort 4",
                            end_period_year - age == 1997 ~"Cohort 5",
                            end_period_year - age == 1998 ~"Cohort 6",
                            end_period_year - age == 1999 ~"Cohort 7",
                            end_period_year - age == 2000 ~"Cohort 8",
                            end_period_year - age == 2001 ~"Cohort 9",
                            end_period_year - age == 2002 ~"Cohort 10",
                            end_period_year - age == 2003 ~"Cohort 11",
                            end_period_year - age == 2004 ~"Cohort 12",
                            end_period_year - age == 2005 ~"Cohort 13",
                            end_period_year - age == 2006 ~"Cohort 14",
                            end_period_year - age == 2007 ~"Cohort 15",
                            end_period_year - age == 2008 ~"Cohort 16",
                            end_period_year - age == 2009 ~"Cohort 17",
                            end_period_year - age == 2010 ~"Cohort 18",
                            end_period_year - age == 2011 ~"Cohort 19",
                            end_period_year - age == 2012 ~"Cohort 20")) 

fsm_pru <- check %>% 
  select(-count_non_fsm) %>% 
  pivot_wider(names_from = pru, values_from = count_fsm, 
              values_fill = 0) %>%
  mutate(cohort = factor(cohort, 
                         levels = c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4",
                                    "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9",
                                    "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14",
                                    "Cohort 15", "Cohort 16", "Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"))) %>% 
  filter(age <= 15) %>% 
  ungroup() %>% 
  arrange(end_period_year) %>% 
  group_by(cohort, gender) %>% 
  mutate(diff_pru = PRU - lag(PRU),
         diff_non_pru = `Not PRU` - lag(`Not PRU`),
         rate_segregated = diff_pru / lag(`Not PRU`))


nonfsm_pru <- check %>% 
  select(-count_fsm) %>% 
  pivot_wider(names_from = pru, values_from = count_non_fsm, 
              values_fill = 0) %>%
  mutate(cohort = factor(cohort, 
                         levels = c("Cohort 1", "Cohort 2", "Cohort 3", "Cohort 4",
                                    "Cohort 5", "Cohort 6", "Cohort 7", "Cohort 8", "Cohort 9",
                                    "Cohort 10", "Cohort 11", "Cohort 12", "Cohort 13", "Cohort 14",
                                    "Cohort 15", "Cohort 16", "Cohort 17", "Cohort 18", "Cohort 19", "Cohort 20"))) %>% 
  filter(age <= 15) %>% 
  ungroup() %>% 
  arrange(end_period_year) %>% 
  group_by(cohort, gender) %>% 
  mutate(diff_pru = PRU - lag(PRU),
         diff_non_pru = `Not PRU` - lag(`Not PRU`),
         rate_segregated = diff_pru / lag(`Not PRU`))







# %>% 
  # select(-count) %>% 
  # pivot_longer(c(count_fsm, count_non_fsm),
  #              names_to = "fsm", values_to = "count") %>% 
  # mutate(fsm = ifelse(fsm == "count_fsm", "FSM", "Not eligible"))

# save(pru, file = "Output/Data/Processed/pru.Rdata")

# i think i'm going to do a my_categories level fsm assignment... actually.. school-level?






