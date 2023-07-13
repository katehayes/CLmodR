surv <- mod_states %>%
  filter(age == 17,
         class == "Excluded",
         cl_status == "Working") %>%
  group_by(t, gender, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = cjs_pos, color = cjs_pos)) +
  facet_wrap(~gender) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
surv





surv_prev <- mod_states %>%
  group_by(t, age, gender, class, cjs_pos) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t, age, gender, class) %>%
  mutate(pc = count/sum(count)) %>%
  filter(cjs_pos == "Surveilled") %>%
  ggplot() +
  geom_line(aes(x = t, y = pc, group = age, color = age)) +
  facet_grid(~interaction(class, gender))


surv_prev
