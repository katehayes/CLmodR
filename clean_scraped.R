install.packages("DiagrammeR")
library(DiagrammeR)

vru_project_data_nov

so the info we have here is:
  
Funding Source

Budget - different budgets  
Location (LA)

Agreement type (grant or contract - this is maybe represented by different types of arrow?)

Project provider

Project name 

Project Status (this is just a colour i feel on the end node)


check <- vru_project_data_nov %>% 
  distinct(Funding_Source_Mine, Office_Budget_Mine, Provider_Organisation_Name)

check <- vru_project_data_nov %>% 
  distinct(Office_Budget_Mine, Provider_Organisation_Name, Project_Name)


class(vru_project_data_nov$Total_Split)

money <- vru_project_data_nov %>% 
  filter(Year != "Total",
         Location_Solo == "Birmingham") %>% 
  select(c("Year", ends_with("Mine"), ends_with("Name"), "Agreement_Type", "Total_Split", "F2022_23_Split", "F2023_24_Split", "F2024_25_Split")) %>% 
  group_by(Funding_Source_Mine, Office_Budget_Mine, Provider_Organisation_Name, Project_Name) %>% 
  summarise(funding = sum(Total_Split)) 



check <- money %>% 
  distinct(Agreement_Type)
# 



