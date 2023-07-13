# info from an FOI to the West Mids police
# https://www.westyorkshire.police.uk/sites/default/files/foi/2022-02/february_2022_foi_1009431-22_children_in_custody_overnight.pdf

# Notes
# Information represent the number of children (under 18s) in detention for 4 hours or more between midnight and 8am.
# Arrest reason represents the primary reason for arrest, other offences may also be linked
# Time in custody from time detention authorised to time of release
# Charged represents whether the detainee was charged and released on court bail, or charged and detained to appear at court
# - detainee overnight post charge represents the number of those charged and detained who were held in detention for 4 hours or more between midnight and 8am post charge
# Bailed represents detainees who were bailed after overnight detention and whether the bail was conditional or unconditional

police_custody_txt <- pdf_text("/Users/katehayes/temp_data/february_2022_foi_1009431-22_children_in_custody_overnight.pdf")

pc_matrix_1 <- police_custody_txt[4] %>%
  str_split("\\n", simplify = TRUE) %>%
  as.list() %>%
  as.data.frame() %>%
  t() %>%
  as.data.frame()
rownames(pc_matrix_1) <- NULL

col_nm <- unlist(str_extract_all(pc_matrix_1[13,1],  "([:graph:]+[\\s]?)+"))
col_nm <-str_remove_all(col_nm, "[\\s]+")

col_nm <- c(col_nm[1:6], "time_in_custody_decimal_days", "time_in_custody", "days_of_detention",
            "charged", "detainted_overnight_post_charge", "bailed")


# SHOULD PROBABLY CLEAN THE SINGLE SPACES OFF THE END OF EVERYTHING
pc_matrix_1 <- police_custody_txt[4] %>%
  foi_clean_by_page(column_names = col_nm)


pc_matrix_1 <- pc_matrix_1[16:59, ]

pc_matrix_2 <- police_custody_txt[5] %>%
  foi_clean_by_page(column_names = col_nm)


pc_matrix_3 <- police_custody_txt[6] %>%
  foi_clean_by_page(column_names = col_nm)


pc_matrix_4 <- police_custody_txt[7] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_5 <- police_custody_txt[8] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_6 <- police_custody_txt[9] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_7 <- police_custody_txt[10] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_8 <- police_custody_txt[11] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_9 <- police_custody_txt[12] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_10 <- police_custody_txt[13] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_11 <- police_custody_txt[14] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_12 <- police_custody_txt[15] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_13 <- police_custody_txt[16] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_14 <- police_custody_txt[17] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_15 <- police_custody_txt[18] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_16 <- police_custody_txt[19] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_17 <- police_custody_txt[20] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_18 <- police_custody_txt[21] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_19 <- police_custody_txt[22] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_20 <- police_custody_txt[23] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_21 <- police_custody_txt[24] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_22 <- police_custody_txt[25] %>%
  foi_clean_by_page(column_names = col_nm)

pc_matrix_23 <- police_custody_txt[26] %>%
  foi_clean_by_page(column_names = col_nm)


police_custody_matrix <- pc_matrix_1 %>%
  bind_rows(pc_matrix_1) %>%
  bind_rows(pc_matrix_2) %>%
  bind_rows(pc_matrix_3) %>%
  bind_rows(pc_matrix_4) %>%
  bind_rows(pc_matrix_5) %>%
  bind_rows(pc_matrix_6) %>%
  bind_rows(pc_matrix_7) %>%
  bind_rows(pc_matrix_8) %>%
  bind_rows(pc_matrix_9) %>%
  bind_rows(pc_matrix_10) %>%
  bind_rows(pc_matrix_11) %>%
  bind_rows(pc_matrix_12) %>%
  bind_rows(pc_matrix_13) %>%
  bind_rows(pc_matrix_14) %>%
  bind_rows(pc_matrix_15) %>%
  bind_rows(pc_matrix_16) %>%
  bind_rows(pc_matrix_17) %>%
  bind_rows(pc_matrix_18) %>%
  bind_rows(pc_matrix_19) %>%
  bind_rows(pc_matrix_20) %>%
  bind_rows(pc_matrix_21) %>%
  bind_rows(pc_matrix_22) %>%
  bind_rows(pc_matrix_23) %>%
  mutate(`Number` = as.numeric(`Number`),
      charged = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500)  &
                         !(days_of_detention %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")),
                               days_of_detention, charged),
      days_of_detention = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                               time_in_custody, days_of_detention),
        time_in_custody = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                                 time_in_custody_decimal_days, time_in_custody),
        time_in_custody_decimal_days = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                                                   `ArrestReason`, time_in_custody_decimal_days),
         `ArrestReason` = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                                  Nationality, `ArrestReason`),
         Nationality = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                              `Ethnicity(selfdefined)`, Nationality),
         `Ethnicity(selfdefined)` = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                                             Gender,`Ethnicity(selfdefined)`),
        `Ethnicity(selfdefined)` = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                                          str_remove(`Ethnicity(selfdefined)`, "[:graph:]+"), `Ethnicity(selfdefined)`),
        Gender = ifelse(Number %in% c(449, 462, 464, 468, 472, 479, 482, 483, 490, 493, 497, 500),
                        str_extract(Gender, "[:graph:]+"), Gender)) %>%
  filter(!is.na(Gender)) %>%
  mutate(charged = ifelse(Number %in% c(73, 124, 252, 995) &
                            !(days_of_detention %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")),
                           days_of_detention, charged),
          days_of_detention = ifelse(Number %in% c(73, 124, 252, 995),
                                     time_in_custody, days_of_detention),
          time_in_custody = ifelse(Number %in% c(73, 124, 252, 995),
                                   time_in_custody_decimal_days, time_in_custody),
          time_in_custody_decimal_days = ifelse(Number %in% c(73, 124, 252, 995),
                                                `ArrestReason`, time_in_custody_decimal_days),
          `ArrestReason` = ifelse(Number %in% c(73, 124, 252, 995),
                                  Nationality, `ArrestReason`))



73, 124, 252, 995
252
995

# IRAN, ISLAMIC REPUBLIC O Drugs Supply Class B
# UK; ENGLAND; UNITED STA S.18 Wounding
# 462
#
# 464
#
# 468
#
#
# 472
#
#
# 479
#
# 482
# 483
#
# 490
#
# 493
#
# 497
# 500
#
#
#
#
#
# # How many requests were made under section 38(6) PACE by your police force to a local
# # authority to transfer children detained overnight in police custody post-charge to local
# # authority accommodation? If possible, please provide a breakdown of these
# # children by their
# # age, sex, ethnic origin, national origin, type of disability and type of crime

p27_matrix <- police_custody_txt[27] %>%
  str_split("\\n", simplify = TRUE) %>%
  as.list() %>%
  as.data.frame() %>%
  t() %>%
  as.data.frame()

rownames(p27_matrix) <- NULL

col_nm2 <- unlist(str_extract_all(p27_matrix[6,1],  "([:graph:]+[\\s]?)+"))
col_nm3 <- c("age", "gender", "ethnicity", "crime_type")


p27_matrix <- police_custody_txt[27] %>%
  str_split("\\n", simplify = TRUE) %>%
    as.list() %>%
    as.data.frame() %>%
    t() %>%
    as.data.frame()

rownames(p27_matrix) <- NULL
colnames(p27_matrix) <- "text"

p27_matrix <- p27_matrix %>%
  mutate(col1 = str_extract(text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col2 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col3 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col4 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+"))

la_transfer_matrix <- p27_matrix[7:45, ] %>%
  select(-c(text, remainder_text))

colnames(la_transfer_matrix) <- col_nm3


# How many requests were made under section 38(6) PACE for secure accommodation for
# children detained overnight in police custody post-charge? If possible, please provide a
# breakdown of these children by their age, sex, ethnic origin, national origin, type of disability
# and type of crime.

secure_accom_matrix_1 <- p27_matrix[53, ] %>%
  select(-c(text, remainder_text))

colnames(secure_accom_matrix_1) <- col_nm3

p28_matrix <- police_custody_txt[28] %>%
  str_split("\\n", simplify = TRUE) %>%
  as.list() %>%
  as.data.frame() %>%
  t() %>%
  as.data.frame()

rownames(p28_matrix) <- NULL
colnames(p28_matrix) <- "text"

p28_matrix <- p28_matrix %>%
  mutate(col1 = str_extract(text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col2 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col3 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col4 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+"))

secure_accom_matrix_2 <- p28_matrix[1:11, ] %>%
  select(-c(text, remainder_text))
colnames(secure_accom_matrix_2) <- col_nm3

secure_accom_matrix <- bind_rows(secure_accom_matrix_1, secure_accom_matrix_2)

# How many children detained overnight in police custody post-charge were not transferred to
# secure accommodation following a request under section 38(6) PACE? If possible, please
# provide a breakdown of these children by their age, sex, ethnic origin, national origin, type of
# disability and type of crim

secure_accom_failed_request_matrix <- p28_matrix[25:37, ] %>%
  select(-c(text, remainder_text))
colnames(secure_accom_failed_request_matrix) <- col_nm3
# IN OTHER WORDS?? THERE WERE NO SUCESSFUL REQUESSTS???

# How many requests were made under section 38(6) PACE for non-secure accommodation
# for children detained overnight in police custody post-charge? If possible, please provide a
# breakdown of these children by their age, sex, ethnic origin, national origin, type of disability
# and type of crime.

nonsecure_accom_matrix_1 <- p28_matrix[46:53, ] %>%
  select(-c(text, remainder_text))
colnames(nonsecure_accom_matrix_1) <- col_nm3


p29_matrix <- police_custody_txt[29] %>%
  str_split("\\n", simplify = TRUE) %>%
  as.list() %>%
  as.data.frame() %>%
  t() %>%
  as.data.frame()

rownames(p29_matrix) <- NULL
colnames(p29_matrix) <- "text"

p29_matrix <- p29_matrix %>%
  mutate(col1 = str_extract(text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col2 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col3 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col4 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+"))


nonsecure_accom_matrix_2 <- p29_matrix[1:15, ] %>%
  select(-c(text, remainder_text))
colnames(nonsecure_accom_matrix_2) <- col_nm3

nonsecure_accom_matrix <- bind_rows(nonsecure_accom_matrix_1, nonsecure_accom_matrix_2)

# How many children detained overnight in police custody post-charge were transferred to
# non-secure accommodation following a request under section 38(6) PACE? If possible,
# please provide a breakdown of these children by their age, sex, ethnic origin, national origin,
# type of disability and type of crime.

nonsecure_accom_success_request_matrix <- p29_matrix[23:29, ] %>%
  select(-c(text, remainder_text)) %>%
  `colnames<-` (col_nm3)

nonsecure_accom_failed_request_matrix <- p29_matrix[37:52, ] %>%
  select(-c(text, remainder_text)) %>%
  `colnames<-` (col_nm3)

# How many certificates of impracticability were produced by your police force to a court in
# relation to children detained overnight in police custody post-charge, pursuant to section
# 38(7) PACE? If possible, please provide a breakdown of these children by their age, sex,
# ethnic origin, national origin, type of disability and type of crime.

p30_matrix <- police_custody_txt[30] %>%
  str_split("\\n", simplify = TRUE) %>%
  as.list() %>%
  as.data.frame() %>%
  t() %>%
  as.data.frame()

rownames(p30_matrix) <- NULL
colnames(p30_matrix) <- "text"

p30_matrix <- p30_matrix %>%
  mutate(col1 = str_extract(text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col2 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col3 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
  mutate(col4 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
         remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+"))

cert_imprac_matrix <- p30_matrix[7:32, ] %>%
  select(-c(text, remainder_text)) %>%
  `colnames<-` (col_nm3)

# NEW FOI - year 2019
# How many children (anyone under 18) were held overnight (for 4 or more hours between the hours of 0000 and 0800) in the police station?
#   Can you provide a breakdown of those children by their age and ethnicity?
#   How many of those children who were held overnight, were held post-charge?
#   How many requests were made to the Local authority to accommodate children post-charge under section 38?
#   Please provide a breakdown of requests for secure and non-secure accommodation if possible.
# How many children were transferred to local authority accommodation post-charge?
# https://foi.west-midlands.police.uk/wp-content/uploads/2020/03/2372_ATTACHMENT_01.pdf



https://www.westyorkshire.police.uk/sites/default/files/foi/2020-07/march_2020_foi_918-20_children_in_custody_overnight.pdf
