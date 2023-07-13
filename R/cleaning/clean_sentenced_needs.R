
# FOR CARE HISTORY
# Table 1.2b: Assessed care status(1) as a proportion of children assessed by
# sentence type(2), gender, ethnicity, age group, country and region,
# England and Wales(3), year ending March 2020
n_data <- read_xlsx("/Users/katehayes/temp_data/experimental-statistics-assessing-needs-sentenced-children-youth-justice-system-supplementary-tables (3).xls",
                    sheet = 8, skip = 37, n_max = 7, col_names = FALSE)

c_names <- unlist(n_data[,1])

needs_history_data <- t(n_data[,-1]) %>%
  `colnames<-`(c_names) %>%
  as.data.frame() %>%
  rename(need = `Number of assessments`,
         `Currently/Yes` = Currently,
         `Never/No` = Never) %>%
  filter(need != "Eligible child")

en_data <- read_xlsx("/Users/katehayes/temp_data/experimental-statistics-assessing-needs-sentenced-children-youth-justice-system-supplementary-tables (3).xls",
                     sheet = 8, skip = 45, n_max = 6, col_names = FALSE)

c_names <- unlist(en_data[,1])

eligible <- t(en_data[,-1]) %>%
  `colnames<-`(c_names) %>%
  as.data.frame() %>%
  rename(need = `Number of assessments`,
         `Currently/Yes` = Yes,
         `Never/No` = No) %>%
  filter(need == "Eligible child")

needs_history_data20 <- needs_history_data %>%
  bind_rows(eligible) %>%
  mutate(across(!need, as.numeric)) %>%
  pivot_longer(!need,
               names_to = "need_status", values_to = "count") %>%
  mutate(end_period_year = 2020,
         end_period_month = "March",
         period_length = "Year")




# year ending 19
# had to save as .xlsx
n_data <- read_xlsx("/Users/katehayes/temp_data/assessing-needs-of-sentenced-children-youth-justice-system-supplementary-tables (1).xls",
                    sheet = 6, skip = 26, n_max = 7, col_names = FALSE)

c_names <- unlist(n_data[,1])

needs_history_data <- t(n_data[,-1]) %>%
  `colnames<-`(c_names) %>%
  as.data.frame() %>%
  rename(need = `Number of assessments`,
         `Currently/Yes` = Currently,
         `Never/No` = Never) %>%
  filter(need != "Eligible child")

en_data <- read_xlsx("/Users/katehayes/temp_data/assessing-needs-of-sentenced-children-youth-justice-system-supplementary-tables (1).xls",
                     sheet = 6, skip = 34, n_max = 6, col_names = FALSE)

c_names <- unlist(en_data[,1])

eligible <- t(en_data[,-1]) %>%
  `colnames<-`(c_names) %>%
  as.data.frame() %>%
  rename(need = `Number of assessments`,
         `Currently/Yes` = Yes,
         `Never/No` = No) %>%
  filter(need == "Eligible child")

needs_history_data19 <- needs_history_data %>%
  bind_rows(eligible) %>%
  mutate(across(!need, as.numeric)) %>%
  pivot_longer(!need,
               names_to = "need_status", values_to = "count") %>%
  mutate(end_period_year = 2019,
         end_period_month = "March",
         period_length = "Year")


# BREAKDOWN BY CHILD CHARACTERISTICS

# sheet 1.2b: Table 1.2b: Assessed care status(1) as a proportion of children assessed by sentence type(2), gender, ethnicity, age group, country and region, England and Wales(3), year ending March 2020
# had to save as .xlsx
n_data <- read_xlsx("/Users/katehayes/temp_data/experimental-statistics-assessing-needs-sentenced-children-youth-justice-system-supplementary-tables (3).xls",
                    sheet = 8, skip = 3, n_max = 30)
needs_data20 <- n_data %>%
  rename(group = ...1) %>%
  mutate(group_type = ifelse(is.na(`Child in need`), group, NA)) %>%
  mutate(group_type = vec_fill_missing(group_type, direction = c("down"))) %>%
  filter(!is.na(`Child in need`),
         group != "Overall") %>%
  pivot_longer(cols = -c(group, group_type), names_to = "need", values_to = "pc") %>%
  mutate(end_period_year = 2020)



# 2019
# the characteristics
n_data <- read_xlsx("/Users/katehayes/temp_data/assessing-needs-of-sentenced-children-youth-justice-system-supplementary-tables (1).xls",
                    sheet = 6, skip = 3, n_max = 20, col_names = TRUE)

needs_data19 <- n_data %>%
  rename(group = ...1) %>%
  mutate(group_type = ifelse(is.na(`Child in need`), group, NA)) %>%
  mutate(group_type = vec_fill_missing(group_type, direction = c("down"))) %>%
  filter(!is.na(`Child in need`),
         group != "Overall") %>%
  pivot_longer(cols = -c(group, group_type), names_to = "need", values_to = "pc") %>%
  mutate(end_period_year = 2019)


needs_data <- needs_data19 %>%
  bind_rows(needs_data20)



sentenced_needs_20_region <- needs_data %>%
  filter(group_type == "Country and English Region",
         group %in% c("England", "Wales", "West Midlands")) %>%
  select(!group_type) %>%
  rename(level = group) %>%
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>%
  mutate(end_period_month = "March",
         period_length = "Year")



sentenced_needs_19to20_sentence <- needs_data %>%
  filter(group_type == "Sentence type") %>%
  select(!group_type) %>%
  rename(disposal_type = group) %>%
  mutate(end_period_month = "March",
         period_length = "Year")


sentenced_needs_19to20_gender <- needs_data %>%
  filter(group_type == "Gender") %>%
  select(!group_type) %>%
  rename(gender = group) %>%
  mutate(gender = reconcile_gender(gender)) %>%
  mutate(end_period_month = "March",
         period_length = "Year")


sentenced_needs_19to20_ethnicity <- needs_data %>%
  filter(group_type == "Ethnicity") %>%
  select(!group_type) %>%
  rename(ethnicity = group) %>%
  mutate(end_period_month = "March",
         period_length = "Year")


sentenced_needs_19to20_age <- needs_data %>%
  filter(group_type == "Age Group") %>%
  select(!group_type) %>%
  rename(age = group) %>%
  mutate(end_period_month = "March",
         period_length = "Year")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together, three different sets w different agregations, # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# one set w broken down again, split into the different charcteristics # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



sentenced_needs_19to20_history <- needs_history_data19 %>%
  bind_rows(needs_history_data20) %>%
  mutate(level = "Eng/Wales")

save(sentenced_needs_19to20_history, file = "Output/Data/Cleaned/sentenced_needs_19to20_history.Rdata")

save(sentenced_needs_20_region, file = "Output/Data/Cleaned/sentenced_needs_20_region.Rdata")

save(sentenced_needs_19to20_sentence, file = "Output/Data/Cleaned/sentenced_needs_19to20_sentence.Rdata")

save(sentenced_needs_19to20_gender, file = "Output/Data/Cleaned/sentenced_needs_19to20_gender.Rdata")

save(sentenced_needs_19to20_ethnicity, file = "Output/Data/Cleaned/sentenced_needs_19to20_ethnicity.Rdata")

save(sentenced_needs_19to20_age, file = "Output/Data/Cleaned/sentenced_needs_19to20_age.Rdata")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# DIFFERENT DATA - FROM CARE # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# CONVICTIONS AMONG CLA # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# this set of data, the 'convictions and health outcomes' data, i believe only goes to 2018
# if you want more about convictions among CLA and even remand, i think you can look at reasons children started and then ceased
c_data <- read.csv("/Users/katehayes/CLmodelR/temp_data/children-looked-after-in-england-including-adoptions_2022/data/la_conviction_health_outcome_cla.csv")

careconv_data <- c_data %>%
  filter(la_name == "Birmingham")


#####################################################################################################
#########OLD WORK TO ADJUST _ MISSING FROM CARE#####################################################################################################
#####################################################################################################
# second dataset - convictions
readin_data <- read.csv("/Users/katehayes/temp_data/children-looked-after-in-england-including-adoptions_2021/data/la_conviction_and_health_outcomes_cla.csv")
care_outcomes_data <- readin_data

av_care_convict_data <- care_outcomes_data %>%
  filter(la_name == "Birmingham", cla_group == "Convictions: Children looked after Ages 10 to 17 years") %>%
  group_by(outcome) %>%
  mutate(number = as.numeric(number)) %>%
  summarise(av_number = mean(number)) %>%
  kable("latex", booktabs = TRUE)

# note - this is JUST ten to 17 year olds
care_outcomes_data %>%
  filter(la_name == "Birmingham", cla_group == "Convictions: Children looked after Ages 10 to 17 years") %>%
  mutate(number = ifelse(number == "c", 0, number)) %>%
  mutate(number = as.numeric(number)) %>%
  pivot_wider(id_cols = time_period, names_from = outcome, values_from = number) %>%
  mutate(`Not convicted, cautioned` = `Total ages 10 to 17 years` - `Convicted or subject to youth cautions, or youth conditional cautions during the year`) %>%
  select(-`Total ages 10 to 17 years`) %>%
  pivot_longer(!time_period, names_to = "outcome", values_to = "number")  %>%
  ggplot() +
  geom_area(aes(x = time_period, y = number,
                group = outcome, fill = outcome),
            colour = "black", size = .2) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_brewer(palette = "Blues")
ggsave(filename = "Output/Graphs/birm_care_conviction.png")


# second dataset - missing
readin_data <- read.csv("/Users/katehayes/temp_data/children-looked-after-in-england-including-adoptions_2021/data/la_children_who_were_missing_or_away_from_placement_during_the_year.csv")
care_outcomes_data <- readin_data

av_care_missing_data <- care_outcomes_data %>%
  filter(la_name == "Birmingham") %>%
  mutate(number = as.numeric(number)) %>%
  filter(!is.na(number)) %>%
  group_by(cla_group) %>%
  summarise(av_number = mean(number)) %>%
  kable("latex", booktabs = TRUE)


care_outcomes_data %>%
  filter(la_name == "Birmingham") %>%
  mutate(number = ifelse(number == "c" | number == "z", 0, number)) %>%
  mutate(number = as.numeric(number)) %>%
  pivot_wider(id_cols = time_period, names_from = cla_group, values_from = number) %>%
  mutate(`Did not go missing` = `Children looked after during the year` - `Children who had a missing incident during the year`,
         `Went missing once` = `Children who had a missing incident during the year` - `Children who went missing more than once during the year`) %>%
  select(time_period, `Did not go missing`, `Went missing once`, `Children who went missing more than once during the year`) %>%
  pivot_longer(!time_period, names_to = "missing", values_to = "number")  %>%
  mutate(missing = fct_relevel(missing, "Children who went missing more than once during the year", "Went missing once", "Did not go missing")) %>%
  ggplot() +
  geom_area(aes(x = time_period, y = number,
                group = missing, fill = fct_rev(missing)),
            colour = "black", size = .2) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") + # , expand = c(0, 0), limits = c(0, NA)
  theme_classic() +
  theme(strip.background = element_blank()) +
  scale_fill_brewer(palette = "PuRd")
ggsave(filename = "Output/Graphs/birm_care_missing.png")



