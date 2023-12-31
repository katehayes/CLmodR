# COULD WE USE INCOME IMD FOR BIRMINGHAM???



# local_child_poverty_basket_of_indicators.xlsx <- THIS FILE HAS HIDDEN BIRM DATA 2006-2012
# don't have age of child
# This indicator measures the proportion of dependent children in a Local Authority
# who live in households claiming tax credits and/or out-of-work benefits whose
# equivalised income is below 60% of the contemporary national median.
# children is under 20 years old.
# Date: Point in time


p_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/local_child_poverty_basket_of_indicators (1).xlsx",
                    sheet = 7, skip = 3, n_max = 162, col_names = T)
c_names <- c("level",
             "2006 - pc", "2007 - pc", "2008 - pc", "2009 - pc", "2010 - pc", "2011 - pc", "2012 - pc",
             "2006 - count", "2007 - count", "2008 - count", "2009 - count", "2010 - count", "2011 - count", "2012 - count")

poverty_data <- p_data %>%
  select(-c(`Boundary ID`, `Old Boundary ID`, `Latest Data- Percentage`, `Latest Data- Number`)) %>%
  `colnames<-`(c_names) %>%
  filter(level %in% c("Birmingham", "West Midlands", "England")) %>%
  mutate(across(-level, ~as.numeric(.x))) %>%
  mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level))


p_data_pc <- poverty_data %>%
  select(-c(`2006 - count`:`2012 - count`)) %>%
  pivot_longer(cols = c(`2006 - pc`:`2012 - pc`),
               names_to = "end_period_year", values_to = "pc") %>%
  mutate(end_period_year = str_sub(end_period_year, 1, 4),
         end_period_month = "August",
         period_length = "Day") %>% 
  mutate(measure = "HBAI - children 0-20")

p_data_count <- poverty_data %>%
  select(-c(`2006 - pc`:`2012 - pc`)) %>%
  pivot_longer(cols = c(`2006 - count`:`2012 - count`),
               names_to = "end_period_year", values_to = "count") %>%
  mutate(end_period_year = as.numeric(str_sub(end_period_year, 1, 4)),
         end_period_month = "August",
         period_length = "Day")





# https://stat-xplore.dwp.gov.uk/webapi/jsf/tableView/openTable.xhtml
# Relative low-income is defined as a family in low income Before Housing Costs
# (BHC) in the reference year. A family must have claimed Child Benefit and at
# least one other household benefit (Universal Credit, tax credits, or Housing Benefit)
# at any point in the year to be classed as low income in these statistics. Gross
# income measure is Before Housing Costs (BHC) and includes contributions from earnings, state support and pensions.



p_data <- read_xlsx("/Users/katehayes/temp_data/CHILD POVERTY FEB.xlsx",
                    sheet = 1, skip = 9, n_max = 5, col_names = F)

c_names <- unlist(p_data[,1])
c_names[5] <- "count"

poverty_data_1621 <- t(p_data[,-1]) %>%
  `colnames<-`(c_names) %>%
  as.data.frame() %>%
  rename(end_period_year = Year,
         age = `Age of Child (years and bands)`,
         level = `National - Regional - LA - Wards`,
         work_status = `Work Status`) %>%
  mutate(across(c(end_period_year, age, level), ~vec_fill_missing(.x, direction = c("down")))) %>%
  filter(age != "Unknown or missing",
         age != "Total", level != "Total", work_status != "Total")  %>% #theres nothing in the unknown/missing categories anyway
  mutate(end_period_year = paste(str_sub(end_period_year, 1, 2), str_sub(end_period_year, 6, 7), sep = "")) %>%
  mutate(age = as.numeric(age),
         end_period_year = as.numeric(end_period_year),
         count = as.numeric(count),
         end_period_month = "Unknown",
         period_length = "Year",
         level = ifelse(level == "West Midlands", "West Midlands (region)", level))


# i saved the ods as xlsx
# this is FINANCIAL YEAR END
p_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/children-in-low-income-families-local-area-statistics-2014-to-2022.xlsx",
                    sheet = 7, skip = 9)

poverty_1522 <- p_data %>% 
  filter(`Local Authority [note 2]` == "Birmingham") %>% 
  select(starts_with("Percentage")) %>% 
  pivot_longer(everything(),
               names_to = "end_period_year",
               values_to = "pc") %>% 
  mutate(end_period_year = str_extract(end_period_year, "[0-9]{4}")) %>% 
  mutate(measure = "HBAI",
         level = "Birmingham")

# %>% 
  # mutate(end_period_month = "FYE")




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # #NOT LOCAL - just to copy the trends for the mssing years # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Table 4.16ts: Percentage of children living in households with less than 60 per cent of contemporary median household income, by region and country, United Kingdom1,2,4
# these are rolling region/Country 3-year averages

p_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/hbai-2019-2020-tables-ods-files/children-hbai-timeseries-1994-95-2019-20-tables.xlsx",
  sheet = 20, skip = 6, n_max = 10)

poverty_9520 <- p_data %>% 
  filter(`...1` %in% c("England", "West Midlands")) %>% 
  rename(level = `...1`) %>% 
  pivot_longer(-level,
               names_to = "end_period_year",
               values_to = "pc") %>% 
  mutate(pc = pc/100) %>% 
  mutate(end_period_year = substr(end_period_year, nchar(end_period_year)-1, nchar(end_period_year))) %>% 
  mutate(end_period_year = as.numeric(ifelse(end_period_year > 30, paste("19", end_period_year, sep = ""), paste("20", end_period_year, sep = "")))) %>% 
  mutate(measure = "HBAI - 3 year rolling average")
  
  
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # #WARD LEVEL # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Table 4.16ts: Percentage of children living in households with less than 60 per cent of contemporary median household income, by region and country, United Kingdom1,2,4
# these are rolling region/Country 3-year averages

p_data <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/children-in-low-income-families-local-area-statistics-2014-to-2022.xlsx",
                      sheet = 11, skip = 10)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# im pretty unhappy with poverty measures as stands currently

poverty_06to12_15to21 <- p_data_count %>%
  bind_rows(poverty_data_1621 %>%
              group_by(end_period_month, end_period_year, period_length,
                       level) %>%
              summarise(count = sum(count))) %>%
  mutate(end_period_year = as.numeric(end_period_year)) %>%
  ungroup()
save(poverty_06to12_15to21, file = "Output/Data/Cleaned/poverty_06to12_15to21.Rdata")



poverty_15to21_workstatus_age <- poverty_data_1621 %>%
  filter(age <= 18)
save(poverty_15to21_workstatus_age, file = "Output/Data/Cleaned/poverty_15to21_workstatus_age.Rdata")
