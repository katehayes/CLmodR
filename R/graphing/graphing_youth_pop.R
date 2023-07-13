model_pop_birm <- pop_data %>%
  filter(age %in% 10:17) %>%
  filter(level == "Birmingham") %>%
  ggplot() +
  geom_line(aes(x = as.numeric(age), y = as.numeric(count), colour = sex)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  scale_colour_manual(values = c("#00cc99", "#6600cc"), name="Sex") +
  facet_wrap(~as.character(year)) +
  theme_classic() +
  theme(strip.background = element_blank())

model_pop_birm

ggsave(filename = "Output/Graphs/model_pop_birm.png", model_pop_birm)


birm_wmp <- birm_relative_pop_data %>%
  filter(age %in% 10:17) %>%
  ggplot() +
  geom_line(aes(x = as.numeric(age), y = as.numeric(birm_over_wmp), colour = sex)) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  scale_colour_manual(values = c("#00cc99", "#6600cc"), name="Sex") +
  facet_wrap(~as.character(year)) +
  theme_classic() +
  theme(strip.background = element_blank())

birm_wmp

ggsave(filename = "Output/Graphs/birm_over_wmp.png",birm_wmp)

