
# save(care_pov, file = "output/data/processed/care_pov.Rdata")

# 
care_input <- care_pov %>%
# for now...... just to seeee
  filter(gender == "Boys")

# x <- ic_care(a = 17, p= 2, c= 2)
#   
# a <- 17
# p <- 2
# c <-2

# care_input <- mod_states %>%
#  filter(t == 52)
# save(care_input, file = "output/data/processed/care_input.Rdata")

care_input_small <- care_input %>% 
  # mutate(pc = count/sum(count)) %>% 
  mutate(tenpc = count*0.11,
         tenpc = ifelse(care == "Never", 0, tenpc),
         tenpc = ifelse(care == "Prior", count*0.2, tenpc)) %>% 
  group_by(age, poverty) %>% 
  mutate(shift = sum(tenpc)) %>% 
  mutate(count = ifelse(care == "Never", count+shift, count-tenpc)) %>% 
  select(t,count,age,poverty,care)

  
ic_care <- function(a = 10, p = 1, c = 1) {
  
  x <- care_input_small %>% 
    # filter(end_period_year == 2010) %>% 
    # select(-gender) %>%
    mutate(poverty = ifelse(poverty == "In poverty", 2, 1),
           care = ifelse(care == "Never", 1, care),
           care = ifelse(care == "Not residential", 2, care),
           care = ifelse(care == "Residential", 3, care),
           care = ifelse(care == "Prior", 4, care),
           age = as.numeric(age),
           poverty = as.numeric(poverty),
           care = as.numeric(care)) %>% 
    ungroup() %>% 
    filter(age == a,
           poverty == p,
           care == c) %>% 
    select(count) %>% 
    unlist() %>% 
    unname()
  
  # if(j!=1){
  #   x<-0
  # }
  return(x)
  
}


check <- t10(p = 2, c= 4)

t10 <- function(p = 1, c = 1) {
  
  x <- care_input %>% 
    filter(age == 10,
           end_period_year == 2010) %>% 
    mutate(state = ifelse(state == "In poverty", 2, 1),
           care = ifelse(care == "Never", 1, care),
           care = ifelse(care == "Not residential", 2, care),
           care = ifelse(care == "Residential", 3, care),
           care = ifelse(care == "Prior", 4, care),
           age = as.numeric(age),
           state = as.numeric(state),
           care = as.numeric(care))  %>% 
    ungroup() %>% 
    group_by(state) %>% 
    mutate(pc = count/sum(count)) %>% 
    ungroup() %>% 
    filter(state == p,
           care == c) %>% 
    select(pc) %>% 
    unlist() %>% 
    unname() 
  
  # if(j!=1){
  #   x<-0
  # }
  return(x)
  
}


