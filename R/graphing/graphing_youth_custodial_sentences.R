# need number of custodial disposals a year
# need avg monthly pop data for custodial sentences
# need lengths of each type of custodial sentence
# county lines related offences?

# ########number of custodial sentences###############################################

# getting some data together  - these come from the disposals script

# collapsing gender back together
disposals_data <- disposals_gender_data %>%
  group_by(year, level, disposal_type, disposal) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = level, values_from = count)


# THIS IS YOUR PUSHING-BACK WAY OF YEARS
# THE GOVT PUSHES FORWARD!!
new_disposal_graph_data <- later_disposals %>%
  bind_rows(disposals_data %>%
              mutate(year = as.numeric(substr(year, 1, 4))) %>%
              filter(year %in% 2009:2012) %>%
              pivot_longer(cols = c(west_midlands, birmingham),
                           names_to = "level", values_to = "count")) %>%
  mutate(count = replace_na(count, 0)) %>%
  pivot_wider(names_from = level, values_from = count) %>%
  mutate(rest_wm = west_midlands - birmingham) %>%
  pivot_longer(cols = c(rest_wm, west_midlands, birmingham),
               names_to = "level", values_to = "count")

#for figuring out timing i think i need england wales level back in lol!!!!!
new_disposal_graph_data <- later_disposals %>%
  bind_rows(disposals_data %>%
              mutate(year = as.numeric(substr(year, 1, 4))) %>%
              filter(year %in% 2009:2012) %>%
              pivot_longer(cols = c(west_midlands, birmingham),
                           names_to = "level", values_to = "count")) %>%
  mutate(count = replace_na(count, 0)) %>%
  pivot_wider(names_from = level, values_from = count) %>%
  mutate(rest_wm = west_midlands - birmingham) %>%
  pivot_longer(cols = c(rest_wm, west_midlands, birmingham),
               names_to = "level", values_to = "count")


# here is the england/wales level disposals back
ew_custody <- ew_disposals %>%
  filter(disposal_type == "Custody")


# comparing birmingham to west midlands, absolute numbers of custodial sentences

two_grey <- c("#2BA066", "#D8DAD9")

two_grey2 <- c("#2BA080", "#D8DAD9")

two_grey3 <- c("#2B95A0", "#D8DAD9")

two_grey4 <- c("#2B3DA0", "#D8DAD9")


custody_graph <- new_disposal_graph_data %>%
  filter(level != "west_midlands", disposal_type == "Custody") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count,
               group = fct_rev(level), fill = level),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = two_grey)

ggsave(filename = "Output/Graphs/birm_wm_custody_bar.png", custody_graph)

# quick figures to label the graph
check_custody_pc <- new_disposal_graph_data %>%
  filter(level != "west_midlands", disposal_type == "Custody") %>%
  group_by(year, level) %>%
  summarise(count = sum(count)) %>%
  pivot_wider(names_from = level, values_from = count) %>%
  mutate(pc = birmingham/(birmingham + rest_wm))


check_cust_type_pc <- new_disposal_graph_data %>%
  filter(level != "rest_wm", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level) %>%
  mutate(tot = sum(count)) %>%
  group_by(year, level, disposal_type) %>%
  mutate(pc = count/tot)


# comparing birmingham to west midlands, each type of custodial sentence

cust_graph_dto <- new_disposal_graph_data %>%
  filter(level != "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c( "Section 226-228", "Section 90-92 Detention", "Detention and Training Order"))) %>%
  mutate(year = year + 1) %>%  # JUST REALLY CRUDELY PUSHED THE YEAR UP
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Detention and Training Order") %>%
    ggplot() +
      geom_bar(aes(x = as.character(year), y = count,
                   group = fct_rev(level), fill = level),
               position = "stack", stat = "identity") +
      scale_x_discrete(name = "",
                       expand = c(0,0)) +
      scale_y_continuous(name = "",
                         expand = c(0,0)) +
      theme_classic() +
      theme(strip.background = element_blank(),
            legend.position = "none") +
      scale_fill_manual(values = two_grey2)
ggsave(filename = "Output/Graphs/birm_wm_custody_bar_dto.png", cust_graph_dto)

cust_graph_dto

cust_graph_sec9 <- new_disposal_graph_data %>%
  filter(level != "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c( "Section 226-228", "Section 90-92 Detention", "Detention and Training Order"))) %>%
  mutate(year = year + 1) %>%  # JUST REALLY CRUDELY PUSHED THE YEAR UP
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 90-92 Detention") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count,
               group = fct_rev(level), fill = level),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = two_grey3)
ggsave(filename = "Output/Graphs/birm_wm_custody_bar_sec9.png", cust_graph_sec9)
cust_graph_sec9


cust_graph_sec2 <- new_disposal_graph_data %>%
  filter(level != "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228", "Section 90-92 Detention", "Detention and Training Order"))) %>%
  mutate(year = year + 1) %>%  # JUST REALLY CRUDELY PUSHED THE YEAR UP
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 226-228") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count,
               group = fct_rev(level), fill = level),
           position = "stack", stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = two_grey4)
ggsave(filename = "Output/Graphs/birm_wm_custody_bar_sec2.png", cust_graph_sec2)
cust_graph_sec2



lay <- rbind(c(1,2),
             c(3,NA))

wm_birm <- grid.arrange(cust_graph_dto, cust_graph_sec9, cust_graph_sec2,
                         layout_matrix = lay)
ggsave(filename = "Output/Graphs/wm_birm_custody.png", wm_birm)


##############################################################################################
# so the above is roughly incidence, now lets do roughly prevalence (avg monthly pop)
##############################################################################################

avpop_dto <- custody_full %>%
  filter(level != "Eng/Wales") %>%
  filter(legal_basis == "Detention and Training Order") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
          stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = two_grey4)
ggsave(filename = "Output/Graphs/wm_custavpop_dto.png", avpop_dto)
avpop_dto


avpop_sec9 <- custody_full %>%
  filter(level != "Eng/Wales") %>%
  filter(legal_basis == "Section 90-92 Detention") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = two_grey4)
avpop_sec9

avpop_other <- custody_full %>%
  filter(level != "Eng/Wales") %>%
  filter(legal_basis == "Other") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = legal_basis),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = two_grey4)
avpop_other


##############################################################################################
# Wait, back to incidence??
##############################################################################################

# england and wales level disposals

ew_cust_stack <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228", "Section 90-92 Detention", "Detention and Training Order"))) %>%
  ggplot() +
    geom_bar(aes(x = as.character(year), y = count, fill = fct_rev(disposal)),
             stat = "identity", position = "stack") +
    scale_x_discrete(name = "",
                     expand = c(0,0)) +
    scale_y_continuous(name = "",
                       expand = c(0,0)) +
    theme_classic() +
    theme(strip.background = element_blank(),
          legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.6)
ew_cust_stack


ew_dto <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Detention and Training Order") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity", position = "stack") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.6,
                     end = 0.6)
ew_dto

ew_sec9 <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 90-92 Detention") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity", position = "stack") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.4)
ew_sec9

ew_sec2 <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 226-228") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity", position = "stack") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 0.2)
ew_sec2


ew_cust_fill <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = fct_rev(disposal)),
           stat = "identity", position = "fill") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="viridis", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 0.6)
ew_cust_fill


lay <- rbind(c(1,4,4),
             c(2,4,4),
             c(3,NA,NA))

ew_group <- grid.arrange(ew_dto, ew_sec9, ew_sec2, ew_cust_fill,
                          layout_matrix = lay)
ggsave(filename = "Output/Graphs/ew_custody_groups.png", ew_group)


check <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(year) %>%
  mutate(tot = sum(count)) %>%
  group_by(year, disposal) %>%
  summarise(pc = count/tot)



# making west midlands level disposals graphs
# I AM PUSHING THE YEAR UP HERE
wm_dto <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Detention and Training Order") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.6,
                     end = 0.6)

wm_sec9 <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 90-92 Detention") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.4,
                     end = 0.4)


wm_sec2 <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228", "Section 90-92 Detention", "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 226-228") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = disposal),
              stat = "identity") +
  scale_x_continuous(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 0.2)

wm_cust_fill <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "west_midlands", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = fct_rev(disposal)),
           stat = "identity", position = "fill") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="magma", discrete = TRUE, direction = -1,
                     begin = 0.2,
                     end = 0.6)


lay <- rbind(c(1,4,4),
               c(2,4,4),
               c(3,NA,NA))

wm_group <- grid.arrange(wm_dto, wm_sec9, wm_sec2, wm_cust_fill,
                           layout_matrix = lay)
ggsave(filename = "Output/Graphs/wm_custody_groups.png", wm_group)





# making west midlands level disposals graphs
# I AM PUSHING THE YEAR UP HERE
b_dto <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "birmingham", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Detention and Training Order") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
                     begin = 0.7,
                     end = 0.7)

b_sec9 <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "birmingham", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 90-92 Detention") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = disposal),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0),
                   breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                   labels = c("2011", "2013", "2015",
                              "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
                     begin = 0.825,
                     end = 0.825)


b_sec2 <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "birmingham", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228", "Section 90-92 Detention", "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  filter(disposal == "Section 226-228") %>%
  ggplot() +
  geom_bar(aes(x = year, y = count, fill = disposal),
           stat = "identity") +
  scale_x_continuous(name = "",
                     expand = c(0,0),
                     breaks = c(2011, 2013, 2015, 2017, 2019, 2021),
                     labels = c("2011", "2013", "2015",
                                "2017", "2019", "2021")) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = -1,
                     begin = 0.95,
                     end = 0.95)

b_cust_fill <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "birmingham", disposal_type == "Custody") %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = factor(disposal, levels = c("Section 226-228",
                                                "Section 90-92 Detention",
                                                "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = count, fill = fct_rev(disposal)),
           stat = "identity", position = "fill") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.7,
                     end = 0.95)


lay <- rbind(c(1,4,4),
             c(2,4,4),
             c(3,NA,NA))

b_group <- grid.arrange(b_dto, b_sec9, b_sec2, b_cust_fill,
                         layout_matrix = lay)
ggsave(filename = "Output/Graphs/b_custody_groups.png", b_group)




# total number of people given custodial remands or custodial sentences in the country per year




###############################################################################################
# duration
##############################################################################################
# take av_time_data_adj_up from the timing script

# we only have section 90s and the others (sec 226/8 whatever) stuck together
meantime_remand <- av_time_data_adj_up %>%
  filter(legal_basis == "Remand") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = legal_basis),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.2,
                     end = 0.2)
meantime_remand


meantime_dto <- av_time_data_adj_up %>%
  filter(legal_basis == "Detention and Training Order") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = legal_basis),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.35,
                     end = 0.35)
meantime_dto

meantime_other <- av_time_data_adj_up %>%
  filter(legal_basis == "Other (includes Section 90-92)") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = legal_basis),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.50,
                     end = 0.50)
meantime_other



meantime_total <- time_data %>%
  filter(level == "Eng/Wales") %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = nights, fill = level),
           stat = "identity", position = "dodge") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.9,
                     end = 0.9)


lay <- rbind(c(1,2,3))

time_group <- grid.arrange(meantime_remand, meantime_dto, meantime_other,
                        layout_matrix = lay)
ggsave(filename = "Output/Graphs/time_groups.png", time_group)



# CALCULATING AV TIME IN CUSTODY FOR BIRMINGHAM

birm_pc_of_wm_10 <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(disposal_type == "Custody") %>%
  mutate(disposal = case_when(disposal == "Section 90-91 Detention" ~ "Section 90-92 Detention",
                              disposal == "Section 90-92 Detention" ~ "Section 90-92 Detention",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226 (Life)" ~ "Section 226",
                              disposal == "Section 226 (Public Protection)" ~ "Section 226",
                              disposal == "Section 226b (*)" ~ "Section 226",
                              disposal == "Section 228" ~ "Section 228",
                              disposal == "Section 226b" ~ "Section 226")) %>%
  mutate(disposal = case_when(disposal == "Section 90-92 Detention" ~ "Other (includes Section 90-92)",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226" ~ "Other (includes Section 90-92)",
                              disposal == "Section 228" ~ "Other (includes Section 90-92)")) %>%
  mutate(disposal = factor(disposal, levels = c("Other (includes Section 90-92)", "Detention and Training Order"))) %>%
  group_by(year, level, disposal) %>%
  summarise(count = sum(count))

# %>%
  pivot_wider(names_from = level, values_from = count, values_fill = 0) %>%
  mutate(birm_pc_of_wm = birmingham / west_midlands) %>%
  filter(year %in% 2010:2011) %>%
  select(year, disposal, west_midlands, birm_pc_of_wm) %>%
  pivot_wider(names_from = year, values_from = west_midlands, values_fill = 0) %>%
  group_by(disposal) %>%
  mutate(`2010` = sum(`2010`)) %>%
  filter(`2011` != 0) %>%
  mutate(birm_10 = `2010`*birm_pc_of_wm) %>%
  select(disposal, birm_10) %>%
  mutate(birm_10 = round(birm_10, 0), year = 2010)


av_nights_birm <- new_disposal_graph_data %>%
  mutate(year = year + 1) %>%
  filter(level == "birmingham", disposal_type == "Custody") %>%
  select(-level) %>%
  mutate(disposal = case_when(disposal == "Section 90-91 Detention" ~ "Section 90-92 Detention",
                              disposal == "Section 90-92 Detention" ~ "Section 90-92 Detention",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226 (Life)" ~ "Section 226",
                              disposal == "Section 226 (Public Protection)" ~ "Section 226",
                              disposal == "Section 226b (*)" ~ "Section 226",
                              disposal == "Section 228" ~ "Section 228",
                              disposal == "Section 226b" ~ "Section 226")) %>%
  mutate(disposal = case_when(disposal == "Section 90-92 Detention" ~ "Other (includes Section 90-92)",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226" ~ "Other (includes Section 90-92)",
                              disposal == "Section 228" ~ "Other (includes Section 90-92)")) %>%
  mutate(disposal = factor(disposal, levels = c("Other (includes Section 90-92)", "Detention and Training Order"))) %>%
  group_by(year, disposal) %>%
  summarise(count = sum(count)) %>%
  full_join(birm_pc_of_wm_10) %>%
  ungroup() %>%
  mutate(count = if_else(!is.na(birm_10), birm_10, count)) %>%
  select(-birm_10) %>%
  full_join(av_time_data_adj_up %>%
              filter(legal_basis != "Remand") %>%
              rename(disposal = legal_basis) %>%
              mutate(year = as.numeric(year)) %>%
              select(-measure))  %>%
  mutate(nc = nights*count) %>%
  group_by(year) %>%
  summarise(tot_mean_nights = sum(nc)/sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = tot_mean_nights, fill = "blue"),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.9,
                     end = 0.9)
ggsave(filename = "Output/Graphs/av_nights_custody_birm.png", av_nights_birm)

# doing a group that hopefully shows this whole calculation,
# getting an average duration for custodial state, birmingham, yearly


lay <- rbind(c(1,2),
             c(3,NA),
             c(4,5),
             c(6,NA))

av_cust_time_birm <- grid.arrange(cust_graph_dto, cust_graph_sec9, cust_graph_sec2,
                                  meantime_dto, meantime_other, av_nights_birm,
                                  layout_matrix = lay)
ggsave(filename = "Output/Graphs/av_cust_time_birm.png", av_cust_time_birm)




# DOING SOMETHING ELSE


total_custody <- ew_custody %>%
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
                              disposal == "Section 226" ~ "Section 226-228",
                              disposal == "Section 228" ~ "Section 226-228")) %>%
  mutate(disposal = case_when(disposal == "Section 90-92 Detention" ~ "Other (includes Section 90-92)",
                              disposal == "Detention and Training Order" ~ "Detention and Training Order",
                              disposal == "Section 226-228" ~ "Other (includes Section 90-92)")) %>%
  group_by(year, disposal) %>%
  summarise(count = sum(count)) %>%
  mutate(year = as.numeric(year)) %>%
  pivot_wider(names_from = disposal, values_from = count) %>%
  full_join(remand_outcome_data %>%
              group_by(year) %>%
              summarise(count = sum(count)) %>%
              rename(Remand = count) %>%
              mutate(year = as.numeric(year))) %>%
  pivot_longer(cols = c(Remand,
                        `Other (includes Section 90-92)`,
                        `Detention and Training Order`),
               names_to = "legal_basis",
               values_to = "count")



checking_total <- av_time_data_adj_up %>%
  mutate(year = as.numeric(year)) %>%
  full_join(total_custody %>%
              mutate(year = as.numeric(year))) %>%
  mutate(nc = nights*count) %>%
  group_by(year) %>%
  summarise(tot_mean = sum(nc)/sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = tot_mean),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.9,
                     end = 0.9)

checking_total <- av_time_data_adj_up %>%
  mutate(year = as.numeric(year)) %>%
  full_join(total_custody %>%
              mutate(year = as.numeric(year))) %>%
  mutate(nc = nights*count) %>%
  filter(legal_basis != "Remand") %>%
  group_by(year) %>%
  summarise(tot_mean = sum(nc)/sum(count)) %>%
  ggplot() +
  geom_bar(aes(x = as.character(year), y = tot_mean),
           stat = "identity") +
  scale_x_discrete(name = "",
                   expand = c(0,0)) +
  scale_y_continuous(name = "",
                     expand = c(0,0)) +
  theme_classic() +
  theme(strip.background = element_blank(),
        legend.position = "none") +
  scale_fill_viridis(option="turbo", discrete = TRUE, direction = 1,
                     begin = 0.9,
                     end = 0.9)

checking_total
