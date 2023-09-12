install.packages("lognorm")
library(lognorm)


candidate_pars <- c(0.0000785, 3, 2, 1.3, 0.25, 1.75, 3.43, 6.44, 10.2, 2.5, 0.00003, 0.9) 


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
