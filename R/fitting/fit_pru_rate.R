install.packages("lognorm")
library(lognorm)
install.packages("texreg")
library(texreg)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# neet# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

neet_reg_data <- neet_16to23_age_gender %>% 
  mutate(age = factor(age),
         gender = factor(gender, levels = c("Girls", "Boys", "Unknown")),
         end_period_year = factor(end_period_year),
         neet = factor(neet, levels = c("Not NEET", "NEET")),
         count = round(count, digits = 0))


neet_states <- neet_16to23_age_gender %>% 
  filter(gender != "Unknown") %>% 
  mutate(age = factor(age),
         gender = factor(gender, levels = c("Girls", "Boys", "Unknown")),
         end_period_year = factor(end_period_year),
         neet = factor(neet, levels = c("Not NEET", "NEET"))) %>% 
  select(-count)

neet_logit <- glm(neet ~ gender + age + end_period_year + end_period_year*age, family="binomial", weight = neet_reg_data$count, data = neet_reg_data)

neet_logit4 <- glm(neet ~ gender + age + end_period_year, family="binomial", weight = neet_reg_data$count, data = neet_reg_data)

# gender_OR <- bind_cols(names(coef(neet_logit)), coef(neet_logit)) %>% 
#   filter(`...1` %in% c("genderBoys", "(Intercept)")) %>% 
#   mutate(exp_coeff = exp(`...2`)) %>% 
#   select(-`...2`) %>% 
#   pivot_wider(names_from = `...1`,
#               values_from = exp_coeff) %>% 
#   mutate(genderBoys = genderBoys*`(Intercept)`)


sum_neet <- summary(neet_logit)


neet_predict <- cbind(neet_states, 
                     predict(neet_logit, newdata = neet_states, type = "link", se = TRUE)) %>% 
  mutate(pred_prob_neet = plogis(fit),
         LL = plogis(fit - (1.96 * se.fit)),
         UL = plogis(fit + (1.96 * se.fit)))



neet_predict_logit <- neet_predict %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pred_prob_neet, group = interaction(gender, age), colour = interaction(gender, age)), linetype = "dashed") +
  geom_line(data = neet_16to23_age_gender %>% 
              filter(gender != "Unknown") %>% 
              ungroup() %>% 
              group_by(end_period_year, gender, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              ungroup() %>% 
              filter(neet == "NEET") %>% 
              mutate(age = factor(age),
                     gender = factor(gender, levels = c("Girls", "Boys")),
                     end_period_year = factor(end_period_year)),
            aes(x = end_period_year, y = pc, group = interaction(gender, age), colour = interaction(gender, age)), linewidth = 0.9) +
  geom_ribbon(aes(x = as.numeric(end_period_year), ymin = LL, ymax = UL, fill = interaction(gender, age)), alpha = 0.25) +
  scale_color_manual(values = c("#F99679", "#DE4434", "#86B3F5", "#2159AB")) +
  scale_fill_manual(values = c("#F99679", "#DE4434", "#86B3F5", "#2159AB")) +
  theme_bw() +
  scale_x_discrete(name = "Year") +
  scale_y_continuous(name = "Proportion of children who are NEET")

neet_predict_logit
ggsave(filename = "output/graphs/neet_predict_logit.png", neet_predict_logit)



summary(neet_logit4)


ratio_plot <- bind_cols(names(coef(neet_logit)), coef(neet_logit)) %>% 
  filter(grepl("age17", `...1`)) %>% 
  mutate(exp_coeff = exp(`...2`),
         age = ifelse(`...1` == "age17", exp_coeff, exp_coeff*3.78003534)) %>% 
  rename(end_period_year = `...1`) %>% 
  mutate(end_period_year = as.numeric(paste("20", 
                                 substring(end_period_year, nchar(end_period_year) - 1, nchar(end_period_year)),
                                 sep = ""))) %>% 
  select(end_period_year, age) %>% 
  mutate(period = "age & gender, int w year") %>% 
  bind_rows(bind_cols(names(coef(neet_logit4)), coef(neet_logit4)) %>% 
              filter(grepl("age17", `...1`)) %>% 
              mutate(age = exp(`...2`)) %>% 
              select(age) %>%
              mutate(end_period_year = 2016,
                     period = "age & gender, no int")) %>% 
  bind_rows(data.frame(end_period_year = c(2017:2023),
                       period = "age & gender, no int",
                       age = 1.916832)) %>% 
  bind_rows(bind_cols(names(coef(neet3_logit)), coef(neet3_logit)) %>% 
              filter(grepl("age17", `...1`)) %>% 
              mutate(exp_coeff = exp(`...2`),
                     age = ifelse(`...1` == "age17", exp_coeff, exp_coeff*1.5371371)) %>% 
              rename(end_period_year = `...1`) %>% 
              mutate(end_period_year = ifelse(end_period_year == "age17", 2011,
                                              as.numeric(paste("20", 
                                                               substring(end_period_year, nchar(end_period_year) - 1, nchar(end_period_year)),
                                                               sep = "")))) %>% 
              select(end_period_year, age) %>% 
              mutate(period = "age only, int w year")) %>% 
  bind_rows(bind_cols(names(coef(neet2_logit)), coef(neet2_logit)) %>% 
              filter(grepl("age17", `...1`)) %>% 
              mutate(age = exp(`...2`)) %>% 
              select(age) %>%
              mutate(end_period_year = 2011,
                       period = "age only, no int")) %>% 
  bind_rows(data.frame(end_period_year = c(2012:2023),
                       period = "age only, no int",
                       age = 2.016404)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = age, group = period, color = period)) +
  scale_y_continuous(name = "Odds ratio of being NEET, age 17 compared to 16",
                     limits = c(0, 4)) +
  scale_x_continuous(name = "Year", 
                     breaks = c(2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023), 
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"))

ratio_plot
ggsave(filename = "output/graphs/ratio_plot.png", ratio_plot)

# Your coefficients are on the log odds scale, such that a coefficient is
# log(odds_y==1 / odds_y == 0). We can exponentiate to get odds instead.






neet2_reg_data <- neet_11to23_age %>% 
  mutate(age = factor(age),
         end_period_year = factor(end_period_year),
         neet = factor(neet, levels = c("Not NEET", "NEET")),
         count = round(count, digits = 0)) %>% 
  filter(!(age == 16 & end_period_year == 2014))


neet2_states <- neet_11to23_age %>% 
  mutate(age = factor(age),
         end_period_year = factor(end_period_year),
         neet = factor(neet, levels = c("Not NEET", "NEET"))) %>% 
  select(-count)

neet3_logit <- glm(neet ~ age + end_period_year + end_period_year*age, family="binomial", weight = neet2_reg_data$count, data = neet2_reg_data)


neet2_logit <- glm(neet ~ age + end_period_year, family="binomial", weight = neet2_reg_data$count, data = neet2_reg_data)

summary(neet2_logit)

neet2_predict <- cbind(neet2_states, 
                      predict(neet2_logit, newdata = neet2_states, type = "link", se = TRUE)) %>% 
  mutate(pred_prob_neet = plogis(fit),
         LL = plogis(fit - (1.96 * se.fit)),
         UL = plogis(fit + (1.96 * se.fit)))



neet2_predict_logit <- neet2_predict %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pred_prob_neet, group = age, colour = age), linetype = "dashed") +
  geom_line(data = neet_11to23_age %>% 
              ungroup() %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              ungroup() %>% 
              filter(neet == "NEET") %>% 
              mutate(age = factor(age),
                     end_period_year = factor(end_period_year)),
            aes(x = end_period_year, y = pc, group = age, colour = age), linewidth = 0.9) +
  geom_ribbon(aes(x = as.numeric(end_period_year), ymin = LL, ymax = UL, fill = age), alpha = 0.25) +
  scale_color_manual(values = c("#DE4434", "#2159AB")) +
  scale_fill_manual(values = c("#DE4434", "#2159AB")) +
  theme_bw() +
  scale_x_discrete(name = "Year") +
  scale_y_continuous(name = "Proportion of children who are NEET")

neet2_predict_logit

ggsave(filename = "output/graphs/neet2_predict_logit.png", neet2_predict_logit)





# %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = interaction(age, gender), color = interaction(age, gender))) +
  geom_line(data = neet_11to23_age %>% 
              group_by(end_period_year, age) %>% 
              mutate(pc = count/sum(count)) %>% 
              ungroup() %>% 
              filter(neet == "NEET"),
            aes(x = end_period_year, y = pc, group = as.character(age), colour = as.character(age))) +

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# below is pru, above is neet,# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #





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


pru_logit_pol <- glm(pru ~ gender + age + fsm + age*fsm + policy_period*near_change , family="binomial", weight = reg_data$count, data = reg_data)

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
