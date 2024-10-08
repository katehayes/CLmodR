load("/Users/katehayes/CLmodR/output/data/input/init_c.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/t_turn10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/v_turn10.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/rise.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/fall.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/rf_t.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/t_lac.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/endnr.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/endres.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/end_cust17.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/np2nci10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2nci17.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/np2ncec10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2ncec17.Rdata")


load("/Users/katehayes/CLmodR/output/data/input/np2csi10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csi17.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/np2csec10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/np2csec17.Rdata")


load("/Users/katehayes/CLmodR/output/data/input/cs_p1_10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_11.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_12.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_13.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_14.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_15.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_16.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p1_17.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/cs_p2_17.Rdata")


  
# making stop and searches

ss_weekly <- stop_search_1214to0322 %>%
  st_drop_geometry() %>%
  filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
         LA == "Birmingham",
         age %in% c("under 10", "10-17", "Oct-17")) %>% 
  mutate(date = as.Date(short_date))  %>% 
  expand(LA, date = full_seq(date, 1)) %>% 
  left_join(stop_search_1214to0322 %>%
              st_drop_geometry() %>%
              filter(powers != "Criminal Justice and Public Order Act 1994 (section 60)",
                     LA == "Birmingham",
                     age %in% c("under 10", "10-17", "Oct-17")) %>% 
              mutate(date = as.Date(short_date)) %>% 
              mutate(count = 1) %>% 
              group_by(date) %>% 
              summarise(count = sum(count))) %>% 
  mutate(count = ifelse(is.na(count), 0, count)) %>% 
  mutate(week = cut.Date(date, breaks = "1 week", labels = FALSE),
         best_use = ifelse(week >= 223, "Best use OFF", "Best use ON")) %>% 
  group_by(week, best_use)%>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  mutate(week = week + 256) %>% 
  rbind(data.frame(week = seq(0, 256, 1),
                   best_use = "Best use ON",
                  count = rnorm(seq(0, 256, 1), 25, 10))) %>% 
  arrange(week)



# 
# # every week will pass in a new ss -- will divide that up between groups in the community
# # ss
# 
# # 
# age <- data_frame(x = c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
#                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                            0, 0))
# # 
# age2 <- data_frame(x = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0))
# 
# 
# age3 <- data_frame(x = c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#                         0, 0, 0))
# 
# 
# age_up <- age2 %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age3)
# 
# 
# ageup <- age_up$x
# 
# 
# age <- data_frame(x = c(0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
#                        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                        0, 0))
# # 
# age2 <- data_frame(x = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          0, 0))
# 
# 
# age3 <- data_frame(x = c(0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
#                          1, 1, 1))
# 
# 
# age_off <- age2 %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age) %>% 
#   rbind(age3)
# 
# check <- 
# 
# ageoff <- age_off$x


n_16 <- neet*4

pars <- list(tt = t_turn10,
             y = v_turn10[,1],
             
             mu_c = 5,
             mu_s = 2,
             mu_p = 3,
             
             vis = 5,
             # au = ageup,
             # ao = ageoff,
             # y = v_turn10[,1],
             rft = rf_t,
             ri = rise[,1],
             fa = fall[,1],
             lact = t_lac,
             enr = endnr[,1],
             eres = endres[,1],
             ec10 = end_cust10[,1],
             ec11 = end_cust11[,1],
             ec12 = end_cust12[,1],
             ec13 = end_cust13[,1],
             ec14 = end_cust14[,1],
             ec15 = end_cust15[,1],
             ec16 = end_cust16[,1],
             ec17 = end_cust17[,1],
             ftep1c1s110 = fte_p1c1s1_10,
             ftep1c1s210 = fte_p1c1s2_10,
             ftep1c1s310 = fte_p1c1s3_10,
             ftep1c2s110 = fte_p1c2s1_10,
             ftep1c2s210 = fte_p1c2s2_10,
             ftep1c2s310 = fte_p1c2s3_10,
             ftep1c3s110 = fte_p1c3s1_10,
             ftep1c3s210 = fte_p1c3s2_10,
             ftep1c3s310 = fte_p1c3s3_10,
             ftep1c4s110 = fte_p1c4s1_10,
             ftep1c4s210 = fte_p1c4s2_10,
             ftep1c4s310 = fte_p1c4s3_10,
             ftep2c1s110 = fte_p2c1s1_10,
             ftep2c1s210 = fte_p2c1s2_10,
             ftep2c1s310 = fte_p2c1s3_10,
             ftep2c2s110 = fte_p2c2s1_10,
             ftep2c2s210 = fte_p2c2s2_10,
             ftep2c2s310 = fte_p2c2s3_10,
             ftep2c3s110 = fte_p2c3s1_10,
             ftep2c3s210 = fte_p2c3s2_10,
             ftep2c3s310 = fte_p2c3s3_10,
             ftep2c4s110 = fte_p2c4s1_10,
             ftep2c4s210 = fte_p2c4s2_10,
             ftep2c4s310 = fte_p2c4s3_10,
             ftep1c1s111 = fte_p1c1s1_11,
             ftep1c1s211 = fte_p1c1s2_11,
             ftep1c1s311 = fte_p1c1s3_11,
             ftep1c2s111 = fte_p1c2s1_11,
             ftep1c2s211 = fte_p1c2s2_11,
             ftep1c2s311 = fte_p1c2s3_11,
             ftep1c3s111 = fte_p1c3s1_11,
             ftep1c3s211 = fte_p1c3s2_11,
             ftep1c3s311 = fte_p1c3s3_11,
             ftep1c4s111 = fte_p1c4s1_11,
             ftep1c4s211 = fte_p1c4s2_11,
             ftep1c4s311 = fte_p1c4s3_11,
             ftep2c1s111 = fte_p2c1s1_11,
             ftep2c1s211 = fte_p2c1s2_11,
             ftep2c1s311 = fte_p2c1s3_11,
             ftep2c2s111 = fte_p2c2s1_11,
             ftep2c2s211 = fte_p2c2s2_11,
             ftep2c2s311 = fte_p2c2s3_11,
             ftep2c3s111 = fte_p2c3s1_11,
             ftep2c3s211 = fte_p2c3s2_11,
             ftep2c3s311 = fte_p2c3s3_11,
             ftep2c4s111 = fte_p2c4s1_11,
             ftep2c4s211 = fte_p2c4s2_11,
             ftep2c4s311 = fte_p2c4s3_11,
             ftep1c1s112 = fte_p1c1s1_12,
             ftep1c1s212 = fte_p1c1s2_12,
             ftep1c1s312 = fte_p1c1s3_12,
             ftep1c2s112 = fte_p1c2s1_12,
             ftep1c2s212 = fte_p1c2s2_12,
             ftep1c2s312 = fte_p1c2s3_12,
             ftep1c3s112 = fte_p1c3s1_12,
             ftep1c3s212 = fte_p1c3s2_12,
             ftep1c3s312 = fte_p1c3s3_12,
             ftep1c4s112 = fte_p1c4s1_12,
             ftep1c4s212 = fte_p1c4s2_12,
             ftep1c4s312 = fte_p1c4s3_12,
             ftep2c1s112 = fte_p2c1s1_12,
             ftep2c1s212 = fte_p2c1s2_12,
             ftep2c1s312 = fte_p2c1s3_12,
             ftep2c2s112 = fte_p2c2s1_12,
             ftep2c2s212 = fte_p2c2s2_12,
             ftep2c2s312 = fte_p2c2s3_12,
             ftep2c3s112 = fte_p2c3s1_12,
             ftep2c3s212 = fte_p2c3s2_12,
             ftep2c3s312 = fte_p2c3s3_12,
             ftep2c4s112 = fte_p2c4s1_12,
             ftep2c4s212 = fte_p2c4s2_12,
             ftep2c4s312 = fte_p2c4s3_12,
             ftep1c1s113 = fte_p1c1s1_13,
             ftep1c1s213 = fte_p1c1s2_13,
             ftep1c1s313 = fte_p1c1s3_13,
             ftep1c2s113 = fte_p1c2s1_13,
             ftep1c2s213 = fte_p1c2s2_13,
             ftep1c2s313 = fte_p1c2s3_13,
             ftep1c3s113 = fte_p1c3s1_13,
             ftep1c3s213 = fte_p1c3s2_13,
             ftep1c3s313 = fte_p1c3s3_13,
             ftep1c4s113 = fte_p1c4s1_13,
             ftep1c4s213 = fte_p1c4s2_13,
             ftep1c4s313 = fte_p1c4s3_13,
             ftep2c1s113 = fte_p2c1s1_13,
             ftep2c1s213 = fte_p2c1s2_13,
             ftep2c1s313 = fte_p2c1s3_13,
             ftep2c2s113 = fte_p2c2s1_13,
             ftep2c2s213 = fte_p2c2s2_13,
             ftep2c2s313 = fte_p2c2s3_13,
             ftep2c3s113 = fte_p2c3s1_13,
             ftep2c3s213 = fte_p2c3s2_13,
             ftep2c3s313 = fte_p2c3s3_13,
             ftep2c4s113 = fte_p2c4s1_13,
             ftep2c4s213 = fte_p2c4s2_13,
             ftep2c4s313 = fte_p2c4s3_13,
             ftep1c1s114 = fte_p1c1s1_14,
             ftep1c1s214 = fte_p1c1s2_14,
             ftep1c1s314 = fte_p1c1s3_14,
             ftep1c2s114 = fte_p1c2s1_14,
             ftep1c2s214 = fte_p1c2s2_14,
             ftep1c2s314 = fte_p1c2s3_14,
             ftep1c3s114 = fte_p1c3s1_14,
             ftep1c3s214 = fte_p1c3s2_14,
             ftep1c3s314 = fte_p1c3s3_14,
             ftep1c4s114 = fte_p1c4s1_14,
             ftep1c4s214 = fte_p1c4s2_14,
             ftep1c4s314 = fte_p1c4s3_14,
             ftep2c1s114 = fte_p2c1s1_14,
             ftep2c1s214 = fte_p2c1s2_14,
             ftep2c1s314 = fte_p2c1s3_14,
             ftep2c2s114 = fte_p2c2s1_14,
             ftep2c2s214 = fte_p2c2s2_14,
             ftep2c2s314 = fte_p2c2s3_14,
             ftep2c3s114 = fte_p2c3s1_14,
             ftep2c3s214 = fte_p2c3s2_14,
             ftep2c3s314 = fte_p2c3s3_14,
             ftep2c4s114 = fte_p2c4s1_14,
             ftep2c4s214 = fte_p2c4s2_14,
             ftep2c4s314 = fte_p2c4s3_14,
             ftep1c1s115 = fte_p1c1s1_15,
             ftep1c1s215 = fte_p1c1s2_15,
             ftep1c1s315 = fte_p1c1s3_15,
             ftep1c2s115 = fte_p1c2s1_15,
             ftep1c2s215 = fte_p1c2s2_15,
             ftep1c2s315 = fte_p1c2s3_15,
             ftep1c3s115 = fte_p1c3s1_15,
             ftep1c3s215 = fte_p1c3s2_15,
             ftep1c3s315 = fte_p1c3s3_15,
             ftep1c4s115 = fte_p1c4s1_15,
             ftep1c4s215 = fte_p1c4s2_15,
             ftep1c4s315 = fte_p1c4s3_15,
             ftep2c1s115 = fte_p2c1s1_15,
             ftep2c1s215 = fte_p2c1s2_15,
             ftep2c1s315 = fte_p2c1s3_15,
             ftep2c2s115 = fte_p2c2s1_15,
             ftep2c2s215 = fte_p2c2s2_15,
             ftep2c2s315 = fte_p2c2s3_15,
             ftep2c3s115 = fte_p2c3s1_15,
             ftep2c3s215 = fte_p2c3s2_15,
             ftep2c3s315 = fte_p2c3s3_15,
             ftep2c4s115 = fte_p2c4s1_15,
             ftep2c4s215 = fte_p2c4s2_15,
             ftep2c4s315 = fte_p2c4s3_15,
             ftep1c1s116 = fte_p1c1s1_16,
             ftep1c1s216 = fte_p1c1s2_16,
             ftep1c1s316 = fte_p1c1s3_16,
             ftep1c2s116 = fte_p1c2s1_16,
             ftep1c2s216 = fte_p1c2s2_16,
             ftep1c2s316 = fte_p1c2s3_16,
             ftep1c3s116 = fte_p1c3s1_16,
             ftep1c3s216 = fte_p1c3s2_16,
             ftep1c3s316 = fte_p1c3s3_16,
             ftep1c4s116 = fte_p1c4s1_16,
             ftep1c4s216 = fte_p1c4s2_16,
             ftep1c4s316 = fte_p1c4s3_16,
             ftep2c1s116 = fte_p2c1s1_16,
             ftep2c1s216 = fte_p2c1s2_16,
             ftep2c1s316 = fte_p2c1s3_16,
             ftep2c2s116 = fte_p2c2s1_16,
             ftep2c2s216 = fte_p2c2s2_16,
             ftep2c2s316 = fte_p2c2s3_16,
             ftep2c3s116 = fte_p2c3s1_16,
             ftep2c3s216 = fte_p2c3s2_16,
             ftep2c3s316 = fte_p2c3s3_16,
             ftep2c4s116 = fte_p2c4s1_16,
             ftep2c4s216 = fte_p2c4s2_16,
             ftep2c4s316 = fte_p2c4s3_16,
             ftep1c1s117 = fte_p1c1s1_17,
             ftep1c1s217 = fte_p1c1s2_17,
             ftep1c1s317 = fte_p1c1s3_17,
             ftep1c2s117 = fte_p1c2s1_17,
             ftep1c2s217 = fte_p1c2s2_17,
             ftep1c2s317 = fte_p1c2s3_17,
             ftep1c3s117 = fte_p1c3s1_17,
             ftep1c3s217 = fte_p1c3s2_17,
             ftep1c3s317 = fte_p1c3s3_17,
             ftep1c4s117 = fte_p1c4s1_17,
             ftep1c4s217 = fte_p1c4s2_17,
             ftep1c4s317 = fte_p1c4s3_17,
             ftep2c1s117 = fte_p2c1s1_17,
             ftep2c1s217 = fte_p2c1s2_17,
             ftep2c1s317 = fte_p2c1s3_17,
             ftep2c2s117 = fte_p2c2s1_17,
             ftep2c2s217 = fte_p2c2s2_17,
             ftep2c2s317 = fte_p2c2s3_17,
             ftep2c3s117 = fte_p2c3s1_17,
             ftep2c3s217 = fte_p2c3s2_17,
             ftep2c3s317 = fte_p2c3s3_17,
             ftep2c4s117 = fte_p2c4s1_17,
             ftep2c4s217 = fte_p2c4s2_17,
             ftep2c4s317 = fte_p2c4s3_17,
             
             csp110 = cs_p1_10[,1]*1.25,
             csp210 = cs_p2_10[,1]*1.25,
             csp111 = cs_p1_11[,1]*1.25,
             csp211 = cs_p2_11[,1]*1.25,
             csp112 = cs_p1_12[,1]*1.25,
             csp212 = cs_p2_12[,1]*1.25,
             csp113 = cs_p1_13[,1]*1.2,
             csp213 = cs_p2_13[,1]*1.2,
             csp114 = cs_p1_14[,1]*1.15,
             csp214 = cs_p2_14[,1]*1.15,
             csp115 = cs_p1_15[,1]*1.15,
             csp215 = cs_p2_15[,1]*1.15,
             csp116 = cs_p1_16[,1]*1.1,
             csp216 = cs_p2_16[,1]*1.1,
             csp117 = cs_p1_17[,1]*1.05,
             csp217 = cs_p2_17[,1]*1.05,
             
             
             tau = 0,
             
             s16 = s_16,
             pru = pr_unit,
             
             s2s3_16 = 0.000018,
             s3s2_16 = 0.0001,
             s2s3_17 = 0.000018,
             s3s2_17 = 0.00018,
             
             n16 = n_16, 
             # neet16 = 0.02,
             vsig_p = 1.4,
             vsig_c = 1.4,
             vsig_s = 1.4, 
             vsig_j = 1.4,
             
             sig_p = 3,
             sig_c = 10,
             sig_j = 5,
             
             nsig_p = 2.1,
             nsig_c = 2,
             nsig_j = 2,
            
             phi_p = 2,
             
             c1c10 = 0.00002,
             c1c11 = 0.00003,
             c1c12 = 0.00004,
             c1c13 = 0.00005,
             c1c14 = 0.00006,
             c1c15 = 0.00007,
             c1c16 = 0.00008,
             c1c17 = 0.00009,
             
             c4c10 = 0.0007,
             c4c11 = 0.0008,
             c4c12 = 0.0009,
             c4c13 = 0.001,
             c4c14 = 0.0011,
             c4c15 = 0.0012,
             c4c16 = 0.0013,
             c4c17 = 0.0014,
             
             stay10 = 0.42, 
             stay11 = 0.44, 
             stay12 = 0.46, 
             stay13 = 0.48, 
             stay14 = 0.5, 
             stay15 = 0.55, 
             stay16 = 0.6, 
             stay17 = 0.65, 
             
             r10 = 0.15, 
             r11 = 0.2, 
             r12 = 0.25, 
             r13 = 0.3, 
             r14 = 0.35, 
             r15 = 0.40, 
             r16 = 0.50, 
             r17 = 0.60, 
            
             
             # pc_p1 = 0.73,
             # pc_p2 = 0.27,
             t10_p1c1s1j1 = t10(p=1,c=1,s=1,j=1),
             t10_p1c1s1j2 = t10(p=1,c=1,s=1,j=2),
             t10_p1c1s2j1 = t10(p=1,c=1,s=2,j=1),
             t10_p1c1s2j2 = t10(p=1,c=1,s=2,j=2),
             t10_p1c1s3j1 = t10(p=1,c=1,s=3,j=1),
             t10_p1c1s3j2 = t10(p=1,c=1,s=3,j=2),
             t10_p1c2s1j1 = t10(p=1,c=2,s=1,j=1),
             t10_p1c2s1j2 = t10(p=1,c=2,s=1,j=2),
             t10_p1c2s2j1 = t10(p=1,c=2,s=2,j=1),
             t10_p1c2s2j2 = t10(p=1,c=2,s=2,j=2),
             t10_p1c2s3j1 = t10(p=1,c=2,s=3,j=1),
             t10_p1c2s3j2 = t10(p=1,c=2,s=3,j=2),
             t10_p1c3s1j1 = t10(p=1,c=3,s=1,j=1),
             t10_p1c3s1j2 = t10(p=1,c=3,s=1,j=2),
             t10_p1c3s2j1 = t10(p=1,c=3,s=2,j=1),
             t10_p1c3s2j2 = t10(p=1,c=3,s=2,j=2),
             t10_p1c3s3j1 = t10(p=1,c=3,s=3,j=1),
             t10_p1c3s3j2 = t10(p=1,c=3,s=3,j=2),
             t10_p1c4s1j1 = t10(p=1,c=4,s=1,j=1),
             t10_p1c4s1j2 = t10(p=1,c=4,s=1,j=2),
             t10_p1c4s2j1 = t10(p=1,c=4,s=2,j=1),
             t10_p1c4s2j2 = t10(p=1,c=4,s=2,j=2),
             t10_p1c4s3j1 = t10(p=1,c=4,s=3,j=1),
             t10_p1c4s3j2 = t10(p=1,c=4,s=3,j=2),
             t10_p2c1s1j1 = t10(p=2,c=1,s=1,j=1),
             t10_p2c1s1j2 = t10(p=2,c=1,s=1,j=2),
             t10_p2c1s2j1 = t10(p=2,c=1,s=2,j=1),
             t10_p2c1s2j2 = t10(p=2,c=1,s=2,j=2),
             t10_p2c1s3j1 = t10(p=2,c=1,s=3,j=1),
             t10_p2c1s3j2 = t10(p=2,c=1,s=3,j=2),
             t10_p2c2s1j1 = t10(p=2,c=2,s=1,j=1),
             t10_p2c2s1j2 = t10(p=2,c=2,s=1,j=2),
             t10_p2c2s2j1 = t10(p=2,c=2,s=2,j=1),
             t10_p2c2s2j2 = t10(p=2,c=2,s=2,j=2),
             t10_p2c2s3j1 = t10(p=2,c=2,s=3,j=1),
             t10_p2c2s3j2 = t10(p=2,c=2,s=3,j=2),
             t10_p2c3s1j1 = t10(p=2,c=3,s=1,j=1),
             t10_p2c3s1j2 = t10(p=2,c=3,s=1,j=2),
             t10_p2c3s2j1 = t10(p=2,c=3,s=2,j=1),
             t10_p2c3s2j2 = t10(p=2,c=3,s=2,j=2),
             t10_p2c3s3j1 = t10(p=2,c=3,s=3,j=1),
             t10_p2c3s3j2 = t10(p=2,c=3,s=3,j=2),
             t10_p2c4s1j1 = t10(p=2,c=4,s=1,j=1),
             t10_p2c4s1j2 = t10(p=2,c=4,s=1,j=2),
             t10_p2c4s2j1 = t10(p=2,c=4,s=2,j=1),
             t10_p2c4s2j2 = t10(p=2,c=4,s=2,j=2),
             t10_p2c4s3j1 = t10(p=2,c=4,s=3,j=1),
             t10_p2c4s3j2 = t10(p=2,c=4,s=3,j=2),
             
             
             P1C1S1J1_10_ini = ic(a=10, p=1, c=1, s=1, j=1),
             P1C1S1J2_10_ini = ic(a=10, p=1, c=1, s=1, j=2),
             P1C1S1J3_10_ini = ic(a=10, p=1, c=1, s=1, j=3),
             P1C1S1J4_10_ini = ic(a=10, p=1, c=1, s=1, j=4),
             P1C1S2J1_10_ini = ic(a=10, p=1, c=1, s=2, j=1),
             P1C1S2J2_10_ini = ic(a=10, p=1, c=1, s=2, j=2),
             P1C1S2J3_10_ini = ic(a=10, p=1, c=1, s=2, j=3),
             P1C1S2J4_10_ini = ic(a=10, p=1, c=1, s=2, j=4),
             P1C1S3J1_10_ini = ic(a=10, p=1, c=1, s=3, j=1),
             P1C1S3J2_10_ini = ic(a=10, p=1, c=1, s=3, j=2),
             P1C1S3J3_10_ini = ic(a=10, p=1, c=1, s=3, j=3),
             P1C1S3J4_10_ini = ic(a=10, p=1, c=1, s=3, j=4),
             P1C2S1J1_10_ini = ic(a=10, p=1, c=2, s=1, j=1),
             P1C2S1J2_10_ini = ic(a=10, p=1, c=2, s=1, j=2),
             P1C2S1J3_10_ini = ic(a=10, p=1, c=2, s=1, j=3),
             P1C2S1J4_10_ini = ic(a=10, p=1, c=2, s=1, j=4),
             P1C2S2J1_10_ini = ic(a=10, p=1, c=2, s=2, j=1),
             P1C2S2J2_10_ini = ic(a=10, p=1, c=2, s=2, j=2),
             P1C2S2J3_10_ini = ic(a=10, p=1, c=2, s=2, j=3),
             P1C2S2J4_10_ini = ic(a=10, p=1, c=2, s=2, j=4),
             P1C2S3J1_10_ini = ic(a=10, p=1, c=2, s=3, j=1),
             P1C2S3J2_10_ini = ic(a=10, p=1, c=2, s=3, j=2),
             P1C2S3J3_10_ini = ic(a=10, p=1, c=2, s=3, j=3),
             P1C2S3J4_10_ini = ic(a=10, p=1, c=2, s=3, j=4),
             P1C3S1J1_10_ini = ic(a=10, p=1, c=3, s=1, j=1),
             P1C3S1J2_10_ini = ic(a=10, p=1, c=3, s=1, j=2),
             P1C3S1J3_10_ini = ic(a=10, p=1, c=3, s=1, j=3),
             P1C3S1J4_10_ini = ic(a=10, p=1, c=3, s=1, j=4),
             P1C3S2J1_10_ini = ic(a=10, p=1, c=3, s=2, j=1),
             P1C3S2J2_10_ini = ic(a=10, p=1, c=3, s=2, j=2),
             P1C3S2J3_10_ini = ic(a=10, p=1, c=3, s=2, j=3),
             P1C3S2J4_10_ini = ic(a=10, p=1, c=3, s=2, j=4),
             P1C3S3J1_10_ini = ic(a=10, p=1, c=3, s=3, j=1),
             P1C3S3J2_10_ini = ic(a=10, p=1, c=3, s=3, j=2),
             P1C3S3J3_10_ini = ic(a=10, p=1, c=3, s=3, j=3),
             P1C3S3J4_10_ini = ic(a=10, p=1, c=3, s=3, j=4),
             P1C4S1J1_10_ini = ic(a=10, p=1, c=4, s=1, j=1),
             P1C4S1J2_10_ini = ic(a=10, p=1, c=4, s=1, j=2),
             P1C4S1J3_10_ini = ic(a=10, p=1, c=4, s=1, j=3),
             P1C4S1J4_10_ini = ic(a=10, p=1, c=4, s=1, j=4),
             P1C4S2J1_10_ini = ic(a=10, p=1, c=4, s=2, j=1),
             P1C4S2J2_10_ini = ic(a=10, p=1, c=4, s=2, j=2),
             P1C4S2J3_10_ini = ic(a=10, p=1, c=4, s=2, j=3),
             P1C4S2J4_10_ini = ic(a=10, p=1, c=4, s=2, j=4),
             P1C4S3J1_10_ini = ic(a=10, p=1, c=4, s=3, j=1),
             P1C4S3J2_10_ini = ic(a=10, p=1, c=4, s=3, j=2),
             P1C4S3J3_10_ini = ic(a=10, p=1, c=4, s=3, j=3),
             P1C4S3J4_10_ini = ic(a=10, p=1, c=4, s=3, j=4),
             P2C1S1J1_10_ini = ic(a=10, p=2, c=1, s=1, j=1),
             P2C1S1J2_10_ini = ic(a=10, p=2, c=1, s=1, j=2),
             P2C1S1J3_10_ini = ic(a=10, p=2, c=1, s=1, j=3),
             P2C1S1J4_10_ini = ic(a=10, p=2, c=1, s=1, j=4),
             P2C1S2J1_10_ini = ic(a=10, p=2, c=1, s=2, j=1),
             P2C1S2J2_10_ini = ic(a=10, p=2, c=1, s=2, j=2),
             P2C1S2J3_10_ini = ic(a=10, p=2, c=1, s=2, j=3),
             P2C1S2J4_10_ini = ic(a=10, p=2, c=1, s=2, j=4),
             P2C1S3J1_10_ini = ic(a=10, p=2, c=1, s=3, j=1),
             P2C1S3J2_10_ini = ic(a=10, p=2, c=1, s=3, j=2),
             P2C1S3J3_10_ini = ic(a=10, p=2, c=1, s=3, j=3),
             P2C1S3J4_10_ini = ic(a=10, p=2, c=1, s=3, j=4),
             P2C2S1J1_10_ini = ic(a=10, p=2, c=2, s=1, j=1),
             P2C2S1J2_10_ini = ic(a=10, p=2, c=2, s=1, j=2),
             P2C2S1J3_10_ini = ic(a=10, p=2, c=2, s=1, j=3),
             P2C2S1J4_10_ini = ic(a=10, p=2, c=2, s=1, j=4),
             P2C2S2J1_10_ini = ic(a=10, p=2, c=2, s=2, j=1),
             P2C2S2J2_10_ini = ic(a=10, p=2, c=2, s=2, j=2),
             P2C2S2J3_10_ini = ic(a=10, p=2, c=2, s=2, j=3),
             P2C2S2J4_10_ini = ic(a=10, p=2, c=2, s=2, j=4),
             P2C2S3J1_10_ini = ic(a=10, p=2, c=2, s=3, j=1),
             P2C2S3J2_10_ini = ic(a=10, p=2, c=2, s=3, j=2),
             P2C2S3J3_10_ini = ic(a=10, p=2, c=2, s=3, j=3),
             P2C2S3J4_10_ini = ic(a=10, p=2, c=2, s=3, j=4),
             P2C3S1J1_10_ini = ic(a=10, p=2, c=3, s=1, j=1),
             P2C3S1J2_10_ini = ic(a=10, p=2, c=3, s=1, j=2),
             P2C3S1J3_10_ini = ic(a=10, p=2, c=3, s=1, j=3),
             P2C3S1J4_10_ini = ic(a=10, p=2, c=3, s=1, j=4),
             P2C3S2J1_10_ini = ic(a=10, p=2, c=3, s=2, j=1),
             P2C3S2J2_10_ini = ic(a=10, p=2, c=3, s=2, j=2),
             P2C3S2J3_10_ini = ic(a=10, p=2, c=3, s=2, j=3),
             P2C3S2J4_10_ini = ic(a=10, p=2, c=3, s=2, j=4),
             P2C3S3J1_10_ini = ic(a=10, p=2, c=3, s=3, j=1),
             P2C3S3J2_10_ini = ic(a=10, p=2, c=3, s=3, j=2),
             P2C3S3J3_10_ini = ic(a=10, p=2, c=3, s=3, j=3),
             P2C3S3J4_10_ini = ic(a=10, p=2, c=3, s=3, j=4),
             P2C4S1J1_10_ini = ic(a=10, p=2, c=4, s=1, j=1),
             P2C4S1J2_10_ini = ic(a=10, p=2, c=4, s=1, j=2),
             P2C4S1J3_10_ini = ic(a=10, p=2, c=4, s=1, j=3),
             P2C4S1J4_10_ini = ic(a=10, p=2, c=4, s=1, j=4),
             P2C4S2J1_10_ini = ic(a=10, p=2, c=4, s=2, j=1),
             P2C4S2J2_10_ini = ic(a=10, p=2, c=4, s=2, j=2),
             P2C4S2J3_10_ini = ic(a=10, p=2, c=4, s=2, j=3),
             P2C4S2J4_10_ini = ic(a=10, p=2, c=4, s=2, j=4),
             P2C4S3J1_10_ini = ic(a=10, p=2, c=4, s=3, j=1),
             P2C4S3J2_10_ini = ic(a=10, p=2, c=4, s=3, j=2),
             P2C4S3J3_10_ini = ic(a=10, p=2, c=4, s=3, j=3),
             P2C4S3J4_10_ini = ic(a=10, p=2, c=4, s=3, j=4),
             P1C1S1J1_11_ini = ic(a=11, p=1, c=1, s=1, j=1),
             P1C1S1J2_11_ini = ic(a=11, p=1, c=1, s=1, j=2),
             P1C1S1J3_11_ini = ic(a=11, p=1, c=1, s=1, j=3),
             P1C1S1J4_11_ini = ic(a=11, p=1, c=1, s=1, j=4),
             P1C1S2J1_11_ini = ic(a=11, p=1, c=1, s=2, j=1),
             P1C1S2J2_11_ini = ic(a=11, p=1, c=1, s=2, j=2),
             P1C1S2J3_11_ini = ic(a=11, p=1, c=1, s=2, j=3),
             P1C1S2J4_11_ini = ic(a=11, p=1, c=1, s=2, j=4),
             P1C1S3J1_11_ini = ic(a=11, p=1, c=1, s=3, j=1),
             P1C1S3J2_11_ini = ic(a=11, p=1, c=1, s=3, j=2),
             P1C1S3J3_11_ini = ic(a=11, p=1, c=1, s=3, j=3),
             P1C1S3J4_11_ini = ic(a=11, p=1, c=1, s=3, j=4),
             P1C2S1J1_11_ini = ic(a=11, p=1, c=2, s=1, j=1),
             P1C2S1J2_11_ini = ic(a=11, p=1, c=2, s=1, j=2),
             P1C2S1J3_11_ini = ic(a=11, p=1, c=2, s=1, j=3),
             P1C2S1J4_11_ini = ic(a=11, p=1, c=2, s=1, j=4),
             P1C2S2J1_11_ini = ic(a=11, p=1, c=2, s=2, j=1),
             P1C2S2J2_11_ini = ic(a=11, p=1, c=2, s=2, j=2),
             P1C2S2J3_11_ini = ic(a=11, p=1, c=2, s=2, j=3),
             P1C2S2J4_11_ini = ic(a=11, p=1, c=2, s=2, j=4),
             P1C2S3J1_11_ini = ic(a=11, p=1, c=2, s=3, j=1),
             P1C2S3J2_11_ini = ic(a=11, p=1, c=2, s=3, j=2),
             P1C2S3J3_11_ini = ic(a=11, p=1, c=2, s=3, j=3),
             P1C2S3J4_11_ini = ic(a=11, p=1, c=2, s=3, j=4),
             P1C3S1J1_11_ini = ic(a=11, p=1, c=3, s=1, j=1),
             P1C3S1J2_11_ini = ic(a=11, p=1, c=3, s=1, j=2),
             P1C3S1J3_11_ini = ic(a=11, p=1, c=3, s=1, j=3),
             P1C3S1J4_11_ini = ic(a=11, p=1, c=3, s=1, j=4),
             P1C3S2J1_11_ini = ic(a=11, p=1, c=3, s=2, j=1),
             P1C3S2J2_11_ini = ic(a=11, p=1, c=3, s=2, j=2),
             P1C3S2J3_11_ini = ic(a=11, p=1, c=3, s=2, j=3),
             P1C3S2J4_11_ini = ic(a=11, p=1, c=3, s=2, j=4),
             P1C3S3J1_11_ini = ic(a=11, p=1, c=3, s=3, j=1),
             P1C3S3J2_11_ini = ic(a=11, p=1, c=3, s=3, j=2),
             P1C3S3J3_11_ini = ic(a=11, p=1, c=3, s=3, j=3),
             P1C3S3J4_11_ini = ic(a=11, p=1, c=3, s=3, j=4),
             P1C4S1J1_11_ini = ic(a=11, p=1, c=4, s=1, j=1),
             P1C4S1J2_11_ini = ic(a=11, p=1, c=4, s=1, j=2),
             P1C4S1J3_11_ini = ic(a=11, p=1, c=4, s=1, j=3),
             P1C4S1J4_11_ini = ic(a=11, p=1, c=4, s=1, j=4),
             P1C4S2J1_11_ini = ic(a=11, p=1, c=4, s=2, j=1),
             P1C4S2J2_11_ini = ic(a=11, p=1, c=4, s=2, j=2),
             P1C4S2J3_11_ini = ic(a=11, p=1, c=4, s=2, j=3),
             P1C4S2J4_11_ini = ic(a=11, p=1, c=4, s=2, j=4),
             P1C4S3J1_11_ini = ic(a=11, p=1, c=4, s=3, j=1),
             P1C4S3J2_11_ini = ic(a=11, p=1, c=4, s=3, j=2),
             P1C4S3J3_11_ini = ic(a=11, p=1, c=4, s=3, j=3),
             P1C4S3J4_11_ini = ic(a=11, p=1, c=4, s=3, j=4),
             P2C1S1J1_11_ini = ic(a=11, p=2, c=1, s=1, j=1),
             P2C1S1J2_11_ini = ic(a=11, p=2, c=1, s=1, j=2),
             P2C1S1J3_11_ini = ic(a=11, p=2, c=1, s=1, j=3),
             P2C1S1J4_11_ini = ic(a=11, p=2, c=1, s=1, j=4),
             P2C1S2J1_11_ini = ic(a=11, p=2, c=1, s=2, j=1),
             P2C1S2J2_11_ini = ic(a=11, p=2, c=1, s=2, j=2),
             P2C1S2J3_11_ini = ic(a=11, p=2, c=1, s=2, j=3),
             P2C1S2J4_11_ini = ic(a=11, p=2, c=1, s=2, j=4),
             P2C1S3J1_11_ini = ic(a=11, p=2, c=1, s=3, j=1),
             P2C1S3J2_11_ini = ic(a=11, p=2, c=1, s=3, j=2),
             P2C1S3J3_11_ini = ic(a=11, p=2, c=1, s=3, j=3),
             P2C1S3J4_11_ini = ic(a=11, p=2, c=1, s=3, j=4),
             P2C2S1J1_11_ini = ic(a=11, p=2, c=2, s=1, j=1),
             P2C2S1J2_11_ini = ic(a=11, p=2, c=2, s=1, j=2),
             P2C2S1J3_11_ini = ic(a=11, p=2, c=2, s=1, j=3),
             P2C2S1J4_11_ini = ic(a=11, p=2, c=2, s=1, j=4),
             P2C2S2J1_11_ini = ic(a=11, p=2, c=2, s=2, j=1),
             P2C2S2J2_11_ini = ic(a=11, p=2, c=2, s=2, j=2),
             P2C2S2J3_11_ini = ic(a=11, p=2, c=2, s=2, j=3),
             P2C2S2J4_11_ini = ic(a=11, p=2, c=2, s=2, j=4),
             P2C2S3J1_11_ini = ic(a=11, p=2, c=2, s=3, j=1),
             P2C2S3J2_11_ini = ic(a=11, p=2, c=2, s=3, j=2),
             P2C2S3J3_11_ini = ic(a=11, p=2, c=2, s=3, j=3),
             P2C2S3J4_11_ini = ic(a=11, p=2, c=2, s=3, j=4),
             P2C3S1J1_11_ini = ic(a=11, p=2, c=3, s=1, j=1),
             P2C3S1J2_11_ini = ic(a=11, p=2, c=3, s=1, j=2),
             P2C3S1J3_11_ini = ic(a=11, p=2, c=3, s=1, j=3),
             P2C3S1J4_11_ini = ic(a=11, p=2, c=3, s=1, j=4),
             P2C3S2J1_11_ini = ic(a=11, p=2, c=3, s=2, j=1),
             P2C3S2J2_11_ini = ic(a=11, p=2, c=3, s=2, j=2),
             P2C3S2J3_11_ini = ic(a=11, p=2, c=3, s=2, j=3),
             P2C3S2J4_11_ini = ic(a=11, p=2, c=3, s=2, j=4),
             P2C3S3J1_11_ini = ic(a=11, p=2, c=3, s=3, j=1),
             P2C3S3J2_11_ini = ic(a=11, p=2, c=3, s=3, j=2),
             P2C3S3J3_11_ini = ic(a=11, p=2, c=3, s=3, j=3),
             P2C3S3J4_11_ini = ic(a=11, p=2, c=3, s=3, j=4),
             P2C4S1J1_11_ini = ic(a=11, p=2, c=4, s=1, j=1),
             P2C4S1J2_11_ini = ic(a=11, p=2, c=4, s=1, j=2),
             P2C4S1J3_11_ini = ic(a=11, p=2, c=4, s=1, j=3),
             P2C4S1J4_11_ini = ic(a=11, p=2, c=4, s=1, j=4),
             P2C4S2J1_11_ini = ic(a=11, p=2, c=4, s=2, j=1),
             P2C4S2J2_11_ini = ic(a=11, p=2, c=4, s=2, j=2),
             P2C4S2J3_11_ini = ic(a=11, p=2, c=4, s=2, j=3),
             P2C4S2J4_11_ini = ic(a=11, p=2, c=4, s=2, j=4),
             P2C4S3J1_11_ini = ic(a=11, p=2, c=4, s=3, j=1),
             P2C4S3J2_11_ini = ic(a=11, p=2, c=4, s=3, j=2),
             P2C4S3J3_11_ini = ic(a=11, p=2, c=4, s=3, j=3),
             P2C4S3J4_11_ini = ic(a=11, p=2, c=4, s=3, j=4),
             P1C1S1J1_12_ini = ic(a=12, p=1, c=1, s=1, j=1),
             P1C1S1J2_12_ini = ic(a=12, p=1, c=1, s=1, j=2),
             P1C1S1J3_12_ini = ic(a=12, p=1, c=1, s=1, j=3),
             P1C1S1J4_12_ini = ic(a=12, p=1, c=1, s=1, j=4),
             P1C1S2J1_12_ini = ic(a=12, p=1, c=1, s=2, j=1),
             P1C1S2J2_12_ini = ic(a=12, p=1, c=1, s=2, j=2),
             P1C1S2J3_12_ini = ic(a=12, p=1, c=1, s=2, j=3),
             P1C1S2J4_12_ini = ic(a=12, p=1, c=1, s=2, j=4),
             P1C1S3J1_12_ini = ic(a=12, p=1, c=1, s=3, j=1),
             P1C1S3J2_12_ini = ic(a=12, p=1, c=1, s=3, j=2),
             P1C1S3J3_12_ini = ic(a=12, p=1, c=1, s=3, j=3),
             P1C1S3J4_12_ini = ic(a=12, p=1, c=1, s=3, j=4),
             P1C2S1J1_12_ini = ic(a=12, p=1, c=2, s=1, j=1),
             P1C2S1J2_12_ini = ic(a=12, p=1, c=2, s=1, j=2),
             P1C2S1J3_12_ini = ic(a=12, p=1, c=2, s=1, j=3),
             P1C2S1J4_12_ini = ic(a=12, p=1, c=2, s=1, j=4),
             P1C2S2J1_12_ini = ic(a=12, p=1, c=2, s=2, j=1),
             P1C2S2J2_12_ini = ic(a=12, p=1, c=2, s=2, j=2),
             P1C2S2J3_12_ini = ic(a=12, p=1, c=2, s=2, j=3),
             P1C2S2J4_12_ini = ic(a=12, p=1, c=2, s=2, j=4),
             P1C2S3J1_12_ini = ic(a=12, p=1, c=2, s=3, j=1),
             P1C2S3J2_12_ini = ic(a=12, p=1, c=2, s=3, j=2),
             P1C2S3J3_12_ini = ic(a=12, p=1, c=2, s=3, j=3),
             P1C2S3J4_12_ini = ic(a=12, p=1, c=2, s=3, j=4),
             P1C3S1J1_12_ini = ic(a=12, p=1, c=3, s=1, j=1),
             P1C3S1J2_12_ini = ic(a=12, p=1, c=3, s=1, j=2),
             P1C3S1J3_12_ini = ic(a=12, p=1, c=3, s=1, j=3),
             P1C3S1J4_12_ini = ic(a=12, p=1, c=3, s=1, j=4),
             P1C3S2J1_12_ini = ic(a=12, p=1, c=3, s=2, j=1),
             P1C3S2J2_12_ini = ic(a=12, p=1, c=3, s=2, j=2),
             P1C3S2J3_12_ini = ic(a=12, p=1, c=3, s=2, j=3),
             P1C3S2J4_12_ini = ic(a=12, p=1, c=3, s=2, j=4),
             P1C3S3J1_12_ini = ic(a=12, p=1, c=3, s=3, j=1),
             P1C3S3J2_12_ini = ic(a=12, p=1, c=3, s=3, j=2),
             P1C3S3J3_12_ini = ic(a=12, p=1, c=3, s=3, j=3),
             P1C3S3J4_12_ini = ic(a=12, p=1, c=3, s=3, j=4),
             P1C4S1J1_12_ini = ic(a=12, p=1, c=4, s=1, j=1),
             P1C4S1J2_12_ini = ic(a=12, p=1, c=4, s=1, j=2),
             P1C4S1J3_12_ini = ic(a=12, p=1, c=4, s=1, j=3),
             P1C4S1J4_12_ini = ic(a=12, p=1, c=4, s=1, j=4),
             P1C4S2J1_12_ini = ic(a=12, p=1, c=4, s=2, j=1),
             P1C4S2J2_12_ini = ic(a=12, p=1, c=4, s=2, j=2),
             P1C4S2J3_12_ini = ic(a=12, p=1, c=4, s=2, j=3),
             P1C4S2J4_12_ini = ic(a=12, p=1, c=4, s=2, j=4),
             P1C4S3J1_12_ini = ic(a=12, p=1, c=4, s=3, j=1),
             P1C4S3J2_12_ini = ic(a=12, p=1, c=4, s=3, j=2),
             P1C4S3J3_12_ini = ic(a=12, p=1, c=4, s=3, j=3),
             P1C4S3J4_12_ini = ic(a=12, p=1, c=4, s=3, j=4),
             P2C1S1J1_12_ini = ic(a=12, p=2, c=1, s=1, j=1),
             P2C1S1J2_12_ini = ic(a=12, p=2, c=1, s=1, j=2),
             P2C1S1J3_12_ini = ic(a=12, p=2, c=1, s=1, j=3),
             P2C1S1J4_12_ini = ic(a=12, p=2, c=1, s=1, j=4),
             P2C1S2J1_12_ini = ic(a=12, p=2, c=1, s=2, j=1),
             P2C1S2J2_12_ini = ic(a=12, p=2, c=1, s=2, j=2),
             P2C1S2J3_12_ini = ic(a=12, p=2, c=1, s=2, j=3),
             P2C1S2J4_12_ini = ic(a=12, p=2, c=1, s=2, j=4),
             P2C1S3J1_12_ini = ic(a=12, p=2, c=1, s=3, j=1),
             P2C1S3J2_12_ini = ic(a=12, p=2, c=1, s=3, j=2),
             P2C1S3J3_12_ini = ic(a=12, p=2, c=1, s=3, j=3),
             P2C1S3J4_12_ini = ic(a=12, p=2, c=1, s=3, j=4),
             P2C2S1J1_12_ini = ic(a=12, p=2, c=2, s=1, j=1),
             P2C2S1J2_12_ini = ic(a=12, p=2, c=2, s=1, j=2),
             P2C2S1J3_12_ini = ic(a=12, p=2, c=2, s=1, j=3),
             P2C2S1J4_12_ini = ic(a=12, p=2, c=2, s=1, j=4),
             P2C2S2J1_12_ini = ic(a=12, p=2, c=2, s=2, j=1),
             P2C2S2J2_12_ini = ic(a=12, p=2, c=2, s=2, j=2),
             P2C2S2J3_12_ini = ic(a=12, p=2, c=2, s=2, j=3),
             P2C2S2J4_12_ini = ic(a=12, p=2, c=2, s=2, j=4),
             P2C2S3J1_12_ini = ic(a=12, p=2, c=2, s=3, j=1),
             P2C2S3J2_12_ini = ic(a=12, p=2, c=2, s=3, j=2),
             P2C2S3J3_12_ini = ic(a=12, p=2, c=2, s=3, j=3),
             P2C2S3J4_12_ini = ic(a=12, p=2, c=2, s=3, j=4),
             P2C3S1J1_12_ini = ic(a=12, p=2, c=3, s=1, j=1),
             P2C3S1J2_12_ini = ic(a=12, p=2, c=3, s=1, j=2),
             P2C3S1J3_12_ini = ic(a=12, p=2, c=3, s=1, j=3),
             P2C3S1J4_12_ini = ic(a=12, p=2, c=3, s=1, j=4),
             P2C3S2J1_12_ini = ic(a=12, p=2, c=3, s=2, j=1),
             P2C3S2J2_12_ini = ic(a=12, p=2, c=3, s=2, j=2),
             P2C3S2J3_12_ini = ic(a=12, p=2, c=3, s=2, j=3),
             P2C3S2J4_12_ini = ic(a=12, p=2, c=3, s=2, j=4),
             P2C3S3J1_12_ini = ic(a=12, p=2, c=3, s=3, j=1),
             P2C3S3J2_12_ini = ic(a=12, p=2, c=3, s=3, j=2),
             P2C3S3J3_12_ini = ic(a=12, p=2, c=3, s=3, j=3),
             P2C3S3J4_12_ini = ic(a=12, p=2, c=3, s=3, j=4),
             P2C4S1J1_12_ini = ic(a=12, p=2, c=4, s=1, j=1),
             P2C4S1J2_12_ini = ic(a=12, p=2, c=4, s=1, j=2),
             P2C4S1J3_12_ini = ic(a=12, p=2, c=4, s=1, j=3),
             P2C4S1J4_12_ini = ic(a=12, p=2, c=4, s=1, j=4),
             P2C4S2J1_12_ini = ic(a=12, p=2, c=4, s=2, j=1),
             P2C4S2J2_12_ini = ic(a=12, p=2, c=4, s=2, j=2),
             P2C4S2J3_12_ini = ic(a=12, p=2, c=4, s=2, j=3),
             P2C4S2J4_12_ini = ic(a=12, p=2, c=4, s=2, j=4),
             P2C4S3J1_12_ini = ic(a=12, p=2, c=4, s=3, j=1),
             P2C4S3J2_12_ini = ic(a=12, p=2, c=4, s=3, j=2),
             P2C4S3J3_12_ini = ic(a=12, p=2, c=4, s=3, j=3),
             P2C4S3J4_12_ini = ic(a=12, p=2, c=4, s=3, j=4),
             P1C1S1J1_13_ini = ic(a=13, p=1, c=1, s=1, j=1),
             P1C1S1J2_13_ini = ic(a=13, p=1, c=1, s=1, j=2),
             P1C1S1J3_13_ini = ic(a=13, p=1, c=1, s=1, j=3),
             P1C1S1J4_13_ini = ic(a=13, p=1, c=1, s=1, j=4),
             P1C1S2J1_13_ini = ic(a=13, p=1, c=1, s=2, j=1),
             P1C1S2J2_13_ini = ic(a=13, p=1, c=1, s=2, j=2),
             P1C1S2J3_13_ini = ic(a=13, p=1, c=1, s=2, j=3),
             P1C1S2J4_13_ini = ic(a=13, p=1, c=1, s=2, j=4),
             P1C1S3J1_13_ini = ic(a=13, p=1, c=1, s=3, j=1),
             P1C1S3J2_13_ini = ic(a=13, p=1, c=1, s=3, j=2),
             P1C1S3J3_13_ini = ic(a=13, p=1, c=1, s=3, j=3),
             P1C1S3J4_13_ini = ic(a=13, p=1, c=1, s=3, j=4),
             P1C2S1J1_13_ini = ic(a=13, p=1, c=2, s=1, j=1),
             P1C2S1J2_13_ini = ic(a=13, p=1, c=2, s=1, j=2),
             P1C2S1J3_13_ini = ic(a=13, p=1, c=2, s=1, j=3),
             P1C2S1J4_13_ini = ic(a=13, p=1, c=2, s=1, j=4),
             P1C2S2J1_13_ini = ic(a=13, p=1, c=2, s=2, j=1),
             P1C2S2J2_13_ini = ic(a=13, p=1, c=2, s=2, j=2),
             P1C2S2J3_13_ini = ic(a=13, p=1, c=2, s=2, j=3),
             P1C2S2J4_13_ini = ic(a=13, p=1, c=2, s=2, j=4),
             P1C2S3J1_13_ini = ic(a=13, p=1, c=2, s=3, j=1),
             P1C2S3J2_13_ini = ic(a=13, p=1, c=2, s=3, j=2),
             P1C2S3J3_13_ini = ic(a=13, p=1, c=2, s=3, j=3),
             P1C2S3J4_13_ini = ic(a=13, p=1, c=2, s=3, j=4),
             P1C3S1J1_13_ini = ic(a=13, p=1, c=3, s=1, j=1),
             P1C3S1J2_13_ini = ic(a=13, p=1, c=3, s=1, j=2),
             P1C3S1J3_13_ini = ic(a=13, p=1, c=3, s=1, j=3),
             P1C3S1J4_13_ini = ic(a=13, p=1, c=3, s=1, j=4),
             P1C3S2J1_13_ini = ic(a=13, p=1, c=3, s=2, j=1),
             P1C3S2J2_13_ini = ic(a=13, p=1, c=3, s=2, j=2),
             P1C3S2J3_13_ini = ic(a=13, p=1, c=3, s=2, j=3),
             P1C3S2J4_13_ini = ic(a=13, p=1, c=3, s=2, j=4),
             P1C3S3J1_13_ini = ic(a=13, p=1, c=3, s=3, j=1),
             P1C3S3J2_13_ini = ic(a=13, p=1, c=3, s=3, j=2),
             P1C3S3J3_13_ini = ic(a=13, p=1, c=3, s=3, j=3),
             P1C3S3J4_13_ini = ic(a=13, p=1, c=3, s=3, j=4),
             P1C4S1J1_13_ini = ic(a=13, p=1, c=4, s=1, j=1),
             P1C4S1J2_13_ini = ic(a=13, p=1, c=4, s=1, j=2),
             P1C4S1J3_13_ini = ic(a=13, p=1, c=4, s=1, j=3),
             P1C4S1J4_13_ini = ic(a=13, p=1, c=4, s=1, j=4),
             P1C4S2J1_13_ini = ic(a=13, p=1, c=4, s=2, j=1),
             P1C4S2J2_13_ini = ic(a=13, p=1, c=4, s=2, j=2),
             P1C4S2J3_13_ini = ic(a=13, p=1, c=4, s=2, j=3),
             P1C4S2J4_13_ini = ic(a=13, p=1, c=4, s=2, j=4),
             P1C4S3J1_13_ini = ic(a=13, p=1, c=4, s=3, j=1),
             P1C4S3J2_13_ini = ic(a=13, p=1, c=4, s=3, j=2),
             P1C4S3J3_13_ini = ic(a=13, p=1, c=4, s=3, j=3),
             P1C4S3J4_13_ini = ic(a=13, p=1, c=4, s=3, j=4),
             P2C1S1J1_13_ini = ic(a=13, p=2, c=1, s=1, j=1),
             P2C1S1J2_13_ini = ic(a=13, p=2, c=1, s=1, j=2),
             P2C1S1J3_13_ini = ic(a=13, p=2, c=1, s=1, j=3),
             P2C1S1J4_13_ini = ic(a=13, p=2, c=1, s=1, j=4),
             P2C1S2J1_13_ini = ic(a=13, p=2, c=1, s=2, j=1),
             P2C1S2J2_13_ini = ic(a=13, p=2, c=1, s=2, j=2),
             P2C1S2J3_13_ini = ic(a=13, p=2, c=1, s=2, j=3),
             P2C1S2J4_13_ini = ic(a=13, p=2, c=1, s=2, j=4),
             P2C1S3J1_13_ini = ic(a=13, p=2, c=1, s=3, j=1),
             P2C1S3J2_13_ini = ic(a=13, p=2, c=1, s=3, j=2),
             P2C1S3J3_13_ini = ic(a=13, p=2, c=1, s=3, j=3),
             P2C1S3J4_13_ini = ic(a=13, p=2, c=1, s=3, j=4),
             P2C2S1J1_13_ini = ic(a=13, p=2, c=2, s=1, j=1),
             P2C2S1J2_13_ini = ic(a=13, p=2, c=2, s=1, j=2),
             P2C2S1J3_13_ini = ic(a=13, p=2, c=2, s=1, j=3),
             P2C2S1J4_13_ini = ic(a=13, p=2, c=2, s=1, j=4),
             P2C2S2J1_13_ini = ic(a=13, p=2, c=2, s=2, j=1),
             P2C2S2J2_13_ini = ic(a=13, p=2, c=2, s=2, j=2),
             P2C2S2J3_13_ini = ic(a=13, p=2, c=2, s=2, j=3),
             P2C2S2J4_13_ini = ic(a=13, p=2, c=2, s=2, j=4),
             P2C2S3J1_13_ini = ic(a=13, p=2, c=2, s=3, j=1),
             P2C2S3J2_13_ini = ic(a=13, p=2, c=2, s=3, j=2),
             P2C2S3J3_13_ini = ic(a=13, p=2, c=2, s=3, j=3),
             P2C2S3J4_13_ini = ic(a=13, p=2, c=2, s=3, j=4),
             P2C3S1J1_13_ini = ic(a=13, p=2, c=3, s=1, j=1),
             P2C3S1J2_13_ini = ic(a=13, p=2, c=3, s=1, j=2),
             P2C3S1J3_13_ini = ic(a=13, p=2, c=3, s=1, j=3),
             P2C3S1J4_13_ini = ic(a=13, p=2, c=3, s=1, j=4),
             P2C3S2J1_13_ini = ic(a=13, p=2, c=3, s=2, j=1),
             P2C3S2J2_13_ini = ic(a=13, p=2, c=3, s=2, j=2),
             P2C3S2J3_13_ini = ic(a=13, p=2, c=3, s=2, j=3),
             P2C3S2J4_13_ini = ic(a=13, p=2, c=3, s=2, j=4),
             P2C3S3J1_13_ini = ic(a=13, p=2, c=3, s=3, j=1),
             P2C3S3J2_13_ini = ic(a=13, p=2, c=3, s=3, j=2),
             P2C3S3J3_13_ini = ic(a=13, p=2, c=3, s=3, j=3),
             P2C3S3J4_13_ini = ic(a=13, p=2, c=3, s=3, j=4),
             P2C4S1J1_13_ini = ic(a=13, p=2, c=4, s=1, j=1),
             P2C4S1J2_13_ini = ic(a=13, p=2, c=4, s=1, j=2),
             P2C4S1J3_13_ini = ic(a=13, p=2, c=4, s=1, j=3),
             P2C4S1J4_13_ini = ic(a=13, p=2, c=4, s=1, j=4),
             P2C4S2J1_13_ini = ic(a=13, p=2, c=4, s=2, j=1),
             P2C4S2J2_13_ini = ic(a=13, p=2, c=4, s=2, j=2),
             P2C4S2J3_13_ini = ic(a=13, p=2, c=4, s=2, j=3),
             P2C4S2J4_13_ini = ic(a=13, p=2, c=4, s=2, j=4),
             P2C4S3J1_13_ini = ic(a=13, p=2, c=4, s=3, j=1),
             P2C4S3J2_13_ini = ic(a=13, p=2, c=4, s=3, j=2),
             P2C4S3J3_13_ini = ic(a=13, p=2, c=4, s=3, j=3),
             P2C4S3J4_13_ini = ic(a=13, p=2, c=4, s=3, j=4),
             P1C1S1J1_14_ini = ic(a=14, p=1, c=1, s=1, j=1),
             P1C1S1J2_14_ini = ic(a=14, p=1, c=1, s=1, j=2),
             P1C1S1J3_14_ini = ic(a=14, p=1, c=1, s=1, j=3),
             P1C1S1J4_14_ini = ic(a=14, p=1, c=1, s=1, j=4),
             P1C1S2J1_14_ini = ic(a=14, p=1, c=1, s=2, j=1),
             P1C1S2J2_14_ini = ic(a=14, p=1, c=1, s=2, j=2),
             P1C1S2J3_14_ini = ic(a=14, p=1, c=1, s=2, j=3),
             P1C1S2J4_14_ini = ic(a=14, p=1, c=1, s=2, j=4),
             P1C1S3J1_14_ini = ic(a=14, p=1, c=1, s=3, j=1),
             P1C1S3J2_14_ini = ic(a=14, p=1, c=1, s=3, j=2),
             P1C1S3J3_14_ini = ic(a=14, p=1, c=1, s=3, j=3),
             P1C1S3J4_14_ini = ic(a=14, p=1, c=1, s=3, j=4),
             P1C2S1J1_14_ini = ic(a=14, p=1, c=2, s=1, j=1),
             P1C2S1J2_14_ini = ic(a=14, p=1, c=2, s=1, j=2),
             P1C2S1J3_14_ini = ic(a=14, p=1, c=2, s=1, j=3),
             P1C2S1J4_14_ini = ic(a=14, p=1, c=2, s=1, j=4),
             P1C2S2J1_14_ini = ic(a=14, p=1, c=2, s=2, j=1),
             P1C2S2J2_14_ini = ic(a=14, p=1, c=2, s=2, j=2),
             P1C2S2J3_14_ini = ic(a=14, p=1, c=2, s=2, j=3),
             P1C2S2J4_14_ini = ic(a=14, p=1, c=2, s=2, j=4),
             P1C2S3J1_14_ini = ic(a=14, p=1, c=2, s=3, j=1),
             P1C2S3J2_14_ini = ic(a=14, p=1, c=2, s=3, j=2),
             P1C2S3J3_14_ini = ic(a=14, p=1, c=2, s=3, j=3),
             P1C2S3J4_14_ini = ic(a=14, p=1, c=2, s=3, j=4),
             P1C3S1J1_14_ini = ic(a=14, p=1, c=3, s=1, j=1),
             P1C3S1J2_14_ini = ic(a=14, p=1, c=3, s=1, j=2),
             P1C3S1J3_14_ini = ic(a=14, p=1, c=3, s=1, j=3),
             P1C3S1J4_14_ini = ic(a=14, p=1, c=3, s=1, j=4),
             P1C3S2J1_14_ini = ic(a=14, p=1, c=3, s=2, j=1),
             P1C3S2J2_14_ini = ic(a=14, p=1, c=3, s=2, j=2),
             P1C3S2J3_14_ini = ic(a=14, p=1, c=3, s=2, j=3),
             P1C3S2J4_14_ini = ic(a=14, p=1, c=3, s=2, j=4),
             P1C3S3J1_14_ini = ic(a=14, p=1, c=3, s=3, j=1),
             P1C3S3J2_14_ini = ic(a=14, p=1, c=3, s=3, j=2),
             P1C3S3J3_14_ini = ic(a=14, p=1, c=3, s=3, j=3),
             P1C3S3J4_14_ini = ic(a=14, p=1, c=3, s=3, j=4),
             P1C4S1J1_14_ini = ic(a=14, p=1, c=4, s=1, j=1),
             P1C4S1J2_14_ini = ic(a=14, p=1, c=4, s=1, j=2),
             P1C4S1J3_14_ini = ic(a=14, p=1, c=4, s=1, j=3),
             P1C4S1J4_14_ini = ic(a=14, p=1, c=4, s=1, j=4),
             P1C4S2J1_14_ini = ic(a=14, p=1, c=4, s=2, j=1),
             P1C4S2J2_14_ini = ic(a=14, p=1, c=4, s=2, j=2),
             P1C4S2J3_14_ini = ic(a=14, p=1, c=4, s=2, j=3),
             P1C4S2J4_14_ini = ic(a=14, p=1, c=4, s=2, j=4),
             P1C4S3J1_14_ini = ic(a=14, p=1, c=4, s=3, j=1),
             P1C4S3J2_14_ini = ic(a=14, p=1, c=4, s=3, j=2),
             P1C4S3J3_14_ini = ic(a=14, p=1, c=4, s=3, j=3),
             P1C4S3J4_14_ini = ic(a=14, p=1, c=4, s=3, j=4),
             P2C1S1J1_14_ini = ic(a=14, p=2, c=1, s=1, j=1),
             P2C1S1J2_14_ini = ic(a=14, p=2, c=1, s=1, j=2),
             P2C1S1J3_14_ini = ic(a=14, p=2, c=1, s=1, j=3),
             P2C1S1J4_14_ini = ic(a=14, p=2, c=1, s=1, j=4),
             P2C1S2J1_14_ini = ic(a=14, p=2, c=1, s=2, j=1),
             P2C1S2J2_14_ini = ic(a=14, p=2, c=1, s=2, j=2),
             P2C1S2J3_14_ini = ic(a=14, p=2, c=1, s=2, j=3),
             P2C1S2J4_14_ini = ic(a=14, p=2, c=1, s=2, j=4),
             P2C1S3J1_14_ini = ic(a=14, p=2, c=1, s=3, j=1),
             P2C1S3J2_14_ini = ic(a=14, p=2, c=1, s=3, j=2),
             P2C1S3J3_14_ini = ic(a=14, p=2, c=1, s=3, j=3),
             P2C1S3J4_14_ini = ic(a=14, p=2, c=1, s=3, j=4),
             P2C2S1J1_14_ini = ic(a=14, p=2, c=2, s=1, j=1),
             P2C2S1J2_14_ini = ic(a=14, p=2, c=2, s=1, j=2),
             P2C2S1J3_14_ini = ic(a=14, p=2, c=2, s=1, j=3),
             P2C2S1J4_14_ini = ic(a=14, p=2, c=2, s=1, j=4),
             P2C2S2J1_14_ini = ic(a=14, p=2, c=2, s=2, j=1),
             P2C2S2J2_14_ini = ic(a=14, p=2, c=2, s=2, j=2),
             P2C2S2J3_14_ini = ic(a=14, p=2, c=2, s=2, j=3),
             P2C2S2J4_14_ini = ic(a=14, p=2, c=2, s=2, j=4),
             P2C2S3J1_14_ini = ic(a=14, p=2, c=2, s=3, j=1),
             P2C2S3J2_14_ini = ic(a=14, p=2, c=2, s=3, j=2),
             P2C2S3J3_14_ini = ic(a=14, p=2, c=2, s=3, j=3),
             P2C2S3J4_14_ini = ic(a=14, p=2, c=2, s=3, j=4),
             P2C3S1J1_14_ini = ic(a=14, p=2, c=3, s=1, j=1),
             P2C3S1J2_14_ini = ic(a=14, p=2, c=3, s=1, j=2),
             P2C3S1J3_14_ini = ic(a=14, p=2, c=3, s=1, j=3),
             P2C3S1J4_14_ini = ic(a=14, p=2, c=3, s=1, j=4),
             P2C3S2J1_14_ini = ic(a=14, p=2, c=3, s=2, j=1),
             P2C3S2J2_14_ini = ic(a=14, p=2, c=3, s=2, j=2),
             P2C3S2J3_14_ini = ic(a=14, p=2, c=3, s=2, j=3),
             P2C3S2J4_14_ini = ic(a=14, p=2, c=3, s=2, j=4),
             P2C3S3J1_14_ini = ic(a=14, p=2, c=3, s=3, j=1),
             P2C3S3J2_14_ini = ic(a=14, p=2, c=3, s=3, j=2),
             P2C3S3J3_14_ini = ic(a=14, p=2, c=3, s=3, j=3),
             P2C3S3J4_14_ini = ic(a=14, p=2, c=3, s=3, j=4),
             P2C4S1J1_14_ini = ic(a=14, p=2, c=4, s=1, j=1),
             P2C4S1J2_14_ini = ic(a=14, p=2, c=4, s=1, j=2),
             P2C4S1J3_14_ini = ic(a=14, p=2, c=4, s=1, j=3),
             P2C4S1J4_14_ini = ic(a=14, p=2, c=4, s=1, j=4),
             P2C4S2J1_14_ini = ic(a=14, p=2, c=4, s=2, j=1),
             P2C4S2J2_14_ini = ic(a=14, p=2, c=4, s=2, j=2),
             P2C4S2J3_14_ini = ic(a=14, p=2, c=4, s=2, j=3),
             P2C4S2J4_14_ini = ic(a=14, p=2, c=4, s=2, j=4),
             P2C4S3J1_14_ini = ic(a=14, p=2, c=4, s=3, j=1),
             P2C4S3J2_14_ini = ic(a=14, p=2, c=4, s=3, j=2),
             P2C4S3J3_14_ini = ic(a=14, p=2, c=4, s=3, j=3),
             P2C4S3J4_14_ini = ic(a=14, p=2, c=4, s=3, j=4),
             P1C1S1J1_15_ini = ic(a=15, p=1, c=1, s=1, j=1),
             P1C1S1J2_15_ini = ic(a=15, p=1, c=1, s=1, j=2),
             P1C1S1J3_15_ini = ic(a=15, p=1, c=1, s=1, j=3),
             P1C1S1J4_15_ini = ic(a=15, p=1, c=1, s=1, j=4),
             P1C1S2J1_15_ini = ic(a=15, p=1, c=1, s=2, j=1),
             P1C1S2J2_15_ini = ic(a=15, p=1, c=1, s=2, j=2),
             P1C1S2J3_15_ini = ic(a=15, p=1, c=1, s=2, j=3),
             P1C1S2J4_15_ini = ic(a=15, p=1, c=1, s=2, j=4),
             P1C1S3J1_15_ini = ic(a=15, p=1, c=1, s=3, j=1),
             P1C1S3J2_15_ini = ic(a=15, p=1, c=1, s=3, j=2),
             P1C1S3J3_15_ini = ic(a=15, p=1, c=1, s=3, j=3),
             P1C1S3J4_15_ini = ic(a=15, p=1, c=1, s=3, j=4),
             P1C2S1J1_15_ini = ic(a=15, p=1, c=2, s=1, j=1),
             P1C2S1J2_15_ini = ic(a=15, p=1, c=2, s=1, j=2),
             P1C2S1J3_15_ini = ic(a=15, p=1, c=2, s=1, j=3),
             P1C2S1J4_15_ini = ic(a=15, p=1, c=2, s=1, j=4),
             P1C2S2J1_15_ini = ic(a=15, p=1, c=2, s=2, j=1),
             P1C2S2J2_15_ini = ic(a=15, p=1, c=2, s=2, j=2),
             P1C2S2J3_15_ini = ic(a=15, p=1, c=2, s=2, j=3),
             P1C2S2J4_15_ini = ic(a=15, p=1, c=2, s=2, j=4),
             P1C2S3J1_15_ini = ic(a=15, p=1, c=2, s=3, j=1),
             P1C2S3J2_15_ini = ic(a=15, p=1, c=2, s=3, j=2),
             P1C2S3J3_15_ini = ic(a=15, p=1, c=2, s=3, j=3),
             P1C2S3J4_15_ini = ic(a=15, p=1, c=2, s=3, j=4),
             P1C3S1J1_15_ini = ic(a=15, p=1, c=3, s=1, j=1),
             P1C3S1J2_15_ini = ic(a=15, p=1, c=3, s=1, j=2),
             P1C3S1J3_15_ini = ic(a=15, p=1, c=3, s=1, j=3),
             P1C3S1J4_15_ini = ic(a=15, p=1, c=3, s=1, j=4),
             P1C3S2J1_15_ini = ic(a=15, p=1, c=3, s=2, j=1),
             P1C3S2J2_15_ini = ic(a=15, p=1, c=3, s=2, j=2),
             P1C3S2J3_15_ini = ic(a=15, p=1, c=3, s=2, j=3),
             P1C3S2J4_15_ini = ic(a=15, p=1, c=3, s=2, j=4),
             P1C3S3J1_15_ini = ic(a=15, p=1, c=3, s=3, j=1),
             P1C3S3J2_15_ini = ic(a=15, p=1, c=3, s=3, j=2),
             P1C3S3J3_15_ini = ic(a=15, p=1, c=3, s=3, j=3),
             P1C3S3J4_15_ini = ic(a=15, p=1, c=3, s=3, j=4),
             P1C4S1J1_15_ini = ic(a=15, p=1, c=4, s=1, j=1),
             P1C4S1J2_15_ini = ic(a=15, p=1, c=4, s=1, j=2),
             P1C4S1J3_15_ini = ic(a=15, p=1, c=4, s=1, j=3),
             P1C4S1J4_15_ini = ic(a=15, p=1, c=4, s=1, j=4),
             P1C4S2J1_15_ini = ic(a=15, p=1, c=4, s=2, j=1),
             P1C4S2J2_15_ini = ic(a=15, p=1, c=4, s=2, j=2),
             P1C4S2J3_15_ini = ic(a=15, p=1, c=4, s=2, j=3),
             P1C4S2J4_15_ini = ic(a=15, p=1, c=4, s=2, j=4),
             P1C4S3J1_15_ini = ic(a=15, p=1, c=4, s=3, j=1),
             P1C4S3J2_15_ini = ic(a=15, p=1, c=4, s=3, j=2),
             P1C4S3J3_15_ini = ic(a=15, p=1, c=4, s=3, j=3),
             P1C4S3J4_15_ini = ic(a=15, p=1, c=4, s=3, j=4),
             P2C1S1J1_15_ini = ic(a=15, p=2, c=1, s=1, j=1),
             P2C1S1J2_15_ini = ic(a=15, p=2, c=1, s=1, j=2),
             P2C1S1J3_15_ini = ic(a=15, p=2, c=1, s=1, j=3),
             P2C1S1J4_15_ini = ic(a=15, p=2, c=1, s=1, j=4),
             P2C1S2J1_15_ini = ic(a=15, p=2, c=1, s=2, j=1),
             P2C1S2J2_15_ini = ic(a=15, p=2, c=1, s=2, j=2),
             P2C1S2J3_15_ini = ic(a=15, p=2, c=1, s=2, j=3),
             P2C1S2J4_15_ini = ic(a=15, p=2, c=1, s=2, j=4),
             P2C1S3J1_15_ini = ic(a=15, p=2, c=1, s=3, j=1),
             P2C1S3J2_15_ini = ic(a=15, p=2, c=1, s=3, j=2),
             P2C1S3J3_15_ini = ic(a=15, p=2, c=1, s=3, j=3),
             P2C1S3J4_15_ini = ic(a=15, p=2, c=1, s=3, j=4),
             P2C2S1J1_15_ini = ic(a=15, p=2, c=2, s=1, j=1),
             P2C2S1J2_15_ini = ic(a=15, p=2, c=2, s=1, j=2),
             P2C2S1J3_15_ini = ic(a=15, p=2, c=2, s=1, j=3),
             P2C2S1J4_15_ini = ic(a=15, p=2, c=2, s=1, j=4),
             P2C2S2J1_15_ini = ic(a=15, p=2, c=2, s=2, j=1),
             P2C2S2J2_15_ini = ic(a=15, p=2, c=2, s=2, j=2),
             P2C2S2J3_15_ini = ic(a=15, p=2, c=2, s=2, j=3),
             P2C2S2J4_15_ini = ic(a=15, p=2, c=2, s=2, j=4),
             P2C2S3J1_15_ini = ic(a=15, p=2, c=2, s=3, j=1),
             P2C2S3J2_15_ini = ic(a=15, p=2, c=2, s=3, j=2),
             P2C2S3J3_15_ini = ic(a=15, p=2, c=2, s=3, j=3),
             P2C2S3J4_15_ini = ic(a=15, p=2, c=2, s=3, j=4),
             P2C3S1J1_15_ini = ic(a=15, p=2, c=3, s=1, j=1),
             P2C3S1J2_15_ini = ic(a=15, p=2, c=3, s=1, j=2),
             P2C3S1J3_15_ini = ic(a=15, p=2, c=3, s=1, j=3),
             P2C3S1J4_15_ini = ic(a=15, p=2, c=3, s=1, j=4),
             P2C3S2J1_15_ini = ic(a=15, p=2, c=3, s=2, j=1),
             P2C3S2J2_15_ini = ic(a=15, p=2, c=3, s=2, j=2),
             P2C3S2J3_15_ini = ic(a=15, p=2, c=3, s=2, j=3),
             P2C3S2J4_15_ini = ic(a=15, p=2, c=3, s=2, j=4),
             P2C3S3J1_15_ini = ic(a=15, p=2, c=3, s=3, j=1),
             P2C3S3J2_15_ini = ic(a=15, p=2, c=3, s=3, j=2),
             P2C3S3J3_15_ini = ic(a=15, p=2, c=3, s=3, j=3),
             P2C3S3J4_15_ini = ic(a=15, p=2, c=3, s=3, j=4),
             P2C4S1J1_15_ini = ic(a=15, p=2, c=4, s=1, j=1),
             P2C4S1J2_15_ini = ic(a=15, p=2, c=4, s=1, j=2),
             P2C4S1J3_15_ini = ic(a=15, p=2, c=4, s=1, j=3),
             P2C4S1J4_15_ini = ic(a=15, p=2, c=4, s=1, j=4),
             P2C4S2J1_15_ini = ic(a=15, p=2, c=4, s=2, j=1),
             P2C4S2J2_15_ini = ic(a=15, p=2, c=4, s=2, j=2),
             P2C4S2J3_15_ini = ic(a=15, p=2, c=4, s=2, j=3),
             P2C4S2J4_15_ini = ic(a=15, p=2, c=4, s=2, j=4),
             P2C4S3J1_15_ini = ic(a=15, p=2, c=4, s=3, j=1),
             P2C4S3J2_15_ini = ic(a=15, p=2, c=4, s=3, j=2),
             P2C4S3J3_15_ini = ic(a=15, p=2, c=4, s=3, j=3),
             P2C4S3J4_15_ini = ic(a=15, p=2, c=4, s=3, j=4),
             P1C1S1J1_16_ini = ic(a=16, p=1, c=1, s=1, j=1),
             P1C1S1J2_16_ini = ic(a=16, p=1, c=1, s=1, j=2),
             P1C1S1J3_16_ini = ic(a=16, p=1, c=1, s=1, j=3),
             P1C1S1J4_16_ini = ic(a=16, p=1, c=1, s=1, j=4),
             P1C1S2J1_16_ini = ic(a=16, p=1, c=1, s=2, j=1),
             P1C1S2J2_16_ini = ic(a=16, p=1, c=1, s=2, j=2),
             P1C1S2J3_16_ini = ic(a=16, p=1, c=1, s=2, j=3),
             P1C1S2J4_16_ini = ic(a=16, p=1, c=1, s=2, j=4),
             P1C1S3J1_16_ini = ic(a=16, p=1, c=1, s=3, j=1),
             P1C1S3J2_16_ini = ic(a=16, p=1, c=1, s=3, j=2),
             P1C1S3J3_16_ini = ic(a=16, p=1, c=1, s=3, j=3),
             P1C1S3J4_16_ini = ic(a=16, p=1, c=1, s=3, j=4),
             P1C2S1J1_16_ini = ic(a=16, p=1, c=2, s=1, j=1),
             P1C2S1J2_16_ini = ic(a=16, p=1, c=2, s=1, j=2),
             P1C2S1J3_16_ini = ic(a=16, p=1, c=2, s=1, j=3),
             P1C2S1J4_16_ini = ic(a=16, p=1, c=2, s=1, j=4),
             P1C2S2J1_16_ini = ic(a=16, p=1, c=2, s=2, j=1),
             P1C2S2J2_16_ini = ic(a=16, p=1, c=2, s=2, j=2),
             P1C2S2J3_16_ini = ic(a=16, p=1, c=2, s=2, j=3),
             P1C2S2J4_16_ini = ic(a=16, p=1, c=2, s=2, j=4),
             P1C2S3J1_16_ini = ic(a=16, p=1, c=2, s=3, j=1),
             P1C2S3J2_16_ini = ic(a=16, p=1, c=2, s=3, j=2),
             P1C2S3J3_16_ini = ic(a=16, p=1, c=2, s=3, j=3),
             P1C2S3J4_16_ini = ic(a=16, p=1, c=2, s=3, j=4),
             P1C3S1J1_16_ini = ic(a=16, p=1, c=3, s=1, j=1),
             P1C3S1J2_16_ini = ic(a=16, p=1, c=3, s=1, j=2),
             P1C3S1J3_16_ini = ic(a=16, p=1, c=3, s=1, j=3),
             P1C3S1J4_16_ini = ic(a=16, p=1, c=3, s=1, j=4),
             P1C3S2J1_16_ini = ic(a=16, p=1, c=3, s=2, j=1),
             P1C3S2J2_16_ini = ic(a=16, p=1, c=3, s=2, j=2),
             P1C3S2J3_16_ini = ic(a=16, p=1, c=3, s=2, j=3),
             P1C3S2J4_16_ini = ic(a=16, p=1, c=3, s=2, j=4),
             P1C3S3J1_16_ini = ic(a=16, p=1, c=3, s=3, j=1),
             P1C3S3J2_16_ini = ic(a=16, p=1, c=3, s=3, j=2),
             P1C3S3J3_16_ini = ic(a=16, p=1, c=3, s=3, j=3),
             P1C3S3J4_16_ini = ic(a=16, p=1, c=3, s=3, j=4),
             P1C4S1J1_16_ini = ic(a=16, p=1, c=4, s=1, j=1),
             P1C4S1J2_16_ini = ic(a=16, p=1, c=4, s=1, j=2),
             P1C4S1J3_16_ini = ic(a=16, p=1, c=4, s=1, j=3),
             P1C4S1J4_16_ini = ic(a=16, p=1, c=4, s=1, j=4),
             P1C4S2J1_16_ini = ic(a=16, p=1, c=4, s=2, j=1),
             P1C4S2J2_16_ini = ic(a=16, p=1, c=4, s=2, j=2),
             P1C4S2J3_16_ini = ic(a=16, p=1, c=4, s=2, j=3),
             P1C4S2J4_16_ini = ic(a=16, p=1, c=4, s=2, j=4),
             P1C4S3J1_16_ini = ic(a=16, p=1, c=4, s=3, j=1),
             P1C4S3J2_16_ini = ic(a=16, p=1, c=4, s=3, j=2),
             P1C4S3J3_16_ini = ic(a=16, p=1, c=4, s=3, j=3),
             P1C4S3J4_16_ini = ic(a=16, p=1, c=4, s=3, j=4),
             P2C1S1J1_16_ini = ic(a=16, p=2, c=1, s=1, j=1),
             P2C1S1J2_16_ini = ic(a=16, p=2, c=1, s=1, j=2),
             P2C1S1J3_16_ini = ic(a=16, p=2, c=1, s=1, j=3),
             P2C1S1J4_16_ini = ic(a=16, p=2, c=1, s=1, j=4),
             P2C1S2J1_16_ini = ic(a=16, p=2, c=1, s=2, j=1),
             P2C1S2J2_16_ini = ic(a=16, p=2, c=1, s=2, j=2),
             P2C1S2J3_16_ini = ic(a=16, p=2, c=1, s=2, j=3),
             P2C1S2J4_16_ini = ic(a=16, p=2, c=1, s=2, j=4),
             P2C1S3J1_16_ini = ic(a=16, p=2, c=1, s=3, j=1),
             P2C1S3J2_16_ini = ic(a=16, p=2, c=1, s=3, j=2),
             P2C1S3J3_16_ini = ic(a=16, p=2, c=1, s=3, j=3),
             P2C1S3J4_16_ini = ic(a=16, p=2, c=1, s=3, j=4),
             P2C2S1J1_16_ini = ic(a=16, p=2, c=2, s=1, j=1),
             P2C2S1J2_16_ini = ic(a=16, p=2, c=2, s=1, j=2),
             P2C2S1J3_16_ini = ic(a=16, p=2, c=2, s=1, j=3),
             P2C2S1J4_16_ini = ic(a=16, p=2, c=2, s=1, j=4),
             P2C2S2J1_16_ini = ic(a=16, p=2, c=2, s=2, j=1),
             P2C2S2J2_16_ini = ic(a=16, p=2, c=2, s=2, j=2),
             P2C2S2J3_16_ini = ic(a=16, p=2, c=2, s=2, j=3),
             P2C2S2J4_16_ini = ic(a=16, p=2, c=2, s=2, j=4),
             P2C2S3J1_16_ini = ic(a=16, p=2, c=2, s=3, j=1),
             P2C2S3J2_16_ini = ic(a=16, p=2, c=2, s=3, j=2),
             P2C2S3J3_16_ini = ic(a=16, p=2, c=2, s=3, j=3),
             P2C2S3J4_16_ini = ic(a=16, p=2, c=2, s=3, j=4),
             P2C3S1J1_16_ini = ic(a=16, p=2, c=3, s=1, j=1),
             P2C3S1J2_16_ini = ic(a=16, p=2, c=3, s=1, j=2),
             P2C3S1J3_16_ini = ic(a=16, p=2, c=3, s=1, j=3),
             P2C3S1J4_16_ini = ic(a=16, p=2, c=3, s=1, j=4),
             P2C3S2J1_16_ini = ic(a=16, p=2, c=3, s=2, j=1),
             P2C3S2J2_16_ini = ic(a=16, p=2, c=3, s=2, j=2),
             P2C3S2J3_16_ini = ic(a=16, p=2, c=3, s=2, j=3),
             P2C3S2J4_16_ini = ic(a=16, p=2, c=3, s=2, j=4),
             P2C3S3J1_16_ini = ic(a=16, p=2, c=3, s=3, j=1),
             P2C3S3J2_16_ini = ic(a=16, p=2, c=3, s=3, j=2),
             P2C3S3J3_16_ini = ic(a=16, p=2, c=3, s=3, j=3),
             P2C3S3J4_16_ini = ic(a=16, p=2, c=3, s=3, j=4),
             P2C4S1J1_16_ini = ic(a=16, p=2, c=4, s=1, j=1),
             P2C4S1J2_16_ini = ic(a=16, p=2, c=4, s=1, j=2),
             P2C4S1J3_16_ini = ic(a=16, p=2, c=4, s=1, j=3),
             P2C4S1J4_16_ini = ic(a=16, p=2, c=4, s=1, j=4),
             P2C4S2J1_16_ini = ic(a=16, p=2, c=4, s=2, j=1),
             P2C4S2J2_16_ini = ic(a=16, p=2, c=4, s=2, j=2),
             P2C4S2J3_16_ini = ic(a=16, p=2, c=4, s=2, j=3),
             P2C4S2J4_16_ini = ic(a=16, p=2, c=4, s=2, j=4),
             P2C4S3J1_16_ini = ic(a=16, p=2, c=4, s=3, j=1),
             P2C4S3J2_16_ini = ic(a=16, p=2, c=4, s=3, j=2),
             P2C4S3J3_16_ini = ic(a=16, p=2, c=4, s=3, j=3),
             P2C4S3J4_16_ini = ic(a=16, p=2, c=4, s=3, j=4),
             P1C1S1J1_17_ini = ic(a=17, p=1, c=1, s=1, j=1),
             P1C1S1J2_17_ini = ic(a=17, p=1, c=1, s=1, j=2),
             P1C1S1J3_17_ini = ic(a=17, p=1, c=1, s=1, j=3),
             P1C1S1J4_17_ini = ic(a=17, p=1, c=1, s=1, j=4),
             P1C1S2J1_17_ini = ic(a=17, p=1, c=1, s=2, j=1),
             P1C1S2J2_17_ini = ic(a=17, p=1, c=1, s=2, j=2),
             P1C1S2J3_17_ini = ic(a=17, p=1, c=1, s=2, j=3),
             P1C1S2J4_17_ini = ic(a=17, p=1, c=1, s=2, j=4),
             P1C1S3J1_17_ini = ic(a=17, p=1, c=1, s=3, j=1),
             P1C1S3J2_17_ini = ic(a=17, p=1, c=1, s=3, j=2),
             P1C1S3J3_17_ini = ic(a=17, p=1, c=1, s=3, j=3),
             P1C1S3J4_17_ini = ic(a=17, p=1, c=1, s=3, j=4),
             P1C2S1J1_17_ini = ic(a=17, p=1, c=2, s=1, j=1),
             P1C2S1J2_17_ini = ic(a=17, p=1, c=2, s=1, j=2),
             P1C2S1J3_17_ini = ic(a=17, p=1, c=2, s=1, j=3),
             P1C2S1J4_17_ini = ic(a=17, p=1, c=2, s=1, j=4),
             P1C2S2J1_17_ini = ic(a=17, p=1, c=2, s=2, j=1),
             P1C2S2J2_17_ini = ic(a=17, p=1, c=2, s=2, j=2),
             P1C2S2J3_17_ini = ic(a=17, p=1, c=2, s=2, j=3),
             P1C2S2J4_17_ini = ic(a=17, p=1, c=2, s=2, j=4),
             P1C2S3J1_17_ini = ic(a=17, p=1, c=2, s=3, j=1),
             P1C2S3J2_17_ini = ic(a=17, p=1, c=2, s=3, j=2),
             P1C2S3J3_17_ini = ic(a=17, p=1, c=2, s=3, j=3),
             P1C2S3J4_17_ini = ic(a=17, p=1, c=2, s=3, j=4),
             P1C3S1J1_17_ini = ic(a=17, p=1, c=3, s=1, j=1),
             P1C3S1J2_17_ini = ic(a=17, p=1, c=3, s=1, j=2),
             P1C3S1J3_17_ini = ic(a=17, p=1, c=3, s=1, j=3),
             P1C3S1J4_17_ini = ic(a=17, p=1, c=3, s=1, j=4),
             P1C3S2J1_17_ini = ic(a=17, p=1, c=3, s=2, j=1),
             P1C3S2J2_17_ini = ic(a=17, p=1, c=3, s=2, j=2),
             P1C3S2J3_17_ini = ic(a=17, p=1, c=3, s=2, j=3),
             P1C3S2J4_17_ini = ic(a=17, p=1, c=3, s=2, j=4),
             P1C3S3J1_17_ini = ic(a=17, p=1, c=3, s=3, j=1),
             P1C3S3J2_17_ini = ic(a=17, p=1, c=3, s=3, j=2),
             P1C3S3J3_17_ini = ic(a=17, p=1, c=3, s=3, j=3),
             P1C3S3J4_17_ini = ic(a=17, p=1, c=3, s=3, j=4),
             P1C4S1J1_17_ini = ic(a=17, p=1, c=4, s=1, j=1),
             P1C4S1J2_17_ini = ic(a=17, p=1, c=4, s=1, j=2),
             P1C4S1J3_17_ini = ic(a=17, p=1, c=4, s=1, j=3),
             P1C4S1J4_17_ini = ic(a=17, p=1, c=4, s=1, j=4),
             P1C4S2J1_17_ini = ic(a=17, p=1, c=4, s=2, j=1),
             P1C4S2J2_17_ini = ic(a=17, p=1, c=4, s=2, j=2),
             P1C4S2J3_17_ini = ic(a=17, p=1, c=4, s=2, j=3),
             P1C4S2J4_17_ini = ic(a=17, p=1, c=4, s=2, j=4),
             P1C4S3J1_17_ini = ic(a=17, p=1, c=4, s=3, j=1),
             P1C4S3J2_17_ini = ic(a=17, p=1, c=4, s=3, j=2),
             P1C4S3J3_17_ini = ic(a=17, p=1, c=4, s=3, j=3),
             P1C4S3J4_17_ini = ic(a=17, p=1, c=4, s=3, j=4),
             P2C1S1J1_17_ini = ic(a=17, p=2, c=1, s=1, j=1),
             P2C1S1J2_17_ini = ic(a=17, p=2, c=1, s=1, j=2),
             P2C1S1J3_17_ini = ic(a=17, p=2, c=1, s=1, j=3),
             P2C1S1J4_17_ini = ic(a=17, p=2, c=1, s=1, j=4),
             P2C1S2J1_17_ini = ic(a=17, p=2, c=1, s=2, j=1),
             P2C1S2J2_17_ini = ic(a=17, p=2, c=1, s=2, j=2),
             P2C1S2J3_17_ini = ic(a=17, p=2, c=1, s=2, j=3),
             P2C1S2J4_17_ini = ic(a=17, p=2, c=1, s=2, j=4),
             P2C1S3J1_17_ini = ic(a=17, p=2, c=1, s=3, j=1),
             P2C1S3J2_17_ini = ic(a=17, p=2, c=1, s=3, j=2),
             P2C1S3J3_17_ini = ic(a=17, p=2, c=1, s=3, j=3),
             P2C1S3J4_17_ini = ic(a=17, p=2, c=1, s=3, j=4),
             P2C2S1J1_17_ini = ic(a=17, p=2, c=2, s=1, j=1),
             P2C2S1J2_17_ini = ic(a=17, p=2, c=2, s=1, j=2),
             P2C2S1J3_17_ini = ic(a=17, p=2, c=2, s=1, j=3),
             P2C2S1J4_17_ini = ic(a=17, p=2, c=2, s=1, j=4),
             P2C2S2J1_17_ini = ic(a=17, p=2, c=2, s=2, j=1),
             P2C2S2J2_17_ini = ic(a=17, p=2, c=2, s=2, j=2),
             P2C2S2J3_17_ini = ic(a=17, p=2, c=2, s=2, j=3),
             P2C2S2J4_17_ini = ic(a=17, p=2, c=2, s=2, j=4),
             P2C2S3J1_17_ini = ic(a=17, p=2, c=2, s=3, j=1),
             P2C2S3J2_17_ini = ic(a=17, p=2, c=2, s=3, j=2),
             P2C2S3J3_17_ini = ic(a=17, p=2, c=2, s=3, j=3),
             P2C2S3J4_17_ini = ic(a=17, p=2, c=2, s=3, j=4),
             P2C3S1J1_17_ini = ic(a=17, p=2, c=3, s=1, j=1),
             P2C3S1J2_17_ini = ic(a=17, p=2, c=3, s=1, j=2),
             P2C3S1J3_17_ini = ic(a=17, p=2, c=3, s=1, j=3),
             P2C3S1J4_17_ini = ic(a=17, p=2, c=3, s=1, j=4),
             P2C3S2J1_17_ini = ic(a=17, p=2, c=3, s=2, j=1),
             P2C3S2J2_17_ini = ic(a=17, p=2, c=3, s=2, j=2),
             P2C3S2J3_17_ini = ic(a=17, p=2, c=3, s=2, j=3),
             P2C3S2J4_17_ini = ic(a=17, p=2, c=3, s=2, j=4),
             P2C3S3J1_17_ini = ic(a=17, p=2, c=3, s=3, j=1),
             P2C3S3J2_17_ini = ic(a=17, p=2, c=3, s=3, j=2),
             P2C3S3J3_17_ini = ic(a=17, p=2, c=3, s=3, j=3),
             P2C3S3J4_17_ini = ic(a=17, p=2, c=3, s=3, j=4),
             P2C4S1J1_17_ini = ic(a=17, p=2, c=4, s=1, j=1),
             P2C4S1J2_17_ini = ic(a=17, p=2, c=4, s=1, j=2),
             P2C4S1J3_17_ini = ic(a=17, p=2, c=4, s=1, j=3),
             P2C4S1J4_17_ini = ic(a=17, p=2, c=4, s=1, j=4),
             P2C4S2J1_17_ini = ic(a=17, p=2, c=4, s=2, j=1),
             P2C4S2J2_17_ini = ic(a=17, p=2, c=4, s=2, j=2),
             P2C4S2J3_17_ini = ic(a=17, p=2, c=4, s=2, j=3),
             P2C4S2J4_17_ini = ic(a=17, p=2, c=4, s=2, j=4),
             P2C4S3J1_17_ini = ic(a=17, p=2, c=4, s=3, j=1),
             P2C4S3J2_17_ini = ic(a=17, p=2, c=4, s=3, j=2),
             P2C4S3J3_17_ini = ic(a=17, p=2, c=4, s=3, j=3),
             P2C4S3J4_17_ini = ic(a=17, p=2, c=4, s=3, j=4),
             
             ss_p1c1s1j1_10 = 0,
             ss_p1c1s1j2_10 = 0,
             ss_p1c1s1j3_10 = 0,
             ss_p1c1s1j4_10 = 0,
             ss_p1c1s2j1_10 = 0,
             ss_p1c1s2j2_10 = 0,
             ss_p1c1s2j3_10 = 0,
             ss_p1c1s2j4_10 = 0,
             ss_p1c1s3j1_10 = 0,
             ss_p1c1s3j2_10 = 0,
             ss_p1c1s3j3_10 = 0,
             ss_p1c1s3j4_10 = 0,
             ss_p1c2s1j1_10 = 0,
             ss_p1c2s1j2_10 = 0,
             ss_p1c2s1j3_10 = 0,
             ss_p1c2s1j4_10 = 0,
             ss_p1c2s2j1_10 = 0,
             ss_p1c2s2j2_10 = 0,
             ss_p1c2s2j3_10 = 0,
             ss_p1c2s2j4_10 = 0,
             ss_p1c2s3j1_10 = 0,
             ss_p1c2s3j2_10 = 0,
             ss_p1c2s3j3_10 = 0,
             ss_p1c2s3j4_10 = 0,
             ss_p1c3s1j1_10 = 0,
             ss_p1c3s1j2_10 = 0,
             ss_p1c3s1j3_10 = 0,
             ss_p1c3s1j4_10 = 0,
             ss_p1c3s2j1_10 = 0,
             ss_p1c3s2j2_10 = 0,
             ss_p1c3s2j3_10 = 0,
             ss_p1c3s2j4_10 = 0,
             ss_p1c3s3j1_10 = 0,
             ss_p1c3s3j2_10 = 0,
             ss_p1c3s3j3_10 = 0,
             ss_p1c3s3j4_10 = 0,
             ss_p1c4s1j1_10 = 0,
             ss_p1c4s1j2_10 = 0,
             ss_p1c4s1j3_10 = 0,
             ss_p1c4s1j4_10 = 0,
             ss_p1c4s2j1_10 = 0,
             ss_p1c4s2j2_10 = 0,
             ss_p1c4s2j3_10 = 0,
             ss_p1c4s2j4_10 = 0,
             ss_p1c4s3j1_10 = 0,
             ss_p1c4s3j2_10 = 0,
             ss_p1c4s3j3_10 = 0,
             ss_p1c4s3j4_10 = 0,
             ss_p2c1s1j1_10 = 0,
             ss_p2c1s1j2_10 = 0,
             ss_p2c1s1j3_10 = 0,
             ss_p2c1s1j4_10 = 0,
             ss_p2c1s2j1_10 = 0,
             ss_p2c1s2j2_10 = 0,
             ss_p2c1s2j3_10 = 0,
             ss_p2c1s2j4_10 = 0,
             ss_p2c1s3j1_10 = 0,
             ss_p2c1s3j2_10 = 0,
             ss_p2c1s3j3_10 = 0,
             ss_p2c1s3j4_10 = 0,
             ss_p2c2s1j1_10 = 0,
             ss_p2c2s1j2_10 = 0,
             ss_p2c2s1j3_10 = 0,
             ss_p2c2s1j4_10 = 0,
             ss_p2c2s2j1_10 = 0,
             ss_p2c2s2j2_10 = 0,
             ss_p2c2s2j3_10 = 0,
             ss_p2c2s2j4_10 = 0,
             ss_p2c2s3j1_10 = 0,
             ss_p2c2s3j2_10 = 0,
             ss_p2c2s3j3_10 = 0,
             ss_p2c2s3j4_10 = 0,
             ss_p2c3s1j1_10 = 0,
             ss_p2c3s1j2_10 = 0,
             ss_p2c3s1j3_10 = 0,
             ss_p2c3s1j4_10 = 0,
             ss_p2c3s2j1_10 = 0,
             ss_p2c3s2j2_10 = 0,
             ss_p2c3s2j3_10 = 0,
             ss_p2c3s2j4_10 = 0,
             ss_p2c3s3j1_10 = 0,
             ss_p2c3s3j2_10 = 0,
             ss_p2c3s3j3_10 = 0,
             ss_p2c3s3j4_10 = 0,
             ss_p2c4s1j1_10 = 0,
             ss_p2c4s1j2_10 = 0,
             ss_p2c4s1j3_10 = 0,
             ss_p2c4s1j4_10 = 0,
             ss_p2c4s2j1_10 = 0,
             ss_p2c4s2j2_10 = 0,
             ss_p2c4s2j3_10 = 0,
             ss_p2c4s2j4_10 = 0,
             ss_p2c4s3j1_10 = 0,
             ss_p2c4s3j2_10 = 0,
             ss_p2c4s3j3_10 = 0,
             ss_p2c4s3j4_10 = 0,
             ss_p1c1s1j1_11 = 0,
             ss_p1c1s1j2_11 = 0,
             ss_p1c1s1j3_11 = 0,
             ss_p1c1s1j4_11 = 0,
             ss_p1c1s2j1_11 = 0,
             ss_p1c1s2j2_11 = 0,
             ss_p1c1s2j3_11 = 0,
             ss_p1c1s2j4_11 = 0,
             ss_p1c1s3j1_11 = 0,
             ss_p1c1s3j2_11 = 0,
             ss_p1c1s3j3_11 = 0,
             ss_p1c1s3j4_11 = 0,
             ss_p1c2s1j1_11 = 0,
             ss_p1c2s1j2_11 = 0,
             ss_p1c2s1j3_11 = 0,
             ss_p1c2s1j4_11 = 0,
             ss_p1c2s2j1_11 = 0,
             ss_p1c2s2j2_11 = 0,
             ss_p1c2s2j3_11 = 0,
             ss_p1c2s2j4_11 = 0,
             ss_p1c2s3j1_11 = 0,
             ss_p1c2s3j2_11 = 0,
             ss_p1c2s3j3_11 = 0,
             ss_p1c2s3j4_11 = 0,
             ss_p1c3s1j1_11 = 0,
             ss_p1c3s1j2_11 = 0,
             ss_p1c3s1j3_11 = 0,
             ss_p1c3s1j4_11 = 0,
             ss_p1c3s2j1_11 = 0,
             ss_p1c3s2j2_11 = 0,
             ss_p1c3s2j3_11 = 0,
             ss_p1c3s2j4_11 = 0,
             ss_p1c3s3j1_11 = 0,
             ss_p1c3s3j2_11 = 0,
             ss_p1c3s3j3_11 = 0,
             ss_p1c3s3j4_11 = 0,
             ss_p1c4s1j1_11 = 0,
             ss_p1c4s1j2_11 = 0,
             ss_p1c4s1j3_11 = 0,
             ss_p1c4s1j4_11 = 0,
             ss_p1c4s2j1_11 = 0,
             ss_p1c4s2j2_11 = 0,
             ss_p1c4s2j3_11 = 0,
             ss_p1c4s2j4_11 = 0,
             ss_p1c4s3j1_11 = 0,
             ss_p1c4s3j2_11 = 0,
             ss_p1c4s3j3_11 = 0,
             ss_p1c4s3j4_11 = 0,
             ss_p2c1s1j1_11 = 0,
             ss_p2c1s1j2_11 = 0,
             ss_p2c1s1j3_11 = 0,
             ss_p2c1s1j4_11 = 0,
             ss_p2c1s2j1_11 = 0,
             ss_p2c1s2j2_11 = 0,
             ss_p2c1s2j3_11 = 0,
             ss_p2c1s2j4_11 = 0,
             ss_p2c1s3j1_11 = 0,
             ss_p2c1s3j2_11 = 0,
             ss_p2c1s3j3_11 = 0,
             ss_p2c1s3j4_11 = 0,
             ss_p2c2s1j1_11 = 0,
             ss_p2c2s1j2_11 = 0,
             ss_p2c2s1j3_11 = 0,
             ss_p2c2s1j4_11 = 0,
             ss_p2c2s2j1_11 = 0,
             ss_p2c2s2j2_11 = 0,
             ss_p2c2s2j3_11 = 0,
             ss_p2c2s2j4_11 = 0,
             ss_p2c2s3j1_11 = 0,
             ss_p2c2s3j2_11 = 0,
             ss_p2c2s3j3_11 = 0,
             ss_p2c2s3j4_11 = 0,
             ss_p2c3s1j1_11 = 0,
             ss_p2c3s1j2_11 = 0,
             ss_p2c3s1j3_11 = 0,
             ss_p2c3s1j4_11 = 0,
             ss_p2c3s2j1_11 = 0,
             ss_p2c3s2j2_11 = 0,
             ss_p2c3s2j3_11 = 0,
             ss_p2c3s2j4_11 = 0,
             ss_p2c3s3j1_11 = 0,
             ss_p2c3s3j2_11 = 0,
             ss_p2c3s3j3_11 = 0,
             ss_p2c3s3j4_11 = 0,
             ss_p2c4s1j1_11 = 0,
             ss_p2c4s1j2_11 = 0,
             ss_p2c4s1j3_11 = 0,
             ss_p2c4s1j4_11 = 0,
             ss_p2c4s2j1_11 = 0,
             ss_p2c4s2j2_11 = 0,
             ss_p2c4s2j3_11 = 0,
             ss_p2c4s2j4_11 = 0,
             ss_p2c4s3j1_11 = 0,
             ss_p2c4s3j2_11 = 0,
             ss_p2c4s3j3_11 = 0,
             ss_p2c4s3j4_11 = 0,
             ss_p1c1s1j1_12 = 0,
             ss_p1c1s1j2_12 = 0,
             ss_p1c1s1j3_12 = 0,
             ss_p1c1s1j4_12 = 0,
             ss_p1c1s2j1_12 = 0,
             ss_p1c1s2j2_12 = 0,
             ss_p1c1s2j3_12 = 0,
             ss_p1c1s2j4_12 = 0,
             ss_p1c1s3j1_12 = 0,
             ss_p1c1s3j2_12 = 0,
             ss_p1c1s3j3_12 = 0,
             ss_p1c1s3j4_12 = 0,
             ss_p1c2s1j1_12 = 0,
             ss_p1c2s1j2_12 = 0,
             ss_p1c2s1j3_12 = 0,
             ss_p1c2s1j4_12 = 0,
             ss_p1c2s2j1_12 = 0,
             ss_p1c2s2j2_12 = 0,
             ss_p1c2s2j3_12 = 0,
             ss_p1c2s2j4_12 = 0,
             ss_p1c2s3j1_12 = 0,
             ss_p1c2s3j2_12 = 0,
             ss_p1c2s3j3_12 = 0,
             ss_p1c2s3j4_12 = 0,
             ss_p1c3s1j1_12 = 0,
             ss_p1c3s1j2_12 = 0,
             ss_p1c3s1j3_12 = 0,
             ss_p1c3s1j4_12 = 0,
             ss_p1c3s2j1_12 = 0,
             ss_p1c3s2j2_12 = 0,
             ss_p1c3s2j3_12 = 0,
             ss_p1c3s2j4_12 = 0,
             ss_p1c3s3j1_12 = 0,
             ss_p1c3s3j2_12 = 0,
             ss_p1c3s3j3_12 = 0,
             ss_p1c3s3j4_12 = 0,
             ss_p1c4s1j1_12 = 0,
             ss_p1c4s1j2_12 = 0,
             ss_p1c4s1j3_12 = 0,
             ss_p1c4s1j4_12 = 0,
             ss_p1c4s2j1_12 = 0,
             ss_p1c4s2j2_12 = 0,
             ss_p1c4s2j3_12 = 0,
             ss_p1c4s2j4_12 = 0,
             ss_p1c4s3j1_12 = 0,
             ss_p1c4s3j2_12 = 0,
             ss_p1c4s3j3_12 = 0,
             ss_p1c4s3j4_12 = 0,
             ss_p2c1s1j1_12 = 0,
             ss_p2c1s1j2_12 = 0,
             ss_p2c1s1j3_12 = 0,
             ss_p2c1s1j4_12 = 0,
             ss_p2c1s2j1_12 = 0,
             ss_p2c1s2j2_12 = 0,
             ss_p2c1s2j3_12 = 0,
             ss_p2c1s2j4_12 = 0,
             ss_p2c1s3j1_12 = 0,
             ss_p2c1s3j2_12 = 0,
             ss_p2c1s3j3_12 = 0,
             ss_p2c1s3j4_12 = 0,
             ss_p2c2s1j1_12 = 0,
             ss_p2c2s1j2_12 = 0,
             ss_p2c2s1j3_12 = 0,
             ss_p2c2s1j4_12 = 0,
             ss_p2c2s2j1_12 = 0,
             ss_p2c2s2j2_12 = 0,
             ss_p2c2s2j3_12 = 0,
             ss_p2c2s2j4_12 = 0,
             ss_p2c2s3j1_12 = 0,
             ss_p2c2s3j2_12 = 0,
             ss_p2c2s3j3_12 = 0,
             ss_p2c2s3j4_12 = 0,
             ss_p2c3s1j1_12 = 0,
             ss_p2c3s1j2_12 = 0,
             ss_p2c3s1j3_12 = 0,
             ss_p2c3s1j4_12 = 0,
             ss_p2c3s2j1_12 = 0,
             ss_p2c3s2j2_12 = 0,
             ss_p2c3s2j3_12 = 0,
             ss_p2c3s2j4_12 = 0,
             ss_p2c3s3j1_12 = 0,
             ss_p2c3s3j2_12 = 0,
             ss_p2c3s3j3_12 = 0,
             ss_p2c3s3j4_12 = 0,
             ss_p2c4s1j1_12 = 0,
             ss_p2c4s1j2_12 = 0,
             ss_p2c4s1j3_12 = 0,
             ss_p2c4s1j4_12 = 0,
             ss_p2c4s2j1_12 = 0,
             ss_p2c4s2j2_12 = 0,
             ss_p2c4s2j3_12 = 0,
             ss_p2c4s2j4_12 = 0,
             ss_p2c4s3j1_12 = 0,
             ss_p2c4s3j2_12 = 0,
             ss_p2c4s3j3_12 = 0,
             ss_p2c4s3j4_12 = 0,
             ss_p1c1s1j1_13 = 0,
             ss_p1c1s1j2_13 = 0,
             ss_p1c1s1j3_13 = 0,
             ss_p1c1s1j4_13 = 0,
             ss_p1c1s2j1_13 = 0,
             ss_p1c1s2j2_13 = 0,
             ss_p1c1s2j3_13 = 0,
             ss_p1c1s2j4_13 = 0,
             ss_p1c1s3j1_13 = 0,
             ss_p1c1s3j2_13 = 0,
             ss_p1c1s3j3_13 = 0,
             ss_p1c1s3j4_13 = 0,
             ss_p1c2s1j1_13 = 0,
             ss_p1c2s1j2_13 = 0,
             ss_p1c2s1j3_13 = 0,
             ss_p1c2s1j4_13 = 0,
             ss_p1c2s2j1_13 = 0,
             ss_p1c2s2j2_13 = 0,
             ss_p1c2s2j3_13 = 0,
             ss_p1c2s2j4_13 = 0,
             ss_p1c2s3j1_13 = 0,
             ss_p1c2s3j2_13 = 0,
             ss_p1c2s3j3_13 = 0,
             ss_p1c2s3j4_13 = 0,
             ss_p1c3s1j1_13 = 0,
             ss_p1c3s1j2_13 = 0,
             ss_p1c3s1j3_13 = 0,
             ss_p1c3s1j4_13 = 0,
             ss_p1c3s2j1_13 = 0,
             ss_p1c3s2j2_13 = 0,
             ss_p1c3s2j3_13 = 0,
             ss_p1c3s2j4_13 = 0,
             ss_p1c3s3j1_13 = 0,
             ss_p1c3s3j2_13 = 0,
             ss_p1c3s3j3_13 = 0,
             ss_p1c3s3j4_13 = 0,
             ss_p1c4s1j1_13 = 0,
             ss_p1c4s1j2_13 = 0,
             ss_p1c4s1j3_13 = 0,
             ss_p1c4s1j4_13 = 0,
             ss_p1c4s2j1_13 = 0,
             ss_p1c4s2j2_13 = 0,
             ss_p1c4s2j3_13 = 0,
             ss_p1c4s2j4_13 = 0,
             ss_p1c4s3j1_13 = 0,
             ss_p1c4s3j2_13 = 0,
             ss_p1c4s3j3_13 = 0,
             ss_p1c4s3j4_13 = 0,
             ss_p2c1s1j1_13 = 0,
             ss_p2c1s1j2_13 = 0,
             ss_p2c1s1j3_13 = 0,
             ss_p2c1s1j4_13 = 0,
             ss_p2c1s2j1_13 = 0,
             ss_p2c1s2j2_13 = 0,
             ss_p2c1s2j3_13 = 0,
             ss_p2c1s2j4_13 = 0,
             ss_p2c1s3j1_13 = 0,
             ss_p2c1s3j2_13 = 0,
             ss_p2c1s3j3_13 = 0,
             ss_p2c1s3j4_13 = 0,
             ss_p2c2s1j1_13 = 0,
             ss_p2c2s1j2_13 = 0,
             ss_p2c2s1j3_13 = 0,
             ss_p2c2s1j4_13 = 0,
             ss_p2c2s2j1_13 = 0,
             ss_p2c2s2j2_13 = 0,
             ss_p2c2s2j3_13 = 0,
             ss_p2c2s2j4_13 = 0,
             ss_p2c2s3j1_13 = 0,
             ss_p2c2s3j2_13 = 0,
             ss_p2c2s3j3_13 = 0,
             ss_p2c2s3j4_13 = 0,
             ss_p2c3s1j1_13 = 0,
             ss_p2c3s1j2_13 = 0,
             ss_p2c3s1j3_13 = 0,
             ss_p2c3s1j4_13 = 0,
             ss_p2c3s2j1_13 = 0,
             ss_p2c3s2j2_13 = 0,
             ss_p2c3s2j3_13 = 0,
             ss_p2c3s2j4_13 = 0,
             ss_p2c3s3j1_13 = 0,
             ss_p2c3s3j2_13 = 0,
             ss_p2c3s3j3_13 = 0,
             ss_p2c3s3j4_13 = 0,
             ss_p2c4s1j1_13 = 0,
             ss_p2c4s1j2_13 = 0,
             ss_p2c4s1j3_13 = 0,
             ss_p2c4s1j4_13 = 0,
             ss_p2c4s2j1_13 = 0,
             ss_p2c4s2j2_13 = 0,
             ss_p2c4s2j3_13 = 0,
             ss_p2c4s2j4_13 = 0,
             ss_p2c4s3j1_13 = 0,
             ss_p2c4s3j2_13 = 0,
             ss_p2c4s3j3_13 = 0,
             ss_p2c4s3j4_13 = 0,
             ss_p1c1s1j1_14 = 0,
             ss_p1c1s1j2_14 = 0,
             ss_p1c1s1j3_14 = 0,
             ss_p1c1s1j4_14 = 0,
             ss_p1c1s2j1_14 = 0,
             ss_p1c1s2j2_14 = 0,
             ss_p1c1s2j3_14 = 0,
             ss_p1c1s2j4_14 = 0,
             ss_p1c1s3j1_14 = 0,
             ss_p1c1s3j2_14 = 0,
             ss_p1c1s3j3_14 = 0,
             ss_p1c1s3j4_14 = 0,
             ss_p1c2s1j1_14 = 0,
             ss_p1c2s1j2_14 = 0,
             ss_p1c2s1j3_14 = 0,
             ss_p1c2s1j4_14 = 0,
             ss_p1c2s2j1_14 = 0,
             ss_p1c2s2j2_14 = 0,
             ss_p1c2s2j3_14 = 0,
             ss_p1c2s2j4_14 = 0,
             ss_p1c2s3j1_14 = 0,
             ss_p1c2s3j2_14 = 0,
             ss_p1c2s3j3_14 = 0,
             ss_p1c2s3j4_14 = 0,
             ss_p1c3s1j1_14 = 0,
             ss_p1c3s1j2_14 = 0,
             ss_p1c3s1j3_14 = 0,
             ss_p1c3s1j4_14 = 0,
             ss_p1c3s2j1_14 = 0,
             ss_p1c3s2j2_14 = 0,
             ss_p1c3s2j3_14 = 0,
             ss_p1c3s2j4_14 = 0,
             ss_p1c3s3j1_14 = 0,
             ss_p1c3s3j2_14 = 0,
             ss_p1c3s3j3_14 = 0,
             ss_p1c3s3j4_14 = 0,
             ss_p1c4s1j1_14 = 0,
             ss_p1c4s1j2_14 = 0,
             ss_p1c4s1j3_14 = 0,
             ss_p1c4s1j4_14 = 0,
             ss_p1c4s2j1_14 = 0,
             ss_p1c4s2j2_14 = 0,
             ss_p1c4s2j3_14 = 0,
             ss_p1c4s2j4_14 = 0,
             ss_p1c4s3j1_14 = 0,
             ss_p1c4s3j2_14 = 0,
             ss_p1c4s3j3_14 = 0,
             ss_p1c4s3j4_14 = 0,
             ss_p2c1s1j1_14 = 0,
             ss_p2c1s1j2_14 = 0,
             ss_p2c1s1j3_14 = 0,
             ss_p2c1s1j4_14 = 0,
             ss_p2c1s2j1_14 = 0,
             ss_p2c1s2j2_14 = 0,
             ss_p2c1s2j3_14 = 0,
             ss_p2c1s2j4_14 = 0,
             ss_p2c1s3j1_14 = 0,
             ss_p2c1s3j2_14 = 0,
             ss_p2c1s3j3_14 = 0,
             ss_p2c1s3j4_14 = 0,
             ss_p2c2s1j1_14 = 0,
             ss_p2c2s1j2_14 = 0,
             ss_p2c2s1j3_14 = 0,
             ss_p2c2s1j4_14 = 0,
             ss_p2c2s2j1_14 = 0,
             ss_p2c2s2j2_14 = 0,
             ss_p2c2s2j3_14 = 0,
             ss_p2c2s2j4_14 = 0,
             ss_p2c2s3j1_14 = 0,
             ss_p2c2s3j2_14 = 0,
             ss_p2c2s3j3_14 = 0,
             ss_p2c2s3j4_14 = 0,
             ss_p2c3s1j1_14 = 0,
             ss_p2c3s1j2_14 = 0,
             ss_p2c3s1j3_14 = 0,
             ss_p2c3s1j4_14 = 0,
             ss_p2c3s2j1_14 = 0,
             ss_p2c3s2j2_14 = 0,
             ss_p2c3s2j3_14 = 0,
             ss_p2c3s2j4_14 = 0,
             ss_p2c3s3j1_14 = 0,
             ss_p2c3s3j2_14 = 0,
             ss_p2c3s3j3_14 = 0,
             ss_p2c3s3j4_14 = 0,
             ss_p2c4s1j1_14 = 0,
             ss_p2c4s1j2_14 = 0,
             ss_p2c4s1j3_14 = 0,
             ss_p2c4s1j4_14 = 0,
             ss_p2c4s2j1_14 = 0,
             ss_p2c4s2j2_14 = 0,
             ss_p2c4s2j3_14 = 0,
             ss_p2c4s2j4_14 = 0,
             ss_p2c4s3j1_14 = 0,
             ss_p2c4s3j2_14 = 0,
             ss_p2c4s3j3_14 = 0,
             ss_p2c4s3j4_14 = 0,
             ss_p1c1s1j1_15 = 0,
             ss_p1c1s1j2_15 = 0,
             ss_p1c1s1j3_15 = 0,
             ss_p1c1s1j4_15 = 0,
             ss_p1c1s2j1_15 = 0,
             ss_p1c1s2j2_15 = 0,
             ss_p1c1s2j3_15 = 0,
             ss_p1c1s2j4_15 = 0,
             ss_p1c1s3j1_15 = 0,
             ss_p1c1s3j2_15 = 0,
             ss_p1c1s3j3_15 = 0,
             ss_p1c1s3j4_15 = 0,
             ss_p1c2s1j1_15 = 0,
             ss_p1c2s1j2_15 = 0,
             ss_p1c2s1j3_15 = 0,
             ss_p1c2s1j4_15 = 0,
             ss_p1c2s2j1_15 = 0,
             ss_p1c2s2j2_15 = 0,
             ss_p1c2s2j3_15 = 0,
             ss_p1c2s2j4_15 = 0,
             ss_p1c2s3j1_15 = 0,
             ss_p1c2s3j2_15 = 0,
             ss_p1c2s3j3_15 = 0,
             ss_p1c2s3j4_15 = 0,
             ss_p1c3s1j1_15 = 0,
             ss_p1c3s1j2_15 = 0,
             ss_p1c3s1j3_15 = 0,
             ss_p1c3s1j4_15 = 0,
             ss_p1c3s2j1_15 = 0,
             ss_p1c3s2j2_15 = 0,
             ss_p1c3s2j3_15 = 0,
             ss_p1c3s2j4_15 = 0,
             ss_p1c3s3j1_15 = 0,
             ss_p1c3s3j2_15 = 0,
             ss_p1c3s3j3_15 = 0,
             ss_p1c3s3j4_15 = 0,
             ss_p1c4s1j1_15 = 0,
             ss_p1c4s1j2_15 = 0,
             ss_p1c4s1j3_15 = 0,
             ss_p1c4s1j4_15 = 0,
             ss_p1c4s2j1_15 = 0,
             ss_p1c4s2j2_15 = 0,
             ss_p1c4s2j3_15 = 0,
             ss_p1c4s2j4_15 = 0,
             ss_p1c4s3j1_15 = 0,
             ss_p1c4s3j2_15 = 0,
             ss_p1c4s3j3_15 = 0,
             ss_p1c4s3j4_15 = 0,
             ss_p2c1s1j1_15 = 0,
             ss_p2c1s1j2_15 = 0,
             ss_p2c1s1j3_15 = 0,
             ss_p2c1s1j4_15 = 0,
             ss_p2c1s2j1_15 = 0,
             ss_p2c1s2j2_15 = 0,
             ss_p2c1s2j3_15 = 0,
             ss_p2c1s2j4_15 = 0,
             ss_p2c1s3j1_15 = 0,
             ss_p2c1s3j2_15 = 0,
             ss_p2c1s3j3_15 = 0,
             ss_p2c1s3j4_15 = 0,
             ss_p2c2s1j1_15 = 0,
             ss_p2c2s1j2_15 = 0,
             ss_p2c2s1j3_15 = 0,
             ss_p2c2s1j4_15 = 0,
             ss_p2c2s2j1_15 = 0,
             ss_p2c2s2j2_15 = 0,
             ss_p2c2s2j3_15 = 0,
             ss_p2c2s2j4_15 = 0,
             ss_p2c2s3j1_15 = 0,
             ss_p2c2s3j2_15 = 0,
             ss_p2c2s3j3_15 = 0,
             ss_p2c2s3j4_15 = 0,
             ss_p2c3s1j1_15 = 0,
             ss_p2c3s1j2_15 = 0,
             ss_p2c3s1j3_15 = 0,
             ss_p2c3s1j4_15 = 0,
             ss_p2c3s2j1_15 = 0,
             ss_p2c3s2j2_15 = 0,
             ss_p2c3s2j3_15 = 0,
             ss_p2c3s2j4_15 = 0,
             ss_p2c3s3j1_15 = 0,
             ss_p2c3s3j2_15 = 0,
             ss_p2c3s3j3_15 = 0,
             ss_p2c3s3j4_15 = 0,
             ss_p2c4s1j1_15 = 0,
             ss_p2c4s1j2_15 = 0,
             ss_p2c4s1j3_15 = 0,
             ss_p2c4s1j4_15 = 0,
             ss_p2c4s2j1_15 = 0,
             ss_p2c4s2j2_15 = 0,
             ss_p2c4s2j3_15 = 0,
             ss_p2c4s2j4_15 = 0,
             ss_p2c4s3j1_15 = 0,
             ss_p2c4s3j2_15 = 0,
             ss_p2c4s3j3_15 = 0,
             ss_p2c4s3j4_15 = 0,
             ss_p1c1s1j1_16 = 0,
             ss_p1c1s1j2_16 = 0,
             ss_p1c1s1j3_16 = 0,
             ss_p1c1s1j4_16 = 0,
             ss_p1c1s2j1_16 = 0,
             ss_p1c1s2j2_16 = 0,
             ss_p1c1s2j3_16 = 0,
             ss_p1c1s2j4_16 = 0,
             ss_p1c1s3j1_16 = 0,
             ss_p1c1s3j2_16 = 0,
             ss_p1c1s3j3_16 = 0,
             ss_p1c1s3j4_16 = 0,
             ss_p1c2s1j1_16 = 0,
             ss_p1c2s1j2_16 = 0,
             ss_p1c2s1j3_16 = 0,
             ss_p1c2s1j4_16 = 0,
             ss_p1c2s2j1_16 = 0,
             ss_p1c2s2j2_16 = 0,
             ss_p1c2s2j3_16 = 0,
             ss_p1c2s2j4_16 = 0,
             ss_p1c2s3j1_16 = 0,
             ss_p1c2s3j2_16 = 0,
             ss_p1c2s3j3_16 = 0,
             ss_p1c2s3j4_16 = 0,
             ss_p1c3s1j1_16 = 0,
             ss_p1c3s1j2_16 = 0,
             ss_p1c3s1j3_16 = 0,
             ss_p1c3s1j4_16 = 0,
             ss_p1c3s2j1_16 = 0,
             ss_p1c3s2j2_16 = 0,
             ss_p1c3s2j3_16 = 0,
             ss_p1c3s2j4_16 = 0,
             ss_p1c3s3j1_16 = 0,
             ss_p1c3s3j2_16 = 0,
             ss_p1c3s3j3_16 = 0,
             ss_p1c3s3j4_16 = 0,
             ss_p1c4s1j1_16 = 0,
             ss_p1c4s1j2_16 = 0,
             ss_p1c4s1j3_16 = 0,
             ss_p1c4s1j4_16 = 0,
             ss_p1c4s2j1_16 = 0,
             ss_p1c4s2j2_16 = 0,
             ss_p1c4s2j3_16 = 0,
             ss_p1c4s2j4_16 = 0,
             ss_p1c4s3j1_16 = 0,
             ss_p1c4s3j2_16 = 0,
             ss_p1c4s3j3_16 = 0,
             ss_p1c4s3j4_16 = 0,
             ss_p2c1s1j1_16 = 0,
             ss_p2c1s1j2_16 = 0,
             ss_p2c1s1j3_16 = 0,
             ss_p2c1s1j4_16 = 0,
             ss_p2c1s2j1_16 = 0,
             ss_p2c1s2j2_16 = 0,
             ss_p2c1s2j3_16 = 0,
             ss_p2c1s2j4_16 = 0,
             ss_p2c1s3j1_16 = 0,
             ss_p2c1s3j2_16 = 0,
             ss_p2c1s3j3_16 = 0,
             ss_p2c1s3j4_16 = 0,
             ss_p2c2s1j1_16 = 0,
             ss_p2c2s1j2_16 = 0,
             ss_p2c2s1j3_16 = 0,
             ss_p2c2s1j4_16 = 0,
             ss_p2c2s2j1_16 = 0,
             ss_p2c2s2j2_16 = 0,
             ss_p2c2s2j3_16 = 0,
             ss_p2c2s2j4_16 = 0,
             ss_p2c2s3j1_16 = 0,
             ss_p2c2s3j2_16 = 0,
             ss_p2c2s3j3_16 = 0,
             ss_p2c2s3j4_16 = 0,
             ss_p2c3s1j1_16 = 0,
             ss_p2c3s1j2_16 = 0,
             ss_p2c3s1j3_16 = 0,
             ss_p2c3s1j4_16 = 0,
             ss_p2c3s2j1_16 = 0,
             ss_p2c3s2j2_16 = 0,
             ss_p2c3s2j3_16 = 0,
             ss_p2c3s2j4_16 = 0,
             ss_p2c3s3j1_16 = 0,
             ss_p2c3s3j2_16 = 0,
             ss_p2c3s3j3_16 = 0,
             ss_p2c3s3j4_16 = 0,
             ss_p2c4s1j1_16 = 0,
             ss_p2c4s1j2_16 = 0,
             ss_p2c4s1j3_16 = 0,
             ss_p2c4s1j4_16 = 0,
             ss_p2c4s2j1_16 = 0,
             ss_p2c4s2j2_16 = 0,
             ss_p2c4s2j3_16 = 0,
             ss_p2c4s2j4_16 = 0,
             ss_p2c4s3j1_16 = 0,
             ss_p2c4s3j2_16 = 0,
             ss_p2c4s3j3_16 = 0,
             ss_p2c4s3j4_16 = 0,
             ss_p1c1s1j1_17 = 0,
             ss_p1c1s1j2_17 = 0,
             ss_p1c1s1j3_17 = 0,
             ss_p1c1s1j4_17 = 0,
             ss_p1c1s2j1_17 = 0,
             ss_p1c1s2j2_17 = 0,
             ss_p1c1s2j3_17 = 0,
             ss_p1c1s2j4_17 = 0,
             ss_p1c1s3j1_17 = 0,
             ss_p1c1s3j2_17 = 0,
             ss_p1c1s3j3_17 = 0,
             ss_p1c1s3j4_17 = 0,
             ss_p1c2s1j1_17 = 0,
             ss_p1c2s1j2_17 = 0,
             ss_p1c2s1j3_17 = 0,
             ss_p1c2s1j4_17 = 0,
             ss_p1c2s2j1_17 = 0,
             ss_p1c2s2j2_17 = 0,
             ss_p1c2s2j3_17 = 0,
             ss_p1c2s2j4_17 = 0,
             ss_p1c2s3j1_17 = 0,
             ss_p1c2s3j2_17 = 0,
             ss_p1c2s3j3_17 = 0,
             ss_p1c2s3j4_17 = 0,
             ss_p1c3s1j1_17 = 0,
             ss_p1c3s1j2_17 = 0,
             ss_p1c3s1j3_17 = 0,
             ss_p1c3s1j4_17 = 0,
             ss_p1c3s2j1_17 = 0,
             ss_p1c3s2j2_17 = 0,
             ss_p1c3s2j3_17 = 0,
             ss_p1c3s2j4_17 = 0,
             ss_p1c3s3j1_17 = 0,
             ss_p1c3s3j2_17 = 0,
             ss_p1c3s3j3_17 = 0,
             ss_p1c3s3j4_17 = 0,
             ss_p1c4s1j1_17 = 0,
             ss_p1c4s1j2_17 = 0,
             ss_p1c4s1j3_17 = 0,
             ss_p1c4s1j4_17 = 0,
             ss_p1c4s2j1_17 = 0,
             ss_p1c4s2j2_17 = 0,
             ss_p1c4s2j3_17 = 0,
             ss_p1c4s2j4_17 = 0,
             ss_p1c4s3j1_17 = 0,
             ss_p1c4s3j2_17 = 0,
             ss_p1c4s3j3_17 = 0,
             ss_p1c4s3j4_17 = 0,
             ss_p2c1s1j1_17 = 0,
             ss_p2c1s1j2_17 = 0,
             ss_p2c1s1j3_17 = 0,
             ss_p2c1s1j4_17 = 0,
             ss_p2c1s2j1_17 = 0,
             ss_p2c1s2j2_17 = 0,
             ss_p2c1s2j3_17 = 0,
             ss_p2c1s2j4_17 = 0,
             ss_p2c1s3j1_17 = 0,
             ss_p2c1s3j2_17 = 0,
             ss_p2c1s3j3_17 = 0,
             ss_p2c1s3j4_17 = 0,
             ss_p2c2s1j1_17 = 0,
             ss_p2c2s1j2_17 = 0,
             ss_p2c2s1j3_17 = 0,
             ss_p2c2s1j4_17 = 0,
             ss_p2c2s2j1_17 = 0,
             ss_p2c2s2j2_17 = 0,
             ss_p2c2s2j3_17 = 0,
             ss_p2c2s2j4_17 = 0,
             ss_p2c2s3j1_17 = 0,
             ss_p2c2s3j2_17 = 0,
             ss_p2c2s3j3_17 = 0,
             ss_p2c2s3j4_17 = 0,
             ss_p2c3s1j1_17 = 0,
             ss_p2c3s1j2_17 = 0,
             ss_p2c3s1j3_17 = 0,
             ss_p2c3s1j4_17 = 0,
             ss_p2c3s2j1_17 = 0,
             ss_p2c3s2j2_17 = 0,
             ss_p2c3s2j3_17 = 0,
             ss_p2c3s2j4_17 = 0,
             ss_p2c3s3j1_17 = 0,
             ss_p2c3s3j2_17 = 0,
             ss_p2c3s3j3_17 = 0,
             ss_p2c3s3j4_17 = 0,
             ss_p2c4s1j1_17 = 0,
             ss_p2c4s1j2_17 = 0,
             ss_p2c4s1j3_17 = 0,
             ss_p2c4s1j4_17 = 0,
             ss_p2c4s2j1_17 = 0,
             ss_p2c4s2j2_17 = 0,
             ss_p2c4s2j3_17 = 0,
             ss_p2c4s2j4_17 = 0,
             ss_p2c4s3j1_17 = 0,
             ss_p2c4s3j2_17 = 0,
             ss_p2c4s3j3_17 = 0,
             ss_p2c4s3j4_17 = 0,
             
             
             on_p1c1s1_10 = 1,
             on_p1c1s2_10 =1,
             on_p1c1s3_10 =1,
             on_p1c2s1_10 =1,
             on_p1c2s2_10 =1,
             on_p1c2s3_10 =1,
             on_p1c3s1_10 =1,
             on_p1c3s2_10 =1,
             on_p1c3s3_10 =1,
             on_p1c4s1_10 =1,
             on_p1c4s2_10 =1,
             on_p1c4s3_10 =1,
             on_p2c1s1_10 =1,
             on_p2c1s2_10 =1,
             on_p2c1s3_10 =1,
             on_p2c2s1_10 =1,
             on_p2c2s2_10 =1,
             on_p2c2s3_10 =1,
             on_p2c3s1_10 =1,
             on_p2c3s2_10 =1,
             on_p2c3s3_10 =1,
             on_p2c4s1_10 =1,
             on_p2c4s2_10 =1,
             on_p2c4s3_10 =1,
             on_p1c1s1_11 =1,
             on_p1c1s2_11 =1,
             on_p1c1s3_11 =1,
             on_p1c2s1_11 =1,
             on_p1c2s2_11 =1,
             on_p1c2s3_11 =1,
             on_p1c3s1_11 =1,
             on_p1c3s2_11 =1,
             on_p1c3s3_11 =1,
             on_p1c4s1_11 =1,
             on_p1c4s2_11 =1,
             on_p1c4s3_11 =1,
             on_p2c1s1_11 =1,
             on_p2c1s2_11 =1,
             on_p2c1s3_11 =1,
             on_p2c2s1_11 =1,
             on_p2c2s2_11 =1,
             on_p2c2s3_11 =1,
             on_p2c3s1_11 =1,
             on_p2c3s2_11 =1,
             on_p2c3s3_11 =1,
             on_p2c4s1_11 =1,
             on_p2c4s2_11 =1,
             on_p2c4s3_11 =1,
             on_p1c1s1_12 =1,
             on_p1c1s2_12 =1,
             on_p1c1s3_12 =1,
             on_p1c2s1_12 =1,
             on_p1c2s2_12 =0,
             on_p1c2s3_12 =0,
             on_p1c3s1_12 =0,
             on_p1c3s2_12 =0,
             on_p1c3s3_12 =0,
             on_p1c4s1_12 =0,
             on_p1c4s2_12 =0,
             on_p1c4s3_12 =0,
             on_p2c1s1_12 =1,
             on_p2c1s2_12 =1,
             on_p2c1s3_12 =1,
             on_p2c2s1_12 =1,
             on_p2c2s2_12 =0,
             on_p2c2s3_12 =0,
             on_p2c3s1_12 =0,
             on_p2c3s2_12 =0,
             on_p2c3s3_12 =0,
             on_p2c4s1_12 =0,
             on_p2c4s2_12 =0,
             on_p2c4s3_12 =0,
             on_p1c1s1_13 =1,
             on_p1c1s2_13 =1,
             on_p1c1s3_13 =1,
             on_p1c2s1_13 =1,
             on_p1c2s2_13 =0,
             on_p1c2s3_13 =0,
             on_p1c3s1_13 =0,
             on_p1c3s2_13 =0,
             on_p1c3s3_13 =0,
             on_p1c4s1_13 =0,
             on_p1c4s2_13 =0,
             on_p1c4s3_13 =0,
             on_p2c1s1_13 =1,
             on_p2c1s2_13 =1,
             on_p2c1s3_13 =1,
             on_p2c2s1_13 =1,
             on_p2c2s2_13 =0,
             on_p2c2s3_13 =0,
             on_p2c3s1_13 =0,
             on_p2c3s2_13 =0,
             on_p2c3s3_13 =0,
             on_p2c4s1_13 =0,
             on_p2c4s2_13 =0,
             on_p2c4s3_13 =0,
             on_p1c1s1_14 =1,
             on_p1c1s2_14 =1,
             on_p1c1s3_14 =1,
             on_p1c2s1_14 =1,
             on_p1c2s2_14 =0,
             on_p1c2s3_14 =0,
             on_p1c3s1_14 =0,
             on_p1c3s2_14 =0,
             on_p1c3s3_14 =0,
             on_p1c4s1_14 =0,
             on_p1c4s2_14 =0,
             on_p1c4s3_14 =0,
             on_p2c1s1_14 =1,
             on_p2c1s2_14 =1,
             on_p2c1s3_14 =1,
             on_p2c2s1_14 =1,
             on_p2c2s2_14 =0,
             on_p2c2s3_14 =0,
             on_p2c3s1_14 =0,
             on_p2c3s2_14 =0,
             on_p2c3s3_14 =0,
             on_p2c4s1_14 =0,
             on_p2c4s2_14 =0,
             on_p2c4s3_14 =0,
             on_p1c1s1_15 =1,
             on_p1c1s2_15 =1,
             on_p1c1s3_15 =1,
             on_p1c2s1_15 =1,
             on_p1c2s2_15 =0,
             on_p1c2s3_15 =0,
             on_p1c3s1_15 =0,
             on_p1c3s2_15 =0,
             on_p1c3s3_15 =0,
             on_p1c4s1_15 =0,
             on_p1c4s2_15 =0,
             on_p1c4s3_15 =0,
             on_p2c1s1_15 =1,
             on_p2c1s2_15 =1,
             on_p2c1s3_15 =1,
             on_p2c2s1_15 =1,
             on_p2c2s2_15 =0,
             on_p2c2s3_15 =0,
             on_p2c3s1_15 =0,
             on_p2c3s2_15 =0,
             on_p2c3s3_15 =0,
             on_p2c4s1_15 =0,
             on_p2c4s2_15 =0,
             on_p2c4s3_15 =0,
             on_p1c1s1_16 =1,
             on_p1c1s2_16 =1,
             on_p1c1s3_16 =1,
             on_p1c2s1_16 =1,
             on_p1c2s2_16 =1,
             on_p1c2s3_16 =1,
             on_p1c3s1_16 =1,
             on_p1c3s2_16 =1,
             on_p1c3s3_16 =1,
             on_p1c4s1_16 =1,
             on_p1c4s2_16 =1,
             on_p1c4s3_16 =1,
             on_p2c1s1_16 =1,
             on_p2c1s2_16 =1,
             on_p2c1s3_16 =1,
             on_p2c2s1_16 =1,
             on_p2c2s2_16 =1,
             on_p2c2s3_16 =1,
             on_p2c3s1_16 =1,
             on_p2c3s2_16 =1,
             on_p2c3s3_16 =1,
             on_p2c4s1_16 =1,
             on_p2c4s2_16 =1,
             on_p2c4s3_16 =1,
             on_p1c1s1_17 =1,
             on_p1c1s2_17 =1,
             on_p1c1s3_17 =1,
             on_p1c2s1_17 =1,
             on_p1c2s2_17 =1,
             on_p1c2s3_17 =1,
             on_p1c3s1_17 =1,
             on_p1c3s2_17 =1,
             on_p1c3s3_17 =1,
             on_p1c4s1_17 =1,
             on_p1c4s2_17 =1,
             on_p1c4s3_17 =1,
             on_p2c1s1_17 =1,
             on_p2c1s2_17 =1,
             on_p2c1s3_17 =1,
             on_p2c2s1_17 =1,
             on_p2c2s2_17 =1,
             on_p2c2s3_17 =1,
             on_p2c3s1_17 =1,
             on_p2c3s2_17 =1,
             on_p2c3s3_17 =1,
             on_p2c4s1_17 =1,
             on_p2c4s2_17 =1,
             on_p2c4s3_17 =1)

# database of everyone with current or former care -- 12 to 15
# fte_p1c1s1_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c1s2_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c1s3_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c2s1_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c2s2_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c2s3_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c3s1_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c3s2_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c3s3_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c4s1_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c4s2_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p1c4s3_10 <- np2nci10[,1] + np2csi10[,1]
# fte_p2c1s1_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c1s2_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c1s3_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c2s1_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c2s2_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c2s3_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c3s1_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c3s2_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c3s3_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c4s1_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c4s2_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p2c4s3_10 <- np2ncec10[,1] + np2csec10[,1]
# fte_p1c1s1_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c1s2_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c1s3_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c2s1_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c2s2_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c2s3_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c3s1_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c3s2_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c3s3_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c4s1_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c4s2_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p1c4s3_11 <- np2nci11[,1] + np2csi11[,1]
# fte_p2c1s1_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c1s2_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c1s3_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c2s1_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c2s2_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c2s3_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c3s1_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c3s2_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c3s3_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c4s1_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c4s2_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p2c4s3_11 <- np2ncec11[,1] + np2csec11[,1]
# fte_p1c1s1_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c1s2_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c1s3_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c2s1_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c2s2_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c2s3_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c3s1_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c3s2_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c3s3_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c4s1_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c4s2_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p1c4s3_12 <- np2nci12[,1] + np2csi12[,1]
# fte_p2c1s1_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c1s2_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c1s3_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c2s1_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c2s2_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c2s3_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c3s1_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c3s2_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c3s3_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c4s1_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c4s2_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p2c4s3_12 <- np2ncec12[,1] + np2csec12[,1]
# fte_p1c1s1_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c1s2_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c1s3_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c2s1_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c2s2_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c2s3_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c3s1_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c3s2_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c3s3_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c4s1_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c4s2_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p1c4s3_13 <- np2nci13[,1] + np2csi13[,1]
# fte_p2c1s1_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c1s2_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c1s3_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c2s1_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c2s2_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c2s3_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c3s1_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c3s2_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c3s3_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c4s1_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c4s2_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p2c4s3_13 <- np2ncec13[,1] + np2csec13[,1]
# fte_p1c1s1_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c1s2_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c1s3_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c2s1_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c2s2_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c2s3_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c3s1_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c3s2_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c3s3_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c4s1_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c4s2_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p1c4s3_14 <- np2nci14[,1] + np2csi14[,1]
# fte_p2c1s1_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c1s2_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c1s3_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c2s1_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c2s2_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c2s3_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c3s1_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c3s2_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c3s3_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c4s1_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c4s2_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p2c4s3_14 <- np2ncec14[,1] + np2csec14[,1]
# fte_p1c1s1_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c1s2_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c1s3_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c2s1_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c2s2_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c2s3_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c3s1_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c3s2_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c3s3_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c4s1_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c4s2_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p1c4s3_15 <- np2nci15[,1] + np2csi15[,1]
# fte_p2c1s1_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c1s2_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c1s3_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c2s1_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c2s2_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c2s3_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c3s1_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c3s2_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c3s3_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c4s1_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c4s2_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p2c4s3_15 <- np2ncec15[,1] + np2csec15[,1]
# fte_p1c1s1_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c1s2_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c1s3_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c2s1_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c2s2_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c2s3_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c3s1_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c3s2_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c3s3_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c4s1_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c4s2_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p1c4s3_16 <- np2nci16[,1] + np2csi16[,1]
# fte_p2c1s1_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c1s2_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c1s3_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c2s1_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c2s2_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c2s3_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c3s1_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c3s2_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c3s3_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c4s1_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c4s2_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p2c4s3_16 <- np2ncec16[,1] + np2csec16[,1]
# fte_p1c1s1_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c1s2_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c1s3_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c2s1_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c2s2_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c2s3_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c3s1_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c3s2_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c3s3_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c4s1_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c4s2_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p1c4s3_17 <- np2nci17[,1] + np2csi17[,1]
# fte_p2c1s1_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c1s2_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c1s3_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c2s1_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c2s2_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c2s3_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c3s1_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c3s2_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c3s3_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c4s1_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c4s2_17 <- np2ncec17[,1] + np2csec17[,1]
# fte_p2c4s3_17 <- np2ncec17[,1] + np2csec17[,1]

fte_p1c1s1_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c1s2_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c1s3_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c2s1_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c2s2_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c2s3_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c3s1_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c3s2_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c3s3_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c4s1_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c4s2_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p1c4s3_10 <- (np2nci10[,1] + np2csi10[,1])*0.07
fte_p2c1s1_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c1s2_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c1s3_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c2s1_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c2s2_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c2s3_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c3s1_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c3s2_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c3s3_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c4s1_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c4s2_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p2c4s3_10 <- (np2ncec10[,1] + np2csec10[,1])*0.07
fte_p1c1s1_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c1s2_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c1s3_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c2s1_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c2s2_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c2s3_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c3s1_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c3s2_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c3s3_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c4s1_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c4s2_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p1c4s3_11 <- (np2nci11[,1] + np2csi11[,1])*0.07
fte_p2c1s1_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c1s2_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c1s3_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c2s1_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c2s2_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c2s3_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c3s1_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c3s2_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c3s3_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c4s1_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c4s2_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p2c4s3_11 <- (np2ncec11[,1] + np2csec11[,1])*0.07
fte_p1c1s1_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c1s2_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c1s3_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c2s1_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c2s2_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c2s3_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c3s1_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c3s2_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c3s3_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c4s1_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c4s2_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p1c4s3_12 <- (np2nci12[,1] + np2csi12[,1])*0.07
fte_p2c1s1_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c1s2_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c1s3_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c2s1_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c2s2_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c2s3_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c3s1_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c3s2_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c3s3_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c4s1_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c4s2_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p2c4s3_12 <- (np2ncec12[,1] + np2csec12[,1])*0.07
fte_p1c1s1_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c1s2_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c1s3_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c2s1_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c2s2_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c2s3_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c3s1_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c3s2_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c3s3_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c4s1_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c4s2_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p1c4s3_13 <- (np2nci13[,1] + np2csi13[,1])*0.07
fte_p2c1s1_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c1s2_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c1s3_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c2s1_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c2s2_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c2s3_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c3s1_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c3s2_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c3s3_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c4s1_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c4s2_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p2c4s3_13 <- (np2ncec13[,1] + np2csec13[,1])*0.07
fte_p1c1s1_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c1s2_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c1s3_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c2s1_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c2s2_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c2s3_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c3s1_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c3s2_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c3s3_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c4s1_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c4s2_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p1c4s3_14 <- (np2nci14[,1] + np2csi14[,1])*0.07
fte_p2c1s1_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c1s2_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c1s3_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c2s1_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c2s2_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c2s3_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c3s1_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c3s2_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c3s3_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c4s1_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c4s2_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p2c4s3_14 <- (np2ncec14[,1] + np2csec14[,1])*0.07
fte_p1c1s1_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c1s2_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c1s3_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c2s1_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c2s2_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c2s3_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c3s1_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c3s2_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c3s3_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c4s1_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c4s2_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p1c4s3_15 <- (np2nci15[,1] + np2csi15[,1])*0.07
fte_p2c1s1_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c1s2_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c1s3_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c2s1_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c2s2_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c2s3_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c3s1_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c3s2_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c3s3_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c4s1_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c4s2_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p2c4s3_15 <- (np2ncec15[,1] + np2csec15[,1])*0.07
fte_p1c1s1_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c1s2_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c1s3_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c2s1_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c2s2_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c2s3_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c3s1_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c3s2_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c3s3_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c4s1_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c4s2_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p1c4s3_16 <- (np2nci16[,1] + np2csi16[,1])*0.07
fte_p2c1s1_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c1s2_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c1s3_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c2s1_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c2s2_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c2s3_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c3s1_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c3s2_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c3s3_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c4s1_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c4s2_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p2c4s3_16 <- (np2ncec16[,1] + np2csec16[,1])*0.07
fte_p1c1s1_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c1s2_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c1s3_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c2s1_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c2s2_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c2s3_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c3s1_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c3s2_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c3s3_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c4s1_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c4s2_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p1c4s3_17 <- (np2nci17[,1] + np2csi17[,1])*0.07
fte_p2c1s1_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c1s2_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c1s3_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c2s1_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c2s2_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c2s3_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c3s1_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c3s2_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c3s3_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c4s1_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c4s2_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07
fte_p2c4s3_17 <- (np2ncec17[,1] + np2csec17[,1])*0.07



init <- init_c %>% 
  mutate(J1 = NA,
         J2 = NA,
         J3 = NA,
         J4 = NA)

init_pc <- init %>% 
  filter(age == 10) %>% 
  select(-c(age)) %>% 
  ungroup() %>% 
  mutate(pc = count/sum(count))


cust <- custodial_sentences %>%
  filter(gender == "Boys",
         end_period_year == 2011)  %>%
  mutate(age = as.character(age)) %>% 
  group_by(age) %>%
  summarise(count = sum(count)) %>% 
  left_join(custodial_sentence_duration %>% 
              filter(gender == "Boys",
                     end_period_year == 2011)%>%
              select(-c(gender, end_period_year)) %>% 
              mutate(age = as.character(age))) %>% 
  mutate(inc = count/52,
         dur = nights/7,
         prev = inc*dur) %>% 
  select(age, inc, prev)

# children minus fte.?
in_yjs <- children %>% 
  ungroup() %>% 
  filter(gender == "Boys",
         end_period_year == 2010) %>% 
  select(count, age) %>% 
  pivot_wider(names_from = age,
              values_from = count) %>% 
  cbind(data.frame(age = c(10:17))) %>% 
  mutate(pc = ifelse(age == 17, 0.45, NA),
         pc = ifelse(age == 16, 0.35, pc),
         pc = ifelse(age == 15, 0.2, pc),
         pc = ifelse(age == 14, 0.45, pc),
         pc = ifelse(age == 13, 0.25, pc),
         pc = ifelse(age == 12, 0.15, pc),
         pc = ifelse(age == 11, 0.1, pc),
         pc = ifelse(age == 10, 0.05, pc),
         pc = ifelse(age >= 15, pc*`15-17`, pc*`10-14`)) 

# rbind(data.frame(age = c(10:17)) %>% 
#         mutate(age = as.character(age)))
# # left_join(fte %>% 
#             filter(gender == "Boys",
#                    end_period_year == 2010) %>% 
#             group_by(gender) %>% 
#             summarise(fte = sum(count))) %>% 
# mutate(pc = count/sum(count),
#        pc = ifelse(age == "10-14", 0.25, 0.75),
#        fte = fte*pc)

IC <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/IC.xlsx", sheet = 2)

init_c <- IC %>% 
  mutate(J1 = count*J1,
         J2 = count*J2,
         J3 = count*J3,
         J4 = count*J4) %>% 
  select(-count) %>% 
  pivot_longer(c(J1, J2, J3, J4),
               names_to = "yjs",
               values_to = "count") %>% 
  mutate(yjs = ifelse(grepl("J1", yjs), "No_contact_with_YJS", yjs),
         yjs = ifelse(grepl("J2", yjs), "Known_to_police", yjs),
         yjs = ifelse(grepl("J3", yjs), "In_the_YJS", yjs),
         yjs = ifelse(grepl("J4", yjs), "In_custody", yjs))


save(init_c, file = "output/data/input/init_c.Rdata")



