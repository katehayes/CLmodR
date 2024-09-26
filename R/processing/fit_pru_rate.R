




fsm_check <- schools_10to22_age_gender %>%
  select(-ward) %>% 
  left_join(s_data) %>% 
  filter(age %in% c(11:15),
         level == "Birmingham") %>% 
  mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
         school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
         school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
         school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>% 
  group_by(end_period_year, school_type, school_subtype, school, my_categories, academy) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  left_join(schools_fsm %>% 
              select(-ward) %>% 
              filter(level == "Birmingham") %>% 
              mutate(fsm_pc = school_fsm / school_headcount) %>% 
              mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc)) %>% 
              mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
                     school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
                     school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
                     school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school))) %>% 
  filter(my_categories != "Private school") %>% 
  mutate(count_fsm = count * fsm_pc,
         count_non_fsm = count * (1-fsm_pc))


fsm_check %>% 
  ggplot() +
  geom_histogram(aes(x = fsm_pc, color = academy), 
                 fill="white", binwidth = 0.01)+
  facet_wrap(~end_period_year)


check <- schools_fsm %>% 
  mutate(fsm_pc = school_fsm / school_headcount) %>% 
  mutate(fsm_pc = ifelse(is.na(fsm_pc), 0, fsm_pc)) %>% 
  mutate(school = ifelse(school %in% c("The City of Birmingham School", "City of Birmingham School", "The Behaviour Support Service"), "Behaviour Support Service at The City of Birmingham School", school),
         school = ifelse(school == "EBN Free School", "East Birmingham Network Academy", school),
         school = ifelse(school == "Ebn Academy  2", "EBN Academy Phase 2", school),
         school = ifelse(school == "Titan St Georges Academy", "St Georges Academy", school)) %>% 
  left_join(s_data) %>% 
  filter(level == "Birmingham")














# install.packages("lognorm")
library(lognorm)
# install.packages("texreg")
library(texreg)



change_in_pru <- schools %>% 
  filter(age <= 15,
         gender == "Boys",
         school_type == "Pupil referral unit") %>% 
  group_by(end_period_year, age, fsm) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, fsm) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot()+
  # geom_bar(aes(x = end_period_year, y = count, fill = -age),
  #          stat = "identity", position = "fill") +
  # facet_grid(~fsm)
  
  # geom_line(aes(x = end_period_year, y = pc, group = interaction(age, fsm), color = as.character(age)))
  # 
  # geom_bar(aes(x = end_period_year, y = count, fill = -age),
  #                   stat = "identity", position = "stack") +
  #          facet_grid(~fsm) 
geom_bar(aes(x = end_period_year, y = count, fill = age),
         stat = "identity", position = "stack") +
  geom_line(data = schools %>% 
              filter(age <= 15,
                     gender == "Boys",
                     school_type == "Pupil referral unit") %>% 
              group_by(end_period_year, age, fsm) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              mutate(count = ifelse(end_period_year > 2014,
                                    NA, count)) %>% 
              group_by(age, fsm) %>% 
              mutate(count = mean(count, na.rm = T)),
            aes(x = end_period_year, y = count), color = "red") +
  facet_grid(~interaction(age,fct_rev(fsm))) +
  theme_bw() +
  scale_y_continuous(expand = c(0,0),
                     name = "")+
  scale_x_continuous(expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2013, 2016, 2019, 2022), 
                     labels = c("'10", "'13", "'16", "'19", "'22")) +
  theme(strip.text = element_blank(),
        legend.position = "none")

change_in_pru 

ggsave(filename = "output/graphs/change_in_pru.png", change_in_pru )


# overall ratio of FSM v non versus number of FSM in pru

fsm_effect_on_pru <- schools %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  group_by(end_period_year, age, fsm) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(fsm == "FSM eligible") %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = pc, group = age, color = age)) +
  geom_line(data = schools %>% 
              filter(age <= 15,
                     gender == "Boys",
                     school_type == "Pupil referral unit") %>% 
              group_by(end_period_year, age, fsm) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              filter(fsm == "FSM eligible"),
            aes(x = end_period_year, y = pc, group = age, color = age)) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 1),
                    expand = c(0,0),
                     name = "")+
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2013, 2016, 2019, 2022), 
                     labels = c("2010", "2013", "2016", "2019", "2022")) +
  theme(strip.text = element_blank(),
        legend.position = "none")
# for those not FSM eligible, most of the rise came from 15 year olds. 
fsm_effect_on_pru

ggsave(filename = "output/graphs/fsm_effect_on_pru.png", fsm_effect_on_pru)

# for a given person age something pru something, what is the PC chance they are in a PRU?




# the only one that sort of stays in line with the overall percentage is 15 
# it pretty much only starts rising when the overall percentage does. 
# the bigger the capacity, the more of a difference between FSM and non-FSM in every age except 15

pru_mult <- schools %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  group_by(end_period_year, age, fsm, school_type) %>% 
  summarise(count = sum(count)) %>% 
  filter(fsm == "FSM eligible") %>% 
  ungroup() %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc_pru_fsm = count/sum(count)) %>% 
  filter(school_type == "Pupil referral unit") %>% 
  select(end_period_year, age, pc_pru_fsm) %>% 
  left_join(schools %>% 
              filter(age <= 15,
                     gender == "Boys") %>% 
              group_by(end_period_year, age, fsm, school_type) %>% 
              summarise(count = sum(count)) %>% 
              filter(fsm != "FSM eligible") %>% 
              ungroup() %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc_pru_notfsm = count/sum(count)) %>% 
              filter(school_type == "Pupil referral unit") %>% 
              select(end_period_year, age, pc_pru_notfsm)) %>% 
  mutate(mult = pc_pru_fsm/pc_pru_notfsm)


pru_mult %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = mult, group = age, color = age))

pru_age <- schools %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  group_by(end_period_year, age, school_type) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc_pru_age = count/sum(count)) %>% 
  filter(school_type == "Pupil referral unit") %>% 
  select(end_period_year, age, pc_pru_age) %>% 
  pivot_wider(names_from = age,
              values_from = pc_pru_age) %>% 
  mutate(mult15 = `15`/`12`,
         mult14 = `14`/`12`,
         mult13 = `13`/`12`,
         mult10 = `10`/`12`,
         mult11 = `11`/`12`)

pru_age %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = mult14), color = "blue") +
  geom_line(aes(x = end_period_year, y = mult15), color = "red") +
  geom_line(aes(x = end_period_year, y = mult13), color = "green") +
  geom_line(aes(x = end_period_year, y = mult10), color = "orange") +
  geom_line(aes(x = end_period_year, y = mult11))

  
  age_in_pru <- schools %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  group_by(end_period_year, age, fsm, school_type) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, age, fsm) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(school_type == "Pupil referral unit") %>% 
  select(-count) %>% 
  ungroup() %>%
  pivot_wider(names_from = fsm,
              values_from = pc) %>% 
  mutate(mult = `FSM eligible`/ `Not FSM eligible`) 

# %>% 
  ggplot()+
  geom_line(aes(x = end_period_year, y = mult, group = age, color = as.character(age))) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 20),
                     expand = c(0,0),
                     name = "")+
  scale_x_continuous(limits = c(2009.5, 2022.5),
                     expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2013, 2016, 2019, 2022), 
                     labels = c("2010", "2013", "2016", "2019", "2022")) +
  theme(strip.text = element_blank())

age_in_pru


age_in_pru <- schools %>% 
  filter(age <= 15,
         gender == "Boys") %>% 
  group_by(end_period_year, age, fsm, school_type) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, age, fsm) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(school_type == "Pupil referral unit") %>% 
  select(-count) %>% 
  ungroup() %>%
  pivot_wider(names_from = fsm,
              values_from = pc) %>% 
  mutate(mult = `FSM eligible`/ `Not FSM eligible`)


fsm multiplier (by categorical age) versus pru capacity as a pc of total capacity plus fsm as a pc of total




mult10 <- age_in_pru %>% 
  filter(age == 10) %>% 
  select(end_period_year, mult) %>% 
  left_join(schools %>% 
              filter(age <= 15,
                     gender == "Boys") %>% 
              group_by(end_period_year, school_type) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year) %>% 
              mutate(pru_pc = count/sum(count)) %>% 
              filter(school_type == "Pupil referral unit") %>% 
              select(end_period_year, pru_pc)) %>% 
  left_join(schools %>% 
              filter(age <= 15,
                     gender == "Boys") %>% 
              group_by(end_period_year, fsm) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year) %>% 
              mutate(fsm_pc = count/sum(count)) %>% 
              filter(fsm == "FSM eligible") %>% 
              select(end_period_year, fsm_pc))
  


mult12 %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = mult))

mult12 %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pru_pc))

age_in_pru %>% 
  filter(age == 13) %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = mult))



mult12 <- age_in_pru %>% 
  filter(age == 12) %>% 
  select(end_period_year, mult) %>% 
  left_join(schools %>% 
              filter(age <= 15,
                     gender == "Boys") %>% 
              group_by(end_period_year, school_type) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year) %>% 
              mutate(pru_pc = count/sum(count)) %>% 
              filter(school_type == "Pupil referral unit") %>% 
              select(end_period_year, pru_pc)) %>% 
  left_join(schools %>% 
              filter(age <= 15,
                     gender == "Boys") %>% 
              group_by(end_period_year, fsm) %>% 
              summarise(count = sum(count)) %>% 
              ungroup() %>% 
              group_by(end_period_year) %>% 
              mutate(fsm_pc = count/sum(count)) %>% 
              filter(fsm == "FSM eligible") %>% 
              select(end_period_year, fsm_pc)) %>% 
  filter(end_period_year != 2018)

check <- lm(mult ~ fsm_pc + pru_pc, data = mult12)
summary(check)

check


change_in_pru <- schools %>% 
  filter(age <= 15,
         gender == "Boys",
         school_type == "Pupil referral unit") %>% 
  group_by(end_period_year, age, fsm) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(end_period_year, fsm) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot()+
  geom_bar(aes(x = end_period_year, y = count),
           stat = "identity", position = "stack") +
  facet_grid(~fsm) +
  theme_bw() +
  scale_y_continuous(expand = c(0,0),
                     name = "")+
  scale_x_continuous(expand = c(0,0),
                     name = "",
                     breaks = c(2010, 2013, 2016, 2019, 2022), 
                     labels = c("'10", "'13", "'16", "'19", "'22")) +
  theme(strip.text = element_blank(),
        legend.position = "none")

change_in_pru 

pru <- schools %>% 
  filter(age <= 15,
         gender == "Boys",
         school_type == "Pupil referral unit") %>% 
  group_by(fsm, age) %>% 
  arrange(end_period_year) %>% 
  mutate(lag_count = lag(count),
         change = count-lag_count,
         pc_change = change/lag_count) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc_change, group = interaction(age, fsm), color = as.character(age)))
  
pru

# mutate(pc_change = (count-lag(count)/lag(count))) 

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



logit_obs <- obs_data %>% 
  mutate(age = factor(age),
         gender = factor(gender, levels = c("Girls", "Boys")),
         fsm = factor(fsm, levels = c("Not FSM eligible", "FSM eligible")),
         end_period_year = factor(end_period_year))


reg_data <- schools %>% 
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
  mutate(near_change = ifelse(age %in% c(11:14), "Not near", "Near to transition point")) %>% 
  mutate(age = factor(age),
         gender = factor(gender, levels = c("Girls", "Boys")),
         fsm = factor(fsm, levels = c("Not FSM eligible", "FSM eligible")),
         near_change = factor(near_change, levels = c("Not near", "Near to transition point")),
         end_period_year = factor(end_period_year),
         pru = factor(pru),
         count = round(count, digits = 0)) %>% 
  mutate(policy_period = ifelse(end_period_year %in% c(2014:2020), 1, 0))



pru_logit <- glm(pru ~ gender + age + fsm + age*fsm + end_period_year + end_period_year*near_change , family="binomial", weight = reg_data$count, data = reg_data)

summary(pru_logit)


pru_logit_pol <- glm(pru ~ gender + age + fsm + age*fsm + policy_period*near_change, family="binomial", weight = reg_data$count, data = reg_data)

summary(pru_logit_pol)



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

logit_states <- states %>% 
  mutate(near_change = ifelse(age %in% c(11:14), "Not near", "Near to transition point")) %>% 
  mutate(policy_period = ifelse(end_period_year %in% c(2014:2020), 1, 0)) %>% 
  mutate(age = factor(age),
         gender = factor(gender, levels = c("Girls", "Boys")),
         fsm = factor(fsm, levels = c("Not FSM eligible", "FSM eligible")),
         near_change = factor(near_change, levels = c("Not near", "Near to transition point")),
         end_period_year = factor(end_period_year))


pru_predict <- cbind(logit_states, 
                     predict(pru_logit, newdata = logit_states, type = "link", se = TRUE)) %>% 
  mutate(pred_prob_pru = plogis(fit),
         LL = plogis(fit - (1.96 * se.fit)),
         UL = plogis(fit + (1.96 * se.fit)))

  
  
pru_predict %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pred_prob_pru, group = fsm, colour = fsm), linetype = "dashed") +
  # scale_colour_manual(values = c("red", "blue")) +
  geom_ribbon(aes(x = as.numeric(end_period_year), ymin = LL, ymax = UL, fill = fsm), alpha = 0.3) +
  geom_line(data = logit_obs, aes(x = end_period_year, y = pc, group = fsm, color = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age)) 
  

pru_logit_boys <- pru_predict %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pred_prob_pru, group = fsm, colour = fsm), linetype = "dashed") +
  # scale_colour_manual(values = c("red", "blue")) +
  geom_ribbon(aes(x = as.numeric(end_period_year), ymin = LL, ymax = UL, fill = fsm), alpha = 0.3) +
  geom_line(data = logit_obs %>% 
              filter(gender == "Boys"), 
            aes(x = end_period_year, y = pc, group = fsm, color = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age)) 
pru_logit_boys
ggsave(filename = "output/graphs/pru_logit_boys.png", pru_logit_boys)  


pru_logit_girls <- pru_predict %>% 
  filter(gender == "Girls") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pred_prob_pru, group = fsm, colour = fsm), linetype = "dashed") +
  # scale_colour_manual(values = c("red", "blue")) +
  geom_ribbon(aes(x = as.numeric(end_period_year), ymin = LL, ymax = UL, fill = fsm), alpha = 0.3) +
  geom_line(data = logit_obs %>% 
              filter(gender == "Girls"), 
            aes(x = end_period_year, y = pc, group = fsm, color = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age)) 
pru_logit_girls
ggsave(filename = "output/graphs/pru_logit_girls.png", pru_logit_girls)  




pru_predict_pol <- cbind(logit_states, 
                     predict(pru_logit_pol, newdata = logit_states, type = "link", se = TRUE)) %>% 
  mutate(pred_prob_pru = plogis(fit),
         LL = plogis(fit - (1.96 * se.fit)),
         UL = plogis(fit + (1.96 * se.fit)))


pru_predict_pol %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pred_prob_pru, group = fsm, colour = fsm)) +
  # scale_colour_manual(values = c("red", "blue")) +
  geom_ribbon(aes(x = as.numeric(end_period_year), ymin = LL, ymax = UL, fill = fsm), alpha = 0.3) +
  geom_line(data = logit_obs, aes(x = end_period_year, y = pc, group = fsm, color = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age)) +
  theme_bw()


# ok obviously you cant model it like this with a flat top
# is there some way other people model like a policy change &
# then allow it to have a shape/length of effect that is determined
# by a fit to the data??






# hmm.. what am i modelling here?
# a mixed model (some multiplicative some additive components)
# an interaction between FSM and age? (decreasing effect of FSM as age steps up?)



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






decomp_model <- function(level, Boys, FSM_eligible, fsm_step, a11, a12, a13, a14, a15, y2017, near_change, damp) {
  
  output <- states %>% 
    mutate(level = `level`,
           mult_gen = ifelse(gender == "Boys", Boys, 1),
           mult_age = case_when(age == 10 ~ 1,
                                age == 11 ~ a11,
                                age == 12 ~ a12,
                                age == 13 ~ a13,
                                age == 14 ~ a14,
                                age == 15 ~ a15),
           mult_fsm = ifelse(fsm == "FSM eligible", FSM_eligible, 1),
           # mult_fsm = ifelse(fsm == "FSM eligible" & age == 12, FSM_eligible*fsm_step, mult_fsm),
           # mult_fsm = ifelse(fsm == "FSM eligible" & age == 12, FSM_eligible, mult_fsm),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 13, FSM_eligible*2*fsm_step, mult_fsm),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 14, FSM_eligible*3*fsm_step, mult_fsm),
           mult_fsm = ifelse(fsm == "FSM eligible" & age == 15, FSM_eligible*4*fsm_step, mult_fsm),
           trend_switch = ifelse(fsm == "Not FSM eligible" & age != 15, 0, 1),
           mult_year = case_when(end_period_year %in% c(2010:2013, 2020:2022) ~ 0,
                                 end_period_year == 2014 ~ 0.6*y2017,
                                 end_period_year == 2015 ~ 0.77*y2017,
                                 end_period_year == 2016 ~ 0.91*y2017,
                                 end_period_year == 2017 ~ y2017,
                                 end_period_year == 2018 ~ 0.99*y2017,
                                 end_period_year == 2019 ~ 0.88*y2017),
           near_change = case_when(age %in% c(11:14) ~ 0,
                                   age %in% c(10,15) ~ near_change),
           # near_change = ifelse(age == 10 & gender == "Girls" & fsm == "Not FSM eligible", 0, near_change),
           # damp = ifelse(fsm == "Not FSM eligible", damp, 1)) %>% 
           damp = 1) %>% 
    mutate(each_level = level*mult_gen*mult_age*mult_fsm,
           each_trend = trend_switch*mult_year*(each_level+near_change)*damp) %>% 
    mutate(sim_pc = each_level + each_trend) %>% 
    select(end_period_year, gender, age, fsm, sim_pc) 
  
  return(output)
  
}

calc_distance <- function(model_output, observed_data) {
  
  distance <- observed_data %>% 
    full_join(model_output) %>% 
    ungroup() %>% 
    mutate(ss = ifelse(pc == 0, (pc - sim_pc)^2, ((pc - sim_pc)/pc)^2)) %>% 
    summarise(ss = mean(ss, na.rm = T)) 
  
  d <- distance$ss
  return(d)
  
}


get_distance <- function(level, Boys, FSM_eligible, fsm_step, a11, a12, a13, a14, a15, y2017, near_change, damp) {
  
  mod_out <- decomp_model(level, Boys, FSM_eligible, fsm_step, a11, a12, a13, a14, a15, y2017, near_change, damp)
  
  d <- calc_distance(model_output = mod_out, observed_data = obs_data)
  
  return(d)
  
}




n_samples <- 10000

pars <- data.frame(level = runif(n_samples, min = 0.000000785, max = 0.0785), 
                   Boys = rnorm(n_samples, mean = 3, sd = 0.9), 
                   FSM_eligible = rnorm(n_samples, mean = 2, sd = 0.5), 
                   fsm_step = rnorm(n_samples, mean = 1.3, sd = 0.4), 
                   a11 = rlnorm(n_samples, meanlog = -1,sdlog = 1),
                   a12  = rlnorm(n_samples,meanlog = 1,sdlog = 1),
                   a13 = rnorm(n_samples, mean = 3.43, sd = 0.9), 
                   a14 = rnorm(n_samples, mean = 6.44, sd = 2), 
                   a15 = rnorm(n_samples, mean = 10.2, sd = 3), 
                   y2017 = rnorm(n_samples, mean = 2.5, sd = 0.5), 
                   near_change = runif(n_samples, min = 0.0000003, max = 0.003),
                   damp = rnorm(n_samples, mean = 0.9, sd = 0.2))



loop_distance <- function(candidate_pars) {
  
  for (row in 1:nrow(candidate_pars)) { 
    candidate_pars$distance[[row]] <- get_distance(level = candidate_pars$level[[row]], Boys = candidate_pars$`Boys`[[row]], FSM_eligible = candidate_pars$`FSM_eligible`[[row]], fsm_step = candidate_pars$`fsm_step`[[row]], a11 = candidate_pars$`a11`[row], a12 = candidate_pars$`a12`[[row]], a13 = candidate_pars$`a13`[[row]], a14 = candidate_pars$`a14`[[row]], a15 = candidate_pars$`a15`[[row]], y2017 = candidate_pars$`y2017`[[row]], near_change = candidate_pars$`near_change`[[row]], damp = candidate_pars$`damp`[[row]])
  }
  return(candidate_pars)
}

test <- loop_distance(candidate_pars = pars)



test <- data.frame(test)

candidate_pars <- test %>% 
  filter(distance < 1)

i <- 4

# 4 maybe least bad so farlol but fsm mult overestimated
# not bad on girls though!!!

# 9 also not bad - a good bit over on fsm but, less bad on girls than boys

# 11 - wonky on tonnes but still... not AWFUL

# 13 - WAY under on 14 year olds weirdly but apart from that!!! pretty good! 
# - also over on 10 in girls and under in 10 12 13 in boys

# 14 - also wonky but ok

# 19 - good on fsm (except younger boys) and not bad not fsm girls but bad not fsm boys



mod_out <- decomp_model(level = candidate_pars$level[[i]], Boys = candidate_pars$`Boys`[[i]], FSM_eligible = candidate_pars$`FSM_eligible`[[i]], fsm_step = candidate_pars$`fsm_step`[[i]], a11 = candidate_pars$`a11`[i], a12 = candidate_pars$`a12`[[i]], a13 = candidate_pars$`a13`[[i]], a14 = candidate_pars$`a14`[[i]], a15 = candidate_pars$`a15`[[i]], y2017 = candidate_pars$`y2017`[[i]], near_change = candidate_pars$`near_change`[[i]], damp = candidate_pars$`damp`[[i]]) %>% 
  full_join(obs_data)


mod_out %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = sim_pc, group = fsm, colour = fsm)) +
  geom_line(aes(x=end_period_year, y = pc, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))


mod_out %>% 
  filter(gender == "Girls") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = sim_pc, group = fsm, colour = fsm)) +
  geom_line(aes(x=end_period_year, y = pc, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))


like <- c(4,9,11,13,14,19)

accepted <- candidate_pars[like,]

i <- 4
picked <- decomp_model(level = 0.0003, Boys = 3, FSM_eligible = 2.6, fsm_step = 0.6, a11 = candidate_pars$`a11`[i], a12 = 2, a13 = 3, a14 = 4, a15 = 6.9, y2017 = 1.6, near_change = candidate_pars$`near_change`[[i]], damp = 1) %>%
  full_join(obs_data)

picked %>% 
  filter(gender == "Boys") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = sim_pc, group = fsm, colour = fsm)) +
  geom_line(aes(x=end_period_year, y = pc, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))

picked %>% 
  filter(gender == "Girls") %>% 
  ggplot() +
  geom_line(aes(x=end_period_year, y = sim_pc, group = fsm, colour = fsm)) +
  geom_line(aes(x=end_period_year, y = pc, group = fsm, colour = fsm)) +
  facet_grid(rows = vars(gender),
             cols = vars(age))

# picked <- decomp_model(level = 0.0003, Boys = 3, FSM_eligible = 2.6, fsm_step = 0.6, a11 = candidate_pars$`a11`[i], a12 = 2, a13 = 3, a14 = 4, a15 = 6.9, y2017 = 1.6, near_change = candidate_pars$`near_change`[[i]], damp = 1) %>% 
#   full_join(obs_data) <- this is not a terrible choice

# candidate_pars <- c(0.0000785, 3, 2, 1.3, 0.25, 1.75, 3.43, 6.44, 10.2, 2.5, 0.00003, 0.9) 
