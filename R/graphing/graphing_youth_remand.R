
remand_data %>%
  ggplot() +
  geom_line(aes(x = as.numeric(year), y = as.numeric(count), group = level)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())

remand_data2 %>%
  ggplot() +
    geom_line(aes(x = as.numeric(year), y = as.numeric(count), group = legal_basis)) +
    scale_x_continuous(name = "") +
    scale_y_continuous(name = "") +
    theme_classic()

remand_data %>%
  ggplot() +
  geom_line(aes(x = as.numeric(year), y = as.numeric(count), group =level, colour = level)) +
  facet_wrap(~reason) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())


remand_data %>%
  ggplot() +
  geom_line(aes(x = as.numeric(year), y = pc_to_custody, group = level, colour = level)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())




# ------REMAND OUTCOMES ----------------------------------------------------------------------
check <- remand_outcome_data %>%
  group_by(year, outcome) %>%
  summarise(count = sum(count))


remand_outcome_data %>%
  group_by(year, outcome) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = outcome, values_from = count) %>%
  mutate(`Non-custodial sentence` = `Non-custodial sentence - community` + `Non-custodial sentence - other`) %>%
  select(-`Non-custodial sentence - community`) %>%
  select(-`Non-custodial sentence - other`) %>%
  pivot_longer(cols = c(`Non-custodial sentence`, `Acquitted`, `Immediate custody`),
               names_to = "outcome", values_to = "count") %>%
  mutate(year = as.numeric(year)) %>%
  mutate(outcome = factor(outcome, levels = c("Acquitted", "Non-custodial sentence", "Immediate custody"))) %>%
  ggplot() +
  geom_area(aes(x = year, y = count,
                group = outcome, fill = outcome),
            colour = "black", size = .2) +
  scale_x_continuous(name = "",
                     breaks = c(2011:2021),
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_brewer(palette = "Blues")
ggsave(filename = "Output/Graphs/eng_remand_outcome.png")


eng_outcome <- remand_outcome_data %>%
  group_by(year, outcome) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = outcome, values_from = count) %>%
  mutate(`Non-custodial sentence` = `Non-custodial sentence - community` + `Non-custodial sentence - other`) %>%
  select(-`Non-custodial sentence - community`) %>%
  select(-`Non-custodial sentence - other`) %>%
  pivot_longer(cols = c(`Non-custodial sentence`, `Acquitted`, `Immediate custody`),
               names_to = "outcome", values_to = "count") %>%
  mutate(year = as.numeric(year)) %>%
  mutate(outcome = factor(outcome, levels = c("Acquitted", "Non-custodial sentence", "Immediate custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count,
                group = outcome, fill = outcome),
           position = "stack", stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011:2021),
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_brewer(palette = "Blues")
ggsave(filename = "Output/Graphs/eng_remand_outcome_bar.png")



remand_outcome_data %>%
  group_by(year, outcome) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = outcome, values_from = count) %>%
  mutate(`Non-custodial sentence` = `Non-custodial sentence - community` + `Non-custodial sentence - other`) %>%
  select(-`Non-custodial sentence - community`) %>%
  select(-`Non-custodial sentence - other`) %>%
  pivot_longer(cols = c(`Non-custodial sentence`, `Acquitted`, `Immediate custody`),
               names_to = "outcome", values_to = "count") %>%
  mutate(year = as.numeric(year)) %>%
  mutate(outcome = factor(outcome, levels = c("Acquitted", "Non-custodial sentence", "Immediate custody"))) %>%
  group_by(year) %>%
  mutate(tot = sum(count)) %>%
  mutate(count = count/tot) %>%
  ggplot() +
  geom_area(aes(x = year, y = count,
                group = outcome, fill = outcome),
            colour = "black", size = .2) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_brewer(palette = "Blues")
ggsave(filename = "Output/Graphs/eng_remand_outcome_pc.png")

# ------REMAND TYPE BY CHARACTERISTIC ----------------------------------------------------------------------
check <- remand_data1[[2]]

all <- remand_data1[[2]] %>%
  filter(gender != "Not Known") %>%
  mutate(remand_type = factor(remand_type,
          levels = c("No substantive remand type", "Community remands",
                     "Community remands with intervention", "Custodial remands"))) %>%
  ggplot() +
  geom_bar(aes(x = fct_rev(gender), y = count,
                group = remand_type, fill = remand_type),
               position = "dodge", stat = "identity") +
  scale_x_discrete(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = -1)


# scale_fill_manual(labels = "No substantive \n remand type",
#                   "Community remands",
#                   "Community remands with intervention",
#                   "Custodial remands") +

type1 <- remand_data1[[2]] %>%
  filter(gender != "Not Known") %>%
  filter(remand_type == "No substantive remand type") %>%
  mutate(remand = factor(remand,
                levels = c("None - sentenced at first court appearance",
                           "None - other reasons",
                           "Unknown"))) %>%
  ggplot() +
  geom_bar(aes(x = fct_rev(gender), y = count,
               group = remand, fill = remand),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 1,
                     end = 0.8) +
  labs(title="No substantive remand type")


type2 <- remand_data1[[2]] %>%
  filter(gender != "Not Known") %>%
  filter(remand_type == "Community remands") %>%
  mutate(remand = factor(remand,
                  levels = c("Unconditional Bail",
                             "Conditional Bail"))) %>%
  ggplot() +
  geom_bar(aes(x = fct_rev(gender), y = count,
               group = remand, fill = remand),
           position = "dodge", stat = "identity",
           width = 0.66) +
  scale_x_discrete(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                       begin = 0.70,
                       end = 0.60) +
  labs(title="Community remands")

type3 <- remand_data1[[2]] %>%
  filter(gender != "Not Known") %>%
  filter(remand_type == "Community remands with intervention") %>%
  mutate(remand = factor(remand,
                         levels = c("Bail Supervision and Support",
                                    "Remand to Local Authority Accommodation",
                                    "ISSP Bail"))) %>%
  ggplot() +
  geom_bar(aes(x = fct_rev(gender), y = count,
               group = remand, fill = remand),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.50,
                     end = 0.35) +
  labs(title="Community remands with intervention")

type4 <- remand_data1[[2]] %>%
  filter(gender != "Not Known") %>%
  filter(remand_type == "Custodial remands") %>%
  mutate(remand = factor(remand,
                         levels = c("Remand in Custody",
                                    "Court-Ordered Secure Remand"))) %>%
  ggplot() +
  geom_bar(aes(x = fct_rev(gender), y = count,
               group = remand, fill = remand),
           position = "dodge", stat = "identity",
           width = 0.66) +
  scale_x_discrete(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
    theme(strip.background = element_blank(),
          legend.position = "none",
          plot.title = element_text(hjust = 0.5, size = 10)) +
   scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.15,
                     end = 0) +
  labs(title="Custodial remands")


lay <- rbind(c(NA,NA,1,1,1,1,1,1,1,1,NA,NA),
             c(NA,NA,1,1,1,1,1,1,1,1,NA,NA),
             c(NA,NA,1,1,1,1,1,1,1,1,NA,NA),
             c(3,3,3,4,4,4,5,5,5,6,6,6),
             c(3,3,3,4,4,4,5,5,5,6,6,6))

g2 <- grid.arrange(all, type1, type2, type3, type4,
             layout_matrix = lay)
ggsave(filename = "Output/Graphs/wm_bail_bygender_2010.png", g2)


# remand_data1[[2]] %>%
#   filter(gender != "Not Known") %>%
#   ggplot() +
#   geom_bar(aes(x = fct_rev(gender), y = count,
#                group = remand, fill = remand),
#            position = "dodge", stat = "identity") +
#   facet_grid(~remand_type)
#   scale_x_discrete(name = "") +
#   scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
#   theme_classic() +
#   theme(strip.background = element_blank(),
#         legend.position = c(.95, .95),
#         legend.justification = c("right", "top"),
#         legend.box.just = "right",
#         legend.margin = margin(6, 6, 6, 6),
#         legend.box.background = element_rect(color = "black", size = 0.5),
#         legend.box.margin = margin(6, 6, 6, 6)) +
#   scale_fill_brewer(palette = "Blues") +
#   labs(fill = "Remand type")


remand_type_gen_data

# type3 <- remand_data1[[2]] %>%
#   filter(gender != "Not Known") %>%
#   filter(remand_type == "Community remands with intervention") %>%
#   mutate(remand = factor(remand,
#                          levels = c("Bail Supervision and Support",
#                                     "Remand to Local Authority Accommodation",
#                                     "ISSP Bail"))) %>%
#   ggplot() +
#   geom_bar(aes(x = fct_rev(gender), y = count,
#                group = remand, fill = remand),
#            position = "dodge", stat = "identity") +
#   scale_x_discrete(name = "") +
#   scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
#   theme_classic() +
#   theme(strip.background = element_blank(),
#         legend.position = c(.95, .95),
#         legend.justification = c("right", "top"),
#         legend.box.just = "right",
#         legend.margin = margin(6, 6, 6, 6),
#         legend.box.background = element_rect(color = "black", size = 0.5),
#         legend.box.margin = margin(6, 6, 6, 6)) +
#   scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
#                      begin = 0.50,
#                      end = 0.35) +
#   guides(fill = guide_legend(title = "Remand",
#                              keywidth = 1,
#                              keyheight = 1))
#

# ------CUSTODY REMAND LEVELS----------------------------------------------------------------------
# quickly getting some stuff just from the disposals dat
check <- later_disposals %>%
  pivot_wider(names_from = level, values_from = count) %>%
  mutate(rest_wm = west_midlands - birmingham) %>%
  mutate(west_midlands = 0)  %>%
  pivot_longer(cols =  birmingham:rest_wm,
               names_to = "level", values_to = "count") %>%
  filter(disposal_type == "Custody", level != "west_midlands")


# collapseing gender back together
disposals_data <- disposals_gender_data %>%
  group_by(year, level, disposal_type, disposal) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = level, values_from = count)


disposals_data1 <- disposals_data %>%
  mutate(year = as.numeric(substr(year, 1, 4))) %>%
  filter(year %in% 2010:2012) %>%
  mutate(birmingham = replace_na(birmingham, 0)) %>%
  mutate(rest_wm = west_midlands - birmingham) %>%
  pivot_longer(cols =  west_midlands:rest_wm , names_to = "level", values_to = "count") %>%
  filter(disposal_type == "Custody", level != "west_midlands")

custody_remand_data <- bind_rows(disposals_data1, check) %>%
  mutate(disposal = case_when(disposal == "Section 90-91 Detention" ~ "Section 90-92 Detention",
                              disposal == "Section 90-92 Detention" ~ "Section 90-92 Detention",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226 (Life)" ~ "Section 226",
                              disposal == "Section 226 (Public Protection)" ~ "Section 226",
                              disposal == "Section 226b (*)" ~ "Section 226",
                              disposal == "Section 228" ~ "Section 228",
                              disposal == "Section 226b" ~ "Section 226")) %>%
  mutate(disposal = case_when(disposal == "Section 90-92 Detention" ~ "Section 90-92 Detention",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226" ~ "Other",
                              disposal == "Section 228" ~ "Other")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  distinct()


custody_remand_data <- custody_remand_data %>%
  ungroup() %>%
  add_row(year = 2013, level = "birmingham", disposal = "Other", count = 0)  %>%
  add_row(year = 2013, level = "rest_wm", disposal = "Other", count = 0)





custody_remand_data %>%
    mutate(disposal = factor(disposal,
                            levels = c("Other",
                                       "Section 90-92 Detention",
                                       "Detention and Training Order"))) %>%
    ggplot() +
      geom_bar(aes(x = year, y = count, fill = interaction(level, disposal)),
               position = "stack", stat = "identity") +
      scale_x_discrete(name = "",
                      expand = c(0,0)) +
      scale_y_continuous(name = "",
                         expand = c(0,0)) +
      theme_classic() +
      theme(strip.background = element_blank()) +
      scale_fill_viridis(option="mako", discrete = TRUE, direction = 1)




# Table 7.21: Average monthly youth custody population by region of home Youth Justice Service
# and legal basis for detention (under 18s only), years ending March 2012 to 2021

# has 2011/12 to 2020/21 at west midlands level
remand4graph <- remand_data %>%
  filter(level == "west_midlands") %>%
  rename(av_monthly_pop = count) %>%
  mutate(year = as.numeric(year))

check <- later_disposals %>%
  filter(disposal_type == "Custody", level == "west_midlands")

disposals_data <- disposals_gender_data %>%
  group_by(year, level, disposal_type, disposal) %>%
  summarise(count = sum(count)) %>%
  mutate(year = as.numeric(substr(year, 1, 4))) %>%
  filter(year %in% 2010:2012, level == "west_midlands", disposal_type == "Custody")

custody_remand_data <- bind_rows(disposals_data, check) %>%
  mutate(disposal = case_when(disposal == "Section 90-91 Detention" ~ "Section 90-92 Detention",
                              disposal == "Section 90-92 Detention" ~ "Section 90-92 Detention",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226 (Life)" ~ "Section 226",
                              disposal == "Section 226 (Public Protection)" ~ "Section 226",
                              disposal == "Section 226b (*)" ~ "Section 226",
                              disposal == "Section 228" ~ "Section 228",
                              disposal == "Section 226b" ~ "Section 226")) %>%
  mutate(disposal = case_when(disposal == "Section 90-92 Detention" ~ "Section 90-92 Detention",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226" ~ "Other",
                              disposal == "Section 228" ~ "Other")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  distinct() %>%
  rename(total_disposals_yearly = count, legal_basis = disposal) %>%
  mutate(year = as.numeric(year))


comparison_data <- full_join(custody_remand_data,
                             combine %>%
                               rename(av_monthly_pop = count)) %>%
  pivot_longer(cols = c(total_disposals_yearly, av_monthly_pop),
               names_to = "measure", values_to = "count")


#
# comparison_data2 <- full_join(custody_remand_data, remand4graph) %>%
#   filter(legal_basis != "Remand", year %in% 2012:2020) %>%
#   filter(year != 2013) %>%
#   group_by(year) %>%
#   mutate(total_disposals_yearly = replace_na(total_disposals_yearly, 0)) %>%
#   mutate(tot_av = sum(av_monthly_pop), tot_tot = sum(total_disposals_yearly)) %>%
#   group_by(year, legal_basis) %>%
#   mutate(pc_av = av_monthly_pop/tot_av, pc_tot = total_disposals_yearly/tot_tot) %>%
#   mutate(compare = pc_av/pc_tot) %>%
#   group_by(legal_basis) %>%
#   summarise(av_compare = mean(compare))

# OK YOU KIND OF MESSED IT UP AND YOU'RE NOT SURE HOW TO PUT IT BACK


c1 <- comparison_data %>%
  filter(legal_basis != "Remand", level == "west_midlands") %>%
  mutate(legal_basis = factor(legal_basis,
                              levels = c("Other",
                                         "Section 90-92 Detention",
                                         "Detention and Training Order"))) %>%
  filter(measure == "total_disposals_yearly") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.60,
                     end = 0.95) +
  labs(title="Yearly total custodial sentences")



c3 <- comparison_data %>%
  filter(legal_basis != "Remand", level == "west_midlands") %>%
  mutate(legal_basis = factor(legal_basis,
                              levels = c("Other",
                                         "Section 90-92 Detention",
                                         "Detention and Training Order"))) %>%
  filter(measure == "total_disposals_yearly") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
           position = "fill", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.60,
                     end = 0.95)



c2 <- comparison_data %>%
  filter(legal_basis != "Remand", year %in% 2012:2020) %>%
  mutate(legal_basis = factor(legal_basis,
                              levels = c("Other",
                                         "Section 90-92 Detention",
                                         "Detention and Training Order"))) %>%
  filter(measure == "av_monthly_pop") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 402)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.3,
                     end = 0.6) +
  labs(title="Monthly average custodial population")

c4 <- comparison_data %>%
  filter(legal_basis != "Remand", year %in% 2012:2020) %>%
  mutate(legal_basis = factor(legal_basis,
                              levels = c("Other",
                                         "Section 90-92 Detention",
                                         "Detention and Training Order"))) %>%
  filter(measure == "av_monthly_pop") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
           position = "fill", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1,
                     begin = 0.3,
                     end = 0.6)


lay <- rbind(c(1,2),
             c(3,4))

g1 <- grid.arrange(c1, c2, c3, c4,
             layout_matrix = lay)
ggsave(filename = "Output/Graphs/wm_comparison_avpop_total.png", g1)






custody_remand_data %>%
  mutate(disposal = factor(disposal,
                           levels = c("Other",
                                      "Section 90-92 Detention",
                                      "Detention and Training Order"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = disposal),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1)


remand4graph %>%
  mutate(legal_basis = factor(legal_basis,
                           levels = c("Other",
                                      "Section 90-92 Detention",
                                      "Detention and Training Order",
                                      "Remand"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = av_monthly_pop, fill = legal_basis),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_viridis(option="mako", discrete = TRUE, direction = 1)

# ------TIMING ---------------------------------------------------------------------
t1 <- av_time_data %>%
  filter(legal_basis == "Other (includes Section 90-92)") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = legal_basis),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  facet_grid(~measure, scales = "free_x", space = "free") +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="inferno", discrete = TRUE, direction = 1,
                     begin = 0.5,
                     end = 0.55) +
  labs(title="Average length of custodial sentence")

 t2 <- av_time_data %>%
    filter(legal_basis == "Detention and Training Order") %>%
    ggplot() +
    geom_bar(aes(x = as.character(year), y = nights, fill = legal_basis),
             position = "dodge", stat = "identity") +
    scale_x_discrete(name = "",
                     expand = c(0,0)) +
    scale_y_continuous(name = "",
                       expand = c(0,0),
                       limits = c(0, 402)) +
    facet_grid(~measure, scales = "free_x", space = "free") +
    theme_classic() +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none") +
    scale_fill_viridis(option="inferno", discrete = TRUE, direction = 1,
                       begin = 0.6,
                       end = 0.65)


 lay <- rbind(c(1,2,5),
              c(3,4,6))

 g1 <- grid.arrange(c1, c2, c3, c4, t1, t2,
                    layout_matrix = lay)
 ggsave(filename = "Output/Graphs/wm_e_custody_num_av_length.png", g1)




 # ------remand AV POP PLUS TIMING ---------------------------------------------------------------------

  r2 <- av_time_data %>%
    filter(legal_basis == "Remand") %>%
    mutate(for_colour = case_when(measure == "Mean" ~ "a",
                                  measure == "Median" ~ "b")) %>%
    ggplot() +
    geom_bar(aes(x = as.character(year), y = nights, fill = for_colour),
             position = "dodge", stat = "identity") +
    scale_x_discrete(name = "",
                     expand = c(0,0)) +
    scale_y_continuous(name = "",
                       expand = c(0,0)) +
    facet_grid(~measure, scales = "free_x", space = "free") +
    theme_classic() +
    theme(strip.background = element_blank(),
          strip.text = element_blank(),
          legend.position = "none") +
    scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                       begin = 0.72,
                       end = 0.8)

 r2



 r_adj <- av_time_data_adj %>%
   filter(legal_basis == "Remand") %>%
   ggplot() +
   geom_bar(aes(x = as.character(year), y = nights, fill = measure),
            position = "dodge", stat = "identity") +
   scale_x_discrete(name = "",
                    expand = c(0,0)) +
   scale_y_continuous(name = "",
                      expand = c(0,0)) +
   facet_grid(~measure, scales = "free_x", space = "free") +
   theme_classic() +
   theme(strip.background = element_blank(),
         strip.text = element_blank(),
         legend.position = "none") +
   scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                      begin = 0.8,
                      end = 0.8)

 r_adj


 lay_adj <- rbind(c(1),
                  c(2))

 g_adj <- grid.arrange(r2, r_adj,
                    layout_matrix = lay_adj)
 ggsave(filename = "Output/Graphs/wm_e_remand_adj_length.png", g_adj)



 # another time based graph, showing the comparison of mean and median for all custodial types

mean_median_graph <- time_data_deflate_graph %>%
   mutate(legal_basis = str_wrap(legal_basis, width = 15)) %>%
   ggplot() +
   geom_bar(aes(x = legal_basis, y = nights, fill = measure),
            position = "dodge", stat = "identity") +
   scale_x_discrete(name = "",
                    expand = c(0,0)) +
   scale_y_continuous(name = "",
                      expand = c(0,0)) +
   theme_classic() +
   theme(strip.background = element_blank(),
         strip.text = element_blank(),
         legend.position = "none") +
   scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                      begin = 0.72,
                      end = 0.8)

ggsave(filename = "Output/Graphs/mean_median_adjustment.png", mean_median_graph)


# same again  but just for remand
mean_med_rem_graph <- time_data_deflate_graph %>%
  filter(legal_basis == "Remand") %>%
  mutate(legal_basis = "2015") %>%  # just a really crude way to change the graph label
  ggplot() +
  geom_bar(aes(x = legal_basis, y = nights, fill = measure),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 59)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                     begin = 0.72,
                     end = 0.8)
mean_med_rem_graph



lay_adj <- rbind(c(3,3,NA,1,1,1,1,1,1,1,1),
                 c(NA,NA,NA,2,2,2,2,2,2,2,2))

g_adj_2 <- grid.arrange(r2, r_adj, mean_med_rem_graph,
                      layout_matrix = lay_adj)
ggsave(filename = "Output/Graphs/wm_e_remand_adj_length_calc.png", g_adj_2)


 # trying to show england/wales and then the adjustment
 # could do - total showing remand and alongside that, total showing WM
 # #F6F4B1", "#F6F148",

 # my_colours6<- c("#F0F0EF", "#F6E145",
 #                 "#F0F0EF", "#F7CA3E")

 my_colours6<- c("#F0F0EF", "#E85C73",
                 "#F0F0EF", "#5C7EE8")

 r10 <-  combine3 %>%
   ggplot() +
   geom_bar(aes(x = as.character(subject), y = count, fill = interaction(fct_rev(compare), subject)),
            position = "stack", stat = "identity",  width = 1) +
   facet_grid(~as.character(year), scales = "free_x", space = "free") +
   scale_x_discrete(name = "",
                    expand = c(0,0),
                    breaks = "",
                    labels = "") +
   scale_y_continuous(name = "",
                      expand = c(0,0)) +
   theme_classic() +
   theme(strip.background = element_blank(),
         strip.text = element_blank(),
         legend.position = "none",
         plot.title = element_text(hjust = 0.5, size = 10))  +
   scale_fill_manual(values = my_colours6)

 r10

 my_colours7<- c("#6D509D")


 r11 <-  combine %>%
   filter(legal_basis == "Remand", level != "Eng/Wales") %>%
   filter(year %in% 2010:2011) %>%
   ggplot() +
   geom_bar(aes(x = as.character(year), y = count, fill = level),
            position = "dodge", stat = "identity") +
   scale_x_discrete(name = "",
                    expand = c(0,0),
                    breaks = "",
                    labels = "") +
   scale_y_continuous(name = "",
                      expand = c(0,0)) +
   theme_classic() +
   theme(strip.background = element_blank(),
         legend.position = "none",
         plot.title = element_text(hjust = 0.5, size = 10))  +
   scale_fill_manual(values = my_colours7)


 r11

 lay <- rbind(c(1,1,1,NA,NA,NA),
              c(1,1,1,NA,2,2),
              c(1,1,1,NA,2,2))


gcalc <- grid.arrange(r10, r11,
                    layout_matrix = lay)
ggsave(filename = "Output/Graphs/wm_rem_calculation.png", gcalc)


lay2 <- rbind(c(1,1,1,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,4,4,4,4,4,4,4,4),
              c(1,1,1,NA,2,2,NA,3,3,3,3,3,3,NA,4,4,4,4,4,4,4,4),
              c(1,1,1,NA,2,2,NA,3,3,3,3,3,3,NA,4,4,4,4,4,4,4,4))


gcalc2 <- grid.arrange(r10, r11, r12, r13,
                      layout_matrix = lay2)
ggsave(filename = "Output/Graphs/wm_rem_calculation_2.png", gcalc2)

r12 <- combine %>%
  filter(legal_basis == "Remand", level != "Eng/Wales") %>%
  filter(year %in% 2012:2021) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = level),
           position = "dodge", stat = "identity") +
  facet_grid(~level, scales = "free_x", space = "free") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = "",
                   labels = "") +
  scale_y_continuous(name = "",
                     expand = c(0,0),
                     limits = c(0, 62)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                     begin = 0.5,
                     end = 0.6)

r13 <- combine %>%
  filter(legal_basis == "Remand", level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = level),
           position = "dodge", stat = "identity") +
  facet_grid(~level, scales = "free_x", space = "free") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = "",
                   labels = "") +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                     begin = 0.6,
                     end = 0.6)

ggsave(filename = "Output/Graphs/wm_rem_allyears.png")

incid_colour = c("#E74C3C", "#E74C3C")

incid1 <- rem_incidence_data %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = incidence, fill = level),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10))  +
  scale_fill_manual(values = incid_colour)


incid_up <- rem_incidence_data2 %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = incidence, fill = level),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10))  +
  scale_fill_manual(values = incid_colour)
incid_up


incid2 <- combine %>%
  filter(legal_basis == "Remand", level != "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = level),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        strip.text = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 10)) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                     begin = 0.6,
                     end = 0.6)



incid3 <- av_time_data_adj %>%
  filter(legal_basis == "Remand") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = measure),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        strip.text = element_blank()) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                     begin = 0.8,
                     end = 0.8)

incid_up2 <- av_time_data_adj_up %>%
  filter(legal_basis == "Remand") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = measure),
           position = "dodge", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none",
        strip.text = element_blank()) +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                     begin = 0.72,
                     end = 0.72)

incid_up2

lay_incid <- rbind(c(1, 2, 3))




incid_group <- grid.arrange(incid2, incid3, incid1,
                            layout_matrix = lay_incid)
ggsave(filename = "Output/Graphs/wm_rem_incidence.png", incid_group)

incid_group2 <- grid.arrange(incid2, incid_up2, incid_up,
                            layout_matrix = lay_incid)
ggsave(filename = "Output/Graphs/wm_rem_incidence_mean.png", incid_group2)



 combine %>%
   filter(legal_basis == "Remand", level != "Eng/Wales") %>%
   ggplot() +
   geom_bar(aes(x = as.character(year), y = count, fill = level),
            position = "dodge", stat = "identity") +
   facet_grid(~level, scales = "free_x", space = "free") +
   scale_x_discrete(name = "",
                    expand = c(0,0)) +
   scale_y_continuous(name = "",
                      expand = c(0,0)) +
   theme_classic() +
   theme(strip.background = element_blank(),
         legend.position = "none",
         plot.title = element_text(hjust = 0.5, size = 10)) +
   scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                      begin = 0.5,
                      end = 0.6) +
   labs(title="West Midlands - Monthly average population on custodial remand")

 r1

# the first two years are pretty naive estimates
 combine %>%
    filter(legal_basis == "Remand", level != "Eng/Wales") %>%
    ggplot() +
    geom_bar(aes(x = as.character(year), y = count, fill = level),
             position = "dodge", stat = "identity") +
    facet_grid(~level, scales = "free_x", space = "free") +
    scale_x_discrete(name = "",
                     expand = c(0,0)) +
    scale_y_continuous(name = "",
                       expand = c(0,0)) +
    theme_classic() +
    theme(strip.background = element_blank(),
          legend.position = "none",
          plot.title = element_text(hjust = 0.5, size = 10)) +
    scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
                       begin = 0.5,
                       end = 0.6) +
     labs(title="West Midlands - Monthly average population on custodial remand")

 r1

lay <- rbind(c(1,2))

g2 <- grid.arrange(r1, r2,
                   layout_matrix = lay)
   ggsave(filename = "Output/Graphs/wm_e_remand_num_av_length.png", g2)


#  this data set is from remand script, combining outcomes and numbers.
# funnny, not quite right becasue this pc should be put on top of absolute number
   # not prevalence - but still fun anyway.
   # rem_out_pc_data %>%
   #   ggplot() +
   #   geom_bar(aes(x = as.character(year), y = count, fill = outcome),
   #            position = "stack", stat = "identity") +
   #   scale_x_discrete(name = "",
   #                    expand = c(0,0)) +
   #   scale_y_continuous(name = "",
   #                      expand = c(0,0)) +
   #   theme_classic() +
   #   theme(strip.background = element_blank(),
   #         legend.position = "none",
   #         plot.title = element_text(hjust = 0.5, size = 10)) +
   #   scale_fill_viridis(option="magma", discrete = TRUE, direction = 1,
   #                      begin = 0.7,
   #                      end = 0.9) +
   #   labs(title="West Midlands - ....")

   #again, this time with the incidence estimates that use mean to calculate etc
wm_outcome <- rem_out_pc_data %>%
     ggplot() +
     geom_bar(aes(x = as.character(year), y = count, fill = outcome),
              position = "stack", stat = "identity") +
     scale_x_discrete(name = "",
                      expand = c(0,0)) +
     scale_y_continuous(name = "",
                        expand = c(0,0)) +
     theme_classic() +
     theme(strip.background = element_blank(),
           legend.position = "none",
           plot.title = element_text(hjust = 0.5, size = 10)) +
     scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                        begin = 0.65,
                        end = 0.9)



eng_outcome <- remand_outcome_data %>%
  group_by(year, outcome) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = outcome, values_from = count) %>%
  mutate(`Non-custodial sentence` = `Non-custodial sentence - community` + `Non-custodial sentence - other`) %>%
  select(-`Non-custodial sentence - community`) %>%
  select(-`Non-custodial sentence - other`) %>%
  pivot_longer(cols = c(`Non-custodial sentence`, `Acquitted`, `Immediate custody`),
               names_to = "outcome", values_to = "count") %>%
  mutate(year = as.numeric(year)) %>%
  mutate(outcome = factor(outcome, levels = c("Acquitted", "Non-custodial sentence", "Immediate custody"))) %>%
  ggplot() +
  geom_bar(aes(x = year, y = count,
               group = outcome, fill = outcome),
           position = "stack", stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011:2021),
                     labels = c("2011", "2012", "2013", "2014", "2015", "2016",
                                "2017", "2018", "2019", "2020", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.55,
                     end = 0.85)





lay_out <- rbind(c(1,2),
                 c(3,NA))


out_group <- grid.arrange(eng_outcome, incid_up, wm_outcome,
                            layout_matrix = lay_out)
ggsave(filename = "Output/Graphs/wm_rem_outcome.png", out_group)
