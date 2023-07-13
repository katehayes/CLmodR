# so fte has.....
# MAIN - counts for each level (incl birm), no dissagregation by type of disposal or child characteristic, 10-20

# Details - at england level, by disposal type and gender.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MAIN # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

##Chapter 2: First time entrants to the Youth Justice System########################
##Table 2.9: Numbers of child first time entrants(1)(2),
# by Local Authority of residence, years ending December 2010 to 2020(????? what is going on with the year here)

ft_data <- read_xlsx("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 2 - First time entrants to the youth justice system.xls", sheet = 10, skip = 3, n_max = 199)

fte_10to20 <- ft_data %>%
  filter(`Local Authority` %in% c("Birmingham", "West Midlands", "England", "Wales")) %>%
  pivot_longer(starts_with("20"),
               names_to = "end_period_year",
               values_to = "count") %>%
  mutate(count = as.numeric(count)) %>%
  pivot_wider(names_from = `Local Authority`, values_from = count) %>%
  mutate(Wales = England + Wales) %>%
  rename(`Eng/Wales` = Wales,
         `West Midlands (region)` = `West Midlands`) %>%
  pivot_longer(!end_period_year,
               names_to = "level", values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year) - 1,
         end_period_month = "December",
         period_length = "Year")



############################# go back a year to get the 2010 bit########################################################
# something weird happening with years
# youth-justice-statistics-2019-20-supplementary-tables
##Chapter 2: First time entrants to the Youth Justice System########################
# Table 2.8: Numbers of youth first time entrants(1)(2) to the youth justice
# system, by Local Authority of residence, years ending December 2009 to 2019(3)(4)(5)
# had to resave as .xlsx

ft_data <- read_xlsx("/Users/katehayes/temp_data/youth-justice-statistics-2019-20-supplementary-tables/Ch 2 - First time entrants to the Youth Justice System.xlsx",
                            sheet = 9, skip = 3)

fte_09to19 <- ft_data %>%
  filter(`Local Authority` %in% c("Birmingham", "West Midlands", "England", "Wales")) %>%
  pivot_longer(starts_with("20"),
               names_to = "end_period_year",
               values_to = "count") %>%
  mutate(count = as.numeric(count)) %>%
  pivot_wider(names_from = `Local Authority`, values_from = count) %>%
  mutate(Wales = England + Wales) %>%
  rename(`Eng/Wales` = Wales) %>%
  pivot_longer(!end_period_year,
               names_to = "level", values_to = "count") %>%
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level),
         end_period_year = as.numeric(end_period_year),
         end_period_month = "December",
         period_length = "Year")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# DETAIL, DISPOSALS # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# Table 2.4: Number of youth first time entrants to the youth justice system(1)(
# 2) by sex and type of disposal given on first offence, years ending December 2009 to 2019
ft_data <- read_xlsx("/Users/katehayes/temp_data/youth-justice-statistics-2019-20-supplementary-tables/Ch 2 - First time entrants to the Youth Justice System.xlsx",
                            sheet = 5, skip = 4)


ft_data <- ft_data[,1:8]
colnames(ft_data)[1] <- "end_period_year"
colnames(ft_data)[2] <- "Youth Caution"

ft_data_g <- ft_data[28:38,] %>%
  mutate(gender = "Girls")

ft_data_b <- ft_data[15:25,] %>%
  mutate(gender = "Boys")

fte_09to19_disposal_gender <- rbind(ft_data_g, ft_data_b) %>%
  rename(Other = `Other(4)`) %>%
  mutate(`Youth Caution` = as.numeric(`Youth Caution`)) %>%
  pivot_longer(`Youth Caution`:Other,
               names_to = "disposal",
               values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year),
         end_period_month = "December",
         period_length = "Year") %>%
  assign_disp_cat_children()


#Table 2.4: Number of child first time entrants(1)(2) by sex and type of disposal
# given on first offence, years ending March 2011 to 2021
# this data has decinmal places, which is odd.
# this disposal types here need a little bit of a step to reconcile them with the disposals in disposal
ft_data <- read_xlsx("/Users/katehayes/temp_data/Ch 2 - First time entrants to the youth justice system.xls",
                            sheet = 5, skip = 4, n_max = 38)
ft_data11to21 <- ft_data[,1:8]
colnames(ft_data11to21)[1] <- "end_period_year"
colnames(ft_data11to21)[2] <- "Youth Caution"

ft_data_g <- ft_data11to21[28:38,] %>%
  mutate(gender = "Girls")

ft_data_b <- ft_data11to21[15:25,] %>%
  mutate(gender = "Boys")

fte_11to21_disposal_gender <- rbind(ft_data_g, ft_data_b) %>%
  rename(Other = `Other(4)`) %>%
  mutate(`Youth Caution` = as.numeric(`Youth Caution`)) %>%
  pivot_longer(`Youth Caution`:Other,
               names_to = "disposal",
               values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year),
         end_period_month = "March",
         period_length = "Year") %>%
  assign_disp_cat_children()


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# DETAIL,OFFENCE# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#Table 2.2: Number of chid first time entrants(1)(2),
# by type of first offence and sex, years ending March 2011 to 2021
# odd decimals present here too

ft_data <- read_xlsx("/Users/katehayes/temp_data/Ch 2 - First time entrants to the youth justice system.xls",
                            sheet = 3, skip = 3, n_max = 53)
ft_data <- ft_data[,1:13]
colnames(ft_data)[1] <- "end_period_year"

ft_data_g <- ft_data[29:39,] %>%
  mutate(gender = "Girls")

ft_data_b <- ft_data[16:26,] %>%
  mutate(gender = "Boys")

fte_11to21_offence_gender <- rbind(ft_data_g, ft_data_b) %>%
  mutate(`Violence against the person` = as.numeric(`Violence against the person`)) %>%
  pivot_longer(`Violence against the person`:`Summary motoring offences`,
               names_to = "offence",
               values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year),
         end_period_month = "March",
         period_length = "Year")


# Table 2.2: Number of youth first time entrants to the youth justice system(1)(2),
# by type of first offence and sex, years ending December 2009 to 2019
ft_data <- read_xlsx("/Users/katehayes/temp_data/youth-justice-statistics-2019-20-supplementary-tables/Ch 2 - First time entrants to the Youth Justice System.xlsx",
                            sheet = 3, skip = 3)
ft_data <- ft_data[,1:13]
colnames(ft_data)[1] <- "end_period_year"

ft_data_g <- ft_data[29:39,] %>%
  mutate(gender = "Girls")

ft_data_b <- ft_data[16:26,] %>%
  mutate(gender = "Boys")

fte_09to19_offence_gender <- rbind(ft_data_g, ft_data_b) %>%
  mutate(`Violence against the person` = as.numeric(`Violence against the person`)) %>%
  pivot_longer(`Violence against the person`:`Summary motoring offences`,
               names_to = "offence",
               values_to = "count") %>%
  mutate(end_period_year = as.numeric(end_period_year),
         end_period_month = "December",
         period_length = "Year")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together,# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# o # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# set one
# the two datasets are a little bit different, ill take the more recent calculation when available
# so essentially just 2009 from the first set.
fte_09to20 <- fte_09to19 %>%
  filter(end_period_year == 2009) %>%
  bind_rows(fte_10to20)

# COME BACK HERE, ONE OF THESE VALUES IS WRONG WEST MIDS

save(fte_09to20, file = "Output/Data/Cleaned/fte_09to20.Rdata")



# set two, gender plus either disposals or offenses.
#  overlap - one year ends march and the other december... so ill keep both....... in the same dataset or no...
# in the same dataset for now!

# disposal
fte_09to21_disposal_gender <- fte_09to19_disposal_gender %>%
  bind_rows(fte_11to21_disposal_gender) %>%
  mutate(level = "Eng/Wales")

save(fte_09to21_disposal_gender, file = "Output/Data/Cleaned/fte_09to21_disposal_gender.Rdata")

# offence
fte_09to21_offence_gender <- fte_09to19_offence_gender %>%
  bind_rows(fte_11to21_offence_gender) %>%
  mutate(level = "Eng/Wales")


save(fte_09to21_offence_gender, file = "Output/Data/Cleaned/fte_09to21_offence_gender.Rdata")



# NEW BIT - TRYING TO GET BETTER AGE INFO ---- # # # ---- # # # ---- # # # ---- # # #

ft_data <- read_xlsx("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 2 - First time entrants to the youth justice system.xls", sheet = 10, skip = 3, n_max = 199)


