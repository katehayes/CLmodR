# load("/Users/katehayes/CLmodelR/Output/Data/Output/CL_data.Rdata")
# load("/Users/katehayes/CLmodelR/Output/Data/Output/mod_states.Rdata")

















# NO LONGER OUTPUTTING N'S - COME BACK & FIX LATER
# load("/Users/katehayes/CLmodelR/Output/Data/Processed/population.Rdata")
# compare_pop <- population %>%
#   filter(end_period_year >= 2010) %>%
#   mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
#   select(t, age, gender, count) %>%
#   mutate(compare = "Data")%>%
#   bind_rows(CL_data %>%
#               select(t, starts_with("N")) %>%
#               pivot_longer(-t,
#                            names_to = "state", values_to = "count") %>%
#               mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
#                      gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl")) %>%
#               select(-state) %>%
#               mutate(compare = "Model output"))
#
# check <- CL_data %>%
#   select(t, starts_with("N")) %>%
#   pivot_longer(-t,
#                names_to = "state", values_to = "count") %>%
#   mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
#          gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl"))
#
# # %>%
#   ggplot() +
#   geom_line(aes(x = t, y = count, group = interaction(gender, compare), color = interaction(gender, compare))) +
#   facet_wrap(~age) +
#   scale_x_continuous(breaks = seq(0, 520, 52),
#                      labels = c("2010", "2011", "2012", "2013", "2014", "2015",
#                                 "2016", "2017", "2018", "2019", "2020")) +
#   scale_color_manual(values=c("skyblue","pink","navy", "red"))
#
# compare_pop
# ggsave(filename = "Output/Graphs/Model Output/compare_pop.png", compare_pop)

# IN SAME VEIN WOULD LIKE TO SEE RELATIVE SIZES BETWEEN GENDERS




# cust_prev <- mod_states %>%
#   pivot_wider(names_from = cjs_pos, values_from = count) %>%
#   mutate(custody = if_else((`No contact` + `Surveilled` + `Non-custodial` +
#                               `Custodial remand (fte)` + `Custodial remand (rep)` +
#                               `Custodial sentence`) == 0,
#                            0,
#                            (`Custodial remand (fte)` + `Custodial remand (rep)` + `Custodial sentence`)/
#                            (`No contact` + `Surveilled` + `Non-custodial` + `Custodial remand (fte)` +
#                               `Custodial remand (rep)` + `Custodial sentence`)),
#          custodial_sentence = if_else((`No contact` + `Surveilled` + `Non-custodial` +
#                                          `Custodial remand (fte)` + `Custodial remand (rep)` +
#                                          `Custodial sentence`) == 0,
#                                       0,
#                                       (`Custodial sentence`)/
#                                       (`No contact` + `Surveilled` + `Non-custodial` +
#                                          `Custodial remand (fte)` + `Custodial remand (rep)` + `Custodial sentence`)),
#          prop_on_remand = if_else((`Custodial remand (fte)` + `Custodial remand (rep)` + `Custodial sentence`) == 0,
#                                   0,
#                                   (`Custodial remand (fte)` + `Custodial remand (rep)`)/(`Custodial remand (fte)` + `Custodial remand (rep)` + `Custodial sentence`))) %>%
#   select(t, age, gender, class, cl_status, custody, custodial_sentence, prop_on_remand)





prop_cust <- cust_prev %>%
  filter(cl_status == "Uninvolved",
         t >= 104) %>%
  ggplot() +
  geom_line(aes(x = t, y = custody, group = interaction(gender, class), color = interaction(gender, class))) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(104, 520, 52),
                     labels = c("2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))
prop_cust

