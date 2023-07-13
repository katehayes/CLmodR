foi_clean_by_page  <- function(data, column_names) {

  data <- data %>%
    str_split("\\n", simplify = TRUE) %>%
    as.list() %>%
    as.data.frame() %>%
    t() %>%
    as.data.frame()

  rownames(data) <- NULL

  colnames(data) <- "text"

  data <- data %>%
    mutate(col1 = str_extract(text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col2 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col3 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col4 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col5 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col6 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col7 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col8 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s?])+")) %>%
    mutate(col9 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col10 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col11 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    mutate(col12 = str_extract(remainder_text, "([:graph:]+[\\s]?)+"),
           remainder_text =  str_remove(remainder_text, "([:graph:]+[\\s]?)+")) %>%
    select(-c(text, remainder_text))

  colnames(data) <- column_names

  data <- data %>%
    mutate(bailed = ifelse(charged == "Conditional", charged, bailed),
           charged = ifelse(charged == "Conditional", NA, charged)) %>%
    select(where(not_all_na)) %>%
    mutate(across(everything(), ~str_trim(.x, side = c("both"))))



  return(data)

}
