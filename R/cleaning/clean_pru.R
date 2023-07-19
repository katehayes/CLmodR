# I AM GOING TO CHANGE FROM JUST GETTING THE PRU KIDS TO GETTING ALL KIDS


# going to have children by age and sex, by school
# then for each school, how many children of each ethnicity, and how many children FSM eligible.


# JAN 22 SCHOOL CENSUS
# https://explore-education-statistics.service.gov.uk/find-statistics/school-pupils-and-their-characteristics#explore-data-and-files
# under 'supporting files'
# HAD TO RENAME AGAIN, ADDED _22
# spc_school_level_underlying_data_22.csv



s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-hayeska@tcd.ie/My Drive/temp_data/spc_school_level_underlying_data_22.csv")

# s_data <- read.csv("/Users/katehayes/temp_data/spc_school_level_underlying_data_22.csv")

pru_data_22 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x %in% c("z", "x"), NA, .x))) %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(la_name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment..name.`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(.x))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping, 
         school_subtype = `TypeOfEstablishment..name.`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_22 <- pru_data_22 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2022,
         end_period_month = "January",
         period_length = "Year")

pru_eth_22 <- pru_data_22 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
            `Asian or Asian British`, `Black, African, Caribbean or Black British`,
            `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2022,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_22 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_22 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_22 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_22 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_22 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2022,
         end_period_month = "January",
         period_length = "Year")




# JAN 21 SCHOOLS CENSUS
# doesnt seem to have the same weird age 3 & 4 split into months
# la name is different weirdly
# using : and z to indicate not applicable and unknown

# fucking unbelievably, the govt website links you to 2022 when you're looking for 21 data
# anyway i think here is the proper data?
# https://explore-education-statistics.service.gov.uk/find-statistics/school-pupils-and-their-characteristics/2020-21


s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-hayeska@tcd.ie/My Drive/temp_data/spc_school_level_underlying_data_220216.csv")
# s_data <- read.csv("/Users/katehayes/temp_data/spc_school_level_underlying_data_220216.csv")

pru_data_21 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x %in% c("z", ":"), NA, .x))) %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(la_name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment..name.`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(.x))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment..name.`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_21 <- pru_data_21 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2021,
         end_period_month = "January",
         period_length = "Year")


pru_eth_21 <- pru_data_21 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2021,
         end_period_month = "January",
         period_length = "Year")


pru_ptg <- pru_data_21 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_21 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_21 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_21 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_21 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2021,
         end_period_month = "January",
         period_length = "Year")



# JAN 20 SCHOOLS CENSUS
# its no longer with a number of other files in a zip, its just here: https://explore-education-statistics.service.gov.uk/find-statistics/school-pupils-and-their-characteristics/2019-20
# in the supporting files section
# .....IT LOOKS like the names are back to the 2016 style names???
# spc_school_level_underlying_data.csv
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/spc_school_level_underlying_data.csv")
# s_data <- read.csv("/Users/katehayes/temp_data/spc_school_level_underlying_data.csv")

pru_data_20 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x == ":", NA, .x))) %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment..name.`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(.x))) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment..name.`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)


pru_fsm_20 <- pru_data_20 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2020,
         end_period_month = "January",
         period_length = "Year")

pru_eth_20 <- pru_data_20 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2020,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_20 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_20 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_20 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_20 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_20 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2020,
         end_period_month = "January",
         period_length = "Year")





# JAN 19 SCHOOLS CENSUS
# THIS YEAR IS ESPEECIALLY WEIRD
# Schools_Pupils_and_their_Characteristics_2019_Underlying_Data/Schools_Pupils_and_their_Characteristics_2019_pupil_characteristics_UD.csv
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/Schools_Pupils_and_their_Characteristics_2019_Underlying_Data (1)/Schools_Pupils_and_their_Characteristics_2019_pupil_characteristics_UD.csv")
# s_data <- read.csv("/Users/katehayes/temp_data/Schools_Pupils_and_their_Characteristics_2019_Underlying_Data/Schools_Pupils_and_their_Characteristics_2019_pupil_characteristics_UD.csv")

pru_data_19 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x == "..", NA, .x))) %>%
  filter(
  # phase.type_grouping == "Pupil referral unit",
         geographic_level == "School") %>%
  mutate(level = "(rest of) England",
         level = ifelse(region_name == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(la_name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, school_name, phase.type_grouping, type_of_establishment, ward_name, urban_rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals..Performance.Tables.`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."), starts_with("full.time."),
                  `X.full.time.boys.aged.3..born.September.to.December.`), ~as.numeric(ifelse(.x == "x", 3, .x)))) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`X.full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`X.full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals..Performance.Tables.`), ~as.numeric(ifelse(.x == "x", 3, .x)))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = school_name,
         school_type = phase.type_grouping,
         school_subtype = type_of_establishment,
         ward = ward_name,
         school_fsm = `number.of.pupils.known.to.be.eligible.for.free.school.meals..Performance.Tables.`)


pru_fsm_19 <- pru_data_19 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2019,
         end_period_month = "January",
         period_length = "Year")


pru_eth_19 <- pru_data_19 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2019,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_19%>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_19 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_19 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_19 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_19 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2019,
         end_period_month = "January",
         period_length = "Year")




# JAN 18 SCHOOLS CENSUS
# schools_pupils_and_their_characteristics_2018_underlying_data/Schools_Pupils_and_their_Characteristics_2018_Schools_Pupils_UD.csv

s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/schools_pupils_and_their_characteristics_2018_underlying_data (1)/Schools_Pupils_and_their_Characteristics_2018_Schools_Pupils_UD.csv")
# s_data <- read.csv("/Users/katehayes/temp_data/schools_pupils_and_their_characteristics_2018_underlying_data/Schools_Pupils_and_their_Characteristics_2018_Schools_Pupils_UD.csv")



pru_data_18 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x == "..", NA, .x))) %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_18 <- pru_data_18 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2018,
         end_period_month = "January",
         period_length = "Year")

pru_eth_18 <- pru_data_18 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2018,
         end_period_month = "January",
         period_length = "Year")


pru_ptg <- pru_data_18 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_18 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_18 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_18 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_18 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2018,
         end_period_month = "January",
         period_length = "Year")





# JAN 17 SCHOOLS CENSUS
# SFR28_2017_Underlying_Data/SFR28_2017_Schools_Pupils_UD.csv

# s_data <- read.csv("/Users/katehayes/temp_data/SFR28_2017_Underlying_Data/SFR28_2017_Schools_Pupils_UD.csv")
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR28_2017_Underlying_Data (1)/SFR28_2017_Schools_Pupils_UD.csv")


pru_data_17 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x == "..", NA, .x))) %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_17 <- pru_data_17 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2017,
         end_period_month = "January",
         period_length = "Year")


pru_eth_17 <- pru_data_17 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2017,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_17 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_17 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_17 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_17 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_17 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2017,
         end_period_month = "January",
         period_length = "Year")


# JAN 16 SCHOOLS CENSUS

# SFR20_2016_Underlying_Data/SFR20_2016_Schools_Pupils_UD.csv

s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR20_2016_Underlying_Data (1)/SFR20_2016_Schools_Pupils_UD.csv")
# s_data <- read.csv("/Users/katehayes/temp_data/SFR20_2016_Underlying_Data/SFR20_2016_Schools_Pupils_UD.csv")

pru_data_16 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x == "..", NA, .x))) %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment..name.`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(.x))) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment..name.`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_16 <- pru_data_16 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2016,
         end_period_month = "January",
         period_length = "Year")


pru_eth_16 <- pru_data_16 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2016,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_16 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_16 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_16 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_16 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_16 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2016,
         end_period_month = "January",
         period_length = "Year")







# earlier, Jan 15 schools census
# SFR16_2015_Underlying_Data/SFR16_2015_Schools_Pupils_UD.csv

# s_data <- read.csv("/Users/katehayes/temp_data/SFR16_2015_Underlying_Data/SFR16_2015_Schools_Pupils_UD.csv")
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR16_2015_Underlying_Data (1)/SFR16_2015_Schools_Pupils_UD.csv")


pru_data_15 <- s_data %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment..name.`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(.x))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment..name.`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_15 <- pru_data_15 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2015,
         end_period_month = "January",
         period_length = "Year")


pru_eth_15 <- pru_data_15 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2015,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_15 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_15 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_15 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_15 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_15 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2015,
         end_period_month = "January",
         period_length = "Year")



# earlier, Jan 14 schools census
# SFR15_2014_Underlying_data_v102/SFR15_2014_school_level_pupils_UD.csv

# s_data <- read.csv("/Users/katehayes/temp_data/SFR15_2014_Underlying_data_v102/SFR15_2014_school_level_pupils_UD.csv")
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR15_2014_Underlying_data_v102 (1)/SFR15_2014_school_level_pupils_UD.csv")

# this year i think the free school meals thing is already in percentage form

pru_data_14 <- s_data %>%
  # filter(Phase.type.grouping == "Pupil referral unit") %>%
  mutate(across(everything(), ~ifelse(.x == "..", NA, .x))) %>%
  mutate(`number.of.pupils.known.to.be.eligible.for.free.school.meals` =
           ifelse(`number.of.pupils.known.to.be.eligible.for.free.school.meals` == ">",
                  `Number.of.pupils..used.for.FSM.calculation.in.Performance.Tables.`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`)) %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Phase.type.grouping, `TypeOfEstablishment..name.`, Ward.name, Urban.rural,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(str_replace(.x, "x", "1.5")))) %>%
  mutate(`part.time.girls.aged.3` = select(.,`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.3..born.April.to.August.`:`part.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.girls.aged.4` = select(.,`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.girls.aged.4..born.April.to.August.`:`part.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.3` = select(.,`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.3..born.April.to.August.`:`full.time.girls.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.girls.aged.4` = select(.,`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.girls.aged.4..born.April.to.August.`:`full.time.girls.aged.4..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.3` = select(.,`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.3..born.April.to.August.`:`part.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`part.time.boys.aged.4` = select(.,`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`part.time.boys.aged.4..born.April.to.August.`:`part.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.3` = select(.,`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.3..born.April.to.August.`:`full.time.boys.aged.3..born.September.to.December.`)) %>%
  mutate(`full.time.boys.aged.4` = select(.,`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)
         %>% rowSums(na.rm = TRUE)) %>%
  select(-c(`full.time.boys.aged.4..born.April.to.August.`:`full.time.boys.aged.4..born.September.to.December.`)) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~str_replace(.x, "x", "1.5"))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(str_replace(.x, ">", "99.5")))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Phase.type.grouping,
         school_subtype = `TypeOfEstablishment..name.`,
         ward = Ward.name,
         urban_rural = Urban.rural,
         school_fsm = `number.of.pupils.known.to.be.eligible.for.free.school.meals`)

pru_fsm_14 <- pru_data_14 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, school_fsm)) %>%
  mutate(end_period_year = 2014,
         end_period_month = "January",
         period_length = "Year")

pru_eth_14 <- pru_data_14 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2014,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_14 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.girls"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_14 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("part.time.boys"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_14 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.girls"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_14 %>%
  select(c(level, school, school_type, school_subtype, ward, urban_rural, starts_with("full.time.boys"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_14 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2014,
         end_period_month = "January",
         period_length = "Year")




# earlier, Jan 13 schools census
# SFR21-2013_UD/School_level_schools_pupil_2013.csv

s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/SFR21-2013_UD (1)/School_level_schools_pupil_2013.csv")
# s_data <- read.csv("/Users/katehayes/temp_data/SFR21-2013_UD/School_level_schools_pupil_2013.csv")


pru_data_13 <- s_data %>%
  mutate(across(everything(), ~ifelse(.x == "..", NA, .x))) %>%
  # filter(Type.of.establishment == "Pupil Referral Unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Type.of.establishment, School.Type, CAS.Ward.name,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(str_replace(.x, "x", "1.5")))) %>%
 mutate(across(c(starts_with("number.of.pupils.classified.as."),
                `number.of.pupils.unclassified`,
                `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~str_replace(.x, "x", "1.5"))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(str_replace(.x, ">", "99.5")))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Type.of.establishment,
         school_subtype = School.Type,
         ward = CAS.Ward.name,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_13 <- pru_data_13 %>%
  select(c(level, school, school_type, school_subtype, ward, school_fsm)) %>%
  mutate(end_period_year = 2013,
         end_period_month = "January",
         period_length = "Year")

pru_eth_13 <- pru_data_13 %>%
  select(c(level, school, school_type, school_subtype, ward,  White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2013,
         end_period_month = "January",
         period_length = "Year")

# COME BACK AND DEAL WITH THE NA'S INTIRDUCED BY COERCIAN
pru_ptg <- pru_data_13 %>%
  select(c(level, school, school_type, school_subtype, ward, starts_with("part.time.girls.aged."))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", "")))


pru_ptb <- pru_data_13 %>%
  select(c(level, school, school_type, school_subtype, ward, starts_with("part.time.boys.aged."))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", "")))


pru_ftg <- pru_data_13 %>%
  select(c(level, school, school_type, school_subtype, ward, starts_with("full.time.girls.aged."))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", "")))


pru_ftb <- pru_data_13 %>%
  select(c(level, school, school_type, school_subtype, ward, starts_with("full.time.boys.aged."))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", "")))


pru_data_13 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) %>%
  pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2013,
         end_period_month = "January",
         period_length = "Year")




# earlier, Jan 12 schools census
# sfr10-2012ud/School_level_schools_pupils_2012.csv

# s_data <- read.csv("/Users/katehayes/temp_data/sfr10-2012ud/School_level_schools_pupils_2012.csv")
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/sfr10-2012ud (1)/School_level_schools_pupils_2012.csv")

pru_data_12 <- s_data %>%
  # filter(Type.of.establishment == "Pupil Referral Unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.Name, Type.of.establishment, School.Type,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(str_replace(.x, "x", "1.5")))) %>%
mutate(across(c(starts_with("number.of.pupils.classified.as."),
                `number.of.pupils.unclassified`,
                `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~str_replace(.x, "x", "1.5"))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(str_replace(.x, ">", "99.5")))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.Name,
         school_type = Type.of.establishment,
         school_subtype = School.Type,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_12 <- pru_data_12 %>%
  select(c(level, school, school_type, school_subtype, school_fsm)) %>%
  mutate(end_period_year = 2012,
         end_period_month = "January",
         period_length = "Year")

pru_eth_12 <- pru_data_12 %>%
  select(c(level, school, school_type, school_subtype, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2012,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_12 %>%
  select(c(level, school, school_type, school_subtype, starts_with("part.time.girls.aged"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", ""))) %>%
  pivot_longer(pt_girls,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2012,
         end_period_month = "January",
         period_length = "Year")


pru_ptb <- pru_data_12 %>%
  select(c(level, school, school_type, school_subtype, starts_with("part.time.boys.aged"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", ""))) %>%
  pivot_longer(pt_boys,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2012,
         end_period_month = "January",
         period_length = "Year")


pru_ftg <- pru_data_12 %>%
  select(c(level, school, school_type, school_subtype, starts_with("full.time.girls.aged"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", ""))) %>%
  pivot_longer(ft_girls,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2012,
         end_period_month = "January",
         period_length = "Year")


pru_ftb <- pru_data_12 %>%
  select(c(level, school, school_type, school_subtype, starts_with("full.time.boys.aged"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", ""))) %>%
  pivot_longer(ft_boys,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2012,
         end_period_month = "January",
         period_length = "Year")

# This bit below took ages for some reason...
# still running, should i stop and explore....
pru_data_12 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb)

# I CHANGED WHERE THE PIVOT WAS HAPPENING BECAUSE IT TOOK A WHILE TO DO THE PIVOT ON SUCH A LONG FILE
# %>%
#   pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
#                names_to = "gender", values_to = "count") %>%
#   mutate(pt_ft = gender) %>%
#   mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
#          pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
#   mutate(end_period_year = 2012,
#          end_period_month = "January",
#          period_length = "Year")





# earlier, Jan 11 schools census
# sfr12-2011udv4/School_level_schools_pupils_2011.csv

# s_data <- read.csv("/Users/katehayes/temp_data/sfr12-2011udv4/School_level_schools_pupils_2011.csv")
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/sfr12-2011udv4 (1)/School_level_schools_pupils_2011.csv")

pru_data_11 <- s_data %>%
  # filter(Type.of.establishment == "Pupil Referral Unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(Region == "West Midlands", "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.name, Type.of.establishment,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(str_replace(.x, "x", "1.5")))) %>%
mutate(across(c(starts_with("number.of.pupils.classified.as."),
                `number.of.pupils.unclassified`,
                `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~str_replace(.x, "x", "1.5"))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(str_replace(.x, ">", "99.5")))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.name,
         school_type = Type.of.establishment,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)

pru_fsm_11 <- pru_data_11 %>%
  select(c(level, school, school_type, school_fsm)) %>%
  mutate(end_period_year = 2011,
         end_period_month = "January",
         period_length = "Year")

pru_eth_11 <- pru_data_11 %>%
  select(c(level, school, school_type, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2011,
         end_period_month = "January",
         period_length = "Year")

pru_ptg <- pru_data_11 %>%
  select(c(level, school, school_type, starts_with("part.time.girls.aged"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", ""))) %>%
  pivot_longer(pt_girls,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2011,
         end_period_month = "January",
         period_length = "Year")


pru_ptb <- pru_data_11 %>%
  select(c(level, school, school_type, starts_with("part.time.boys.aged"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", ""))) %>%
  pivot_longer(pt_boys,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2011,
         end_period_month = "January",
         period_length = "Year")


pru_ftg <- pru_data_11 %>%
  select(c(level, school, school_type, starts_with("full.time.girls.aged"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", ""))) %>%
  pivot_longer(ft_girls,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2011,
         end_period_month = "January",
         period_length = "Year")


pru_ftb <- pru_data_11 %>%
  select(c(level, school, school_type, starts_with("full.time.boys.aged"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", ""))) %>%
  pivot_longer(ft_boys,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2011,
         end_period_month = "January",
         period_length = "Year")


pru_data_11 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) 

# %>%
#   pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
#                names_to = "gender", values_to = "count") %>%
#   mutate(pt_ft = gender) %>%
#   mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
#          pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
#   mutate(end_period_year = 2011,
#          end_period_month = "January",
#          period_length = "Year")



# earlier, Jan 10 schools census
# underlying_20data_20sfr092010/school_level_census.csv

# s_data <- read.csv("/Users/katehayes/temp_data/underlying_20data_20sfr092010/school_level_census.csv")
s_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/underlying_20data_20sfr092010 (1)/school_level_census.csv")


pru_data_10 <- s_data %>%
  # filter(Type.of.establishment == "Pupil Referral Unit") %>%
  mutate(level = "(rest of) England",
         level = ifelse(LA.name %in% c("Birmingham", "Coventry", "Dudley", "Herefordshire",
                                       "Sandwell", "Shropshire", "Solihull", "Staffordshire",
                                       "Stoke-on-Trent", "Telford and Wrekin", "Walsall", "Warwickshire",
                                       "Wolverhampton", "Worcestershire"),
                        "(rest of) West Midlands (region)", level),
         level = ifelse(LA.name == "Birmingham", "Birmingham", level)) %>% #doing level in a different way for a sec...
  select(c(level, School.name, Type.of.establishment,
           `part.time.girls.aged.0`:`full.time.boys.aged.19`,
           `number.of.pupils.known.to.be.eligible.for.free.school.meals`,
           starts_with("number.of.pupils.classified.as."),
           `number.of.pupils.unclassified`)) %>%
  mutate(across(c(starts_with("part.time."),
                  (starts_with("full.time."))), ~as.numeric(str_replace(.x, "x", "1.5")))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~str_replace(.x, "x", "1.5"))) %>%
  mutate(across(c(starts_with("number.of.pupils.classified.as."),
                  `number.of.pupils.unclassified`,
                  `number.of.pupils.known.to.be.eligible.for.free.school.meals`), ~as.numeric(str_replace(.x, ">", "99.5")))) %>%
  mutate(White = select(., c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.white.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Mixed or Multiple ethnic groups` = select(., c(`number.of.pupils.classified.as.white.and.black.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.mixed.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Asian or Asian British` = select(., c(`number.of.pupils.classified.as.Indian.ethnic.origin`:`number.of.pupils.classified.as.any.other.Asian.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Black, African, Caribbean or Black British` = select(., c(`number.of.pupils.classified.as.Caribbean.ethnic.origin`:`number.of.pupils.classified.as.any.other.black.background.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  mutate(`Other ethnic group` = select(., c(`number.of.pupils.classified.as.Chinese.ethnic.origin`, `number.of.pupils.classified.as.Gypsy.Roma.ethnic.origin`, `number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`))
         %>% rowSums(na.rm = TRUE)) %>%
  rename(`Refused or information not yet available` = `number.of.pupils.unclassified`) %>%
  select(-c(`number.of.pupils.classified.as.white.British.ethnic.origin`:`number.of.pupils.classified.as.any.other.ethnic.group.ethnic.origin`)) %>%
  rename(school = School.name,
         school_type = Type.of.establishment,
         school_fsm = number.of.pupils.known.to.be.eligible.for.free.school.meals)


pru_fsm_10 <- pru_data_10 %>%
  select(c(level, school, school_type, school_fsm)) %>%
  mutate(end_period_year = 2010,
         end_period_month = "January",
         period_length = "Year")

pru_eth_10 <- pru_data_10 %>%
  select(c(level, school, school_type, White, `Mixed or Multiple ethnic groups`,
           `Asian or Asian British`, `Black, African, Caribbean or Black British`,
           `Other ethnic group`, `Refused or information not yet available`)) %>%
  mutate(end_period_year = 2010,
         end_period_month = "January",
         period_length = "Year")


pru_ptg <- pru_data_10 %>%
  select(c(level, school, school_type, starts_with("part.time.girls.aged"))) %>%
  pivot_longer(starts_with("part.time.girls"),
               names_to = "age", values_to = "pt_girls") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.girls.aged.", ""))) %>%
  pivot_longer(pt_girls,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2010,
         end_period_month = "January",
         period_length = "Year")


pru_ptb <- pru_data_10 %>%
  select(c(level, school, school_type, starts_with("part.time.boys.aged"))) %>%
  pivot_longer(starts_with("part.time.boys"),
               names_to = "age", values_to = "pt_boys") %>%
  mutate(age = as.numeric(str_replace(age, "part.time.boys.aged.", ""))) %>%
  pivot_longer(pt_boys,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2010,
         end_period_month = "January",
         period_length = "Year")


pru_ftg <- pru_data_10 %>%
  select(c(level, school, school_type, starts_with("full.time.girls.aged"))) %>%
  pivot_longer(starts_with("full.time.girls"),
               names_to = "age", values_to = "ft_girls") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.girls.aged.", ""))) %>%
  pivot_longer(ft_girls,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2010,
         end_period_month = "January",
         period_length = "Year")


pru_ftb <- pru_data_10 %>%
  select(c(level, school, school_type, starts_with("full.time.boys.aged"))) %>%
  pivot_longer(starts_with("full.time.boys"),
               names_to = "age", values_to = "ft_boys") %>%
  mutate(age = as.numeric(str_replace(age, "full.time.boys.aged.", ""))) %>%
  pivot_longer(ft_boys,
               names_to = "gender", values_to = "count") %>%
  mutate(pt_ft = gender) %>%
  mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
         pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
  mutate(end_period_year = 2010,
         end_period_month = "January",
         period_length = "Year")


pru_data_10 <- pru_ptg %>%
  full_join(pru_ptb) %>%
  full_join(pru_ftg) %>%
  full_join(pru_ftb) 

# %>%
#   pivot_longer(c(ft_boys, ft_girls, pt_boys, pt_girls),
#                names_to = "gender", values_to = "count") %>%
#   mutate(pt_ft = gender) %>%
#   mutate(gender = ifelse(gender %in% c("pt_girls", "ft_girls"), "Girl", "Boy"),
#          pt_ft = ifelse(pt_ft %in% c("pt_girls", "pt_boys"), "Part time", "Full time")) %>%
#   mutate(end_period_year = 2010,
#          end_period_month = "January",
#          period_length = "Year")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together, three different sets w different agregations, # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# one set w broken down again, split into the different charcteristics # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

pru_10to22_age_gender <- pru_data_22 %>%
  bind_rows(pru_data_21) %>%
  bind_rows(pru_data_20) %>%
  bind_rows(pru_data_19) %>%
  bind_rows(pru_data_18) %>%
  bind_rows(pru_data_17) %>%
  bind_rows(pru_data_16) %>%
  bind_rows(pru_data_15) %>%
  bind_rows(pru_data_14) %>%
  bind_rows(pru_data_13) %>%
  bind_rows(pru_data_12) %>%
  bind_rows(pru_data_11) %>%
  bind_rows(pru_data_10) %>%
  filter(count != 0) %>%
  mutate(gender = reconcile_gender(gender))

# save(pru_10to22_age_gender, file = "Output/Data/Cleaned/pru_10to22_age_gender.Rdata")
save(pru_10to22_age_gender, file = "output/data/cleaned/schools_10to22_age_gender.Rdata")

schools_10to22_ethnicity <- pru_eth_22 %>%
  bind_rows(pru_eth_21) %>%
  bind_rows(pru_eth_20) %>%
  bind_rows(pru_eth_19) %>%
  bind_rows(pru_eth_18) %>%
  bind_rows(pru_eth_17) %>%
  bind_rows(pru_eth_16) %>%
  bind_rows(pru_eth_15) %>%
  bind_rows(pru_eth_14) %>%
  bind_rows(pru_eth_13) %>%
  bind_rows(pru_eth_12) %>%
  bind_rows(pru_eth_11) %>%
  bind_rows(pru_eth_10) %>%
  pivot_longer(c( White, `Mixed or Multiple ethnic groups`,
                  `Asian or Asian British`, `Black, African, Caribbean or Black British`,
                  `Other ethnic group`, `Refused or information not yet available`),
               names_to = "ethnicity", values_to = "count")

# save(pru_10to22_ethnicity, file = "Output/Data/Cleaned/pru_10to22_ethnicity.Rdata")
save(schools_10to22_ethnicity, file = "output/data/cleaned/schools_10to22_ethnicity.Rdata")


schools_10to22_fsm <- pru_fsm_22 %>%
  bind_rows(pru_fsm_21) %>%
  bind_rows(pru_fsm_20) %>%
  bind_rows(pru_fsm_19) %>%
  bind_rows(pru_fsm_18) %>%
  bind_rows(pru_fsm_17) %>%
  bind_rows(pru_fsm_16) %>%
  bind_rows(pru_fsm_15) %>%
  bind_rows(pru_fsm_14) %>%
  bind_rows(pru_fsm_13) %>%
  bind_rows(pru_fsm_12) %>%
  bind_rows(pru_fsm_11) %>%
  bind_rows(pru_fsm_10)

save(schools_10to22_fsm, file = "output/data/cleaned/schools_10to22_fsm.Rdata")







