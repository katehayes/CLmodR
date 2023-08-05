load("/Users/katehayes/CLmodelR/Output/Data/Input/v_turn10.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Input/t_turn10.Rdata")

lac_model = odin::odin({
  
  # parameters
  N_gender <- user(2)
  age_up <- user(0.01923076923) # rate of ageing out of your age compartment - 1/52
  
  # what is their distribution across LAC states when kids turn 10 - what compartments do they age into
  # pc_nres[] <- user(0)
  # pc_res[] <- user(0)
  pc_prior[] <- user(0)
  
  # rate of entering care
  np2lac[] <- user(0)
  prior2lac[] <- user(0)
  
  #destination on entering care
  np2nres[] <- user(0)
  np2res[] <- user(0)
  
  prior2nres[] <- user(0)
  prior2res[] <- user(0)
  
  # duration of LAC compartments
  end_nr <- user(1/6.288462) #mean rate of exit from nonres care - 1 over mean duration of non-residential care (in 2015)
  end_res <- user(1/4.19324) #mean rate of exit from res care - 1 over mean duration of residential care (in 2015)
  
  #destination of LAC compartments
  nr2nr <- user(0.6) #jsut made these nres ones up lol!!
  nr2res <- user(0.1)
  nr2exit <- user(0.3)
  
  res2nr <- user(0.5)
  res2res <- user(0.3)
  res2exit <- user(0.2)
  
  
  # initial conditions
  LACnev10_ini[] <- user(0) 
  LACnres10_ini[] <- user(0) 
  LACres10_ini[] <- user(0) 
  LACprior10_ini[] <- user(0) 
  
  LACnev11_ini[] <- user(0) 
  LACnres11_ini[] <- user(0) 
  LACres11_ini[] <- user(0) 
  LACprior11_ini[] <- user(0) 
  
  LACnev12_ini[] <- user(0) 
  LACnres12_ini[] <- user(0) 
  LACres12_ini[] <- user(0) 
  LACprior12_ini[] <- user(0) 
  
  LACnev13_ini[] <- user(0) 
  LACnres13_ini[] <- user(0) 
  LACres13_ini[] <- user(0) 
  LACprior13_ini[] <- user(0) 
  
  LACnev14_ini[] <- user(0) 
  LACnres14_ini[] <- user(0) 
  LACres14_ini[] <- user(0) 
  LACprior14_ini[] <- user(0) 
  
  LACnev15_ini[] <- user(0) 
  LACnres15_ini[] <- user(0) 
  LACres15_ini[] <- user(0) 
  LACprior15_ini[] <- user(0) 
  
  LACnev16_ini[] <- user(0) 
  LACnres16_ini[] <- user(0) 
  LACres16_ini[] <- user(0) 
  LACprior16_ini[] <- user(0) 
  
  LACnev17_ini[] <- user(0) 
  LACnres17_ini[] <- user(0) 
  LACres17_ini[] <- user(0) 
  LACprior17_ini[] <- user(0) 
  
  
  initial(LACnev10[]) <- LACnev10_ini[i]
  initial(LACnres10[]) <- LACnres10_ini[i]
  initial(LACres10[]) <- LACres10_ini[i]
  initial(LACprior10[]) <- LACprior10_ini[i]
  
  initial(LACnev11[]) <- LACnev11_ini[i]
  initial(LACnres11[]) <- LACnres11_ini[i]
  initial(LACres11[]) <- LACres11_ini[i]
  initial(LACprior11[]) <- LACprior11_ini[i]
  
  initial(LACnev12[]) <- LACnev12_ini[i]
  initial(LACnres12[]) <- LACnres12_ini[i]
  initial(LACres12[]) <- LACres12_ini[i]
  initial(LACprior12[]) <- LACprior12_ini[i]
  
  initial(LACnev13[]) <- LACnev13_ini[i]
  initial(LACnres13[]) <- LACnres13_ini[i]
  initial(LACres13[]) <- LACres13_ini[i]
  initial(LACprior13[]) <- LACprior13_ini[i]
  
  initial(LACnev14[]) <- LACnev14_ini[i]
  initial(LACnres14[]) <- LACnres14_ini[i]
  initial(LACres14[]) <- LACres14_ini[i]
  initial(LACprior14[]) <- LACprior14_ini[i]
  
  initial(LACnev15[]) <- LACnev15_ini[i]
  initial(LACnres15[]) <- LACnres15_ini[i]
  initial(LACres15[]) <- LACres15_ini[i]
  initial(LACprior15[]) <- LACprior15_ini[i]
  
  initial(LACnev16[]) <- LACnev16_ini[i]
  initial(LACnres16[]) <- LACnres16_ini[i]
  initial(LACres16[]) <- LACres16_ini[i]
  initial(LACprior16[]) <- LACprior16_ini[i]
  
  initial(LACnev17[]) <- LACnev17_ini[i]
  initial(LACnres17[]) <- LACnres17_ini[i]
  initial(LACres17[]) <- LACres17_ini[i]
  initial(LACprior17[]) <- LACprior17_ini[i]
  


  
  # setting dimensions
  # parameters first
  dim(pc_prior) <- N_gender
  
  dim(np2lac) <- N_gender
  dim(prior2lac) <- N_gender
  
  dim(np2nres) <- N_gender
  dim(np2res) <- N_gender
  dim(prior2nres) <- N_gender
  dim(prior2res) <- N_gender
  
  # now the initial conditions and states
  
  dim(LACnev10_ini) <- N_gender
  dim(LACnres10_ini) <- N_gender
  dim(LACres10_ini) <- N_gender
  dim(LACprior10_ini) <- N_gender
  
  dim(LACnev10) <- N_gender
  dim(LACnres10) <- N_gender
  dim(LACres10) <- N_gender
  dim(LACprior10) <- N_gender
  
  dim(LACnev11_ini) <- N_gender
  dim(LACnres11_ini) <- N_gender
  dim(LACres11_ini) <- N_gender
  dim(LACprior11_ini) <- N_gender
  
  dim(LACnev11) <- N_gender
  dim(LACnres11) <- N_gender
  dim(LACres11) <- N_gender
  dim(LACprior11) <- N_gender
  
  dim(LACnev12_ini) <- N_gender
  dim(LACnres12_ini) <- N_gender
  dim(LACres12_ini) <- N_gender
  dim(LACprior12_ini) <- N_gender
  
  dim(LACnev12) <- N_gender
  dim(LACnres12) <- N_gender
  dim(LACres12) <- N_gender
  dim(LACprior12) <- N_gender
  
  dim(LACnev13_ini) <- N_gender
  dim(LACnres13_ini) <- N_gender
  dim(LACres13_ini) <- N_gender
  dim(LACprior13_ini) <- N_gender
  
  dim(LACnev13) <- N_gender
  dim(LACnres13) <- N_gender
  dim(LACres13) <- N_gender
  dim(LACprior13) <- N_gender
  
  dim(LACnev14_ini) <- N_gender
  dim(LACnres14_ini) <- N_gender
  dim(LACres14_ini) <- N_gender
  dim(LACprior14_ini) <- N_gender
  
  dim(LACnev14) <- N_gender
  dim(LACnres14) <- N_gender
  dim(LACres14) <- N_gender
  dim(LACprior14) <- N_gender
  
  dim(LACnev15_ini) <- N_gender
  dim(LACnres15_ini) <- N_gender
  dim(LACres15_ini) <- N_gender
  dim(LACprior15_ini) <- N_gender
  
  dim(LACnev15) <- N_gender
  dim(LACnres15) <- N_gender
  dim(LACres15) <- N_gender
  dim(LACprior15) <- N_gender
  
  dim(LACnev16_ini) <- N_gender
  dim(LACnres16_ini) <- N_gender
  dim(LACres16_ini) <- N_gender
  dim(LACprior16_ini) <- N_gender
  
  dim(LACnev16) <- N_gender
  dim(LACnres16) <- N_gender
  dim(LACres16) <- N_gender
  dim(LACprior16) <- N_gender
  
  dim(LACnev17_ini) <- N_gender
  dim(LACnres17_ini) <- N_gender
  dim(LACres17_ini) <- N_gender
  dim(LACprior17_ini) <- N_gender
  
  dim(LACnev17) <- N_gender
  dim(LACnres17) <- N_gender
  dim(LACres17) <- N_gender
  dim(LACprior17) <- N_gender
  

  ##intermediate quantities
  
  
  # differential equations
  deriv(LACnev10[]) <- (1-(pc_nres[i]-pc_res[i]-pc_prior[i]))*turn10[i] - age_up*LACnev10[i] - np2lac[i]*LACnev10[i]
  deriv(LACnres10[]) <- pc_nres[i]*turn10[i] - age_up*LACnres10[i] + np2nres[i]*np2lac[i]*LACnev10[i] + prior2nres[i]*prior2lac[i]*LACprior10[i] - (1-nr2nr)*end_nr*LACnres10[i] + res2nr*end_res*LACres10[i]
  deriv(LACres10[]) <- pc_res[i]*turn10[i] - age_up*LACres10[i] + np2res[i]*np2lac[i]*LACnev10[i] + prior2res[i]*prior2lac[i]*LACprior10[i] - (1-res2res)*end_res*LACres10[i] + nr2res*end_nr*LACnres10[i]
  deriv(LACprior10[]) <- pc_prior[i]*turn10[i] - age_up*LACprior10[i] - prior2lac[i]*LACprior10[i] + nr2exit*end_nr*LACnres10[i] + res2exit*end_res*LACres10[i]
  
  deriv(LACnev11[]) <- age_up*LACnev10[i] - np2lac[i]*LACnev11[i] - age_up*LACnev11[i]
  deriv(LACnres11[]) <- age_up*LACnres10[i] + np2nres[i]*np2lac[i]*LACnev11[i] + prior2nres[i]*prior2lac[i]*LACprior11[i] - (1-nr2nr)*end_nr*LACnres11[i] - age_up*LACnres11[i] + res2nr*end_res*LACres11[i]
  deriv(LACres11[]) <- age_up*LACres10[i] + np2res[i]*np2lac[i]*LACnev11[i] + prior2res[i]*prior2lac[i]*LACprior11[i] - (1-res2res)*end_res*LACres11[i] - age_up*LACres11[i] + nr2res*end_nr*LACnres11[i]
  deriv(LACprior11[]) <- age_up*LACprior10[i] - prior2lac[i]*LACprior11[i] + nr2exit*end_nr*LACnres11[i] + res2exit*end_res*LACres11[i] - age_up*LACprior11[i]
  
  deriv(LACnev12[]) <- age_up*LACnev11[i] - np2lac[i]*LACnev12[i] - age_up*LACnev12[i]
  deriv(LACnres12[]) <- age_up*LACnres11[i] + np2nres[i]*np2lac[i]*LACnev12[i] + prior2nres[i]*prior2lac[i]*LACprior12[i] - (1-nr2nr)*end_nr*LACnres12[i] - age_up*LACnres12[i] + res2nr*end_res*LACres12[i]
  deriv(LACres12[]) <- age_up*LACres11[i] + np2res[i]*np2lac[i]*LACnev12[i] + prior2res[i]*prior2lac[i]*LACprior12[i] - (1-res2res)*end_res*LACres12[i] - age_up*LACres12[i] + nr2res*end_nr*LACnres12[i]
  deriv(LACprior12[]) <- age_up*LACprior11[i] - prior2lac[i]*LACprior12[i] + nr2exit*end_nr*LACnres12[i] + res2exit*end_res*LACres12[i] - age_up*LACprior12[i]
  
  deriv(LACnev13[]) <- age_up*LACnev12[i] - np2lac[i]*LACnev13[i] - age_up*LACnev13[i]
  deriv(LACnres13[]) <- age_up*LACnres12[i] + np2nres[i]*np2lac[i]*LACnev13[i] + prior2nres[i]*prior2lac[i]*LACprior13[i] - (1-nr2nr)*end_nr*LACnres13[i] - age_up*LACnres13[i] + res2nr*end_res*LACres13[i]
  deriv(LACres13[]) <- age_up*LACres12[i] + np2res[i]*np2lac[i]*LACnev13[i] + prior2res[i]*prior2lac[i]*LACprior13[i] - (1-res2res)*end_res*LACres13[i] - age_up*LACres13[i] + nr2res*end_nr*LACnres13[i]
  deriv(LACprior13[]) <- age_up*LACprior12[i] - prior2lac[i]*LACprior13[i] + nr2exit*end_nr*LACnres13[i] + res2exit*end_res*LACres13[i] - age_up*LACprior13[i]
  
  deriv(LACnev14[]) <- age_up*LACnev13[i] - np2lac[i]*LACnev14[i] - age_up*LACnev14[i]
  deriv(LACnres14[]) <- age_up*LACnres13[i] + np2nres[i]*np2lac[i]*LACnev14[i] + prior2nres[i]*prior2lac[i]*LACprior14[i] - (1-nr2nr)*end_nr*LACnres14[i] - age_up*LACnres14[i] + res2nr*end_res*LACres14[i]
  deriv(LACres14[]) <- age_up*LACres13[i] + np2res[i]*np2lac[i]*LACnev14[i] + prior2res[i]*prior2lac[i]*LACprior14[i] - (1-res2res)*end_res*LACres14[i] - age_up*LACres14[i] + nr2res*end_nr*LACnres14[i]
  deriv(LACprior14[]) <- age_up*LACprior13[i] - prior2lac[i]*LACprior14[i] + nr2exit*end_nr*LACnres14[i] + res2exit*end_res*LACres14[i] - age_up*LACprior14[i]
  
  deriv(LACnev15[]) <- age_up*LACnev14[i] - np2lac[i]*LACnev15[i] - age_up*LACnev15[i]
  deriv(LACnres15[]) <- age_up*LACnres14[i] + np2nres[i]*np2lac[i]*LACnev15[i] + prior2nres[i]*prior2lac[i]*LACprior15[i] - (1-nr2nr)*end_nr*LACnres15[i] - age_up*LACnres15[i] + res2nr*end_res*LACres15[i]
  deriv(LACres15[]) <- age_up*LACres14[i] + np2res[i]*np2lac[i]*LACnev15[i] + prior2res[i]*prior2lac[i]*LACprior15[i] - (1-res2res)*end_res*LACres15[i] - age_up*LACres15[i] + nr2res*end_nr*LACnres15[i]
  deriv(LACprior15[]) <- age_up*LACprior14[i] - prior2lac[i]*LACprior15[i] + nr2exit*end_nr*LACnres15[i] + res2exit*end_res*LACres15[i] - age_up*LACprior15[i]
  
  deriv(LACnev16[]) <- age_up*LACnev15[i] - np2lac[i]*LACnev16[i] - age_up*LACnev16[i]
  deriv(LACnres16[]) <- age_up*LACnres15[i] + np2nres[i]*np2lac[i]*LACnev16[i] + prior2nres[i]*prior2lac[i]*LACprior16[i] - (1-nr2nr)*end_nr*LACnres16[i] - age_up*LACnres16[i] + res2nr*end_res*LACres16[i]
  deriv(LACres16[]) <- age_up*LACres15[i] + np2res[i]*np2lac[i]*LACnev16[i] + prior2res[i]*prior2lac[i]*LACprior16[i] - (1-res2res)*end_res*LACres16[i] - age_up*LACres16[i] + nr2res*end_nr*LACnres16[i]
  deriv(LACprior16[]) <- age_up*LACprior15[i] - prior2lac[i]*LACprior16[i] + nr2exit*end_nr*LACnres16[i] + res2exit*end_res*LACres16[i] - age_up*LACprior16[i]
  
  deriv(LACnev17[]) <- age_up*LACnev16[i] - np2lac[i]*LACnev17[i] - age_up*LACnev17[i]
  deriv(LACnres17[]) <- age_up*LACnres16[i] + np2nres[i]*np2lac[i]*LACnev17[i] + prior2nres[i]*prior2lac[i]*LACprior17[i] - (1-nr2nr)*end_nr*LACnres17[i] - age_up*LACnres17[i] + res2nr*end_res*LACres17[i]
  deriv(LACres17[]) <- age_up*LACres16[i] + np2res[i]*np2lac[i]*LACnev17[i] + prior2res[i]*prior2lac[i]*LACprior17[i] - (1-res2res)*end_res*LACres17[i] - age_up*LACres17[i] + nr2res*end_nr*LACnres17[i]
  deriv(LACprior17[]) <- age_up*LACprior16[i] - prior2lac[i]*LACprior17[i] + nr2exit*end_nr*LACnres17[i] + res2exit*end_res*LACres17[i] - age_up*LACprior17[i]
  
  # interpolation section
  turn10[] <- interpolate(tt, y, "linear")
  dim(turn10) <- N_gender
  tt[] <- user()
  y[, ] <- user()
  dim(tt) <- user()
  dim(y) <- c(length(tt), length(turn10))
  
  pc_nres[] <- interpolate(tlac, nrlac, "linear")
  dim(pc_nres) <- N_gender
  tlac[] <- user()
  nrlac[, ] <- user()
  dim(tlac) <- user()
  dim(nrlac) <- c(length(tlac), length(pc_nres))
  
  pc_res[] <- interpolate(tlac, rlac, "linear")
  dim(pc_res) <- N_gender
  rlac[, ] <- user()
  dim(rlac) <- c(length(tlac), length(pc_res))
  
  
  # output(missing_rc1014) <- missing_rc1014
  # output(missing_rc1517) <- missing_rc1517

  
},
target = 'c')  



lac_pars <- list(tt = t_turn10,
                 y = v_turn10,
                 
                 tlac = t_lac,
                 nrlac = nres,
                 rlac = res,
                
            
                 # INITIAL CONDITIONS
                 LACnev10_ini = c(7313.850,6829.476),
                 LACnres10_ini = c(43.57738,47.35112),
                 LACres10_ini = c(22.295334,13.358817),
                 LACprior10_ini = c(49.27678,46.81357),
                 
                 LACnev11_ini = c(exact_ic %>% 
                                    filter(age == 11,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 11,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres11_ini = c(exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres11_ini = c(exact_ic %>% 
                                    filter(age == 11,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 11,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior11_ini = c(exact_ic %>% 
                                      filter(age == 11,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 11,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 LACnev12_ini = c(exact_ic %>% 
                                    filter(age == 12,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 12,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres12_ini = c(exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres12_ini = c(exact_ic %>% 
                                    filter(age == 12,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 12,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior12_ini = c(exact_ic %>% 
                                      filter(age == 12,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 12,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 
                 LACnev13_ini = c(exact_ic %>% 
                                    filter(age == 13,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 13,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres13_ini = c(exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres13_ini = c(exact_ic %>% 
                                    filter(age == 13,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 13,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior13_ini = c(exact_ic %>% 
                                      filter(age == 13,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 13,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 
                 LACnev14_ini = c(exact_ic %>% 
                                    filter(age == 14,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 14,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres14_ini = c(exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres14_ini = c(exact_ic %>% 
                                    filter(age == 14,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 14,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior14_ini = c(exact_ic %>% 
                                      filter(age == 14,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 14,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 
                 LACnev15_ini = c(exact_ic %>% 
                                    filter(age == 15,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 15,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres15_ini = c(exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres15_ini = c(exact_ic %>% 
                                    filter(age == 15,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 15,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior15_ini = c(exact_ic %>% 
                                      filter(age == 15,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 15,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 
                 LACnev16_ini = c(exact_ic %>% 
                                    filter(age == 16,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 16,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres16_ini = c(exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres16_ini = c(exact_ic %>% 
                                    filter(age == 16,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 16,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior16_ini = c(exact_ic %>% 
                                      filter(age == 16,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 16,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 
                 LACnev17_ini = c(exact_ic %>% 
                                    filter(age == 17,
                                           gender == "Boys") %>% 
                                    select(never) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 17,
                                           gender == "Girls") %>% 
                                    select(never) %>% 
                                    unlist()),
                 LACnres17_ini = c(exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Boys") %>% 
                                     select(nres) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Girls") %>% 
                                     select(nres) %>% 
                                     unlist()),
                 LACres17_ini = c(exact_ic %>% 
                                    filter(age == 17,
                                           gender == "Boys") %>% 
                                    select(res) %>% 
                                    unlist(), exact_ic %>% 
                                    filter(age == 17,
                                           gender == "Girls") %>% 
                                    select(res) %>% 
                                    unlist()),
                 LACprior17_ini = c(exact_ic %>% 
                                      filter(age == 17,
                                             gender == "Boys") %>% 
                                      select(prior) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 17,
                                             gender == "Girls") %>% 
                                      select(prior) %>% 
                                      unlist()),
                 
                 # PARAMETERS
                 pc_prior = c(0.01,0.01),
                 
                 # rate of entering care
                 np2lac = c(0.0000769,0.0000769),
                 prior2lac = c(0.006,0.006),
                 
                 #destination on entering care
                 np2nres = c(0.76,0.86),
                 np2res = c(0.24,0.14),
                 
                 prior2nres = c(0.7,0.8),
                 prior2res = c(0.3,0.2)
)


mod <- lac_model$new(user = lac_pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
LAC_data <- as.data.frame(mod$run(t))


mod_states <- LAC_data %>%
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl")) %>% 
  mutate(lac = ifelse(grepl("nev", state), "Never", NA),
         lac = ifelse(grepl("nres", state), "Not residential", lac),
         lac = ifelse(grepl("Cres", state), "Residential", lac),
         lac = ifelse(grepl("prior", state), "Prior", lac)) %>% 
  select(-state)












# counting the size of flows to/from LAC for calibration - you can prob do this after output but, writing here for now
NP2NRES10[] <- np2nres[i]*np2lac[i]*LACnev10[i]
NP2RES10[] <- np2res[i]*np2lac[i]*LACnev10[i]

NRES2NRES10[] <- nr2nr*end_nr*LACnres10[i]
NRES2RES10[] <- nr2res*end_nr*LACnres10[i]
NRES2PRIOR10[] <- nr2exit*end_nr*LACnres10[i]

RES2NRES10[] <- res2nr*end_res*LACres10[i]
RES2RES10[] <- res2res*end_res*LACres10[i]
RES2PRIOR10[] <- res2exit*end_res*LACres10[i]

PRIOR2NRES10[] <- prior2nres[i]*prior2lac[i]*LACprior10[i]
PRIOR2RES10[] <- prior2res[i]*prior2lac[i]*LACprior10[i]

NRESinflow10[] <- NP2NRES10[i] + NRES2NRES10[i] + RES2NRES10[i] + PRIOR2NRES10[i]
RESinflow10[] <- NP2RES10[i] + NRES2RES10[i] + RES2RES10[i] + PRIOR2RES10[i]
LACoutflow10[] <- NRES2PRIOR10[i] + RES2PRIOR10[i]


# conditions from literature
# flows into res care
# 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
NP2RES10[i]/RESinflow10[i] ~ 0.1

# 40% of kids going to res care come direct from foster placement breakdown (in the small sample)
# but for kids who are only ten, more of them are probably coming from foster and from adoption breakdown
# so lets make it like 6% from adoption, 60% from foster plus kinship care breakdown? remaining 6% from other family breakdowns?
NRES2RES10[i]/RESinflow10[i] ~ 0.6

# 15% going to res come direct from other care homes - 3% come at the expiry of a secure order
RES2RES10[i]/RESinflow10[i] ~ 0.18

# 3% going to res come from an adoption breakdown, lets say 6 for 10 year olds though plus 6% from family breakdown
PRIOR2RES10[i]/RESinflow10[i] ~ 0.12

# From the whole residential care sample, 12% returned home to live with someone with parental responsibility after their first residential care placement
# 

# 50% of placements finishing for 10-17 year olds are their first ever placement
# (so basically there should always be approx equal numbers comeing into the wo lac states from either non-lac side?)
NP2NRES[i] + NP2RES[i] ~ PRIOR2NRES[i] + PRIOR2RES[i]

# (45\%) go on toexperience at least one more residential care placement at some point after their first residential care placement.. 
#  restricting only to children who had a further episode of care (n=2,320, 80\% of the full sample) we find that 40\% (n=930) went into another residential care placement immediately 
n=2,913 is full sample
55% only have 1 res placement
n=590 their first res placement is their last care placement
45% have at least 2
n=930 ie 31.9% have another placement immediately after their first


OK LETS JUST GUESS & say that 40% of the people in the res care state are first time -
  so then res2exit = 0.4*0.2 at least 
# In fact, from the whole residential care sample, 12% (n=360 of 2,913 children) returned home to live with someone with parental responsibility after their first residential care placement, but only half of these children do not re-enter care.  
so then res2exit, add an extra 6% for the people who will come back
so thats res2exit at least 0.4*0.26

so again, 40% of the people are first time, so 
res2res = 0.4*0.32 which is 0.13 at least - and then people probably go straight back after their 2nd and third too so..
res2res = lets say 0.2??
  
  
  
# if about 20% of people in res care have no priors, and res care is 12% of all care, thats like 0.2x0.12 that go to res on their first care placement?