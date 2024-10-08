ic <- function(a = 10, p = 1, c = 1, s = 1, j = 1, data = init_c) {
  
  # seems to want a tbl_df as the data input
  
  # returns a number - the initial size of the population of that state 
  
  x <- data %>% 
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


# check <- ic(a=10, p=1, c=1, s=1, j=1, data = new)
# check <- t10(p=2, c=1, s=1, j=1)



t10 <- function(p = 1, c = 1, s = 1, j = 1, data = init_c) {
  
  # seems to want a tbl_df as the data input
  
  # returns a number between 0 and 1
  # number represents..
  
  x <- data %>% 
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
