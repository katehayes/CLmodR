no_db_init <- init_c %>% 
  pivot_wider(names_from = yjs,
              values_from = count) %>% 
  mutate(No_contact_with_YJS = No_contact_with_YJS + Known_to_police,
         Known_to_police = 0) %>% 
  pivot_longer(c( No_contact_with_YJS, Known_to_police, In_the_YJS, In_custody),
               names_to = "yjs",
               values_to = "count")


ic_no_db <- function(a = 10, p = 1, c = 1, s = 1, j = 1) {
  
  x <- new %>% 
    mutate(poverty = ifelse(poverty == "In_poverty", 2, 1),
           care = ifelse(care == "Never", 1, care),
           care = ifelse(care == "Not_residential", 2, care),
           care = ifelse(care == "Residential", 3, care),
           care = ifelse(care == "Prior", 4, care),
           school = ifelse(school == "Never", 1, school),
           school = ifelse(school == "PRU", 2, school),
           school = ifelse(school == "Prior", 3, school),
           yjs = ifelse(yjs == "No_contact_with_YJS", 1, yjs),
           yjs = ifelse(yjs == "In_custody", 4, yjs),
           yjs = ifelse(yjs == "Known_to_police", 2, yjs),
           yjs = ifelse(yjs == "In_the_YJS", 3, yjs),
           age = as.numeric(age),
           poverty = as.numeric(poverty),
           care = as.numeric(care),
           school = as.numeric(school),
           yjs = as.numeric(yjs))  %>% 
    ungroup() %>% 
    filter(age == a,
           poverty == p,
           care == c,
           school == s,
           yjs == j) %>% 
    select(count) %>% 
    unlist() %>% 
    unname()
  
  # if(j!=1){
  #   x<-0
  # }
  return(x)
  
}



t10_no_db <- function(p = 1, c = 1, s = 1, j = 1) {
  
  x <- new %>% 
    filter(age == 10) %>% 
    mutate(poverty = ifelse(poverty == "In_poverty", 2, 1),
           care = ifelse(care == "Never", 1, care),
           care = ifelse(care == "Not_residential", 2, care),
           care = ifelse(care == "Residential", 3, care),
           care = ifelse(care == "Prior", 4, care),
           school = ifelse(school == "Never", 1, school),
           school = ifelse(school == "PRU", 2, school),
           school = ifelse(school == "Prior", 3, school),
           yjs = ifelse(yjs == "No_contact_with_YJS", 1, yjs),
           yjs = ifelse(yjs == "In_custody", 4, yjs),
           yjs = ifelse(yjs == "Known_to_police", 2, yjs),
           yjs = ifelse(yjs == "In_the_YJS", 3, yjs),
           age = as.numeric(age),
           poverty = as.numeric(poverty),
           care = as.numeric(care),
           school = as.numeric(school),
           yjs = as.numeric(yjs))  %>% 
    ungroup() %>% 
    group_by(poverty) %>% 
    mutate(pc = count/sum(count)) %>% 
    ungroup() %>% 
    filter(poverty == p,
           care == c,
           school == s,
           yjs == j) %>% 
    select(pc) %>% 
    unlist() %>% 
    unname() 
  
  # if(j!=1){
  #   x<-0
  # }
  return(x)
  
}
