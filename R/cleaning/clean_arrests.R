# 1721A_Attachment.xlsx < A NEW FOI





a_data <- read.csv("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/arrests-open-data-tables-ppp-2e (1).csv")

check <- a_data %>% 
  filter(Force.Name == "West Midlands",
         Age.group %in% c("10 - 17 years", "Under 10 years"),
         Financial.Year %in% c("2019/20", "2020/21")) %>% 
  group_by(Ethnic.Group..self.defined., Financial.Year, Age.group, Gender) %>% 
  summarise(Arrests = sum(as.numeric(Arrests))) %>% 
  ungroup() %>% 
  group_by(Ethnic.Group..self.defined.,  Financial.Year) %>%
  summarise(Arrests = sum(as.numeric(Arrests))) %>% 
  # group_by(Gender, Financial.Year) %>% 
  # summarise(Arrests = sum(as.numeric(Arrests)))
  ungroup() %>% 
  group_by(Financial.Year) %>%
  mutate(pc = Arrests/sum(Arrests))
  
  
  
  
  
  distinct(Ethnic.Group..self.defined.)


a_data <- read_xlsx("/Users/katehayes/temp_data/arrests-open-data-tables-mar22.xlsx", sheet = 3)

arrest_data <- a_data %>%
filter(Region == "West Midlands")


arrest_data <- a_data %>%
  select(-c(Geocode)) %>%
  rename(end_period_year = `Financial Year`) %>%
  mutate(end_period_year = paste(substr(end_period_year,1,2), substr(end_period_year,6,7), sep = ""))

a_wmr <- arrest_data %>%
  filter(Region == "West Midlands") %>%
  group_by(end_period_year, Gender, `Ethnic Group (self-defined)`, `Age group`,
           `Reason for arrest (offence group)`) %>%
  summarise(count = sum(Arrests)) %>%
  mutate(level = "West Midlands (region)")


a_wmp <- arrest_data %>%
  filter(`Force Name` == "West Midlands") %>%
  group_by(end_period_year, Gender, `Ethnic Group (self-defined)`, `Age group`,
           `Reason for arrest (offence group)`) %>%
  summarise(count = sum(Arrests)) %>%
  mutate(level = "West Midlands (police)")


arrest_data <- arrest_data %>%
  group_by(end_period_year, Gender, `Ethnic Group (self-defined)`, `Age group`,
           `Reason for arrest (offence group)`) %>%
  summarise(count = sum(Arrests)) %>%
  mutate(level = "Eng/Wales") %>%
  bind_rows(a_wmr) %>%
  bind_rows(a_wmp) %>%
  rename(gender = Gender,
         age = `Age group`,
         ethnicity = `Ethnic Group (self-defined)`,
         reason = `Reason for arrest (offence group)`) %>%
  mutate(gender = reconcile_gender(gender),
         age = reconcile_age(age),
         end_period_month = "March",
         period_length = "Year")
# NEED TO RECONCILE ARREST REASONS AS WELL AS ETHNICITY


drug_arrests_14to21_offence_drug
drug_arrests_11to18_age
drug_arrests_11to18_gender
drug_arrests_11to18_gender_offence_drug

# https://foi.west-midlands.police.uk/wp-content/uploads/2020/06/39A_ATTACHMENT.pdf
#https://foi.west-midlands.police.uk/wp-content/uploads/2020/12/1095A_ATTACHMENT_01.pdf
# https://foi.west-midlands.police.uk/wp-content/uploads/2020/12/1095A_ATTACHMENT_02.pdf
# https://www.whatdotheyknow.com/request/lbc_request_child_drug_offences_44#incoming-1246191

#
install.packages("googledrive")

library(googledrive)

  library(pdftools)

temp <- tempfile(fileext = ".zip")
download.file("https://drive.google.com/uc?export=download&id=1Tw7OhhHDsvgdHUQLQXy06gdUyw5y4Dwg",
              temp)

download.file("https://drive.google.com/uc?export=download&id=1T5iGtFkirFTLnt81_vtQeUg2jZAr3Nfa",
              temp)



out <- unzip(temp, exdir = tempdir())
bank <- read.csv(out[14], sep = ";")

arrest_txt <- pdf_text(out)
# #
# i) The number of under 16's arrested for drug offences, broken down into years (e.g. 2014, 2015, 2016 etc) and a grand total;
# ii) The number of under 16's arrested for drug offences, broken down into offence type (e.g. possession, intent to supply);
# iii) Out of the grand total, how many under 16's were arrested for possession and supply of Class A substances, and how many under 16's were arrested for supply of Class A substances
# iv) Out of the grand total, how many under 16's were arrested for possession and supply of Class B substances, and how many under 16's were arrested for supply of Class B substances
# v) Out of the grand total, how many under 16's were arrested for possession and supply of Class C substances, and how many under 16's were arrested for supply of Class C substances;

arrest_txt

# arrest_txt <- pdf_text("/Users/katehayes/temp_data/15923 ATTACHMENT.pdf")
#



# extract_foi_name <- function(x) {
#
#   check[1] <- ""
#
#   i <- 1
#
#   x <- as.character(x)
#
#   while (x != "") {
#
#   check[i]  <- str_extract(x, "[^\\d]+")
#   x <- str_remove(x, "[^\\d]+")
#   check[i+1]  <- str_extract(x, "[\\d]+")
#   x <- str_remove(x, "[\\d]+")
#
#   i <- i + 2
#
#   }
#
#   x <- check[1]
#
# }
#
extract_foi <- function(x, num) {

  check[1:1000] <- ""

  i <- 1

  x <- as.character(x)


  while (x != "") {

    check[i]  <- str_extract(x, "[^\\d]+")
    x <- str_remove(x, "[^\\d]+")
    check[i+1]  <- str_extract(x, "[\\d]+")
    x <- str_remove(x, "[\\d]+")

    i <- i + 2

  }

     x <- check[num]


  return(x)

}


extract_foi2 <- function(data, structure) {

  xx <- as.character(c(c(2014:2021), "total"))
  colnames(data) <- "text"

  data <- data %>%
    cbind(setNames(lapply(xx, function(x) x = NA), xx))
    mutate(numbers = str_extract(text, "   .*"),
           numbers = str_extract_all(number, "[\\d]+"))

  check <- as.list(data$numbers)



  for (i in 1:nrow(data)) {
    for (j in 1:length(xx)) {
      k = 1

      data <- data %>%
        mutate(across(select(data, j+1), ~ifelse(structure[[i]][[j]] == 0, 0, check[[i]][[k]])))

      k = k + 1

    }
  }

  data <- data %>%
    mutate(reason = sub("   .*", "", text))


  return(data)

}


structure <- list()

structure[[1]] <- list()
structure[[1]][[1]] <- 0
structure[[1]][[2]] <- 0
structure[[1]][[3]] <- 0
structure[[1]][[4]] <- 0
structure[[1]][[5]] <- 0
structure[[1]][[6]] <- "x"
structure[[1]][[7]] <- 0
structure[[1]][[8]] <- 0
structure[[1]][[9]] <- "x"

structure[[2]] <- list()
structure[[2]][[1]] <- 0
structure[[2]][[2]] <- 0
structure[[2]][[3]] <- 0
structure[[2]][[4]] <- "x"
structure[[2]][[5]] <- "x"
structure[[2]][[6]] <- 0
structure[[2]][[7]] <- "x"
structure[[2]][[8]] <- 0
structure[[2]][[9]] <- "x"




extract_foi <- Vectorize(extract_foi)

arrest_txt <- pdf_text("/Users/katehayes/temp_data/953A and 969a 2022 attachment..pdf")

col_nm <- c(col_nm[1:6],
  "Time in custody (decimal days)", "Time in custody", "Days of Detention",
  "Charged", "Detained overnight post charge", "Bailed")






extract_foi <- Vectorize(extract_foi)

arrest_txt <- pdf_text("/Users/katehayes/temp_data/953A and 969a 2022 attachment..pdf")






text_matrix <- arrest_txt %>%
   str_split("\\n", simplify = TRUE) %>%
    as.list() %>%
    as.data.frame() %>%
    t() %>%
    as.data.frame()

rownames(text_matrix) <- NULL

text_matrix <- text_matrix[24:75, 1] %>%
  as.data.frame() %>%
  extract_foi2(structure)




colnames(text_matrix) <- "text"

xx <- as.character(c(2014:2021))

text_matrix_tests <- text_matrix %>%
  mutate(reason = sub("   .*", "", text)) %>%
  mutate(remainder = str_extract(text, "   .*")) %>%
  mutate(content = str_extract_all(remainder, "[\\d]+")) %>%
  mutate(content = as.list(content))

check <- as.list(text_matrix_tests$content)

xx <- as.character(c(2014:2021))
text_matrix_tests <- text_matrix %>%
  mutate(reason = sub("   .*", "", text)) %>%
  mutate(grand_total = sub(".*   ", "", text)) %>%
 cbind(setNames(lapply(xx, function(x) x = NA), xx))




  # %>%
#   mutate(index = 1:nrow(text_matrix_tests)) %>%
#   make_zero(x = 2016)
#
#
# make_zero <- function(data, x) {
#   data <- data %>%
#     mutate(!!x = 0)
#   }

 #
  mutate(`2021` = ifelse(index < 30), 0, )


  check[i]  <- str_extract(x, "[^\\d]+")
x <- str_remove(x, "[^\\d]+")

# %>%
  # mutate(name = Vextract_foi_rest(V1, num = 1)) %>%
  # mutate(num1 = Vextract_foi_rest(V1, num = 2)) %>%
  # mutate(num2 = Vextract_foi_rest(V1, num = 3)) %>%
  # mutate(num3 = Vextract_foi_rest(V1, num = 4)) %>%
  # mutate(num4 = Vextract_foi_rest(V1, num = 5)) %>%
  # mutate(num5 = Vextract_foi_rest(V1, num = 6)) %>%
  # mutate(num6 = Vextract_foi_rest(V1, num = 7)) %>%
  # mutate(num7 = Vextract_foi_rest(V1, num = 8)) %>%
  # mutate(num8 = Vextract_foi_rest(V1, num = 9)) %>%
  # mutate(num9 = Vextract_foi_rest(V1, num = 10)) %>%
  # mutate(num10 = Vextract_foi_rest(V1, num = 11)) %>%
  # mutate(num11 = Vextract_foi_rest(V1, num = 12)) %>%
  # mutate(num12 = Vextract_foi_rest(V1, num = 13)) %>%
  # mutate(num13 = Vextract_foi_rest(V1, num = 14)) %>%
  # mutate(num14 = Vextract_foi_rest(V1, num = 15)) %>%
  # mutate(num15 = Vextract_foi_rest(V1, num = 16)) %>%
  # mutate(num16 = Vextract_foi_rest(V1, num = 17)) %>%
  # mutate(num17 = Vextract_foi_rest(V1, num = 18))
  #



check <- text_matrix[50,1] %>%
  extract_foi_name()

check
install.packages('pdftools')
library(pdftools)

arrest_txt <- pdf_text("/Users/katehayes/temp_data/15923 ATTACHMENT.pdf")
cat(arrest_txt[1])
# #
#
#
#
# text_matrix <- arrest_txt %>%
#   str_split("\\n", simplify = TRUE) %>%
#   as.list() %>%
#   as.data.frame() %>%
#   t() %>%
#   as.data.frame() %>%
#   mutate(text = str_extract_all(V1, "[^\\d.-]+"),
#          number = str_extract_all(V1, "[\\d.-]+"))
#
#
# check <- text_matrix %>%
#   select(text) %>%
#   as.list()
#
# check <- check[[1]] %>%
#
#
# # %>%
#   as.data.frame()
#
# check <- str_extract_all(text_matrix, "[\\d.-]+")
#
#
# check2 <- str_extract_all(text_matrix, "[^\\d.-]+")
#
#
#
#
# mutate(num = str_extract_all(rule, "[\\d.-]+"),
#        char = str_extract_all(rule, "[^\\d.-]+"))
#
# drug_arrests <- data.frame()
# drug_arrests <- text_matrix[2,8]
#
#
# # %>%
#   str_which("Offence                                                                         2010/11   2011/12 2012/13 2013/14 2014/15 2015/16 2016/17 2017/18")
#
# str_wh
#
# # text_matrix <- arrest_txt %>% str_split("\\s+", simplify = TRUE)
# #
# # # locate the start and end of the tab
# # table_raw <- text_matrix[1, 57:156] %>%
# #   as_tibble() %>%
# #   mutate(index = ifelse(value %in% c("Age", )))
# #
# #
#
#

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# putting it together# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# one set! # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
arrests_07to22_reason_age_gender_ethnicity <- arrest_data %>%
  ungroup() %>%
  filter(age == "10-17") %>%
  select(-age)


save(arrests_07to22_reason_age_gender_ethnicity, file = "Output/Data/Cleaned/arrests_07to22_reason_age_gender_ethnicity.Rdata")

