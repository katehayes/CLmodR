mutate(disposal_type = case_when(disposal_type == "Pre Court" ~ "Pre-court",
                                 disposal_type == "First Tier" ~ "First-tier",
                                 disposal_type == "Custody" ~ "Custody",
                                 disposal_type == "Community" ~ "Community")) %>%
  
  
  mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
                                 legal_basis == "Section 91" ~ "Section 90-92 Detention",
                                 legal_basis == "Other sentences(2)" ~ "Other",
                                 legal_basis == "Remand" ~ "Remand")) %>%
  
  
  mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
                                 legal_basis == "S90" ~ "Section 90-92 Detention",
                                 legal_basis == "S91" ~ "Section 90-92 Detention",
                                 legal_basis == "S226" ~ "Other",
                                 legal_basis == "S228" ~ "Other",
                                 legal_basis == "Remand" ~ "Remand")) %>%
  
  
  disposal_types <- c("Pre-court", "First-tier", "Community", "Custody")
  
  
  
  
  
  
  
  
  
  
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
  
  