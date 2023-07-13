

no_comma <- function(x) {
  x <- str_replace(x, ",", "")
}

not_all_na <- function(x) {
  any(!is.na(x))
}


yes_all_na <- function(x) {
  all(is.na(x))
}

not_na <- function(x) {
 !is.na(x)
}



exactly_one_na <- function(x) {
 i <- detect_index(x, not_na, .dir = "backward")
 if(i == 1) {
   return(TRUE)
 } else {
   return(FALSE)
 }
}


# so far using this for disposal and remand data
# with this function you still have to read in the column headings from the data
# in the right format - n_max = 1, col_names = TRUE
get_colname <- function(rem_data, dat_type) {

  rem_data <- rem_data %>%
    select(where(not_all_na)) %>%
    pivot_longer(cols = everything(), names_to = "group", values_to = "group_value",
                 names_transform = as.character, values_transform = as.character) %>%
    mutate(group = replace(group, grepl('[0-9]', group), NA)) %>%
    mutate(group = vec_fill_missing(group, direction = c("down")))

  col_names <- paste(unlist(rem_data[, 1]), unlist(rem_data[, 2]), sep = "_")

  if(grepl("NA_", col_names[1])) {
    col_names = c(dat_type, col_names[2:length(col_names)])
  } else {
    col_names = c(dat_type, col_names)
  }

  return(col_names)

}






##-------------####DISPOSAL DATA####--------------------------------------------------------------------
##-------------09/10 to 13/14--------------------------------------------------------------------

clean_disposal_09to14 <- function(disp_data, col_nm, disp_type, current_end_year, current_end_month, current_period_length, current_level) {
    disp_data <- disp_data %>%
      select(where(not_all_na))

    names(disp_data) <- col_nm

    disp_data <- disp_data[, 1:14] %>% # dropped the total columnn in v ugly manner here
      mutate(disposal_type = if_else(disposal %in% disp_type, disposal, "")) %>%
      mutate(disposal_type = replace(disposal_type, disposal_type == "", NA)) %>%
      mutate(disposal_type = vec_fill_missing(disposal_type, direction = c("down"))) %>%
      filter(!is.na(`Age_15`)) %>%
      mutate(end_period_year = current_end_year,
             end_period_month = current_end_month,
             period_length = current_period_length,
             level = current_level)
}

#new version - splits the dataset into the three groups and returns them in a list
# exact same as split remand - should merge them
split_disposal_09to14 <- function(disp_data, current_group_types) {
  disp_data_split <- list()
  i <- 1
  for (group in current_group_types)  {
    if (any(grepl(group, names(disp_data)))) {
      disp_data_split[[i]] <- disp_data %>%
        select(end_period_year, end_period_month, period_length, level, disposal_type, disposal, starts_with(group)) %>%
        pivot_longer(cols = starts_with(group), names_to = tolower(group), values_to = "count") %>%
        mutate(across(starts_with(tolower(group)), str_replace, pattern = paste(group,"_", sep = ""), replacement = ""))
      i = i+1
    }
  }
  return(disp_data_split)
}


##-------------14/15 and 15/16--------------------------------------------------------------------
clean_disposal_1415 <- function(disp_data) {
  disp_data[, -8] %>%
    mutate(end_period_year = 2015,
           end_period_month = "Unknown",
           period_length = "Year") %>%
    rename(yot = YOT, region = Region,
           disposal = Outcome, age = Age, ethnicity = Ethn,
           gender = Gen, count = Count)
}


clean_disposal_1415_ew <- function(disp_data) {
  disp_data[, -8] %>%
    mutate(level = ifelse(Region == "Wales", "Wales", "England")) %>%
    group_by(level, Outcome, Age, Ethn, Gen) %>%
    summarise(Count = sum(Count)) %>%
    mutate(end_period_year = 2015,
           end_period_month = "Unknown",
           period_length = "Year") %>%
    rename(disposal = Outcome, age = Age, ethnicity = Ethn,
           gender = Gen) %>%
    pivot_wider(names_from = level, values_from = Count,
                values_fill = 0) %>%
    mutate(`Eng/Wales` = England + Wales) %>%
    pivot_longer(cols = c(`Eng/Wales`, England, Wales),
                 names_to = "level", values_to = "count")
}

clean_disposal_1516 <- function(disp_data) {
  disp_data[, -8] %>%
    mutate(end_period_year = 2016,
           end_period_month = "Unknown",
           period_length = "Year") %>%
    rename(yot = YOT2, region = Region,
           disposal = OutRevised, age = Age_Revised, ethnicity = Ethnicity,
           gender = Gen, count = CountOfSent_Out_ID)
}

clean_disposal_1516_ew <- function(disp_data) {
  disp_data[, -8] %>%
    mutate(level = ifelse(Region == "Wales", "Wales", "England")) %>%
    group_by(level, OutRevised, Age_Revised, Ethnicity, Gen) %>%
    summarise(CountOfSent_Out_ID = sum(CountOfSent_Out_ID)) %>%
    mutate(end_period_year = 2016,
           end_period_month = "Unknown",
           period_length = "Year") %>%
    rename(disposal = OutRevised, age = Age_Revised, ethnicity = Ethnicity,
           gender = Gen) %>%
    pivot_wider(names_from = level, values_from = CountOfSent_Out_ID,
                values_fill = 0) %>%
    mutate(`Eng/Wales` = England + Wales) %>%
    pivot_longer(cols = c(`Eng/Wales`, England, Wales),
                 names_to = "level", values_to = "count")
}

split_disposal_14to16 <- function(disp_data) { # returns list of lists
  disp_data_split_wm <- list()
  disp_data_split_b <- list()
  group_types <- alist(age, gender, ethnicity)
  i <- 1
  for (group in group_types) {

    disp_data_split_wm[[i]] <- disp_data %>%
      group_by(region, yot, disposal, !!group) %>%
      mutate(count = sum(count)) %>%
      distinct(end_period_year, end_period_month, period_length, region, yot, disposal, !!group, count) %>%
      mutate(level = "West Midlands (region)") %>%
      filter(region == "West Midlands") %>%
      group_by(disposal, !!group) %>%
      mutate(count = sum(count)) %>%
      distinct(end_period_year, end_period_month, period_length, level, disposal, !!group, count)

    disp_data_split_b[[i]] <- disp_data %>%
      mutate(level = "Birmingham") %>%
      filter(yot == "Birmingham") %>%
      group_by(disposal, !!group) %>%
      mutate(count = sum(count)) %>%
      distinct(end_period_year, end_period_month, period_length, level, disposal, !!group, count)

    i <- i+1
  }

  return(list(disp_data_split_wm, disp_data_split_b))
}


split_disposal_14to16_ew <- function(disp_data) { # returns list of lists
     disp_data_split_ew <- list()
     disp_data_split_e <- list()
     disp_data_split_w <- list()
     group_types <- alist(age, gender, ethnicity)
     i <- 1
       for (group in group_types) {

         disp_data_split_ew[[i]] <- disp_data %>%
           filter(level == "Eng/Wales") %>%
           group_by(disposal, !!group) %>%
           mutate(count = sum(count)) %>%
           distinct(end_period_year, end_period_month, period_length, level, disposal, !!group, count)

         disp_data_split_e[[i]] <- disp_data %>%
           filter(level == "England") %>%
           group_by(disposal, !!group) %>%
           mutate(count = sum(count)) %>%
           distinct(end_period_year, end_period_month, period_length, level, disposal, !!group, count)

         disp_data_split_w[[i]] <- disp_data %>%
           filter(level == "Wales") %>%
           group_by(disposal, !!group) %>%
           mutate(count = sum(count)) %>%
           distinct(end_period_year, end_period_month, period_length, level, disposal, !!group, count)

    i <- i+1

    }

return(list(disp_data_split_ew, disp_data_split_e, disp_data_split_w))
}

##-------------16/17--------------------------------------------------------------------

clean_and_split_disposal_1617 <- function(disp_data) {
  disp_data_split_wm <- list()
  group_types <- c("age", "gender", "ethnicity")

   i <- 1
   j <- 1
   k <- j+3

  for (group in group_types) {

    data_splitting <- disp_data[, j:k]
    colnames(data_splitting)[1] <- "region"
    colnames(data_splitting)[2] <- group
    colnames(data_splitting)[3] <- "disposal"
    colnames(data_splitting)[4] <- "count"

    disp_data_split_wm[[i]] <- data_splitting %>%
      filter(region == "West Midlands") %>%
      mutate(level = "West Midlands (region)",
             end_period_year = 2017,
             end_period_month = "Unknown",
             period_length = "Year") %>%
      select(-region)

    if (i == 1) {
     disp_data_split_wm[[i]] <- disp_data_split_wm[[i]] %>%
       mutate(age = sub("\\(1\\)", "", age))
    }

    i <- i+1
    j <- j+5
    k <- j+3
  }

return(disp_data_split_wm)

}




clean_and_split_disposal_1617_ew <- function(disp_data) {
  disp_data_split_ew <- list()
  disp_data_split_e <- list()
  disp_data_split_w <- list()
  group_types <- alist(age, gender, ethnicity)

  i <- 1
  j <- 1
  k <- j+3

  for (group in group_types) {

    data_splitting <- disp_data[, j:k]
    colnames(data_splitting)[1] <- "region"
    colnames(data_splitting)[2] <- as.character(group)
    colnames(data_splitting)[3] <- "disposal"
    colnames(data_splitting)[4] <- "count"

    data_splitting <- data_splitting %>%
      mutate(level = ifelse(region == "Wales", "Wales", "England")) %>%
      filter(!is.na(level)) %>%
      select(-region) %>%
      group_by(!!group, level, disposal) %>%
      summarise(count = sum(count)) %>%
      pivot_wider(names_from = level, values_from = count,
                  values_fill = 0) %>%
      mutate(`Eng/Wales` = England + Wales) %>%
      pivot_longer(cols = c(`Eng/Wales`, England, Wales),
                   names_to = "level", values_to = "count") %>%
      mutate(end_period_year = 2017,
             end_period_month = "Unknown",
             period_length = "Year")

    if (i == 1) {
      data_splitting <- data_splitting %>%
        mutate(age = sub("\\(1\\)", "", age))
    }


    disp_data_split_ew[[i]] <- data_splitting %>%
      filter(level == "Eng/Wales")
    disp_data_split_e[[i]] <- data_splitting %>%
      filter(level == "England")
    disp_data_split_w[[i]] <- data_splitting %>%
      filter(level == "Wales")



    i <- i+1
    j <- j+5
    k <- j+3
  }

  return(list(disp_data_split_ew, disp_data_split_e, disp_data_split_w))

}



##-------------most recent data--------------------------------------------------------------------

clean_disposal_13to21 <- function(disp_data) {
  disp_data <- disp_data %>%
    rename(end_period_year = Financial_Year,
           disposal = Caution_or_sentence_type,
           disposal_type = Caution_or_sentence_tier,
           count = Number_Cautioned_Sentenced) %>%
    mutate(disposal_type = case_when(disposal_type == "Pre Court" ~ "Pre-court",
                                     disposal_type == "First Tier" ~ "First-tier",
                                     disposal_type == "Custody" ~ "Custody",
                                     disposal_type == "Community" ~ "Community")) %>%
    filter(Region == "West Midlands") %>%
    select(!Region:England_Wales) %>%
    pivot_wider(names_from = YJS, values_from = count, values_fill = 0) %>%
    mutate(`West Midlands (region)` = rowSums(across(Birmingham:Wolverhampton))) %>%
    select(!Coventry:Wolverhampton) %>%
    pivot_longer(cols = Birmingham:`West Midlands (region)`, names_to = "level", values_to = "count") %>%
    mutate(end_period_year = as.numeric(substr(end_period_year, 1, 4)) + 1,
           end_period_month = "Unknown",
           period_length = "Year")
}

clean_disposal_13to21_ew <- function(disp_data) {
  disp_data <- disp_data %>%
    rename(end_period_year = Financial_Year,
           disposal = Caution_or_sentence_type,
           disposal_type = Caution_or_sentence_tier,
           count = Number_Cautioned_Sentenced) %>%
    mutate(disposal_type = case_when(disposal_type == "Pre Court" ~ "Pre-court",
                                     disposal_type == "First Tier" ~ "First-tier",
                                     disposal_type == "Custody" ~ "Custody",
                                     disposal_type == "Community" ~ "Community")) %>%
    group_by(England_Wales, end_period_year, disposal, disposal_type) %>%
    summarise(count = sum(count)) %>%
    pivot_wider(names_from = England_Wales, values_from = count,
                values_fill = 0) %>%
    mutate(`Eng/Wales` = England + Wales) %>%
    pivot_longer(cols = c(England, Wales, `Eng/Wales`),
                 names_to = "level", values_to = "count") %>%
    mutate(end_period_year = as.numeric(substr(end_period_year, 1, 4)) + 1,
           end_period_month = "Unknown",
           period_length = "Year")
}

##-------------####rREMAND DATA####--------------------------------------------------------------------
##-------------###chapter 6###--------------------------------------------------------------------

clean_remand <- function(rem_data, col_nm, rem_type, current_level,
                         current_end_year, current_end_month, current_period_length) {
  rem_data <- rem_data %>%
    select(where(not_all_na))

  names(rem_data) <- col_nm

  rem_data <- rem_data[, 1:(length(rem_data)-1)] %>% # dropped the total columnn in better manner here
    mutate(remand_type = if_else(remand %in% rem_type, remand, "")) %>%
    mutate(remand_type = replace(remand_type, remand_type == "", NA)) %>%
    mutate(remand_type = vec_fill_missing(remand_type, direction = c("down"))) %>%
    filter(!is.na(.[[2]])) %>% # also made this more flexible which is good
    mutate(end_period_year = current_end_year,
           end_period_month = current_end_month,
           period_length = current_period_length,
           level = current_level)
}

# note this function is updated to work on longer group lists - might need to go back
# and do the same to previous functions in the disposal section
split_remand <- function(rem_data, current_group_types) {
  rem_data_split <- list()
  i <- 1

  rem_data <- rem_data %>%
    filter(!(grepl("Total", remand)))

  for (group in current_group_types)  {
    if (any(grepl(group, names(rem_data)))) {
      rem_data_split[[i]] <- rem_data %>%
        select(end_period_year, end_period_month, period_length, level, remand_type, remand, starts_with(group)) %>%
        pivot_longer(cols = starts_with(group), names_to = tolower(group), values_to = "count") %>%
        mutate(across(starts_with(tolower(group)), str_replace, pattern = paste(group,"_", sep = ""), replacement = ""))
      i = i+1
    }
  }
  return(rem_data_split)
}


# diff functions for different types of remand data?
# the different remand types - like custodial, non custodial, whatever
# this is at country level, highest level of aggregation

# THIS LINE filter(!is.na(.[[2]])) was accidentally filtering one annoying row!!
# maybe go back and change this everywhere since you use it often

clean_remand_types <- function(rem_data) {

  rem_list <- as.list(rem_data)
  first_na_col <- detect_index(rem_list, yes_all_na)

  rem_data <- rem_data[, 1:(first_na_col-1)]
  colnames(rem_data)[1] <- "remand"

  rem_data <- rem_data %>%
    mutate(remand_type = if_else(remand %in% remand_types, remand, "")) %>%
    mutate(remand_type = replace(remand_type, remand_type == "", NA)) %>%
    mutate(remand_type = vec_fill_missing(remand_type, direction = c("down"))) %>%
    mutate(one_na = lapply(split(rem_data[, 1:(ncol(rem_data)-1)], seq(nrow(rem_data))), exactly_one_na)) %>%
    filter(one_na == FALSE) %>%
    select(-one_na) %>%
    filter(if_any(c(1:(ncol(.)-1)), ~ !is.na(.))) %>%
    filter(!grepl("Total", remand)) %>%
    pivot_longer(cols = starts_with("20"), names_to = "end_period_year", values_to = "count",
                 names_transform = as.character, values_transform = as.numeric) %>%
    mutate(remand = sub("\\(2\\)", "", remand),
           level = "Eng/Wales",
           end_period_year = as.numeric(end_period_year),
           end_period_month = "Unknown",
           period_length = "Year")

}



# cleaning the outcomes bit
# should change a lot of this probably - like the first like,
# instead just drop any row where the first col is NA or sonethibng
clean_remand_outcomes <- function(rem_data) {

rem_data <- rem_data[-1, ] %>%
  rename(outcome = `...1`) %>%
  mutate(outcome = sub("\\(7\\)", "", outcome)) %>%
  mutate(outcome = sub(" \\(e\\)", "", outcome)) %>%
  mutate(outcome = sub("\\(9\\)", "", outcome)) %>%
  mutate(outcome = replace(outcome, outcome == "Community sentence", "Non-custodial sentence - community")) %>%
  mutate(outcome = replace(outcome, outcome == "Other sentence", "Non-custodial sentence - other")) %>%
  filter(outcome != "Non-custodial sentence", outcome != "Of which:") %>%
  mutate(court_type = if_else(outcome %in% court_types, outcome, "")) %>%
  mutate(court_type = replace(court_type, court_type == "", NA)) %>%
  mutate(court_type = vec_fill_missing(court_type, direction = c("down"))) %>%
  filter(!is.na(.[[2]])) %>%
  pivot_longer(cols = starts_with("20"), names_to = "end_period_year", values_to = "count",
               names_transform = as.character, values_transform = as.numeric) %>%
  mutate(level = "Eng/Wales",
          end_period_year = as.numeric(end_period_year),
          end_period_month = "Unknown",
          period_length = "Year")

}

##-------------###chapter 7###--------------------------------------------------------------------
# changed some of the level labels so it looks nicer graphed
# used to be called clean_remand_ch7 - for the latest figures 2011/12 to 21
clean_avpop_ch7 <- function(rem_data, current_end_month, current_period_length) {

    rem_data <- rem_data %>%
      rename(region_yjs = `Region of home Youth Justice Service(1)`, legal_basis = `Legal basis`) %>%
      mutate(legal_basis= vec_fill_missing(legal_basis, direction = c("down"))) %>%
      pivot_longer(starts_with("20"),
                   names_to="end_period_year",
                   values_to="count") %>%
      pivot_wider(names_from = region_yjs, values_from = count) %>%
      rename(`Eng/Wales` = Total) %>%
      pivot_longer(cols = -c(end_period_year, legal_basis),
                   names_to="level",
                   values_to="count") %>%
      filter(level == "Eng/Wales" | level == "West Midlands") %>%
      mutate(level = ifelse(level == "West Midlands", "West Midlands (region)", level)) %>%
      mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
                                     legal_basis == "Section 91" ~ "Section 90-92 Detention",
                                     legal_basis == "Other sentences(2)" ~ "Other",
                                     legal_basis == "Remand" ~ "Remand")) %>%
      mutate(end_period_year = as.numeric(end_period_year)) %>%
      mutate(`end_period_month` = current_end_month,
             `period_length` = current_period_length)

}



# ACTUALLY A PROCESSING FUNCTION NOT A CLEANING FUNCTION,,,,,, COME BACK HERE & FIX
# for the process of getting av pop in 2009/10 and 2010/11
get_wm_pc <- function(wm_pc) { #for this you have to read int the data in matching format

wm_pc <- wm_pc %>%
  filter(`Region of Origin` == "Total" |
           `Region of Origin` == "West Midlands") %>%
  select(`Region of Origin`, Average) %>%
  pivot_wider(names_from = `Region of Origin`, values_from = Average) %>%
  summarise(pc = `West Midlands` / Total) %>%
  unlist()

}



# OLD FUNCTION FROM BEFORE THE CLEANED/PROCESSED DATA SPLIT
# clean_avpop_ch7_09to11 <- function(rem_data, current_year) {
#
#   colnames(rem_data)[1] <- "legal_basis"
#   colnames(rem_data)[8] <- "Eng/Wales"
#
#   rem_data <- rem_data %>%
#     select(legal_basis, `Eng/Wales`) %>%
#     filter(!is.na(legal_basis)) %>%
#     filter(legal_basis != "S90/91/226/228 Combined") %>%
#     mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
#                                    legal_basis == "S90" ~ "Section 90-92 Detention",
#                                    legal_basis == "S91" ~ "Section 90-92 Detention",
#                                    legal_basis == "S226" ~ "Other",
#                                    legal_basis == "S228" ~ "Other",
#                                    legal_basis == "Remand" ~ "Remand")) %>%
#     group_by(legal_basis) %>%
#     summarise(`Eng/Wales` = sum(`Eng/Wales`)) %>%
#     mutate(year = current_year) %>%
#     mutate(`Adjusted to West Midlands` = `Eng/Wales`*wm_pc)
#
#
# }


clean_avpop_ch7_09to11 <- function(rem_data, current_end_year, current_end_month, current_period_length) {

  colnames(rem_data)[1] <- "legal_basis"
  colnames(rem_data)[8] <- "Eng/Wales"

  rem_data <- rem_data %>%
    select(legal_basis, `Eng/Wales`) %>%
    filter(!is.na(legal_basis)) %>%
    filter(legal_basis != "S90/91/226/228 Combined") %>%
    mutate(legal_basis = case_when(legal_basis == "DTO" ~ "Detention and Training Order",
                                   legal_basis == "S90" ~ "Section 90-92 Detention",
                                   legal_basis == "S91" ~ "Section 90-92 Detention",
                                   legal_basis == "S226" ~ "Other",
                                   legal_basis == "S228" ~ "Other",
                                   legal_basis == "Remand" ~ "Remand")) %>%
    group_by(legal_basis) %>%
    summarise(`Eng/Wales` = sum(`Eng/Wales`)) %>%
    mutate(`end_period_year` = current_end_year,
           `end_period_month` = current_end_month,
           `period_length` = current_period_length) %>%
    pivot_longer(`Eng/Wales`, names_to = "level", values_to = "count")


}

##-------------###care data###--------------------------------------------------------------------

clean_remand_care <- function(rem_data, char, time_slice) { #have to do characteristics one by one

  rem_data <- rem_data %>%
  filter(characteristic == char) %>%
  select(-c(time_identifier, country_code, region_code, old_la_code,
            new_la_code, cla_group, percentage)) %>%
  rename(level = geographic_level, reason = characteristic, year = time_period, count = number) %>%
  mutate(level = case_when(level == "National" ~ country_name,
                           level == "Regional" ~ region_name,
                           level == "Local authority" ~ la_name)) %>%
  select(-c(country_name, region_name, la_name)) %>%
  filter(level == "England" | level == "West Midlands" | level == "Birmingham") %>%
  mutate(slice = time_slice)

}


##-------------###CLEANING DURATION DATA###--------------------------------------------------------------------
##-------------###for remand and custodial sentences###--------------------------------------------------------------------
# to-do: carry everythign over from the timings script




##-------------###CLEANING children DATA###--------------------------------------------------------------------
##-------------###because disposals doesnt count children it counts disposals###--------------------------------------------------------------------

clean_children_13to21 <- function(c_data) {
  c_data <- c_data %>%
    rename(end_period_year = Financial_Year,
           age = Age_Group,
           ethnicity = Ethnicity_Group,
           gender = Sex,
           count = Number_Children)

  c_data_ew <- c_data %>%
    group_by(end_period_year, age, gender, ethnicity) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Eng/Wales")

  c_data_wm <- c_data %>%
    filter(Region == "West Midlands") %>%
    group_by(end_period_year, age, gender, ethnicity) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "West Midlands (region)")

  c_data_birm <- c_data %>%
    filter(YJS == "Birmingham") %>%
    group_by(end_period_year, age, gender, ethnicity) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Birmingham")

  c_data <- c_data_ew %>%
    bind_rows(c_data_wm) %>%
    bind_rows(c_data_birm) %>%
    mutate(end_period_year = as.numeric(substr(end_period_year, 1, 4))) %>%
    mutate(end_period_year = end_period_year + 1) %>%  # PUSH YEAR UP AS IS NOW MY STANDARD
    mutate(end_period_month = "Unknown",
           period_length = "Year")
  return(c_data)
}



clean_children_11to13 <- function(c_data,
                                  current_end_year, current_end_month, current_period_length) {

  c_data_age <- c_data %>%
    select(c(Region, YOT, `10-14`, `15`, `16`, `17+`)) %>%
    pivot_longer(-c(Region, YOT),
                 names_to = "age", values_to = "count")

  c_data_age_ew <- c_data_age %>%
    group_by(age) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Eng/Wales")

  c_data_age_wm <- c_data_age %>%
    filter(Region == "West Midlands") %>%
    group_by(age) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "West Midlands (region)")

  c_data_age_birm <- c_data_age %>%
    filter(YOT == "Birmingham") %>%
    group_by(age) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Birmingham")

  c_data_age <- c_data_age_ew %>%
    bind_rows(c_data_age_wm) %>%
    bind_rows( c_data_age_birm) %>%
    mutate(end_period_year = current_end_year,
           end_period_month = current_end_month,
           period_length = current_period_length)


  c_data_sex <- c_data %>%
    select(c(Region, YOT, Female, Male, `Not Known...10`)) %>%
    rename(`Not Known` = `Not Known...10`) %>%
    pivot_longer(-c(Region, YOT),
                 names_to = "gender", values_to = "count")

  c_data_sex_ew <- c_data_sex %>%
    group_by(gender) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Eng/Wales")

  c_data_sex_wm <- c_data_sex %>%
    filter(Region == "West Midlands") %>%
    group_by(gender) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "West Midlands (region)")

  c_data_sex_birm <- c_data_sex %>%
    filter(YOT == "Birmingham") %>%
    group_by(gender) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Birmingham")

  c_data_sex <- c_data_sex_ew %>%
    bind_rows(c_data_sex_wm) %>%
    bind_rows( c_data_sex_birm) %>%
    mutate(end_period_year = current_end_year,
           end_period_month = current_end_month,
           period_length = current_period_length)

  c_data_eth <- c_data %>%
    select(c(Region, YOT, White, Mixed, `Asian or Asian British`,
             `Black or Black British`, `Chinese or Other Ethnic Group`,
             `Not Known...17`)) %>%
    rename(`Unknown` = `Not Known...17`) %>%
    pivot_longer(-c(Region, YOT),
                 names_to = "ethnicity", values_to = "count")


  c_data_eth_ew <- c_data_eth %>%
    group_by(ethnicity) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Eng/Wales")

  c_data_eth_wm <- c_data_eth %>%
    filter(Region == "West Midlands") %>%
    group_by(ethnicity) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "West Midlands (region)")

  c_data_eth_birm <- c_data_eth %>%
    filter(YOT == "Birmingham") %>%
    group_by(ethnicity) %>%
    summarise(count = sum(count)) %>%
    mutate(level = "Birmingham")

  c_data_eth <- c_data_eth_ew %>%
    bind_rows(c_data_eth_wm) %>%
    bind_rows( c_data_eth_birm) %>%
    mutate(end_period_year = current_end_year,
           end_period_month = current_end_month,
           period_length = current_period_length)


  c_data_split <- list()
  c_data_split[[1]] <- c_data_age
  c_data_split[[2]] <- c_data_sex
  c_data_split[[3]] <- c_data_eth
  return(c_data_split)
}



##-------------###CLEANING ARREST DATA###--------------------------------------------------------------------
##-------------###because disposals doesnt count children it counts disposals###--------------------------------------------------------------------



# VERY UNFINISHED
get_arrest_table <- function(text) {
  # split the text into a one raw text matrix
  text_matrix <- text %>% str_split("\\n", simplify = TRUE)


  # locate the start and end of the table
  table_start <- text_matrix %>%
    str_which("Age             2010/11 2011/12 2012/13 2013/14 2014/15 2015/16 2016/17 2017/18")
  table_end <- text_matrix %>%
    str_which("Grand Total       792     727     713     486     494     545     670     532")

  # extract table text, replace space with "|"
  table_raw <- text_matrix[1, (table_start + 1):(table_end - 1)] %>%
    str_replace_all("\\s{2,}", "|")

  # creat text connection so that the text can be read back with read.csv()
  table <- table_raw %>%
    textConnection() %>%
    read.csv(sep = "|") %>%
    as_tibble()

  table
}



##------##------##------##------##------##------##------##------##------##------##------##------##------##------##------
##-------------###CLEANING STOP AND SEARCH SPATIAL DATA###--------------------------------------------------------------------
##------##------##------##------##------##------##------##------##------##------##------##------##------##------##------

extract_ss <- function(common_path, file_pattern = "-west-midlands-stop-and-search.csv$") {

  files_to_read <- list.files(
    path = common_path,        # directory to search within
    pattern = file_pattern,
    recursive = TRUE,          # search subdirectories
    full.names = TRUE          # return the full path
  )

  # In this case, if the root cause is reading a 0-row csv file,
  # I think the solution is to fix the problem upstream by (e.g.) using
  # col_types in readr::read_csv() to ensure that even
  # empty data frames get the correct column types.

  ss_geom <- lapply(files_to_read, read_csv, col_types = cols(`Outcome linked to object of search` = col_character())) %>%
    bind_rows()

  return(ss_geom)

}




lonlat_to_lsoa <- function(ss_sf,
                           LSOA_shape = lsoa_shape,
                           name_col = "LSOA11NM") {
  lsoa_trans <- st_transform(lsoa_shape, crs = 3857)
  ss_trans <- st_transform(ss_sf, crs = 3857)
  lsoa_names <- lsoa_trans[[name_col]]
  ii <- as.integer(st_intersects(ss_trans, lsoa_trans))
  lsoa_names[ii]
}


lonlat_to_lsoashape <- function(ss_sf,
                                LSOA_shape = lsoa_shape,
                                shape_col = "geometry") {
  lsoa_trans <- st_transform(lsoa_shape, crs = 3857)
  ss_trans <- st_transform(ss_sf, crs = 3857)
  shape <- lsoa_trans[[shape_col]]
  ii <- as.integer(st_intersects(ss_trans, lsoa_trans))
  shape[ii]
}





#
#
# lonlat_to_lsoa <- function(ss_sf,
#                          LSOA_shape = lsoa_shape,
#                          name_col = "LSOA21NM") {
#
#   lsoa_trans <- st_transform(lsoa_shape, crs = 3857)
#   ss_trans <- st_transform(ss_sf, crs = 3857)
#
#   lsoa_names <- lsoa_trans[[name_col]]
#
#   ii <- as.integer(st_intersects(ss_trans, lsoa_trans))
#   lsoa_names[ii]
#
# }


# lonlat_to_ward <- function(ss_sf,
#                            ward_shape = w_shape,
#                            name_col = "WD22NM") {
#
#   ward_trans <- st_transform(ward_shape, crs = 3857)
#   ss_trans <- st_transform(ss_sf, crs = 3857)
#
#   ward_names <- ward_trans[[name_col]]
#
#   ii <- as.integer(st_intersects(ss_trans, ward_trans))
#   ward_names[ii]
#
# }
#
#
# lonlat_to_LA <- function(ss_sf,
#                          ward_shape = w_shape,
#                          name_col = "LAD22NM") {
#
#   ward_trans <- st_transform(ward_shape, crs = 3857)
#   ss_trans <- st_transform(ss_sf, crs = 3857)
#
#   ward_names <- ward_trans[[name_col]]
#
#   ii <- as.integer(st_intersects(ss_trans, ward_trans))
#   ward_names[ii]
#
# }

# lonlat_to_shape <- function(ss_sf,
#                          ward_shape = w_shape,
#                          shape_col = "geometry") {
#
#   ward_trans <- st_transform(ward_shape, crs = 3857)
#   ss_trans <- st_transform(ss_sf, crs = 3857)
#
#   ward_shape <- ward_trans[[shape_col]]
#
#   ii <- as.integer(st_intersects(ss_trans, ward_trans))
#   ward_shape[ii]
#
# }



# function that goes through the CSV files
# makes note of the missingness of the age info (CHANGE THIS TO among the person searches!!!)
# converts everything into as above, date gender reason outcome ward location

ss_clean <- function(raw_list) {

  clean_list <- list()

  for (i in 1:length(raw_list)) {

    ss <- raw_list[[i]]

    ss_na <- ss %>%
      mutate(Age.range = ifelse(Age.range == "", NA, Age.range))

    pc <- colMeans(is.na(ss_na))
    age_pc <- pc[["Age.range"]]
    # missing overall, not among birmingham non-vehicle searches...
    # maybe you should change that

    sssf <- st_as_sf(ss, coords = c("Longitude", "Latitude"), crs = 4326)
    sssf$LA <- lonlat_to_LA(ss_sf = sssf)


    ss_birm <- sssf %>%
      filter(LA == "Birmingham",
             Type == "Person search",
             Age.range == "10-17")

    ss_birm$lsoa <- lonlat_to_lsoa(ss_sf = ss_birm)
    ss_birm$ward <- lonlat_to_ward(ss_sf = ss_birm)

    ss_birm <- ss_birm %>%
      mutate(Date = as.Date(Date)) %>%
      select(Date, Gender, Object.of.search, Outcome, ward, lsoa) %>%
      rename(date = Date, gender = Gender, reason = Object.of.search, outcome = Outcome) %>%
      mutate(age_missing_pc = age_pc)


    clean_list[[i]] <- ss_birm

  }

  return(clean_list)

}


fix_list <- function(x) {
  y <- list()
  i <- 1
  x <- as.character(x)
  while (grepl("[A-Za-z]", x)) {

    if(grepl("[A-Za-z]", str_extract(x, "[^\\d]+"))){
      y[[i]]  <- str_extract(x, "[^\\d]+")
      x <- str_remove(x, "[^\\d]+")
      i <- i + 1
    }else{
      x <- str_remove(x, "[\\d]+")
    }

  }
  return(y)
}


fix_miss_list <- function(x) {


  y <- list()
  i <- 1

  m_data <- tibble()

  x1 <- as.character(x)
  x2 <- as.character(x)

  while (grepl("[A-Za-z]", x1)) {

    if(grepl("[A-Za-z]", str_extract(x1, "[^\\d]+"))){
      m_data[i,1]  <- str_extract(x1, "[^\\d]+")
      x1 <- str_remove(x1, "[^\\d]+")
      i <- i + 1
    }else{
      x1 <- str_remove(x1, "[\\d]+")
    }
  }

  i <- 1

  while (grepl("[0-9]", x2)) {

    if(grepl("[0-9]", str_extract(x2, "[\\d]+"))){
      y[[i]]  <- str_extract(x2, "[\\d]+")
      x2 <- str_remove(x2, "[\\d]+")
      i <- i + 1
    }else{
      x2 <- str_remove(x2, "[^\\d]+")
    }
  }


  for (j in 1:12) {

    k <- (j-1)*3 + 1

    m_data[j,2] <- y[[k]]
    m_data[j,3] <- y[[k+1]]
    m_data[j,4] <- y[[k+2]]

  }

  return(m_data)
}



