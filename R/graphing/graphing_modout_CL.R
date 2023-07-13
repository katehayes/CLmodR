cl_class_prev <- mod_states %>%
  group_by(t, age, gender, class, cl_status) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cl_status, values_from = count) %>%
  mutate(cl_prev = Working / (Uninvolved + Working)) %>%
  ggplot() +
  geom_line(aes(x = t, y = cl_prev, group = as.factor(age), color = as.factor(age))) +
  facet_wrap(~interaction(gender, class)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
cl_class_prev
# need to output whether people are getting recruited in prison or community

cl_class_prev <- mod_states %>%
  group_by(t, age, gender, class, cl_status) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cl_status, values_from = count) %>%
  mutate(cl_prev = Working / (Uninvolved + Working)) %>%
  ggplot() +
  geom_line(aes(x = t, y = cl_prev, group = as.factor(age), color = as.factor(age))) +
  facet_wrap(~interaction(gender, class)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
cl_prev_cust <- mod_states %>%
  group_by(t, gender, cl_status, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cjs_pos, values_from = count) %>%
  mutate(Custody = `Custodial remand (fte)` + `Custodial remand (rep)` + `Custodial sentence`,
         Community = `No contact` + `Surveilled` + `Non-custodial`) %>%
  select(t, gender, cl_status, Custody, Community) %>%
  pivot_longer(c(Custody, Community),
               names_to = "cjs_pos", values_to = "count") %>%
  ungroup() %>%
  pivot_wider(names_from = cl_status, values_from = count) %>%
  mutate(cl_prev = Working / (Uninvolved + Working)) %>%
  filter(cjs_pos == "Custody") %>%
  ggplot() +
  geom_line(aes(x = t, y = cl_prev, group = gender, color = gender)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

cl_prev_cust

cl_prev_com <- mod_states %>%
  group_by(t, gender, cl_status, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = cjs_pos, values_from = count) %>%
  mutate(Custody = `Custodial remand (fte)` + `Custodial remand (rep)` + `Custodial sentence`,
         Community = `No contact` + `Surveilled` + `Non-custodial`) %>%
  select(t, gender, cl_status, Custody, Community) %>%
  pivot_longer(c(Custody, Community),
               names_to = "cjs_pos", values_to = "count") %>%
  ungroup() %>%
  pivot_wider(names_from = cl_status, values_from = count) %>%
  mutate(cl_prev = Working / (Uninvolved + Working)) %>%
  filter(cjs_pos == "Community") %>%
  ggplot() +
  geom_line(aes(x = t, y = cl_prev, group = gender, color = gender)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

cl_prev_com
