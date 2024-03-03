i_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/vru_int_spread.xlsx")

int_data <- i_data %>% 
  pivot_longer(-c(`Level of targetting`),
               names_to = "Point of intervention",
               values_to = "count") %>% 
  mutate(count = ifelse(is.na(count), 0, count)) %>% 
  mutate(`Point of intervention` = factor(`Point of intervention`, 
                                          levels = c("Prevention",	"Early intervention",
                                                     "Therapeutic",	"Desistance")),
         `Level of targetting` = factor(`Level of targetting`, 
                                          levels = c("Universal",
                                                     "Potentially high risk",
                                                     "Known risk/Known to services",
                                                     "Involved in crime/violence")))


# c("Involved in crime/violence",
#   "Known risk/Known to services",
#   "Potentially high risk",
#   "Universal")


int_spread_plot <- int_data %>% 
ggplot(aes(`Point of intervention`, `Level of targetting`, fill = count)) + 
  geom_tile() +
  # scale_fill_gradient(low="white", high="blue") +
  scale_fill_distiller(palette = "RdPu",
                       direction = 1) +
  theme_bw() +
  geom_text(aes(label=count)) +
  theme(legend.position = "none") +
  scale_x_discrete(name = "") +
  scale_y_discrete(name = "")
int_spread_plot
ggsave(filename = "output/graphs/int_spread_plot.png",int_spread_plot)
