# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # SETTING LISTS # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
group_types <- c("Age", "Gender", "Ethnicity", "Sex")

remand_types <- c("Bail remands", "No substantive remand type", "Community remands",
                  "Community remands with intervention", "Custodial remands")

court_types <- c("Magistrates' courts", "Crown court")

disposal_types <- c("Pre-court", "First-tier", "Community", "Custody")

# las in the west mids
LAs_in_WM_list <- c("Birmingham", "Coventry", "Dudley", "Herefordshire",
                    "Sandwell", "Shropshire", "Solihull", "Staffordshire",
                    "Stoke-on-Trent", "Telford and Wrekin", "Walsall",
                    "Warwickshire", "Wolverhampton", "Worcestershire")

LAs_in_WMPF_list <- c("Birmingham", "Coventry", "Dudley",
                    "Sandwell", "Solihull", "Walsall",
                    "Wolverhampton")



Migrant Help
Home Office
Local Authority - Wolverhampton
Local Authority - Birmingham
West Midlands Police
Local Authority - Dudley
Local Authority - Other
Gangmasters and Labour Abuse Authority (GLAA)
Local Authority - Solihull
Barnardo’s
Home Office - UKVI
The Salvation Army
Other Police Force
Local Authority - Sandwell
Local Authority - Walsall
Local Authority - Coventry
National Crime Agency
Unknown
Home Office - HOIE
Medaille Trust
Kalayaan
Unseen
Home Office - UKBF
BAWSO



reconcile_dashboard <- function(x) {

  yes_list <- c("YES", "Yes", "yes")

  no_list <- c("NO", "No", "no", " No")

  unknown_list <- c("Unknown", "unknown",
                    "UNKNOWN")

  na_list <- c(" ", "")

  total_list <- c(yes_list, no_list, unknown_list, na_list)

  x <- case_when(x %in% yes_list ~ "Yes",
                 x %in% no_list ~ "No",
                 x %in% unknown_list ~ "Unknown",
                 x %in% na_list ~ " ",
                 !(x %in% total_list) ~ "CHECK THIS VALUE"
                 )

}




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # FUNCTIONS# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

remove_spaces <- function(x) {

  x <- str_replace_all(x, " ", "")

}



# this function gets what label each disposal should have from the years in the
# data where the disposals are labelled
# then it applies the labels to the whole thing
# actually it just applies to the ones with no label, but it could p (hopefully lol) apply to the whole thing with the same outcome

# "Absolute discharge", "Conditional discharge", "Fine" disposal types in the children dataset, are also in the disposals data, and in both the type should be first-tier
# Youth caution, a disposal type in the children dataset, is also in the disposals data, and in both (of course) the type is precourt
# Other is in both and should go to the type other
# "Community sentence" is in children and not in disposals and should be assigned to community
# "Immediate custody"is in children and not in disposals and should be assigned to custody



assign_disp_cat <- function(disp_data) {

  disp_data <- disp_data %>%
    ungroup()

  precourt_list <- disp_data %>%
    filter(disposal_type == "Pre-court") %>%
    distinct(disposal)
  precourt_list <- unlist(precourt_list$disposal)

  firsttier_list <- disp_data %>%
    filter(disposal_type == "First-tier") %>%
    distinct(disposal)
  firsttier_list <- unlist(firsttier_list$disposal)

  community_list <- disp_data %>%
    filter(disposal_type == "Community") %>%
    distinct(disposal)
  community_list <- c(unlist(community_list$disposal), "Community sentence")

  custody_list <- disp_data %>%
    filter(disposal_type == "Custody") %>%
    distinct(disposal)
  custody_list <- c(unlist(custody_list$disposal), "Immediate custody")


  disp_data <- disp_data %>%
    mutate(disposal_type = if_else(is.na(disposal_type), case_when(disposal %in% precourt_list ~ "Pre-court",
                                                             disposal %in% firsttier_list ~ "First-tier",
                                                             disposal %in% community_list ~ "Community",
                                                             disposal %in% custody_list ~ "Custody",
                                                             disposal == "Other" ~ "Other"),
                                   disposal_type))

}

# this one is actually just for the children data & it makes a type column then fills it
assign_disp_cat_children <- function(child_data) {

  fte_firsttier_list <- c("Absolute discharge", "Conditional discharge", "Fine")

  child_data <- child_data %>%
  mutate(disposal_type = case_when(disposal == "Youth Caution" ~ "Pre-court",
                                   disposal %in% fte_firsttier_list ~ "First-tier",
                                   disposal == "Community sentence" ~ "Community",
                                   disposal == "Immediate custody" ~ "Custody",
                                   disposal == "Other" ~ "Other"))
}


aggregate_custody_disposals <- function(x) {

  sec90to92_list <- c("Section 90-92 Detention", "Section 90-91 Detention")
  sec226to228_list <- c("Section 226 (Life)", "Section 226 (Public Protection)",
                        "Section 228", "Section 226b (*)", "Section 226b")

  x <- ifelse(x %in% sec90to92_list, "Section 90-92 Detention", x)
  x <- ifelse(x %in% sec226to228_list, "Section 226-228", x)

}




# FOR SCHOOL/PRU DATA - RECONCILE SCHOOL TYPE




# how to write a function that mutates a column in dplyr
# as in mutate(gender = reconcile_gender(gender))
reconcile_gender <- function(x) {

  boys_list <- c("Boys", "boys", "Boy", "boy",
                "Males", "males", "Male", "male")

  girls_list <- c("Girls", "girls", "Girl", "girl",
                 "Females", "females", "Female", "female")

  unknown_list <- c("Unknown", "unknown",
                    "Not Known", "Not known", "not known",
                    "Unclassified/withheld")

  total_list <- c(boys_list, girls_list, unknown_list)

  x <- case_when(x %in% boys_list ~ "Boys",
                 x %in% girls_list ~ "Girls",
                 x %in% unknown_list ~ "Unknown",
                 !(x %in% total_list) ~ "CHECK THIS VALUE")

}


# VERY MUCH EXPERIMENTAL
reconcile_age <- function(x) {

  x <- str_replace_all(x, "Aged ", "")
  x <- str_replace_all(x, "years", "")
  x <- str_replace_all(x, "year", "")
  x <- str_replace_all(x, "and over", "+")
  x <- str_replace_all(x, "or over", "+")
  x <- str_replace_all(x, "Under", "<")
  x <- str_replace_all(x, " ", "")
  x <- str_replace_all(x, "to", "-")

}


# this function should work on any categorical column that might have an unknown entry
# will not find/draw attention to inconsistent unknown entries that you dont knwo about.

reconcile_unknown <- function(x) {

  unknown_list <- c("Unknown", "unknown",
                    "Not Known", "Not known", "not known")

  x <- ifelse(x %in% unknown_list, "Unknown", x)

}

reconcile_quarters <- function(x) {

  x <- ifelse(x == 1, "June", x)
  x <- ifelse(x == 2, "September", x)
  x <- ifelse(x == 3, "December", x)
  x <- ifelse(x == 4, "march", x)

}


# Quarter Q
# 1
# - April-June
# Q
# 2
#
# - July-September
# Q
# 3

# - October-December
# Q
# 4
#
# - January-March


# FOR LATER INFO - FOR AGE CLEANING JUST ALWAYS REMOVE SPACES IN SAY 10 - 14 (MAKING IT 10-14)

# IN THE REMAND CLEANING, CHECK
reconcile_ethnicity <- function(x) {

  asian_list <- c("Asian or Asian British", "boys", "Boy", "boy",
                 "Males", "males", "Male", "male")

  girls_list <- c("Girls", "girls", "Girl", "girl",
                  "Females", "females", "Female", "female")

  unknown_list <- c("Unknown", "unknown",
                    "Not Known", "Not known", "not known")

  total_list <- c(boys_list, girls_list, unknown_list)

  x <- case_when(x %in% boys_list ~ "Boys",
                 x %in% girls_list ~ "Girls",
                 x %in% unknown_list ~ "Unknown",
                 !(x %in% total_list) ~ "CHECK THIS VALUE")

}


full_month <- function(x) {

  months <- c("January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December")

  for (month in months) {

    x <- ifelse(grepl(x, month), month, x)
  }

}

x <- ifelse(i == 1, months[grep(x, months)], x)

grepl()

months <- c("January", "February", "March", "April", "May", "June", "July",
            "August", "September", "October", "November", "December")

months[grep("Aug", months)]

grepl("Jan", months)

some_data <- some_data %>%
  mutate(end_period_month = )

 x <- "Jan"

  x <- ifelse(grepl(x, "January"), "January", x)

  month_list <- alist(January, February, March, April, May, June, July, August, September, October, November, December)





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # other stuff, might come back to# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# setting remand, group(characteristic), court types







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
                              disposal == "Section 228" ~ "Other"))







# getting disposal groupings








# ETHNICITY GROUPS

# school level underlying data - this is 2015 i think
# summed percentages across all these categories
# rounding errors make them add to say 99.8 or 100.1 percent, but they are
# mutually exclusive categories i think its ok to presume.

ABSOLUTELY incredible ehtnicity groups in a WM police FoI: Afro-Caribbean Arab Asian Dark European Oriental White European


number of pupils classified as white British ethnic origin
number of pupils classified as Irish ethnic origin
number of pupils classified as traveller of Irish heritage ethnic origin
number of pupils classified as any other white background ethnic origin

number of pupils classified as Gypsy/Roma ethnic origin

number of pupils classified as white and black Caribbean ethnic origin
number of pupils classified as white and black African ethnic origin
number of pupils classified as white and Asian ethnic origin
number of pupils classified as any other mixed background ethnic origin


number of pupils classified as Indian ethnic origin
number of pupils classified as Pakistani ethnic origin
number of pupils classified as Bangladeshi ethnic origin
number of pupils classified as any other Asian background ethnic origin


number of pupils classified as Caribbean ethnic origin
number of pupils classified as African ethnic origin
number of pupils classified as any other black background ethnic origin


number of pupils classified as Chinese ethnic origin


number of pupils classified as any other ethnic group ethnic origin


number of pupils unclassified




# lets use the care ethnicity categories - as far as i remember they're pretty typical
# As far as i remember, CHinese people usually aren't grouped in the Asian category, so here ill put them in other
# going to put Romani people in other too

# White
# Asian or Asian British
# Black, African, Caribbean or Black British
# Mixed or Multiple ethnic groups
# Other ethnic group
# Refused or information not yet available

# White
number of pupils classified as white British ethnic origin
number of pupils classified as Irish ethnic origin
number of pupils classified as traveller of Irish heritage ethnic origin
number of pupils classified as any other white background ethnic origin

# Mixed or Multiple ethnic groups
number of pupils classified as white and black Caribbean ethnic origin
number of pupils classified as white and black African ethnic origin
number of pupils classified as white and Asian ethnic origin
number of pupils classified as any other mixed background ethnic origin


# Asian or Asian British
number of pupils classified as Indian ethnic origin
number of pupils classified as Pakistani ethnic origin
number of pupils classified as Bangladeshi ethnic origin
number of pupils classified as any other Asian background ethnic origin

# Black, African, Caribbean or Black British
number of pupils classified as Caribbean ethnic origin
number of pupils classified as African ethnic origin
number of pupils classified as any other black background ethnic origin

# Other ethnic group
number of pupils classified as Chinese ethnic origin
number of pupils classified as Gypsy/Roma ethnic origin
number of pupils classified as any other ethnic group ethnic origin

# Refused or information not yet available
number of pupils unclassified

