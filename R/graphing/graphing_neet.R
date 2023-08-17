

neet_12to23_age %>% 
  group_by(end_period_year, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = neet, colour = neet)) +
  facet_wrap(~age)

neet_16to23_age_gender %>% 
  group_by(end_period_year, gender, age) %>% 
  mutate(pc = count/sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = neet, colour = neet)) +
  facet_wrap(~interaction(age, gender))

# NEET declining over time driven by drops in the 17 year olds?

part_type_18to23 %>% 
  group_by(end_period_year) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(part_type != "Full-time education") %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pc, group = part_type, colour = part_type))

# looks like apprenticeship rates are a little down??


neet_16to23_age_gender %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = count, fill = neet),
           stat = "identity", position = "fill") +
  facet_wrap(~interaction(gender, age))


smooth_neet %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_predict, fill = neet),
           stat = "identity", position = "fill") +
  facet_wrap(~interaction(gender, age))

b16 %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_predict),
           stat = "identity", position = "stack")

g16 %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_predict),
           stat = "identity", position = "stack")

b17 %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_predict),
           stat = "identity", position = "stack")

g17 %>% 
  ggplot() +
  geom_bar(aes(x = end_period_year, y = pc_predict),
           stat = "identity", position = "stack")
