load("/Users/katehayes/CLmodR/output/data/input/v_turn10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/t_turn10.Rdata")


casc_model = odin::odin({
  
  # parameters # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  N_gender <- user(2)
  age_up <- user(1/52) # rate of ageing out of your age compartment - 1/52
 
  tau <- user(0)
  tau2 <- user(40)

  
  # delays # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  IC1_10_lag[] <- delay(IC1_10[i], tau2)
  IC1_11_lag[] <- delay(IC1_11[i], tau)
  IC1_12_lag[] <- delay(IC1_12[i], tau)
  IC1_13_lag[] <- delay(IC1_13[i], tau)
  IC1_14_lag[] <- delay(IC1_14[i], tau)
  IC1_15_lag[] <- delay(IC1_15[i], tau)
  IC1_16_lag[] <- delay(IC1_16[i], tau)
  IC1_17_lag[] <- delay(IC1_17[i], tau)
  
  IC2_10_lag[] <- delay(IC2_10[i], tau2)
  IC2_11_lag[] <- delay(IC2_11[i], tau)
  IC2_12_lag[] <- delay(IC2_12[i], tau)
  IC2_13_lag[] <- delay(IC2_13[i], tau)
  IC2_14_lag[] <- delay(IC2_14[i], tau)
  IC2_15_lag[] <- delay(IC2_15[i], tau)
  IC2_16_lag[] <- delay(IC2_16[i], tau)
  IC2_17_lag[] <- delay(IC2_17[i], tau)
  
  IC3_10_lag[] <- delay(IC3_10[i], tau2)
  IC3_11_lag[] <- delay(IC3_11[i], tau)
  IC3_12_lag[] <- delay(IC3_12[i], tau)
  IC3_13_lag[] <- delay(IC3_13[i], tau)
  IC3_14_lag[] <- delay(IC3_14[i], tau)
  IC3_15_lag[] <- delay(IC3_15[i], tau)
  IC3_16_lag[] <- delay(IC3_16[i], tau)
  IC3_17_lag[] <- delay(IC3_17[i], tau)
  
  IC4_10_lag[] <- delay(IC4_10[i], tau2)
  IC4_11_lag[] <- delay(IC4_11[i], tau)
  IC4_12_lag[] <- delay(IC4_12[i], tau)
  IC4_13_lag[] <- delay(IC4_13[i], tau)
  IC4_14_lag[] <- delay(IC4_14[i], tau)
  IC4_15_lag[] <- delay(IC4_15[i], tau)
  IC4_16_lag[] <- delay(IC4_16[i], tau)
  IC4_17_lag[] <- delay(IC4_17[i], tau)
  
  EC1_10_lag[] <- delay(EC1_10[i], tau2)
  EC1_11_lag[] <- delay(EC1_11[i], tau)
  EC1_12_lag[] <- delay(EC1_12[i], tau)
  EC1_13_lag[] <- delay(EC1_13[i], tau)
  EC1_14_lag[] <- delay(EC1_14[i], tau)
  EC1_15_lag[] <- delay(EC1_15[i], tau)
  EC1_16_lag[] <- delay(EC1_16[i], tau)
  EC1_17_lag[] <- delay(EC1_17[i], tau)
  
  EC2_10_lag[] <- delay(EC2_10[i], tau2)
  EC2_11_lag[] <- delay(EC2_11[i], tau)
  EC2_12_lag[] <- delay(EC2_12[i], tau)
  EC2_13_lag[] <- delay(EC2_13[i], tau)
  EC2_14_lag[] <- delay(EC2_14[i], tau)
  EC2_15_lag[] <- delay(EC2_15[i], tau)
  EC2_16_lag[] <- delay(EC2_16[i], tau)
  EC2_17_lag[] <- delay(EC2_17[i], tau)
  
  EC3_10_lag[] <- delay(EC3_10[i], tau2)
  EC3_11_lag[] <- delay(EC3_11[i], tau)
  EC3_12_lag[] <- delay(EC3_12[i], tau)
  EC3_13_lag[] <- delay(EC3_13[i], tau)
  EC3_14_lag[] <- delay(EC3_14[i], tau)
  EC3_15_lag[] <- delay(EC3_15[i], tau)
  EC3_16_lag[] <- delay(EC3_16[i], tau)
  EC3_17_lag[] <- delay(EC3_17[i], tau)
  
  EC4_10_lag[] <- delay(EC4_10[i], tau2)
  EC4_11_lag[] <- delay(EC4_11[i], tau)
  EC4_12_lag[] <- delay(EC4_12[i], tau)
  EC4_13_lag[] <- delay(EC4_13[i], tau)
  EC4_14_lag[] <- delay(EC4_14[i], tau)
  EC4_15_lag[] <- delay(EC4_15[i], tau)
  EC4_16_lag[] <- delay(EC4_16[i], tau)
  EC4_17_lag[] <- delay(EC4_17[i], tau)
  
  
  # initial conditions # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  IC1_10_ini[] <- user(0)
  IC1_11_ini[] <- user(0)
  IC1_12_ini[] <- user(0)
  IC1_13_ini[] <- user(0)
  IC1_14_ini[] <- user(0)
  IC1_15_ini[] <- user(0)
  IC1_16_ini[] <- user(0)
  IC1_17_ini[] <- user(0)
  
  IC2_10_ini[] <- user(0)
  IC2_11_ini[] <- user(0)
  IC2_12_ini[] <- user(0)
  IC2_13_ini[] <- user(0)
  IC2_14_ini[] <- user(0)
  IC2_15_ini[] <- user(0)
  IC2_16_ini[] <- user(0)
  IC2_17_ini[] <- user(0)
  
  IC3_10_ini[] <- user(0)
  IC3_11_ini[] <- user(0)
  IC3_12_ini[] <- user(0)
  IC3_13_ini[] <- user(0)
  IC3_14_ini[] <- user(0)
  IC3_15_ini[] <- user(0)
  IC3_16_ini[] <- user(0)
  IC3_17_ini[] <- user(0)
  
  IC4_10_ini[] <- user(0)
  IC4_11_ini[] <- user(0)
  IC4_12_ini[] <- user(0)
  IC4_13_ini[] <- user(0)
  IC4_14_ini[] <- user(0)
  IC4_15_ini[] <- user(0)
  IC4_16_ini[] <- user(0)
  IC4_17_ini[] <- user(0)
  
  EC1_10_ini[] <- user(0)
  EC1_11_ini[] <- user(0)
  EC1_12_ini[] <- user(0)
  EC1_13_ini[] <- user(0)
  EC1_14_ini[] <- user(0)
  EC1_15_ini[] <- user(0)
  EC1_16_ini[] <- user(0)
  EC1_17_ini[] <- user(0)
  
  EC2_10_ini[] <- user(0)
  EC2_11_ini[] <- user(0)
  EC2_12_ini[] <- user(0)
  EC2_13_ini[] <- user(0)
  EC2_14_ini[] <- user(0)
  EC2_15_ini[] <- user(0)
  EC2_16_ini[] <- user(0)
  EC2_17_ini[] <- user(0)
  
  EC3_10_ini[] <- user(0)
  EC3_11_ini[] <- user(0)
  EC3_12_ini[] <- user(0)
  EC3_13_ini[] <- user(0)
  EC3_14_ini[] <- user(0)
  EC3_15_ini[] <- user(0)
  EC3_16_ini[] <- user(0)
  EC3_17_ini[] <- user(0)
  
  EC4_10_ini[] <- user(0)
  EC4_11_ini[] <- user(0)
  EC4_12_ini[] <- user(0)
  EC4_13_ini[] <- user(0)
  EC4_14_ini[] <- user(0)
  EC4_15_ini[] <- user(0)
  EC4_16_ini[] <- user(0)
  EC4_17_ini[] <- user(0)
  
  
  
  initial(IC1_10[]) <- IC1_10_ini[i]
  initial(IC1_11[]) <- IC1_11_ini[i]
  initial(IC1_12[]) <- IC1_12_ini[i]
  initial(IC1_13[]) <- IC1_13_ini[i]
  initial(IC1_14[]) <- IC1_14_ini[i]
  initial(IC1_15[]) <- IC1_15_ini[i]
  initial(IC1_16[]) <- IC1_16_ini[i]
  initial(IC1_17[]) <- IC1_17_ini[i]
  
  initial(IC2_10[]) <- IC2_10_ini[i]
  initial(IC2_11[]) <- IC2_11_ini[i]
  initial(IC2_12[]) <- IC2_12_ini[i]
  initial(IC2_13[]) <- IC2_13_ini[i]
  initial(IC2_14[]) <- IC2_14_ini[i]
  initial(IC2_15[]) <- IC2_15_ini[i]
  initial(IC2_16[]) <- IC2_16_ini[i]
  initial(IC2_17[]) <- IC2_17_ini[i]
  
  initial(IC3_10[]) <- IC3_10_ini[i]
  initial(IC3_11[]) <- IC3_11_ini[i]
  initial(IC3_12[]) <- IC3_12_ini[i]
  initial(IC3_13[]) <- IC3_13_ini[i]
  initial(IC3_14[]) <- IC3_14_ini[i]
  initial(IC3_15[]) <- IC3_15_ini[i]
  initial(IC3_16[]) <- IC3_16_ini[i]
  initial(IC3_17[]) <- IC3_17_ini[i]
  
  initial(IC4_10[]) <- IC4_10_ini[i]
  initial(IC4_11[]) <- IC4_11_ini[i]
  initial(IC4_12[]) <- IC4_12_ini[i]
  initial(IC4_13[]) <- IC4_13_ini[i]
  initial(IC4_14[]) <- IC4_14_ini[i]
  initial(IC4_15[]) <- IC4_15_ini[i]
  initial(IC4_16[]) <- IC4_16_ini[i]
  initial(IC4_17[]) <- IC4_17_ini[i]
  
  initial(EC1_10[]) <- EC1_10_ini[i]
  initial(EC1_11[]) <- EC1_11_ini[i]
  initial(EC1_12[]) <- EC1_12_ini[i]
  initial(EC1_13[]) <- EC1_13_ini[i]
  initial(EC1_14[]) <- EC1_14_ini[i]
  initial(EC1_15[]) <- EC1_15_ini[i]
  initial(EC1_16[]) <- EC1_16_ini[i]
  initial(EC1_17[]) <- EC1_17_ini[i]
  
  initial(EC2_10[]) <- EC2_10_ini[i]
  initial(EC2_11[]) <- EC2_11_ini[i]
  initial(EC2_12[]) <- EC2_12_ini[i]
  initial(EC2_13[]) <- EC2_13_ini[i]
  initial(EC2_14[]) <- EC2_14_ini[i]
  initial(EC2_15[]) <- EC2_15_ini[i]
  initial(EC2_16[]) <- EC2_16_ini[i]
  initial(EC2_17[]) <- EC2_17_ini[i]
  
  initial(EC3_10[]) <- EC3_10_ini[i]
  initial(EC3_11[]) <- EC3_11_ini[i]
  initial(EC3_12[]) <- EC3_12_ini[i]
  initial(EC3_13[]) <- EC3_13_ini[i]
  initial(EC3_14[]) <- EC3_14_ini[i]
  initial(EC3_15[]) <- EC3_15_ini[i]
  initial(EC3_16[]) <- EC3_16_ini[i]
  initial(EC3_17[]) <- EC3_17_ini[i]
  
  initial(EC4_10[]) <- EC4_10_ini[i]
  initial(EC4_11[]) <- EC4_11_ini[i]
  initial(EC4_12[]) <- EC4_12_ini[i]
  initial(EC4_13[]) <- EC4_13_ini[i]
  initial(EC4_14[]) <- EC4_14_ini[i]
  initial(EC4_15[]) <- EC4_15_ini[i]
  initial(EC4_16[]) <- EC4_16_ini[i]
  initial(EC4_17[]) <- EC4_17_ini[i]
  
  # setting dimensions # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  dim(IC1_10) <- N_gender
  dim(IC1_11) <- N_gender
  dim(IC1_12) <- N_gender
  dim(IC1_13) <- N_gender
  dim(IC1_14) <- N_gender
  dim(IC1_15) <- N_gender
  dim(IC1_16) <- N_gender
  dim(IC1_17) <- N_gender
  
  dim(IC2_10) <- N_gender
  dim(IC2_11) <- N_gender
  dim(IC2_12) <- N_gender
  dim(IC2_13) <- N_gender
  dim(IC2_14) <- N_gender
  dim(IC2_15) <- N_gender
  dim(IC2_16) <- N_gender
  dim(IC2_17) <- N_gender
  
  dim(IC3_10) <- N_gender
  dim(IC3_11) <- N_gender
  dim(IC3_12) <- N_gender
  dim(IC3_13) <- N_gender
  dim(IC3_14) <- N_gender
  dim(IC3_15) <- N_gender
  dim(IC3_16) <- N_gender
  dim(IC3_17) <- N_gender
  
  dim(IC4_10) <- N_gender
  dim(IC4_11) <- N_gender
  dim(IC4_12) <- N_gender
  dim(IC4_13) <- N_gender
  dim(IC4_14) <- N_gender
  dim(IC4_15) <- N_gender
  dim(IC4_16) <- N_gender
  dim(IC4_17) <- N_gender
  
  dim(EC1_10) <- N_gender
  dim(EC1_11) <- N_gender
  dim(EC1_12) <- N_gender
  dim(EC1_13) <- N_gender
  dim(EC1_14) <- N_gender
  dim(EC1_15) <- N_gender
  dim(EC1_16) <- N_gender
  dim(EC1_17) <- N_gender
  
  dim(EC2_10) <- N_gender
  dim(EC2_11) <- N_gender
  dim(EC2_12) <- N_gender
  dim(EC2_13) <- N_gender
  dim(EC2_14) <- N_gender
  dim(EC2_15) <- N_gender
  dim(EC2_16) <- N_gender
  dim(EC2_17) <- N_gender
  
  dim(EC3_10) <- N_gender
  dim(EC3_11) <- N_gender
  dim(EC3_12) <- N_gender
  dim(EC3_13) <- N_gender
  dim(EC3_14) <- N_gender
  dim(EC3_15) <- N_gender
  dim(EC3_16) <- N_gender
  dim(EC3_17) <- N_gender
  
  dim(EC4_10) <- N_gender
  dim(EC4_11) <- N_gender
  dim(EC4_12) <- N_gender
  dim(EC4_13) <- N_gender
  dim(EC4_14) <- N_gender
  dim(EC4_15) <- N_gender
  dim(EC4_16) <- N_gender
  dim(EC4_17) <- N_gender
  
  dim(IC1_10_ini) <- N_gender
  dim(IC1_11_ini) <- N_gender
  dim(IC1_12_ini) <- N_gender
  dim(IC1_13_ini) <- N_gender
  dim(IC1_14_ini) <- N_gender
  dim(IC1_15_ini) <- N_gender
  dim(IC1_16_ini) <- N_gender
  dim(IC1_17_ini) <- N_gender
  
  dim(IC2_10_ini) <- N_gender
  dim(IC2_11_ini) <- N_gender
  dim(IC2_12_ini) <- N_gender
  dim(IC2_13_ini) <- N_gender
  dim(IC2_14_ini) <- N_gender
  dim(IC2_15_ini) <- N_gender
  dim(IC2_16_ini) <- N_gender
  dim(IC2_17_ini) <- N_gender
  
  dim(IC3_10_ini) <- N_gender
  dim(IC3_11_ini) <- N_gender
  dim(IC3_12_ini) <- N_gender
  dim(IC3_13_ini) <- N_gender
  dim(IC3_14_ini) <- N_gender
  dim(IC3_15_ini) <- N_gender
  dim(IC3_16_ini) <- N_gender
  dim(IC3_17_ini) <- N_gender
  
  dim(IC4_10_ini) <- N_gender
  dim(IC4_11_ini) <- N_gender
  dim(IC4_12_ini) <- N_gender
  dim(IC4_13_ini) <- N_gender
  dim(IC4_14_ini) <- N_gender
  dim(IC4_15_ini) <- N_gender
  dim(IC4_16_ini) <- N_gender
  dim(IC4_17_ini) <- N_gender
  
  dim(EC1_10_ini) <- N_gender
  dim(EC1_11_ini) <- N_gender
  dim(EC1_12_ini) <- N_gender
  dim(EC1_13_ini) <- N_gender
  dim(EC1_14_ini) <- N_gender
  dim(EC1_15_ini) <- N_gender
  dim(EC1_16_ini) <- N_gender
  dim(EC1_17_ini) <- N_gender
  
  dim(EC2_10_ini) <- N_gender
  dim(EC2_11_ini) <- N_gender
  dim(EC2_12_ini) <- N_gender
  dim(EC2_13_ini) <- N_gender
  dim(EC2_14_ini) <- N_gender
  dim(EC2_15_ini) <- N_gender
  dim(EC2_16_ini) <- N_gender
  dim(EC2_17_ini) <- N_gender
  
  dim(EC3_10_ini) <- N_gender
  dim(EC3_11_ini) <- N_gender
  dim(EC3_12_ini) <- N_gender
  dim(EC3_13_ini) <- N_gender
  dim(EC3_14_ini) <- N_gender
  dim(EC3_15_ini) <- N_gender
  dim(EC3_16_ini) <- N_gender
  dim(EC3_17_ini) <- N_gender
  
  dim(EC4_10_ini) <- N_gender
  dim(EC4_11_ini) <- N_gender
  dim(EC4_12_ini) <- N_gender
  dim(EC4_13_ini) <- N_gender
  dim(EC4_14_ini) <- N_gender
  dim(EC4_15_ini) <- N_gender
  dim(EC4_16_ini) <- N_gender
  dim(EC4_17_ini) <- N_gender
  
  dim(IC1_10_lag) <- N_gender
  dim(IC1_11_lag) <- N_gender
  dim(IC1_12_lag) <- N_gender
  dim(IC1_13_lag) <- N_gender
  dim(IC1_14_lag) <- N_gender
  dim(IC1_15_lag) <- N_gender
  dim(IC1_16_lag) <- N_gender
  dim(IC1_17_lag) <- N_gender
  
  dim(IC2_10_lag) <- N_gender
  dim(IC2_11_lag) <- N_gender
  dim(IC2_12_lag) <- N_gender
  dim(IC2_13_lag) <- N_gender
  dim(IC2_14_lag) <- N_gender
  dim(IC2_15_lag) <- N_gender
  dim(IC2_16_lag) <- N_gender
  dim(IC2_17_lag) <- N_gender
  
  dim(IC3_10_lag) <- N_gender
  dim(IC3_11_lag) <- N_gender
  dim(IC3_12_lag) <- N_gender
  dim(IC3_13_lag) <- N_gender
  dim(IC3_14_lag) <- N_gender
  dim(IC3_15_lag) <- N_gender
  dim(IC3_16_lag) <- N_gender
  dim(IC3_17_lag) <- N_gender
  
  dim(IC4_10_lag) <- N_gender
  dim(IC4_11_lag) <- N_gender
  dim(IC4_12_lag) <- N_gender
  dim(IC4_13_lag) <- N_gender
  dim(IC4_14_lag) <- N_gender
  dim(IC4_15_lag) <- N_gender
  dim(IC4_16_lag) <- N_gender
  dim(IC4_17_lag) <- N_gender
  
  dim(EC1_10_lag) <- N_gender
  dim(EC1_11_lag) <- N_gender
  dim(EC1_12_lag) <- N_gender
  dim(EC1_13_lag) <- N_gender
  dim(EC1_14_lag) <- N_gender
  dim(EC1_15_lag) <- N_gender
  dim(EC1_16_lag) <- N_gender
  dim(EC1_17_lag) <- N_gender
  
  dim(EC2_10_lag) <- N_gender
  dim(EC2_11_lag) <- N_gender
  dim(EC2_12_lag) <- N_gender
  dim(EC2_13_lag) <- N_gender
  dim(EC2_14_lag) <- N_gender
  dim(EC2_15_lag) <- N_gender
  dim(EC2_16_lag) <- N_gender
  dim(EC2_17_lag) <- N_gender
  
  dim(EC3_10_lag) <- N_gender
  dim(EC3_11_lag) <- N_gender
  dim(EC3_12_lag) <- N_gender
  dim(EC3_13_lag) <- N_gender
  dim(EC3_14_lag) <- N_gender
  dim(EC3_15_lag) <- N_gender
  dim(EC3_16_lag) <- N_gender
  dim(EC3_17_lag) <- N_gender
  
  dim(EC4_10_lag) <- N_gender
  dim(EC4_11_lag) <- N_gender
  dim(EC4_12_lag) <- N_gender
  dim(EC4_13_lag) <- N_gender
  dim(EC4_14_lag) <- N_gender
  dim(EC4_15_lag) <- N_gender
  dim(EC4_16_lag) <- N_gender
  dim(EC4_17_lag) <- N_gender
  
  
  dim(I) <- N_gender
  dim(E) <- N_gender
  dim(incl_rate) <- N_gender
  dim(excl_rate) <- N_gender
  
  
  # intermediate quantities # # # # # # # # # # # # # # # # # # # # # # # # # # #
  I[] <- IC1_10[i] + IC1_11[i] + IC1_12[i] + IC1_13[i] + IC1_14[i] + IC1_15[i] + IC1_16[i] + IC1_17[i] + IC2_10[i] + IC2_11[i] + IC2_12[i] + IC2_13[i] + IC2_14[i] + IC2_15[i] + IC2_16[i] + IC2_17[i] + IC3_10[i] + IC3_11[i] + IC3_12[i] + IC3_13[i] + IC3_14[i] + IC3_15[i] + IC3_16[i] + IC3_17[i] + IC4_10[i] + IC4_11[i] + IC4_12[i] + IC4_13[i] + IC4_14[i] + IC4_15[i] + IC4_16[i] + IC4_17[i]
  E[] <- EC1_10[i] + EC1_11[i] + EC1_12[i] + EC1_13[i] + EC1_14[i] + EC1_15[i] + EC1_16[i] + EC1_17[i] + EC2_10[i] + EC2_11[i] + EC2_12[i] + EC2_13[i] + EC2_14[i] + EC2_15[i] + EC2_16[i] + EC2_17[i] + EC3_10[i] + EC3_11[i] + EC3_12[i] + EC3_13[i] + EC3_14[i] + EC3_15[i] + EC3_16[i] + EC3_17[i] + EC4_10[i] + EC4_11[i] + EC4_12[i] + EC4_13[i] + EC4_14[i] + EC4_15[i] + EC4_16[i] + EC4_17[i]
  
  incl_rate[] <- I[i] / (I[i] + E[i])
  excl_rate[] <- E[i] / (I[i] + E[i])
  
  
  #ageing flow
  age_IC1_10[] <- 0.9842*incl_rate[i]*turn10[i] - age_up*IC1_10_lag[i]
  age_IC2_10[] <- 0.003*incl_rate[i]*turn10[i] - age_up*IC2_10_lag[i]
  age_IC3_10[] <- 0.0007*incl_rate[i]*turn10[i] - age_up*IC3_10_lag[i]
  age_IC4_10[] <- 0.0058*incl_rate[i]*turn10[i] - age_up*IC4_10_lag[i]
  
  age_IC1_11[] <- age_up*IC1_10_lag[i] - age_up*IC1_11_lag[i]
  age_IC2_11[] <- age_up*IC2_10_lag[i] - age_up*IC2_11_lag[i]
  age_IC3_11[] <- age_up*IC3_10_lag[i] - age_up*IC3_11_lag[i]
  age_IC4_11[] <- age_up*IC4_10_lag[i] - age_up*IC4_11_lag[i]
  
  age_IC1_12[] <- age_up*IC1_11_lag[i] - age_up*IC1_12_lag[i]
  age_IC2_12[] <- age_up*IC2_11_lag[i] - age_up*IC2_12_lag[i]
  age_IC3_12[] <- age_up*IC3_11_lag[i] - age_up*IC3_12_lag[i]
  age_IC4_12[] <- age_up*IC4_11_lag[i] - age_up*IC4_12_lag[i]
  
  age_IC1_13[] <- age_up*IC1_12_lag[i] - age_up*IC1_13_lag[i]
  age_IC2_13[] <- age_up*IC2_12_lag[i] - age_up*IC2_13_lag[i]
  age_IC3_13[] <- age_up*IC3_12_lag[i] - age_up*IC3_13_lag[i]
  age_IC4_13[] <- age_up*IC4_12_lag[i] - age_up*IC4_13_lag[i]
  
  age_IC1_14[] <- age_up*IC1_13_lag[i] - age_up*IC1_14_lag[i]
  age_IC2_14[] <- age_up*IC2_13_lag[i] - age_up*IC2_14_lag[i]
  age_IC3_14[] <- age_up*IC3_13_lag[i] - age_up*IC3_14_lag[i]
  age_IC4_14[] <- age_up*IC4_13_lag[i] - age_up*IC4_14_lag[i]
  
  age_IC1_15[] <- age_up*IC1_14_lag[i] - age_up*IC1_15_lag[i]
  age_IC2_15[] <- age_up*IC2_14_lag[i] - age_up*IC2_15_lag[i]
  age_IC3_15[] <- age_up*IC3_14_lag[i] - age_up*IC3_15_lag[i]
  age_IC4_15[] <- age_up*IC4_14_lag[i] - age_up*IC4_15_lag[i]
  
  age_IC1_16[] <- age_up*IC1_15_lag[i] - age_up*IC1_16_lag[i]
  age_IC2_16[] <- age_up*IC2_15_lag[i] - age_up*IC2_16_lag[i]
  age_IC3_16[] <- age_up*IC3_15_lag[i] - age_up*IC3_16_lag[i]
  age_IC4_16[] <- age_up*IC4_15_lag[i] - age_up*IC4_16_lag[i]
  
  age_IC1_17[] <- age_up*IC1_16_lag[i] - age_up*IC1_17_lag[i]
  age_IC2_17[] <- age_up*IC2_16_lag[i] - age_up*IC2_17_lag[i]
  age_IC3_17[] <- age_up*IC3_16_lag[i] - age_up*IC3_17_lag[i]
  age_IC4_17[] <- age_up*IC4_16_lag[i] - age_up*IC4_17_lag[i]
  
  
  
  age_EC1_10[] <- 0.967*excl_rate[i]*turn10[i] - age_up*EC1_10_lag[i]
  age_EC2_10[] <- 0.01*excl_rate[i]*turn10[i] - age_up*EC2_10_lag[i]
  age_EC3_10[] <- 0.003*excl_rate[i]*turn10[i] - age_up*EC3_10_lag[i]
  age_EC4_10[] <- 0.02*excl_rate[i]*turn10[i] - age_up*EC4_10_lag[i]
    
  age_EC1_11[] <- age_up*EC1_10_lag[i] - age_up*EC1_11_lag[i]
  age_EC2_11[] <- age_up*EC2_10_lag[i] - age_up*EC2_11_lag[i]
  age_EC3_11[] <- age_up*EC3_10_lag[i] - age_up*EC3_11_lag[i]
  age_EC4_11[] <- age_up*EC4_10_lag[i] - age_up*EC4_11_lag[i]
  
  age_EC1_12[] <- age_up*EC1_11_lag[i] - age_up*EC1_12_lag[i]
  age_EC2_12[] <- age_up*EC2_11_lag[i] - age_up*EC2_12_lag[i]
  age_EC3_12[] <- age_up*EC3_11_lag[i] - age_up*EC3_12_lag[i]
  age_EC4_12[] <- age_up*EC4_11_lag[i] - age_up*EC4_12_lag[i]
  
  age_EC1_13[] <- age_up*EC1_12_lag[i] - age_up*EC1_13_lag[i]
  age_EC2_13[] <- age_up*EC2_12_lag[i] - age_up*EC2_13_lag[i]
  age_EC3_13[] <- age_up*EC3_12_lag[i] - age_up*EC3_13_lag[i]
  age_EC4_13[] <- age_up*EC4_12_lag[i] - age_up*EC4_13_lag[i]
  
  age_EC1_14[] <- age_up*EC1_13_lag[i] - age_up*EC1_14_lag[i]
  age_EC2_14[] <- age_up*EC2_13_lag[i] - age_up*EC2_14_lag[i]
  age_EC3_14[] <- age_up*EC3_13_lag[i] - age_up*EC3_14_lag[i]
  age_EC4_14[] <- age_up*EC4_13_lag[i] - age_up*EC4_14_lag[i]
  
  age_EC1_15[] <- age_up*EC1_14_lag[i] - age_up*EC1_15_lag[i]
  age_EC2_15[] <- age_up*EC2_14_lag[i] - age_up*EC2_15_lag[i]
  age_EC3_15[] <- age_up*EC3_14_lag[i] - age_up*EC3_15_lag[i]
  age_EC4_15[] <- age_up*EC4_14_lag[i] - age_up*EC4_15_lag[i]
  
  age_EC1_16[] <- age_up*EC1_15_lag[i] - age_up*EC1_16_lag[i]
  age_EC2_16[] <- age_up*EC2_15_lag[i] - age_up*EC2_16_lag[i]
  age_EC3_16[] <- age_up*EC3_15_lag[i] - age_up*EC3_16_lag[i]
  age_EC4_16[] <- age_up*EC4_15_lag[i] - age_up*EC4_16_lag[i]
  
  age_EC1_17[] <- age_up*EC1_16_lag[i] - age_up*EC1_17_lag[i]
  age_EC2_17[] <- age_up*EC2_16_lag[i] - age_up*EC2_17_lag[i]
  age_EC3_17[] <- age_up*EC3_16_lag[i] - age_up*EC3_17_lag[i]
  age_EC4_17[] <- age_up*EC4_16_lag[i] - age_up*EC4_17_lag[i]
  
  
  #impoverishmentflow
  pov_IC1_10[] <- r[i]*EC1_10[i] - f[i]*IC1_10[i]
  pov_IC2_10[] <- r[i]*EC2_10[i] - f[i]*IC2_10[i]
  pov_IC3_10[] <- r[i]*EC3_10[i] - f[i]*IC3_10[i]
  pov_IC4_10[] <- r[i]*EC4_10[i] - f[i]*IC4_10[i]
  
  pov_IC1_11[] <- r[i]*EC1_11[i] - f[i]*IC1_11[i]
  pov_IC2_11[] <- r[i]*EC2_11[i] - f[i]*IC2_11[i]
  pov_IC3_11[] <- r[i]*EC3_11[i] - f[i]*IC3_11[i]
  pov_IC4_11[] <- r[i]*EC4_11[i] - f[i]*IC4_11[i]
  
  pov_IC1_12[] <- r[i]*EC1_12[i] - f[i]*IC1_12[i]
  pov_IC2_12[] <- r[i]*EC2_12[i] - f[i]*IC2_12[i]
  pov_IC3_12[] <- r[i]*EC3_12[i] - f[i]*IC3_12[i]
  pov_IC4_12[] <- r[i]*EC4_12[i] - f[i]*IC4_12[i]
  
  pov_IC1_13[] <- r[i]*EC1_13[i] - f[i]*IC1_13[i]
  pov_IC2_13[] <- r[i]*EC2_13[i] - f[i]*IC2_13[i]
  pov_IC3_13[] <- r[i]*EC3_13[i] - f[i]*IC3_13[i]
  pov_IC4_13[] <- r[i]*EC4_13[i] - f[i]*IC4_13[i]
  
  pov_IC1_14[] <- r[i]*EC1_14[i] - f[i]*IC1_14[i]
  pov_IC2_14[] <- r[i]*EC2_14[i] - f[i]*IC2_14[i]
  pov_IC3_14[] <- r[i]*EC3_14[i] - f[i]*IC3_14[i]
  pov_IC4_14[] <- r[i]*EC4_14[i] - f[i]*IC4_14[i]
  
  pov_IC1_15[] <- r[i]*EC1_15[i] - f[i]*IC1_15[i]
  pov_IC2_15[] <- r[i]*EC2_15[i] - f[i]*IC2_15[i]
  pov_IC3_15[] <- r[i]*EC3_15[i] - f[i]*IC3_15[i]
  pov_IC4_15[] <- r[i]*EC4_15[i] - f[i]*IC4_15[i]
  
  pov_IC1_16[] <- r[i]*EC1_16[i] - f[i]*IC1_16[i]
  pov_IC2_16[] <- r[i]*EC2_16[i] - f[i]*IC2_16[i]
  pov_IC3_16[] <- r[i]*EC3_16[i] - f[i]*IC3_16[i]
  pov_IC4_16[] <- r[i]*EC4_16[i] - f[i]*IC4_16[i]
  
  pov_IC1_17[] <- r[i]*EC1_17[i] - f[i]*IC1_17[i]
  pov_IC2_17[] <- r[i]*EC2_17[i] - f[i]*IC2_17[i]
  pov_IC3_17[] <- r[i]*EC3_17[i] - f[i]*IC3_17[i]
  pov_IC4_17[] <- r[i]*EC4_17[i] - f[i]*IC4_17[i]
  
  
  
  pov_EC1_10[] <- f[i]*IC1_10[i] - r[i]*EC1_10[i]
  pov_EC2_10[] <- f[i]*IC2_10[i] - r[i]*EC2_10[i]
  pov_EC3_10[] <- f[i]*IC3_10[i] - r[i]*EC3_10[i]
  pov_EC4_10[] <- f[i]*IC4_10[i] - r[i]*EC4_10[i]
  
  pov_EC1_11[] <- f[i]*IC1_11[i] - r[i]*EC1_11[i]
  pov_EC2_11[] <- f[i]*IC2_11[i] - r[i]*EC2_11[i]
  pov_EC3_11[] <- f[i]*IC3_11[i] - r[i]*EC3_11[i]
  pov_EC4_11[] <- f[i]*IC4_11[i] - r[i]*EC4_11[i]
  
  pov_EC1_12[] <- f[i]*IC1_12[i] - r[i]*EC1_12[i]
  pov_EC2_12[] <- f[i]*IC2_12[i] - r[i]*EC2_12[i]
  pov_EC3_12[] <- f[i]*IC3_12[i] - r[i]*EC3_12[i]
  pov_EC4_12[] <- f[i]*IC4_12[i] - r[i]*EC4_12[i]
  
  pov_EC1_13[] <- f[i]*IC1_13[i] - r[i]*EC1_13[i]
  pov_EC2_13[] <- f[i]*IC2_13[i] - r[i]*EC2_13[i]
  pov_EC3_13[] <- f[i]*IC3_13[i] - r[i]*EC3_13[i]
  pov_EC4_13[] <- f[i]*IC4_13[i] - r[i]*EC4_13[i]
  
  pov_EC1_14[] <- f[i]*IC1_14[i] - r[i]*EC1_14[i]
  pov_EC2_14[] <- f[i]*IC2_14[i] - r[i]*EC2_14[i]
  pov_EC3_14[] <- f[i]*IC3_14[i] - r[i]*EC3_14[i]
  pov_EC4_14[] <- f[i]*IC4_14[i] - r[i]*EC4_14[i]
  
  pov_EC1_15[] <- f[i]*IC1_15[i] - r[i]*EC1_15[i]
  pov_EC2_15[] <- f[i]*IC2_15[i] - r[i]*EC2_15[i]
  pov_EC3_15[] <- f[i]*IC3_15[i] - r[i]*EC3_15[i]
  pov_EC4_15[] <- f[i]*IC4_15[i] - r[i]*EC4_15[i]
  
  pov_EC1_16[] <- f[i]*IC1_16[i] - r[i]*EC1_16[i]
  pov_EC2_16[] <- f[i]*IC2_16[i] - r[i]*EC2_16[i]
  pov_EC3_16[] <- f[i]*IC3_16[i] - r[i]*EC3_16[i]
  pov_EC4_16[] <- f[i]*IC4_16[i] - r[i]*EC4_16[i]
  
  pov_EC1_17[] <- f[i]*IC1_17[i] - r[i]*EC1_17[i]
  pov_EC2_17[] <- f[i]*IC2_17[i] - r[i]*EC2_17[i]
  pov_EC3_17[] <- f[i]*IC3_17[i] - r[i]*EC3_17[i]
  pov_EC4_17[] <- f[i]*IC4_17[i] - r[i]*EC4_17[i]
  
  
  

  
  
  # differential equations # # # # # # # # # # # # # # # # # # # # # # # # # # #
  deriv(IC1_10[]) <- 0.9842*incl_rate[i]*turn10[i] - age_up*IC1_10_lag[i] - f[i]*IC1_10[i] + r[i]*EC1_10[i] - n2care_i10[i]*IC1_10[i]
  deriv(IC2_10[]) <- 0.003*incl_rate[i]*turn10[i] - age_up*IC2_10_lag[i] - f[i]*IC2_10[i] + r[i]*EC2_10[i] + n2nr_i10[i]*n2care_i10[i]*IC1_10[i] + 
  deriv(IC3_10[]) <- 0.0007*incl_rate[i]*turn10[i] - age_up*IC3_10_lag[i] - f[i]*IC3_10[i] + r[i]*EC3_10[i] + n2r_i10[i]*n2care_i10[i]*IC1_10[i]
  deriv(IC4_10[]) <- 0.0058*incl_rate[i]*turn10[i] - age_up*IC4_10_lag[i] - f[i]*IC4_10[i] + r[i]*EC4_10[i] - p2care_i10[i]*IC4_10[i]
  
  deriv(IC1_11[]) <- age_up*IC1_10_lag[i] - age_up*IC1_11_lag[i] - f[i]*IC1_11[i] + r[i]*EC1_11[i]
  deriv(IC2_11[]) <- age_up*IC2_10_lag[i] - age_up*IC2_11_lag[i] - f[i]*IC2_11[i] + r[i]*EC2_11[i]
  deriv(IC3_11[]) <- age_up*IC3_10_lag[i] - age_up*IC3_11_lag[i] - f[i]*IC3_11[i] + r[i]*EC3_11[i]
  deriv(IC4_11[]) <- age_up*IC4_10_lag[i] - age_up*IC4_11_lag[i] - f[i]*IC4_11[i] + r[i]*EC4_11[i]
  
  deriv(IC1_12[]) <- age_up*IC1_11_lag[i] - age_up*IC1_12_lag[i] - f[i]*IC1_12[i] + r[i]*EC1_12[i]
  deriv(IC2_12[]) <- age_up*IC2_11_lag[i] - age_up*IC2_12_lag[i] - f[i]*IC2_12[i] + r[i]*EC2_12[i]
  deriv(IC3_12[]) <- age_up*IC3_11_lag[i] - age_up*IC3_12_lag[i] - f[i]*IC3_12[i] + r[i]*EC3_12[i]
  deriv(IC4_12[]) <- age_up*IC4_11_lag[i] - age_up*IC4_12_lag[i] - f[i]*IC4_12[i] + r[i]*EC4_12[i]
  
  deriv(IC1_13[]) <- age_up*IC1_12_lag[i] - age_up*IC1_13_lag[i] - f[i]*IC1_13[i] + r[i]*EC1_13[i]
  deriv(IC2_13[]) <- age_up*IC2_12_lag[i] - age_up*IC2_13_lag[i] - f[i]*IC2_13[i] + r[i]*EC2_13[i]
  deriv(IC3_13[]) <- age_up*IC3_12_lag[i] - age_up*IC3_13_lag[i] - f[i]*IC3_13[i] + r[i]*EC3_13[i]
  deriv(IC4_13[]) <- age_up*IC4_12_lag[i] - age_up*IC4_13_lag[i] - f[i]*IC4_13[i] + r[i]*EC4_13[i]
  
  deriv(IC1_14[]) <- age_up*IC1_13_lag[i] - age_up*IC1_14_lag[i] - f[i]*IC1_14[i] + r[i]*EC1_14[i]
  deriv(IC2_14[]) <- age_up*IC2_13_lag[i] - age_up*IC2_14_lag[i] - f[i]*IC2_14[i] + r[i]*EC2_14[i]
  deriv(IC3_14[]) <- age_up*IC3_13_lag[i] - age_up*IC3_14_lag[i] - f[i]*IC3_14[i] + r[i]*EC3_14[i]
  deriv(IC4_14[]) <- age_up*IC4_13_lag[i] - age_up*IC4_14_lag[i] - f[i]*IC4_14[i] + r[i]*EC4_14[i]
  
  deriv(IC1_15[]) <- age_up*IC1_14_lag[i] - age_up*IC1_15_lag[i] - f[i]*IC1_15[i] + r[i]*EC1_15[i]
  deriv(IC2_15[]) <- age_up*IC2_14_lag[i] - age_up*IC2_15_lag[i] - f[i]*IC2_15[i] + r[i]*EC2_15[i]
  deriv(IC3_15[]) <- age_up*IC3_14_lag[i] - age_up*IC3_15_lag[i] - f[i]*IC3_15[i] + r[i]*EC3_15[i]
  deriv(IC4_15[]) <- age_up*IC4_14_lag[i] - age_up*IC4_15_lag[i] - f[i]*IC4_15[i] + r[i]*EC4_15[i]
  
  deriv(IC1_16[]) <- age_up*IC1_15_lag[i] - age_up*IC1_16_lag[i] - f[i]*IC1_16[i] + r[i]*EC1_16[i]
  deriv(IC2_16[]) <- age_up*IC2_15_lag[i] - age_up*IC2_16_lag[i] - f[i]*IC2_16[i] + r[i]*EC2_16[i]
  deriv(IC3_16[]) <- age_up*IC3_15_lag[i] - age_up*IC3_16_lag[i] - f[i]*IC3_16[i] + r[i]*EC3_16[i]
  deriv(IC4_16[]) <- age_up*IC4_15_lag[i] - age_up*IC4_16_lag[i] - f[i]*IC4_16[i] + r[i]*EC4_16[i]
  
  deriv(IC1_17[]) <- age_up*IC1_16_lag[i] - age_up*IC1_17_lag[i] - f[i]*IC1_17[i] + r[i]*EC1_17[i]
  deriv(IC2_17[]) <- age_up*IC2_16_lag[i] - age_up*IC2_17_lag[i] - f[i]*IC2_17[i] + r[i]*EC2_17[i]
  deriv(IC3_17[]) <- age_up*IC3_16_lag[i] - age_up*IC3_17_lag[i] - f[i]*IC3_17[i] + r[i]*EC3_17[i]
  deriv(IC4_17[]) <- age_up*IC4_16_lag[i] - age_up*IC4_17_lag[i] - f[i]*IC4_17[i] + r[i]*EC4_17[i]
  
  
  
  deriv(EC1_10[]) <- 0.967*excl_rate[i]*turn10[i] - age_up*EC1_10_lag[i] - r[i]*EC1_10[i] + f[i]*IC1_10[i]
  deriv(EC2_10[]) <- 0.01*excl_rate[i]*turn10[i] - age_up*EC2_10_lag[i] - r[i]*EC2_10[i] + f[i]*IC2_10[i]
  deriv(EC3_10[]) <- 0.003*excl_rate[i]*turn10[i] - age_up*EC3_10_lag[i] - r[i]*EC3_10[i] + f[i]*IC3_10[i]
  deriv(EC4_10[]) <- 0.02*excl_rate[i]*turn10[i] - age_up*EC4_10_lag[i] - r[i]*EC4_10[i] + f[i]*IC4_10[i]
  
  deriv(EC1_11[]) <- age_up*EC1_10_lag[i] - age_up*EC1_11_lag[i] - r[i]*EC1_11[i] + f[i]*IC1_11[i]
  deriv(EC2_11[]) <- age_up*EC2_10_lag[i] - age_up*EC2_11_lag[i] - r[i]*EC2_11[i] + f[i]*IC2_11[i]
  deriv(EC3_11[]) <- age_up*EC3_10_lag[i] - age_up*EC3_11_lag[i] - r[i]*EC3_11[i] + f[i]*IC3_11[i]
  deriv(EC4_11[]) <- age_up*EC4_10_lag[i] - age_up*EC4_11_lag[i] - r[i]*EC4_11[i] + f[i]*IC4_11[i]
  
  deriv(EC1_12[]) <- age_up*EC1_11_lag[i] - age_up*EC1_12_lag[i] - r[i]*EC1_12[i] + f[i]*IC1_12[i]
  deriv(EC2_12[]) <- age_up*EC2_11_lag[i] - age_up*EC2_12_lag[i] - r[i]*EC2_12[i] + f[i]*IC2_12[i]
  deriv(EC3_12[]) <- age_up*EC3_11_lag[i] - age_up*EC3_12_lag[i] - r[i]*EC3_12[i] + f[i]*IC3_12[i]
  deriv(EC4_12[]) <- age_up*EC4_11_lag[i] - age_up*EC4_12_lag[i] - r[i]*EC4_12[i] + f[i]*IC4_12[i]
  
  deriv(EC1_13[]) <- age_up*EC1_12_lag[i] - age_up*EC1_13_lag[i] - r[i]*EC1_13[i] + f[i]*IC1_13[i]
  deriv(EC2_13[]) <- age_up*EC2_12_lag[i] - age_up*EC2_13_lag[i] - r[i]*EC2_13[i] + f[i]*IC2_13[i]
  deriv(EC3_13[]) <- age_up*EC3_12_lag[i] - age_up*EC3_13_lag[i] - r[i]*EC3_13[i] + f[i]*IC3_13[i]
  deriv(EC4_13[]) <- age_up*EC4_12_lag[i] - age_up*EC4_13_lag[i] - r[i]*EC4_13[i] + f[i]*IC4_13[i]
  
  deriv(EC1_14[]) <- age_up*EC1_13_lag[i] - age_up*EC1_14_lag[i] - r[i]*EC1_14[i] + f[i]*IC1_14[i]
  deriv(EC2_14[]) <- age_up*EC2_13_lag[i] - age_up*EC2_14_lag[i] - r[i]*EC2_14[i] + f[i]*IC2_14[i]
  deriv(EC3_14[]) <- age_up*EC3_13_lag[i] - age_up*EC3_14_lag[i] - r[i]*EC3_14[i] + f[i]*IC3_14[i]
  deriv(EC4_14[]) <- age_up*EC4_13_lag[i] - age_up*EC4_14_lag[i] - r[i]*EC4_14[i] + f[i]*IC4_14[i]
  
  deriv(EC1_15[]) <- age_up*EC1_14_lag[i] - age_up*EC1_15_lag[i] - r[i]*EC1_15[i] + f[i]*IC1_15[i]
  deriv(EC2_15[]) <- age_up*EC2_14_lag[i] - age_up*EC2_15_lag[i] - r[i]*EC2_15[i] + f[i]*IC2_15[i]
  deriv(EC3_15[]) <- age_up*EC3_14_lag[i] - age_up*EC3_15_lag[i] - r[i]*EC3_15[i] + f[i]*IC3_15[i]
  deriv(EC4_15[]) <- age_up*EC4_14_lag[i] - age_up*EC4_15_lag[i] - r[i]*EC4_15[i] + f[i]*IC4_15[i]
  
  deriv(EC1_16[]) <- age_up*EC1_15_lag[i] - age_up*EC1_16_lag[i] - r[i]*EC1_16[i] + f[i]*IC1_16[i]
  deriv(EC2_16[]) <- age_up*EC2_15_lag[i] - age_up*EC2_16_lag[i] - r[i]*EC2_16[i] + f[i]*IC2_16[i]
  deriv(EC3_16[]) <- age_up*EC3_15_lag[i] - age_up*EC3_16_lag[i] - r[i]*EC3_16[i] + f[i]*IC3_16[i]
  deriv(EC4_16[]) <- age_up*EC4_15_lag[i] - age_up*EC4_16_lag[i] - r[i]*EC4_16[i] + f[i]*IC4_16[i]
  
  deriv(EC1_17[]) <- age_up*EC1_16_lag[i] - age_up*EC1_17_lag[i] - r[i]*EC1_17[i] + f[i]*IC1_17[i]
  deriv(EC2_17[]) <- age_up*EC2_16_lag[i] - age_up*EC2_17_lag[i] - r[i]*EC2_17[i] + f[i]*IC2_17[i]
  deriv(EC3_17[]) <- age_up*EC3_16_lag[i] - age_up*EC3_17_lag[i] - r[i]*EC3_17[i] + f[i]*IC3_17[i]
  deriv(EC4_17[]) <- age_up*EC4_16_lag[i] - age_up*EC4_17_lag[i] - r[i]*EC4_17[i] + f[i]*IC4_17[i]
  
  
  # interpolation section
  turn10[] <- interpolate(tt, y, "spline")
  dim(turn10) <- N_gender
  tt[] <- user()
  y[, ] <- user()
  dim(tt) <- user()
  dim(y) <- c(length(tt), length(turn10))
  
  r[] <- interpolate(rft, ri, "spline")
  dim(r) <- N_gender
  rft[] <- user()
  ri[, ] <- user()
  dim(rft) <- user()
  dim(ri) <- c(length(rft), length(r))
  
  f[] <- interpolate(rft, fa, "spline")
  dim(f) <- N_gender
  fa[, ] <- user()
  dim(fa) <- c(length(rft), length(f))
  
  
  
  
  
  
},
target = 'c')  

casc_pars <- list(tt = t_turn10,
                  y = v_turn10,
                  rft = rf_t_scenario,
                  ri = rise_scenario,
                  fa = fall_scenario,
                  
                  IC1_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  IC1_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  IC1_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  
                  IC1_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  
                  IC1_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  
                  IC1_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  
                  IC1_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  
                  IC1_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(nev_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(nev_incl) %>% 
                                   unlist()),
                  IC2_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(nres_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(nres_incl) %>% 
                                   unlist()),
                  IC3_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(res_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(res_incl) %>% 
                                   unlist()),
                  IC4_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(pri_incl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(pri_incl) %>% 
                                   unlist()),
                  
                  
                  EC1_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_10_ini = c(care_ic %>% 
                                   filter(age == 10,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 10,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  EC1_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_11_ini = c(care_ic %>% 
                                   filter(age == 11,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 11,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  EC1_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_12_ini = c(care_ic %>% 
                                   filter(age == 12,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 12,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  
                  EC1_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_13_ini = c(care_ic %>% 
                                   filter(age == 13,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 13,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  
                  EC1_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_14_ini = c(care_ic %>% 
                                   filter(age == 14,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 14,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  
                  EC1_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_15_ini = c(care_ic %>% 
                                   filter(age == 15,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 15,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  
                  EC1_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_16_ini = c(care_ic %>% 
                                   filter(age == 16,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 16,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  
                  
                  EC1_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(nev_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(nev_excl) %>% 
                                   unlist()),
                  EC2_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(nres_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(nres_excl) %>% 
                                   unlist()),
                  EC3_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(res_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(res_excl) %>% 
                                   unlist()),
                  EC4_17_ini = c(care_ic %>% 
                                   filter(age == 17,
                                          gender == "Boys") %>% 
                                   select(pri_excl) %>% 
                                   unlist(), care_ic %>% 
                                   filter(age == 17,
                                          gender == "Girls") %>% 
                                   select(pri_excl) %>% 
                                   unlist()),
                  tau = 20,
                  tau2 = 0
)






mod <- casc_model$new(user = casc_pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
casc_data <- as.data.frame(mod$run(t))



mod_states <- casc_data %>%
  select(c(starts_with("IC"), starts_with("EC"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boys", "Girls")) %>% 
  mutate(care = ifelse(grepl("C1", state), "Never", NA),
         care = ifelse(grepl("C2", state), "Not residential", care),
         care = ifelse(grepl("C3", state), "Residential", care),
         care = ifelse(grepl("C4", state), "Prior", care)) %>% 
  mutate(state = ifelse(grepl("IC", state), "Included", "Excluded")) 


population %>%
  filter(end_period_year >= 2010) %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, age, gender, count) %>%
  mutate(compare = "Data") %>%
  bind_rows(mod_states %>%
              group_by(t, age, gender) %>% 
              summarise(count = sum(count)) %>% 
              mutate(compare = "Model output")) %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = interaction(gender, compare), color = interaction(gender, compare))) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020")) +
  scale_color_manual(values=c("skyblue","pink","navy", "red"))


pop_estimate_01to20_age_gender %>% 
  filter(level == "Birmingham",
         age %in% c(9:10)) %>% 
  group_by(end_period_year, gender, age) %>% 
  summarise(pop = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = end_period_year, y = pop, group = interaction(age, gender), colour = interaction(age, gender))) +
  scale_color_manual(values=c("skyblue","pink","navy", "red"))



