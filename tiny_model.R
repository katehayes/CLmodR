tiny_model = odin::odin({
  
  ##############################################################################################################################
  ##PARAMETERS########################################################################################################################################
  ##############################################################################################################################
  
  # tau <- user(0)
  
  ageup <- user(1/52)
  # turn10 <- user(0)
  
  # destination on ageing in
  # pc_p1 <- user(1)
  # pc_p2 <- user(1)
  
# t10_p1c1 <- user(0)
# t10_p1c2 <- user(0)
# t10_p1c3 <- user(0)
# t10_p1c4 <- user(0)
# 
# t10_p2c1 <- user(0)
# t10_p2c2 <- user(0)
# t10_p2c3 <- user(0)
# t10_p2c4 <- user(0)
  
  # c1c10 <- user(0.005)
  # c1c11 <- user(0.004)
  # c1c12 <- user(0.003)
  # c1c13 <- user(0.003)
  # c1c14 <- user(0.002)
  # c1c15 <- user(0.002)
  # c1c16 <- user(0.001)
  # c1c17 <- user(0.001)
  
  c4c <- user(0.001)
  
  a_int <- user(-0.08212)
  a_beta <- user(0.65232)
    
  c4c10 <- user(0.001)
  c4c11 <- user(0.001)
  c4c12 <- user(0.001)
  c4c13 <- user(0.001)
  c4c14 <- user(0.001)
  c4c15 <- user(0.001)
  c4c16 <- user(0.001)
  c4c17 <- user(0.001)
  
  r10 <- user(0.05)
  r11 <- user(0.05)
  r12 <- user(0.10)
  r13 <- user(0.15)
  r14 <- user(0.25)
  r15 <- user(0.30)
  r16 <- user(0.50)
  r17 <- user(0.60)
  
  stay10 <- user(0.66)
  stay11 <- user(0.66)
  stay12 <- user(0.66)
  stay13 <- user(0.66)
  stay14 <- user(0.66)
  stay15 <- user(0.66)
  stay16 <- user(0.66)
  stay17 <- user(0.66)
  
  phi_p <- user(3)
  
  
  ##############################################################################################################################
  ## INITIAL CONDITIONS ####################################################################
  ##############################################################################################################################
  
  P1C1_10_ini <- user(0)
  P1C2_10_ini <- user(0)
  P1C3_10_ini <- user(0)
  P1C4_10_ini <- user(0)
  P2C1_10_ini <- user(0)
  P2C2_10_ini <- user(0)
  P2C3_10_ini <- user(0)
  P2C4_10_ini <- user(0)
  P1C1_11_ini <- user(0)
  P1C2_11_ini <- user(0)
  P1C3_11_ini <- user(0)
  P1C4_11_ini <- user(0)
  P2C1_11_ini <- user(0)
  P2C2_11_ini <- user(0)
  P2C3_11_ini <- user(0)
  P2C4_11_ini <- user(0)
  P1C1_12_ini <- user(0)
  P1C2_12_ini <- user(0)
  P1C3_12_ini <- user(0)
  P1C4_12_ini <- user(0)
  P2C1_12_ini <- user(0)
  P2C2_12_ini <- user(0)
  P2C3_12_ini <- user(0)
  P2C4_12_ini <- user(0)
  P1C1_13_ini <- user(0)
  P1C2_13_ini <- user(0)
  P1C3_13_ini <- user(0)
  P1C4_13_ini <- user(0)
  P2C1_13_ini <- user(0)
  P2C2_13_ini <- user(0)
  P2C3_13_ini <- user(0)
  P2C4_13_ini <- user(0)
  P1C1_14_ini <- user(0)
  P1C2_14_ini <- user(0)
  P1C3_14_ini <- user(0)
  P1C4_14_ini <- user(0)
  P2C1_14_ini <- user(0)
  P2C2_14_ini <- user(0)
  P2C3_14_ini <- user(0)
  P2C4_14_ini <- user(0)
  P1C1_15_ini <- user(0)
  P1C2_15_ini <- user(0)
  P1C3_15_ini <- user(0)
  P1C4_15_ini <- user(0)
  P2C1_15_ini <- user(0)
  P2C2_15_ini <- user(0)
  P2C3_15_ini <- user(0)
  P2C4_15_ini <- user(0)
  P1C1_16_ini <- user(0)
  P1C2_16_ini <- user(0)
  P1C3_16_ini <- user(0)
  P1C4_16_ini <- user(0)
  P2C1_16_ini <- user(0)
  P2C2_16_ini <- user(0)
  P2C3_16_ini <- user(0)
  P2C4_16_ini <- user(0)
  P1C1_17_ini <- user(0)
  P1C2_17_ini <- user(0)
  P1C3_17_ini <- user(0)
  P1C4_17_ini <- user(0)
  P2C1_17_ini <- user(0)
  P2C2_17_ini <- user(0)
  P2C3_17_ini <- user(0)
  P2C4_17_ini <- user(0)
  
  
  initial(P1C1_10) <- P1C1_10_ini
  initial(P1C2_10) <- P1C2_10_ini
  initial(P1C3_10) <- P1C3_10_ini
  initial(P1C4_10) <- P1C4_10_ini
  initial(P2C1_10) <- P2C1_10_ini
  initial(P2C2_10) <- P2C2_10_ini
  initial(P2C3_10) <- P2C3_10_ini
  initial(P2C4_10) <- P2C4_10_ini
  initial(P1C1_11) <- P1C1_11_ini
  initial(P1C2_11) <- P1C2_11_ini
  initial(P1C3_11) <- P1C3_11_ini
  initial(P1C4_11) <- P1C4_11_ini
  initial(P2C1_11) <- P2C1_11_ini
  initial(P2C2_11) <- P2C2_11_ini
  initial(P2C3_11) <- P2C3_11_ini
  initial(P2C4_11) <- P2C4_11_ini
  initial(P1C1_12) <- P1C1_12_ini
  initial(P1C2_12) <- P1C2_12_ini
  initial(P1C3_12) <- P1C3_12_ini
  initial(P1C4_12) <- P1C4_12_ini
  initial(P2C1_12) <- P2C1_12_ini
  initial(P2C2_12) <- P2C2_12_ini
  initial(P2C3_12) <- P2C3_12_ini
  initial(P2C4_12) <- P2C4_12_ini
  initial(P1C1_13) <- P1C1_13_ini
  initial(P1C2_13) <- P1C2_13_ini
  initial(P1C3_13) <- P1C3_13_ini
  initial(P1C4_13) <- P1C4_13_ini
  initial(P2C1_13) <- P2C1_13_ini
  initial(P2C2_13) <- P2C2_13_ini
  initial(P2C3_13) <- P2C3_13_ini
  initial(P2C4_13) <- P2C4_13_ini
  initial(P1C1_14) <- P1C1_14_ini
  initial(P1C2_14) <- P1C2_14_ini
  initial(P1C3_14) <- P1C3_14_ini
  initial(P1C4_14) <- P1C4_14_ini
  initial(P2C1_14) <- P2C1_14_ini
  initial(P2C2_14) <- P2C2_14_ini
  initial(P2C3_14) <- P2C3_14_ini
  initial(P2C4_14) <- P2C4_14_ini
  initial(P1C1_15) <- P1C1_15_ini
  initial(P1C2_15) <- P1C2_15_ini
  initial(P1C3_15) <- P1C3_15_ini
  initial(P1C4_15) <- P1C4_15_ini
  initial(P2C1_15) <- P2C1_15_ini
  initial(P2C2_15) <- P2C2_15_ini
  initial(P2C3_15) <- P2C3_15_ini
  initial(P2C4_15) <- P2C4_15_ini
  initial(P1C1_16) <- P1C1_16_ini
  initial(P1C2_16) <- P1C2_16_ini
  initial(P1C3_16) <- P1C3_16_ini
  initial(P1C4_16) <- P1C4_16_ini
  initial(P2C1_16) <- P2C1_16_ini
  initial(P2C2_16) <- P2C2_16_ini
  initial(P2C3_16) <- P2C3_16_ini
  initial(P2C4_16) <- P2C4_16_ini
  initial(P1C1_17) <- P1C1_17_ini
  initial(P1C2_17) <- P1C2_17_ini
  initial(P1C3_17) <- P1C3_17_ini
  initial(P1C4_17) <- P1C4_17_ini
  initial(P2C1_17) <- P2C1_17_ini
  initial(P2C2_17) <- P2C2_17_ini
  initial(P2C3_17) <- P2C3_17_ini
  initial(P2C4_17) <- P2C4_17_ini
  
  
  ##############################################################################################################################
  #  # intermediate bits # # #  # # #
  ###############################################################################################################################
  
  # ce_p1_10 <- c1c10*P1C1_10
  # ce_p2_10 <- c1c10*phi_p*P2C1_10
  # ce_p1_10 <- c1c10*P1C1_10
  # ce_p2_10 <- c1c10*phi_p*P2C1_10
  # ce_p1_10 <- c1c10*P1C1_10
  # ce_p2_10 <- c1c10*phi_p*P2C1_10
  # ce_p1_10 <- c1c10*P1C1_10
  # ce_p2_10 <- c1c10*phi_p*P2C1_10
  
  c1c2_p1_10 <- c1c10*(1-r10)
  c1c2_p2_10 <- c1c10*(1-r10)*phi_p
  c1c2_p1_11 <- c1c11*(1-r11)
  c1c2_p2_11 <- c1c11*(1-r11)*phi_p
  c1c2_p1_12 <- c1c12*(1-r12)
  c1c2_p2_12 <- c1c12*(1-r12)*phi_p
  c1c2_p1_13 <- c1c13*(1-r13)
  c1c2_p2_13 <- c1c13*(1-r13)*phi_p
  c1c2_p1_14 <- c1c14*(1-r14)
  c1c2_p2_14 <- c1c14*(1-r14)*phi_p
  c1c2_p1_15 <- c1c15*(1-r15)
  c1c2_p2_15 <- c1c15*(1-r15)*phi_p
  c1c2_p1_16 <- c1c16*(1-r16)
  c1c2_p2_16 <- c1c16*(1-r16)*phi_p
  c1c2_p1_17 <- c1c17*(1-r17)
  c1c2_p2_17 <- c1c17*(1-r17)*phi_p
  
  c1c3_p1_10 <- c1c10*r10
  c1c3_p2_10 <- c1c10*r10*phi_p
  c1c3_p1_11 <- c1c11*r11
  c1c3_p2_11 <- c1c11*r11*phi_p
  c1c3_p1_12 <- c1c12*r12
  c1c3_p2_12 <- c1c12*r12*phi_p
  c1c3_p1_13 <- c1c13*r13
  c1c3_p2_13 <- c1c13*r13*phi_p
  c1c3_p1_14 <- c1c14*r14
  c1c3_p2_14 <- c1c14*r14*phi_p
  c1c3_p1_15 <- c1c15*r15
  c1c3_p2_15 <- c1c15*r15*phi_p
  c1c3_p1_16 <- c1c16*r16
  c1c3_p2_16 <- c1c16*r16*phi_p
  c1c3_p1_17 <- c1c17*r17
  c1c3_p2_17 <- c1c17*r17*phi_p
  
  
  c2c3_p1_10 <- stay10*r10*end_nr
  c2c3_p2_10 <- stay10*r10*end_nr
  c2c3_p1_11 <- stay11*r11*end_nr
  c2c3_p2_11 <- stay11*r11*end_nr
  c2c3_p1_12 <- stay12*r12*end_nr
  c2c3_p2_12 <- stay12*r12*end_nr
  c2c3_p1_13 <- stay13*r13*end_nr
  c2c3_p2_13 <- stay13*r13*end_nr
  c2c3_p1_14 <- stay14*r14*end_nr
  c2c3_p2_14 <- stay14*r14*end_nr
  c2c3_p1_15 <- stay15*r15*end_nr
  c2c3_p2_15 <- stay15*r15*end_nr
  c2c3_p1_16 <- stay16*r16*end_nr
  c2c3_p2_16 <- stay16*r16*end_nr
  c2c3_p1_17 <- stay17*r17*end_nr
  c2c3_p2_17 <- stay17*r17*end_nr
  
  c2c4_p1_10 <- (1-stay10)*end_nr
  c2c4_p2_10 <- (1-stay10)*end_nr
  c2c4_p1_11 <- (1-stay11)*end_nr
  c2c4_p2_11 <- (1-stay11)*end_nr
  c2c4_p1_12 <- (1-stay12)*end_nr
  c2c4_p2_12 <- (1-stay12)*end_nr
  c2c4_p1_13 <- (1-stay13)*end_nr
  c2c4_p2_13 <- (1-stay13)*end_nr
  c2c4_p1_14 <- (1-stay14)*end_nr
  c2c4_p2_14 <- (1-stay14)*end_nr
  c2c4_p1_15 <- (1-stay15)*end_nr
  c2c4_p2_15 <- (1-stay15)*end_nr
  c2c4_p1_16 <- (1-stay16)*end_nr
  c2c4_p2_16 <- (1-stay16)*end_nr
  c2c4_p1_17 <- (1-stay17)*end_nr
  c2c4_p2_17 <- (1-stay17)*end_nr
  
  c3c2_p1_10 <- stay10*(1-r10)*end_res
  c3c2_p2_10 <- stay10*(1-r10)*end_res
  c3c2_p1_11 <- stay11*(1-r11)*end_res
  c3c2_p2_11 <- stay11*(1-r11)*end_res
  c3c2_p1_12 <- stay12*(1-r12)*end_res
  c3c2_p2_12 <- stay12*(1-r12)*end_res
  c3c2_p1_13 <- stay13*(1-r13)*end_res
  c3c2_p2_13 <- stay13*(1-r13)*end_res
  c3c2_p1_14 <- stay14*(1-r14)*end_res
  c3c2_p2_14 <- stay14*(1-r14)*end_res
  c3c2_p1_15 <- stay15*(1-r15)*end_res
  c3c2_p2_15 <- stay15*(1-r15)*end_res
  c3c2_p1_16 <- stay16*(1-r16)*end_res
  c3c2_p2_16 <- stay16*(1-r16)*end_res
  c3c2_p1_17 <- stay17*(1-r17)*end_res
  c3c2_p2_17 <- stay17*(1-r17)*end_res
  
  c3c4_p1_10 <- (1-stay10)*end_res
  c3c4_p2_10 <- (1-stay10)*end_res
  c3c4_p1_11 <- (1-stay11)*end_res
  c3c4_p2_11 <- (1-stay11)*end_res
  c3c4_p1_12 <- (1-stay12)*end_res
  c3c4_p2_12 <- (1-stay12)*end_res
  c3c4_p1_13 <- (1-stay13)*end_res
  c3c4_p2_13 <- (1-stay13)*end_res
  c3c4_p1_14 <- (1-stay14)*end_res
  c3c4_p2_14 <- (1-stay14)*end_res
  c3c4_p1_15 <- (1-stay15)*end_res
  c3c4_p2_15 <- (1-stay15)*end_res
  c3c4_p1_16 <- (1-stay16)*end_res
  c3c4_p2_16 <- (1-stay16)*end_res
  c3c4_p1_17 <- (1-stay17)*end_res
  c3c4_p2_17 <- (1-stay17)*end_res
  
  c4c2_p1_10 <- c4c10*(1-r10)
  c4c2_p2_10 <- c4c10*(1-r10)
  c4c2_p1_11 <- c4c11*(1-r11)
  c4c2_p2_11 <- c4c11*(1-r11)
  c4c2_p1_12 <- c4c12*(1-r12)
  c4c2_p2_12 <- c4c12*(1-r12)
  c4c2_p1_13 <- c4c13*(1-r13)
  c4c2_p2_13 <- c4c13*(1-r13)
  c4c2_p1_14 <- c4c14*(1-r14)
  c4c2_p2_14 <- c4c14*(1-r14)
  c4c2_p1_15 <- c4c15*(1-r15)
  c4c2_p2_15 <- c4c15*(1-r15)
  c4c2_p1_16 <- c4c16*(1-r16)
  c4c2_p2_16 <- c4c16*(1-r16)
  c4c2_p1_17 <- c4c17*(1-r17)
  c4c2_p2_17 <- c4c17*(1-r17)

  c4c3_p1_10 <- c4c10*r10
  c4c3_p2_10 <- c4c10*r10
  c4c3_p1_11 <- c4c11*r11
  c4c3_p2_11 <- c4c11*r11
  c4c3_p1_12 <- c4c12*r12
  c4c3_p2_12 <- c4c12*r12
  c4c3_p1_13 <- c4c13*r13
  c4c3_p2_13 <- c4c13*r13
  c4c3_p1_14 <- c4c14*r14
  c4c3_p2_14 <- c4c14*r14
  c4c3_p1_15 <- c4c15*r15
  c4c3_p2_15 <- c4c15*r15
  c4c3_p1_16 <- c4c16*r16
  c4c3_p2_16 <- c4c16*r16
  c4c3_p1_17 <- c4c17*r17
  c4c3_p2_17 <- c4c17*r17
  # 
  # 
  # c4c2_p1_10 <- c4c*(1-r10)
  # c4c2_p2_10 <- c4c*(1-r10)*phi_p
  # c4c2_p1_11 <- c4c*(1-r11)
  # c4c2_p2_11 <- c4c*(1-r11)*phi_p
  # c4c2_p1_12 <- c4c*(1-r12)
  # c4c2_p2_12 <- c4c*(1-r12)*phi_p
  # c4c2_p1_13 <- c4c*(1-r13)
  # c4c2_p2_13 <- c4c*(1-r13)*phi_p
  # c4c2_p1_14 <- c4c*(1-r14)
  # c4c2_p2_14 <- c4c*(1-r14)*phi_p
  # c4c2_p1_15 <- c4c*(1-r15)
  # c4c2_p2_15 <- c4c*(1-r15)*phi_p
  # c4c2_p1_16 <- c4c*(1-r16)
  # c4c2_p2_16 <- c4c*(1-r16)*phi_p
  # c4c2_p1_17 <- c4c*(1-r17)
  # c4c2_p2_17 <- c4c*(1-r17)*phi_p
  # 
  # c4c3_p1_10 <- c4c*r10
  # c4c3_p2_10 <- c4c*r10*phi_p
  # c4c3_p1_11 <- c4c*r11
  # c4c3_p2_11 <- c4c*r11*phi_p
  # c4c3_p1_12 <- c4c*r12
  # c4c3_p2_12 <- c4c*r12*phi_p
  # c4c3_p1_13 <- c4c*r13
  # c4c3_p2_13 <- c4c*r13*phi_p
  # c4c3_p1_14 <- c4c*r14
  # c4c3_p2_14 <- c4c*r14*phi_p
  # c4c3_p1_15 <- c4c*r15
  # c4c3_p2_15 <- c4c*r15*phi_p
  # c4c3_p1_16 <- c4c*r16
  # c4c3_p2_16 <- c4c*r16*phi_p
  # c4c3_p1_17 <- c4c*r17
  # c4c3_p2_17 <- c4c*r17*phi_p
  # 
  
  # so we pass in a poverty rate
  # that translates to a care rate (or we just pass a care rate straight in...)
  # 
  # no more like... which translates to an an absolute number of care cases
  # and as the older years are rising it forces the rest down the list. 
  # 
  # so we divide out a percentage for each age. 
  # we have a set pc of res vs nonres for each
  # 
  # Then, we look at the percentage for poverty vs not
  # there is a set multiplier -- always goign to be x times higher. so non-impoverised cases get crowded out
  # 

  
  a1617 <- a_int + a_beta*pc_pov
  a1015 <- 1 - a1617
  age10 <- a1015*0.1
  age11 <- a1015*0.1
  age12 <- a1015*0.1
  age13 <- a1015*0.2
  age14 <- a1015*0.35
  age15 <- a1015*0.2
  age16 <- a1617*0.6
  age17 <- a1617*0.4
  
  # it would reduce the rate diff if we included high pc coming back from prior and presumably more prior older groups
  
  
  N_care10 <- N_care*age10
  N_care11 <- N_care*age11
  N_care12 <- N_care*age12
  N_care13 <- N_care*age13
  N_care14 <- N_care*age14
  N_care15 <- N_care*age15
  N_care16 <- N_care*age16
  N_care17 <- N_care*age17
  
  c_prev_10 <- N_care10
  c_prev_11 <- N_care11
  c_prev_12 <- N_care12
  c_prev_13 <- N_care13
  c_prev_14 <- N_care14
  c_prev_15 <- N_care15
  c_prev_16 <- N_care16
  c_prev_17 <- N_care17
  
  
  # c_prev_10 <- N_care10/N10
  # c_prev_11 <- N_care11/N11
  # c_prev_12 <- N_care12/N12
  # c_prev_13 <- N_care13/N13
  # c_prev_14 <- N_care14/N14
  # c_prev_15 <- N_care15/N15
  # c_prev_16 <- N_care16/N16
  # c_prev_17 <- N_care17/N17
  # 
  
  c_idur_10 <- end_res*r10 + end_nr*(1-r10) 
  c_idur_11 <- end_res*r11 + end_nr*(1-r11) 
  c_idur_12 <- end_res*r12 + end_nr*(1-r12) 
  c_idur_13 <- end_res*r13 + end_nr*(1-r13) 
  c_idur_14 <- end_res*r14 + end_nr*(1-r14) 
  c_idur_15 <- end_res*r15 + end_nr*(1-r15) 
  c_idur_16 <- end_res*r16 + end_nr*(1-r16) 
  c_idur_17 <- end_res*r17 + end_nr*(1-r17) 
  
  
  
  c_inc_10 <- c_prev_10*c_idur_10
  c_inc_11 <- c_prev_11*c_idur_11
  c_inc_12 <- c_prev_12*c_idur_12
  c_inc_13 <- c_prev_13*c_idur_13
  c_inc_14 <- c_prev_14*c_idur_14
  c_inc_15 <- c_prev_15*c_idur_15
  c_inc_16 <- c_prev_16*c_idur_16
  c_inc_17 <- c_prev_17*c_idur_17
  
  # 0.3*4r + 0.7*r = 3
  # 1.2r + 0.7r = 3
 # r=3/(0.3*4+0.7)
  
  # 
  # c_new_10 <- c_inc_10
  # c_new_11 <- c_inc_11
  # c_new_12 <- c_inc_12
  # c_new_13 <- c_inc_13
  # c_new_14 <- c_inc_14
  # c_new_15 <- c_inc_15
  # c_new_16 <- c_inc_16
  # c_new_17 <- c_inc_17

  
  # c_new_10 <- c_inc_10 - c4c*(P1C4_10 + 4*P2C4_10)
  # c_new_11 <- c_inc_11 - c4c*(P1C4_11 + 4*P2C4_11)
  # c_new_12 <- c_inc_12 - c4c*(P1C4_12 + 4*P2C4_12)
  # c_new_13 <- c_inc_13 - c4c*(P1C4_13 + 4*P2C4_13)
  # c_new_14 <- c_inc_14 - c4c*(P1C4_14 + 4*P2C4_14)
  # c_new_15 <- c_inc_15 - c4c*(P1C4_15 + 4*P2C4_15)
  # c_new_16 <- c_inc_16 - c4c*(P1C4_16 + 4*P2C4_16)
  # c_new_17 <- c_inc_17 - c4c*(P1C4_17 + 4*P2C4_17)
  # 

  c_new_10 <- max(c_inc_10 - c4c10*(P1C4_10 + P2C4_10) - stay10*(end_nr*(P1C2_10+P2C2_10) + end_res*(P1C3_10+P2C3_10)), 0)
  c_new_11 <- max(c_inc_11 - c4c11*(P1C4_11 + P2C4_11) - stay11*(end_nr*(P1C2_11+P2C2_11) + end_res*(P1C3_11+P2C3_11)), 0)
  c_new_12 <- max(c_inc_12 - c4c12*(P1C4_12 + P2C4_12) - stay12*(end_nr*(P1C2_12+P2C2_12) + end_res*(P1C3_12+P2C3_12)), 0)
  c_new_13 <- max(c_inc_13 - c4c13*(P1C4_13 + P2C4_13) - stay13*(end_nr*(P1C2_13+P2C2_13) + end_res*(P1C3_13+P2C3_13)), 0)
  c_new_14 <- max(c_inc_14 - c4c14*(P1C4_14 + P2C4_14) - stay14*(end_nr*(P1C2_14+P2C2_14) + end_res*(P1C3_14+P2C3_14)), 0)
  c_new_15 <- max(c_inc_15 - c4c15*(P1C4_15 + P2C4_15) - stay15*(end_nr*(P1C2_15+P2C2_15) + end_res*(P1C3_15+P2C3_15)), 0)
  c_new_16 <- max(c_inc_16 - c4c16*(P1C4_16 + P2C4_16) - stay16*(end_nr*(P1C2_16+P2C2_16) + end_res*(P1C3_16+P2C3_16)), 0)
  c_new_17 <- max(c_inc_17 - c4c17*(P1C4_17 + P2C4_17) - stay17*(end_nr*(P1C2_17+P2C2_17) + end_res*(P1C3_17+P2C3_17)), 0)

  # dividing by all ten here - number should be too small - since not all in never 
  # c_rate_10 <- c_new_10/(P1C1_10+P2C1_10)
  # c_rate_11 <- c_new_11/(P1C1_11+P2C1_11)
  # c_rate_12 <- c_new_12/(P1C1_12+P2C1_12)
  # c_rate_13 <- c_new_13/(P1C1_13+P2C1_13)
  # c_rate_14 <- c_new_14/(P1C1_14+P2C1_14)
  # c_rate_15 <- c_new_15/(P1C1_15+P2C1_15)
  # c_rate_16 <- c_new_16/(P1C1_16+P2C1_16)
  # c_rate_17 <- c_new_17/(P1C1_17+P2C1_17)
    
  
  c1c10 <- c_new_10/(P1C1_10+P2C1_10*4)
  c1c11 <- c_new_11/(P1C1_11+P2C1_11*4)
  c1c12 <- c_new_12/(P1C1_12+P2C1_12*4)
  c1c13 <- c_new_13/(P1C1_13+P2C1_13*4)
  c1c14 <- c_new_14/(P1C1_14+P2C1_14*4)
  c1c15 <- c_new_15/(P1C1_15+P2C1_15*4)
  c1c16 <- c_new_16/(P1C1_16+P2C1_16*4)
  c1c17 <- c_new_17/(P1C1_17+P2C1_17*4)
  
  
    
  # CONVERT INCIDENCE TO RATE PER person in group??
  
 # c1c10 <- c_rate_10/(pc_pov_10*4+(1-pc_pov_10))
 # c1c11 <- c_rate_11/(pc_pov_11*4+(1-pc_pov_11))
 # c1c12 <- c_rate_12/(pc_pov_12*4+(1-pc_pov_12))
 # c1c13 <- c_rate_13/(pc_pov_13*4+(1-pc_pov_13))
 # c1c14 <- c_rate_14/(pc_pov_14*4+(1-pc_pov_14))
 # c1c15 <- c_rate_15/(pc_pov_15*4+(1-pc_pov_15))
 # c1c16 <- c_rate_16/(pc_pov_16*4+(1-pc_pov_16))
 # c1c17 <- c_rate_17/(pc_pov_17*4+(1-pc_pov_17))
 
 
  # prevalence 0.009837865
  # duration 43
  # p=id
  # i = p/d or equiv p*r because d is d = 1/r
  # incidence = 0.0002295502
  # 
  # 

  
  ##############################################################################################################################
  #  # diff eq # # #  # # #
  ###############################################################################################################################
  
  deriv(P1C1_10) <- t10_p1c1*turn10-ageup*P1C1_10+r*P2C1_10-f*P1C1_10-(c1c2_p1_10+c1c3_p1_10)*P1C1_10
  deriv(P1C2_10) <- t10_p1c2*turn10-ageup*P1C2_10+r*P2C2_10-f*P1C2_10+c1c2_p1_10*P1C1_10-(c2c3_p1_10+c2c4_p1_10)*P1C2_10+c4c2_p1_10*P1C4_10+c3c2_p1_10*P1C3_10
  deriv(P1C3_10) <- t10_p1c3*turn10-ageup*P1C3_10+r*P2C3_10-f*P1C3_10+c1c3_p1_10*P1C1_10-(c3c2_p1_10+c3c4_p1_10)*P1C3_10+c4c3_p1_10*P1C4_10+c2c3_p1_10*P1C2_10
  deriv(P1C4_10) <- t10_p1c4*turn10-ageup*P1C4_10+r*P2C4_10-f*P1C4_10-(c4c2_p1_10+c4c3_p1_10)*P1C4_10+c2c4_p1_10*P1C2_10+c3c4_p1_10*P1C3_10
  deriv(P2C1_10) <- t10_p2c1*turn10-ageup*P2C1_10+f*P1C1_10-r*P2C1_10-(c1c2_p2_10+c1c3_p2_10)*P2C1_10
  deriv(P2C2_10) <- t10_p2c2*turn10-ageup*P2C2_10+f*P1C2_10-r*P2C2_10+c1c2_p2_10*P2C1_10-(c2c3_p2_10+c2c4_p2_10)*P2C2_10+c4c2_p2_10*P2C4_10+c3c2_p2_10*P2C3_10
  deriv(P2C3_10) <- t10_p2c3*turn10-ageup*P2C3_10+f*P1C3_10-r*P2C3_10+c1c3_p2_10*P2C1_10-(c3c2_p2_10+c3c4_p2_10)*P2C3_10+c4c3_p2_10*P2C4_10+c2c3_p2_10*P2C2_10
  deriv(P2C4_10) <- t10_p2c4*turn10-ageup*P2C4_10+f*P1C4_10-r*P2C4_10-(c4c2_p2_10+c4c3_p2_10)*P2C4_10+c2c4_p2_10*P2C2_10+c3c4_p2_10*P2C3_10
  deriv(P1C1_11) <- ageup*P1C1_10-ageup*P1C1_11+r*P2C1_11-f*P1C1_11-(c1c2_p1_11+c1c3_p1_11)*P1C1_11
  deriv(P1C2_11) <- ageup*P1C2_10-ageup*P1C2_11+r*P2C2_11-f*P1C2_11+c1c2_p1_11*P1C1_11-(c2c3_p1_11+c2c4_p1_11)*P1C2_11+c4c2_p1_11*P1C4_11+c3c2_p1_11*P1C3_11
  deriv(P1C3_11) <- ageup*P1C3_10-ageup*P1C3_11+r*P2C3_11-f*P1C3_11+c1c3_p1_11*P1C1_11-(c3c2_p1_11+c3c4_p1_11)*P1C3_11+c4c3_p1_11*P1C4_11+c2c3_p1_11*P1C2_11
  deriv(P1C4_11) <- ageup*P1C4_10-ageup*P1C4_11+r*P2C4_11-f*P1C4_11-(c4c2_p1_11+c4c3_p1_11)*P1C4_11+c2c4_p1_11*P1C2_11+c3c4_p1_11*P1C3_11
  deriv(P2C1_11) <- ageup*P2C1_10-ageup*P2C1_11+f*P1C1_11-r*P2C1_11-(c1c2_p2_11+c1c3_p2_11)*P2C1_11
  deriv(P2C2_11) <- ageup*P2C2_10-ageup*P2C2_11+f*P1C2_11-r*P2C2_11+c1c2_p2_11*P2C1_11-(c2c3_p2_11+c2c4_p2_11)*P2C2_11+c4c2_p2_11*P2C4_11+c3c2_p2_11*P2C3_11
  deriv(P2C3_11) <- ageup*P2C3_10-ageup*P2C3_11+f*P1C3_11-r*P2C3_11+c1c3_p2_11*P2C1_11-(c3c2_p2_11+c3c4_p2_11)*P2C3_11+c4c3_p2_11*P2C4_11+c2c3_p2_11*P2C2_11
  deriv(P2C4_11) <- ageup*P2C4_10-ageup*P2C4_11+f*P1C4_11-r*P2C4_11-(c4c2_p2_11+c4c3_p2_11)*P2C4_11+c2c4_p2_11*P2C2_11+c3c4_p2_11*P2C3_11
  deriv(P1C1_12) <- ageup*P1C1_11-ageup*P1C1_12+r*P2C1_12-f*P1C1_12-(c1c2_p1_12+c1c3_p1_12)*P1C1_12
  deriv(P1C2_12) <- ageup*P1C2_11-ageup*P1C2_12+r*P2C2_12-f*P1C2_12+c1c2_p1_12*P1C1_12-(c2c3_p1_12+c2c4_p1_12)*P1C2_12+c4c2_p1_12*P1C4_12+c3c2_p1_12*P1C3_12
  deriv(P1C3_12) <- ageup*P1C3_11-ageup*P1C3_12+r*P2C3_12-f*P1C3_12+c1c3_p1_12*P1C1_12-(c3c2_p1_12+c3c4_p1_12)*P1C3_12+c4c3_p1_12*P1C4_12+c2c3_p1_12*P1C2_12
  deriv(P1C4_12) <- ageup*P1C4_11-ageup*P1C4_12+r*P2C4_12-f*P1C4_12-(c4c2_p1_12+c4c3_p1_12)*P1C4_12+c2c4_p1_12*P1C2_12+c3c4_p1_12*P1C3_12
  deriv(P2C1_12) <- ageup*P2C1_11-ageup*P2C1_12+f*P1C1_12-r*P2C1_12-(c1c2_p2_12+c1c3_p2_12)*P2C1_12
  deriv(P2C2_12) <- ageup*P2C2_11-ageup*P2C2_12+f*P1C2_12-r*P2C2_12+c1c2_p2_12*P2C1_12-(c2c3_p2_12+c2c4_p2_12)*P2C2_12+c4c2_p2_12*P2C4_12+c3c2_p2_12*P2C3_12
  deriv(P2C3_12) <- ageup*P2C3_11-ageup*P2C3_12+f*P1C3_12-r*P2C3_12+c1c3_p2_12*P2C1_12-(c3c2_p2_12+c3c4_p2_12)*P2C3_12+c4c3_p2_12*P2C4_12+c2c3_p2_12*P2C2_12
  deriv(P2C4_12) <- ageup*P2C4_11-ageup*P2C4_12+f*P1C4_12-r*P2C4_12-(c4c2_p2_12+c4c3_p2_12)*P2C4_12+c2c4_p2_12*P2C2_12+c3c4_p2_12*P2C3_12
  deriv(P1C1_13) <- ageup*P1C1_12-ageup*P1C1_13+r*P2C1_13-f*P1C1_13-(c1c2_p1_13+c1c3_p1_13)*P1C1_13
  deriv(P1C2_13) <- ageup*P1C2_12-ageup*P1C2_13+r*P2C2_13-f*P1C2_13+c1c2_p1_13*P1C1_13-(c2c3_p1_13+c2c4_p1_13)*P1C2_13+c4c2_p1_13*P1C4_13+c3c2_p1_13*P1C3_13
  deriv(P1C3_13) <- ageup*P1C3_12-ageup*P1C3_13+r*P2C3_13-f*P1C3_13+c1c3_p1_13*P1C1_13-(c3c2_p1_13+c3c4_p1_13)*P1C3_13+c4c3_p1_13*P1C4_13+c2c3_p1_13*P1C2_13
  deriv(P1C4_13) <- ageup*P1C4_12-ageup*P1C4_13+r*P2C4_13-f*P1C4_13-(c4c2_p1_13+c4c3_p1_13)*P1C4_13+c2c4_p1_13*P1C2_13+c3c4_p1_13*P1C3_13
  deriv(P2C1_13) <- ageup*P2C1_12-ageup*P2C1_13+f*P1C1_13-r*P2C1_13-(c1c2_p2_13+c1c3_p2_13)*P2C1_13
  deriv(P2C2_13) <- ageup*P2C2_12-ageup*P2C2_13+f*P1C2_13-r*P2C2_13+c1c2_p2_13*P2C1_13-(c2c3_p2_13+c2c4_p2_13)*P2C2_13+c4c2_p2_13*P2C4_13+c3c2_p2_13*P2C3_13
  deriv(P2C3_13) <- ageup*P2C3_12-ageup*P2C3_13+f*P1C3_13-r*P2C3_13+c1c3_p2_13*P2C1_13-(c3c2_p2_13+c3c4_p2_13)*P2C3_13+c4c3_p2_13*P2C4_13+c2c3_p2_13*P2C2_13
  deriv(P2C4_13) <- ageup*P2C4_12-ageup*P2C4_13+f*P1C4_13-r*P2C4_13-(c4c2_p2_13+c4c3_p2_13)*P2C4_13+c2c4_p2_13*P2C2_13+c3c4_p2_13*P2C3_13
  deriv(P1C1_14) <- ageup*P1C1_13-ageup*P1C1_14+r*P2C1_14-f*P1C1_14-(c1c2_p1_14+c1c3_p1_14)*P1C1_14
  deriv(P1C2_14) <- ageup*P1C2_13-ageup*P1C2_14+r*P2C2_14-f*P1C2_14+c1c2_p1_14*P1C1_14-(c2c3_p1_14+c2c4_p1_14)*P1C2_14+c4c2_p1_14*P1C4_14+c3c2_p1_14*P1C3_14
  deriv(P1C3_14) <- ageup*P1C3_13-ageup*P1C3_14+r*P2C3_14-f*P1C3_14+c1c3_p1_14*P1C1_14-(c3c2_p1_14+c3c4_p1_14)*P1C3_14+c4c3_p1_14*P1C4_14+c2c3_p1_14*P1C2_14
  deriv(P1C4_14) <- ageup*P1C4_13-ageup*P1C4_14+r*P2C4_14-f*P1C4_14-(c4c2_p1_14+c4c3_p1_14)*P1C4_14+c2c4_p1_14*P1C2_14+c3c4_p1_14*P1C3_14
  deriv(P2C1_14) <- ageup*P2C1_13-ageup*P2C1_14+f*P1C1_14-r*P2C1_14-(c1c2_p2_14+c1c3_p2_14)*P2C1_14
  deriv(P2C2_14) <- ageup*P2C2_13-ageup*P2C2_14+f*P1C2_14-r*P2C2_14+c1c2_p2_14*P2C1_14-(c2c3_p2_14+c2c4_p2_14)*P2C2_14+c4c2_p2_14*P2C4_14+c3c2_p2_14*P2C3_14
  deriv(P2C3_14) <- ageup*P2C3_13-ageup*P2C3_14+f*P1C3_14-r*P2C3_14+c1c3_p2_14*P2C1_14-(c3c2_p2_14+c3c4_p2_14)*P2C3_14+c4c3_p2_14*P2C4_14+c2c3_p2_14*P2C2_14
  deriv(P2C4_14) <- ageup*P2C4_13-ageup*P2C4_14+f*P1C4_14-r*P2C4_14-(c4c2_p2_14+c4c3_p2_14)*P2C4_14+c2c4_p2_14*P2C2_14+c3c4_p2_14*P2C3_14
  deriv(P1C1_15) <- ageup*P1C1_14-ageup*P1C1_15+r*P2C1_15-f*P1C1_15-(c1c2_p1_15+c1c3_p1_15)*P1C1_15
  deriv(P1C2_15) <- ageup*P1C2_14-ageup*P1C2_15+r*P2C2_15-f*P1C2_15+c1c2_p1_15*P1C1_15-(c2c3_p1_15+c2c4_p1_15)*P1C2_15+c4c2_p1_15*P1C4_15+c3c2_p1_15*P1C3_15
  deriv(P1C3_15) <- ageup*P1C3_14-ageup*P1C3_15+r*P2C3_15-f*P1C3_15+c1c3_p1_15*P1C1_15-(c3c2_p1_15+c3c4_p1_15)*P1C3_15+c4c3_p1_15*P1C4_15+c2c3_p1_15*P1C2_15
  deriv(P1C4_15) <- ageup*P1C4_14-ageup*P1C4_15+r*P2C4_15-f*P1C4_15-(c4c2_p1_15+c4c3_p1_15)*P1C4_15+c2c4_p1_15*P1C2_15+c3c4_p1_15*P1C3_15
  deriv(P2C1_15) <- ageup*P2C1_14-ageup*P2C1_15+f*P1C1_15-r*P2C1_15-(c1c2_p2_15+c1c3_p2_15)*P2C1_15
  deriv(P2C2_15) <- ageup*P2C2_14-ageup*P2C2_15+f*P1C2_15-r*P2C2_15+c1c2_p2_15*P2C1_15-(c2c3_p2_15+c2c4_p2_15)*P2C2_15+c4c2_p2_15*P2C4_15+c3c2_p2_15*P2C3_15
  deriv(P2C3_15) <- ageup*P2C3_14-ageup*P2C3_15+f*P1C3_15-r*P2C3_15+c1c3_p2_15*P2C1_15-(c3c2_p2_15+c3c4_p2_15)*P2C3_15+c4c3_p2_15*P2C4_15+c2c3_p2_15*P2C2_15
  deriv(P2C4_15) <- ageup*P2C4_14-ageup*P2C4_15+f*P1C4_15-r*P2C4_15-(c4c2_p2_15+c4c3_p2_15)*P2C4_15+c2c4_p2_15*P2C2_15+c3c4_p2_15*P2C3_15
  deriv(P1C1_16) <- ageup*P1C1_15-ageup*P1C1_16+r*P2C1_16-f*P1C1_16-(c1c2_p1_16+c1c3_p1_16)*P1C1_16
  deriv(P1C2_16) <- ageup*P1C2_15-ageup*P1C2_16+r*P2C2_16-f*P1C2_16+c1c2_p1_16*P1C1_16-(c2c3_p1_16+c2c4_p1_16)*P1C2_16+c4c2_p1_16*P1C4_16+c3c2_p1_16*P1C3_16
  deriv(P1C3_16) <- ageup*P1C3_15-ageup*P1C3_16+r*P2C3_16-f*P1C3_16+c1c3_p1_16*P1C1_16-(c3c2_p1_16+c3c4_p1_16)*P1C3_16+c4c3_p1_16*P1C4_16+c2c3_p1_16*P1C2_16
  deriv(P1C4_16) <- ageup*P1C4_15-ageup*P1C4_16+r*P2C4_16-f*P1C4_16-(c4c2_p1_16+c4c3_p1_16)*P1C4_16+c2c4_p1_16*P1C2_16+c3c4_p1_16*P1C3_16
  deriv(P2C1_16) <- ageup*P2C1_15-ageup*P2C1_16+f*P1C1_16-r*P2C1_16-(c1c2_p2_16+c1c3_p2_16)*P2C1_16
  deriv(P2C2_16) <- ageup*P2C2_15-ageup*P2C2_16+f*P1C2_16-r*P2C2_16+c1c2_p2_16*P2C1_16-(c2c3_p2_16+c2c4_p2_16)*P2C2_16+c4c2_p2_16*P2C4_16+c3c2_p2_16*P2C3_16
  deriv(P2C3_16) <- ageup*P2C3_15-ageup*P2C3_16+f*P1C3_16-r*P2C3_16+c1c3_p2_16*P2C1_16-(c3c2_p2_16+c3c4_p2_16)*P2C3_16+c4c3_p2_16*P2C4_16+c2c3_p2_16*P2C2_16
  deriv(P2C4_16) <- ageup*P2C4_15-ageup*P2C4_16+f*P1C4_16-r*P2C4_16-(c4c2_p2_16+c4c3_p2_16)*P2C4_16+c2c4_p2_16*P2C2_16+c3c4_p2_16*P2C3_16
  deriv(P1C1_17) <- ageup*P1C1_16-ageup*P1C1_17+r*P2C1_17-f*P1C1_17-(c1c2_p1_17+c1c3_p1_17)*P1C1_17
  deriv(P1C2_17) <- ageup*P1C2_16-ageup*P1C2_17+r*P2C2_17-f*P1C2_17+c1c2_p1_17*P1C1_17-(c2c3_p1_17+c2c4_p1_17)*P1C2_17+c4c2_p1_17*P1C4_17+c3c2_p1_17*P1C3_17
  deriv(P1C3_17) <- ageup*P1C3_16-ageup*P1C3_17+r*P2C3_17-f*P1C3_17+c1c3_p1_17*P1C1_17-(c3c2_p1_17+c3c4_p1_17)*P1C3_17+c4c3_p1_17*P1C4_17+c2c3_p1_17*P1C2_17
  deriv(P1C4_17) <- ageup*P1C4_16-ageup*P1C4_17+r*P2C4_17-f*P1C4_17-(c4c2_p1_17+c4c3_p1_17)*P1C4_17+c2c4_p1_17*P1C2_17+c3c4_p1_17*P1C3_17
  deriv(P2C1_17) <- ageup*P2C1_16-ageup*P2C1_17+f*P1C1_17-r*P2C1_17-(c1c2_p2_17+c1c3_p2_17)*P2C1_17
  deriv(P2C2_17) <- ageup*P2C2_16-ageup*P2C2_17+f*P1C2_17-r*P2C2_17+c1c2_p2_17*P2C1_17-(c2c3_p2_17+c2c4_p2_17)*P2C2_17+c4c2_p2_17*P2C4_17+c3c2_p2_17*P2C3_17
  deriv(P2C3_17) <- ageup*P2C3_16-ageup*P2C3_17+f*P1C3_17-r*P2C3_17+c1c3_p2_17*P2C1_17-(c3c2_p2_17+c3c4_p2_17)*P2C3_17+c4c3_p2_17*P2C4_17+c2c3_p2_17*P2C2_17
  deriv(P2C4_17) <- ageup*P2C4_16-ageup*P2C4_17+f*P1C4_17-r*P2C4_17-(c4c2_p2_17+c4c3_p2_17)*P2C4_17+c2c4_p2_17*P2C2_17+c3c4_p2_17*P2C3_17
  ##############################################################################################################################
  #  # interpolation section # # #  # # #
  ###############################################################################################################################
  
 
  
  
  turn10 <- interpolate(tt, y, "spline")
  tt[] <- user()
  y[] <- user()
  dim(tt) <- user()
  dim(y) <- length(tt)
  
  r <- interpolate(rft, ri, "spline")
  f <- interpolate(rft, fa, "spline")
  rft[] <- user()
  ri[] <- user()
  fa[] <- user()
  dim(rft) <- user()
  dim(ri) <- length(rft)
  dim(fa) <- length(rft)
  
  
  end_nr <- interpolate(lact, enr, "spline")
  end_res <- interpolate(lact, eres, "spline")
  lact[] <- user()
  enr[] <- user()
  eres[] <- user()
  dim(lact) <- user()
  dim(enr) <- length(lact)
  dim(eres) <- length(lact)
  
  
  N_care <- interpolate(lact, c, "spline")
  c[] <- user()
  dim(c) <- length(lact)
  
  ##############################################################################################################################
  #  #calculating little things  # # #  # # #
  ###############################################################################################################################
  
  N_poverty <- P2C1_10+P2C2_10+P2C3_10+P2C4_10+P2C1_11+P2C2_11+P2C3_11+P2C4_11+P2C1_12+P2C2_12+P2C3_12+P2C4_12+P2C1_13+P2C2_13+P2C3_13+P2C4_13+P2C1_14+P2C2_14+P2C3_14+P2C4_14+P2C1_15+P2C2_15+P2C3_15+P2C4_15+P2C1_16+P2C2_16+P2C3_16+P2C4_16+P2C1_17+P2C2_17+P2C3_17+P2C4_17
  N_not_in_poverty <- P1C1_10+P1C2_10+P1C3_10+P1C4_10+P1C1_11+P1C2_11+P1C3_11+P1C4_11+P1C1_12+P1C2_12+P1C3_12+P1C4_12+P1C1_13+P1C2_13+P1C3_13+P1C4_13+P1C1_14+P1C2_14+P1C3_14+P1C4_14+P1C1_15+P1C2_15+P1C3_15+P1C4_15+P1C1_16+P1C2_16+P1C3_16+P1C4_16+P1C1_17+P1C2_17+P1C3_17+P1C4_17
  N <- N_poverty + N_not_in_poverty
  
  pc_pov <- N_poverty/N
  
  
  Npov10 <- P2C1_10+P2C2_10+P2C3_10+P2C4_10
  Npov11 <- P2C1_11+P2C2_11+P2C3_11+P2C4_11
  Npov12 <- P2C1_12+P2C2_12+P2C3_12+P2C4_12
  Npov13 <- P2C1_13+P2C2_13+P2C3_13+P2C4_13
  Npov14 <- P2C1_14+P2C2_14+P2C3_14+P2C4_14
  Npov15 <- P2C1_15+P2C2_15+P2C3_15+P2C4_15
  Npov16 <- P2C1_16+P2C2_16+P2C3_16+P2C4_16
  Npov17 <- P2C1_17+P2C2_17+P2C3_17+P2C4_17
  
  N10 <- P1C1_10+P1C2_10+P1C3_10+P1C4_10+P2C1_10+P2C2_10+P2C3_10+P2C4_10
  N11 <- P1C1_11+P1C2_11+P1C3_11+P1C4_11+P2C1_11+P2C2_11+P2C3_11+P2C4_11
  N12 <- P1C1_12+P1C2_12+P1C3_12+P1C4_12+P2C1_12+P2C2_12+P2C3_12+P2C4_12
  N13 <- P1C1_13+P1C2_13+P1C3_13+P1C4_13+P2C1_13+P2C2_13+P2C3_13+P2C4_13
  N14 <- P1C1_14+P1C2_14+P1C3_14+P1C4_14+P2C1_14+P2C2_14+P2C3_14+P2C4_14
  N15 <- P1C1_15+P1C2_15+P1C3_15+P1C4_15+P2C1_15+P2C2_15+P2C3_15+P2C4_15
  N16 <- P1C1_16+P1C2_16+P1C3_16+P1C4_16+P2C1_16+P2C2_16+P2C3_16+P2C4_16
  N17 <- P1C1_17+P1C2_17+P1C3_17+P1C4_17+P2C1_17+P2C2_17+P2C3_17+P2C4_17
  
  pc_pov_10 <-  Npov10/N10
  pc_pov_11 <-  Npov10/N11
  pc_pov_12 <-  Npov10/N12
  pc_pov_13 <-  Npov10/N13
  pc_pov_14 <-  Npov10/N14
  pc_pov_15 <-  Npov10/N15
  pc_pov_16 <-  Npov10/N16
  pc_pov_17 <-  Npov10/N17
  
  t10_p1c1 <- P1C1_10/N10
  t10_p1c2 <- P1C2_10/N10
  t10_p1c3 <- P1C3_10/N10
  t10_p1c4 <- P1C4_10/N10
  t10_p2c1 <- P2C1_10/N10
  t10_p2c2 <- P2C2_10/N10
  t10_p2c3 <- P2C3_10/N10
  t10_p2c4 <- P2C4_10/N10
  
  ##############################################################################################################################
  #  #output  # # #  # # #
  ###############################################################################################################################
  
  
  
  output(t10_p1c1) <- t10_p1c1
  output(t10_p1c2) <- t10_p1c2
  output(t10_p1c3) <- t10_p1c3
  output(t10_p1c4) <- t10_p1c4
  output(t10_p2c1) <- t10_p2c1
  output(t10_p2c2) <- t10_p2c2
  output(t10_p2c3) <- t10_p2c3
  output(t10_p2c4) <- t10_p2c4
  
  
  output(c_idur_10) <- c_idur_10
  output(c_idur_11) <- c_idur_11
  output(c_idur_12) <- c_idur_12
  output(c_idur_13) <- c_idur_13  
  output(c_idur_14) <- c_idur_14
  output(c_idur_15) <- c_idur_15  
  output(c_idur_16) <- c_idur_16
  output(c_idur_17) <- c_idur_17

  output(end_nr) <- end_nr
  output(end_res) <- end_res
  
  
  output(c1c10) <- c1c10
  output(c1c11) <- c1c11
  output(c1c12) <- c1c12
  output(c1c13) <- c1c13
  output(c1c14) <- c1c14
  output(c1c15) <- c1c15
  output(c1c16) <- c1c16
  output(c1c17) <- c1c17
  
},
target = 'c')  

#from 0 to 10 years, two steps a week or something
t <- seq(0, 520, length.out = 1041) 

mod <- tiny_model$new(user = pars)
mod_data <- as.data.frame(mod$run(t))





pars <- list(tt = t_turn10,
             y = v_turn10[,1],
             rft = rf_t,
             ri = rise[,1],
             fa = fall[,1],
             lact = t_lac,
             enr = endnr[,1]*1.06,
             eres = endres[,1]*1.06,
             c = care_pars[,1],
             
             phi_p = 4,
             
             # c1c10 = 0.00016,
             # c1c11 = 0.00018,
             # c1c12 = 0.0002,
             # c1c13 = 0.00032,
             # c1c14 = 0.00055,
             # c1c15 = 0.0005,
             # c1c16 = 0.0004,
             # c1c17 = 0.0003,
             # 
             #              c4c10 = 0.0013,
             #              c4c11 = 0.0013,
             #              c4c12 = 0.0013,
             #              c4c13 = 0.0013,
             #              c4c14 = 0.0013,
             #              c4c15 = 0.0014,
             #              c4c16 = 0.0025,
             #              c4c17 = 0.0026,
             
             
             c4c10 = 0.0005,
             c4c11 = 0.001,
             c4c12 = 0.0015,
             c4c13 = 0.002,
             c4c14 = 0.0025,
             c4c15 = 0.0045,
             c4c16 = 0.0065,
             c4c17 = 0.009,
             
             # c4c = 0.003,
             
             stay10 = 0.5, 
             stay11 = 0.5, 
             stay12 = 0.5, 
             stay13 = 0.6, 
             stay14 = 0.7, 
             stay15 = 0.75, 
             stay16 = 0.85, 
             stay17 = 0.95, 
             
             r10 = 0.1, 
             r11 = 0.15, 
             r12 = 0.17, 
             r13 = 0.2, 
             r14 = 0.3, 
             r15 = 0.4, 
             r16 = 0.6, 
             r17 = 0.85, 
             
             # pc_p1 = 0.73,
             # pc_p2 = 0.27,
             
             # t10_p1c1 = t10(p=1,c=1),
             # t10_p1c2 = t10(p=1,c=2),
             # t10_p1c3 = t10(p=1,c=3),
             # t10_p1c4 = t10(p=1,c=4),
             # 
             # t10_p2c1 = t10(p=2,c=1),
             # t10_p2c2 = t10(p=2,c=2),
             # t10_p2c3 = t10(p=2,c=3),
             # t10_p2c4 = t10(p=2,c=4),
             
             P1C1_10_ini = ic_care(a=10, p=1, c=1),
             P1C2_10_ini = ic_care(a=10, p=1, c=2),
             P1C3_10_ini = ic_care(a=10, p=1, c=3),
             P1C4_10_ini = ic_care(a=10, p=1, c=4),
             P2C1_10_ini = ic_care(a=10, p=2, c=1),
             P2C2_10_ini = ic_care(a=10, p=2, c=2),
             P2C3_10_ini = ic_care(a=10, p=2, c=3),
             P2C4_10_ini = ic_care(a=10, p=2, c=4),
             P1C1_11_ini = ic_care(a=11, p=1, c=1),
             P1C2_11_ini = ic_care(a=11, p=1, c=2),
             P1C3_11_ini = ic_care(a=11, p=1, c=3),
             P1C4_11_ini = ic_care(a=11, p=1, c=4),
             P2C1_11_ini = ic_care(a=11, p=2, c=1),
             P2C2_11_ini = ic_care(a=11, p=2, c=2),
             P2C3_11_ini = ic_care(a=11, p=2, c=3),
             P2C4_11_ini = ic_care(a=11, p=2, c=4),
             P1C1_12_ini = ic_care(a=12, p=1, c=1),
             P1C2_12_ini = ic_care(a=12, p=1, c=2),
             P1C3_12_ini = ic_care(a=12, p=1, c=3),
             P1C4_12_ini = ic_care(a=12, p=1, c=4),
             P2C1_12_ini = ic_care(a=12, p=2, c=1),
             P2C2_12_ini = ic_care(a=12, p=2, c=2),
             P2C3_12_ini = ic_care(a=12, p=2, c=3),
             P2C4_12_ini = ic_care(a=12, p=2, c=4),
             P1C1_13_ini = ic_care(a=13, p=1, c=1),
             P1C2_13_ini = ic_care(a=13, p=1, c=2),
             P1C3_13_ini = ic_care(a=13, p=1, c=3),
             P1C4_13_ini = ic_care(a=13, p=1, c=4),
             P2C1_13_ini = ic_care(a=13, p=2, c=1),
             P2C2_13_ini = ic_care(a=13, p=2, c=2),
             P2C3_13_ini = ic_care(a=13, p=2, c=3),
             P2C4_13_ini = ic_care(a=13, p=2, c=4),
             P1C1_14_ini = ic_care(a=14, p=1, c=1),
             P1C2_14_ini = ic_care(a=14, p=1, c=2),
             P1C3_14_ini = ic_care(a=14, p=1, c=3),
             P1C4_14_ini = ic_care(a=14, p=1, c=4),
             P2C1_14_ini = ic_care(a=14, p=2, c=1),
             P2C2_14_ini = ic_care(a=14, p=2, c=2),
             P2C3_14_ini = ic_care(a=14, p=2, c=3),
             P2C4_14_ini = ic_care(a=14, p=2, c=4),
             P1C1_15_ini = ic_care(a=15, p=1, c=1),
             P1C2_15_ini = ic_care(a=15, p=1, c=2),
             P1C3_15_ini = ic_care(a=15, p=1, c=3),
             P1C4_15_ini = ic_care(a=15, p=1, c=4),
             P2C1_15_ini = ic_care(a=15, p=2, c=1),
             P2C2_15_ini = ic_care(a=15, p=2, c=2),
             P2C3_15_ini = ic_care(a=15, p=2, c=3),
             P2C4_15_ini = ic_care(a=15, p=2, c=4),
             P1C1_16_ini = ic_care(a=16, p=1, c=1),
             P1C2_16_ini = ic_care(a=16, p=1, c=2),
             P1C3_16_ini = ic_care(a=16, p=1, c=3),
             P1C4_16_ini = ic_care(a=16, p=1, c=4),
             P2C1_16_ini = ic_care(a=16, p=2, c=1),
             P2C2_16_ini = ic_care(a=16, p=2, c=2),
             P2C3_16_ini = ic_care(a=16, p=2, c=3),
             P2C4_16_ini = ic_care(a=16, p=2, c=4),
             P1C1_17_ini = ic_care(a=17, p=1, c=1),
             P1C2_17_ini = ic_care(a=17, p=1, c=2),
             P1C3_17_ini = ic_care(a=17, p=1, c=3),
             P1C4_17_ini = ic_care(a=17, p=1, c=4),
             P2C1_17_ini = ic_care(a=17, p=2, c=1),
             P2C2_17_ini = ic_care(a=17, p=2, c=2),
             P2C3_17_ini = ic_care(a=17, p=2, c=3),
             P2C4_17_ini = ic_care(a=17, p=2, c=4))




mod_states <- mod_data %>%
  select(c(starts_with("P1"), starts_with("P2"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         state = str_remove(state, "(\\d{2})"),
         poverty = ifelse(grepl("P1", state), "Not in poverty", "In poverty"),
         care = ifelse(grepl("C1", state), "Never", NA),
         care = ifelse(grepl("C2", state), "Not residential", care),
         care = ifelse(grepl("C3", state), "Residential", care),
         care = ifelse(grepl("C4", state), "Prior", care)) %>% 
  select(-state)


# CALCULATE CUMULATIVE ENTRY
# CALCULATE AGE AT FIRST ENTRY
# make tests!!



# mod_states %>% 
#   filter(age == 10) %>% 
#   ggplot() +
#   geom_line(aes(x = t, y = count, group = interaction(poverty, care), color = interaction(poverty, care))) +
#   scale_x_continuous(breaks = seq(0, 520, 52),
#                      labels = c("2010", "2011", "2012", "2013", "2014", "2015",
#                                 "2016", "2017", "2018", "2019", "2020")) 


params <- mod_data %>%
  select(c(starts_with("t10"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "value") %>% 
  ggplot() +
  geom_line(aes(x = t, y = value, group = param, color =param)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020")) 
params


params <- mod_data %>%
  select(c(starts_with("t10"), t)) %>% 
  pivot_longer(-t, names_to = "param", values_to = "value") %>% 
  group_by(t) %>% 
  summarise(check = sum(value)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = check)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020")) 

compare_pop <- population %>%
  filter(end_period_year >= 2010,
         gender == "Boys") %>%
  mutate(t = (as.numeric(end_period_year) - 2010)*52) %>%
  select(t, age, count) %>%
  mutate(compare = "Data") %>%
  bind_rows(mod_states %>%
              group_by(t, age) %>% 
              summarise(count = sum(count)) %>% 
              mutate(compare = "Model output"))

# population %>%
#   ggplot() +
#   geom_line(aes(x = end_period_year, y = count, group = gender, color =gender)) +
#   facet_wrap(~age) +
#   scale_x_continuous(breaks = seq(0, 520, 52),
#                      labels = c("2010", "2011", "2012", "2013", "2014", "2015",
#                                 "2016", "2017", "2018", "2019", "2020")) +
#   scale_color_manual(values=c("skyblue","navy"))
#   

compare_pop %>%
  ggplot() +
  geom_line(aes(x = t, y = count, group = compare, color =compare)) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020")) +
  scale_color_manual(values=c("skyblue","navy"))


mod_states %>%
  group_by(t, age, poverty) %>% 
  summarise(count = sum(count)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = poverty, color =poverty)) +
  facet_wrap(~age) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020")) +
  scale_color_manual(values=c("skyblue","navy"))



compare_care <- mod_states %>%
  group_by(t, poverty, age, care) %>% 
  summarise(count = sum(count)) %>% 
  mutate(compare = "Model") %>% 
  bind_rows(care_pov %>% 
              filter(gender == "Boys") %>% 
              mutate(t = (end_period_year - 2010)*52) %>% 
              select(t, age, count, state, care) %>% 
              rename(poverty = state) %>% 
              group_by(t, age, count, poverty, care) %>% 
              mutate(compare = "Est data")) %>% 
  filter(poverty == "In poverty") %>% 
  ggplot() +
  geom_line(aes(x = t, y = count, group = age, color = age)) +
  facet_wrap(~interaction(compare, care)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_care
# ~interaction(compare, poverty)



compare_care_age <- mod_states %>%
  rename(age2 = age,
         care2 = care) %>%
  mutate(age = ifelse(age2 %in% c(10:15), "10-15", "16+"),
         care = ifelse(care2 %in% c("Not residential", "Residential"), "in care", "not in care")) %>%
  group_by(t, care, age) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t, age) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care == "in care") %>%
  mutate(compare = "Model") %>%
  select(t, age, pc, compare)%>%
  bind_rows(care_11to22_age %>%
              ungroup() %>% 
              filter(age %in% c("10-15", "16+"),
                     level == "Birmingham",
                     end_period_year <= 2020) %>% 
              group_by(end_period_year, age) %>% 
              summarise(count = sum(count)) %>% 
              left_join(gen_pc) %>% 
              mutate(count = count*pc) %>% 
              select(-pc) %>% 
              left_join(population %>% 
                          filter(age %in% c(10:17),
                                 gender == "Boys") %>% 
                          mutate(age = ifelse(age %in% c(10:15), "10-15", "16+")) %>% 
                          group_by(end_period_year, age) %>% 
                          summarise(pop_count = sum(count))) %>% 
              mutate(pc = count/pop_count,
                     compare = "Data",
                     t = (end_period_year - 2010)*52) %>% 
              select(t, age, pc, compare)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = interaction(compare, age), color = interaction(compare, age))) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))

compare_care_age


check <- care_11to22_age %>% 
  filter(age %in% c("10-15", "16+"),
         level == "Birmingham",
         end_period_year <= 2020) %>% 
  group_by(end_period_year) %>% 
  summarise(count = sum(count)) %>% 
  left_join(gen_pc) %>% 
  mutate(count = count*pc) 






compare_care_res <- mod_states %>%
  group_by(t, care) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care %in% c("Not residential", "Residential")) %>%
  mutate(compare = "Model") %>%
  select(t, care, pc, compare) 

# %>% 
  # bind_rows(



compare_care_res <- mod_states %>%
  filter(care %in% c("Not residential", "Residential")) %>%
  group_by(t, care) %>%
  summarise(count = sum(count)) %>%
  ungroup() %>%
  group_by(t) %>%
  mutate(pc = count/sum(count)) %>%
  ungroup() %>%
  filter(care == "Residential") %>% 
  mutate(compare = "Model") %>%
  select(t, pc, compare) %>% 
  rbind(care_11to22_placement %>%
            ungroup() %>% 
              filter( level == "Birmingham",
                   end_period_year <= 2020) %>% 
              mutate(residential = ifelse(placement %in% c("Secure units, children's homes and semi-independent living accommodation",
                                                                "Residential schools",
                                                                "Other residential settings"),
                                          "Residential",
                                          "Not residential")) %>% 
            group_by(end_period_year, residential) %>% 
            summarise(count = sum(count)) %>% 
      ungroup() %>% 
      group_by(end_period_year) %>% 
      mutate(pc = count/sum(count)) %>%
      ungroup() %>%
      filter(residential == "Residential") %>% 
      mutate(compare = "Data",
             t = (end_period_year - 2010)*52) %>% 
      select(t, pc, compare)) %>% 
  ggplot() +
  geom_line(aes(x = t, y = pc, group = compare, color = compare)) +
  scale_x_continuous(breaks = seq(0, 520, 52),
                     labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                "2016", "2017", "2018", "2019", "2020"))


compare_care_res



gen_pc <- care_11to22_gender %>% 
  filter(level == "Birmingham") %>% 
  group_by(end_period_year) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(gender == "Boys") %>% 
  select(end_period_year, pc)

care_pars <- care_11to22_age %>% 
  filter(age %in% c("10-15", "16+"),
         level == "Birmingham") %>% 
  group_by(end_period_year) %>% 
  summarise(count = sum(count)) %>% 
  left_join(gen_pc) %>% 
  mutate(count = count*pc) %>% 
  mutate(t = (end_period_year - 2010)*52) %>% 
  select(-c(end_period_year, pc)) %>% 
  rbind(data.frame(t=0, count =539)) %>% 
  arrange(t) %>% 
  filter(t <= 520) %>% 
  select(count) %>% 
  as.matrix()


