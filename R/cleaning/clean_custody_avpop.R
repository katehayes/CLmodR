# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  Average monthly youth custody population by legal basis - only WM level
# usually found in chapter seven of the youth justice supplementaries
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# -------2020/21----------------------------------------------------------------------
# Table 7.21: Average monthly youth custody population by region of home Youth Justice Service
# and legal basis for detention (under 18s only), years ending March 2012 to 2021

# has 2011/12 to 2020/21 at west midlands level
c_data <- read_xlsx("/Users/katehayes/temp_data/Youth_Justice_Statistics_2020-21_supplementary_tables/Ch 7 - Children in youth custody.xls",
                    sheet = 22, skip = 3, n_max = 48)

c1221 <- c_data %>%
  clean_avpop_ch7(current_end_month = "March", current_period_length = "Year")

#2010/11 has remand numbers for the each month at country level only
# note - not average monthly population but actual numbers, i think


#new year - 09/10
c_data <- read_xls("/Users/katehayes/temp_data/New Tables for Website/Ch5 Custody Tables.xls", sheet = 11, skip = 2, n_max = 8)

c10 <- c_data %>%
  clean_avpop_ch7_09to11(current_end_year = 2010,
                         current_end_month = "March",
                         current_period_length = "Year")


#new year - 10/11
c_data <- read_xls("/Users/katehayes/temp_data/Youth Justice Statistics Supplementary tables 2010-11/Ch7- Young People in Custody.xls",
                        sheet = 11, skip = 2, n_max = 8)

c11 <- c_data %>%
  clean_avpop_ch7_09to11(current_end_year = 2011,
                         current_end_month = "March",
                         current_period_length = "Year")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ADDING TOGETHER - AV MONTHLY POP IN CUSTODy # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

custody_avpop_10to21_legal_basis <- c1221 %>%   #should it be av_month_pop__10to21 ??
  bind_rows(c11) %>%
  bind_rows(c10)


save(custody_avpop_10to21_legal_basis, file = "Output/Data/Cleaned/custody_avpop_10to21_legal_basis.Rdata")

