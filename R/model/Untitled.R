new_model = odin::odin({
  
  ##############################################################################################################################
  ##PARAMETERS########################################################################################################################################
  ##############################################################################################################################
  
  tau <- user(52)
  
  age_up <- user(1/52)
  # turn10 <- user(0)
  
  # destination on ageing in
  pc_p1 <- user(0)
  pc_p2 <- user(0)
  
  t10_p1c1s1j1 <- user(0)
  t10_p1c1s1j2 <- user(0)
  t10_p1c1s2j1 <- user(0)
  t10_p1c1s2j2 <- user(0)
  t10_p1c1s3j1 <- user(0)
  t10_p1c1s3j2 <- user(0)
  t10_p1c2s1j1 <- user(0)
  t10_p1c2s1j2 <- user(0)
  t10_p1c2s2j1 <- user(0)
  t10_p1c2s2j2 <- user(0)
  t10_p1c2s3j1 <- user(0)
  t10_p1c2s3j2 <- user(0)
  t10_p1c3s1j1 <- user(0)
  t10_p1c3s1j2 <- user(0)
  t10_p1c3s2j1 <- user(0)
  t10_p1c3s2j2 <- user(0)
  t10_p1c3s3j1 <- user(0)
  t10_p1c3s3j2 <- user(0)
  t10_p1c4s1j1 <- user(0)
  t10_p1c4s1j2 <- user(0)
  t10_p1c4s2j1 <- user(0)
  t10_p1c4s2j2 <- user(0)
  t10_p1c4s3j1 <- user(0)
  t10_p1c4s3j2 <- user(0)
  t10_p2c1s1j1 <- user(0)
  t10_p2c1s1j2 <- user(0)
  t10_p2c1s2j1 <- user(0)
  t10_p2c1s2j2 <- user(0)
  t10_p2c1s3j1 <- user(0)
  t10_p2c1s3j2 <- user(0)
  t10_p2c2s1j1 <- user(0)
  t10_p2c2s1j2 <- user(0)
  t10_p2c2s2j1 <- user(0)
  t10_p2c2s2j2 <- user(0)
  t10_p2c2s3j1 <- user(0)
  t10_p2c2s3j2 <- user(0)
  t10_p2c3s1j1 <- user(0)
  t10_p2c3s1j2 <- user(0)
  t10_p2c3s2j1 <- user(0)
  t10_p2c3s2j2 <- user(0)
  t10_p2c3s3j1 <- user(0)
  t10_p2c3s3j2 <- user(0)
  t10_p2c4s1j1 <- user(0)
  t10_p2c4s1j2 <- user(0)
  t10_p2c4s2j1 <- user(0)
  t10_p2c4s2j2 <- user(0)
  t10_p2c4s3j1 <- user(0)
  t10_p2c4s3j2 <- user(0)
  
  neet16 <- user(0) 
  vsig_p <- user(1)
  vsig_c <- user(1) 
  vsig_s <- user(1) 
  vsig_j <- user(1)
  
  
  s1s2_10 <- user(0.0001)
  s2s3_10 <- user(0.00001)
  s3s2_10 <- user(0.00002)
  s1s2_11 <- user(0.0001)
  s2s3_11 <- user(0.00001)
  s3s2_11 <- user(0.0002)
  s1s2_12 <- user(0.0001)
  s2s3_12 <- user(0.00001)
  s3s2_12 <- user(0.0002)
  s1s2_13 <- user(0.0001)
  s2s3_13 <- user(0.00001)
  s3s2_13 <- user(0.0002)
  s1s2_14 <- user(0.0001)
  s2s3_14 <- user(0.00001)
  s3s2_14 <- user(0.0002)
  s1s2_15 <- user(0.0001)
  s2s3_15 <- user(0.00001)
  s3s2_15 <- user(0.0002)
  s1s2_16 <- user(0.0001)
  s2s3_16 <- user(0.00001)
  s3s2_16 <- user(0.0002)
  s1s2_17 <- user(0.0001)
  s2s3_17 <- user(0.00001)
  s3s2_17 <- user(0.0002)
  
  sig_p <- user(1)
  sig_c <- user(1) 
  sig_j <- user(1)
  
  

  c1c10 <- user(0.005)
  c1c11 <- user(0.004)
  c1c12 <- user(0.003)
  c1c13 <- user(0.003)
  c1c14 <- user(0.002)
  c1c15 <- user(0.002)
  c1c16 <- user(0.001)
  c1c17 <- user(0.001)
  
  c4c10 <- user(0.003)
  c4c11 <- user(0.003)
  c4c12 <- user(0.003)
  c4c13 <- user(0.003)
  c4c14 <- user(0.003)
  c4c15 <- user(0.003)
  c4c16 <- user(0.003)
  c4c17 <- user(0.003)
  
  r10 <- user(0.15)
  r11 <- user(0.15)
  r12 <- user(0.15)
  r13 <- user(0.15)
  r14 <- user(0.15)
  r15 <- user(0.15)
  r16 <- user(0.15)
  r17 <- user(0.15)
  
  stay10 <- user(0.66)
  stay11 <- user(0.66)
  stay12 <- user(0.66)
  stay13 <- user(0.66)
  stay14 <- user(0.66)
  stay15 <- user(0.66)
  stay16 <- user(0.66)
  stay17 <- user(0.66)

  phi_p <- user(1)
  
  on_p1c1s1_10 <- user(1)
  on_p1c1s2_10 <- user(1)
  on_p1c1s3_10 <- user(1)
  on_p1c2s1_10 <- user(1)
  on_p1c2s2_10 <- user(1)
  on_p1c2s3_10 <- user(1)
  on_p1c3s1_10 <- user(1)
  on_p1c3s2_10 <- user(1)
  on_p1c3s3_10 <- user(1)
  on_p1c4s1_10 <- user(1)
  on_p1c4s2_10 <- user(1)
  on_p1c4s3_10 <- user(1)
  on_p2c1s1_10 <- user(1)
  on_p2c1s2_10 <- user(1)
  on_p2c1s3_10 <- user(1)
  on_p2c2s1_10 <- user(1)
  on_p2c2s2_10 <- user(1)
  on_p2c2s3_10 <- user(1)
  on_p2c3s1_10 <- user(1)
  on_p2c3s2_10 <- user(1)
  on_p2c3s3_10 <- user(1)
  on_p2c4s1_10 <- user(1)
  on_p2c4s2_10 <- user(1)
  on_p2c4s3_10 <- user(1)
  on_p1c1s1_11 <- user(1)
  on_p1c1s2_11 <- user(1)
  on_p1c1s3_11 <- user(1)
  on_p1c2s1_11 <- user(1)
  on_p1c2s2_11 <- user(1)
  on_p1c2s3_11 <- user(1)
  on_p1c3s1_11 <- user(1)
  on_p1c3s2_11 <- user(1)
  on_p1c3s3_11 <- user(1)
  on_p1c4s1_11 <- user(1)
  on_p1c4s2_11 <- user(1)
  on_p1c4s3_11 <- user(1)
  on_p2c1s1_11 <- user(1)
  on_p2c1s2_11 <- user(1)
  on_p2c1s3_11 <- user(1)
  on_p2c2s1_11 <- user(1)
  on_p2c2s2_11 <- user(1)
  on_p2c2s3_11 <- user(1)
  on_p2c3s1_11 <- user(1)
  on_p2c3s2_11 <- user(1)
  on_p2c3s3_11 <- user(1)
  on_p2c4s1_11 <- user(1)
  on_p2c4s2_11 <- user(1)
  on_p2c4s3_11 <- user(1)
  on_p1c1s1_12 <- user(1)
  on_p1c1s2_12 <- user(1)
  on_p1c1s3_12 <- user(1)
  on_p1c2s1_12 <- user(1)
  on_p1c2s2_12 <- user(1)
  on_p1c2s3_12 <- user(1)
  on_p1c3s1_12 <- user(1)
  on_p1c3s2_12 <- user(1)
  on_p1c3s3_12 <- user(1)
  on_p1c4s1_12 <- user(1)
  on_p1c4s2_12 <- user(1)
  on_p1c4s3_12 <- user(1)
  on_p2c1s1_12 <- user(1)
  on_p2c1s2_12 <- user(1)
  on_p2c1s3_12 <- user(1)
  on_p2c2s1_12 <- user(1)
  on_p2c2s2_12 <- user(1)
  on_p2c2s3_12 <- user(1)
  on_p2c3s1_12 <- user(1)
  on_p2c3s2_12 <- user(1)
  on_p2c3s3_12 <- user(1)
  on_p2c4s1_12 <- user(1)
  on_p2c4s2_12 <- user(1)
  on_p2c4s3_12 <- user(1)
  on_p1c1s1_13 <- user(1)
  on_p1c1s2_13 <- user(1)
  on_p1c1s3_13 <- user(1)
  on_p1c2s1_13 <- user(1)
  on_p1c2s2_13 <- user(1)
  on_p1c2s3_13 <- user(1)
  on_p1c3s1_13 <- user(1)
  on_p1c3s2_13 <- user(1)
  on_p1c3s3_13 <- user(1)
  on_p1c4s1_13 <- user(1)
  on_p1c4s2_13 <- user(1)
  on_p1c4s3_13 <- user(1)
  on_p2c1s1_13 <- user(1)
  on_p2c1s2_13 <- user(1)
  on_p2c1s3_13 <- user(1)
  on_p2c2s1_13 <- user(1)
  on_p2c2s2_13 <- user(1)
  on_p2c2s3_13 <- user(1)
  on_p2c3s1_13 <- user(1)
  on_p2c3s2_13 <- user(1)
  on_p2c3s3_13 <- user(1)
  on_p2c4s1_13 <- user(1)
  on_p2c4s2_13 <- user(1)
  on_p2c4s3_13 <- user(1)
  on_p1c1s1_14 <- user(1)
  on_p1c1s2_14 <- user(1)
  on_p1c1s3_14 <- user(1)
  on_p1c2s1_14 <- user(1)
  on_p1c2s2_14 <- user(1)
  on_p1c2s3_14 <- user(1)
  on_p1c3s1_14 <- user(1)
  on_p1c3s2_14 <- user(1)
  on_p1c3s3_14 <- user(1)
  on_p1c4s1_14 <- user(1)
  on_p1c4s2_14 <- user(1)
  on_p1c4s3_14 <- user(1)
  on_p2c1s1_14 <- user(1)
  on_p2c1s2_14 <- user(1)
  on_p2c1s3_14 <- user(1)
  on_p2c2s1_14 <- user(1)
  on_p2c2s2_14 <- user(1)
  on_p2c2s3_14 <- user(1)
  on_p2c3s1_14 <- user(1)
  on_p2c3s2_14 <- user(1)
  on_p2c3s3_14 <- user(1)
  on_p2c4s1_14 <- user(1)
  on_p2c4s2_14 <- user(1)
  on_p2c4s3_14 <- user(1)
  on_p1c1s1_15 <- user(1)
  on_p1c1s2_15 <- user(1)
  on_p1c1s3_15 <- user(1)
  on_p1c2s1_15 <- user(1)
  on_p1c2s2_15 <- user(1)
  on_p1c2s3_15 <- user(1)
  on_p1c3s1_15 <- user(1)
  on_p1c3s2_15 <- user(1)
  on_p1c3s3_15 <- user(1)
  on_p1c4s1_15 <- user(1)
  on_p1c4s2_15 <- user(1)
  on_p1c4s3_15 <- user(1)
  on_p2c1s1_15 <- user(1)
  on_p2c1s2_15 <- user(1)
  on_p2c1s3_15 <- user(1)
  on_p2c2s1_15 <- user(1)
  on_p2c2s2_15 <- user(1)
  on_p2c2s3_15 <- user(1)
  on_p2c3s1_15 <- user(1)
  on_p2c3s2_15 <- user(1)
  on_p2c3s3_15 <- user(1)
  on_p2c4s1_15 <- user(1)
  on_p2c4s2_15 <- user(1)
  on_p2c4s3_15 <- user(1)
  on_p1c1s1_16 <- user(1)
  on_p1c1s2_16 <- user(1)
  on_p1c1s3_16 <- user(1)
  on_p1c2s1_16 <- user(1)
  on_p1c2s2_16 <- user(1)
  on_p1c2s3_16 <- user(1)
  on_p1c3s1_16 <- user(1)
  on_p1c3s2_16 <- user(1)
  on_p1c3s3_16 <- user(1)
  on_p1c4s1_16 <- user(1)
  on_p1c4s2_16 <- user(1)
  on_p1c4s3_16 <- user(1)
  on_p2c1s1_16 <- user(1)
  on_p2c1s2_16 <- user(1)
  on_p2c1s3_16 <- user(1)
  on_p2c2s1_16 <- user(1)
  on_p2c2s2_16 <- user(1)
  on_p2c2s3_16 <- user(1)
  on_p2c3s1_16 <- user(1)
  on_p2c3s2_16 <- user(1)
  on_p2c3s3_16 <- user(1)
  on_p2c4s1_16 <- user(1)
  on_p2c4s2_16 <- user(1)
  on_p2c4s3_16 <- user(1)
  on_p1c1s1_17 <- user(1)
  on_p1c1s2_17 <- user(1)
  on_p1c1s3_17 <- user(1)
  on_p1c2s1_17 <- user(1)
  on_p1c2s2_17 <- user(1)
  on_p1c2s3_17 <- user(1)
  on_p1c3s1_17 <- user(1)
  on_p1c3s2_17 <- user(1)
  on_p1c3s3_17 <- user(1)
  on_p1c4s1_17 <- user(1)
  on_p1c4s2_17 <- user(1)
  on_p1c4s3_17 <- user(1)
  on_p2c1s1_17 <- user(1)
  on_p2c1s2_17 <- user(1)
  on_p2c1s3_17 <- user(1)
  on_p2c2s1_17 <- user(1)
  on_p2c2s2_17 <- user(1)
  on_p2c2s3_17 <- user(1)
  on_p2c3s1_17 <- user(1)
  on_p2c3s2_17 <- user(1)
  on_p2c3s3_17 <- user(1)
  on_p2c4s1_17 <- user(1)
  on_p2c4s2_17 <- user(1)
  on_p2c4s3_17 <- user(1)
  
  cs_p1c1s1_10 <- user(0.00001)
  cs_p1c1s2_10 <- user(0.00001)
  cs_p1c1s3_10 <- user(0.00001)
  cs_p1c2s1_10 <- user(0.00001)
  cs_p1c2s2_10 <- user(0.00001)
  cs_p1c2s3_10 <- user(0.00001)
  cs_p1c3s1_10 <- user(0.00001)
  cs_p1c3s2_10 <- user(0.00001)
  cs_p1c3s3_10 <- user(0.00001)
  cs_p1c4s1_10 <- user(0.00001)
  cs_p1c4s2_10 <- user(0.00001)
  cs_p1c4s3_10 <- user(0.00001)
  cs_p2c1s1_10 <- user(0.00001)
  cs_p2c1s2_10 <- user(0.00001)
  cs_p2c1s3_10 <- user(0.00001)
  cs_p2c2s1_10 <- user(0.00001)
  cs_p2c2s2_10 <- user(0.00001)
  cs_p2c2s3_10 <- user(0.00001)
  cs_p2c3s1_10 <- user(0.00001)
  cs_p2c3s2_10 <- user(0.00001)
  cs_p2c3s3_10 <- user(0.00001)
  cs_p2c4s1_10 <- user(0.00001)
  cs_p2c4s2_10 <- user(0.00001)
  cs_p2c4s3_10 <- user(0.00001)
  cs_p1c1s1_11 <- user(0.00001)
  cs_p1c1s2_11 <- user(0.00001)
  cs_p1c1s3_11 <- user(0.00001)
  cs_p1c2s1_11 <- user(0.00001)
  cs_p1c2s2_11 <- user(0.00001)
  cs_p1c2s3_11 <- user(0.00001)
  cs_p1c3s1_11 <- user(0.00001)
  cs_p1c3s2_11 <- user(0.00001)
  cs_p1c3s3_11 <- user(0.00001)
  cs_p1c4s1_11 <- user(0.00001)
  cs_p1c4s2_11 <- user(0.00001)
  cs_p1c4s3_11 <- user(0.00001)
  cs_p2c1s1_11 <- user(0.00001)
  cs_p2c1s2_11 <- user(0.00001)
  cs_p2c1s3_11 <- user(0.00001)
  cs_p2c2s1_11 <- user(0.00001)
  cs_p2c2s2_11 <- user(0.00001)
  cs_p2c2s3_11 <- user(0.00001)
  cs_p2c3s1_11 <- user(0.00001)
  cs_p2c3s2_11 <- user(0.00001)
  cs_p2c3s3_11 <- user(0.00001)
  cs_p2c4s1_11 <- user(0.00001)
  cs_p2c4s2_11 <- user(0.00001)
  cs_p2c4s3_11 <- user(0.00001)
  cs_p1c1s1_12 <- user(0.00001)
  cs_p1c1s2_12 <- user(0.00001)
  cs_p1c1s3_12 <- user(0.00001)
  cs_p1c2s1_12 <- user(0.00001)
  cs_p1c2s2_12 <- user(0.00001)
  cs_p1c2s3_12 <- user(0.00001)
  cs_p1c3s1_12 <- user(0.00001)
  cs_p1c3s2_12 <- user(0.00001)
  cs_p1c3s3_12 <- user(0.00001)
  cs_p1c4s1_12 <- user(0.00001)
  cs_p1c4s2_12 <- user(0.00001)
  cs_p1c4s3_12 <- user(0.00001)
  cs_p2c1s1_12 <- user(0.00001)
  cs_p2c1s2_12 <- user(0.00001)
  cs_p2c1s3_12 <- user(0.00001)
  cs_p2c2s1_12 <- user(0.00001)
  cs_p2c2s2_12 <- user(0.00001)
  cs_p2c2s3_12 <- user(0.00001)
  cs_p2c3s1_12 <- user(0.00001)
  cs_p2c3s2_12 <- user(0.00001)
  cs_p2c3s3_12 <- user(0.00001)
  cs_p2c4s1_12 <- user(0.00001)
  cs_p2c4s2_12 <- user(0.00001)
  cs_p2c4s3_12 <- user(0.00001)
  cs_p1c1s1_13 <- user(0.00001)
  cs_p1c1s2_13 <- user(0.00001)
  cs_p1c1s3_13 <- user(0.00001)
  cs_p1c2s1_13 <- user(0.00001)
  cs_p1c2s2_13 <- user(0.00001)
  cs_p1c2s3_13 <- user(0.00001)
  cs_p1c3s1_13 <- user(0.00001)
  cs_p1c3s2_13 <- user(0.00001)
  cs_p1c3s3_13 <- user(0.00001)
  cs_p1c4s1_13 <- user(0.00001)
  cs_p1c4s2_13 <- user(0.00001)
  cs_p1c4s3_13 <- user(0.00001)
  cs_p2c1s1_13 <- user(0.00001)
  cs_p2c1s2_13 <- user(0.00001)
  cs_p2c1s3_13 <- user(0.00001)
  cs_p2c2s1_13 <- user(0.00001)
  cs_p2c2s2_13 <- user(0.00001)
  cs_p2c2s3_13 <- user(0.00001)
  cs_p2c3s1_13 <- user(0.00001)
  cs_p2c3s2_13 <- user(0.00001)
  cs_p2c3s3_13 <- user(0.00001)
  cs_p2c4s1_13 <- user(0.00001)
  cs_p2c4s2_13 <- user(0.00001)
  cs_p2c4s3_13 <- user(0.00001)
  cs_p1c1s1_14 <- user(0.00001)
  cs_p1c1s2_14 <- user(0.00001)
  cs_p1c1s3_14 <- user(0.00001)
  cs_p1c2s1_14 <- user(0.00001)
  cs_p1c2s2_14 <- user(0.00001)
  cs_p1c2s3_14 <- user(0.00001)
  cs_p1c3s1_14 <- user(0.00001)
  cs_p1c3s2_14 <- user(0.00001)
  cs_p1c3s3_14 <- user(0.00001)
  cs_p1c4s1_14 <- user(0.00001)
  cs_p1c4s2_14 <- user(0.00001)
  cs_p1c4s3_14 <- user(0.00001)
  cs_p2c1s1_14 <- user(0.00001)
  cs_p2c1s2_14 <- user(0.00001)
  cs_p2c1s3_14 <- user(0.00001)
  cs_p2c2s1_14 <- user(0.00001)
  cs_p2c2s2_14 <- user(0.00001)
  cs_p2c2s3_14 <- user(0.00001)
  cs_p2c3s1_14 <- user(0.00001)
  cs_p2c3s2_14 <- user(0.00001)
  cs_p2c3s3_14 <- user(0.00001)
  cs_p2c4s1_14 <- user(0.00001)
  cs_p2c4s2_14 <- user(0.00001)
  cs_p2c4s3_14 <- user(0.00001)
  cs_p1c1s1_15 <- user(0.00001)
  cs_p1c1s2_15 <- user(0.00001)
  cs_p1c1s3_15 <- user(0.00001)
  cs_p1c2s1_15 <- user(0.00001)
  cs_p1c2s2_15 <- user(0.00001)
  cs_p1c2s3_15 <- user(0.00001)
  cs_p1c3s1_15 <- user(0.00001)
  cs_p1c3s2_15 <- user(0.00001)
  cs_p1c3s3_15 <- user(0.00001)
  cs_p1c4s1_15 <- user(0.00001)
  cs_p1c4s2_15 <- user(0.00001)
  cs_p1c4s3_15 <- user(0.00001)
  cs_p2c1s1_15 <- user(0.00001)
  cs_p2c1s2_15 <- user(0.00001)
  cs_p2c1s3_15 <- user(0.00001)
  cs_p2c2s1_15 <- user(0.00001)
  cs_p2c2s2_15 <- user(0.00001)
  cs_p2c2s3_15 <- user(0.00001)
  cs_p2c3s1_15 <- user(0.00001)
  cs_p2c3s2_15 <- user(0.00001)
  cs_p2c3s3_15 <- user(0.00001)
  cs_p2c4s1_15 <- user(0.00001)
  cs_p2c4s2_15 <- user(0.00001)
  cs_p2c4s3_15 <- user(0.00001)
  cs_p1c1s1_16 <- user(0.00001)
  cs_p1c1s2_16 <- user(0.00001)
  cs_p1c1s3_16 <- user(0.00001)
  cs_p1c2s1_16 <- user(0.00001)
  cs_p1c2s2_16 <- user(0.00001)
  cs_p1c2s3_16 <- user(0.00001)
  cs_p1c3s1_16 <- user(0.00001)
  cs_p1c3s2_16 <- user(0.00001)
  cs_p1c3s3_16 <- user(0.00001)
  cs_p1c4s1_16 <- user(0.00001)
  cs_p1c4s2_16 <- user(0.00001)
  cs_p1c4s3_16 <- user(0.00001)
  cs_p2c1s1_16 <- user(0.00001)
  cs_p2c1s2_16 <- user(0.00001)
  cs_p2c1s3_16 <- user(0.00001)
  cs_p2c2s1_16 <- user(0.00001)
  cs_p2c2s2_16 <- user(0.00001)
  cs_p2c2s3_16 <- user(0.00001)
  cs_p2c3s1_16 <- user(0.00001)
  cs_p2c3s2_16 <- user(0.00001)
  cs_p2c3s3_16 <- user(0.00001)
  cs_p2c4s1_16 <- user(0.00001)
  cs_p2c4s2_16 <- user(0.00001)
  cs_p2c4s3_16 <- user(0.00001)
  cs_p1c1s1_17 <- user(0.00001)
  cs_p1c1s2_17 <- user(0.00001)
  cs_p1c1s3_17 <- user(0.00001)
  cs_p1c2s1_17 <- user(0.00001)
  cs_p1c2s2_17 <- user(0.00001)
  cs_p1c2s3_17 <- user(0.00001)
  cs_p1c3s1_17 <- user(0.00001)
  cs_p1c3s2_17 <- user(0.00001)
  cs_p1c3s3_17 <- user(0.00001)
  cs_p1c4s1_17 <- user(0.00001)
  cs_p1c4s2_17 <- user(0.00001)
  cs_p1c4s3_17 <- user(0.00001)
  cs_p2c1s1_17 <- user(0.00001)
  cs_p2c1s2_17 <- user(0.00001)
  cs_p2c1s3_17 <- user(0.00001)
  cs_p2c2s1_17 <- user(0.00001)
  cs_p2c2s2_17 <- user(0.00001)
  cs_p2c2s3_17 <- user(0.00001)
  cs_p2c3s1_17 <- user(0.00001)
  cs_p2c3s2_17 <- user(0.00001)
  cs_p2c3s3_17 <- user(0.00001)
  cs_p2c4s1_17 <- user(0.00001)
  cs_p2c4s2_17 <- user(0.00001)
  cs_p2c4s3_17 <- user(0.00001)
  
  ss_p1c1s1j1_10 <- user(0.0003)
  ss_p1c1s1j2_10 <- user(0.0003)
  ss_p1c1s1j3_10 <- user(0.0003)
  ss_p1c1s1j4_10 <- user(0.0003)
  ss_p1c1s2j1_10 <- user(0.0003)
  ss_p1c1s2j2_10 <- user(0.0003)
  ss_p1c1s2j3_10 <- user(0.0003)
  ss_p1c1s2j4_10 <- user(0.0003)
  ss_p1c1s3j1_10 <- user(0.0003)
  ss_p1c1s3j2_10 <- user(0.0003)
  ss_p1c1s3j3_10 <- user(0.0003)
  ss_p1c1s3j4_10 <- user(0.0003)
  ss_p1c2s1j1_10 <- user(0.0003)
  ss_p1c2s1j2_10 <- user(0.0003)
  ss_p1c2s1j3_10 <- user(0.0003)
  ss_p1c2s1j4_10 <- user(0.0003)
  ss_p1c2s2j1_10 <- user(0.0003)
  ss_p1c2s2j2_10 <- user(0.0003)
  ss_p1c2s2j3_10 <- user(0.0003)
  ss_p1c2s2j4_10 <- user(0.0003)
  ss_p1c2s3j1_10 <- user(0.0003)
  ss_p1c2s3j2_10 <- user(0.0003)
  ss_p1c2s3j3_10 <- user(0.0003)
  ss_p1c2s3j4_10 <- user(0.0003)
  ss_p1c3s1j1_10 <- user(0.0003)
  ss_p1c3s1j2_10 <- user(0.0003)
  ss_p1c3s1j3_10 <- user(0.0003)
  ss_p1c3s1j4_10 <- user(0.0003)
  ss_p1c3s2j1_10 <- user(0.0003)
  ss_p1c3s2j2_10 <- user(0.0003)
  ss_p1c3s2j3_10 <- user(0.0003)
  ss_p1c3s2j4_10 <- user(0.0003)
  ss_p1c3s3j1_10 <- user(0.0003)
  ss_p1c3s3j2_10 <- user(0.0003)
  ss_p1c3s3j3_10 <- user(0.0003)
  ss_p1c3s3j4_10 <- user(0.0003)
  ss_p1c4s1j1_10 <- user(0.0003)
  ss_p1c4s1j2_10 <- user(0.0003)
  ss_p1c4s1j3_10 <- user(0.0003)
  ss_p1c4s1j4_10 <- user(0.0003)
  ss_p1c4s2j1_10 <- user(0.0003)
  ss_p1c4s2j2_10 <- user(0.0003)
  ss_p1c4s2j3_10 <- user(0.0003)
  ss_p1c4s2j4_10 <- user(0.0003)
  ss_p1c4s3j1_10 <- user(0.0003)
  ss_p1c4s3j2_10 <- user(0.0003)
  ss_p1c4s3j3_10 <- user(0.0003)
  ss_p1c4s3j4_10 <- user(0.0003)
  ss_p2c1s1j1_10 <- user(0.0003)
  ss_p2c1s1j2_10 <- user(0.0003)
  ss_p2c1s1j3_10 <- user(0.0003)
  ss_p2c1s1j4_10 <- user(0.0003)
  ss_p2c1s2j1_10 <- user(0.0003)
  ss_p2c1s2j2_10 <- user(0.0003)
  ss_p2c1s2j3_10 <- user(0.0003)
  ss_p2c1s2j4_10 <- user(0.0003)
  ss_p2c1s3j1_10 <- user(0.0003)
  ss_p2c1s3j2_10 <- user(0.0003)
  ss_p2c1s3j3_10 <- user(0.0003)
  ss_p2c1s3j4_10 <- user(0.0003)
  ss_p2c2s1j1_10 <- user(0.0003)
  ss_p2c2s1j2_10 <- user(0.0003)
  ss_p2c2s1j3_10 <- user(0.0003)
  ss_p2c2s1j4_10 <- user(0.0003)
  ss_p2c2s2j1_10 <- user(0.0003)
  ss_p2c2s2j2_10 <- user(0.0003)
  ss_p2c2s2j3_10 <- user(0.0003)
  ss_p2c2s2j4_10 <- user(0.0003)
  ss_p2c2s3j1_10 <- user(0.0003)
  ss_p2c2s3j2_10 <- user(0.0003)
  ss_p2c2s3j3_10 <- user(0.0003)
  ss_p2c2s3j4_10 <- user(0.0003)
  ss_p2c3s1j1_10 <- user(0.0003)
  ss_p2c3s1j2_10 <- user(0.0003)
  ss_p2c3s1j3_10 <- user(0.0003)
  ss_p2c3s1j4_10 <- user(0.0003)
  ss_p2c3s2j1_10 <- user(0.0003)
  ss_p2c3s2j2_10 <- user(0.0003)
  ss_p2c3s2j3_10 <- user(0.0003)
  ss_p2c3s2j4_10 <- user(0.0003)
  ss_p2c3s3j1_10 <- user(0.0003)
  ss_p2c3s3j2_10 <- user(0.0003)
  ss_p2c3s3j3_10 <- user(0.0003)
  ss_p2c3s3j4_10 <- user(0.0003)
  ss_p2c4s1j1_10 <- user(0.0003)
  ss_p2c4s1j2_10 <- user(0.0003)
  ss_p2c4s1j3_10 <- user(0.0003)
  ss_p2c4s1j4_10 <- user(0.0003)
  ss_p2c4s2j1_10 <- user(0.0003)
  ss_p2c4s2j2_10 <- user(0.0003)
  ss_p2c4s2j3_10 <- user(0.0003)
  ss_p2c4s2j4_10 <- user(0.0003)
  ss_p2c4s3j1_10 <- user(0.0003)
  ss_p2c4s3j2_10 <- user(0.0003)
  ss_p2c4s3j3_10 <- user(0.0003)
  ss_p2c4s3j4_10 <- user(0.0003)
  ss_p1c1s1j1_11 <- user(0.0003)
  ss_p1c1s1j2_11 <- user(0.0003)
  ss_p1c1s1j3_11 <- user(0.0003)
  ss_p1c1s1j4_11 <- user(0.0003)
  ss_p1c1s2j1_11 <- user(0.0003)
  ss_p1c1s2j2_11 <- user(0.0003)
  ss_p1c1s2j3_11 <- user(0.0003)
  ss_p1c1s2j4_11 <- user(0.0003)
  ss_p1c1s3j1_11 <- user(0.0003)
  ss_p1c1s3j2_11 <- user(0.0003)
  ss_p1c1s3j3_11 <- user(0.0003)
  ss_p1c1s3j4_11 <- user(0.0003)
  ss_p1c2s1j1_11 <- user(0.0003)
  ss_p1c2s1j2_11 <- user(0.0003)
  ss_p1c2s1j3_11 <- user(0.0003)
  ss_p1c2s1j4_11 <- user(0.0003)
  ss_p1c2s2j1_11 <- user(0.0003)
  ss_p1c2s2j2_11 <- user(0.0003)
  ss_p1c2s2j3_11 <- user(0.0003)
  ss_p1c2s2j4_11 <- user(0.0003)
  ss_p1c2s3j1_11 <- user(0.0003)
  ss_p1c2s3j2_11 <- user(0.0003)
  ss_p1c2s3j3_11 <- user(0.0003)
  ss_p1c2s3j4_11 <- user(0.0003)
  ss_p1c3s1j1_11 <- user(0.0003)
  ss_p1c3s1j2_11 <- user(0.0003)
  ss_p1c3s1j3_11 <- user(0.0003)
  ss_p1c3s1j4_11 <- user(0.0003)
  ss_p1c3s2j1_11 <- user(0.0003)
  ss_p1c3s2j2_11 <- user(0.0003)
  ss_p1c3s2j3_11 <- user(0.0003)
  ss_p1c3s2j4_11 <- user(0.0003)
  ss_p1c3s3j1_11 <- user(0.0003)
  ss_p1c3s3j2_11 <- user(0.0003)
  ss_p1c3s3j3_11 <- user(0.0003)
  ss_p1c3s3j4_11 <- user(0.0003)
  ss_p1c4s1j1_11 <- user(0.0003)
  ss_p1c4s1j2_11 <- user(0.0003)
  ss_p1c4s1j3_11 <- user(0.0003)
  ss_p1c4s1j4_11 <- user(0.0003)
  ss_p1c4s2j1_11 <- user(0.0003)
  ss_p1c4s2j2_11 <- user(0.0003)
  ss_p1c4s2j3_11 <- user(0.0003)
  ss_p1c4s2j4_11 <- user(0.0003)
  ss_p1c4s3j1_11 <- user(0.0003)
  ss_p1c4s3j2_11 <- user(0.0003)
  ss_p1c4s3j3_11 <- user(0.0003)
  ss_p1c4s3j4_11 <- user(0.0003)
  ss_p2c1s1j1_11 <- user(0.0003)
  ss_p2c1s1j2_11 <- user(0.0003)
  ss_p2c1s1j3_11 <- user(0.0003)
  ss_p2c1s1j4_11 <- user(0.0003)
  ss_p2c1s2j1_11 <- user(0.0003)
  ss_p2c1s2j2_11 <- user(0.0003)
  ss_p2c1s2j3_11 <- user(0.0003)
  ss_p2c1s2j4_11 <- user(0.0003)
  ss_p2c1s3j1_11 <- user(0.0003)
  ss_p2c1s3j2_11 <- user(0.0003)
  ss_p2c1s3j3_11 <- user(0.0003)
  ss_p2c1s3j4_11 <- user(0.0003)
  ss_p2c2s1j1_11 <- user(0.0003)
  ss_p2c2s1j2_11 <- user(0.0003)
  ss_p2c2s1j3_11 <- user(0.0003)
  ss_p2c2s1j4_11 <- user(0.0003)
  ss_p2c2s2j1_11 <- user(0.0003)
  ss_p2c2s2j2_11 <- user(0.0003)
  ss_p2c2s2j3_11 <- user(0.0003)
  ss_p2c2s2j4_11 <- user(0.0003)
  ss_p2c2s3j1_11 <- user(0.0003)
  ss_p2c2s3j2_11 <- user(0.0003)
  ss_p2c2s3j3_11 <- user(0.0003)
  ss_p2c2s3j4_11 <- user(0.0003)
  ss_p2c3s1j1_11 <- user(0.0003)
  ss_p2c3s1j2_11 <- user(0.0003)
  ss_p2c3s1j3_11 <- user(0.0003)
  ss_p2c3s1j4_11 <- user(0.0003)
  ss_p2c3s2j1_11 <- user(0.0003)
  ss_p2c3s2j2_11 <- user(0.0003)
  ss_p2c3s2j3_11 <- user(0.0003)
  ss_p2c3s2j4_11 <- user(0.0003)
  ss_p2c3s3j1_11 <- user(0.0003)
  ss_p2c3s3j2_11 <- user(0.0003)
  ss_p2c3s3j3_11 <- user(0.0003)
  ss_p2c3s3j4_11 <- user(0.0003)
  ss_p2c4s1j1_11 <- user(0.0003)
  ss_p2c4s1j2_11 <- user(0.0003)
  ss_p2c4s1j3_11 <- user(0.0003)
  ss_p2c4s1j4_11 <- user(0.0003)
  ss_p2c4s2j1_11 <- user(0.0003)
  ss_p2c4s2j2_11 <- user(0.0003)
  ss_p2c4s2j3_11 <- user(0.0003)
  ss_p2c4s2j4_11 <- user(0.0003)
  ss_p2c4s3j1_11 <- user(0.0003)
  ss_p2c4s3j2_11 <- user(0.0003)
  ss_p2c4s3j3_11 <- user(0.0003)
  ss_p2c4s3j4_11 <- user(0.0003)
  ss_p1c1s1j1_12 <- user(0.0003)
  ss_p1c1s1j2_12 <- user(0.0003)
  ss_p1c1s1j3_12 <- user(0.0003)
  ss_p1c1s1j4_12 <- user(0.0003)
  ss_p1c1s2j1_12 <- user(0.0003)
  ss_p1c1s2j2_12 <- user(0.0003)
  ss_p1c1s2j3_12 <- user(0.0003)
  ss_p1c1s2j4_12 <- user(0.0003)
  ss_p1c1s3j1_12 <- user(0.0003)
  ss_p1c1s3j2_12 <- user(0.0003)
  ss_p1c1s3j3_12 <- user(0.0003)
  ss_p1c1s3j4_12 <- user(0.0003)
  ss_p1c2s1j1_12 <- user(0.0003)
  ss_p1c2s1j2_12 <- user(0.0003)
  ss_p1c2s1j3_12 <- user(0.0003)
  ss_p1c2s1j4_12 <- user(0.0003)
  ss_p1c2s2j1_12 <- user(0.0003)
  ss_p1c2s2j2_12 <- user(0.0003)
  ss_p1c2s2j3_12 <- user(0.0003)
  ss_p1c2s2j4_12 <- user(0.0003)
  ss_p1c2s3j1_12 <- user(0.0003)
  ss_p1c2s3j2_12 <- user(0.0003)
  ss_p1c2s3j3_12 <- user(0.0003)
  ss_p1c2s3j4_12 <- user(0.0003)
  ss_p1c3s1j1_12 <- user(0.0003)
  ss_p1c3s1j2_12 <- user(0.0003)
  ss_p1c3s1j3_12 <- user(0.0003)
  ss_p1c3s1j4_12 <- user(0.0003)
  ss_p1c3s2j1_12 <- user(0.0003)
  ss_p1c3s2j2_12 <- user(0.0003)
  ss_p1c3s2j3_12 <- user(0.0003)
  ss_p1c3s2j4_12 <- user(0.0003)
  ss_p1c3s3j1_12 <- user(0.0003)
  ss_p1c3s3j2_12 <- user(0.0003)
  ss_p1c3s3j3_12 <- user(0.0003)
  ss_p1c3s3j4_12 <- user(0.0003)
  ss_p1c4s1j1_12 <- user(0.0003)
  ss_p1c4s1j2_12 <- user(0.0003)
  ss_p1c4s1j3_12 <- user(0.0003)
  ss_p1c4s1j4_12 <- user(0.0003)
  ss_p1c4s2j1_12 <- user(0.0003)
  ss_p1c4s2j2_12 <- user(0.0003)
  ss_p1c4s2j3_12 <- user(0.0003)
  ss_p1c4s2j4_12 <- user(0.0003)
  ss_p1c4s3j1_12 <- user(0.0003)
  ss_p1c4s3j2_12 <- user(0.0003)
  ss_p1c4s3j3_12 <- user(0.0003)
  ss_p1c4s3j4_12 <- user(0.0003)
  ss_p2c1s1j1_12 <- user(0.0003)
  ss_p2c1s1j2_12 <- user(0.0003)
  ss_p2c1s1j3_12 <- user(0.0003)
  ss_p2c1s1j4_12 <- user(0.0003)
  ss_p2c1s2j1_12 <- user(0.0003)
  ss_p2c1s2j2_12 <- user(0.0003)
  ss_p2c1s2j3_12 <- user(0.0003)
  ss_p2c1s2j4_12 <- user(0.0003)
  ss_p2c1s3j1_12 <- user(0.0003)
  ss_p2c1s3j2_12 <- user(0.0003)
  ss_p2c1s3j3_12 <- user(0.0003)
  ss_p2c1s3j4_12 <- user(0.0003)
  ss_p2c2s1j1_12 <- user(0.0003)
  ss_p2c2s1j2_12 <- user(0.0003)
  ss_p2c2s1j3_12 <- user(0.0003)
  ss_p2c2s1j4_12 <- user(0.0003)
  ss_p2c2s2j1_12 <- user(0.0003)
  ss_p2c2s2j2_12 <- user(0.0003)
  ss_p2c2s2j3_12 <- user(0.0003)
  ss_p2c2s2j4_12 <- user(0.0003)
  ss_p2c2s3j1_12 <- user(0.0003)
  ss_p2c2s3j2_12 <- user(0.0003)
  ss_p2c2s3j3_12 <- user(0.0003)
  ss_p2c2s3j4_12 <- user(0.0003)
  ss_p2c3s1j1_12 <- user(0.0003)
  ss_p2c3s1j2_12 <- user(0.0003)
  ss_p2c3s1j3_12 <- user(0.0003)
  ss_p2c3s1j4_12 <- user(0.0003)
  ss_p2c3s2j1_12 <- user(0.0003)
  ss_p2c3s2j2_12 <- user(0.0003)
  ss_p2c3s2j3_12 <- user(0.0003)
  ss_p2c3s2j4_12 <- user(0.0003)
  ss_p2c3s3j1_12 <- user(0.0003)
  ss_p2c3s3j2_12 <- user(0.0003)
  ss_p2c3s3j3_12 <- user(0.0003)
  ss_p2c3s3j4_12 <- user(0.0003)
  ss_p2c4s1j1_12 <- user(0.0003)
  ss_p2c4s1j2_12 <- user(0.0003)
  ss_p2c4s1j3_12 <- user(0.0003)
  ss_p2c4s1j4_12 <- user(0.0003)
  ss_p2c4s2j1_12 <- user(0.0003)
  ss_p2c4s2j2_12 <- user(0.0003)
  ss_p2c4s2j3_12 <- user(0.0003)
  ss_p2c4s2j4_12 <- user(0.0003)
  ss_p2c4s3j1_12 <- user(0.0003)
  ss_p2c4s3j2_12 <- user(0.0003)
  ss_p2c4s3j3_12 <- user(0.0003)
  ss_p2c4s3j4_12 <- user(0.0003)
  ss_p1c1s1j1_13 <- user(0.0003)
  ss_p1c1s1j2_13 <- user(0.0003)
  ss_p1c1s1j3_13 <- user(0.0003)
  ss_p1c1s1j4_13 <- user(0.0003)
  ss_p1c1s2j1_13 <- user(0.0003)
  ss_p1c1s2j2_13 <- user(0.0003)
  ss_p1c1s2j3_13 <- user(0.0003)
  ss_p1c1s2j4_13 <- user(0.0003)
  ss_p1c1s3j1_13 <- user(0.0003)
  ss_p1c1s3j2_13 <- user(0.0003)
  ss_p1c1s3j3_13 <- user(0.0003)
  ss_p1c1s3j4_13 <- user(0.0003)
  ss_p1c2s1j1_13 <- user(0.0003)
  ss_p1c2s1j2_13 <- user(0.0003)
  ss_p1c2s1j3_13 <- user(0.0003)
  ss_p1c2s1j4_13 <- user(0.0003)
  ss_p1c2s2j1_13 <- user(0.0003)
  ss_p1c2s2j2_13 <- user(0.0003)
  ss_p1c2s2j3_13 <- user(0.0003)
  ss_p1c2s2j4_13 <- user(0.0003)
  ss_p1c2s3j1_13 <- user(0.0003)
  ss_p1c2s3j2_13 <- user(0.0003)
  ss_p1c2s3j3_13 <- user(0.0003)
  ss_p1c2s3j4_13 <- user(0.0003)
  ss_p1c3s1j1_13 <- user(0.0003)
  ss_p1c3s1j2_13 <- user(0.0003)
  ss_p1c3s1j3_13 <- user(0.0003)
  ss_p1c3s1j4_13 <- user(0.0003)
  ss_p1c3s2j1_13 <- user(0.0003)
  ss_p1c3s2j2_13 <- user(0.0003)
  ss_p1c3s2j3_13 <- user(0.0003)
  ss_p1c3s2j4_13 <- user(0.0003)
  ss_p1c3s3j1_13 <- user(0.0003)
  ss_p1c3s3j2_13 <- user(0.0003)
  ss_p1c3s3j3_13 <- user(0.0003)
  ss_p1c3s3j4_13 <- user(0.0003)
  ss_p1c4s1j1_13 <- user(0.0003)
  ss_p1c4s1j2_13 <- user(0.0003)
  ss_p1c4s1j3_13 <- user(0.0003)
  ss_p1c4s1j4_13 <- user(0.0003)
  ss_p1c4s2j1_13 <- user(0.0003)
  ss_p1c4s2j2_13 <- user(0.0003)
  ss_p1c4s2j3_13 <- user(0.0003)
  ss_p1c4s2j4_13 <- user(0.0003)
  ss_p1c4s3j1_13 <- user(0.0003)
  ss_p1c4s3j2_13 <- user(0.0003)
  ss_p1c4s3j3_13 <- user(0.0003)
  ss_p1c4s3j4_13 <- user(0.0003)
  ss_p2c1s1j1_13 <- user(0.0003)
  ss_p2c1s1j2_13 <- user(0.0003)
  ss_p2c1s1j3_13 <- user(0.0003)
  ss_p2c1s1j4_13 <- user(0.0003)
  ss_p2c1s2j1_13 <- user(0.0003)
  ss_p2c1s2j2_13 <- user(0.0003)
  ss_p2c1s2j3_13 <- user(0.0003)
  ss_p2c1s2j4_13 <- user(0.0003)
  ss_p2c1s3j1_13 <- user(0.0003)
  ss_p2c1s3j2_13 <- user(0.0003)
  ss_p2c1s3j3_13 <- user(0.0003)
  ss_p2c1s3j4_13 <- user(0.0003)
  ss_p2c2s1j1_13 <- user(0.0003)
  ss_p2c2s1j2_13 <- user(0.0003)
  ss_p2c2s1j3_13 <- user(0.0003)
  ss_p2c2s1j4_13 <- user(0.0003)
  ss_p2c2s2j1_13 <- user(0.0003)
  ss_p2c2s2j2_13 <- user(0.0003)
  ss_p2c2s2j3_13 <- user(0.0003)
  ss_p2c2s2j4_13 <- user(0.0003)
  ss_p2c2s3j1_13 <- user(0.0003)
  ss_p2c2s3j2_13 <- user(0.0003)
  ss_p2c2s3j3_13 <- user(0.0003)
  ss_p2c2s3j4_13 <- user(0.0003)
  ss_p2c3s1j1_13 <- user(0.0003)
  ss_p2c3s1j2_13 <- user(0.0003)
  ss_p2c3s1j3_13 <- user(0.0003)
  ss_p2c3s1j4_13 <- user(0.0003)
  ss_p2c3s2j1_13 <- user(0.0003)
  ss_p2c3s2j2_13 <- user(0.0003)
  ss_p2c3s2j3_13 <- user(0.0003)
  ss_p2c3s2j4_13 <- user(0.0003)
  ss_p2c3s3j1_13 <- user(0.0003)
  ss_p2c3s3j2_13 <- user(0.0003)
  ss_p2c3s3j3_13 <- user(0.0003)
  ss_p2c3s3j4_13 <- user(0.0003)
  ss_p2c4s1j1_13 <- user(0.0003)
  ss_p2c4s1j2_13 <- user(0.0003)
  ss_p2c4s1j3_13 <- user(0.0003)
  ss_p2c4s1j4_13 <- user(0.0003)
  ss_p2c4s2j1_13 <- user(0.0003)
  ss_p2c4s2j2_13 <- user(0.0003)
  ss_p2c4s2j3_13 <- user(0.0003)
  ss_p2c4s2j4_13 <- user(0.0003)
  ss_p2c4s3j1_13 <- user(0.0003)
  ss_p2c4s3j2_13 <- user(0.0003)
  ss_p2c4s3j3_13 <- user(0.0003)
  ss_p2c4s3j4_13 <- user(0.0003)
  ss_p1c1s1j1_14 <- user(0.0003)
  ss_p1c1s1j2_14 <- user(0.0003)
  ss_p1c1s1j3_14 <- user(0.0003)
  ss_p1c1s1j4_14 <- user(0.0003)
  ss_p1c1s2j1_14 <- user(0.0003)
  ss_p1c1s2j2_14 <- user(0.0003)
  ss_p1c1s2j3_14 <- user(0.0003)
  ss_p1c1s2j4_14 <- user(0.0003)
  ss_p1c1s3j1_14 <- user(0.0003)
  ss_p1c1s3j2_14 <- user(0.0003)
  ss_p1c1s3j3_14 <- user(0.0003)
  ss_p1c1s3j4_14 <- user(0.0003)
  ss_p1c2s1j1_14 <- user(0.0003)
  ss_p1c2s1j2_14 <- user(0.0003)
  ss_p1c2s1j3_14 <- user(0.0003)
  ss_p1c2s1j4_14 <- user(0.0003)
  ss_p1c2s2j1_14 <- user(0.0003)
  ss_p1c2s2j2_14 <- user(0.0003)
  ss_p1c2s2j3_14 <- user(0.0003)
  ss_p1c2s2j4_14 <- user(0.0003)
  ss_p1c2s3j1_14 <- user(0.0003)
  ss_p1c2s3j2_14 <- user(0.0003)
  ss_p1c2s3j3_14 <- user(0.0003)
  ss_p1c2s3j4_14 <- user(0.0003)
  ss_p1c3s1j1_14 <- user(0.0003)
  ss_p1c3s1j2_14 <- user(0.0003)
  ss_p1c3s1j3_14 <- user(0.0003)
  ss_p1c3s1j4_14 <- user(0.0003)
  ss_p1c3s2j1_14 <- user(0.0003)
  ss_p1c3s2j2_14 <- user(0.0003)
  ss_p1c3s2j3_14 <- user(0.0003)
  ss_p1c3s2j4_14 <- user(0.0003)
  ss_p1c3s3j1_14 <- user(0.0003)
  ss_p1c3s3j2_14 <- user(0.0003)
  ss_p1c3s3j3_14 <- user(0.0003)
  ss_p1c3s3j4_14 <- user(0.0003)
  ss_p1c4s1j1_14 <- user(0.0003)
  ss_p1c4s1j2_14 <- user(0.0003)
  ss_p1c4s1j3_14 <- user(0.0003)
  ss_p1c4s1j4_14 <- user(0.0003)
  ss_p1c4s2j1_14 <- user(0.0003)
  ss_p1c4s2j2_14 <- user(0.0003)
  ss_p1c4s2j3_14 <- user(0.0003)
  ss_p1c4s2j4_14 <- user(0.0003)
  ss_p1c4s3j1_14 <- user(0.0003)
  ss_p1c4s3j2_14 <- user(0.0003)
  ss_p1c4s3j3_14 <- user(0.0003)
  ss_p1c4s3j4_14 <- user(0.0003)
  ss_p2c1s1j1_14 <- user(0.0003)
  ss_p2c1s1j2_14 <- user(0.0003)
  ss_p2c1s1j3_14 <- user(0.0003)
  ss_p2c1s1j4_14 <- user(0.0003)
  ss_p2c1s2j1_14 <- user(0.0003)
  ss_p2c1s2j2_14 <- user(0.0003)
  ss_p2c1s2j3_14 <- user(0.0003)
  ss_p2c1s2j4_14 <- user(0.0003)
  ss_p2c1s3j1_14 <- user(0.0003)
  ss_p2c1s3j2_14 <- user(0.0003)
  ss_p2c1s3j3_14 <- user(0.0003)
  ss_p2c1s3j4_14 <- user(0.0003)
  ss_p2c2s1j1_14 <- user(0.0003)
  ss_p2c2s1j2_14 <- user(0.0003)
  ss_p2c2s1j3_14 <- user(0.0003)
  ss_p2c2s1j4_14 <- user(0.0003)
  ss_p2c2s2j1_14 <- user(0.0003)
  ss_p2c2s2j2_14 <- user(0.0003)
  ss_p2c2s2j3_14 <- user(0.0003)
  ss_p2c2s2j4_14 <- user(0.0003)
  ss_p2c2s3j1_14 <- user(0.0003)
  ss_p2c2s3j2_14 <- user(0.0003)
  ss_p2c2s3j3_14 <- user(0.0003)
  ss_p2c2s3j4_14 <- user(0.0003)
  ss_p2c3s1j1_14 <- user(0.0003)
  ss_p2c3s1j2_14 <- user(0.0003)
  ss_p2c3s1j3_14 <- user(0.0003)
  ss_p2c3s1j4_14 <- user(0.0003)
  ss_p2c3s2j1_14 <- user(0.0003)
  ss_p2c3s2j2_14 <- user(0.0003)
  ss_p2c3s2j3_14 <- user(0.0003)
  ss_p2c3s2j4_14 <- user(0.0003)
  ss_p2c3s3j1_14 <- user(0.0003)
  ss_p2c3s3j2_14 <- user(0.0003)
  ss_p2c3s3j3_14 <- user(0.0003)
  ss_p2c3s3j4_14 <- user(0.0003)
  ss_p2c4s1j1_14 <- user(0.0003)
  ss_p2c4s1j2_14 <- user(0.0003)
  ss_p2c4s1j3_14 <- user(0.0003)
  ss_p2c4s1j4_14 <- user(0.0003)
  ss_p2c4s2j1_14 <- user(0.0003)
  ss_p2c4s2j2_14 <- user(0.0003)
  ss_p2c4s2j3_14 <- user(0.0003)
  ss_p2c4s2j4_14 <- user(0.0003)
  ss_p2c4s3j1_14 <- user(0.0003)
  ss_p2c4s3j2_14 <- user(0.0003)
  ss_p2c4s3j3_14 <- user(0.0003)
  ss_p2c4s3j4_14 <- user(0.0003)
  ss_p1c1s1j1_15 <- user(0.0003)
  ss_p1c1s1j2_15 <- user(0.0003)
  ss_p1c1s1j3_15 <- user(0.0003)
  ss_p1c1s1j4_15 <- user(0.0003)
  ss_p1c1s2j1_15 <- user(0.0003)
  ss_p1c1s2j2_15 <- user(0.0003)
  ss_p1c1s2j3_15 <- user(0.0003)
  ss_p1c1s2j4_15 <- user(0.0003)
  ss_p1c1s3j1_15 <- user(0.0003)
  ss_p1c1s3j2_15 <- user(0.0003)
  ss_p1c1s3j3_15 <- user(0.0003)
  ss_p1c1s3j4_15 <- user(0.0003)
  ss_p1c2s1j1_15 <- user(0.0003)
  ss_p1c2s1j2_15 <- user(0.0003)
  ss_p1c2s1j3_15 <- user(0.0003)
  ss_p1c2s1j4_15 <- user(0.0003)
  ss_p1c2s2j1_15 <- user(0.0003)
  ss_p1c2s2j2_15 <- user(0.0003)
  ss_p1c2s2j3_15 <- user(0.0003)
  ss_p1c2s2j4_15 <- user(0.0003)
  ss_p1c2s3j1_15 <- user(0.0003)
  ss_p1c2s3j2_15 <- user(0.0003)
  ss_p1c2s3j3_15 <- user(0.0003)
  ss_p1c2s3j4_15 <- user(0.0003)
  ss_p1c3s1j1_15 <- user(0.0003)
  ss_p1c3s1j2_15 <- user(0.0003)
  ss_p1c3s1j3_15 <- user(0.0003)
  ss_p1c3s1j4_15 <- user(0.0003)
  ss_p1c3s2j1_15 <- user(0.0003)
  ss_p1c3s2j2_15 <- user(0.0003)
  ss_p1c3s2j3_15 <- user(0.0003)
  ss_p1c3s2j4_15 <- user(0.0003)
  ss_p1c3s3j1_15 <- user(0.0003)
  ss_p1c3s3j2_15 <- user(0.0003)
  ss_p1c3s3j3_15 <- user(0.0003)
  ss_p1c3s3j4_15 <- user(0.0003)
  ss_p1c4s1j1_15 <- user(0.0003)
  ss_p1c4s1j2_15 <- user(0.0003)
  ss_p1c4s1j3_15 <- user(0.0003)
  ss_p1c4s1j4_15 <- user(0.0003)
  ss_p1c4s2j1_15 <- user(0.0003)
  ss_p1c4s2j2_15 <- user(0.0003)
  ss_p1c4s2j3_15 <- user(0.0003)
  ss_p1c4s2j4_15 <- user(0.0003)
  ss_p1c4s3j1_15 <- user(0.0003)
  ss_p1c4s3j2_15 <- user(0.0003)
  ss_p1c4s3j3_15 <- user(0.0003)
  ss_p1c4s3j4_15 <- user(0.0003)
  ss_p2c1s1j1_15 <- user(0.0003)
  ss_p2c1s1j2_15 <- user(0.0003)
  ss_p2c1s1j3_15 <- user(0.0003)
  ss_p2c1s1j4_15 <- user(0.0003)
  ss_p2c1s2j1_15 <- user(0.0003)
  ss_p2c1s2j2_15 <- user(0.0003)
  ss_p2c1s2j3_15 <- user(0.0003)
  ss_p2c1s2j4_15 <- user(0.0003)
  ss_p2c1s3j1_15 <- user(0.0003)
  ss_p2c1s3j2_15 <- user(0.0003)
  ss_p2c1s3j3_15 <- user(0.0003)
  ss_p2c1s3j4_15 <- user(0.0003)
  ss_p2c2s1j1_15 <- user(0.0003)
  ss_p2c2s1j2_15 <- user(0.0003)
  ss_p2c2s1j3_15 <- user(0.0003)
  ss_p2c2s1j4_15 <- user(0.0003)
  ss_p2c2s2j1_15 <- user(0.0003)
  ss_p2c2s2j2_15 <- user(0.0003)
  ss_p2c2s2j3_15 <- user(0.0003)
  ss_p2c2s2j4_15 <- user(0.0003)
  ss_p2c2s3j1_15 <- user(0.0003)
  ss_p2c2s3j2_15 <- user(0.0003)
  ss_p2c2s3j3_15 <- user(0.0003)
  ss_p2c2s3j4_15 <- user(0.0003)
  ss_p2c3s1j1_15 <- user(0.0003)
  ss_p2c3s1j2_15 <- user(0.0003)
  ss_p2c3s1j3_15 <- user(0.0003)
  ss_p2c3s1j4_15 <- user(0.0003)
  ss_p2c3s2j1_15 <- user(0.0003)
  ss_p2c3s2j2_15 <- user(0.0003)
  ss_p2c3s2j3_15 <- user(0.0003)
  ss_p2c3s2j4_15 <- user(0.0003)
  ss_p2c3s3j1_15 <- user(0.0003)
  ss_p2c3s3j2_15 <- user(0.0003)
  ss_p2c3s3j3_15 <- user(0.0003)
  ss_p2c3s3j4_15 <- user(0.0003)
  ss_p2c4s1j1_15 <- user(0.0003)
  ss_p2c4s1j2_15 <- user(0.0003)
  ss_p2c4s1j3_15 <- user(0.0003)
  ss_p2c4s1j4_15 <- user(0.0003)
  ss_p2c4s2j1_15 <- user(0.0003)
  ss_p2c4s2j2_15 <- user(0.0003)
  ss_p2c4s2j3_15 <- user(0.0003)
  ss_p2c4s2j4_15 <- user(0.0003)
  ss_p2c4s3j1_15 <- user(0.0003)
  ss_p2c4s3j2_15 <- user(0.0003)
  ss_p2c4s3j3_15 <- user(0.0003)
  ss_p2c4s3j4_15 <- user(0.0003)
  ss_p1c1s1j1_16 <- user(0.0003)
  ss_p1c1s1j2_16 <- user(0.0003)
  ss_p1c1s1j3_16 <- user(0.0003)
  ss_p1c1s1j4_16 <- user(0.0003)
  ss_p1c1s2j1_16 <- user(0.0003)
  ss_p1c1s2j2_16 <- user(0.0003)
  ss_p1c1s2j3_16 <- user(0.0003)
  ss_p1c1s2j4_16 <- user(0.0003)
  ss_p1c1s3j1_16 <- user(0.0003)
  ss_p1c1s3j2_16 <- user(0.0003)
  ss_p1c1s3j3_16 <- user(0.0003)
  ss_p1c1s3j4_16 <- user(0.0003)
  ss_p1c2s1j1_16 <- user(0.0003)
  ss_p1c2s1j2_16 <- user(0.0003)
  ss_p1c2s1j3_16 <- user(0.0003)
  ss_p1c2s1j4_16 <- user(0.0003)
  ss_p1c2s2j1_16 <- user(0.0003)
  ss_p1c2s2j2_16 <- user(0.0003)
  ss_p1c2s2j3_16 <- user(0.0003)
  ss_p1c2s2j4_16 <- user(0.0003)
  ss_p1c2s3j1_16 <- user(0.0003)
  ss_p1c2s3j2_16 <- user(0.0003)
  ss_p1c2s3j3_16 <- user(0.0003)
  ss_p1c2s3j4_16 <- user(0.0003)
  ss_p1c3s1j1_16 <- user(0.0003)
  ss_p1c3s1j2_16 <- user(0.0003)
  ss_p1c3s1j3_16 <- user(0.0003)
  ss_p1c3s1j4_16 <- user(0.0003)
  ss_p1c3s2j1_16 <- user(0.0003)
  ss_p1c3s2j2_16 <- user(0.0003)
  ss_p1c3s2j3_16 <- user(0.0003)
  ss_p1c3s2j4_16 <- user(0.0003)
  ss_p1c3s3j1_16 <- user(0.0003)
  ss_p1c3s3j2_16 <- user(0.0003)
  ss_p1c3s3j3_16 <- user(0.0003)
  ss_p1c3s3j4_16 <- user(0.0003)
  ss_p1c4s1j1_16 <- user(0.0003)
  ss_p1c4s1j2_16 <- user(0.0003)
  ss_p1c4s1j3_16 <- user(0.0003)
  ss_p1c4s1j4_16 <- user(0.0003)
  ss_p1c4s2j1_16 <- user(0.0003)
  ss_p1c4s2j2_16 <- user(0.0003)
  ss_p1c4s2j3_16 <- user(0.0003)
  ss_p1c4s2j4_16 <- user(0.0003)
  ss_p1c4s3j1_16 <- user(0.0003)
  ss_p1c4s3j2_16 <- user(0.0003)
  ss_p1c4s3j3_16 <- user(0.0003)
  ss_p1c4s3j4_16 <- user(0.0003)
  ss_p2c1s1j1_16 <- user(0.0003)
  ss_p2c1s1j2_16 <- user(0.0003)
  ss_p2c1s1j3_16 <- user(0.0003)
  ss_p2c1s1j4_16 <- user(0.0003)
  ss_p2c1s2j1_16 <- user(0.0003)
  ss_p2c1s2j2_16 <- user(0.0003)
  ss_p2c1s2j3_16 <- user(0.0003)
  ss_p2c1s2j4_16 <- user(0.0003)
  ss_p2c1s3j1_16 <- user(0.0003)
  ss_p2c1s3j2_16 <- user(0.0003)
  ss_p2c1s3j3_16 <- user(0.0003)
  ss_p2c1s3j4_16 <- user(0.0003)
  ss_p2c2s1j1_16 <- user(0.0003)
  ss_p2c2s1j2_16 <- user(0.0003)
  ss_p2c2s1j3_16 <- user(0.0003)
  ss_p2c2s1j4_16 <- user(0.0003)
  ss_p2c2s2j1_16 <- user(0.0003)
  ss_p2c2s2j2_16 <- user(0.0003)
  ss_p2c2s2j3_16 <- user(0.0003)
  ss_p2c2s2j4_16 <- user(0.0003)
  ss_p2c2s3j1_16 <- user(0.0003)
  ss_p2c2s3j2_16 <- user(0.0003)
  ss_p2c2s3j3_16 <- user(0.0003)
  ss_p2c2s3j4_16 <- user(0.0003)
  ss_p2c3s1j1_16 <- user(0.0003)
  ss_p2c3s1j2_16 <- user(0.0003)
  ss_p2c3s1j3_16 <- user(0.0003)
  ss_p2c3s1j4_16 <- user(0.0003)
  ss_p2c3s2j1_16 <- user(0.0003)
  ss_p2c3s2j2_16 <- user(0.0003)
  ss_p2c3s2j3_16 <- user(0.0003)
  ss_p2c3s2j4_16 <- user(0.0003)
  ss_p2c3s3j1_16 <- user(0.0003)
  ss_p2c3s3j2_16 <- user(0.0003)
  ss_p2c3s3j3_16 <- user(0.0003)
  ss_p2c3s3j4_16 <- user(0.0003)
  ss_p2c4s1j1_16 <- user(0.0003)
  ss_p2c4s1j2_16 <- user(0.0003)
  ss_p2c4s1j3_16 <- user(0.0003)
  ss_p2c4s1j4_16 <- user(0.0003)
  ss_p2c4s2j1_16 <- user(0.0003)
  ss_p2c4s2j2_16 <- user(0.0003)
  ss_p2c4s2j3_16 <- user(0.0003)
  ss_p2c4s2j4_16 <- user(0.0003)
  ss_p2c4s3j1_16 <- user(0.0003)
  ss_p2c4s3j2_16 <- user(0.0003)
  ss_p2c4s3j3_16 <- user(0.0003)
  ss_p2c4s3j4_16 <- user(0.0003)
  ss_p1c1s1j1_17 <- user(0.0003)
  ss_p1c1s1j2_17 <- user(0.0003)
  ss_p1c1s1j3_17 <- user(0.0003)
  ss_p1c1s1j4_17 <- user(0.0003)
  ss_p1c1s2j1_17 <- user(0.0003)
  ss_p1c1s2j2_17 <- user(0.0003)
  ss_p1c1s2j3_17 <- user(0.0003)
  ss_p1c1s2j4_17 <- user(0.0003)
  ss_p1c1s3j1_17 <- user(0.0003)
  ss_p1c1s3j2_17 <- user(0.0003)
  ss_p1c1s3j3_17 <- user(0.0003)
  ss_p1c1s3j4_17 <- user(0.0003)
  ss_p1c2s1j1_17 <- user(0.0003)
  ss_p1c2s1j2_17 <- user(0.0003)
  ss_p1c2s1j3_17 <- user(0.0003)
  ss_p1c2s1j4_17 <- user(0.0003)
  ss_p1c2s2j1_17 <- user(0.0003)
  ss_p1c2s2j2_17 <- user(0.0003)
  ss_p1c2s2j3_17 <- user(0.0003)
  ss_p1c2s2j4_17 <- user(0.0003)
  ss_p1c2s3j1_17 <- user(0.0003)
  ss_p1c2s3j2_17 <- user(0.0003)
  ss_p1c2s3j3_17 <- user(0.0003)
  ss_p1c2s3j4_17 <- user(0.0003)
  ss_p1c3s1j1_17 <- user(0.0003)
  ss_p1c3s1j2_17 <- user(0.0003)
  ss_p1c3s1j3_17 <- user(0.0003)
  ss_p1c3s1j4_17 <- user(0.0003)
  ss_p1c3s2j1_17 <- user(0.0003)
  ss_p1c3s2j2_17 <- user(0.0003)
  ss_p1c3s2j3_17 <- user(0.0003)
  ss_p1c3s2j4_17 <- user(0.0003)
  ss_p1c3s3j1_17 <- user(0.0003)
  ss_p1c3s3j2_17 <- user(0.0003)
  ss_p1c3s3j3_17 <- user(0.0003)
  ss_p1c3s3j4_17 <- user(0.0003)
  ss_p1c4s1j1_17 <- user(0.0003)
  ss_p1c4s1j2_17 <- user(0.0003)
  ss_p1c4s1j3_17 <- user(0.0003)
  ss_p1c4s1j4_17 <- user(0.0003)
  ss_p1c4s2j1_17 <- user(0.0003)
  ss_p1c4s2j2_17 <- user(0.0003)
  ss_p1c4s2j3_17 <- user(0.0003)
  ss_p1c4s2j4_17 <- user(0.0003)
  ss_p1c4s3j1_17 <- user(0.0003)
  ss_p1c4s3j2_17 <- user(0.0003)
  ss_p1c4s3j3_17 <- user(0.0003)
  ss_p1c4s3j4_17 <- user(0.0003)
  ss_p2c1s1j1_17 <- user(0.0003)
  ss_p2c1s1j2_17 <- user(0.0003)
  ss_p2c1s1j3_17 <- user(0.0003)
  ss_p2c1s1j4_17 <- user(0.0003)
  ss_p2c1s2j1_17 <- user(0.0003)
  ss_p2c1s2j2_17 <- user(0.0003)
  ss_p2c1s2j3_17 <- user(0.0003)
  ss_p2c1s2j4_17 <- user(0.0003)
  ss_p2c1s3j1_17 <- user(0.0003)
  ss_p2c1s3j2_17 <- user(0.0003)
  ss_p2c1s3j3_17 <- user(0.0003)
  ss_p2c1s3j4_17 <- user(0.0003)
  ss_p2c2s1j1_17 <- user(0.0003)
  ss_p2c2s1j2_17 <- user(0.0003)
  ss_p2c2s1j3_17 <- user(0.0003)
  ss_p2c2s1j4_17 <- user(0.0003)
  ss_p2c2s2j1_17 <- user(0.0003)
  ss_p2c2s2j2_17 <- user(0.0003)
  ss_p2c2s2j3_17 <- user(0.0003)
  ss_p2c2s2j4_17 <- user(0.0003)
  ss_p2c2s3j1_17 <- user(0.0003)
  ss_p2c2s3j2_17 <- user(0.0003)
  ss_p2c2s3j3_17 <- user(0.0003)
  ss_p2c2s3j4_17 <- user(0.0003)
  ss_p2c3s1j1_17 <- user(0.0003)
  ss_p2c3s1j2_17 <- user(0.0003)
  ss_p2c3s1j3_17 <- user(0.0003)
  ss_p2c3s1j4_17 <- user(0.0003)
  ss_p2c3s2j1_17 <- user(0.0003)
  ss_p2c3s2j2_17 <- user(0.0003)
  ss_p2c3s2j3_17 <- user(0.0003)
  ss_p2c3s2j4_17 <- user(0.0003)
  ss_p2c3s3j1_17 <- user(0.0003)
  ss_p2c3s3j2_17 <- user(0.0003)
  ss_p2c3s3j3_17 <- user(0.0003)
  ss_p2c3s3j4_17 <- user(0.0003)
  ss_p2c4s1j1_17 <- user(0.0003)
  ss_p2c4s1j2_17 <- user(0.0003)
  ss_p2c4s1j3_17 <- user(0.0003)
  ss_p2c4s1j4_17 <- user(0.0003)
  ss_p2c4s2j1_17 <- user(0.0003)
  ss_p2c4s2j2_17 <- user(0.0003)
  ss_p2c4s2j3_17 <- user(0.0003)
  ss_p2c4s2j4_17 <- user(0.0003)
  ss_p2c4s3j1_17 <- user(0.0003)
  ss_p2c4s3j2_17 <- user(0.0003)
  ss_p2c4s3j3_17 <- user(0.0003)
  ss_p2c4s3j4_17 <- user(0.0003)
  
  
  
  
  
  
  ##############################################################################################################################
  ## Delays ####################################################################
  ##############################################################################################################################
  
  P1C1S1J1_10_lag <- delay(P1C1S1J1_10, tau)
  P1C1S1J2_10_lag <- delay(P1C1S1J2_10, tau)
  P1C1S1J3_10_lag <- delay(P1C1S1J3_10, tau)
  P1C1S1J4_10_lag <- delay(P1C1S1J4_10, tau)
  P1C1S2J1_10_lag <- delay(P1C1S2J1_10, tau)
  P1C1S2J2_10_lag <- delay(P1C1S2J2_10, tau)
  P1C1S2J3_10_lag <- delay(P1C1S2J3_10, tau)
  P1C1S2J4_10_lag <- delay(P1C1S2J4_10, tau)
  P1C1S3J1_10_lag <- delay(P1C1S3J1_10, tau)
  P1C1S3J2_10_lag <- delay(P1C1S3J2_10, tau)
  P1C1S3J3_10_lag <- delay(P1C1S3J3_10, tau)
  P1C1S3J4_10_lag <- delay(P1C1S3J4_10, tau)
  P1C2S1J1_10_lag <- delay(P1C2S1J1_10, tau)
  P1C2S1J2_10_lag <- delay(P1C2S1J2_10, tau)
  P1C2S1J3_10_lag <- delay(P1C2S1J3_10, tau)
  P1C2S1J4_10_lag <- delay(P1C2S1J4_10, tau)
  P1C2S2J1_10_lag <- delay(P1C2S2J1_10, tau)
  P1C2S2J2_10_lag <- delay(P1C2S2J2_10, tau)
  P1C2S2J3_10_lag <- delay(P1C2S2J3_10, tau)
  P1C2S2J4_10_lag <- delay(P1C2S2J4_10, tau)
  P1C2S3J1_10_lag <- delay(P1C2S3J1_10, tau)
  P1C2S3J2_10_lag <- delay(P1C2S3J2_10, tau)
  P1C2S3J3_10_lag <- delay(P1C2S3J3_10, tau)
  P1C2S3J4_10_lag <- delay(P1C2S3J4_10, tau)
  P1C3S1J1_10_lag <- delay(P1C3S1J1_10, tau)
  P1C3S1J2_10_lag <- delay(P1C3S1J2_10, tau)
  P1C3S1J3_10_lag <- delay(P1C3S1J3_10, tau)
  P1C3S1J4_10_lag <- delay(P1C3S1J4_10, tau)
  P1C3S2J1_10_lag <- delay(P1C3S2J1_10, tau)
  P1C3S2J2_10_lag <- delay(P1C3S2J2_10, tau)
  P1C3S2J3_10_lag <- delay(P1C3S2J3_10, tau)
  P1C3S2J4_10_lag <- delay(P1C3S2J4_10, tau)
  P1C3S3J1_10_lag <- delay(P1C3S3J1_10, tau)
  P1C3S3J2_10_lag <- delay(P1C3S3J2_10, tau)
  P1C3S3J3_10_lag <- delay(P1C3S3J3_10, tau)
  P1C3S3J4_10_lag <- delay(P1C3S3J4_10, tau)
  P1C4S1J1_10_lag <- delay(P1C4S1J1_10, tau)
  P1C4S1J2_10_lag <- delay(P1C4S1J2_10, tau)
  P1C4S1J3_10_lag <- delay(P1C4S1J3_10, tau)
  P1C4S1J4_10_lag <- delay(P1C4S1J4_10, tau)
  P1C4S2J1_10_lag <- delay(P1C4S2J1_10, tau)
  P1C4S2J2_10_lag <- delay(P1C4S2J2_10, tau)
  P1C4S2J3_10_lag <- delay(P1C4S2J3_10, tau)
  P1C4S2J4_10_lag <- delay(P1C4S2J4_10, tau)
  P1C4S3J1_10_lag <- delay(P1C4S3J1_10, tau)
  P1C4S3J2_10_lag <- delay(P1C4S3J2_10, tau)
  P1C4S3J3_10_lag <- delay(P1C4S3J3_10, tau)
  P1C4S3J4_10_lag <- delay(P1C4S3J4_10, tau)
  P2C1S1J1_10_lag <- delay(P2C1S1J1_10, tau)
  P2C1S1J2_10_lag <- delay(P2C1S1J2_10, tau)
  P2C1S1J3_10_lag <- delay(P2C1S1J3_10, tau)
  P2C1S1J4_10_lag <- delay(P2C1S1J4_10, tau)
  P2C1S2J1_10_lag <- delay(P2C1S2J1_10, tau)
  P2C1S2J2_10_lag <- delay(P2C1S2J2_10, tau)
  P2C1S2J3_10_lag <- delay(P2C1S2J3_10, tau)
  P2C1S2J4_10_lag <- delay(P2C1S2J4_10, tau)
  P2C1S3J1_10_lag <- delay(P2C1S3J1_10, tau)
  P2C1S3J2_10_lag <- delay(P2C1S3J2_10, tau)
  P2C1S3J3_10_lag <- delay(P2C1S3J3_10, tau)
  P2C1S3J4_10_lag <- delay(P2C1S3J4_10, tau)
  P2C2S1J1_10_lag <- delay(P2C2S1J1_10, tau)
  P2C2S1J2_10_lag <- delay(P2C2S1J2_10, tau)
  P2C2S1J3_10_lag <- delay(P2C2S1J3_10, tau)
  P2C2S1J4_10_lag <- delay(P2C2S1J4_10, tau)
  P2C2S2J1_10_lag <- delay(P2C2S2J1_10, tau)
  P2C2S2J2_10_lag <- delay(P2C2S2J2_10, tau)
  P2C2S2J3_10_lag <- delay(P2C2S2J3_10, tau)
  P2C2S2J4_10_lag <- delay(P2C2S2J4_10, tau)
  P2C2S3J1_10_lag <- delay(P2C2S3J1_10, tau)
  P2C2S3J2_10_lag <- delay(P2C2S3J2_10, tau)
  P2C2S3J3_10_lag <- delay(P2C2S3J3_10, tau)
  P2C2S3J4_10_lag <- delay(P2C2S3J4_10, tau)
  P2C3S1J1_10_lag <- delay(P2C3S1J1_10, tau)
  P2C3S1J2_10_lag <- delay(P2C3S1J2_10, tau)
  P2C3S1J3_10_lag <- delay(P2C3S1J3_10, tau)
  P2C3S1J4_10_lag <- delay(P2C3S1J4_10, tau)
  P2C3S2J1_10_lag <- delay(P2C3S2J1_10, tau)
  P2C3S2J2_10_lag <- delay(P2C3S2J2_10, tau)
  P2C3S2J3_10_lag <- delay(P2C3S2J3_10, tau)
  P2C3S2J4_10_lag <- delay(P2C3S2J4_10, tau)
  P2C3S3J1_10_lag <- delay(P2C3S3J1_10, tau)
  P2C3S3J2_10_lag <- delay(P2C3S3J2_10, tau)
  P2C3S3J3_10_lag <- delay(P2C3S3J3_10, tau)
  P2C3S3J4_10_lag <- delay(P2C3S3J4_10, tau)
  P2C4S1J1_10_lag <- delay(P2C4S1J1_10, tau)
  P2C4S1J2_10_lag <- delay(P2C4S1J2_10, tau)
  P2C4S1J3_10_lag <- delay(P2C4S1J3_10, tau)
  P2C4S1J4_10_lag <- delay(P2C4S1J4_10, tau)
  P2C4S2J1_10_lag <- delay(P2C4S2J1_10, tau)
  P2C4S2J2_10_lag <- delay(P2C4S2J2_10, tau)
  P2C4S2J3_10_lag <- delay(P2C4S2J3_10, tau)
  P2C4S2J4_10_lag <- delay(P2C4S2J4_10, tau)
  P2C4S3J1_10_lag <- delay(P2C4S3J1_10, tau)
  P2C4S3J2_10_lag <- delay(P2C4S3J2_10, tau)
  P2C4S3J3_10_lag <- delay(P2C4S3J3_10, tau)
  P2C4S3J4_10_lag <- delay(P2C4S3J4_10, tau)
  P1C1S1J1_11_lag <- delay(P1C1S1J1_11, tau)
  P1C1S1J2_11_lag <- delay(P1C1S1J2_11, tau)
  P1C1S1J3_11_lag <- delay(P1C1S1J3_11, tau)
  P1C1S1J4_11_lag <- delay(P1C1S1J4_11, tau)
  P1C1S2J1_11_lag <- delay(P1C1S2J1_11, tau)
  P1C1S2J2_11_lag <- delay(P1C1S2J2_11, tau)
  P1C1S2J3_11_lag <- delay(P1C1S2J3_11, tau)
  P1C1S2J4_11_lag <- delay(P1C1S2J4_11, tau)
  P1C1S3J1_11_lag <- delay(P1C1S3J1_11, tau)
  P1C1S3J2_11_lag <- delay(P1C1S3J2_11, tau)
  P1C1S3J3_11_lag <- delay(P1C1S3J3_11, tau)
  P1C1S3J4_11_lag <- delay(P1C1S3J4_11, tau)
  P1C2S1J1_11_lag <- delay(P1C2S1J1_11, tau)
  P1C2S1J2_11_lag <- delay(P1C2S1J2_11, tau)
  P1C2S1J3_11_lag <- delay(P1C2S1J3_11, tau)
  P1C2S1J4_11_lag <- delay(P1C2S1J4_11, tau)
  P1C2S2J1_11_lag <- delay(P1C2S2J1_11, tau)
  P1C2S2J2_11_lag <- delay(P1C2S2J2_11, tau)
  P1C2S2J3_11_lag <- delay(P1C2S2J3_11, tau)
  P1C2S2J4_11_lag <- delay(P1C2S2J4_11, tau)
  P1C2S3J1_11_lag <- delay(P1C2S3J1_11, tau)
  P1C2S3J2_11_lag <- delay(P1C2S3J2_11, tau)
  P1C2S3J3_11_lag <- delay(P1C2S3J3_11, tau)
  P1C2S3J4_11_lag <- delay(P1C2S3J4_11, tau)
  P1C3S1J1_11_lag <- delay(P1C3S1J1_11, tau)
  P1C3S1J2_11_lag <- delay(P1C3S1J2_11, tau)
  P1C3S1J3_11_lag <- delay(P1C3S1J3_11, tau)
  P1C3S1J4_11_lag <- delay(P1C3S1J4_11, tau)
  P1C3S2J1_11_lag <- delay(P1C3S2J1_11, tau)
  P1C3S2J2_11_lag <- delay(P1C3S2J2_11, tau)
  P1C3S2J3_11_lag <- delay(P1C3S2J3_11, tau)
  P1C3S2J4_11_lag <- delay(P1C3S2J4_11, tau)
  P1C3S3J1_11_lag <- delay(P1C3S3J1_11, tau)
  P1C3S3J2_11_lag <- delay(P1C3S3J2_11, tau)
  P1C3S3J3_11_lag <- delay(P1C3S3J3_11, tau)
  P1C3S3J4_11_lag <- delay(P1C3S3J4_11, tau)
  P1C4S1J1_11_lag <- delay(P1C4S1J1_11, tau)
  P1C4S1J2_11_lag <- delay(P1C4S1J2_11, tau)
  P1C4S1J3_11_lag <- delay(P1C4S1J3_11, tau)
  P1C4S1J4_11_lag <- delay(P1C4S1J4_11, tau)
  P1C4S2J1_11_lag <- delay(P1C4S2J1_11, tau)
  P1C4S2J2_11_lag <- delay(P1C4S2J2_11, tau)
  P1C4S2J3_11_lag <- delay(P1C4S2J3_11, tau)
  P1C4S2J4_11_lag <- delay(P1C4S2J4_11, tau)
  P1C4S3J1_11_lag <- delay(P1C4S3J1_11, tau)
  P1C4S3J2_11_lag <- delay(P1C4S3J2_11, tau)
  P1C4S3J3_11_lag <- delay(P1C4S3J3_11, tau)
  P1C4S3J4_11_lag <- delay(P1C4S3J4_11, tau)
  P2C1S1J1_11_lag <- delay(P2C1S1J1_11, tau)
  P2C1S1J2_11_lag <- delay(P2C1S1J2_11, tau)
  P2C1S1J3_11_lag <- delay(P2C1S1J3_11, tau)
  P2C1S1J4_11_lag <- delay(P2C1S1J4_11, tau)
  P2C1S2J1_11_lag <- delay(P2C1S2J1_11, tau)
  P2C1S2J2_11_lag <- delay(P2C1S2J2_11, tau)
  P2C1S2J3_11_lag <- delay(P2C1S2J3_11, tau)
  P2C1S2J4_11_lag <- delay(P2C1S2J4_11, tau)
  P2C1S3J1_11_lag <- delay(P2C1S3J1_11, tau)
  P2C1S3J2_11_lag <- delay(P2C1S3J2_11, tau)
  P2C1S3J3_11_lag <- delay(P2C1S3J3_11, tau)
  P2C1S3J4_11_lag <- delay(P2C1S3J4_11, tau)
  P2C2S1J1_11_lag <- delay(P2C2S1J1_11, tau)
  P2C2S1J2_11_lag <- delay(P2C2S1J2_11, tau)
  P2C2S1J3_11_lag <- delay(P2C2S1J3_11, tau)
  P2C2S1J4_11_lag <- delay(P2C2S1J4_11, tau)
  P2C2S2J1_11_lag <- delay(P2C2S2J1_11, tau)
  P2C2S2J2_11_lag <- delay(P2C2S2J2_11, tau)
  P2C2S2J3_11_lag <- delay(P2C2S2J3_11, tau)
  P2C2S2J4_11_lag <- delay(P2C2S2J4_11, tau)
  P2C2S3J1_11_lag <- delay(P2C2S3J1_11, tau)
  P2C2S3J2_11_lag <- delay(P2C2S3J2_11, tau)
  P2C2S3J3_11_lag <- delay(P2C2S3J3_11, tau)
  P2C2S3J4_11_lag <- delay(P2C2S3J4_11, tau)
  P2C3S1J1_11_lag <- delay(P2C3S1J1_11, tau)
  P2C3S1J2_11_lag <- delay(P2C3S1J2_11, tau)
  P2C3S1J3_11_lag <- delay(P2C3S1J3_11, tau)
  P2C3S1J4_11_lag <- delay(P2C3S1J4_11, tau)
  P2C3S2J1_11_lag <- delay(P2C3S2J1_11, tau)
  P2C3S2J2_11_lag <- delay(P2C3S2J2_11, tau)
  P2C3S2J3_11_lag <- delay(P2C3S2J3_11, tau)
  P2C3S2J4_11_lag <- delay(P2C3S2J4_11, tau)
  P2C3S3J1_11_lag <- delay(P2C3S3J1_11, tau)
  P2C3S3J2_11_lag <- delay(P2C3S3J2_11, tau)
  P2C3S3J3_11_lag <- delay(P2C3S3J3_11, tau)
  P2C3S3J4_11_lag <- delay(P2C3S3J4_11, tau)
  P2C4S1J1_11_lag <- delay(P2C4S1J1_11, tau)
  P2C4S1J2_11_lag <- delay(P2C4S1J2_11, tau)
  P2C4S1J3_11_lag <- delay(P2C4S1J3_11, tau)
  P2C4S1J4_11_lag <- delay(P2C4S1J4_11, tau)
  P2C4S2J1_11_lag <- delay(P2C4S2J1_11, tau)
  P2C4S2J2_11_lag <- delay(P2C4S2J2_11, tau)
  P2C4S2J3_11_lag <- delay(P2C4S2J3_11, tau)
  P2C4S2J4_11_lag <- delay(P2C4S2J4_11, tau)
  P2C4S3J1_11_lag <- delay(P2C4S3J1_11, tau)
  P2C4S3J2_11_lag <- delay(P2C4S3J2_11, tau)
  P2C4S3J3_11_lag <- delay(P2C4S3J3_11, tau)
  P2C4S3J4_11_lag <- delay(P2C4S3J4_11, tau)
  P1C1S1J1_12_lag <- delay(P1C1S1J1_12, tau)
  P1C1S1J2_12_lag <- delay(P1C1S1J2_12, tau)
  P1C1S1J3_12_lag <- delay(P1C1S1J3_12, tau)
  P1C1S1J4_12_lag <- delay(P1C1S1J4_12, tau)
  P1C1S2J1_12_lag <- delay(P1C1S2J1_12, tau)
  P1C1S2J2_12_lag <- delay(P1C1S2J2_12, tau)
  P1C1S2J3_12_lag <- delay(P1C1S2J3_12, tau)
  P1C1S2J4_12_lag <- delay(P1C1S2J4_12, tau)
  P1C1S3J1_12_lag <- delay(P1C1S3J1_12, tau)
  P1C1S3J2_12_lag <- delay(P1C1S3J2_12, tau)
  P1C1S3J3_12_lag <- delay(P1C1S3J3_12, tau)
  P1C1S3J4_12_lag <- delay(P1C1S3J4_12, tau)
  P1C2S1J1_12_lag <- delay(P1C2S1J1_12, tau)
  P1C2S1J2_12_lag <- delay(P1C2S1J2_12, tau)
  P1C2S1J3_12_lag <- delay(P1C2S1J3_12, tau)
  P1C2S1J4_12_lag <- delay(P1C2S1J4_12, tau)
  P1C2S2J1_12_lag <- delay(P1C2S2J1_12, tau)
  P1C2S2J2_12_lag <- delay(P1C2S2J2_12, tau)
  P1C2S2J3_12_lag <- delay(P1C2S2J3_12, tau)
  P1C2S2J4_12_lag <- delay(P1C2S2J4_12, tau)
  P1C2S3J1_12_lag <- delay(P1C2S3J1_12, tau)
  P1C2S3J2_12_lag <- delay(P1C2S3J2_12, tau)
  P1C2S3J3_12_lag <- delay(P1C2S3J3_12, tau)
  P1C2S3J4_12_lag <- delay(P1C2S3J4_12, tau)
  P1C3S1J1_12_lag <- delay(P1C3S1J1_12, tau)
  P1C3S1J2_12_lag <- delay(P1C3S1J2_12, tau)
  P1C3S1J3_12_lag <- delay(P1C3S1J3_12, tau)
  P1C3S1J4_12_lag <- delay(P1C3S1J4_12, tau)
  P1C3S2J1_12_lag <- delay(P1C3S2J1_12, tau)
  P1C3S2J2_12_lag <- delay(P1C3S2J2_12, tau)
  P1C3S2J3_12_lag <- delay(P1C3S2J3_12, tau)
  P1C3S2J4_12_lag <- delay(P1C3S2J4_12, tau)
  P1C3S3J1_12_lag <- delay(P1C3S3J1_12, tau)
  P1C3S3J2_12_lag <- delay(P1C3S3J2_12, tau)
  P1C3S3J3_12_lag <- delay(P1C3S3J3_12, tau)
  P1C3S3J4_12_lag <- delay(P1C3S3J4_12, tau)
  P1C4S1J1_12_lag <- delay(P1C4S1J1_12, tau)
  P1C4S1J2_12_lag <- delay(P1C4S1J2_12, tau)
  P1C4S1J3_12_lag <- delay(P1C4S1J3_12, tau)
  P1C4S1J4_12_lag <- delay(P1C4S1J4_12, tau)
  P1C4S2J1_12_lag <- delay(P1C4S2J1_12, tau)
  P1C4S2J2_12_lag <- delay(P1C4S2J2_12, tau)
  P1C4S2J3_12_lag <- delay(P1C4S2J3_12, tau)
  P1C4S2J4_12_lag <- delay(P1C4S2J4_12, tau)
  P1C4S3J1_12_lag <- delay(P1C4S3J1_12, tau)
  P1C4S3J2_12_lag <- delay(P1C4S3J2_12, tau)
  P1C4S3J3_12_lag <- delay(P1C4S3J3_12, tau)
  P1C4S3J4_12_lag <- delay(P1C4S3J4_12, tau)
  P2C1S1J1_12_lag <- delay(P2C1S1J1_12, tau)
  P2C1S1J2_12_lag <- delay(P2C1S1J2_12, tau)
  P2C1S1J3_12_lag <- delay(P2C1S1J3_12, tau)
  P2C1S1J4_12_lag <- delay(P2C1S1J4_12, tau)
  P2C1S2J1_12_lag <- delay(P2C1S2J1_12, tau)
  P2C1S2J2_12_lag <- delay(P2C1S2J2_12, tau)
  P2C1S2J3_12_lag <- delay(P2C1S2J3_12, tau)
  P2C1S2J4_12_lag <- delay(P2C1S2J4_12, tau)
  P2C1S3J1_12_lag <- delay(P2C1S3J1_12, tau)
  P2C1S3J2_12_lag <- delay(P2C1S3J2_12, tau)
  P2C1S3J3_12_lag <- delay(P2C1S3J3_12, tau)
  P2C1S3J4_12_lag <- delay(P2C1S3J4_12, tau)
  P2C2S1J1_12_lag <- delay(P2C2S1J1_12, tau)
  P2C2S1J2_12_lag <- delay(P2C2S1J2_12, tau)
  P2C2S1J3_12_lag <- delay(P2C2S1J3_12, tau)
  P2C2S1J4_12_lag <- delay(P2C2S1J4_12, tau)
  P2C2S2J1_12_lag <- delay(P2C2S2J1_12, tau)
  P2C2S2J2_12_lag <- delay(P2C2S2J2_12, tau)
  P2C2S2J3_12_lag <- delay(P2C2S2J3_12, tau)
  P2C2S2J4_12_lag <- delay(P2C2S2J4_12, tau)
  P2C2S3J1_12_lag <- delay(P2C2S3J1_12, tau)
  P2C2S3J2_12_lag <- delay(P2C2S3J2_12, tau)
  P2C2S3J3_12_lag <- delay(P2C2S3J3_12, tau)
  P2C2S3J4_12_lag <- delay(P2C2S3J4_12, tau)
  P2C3S1J1_12_lag <- delay(P2C3S1J1_12, tau)
  P2C3S1J2_12_lag <- delay(P2C3S1J2_12, tau)
  P2C3S1J3_12_lag <- delay(P2C3S1J3_12, tau)
  P2C3S1J4_12_lag <- delay(P2C3S1J4_12, tau)
  P2C3S2J1_12_lag <- delay(P2C3S2J1_12, tau)
  P2C3S2J2_12_lag <- delay(P2C3S2J2_12, tau)
  P2C3S2J3_12_lag <- delay(P2C3S2J3_12, tau)
  P2C3S2J4_12_lag <- delay(P2C3S2J4_12, tau)
  P2C3S3J1_12_lag <- delay(P2C3S3J1_12, tau)
  P2C3S3J2_12_lag <- delay(P2C3S3J2_12, tau)
  P2C3S3J3_12_lag <- delay(P2C3S3J3_12, tau)
  P2C3S3J4_12_lag <- delay(P2C3S3J4_12, tau)
  P2C4S1J1_12_lag <- delay(P2C4S1J1_12, tau)
  P2C4S1J2_12_lag <- delay(P2C4S1J2_12, tau)
  P2C4S1J3_12_lag <- delay(P2C4S1J3_12, tau)
  P2C4S1J4_12_lag <- delay(P2C4S1J4_12, tau)
  P2C4S2J1_12_lag <- delay(P2C4S2J1_12, tau)
  P2C4S2J2_12_lag <- delay(P2C4S2J2_12, tau)
  P2C4S2J3_12_lag <- delay(P2C4S2J3_12, tau)
  P2C4S2J4_12_lag <- delay(P2C4S2J4_12, tau)
  P2C4S3J1_12_lag <- delay(P2C4S3J1_12, tau)
  P2C4S3J2_12_lag <- delay(P2C4S3J2_12, tau)
  P2C4S3J3_12_lag <- delay(P2C4S3J3_12, tau)
  P2C4S3J4_12_lag <- delay(P2C4S3J4_12, tau)
  P1C1S1J1_13_lag <- delay(P1C1S1J1_13, tau)
  P1C1S1J2_13_lag <- delay(P1C1S1J2_13, tau)
  P1C1S1J3_13_lag <- delay(P1C1S1J3_13, tau)
  P1C1S1J4_13_lag <- delay(P1C1S1J4_13, tau)
  P1C1S2J1_13_lag <- delay(P1C1S2J1_13, tau)
  P1C1S2J2_13_lag <- delay(P1C1S2J2_13, tau)
  P1C1S2J3_13_lag <- delay(P1C1S2J3_13, tau)
  P1C1S2J4_13_lag <- delay(P1C1S2J4_13, tau)
  P1C1S3J1_13_lag <- delay(P1C1S3J1_13, tau)
  P1C1S3J2_13_lag <- delay(P1C1S3J2_13, tau)
  P1C1S3J3_13_lag <- delay(P1C1S3J3_13, tau)
  P1C1S3J4_13_lag <- delay(P1C1S3J4_13, tau)
  P1C2S1J1_13_lag <- delay(P1C2S1J1_13, tau)
  P1C2S1J2_13_lag <- delay(P1C2S1J2_13, tau)
  P1C2S1J3_13_lag <- delay(P1C2S1J3_13, tau)
  P1C2S1J4_13_lag <- delay(P1C2S1J4_13, tau)
  P1C2S2J1_13_lag <- delay(P1C2S2J1_13, tau)
  P1C2S2J2_13_lag <- delay(P1C2S2J2_13, tau)
  P1C2S2J3_13_lag <- delay(P1C2S2J3_13, tau)
  P1C2S2J4_13_lag <- delay(P1C2S2J4_13, tau)
  P1C2S3J1_13_lag <- delay(P1C2S3J1_13, tau)
  P1C2S3J2_13_lag <- delay(P1C2S3J2_13, tau)
  P1C2S3J3_13_lag <- delay(P1C2S3J3_13, tau)
  P1C2S3J4_13_lag <- delay(P1C2S3J4_13, tau)
  P1C3S1J1_13_lag <- delay(P1C3S1J1_13, tau)
  P1C3S1J2_13_lag <- delay(P1C3S1J2_13, tau)
  P1C3S1J3_13_lag <- delay(P1C3S1J3_13, tau)
  P1C3S1J4_13_lag <- delay(P1C3S1J4_13, tau)
  P1C3S2J1_13_lag <- delay(P1C3S2J1_13, tau)
  P1C3S2J2_13_lag <- delay(P1C3S2J2_13, tau)
  P1C3S2J3_13_lag <- delay(P1C3S2J3_13, tau)
  P1C3S2J4_13_lag <- delay(P1C3S2J4_13, tau)
  P1C3S3J1_13_lag <- delay(P1C3S3J1_13, tau)
  P1C3S3J2_13_lag <- delay(P1C3S3J2_13, tau)
  P1C3S3J3_13_lag <- delay(P1C3S3J3_13, tau)
  P1C3S3J4_13_lag <- delay(P1C3S3J4_13, tau)
  P1C4S1J1_13_lag <- delay(P1C4S1J1_13, tau)
  P1C4S1J2_13_lag <- delay(P1C4S1J2_13, tau)
  P1C4S1J3_13_lag <- delay(P1C4S1J3_13, tau)
  P1C4S1J4_13_lag <- delay(P1C4S1J4_13, tau)
  P1C4S2J1_13_lag <- delay(P1C4S2J1_13, tau)
  P1C4S2J2_13_lag <- delay(P1C4S2J2_13, tau)
  P1C4S2J3_13_lag <- delay(P1C4S2J3_13, tau)
  P1C4S2J4_13_lag <- delay(P1C4S2J4_13, tau)
  P1C4S3J1_13_lag <- delay(P1C4S3J1_13, tau)
  P1C4S3J2_13_lag <- delay(P1C4S3J2_13, tau)
  P1C4S3J3_13_lag <- delay(P1C4S3J3_13, tau)
  P1C4S3J4_13_lag <- delay(P1C4S3J4_13, tau)
  P2C1S1J1_13_lag <- delay(P2C1S1J1_13, tau)
  P2C1S1J2_13_lag <- delay(P2C1S1J2_13, tau)
  P2C1S1J3_13_lag <- delay(P2C1S1J3_13, tau)
  P2C1S1J4_13_lag <- delay(P2C1S1J4_13, tau)
  P2C1S2J1_13_lag <- delay(P2C1S2J1_13, tau)
  P2C1S2J2_13_lag <- delay(P2C1S2J2_13, tau)
  P2C1S2J3_13_lag <- delay(P2C1S2J3_13, tau)
  P2C1S2J4_13_lag <- delay(P2C1S2J4_13, tau)
  P2C1S3J1_13_lag <- delay(P2C1S3J1_13, tau)
  P2C1S3J2_13_lag <- delay(P2C1S3J2_13, tau)
  P2C1S3J3_13_lag <- delay(P2C1S3J3_13, tau)
  P2C1S3J4_13_lag <- delay(P2C1S3J4_13, tau)
  P2C2S1J1_13_lag <- delay(P2C2S1J1_13, tau)
  P2C2S1J2_13_lag <- delay(P2C2S1J2_13, tau)
  P2C2S1J3_13_lag <- delay(P2C2S1J3_13, tau)
  P2C2S1J4_13_lag <- delay(P2C2S1J4_13, tau)
  P2C2S2J1_13_lag <- delay(P2C2S2J1_13, tau)
  P2C2S2J2_13_lag <- delay(P2C2S2J2_13, tau)
  P2C2S2J3_13_lag <- delay(P2C2S2J3_13, tau)
  P2C2S2J4_13_lag <- delay(P2C2S2J4_13, tau)
  P2C2S3J1_13_lag <- delay(P2C2S3J1_13, tau)
  P2C2S3J2_13_lag <- delay(P2C2S3J2_13, tau)
  P2C2S3J3_13_lag <- delay(P2C2S3J3_13, tau)
  P2C2S3J4_13_lag <- delay(P2C2S3J4_13, tau)
  P2C3S1J1_13_lag <- delay(P2C3S1J1_13, tau)
  P2C3S1J2_13_lag <- delay(P2C3S1J2_13, tau)
  P2C3S1J3_13_lag <- delay(P2C3S1J3_13, tau)
  P2C3S1J4_13_lag <- delay(P2C3S1J4_13, tau)
  P2C3S2J1_13_lag <- delay(P2C3S2J1_13, tau)
  P2C3S2J2_13_lag <- delay(P2C3S2J2_13, tau)
  P2C3S2J3_13_lag <- delay(P2C3S2J3_13, tau)
  P2C3S2J4_13_lag <- delay(P2C3S2J4_13, tau)
  P2C3S3J1_13_lag <- delay(P2C3S3J1_13, tau)
  P2C3S3J2_13_lag <- delay(P2C3S3J2_13, tau)
  P2C3S3J3_13_lag <- delay(P2C3S3J3_13, tau)
  P2C3S3J4_13_lag <- delay(P2C3S3J4_13, tau)
  P2C4S1J1_13_lag <- delay(P2C4S1J1_13, tau)
  P2C4S1J2_13_lag <- delay(P2C4S1J2_13, tau)
  P2C4S1J3_13_lag <- delay(P2C4S1J3_13, tau)
  P2C4S1J4_13_lag <- delay(P2C4S1J4_13, tau)
  P2C4S2J1_13_lag <- delay(P2C4S2J1_13, tau)
  P2C4S2J2_13_lag <- delay(P2C4S2J2_13, tau)
  P2C4S2J3_13_lag <- delay(P2C4S2J3_13, tau)
  P2C4S2J4_13_lag <- delay(P2C4S2J4_13, tau)
  P2C4S3J1_13_lag <- delay(P2C4S3J1_13, tau)
  P2C4S3J2_13_lag <- delay(P2C4S3J2_13, tau)
  P2C4S3J3_13_lag <- delay(P2C4S3J3_13, tau)
  P2C4S3J4_13_lag <- delay(P2C4S3J4_13, tau)
  P1C1S1J1_14_lag <- delay(P1C1S1J1_14, tau)
  P1C1S1J2_14_lag <- delay(P1C1S1J2_14, tau)
  P1C1S1J3_14_lag <- delay(P1C1S1J3_14, tau)
  P1C1S1J4_14_lag <- delay(P1C1S1J4_14, tau)
  P1C1S2J1_14_lag <- delay(P1C1S2J1_14, tau)
  P1C1S2J2_14_lag <- delay(P1C1S2J2_14, tau)
  P1C1S2J3_14_lag <- delay(P1C1S2J3_14, tau)
  P1C1S2J4_14_lag <- delay(P1C1S2J4_14, tau)
  P1C1S3J1_14_lag <- delay(P1C1S3J1_14, tau)
  P1C1S3J2_14_lag <- delay(P1C1S3J2_14, tau)
  P1C1S3J3_14_lag <- delay(P1C1S3J3_14, tau)
  P1C1S3J4_14_lag <- delay(P1C1S3J4_14, tau)
  P1C2S1J1_14_lag <- delay(P1C2S1J1_14, tau)
  P1C2S1J2_14_lag <- delay(P1C2S1J2_14, tau)
  P1C2S1J3_14_lag <- delay(P1C2S1J3_14, tau)
  P1C2S1J4_14_lag <- delay(P1C2S1J4_14, tau)
  P1C2S2J1_14_lag <- delay(P1C2S2J1_14, tau)
  P1C2S2J2_14_lag <- delay(P1C2S2J2_14, tau)
  P1C2S2J3_14_lag <- delay(P1C2S2J3_14, tau)
  P1C2S2J4_14_lag <- delay(P1C2S2J4_14, tau)
  P1C2S3J1_14_lag <- delay(P1C2S3J1_14, tau)
  P1C2S3J2_14_lag <- delay(P1C2S3J2_14, tau)
  P1C2S3J3_14_lag <- delay(P1C2S3J3_14, tau)
  P1C2S3J4_14_lag <- delay(P1C2S3J4_14, tau)
  P1C3S1J1_14_lag <- delay(P1C3S1J1_14, tau)
  P1C3S1J2_14_lag <- delay(P1C3S1J2_14, tau)
  P1C3S1J3_14_lag <- delay(P1C3S1J3_14, tau)
  P1C3S1J4_14_lag <- delay(P1C3S1J4_14, tau)
  P1C3S2J1_14_lag <- delay(P1C3S2J1_14, tau)
  P1C3S2J2_14_lag <- delay(P1C3S2J2_14, tau)
  P1C3S2J3_14_lag <- delay(P1C3S2J3_14, tau)
  P1C3S2J4_14_lag <- delay(P1C3S2J4_14, tau)
  P1C3S3J1_14_lag <- delay(P1C3S3J1_14, tau)
  P1C3S3J2_14_lag <- delay(P1C3S3J2_14, tau)
  P1C3S3J3_14_lag <- delay(P1C3S3J3_14, tau)
  P1C3S3J4_14_lag <- delay(P1C3S3J4_14, tau)
  P1C4S1J1_14_lag <- delay(P1C4S1J1_14, tau)
  P1C4S1J2_14_lag <- delay(P1C4S1J2_14, tau)
  P1C4S1J3_14_lag <- delay(P1C4S1J3_14, tau)
  P1C4S1J4_14_lag <- delay(P1C4S1J4_14, tau)
  P1C4S2J1_14_lag <- delay(P1C4S2J1_14, tau)
  P1C4S2J2_14_lag <- delay(P1C4S2J2_14, tau)
  P1C4S2J3_14_lag <- delay(P1C4S2J3_14, tau)
  P1C4S2J4_14_lag <- delay(P1C4S2J4_14, tau)
  P1C4S3J1_14_lag <- delay(P1C4S3J1_14, tau)
  P1C4S3J2_14_lag <- delay(P1C4S3J2_14, tau)
  P1C4S3J3_14_lag <- delay(P1C4S3J3_14, tau)
  P1C4S3J4_14_lag <- delay(P1C4S3J4_14, tau)
  P2C1S1J1_14_lag <- delay(P2C1S1J1_14, tau)
  P2C1S1J2_14_lag <- delay(P2C1S1J2_14, tau)
  P2C1S1J3_14_lag <- delay(P2C1S1J3_14, tau)
  P2C1S1J4_14_lag <- delay(P2C1S1J4_14, tau)
  P2C1S2J1_14_lag <- delay(P2C1S2J1_14, tau)
  P2C1S2J2_14_lag <- delay(P2C1S2J2_14, tau)
  P2C1S2J3_14_lag <- delay(P2C1S2J3_14, tau)
  P2C1S2J4_14_lag <- delay(P2C1S2J4_14, tau)
  P2C1S3J1_14_lag <- delay(P2C1S3J1_14, tau)
  P2C1S3J2_14_lag <- delay(P2C1S3J2_14, tau)
  P2C1S3J3_14_lag <- delay(P2C1S3J3_14, tau)
  P2C1S3J4_14_lag <- delay(P2C1S3J4_14, tau)
  P2C2S1J1_14_lag <- delay(P2C2S1J1_14, tau)
  P2C2S1J2_14_lag <- delay(P2C2S1J2_14, tau)
  P2C2S1J3_14_lag <- delay(P2C2S1J3_14, tau)
  P2C2S1J4_14_lag <- delay(P2C2S1J4_14, tau)
  P2C2S2J1_14_lag <- delay(P2C2S2J1_14, tau)
  P2C2S2J2_14_lag <- delay(P2C2S2J2_14, tau)
  P2C2S2J3_14_lag <- delay(P2C2S2J3_14, tau)
  P2C2S2J4_14_lag <- delay(P2C2S2J4_14, tau)
  P2C2S3J1_14_lag <- delay(P2C2S3J1_14, tau)
  P2C2S3J2_14_lag <- delay(P2C2S3J2_14, tau)
  P2C2S3J3_14_lag <- delay(P2C2S3J3_14, tau)
  P2C2S3J4_14_lag <- delay(P2C2S3J4_14, tau)
  P2C3S1J1_14_lag <- delay(P2C3S1J1_14, tau)
  P2C3S1J2_14_lag <- delay(P2C3S1J2_14, tau)
  P2C3S1J3_14_lag <- delay(P2C3S1J3_14, tau)
  P2C3S1J4_14_lag <- delay(P2C3S1J4_14, tau)
  P2C3S2J1_14_lag <- delay(P2C3S2J1_14, tau)
  P2C3S2J2_14_lag <- delay(P2C3S2J2_14, tau)
  P2C3S2J3_14_lag <- delay(P2C3S2J3_14, tau)
  P2C3S2J4_14_lag <- delay(P2C3S2J4_14, tau)
  P2C3S3J1_14_lag <- delay(P2C3S3J1_14, tau)
  P2C3S3J2_14_lag <- delay(P2C3S3J2_14, tau)
  P2C3S3J3_14_lag <- delay(P2C3S3J3_14, tau)
  P2C3S3J4_14_lag <- delay(P2C3S3J4_14, tau)
  P2C4S1J1_14_lag <- delay(P2C4S1J1_14, tau)
  P2C4S1J2_14_lag <- delay(P2C4S1J2_14, tau)
  P2C4S1J3_14_lag <- delay(P2C4S1J3_14, tau)
  P2C4S1J4_14_lag <- delay(P2C4S1J4_14, tau)
  P2C4S2J1_14_lag <- delay(P2C4S2J1_14, tau)
  P2C4S2J2_14_lag <- delay(P2C4S2J2_14, tau)
  P2C4S2J3_14_lag <- delay(P2C4S2J3_14, tau)
  P2C4S2J4_14_lag <- delay(P2C4S2J4_14, tau)
  P2C4S3J1_14_lag <- delay(P2C4S3J1_14, tau)
  P2C4S3J2_14_lag <- delay(P2C4S3J2_14, tau)
  P2C4S3J3_14_lag <- delay(P2C4S3J3_14, tau)
  P2C4S3J4_14_lag <- delay(P2C4S3J4_14, tau)
  P1C1S1J1_15_lag <- delay(P1C1S1J1_15, tau)
  P1C1S1J2_15_lag <- delay(P1C1S1J2_15, tau)
  P1C1S1J3_15_lag <- delay(P1C1S1J3_15, tau)
  P1C1S1J4_15_lag <- delay(P1C1S1J4_15, tau)
  P1C1S2J1_15_lag <- delay(P1C1S2J1_15, tau)
  P1C1S2J2_15_lag <- delay(P1C1S2J2_15, tau)
  P1C1S2J3_15_lag <- delay(P1C1S2J3_15, tau)
  P1C1S2J4_15_lag <- delay(P1C1S2J4_15, tau)
  P1C1S3J1_15_lag <- delay(P1C1S3J1_15, tau)
  P1C1S3J2_15_lag <- delay(P1C1S3J2_15, tau)
  P1C1S3J3_15_lag <- delay(P1C1S3J3_15, tau)
  P1C1S3J4_15_lag <- delay(P1C1S3J4_15, tau)
  P1C2S1J1_15_lag <- delay(P1C2S1J1_15, tau)
  P1C2S1J2_15_lag <- delay(P1C2S1J2_15, tau)
  P1C2S1J3_15_lag <- delay(P1C2S1J3_15, tau)
  P1C2S1J4_15_lag <- delay(P1C2S1J4_15, tau)
  P1C2S2J1_15_lag <- delay(P1C2S2J1_15, tau)
  P1C2S2J2_15_lag <- delay(P1C2S2J2_15, tau)
  P1C2S2J3_15_lag <- delay(P1C2S2J3_15, tau)
  P1C2S2J4_15_lag <- delay(P1C2S2J4_15, tau)
  P1C2S3J1_15_lag <- delay(P1C2S3J1_15, tau)
  P1C2S3J2_15_lag <- delay(P1C2S3J2_15, tau)
  P1C2S3J3_15_lag <- delay(P1C2S3J3_15, tau)
  P1C2S3J4_15_lag <- delay(P1C2S3J4_15, tau)
  P1C3S1J1_15_lag <- delay(P1C3S1J1_15, tau)
  P1C3S1J2_15_lag <- delay(P1C3S1J2_15, tau)
  P1C3S1J3_15_lag <- delay(P1C3S1J3_15, tau)
  P1C3S1J4_15_lag <- delay(P1C3S1J4_15, tau)
  P1C3S2J1_15_lag <- delay(P1C3S2J1_15, tau)
  P1C3S2J2_15_lag <- delay(P1C3S2J2_15, tau)
  P1C3S2J3_15_lag <- delay(P1C3S2J3_15, tau)
  P1C3S2J4_15_lag <- delay(P1C3S2J4_15, tau)
  P1C3S3J1_15_lag <- delay(P1C3S3J1_15, tau)
  P1C3S3J2_15_lag <- delay(P1C3S3J2_15, tau)
  P1C3S3J3_15_lag <- delay(P1C3S3J3_15, tau)
  P1C3S3J4_15_lag <- delay(P1C3S3J4_15, tau)
  P1C4S1J1_15_lag <- delay(P1C4S1J1_15, tau)
  P1C4S1J2_15_lag <- delay(P1C4S1J2_15, tau)
  P1C4S1J3_15_lag <- delay(P1C4S1J3_15, tau)
  P1C4S1J4_15_lag <- delay(P1C4S1J4_15, tau)
  P1C4S2J1_15_lag <- delay(P1C4S2J1_15, tau)
  P1C4S2J2_15_lag <- delay(P1C4S2J2_15, tau)
  P1C4S2J3_15_lag <- delay(P1C4S2J3_15, tau)
  P1C4S2J4_15_lag <- delay(P1C4S2J4_15, tau)
  P1C4S3J1_15_lag <- delay(P1C4S3J1_15, tau)
  P1C4S3J2_15_lag <- delay(P1C4S3J2_15, tau)
  P1C4S3J3_15_lag <- delay(P1C4S3J3_15, tau)
  P1C4S3J4_15_lag <- delay(P1C4S3J4_15, tau)
  P2C1S1J1_15_lag <- delay(P2C1S1J1_15, tau)
  P2C1S1J2_15_lag <- delay(P2C1S1J2_15, tau)
  P2C1S1J3_15_lag <- delay(P2C1S1J3_15, tau)
  P2C1S1J4_15_lag <- delay(P2C1S1J4_15, tau)
  P2C1S2J1_15_lag <- delay(P2C1S2J1_15, tau)
  P2C1S2J2_15_lag <- delay(P2C1S2J2_15, tau)
  P2C1S2J3_15_lag <- delay(P2C1S2J3_15, tau)
  P2C1S2J4_15_lag <- delay(P2C1S2J4_15, tau)
  P2C1S3J1_15_lag <- delay(P2C1S3J1_15, tau)
  P2C1S3J2_15_lag <- delay(P2C1S3J2_15, tau)
  P2C1S3J3_15_lag <- delay(P2C1S3J3_15, tau)
  P2C1S3J4_15_lag <- delay(P2C1S3J4_15, tau)
  P2C2S1J1_15_lag <- delay(P2C2S1J1_15, tau)
  P2C2S1J2_15_lag <- delay(P2C2S1J2_15, tau)
  P2C2S1J3_15_lag <- delay(P2C2S1J3_15, tau)
  P2C2S1J4_15_lag <- delay(P2C2S1J4_15, tau)
  P2C2S2J1_15_lag <- delay(P2C2S2J1_15, tau)
  P2C2S2J2_15_lag <- delay(P2C2S2J2_15, tau)
  P2C2S2J3_15_lag <- delay(P2C2S2J3_15, tau)
  P2C2S2J4_15_lag <- delay(P2C2S2J4_15, tau)
  P2C2S3J1_15_lag <- delay(P2C2S3J1_15, tau)
  P2C2S3J2_15_lag <- delay(P2C2S3J2_15, tau)
  P2C2S3J3_15_lag <- delay(P2C2S3J3_15, tau)
  P2C2S3J4_15_lag <- delay(P2C2S3J4_15, tau)
  P2C3S1J1_15_lag <- delay(P2C3S1J1_15, tau)
  P2C3S1J2_15_lag <- delay(P2C3S1J2_15, tau)
  P2C3S1J3_15_lag <- delay(P2C3S1J3_15, tau)
  P2C3S1J4_15_lag <- delay(P2C3S1J4_15, tau)
  P2C3S2J1_15_lag <- delay(P2C3S2J1_15, tau)
  P2C3S2J2_15_lag <- delay(P2C3S2J2_15, tau)
  P2C3S2J3_15_lag <- delay(P2C3S2J3_15, tau)
  P2C3S2J4_15_lag <- delay(P2C3S2J4_15, tau)
  P2C3S3J1_15_lag <- delay(P2C3S3J1_15, tau)
  P2C3S3J2_15_lag <- delay(P2C3S3J2_15, tau)
  P2C3S3J3_15_lag <- delay(P2C3S3J3_15, tau)
  P2C3S3J4_15_lag <- delay(P2C3S3J4_15, tau)
  P2C4S1J1_15_lag <- delay(P2C4S1J1_15, tau)
  P2C4S1J2_15_lag <- delay(P2C4S1J2_15, tau)
  P2C4S1J3_15_lag <- delay(P2C4S1J3_15, tau)
  P2C4S1J4_15_lag <- delay(P2C4S1J4_15, tau)
  P2C4S2J1_15_lag <- delay(P2C4S2J1_15, tau)
  P2C4S2J2_15_lag <- delay(P2C4S2J2_15, tau)
  P2C4S2J3_15_lag <- delay(P2C4S2J3_15, tau)
  P2C4S2J4_15_lag <- delay(P2C4S2J4_15, tau)
  P2C4S3J1_15_lag <- delay(P2C4S3J1_15, tau)
  P2C4S3J2_15_lag <- delay(P2C4S3J2_15, tau)
  P2C4S3J3_15_lag <- delay(P2C4S3J3_15, tau)
  P2C4S3J4_15_lag <- delay(P2C4S3J4_15, tau)
  P1C1S1J1_16_lag <- delay(P1C1S1J1_16, tau)
  P1C1S1J2_16_lag <- delay(P1C1S1J2_16, tau)
  P1C1S1J3_16_lag <- delay(P1C1S1J3_16, tau)
  P1C1S1J4_16_lag <- delay(P1C1S1J4_16, tau)
  P1C1S2J1_16_lag <- delay(P1C1S2J1_16, tau)
  P1C1S2J2_16_lag <- delay(P1C1S2J2_16, tau)
  P1C1S2J3_16_lag <- delay(P1C1S2J3_16, tau)
  P1C1S2J4_16_lag <- delay(P1C1S2J4_16, tau)
  P1C1S3J1_16_lag <- delay(P1C1S3J1_16, tau)
  P1C1S3J2_16_lag <- delay(P1C1S3J2_16, tau)
  P1C1S3J3_16_lag <- delay(P1C1S3J3_16, tau)
  P1C1S3J4_16_lag <- delay(P1C1S3J4_16, tau)
  P1C2S1J1_16_lag <- delay(P1C2S1J1_16, tau)
  P1C2S1J2_16_lag <- delay(P1C2S1J2_16, tau)
  P1C2S1J3_16_lag <- delay(P1C2S1J3_16, tau)
  P1C2S1J4_16_lag <- delay(P1C2S1J4_16, tau)
  P1C2S2J1_16_lag <- delay(P1C2S2J1_16, tau)
  P1C2S2J2_16_lag <- delay(P1C2S2J2_16, tau)
  P1C2S2J3_16_lag <- delay(P1C2S2J3_16, tau)
  P1C2S2J4_16_lag <- delay(P1C2S2J4_16, tau)
  P1C2S3J1_16_lag <- delay(P1C2S3J1_16, tau)
  P1C2S3J2_16_lag <- delay(P1C2S3J2_16, tau)
  P1C2S3J3_16_lag <- delay(P1C2S3J3_16, tau)
  P1C2S3J4_16_lag <- delay(P1C2S3J4_16, tau)
  P1C3S1J1_16_lag <- delay(P1C3S1J1_16, tau)
  P1C3S1J2_16_lag <- delay(P1C3S1J2_16, tau)
  P1C3S1J3_16_lag <- delay(P1C3S1J3_16, tau)
  P1C3S1J4_16_lag <- delay(P1C3S1J4_16, tau)
  P1C3S2J1_16_lag <- delay(P1C3S2J1_16, tau)
  P1C3S2J2_16_lag <- delay(P1C3S2J2_16, tau)
  P1C3S2J3_16_lag <- delay(P1C3S2J3_16, tau)
  P1C3S2J4_16_lag <- delay(P1C3S2J4_16, tau)
  P1C3S3J1_16_lag <- delay(P1C3S3J1_16, tau)
  P1C3S3J2_16_lag <- delay(P1C3S3J2_16, tau)
  P1C3S3J3_16_lag <- delay(P1C3S3J3_16, tau)
  P1C3S3J4_16_lag <- delay(P1C3S3J4_16, tau)
  P1C4S1J1_16_lag <- delay(P1C4S1J1_16, tau)
  P1C4S1J2_16_lag <- delay(P1C4S1J2_16, tau)
  P1C4S1J3_16_lag <- delay(P1C4S1J3_16, tau)
  P1C4S1J4_16_lag <- delay(P1C4S1J4_16, tau)
  P1C4S2J1_16_lag <- delay(P1C4S2J1_16, tau)
  P1C4S2J2_16_lag <- delay(P1C4S2J2_16, tau)
  P1C4S2J3_16_lag <- delay(P1C4S2J3_16, tau)
  P1C4S2J4_16_lag <- delay(P1C4S2J4_16, tau)
  P1C4S3J1_16_lag <- delay(P1C4S3J1_16, tau)
  P1C4S3J2_16_lag <- delay(P1C4S3J2_16, tau)
  P1C4S3J3_16_lag <- delay(P1C4S3J3_16, tau)
  P1C4S3J4_16_lag <- delay(P1C4S3J4_16, tau)
  P2C1S1J1_16_lag <- delay(P2C1S1J1_16, tau)
  P2C1S1J2_16_lag <- delay(P2C1S1J2_16, tau)
  P2C1S1J3_16_lag <- delay(P2C1S1J3_16, tau)
  P2C1S1J4_16_lag <- delay(P2C1S1J4_16, tau)
  P2C1S2J1_16_lag <- delay(P2C1S2J1_16, tau)
  P2C1S2J2_16_lag <- delay(P2C1S2J2_16, tau)
  P2C1S2J3_16_lag <- delay(P2C1S2J3_16, tau)
  P2C1S2J4_16_lag <- delay(P2C1S2J4_16, tau)
  P2C1S3J1_16_lag <- delay(P2C1S3J1_16, tau)
  P2C1S3J2_16_lag <- delay(P2C1S3J2_16, tau)
  P2C1S3J3_16_lag <- delay(P2C1S3J3_16, tau)
  P2C1S3J4_16_lag <- delay(P2C1S3J4_16, tau)
  P2C2S1J1_16_lag <- delay(P2C2S1J1_16, tau)
  P2C2S1J2_16_lag <- delay(P2C2S1J2_16, tau)
  P2C2S1J3_16_lag <- delay(P2C2S1J3_16, tau)
  P2C2S1J4_16_lag <- delay(P2C2S1J4_16, tau)
  P2C2S2J1_16_lag <- delay(P2C2S2J1_16, tau)
  P2C2S2J2_16_lag <- delay(P2C2S2J2_16, tau)
  P2C2S2J3_16_lag <- delay(P2C2S2J3_16, tau)
  P2C2S2J4_16_lag <- delay(P2C2S2J4_16, tau)
  P2C2S3J1_16_lag <- delay(P2C2S3J1_16, tau)
  P2C2S3J2_16_lag <- delay(P2C2S3J2_16, tau)
  P2C2S3J3_16_lag <- delay(P2C2S3J3_16, tau)
  P2C2S3J4_16_lag <- delay(P2C2S3J4_16, tau)
  P2C3S1J1_16_lag <- delay(P2C3S1J1_16, tau)
  P2C3S1J2_16_lag <- delay(P2C3S1J2_16, tau)
  P2C3S1J3_16_lag <- delay(P2C3S1J3_16, tau)
  P2C3S1J4_16_lag <- delay(P2C3S1J4_16, tau)
  P2C3S2J1_16_lag <- delay(P2C3S2J1_16, tau)
  P2C3S2J2_16_lag <- delay(P2C3S2J2_16, tau)
  P2C3S2J3_16_lag <- delay(P2C3S2J3_16, tau)
  P2C3S2J4_16_lag <- delay(P2C3S2J4_16, tau)
  P2C3S3J1_16_lag <- delay(P2C3S3J1_16, tau)
  P2C3S3J2_16_lag <- delay(P2C3S3J2_16, tau)
  P2C3S3J3_16_lag <- delay(P2C3S3J3_16, tau)
  P2C3S3J4_16_lag <- delay(P2C3S3J4_16, tau)
  P2C4S1J1_16_lag <- delay(P2C4S1J1_16, tau)
  P2C4S1J2_16_lag <- delay(P2C4S1J2_16, tau)
  P2C4S1J3_16_lag <- delay(P2C4S1J3_16, tau)
  P2C4S1J4_16_lag <- delay(P2C4S1J4_16, tau)
  P2C4S2J1_16_lag <- delay(P2C4S2J1_16, tau)
  P2C4S2J2_16_lag <- delay(P2C4S2J2_16, tau)
  P2C4S2J3_16_lag <- delay(P2C4S2J3_16, tau)
  P2C4S2J4_16_lag <- delay(P2C4S2J4_16, tau)
  P2C4S3J1_16_lag <- delay(P2C4S3J1_16, tau)
  P2C4S3J2_16_lag <- delay(P2C4S3J2_16, tau)
  P2C4S3J3_16_lag <- delay(P2C4S3J3_16, tau)
  P2C4S3J4_16_lag <- delay(P2C4S3J4_16, tau)
  P1C1S1J1_17_lag <- delay(P1C1S1J1_17, tau)
  P1C1S1J2_17_lag <- delay(P1C1S1J2_17, tau)
  P1C1S1J3_17_lag <- delay(P1C1S1J3_17, tau)
  P1C1S1J4_17_lag <- delay(P1C1S1J4_17, tau)
  P1C1S2J1_17_lag <- delay(P1C1S2J1_17, tau)
  P1C1S2J2_17_lag <- delay(P1C1S2J2_17, tau)
  P1C1S2J3_17_lag <- delay(P1C1S2J3_17, tau)
  P1C1S2J4_17_lag <- delay(P1C1S2J4_17, tau)
  P1C1S3J1_17_lag <- delay(P1C1S3J1_17, tau)
  P1C1S3J2_17_lag <- delay(P1C1S3J2_17, tau)
  P1C1S3J3_17_lag <- delay(P1C1S3J3_17, tau)
  P1C1S3J4_17_lag <- delay(P1C1S3J4_17, tau)
  P1C2S1J1_17_lag <- delay(P1C2S1J1_17, tau)
  P1C2S1J2_17_lag <- delay(P1C2S1J2_17, tau)
  P1C2S1J3_17_lag <- delay(P1C2S1J3_17, tau)
  P1C2S1J4_17_lag <- delay(P1C2S1J4_17, tau)
  P1C2S2J1_17_lag <- delay(P1C2S2J1_17, tau)
  P1C2S2J2_17_lag <- delay(P1C2S2J2_17, tau)
  P1C2S2J3_17_lag <- delay(P1C2S2J3_17, tau)
  P1C2S2J4_17_lag <- delay(P1C2S2J4_17, tau)
  P1C2S3J1_17_lag <- delay(P1C2S3J1_17, tau)
  P1C2S3J2_17_lag <- delay(P1C2S3J2_17, tau)
  P1C2S3J3_17_lag <- delay(P1C2S3J3_17, tau)
  P1C2S3J4_17_lag <- delay(P1C2S3J4_17, tau)
  P1C3S1J1_17_lag <- delay(P1C3S1J1_17, tau)
  P1C3S1J2_17_lag <- delay(P1C3S1J2_17, tau)
  P1C3S1J3_17_lag <- delay(P1C3S1J3_17, tau)
  P1C3S1J4_17_lag <- delay(P1C3S1J4_17, tau)
  P1C3S2J1_17_lag <- delay(P1C3S2J1_17, tau)
  P1C3S2J2_17_lag <- delay(P1C3S2J2_17, tau)
  P1C3S2J3_17_lag <- delay(P1C3S2J3_17, tau)
  P1C3S2J4_17_lag <- delay(P1C3S2J4_17, tau)
  P1C3S3J1_17_lag <- delay(P1C3S3J1_17, tau)
  P1C3S3J2_17_lag <- delay(P1C3S3J2_17, tau)
  P1C3S3J3_17_lag <- delay(P1C3S3J3_17, tau)
  P1C3S3J4_17_lag <- delay(P1C3S3J4_17, tau)
  P1C4S1J1_17_lag <- delay(P1C4S1J1_17, tau)
  P1C4S1J2_17_lag <- delay(P1C4S1J2_17, tau)
  P1C4S1J3_17_lag <- delay(P1C4S1J3_17, tau)
  P1C4S1J4_17_lag <- delay(P1C4S1J4_17, tau)
  P1C4S2J1_17_lag <- delay(P1C4S2J1_17, tau)
  P1C4S2J2_17_lag <- delay(P1C4S2J2_17, tau)
  P1C4S2J3_17_lag <- delay(P1C4S2J3_17, tau)
  P1C4S2J4_17_lag <- delay(P1C4S2J4_17, tau)
  P1C4S3J1_17_lag <- delay(P1C4S3J1_17, tau)
  P1C4S3J2_17_lag <- delay(P1C4S3J2_17, tau)
  P1C4S3J3_17_lag <- delay(P1C4S3J3_17, tau)
  P1C4S3J4_17_lag <- delay(P1C4S3J4_17, tau)
  P2C1S1J1_17_lag <- delay(P2C1S1J1_17, tau)
  P2C1S1J2_17_lag <- delay(P2C1S1J2_17, tau)
  P2C1S1J3_17_lag <- delay(P2C1S1J3_17, tau)
  P2C1S1J4_17_lag <- delay(P2C1S1J4_17, tau)
  P2C1S2J1_17_lag <- delay(P2C1S2J1_17, tau)
  P2C1S2J2_17_lag <- delay(P2C1S2J2_17, tau)
  P2C1S2J3_17_lag <- delay(P2C1S2J3_17, tau)
  P2C1S2J4_17_lag <- delay(P2C1S2J4_17, tau)
  P2C1S3J1_17_lag <- delay(P2C1S3J1_17, tau)
  P2C1S3J2_17_lag <- delay(P2C1S3J2_17, tau)
  P2C1S3J3_17_lag <- delay(P2C1S3J3_17, tau)
  P2C1S3J4_17_lag <- delay(P2C1S3J4_17, tau)
  P2C2S1J1_17_lag <- delay(P2C2S1J1_17, tau)
  P2C2S1J2_17_lag <- delay(P2C2S1J2_17, tau)
  P2C2S1J3_17_lag <- delay(P2C2S1J3_17, tau)
  P2C2S1J4_17_lag <- delay(P2C2S1J4_17, tau)
  P2C2S2J1_17_lag <- delay(P2C2S2J1_17, tau)
  P2C2S2J2_17_lag <- delay(P2C2S2J2_17, tau)
  P2C2S2J3_17_lag <- delay(P2C2S2J3_17, tau)
  P2C2S2J4_17_lag <- delay(P2C2S2J4_17, tau)
  P2C2S3J1_17_lag <- delay(P2C2S3J1_17, tau)
  P2C2S3J2_17_lag <- delay(P2C2S3J2_17, tau)
  P2C2S3J3_17_lag <- delay(P2C2S3J3_17, tau)
  P2C2S3J4_17_lag <- delay(P2C2S3J4_17, tau)
  P2C3S1J1_17_lag <- delay(P2C3S1J1_17, tau)
  P2C3S1J2_17_lag <- delay(P2C3S1J2_17, tau)
  P2C3S1J3_17_lag <- delay(P2C3S1J3_17, tau)
  P2C3S1J4_17_lag <- delay(P2C3S1J4_17, tau)
  P2C3S2J1_17_lag <- delay(P2C3S2J1_17, tau)
  P2C3S2J2_17_lag <- delay(P2C3S2J2_17, tau)
  P2C3S2J3_17_lag <- delay(P2C3S2J3_17, tau)
  P2C3S2J4_17_lag <- delay(P2C3S2J4_17, tau)
  P2C3S3J1_17_lag <- delay(P2C3S3J1_17, tau)
  P2C3S3J2_17_lag <- delay(P2C3S3J2_17, tau)
  P2C3S3J3_17_lag <- delay(P2C3S3J3_17, tau)
  P2C3S3J4_17_lag <- delay(P2C3S3J4_17, tau)
  P2C4S1J1_17_lag <- delay(P2C4S1J1_17, tau)
  P2C4S1J2_17_lag <- delay(P2C4S1J2_17, tau)
  P2C4S1J3_17_lag <- delay(P2C4S1J3_17, tau)
  P2C4S1J4_17_lag <- delay(P2C4S1J4_17, tau)
  P2C4S2J1_17_lag <- delay(P2C4S2J1_17, tau)
  P2C4S2J2_17_lag <- delay(P2C4S2J2_17, tau)
  P2C4S2J3_17_lag <- delay(P2C4S2J3_17, tau)
  P2C4S2J4_17_lag <- delay(P2C4S2J4_17, tau)
  P2C4S3J1_17_lag <- delay(P2C4S3J1_17, tau)
  P2C4S3J2_17_lag <- delay(P2C4S3J2_17, tau)
  P2C4S3J3_17_lag <- delay(P2C4S3J3_17, tau)
  P2C4S3J4_17_lag <- delay(P2C4S3J4_17, tau)
  
  ##############################################################################################################################
  ## INITIAL CONDITIONS ####################################################################
  ##############################################################################################################################
  P1C1S1J1_10_ini <- user(0)
  P1C1S1J2_10_ini <- user(0)
  P1C1S1J3_10_ini <- user(0)
  P1C1S1J4_10_ini <- user(0)
  P1C1S2J1_10_ini <- user(0)
  P1C1S2J2_10_ini <- user(0)
  P1C1S2J3_10_ini <- user(0)
  P1C1S2J4_10_ini <- user(0)
  P1C1S3J1_10_ini <- user(0)
  P1C1S3J2_10_ini <- user(0)
  P1C1S3J3_10_ini <- user(0)
  P1C1S3J4_10_ini <- user(0)
  P1C2S1J1_10_ini <- user(0)
  P1C2S1J2_10_ini <- user(0)
  P1C2S1J3_10_ini <- user(0)
  P1C2S1J4_10_ini <- user(0)
  P1C2S2J1_10_ini <- user(0)
  P1C2S2J2_10_ini <- user(0)
  P1C2S2J3_10_ini <- user(0)
  P1C2S2J4_10_ini <- user(0)
  P1C2S3J1_10_ini <- user(0)
  P1C2S3J2_10_ini <- user(0)
  P1C2S3J3_10_ini <- user(0)
  P1C2S3J4_10_ini <- user(0)
  P1C3S1J1_10_ini <- user(0)
  P1C3S1J2_10_ini <- user(0)
  P1C3S1J3_10_ini <- user(0)
  P1C3S1J4_10_ini <- user(0)
  P1C3S2J1_10_ini <- user(0)
  P1C3S2J2_10_ini <- user(0)
  P1C3S2J3_10_ini <- user(0)
  P1C3S2J4_10_ini <- user(0)
  P1C3S3J1_10_ini <- user(0)
  P1C3S3J2_10_ini <- user(0)
  P1C3S3J3_10_ini <- user(0)
  P1C3S3J4_10_ini <- user(0)
  P1C4S1J1_10_ini <- user(0)
  P1C4S1J2_10_ini <- user(0)
  P1C4S1J3_10_ini <- user(0)
  P1C4S1J4_10_ini <- user(0)
  P1C4S2J1_10_ini <- user(0)
  P1C4S2J2_10_ini <- user(0)
  P1C4S2J3_10_ini <- user(0)
  P1C4S2J4_10_ini <- user(0)
  P1C4S3J1_10_ini <- user(0)
  P1C4S3J2_10_ini <- user(0)
  P1C4S3J3_10_ini <- user(0)
  P1C4S3J4_10_ini <- user(0)
  P2C1S1J1_10_ini <- user(0)
  P2C1S1J2_10_ini <- user(0)
  P2C1S1J3_10_ini <- user(0)
  P2C1S1J4_10_ini <- user(0)
  P2C1S2J1_10_ini <- user(0)
  P2C1S2J2_10_ini <- user(0)
  P2C1S2J3_10_ini <- user(0)
  P2C1S2J4_10_ini <- user(0)
  P2C1S3J1_10_ini <- user(0)
  P2C1S3J2_10_ini <- user(0)
  P2C1S3J3_10_ini <- user(0)
  P2C1S3J4_10_ini <- user(0)
  P2C2S1J1_10_ini <- user(0)
  P2C2S1J2_10_ini <- user(0)
  P2C2S1J3_10_ini <- user(0)
  P2C2S1J4_10_ini <- user(0)
  P2C2S2J1_10_ini <- user(0)
  P2C2S2J2_10_ini <- user(0)
  P2C2S2J3_10_ini <- user(0)
  P2C2S2J4_10_ini <- user(0)
  P2C2S3J1_10_ini <- user(0)
  P2C2S3J2_10_ini <- user(0)
  P2C2S3J3_10_ini <- user(0)
  P2C2S3J4_10_ini <- user(0)
  P2C3S1J1_10_ini <- user(0)
  P2C3S1J2_10_ini <- user(0)
  P2C3S1J3_10_ini <- user(0)
  P2C3S1J4_10_ini <- user(0)
  P2C3S2J1_10_ini <- user(0)
  P2C3S2J2_10_ini <- user(0)
  P2C3S2J3_10_ini <- user(0)
  P2C3S2J4_10_ini <- user(0)
  P2C3S3J1_10_ini <- user(0)
  P2C3S3J2_10_ini <- user(0)
  P2C3S3J3_10_ini <- user(0)
  P2C3S3J4_10_ini <- user(0)
  P2C4S1J1_10_ini <- user(0)
  P2C4S1J2_10_ini <- user(0)
  P2C4S1J3_10_ini <- user(0)
  P2C4S1J4_10_ini <- user(0)
  P2C4S2J1_10_ini <- user(0)
  P2C4S2J2_10_ini <- user(0)
  P2C4S2J3_10_ini <- user(0)
  P2C4S2J4_10_ini <- user(0)
  P2C4S3J1_10_ini <- user(0)
  P2C4S3J2_10_ini <- user(0)
  P2C4S3J3_10_ini <- user(0)
  P2C4S3J4_10_ini <- user(0)
  P1C1S1J1_11_ini <- user(0)
  P1C1S1J2_11_ini <- user(0)
  P1C1S1J3_11_ini <- user(0)
  P1C1S1J4_11_ini <- user(0)
  P1C1S2J1_11_ini <- user(0)
  P1C1S2J2_11_ini <- user(0)
  P1C1S2J3_11_ini <- user(0)
  P1C1S2J4_11_ini <- user(0)
  P1C1S3J1_11_ini <- user(0)
  P1C1S3J2_11_ini <- user(0)
  P1C1S3J3_11_ini <- user(0)
  P1C1S3J4_11_ini <- user(0)
  P1C2S1J1_11_ini <- user(0)
  P1C2S1J2_11_ini <- user(0)
  P1C2S1J3_11_ini <- user(0)
  P1C2S1J4_11_ini <- user(0)
  P1C2S2J1_11_ini <- user(0)
  P1C2S2J2_11_ini <- user(0)
  P1C2S2J3_11_ini <- user(0)
  P1C2S2J4_11_ini <- user(0)
  P1C2S3J1_11_ini <- user(0)
  P1C2S3J2_11_ini <- user(0)
  P1C2S3J3_11_ini <- user(0)
  P1C2S3J4_11_ini <- user(0)
  P1C3S1J1_11_ini <- user(0)
  P1C3S1J2_11_ini <- user(0)
  P1C3S1J3_11_ini <- user(0)
  P1C3S1J4_11_ini <- user(0)
  P1C3S2J1_11_ini <- user(0)
  P1C3S2J2_11_ini <- user(0)
  P1C3S2J3_11_ini <- user(0)
  P1C3S2J4_11_ini <- user(0)
  P1C3S3J1_11_ini <- user(0)
  P1C3S3J2_11_ini <- user(0)
  P1C3S3J3_11_ini <- user(0)
  P1C3S3J4_11_ini <- user(0)
  P1C4S1J1_11_ini <- user(0)
  P1C4S1J2_11_ini <- user(0)
  P1C4S1J3_11_ini <- user(0)
  P1C4S1J4_11_ini <- user(0)
  P1C4S2J1_11_ini <- user(0)
  P1C4S2J2_11_ini <- user(0)
  P1C4S2J3_11_ini <- user(0)
  P1C4S2J4_11_ini <- user(0)
  P1C4S3J1_11_ini <- user(0)
  P1C4S3J2_11_ini <- user(0)
  P1C4S3J3_11_ini <- user(0)
  P1C4S3J4_11_ini <- user(0)
  P2C1S1J1_11_ini <- user(0)
  P2C1S1J2_11_ini <- user(0)
  P2C1S1J3_11_ini <- user(0)
  P2C1S1J4_11_ini <- user(0)
  P2C1S2J1_11_ini <- user(0)
  P2C1S2J2_11_ini <- user(0)
  P2C1S2J3_11_ini <- user(0)
  P2C1S2J4_11_ini <- user(0)
  P2C1S3J1_11_ini <- user(0)
  P2C1S3J2_11_ini <- user(0)
  P2C1S3J3_11_ini <- user(0)
  P2C1S3J4_11_ini <- user(0)
  P2C2S1J1_11_ini <- user(0)
  P2C2S1J2_11_ini <- user(0)
  P2C2S1J3_11_ini <- user(0)
  P2C2S1J4_11_ini <- user(0)
  P2C2S2J1_11_ini <- user(0)
  P2C2S2J2_11_ini <- user(0)
  P2C2S2J3_11_ini <- user(0)
  P2C2S2J4_11_ini <- user(0)
  P2C2S3J1_11_ini <- user(0)
  P2C2S3J2_11_ini <- user(0)
  P2C2S3J3_11_ini <- user(0)
  P2C2S3J4_11_ini <- user(0)
  P2C3S1J1_11_ini <- user(0)
  P2C3S1J2_11_ini <- user(0)
  P2C3S1J3_11_ini <- user(0)
  P2C3S1J4_11_ini <- user(0)
  P2C3S2J1_11_ini <- user(0)
  P2C3S2J2_11_ini <- user(0)
  P2C3S2J3_11_ini <- user(0)
  P2C3S2J4_11_ini <- user(0)
  P2C3S3J1_11_ini <- user(0)
  P2C3S3J2_11_ini <- user(0)
  P2C3S3J3_11_ini <- user(0)
  P2C3S3J4_11_ini <- user(0)
  P2C4S1J1_11_ini <- user(0)
  P2C4S1J2_11_ini <- user(0)
  P2C4S1J3_11_ini <- user(0)
  P2C4S1J4_11_ini <- user(0)
  P2C4S2J1_11_ini <- user(0)
  P2C4S2J2_11_ini <- user(0)
  P2C4S2J3_11_ini <- user(0)
  P2C4S2J4_11_ini <- user(0)
  P2C4S3J1_11_ini <- user(0)
  P2C4S3J2_11_ini <- user(0)
  P2C4S3J3_11_ini <- user(0)
  P2C4S3J4_11_ini <- user(0)
  P1C1S1J1_12_ini <- user(0)
  P1C1S1J2_12_ini <- user(0)
  P1C1S1J3_12_ini <- user(0)
  P1C1S1J4_12_ini <- user(0)
  P1C1S2J1_12_ini <- user(0)
  P1C1S2J2_12_ini <- user(0)
  P1C1S2J3_12_ini <- user(0)
  P1C1S2J4_12_ini <- user(0)
  P1C1S3J1_12_ini <- user(0)
  P1C1S3J2_12_ini <- user(0)
  P1C1S3J3_12_ini <- user(0)
  P1C1S3J4_12_ini <- user(0)
  P1C2S1J1_12_ini <- user(0)
  P1C2S1J2_12_ini <- user(0)
  P1C2S1J3_12_ini <- user(0)
  P1C2S1J4_12_ini <- user(0)
  P1C2S2J1_12_ini <- user(0)
  P1C2S2J2_12_ini <- user(0)
  P1C2S2J3_12_ini <- user(0)
  P1C2S2J4_12_ini <- user(0)
  P1C2S3J1_12_ini <- user(0)
  P1C2S3J2_12_ini <- user(0)
  P1C2S3J3_12_ini <- user(0)
  P1C2S3J4_12_ini <- user(0)
  P1C3S1J1_12_ini <- user(0)
  P1C3S1J2_12_ini <- user(0)
  P1C3S1J3_12_ini <- user(0)
  P1C3S1J4_12_ini <- user(0)
  P1C3S2J1_12_ini <- user(0)
  P1C3S2J2_12_ini <- user(0)
  P1C3S2J3_12_ini <- user(0)
  P1C3S2J4_12_ini <- user(0)
  P1C3S3J1_12_ini <- user(0)
  P1C3S3J2_12_ini <- user(0)
  P1C3S3J3_12_ini <- user(0)
  P1C3S3J4_12_ini <- user(0)
  P1C4S1J1_12_ini <- user(0)
  P1C4S1J2_12_ini <- user(0)
  P1C4S1J3_12_ini <- user(0)
  P1C4S1J4_12_ini <- user(0)
  P1C4S2J1_12_ini <- user(0)
  P1C4S2J2_12_ini <- user(0)
  P1C4S2J3_12_ini <- user(0)
  P1C4S2J4_12_ini <- user(0)
  P1C4S3J1_12_ini <- user(0)
  P1C4S3J2_12_ini <- user(0)
  P1C4S3J3_12_ini <- user(0)
  P1C4S3J4_12_ini <- user(0)
  P2C1S1J1_12_ini <- user(0)
  P2C1S1J2_12_ini <- user(0)
  P2C1S1J3_12_ini <- user(0)
  P2C1S1J4_12_ini <- user(0)
  P2C1S2J1_12_ini <- user(0)
  P2C1S2J2_12_ini <- user(0)
  P2C1S2J3_12_ini <- user(0)
  P2C1S2J4_12_ini <- user(0)
  P2C1S3J1_12_ini <- user(0)
  P2C1S3J2_12_ini <- user(0)
  P2C1S3J3_12_ini <- user(0)
  P2C1S3J4_12_ini <- user(0)
  P2C2S1J1_12_ini <- user(0)
  P2C2S1J2_12_ini <- user(0)
  P2C2S1J3_12_ini <- user(0)
  P2C2S1J4_12_ini <- user(0)
  P2C2S2J1_12_ini <- user(0)
  P2C2S2J2_12_ini <- user(0)
  P2C2S2J3_12_ini <- user(0)
  P2C2S2J4_12_ini <- user(0)
  P2C2S3J1_12_ini <- user(0)
  P2C2S3J2_12_ini <- user(0)
  P2C2S3J3_12_ini <- user(0)
  P2C2S3J4_12_ini <- user(0)
  P2C3S1J1_12_ini <- user(0)
  P2C3S1J2_12_ini <- user(0)
  P2C3S1J3_12_ini <- user(0)
  P2C3S1J4_12_ini <- user(0)
  P2C3S2J1_12_ini <- user(0)
  P2C3S2J2_12_ini <- user(0)
  P2C3S2J3_12_ini <- user(0)
  P2C3S2J4_12_ini <- user(0)
  P2C3S3J1_12_ini <- user(0)
  P2C3S3J2_12_ini <- user(0)
  P2C3S3J3_12_ini <- user(0)
  P2C3S3J4_12_ini <- user(0)
  P2C4S1J1_12_ini <- user(0)
  P2C4S1J2_12_ini <- user(0)
  P2C4S1J3_12_ini <- user(0)
  P2C4S1J4_12_ini <- user(0)
  P2C4S2J1_12_ini <- user(0)
  P2C4S2J2_12_ini <- user(0)
  P2C4S2J3_12_ini <- user(0)
  P2C4S2J4_12_ini <- user(0)
  P2C4S3J1_12_ini <- user(0)
  P2C4S3J2_12_ini <- user(0)
  P2C4S3J3_12_ini <- user(0)
  P2C4S3J4_12_ini <- user(0)
  P1C1S1J1_13_ini <- user(0)
  P1C1S1J2_13_ini <- user(0)
  P1C1S1J3_13_ini <- user(0)
  P1C1S1J4_13_ini <- user(0)
  P1C1S2J1_13_ini <- user(0)
  P1C1S2J2_13_ini <- user(0)
  P1C1S2J3_13_ini <- user(0)
  P1C1S2J4_13_ini <- user(0)
  P1C1S3J1_13_ini <- user(0)
  P1C1S3J2_13_ini <- user(0)
  P1C1S3J3_13_ini <- user(0)
  P1C1S3J4_13_ini <- user(0)
  P1C2S1J1_13_ini <- user(0)
  P1C2S1J2_13_ini <- user(0)
  P1C2S1J3_13_ini <- user(0)
  P1C2S1J4_13_ini <- user(0)
  P1C2S2J1_13_ini <- user(0)
  P1C2S2J2_13_ini <- user(0)
  P1C2S2J3_13_ini <- user(0)
  P1C2S2J4_13_ini <- user(0)
  P1C2S3J1_13_ini <- user(0)
  P1C2S3J2_13_ini <- user(0)
  P1C2S3J3_13_ini <- user(0)
  P1C2S3J4_13_ini <- user(0)
  P1C3S1J1_13_ini <- user(0)
  P1C3S1J2_13_ini <- user(0)
  P1C3S1J3_13_ini <- user(0)
  P1C3S1J4_13_ini <- user(0)
  P1C3S2J1_13_ini <- user(0)
  P1C3S2J2_13_ini <- user(0)
  P1C3S2J3_13_ini <- user(0)
  P1C3S2J4_13_ini <- user(0)
  P1C3S3J1_13_ini <- user(0)
  P1C3S3J2_13_ini <- user(0)
  P1C3S3J3_13_ini <- user(0)
  P1C3S3J4_13_ini <- user(0)
  P1C4S1J1_13_ini <- user(0)
  P1C4S1J2_13_ini <- user(0)
  P1C4S1J3_13_ini <- user(0)
  P1C4S1J4_13_ini <- user(0)
  P1C4S2J1_13_ini <- user(0)
  P1C4S2J2_13_ini <- user(0)
  P1C4S2J3_13_ini <- user(0)
  P1C4S2J4_13_ini <- user(0)
  P1C4S3J1_13_ini <- user(0)
  P1C4S3J2_13_ini <- user(0)
  P1C4S3J3_13_ini <- user(0)
  P1C4S3J4_13_ini <- user(0)
  P2C1S1J1_13_ini <- user(0)
  P2C1S1J2_13_ini <- user(0)
  P2C1S1J3_13_ini <- user(0)
  P2C1S1J4_13_ini <- user(0)
  P2C1S2J1_13_ini <- user(0)
  P2C1S2J2_13_ini <- user(0)
  P2C1S2J3_13_ini <- user(0)
  P2C1S2J4_13_ini <- user(0)
  P2C1S3J1_13_ini <- user(0)
  P2C1S3J2_13_ini <- user(0)
  P2C1S3J3_13_ini <- user(0)
  P2C1S3J4_13_ini <- user(0)
  P2C2S1J1_13_ini <- user(0)
  P2C2S1J2_13_ini <- user(0)
  P2C2S1J3_13_ini <- user(0)
  P2C2S1J4_13_ini <- user(0)
  P2C2S2J1_13_ini <- user(0)
  P2C2S2J2_13_ini <- user(0)
  P2C2S2J3_13_ini <- user(0)
  P2C2S2J4_13_ini <- user(0)
  P2C2S3J1_13_ini <- user(0)
  P2C2S3J2_13_ini <- user(0)
  P2C2S3J3_13_ini <- user(0)
  P2C2S3J4_13_ini <- user(0)
  P2C3S1J1_13_ini <- user(0)
  P2C3S1J2_13_ini <- user(0)
  P2C3S1J3_13_ini <- user(0)
  P2C3S1J4_13_ini <- user(0)
  P2C3S2J1_13_ini <- user(0)
  P2C3S2J2_13_ini <- user(0)
  P2C3S2J3_13_ini <- user(0)
  P2C3S2J4_13_ini <- user(0)
  P2C3S3J1_13_ini <- user(0)
  P2C3S3J2_13_ini <- user(0)
  P2C3S3J3_13_ini <- user(0)
  P2C3S3J4_13_ini <- user(0)
  P2C4S1J1_13_ini <- user(0)
  P2C4S1J2_13_ini <- user(0)
  P2C4S1J3_13_ini <- user(0)
  P2C4S1J4_13_ini <- user(0)
  P2C4S2J1_13_ini <- user(0)
  P2C4S2J2_13_ini <- user(0)
  P2C4S2J3_13_ini <- user(0)
  P2C4S2J4_13_ini <- user(0)
  P2C4S3J1_13_ini <- user(0)
  P2C4S3J2_13_ini <- user(0)
  P2C4S3J3_13_ini <- user(0)
  P2C4S3J4_13_ini <- user(0)
  P1C1S1J1_14_ini <- user(0)
  P1C1S1J2_14_ini <- user(0)
  P1C1S1J3_14_ini <- user(0)
  P1C1S1J4_14_ini <- user(0)
  P1C1S2J1_14_ini <- user(0)
  P1C1S2J2_14_ini <- user(0)
  P1C1S2J3_14_ini <- user(0)
  P1C1S2J4_14_ini <- user(0)
  P1C1S3J1_14_ini <- user(0)
  P1C1S3J2_14_ini <- user(0)
  P1C1S3J3_14_ini <- user(0)
  P1C1S3J4_14_ini <- user(0)
  P1C2S1J1_14_ini <- user(0)
  P1C2S1J2_14_ini <- user(0)
  P1C2S1J3_14_ini <- user(0)
  P1C2S1J4_14_ini <- user(0)
  P1C2S2J1_14_ini <- user(0)
  P1C2S2J2_14_ini <- user(0)
  P1C2S2J3_14_ini <- user(0)
  P1C2S2J4_14_ini <- user(0)
  P1C2S3J1_14_ini <- user(0)
  P1C2S3J2_14_ini <- user(0)
  P1C2S3J3_14_ini <- user(0)
  P1C2S3J4_14_ini <- user(0)
  P1C3S1J1_14_ini <- user(0)
  P1C3S1J2_14_ini <- user(0)
  P1C3S1J3_14_ini <- user(0)
  P1C3S1J4_14_ini <- user(0)
  P1C3S2J1_14_ini <- user(0)
  P1C3S2J2_14_ini <- user(0)
  P1C3S2J3_14_ini <- user(0)
  P1C3S2J4_14_ini <- user(0)
  P1C3S3J1_14_ini <- user(0)
  P1C3S3J2_14_ini <- user(0)
  P1C3S3J3_14_ini <- user(0)
  P1C3S3J4_14_ini <- user(0)
  P1C4S1J1_14_ini <- user(0)
  P1C4S1J2_14_ini <- user(0)
  P1C4S1J3_14_ini <- user(0)
  P1C4S1J4_14_ini <- user(0)
  P1C4S2J1_14_ini <- user(0)
  P1C4S2J2_14_ini <- user(0)
  P1C4S2J3_14_ini <- user(0)
  P1C4S2J4_14_ini <- user(0)
  P1C4S3J1_14_ini <- user(0)
  P1C4S3J2_14_ini <- user(0)
  P1C4S3J3_14_ini <- user(0)
  P1C4S3J4_14_ini <- user(0)
  P2C1S1J1_14_ini <- user(0)
  P2C1S1J2_14_ini <- user(0)
  P2C1S1J3_14_ini <- user(0)
  P2C1S1J4_14_ini <- user(0)
  P2C1S2J1_14_ini <- user(0)
  P2C1S2J2_14_ini <- user(0)
  P2C1S2J3_14_ini <- user(0)
  P2C1S2J4_14_ini <- user(0)
  P2C1S3J1_14_ini <- user(0)
  P2C1S3J2_14_ini <- user(0)
  P2C1S3J3_14_ini <- user(0)
  P2C1S3J4_14_ini <- user(0)
  P2C2S1J1_14_ini <- user(0)
  P2C2S1J2_14_ini <- user(0)
  P2C2S1J3_14_ini <- user(0)
  P2C2S1J4_14_ini <- user(0)
  P2C2S2J1_14_ini <- user(0)
  P2C2S2J2_14_ini <- user(0)
  P2C2S2J3_14_ini <- user(0)
  P2C2S2J4_14_ini <- user(0)
  P2C2S3J1_14_ini <- user(0)
  P2C2S3J2_14_ini <- user(0)
  P2C2S3J3_14_ini <- user(0)
  P2C2S3J4_14_ini <- user(0)
  P2C3S1J1_14_ini <- user(0)
  P2C3S1J2_14_ini <- user(0)
  P2C3S1J3_14_ini <- user(0)
  P2C3S1J4_14_ini <- user(0)
  P2C3S2J1_14_ini <- user(0)
  P2C3S2J2_14_ini <- user(0)
  P2C3S2J3_14_ini <- user(0)
  P2C3S2J4_14_ini <- user(0)
  P2C3S3J1_14_ini <- user(0)
  P2C3S3J2_14_ini <- user(0)
  P2C3S3J3_14_ini <- user(0)
  P2C3S3J4_14_ini <- user(0)
  P2C4S1J1_14_ini <- user(0)
  P2C4S1J2_14_ini <- user(0)
  P2C4S1J3_14_ini <- user(0)
  P2C4S1J4_14_ini <- user(0)
  P2C4S2J1_14_ini <- user(0)
  P2C4S2J2_14_ini <- user(0)
  P2C4S2J3_14_ini <- user(0)
  P2C4S2J4_14_ini <- user(0)
  P2C4S3J1_14_ini <- user(0)
  P2C4S3J2_14_ini <- user(0)
  P2C4S3J3_14_ini <- user(0)
  P2C4S3J4_14_ini <- user(0)
  P1C1S1J1_15_ini <- user(0)
  P1C1S1J2_15_ini <- user(0)
  P1C1S1J3_15_ini <- user(0)
  P1C1S1J4_15_ini <- user(0)
  P1C1S2J1_15_ini <- user(0)
  P1C1S2J2_15_ini <- user(0)
  P1C1S2J3_15_ini <- user(0)
  P1C1S2J4_15_ini <- user(0)
  P1C1S3J1_15_ini <- user(0)
  P1C1S3J2_15_ini <- user(0)
  P1C1S3J3_15_ini <- user(0)
  P1C1S3J4_15_ini <- user(0)
  P1C2S1J1_15_ini <- user(0)
  P1C2S1J2_15_ini <- user(0)
  P1C2S1J3_15_ini <- user(0)
  P1C2S1J4_15_ini <- user(0)
  P1C2S2J1_15_ini <- user(0)
  P1C2S2J2_15_ini <- user(0)
  P1C2S2J3_15_ini <- user(0)
  P1C2S2J4_15_ini <- user(0)
  P1C2S3J1_15_ini <- user(0)
  P1C2S3J2_15_ini <- user(0)
  P1C2S3J3_15_ini <- user(0)
  P1C2S3J4_15_ini <- user(0)
  P1C3S1J1_15_ini <- user(0)
  P1C3S1J2_15_ini <- user(0)
  P1C3S1J3_15_ini <- user(0)
  P1C3S1J4_15_ini <- user(0)
  P1C3S2J1_15_ini <- user(0)
  P1C3S2J2_15_ini <- user(0)
  P1C3S2J3_15_ini <- user(0)
  P1C3S2J4_15_ini <- user(0)
  P1C3S3J1_15_ini <- user(0)
  P1C3S3J2_15_ini <- user(0)
  P1C3S3J3_15_ini <- user(0)
  P1C3S3J4_15_ini <- user(0)
  P1C4S1J1_15_ini <- user(0)
  P1C4S1J2_15_ini <- user(0)
  P1C4S1J3_15_ini <- user(0)
  P1C4S1J4_15_ini <- user(0)
  P1C4S2J1_15_ini <- user(0)
  P1C4S2J2_15_ini <- user(0)
  P1C4S2J3_15_ini <- user(0)
  P1C4S2J4_15_ini <- user(0)
  P1C4S3J1_15_ini <- user(0)
  P1C4S3J2_15_ini <- user(0)
  P1C4S3J3_15_ini <- user(0)
  P1C4S3J4_15_ini <- user(0)
  P2C1S1J1_15_ini <- user(0)
  P2C1S1J2_15_ini <- user(0)
  P2C1S1J3_15_ini <- user(0)
  P2C1S1J4_15_ini <- user(0)
  P2C1S2J1_15_ini <- user(0)
  P2C1S2J2_15_ini <- user(0)
  P2C1S2J3_15_ini <- user(0)
  P2C1S2J4_15_ini <- user(0)
  P2C1S3J1_15_ini <- user(0)
  P2C1S3J2_15_ini <- user(0)
  P2C1S3J3_15_ini <- user(0)
  P2C1S3J4_15_ini <- user(0)
  P2C2S1J1_15_ini <- user(0)
  P2C2S1J2_15_ini <- user(0)
  P2C2S1J3_15_ini <- user(0)
  P2C2S1J4_15_ini <- user(0)
  P2C2S2J1_15_ini <- user(0)
  P2C2S2J2_15_ini <- user(0)
  P2C2S2J3_15_ini <- user(0)
  P2C2S2J4_15_ini <- user(0)
  P2C2S3J1_15_ini <- user(0)
  P2C2S3J2_15_ini <- user(0)
  P2C2S3J3_15_ini <- user(0)
  P2C2S3J4_15_ini <- user(0)
  P2C3S1J1_15_ini <- user(0)
  P2C3S1J2_15_ini <- user(0)
  P2C3S1J3_15_ini <- user(0)
  P2C3S1J4_15_ini <- user(0)
  P2C3S2J1_15_ini <- user(0)
  P2C3S2J2_15_ini <- user(0)
  P2C3S2J3_15_ini <- user(0)
  P2C3S2J4_15_ini <- user(0)
  P2C3S3J1_15_ini <- user(0)
  P2C3S3J2_15_ini <- user(0)
  P2C3S3J3_15_ini <- user(0)
  P2C3S3J4_15_ini <- user(0)
  P2C4S1J1_15_ini <- user(0)
  P2C4S1J2_15_ini <- user(0)
  P2C4S1J3_15_ini <- user(0)
  P2C4S1J4_15_ini <- user(0)
  P2C4S2J1_15_ini <- user(0)
  P2C4S2J2_15_ini <- user(0)
  P2C4S2J3_15_ini <- user(0)
  P2C4S2J4_15_ini <- user(0)
  P2C4S3J1_15_ini <- user(0)
  P2C4S3J2_15_ini <- user(0)
  P2C4S3J3_15_ini <- user(0)
  P2C4S3J4_15_ini <- user(0)
  P1C1S1J1_16_ini <- user(0)
  P1C1S1J2_16_ini <- user(0)
  P1C1S1J3_16_ini <- user(0)
  P1C1S1J4_16_ini <- user(0)
  P1C1S2J1_16_ini <- user(0)
  P1C1S2J2_16_ini <- user(0)
  P1C1S2J3_16_ini <- user(0)
  P1C1S2J4_16_ini <- user(0)
  P1C1S3J1_16_ini <- user(0)
  P1C1S3J2_16_ini <- user(0)
  P1C1S3J3_16_ini <- user(0)
  P1C1S3J4_16_ini <- user(0)
  P1C2S1J1_16_ini <- user(0)
  P1C2S1J2_16_ini <- user(0)
  P1C2S1J3_16_ini <- user(0)
  P1C2S1J4_16_ini <- user(0)
  P1C2S2J1_16_ini <- user(0)
  P1C2S2J2_16_ini <- user(0)
  P1C2S2J3_16_ini <- user(0)
  P1C2S2J4_16_ini <- user(0)
  P1C2S3J1_16_ini <- user(0)
  P1C2S3J2_16_ini <- user(0)
  P1C2S3J3_16_ini <- user(0)
  P1C2S3J4_16_ini <- user(0)
  P1C3S1J1_16_ini <- user(0)
  P1C3S1J2_16_ini <- user(0)
  P1C3S1J3_16_ini <- user(0)
  P1C3S1J4_16_ini <- user(0)
  P1C3S2J1_16_ini <- user(0)
  P1C3S2J2_16_ini <- user(0)
  P1C3S2J3_16_ini <- user(0)
  P1C3S2J4_16_ini <- user(0)
  P1C3S3J1_16_ini <- user(0)
  P1C3S3J2_16_ini <- user(0)
  P1C3S3J3_16_ini <- user(0)
  P1C3S3J4_16_ini <- user(0)
  P1C4S1J1_16_ini <- user(0)
  P1C4S1J2_16_ini <- user(0)
  P1C4S1J3_16_ini <- user(0)
  P1C4S1J4_16_ini <- user(0)
  P1C4S2J1_16_ini <- user(0)
  P1C4S2J2_16_ini <- user(0)
  P1C4S2J3_16_ini <- user(0)
  P1C4S2J4_16_ini <- user(0)
  P1C4S3J1_16_ini <- user(0)
  P1C4S3J2_16_ini <- user(0)
  P1C4S3J3_16_ini <- user(0)
  P1C4S3J4_16_ini <- user(0)
  P2C1S1J1_16_ini <- user(0)
  P2C1S1J2_16_ini <- user(0)
  P2C1S1J3_16_ini <- user(0)
  P2C1S1J4_16_ini <- user(0)
  P2C1S2J1_16_ini <- user(0)
  P2C1S2J2_16_ini <- user(0)
  P2C1S2J3_16_ini <- user(0)
  P2C1S2J4_16_ini <- user(0)
  P2C1S3J1_16_ini <- user(0)
  P2C1S3J2_16_ini <- user(0)
  P2C1S3J3_16_ini <- user(0)
  P2C1S3J4_16_ini <- user(0)
  P2C2S1J1_16_ini <- user(0)
  P2C2S1J2_16_ini <- user(0)
  P2C2S1J3_16_ini <- user(0)
  P2C2S1J4_16_ini <- user(0)
  P2C2S2J1_16_ini <- user(0)
  P2C2S2J2_16_ini <- user(0)
  P2C2S2J3_16_ini <- user(0)
  P2C2S2J4_16_ini <- user(0)
  P2C2S3J1_16_ini <- user(0)
  P2C2S3J2_16_ini <- user(0)
  P2C2S3J3_16_ini <- user(0)
  P2C2S3J4_16_ini <- user(0)
  P2C3S1J1_16_ini <- user(0)
  P2C3S1J2_16_ini <- user(0)
  P2C3S1J3_16_ini <- user(0)
  P2C3S1J4_16_ini <- user(0)
  P2C3S2J1_16_ini <- user(0)
  P2C3S2J2_16_ini <- user(0)
  P2C3S2J3_16_ini <- user(0)
  P2C3S2J4_16_ini <- user(0)
  P2C3S3J1_16_ini <- user(0)
  P2C3S3J2_16_ini <- user(0)
  P2C3S3J3_16_ini <- user(0)
  P2C3S3J4_16_ini <- user(0)
  P2C4S1J1_16_ini <- user(0)
  P2C4S1J2_16_ini <- user(0)
  P2C4S1J3_16_ini <- user(0)
  P2C4S1J4_16_ini <- user(0)
  P2C4S2J1_16_ini <- user(0)
  P2C4S2J2_16_ini <- user(0)
  P2C4S2J3_16_ini <- user(0)
  P2C4S2J4_16_ini <- user(0)
  P2C4S3J1_16_ini <- user(0)
  P2C4S3J2_16_ini <- user(0)
  P2C4S3J3_16_ini <- user(0)
  P2C4S3J4_16_ini <- user(0)
  P1C1S1J1_17_ini <- user(0)
  P1C1S1J2_17_ini <- user(0)
  P1C1S1J3_17_ini <- user(0)
  P1C1S1J4_17_ini <- user(0)
  P1C1S2J1_17_ini <- user(0)
  P1C1S2J2_17_ini <- user(0)
  P1C1S2J3_17_ini <- user(0)
  P1C1S2J4_17_ini <- user(0)
  P1C1S3J1_17_ini <- user(0)
  P1C1S3J2_17_ini <- user(0)
  P1C1S3J3_17_ini <- user(0)
  P1C1S3J4_17_ini <- user(0)
  P1C2S1J1_17_ini <- user(0)
  P1C2S1J2_17_ini <- user(0)
  P1C2S1J3_17_ini <- user(0)
  P1C2S1J4_17_ini <- user(0)
  P1C2S2J1_17_ini <- user(0)
  P1C2S2J2_17_ini <- user(0)
  P1C2S2J3_17_ini <- user(0)
  P1C2S2J4_17_ini <- user(0)
  P1C2S3J1_17_ini <- user(0)
  P1C2S3J2_17_ini <- user(0)
  P1C2S3J3_17_ini <- user(0)
  P1C2S3J4_17_ini <- user(0)
  P1C3S1J1_17_ini <- user(0)
  P1C3S1J2_17_ini <- user(0)
  P1C3S1J3_17_ini <- user(0)
  P1C3S1J4_17_ini <- user(0)
  P1C3S2J1_17_ini <- user(0)
  P1C3S2J2_17_ini <- user(0)
  P1C3S2J3_17_ini <- user(0)
  P1C3S2J4_17_ini <- user(0)
  P1C3S3J1_17_ini <- user(0)
  P1C3S3J2_17_ini <- user(0)
  P1C3S3J3_17_ini <- user(0)
  P1C3S3J4_17_ini <- user(0)
  P1C4S1J1_17_ini <- user(0)
  P1C4S1J2_17_ini <- user(0)
  P1C4S1J3_17_ini <- user(0)
  P1C4S1J4_17_ini <- user(0)
  P1C4S2J1_17_ini <- user(0)
  P1C4S2J2_17_ini <- user(0)
  P1C4S2J3_17_ini <- user(0)
  P1C4S2J4_17_ini <- user(0)
  P1C4S3J1_17_ini <- user(0)
  P1C4S3J2_17_ini <- user(0)
  P1C4S3J3_17_ini <- user(0)
  P1C4S3J4_17_ini <- user(0)
  P2C1S1J1_17_ini <- user(0)
  P2C1S1J2_17_ini <- user(0)
  P2C1S1J3_17_ini <- user(0)
  P2C1S1J4_17_ini <- user(0)
  P2C1S2J1_17_ini <- user(0)
  P2C1S2J2_17_ini <- user(0)
  P2C1S2J3_17_ini <- user(0)
  P2C1S2J4_17_ini <- user(0)
  P2C1S3J1_17_ini <- user(0)
  P2C1S3J2_17_ini <- user(0)
  P2C1S3J3_17_ini <- user(0)
  P2C1S3J4_17_ini <- user(0)
  P2C2S1J1_17_ini <- user(0)
  P2C2S1J2_17_ini <- user(0)
  P2C2S1J3_17_ini <- user(0)
  P2C2S1J4_17_ini <- user(0)
  P2C2S2J1_17_ini <- user(0)
  P2C2S2J2_17_ini <- user(0)
  P2C2S2J3_17_ini <- user(0)
  P2C2S2J4_17_ini <- user(0)
  P2C2S3J1_17_ini <- user(0)
  P2C2S3J2_17_ini <- user(0)
  P2C2S3J3_17_ini <- user(0)
  P2C2S3J4_17_ini <- user(0)
  P2C3S1J1_17_ini <- user(0)
  P2C3S1J2_17_ini <- user(0)
  P2C3S1J3_17_ini <- user(0)
  P2C3S1J4_17_ini <- user(0)
  P2C3S2J1_17_ini <- user(0)
  P2C3S2J2_17_ini <- user(0)
  P2C3S2J3_17_ini <- user(0)
  P2C3S2J4_17_ini <- user(0)
  P2C3S3J1_17_ini <- user(0)
  P2C3S3J2_17_ini <- user(0)
  P2C3S3J3_17_ini <- user(0)
  P2C3S3J4_17_ini <- user(0)
  P2C4S1J1_17_ini <- user(0)
  P2C4S1J2_17_ini <- user(0)
  P2C4S1J3_17_ini <- user(0)
  P2C4S1J4_17_ini <- user(0)
  P2C4S2J1_17_ini <- user(0)
  P2C4S2J2_17_ini <- user(0)
  P2C4S2J3_17_ini <- user(0)
  P2C4S2J4_17_ini <- user(0)
  P2C4S3J1_17_ini <- user(0)
  P2C4S3J2_17_ini <- user(0)
  P2C4S3J3_17_ini <- user(0)
  P2C4S3J4_17_ini <- user(0)
  
  
  
  initial(P1C1S1J1_10) <- P1C1S1J1_10_ini
  initial(P1C1S1J2_10) <- P1C1S1J2_10_ini
  initial(P1C1S1J3_10) <- P1C1S1J3_10_ini
  initial(P1C1S1J4_10) <- P1C1S1J4_10_ini
  initial(P1C1S2J1_10) <- P1C1S2J1_10_ini
  initial(P1C1S2J2_10) <- P1C1S2J2_10_ini
  initial(P1C1S2J3_10) <- P1C1S2J3_10_ini
  initial(P1C1S2J4_10) <- P1C1S2J4_10_ini
  initial(P1C1S3J1_10) <- P1C1S3J1_10_ini
  initial(P1C1S3J2_10) <- P1C1S3J2_10_ini
  initial(P1C1S3J3_10) <- P1C1S3J3_10_ini
  initial(P1C1S3J4_10) <- P1C1S3J4_10_ini
  initial(P1C2S1J1_10) <- P1C2S1J1_10_ini
  initial(P1C2S1J2_10) <- P1C2S1J2_10_ini
  initial(P1C2S1J3_10) <- P1C2S1J3_10_ini
  initial(P1C2S1J4_10) <- P1C2S1J4_10_ini
  initial(P1C2S2J1_10) <- P1C2S2J1_10_ini
  initial(P1C2S2J2_10) <- P1C2S2J2_10_ini
  initial(P1C2S2J3_10) <- P1C2S2J3_10_ini
  initial(P1C2S2J4_10) <- P1C2S2J4_10_ini
  initial(P1C2S3J1_10) <- P1C2S3J1_10_ini
  initial(P1C2S3J2_10) <- P1C2S3J2_10_ini
  initial(P1C2S3J3_10) <- P1C2S3J3_10_ini
  initial(P1C2S3J4_10) <- P1C2S3J4_10_ini
  initial(P1C3S1J1_10) <- P1C3S1J1_10_ini
  initial(P1C3S1J2_10) <- P1C3S1J2_10_ini
  initial(P1C3S1J3_10) <- P1C3S1J3_10_ini
  initial(P1C3S1J4_10) <- P1C3S1J4_10_ini
  initial(P1C3S2J1_10) <- P1C3S2J1_10_ini
  initial(P1C3S2J2_10) <- P1C3S2J2_10_ini
  initial(P1C3S2J3_10) <- P1C3S2J3_10_ini
  initial(P1C3S2J4_10) <- P1C3S2J4_10_ini
  initial(P1C3S3J1_10) <- P1C3S3J1_10_ini
  initial(P1C3S3J2_10) <- P1C3S3J2_10_ini
  initial(P1C3S3J3_10) <- P1C3S3J3_10_ini
  initial(P1C3S3J4_10) <- P1C3S3J4_10_ini
  initial(P1C4S1J1_10) <- P1C4S1J1_10_ini
  initial(P1C4S1J2_10) <- P1C4S1J2_10_ini
  initial(P1C4S1J3_10) <- P1C4S1J3_10_ini
  initial(P1C4S1J4_10) <- P1C4S1J4_10_ini
  initial(P1C4S2J1_10) <- P1C4S2J1_10_ini
  initial(P1C4S2J2_10) <- P1C4S2J2_10_ini
  initial(P1C4S2J3_10) <- P1C4S2J3_10_ini
  initial(P1C4S2J4_10) <- P1C4S2J4_10_ini
  initial(P1C4S3J1_10) <- P1C4S3J1_10_ini
  initial(P1C4S3J2_10) <- P1C4S3J2_10_ini
  initial(P1C4S3J3_10) <- P1C4S3J3_10_ini
  initial(P1C4S3J4_10) <- P1C4S3J4_10_ini
  initial(P2C1S1J1_10) <- P2C1S1J1_10_ini
  initial(P2C1S1J2_10) <- P2C1S1J2_10_ini
  initial(P2C1S1J3_10) <- P2C1S1J3_10_ini
  initial(P2C1S1J4_10) <- P2C1S1J4_10_ini
  initial(P2C1S2J1_10) <- P2C1S2J1_10_ini
  initial(P2C1S2J2_10) <- P2C1S2J2_10_ini
  initial(P2C1S2J3_10) <- P2C1S2J3_10_ini
  initial(P2C1S2J4_10) <- P2C1S2J4_10_ini
  initial(P2C1S3J1_10) <- P2C1S3J1_10_ini
  initial(P2C1S3J2_10) <- P2C1S3J2_10_ini
  initial(P2C1S3J3_10) <- P2C1S3J3_10_ini
  initial(P2C1S3J4_10) <- P2C1S3J4_10_ini
  initial(P2C2S1J1_10) <- P2C2S1J1_10_ini
  initial(P2C2S1J2_10) <- P2C2S1J2_10_ini
  initial(P2C2S1J3_10) <- P2C2S1J3_10_ini
  initial(P2C2S1J4_10) <- P2C2S1J4_10_ini
  initial(P2C2S2J1_10) <- P2C2S2J1_10_ini
  initial(P2C2S2J2_10) <- P2C2S2J2_10_ini
  initial(P2C2S2J3_10) <- P2C2S2J3_10_ini
  initial(P2C2S2J4_10) <- P2C2S2J4_10_ini
  initial(P2C2S3J1_10) <- P2C2S3J1_10_ini
  initial(P2C2S3J2_10) <- P2C2S3J2_10_ini
  initial(P2C2S3J3_10) <- P2C2S3J3_10_ini
  initial(P2C2S3J4_10) <- P2C2S3J4_10_ini
  initial(P2C3S1J1_10) <- P2C3S1J1_10_ini
  initial(P2C3S1J2_10) <- P2C3S1J2_10_ini
  initial(P2C3S1J3_10) <- P2C3S1J3_10_ini
  initial(P2C3S1J4_10) <- P2C3S1J4_10_ini
  initial(P2C3S2J1_10) <- P2C3S2J1_10_ini
  initial(P2C3S2J2_10) <- P2C3S2J2_10_ini
  initial(P2C3S2J3_10) <- P2C3S2J3_10_ini
  initial(P2C3S2J4_10) <- P2C3S2J4_10_ini
  initial(P2C3S3J1_10) <- P2C3S3J1_10_ini
  initial(P2C3S3J2_10) <- P2C3S3J2_10_ini
  initial(P2C3S3J3_10) <- P2C3S3J3_10_ini
  initial(P2C3S3J4_10) <- P2C3S3J4_10_ini
  initial(P2C4S1J1_10) <- P2C4S1J1_10_ini
  initial(P2C4S1J2_10) <- P2C4S1J2_10_ini
  initial(P2C4S1J3_10) <- P2C4S1J3_10_ini
  initial(P2C4S1J4_10) <- P2C4S1J4_10_ini
  initial(P2C4S2J1_10) <- P2C4S2J1_10_ini
  initial(P2C4S2J2_10) <- P2C4S2J2_10_ini
  initial(P2C4S2J3_10) <- P2C4S2J3_10_ini
  initial(P2C4S2J4_10) <- P2C4S2J4_10_ini
  initial(P2C4S3J1_10) <- P2C4S3J1_10_ini
  initial(P2C4S3J2_10) <- P2C4S3J2_10_ini
  initial(P2C4S3J3_10) <- P2C4S3J3_10_ini
  initial(P2C4S3J4_10) <- P2C4S3J4_10_ini
  initial(P1C1S1J1_11) <- P1C1S1J1_11_ini
  initial(P1C1S1J2_11) <- P1C1S1J2_11_ini
  initial(P1C1S1J3_11) <- P1C1S1J3_11_ini
  initial(P1C1S1J4_11) <- P1C1S1J4_11_ini
  initial(P1C1S2J1_11) <- P1C1S2J1_11_ini
  initial(P1C1S2J2_11) <- P1C1S2J2_11_ini
  initial(P1C1S2J3_11) <- P1C1S2J3_11_ini
  initial(P1C1S2J4_11) <- P1C1S2J4_11_ini
  initial(P1C1S3J1_11) <- P1C1S3J1_11_ini
  initial(P1C1S3J2_11) <- P1C1S3J2_11_ini
  initial(P1C1S3J3_11) <- P1C1S3J3_11_ini
  initial(P1C1S3J4_11) <- P1C1S3J4_11_ini
  initial(P1C2S1J1_11) <- P1C2S1J1_11_ini
  initial(P1C2S1J2_11) <- P1C2S1J2_11_ini
  initial(P1C2S1J3_11) <- P1C2S1J3_11_ini
  initial(P1C2S1J4_11) <- P1C2S1J4_11_ini
  initial(P1C2S2J1_11) <- P1C2S2J1_11_ini
  initial(P1C2S2J2_11) <- P1C2S2J2_11_ini
  initial(P1C2S2J3_11) <- P1C2S2J3_11_ini
  initial(P1C2S2J4_11) <- P1C2S2J4_11_ini
  initial(P1C2S3J1_11) <- P1C2S3J1_11_ini
  initial(P1C2S3J2_11) <- P1C2S3J2_11_ini
  initial(P1C2S3J3_11) <- P1C2S3J3_11_ini
  initial(P1C2S3J4_11) <- P1C2S3J4_11_ini
  initial(P1C3S1J1_11) <- P1C3S1J1_11_ini
  initial(P1C3S1J2_11) <- P1C3S1J2_11_ini
  initial(P1C3S1J3_11) <- P1C3S1J3_11_ini
  initial(P1C3S1J4_11) <- P1C3S1J4_11_ini
  initial(P1C3S2J1_11) <- P1C3S2J1_11_ini
  initial(P1C3S2J2_11) <- P1C3S2J2_11_ini
  initial(P1C3S2J3_11) <- P1C3S2J3_11_ini
  initial(P1C3S2J4_11) <- P1C3S2J4_11_ini
  initial(P1C3S3J1_11) <- P1C3S3J1_11_ini
  initial(P1C3S3J2_11) <- P1C3S3J2_11_ini
  initial(P1C3S3J3_11) <- P1C3S3J3_11_ini
  initial(P1C3S3J4_11) <- P1C3S3J4_11_ini
  initial(P1C4S1J1_11) <- P1C4S1J1_11_ini
  initial(P1C4S1J2_11) <- P1C4S1J2_11_ini
  initial(P1C4S1J3_11) <- P1C4S1J3_11_ini
  initial(P1C4S1J4_11) <- P1C4S1J4_11_ini
  initial(P1C4S2J1_11) <- P1C4S2J1_11_ini
  initial(P1C4S2J2_11) <- P1C4S2J2_11_ini
  initial(P1C4S2J3_11) <- P1C4S2J3_11_ini
  initial(P1C4S2J4_11) <- P1C4S2J4_11_ini
  initial(P1C4S3J1_11) <- P1C4S3J1_11_ini
  initial(P1C4S3J2_11) <- P1C4S3J2_11_ini
  initial(P1C4S3J3_11) <- P1C4S3J3_11_ini
  initial(P1C4S3J4_11) <- P1C4S3J4_11_ini
  initial(P2C1S1J1_11) <- P2C1S1J1_11_ini
  initial(P2C1S1J2_11) <- P2C1S1J2_11_ini
  initial(P2C1S1J3_11) <- P2C1S1J3_11_ini
  initial(P2C1S1J4_11) <- P2C1S1J4_11_ini
  initial(P2C1S2J1_11) <- P2C1S2J1_11_ini
  initial(P2C1S2J2_11) <- P2C1S2J2_11_ini
  initial(P2C1S2J3_11) <- P2C1S2J3_11_ini
  initial(P2C1S2J4_11) <- P2C1S2J4_11_ini
  initial(P2C1S3J1_11) <- P2C1S3J1_11_ini
  initial(P2C1S3J2_11) <- P2C1S3J2_11_ini
  initial(P2C1S3J3_11) <- P2C1S3J3_11_ini
  initial(P2C1S3J4_11) <- P2C1S3J4_11_ini
  initial(P2C2S1J1_11) <- P2C2S1J1_11_ini
  initial(P2C2S1J2_11) <- P2C2S1J2_11_ini
  initial(P2C2S1J3_11) <- P2C2S1J3_11_ini
  initial(P2C2S1J4_11) <- P2C2S1J4_11_ini
  initial(P2C2S2J1_11) <- P2C2S2J1_11_ini
  initial(P2C2S2J2_11) <- P2C2S2J2_11_ini
  initial(P2C2S2J3_11) <- P2C2S2J3_11_ini
  initial(P2C2S2J4_11) <- P2C2S2J4_11_ini
  initial(P2C2S3J1_11) <- P2C2S3J1_11_ini
  initial(P2C2S3J2_11) <- P2C2S3J2_11_ini
  initial(P2C2S3J3_11) <- P2C2S3J3_11_ini
  initial(P2C2S3J4_11) <- P2C2S3J4_11_ini
  initial(P2C3S1J1_11) <- P2C3S1J1_11_ini
  initial(P2C3S1J2_11) <- P2C3S1J2_11_ini
  initial(P2C3S1J3_11) <- P2C3S1J3_11_ini
  initial(P2C3S1J4_11) <- P2C3S1J4_11_ini
  initial(P2C3S2J1_11) <- P2C3S2J1_11_ini
  initial(P2C3S2J2_11) <- P2C3S2J2_11_ini
  initial(P2C3S2J3_11) <- P2C3S2J3_11_ini
  initial(P2C3S2J4_11) <- P2C3S2J4_11_ini
  initial(P2C3S3J1_11) <- P2C3S3J1_11_ini
  initial(P2C3S3J2_11) <- P2C3S3J2_11_ini
  initial(P2C3S3J3_11) <- P2C3S3J3_11_ini
  initial(P2C3S3J4_11) <- P2C3S3J4_11_ini
  initial(P2C4S1J1_11) <- P2C4S1J1_11_ini
  initial(P2C4S1J2_11) <- P2C4S1J2_11_ini
  initial(P2C4S1J3_11) <- P2C4S1J3_11_ini
  initial(P2C4S1J4_11) <- P2C4S1J4_11_ini
  initial(P2C4S2J1_11) <- P2C4S2J1_11_ini
  initial(P2C4S2J2_11) <- P2C4S2J2_11_ini
  initial(P2C4S2J3_11) <- P2C4S2J3_11_ini
  initial(P2C4S2J4_11) <- P2C4S2J4_11_ini
  initial(P2C4S3J1_11) <- P2C4S3J1_11_ini
  initial(P2C4S3J2_11) <- P2C4S3J2_11_ini
  initial(P2C4S3J3_11) <- P2C4S3J3_11_ini
  initial(P2C4S3J4_11) <- P2C4S3J4_11_ini
  initial(P1C1S1J1_12) <- P1C1S1J1_12_ini
  initial(P1C1S1J2_12) <- P1C1S1J2_12_ini
  initial(P1C1S1J3_12) <- P1C1S1J3_12_ini
  initial(P1C1S1J4_12) <- P1C1S1J4_12_ini
  initial(P1C1S2J1_12) <- P1C1S2J1_12_ini
  initial(P1C1S2J2_12) <- P1C1S2J2_12_ini
  initial(P1C1S2J3_12) <- P1C1S2J3_12_ini
  initial(P1C1S2J4_12) <- P1C1S2J4_12_ini
  initial(P1C1S3J1_12) <- P1C1S3J1_12_ini
  initial(P1C1S3J2_12) <- P1C1S3J2_12_ini
  initial(P1C1S3J3_12) <- P1C1S3J3_12_ini
  initial(P1C1S3J4_12) <- P1C1S3J4_12_ini
  initial(P1C2S1J1_12) <- P1C2S1J1_12_ini
  initial(P1C2S1J2_12) <- P1C2S1J2_12_ini
  initial(P1C2S1J3_12) <- P1C2S1J3_12_ini
  initial(P1C2S1J4_12) <- P1C2S1J4_12_ini
  initial(P1C2S2J1_12) <- P1C2S2J1_12_ini
  initial(P1C2S2J2_12) <- P1C2S2J2_12_ini
  initial(P1C2S2J3_12) <- P1C2S2J3_12_ini
  initial(P1C2S2J4_12) <- P1C2S2J4_12_ini
  initial(P1C2S3J1_12) <- P1C2S3J1_12_ini
  initial(P1C2S3J2_12) <- P1C2S3J2_12_ini
  initial(P1C2S3J3_12) <- P1C2S3J3_12_ini
  initial(P1C2S3J4_12) <- P1C2S3J4_12_ini
  initial(P1C3S1J1_12) <- P1C3S1J1_12_ini
  initial(P1C3S1J2_12) <- P1C3S1J2_12_ini
  initial(P1C3S1J3_12) <- P1C3S1J3_12_ini
  initial(P1C3S1J4_12) <- P1C3S1J4_12_ini
  initial(P1C3S2J1_12) <- P1C3S2J1_12_ini
  initial(P1C3S2J2_12) <- P1C3S2J2_12_ini
  initial(P1C3S2J3_12) <- P1C3S2J3_12_ini
  initial(P1C3S2J4_12) <- P1C3S2J4_12_ini
  initial(P1C3S3J1_12) <- P1C3S3J1_12_ini
  initial(P1C3S3J2_12) <- P1C3S3J2_12_ini
  initial(P1C3S3J3_12) <- P1C3S3J3_12_ini
  initial(P1C3S3J4_12) <- P1C3S3J4_12_ini
  initial(P1C4S1J1_12) <- P1C4S1J1_12_ini
  initial(P1C4S1J2_12) <- P1C4S1J2_12_ini
  initial(P1C4S1J3_12) <- P1C4S1J3_12_ini
  initial(P1C4S1J4_12) <- P1C4S1J4_12_ini
  initial(P1C4S2J1_12) <- P1C4S2J1_12_ini
  initial(P1C4S2J2_12) <- P1C4S2J2_12_ini
  initial(P1C4S2J3_12) <- P1C4S2J3_12_ini
  initial(P1C4S2J4_12) <- P1C4S2J4_12_ini
  initial(P1C4S3J1_12) <- P1C4S3J1_12_ini
  initial(P1C4S3J2_12) <- P1C4S3J2_12_ini
  initial(P1C4S3J3_12) <- P1C4S3J3_12_ini
  initial(P1C4S3J4_12) <- P1C4S3J4_12_ini
  initial(P2C1S1J1_12) <- P2C1S1J1_12_ini
  initial(P2C1S1J2_12) <- P2C1S1J2_12_ini
  initial(P2C1S1J3_12) <- P2C1S1J3_12_ini
  initial(P2C1S1J4_12) <- P2C1S1J4_12_ini
  initial(P2C1S2J1_12) <- P2C1S2J1_12_ini
  initial(P2C1S2J2_12) <- P2C1S2J2_12_ini
  initial(P2C1S2J3_12) <- P2C1S2J3_12_ini
  initial(P2C1S2J4_12) <- P2C1S2J4_12_ini
  initial(P2C1S3J1_12) <- P2C1S3J1_12_ini
  initial(P2C1S3J2_12) <- P2C1S3J2_12_ini
  initial(P2C1S3J3_12) <- P2C1S3J3_12_ini
  initial(P2C1S3J4_12) <- P2C1S3J4_12_ini
  initial(P2C2S1J1_12) <- P2C2S1J1_12_ini
  initial(P2C2S1J2_12) <- P2C2S1J2_12_ini
  initial(P2C2S1J3_12) <- P2C2S1J3_12_ini
  initial(P2C2S1J4_12) <- P2C2S1J4_12_ini
  initial(P2C2S2J1_12) <- P2C2S2J1_12_ini
  initial(P2C2S2J2_12) <- P2C2S2J2_12_ini
  initial(P2C2S2J3_12) <- P2C2S2J3_12_ini
  initial(P2C2S2J4_12) <- P2C2S2J4_12_ini
  initial(P2C2S3J1_12) <- P2C2S3J1_12_ini
  initial(P2C2S3J2_12) <- P2C2S3J2_12_ini
  initial(P2C2S3J3_12) <- P2C2S3J3_12_ini
  initial(P2C2S3J4_12) <- P2C2S3J4_12_ini
  initial(P2C3S1J1_12) <- P2C3S1J1_12_ini
  initial(P2C3S1J2_12) <- P2C3S1J2_12_ini
  initial(P2C3S1J3_12) <- P2C3S1J3_12_ini
  initial(P2C3S1J4_12) <- P2C3S1J4_12_ini
  initial(P2C3S2J1_12) <- P2C3S2J1_12_ini
  initial(P2C3S2J2_12) <- P2C3S2J2_12_ini
  initial(P2C3S2J3_12) <- P2C3S2J3_12_ini
  initial(P2C3S2J4_12) <- P2C3S2J4_12_ini
  initial(P2C3S3J1_12) <- P2C3S3J1_12_ini
  initial(P2C3S3J2_12) <- P2C3S3J2_12_ini
  initial(P2C3S3J3_12) <- P2C3S3J3_12_ini
  initial(P2C3S3J4_12) <- P2C3S3J4_12_ini
  initial(P2C4S1J1_12) <- P2C4S1J1_12_ini
  initial(P2C4S1J2_12) <- P2C4S1J2_12_ini
  initial(P2C4S1J3_12) <- P2C4S1J3_12_ini
  initial(P2C4S1J4_12) <- P2C4S1J4_12_ini
  initial(P2C4S2J1_12) <- P2C4S2J1_12_ini
  initial(P2C4S2J2_12) <- P2C4S2J2_12_ini
  initial(P2C4S2J3_12) <- P2C4S2J3_12_ini
  initial(P2C4S2J4_12) <- P2C4S2J4_12_ini
  initial(P2C4S3J1_12) <- P2C4S3J1_12_ini
  initial(P2C4S3J2_12) <- P2C4S3J2_12_ini
  initial(P2C4S3J3_12) <- P2C4S3J3_12_ini
  initial(P2C4S3J4_12) <- P2C4S3J4_12_ini
  initial(P1C1S1J1_13) <- P1C1S1J1_13_ini
  initial(P1C1S1J2_13) <- P1C1S1J2_13_ini
  initial(P1C1S1J3_13) <- P1C1S1J3_13_ini
  initial(P1C1S1J4_13) <- P1C1S1J4_13_ini
  initial(P1C1S2J1_13) <- P1C1S2J1_13_ini
  initial(P1C1S2J2_13) <- P1C1S2J2_13_ini
  initial(P1C1S2J3_13) <- P1C1S2J3_13_ini
  initial(P1C1S2J4_13) <- P1C1S2J4_13_ini
  initial(P1C1S3J1_13) <- P1C1S3J1_13_ini
  initial(P1C1S3J2_13) <- P1C1S3J2_13_ini
  initial(P1C1S3J3_13) <- P1C1S3J3_13_ini
  initial(P1C1S3J4_13) <- P1C1S3J4_13_ini
  initial(P1C2S1J1_13) <- P1C2S1J1_13_ini
  initial(P1C2S1J2_13) <- P1C2S1J2_13_ini
  initial(P1C2S1J3_13) <- P1C2S1J3_13_ini
  initial(P1C2S1J4_13) <- P1C2S1J4_13_ini
  initial(P1C2S2J1_13) <- P1C2S2J1_13_ini
  initial(P1C2S2J2_13) <- P1C2S2J2_13_ini
  initial(P1C2S2J3_13) <- P1C2S2J3_13_ini
  initial(P1C2S2J4_13) <- P1C2S2J4_13_ini
  initial(P1C2S3J1_13) <- P1C2S3J1_13_ini
  initial(P1C2S3J2_13) <- P1C2S3J2_13_ini
  initial(P1C2S3J3_13) <- P1C2S3J3_13_ini
  initial(P1C2S3J4_13) <- P1C2S3J4_13_ini
  initial(P1C3S1J1_13) <- P1C3S1J1_13_ini
  initial(P1C3S1J2_13) <- P1C3S1J2_13_ini
  initial(P1C3S1J3_13) <- P1C3S1J3_13_ini
  initial(P1C3S1J4_13) <- P1C3S1J4_13_ini
  initial(P1C3S2J1_13) <- P1C3S2J1_13_ini
  initial(P1C3S2J2_13) <- P1C3S2J2_13_ini
  initial(P1C3S2J3_13) <- P1C3S2J3_13_ini
  initial(P1C3S2J4_13) <- P1C3S2J4_13_ini
  initial(P1C3S3J1_13) <- P1C3S3J1_13_ini
  initial(P1C3S3J2_13) <- P1C3S3J2_13_ini
  initial(P1C3S3J3_13) <- P1C3S3J3_13_ini
  initial(P1C3S3J4_13) <- P1C3S3J4_13_ini
  initial(P1C4S1J1_13) <- P1C4S1J1_13_ini
  initial(P1C4S1J2_13) <- P1C4S1J2_13_ini
  initial(P1C4S1J3_13) <- P1C4S1J3_13_ini
  initial(P1C4S1J4_13) <- P1C4S1J4_13_ini
  initial(P1C4S2J1_13) <- P1C4S2J1_13_ini
  initial(P1C4S2J2_13) <- P1C4S2J2_13_ini
  initial(P1C4S2J3_13) <- P1C4S2J3_13_ini
  initial(P1C4S2J4_13) <- P1C4S2J4_13_ini
  initial(P1C4S3J1_13) <- P1C4S3J1_13_ini
  initial(P1C4S3J2_13) <- P1C4S3J2_13_ini
  initial(P1C4S3J3_13) <- P1C4S3J3_13_ini
  initial(P1C4S3J4_13) <- P1C4S3J4_13_ini
  initial(P2C1S1J1_13) <- P2C1S1J1_13_ini
  initial(P2C1S1J2_13) <- P2C1S1J2_13_ini
  initial(P2C1S1J3_13) <- P2C1S1J3_13_ini
  initial(P2C1S1J4_13) <- P2C1S1J4_13_ini
  initial(P2C1S2J1_13) <- P2C1S2J1_13_ini
  initial(P2C1S2J2_13) <- P2C1S2J2_13_ini
  initial(P2C1S2J3_13) <- P2C1S2J3_13_ini
  initial(P2C1S2J4_13) <- P2C1S2J4_13_ini
  initial(P2C1S3J1_13) <- P2C1S3J1_13_ini
  initial(P2C1S3J2_13) <- P2C1S3J2_13_ini
  initial(P2C1S3J3_13) <- P2C1S3J3_13_ini
  initial(P2C1S3J4_13) <- P2C1S3J4_13_ini
  initial(P2C2S1J1_13) <- P2C2S1J1_13_ini
  initial(P2C2S1J2_13) <- P2C2S1J2_13_ini
  initial(P2C2S1J3_13) <- P2C2S1J3_13_ini
  initial(P2C2S1J4_13) <- P2C2S1J4_13_ini
  initial(P2C2S2J1_13) <- P2C2S2J1_13_ini
  initial(P2C2S2J2_13) <- P2C2S2J2_13_ini
  initial(P2C2S2J3_13) <- P2C2S2J3_13_ini
  initial(P2C2S2J4_13) <- P2C2S2J4_13_ini
  initial(P2C2S3J1_13) <- P2C2S3J1_13_ini
  initial(P2C2S3J2_13) <- P2C2S3J2_13_ini
  initial(P2C2S3J3_13) <- P2C2S3J3_13_ini
  initial(P2C2S3J4_13) <- P2C2S3J4_13_ini
  initial(P2C3S1J1_13) <- P2C3S1J1_13_ini
  initial(P2C3S1J2_13) <- P2C3S1J2_13_ini
  initial(P2C3S1J3_13) <- P2C3S1J3_13_ini
  initial(P2C3S1J4_13) <- P2C3S1J4_13_ini
  initial(P2C3S2J1_13) <- P2C3S2J1_13_ini
  initial(P2C3S2J2_13) <- P2C3S2J2_13_ini
  initial(P2C3S2J3_13) <- P2C3S2J3_13_ini
  initial(P2C3S2J4_13) <- P2C3S2J4_13_ini
  initial(P2C3S3J1_13) <- P2C3S3J1_13_ini
  initial(P2C3S3J2_13) <- P2C3S3J2_13_ini
  initial(P2C3S3J3_13) <- P2C3S3J3_13_ini
  initial(P2C3S3J4_13) <- P2C3S3J4_13_ini
  initial(P2C4S1J1_13) <- P2C4S1J1_13_ini
  initial(P2C4S1J2_13) <- P2C4S1J2_13_ini
  initial(P2C4S1J3_13) <- P2C4S1J3_13_ini
  initial(P2C4S1J4_13) <- P2C4S1J4_13_ini
  initial(P2C4S2J1_13) <- P2C4S2J1_13_ini
  initial(P2C4S2J2_13) <- P2C4S2J2_13_ini
  initial(P2C4S2J3_13) <- P2C4S2J3_13_ini
  initial(P2C4S2J4_13) <- P2C4S2J4_13_ini
  initial(P2C4S3J1_13) <- P2C4S3J1_13_ini
  initial(P2C4S3J2_13) <- P2C4S3J2_13_ini
  initial(P2C4S3J3_13) <- P2C4S3J3_13_ini
  initial(P2C4S3J4_13) <- P2C4S3J4_13_ini
  initial(P1C1S1J1_14) <- P1C1S1J1_14_ini
  initial(P1C1S1J2_14) <- P1C1S1J2_14_ini
  initial(P1C1S1J3_14) <- P1C1S1J3_14_ini
  initial(P1C1S1J4_14) <- P1C1S1J4_14_ini
  initial(P1C1S2J1_14) <- P1C1S2J1_14_ini
  initial(P1C1S2J2_14) <- P1C1S2J2_14_ini
  initial(P1C1S2J3_14) <- P1C1S2J3_14_ini
  initial(P1C1S2J4_14) <- P1C1S2J4_14_ini
  initial(P1C1S3J1_14) <- P1C1S3J1_14_ini
  initial(P1C1S3J2_14) <- P1C1S3J2_14_ini
  initial(P1C1S3J3_14) <- P1C1S3J3_14_ini
  initial(P1C1S3J4_14) <- P1C1S3J4_14_ini
  initial(P1C2S1J1_14) <- P1C2S1J1_14_ini
  initial(P1C2S1J2_14) <- P1C2S1J2_14_ini
  initial(P1C2S1J3_14) <- P1C2S1J3_14_ini
  initial(P1C2S1J4_14) <- P1C2S1J4_14_ini
  initial(P1C2S2J1_14) <- P1C2S2J1_14_ini
  initial(P1C2S2J2_14) <- P1C2S2J2_14_ini
  initial(P1C2S2J3_14) <- P1C2S2J3_14_ini
  initial(P1C2S2J4_14) <- P1C2S2J4_14_ini
  initial(P1C2S3J1_14) <- P1C2S3J1_14_ini
  initial(P1C2S3J2_14) <- P1C2S3J2_14_ini
  initial(P1C2S3J3_14) <- P1C2S3J3_14_ini
  initial(P1C2S3J4_14) <- P1C2S3J4_14_ini
  initial(P1C3S1J1_14) <- P1C3S1J1_14_ini
  initial(P1C3S1J2_14) <- P1C3S1J2_14_ini
  initial(P1C3S1J3_14) <- P1C3S1J3_14_ini
  initial(P1C3S1J4_14) <- P1C3S1J4_14_ini
  initial(P1C3S2J1_14) <- P1C3S2J1_14_ini
  initial(P1C3S2J2_14) <- P1C3S2J2_14_ini
  initial(P1C3S2J3_14) <- P1C3S2J3_14_ini
  initial(P1C3S2J4_14) <- P1C3S2J4_14_ini
  initial(P1C3S3J1_14) <- P1C3S3J1_14_ini
  initial(P1C3S3J2_14) <- P1C3S3J2_14_ini
  initial(P1C3S3J3_14) <- P1C3S3J3_14_ini
  initial(P1C3S3J4_14) <- P1C3S3J4_14_ini
  initial(P1C4S1J1_14) <- P1C4S1J1_14_ini
  initial(P1C4S1J2_14) <- P1C4S1J2_14_ini
  initial(P1C4S1J3_14) <- P1C4S1J3_14_ini
  initial(P1C4S1J4_14) <- P1C4S1J4_14_ini
  initial(P1C4S2J1_14) <- P1C4S2J1_14_ini
  initial(P1C4S2J2_14) <- P1C4S2J2_14_ini
  initial(P1C4S2J3_14) <- P1C4S2J3_14_ini
  initial(P1C4S2J4_14) <- P1C4S2J4_14_ini
  initial(P1C4S3J1_14) <- P1C4S3J1_14_ini
  initial(P1C4S3J2_14) <- P1C4S3J2_14_ini
  initial(P1C4S3J3_14) <- P1C4S3J3_14_ini
  initial(P1C4S3J4_14) <- P1C4S3J4_14_ini
  initial(P2C1S1J1_14) <- P2C1S1J1_14_ini
  initial(P2C1S1J2_14) <- P2C1S1J2_14_ini
  initial(P2C1S1J3_14) <- P2C1S1J3_14_ini
  initial(P2C1S1J4_14) <- P2C1S1J4_14_ini
  initial(P2C1S2J1_14) <- P2C1S2J1_14_ini
  initial(P2C1S2J2_14) <- P2C1S2J2_14_ini
  initial(P2C1S2J3_14) <- P2C1S2J3_14_ini
  initial(P2C1S2J4_14) <- P2C1S2J4_14_ini
  initial(P2C1S3J1_14) <- P2C1S3J1_14_ini
  initial(P2C1S3J2_14) <- P2C1S3J2_14_ini
  initial(P2C1S3J3_14) <- P2C1S3J3_14_ini
  initial(P2C1S3J4_14) <- P2C1S3J4_14_ini
  initial(P2C2S1J1_14) <- P2C2S1J1_14_ini
  initial(P2C2S1J2_14) <- P2C2S1J2_14_ini
  initial(P2C2S1J3_14) <- P2C2S1J3_14_ini
  initial(P2C2S1J4_14) <- P2C2S1J4_14_ini
  initial(P2C2S2J1_14) <- P2C2S2J1_14_ini
  initial(P2C2S2J2_14) <- P2C2S2J2_14_ini
  initial(P2C2S2J3_14) <- P2C2S2J3_14_ini
  initial(P2C2S2J4_14) <- P2C2S2J4_14_ini
  initial(P2C2S3J1_14) <- P2C2S3J1_14_ini
  initial(P2C2S3J2_14) <- P2C2S3J2_14_ini
  initial(P2C2S3J3_14) <- P2C2S3J3_14_ini
  initial(P2C2S3J4_14) <- P2C2S3J4_14_ini
  initial(P2C3S1J1_14) <- P2C3S1J1_14_ini
  initial(P2C3S1J2_14) <- P2C3S1J2_14_ini
  initial(P2C3S1J3_14) <- P2C3S1J3_14_ini
  initial(P2C3S1J4_14) <- P2C3S1J4_14_ini
  initial(P2C3S2J1_14) <- P2C3S2J1_14_ini
  initial(P2C3S2J2_14) <- P2C3S2J2_14_ini
  initial(P2C3S2J3_14) <- P2C3S2J3_14_ini
  initial(P2C3S2J4_14) <- P2C3S2J4_14_ini
  initial(P2C3S3J1_14) <- P2C3S3J1_14_ini
  initial(P2C3S3J2_14) <- P2C3S3J2_14_ini
  initial(P2C3S3J3_14) <- P2C3S3J3_14_ini
  initial(P2C3S3J4_14) <- P2C3S3J4_14_ini
  initial(P2C4S1J1_14) <- P2C4S1J1_14_ini
  initial(P2C4S1J2_14) <- P2C4S1J2_14_ini
  initial(P2C4S1J3_14) <- P2C4S1J3_14_ini
  initial(P2C4S1J4_14) <- P2C4S1J4_14_ini
  initial(P2C4S2J1_14) <- P2C4S2J1_14_ini
  initial(P2C4S2J2_14) <- P2C4S2J2_14_ini
  initial(P2C4S2J3_14) <- P2C4S2J3_14_ini
  initial(P2C4S2J4_14) <- P2C4S2J4_14_ini
  initial(P2C4S3J1_14) <- P2C4S3J1_14_ini
  initial(P2C4S3J2_14) <- P2C4S3J2_14_ini
  initial(P2C4S3J3_14) <- P2C4S3J3_14_ini
  initial(P2C4S3J4_14) <- P2C4S3J4_14_ini
  initial(P1C1S1J1_15) <- P1C1S1J1_15_ini
  initial(P1C1S1J2_15) <- P1C1S1J2_15_ini
  initial(P1C1S1J3_15) <- P1C1S1J3_15_ini
  initial(P1C1S1J4_15) <- P1C1S1J4_15_ini
  initial(P1C1S2J1_15) <- P1C1S2J1_15_ini
  initial(P1C1S2J2_15) <- P1C1S2J2_15_ini
  initial(P1C1S2J3_15) <- P1C1S2J3_15_ini
  initial(P1C1S2J4_15) <- P1C1S2J4_15_ini
  initial(P1C1S3J1_15) <- P1C1S3J1_15_ini
  initial(P1C1S3J2_15) <- P1C1S3J2_15_ini
  initial(P1C1S3J3_15) <- P1C1S3J3_15_ini
  initial(P1C1S3J4_15) <- P1C1S3J4_15_ini
  initial(P1C2S1J1_15) <- P1C2S1J1_15_ini
  initial(P1C2S1J2_15) <- P1C2S1J2_15_ini
  initial(P1C2S1J3_15) <- P1C2S1J3_15_ini
  initial(P1C2S1J4_15) <- P1C2S1J4_15_ini
  initial(P1C2S2J1_15) <- P1C2S2J1_15_ini
  initial(P1C2S2J2_15) <- P1C2S2J2_15_ini
  initial(P1C2S2J3_15) <- P1C2S2J3_15_ini
  initial(P1C2S2J4_15) <- P1C2S2J4_15_ini
  initial(P1C2S3J1_15) <- P1C2S3J1_15_ini
  initial(P1C2S3J2_15) <- P1C2S3J2_15_ini
  initial(P1C2S3J3_15) <- P1C2S3J3_15_ini
  initial(P1C2S3J4_15) <- P1C2S3J4_15_ini
  initial(P1C3S1J1_15) <- P1C3S1J1_15_ini
  initial(P1C3S1J2_15) <- P1C3S1J2_15_ini
  initial(P1C3S1J3_15) <- P1C3S1J3_15_ini
  initial(P1C3S1J4_15) <- P1C3S1J4_15_ini
  initial(P1C3S2J1_15) <- P1C3S2J1_15_ini
  initial(P1C3S2J2_15) <- P1C3S2J2_15_ini
  initial(P1C3S2J3_15) <- P1C3S2J3_15_ini
  initial(P1C3S2J4_15) <- P1C3S2J4_15_ini
  initial(P1C3S3J1_15) <- P1C3S3J1_15_ini
  initial(P1C3S3J2_15) <- P1C3S3J2_15_ini
  initial(P1C3S3J3_15) <- P1C3S3J3_15_ini
  initial(P1C3S3J4_15) <- P1C3S3J4_15_ini
  initial(P1C4S1J1_15) <- P1C4S1J1_15_ini
  initial(P1C4S1J2_15) <- P1C4S1J2_15_ini
  initial(P1C4S1J3_15) <- P1C4S1J3_15_ini
  initial(P1C4S1J4_15) <- P1C4S1J4_15_ini
  initial(P1C4S2J1_15) <- P1C4S2J1_15_ini
  initial(P1C4S2J2_15) <- P1C4S2J2_15_ini
  initial(P1C4S2J3_15) <- P1C4S2J3_15_ini
  initial(P1C4S2J4_15) <- P1C4S2J4_15_ini
  initial(P1C4S3J1_15) <- P1C4S3J1_15_ini
  initial(P1C4S3J2_15) <- P1C4S3J2_15_ini
  initial(P1C4S3J3_15) <- P1C4S3J3_15_ini
  initial(P1C4S3J4_15) <- P1C4S3J4_15_ini
  initial(P2C1S1J1_15) <- P2C1S1J1_15_ini
  initial(P2C1S1J2_15) <- P2C1S1J2_15_ini
  initial(P2C1S1J3_15) <- P2C1S1J3_15_ini
  initial(P2C1S1J4_15) <- P2C1S1J4_15_ini
  initial(P2C1S2J1_15) <- P2C1S2J1_15_ini
  initial(P2C1S2J2_15) <- P2C1S2J2_15_ini
  initial(P2C1S2J3_15) <- P2C1S2J3_15_ini
  initial(P2C1S2J4_15) <- P2C1S2J4_15_ini
  initial(P2C1S3J1_15) <- P2C1S3J1_15_ini
  initial(P2C1S3J2_15) <- P2C1S3J2_15_ini
  initial(P2C1S3J3_15) <- P2C1S3J3_15_ini
  initial(P2C1S3J4_15) <- P2C1S3J4_15_ini
  initial(P2C2S1J1_15) <- P2C2S1J1_15_ini
  initial(P2C2S1J2_15) <- P2C2S1J2_15_ini
  initial(P2C2S1J3_15) <- P2C2S1J3_15_ini
  initial(P2C2S1J4_15) <- P2C2S1J4_15_ini
  initial(P2C2S2J1_15) <- P2C2S2J1_15_ini
  initial(P2C2S2J2_15) <- P2C2S2J2_15_ini
  initial(P2C2S2J3_15) <- P2C2S2J3_15_ini
  initial(P2C2S2J4_15) <- P2C2S2J4_15_ini
  initial(P2C2S3J1_15) <- P2C2S3J1_15_ini
  initial(P2C2S3J2_15) <- P2C2S3J2_15_ini
  initial(P2C2S3J3_15) <- P2C2S3J3_15_ini
  initial(P2C2S3J4_15) <- P2C2S3J4_15_ini
  initial(P2C3S1J1_15) <- P2C3S1J1_15_ini
  initial(P2C3S1J2_15) <- P2C3S1J2_15_ini
  initial(P2C3S1J3_15) <- P2C3S1J3_15_ini
  initial(P2C3S1J4_15) <- P2C3S1J4_15_ini
  initial(P2C3S2J1_15) <- P2C3S2J1_15_ini
  initial(P2C3S2J2_15) <- P2C3S2J2_15_ini
  initial(P2C3S2J3_15) <- P2C3S2J3_15_ini
  initial(P2C3S2J4_15) <- P2C3S2J4_15_ini
  initial(P2C3S3J1_15) <- P2C3S3J1_15_ini
  initial(P2C3S3J2_15) <- P2C3S3J2_15_ini
  initial(P2C3S3J3_15) <- P2C3S3J3_15_ini
  initial(P2C3S3J4_15) <- P2C3S3J4_15_ini
  initial(P2C4S1J1_15) <- P2C4S1J1_15_ini
  initial(P2C4S1J2_15) <- P2C4S1J2_15_ini
  initial(P2C4S1J3_15) <- P2C4S1J3_15_ini
  initial(P2C4S1J4_15) <- P2C4S1J4_15_ini
  initial(P2C4S2J1_15) <- P2C4S2J1_15_ini
  initial(P2C4S2J2_15) <- P2C4S2J2_15_ini
  initial(P2C4S2J3_15) <- P2C4S2J3_15_ini
  initial(P2C4S2J4_15) <- P2C4S2J4_15_ini
  initial(P2C4S3J1_15) <- P2C4S3J1_15_ini
  initial(P2C4S3J2_15) <- P2C4S3J2_15_ini
  initial(P2C4S3J3_15) <- P2C4S3J3_15_ini
  initial(P2C4S3J4_15) <- P2C4S3J4_15_ini
  initial(P1C1S1J1_16) <- P1C1S1J1_16_ini
  initial(P1C1S1J2_16) <- P1C1S1J2_16_ini
  initial(P1C1S1J3_16) <- P1C1S1J3_16_ini
  initial(P1C1S1J4_16) <- P1C1S1J4_16_ini
  initial(P1C1S2J1_16) <- P1C1S2J1_16_ini
  initial(P1C1S2J2_16) <- P1C1S2J2_16_ini
  initial(P1C1S2J3_16) <- P1C1S2J3_16_ini
  initial(P1C1S2J4_16) <- P1C1S2J4_16_ini
  initial(P1C1S3J1_16) <- P1C1S3J1_16_ini
  initial(P1C1S3J2_16) <- P1C1S3J2_16_ini
  initial(P1C1S3J3_16) <- P1C1S3J3_16_ini
  initial(P1C1S3J4_16) <- P1C1S3J4_16_ini
  initial(P1C2S1J1_16) <- P1C2S1J1_16_ini
  initial(P1C2S1J2_16) <- P1C2S1J2_16_ini
  initial(P1C2S1J3_16) <- P1C2S1J3_16_ini
  initial(P1C2S1J4_16) <- P1C2S1J4_16_ini
  initial(P1C2S2J1_16) <- P1C2S2J1_16_ini
  initial(P1C2S2J2_16) <- P1C2S2J2_16_ini
  initial(P1C2S2J3_16) <- P1C2S2J3_16_ini
  initial(P1C2S2J4_16) <- P1C2S2J4_16_ini
  initial(P1C2S3J1_16) <- P1C2S3J1_16_ini
  initial(P1C2S3J2_16) <- P1C2S3J2_16_ini
  initial(P1C2S3J3_16) <- P1C2S3J3_16_ini
  initial(P1C2S3J4_16) <- P1C2S3J4_16_ini
  initial(P1C3S1J1_16) <- P1C3S1J1_16_ini
  initial(P1C3S1J2_16) <- P1C3S1J2_16_ini
  initial(P1C3S1J3_16) <- P1C3S1J3_16_ini
  initial(P1C3S1J4_16) <- P1C3S1J4_16_ini
  initial(P1C3S2J1_16) <- P1C3S2J1_16_ini
  initial(P1C3S2J2_16) <- P1C3S2J2_16_ini
  initial(P1C3S2J3_16) <- P1C3S2J3_16_ini
  initial(P1C3S2J4_16) <- P1C3S2J4_16_ini
  initial(P1C3S3J1_16) <- P1C3S3J1_16_ini
  initial(P1C3S3J2_16) <- P1C3S3J2_16_ini
  initial(P1C3S3J3_16) <- P1C3S3J3_16_ini
  initial(P1C3S3J4_16) <- P1C3S3J4_16_ini
  initial(P1C4S1J1_16) <- P1C4S1J1_16_ini
  initial(P1C4S1J2_16) <- P1C4S1J2_16_ini
  initial(P1C4S1J3_16) <- P1C4S1J3_16_ini
  initial(P1C4S1J4_16) <- P1C4S1J4_16_ini
  initial(P1C4S2J1_16) <- P1C4S2J1_16_ini
  initial(P1C4S2J2_16) <- P1C4S2J2_16_ini
  initial(P1C4S2J3_16) <- P1C4S2J3_16_ini
  initial(P1C4S2J4_16) <- P1C4S2J4_16_ini
  initial(P1C4S3J1_16) <- P1C4S3J1_16_ini
  initial(P1C4S3J2_16) <- P1C4S3J2_16_ini
  initial(P1C4S3J3_16) <- P1C4S3J3_16_ini
  initial(P1C4S3J4_16) <- P1C4S3J4_16_ini
  initial(P2C1S1J1_16) <- P2C1S1J1_16_ini
  initial(P2C1S1J2_16) <- P2C1S1J2_16_ini
  initial(P2C1S1J3_16) <- P2C1S1J3_16_ini
  initial(P2C1S1J4_16) <- P2C1S1J4_16_ini
  initial(P2C1S2J1_16) <- P2C1S2J1_16_ini
  initial(P2C1S2J2_16) <- P2C1S2J2_16_ini
  initial(P2C1S2J3_16) <- P2C1S2J3_16_ini
  initial(P2C1S2J4_16) <- P2C1S2J4_16_ini
  initial(P2C1S3J1_16) <- P2C1S3J1_16_ini
  initial(P2C1S3J2_16) <- P2C1S3J2_16_ini
  initial(P2C1S3J3_16) <- P2C1S3J3_16_ini
  initial(P2C1S3J4_16) <- P2C1S3J4_16_ini
  initial(P2C2S1J1_16) <- P2C2S1J1_16_ini
  initial(P2C2S1J2_16) <- P2C2S1J2_16_ini
  initial(P2C2S1J3_16) <- P2C2S1J3_16_ini
  initial(P2C2S1J4_16) <- P2C2S1J4_16_ini
  initial(P2C2S2J1_16) <- P2C2S2J1_16_ini
  initial(P2C2S2J2_16) <- P2C2S2J2_16_ini
  initial(P2C2S2J3_16) <- P2C2S2J3_16_ini
  initial(P2C2S2J4_16) <- P2C2S2J4_16_ini
  initial(P2C2S3J1_16) <- P2C2S3J1_16_ini
  initial(P2C2S3J2_16) <- P2C2S3J2_16_ini
  initial(P2C2S3J3_16) <- P2C2S3J3_16_ini
  initial(P2C2S3J4_16) <- P2C2S3J4_16_ini
  initial(P2C3S1J1_16) <- P2C3S1J1_16_ini
  initial(P2C3S1J2_16) <- P2C3S1J2_16_ini
  initial(P2C3S1J3_16) <- P2C3S1J3_16_ini
  initial(P2C3S1J4_16) <- P2C3S1J4_16_ini
  initial(P2C3S2J1_16) <- P2C3S2J1_16_ini
  initial(P2C3S2J2_16) <- P2C3S2J2_16_ini
  initial(P2C3S2J3_16) <- P2C3S2J3_16_ini
  initial(P2C3S2J4_16) <- P2C3S2J4_16_ini
  initial(P2C3S3J1_16) <- P2C3S3J1_16_ini
  initial(P2C3S3J2_16) <- P2C3S3J2_16_ini
  initial(P2C3S3J3_16) <- P2C3S3J3_16_ini
  initial(P2C3S3J4_16) <- P2C3S3J4_16_ini
  initial(P2C4S1J1_16) <- P2C4S1J1_16_ini
  initial(P2C4S1J2_16) <- P2C4S1J2_16_ini
  initial(P2C4S1J3_16) <- P2C4S1J3_16_ini
  initial(P2C4S1J4_16) <- P2C4S1J4_16_ini
  initial(P2C4S2J1_16) <- P2C4S2J1_16_ini
  initial(P2C4S2J2_16) <- P2C4S2J2_16_ini
  initial(P2C4S2J3_16) <- P2C4S2J3_16_ini
  initial(P2C4S2J4_16) <- P2C4S2J4_16_ini
  initial(P2C4S3J1_16) <- P2C4S3J1_16_ini
  initial(P2C4S3J2_16) <- P2C4S3J2_16_ini
  initial(P2C4S3J3_16) <- P2C4S3J3_16_ini
  initial(P2C4S3J4_16) <- P2C4S3J4_16_ini
  initial(P1C1S1J1_17) <- P1C1S1J1_17_ini
  initial(P1C1S1J2_17) <- P1C1S1J2_17_ini
  initial(P1C1S1J3_17) <- P1C1S1J3_17_ini
  initial(P1C1S1J4_17) <- P1C1S1J4_17_ini
  initial(P1C1S2J1_17) <- P1C1S2J1_17_ini
  initial(P1C1S2J2_17) <- P1C1S2J2_17_ini
  initial(P1C1S2J3_17) <- P1C1S2J3_17_ini
  initial(P1C1S2J4_17) <- P1C1S2J4_17_ini
  initial(P1C1S3J1_17) <- P1C1S3J1_17_ini
  initial(P1C1S3J2_17) <- P1C1S3J2_17_ini
  initial(P1C1S3J3_17) <- P1C1S3J3_17_ini
  initial(P1C1S3J4_17) <- P1C1S3J4_17_ini
  initial(P1C2S1J1_17) <- P1C2S1J1_17_ini
  initial(P1C2S1J2_17) <- P1C2S1J2_17_ini
  initial(P1C2S1J3_17) <- P1C2S1J3_17_ini
  initial(P1C2S1J4_17) <- P1C2S1J4_17_ini
  initial(P1C2S2J1_17) <- P1C2S2J1_17_ini
  initial(P1C2S2J2_17) <- P1C2S2J2_17_ini
  initial(P1C2S2J3_17) <- P1C2S2J3_17_ini
  initial(P1C2S2J4_17) <- P1C2S2J4_17_ini
  initial(P1C2S3J1_17) <- P1C2S3J1_17_ini
  initial(P1C2S3J2_17) <- P1C2S3J2_17_ini
  initial(P1C2S3J3_17) <- P1C2S3J3_17_ini
  initial(P1C2S3J4_17) <- P1C2S3J4_17_ini
  initial(P1C3S1J1_17) <- P1C3S1J1_17_ini
  initial(P1C3S1J2_17) <- P1C3S1J2_17_ini
  initial(P1C3S1J3_17) <- P1C3S1J3_17_ini
  initial(P1C3S1J4_17) <- P1C3S1J4_17_ini
  initial(P1C3S2J1_17) <- P1C3S2J1_17_ini
  initial(P1C3S2J2_17) <- P1C3S2J2_17_ini
  initial(P1C3S2J3_17) <- P1C3S2J3_17_ini
  initial(P1C3S2J4_17) <- P1C3S2J4_17_ini
  initial(P1C3S3J1_17) <- P1C3S3J1_17_ini
  initial(P1C3S3J2_17) <- P1C3S3J2_17_ini
  initial(P1C3S3J3_17) <- P1C3S3J3_17_ini
  initial(P1C3S3J4_17) <- P1C3S3J4_17_ini
  initial(P1C4S1J1_17) <- P1C4S1J1_17_ini
  initial(P1C4S1J2_17) <- P1C4S1J2_17_ini
  initial(P1C4S1J3_17) <- P1C4S1J3_17_ini
  initial(P1C4S1J4_17) <- P1C4S1J4_17_ini
  initial(P1C4S2J1_17) <- P1C4S2J1_17_ini
  initial(P1C4S2J2_17) <- P1C4S2J2_17_ini
  initial(P1C4S2J3_17) <- P1C4S2J3_17_ini
  initial(P1C4S2J4_17) <- P1C4S2J4_17_ini
  initial(P1C4S3J1_17) <- P1C4S3J1_17_ini
  initial(P1C4S3J2_17) <- P1C4S3J2_17_ini
  initial(P1C4S3J3_17) <- P1C4S3J3_17_ini
  initial(P1C4S3J4_17) <- P1C4S3J4_17_ini
  initial(P2C1S1J1_17) <- P2C1S1J1_17_ini
  initial(P2C1S1J2_17) <- P2C1S1J2_17_ini
  initial(P2C1S1J3_17) <- P2C1S1J3_17_ini
  initial(P2C1S1J4_17) <- P2C1S1J4_17_ini
  initial(P2C1S2J1_17) <- P2C1S2J1_17_ini
  initial(P2C1S2J2_17) <- P2C1S2J2_17_ini
  initial(P2C1S2J3_17) <- P2C1S2J3_17_ini
  initial(P2C1S2J4_17) <- P2C1S2J4_17_ini
  initial(P2C1S3J1_17) <- P2C1S3J1_17_ini
  initial(P2C1S3J2_17) <- P2C1S3J2_17_ini
  initial(P2C1S3J3_17) <- P2C1S3J3_17_ini
  initial(P2C1S3J4_17) <- P2C1S3J4_17_ini
  initial(P2C2S1J1_17) <- P2C2S1J1_17_ini
  initial(P2C2S1J2_17) <- P2C2S1J2_17_ini
  initial(P2C2S1J3_17) <- P2C2S1J3_17_ini
  initial(P2C2S1J4_17) <- P2C2S1J4_17_ini
  initial(P2C2S2J1_17) <- P2C2S2J1_17_ini
  initial(P2C2S2J2_17) <- P2C2S2J2_17_ini
  initial(P2C2S2J3_17) <- P2C2S2J3_17_ini
  initial(P2C2S2J4_17) <- P2C2S2J4_17_ini
  initial(P2C2S3J1_17) <- P2C2S3J1_17_ini
  initial(P2C2S3J2_17) <- P2C2S3J2_17_ini
  initial(P2C2S3J3_17) <- P2C2S3J3_17_ini
  initial(P2C2S3J4_17) <- P2C2S3J4_17_ini
  initial(P2C3S1J1_17) <- P2C3S1J1_17_ini
  initial(P2C3S1J2_17) <- P2C3S1J2_17_ini
  initial(P2C3S1J3_17) <- P2C3S1J3_17_ini
  initial(P2C3S1J4_17) <- P2C3S1J4_17_ini
  initial(P2C3S2J1_17) <- P2C3S2J1_17_ini
  initial(P2C3S2J2_17) <- P2C3S2J2_17_ini
  initial(P2C3S2J3_17) <- P2C3S2J3_17_ini
  initial(P2C3S2J4_17) <- P2C3S2J4_17_ini
  initial(P2C3S3J1_17) <- P2C3S3J1_17_ini
  initial(P2C3S3J2_17) <- P2C3S3J2_17_ini
  initial(P2C3S3J3_17) <- P2C3S3J3_17_ini
  initial(P2C3S3J4_17) <- P2C3S3J4_17_ini
  initial(P2C4S1J1_17) <- P2C4S1J1_17_ini
  initial(P2C4S1J2_17) <- P2C4S1J2_17_ini
  initial(P2C4S1J3_17) <- P2C4S1J3_17_ini
  initial(P2C4S1J4_17) <- P2C4S1J4_17_ini
  initial(P2C4S2J1_17) <- P2C4S2J1_17_ini
  initial(P2C4S2J2_17) <- P2C4S2J2_17_ini
  initial(P2C4S2J3_17) <- P2C4S2J3_17_ini
  initial(P2C4S2J4_17) <- P2C4S2J4_17_ini
  initial(P2C4S3J1_17) <- P2C4S3J1_17_ini
  initial(P2C4S3J2_17) <- P2C4S3J2_17_ini
  initial(P2C4S3J3_17) <- P2C4S3J3_17_ini
  initial(P2C4S3J4_17) <- P2C4S3J4_17_ini
  
  ##############################################################################################################################
  # other eqs # # #  # # #
  ###############################################################################################################################
  
  neet16_p1c1s1j1 <- neet16
  neet16_p1c1s1j2 <- neet16
  neet16_p1c1s1j3 <- neet16*vsig_j
  neet16_p1c1s1j4 <- neet16*vsig_j
  neet16_p1c1s2j1 <- neet16*vsig_s
  neet16_p1c1s2j2 <- neet16*vsig_s
  neet16_p1c1s2j3 <- neet16*vsig_s*vsig_j
  neet16_p1c1s2j4 <- neet16*vsig_s*vsig_j
  neet16_p1c1s3j1 <- neet16*vsig_s
  neet16_p1c1s3j2 <- neet16*vsig_s
  neet16_p1c1s3j3 <- neet16*vsig_s*vsig_j
  neet16_p1c1s3j4 <- neet16*vsig_s*vsig_j
  neet16_p1c2s1j1 <- neet16*vsig_c
  neet16_p1c2s1j2 <- neet16*vsig_c
  neet16_p1c2s1j3 <- neet16*vsig_c*vsig_j
  neet16_p1c2s1j4 <- neet16*vsig_c*vsig_j
  neet16_p1c2s2j1 <- neet16*vsig_c*vsig_s
  neet16_p1c2s2j2 <- neet16*vsig_c*vsig_s
  neet16_p1c2s2j3 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c2s2j4 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c2s3j1 <- neet16*vsig_c*vsig_s
  neet16_p1c2s3j2 <- neet16*vsig_c*vsig_s
  neet16_p1c2s3j3 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c2s3j4 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c3s1j1 <- neet16*vsig_c
  neet16_p1c3s1j2 <- neet16*vsig_c
  neet16_p1c3s1j3 <- neet16*vsig_c*vsig_j
  neet16_p1c3s1j4 <- neet16*vsig_c*vsig_j
  neet16_p1c3s2j1 <- neet16*vsig_c*vsig_s
  neet16_p1c3s2j2 <- neet16*vsig_c*vsig_s
  neet16_p1c3s2j3 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c3s2j4 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c3s3j1 <- neet16*vsig_c*vsig_s
  neet16_p1c3s3j2 <- neet16*vsig_c*vsig_s
  neet16_p1c3s3j3 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c3s3j4 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c4s1j1 <- neet16*vsig_c
  neet16_p1c4s1j2 <- neet16*vsig_c
  neet16_p1c4s1j3 <- neet16*vsig_c*vsig_j
  neet16_p1c4s1j4 <- neet16*vsig_c*vsig_j
  neet16_p1c4s2j1 <- neet16*vsig_c*vsig_s
  neet16_p1c4s2j2 <- neet16*vsig_c*vsig_s
  neet16_p1c4s2j3 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c4s2j4 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c4s3j1 <- neet16*vsig_c*vsig_s
  neet16_p1c4s3j2 <- neet16*vsig_c*vsig_s
  neet16_p1c4s3j3 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p1c4s3j4 <- neet16*vsig_c*vsig_s*vsig_j
  neet16_p2c1s1j1 <- neet16*vsig_p
  neet16_p2c1s1j2 <- neet16*vsig_p
  neet16_p2c1s1j3 <- neet16*vsig_p*vsig_j
  neet16_p2c1s1j4 <- neet16*vsig_p*vsig_j
  neet16_p2c1s2j1 <- neet16*vsig_p*vsig_s
  neet16_p2c1s2j2 <- neet16*vsig_p*vsig_s
  neet16_p2c1s2j3 <- neet16*vsig_p*vsig_s*vsig_j
  neet16_p2c1s2j4 <- neet16*vsig_p*vsig_s*vsig_j
  neet16_p2c1s3j1 <- neet16*vsig_p*vsig_s
  neet16_p2c1s3j2 <- neet16*vsig_p*vsig_s
  neet16_p2c1s3j3 <- neet16*vsig_p*vsig_s*vsig_j
  neet16_p2c1s3j4 <- neet16*vsig_p*vsig_s*vsig_j
  neet16_p2c2s1j1 <- neet16*vsig_p*vsig_c
  neet16_p2c2s1j2 <- neet16*vsig_p*vsig_c
  neet16_p2c2s1j3 <- neet16*vsig_p*vsig_c*vsig_j
  neet16_p2c2s1j4 <- neet16*vsig_p*vsig_c*vsig_j
  neet16_p2c2s2j1 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c2s2j2 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c2s2j3 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c2s2j4 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c2s3j1 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c2s3j2 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c2s3j3 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c2s3j4 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c3s1j1 <- neet16*vsig_p*vsig_c
  neet16_p2c3s1j2 <- neet16*vsig_p*vsig_c
  neet16_p2c3s1j3 <- neet16*vsig_p*vsig_c*vsig_j
  neet16_p2c3s1j4 <- neet16*vsig_p*vsig_c*vsig_j
  neet16_p2c3s2j1 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c3s2j2 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c3s2j3 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c3s2j4 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c3s3j1 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c3s3j2 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c3s3j3 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c3s3j4 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c4s1j1 <- neet16*vsig_p*vsig_c
  neet16_p2c4s1j2 <- neet16*vsig_p*vsig_c
  neet16_p2c4s1j3 <- neet16*vsig_p*vsig_c*vsig_j
  neet16_p2c4s1j4 <- neet16*vsig_p*vsig_c*vsig_j
  neet16_p2c4s2j1 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c4s2j2 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c4s2j3 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c4s2j4 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c4s3j1 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c4s3j2 <- neet16*vsig_p*vsig_c*vsig_s
  neet16_p2c4s3j3 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  neet16_p2c4s3j4 <- neet16*vsig_p*vsig_c*vsig_s*vsig_j
  
  
  
  
  s1s2_p1c1j1_10 <- s1s2_10
  s1s2_p1c1j2_10 <- s1s2_10
  s1s2_p1c1j3_10 <- s1s2_10*sig_j
  s1s2_p1c1j4_10 <- s1s2_10*sig_j
  s2s3_p1c1j1_10 <- s2s3_10
  s2s3_p1c1j2_10 <- s2s3_10
  s2s3_p1c1j3_10 <- s2s3_10
  s2s3_p1c1j4_10 <- s2s3_10
  s3s2_p1c1j1_10 <- s3s2_10
  s3s2_p1c1j2_10 <- s3s2_10
  s3s2_p1c1j3_10 <- s3s2_10*sig_j
  s3s2_p1c1j4_10 <- s3s2_10*sig_j
  s1s2_p1c2j1_10 <- s1s2_10*sig_c
  s1s2_p1c2j2_10 <- s1s2_10*sig_c
  s1s2_p1c2j3_10 <- s1s2_10*sig_c*sig_j
  s1s2_p1c2j4_10 <- s1s2_10*sig_c*sig_j
  s2s3_p1c2j1_10 <- s2s3_10
  s2s3_p1c2j2_10 <- s2s3_10
  s2s3_p1c2j3_10 <- s2s3_10
  s2s3_p1c2j4_10 <- s2s3_10
  s3s2_p1c2j1_10 <- s3s2_10*sig_c
  s3s2_p1c2j2_10 <- s3s2_10*sig_c
  s3s2_p1c2j3_10 <- s3s2_10*sig_c*sig_j
  s3s2_p1c2j4_10 <- s3s2_10*sig_c*sig_j
  s1s2_p1c3j1_10 <- s1s2_10*sig_c
  s1s2_p1c3j2_10 <- s1s2_10*sig_c
  s1s2_p1c3j3_10 <- s1s2_10*sig_c*sig_j
  s1s2_p1c3j4_10 <- s1s2_10*sig_c*sig_j
  s2s3_p1c3j1_10 <- s2s3_10
  s2s3_p1c3j2_10 <- s2s3_10
  s2s3_p1c3j3_10 <- s2s3_10
  s2s3_p1c3j4_10 <- s2s3_10
  s3s2_p1c3j1_10 <- s3s2_10*sig_c
  s3s2_p1c3j2_10 <- s3s2_10*sig_c
  s3s2_p1c3j3_10 <- s3s2_10*sig_c*sig_j
  s3s2_p1c3j4_10 <- s3s2_10*sig_c*sig_j
  s1s2_p1c4j1_10 <- s1s2_10*sig_c
  s1s2_p1c4j2_10 <- s1s2_10*sig_c
  s1s2_p1c4j3_10 <- s1s2_10*sig_c*sig_j
  s1s2_p1c4j4_10 <- s1s2_10*sig_c*sig_j
  s2s3_p1c4j1_10 <- s2s3_10
  s2s3_p1c4j2_10 <- s2s3_10
  s2s3_p1c4j3_10 <- s2s3_10
  s2s3_p1c4j4_10 <- s2s3_10
  s3s2_p1c4j1_10 <- s3s2_10*sig_c
  s3s2_p1c4j2_10 <- s3s2_10*sig_c
  s3s2_p1c4j3_10 <- s3s2_10*sig_c*sig_j
  s3s2_p1c4j4_10 <- s3s2_10*sig_c*sig_j
  s1s2_p2c1j1_10 <- s1s2_10*sig_p
  s1s2_p2c1j2_10 <- s1s2_10*sig_p
  s1s2_p2c1j3_10 <- s1s2_10*sig_p*sig_j
  s1s2_p2c1j4_10 <- s1s2_10*sig_p*sig_j
  s2s3_p2c1j1_10 <- s2s3_10
  s2s3_p2c1j2_10 <- s2s3_10
  s2s3_p2c1j3_10 <- s2s3_10
  s2s3_p2c1j4_10 <- s2s3_10
  s3s2_p2c1j1_10 <- s3s2_10*sig_p
  s3s2_p2c1j2_10 <- s3s2_10*sig_p
  s3s2_p2c1j3_10 <- s3s2_10*sig_p*sig_j
  s3s2_p2c1j4_10 <- s3s2_10*sig_p*sig_j
  s1s2_p2c2j1_10 <- s1s2_10*sig_p*sig_c
  s1s2_p2c2j2_10 <- s1s2_10*sig_p*sig_c
  s1s2_p2c2j3_10 <- s1s2_10*sig_p*sig_c*sig_j
  s1s2_p2c2j4_10 <- s1s2_10*sig_p*sig_c*sig_j
  s2s3_p2c2j1_10 <- s2s3_10
  s2s3_p2c2j2_10 <- s2s3_10
  s2s3_p2c2j3_10 <- s2s3_10
  s2s3_p2c2j4_10 <- s2s3_10
  s3s2_p2c2j1_10 <- s3s2_10*sig_p*sig_c
  s3s2_p2c2j2_10 <- s3s2_10*sig_p*sig_c
  s3s2_p2c2j3_10 <- s3s2_10*sig_p*sig_c*sig_j
  s3s2_p2c2j4_10 <- s3s2_10*sig_p*sig_c*sig_j
  s1s2_p2c3j1_10 <- s1s2_10*sig_p*sig_c
  s1s2_p2c3j2_10 <- s1s2_10*sig_p*sig_c
  s1s2_p2c3j3_10 <- s1s2_10*sig_p*sig_c*sig_j
  s1s2_p2c3j4_10 <- s1s2_10*sig_p*sig_c*sig_j
  s2s3_p2c3j1_10 <- s2s3_10
  s2s3_p2c3j2_10 <- s2s3_10
  s2s3_p2c3j3_10 <- s2s3_10
  s2s3_p2c3j4_10 <- s2s3_10
  s3s2_p2c3j1_10 <- s3s2_10*sig_p*sig_c
  s3s2_p2c3j2_10 <- s3s2_10*sig_p*sig_c
  s3s2_p2c3j3_10 <- s3s2_10*sig_p*sig_c*sig_j
  s3s2_p2c3j4_10 <- s3s2_10*sig_p*sig_c*sig_j
  s1s2_p2c4j1_10 <- s1s2_10*sig_p*sig_c
  s1s2_p2c4j2_10 <- s1s2_10*sig_p*sig_c
  s1s2_p2c4j3_10 <- s1s2_10*sig_p*sig_c*sig_j
  s1s2_p2c4j4_10 <- s1s2_10*sig_p*sig_c*sig_j
  s2s3_p2c4j1_10 <- s2s3_10
  s2s3_p2c4j2_10 <- s2s3_10
  s2s3_p2c4j3_10 <- s2s3_10
  s2s3_p2c4j4_10 <- s2s3_10
  s3s2_p2c4j1_10 <- s3s2_10*sig_p*sig_c
  s3s2_p2c4j2_10 <- s3s2_10*sig_p*sig_c
  s3s2_p2c4j3_10 <- s3s2_10*sig_p*sig_c*sig_j
  s3s2_p2c4j4_10 <- s3s2_10*sig_p*sig_c*sig_j
  s1s2_p1c1j1_11 <- s1s2_11
  s1s2_p1c1j2_11 <- s1s2_11
  s1s2_p1c1j3_11 <- s1s2_11*sig_j
  s1s2_p1c1j4_11 <- s1s2_11*sig_j
  s2s3_p1c1j1_11 <- s2s3_11
  s2s3_p1c1j2_11 <- s2s3_11
  s2s3_p1c1j3_11 <- s2s3_11
  s2s3_p1c1j4_11 <- s2s3_11
  s3s2_p1c1j1_11 <- s3s2_11
  s3s2_p1c1j2_11 <- s3s2_11
  s3s2_p1c1j3_11 <- s3s2_11*sig_j
  s3s2_p1c1j4_11 <- s3s2_11*sig_j
  s1s2_p1c2j1_11 <- s1s2_11*sig_c
  s1s2_p1c2j2_11 <- s1s2_11*sig_c
  s1s2_p1c2j3_11 <- s1s2_11*sig_c*sig_j
  s1s2_p1c2j4_11 <- s1s2_11*sig_c*sig_j
  s2s3_p1c2j1_11 <- s2s3_11
  s2s3_p1c2j2_11 <- s2s3_11
  s2s3_p1c2j3_11 <- s2s3_11
  s2s3_p1c2j4_11 <- s2s3_11
  s3s2_p1c2j1_11 <- s3s2_11*sig_c
  s3s2_p1c2j2_11 <- s3s2_11*sig_c
  s3s2_p1c2j3_11 <- s3s2_11*sig_c*sig_j
  s3s2_p1c2j4_11 <- s3s2_11*sig_c*sig_j
  s1s2_p1c3j1_11 <- s1s2_11*sig_c
  s1s2_p1c3j2_11 <- s1s2_11*sig_c
  s1s2_p1c3j3_11 <- s1s2_11*sig_c*sig_j
  s1s2_p1c3j4_11 <- s1s2_11*sig_c*sig_j
  s2s3_p1c3j1_11 <- s2s3_11
  s2s3_p1c3j2_11 <- s2s3_11
  s2s3_p1c3j3_11 <- s2s3_11
  s2s3_p1c3j4_11 <- s2s3_11
  s3s2_p1c3j1_11 <- s3s2_11*sig_c
  s3s2_p1c3j2_11 <- s3s2_11*sig_c
  s3s2_p1c3j3_11 <- s3s2_11*sig_c*sig_j
  s3s2_p1c3j4_11 <- s3s2_11*sig_c*sig_j
  s1s2_p1c4j1_11 <- s1s2_11*sig_c
  s1s2_p1c4j2_11 <- s1s2_11*sig_c
  s1s2_p1c4j3_11 <- s1s2_11*sig_c*sig_j
  s1s2_p1c4j4_11 <- s1s2_11*sig_c*sig_j
  s2s3_p1c4j1_11 <- s2s3_11
  s2s3_p1c4j2_11 <- s2s3_11
  s2s3_p1c4j3_11 <- s2s3_11
  s2s3_p1c4j4_11 <- s2s3_11
  s3s2_p1c4j1_11 <- s3s2_11*sig_c
  s3s2_p1c4j2_11 <- s3s2_11*sig_c
  s3s2_p1c4j3_11 <- s3s2_11*sig_c*sig_j
  s3s2_p1c4j4_11 <- s3s2_11*sig_c*sig_j
  s1s2_p2c1j1_11 <- s1s2_11*sig_p
  s1s2_p2c1j2_11 <- s1s2_11*sig_p
  s1s2_p2c1j3_11 <- s1s2_11*sig_p*sig_j
  s1s2_p2c1j4_11 <- s1s2_11*sig_p*sig_j
  s2s3_p2c1j1_11 <- s2s3_11
  s2s3_p2c1j2_11 <- s2s3_11
  s2s3_p2c1j3_11 <- s2s3_11
  s2s3_p2c1j4_11 <- s2s3_11
  s3s2_p2c1j1_11 <- s3s2_11*sig_p
  s3s2_p2c1j2_11 <- s3s2_11*sig_p
  s3s2_p2c1j3_11 <- s3s2_11*sig_p*sig_j
  s3s2_p2c1j4_11 <- s3s2_11*sig_p*sig_j
  s1s2_p2c2j1_11 <- s1s2_11*sig_p*sig_c
  s1s2_p2c2j2_11 <- s1s2_11*sig_p*sig_c
  s1s2_p2c2j3_11 <- s1s2_11*sig_p*sig_c*sig_j
  s1s2_p2c2j4_11 <- s1s2_11*sig_p*sig_c*sig_j
  s2s3_p2c2j1_11 <- s2s3_11
  s2s3_p2c2j2_11 <- s2s3_11
  s2s3_p2c2j3_11 <- s2s3_11
  s2s3_p2c2j4_11 <- s2s3_11
  s3s2_p2c2j1_11 <- s3s2_11*sig_p*sig_c
  s3s2_p2c2j2_11 <- s3s2_11*sig_p*sig_c
  s3s2_p2c2j3_11 <- s3s2_11*sig_p*sig_c*sig_j
  s3s2_p2c2j4_11 <- s3s2_11*sig_p*sig_c*sig_j
  s1s2_p2c3j1_11 <- s1s2_11*sig_p*sig_c
  s1s2_p2c3j2_11 <- s1s2_11*sig_p*sig_c
  s1s2_p2c3j3_11 <- s1s2_11*sig_p*sig_c*sig_j
  s1s2_p2c3j4_11 <- s1s2_11*sig_p*sig_c*sig_j
  s2s3_p2c3j1_11 <- s2s3_11
  s2s3_p2c3j2_11 <- s2s3_11
  s2s3_p2c3j3_11 <- s2s3_11
  s2s3_p2c3j4_11 <- s2s3_11
  s3s2_p2c3j1_11 <- s3s2_11*sig_p*sig_c
  s3s2_p2c3j2_11 <- s3s2_11*sig_p*sig_c
  s3s2_p2c3j3_11 <- s3s2_11*sig_p*sig_c*sig_j
  s3s2_p2c3j4_11 <- s3s2_11*sig_p*sig_c*sig_j
  s1s2_p2c4j1_11 <- s1s2_11*sig_p*sig_c
  s1s2_p2c4j2_11 <- s1s2_11*sig_p*sig_c
  s1s2_p2c4j3_11 <- s1s2_11*sig_p*sig_c*sig_j
  s1s2_p2c4j4_11 <- s1s2_11*sig_p*sig_c*sig_j
  s2s3_p2c4j1_11 <- s2s3_11
  s2s3_p2c4j2_11 <- s2s3_11
  s2s3_p2c4j3_11 <- s2s3_11
  s2s3_p2c4j4_11 <- s2s3_11
  s3s2_p2c4j1_11 <- s3s2_11*sig_p*sig_c
  s3s2_p2c4j2_11 <- s3s2_11*sig_p*sig_c
  s3s2_p2c4j3_11 <- s3s2_11*sig_p*sig_c*sig_j
  s3s2_p2c4j4_11 <- s3s2_11*sig_p*sig_c*sig_j
  s1s2_p1c1j1_12 <- s1s2_12
  s1s2_p1c1j2_12 <- s1s2_12
  s1s2_p1c1j3_12 <- s1s2_12*sig_j
  s1s2_p1c1j4_12 <- s1s2_12*sig_j
  s2s3_p1c1j1_12 <- s2s3_12
  s2s3_p1c1j2_12 <- s2s3_12
  s2s3_p1c1j3_12 <- s2s3_12
  s2s3_p1c1j4_12 <- s2s3_12
  s3s2_p1c1j1_12 <- s3s2_12
  s3s2_p1c1j2_12 <- s3s2_12
  s3s2_p1c1j3_12 <- s3s2_12*sig_j
  s3s2_p1c1j4_12 <- s3s2_12*sig_j
  s1s2_p1c2j1_12 <- s1s2_12*sig_c
  s1s2_p1c2j2_12 <- s1s2_12*sig_c
  s1s2_p1c2j3_12 <- s1s2_12*sig_c*sig_j
  s1s2_p1c2j4_12 <- s1s2_12*sig_c*sig_j
  s2s3_p1c2j1_12 <- s2s3_12
  s2s3_p1c2j2_12 <- s2s3_12
  s2s3_p1c2j3_12 <- s2s3_12
  s2s3_p1c2j4_12 <- s2s3_12
  s3s2_p1c2j1_12 <- s3s2_12*sig_c
  s3s2_p1c2j2_12 <- s3s2_12*sig_c
  s3s2_p1c2j3_12 <- s3s2_12*sig_c*sig_j
  s3s2_p1c2j4_12 <- s3s2_12*sig_c*sig_j
  s1s2_p1c3j1_12 <- s1s2_12*sig_c
  s1s2_p1c3j2_12 <- s1s2_12*sig_c
  s1s2_p1c3j3_12 <- s1s2_12*sig_c*sig_j
  s1s2_p1c3j4_12 <- s1s2_12*sig_c*sig_j
  s2s3_p1c3j1_12 <- s2s3_12
  s2s3_p1c3j2_12 <- s2s3_12
  s2s3_p1c3j3_12 <- s2s3_12
  s2s3_p1c3j4_12 <- s2s3_12
  s3s2_p1c3j1_12 <- s3s2_12*sig_c
  s3s2_p1c3j2_12 <- s3s2_12*sig_c
  s3s2_p1c3j3_12 <- s3s2_12*sig_c*sig_j
  s3s2_p1c3j4_12 <- s3s2_12*sig_c*sig_j
  s1s2_p1c4j1_12 <- s1s2_12*sig_c
  s1s2_p1c4j2_12 <- s1s2_12*sig_c
  s1s2_p1c4j3_12 <- s1s2_12*sig_c*sig_j
  s1s2_p1c4j4_12 <- s1s2_12*sig_c*sig_j
  s2s3_p1c4j1_12 <- s2s3_12
  s2s3_p1c4j2_12 <- s2s3_12
  s2s3_p1c4j3_12 <- s2s3_12
  s2s3_p1c4j4_12 <- s2s3_12
  s3s2_p1c4j1_12 <- s3s2_12*sig_c
  s3s2_p1c4j2_12 <- s3s2_12*sig_c
  s3s2_p1c4j3_12 <- s3s2_12*sig_c*sig_j
  s3s2_p1c4j4_12 <- s3s2_12*sig_c*sig_j
  s1s2_p2c1j1_12 <- s1s2_12*sig_p
  s1s2_p2c1j2_12 <- s1s2_12*sig_p
  s1s2_p2c1j3_12 <- s1s2_12*sig_p*sig_j
  s1s2_p2c1j4_12 <- s1s2_12*sig_p*sig_j
  s2s3_p2c1j1_12 <- s2s3_12
  s2s3_p2c1j2_12 <- s2s3_12
  s2s3_p2c1j3_12 <- s2s3_12
  s2s3_p2c1j4_12 <- s2s3_12
  s3s2_p2c1j1_12 <- s3s2_12*sig_p
  s3s2_p2c1j2_12 <- s3s2_12*sig_p
  s3s2_p2c1j3_12 <- s3s2_12*sig_p*sig_j
  s3s2_p2c1j4_12 <- s3s2_12*sig_p*sig_j
  s1s2_p2c2j1_12 <- s1s2_12*sig_p*sig_c
  s1s2_p2c2j2_12 <- s1s2_12*sig_p*sig_c
  s1s2_p2c2j3_12 <- s1s2_12*sig_p*sig_c*sig_j
  s1s2_p2c2j4_12 <- s1s2_12*sig_p*sig_c*sig_j
  s2s3_p2c2j1_12 <- s2s3_12
  s2s3_p2c2j2_12 <- s2s3_12
  s2s3_p2c2j3_12 <- s2s3_12
  s2s3_p2c2j4_12 <- s2s3_12
  s3s2_p2c2j1_12 <- s3s2_12*sig_p*sig_c
  s3s2_p2c2j2_12 <- s3s2_12*sig_p*sig_c
  s3s2_p2c2j3_12 <- s3s2_12*sig_p*sig_c*sig_j
  s3s2_p2c2j4_12 <- s3s2_12*sig_p*sig_c*sig_j
  s1s2_p2c3j1_12 <- s1s2_12*sig_p*sig_c
  s1s2_p2c3j2_12 <- s1s2_12*sig_p*sig_c
  s1s2_p2c3j3_12 <- s1s2_12*sig_p*sig_c*sig_j
  s1s2_p2c3j4_12 <- s1s2_12*sig_p*sig_c*sig_j
  s2s3_p2c3j1_12 <- s2s3_12
  s2s3_p2c3j2_12 <- s2s3_12
  s2s3_p2c3j3_12 <- s2s3_12
  s2s3_p2c3j4_12 <- s2s3_12
  s3s2_p2c3j1_12 <- s3s2_12*sig_p*sig_c
  s3s2_p2c3j2_12 <- s3s2_12*sig_p*sig_c
  s3s2_p2c3j3_12 <- s3s2_12*sig_p*sig_c*sig_j
  s3s2_p2c3j4_12 <- s3s2_12*sig_p*sig_c*sig_j
  s1s2_p2c4j1_12 <- s1s2_12*sig_p*sig_c
  s1s2_p2c4j2_12 <- s1s2_12*sig_p*sig_c
  s1s2_p2c4j3_12 <- s1s2_12*sig_p*sig_c*sig_j
  s1s2_p2c4j4_12 <- s1s2_12*sig_p*sig_c*sig_j
  s2s3_p2c4j1_12 <- s2s3_12
  s2s3_p2c4j2_12 <- s2s3_12
  s2s3_p2c4j3_12 <- s2s3_12
  s2s3_p2c4j4_12 <- s2s3_12
  s3s2_p2c4j1_12 <- s3s2_12*sig_p*sig_c
  s3s2_p2c4j2_12 <- s3s2_12*sig_p*sig_c
  s3s2_p2c4j3_12 <- s3s2_12*sig_p*sig_c*sig_j
  s3s2_p2c4j4_12 <- s3s2_12*sig_p*sig_c*sig_j
  s1s2_p1c1j1_13 <- s1s2_13
  s1s2_p1c1j2_13 <- s1s2_13
  s1s2_p1c1j3_13 <- s1s2_13*sig_j
  s1s2_p1c1j4_13 <- s1s2_13*sig_j
  s2s3_p1c1j1_13 <- s2s3_13
  s2s3_p1c1j2_13 <- s2s3_13
  s2s3_p1c1j3_13 <- s2s3_13
  s2s3_p1c1j4_13 <- s2s3_13
  s3s2_p1c1j1_13 <- s3s2_13
  s3s2_p1c1j2_13 <- s3s2_13
  s3s2_p1c1j3_13 <- s3s2_13*sig_j
  s3s2_p1c1j4_13 <- s3s2_13*sig_j
  s1s2_p1c2j1_13 <- s1s2_13*sig_c
  s1s2_p1c2j2_13 <- s1s2_13*sig_c
  s1s2_p1c2j3_13 <- s1s2_13*sig_c*sig_j
  s1s2_p1c2j4_13 <- s1s2_13*sig_c*sig_j
  s2s3_p1c2j1_13 <- s2s3_13
  s2s3_p1c2j2_13 <- s2s3_13
  s2s3_p1c2j3_13 <- s2s3_13
  s2s3_p1c2j4_13 <- s2s3_13
  s3s2_p1c2j1_13 <- s3s2_13*sig_c
  s3s2_p1c2j2_13 <- s3s2_13*sig_c
  s3s2_p1c2j3_13 <- s3s2_13*sig_c*sig_j
  s3s2_p1c2j4_13 <- s3s2_13*sig_c*sig_j
  s1s2_p1c3j1_13 <- s1s2_13*sig_c
  s1s2_p1c3j2_13 <- s1s2_13*sig_c
  s1s2_p1c3j3_13 <- s1s2_13*sig_c*sig_j
  s1s2_p1c3j4_13 <- s1s2_13*sig_c*sig_j
  s2s3_p1c3j1_13 <- s2s3_13
  s2s3_p1c3j2_13 <- s2s3_13
  s2s3_p1c3j3_13 <- s2s3_13
  s2s3_p1c3j4_13 <- s2s3_13
  s3s2_p1c3j1_13 <- s3s2_13*sig_c
  s3s2_p1c3j2_13 <- s3s2_13*sig_c
  s3s2_p1c3j3_13 <- s3s2_13*sig_c*sig_j
  s3s2_p1c3j4_13 <- s3s2_13*sig_c*sig_j
  s1s2_p1c4j1_13 <- s1s2_13*sig_c
  s1s2_p1c4j2_13 <- s1s2_13*sig_c
  s1s2_p1c4j3_13 <- s1s2_13*sig_c*sig_j
  s1s2_p1c4j4_13 <- s1s2_13*sig_c*sig_j
  s2s3_p1c4j1_13 <- s2s3_13
  s2s3_p1c4j2_13 <- s2s3_13
  s2s3_p1c4j3_13 <- s2s3_13
  s2s3_p1c4j4_13 <- s2s3_13
  s3s2_p1c4j1_13 <- s3s2_13*sig_c
  s3s2_p1c4j2_13 <- s3s2_13*sig_c
  s3s2_p1c4j3_13 <- s3s2_13*sig_c*sig_j
  s3s2_p1c4j4_13 <- s3s2_13*sig_c*sig_j
  s1s2_p2c1j1_13 <- s1s2_13*sig_p
  s1s2_p2c1j2_13 <- s1s2_13*sig_p
  s1s2_p2c1j3_13 <- s1s2_13*sig_p*sig_j
  s1s2_p2c1j4_13 <- s1s2_13*sig_p*sig_j
  s2s3_p2c1j1_13 <- s2s3_13
  s2s3_p2c1j2_13 <- s2s3_13
  s2s3_p2c1j3_13 <- s2s3_13
  s2s3_p2c1j4_13 <- s2s3_13
  s3s2_p2c1j1_13 <- s3s2_13*sig_p
  s3s2_p2c1j2_13 <- s3s2_13*sig_p
  s3s2_p2c1j3_13 <- s3s2_13*sig_p*sig_j
  s3s2_p2c1j4_13 <- s3s2_13*sig_p*sig_j
  s1s2_p2c2j1_13 <- s1s2_13*sig_p*sig_c
  s1s2_p2c2j2_13 <- s1s2_13*sig_p*sig_c
  s1s2_p2c2j3_13 <- s1s2_13*sig_p*sig_c*sig_j
  s1s2_p2c2j4_13 <- s1s2_13*sig_p*sig_c*sig_j
  s2s3_p2c2j1_13 <- s2s3_13
  s2s3_p2c2j2_13 <- s2s3_13
  s2s3_p2c2j3_13 <- s2s3_13
  s2s3_p2c2j4_13 <- s2s3_13
  s3s2_p2c2j1_13 <- s3s2_13*sig_p*sig_c
  s3s2_p2c2j2_13 <- s3s2_13*sig_p*sig_c
  s3s2_p2c2j3_13 <- s3s2_13*sig_p*sig_c*sig_j
  s3s2_p2c2j4_13 <- s3s2_13*sig_p*sig_c*sig_j
  s1s2_p2c3j1_13 <- s1s2_13*sig_p*sig_c
  s1s2_p2c3j2_13 <- s1s2_13*sig_p*sig_c
  s1s2_p2c3j3_13 <- s1s2_13*sig_p*sig_c*sig_j
  s1s2_p2c3j4_13 <- s1s2_13*sig_p*sig_c*sig_j
  s2s3_p2c3j1_13 <- s2s3_13
  s2s3_p2c3j2_13 <- s2s3_13
  s2s3_p2c3j3_13 <- s2s3_13
  s2s3_p2c3j4_13 <- s2s3_13
  s3s2_p2c3j1_13 <- s3s2_13*sig_p*sig_c
  s3s2_p2c3j2_13 <- s3s2_13*sig_p*sig_c
  s3s2_p2c3j3_13 <- s3s2_13*sig_p*sig_c*sig_j
  s3s2_p2c3j4_13 <- s3s2_13*sig_p*sig_c*sig_j
  s1s2_p2c4j1_13 <- s1s2_13*sig_p*sig_c
  s1s2_p2c4j2_13 <- s1s2_13*sig_p*sig_c
  s1s2_p2c4j3_13 <- s1s2_13*sig_p*sig_c*sig_j
  s1s2_p2c4j4_13 <- s1s2_13*sig_p*sig_c*sig_j
  s2s3_p2c4j1_13 <- s2s3_13
  s2s3_p2c4j2_13 <- s2s3_13
  s2s3_p2c4j3_13 <- s2s3_13
  s2s3_p2c4j4_13 <- s2s3_13
  s3s2_p2c4j1_13 <- s3s2_13*sig_p*sig_c
  s3s2_p2c4j2_13 <- s3s2_13*sig_p*sig_c
  s3s2_p2c4j3_13 <- s3s2_13*sig_p*sig_c*sig_j
  s3s2_p2c4j4_13 <- s3s2_13*sig_p*sig_c*sig_j
  s1s2_p1c1j1_14 <- s1s2_14
  s1s2_p1c1j2_14 <- s1s2_14
  s1s2_p1c1j3_14 <- s1s2_14*sig_j
  s1s2_p1c1j4_14 <- s1s2_14*sig_j
  s2s3_p1c1j1_14 <- s2s3_14
  s2s3_p1c1j2_14 <- s2s3_14
  s2s3_p1c1j3_14 <- s2s3_14
  s2s3_p1c1j4_14 <- s2s3_14
  s3s2_p1c1j1_14 <- s3s2_14
  s3s2_p1c1j2_14 <- s3s2_14
  s3s2_p1c1j3_14 <- s3s2_14*sig_j
  s3s2_p1c1j4_14 <- s3s2_14*sig_j
  s1s2_p1c2j1_14 <- s1s2_14*sig_c
  s1s2_p1c2j2_14 <- s1s2_14*sig_c
  s1s2_p1c2j3_14 <- s1s2_14*sig_c*sig_j
  s1s2_p1c2j4_14 <- s1s2_14*sig_c*sig_j
  s2s3_p1c2j1_14 <- s2s3_14
  s2s3_p1c2j2_14 <- s2s3_14
  s2s3_p1c2j3_14 <- s2s3_14
  s2s3_p1c2j4_14 <- s2s3_14
  s3s2_p1c2j1_14 <- s3s2_14*sig_c
  s3s2_p1c2j2_14 <- s3s2_14*sig_c
  s3s2_p1c2j3_14 <- s3s2_14*sig_c*sig_j
  s3s2_p1c2j4_14 <- s3s2_14*sig_c*sig_j
  s1s2_p1c3j1_14 <- s1s2_14*sig_c
  s1s2_p1c3j2_14 <- s1s2_14*sig_c
  s1s2_p1c3j3_14 <- s1s2_14*sig_c*sig_j
  s1s2_p1c3j4_14 <- s1s2_14*sig_c*sig_j
  s2s3_p1c3j1_14 <- s2s3_14
  s2s3_p1c3j2_14 <- s2s3_14
  s2s3_p1c3j3_14 <- s2s3_14
  s2s3_p1c3j4_14 <- s2s3_14
  s3s2_p1c3j1_14 <- s3s2_14*sig_c
  s3s2_p1c3j2_14 <- s3s2_14*sig_c
  s3s2_p1c3j3_14 <- s3s2_14*sig_c*sig_j
  s3s2_p1c3j4_14 <- s3s2_14*sig_c*sig_j
  s1s2_p1c4j1_14 <- s1s2_14*sig_c
  s1s2_p1c4j2_14 <- s1s2_14*sig_c
  s1s2_p1c4j3_14 <- s1s2_14*sig_c*sig_j
  s1s2_p1c4j4_14 <- s1s2_14*sig_c*sig_j
  s2s3_p1c4j1_14 <- s2s3_14
  s2s3_p1c4j2_14 <- s2s3_14
  s2s3_p1c4j3_14 <- s2s3_14
  s2s3_p1c4j4_14 <- s2s3_14
  s3s2_p1c4j1_14 <- s3s2_14*sig_c
  s3s2_p1c4j2_14 <- s3s2_14*sig_c
  s3s2_p1c4j3_14 <- s3s2_14*sig_c*sig_j
  s3s2_p1c4j4_14 <- s3s2_14*sig_c*sig_j
  s1s2_p2c1j1_14 <- s1s2_14*sig_p
  s1s2_p2c1j2_14 <- s1s2_14*sig_p
  s1s2_p2c1j3_14 <- s1s2_14*sig_p*sig_j
  s1s2_p2c1j4_14 <- s1s2_14*sig_p*sig_j
  s2s3_p2c1j1_14 <- s2s3_14
  s2s3_p2c1j2_14 <- s2s3_14
  s2s3_p2c1j3_14 <- s2s3_14
  s2s3_p2c1j4_14 <- s2s3_14
  s3s2_p2c1j1_14 <- s3s2_14*sig_p
  s3s2_p2c1j2_14 <- s3s2_14*sig_p
  s3s2_p2c1j3_14 <- s3s2_14*sig_p*sig_j
  s3s2_p2c1j4_14 <- s3s2_14*sig_p*sig_j
  s1s2_p2c2j1_14 <- s1s2_14*sig_p*sig_c
  s1s2_p2c2j2_14 <- s1s2_14*sig_p*sig_c
  s1s2_p2c2j3_14 <- s1s2_14*sig_p*sig_c*sig_j
  s1s2_p2c2j4_14 <- s1s2_14*sig_p*sig_c*sig_j
  s2s3_p2c2j1_14 <- s2s3_14
  s2s3_p2c2j2_14 <- s2s3_14
  s2s3_p2c2j3_14 <- s2s3_14
  s2s3_p2c2j4_14 <- s2s3_14
  s3s2_p2c2j1_14 <- s3s2_14*sig_p*sig_c
  s3s2_p2c2j2_14 <- s3s2_14*sig_p*sig_c
  s3s2_p2c2j3_14 <- s3s2_14*sig_p*sig_c*sig_j
  s3s2_p2c2j4_14 <- s3s2_14*sig_p*sig_c*sig_j
  s1s2_p2c3j1_14 <- s1s2_14*sig_p*sig_c
  s1s2_p2c3j2_14 <- s1s2_14*sig_p*sig_c
  s1s2_p2c3j3_14 <- s1s2_14*sig_p*sig_c*sig_j
  s1s2_p2c3j4_14 <- s1s2_14*sig_p*sig_c*sig_j
  s2s3_p2c3j1_14 <- s2s3_14
  s2s3_p2c3j2_14 <- s2s3_14
  s2s3_p2c3j3_14 <- s2s3_14
  s2s3_p2c3j4_14 <- s2s3_14
  s3s2_p2c3j1_14 <- s3s2_14*sig_p*sig_c
  s3s2_p2c3j2_14 <- s3s2_14*sig_p*sig_c
  s3s2_p2c3j3_14 <- s3s2_14*sig_p*sig_c*sig_j
  s3s2_p2c3j4_14 <- s3s2_14*sig_p*sig_c*sig_j
  s1s2_p2c4j1_14 <- s1s2_14*sig_p*sig_c
  s1s2_p2c4j2_14 <- s1s2_14*sig_p*sig_c
  s1s2_p2c4j3_14 <- s1s2_14*sig_p*sig_c*sig_j
  s1s2_p2c4j4_14 <- s1s2_14*sig_p*sig_c*sig_j
  s2s3_p2c4j1_14 <- s2s3_14
  s2s3_p2c4j2_14 <- s2s3_14
  s2s3_p2c4j3_14 <- s2s3_14
  s2s3_p2c4j4_14 <- s2s3_14
  s3s2_p2c4j1_14 <- s3s2_14*sig_p*sig_c
  s3s2_p2c4j2_14 <- s3s2_14*sig_p*sig_c
  s3s2_p2c4j3_14 <- s3s2_14*sig_p*sig_c*sig_j
  s3s2_p2c4j4_14 <- s3s2_14*sig_p*sig_c*sig_j
  s1s2_p1c1j1_15 <- s1s2_15
  s1s2_p1c1j2_15 <- s1s2_15
  s1s2_p1c1j3_15 <- s1s2_15*sig_j
  s1s2_p1c1j4_15 <- s1s2_15*sig_j
  s2s3_p1c1j1_15 <- s2s3_15
  s2s3_p1c1j2_15 <- s2s3_15
  s2s3_p1c1j3_15 <- s2s3_15
  s2s3_p1c1j4_15 <- s2s3_15
  s3s2_p1c1j1_15 <- s3s2_15
  s3s2_p1c1j2_15 <- s3s2_15
  s3s2_p1c1j3_15 <- s3s2_15*sig_j
  s3s2_p1c1j4_15 <- s3s2_15*sig_j
  s1s2_p1c2j1_15 <- s1s2_15*sig_c
  s1s2_p1c2j2_15 <- s1s2_15*sig_c
  s1s2_p1c2j3_15 <- s1s2_15*sig_c*sig_j
  s1s2_p1c2j4_15 <- s1s2_15*sig_c*sig_j
  s2s3_p1c2j1_15 <- s2s3_15
  s2s3_p1c2j2_15 <- s2s3_15
  s2s3_p1c2j3_15 <- s2s3_15
  s2s3_p1c2j4_15 <- s2s3_15
  s3s2_p1c2j1_15 <- s3s2_15*sig_c
  s3s2_p1c2j2_15 <- s3s2_15*sig_c
  s3s2_p1c2j3_15 <- s3s2_15*sig_c*sig_j
  s3s2_p1c2j4_15 <- s3s2_15*sig_c*sig_j
  s1s2_p1c3j1_15 <- s1s2_15*sig_c
  s1s2_p1c3j2_15 <- s1s2_15*sig_c
  s1s2_p1c3j3_15 <- s1s2_15*sig_c*sig_j
  s1s2_p1c3j4_15 <- s1s2_15*sig_c*sig_j
  s2s3_p1c3j1_15 <- s2s3_15
  s2s3_p1c3j2_15 <- s2s3_15
  s2s3_p1c3j3_15 <- s2s3_15
  s2s3_p1c3j4_15 <- s2s3_15
  s3s2_p1c3j1_15 <- s3s2_15*sig_c
  s3s2_p1c3j2_15 <- s3s2_15*sig_c
  s3s2_p1c3j3_15 <- s3s2_15*sig_c*sig_j
  s3s2_p1c3j4_15 <- s3s2_15*sig_c*sig_j
  s1s2_p1c4j1_15 <- s1s2_15*sig_c
  s1s2_p1c4j2_15 <- s1s2_15*sig_c
  s1s2_p1c4j3_15 <- s1s2_15*sig_c*sig_j
  s1s2_p1c4j4_15 <- s1s2_15*sig_c*sig_j
  s2s3_p1c4j1_15 <- s2s3_15
  s2s3_p1c4j2_15 <- s2s3_15
  s2s3_p1c4j3_15 <- s2s3_15
  s2s3_p1c4j4_15 <- s2s3_15
  s3s2_p1c4j1_15 <- s3s2_15*sig_c
  s3s2_p1c4j2_15 <- s3s2_15*sig_c
  s3s2_p1c4j3_15 <- s3s2_15*sig_c*sig_j
  s3s2_p1c4j4_15 <- s3s2_15*sig_c*sig_j
  s1s2_p2c1j1_15 <- s1s2_15*sig_p
  s1s2_p2c1j2_15 <- s1s2_15*sig_p
  s1s2_p2c1j3_15 <- s1s2_15*sig_p*sig_j
  s1s2_p2c1j4_15 <- s1s2_15*sig_p*sig_j
  s2s3_p2c1j1_15 <- s2s3_15
  s2s3_p2c1j2_15 <- s2s3_15
  s2s3_p2c1j3_15 <- s2s3_15
  s2s3_p2c1j4_15 <- s2s3_15
  s3s2_p2c1j1_15 <- s3s2_15*sig_p
  s3s2_p2c1j2_15 <- s3s2_15*sig_p
  s3s2_p2c1j3_15 <- s3s2_15*sig_p*sig_j
  s3s2_p2c1j4_15 <- s3s2_15*sig_p*sig_j
  s1s2_p2c2j1_15 <- s1s2_15*sig_p*sig_c
  s1s2_p2c2j2_15 <- s1s2_15*sig_p*sig_c
  s1s2_p2c2j3_15 <- s1s2_15*sig_p*sig_c*sig_j
  s1s2_p2c2j4_15 <- s1s2_15*sig_p*sig_c*sig_j
  s2s3_p2c2j1_15 <- s2s3_15
  s2s3_p2c2j2_15 <- s2s3_15
  s2s3_p2c2j3_15 <- s2s3_15
  s2s3_p2c2j4_15 <- s2s3_15
  s3s2_p2c2j1_15 <- s3s2_15*sig_p*sig_c
  s3s2_p2c2j2_15 <- s3s2_15*sig_p*sig_c
  s3s2_p2c2j3_15 <- s3s2_15*sig_p*sig_c*sig_j
  s3s2_p2c2j4_15 <- s3s2_15*sig_p*sig_c*sig_j
  s1s2_p2c3j1_15 <- s1s2_15*sig_p*sig_c
  s1s2_p2c3j2_15 <- s1s2_15*sig_p*sig_c
  s1s2_p2c3j3_15 <- s1s2_15*sig_p*sig_c*sig_j
  s1s2_p2c3j4_15 <- s1s2_15*sig_p*sig_c*sig_j
  s2s3_p2c3j1_15 <- s2s3_15
  s2s3_p2c3j2_15 <- s2s3_15
  s2s3_p2c3j3_15 <- s2s3_15
  s2s3_p2c3j4_15 <- s2s3_15
  s3s2_p2c3j1_15 <- s3s2_15*sig_p*sig_c
  s3s2_p2c3j2_15 <- s3s2_15*sig_p*sig_c
  s3s2_p2c3j3_15 <- s3s2_15*sig_p*sig_c*sig_j
  s3s2_p2c3j4_15 <- s3s2_15*sig_p*sig_c*sig_j
  s1s2_p2c4j1_15 <- s1s2_15*sig_p*sig_c
  s1s2_p2c4j2_15 <- s1s2_15*sig_p*sig_c
  s1s2_p2c4j3_15 <- s1s2_15*sig_p*sig_c*sig_j
  s1s2_p2c4j4_15 <- s1s2_15*sig_p*sig_c*sig_j
  s2s3_p2c4j1_15 <- s2s3_15
  s2s3_p2c4j2_15 <- s2s3_15
  s2s3_p2c4j3_15 <- s2s3_15
  s2s3_p2c4j4_15 <- s2s3_15
  s3s2_p2c4j1_15 <- s3s2_15*sig_p*sig_c
  s3s2_p2c4j2_15 <- s3s2_15*sig_p*sig_c
  s3s2_p2c4j3_15 <- s3s2_15*sig_p*sig_c*sig_j
  s3s2_p2c4j4_15 <- s3s2_15*sig_p*sig_c*sig_j
  s1s2_p1c1j1_16 <- s1s2_16
  s1s2_p1c1j2_16 <- s1s2_16
  s1s2_p1c1j3_16 <- s1s2_16*sig_j
  s1s2_p1c1j4_16 <- s1s2_16*sig_j
  s2s3_p1c1j1_16 <- s2s3_16
  s2s3_p1c1j2_16 <- s2s3_16
  s2s3_p1c1j3_16 <- s2s3_16
  s2s3_p1c1j4_16 <- s2s3_16
  s3s2_p1c1j1_16 <- s3s2_16
  s3s2_p1c1j2_16 <- s3s2_16
  s3s2_p1c1j3_16 <- s3s2_16*sig_j
  s3s2_p1c1j4_16 <- s3s2_16*sig_j
  s1s2_p1c2j1_16 <- s1s2_16*sig_c
  s1s2_p1c2j2_16 <- s1s2_16*sig_c
  s1s2_p1c2j3_16 <- s1s2_16*sig_c*sig_j
  s1s2_p1c2j4_16 <- s1s2_16*sig_c*sig_j
  s2s3_p1c2j1_16 <- s2s3_16
  s2s3_p1c2j2_16 <- s2s3_16
  s2s3_p1c2j3_16 <- s2s3_16
  s2s3_p1c2j4_16 <- s2s3_16
  s3s2_p1c2j1_16 <- s3s2_16*sig_c
  s3s2_p1c2j2_16 <- s3s2_16*sig_c
  s3s2_p1c2j3_16 <- s3s2_16*sig_c*sig_j
  s3s2_p1c2j4_16 <- s3s2_16*sig_c*sig_j
  s1s2_p1c3j1_16 <- s1s2_16*sig_c
  s1s2_p1c3j2_16 <- s1s2_16*sig_c
  s1s2_p1c3j3_16 <- s1s2_16*sig_c*sig_j
  s1s2_p1c3j4_16 <- s1s2_16*sig_c*sig_j
  s2s3_p1c3j1_16 <- s2s3_16
  s2s3_p1c3j2_16 <- s2s3_16
  s2s3_p1c3j3_16 <- s2s3_16
  s2s3_p1c3j4_16 <- s2s3_16
  s3s2_p1c3j1_16 <- s3s2_16*sig_c
  s3s2_p1c3j2_16 <- s3s2_16*sig_c
  s3s2_p1c3j3_16 <- s3s2_16*sig_c*sig_j
  s3s2_p1c3j4_16 <- s3s2_16*sig_c*sig_j
  s1s2_p1c4j1_16 <- s1s2_16*sig_c
  s1s2_p1c4j2_16 <- s1s2_16*sig_c
  s1s2_p1c4j3_16 <- s1s2_16*sig_c*sig_j
  s1s2_p1c4j4_16 <- s1s2_16*sig_c*sig_j
  s2s3_p1c4j1_16 <- s2s3_16
  s2s3_p1c4j2_16 <- s2s3_16
  s2s3_p1c4j3_16 <- s2s3_16
  s2s3_p1c4j4_16 <- s2s3_16
  s3s2_p1c4j1_16 <- s3s2_16*sig_c
  s3s2_p1c4j2_16 <- s3s2_16*sig_c
  s3s2_p1c4j3_16 <- s3s2_16*sig_c*sig_j
  s3s2_p1c4j4_16 <- s3s2_16*sig_c*sig_j
  s1s2_p2c1j1_16 <- s1s2_16*sig_p
  s1s2_p2c1j2_16 <- s1s2_16*sig_p
  s1s2_p2c1j3_16 <- s1s2_16*sig_p*sig_j
  s1s2_p2c1j4_16 <- s1s2_16*sig_p*sig_j
  s2s3_p2c1j1_16 <- s2s3_16
  s2s3_p2c1j2_16 <- s2s3_16
  s2s3_p2c1j3_16 <- s2s3_16
  s2s3_p2c1j4_16 <- s2s3_16
  s3s2_p2c1j1_16 <- s3s2_16*sig_p
  s3s2_p2c1j2_16 <- s3s2_16*sig_p
  s3s2_p2c1j3_16 <- s3s2_16*sig_p*sig_j
  s3s2_p2c1j4_16 <- s3s2_16*sig_p*sig_j
  s1s2_p2c2j1_16 <- s1s2_16*sig_p*sig_c
  s1s2_p2c2j2_16 <- s1s2_16*sig_p*sig_c
  s1s2_p2c2j3_16 <- s1s2_16*sig_p*sig_c*sig_j
  s1s2_p2c2j4_16 <- s1s2_16*sig_p*sig_c*sig_j
  s2s3_p2c2j1_16 <- s2s3_16
  s2s3_p2c2j2_16 <- s2s3_16
  s2s3_p2c2j3_16 <- s2s3_16
  s2s3_p2c2j4_16 <- s2s3_16
  s3s2_p2c2j1_16 <- s3s2_16*sig_p*sig_c
  s3s2_p2c2j2_16 <- s3s2_16*sig_p*sig_c
  s3s2_p2c2j3_16 <- s3s2_16*sig_p*sig_c*sig_j
  s3s2_p2c2j4_16 <- s3s2_16*sig_p*sig_c*sig_j
  s1s2_p2c3j1_16 <- s1s2_16*sig_p*sig_c
  s1s2_p2c3j2_16 <- s1s2_16*sig_p*sig_c
  s1s2_p2c3j3_16 <- s1s2_16*sig_p*sig_c*sig_j
  s1s2_p2c3j4_16 <- s1s2_16*sig_p*sig_c*sig_j
  s2s3_p2c3j1_16 <- s2s3_16
  s2s3_p2c3j2_16 <- s2s3_16
  s2s3_p2c3j3_16 <- s2s3_16
  s2s3_p2c3j4_16 <- s2s3_16
  s3s2_p2c3j1_16 <- s3s2_16*sig_p*sig_c
  s3s2_p2c3j2_16 <- s3s2_16*sig_p*sig_c
  s3s2_p2c3j3_16 <- s3s2_16*sig_p*sig_c*sig_j
  s3s2_p2c3j4_16 <- s3s2_16*sig_p*sig_c*sig_j
  s1s2_p2c4j1_16 <- s1s2_16*sig_p*sig_c
  s1s2_p2c4j2_16 <- s1s2_16*sig_p*sig_c
  s1s2_p2c4j3_16 <- s1s2_16*sig_p*sig_c*sig_j
  s1s2_p2c4j4_16 <- s1s2_16*sig_p*sig_c*sig_j
  s2s3_p2c4j1_16 <- s2s3_16
  s2s3_p2c4j2_16 <- s2s3_16
  s2s3_p2c4j3_16 <- s2s3_16
  s2s3_p2c4j4_16 <- s2s3_16
  s3s2_p2c4j1_16 <- s3s2_16*sig_p*sig_c
  s3s2_p2c4j2_16 <- s3s2_16*sig_p*sig_c
  s3s2_p2c4j3_16 <- s3s2_16*sig_p*sig_c*sig_j
  s3s2_p2c4j4_16 <- s3s2_16*sig_p*sig_c*sig_j
  s1s2_p1c1j1_17 <- s1s2_17
  s1s2_p1c1j2_17 <- s1s2_17
  s1s2_p1c1j3_17 <- s1s2_17*sig_j
  s1s2_p1c1j4_17 <- s1s2_17*sig_j
  s2s3_p1c1j1_17 <- s2s3_17
  s2s3_p1c1j2_17 <- s2s3_17
  s2s3_p1c1j3_17 <- s2s3_17
  s2s3_p1c1j4_17 <- s2s3_17
  s3s2_p1c1j1_17 <- s3s2_17
  s3s2_p1c1j2_17 <- s3s2_17
  s3s2_p1c1j3_17 <- s3s2_17*sig_j
  s3s2_p1c1j4_17 <- s3s2_17*sig_j
  s1s2_p1c2j1_17 <- s1s2_17*sig_c
  s1s2_p1c2j2_17 <- s1s2_17*sig_c
  s1s2_p1c2j3_17 <- s1s2_17*sig_c*sig_j
  s1s2_p1c2j4_17 <- s1s2_17*sig_c*sig_j
  s2s3_p1c2j1_17 <- s2s3_17
  s2s3_p1c2j2_17 <- s2s3_17
  s2s3_p1c2j3_17 <- s2s3_17
  s2s3_p1c2j4_17 <- s2s3_17
  s3s2_p1c2j1_17 <- s3s2_17*sig_c
  s3s2_p1c2j2_17 <- s3s2_17*sig_c
  s3s2_p1c2j3_17 <- s3s2_17*sig_c*sig_j
  s3s2_p1c2j4_17 <- s3s2_17*sig_c*sig_j
  s1s2_p1c3j1_17 <- s1s2_17*sig_c
  s1s2_p1c3j2_17 <- s1s2_17*sig_c
  s1s2_p1c3j3_17 <- s1s2_17*sig_c*sig_j
  s1s2_p1c3j4_17 <- s1s2_17*sig_c*sig_j
  s2s3_p1c3j1_17 <- s2s3_17
  s2s3_p1c3j2_17 <- s2s3_17
  s2s3_p1c3j3_17 <- s2s3_17
  s2s3_p1c3j4_17 <- s2s3_17
  s3s2_p1c3j1_17 <- s3s2_17*sig_c
  s3s2_p1c3j2_17 <- s3s2_17*sig_c
  s3s2_p1c3j3_17 <- s3s2_17*sig_c*sig_j
  s3s2_p1c3j4_17 <- s3s2_17*sig_c*sig_j
  s1s2_p1c4j1_17 <- s1s2_17*sig_c
  s1s2_p1c4j2_17 <- s1s2_17*sig_c
  s1s2_p1c4j3_17 <- s1s2_17*sig_c*sig_j
  s1s2_p1c4j4_17 <- s1s2_17*sig_c*sig_j
  s2s3_p1c4j1_17 <- s2s3_17
  s2s3_p1c4j2_17 <- s2s3_17
  s2s3_p1c4j3_17 <- s2s3_17
  s2s3_p1c4j4_17 <- s2s3_17
  s3s2_p1c4j1_17 <- s3s2_17*sig_c
  s3s2_p1c4j2_17 <- s3s2_17*sig_c
  s3s2_p1c4j3_17 <- s3s2_17*sig_c*sig_j
  s3s2_p1c4j4_17 <- s3s2_17*sig_c*sig_j
  s1s2_p2c1j1_17 <- s1s2_17*sig_p
  s1s2_p2c1j2_17 <- s1s2_17*sig_p
  s1s2_p2c1j3_17 <- s1s2_17*sig_p*sig_j
  s1s2_p2c1j4_17 <- s1s2_17*sig_p*sig_j
  s2s3_p2c1j1_17 <- s2s3_17
  s2s3_p2c1j2_17 <- s2s3_17
  s2s3_p2c1j3_17 <- s2s3_17
  s2s3_p2c1j4_17 <- s2s3_17
  s3s2_p2c1j1_17 <- s3s2_17*sig_p
  s3s2_p2c1j2_17 <- s3s2_17*sig_p
  s3s2_p2c1j3_17 <- s3s2_17*sig_p*sig_j
  s3s2_p2c1j4_17 <- s3s2_17*sig_p*sig_j
  s1s2_p2c2j1_17 <- s1s2_17*sig_p*sig_c
  s1s2_p2c2j2_17 <- s1s2_17*sig_p*sig_c
  s1s2_p2c2j3_17 <- s1s2_17*sig_p*sig_c*sig_j
  s1s2_p2c2j4_17 <- s1s2_17*sig_p*sig_c*sig_j
  s2s3_p2c2j1_17 <- s2s3_17
  s2s3_p2c2j2_17 <- s2s3_17
  s2s3_p2c2j3_17 <- s2s3_17
  s2s3_p2c2j4_17 <- s2s3_17
  s3s2_p2c2j1_17 <- s3s2_17*sig_p*sig_c
  s3s2_p2c2j2_17 <- s3s2_17*sig_p*sig_c
  s3s2_p2c2j3_17 <- s3s2_17*sig_p*sig_c*sig_j
  s3s2_p2c2j4_17 <- s3s2_17*sig_p*sig_c*sig_j
  s1s2_p2c3j1_17 <- s1s2_17*sig_p*sig_c
  s1s2_p2c3j2_17 <- s1s2_17*sig_p*sig_c
  s1s2_p2c3j3_17 <- s1s2_17*sig_p*sig_c*sig_j
  s1s2_p2c3j4_17 <- s1s2_17*sig_p*sig_c*sig_j
  s2s3_p2c3j1_17 <- s2s3_17
  s2s3_p2c3j2_17 <- s2s3_17
  s2s3_p2c3j3_17 <- s2s3_17
  s2s3_p2c3j4_17 <- s2s3_17
  s3s2_p2c3j1_17 <- s3s2_17*sig_p*sig_c
  s3s2_p2c3j2_17 <- s3s2_17*sig_p*sig_c
  s3s2_p2c3j3_17 <- s3s2_17*sig_p*sig_c*sig_j
  s3s2_p2c3j4_17 <- s3s2_17*sig_p*sig_c*sig_j
  s1s2_p2c4j1_17 <- s1s2_17*sig_p*sig_c
  s1s2_p2c4j2_17 <- s1s2_17*sig_p*sig_c
  s1s2_p2c4j3_17 <- s1s2_17*sig_p*sig_c*sig_j
  s1s2_p2c4j4_17 <- s1s2_17*sig_p*sig_c*sig_j
  s2s3_p2c4j1_17 <- s2s3_17
  s2s3_p2c4j2_17 <- s2s3_17
  s2s3_p2c4j3_17 <- s2s3_17
  s2s3_p2c4j4_17 <- s2s3_17
  s3s2_p2c4j1_17 <- s3s2_17*sig_p*sig_c
  s3s2_p2c4j2_17 <- s3s2_17*sig_p*sig_c
  s3s2_p2c4j3_17 <- s3s2_17*sig_p*sig_c*sig_j
  s3s2_p2c4j4_17 <- s3s2_17*sig_p*sig_c*sig_j
  
  
  
  
  c1c2_p1s1j1_10 <- c1c10*(1-r10)
  c1c2_p1s1j2_10 <- c1c10*(1-r10)
  c1c2_p1s1j3_10 <- c1c10*(1-r10)
  c1c2_p1s1j4_10 <- c1c10*(1-r10)
  c1c2_p1s2j1_10 <- c1c10*(1-r10)
  c1c2_p1s2j2_10 <- c1c10*(1-r10)
  c1c2_p1s2j3_10 <- c1c10*(1-r10)
  c1c2_p1s2j4_10 <- c1c10*(1-r10)
  c1c2_p1s3j1_10 <- c1c10*(1-r10)
  c1c2_p1s3j2_10 <- c1c10*(1-r10)
  c1c2_p1s3j3_10 <- c1c10*(1-r10)
  c1c2_p1s3j4_10 <- c1c10*(1-r10)
  c2c3_p1s1j1_10 <- stay10*r10*end_nr
  c2c3_p1s1j2_10 <- stay10*r10*end_nr
  c2c3_p1s1j3_10 <- stay10*r10*end_nr
  c2c3_p1s1j4_10 <- stay10*r10*end_nr
  c2c3_p1s2j1_10 <- stay10*r10*end_nr
  c2c3_p1s2j2_10 <- stay10*r10*end_nr
  c2c3_p1s2j3_10 <- stay10*r10*end_nr
  c2c3_p1s2j4_10 <- stay10*r10*end_nr
  c2c3_p1s3j1_10 <- stay10*r10*end_nr
  c2c3_p1s3j2_10 <- stay10*r10*end_nr
  c2c3_p1s3j3_10 <- stay10*r10*end_nr
  c2c3_p1s3j4_10 <- stay10*r10*end_nr
  c3c2_p1s1j1_10 <- stay10*(1-r10)*end_r
  c3c2_p1s1j2_10 <- stay10*(1-r10)*end_r
  c3c2_p1s1j3_10 <- stay10*(1-r10)*end_r
  c3c2_p1s1j4_10 <- stay10*(1-r10)*end_r
  c3c2_p1s2j1_10 <- stay10*(1-r10)*end_r
  c3c2_p1s2j2_10 <- stay10*(1-r10)*end_r
  c3c2_p1s2j3_10 <- stay10*(1-r10)*end_r
  c3c2_p1s2j4_10 <- stay10*(1-r10)*end_r
  c3c2_p1s3j1_10 <- stay10*(1-r10)*end_r
  c3c2_p1s3j2_10 <- stay10*(1-r10)*end_r
  c3c2_p1s3j3_10 <- stay10*(1-r10)*end_r
  c3c2_p1s3j4_10 <- stay10*(1-r10)*end_r
  c4c2_p1s1j1_10 <- c4c10*(1-r10)
  c4c2_p1s1j2_10 <- c4c10*(1-r10)
  c4c2_p1s1j3_10 <- c4c10*(1-r10)
  c4c2_p1s1j4_10 <- c4c10*(1-r10)
  c4c2_p1s2j1_10 <- c4c10*(1-r10)
  c4c2_p1s2j2_10 <- c4c10*(1-r10)
  c4c2_p1s2j3_10 <- c4c10*(1-r10)
  c4c2_p1s2j4_10 <- c4c10*(1-r10)
  c4c2_p1s3j1_10 <- c4c10*(1-r10)
  c4c2_p1s3j2_10 <- c4c10*(1-r10)
  c4c2_p1s3j3_10 <- c4c10*(1-r10)
  c4c2_p1s3j4_10 <- c4c10*(1-r10)
  c1c2_p2s1j1_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s1j2_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s1j3_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s1j4_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s2j1_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s2j2_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s2j3_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s2j4_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s3j1_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s3j2_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s3j3_10 <- c1c10*(1-r10)*phi_p
  c1c2_p2s3j4_10 <- c1c10*(1-r10)*phi_p
  c2c3_p2s1j1_10 <- stay10*r10*end_nr
  c2c3_p2s1j2_10 <- stay10*r10*end_nr
  c2c3_p2s1j3_10 <- stay10*r10*end_nr
  c2c3_p2s1j4_10 <- stay10*r10*end_nr
  c2c3_p2s2j1_10 <- stay10*r10*end_nr
  c2c3_p2s2j2_10 <- stay10*r10*end_nr
  c2c3_p2s2j3_10 <- stay10*r10*end_nr
  c2c3_p2s2j4_10 <- stay10*r10*end_nr
  c2c3_p2s3j1_10 <- stay10*r10*end_nr
  c2c3_p2s3j2_10 <- stay10*r10*end_nr
  c2c3_p2s3j3_10 <- stay10*r10*end_nr
  c2c3_p2s3j4_10 <- stay10*r10*end_nr
  c3c2_p2s1j1_10 <- stay10*(1-r10)*end_r
  c3c2_p2s1j2_10 <- stay10*(1-r10)*end_r
  c3c2_p2s1j3_10 <- stay10*(1-r10)*end_r
  c3c2_p2s1j4_10 <- stay10*(1-r10)*end_r
  c3c2_p2s2j1_10 <- stay10*(1-r10)*end_r
  c3c2_p2s2j2_10 <- stay10*(1-r10)*end_r
  c3c2_p2s2j3_10 <- stay10*(1-r10)*end_r
  c3c2_p2s2j4_10 <- stay10*(1-r10)*end_r
  c3c2_p2s3j1_10 <- stay10*(1-r10)*end_r
  c3c2_p2s3j2_10 <- stay10*(1-r10)*end_r
  c3c2_p2s3j3_10 <- stay10*(1-r10)*end_r
  c3c2_p2s3j4_10 <- stay10*(1-r10)*end_r
  c4c2_p2s1j1_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s1j2_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s1j3_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s1j4_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s2j1_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s2j2_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s2j3_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s2j4_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s3j1_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s3j2_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s3j3_10 <- c4c10*(1-r10)*phi_p
  c4c2_p2s3j4_10 <- c4c10*(1-r10)*phi_p
  c1c2_p1s1j1_11 <- c1c11*(1-r11)
  c1c2_p1s1j2_11 <- c1c11*(1-r11)
  c1c2_p1s1j3_11 <- c1c11*(1-r11)
  c1c2_p1s1j4_11 <- c1c11*(1-r11)
  c1c2_p1s2j1_11 <- c1c11*(1-r11)
  c1c2_p1s2j2_11 <- c1c11*(1-r11)
  c1c2_p1s2j3_11 <- c1c11*(1-r11)
  c1c2_p1s2j4_11 <- c1c11*(1-r11)
  c1c2_p1s3j1_11 <- c1c11*(1-r11)
  c1c2_p1s3j2_11 <- c1c11*(1-r11)
  c1c2_p1s3j3_11 <- c1c11*(1-r11)
  c1c2_p1s3j4_11 <- c1c11*(1-r11)
  c2c3_p1s1j1_11 <- stay11*r11*end_nr
  c2c3_p1s1j2_11 <- stay11*r11*end_nr
  c2c3_p1s1j3_11 <- stay11*r11*end_nr
  c2c3_p1s1j4_11 <- stay11*r11*end_nr
  c2c3_p1s2j1_11 <- stay11*r11*end_nr
  c2c3_p1s2j2_11 <- stay11*r11*end_nr
  c2c3_p1s2j3_11 <- stay11*r11*end_nr
  c2c3_p1s2j4_11 <- stay11*r11*end_nr
  c2c3_p1s3j1_11 <- stay11*r11*end_nr
  c2c3_p1s3j2_11 <- stay11*r11*end_nr
  c2c3_p1s3j3_11 <- stay11*r11*end_nr
  c2c3_p1s3j4_11 <- stay11*r11*end_nr
  c3c2_p1s1j1_11 <- stay11*(1-r11)*end_r
  c3c2_p1s1j2_11 <- stay11*(1-r11)*end_r
  c3c2_p1s1j3_11 <- stay11*(1-r11)*end_r
  c3c2_p1s1j4_11 <- stay11*(1-r11)*end_r
  c3c2_p1s2j1_11 <- stay11*(1-r11)*end_r
  c3c2_p1s2j2_11 <- stay11*(1-r11)*end_r
  c3c2_p1s2j3_11 <- stay11*(1-r11)*end_r
  c3c2_p1s2j4_11 <- stay11*(1-r11)*end_r
  c3c2_p1s3j1_11 <- stay11*(1-r11)*end_r
  c3c2_p1s3j2_11 <- stay11*(1-r11)*end_r
  c3c2_p1s3j3_11 <- stay11*(1-r11)*end_r
  c3c2_p1s3j4_11 <- stay11*(1-r11)*end_r
  c4c2_p1s1j1_11 <- c4c11*(1-r11)
  c4c2_p1s1j2_11 <- c4c11*(1-r11)
  c4c2_p1s1j3_11 <- c4c11*(1-r11)
  c4c2_p1s1j4_11 <- c4c11*(1-r11)
  c4c2_p1s2j1_11 <- c4c11*(1-r11)
  c4c2_p1s2j2_11 <- c4c11*(1-r11)
  c4c2_p1s2j3_11 <- c4c11*(1-r11)
  c4c2_p1s2j4_11 <- c4c11*(1-r11)
  c4c2_p1s3j1_11 <- c4c11*(1-r11)
  c4c2_p1s3j2_11 <- c4c11*(1-r11)
  c4c2_p1s3j3_11 <- c4c11*(1-r11)
  c4c2_p1s3j4_11 <- c4c11*(1-r11)
  c1c2_p2s1j1_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s1j2_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s1j3_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s1j4_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s2j1_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s2j2_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s2j3_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s2j4_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s3j1_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s3j2_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s3j3_11 <- c1c11*(1-r11)*phi_p
  c1c2_p2s3j4_11 <- c1c11*(1-r11)*phi_p
  c2c3_p2s1j1_11 <- stay11*r11*end_nr
  c2c3_p2s1j2_11 <- stay11*r11*end_nr
  c2c3_p2s1j3_11 <- stay11*r11*end_nr
  c2c3_p2s1j4_11 <- stay11*r11*end_nr
  c2c3_p2s2j1_11 <- stay11*r11*end_nr
  c2c3_p2s2j2_11 <- stay11*r11*end_nr
  c2c3_p2s2j3_11 <- stay11*r11*end_nr
  c2c3_p2s2j4_11 <- stay11*r11*end_nr
  c2c3_p2s3j1_11 <- stay11*r11*end_nr
  c2c3_p2s3j2_11 <- stay11*r11*end_nr
  c2c3_p2s3j3_11 <- stay11*r11*end_nr
  c2c3_p2s3j4_11 <- stay11*r11*end_nr
  c3c2_p2s1j1_11 <- stay11*(1-r11)*end_r
  c3c2_p2s1j2_11 <- stay11*(1-r11)*end_r
  c3c2_p2s1j3_11 <- stay11*(1-r11)*end_r
  c3c2_p2s1j4_11 <- stay11*(1-r11)*end_r
  c3c2_p2s2j1_11 <- stay11*(1-r11)*end_r
  c3c2_p2s2j2_11 <- stay11*(1-r11)*end_r
  c3c2_p2s2j3_11 <- stay11*(1-r11)*end_r
  c3c2_p2s2j4_11 <- stay11*(1-r11)*end_r
  c3c2_p2s3j1_11 <- stay11*(1-r11)*end_r
  c3c2_p2s3j2_11 <- stay11*(1-r11)*end_r
  c3c2_p2s3j3_11 <- stay11*(1-r11)*end_r
  c3c2_p2s3j4_11 <- stay11*(1-r11)*end_r
  c4c2_p2s1j1_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s1j2_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s1j3_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s1j4_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s2j1_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s2j2_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s2j3_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s2j4_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s3j1_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s3j2_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s3j3_11 <- c4c11*(1-r11)*phi_p
  c4c2_p2s3j4_11 <- c4c11*(1-r11)*phi_p
  c1c2_p1s1j1_12 <- c1c12*(1-r12)
  c1c2_p1s1j2_12 <- c1c12*(1-r12)
  c1c2_p1s1j3_12 <- c1c12*(1-r12)
  c1c2_p1s1j4_12 <- c1c12*(1-r12)
  c1c2_p1s2j1_12 <- c1c12*(1-r12)
  c1c2_p1s2j2_12 <- c1c12*(1-r12)
  c1c2_p1s2j3_12 <- c1c12*(1-r12)
  c1c2_p1s2j4_12 <- c1c12*(1-r12)
  c1c2_p1s3j1_12 <- c1c12*(1-r12)
  c1c2_p1s3j2_12 <- c1c12*(1-r12)
  c1c2_p1s3j3_12 <- c1c12*(1-r12)
  c1c2_p1s3j4_12 <- c1c12*(1-r12)
  c2c3_p1s1j1_12 <- stay12*r12*end_nr
  c2c3_p1s1j2_12 <- stay12*r12*end_nr
  c2c3_p1s1j3_12 <- stay12*r12*end_nr
  c2c3_p1s1j4_12 <- stay12*r12*end_nr
  c2c3_p1s2j1_12 <- stay12*r12*end_nr
  c2c3_p1s2j2_12 <- stay12*r12*end_nr
  c2c3_p1s2j3_12 <- stay12*r12*end_nr
  c2c3_p1s2j4_12 <- stay12*r12*end_nr
  c2c3_p1s3j1_12 <- stay12*r12*end_nr
  c2c3_p1s3j2_12 <- stay12*r12*end_nr
  c2c3_p1s3j3_12 <- stay12*r12*end_nr
  c2c3_p1s3j4_12 <- stay12*r12*end_nr
  c3c2_p1s1j1_12 <- stay12*(1-r12)*end_r
  c3c2_p1s1j2_12 <- stay12*(1-r12)*end_r
  c3c2_p1s1j3_12 <- stay12*(1-r12)*end_r
  c3c2_p1s1j4_12 <- stay12*(1-r12)*end_r
  c3c2_p1s2j1_12 <- stay12*(1-r12)*end_r
  c3c2_p1s2j2_12 <- stay12*(1-r12)*end_r
  c3c2_p1s2j3_12 <- stay12*(1-r12)*end_r
  c3c2_p1s2j4_12 <- stay12*(1-r12)*end_r
  c3c2_p1s3j1_12 <- stay12*(1-r12)*end_r
  c3c2_p1s3j2_12 <- stay12*(1-r12)*end_r
  c3c2_p1s3j3_12 <- stay12*(1-r12)*end_r
  c3c2_p1s3j4_12 <- stay12*(1-r12)*end_r
  c4c2_p1s1j1_12 <- c4c12*(1-r12)
  c4c2_p1s1j2_12 <- c4c12*(1-r12)
  c4c2_p1s1j3_12 <- c4c12*(1-r12)
  c4c2_p1s1j4_12 <- c4c12*(1-r12)
  c4c2_p1s2j1_12 <- c4c12*(1-r12)
  c4c2_p1s2j2_12 <- c4c12*(1-r12)
  c4c2_p1s2j3_12 <- c4c12*(1-r12)
  c4c2_p1s2j4_12 <- c4c12*(1-r12)
  c4c2_p1s3j1_12 <- c4c12*(1-r12)
  c4c2_p1s3j2_12 <- c4c12*(1-r12)
  c4c2_p1s3j3_12 <- c4c12*(1-r12)
  c4c2_p1s3j4_12 <- c4c12*(1-r12)
  c1c2_p2s1j1_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s1j2_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s1j3_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s1j4_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s2j1_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s2j2_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s2j3_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s2j4_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s3j1_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s3j2_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s3j3_12 <- c1c12*(1-r12)*phi_p
  c1c2_p2s3j4_12 <- c1c12*(1-r12)*phi_p
  c2c3_p2s1j1_12 <- stay12*r12*end_nr
  c2c3_p2s1j2_12 <- stay12*r12*end_nr
  c2c3_p2s1j3_12 <- stay12*r12*end_nr
  c2c3_p2s1j4_12 <- stay12*r12*end_nr
  c2c3_p2s2j1_12 <- stay12*r12*end_nr
  c2c3_p2s2j2_12 <- stay12*r12*end_nr
  c2c3_p2s2j3_12 <- stay12*r12*end_nr
  c2c3_p2s2j4_12 <- stay12*r12*end_nr
  c2c3_p2s3j1_12 <- stay12*r12*end_nr
  c2c3_p2s3j2_12 <- stay12*r12*end_nr
  c2c3_p2s3j3_12 <- stay12*r12*end_nr
  c2c3_p2s3j4_12 <- stay12*r12*end_nr
  c3c2_p2s1j1_12 <- stay12*(1-r12)*end_r
  c3c2_p2s1j2_12 <- stay12*(1-r12)*end_r
  c3c2_p2s1j3_12 <- stay12*(1-r12)*end_r
  c3c2_p2s1j4_12 <- stay12*(1-r12)*end_r
  c3c2_p2s2j1_12 <- stay12*(1-r12)*end_r
  c3c2_p2s2j2_12 <- stay12*(1-r12)*end_r
  c3c2_p2s2j3_12 <- stay12*(1-r12)*end_r
  c3c2_p2s2j4_12 <- stay12*(1-r12)*end_r
  c3c2_p2s3j1_12 <- stay12*(1-r12)*end_r
  c3c2_p2s3j2_12 <- stay12*(1-r12)*end_r
  c3c2_p2s3j3_12 <- stay12*(1-r12)*end_r
  c3c2_p2s3j4_12 <- stay12*(1-r12)*end_r
  c4c2_p2s1j1_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s1j2_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s1j3_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s1j4_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s2j1_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s2j2_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s2j3_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s2j4_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s3j1_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s3j2_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s3j3_12 <- c4c12*(1-r12)*phi_p
  c4c2_p2s3j4_12 <- c4c12*(1-r12)*phi_p
  c1c2_p1s1j1_13 <- c1c13*(1-r13)
  c1c2_p1s1j2_13 <- c1c13*(1-r13)
  c1c2_p1s1j3_13 <- c1c13*(1-r13)
  c1c2_p1s1j4_13 <- c1c13*(1-r13)
  c1c2_p1s2j1_13 <- c1c13*(1-r13)
  c1c2_p1s2j2_13 <- c1c13*(1-r13)
  c1c2_p1s2j3_13 <- c1c13*(1-r13)
  c1c2_p1s2j4_13 <- c1c13*(1-r13)
  c1c2_p1s3j1_13 <- c1c13*(1-r13)
  c1c2_p1s3j2_13 <- c1c13*(1-r13)
  c1c2_p1s3j3_13 <- c1c13*(1-r13)
  c1c2_p1s3j4_13 <- c1c13*(1-r13)
  c2c3_p1s1j1_13 <- stay13*r13*end_nr
  c2c3_p1s1j2_13 <- stay13*r13*end_nr
  c2c3_p1s1j3_13 <- stay13*r13*end_nr
  c2c3_p1s1j4_13 <- stay13*r13*end_nr
  c2c3_p1s2j1_13 <- stay13*r13*end_nr
  c2c3_p1s2j2_13 <- stay13*r13*end_nr
  c2c3_p1s2j3_13 <- stay13*r13*end_nr
  c2c3_p1s2j4_13 <- stay13*r13*end_nr
  c2c3_p1s3j1_13 <- stay13*r13*end_nr
  c2c3_p1s3j2_13 <- stay13*r13*end_nr
  c2c3_p1s3j3_13 <- stay13*r13*end_nr
  c2c3_p1s3j4_13 <- stay13*r13*end_nr
  c3c2_p1s1j1_13 <- stay13*(1-r13)*end_r
  c3c2_p1s1j2_13 <- stay13*(1-r13)*end_r
  c3c2_p1s1j3_13 <- stay13*(1-r13)*end_r
  c3c2_p1s1j4_13 <- stay13*(1-r13)*end_r
  c3c2_p1s2j1_13 <- stay13*(1-r13)*end_r
  c3c2_p1s2j2_13 <- stay13*(1-r13)*end_r
  c3c2_p1s2j3_13 <- stay13*(1-r13)*end_r
  c3c2_p1s2j4_13 <- stay13*(1-r13)*end_r
  c3c2_p1s3j1_13 <- stay13*(1-r13)*end_r
  c3c2_p1s3j2_13 <- stay13*(1-r13)*end_r
  c3c2_p1s3j3_13 <- stay13*(1-r13)*end_r
  c3c2_p1s3j4_13 <- stay13*(1-r13)*end_r
  c4c2_p1s1j1_13 <- c4c13*(1-r13)
  c4c2_p1s1j2_13 <- c4c13*(1-r13)
  c4c2_p1s1j3_13 <- c4c13*(1-r13)
  c4c2_p1s1j4_13 <- c4c13*(1-r13)
  c4c2_p1s2j1_13 <- c4c13*(1-r13)
  c4c2_p1s2j2_13 <- c4c13*(1-r13)
  c4c2_p1s2j3_13 <- c4c13*(1-r13)
  c4c2_p1s2j4_13 <- c4c13*(1-r13)
  c4c2_p1s3j1_13 <- c4c13*(1-r13)
  c4c2_p1s3j2_13 <- c4c13*(1-r13)
  c4c2_p1s3j3_13 <- c4c13*(1-r13)
  c4c2_p1s3j4_13 <- c4c13*(1-r13)
  c1c2_p2s1j1_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s1j2_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s1j3_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s1j4_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s2j1_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s2j2_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s2j3_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s2j4_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s3j1_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s3j2_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s3j3_13 <- c1c13*(1-r13)*phi_p
  c1c2_p2s3j4_13 <- c1c13*(1-r13)*phi_p
  c2c3_p2s1j1_13 <- stay13*r13*end_nr
  c2c3_p2s1j2_13 <- stay13*r13*end_nr
  c2c3_p2s1j3_13 <- stay13*r13*end_nr
  c2c3_p2s1j4_13 <- stay13*r13*end_nr
  c2c3_p2s2j1_13 <- stay13*r13*end_nr
  c2c3_p2s2j2_13 <- stay13*r13*end_nr
  c2c3_p2s2j3_13 <- stay13*r13*end_nr
  c2c3_p2s2j4_13 <- stay13*r13*end_nr
  c2c3_p2s3j1_13 <- stay13*r13*end_nr
  c2c3_p2s3j2_13 <- stay13*r13*end_nr
  c2c3_p2s3j3_13 <- stay13*r13*end_nr
  c2c3_p2s3j4_13 <- stay13*r13*end_nr
  c3c2_p2s1j1_13 <- stay13*(1-r13)*end_r
  c3c2_p2s1j2_13 <- stay13*(1-r13)*end_r
  c3c2_p2s1j3_13 <- stay13*(1-r13)*end_r
  c3c2_p2s1j4_13 <- stay13*(1-r13)*end_r
  c3c2_p2s2j1_13 <- stay13*(1-r13)*end_r
  c3c2_p2s2j2_13 <- stay13*(1-r13)*end_r
  c3c2_p2s2j3_13 <- stay13*(1-r13)*end_r
  c3c2_p2s2j4_13 <- stay13*(1-r13)*end_r
  c3c2_p2s3j1_13 <- stay13*(1-r13)*end_r
  c3c2_p2s3j2_13 <- stay13*(1-r13)*end_r
  c3c2_p2s3j3_13 <- stay13*(1-r13)*end_r
  c3c2_p2s3j4_13 <- stay13*(1-r13)*end_r
  c4c2_p2s1j1_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s1j2_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s1j3_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s1j4_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s2j1_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s2j2_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s2j3_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s2j4_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s3j1_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s3j2_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s3j3_13 <- c4c13*(1-r13)*phi_p
  c4c2_p2s3j4_13 <- c4c13*(1-r13)*phi_p
  c1c2_p1s1j1_14 <- c1c14*(1-r14)
  c1c2_p1s1j2_14 <- c1c14*(1-r14)
  c1c2_p1s1j3_14 <- c1c14*(1-r14)
  c1c2_p1s1j4_14 <- c1c14*(1-r14)
  c1c2_p1s2j1_14 <- c1c14*(1-r14)
  c1c2_p1s2j2_14 <- c1c14*(1-r14)
  c1c2_p1s2j3_14 <- c1c14*(1-r14)
  c1c2_p1s2j4_14 <- c1c14*(1-r14)
  c1c2_p1s3j1_14 <- c1c14*(1-r14)
  c1c2_p1s3j2_14 <- c1c14*(1-r14)
  c1c2_p1s3j3_14 <- c1c14*(1-r14)
  c1c2_p1s3j4_14 <- c1c14*(1-r14)
  c2c3_p1s1j1_14 <- stay14*r14*end_nr
  c2c3_p1s1j2_14 <- stay14*r14*end_nr
  c2c3_p1s1j3_14 <- stay14*r14*end_nr
  c2c3_p1s1j4_14 <- stay14*r14*end_nr
  c2c3_p1s2j1_14 <- stay14*r14*end_nr
  c2c3_p1s2j2_14 <- stay14*r14*end_nr
  c2c3_p1s2j3_14 <- stay14*r14*end_nr
  c2c3_p1s2j4_14 <- stay14*r14*end_nr
  c2c3_p1s3j1_14 <- stay14*r14*end_nr
  c2c3_p1s3j2_14 <- stay14*r14*end_nr
  c2c3_p1s3j3_14 <- stay14*r14*end_nr
  c2c3_p1s3j4_14 <- stay14*r14*end_nr
  c3c2_p1s1j1_14 <- stay14*(1-r14)*end_r
  c3c2_p1s1j2_14 <- stay14*(1-r14)*end_r
  c3c2_p1s1j3_14 <- stay14*(1-r14)*end_r
  c3c2_p1s1j4_14 <- stay14*(1-r14)*end_r
  c3c2_p1s2j1_14 <- stay14*(1-r14)*end_r
  c3c2_p1s2j2_14 <- stay14*(1-r14)*end_r
  c3c2_p1s2j3_14 <- stay14*(1-r14)*end_r
  c3c2_p1s2j4_14 <- stay14*(1-r14)*end_r
  c3c2_p1s3j1_14 <- stay14*(1-r14)*end_r
  c3c2_p1s3j2_14 <- stay14*(1-r14)*end_r
  c3c2_p1s3j3_14 <- stay14*(1-r14)*end_r
  c3c2_p1s3j4_14 <- stay14*(1-r14)*end_r
  c4c2_p1s1j1_14 <- c4c14*(1-r14)
  c4c2_p1s1j2_14 <- c4c14*(1-r14)
  c4c2_p1s1j3_14 <- c4c14*(1-r14)
  c4c2_p1s1j4_14 <- c4c14*(1-r14)
  c4c2_p1s2j1_14 <- c4c14*(1-r14)
  c4c2_p1s2j2_14 <- c4c14*(1-r14)
  c4c2_p1s2j3_14 <- c4c14*(1-r14)
  c4c2_p1s2j4_14 <- c4c14*(1-r14)
  c4c2_p1s3j1_14 <- c4c14*(1-r14)
  c4c2_p1s3j2_14 <- c4c14*(1-r14)
  c4c2_p1s3j3_14 <- c4c14*(1-r14)
  c4c2_p1s3j4_14 <- c4c14*(1-r14)
  c1c2_p2s1j1_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s1j2_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s1j3_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s1j4_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s2j1_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s2j2_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s2j3_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s2j4_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s3j1_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s3j2_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s3j3_14 <- c1c14*(1-r14)*phi_p
  c1c2_p2s3j4_14 <- c1c14*(1-r14)*phi_p
  c2c3_p2s1j1_14 <- stay14*r14*end_nr
  c2c3_p2s1j2_14 <- stay14*r14*end_nr
  c2c3_p2s1j3_14 <- stay14*r14*end_nr
  c2c3_p2s1j4_14 <- stay14*r14*end_nr
  c2c3_p2s2j1_14 <- stay14*r14*end_nr
  c2c3_p2s2j2_14 <- stay14*r14*end_nr
  c2c3_p2s2j3_14 <- stay14*r14*end_nr
  c2c3_p2s2j4_14 <- stay14*r14*end_nr
  c2c3_p2s3j1_14 <- stay14*r14*end_nr
  c2c3_p2s3j2_14 <- stay14*r14*end_nr
  c2c3_p2s3j3_14 <- stay14*r14*end_nr
  c2c3_p2s3j4_14 <- stay14*r14*end_nr
  c3c2_p2s1j1_14 <- stay14*(1-r14)*end_r
  c3c2_p2s1j2_14 <- stay14*(1-r14)*end_r
  c3c2_p2s1j3_14 <- stay14*(1-r14)*end_r
  c3c2_p2s1j4_14 <- stay14*(1-r14)*end_r
  c3c2_p2s2j1_14 <- stay14*(1-r14)*end_r
  c3c2_p2s2j2_14 <- stay14*(1-r14)*end_r
  c3c2_p2s2j3_14 <- stay14*(1-r14)*end_r
  c3c2_p2s2j4_14 <- stay14*(1-r14)*end_r
  c3c2_p2s3j1_14 <- stay14*(1-r14)*end_r
  c3c2_p2s3j2_14 <- stay14*(1-r14)*end_r
  c3c2_p2s3j3_14 <- stay14*(1-r14)*end_r
  c3c2_p2s3j4_14 <- stay14*(1-r14)*end_r
  c4c2_p2s1j1_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s1j2_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s1j3_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s1j4_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s2j1_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s2j2_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s2j3_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s2j4_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s3j1_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s3j2_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s3j3_14 <- c4c14*(1-r14)*phi_p
  c4c2_p2s3j4_14 <- c4c14*(1-r14)*phi_p
  c1c2_p1s1j1_15 <- c1c15*(1-r15)
  c1c2_p1s1j2_15 <- c1c15*(1-r15)
  c1c2_p1s1j3_15 <- c1c15*(1-r15)
  c1c2_p1s1j4_15 <- c1c15*(1-r15)
  c1c2_p1s2j1_15 <- c1c15*(1-r15)
  c1c2_p1s2j2_15 <- c1c15*(1-r15)
  c1c2_p1s2j3_15 <- c1c15*(1-r15)
  c1c2_p1s2j4_15 <- c1c15*(1-r15)
  c1c2_p1s3j1_15 <- c1c15*(1-r15)
  c1c2_p1s3j2_15 <- c1c15*(1-r15)
  c1c2_p1s3j3_15 <- c1c15*(1-r15)
  c1c2_p1s3j4_15 <- c1c15*(1-r15)
  c2c3_p1s1j1_15 <- stay15*r15*end_nr
  c2c3_p1s1j2_15 <- stay15*r15*end_nr
  c2c3_p1s1j3_15 <- stay15*r15*end_nr
  c2c3_p1s1j4_15 <- stay15*r15*end_nr
  c2c3_p1s2j1_15 <- stay15*r15*end_nr
  c2c3_p1s2j2_15 <- stay15*r15*end_nr
  c2c3_p1s2j3_15 <- stay15*r15*end_nr
  c2c3_p1s2j4_15 <- stay15*r15*end_nr
  c2c3_p1s3j1_15 <- stay15*r15*end_nr
  c2c3_p1s3j2_15 <- stay15*r15*end_nr
  c2c3_p1s3j3_15 <- stay15*r15*end_nr
  c2c3_p1s3j4_15 <- stay15*r15*end_nr
  c3c2_p1s1j1_15 <- stay15*(1-r15)*end_r
  c3c2_p1s1j2_15 <- stay15*(1-r15)*end_r
  c3c2_p1s1j3_15 <- stay15*(1-r15)*end_r
  c3c2_p1s1j4_15 <- stay15*(1-r15)*end_r
  c3c2_p1s2j1_15 <- stay15*(1-r15)*end_r
  c3c2_p1s2j2_15 <- stay15*(1-r15)*end_r
  c3c2_p1s2j3_15 <- stay15*(1-r15)*end_r
  c3c2_p1s2j4_15 <- stay15*(1-r15)*end_r
  c3c2_p1s3j1_15 <- stay15*(1-r15)*end_r
  c3c2_p1s3j2_15 <- stay15*(1-r15)*end_r
  c3c2_p1s3j3_15 <- stay15*(1-r15)*end_r
  c3c2_p1s3j4_15 <- stay15*(1-r15)*end_r
  c4c2_p1s1j1_15 <- c4c15*(1-r15)
  c4c2_p1s1j2_15 <- c4c15*(1-r15)
  c4c2_p1s1j3_15 <- c4c15*(1-r15)
  c4c2_p1s1j4_15 <- c4c15*(1-r15)
  c4c2_p1s2j1_15 <- c4c15*(1-r15)
  c4c2_p1s2j2_15 <- c4c15*(1-r15)
  c4c2_p1s2j3_15 <- c4c15*(1-r15)
  c4c2_p1s2j4_15 <- c4c15*(1-r15)
  c4c2_p1s3j1_15 <- c4c15*(1-r15)
  c4c2_p1s3j2_15 <- c4c15*(1-r15)
  c4c2_p1s3j3_15 <- c4c15*(1-r15)
  c4c2_p1s3j4_15 <- c4c15*(1-r15)
  c1c2_p2s1j1_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s1j2_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s1j3_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s1j4_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s2j1_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s2j2_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s2j3_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s2j4_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s3j1_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s3j2_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s3j3_15 <- c1c15*(1-r15)*phi_p
  c1c2_p2s3j4_15 <- c1c15*(1-r15)*phi_p
  c2c3_p2s1j1_15 <- stay15*r15*end_nr
  c2c3_p2s1j2_15 <- stay15*r15*end_nr
  c2c3_p2s1j3_15 <- stay15*r15*end_nr
  c2c3_p2s1j4_15 <- stay15*r15*end_nr
  c2c3_p2s2j1_15 <- stay15*r15*end_nr
  c2c3_p2s2j2_15 <- stay15*r15*end_nr
  c2c3_p2s2j3_15 <- stay15*r15*end_nr
  c2c3_p2s2j4_15 <- stay15*r15*end_nr
  c2c3_p2s3j1_15 <- stay15*r15*end_nr
  c2c3_p2s3j2_15 <- stay15*r15*end_nr
  c2c3_p2s3j3_15 <- stay15*r15*end_nr
  c2c3_p2s3j4_15 <- stay15*r15*end_nr
  c3c2_p2s1j1_15 <- stay15*(1-r15)*end_r
  c3c2_p2s1j2_15 <- stay15*(1-r15)*end_r
  c3c2_p2s1j3_15 <- stay15*(1-r15)*end_r
  c3c2_p2s1j4_15 <- stay15*(1-r15)*end_r
  c3c2_p2s2j1_15 <- stay15*(1-r15)*end_r
  c3c2_p2s2j2_15 <- stay15*(1-r15)*end_r
  c3c2_p2s2j3_15 <- stay15*(1-r15)*end_r
  c3c2_p2s2j4_15 <- stay15*(1-r15)*end_r
  c3c2_p2s3j1_15 <- stay15*(1-r15)*end_r
  c3c2_p2s3j2_15 <- stay15*(1-r15)*end_r
  c3c2_p2s3j3_15 <- stay15*(1-r15)*end_r
  c3c2_p2s3j4_15 <- stay15*(1-r15)*end_r
  c4c2_p2s1j1_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s1j2_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s1j3_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s1j4_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s2j1_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s2j2_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s2j3_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s2j4_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s3j1_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s3j2_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s3j3_15 <- c4c15*(1-r15)*phi_p
  c4c2_p2s3j4_15 <- c4c15*(1-r15)*phi_p
  c1c2_p1s1j1_16 <- c1c16*(1-r16)
  c1c2_p1s1j2_16 <- c1c16*(1-r16)
  c1c2_p1s1j3_16 <- c1c16*(1-r16)
  c1c2_p1s1j4_16 <- c1c16*(1-r16)
  c1c2_p1s2j1_16 <- c1c16*(1-r16)
  c1c2_p1s2j2_16 <- c1c16*(1-r16)
  c1c2_p1s2j3_16 <- c1c16*(1-r16)
  c1c2_p1s2j4_16 <- c1c16*(1-r16)
  c1c2_p1s3j1_16 <- c1c16*(1-r16)
  c1c2_p1s3j2_16 <- c1c16*(1-r16)
  c1c2_p1s3j3_16 <- c1c16*(1-r16)
  c1c2_p1s3j4_16 <- c1c16*(1-r16)
  c2c3_p1s1j1_16 <- stay16*r16*end_nr
  c2c3_p1s1j2_16 <- stay16*r16*end_nr
  c2c3_p1s1j3_16 <- stay16*r16*end_nr
  c2c3_p1s1j4_16 <- stay16*r16*end_nr
  c2c3_p1s2j1_16 <- stay16*r16*end_nr
  c2c3_p1s2j2_16 <- stay16*r16*end_nr
  c2c3_p1s2j3_16 <- stay16*r16*end_nr
  c2c3_p1s2j4_16 <- stay16*r16*end_nr
  c2c3_p1s3j1_16 <- stay16*r16*end_nr
  c2c3_p1s3j2_16 <- stay16*r16*end_nr
  c2c3_p1s3j3_16 <- stay16*r16*end_nr
  c2c3_p1s3j4_16 <- stay16*r16*end_nr
  c3c2_p1s1j1_16 <- stay16*(1-r16)*end_r
  c3c2_p1s1j2_16 <- stay16*(1-r16)*end_r
  c3c2_p1s1j3_16 <- stay16*(1-r16)*end_r
  c3c2_p1s1j4_16 <- stay16*(1-r16)*end_r
  c3c2_p1s2j1_16 <- stay16*(1-r16)*end_r
  c3c2_p1s2j2_16 <- stay16*(1-r16)*end_r
  c3c2_p1s2j3_16 <- stay16*(1-r16)*end_r
  c3c2_p1s2j4_16 <- stay16*(1-r16)*end_r
  c3c2_p1s3j1_16 <- stay16*(1-r16)*end_r
  c3c2_p1s3j2_16 <- stay16*(1-r16)*end_r
  c3c2_p1s3j3_16 <- stay16*(1-r16)*end_r
  c3c2_p1s3j4_16 <- stay16*(1-r16)*end_r
  c4c2_p1s1j1_16 <- c4c16*(1-r16)
  c4c2_p1s1j2_16 <- c4c16*(1-r16)
  c4c2_p1s1j3_16 <- c4c16*(1-r16)
  c4c2_p1s1j4_16 <- c4c16*(1-r16)
  c4c2_p1s2j1_16 <- c4c16*(1-r16)
  c4c2_p1s2j2_16 <- c4c16*(1-r16)
  c4c2_p1s2j3_16 <- c4c16*(1-r16)
  c4c2_p1s2j4_16 <- c4c16*(1-r16)
  c4c2_p1s3j1_16 <- c4c16*(1-r16)
  c4c2_p1s3j2_16 <- c4c16*(1-r16)
  c4c2_p1s3j3_16 <- c4c16*(1-r16)
  c4c2_p1s3j4_16 <- c4c16*(1-r16)
  c1c2_p2s1j1_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s1j2_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s1j3_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s1j4_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s2j1_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s2j2_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s2j3_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s2j4_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s3j1_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s3j2_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s3j3_16 <- c1c16*(1-r16)*phi_p
  c1c2_p2s3j4_16 <- c1c16*(1-r16)*phi_p
  c2c3_p2s1j1_16 <- stay16*r16*end_nr
  c2c3_p2s1j2_16 <- stay16*r16*end_nr
  c2c3_p2s1j3_16 <- stay16*r16*end_nr
  c2c3_p2s1j4_16 <- stay16*r16*end_nr
  c2c3_p2s2j1_16 <- stay16*r16*end_nr
  c2c3_p2s2j2_16 <- stay16*r16*end_nr
  c2c3_p2s2j3_16 <- stay16*r16*end_nr
  c2c3_p2s2j4_16 <- stay16*r16*end_nr
  c2c3_p2s3j1_16 <- stay16*r16*end_nr
  c2c3_p2s3j2_16 <- stay16*r16*end_nr
  c2c3_p2s3j3_16 <- stay16*r16*end_nr
  c2c3_p2s3j4_16 <- stay16*r16*end_nr
  c3c2_p2s1j1_16 <- stay16*(1-r16)*end_r
  c3c2_p2s1j2_16 <- stay16*(1-r16)*end_r
  c3c2_p2s1j3_16 <- stay16*(1-r16)*end_r
  c3c2_p2s1j4_16 <- stay16*(1-r16)*end_r
  c3c2_p2s2j1_16 <- stay16*(1-r16)*end_r
  c3c2_p2s2j2_16 <- stay16*(1-r16)*end_r
  c3c2_p2s2j3_16 <- stay16*(1-r16)*end_r
  c3c2_p2s2j4_16 <- stay16*(1-r16)*end_r
  c3c2_p2s3j1_16 <- stay16*(1-r16)*end_r
  c3c2_p2s3j2_16 <- stay16*(1-r16)*end_r
  c3c2_p2s3j3_16 <- stay16*(1-r16)*end_r
  c3c2_p2s3j4_16 <- stay16*(1-r16)*end_r
  c4c2_p2s1j1_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s1j2_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s1j3_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s1j4_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s2j1_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s2j2_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s2j3_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s2j4_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s3j1_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s3j2_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s3j3_16 <- c4c16*(1-r16)*phi_p
  c4c2_p2s3j4_16 <- c4c16*(1-r16)*phi_p
  c1c2_p1s1j1_17 <- c1c17*(1-r17)
  c1c2_p1s1j2_17 <- c1c17*(1-r17)
  c1c2_p1s1j3_17 <- c1c17*(1-r17)
  c1c2_p1s1j4_17 <- c1c17*(1-r17)
  c1c2_p1s2j1_17 <- c1c17*(1-r17)
  c1c2_p1s2j2_17 <- c1c17*(1-r17)
  c1c2_p1s2j3_17 <- c1c17*(1-r17)
  c1c2_p1s2j4_17 <- c1c17*(1-r17)
  c1c2_p1s3j1_17 <- c1c17*(1-r17)
  c1c2_p1s3j2_17 <- c1c17*(1-r17)
  c1c2_p1s3j3_17 <- c1c17*(1-r17)
  c1c2_p1s3j4_17 <- c1c17*(1-r17)
  c2c3_p1s1j1_17 <- stay17*r17*end_nr
  c2c3_p1s1j2_17 <- stay17*r17*end_nr
  c2c3_p1s1j3_17 <- stay17*r17*end_nr
  c2c3_p1s1j4_17 <- stay17*r17*end_nr
  c2c3_p1s2j1_17 <- stay17*r17*end_nr
  c2c3_p1s2j2_17 <- stay17*r17*end_nr
  c2c3_p1s2j3_17 <- stay17*r17*end_nr
  c2c3_p1s2j4_17 <- stay17*r17*end_nr
  c2c3_p1s3j1_17 <- stay17*r17*end_nr
  c2c3_p1s3j2_17 <- stay17*r17*end_nr
  c2c3_p1s3j3_17 <- stay17*r17*end_nr
  c2c3_p1s3j4_17 <- stay17*r17*end_nr
  c3c2_p1s1j1_17 <- stay17*(1-r17)*end_r
  c3c2_p1s1j2_17 <- stay17*(1-r17)*end_r
  c3c2_p1s1j3_17 <- stay17*(1-r17)*end_r
  c3c2_p1s1j4_17 <- stay17*(1-r17)*end_r
  c3c2_p1s2j1_17 <- stay17*(1-r17)*end_r
  c3c2_p1s2j2_17 <- stay17*(1-r17)*end_r
  c3c2_p1s2j3_17 <- stay17*(1-r17)*end_r
  c3c2_p1s2j4_17 <- stay17*(1-r17)*end_r
  c3c2_p1s3j1_17 <- stay17*(1-r17)*end_r
  c3c2_p1s3j2_17 <- stay17*(1-r17)*end_r
  c3c2_p1s3j3_17 <- stay17*(1-r17)*end_r
  c3c2_p1s3j4_17 <- stay17*(1-r17)*end_r
  c4c2_p1s1j1_17 <- c4c17*(1-r17)
  c4c2_p1s1j2_17 <- c4c17*(1-r17)
  c4c2_p1s1j3_17 <- c4c17*(1-r17)
  c4c2_p1s1j4_17 <- c4c17*(1-r17)
  c4c2_p1s2j1_17 <- c4c17*(1-r17)
  c4c2_p1s2j2_17 <- c4c17*(1-r17)
  c4c2_p1s2j3_17 <- c4c17*(1-r17)
  c4c2_p1s2j4_17 <- c4c17*(1-r17)
  c4c2_p1s3j1_17 <- c4c17*(1-r17)
  c4c2_p1s3j2_17 <- c4c17*(1-r17)
  c4c2_p1s3j3_17 <- c4c17*(1-r17)
  c4c2_p1s3j4_17 <- c4c17*(1-r17)
  c1c2_p2s1j1_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s1j2_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s1j3_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s1j4_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s2j1_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s2j2_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s2j3_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s2j4_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s3j1_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s3j2_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s3j3_17 <- c1c17*(1-r17)*phi_p
  c1c2_p2s3j4_17 <- c1c17*(1-r17)*phi_p
  c2c3_p2s1j1_17 <- stay17*r17*end_nr
  c2c3_p2s1j2_17 <- stay17*r17*end_nr
  c2c3_p2s1j3_17 <- stay17*r17*end_nr
  c2c3_p2s1j4_17 <- stay17*r17*end_nr
  c2c3_p2s2j1_17 <- stay17*r17*end_nr
  c2c3_p2s2j2_17 <- stay17*r17*end_nr
  c2c3_p2s2j3_17 <- stay17*r17*end_nr
  c2c3_p2s2j4_17 <- stay17*r17*end_nr
  c2c3_p2s3j1_17 <- stay17*r17*end_nr
  c2c3_p2s3j2_17 <- stay17*r17*end_nr
  c2c3_p2s3j3_17 <- stay17*r17*end_nr
  c2c3_p2s3j4_17 <- stay17*r17*end_nr
  c3c2_p2s1j1_17 <- stay17*(1-r17)*end_r
  c3c2_p2s1j2_17 <- stay17*(1-r17)*end_r
  c3c2_p2s1j3_17 <- stay17*(1-r17)*end_r
  c3c2_p2s1j4_17 <- stay17*(1-r17)*end_r
  c3c2_p2s2j1_17 <- stay17*(1-r17)*end_r
  c3c2_p2s2j2_17 <- stay17*(1-r17)*end_r
  c3c2_p2s2j3_17 <- stay17*(1-r17)*end_r
  c3c2_p2s2j4_17 <- stay17*(1-r17)*end_r
  c3c2_p2s3j1_17 <- stay17*(1-r17)*end_r
  c3c2_p2s3j2_17 <- stay17*(1-r17)*end_r
  c3c2_p2s3j3_17 <- stay17*(1-r17)*end_r
  c3c2_p2s3j4_17 <- stay17*(1-r17)*end_r
  c4c2_p2s1j1_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s1j2_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s1j3_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s1j4_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s2j1_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s2j2_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s2j3_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s2j4_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s3j1_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s3j2_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s3j3_17 <- c4c17*(1-r17)*phi_p
  c4c2_p2s3j4_17 <- c4c17*(1-r17)*phi_p
  
  
  
  c1c3_p1s1j1_10 <- c1c10*r10
  c1c3_p1s1j2_10 <- c1c10*r10
  c1c3_p1s1j3_10 <- c1c10*r10
  c1c3_p1s1j4_10 <- c1c10*r10
  c1c3_p1s2j1_10 <- c1c10*r10
  c1c3_p1s2j2_10 <- c1c10*r10
  c1c3_p1s2j3_10 <- c1c10*r10
  c1c3_p1s2j4_10 <- c1c10*r10
  c1c3_p1s3j1_10 <- c1c10*r10
  c1c3_p1s3j2_10 <- c1c10*r10
  c1c3_p1s3j3_10 <- c1c10*r10
  c1c3_p1s3j4_10 <- c1c10*r10
  c2c4_p1s1j1_10 <- (1-stay10)*end_nr
  c2c4_p1s1j2_10 <- (1-stay10)*end_nr
  c2c4_p1s1j3_10 <- (1-stay10)*end_nr
  c2c4_p1s1j4_10 <- (1-stay10)*end_nr
  c2c4_p1s2j1_10 <- (1-stay10)*end_nr
  c2c4_p1s2j2_10 <- (1-stay10)*end_nr
  c2c4_p1s2j3_10 <- (1-stay10)*end_nr
  c2c4_p1s2j4_10 <- (1-stay10)*end_nr
  c2c4_p1s3j1_10 <- (1-stay10)*end_nr
  c2c4_p1s3j2_10 <- (1-stay10)*end_nr
  c2c4_p1s3j3_10 <- (1-stay10)*end_nr
  c2c4_p1s3j4_10 <- (1-stay10)*end_nr
  c3c4_p1s1j1_10 <- (1-stay10)*end_r
  c3c4_p1s1j2_10 <- (1-stay10)*end_r
  c3c4_p1s1j3_10 <- (1-stay10)*end_r
  c3c4_p1s1j4_10 <- (1-stay10)*end_r
  c3c4_p1s2j1_10 <- (1-stay10)*end_r
  c3c4_p1s2j2_10 <- (1-stay10)*end_r
  c3c4_p1s2j3_10 <- (1-stay10)*end_r
  c3c4_p1s2j4_10 <- (1-stay10)*end_r
  c3c4_p1s3j1_10 <- (1-stay10)*end_r
  c3c4_p1s3j2_10 <- (1-stay10)*end_r
  c3c4_p1s3j3_10 <- (1-stay10)*end_r
  c3c4_p1s3j4_10 <- (1-stay10)*end_r
  c4c3_p1s1j1_10 <- c4c10*r10
  c4c3_p1s1j2_10 <- c4c10*r10
  c4c3_p1s1j3_10 <- c4c10*r10
  c4c3_p1s1j4_10 <- c4c10*r10
  c4c3_p1s2j1_10 <- c4c10*r10
  c4c3_p1s2j2_10 <- c4c10*r10
  c4c3_p1s2j3_10 <- c4c10*r10
  c4c3_p1s2j4_10 <- c4c10*r10
  c4c3_p1s3j1_10 <- c4c10*r10
  c4c3_p1s3j2_10 <- c4c10*r10
  c4c3_p1s3j3_10 <- c4c10*r10
  c4c3_p1s3j4_10 <- c4c10*r10
  c1c3_p2s1j1_10 <- c1c10*r10*phi_p
  c1c3_p2s1j2_10 <- c1c10*r10*phi_p
  c1c3_p2s1j3_10 <- c1c10*r10*phi_p
  c1c3_p2s1j4_10 <- c1c10*r10*phi_p
  c1c3_p2s2j1_10 <- c1c10*r10*phi_p
  c1c3_p2s2j2_10 <- c1c10*r10*phi_p
  c1c3_p2s2j3_10 <- c1c10*r10*phi_p
  c1c3_p2s2j4_10 <- c1c10*r10*phi_p
  c1c3_p2s3j1_10 <- c1c10*r10*phi_p
  c1c3_p2s3j2_10 <- c1c10*r10*phi_p
  c1c3_p2s3j3_10 <- c1c10*r10*phi_p
  c1c3_p2s3j4_10 <- c1c10*r10*phi_p
  c2c4_p2s1j1_10 <- (1-stay10)*end_nr
  c2c4_p2s1j2_10 <- (1-stay10)*end_nr
  c2c4_p2s1j3_10 <- (1-stay10)*end_nr
  c2c4_p2s1j4_10 <- (1-stay10)*end_nr
  c2c4_p2s2j1_10 <- (1-stay10)*end_nr
  c2c4_p2s2j2_10 <- (1-stay10)*end_nr
  c2c4_p2s2j3_10 <- (1-stay10)*end_nr
  c2c4_p2s2j4_10 <- (1-stay10)*end_nr
  c2c4_p2s3j1_10 <- (1-stay10)*end_nr
  c2c4_p2s3j2_10 <- (1-stay10)*end_nr
  c2c4_p2s3j3_10 <- (1-stay10)*end_nr
  c2c4_p2s3j4_10 <- (1-stay10)*end_nr
  c3c4_p2s1j1_10 <- (1-stay10)*end_r
  c3c4_p2s1j2_10 <- (1-stay10)*end_r
  c3c4_p2s1j3_10 <- (1-stay10)*end_r
  c3c4_p2s1j4_10 <- (1-stay10)*end_r
  c3c4_p2s2j1_10 <- (1-stay10)*end_r
  c3c4_p2s2j2_10 <- (1-stay10)*end_r
  c3c4_p2s2j3_10 <- (1-stay10)*end_r
  c3c4_p2s2j4_10 <- (1-stay10)*end_r
  c3c4_p2s3j1_10 <- (1-stay10)*end_r
  c3c4_p2s3j2_10 <- (1-stay10)*end_r
  c3c4_p2s3j3_10 <- (1-stay10)*end_r
  c3c4_p2s3j4_10 <- (1-stay10)*end_r
  c4c3_p2s1j1_10 <- c4c10*r10*phi_p
  c4c3_p2s1j2_10 <- c4c10*r10*phi_p
  c4c3_p2s1j3_10 <- c4c10*r10*phi_p
  c4c3_p2s1j4_10 <- c4c10*r10*phi_p
  c4c3_p2s2j1_10 <- c4c10*r10*phi_p
  c4c3_p2s2j2_10 <- c4c10*r10*phi_p
  c4c3_p2s2j3_10 <- c4c10*r10*phi_p
  c4c3_p2s2j4_10 <- c4c10*r10*phi_p
  c4c3_p2s3j1_10 <- c4c10*r10*phi_p
  c4c3_p2s3j2_10 <- c4c10*r10*phi_p
  c4c3_p2s3j3_10 <- c4c10*r10*phi_p
  c4c3_p2s3j4_10 <- c4c10*r10*phi_p
  c1c3_p1s1j1_11 <- c1c11*r11
  c1c3_p1s1j2_11 <- c1c11*r11
  c1c3_p1s1j3_11 <- c1c11*r11
  c1c3_p1s1j4_11 <- c1c11*r11
  c1c3_p1s2j1_11 <- c1c11*r11
  c1c3_p1s2j2_11 <- c1c11*r11
  c1c3_p1s2j3_11 <- c1c11*r11
  c1c3_p1s2j4_11 <- c1c11*r11
  c1c3_p1s3j1_11 <- c1c11*r11
  c1c3_p1s3j2_11 <- c1c11*r11
  c1c3_p1s3j3_11 <- c1c11*r11
  c1c3_p1s3j4_11 <- c1c11*r11
  c2c4_p1s1j1_11 <- (1-stay11)*end_nr
  c2c4_p1s1j2_11 <- (1-stay11)*end_nr
  c2c4_p1s1j3_11 <- (1-stay11)*end_nr
  c2c4_p1s1j4_11 <- (1-stay11)*end_nr
  c2c4_p1s2j1_11 <- (1-stay11)*end_nr
  c2c4_p1s2j2_11 <- (1-stay11)*end_nr
  c2c4_p1s2j3_11 <- (1-stay11)*end_nr
  c2c4_p1s2j4_11 <- (1-stay11)*end_nr
  c2c4_p1s3j1_11 <- (1-stay11)*end_nr
  c2c4_p1s3j2_11 <- (1-stay11)*end_nr
  c2c4_p1s3j3_11 <- (1-stay11)*end_nr
  c2c4_p1s3j4_11 <- (1-stay11)*end_nr
  c3c4_p1s1j1_11 <- (1-stay11)*end_r
  c3c4_p1s1j2_11 <- (1-stay11)*end_r
  c3c4_p1s1j3_11 <- (1-stay11)*end_r
  c3c4_p1s1j4_11 <- (1-stay11)*end_r
  c3c4_p1s2j1_11 <- (1-stay11)*end_r
  c3c4_p1s2j2_11 <- (1-stay11)*end_r
  c3c4_p1s2j3_11 <- (1-stay11)*end_r
  c3c4_p1s2j4_11 <- (1-stay11)*end_r
  c3c4_p1s3j1_11 <- (1-stay11)*end_r
  c3c4_p1s3j2_11 <- (1-stay11)*end_r
  c3c4_p1s3j3_11 <- (1-stay11)*end_r
  c3c4_p1s3j4_11 <- (1-stay11)*end_r
  c4c3_p1s1j1_11 <- c4c11*r11
  c4c3_p1s1j2_11 <- c4c11*r11
  c4c3_p1s1j3_11 <- c4c11*r11
  c4c3_p1s1j4_11 <- c4c11*r11
  c4c3_p1s2j1_11 <- c4c11*r11
  c4c3_p1s2j2_11 <- c4c11*r11
  c4c3_p1s2j3_11 <- c4c11*r11
  c4c3_p1s2j4_11 <- c4c11*r11
  c4c3_p1s3j1_11 <- c4c11*r11
  c4c3_p1s3j2_11 <- c4c11*r11
  c4c3_p1s3j3_11 <- c4c11*r11
  c4c3_p1s3j4_11 <- c4c11*r11
  c1c3_p2s1j1_11 <- c1c11*r11*phi_p
  c1c3_p2s1j2_11 <- c1c11*r11*phi_p
  c1c3_p2s1j3_11 <- c1c11*r11*phi_p
  c1c3_p2s1j4_11 <- c1c11*r11*phi_p
  c1c3_p2s2j1_11 <- c1c11*r11*phi_p
  c1c3_p2s2j2_11 <- c1c11*r11*phi_p
  c1c3_p2s2j3_11 <- c1c11*r11*phi_p
  c1c3_p2s2j4_11 <- c1c11*r11*phi_p
  c1c3_p2s3j1_11 <- c1c11*r11*phi_p
  c1c3_p2s3j2_11 <- c1c11*r11*phi_p
  c1c3_p2s3j3_11 <- c1c11*r11*phi_p
  c1c3_p2s3j4_11 <- c1c11*r11*phi_p
  c2c4_p2s1j1_11 <- (1-stay11)*end_nr
  c2c4_p2s1j2_11 <- (1-stay11)*end_nr
  c2c4_p2s1j3_11 <- (1-stay11)*end_nr
  c2c4_p2s1j4_11 <- (1-stay11)*end_nr
  c2c4_p2s2j1_11 <- (1-stay11)*end_nr
  c2c4_p2s2j2_11 <- (1-stay11)*end_nr
  c2c4_p2s2j3_11 <- (1-stay11)*end_nr
  c2c4_p2s2j4_11 <- (1-stay11)*end_nr
  c2c4_p2s3j1_11 <- (1-stay11)*end_nr
  c2c4_p2s3j2_11 <- (1-stay11)*end_nr
  c2c4_p2s3j3_11 <- (1-stay11)*end_nr
  c2c4_p2s3j4_11 <- (1-stay11)*end_nr
  c3c4_p2s1j1_11 <- (1-stay11)*end_r
  c3c4_p2s1j2_11 <- (1-stay11)*end_r
  c3c4_p2s1j3_11 <- (1-stay11)*end_r
  c3c4_p2s1j4_11 <- (1-stay11)*end_r
  c3c4_p2s2j1_11 <- (1-stay11)*end_r
  c3c4_p2s2j2_11 <- (1-stay11)*end_r
  c3c4_p2s2j3_11 <- (1-stay11)*end_r
  c3c4_p2s2j4_11 <- (1-stay11)*end_r
  c3c4_p2s3j1_11 <- (1-stay11)*end_r
  c3c4_p2s3j2_11 <- (1-stay11)*end_r
  c3c4_p2s3j3_11 <- (1-stay11)*end_r
  c3c4_p2s3j4_11 <- (1-stay11)*end_r
  c4c3_p2s1j1_11 <- c4c11*r11*phi_p
  c4c3_p2s1j2_11 <- c4c11*r11*phi_p
  c4c3_p2s1j3_11 <- c4c11*r11*phi_p
  c4c3_p2s1j4_11 <- c4c11*r11*phi_p
  c4c3_p2s2j1_11 <- c4c11*r11*phi_p
  c4c3_p2s2j2_11 <- c4c11*r11*phi_p
  c4c3_p2s2j3_11 <- c4c11*r11*phi_p
  c4c3_p2s2j4_11 <- c4c11*r11*phi_p
  c4c3_p2s3j1_11 <- c4c11*r11*phi_p
  c4c3_p2s3j2_11 <- c4c11*r11*phi_p
  c4c3_p2s3j3_11 <- c4c11*r11*phi_p
  c4c3_p2s3j4_11 <- c4c11*r11*phi_p
  c1c3_p1s1j1_12 <- c1c12*r12
  c1c3_p1s1j2_12 <- c1c12*r12
  c1c3_p1s1j3_12 <- c1c12*r12
  c1c3_p1s1j4_12 <- c1c12*r12
  c1c3_p1s2j1_12 <- c1c12*r12
  c1c3_p1s2j2_12 <- c1c12*r12
  c1c3_p1s2j3_12 <- c1c12*r12
  c1c3_p1s2j4_12 <- c1c12*r12
  c1c3_p1s3j1_12 <- c1c12*r12
  c1c3_p1s3j2_12 <- c1c12*r12
  c1c3_p1s3j3_12 <- c1c12*r12
  c1c3_p1s3j4_12 <- c1c12*r12
  c2c4_p1s1j1_12 <- (1-stay12)*end_nr
  c2c4_p1s1j2_12 <- (1-stay12)*end_nr
  c2c4_p1s1j3_12 <- (1-stay12)*end_nr
  c2c4_p1s1j4_12 <- (1-stay12)*end_nr
  c2c4_p1s2j1_12 <- (1-stay12)*end_nr
  c2c4_p1s2j2_12 <- (1-stay12)*end_nr
  c2c4_p1s2j3_12 <- (1-stay12)*end_nr
  c2c4_p1s2j4_12 <- (1-stay12)*end_nr
  c2c4_p1s3j1_12 <- (1-stay12)*end_nr
  c2c4_p1s3j2_12 <- (1-stay12)*end_nr
  c2c4_p1s3j3_12 <- (1-stay12)*end_nr
  c2c4_p1s3j4_12 <- (1-stay12)*end_nr
  c3c4_p1s1j1_12 <- (1-stay12)*end_r
  c3c4_p1s1j2_12 <- (1-stay12)*end_r
  c3c4_p1s1j3_12 <- (1-stay12)*end_r
  c3c4_p1s1j4_12 <- (1-stay12)*end_r
  c3c4_p1s2j1_12 <- (1-stay12)*end_r
  c3c4_p1s2j2_12 <- (1-stay12)*end_r
  c3c4_p1s2j3_12 <- (1-stay12)*end_r
  c3c4_p1s2j4_12 <- (1-stay12)*end_r
  c3c4_p1s3j1_12 <- (1-stay12)*end_r
  c3c4_p1s3j2_12 <- (1-stay12)*end_r
  c3c4_p1s3j3_12 <- (1-stay12)*end_r
  c3c4_p1s3j4_12 <- (1-stay12)*end_r
  c4c3_p1s1j1_12 <- c4c12*r12
  c4c3_p1s1j2_12 <- c4c12*r12
  c4c3_p1s1j3_12 <- c4c12*r12
  c4c3_p1s1j4_12 <- c4c12*r12
  c4c3_p1s2j1_12 <- c4c12*r12
  c4c3_p1s2j2_12 <- c4c12*r12
  c4c3_p1s2j3_12 <- c4c12*r12
  c4c3_p1s2j4_12 <- c4c12*r12
  c4c3_p1s3j1_12 <- c4c12*r12
  c4c3_p1s3j2_12 <- c4c12*r12
  c4c3_p1s3j3_12 <- c4c12*r12
  c4c3_p1s3j4_12 <- c4c12*r12
  c1c3_p2s1j1_12 <- c1c12*r12*phi_p
  c1c3_p2s1j2_12 <- c1c12*r12*phi_p
  c1c3_p2s1j3_12 <- c1c12*r12*phi_p
  c1c3_p2s1j4_12 <- c1c12*r12*phi_p
  c1c3_p2s2j1_12 <- c1c12*r12*phi_p
  c1c3_p2s2j2_12 <- c1c12*r12*phi_p
  c1c3_p2s2j3_12 <- c1c12*r12*phi_p
  c1c3_p2s2j4_12 <- c1c12*r12*phi_p
  c1c3_p2s3j1_12 <- c1c12*r12*phi_p
  c1c3_p2s3j2_12 <- c1c12*r12*phi_p
  c1c3_p2s3j3_12 <- c1c12*r12*phi_p
  c1c3_p2s3j4_12 <- c1c12*r12*phi_p
  c2c4_p2s1j1_12 <- (1-stay12)*end_nr
  c2c4_p2s1j2_12 <- (1-stay12)*end_nr
  c2c4_p2s1j3_12 <- (1-stay12)*end_nr
  c2c4_p2s1j4_12 <- (1-stay12)*end_nr
  c2c4_p2s2j1_12 <- (1-stay12)*end_nr
  c2c4_p2s2j2_12 <- (1-stay12)*end_nr
  c2c4_p2s2j3_12 <- (1-stay12)*end_nr
  c2c4_p2s2j4_12 <- (1-stay12)*end_nr
  c2c4_p2s3j1_12 <- (1-stay12)*end_nr
  c2c4_p2s3j2_12 <- (1-stay12)*end_nr
  c2c4_p2s3j3_12 <- (1-stay12)*end_nr
  c2c4_p2s3j4_12 <- (1-stay12)*end_nr
  c3c4_p2s1j1_12 <- (1-stay12)*end_r
  c3c4_p2s1j2_12 <- (1-stay12)*end_r
  c3c4_p2s1j3_12 <- (1-stay12)*end_r
  c3c4_p2s1j4_12 <- (1-stay12)*end_r
  c3c4_p2s2j1_12 <- (1-stay12)*end_r
  c3c4_p2s2j2_12 <- (1-stay12)*end_r
  c3c4_p2s2j3_12 <- (1-stay12)*end_r
  c3c4_p2s2j4_12 <- (1-stay12)*end_r
  c3c4_p2s3j1_12 <- (1-stay12)*end_r
  c3c4_p2s3j2_12 <- (1-stay12)*end_r
  c3c4_p2s3j3_12 <- (1-stay12)*end_r
  c3c4_p2s3j4_12 <- (1-stay12)*end_r
  c4c3_p2s1j1_12 <- c4c12*r12*phi_p
  c4c3_p2s1j2_12 <- c4c12*r12*phi_p
  c4c3_p2s1j3_12 <- c4c12*r12*phi_p
  c4c3_p2s1j4_12 <- c4c12*r12*phi_p
  c4c3_p2s2j1_12 <- c4c12*r12*phi_p
  c4c3_p2s2j2_12 <- c4c12*r12*phi_p
  c4c3_p2s2j3_12 <- c4c12*r12*phi_p
  c4c3_p2s2j4_12 <- c4c12*r12*phi_p
  c4c3_p2s3j1_12 <- c4c12*r12*phi_p
  c4c3_p2s3j2_12 <- c4c12*r12*phi_p
  c4c3_p2s3j3_12 <- c4c12*r12*phi_p
  c4c3_p2s3j4_12 <- c4c12*r12*phi_p
  c1c3_p1s1j1_13 <- c1c13*r13
  c1c3_p1s1j2_13 <- c1c13*r13
  c1c3_p1s1j3_13 <- c1c13*r13
  c1c3_p1s1j4_13 <- c1c13*r13
  c1c3_p1s2j1_13 <- c1c13*r13
  c1c3_p1s2j2_13 <- c1c13*r13
  c1c3_p1s2j3_13 <- c1c13*r13
  c1c3_p1s2j4_13 <- c1c13*r13
  c1c3_p1s3j1_13 <- c1c13*r13
  c1c3_p1s3j2_13 <- c1c13*r13
  c1c3_p1s3j3_13 <- c1c13*r13
  c1c3_p1s3j4_13 <- c1c13*r13
  c2c4_p1s1j1_13 <- (1-stay13)*end_nr
  c2c4_p1s1j2_13 <- (1-stay13)*end_nr
  c2c4_p1s1j3_13 <- (1-stay13)*end_nr
  c2c4_p1s1j4_13 <- (1-stay13)*end_nr
  c2c4_p1s2j1_13 <- (1-stay13)*end_nr
  c2c4_p1s2j2_13 <- (1-stay13)*end_nr
  c2c4_p1s2j3_13 <- (1-stay13)*end_nr
  c2c4_p1s2j4_13 <- (1-stay13)*end_nr
  c2c4_p1s3j1_13 <- (1-stay13)*end_nr
  c2c4_p1s3j2_13 <- (1-stay13)*end_nr
  c2c4_p1s3j3_13 <- (1-stay13)*end_nr
  c2c4_p1s3j4_13 <- (1-stay13)*end_nr
  c3c4_p1s1j1_13 <- (1-stay13)*end_r
  c3c4_p1s1j2_13 <- (1-stay13)*end_r
  c3c4_p1s1j3_13 <- (1-stay13)*end_r
  c3c4_p1s1j4_13 <- (1-stay13)*end_r
  c3c4_p1s2j1_13 <- (1-stay13)*end_r
  c3c4_p1s2j2_13 <- (1-stay13)*end_r
  c3c4_p1s2j3_13 <- (1-stay13)*end_r
  c3c4_p1s2j4_13 <- (1-stay13)*end_r
  c3c4_p1s3j1_13 <- (1-stay13)*end_r
  c3c4_p1s3j2_13 <- (1-stay13)*end_r
  c3c4_p1s3j3_13 <- (1-stay13)*end_r
  c3c4_p1s3j4_13 <- (1-stay13)*end_r
  c4c3_p1s1j1_13 <- c4c13*r13
  c4c3_p1s1j2_13 <- c4c13*r13
  c4c3_p1s1j3_13 <- c4c13*r13
  c4c3_p1s1j4_13 <- c4c13*r13
  c4c3_p1s2j1_13 <- c4c13*r13
  c4c3_p1s2j2_13 <- c4c13*r13
  c4c3_p1s2j3_13 <- c4c13*r13
  c4c3_p1s2j4_13 <- c4c13*r13
  c4c3_p1s3j1_13 <- c4c13*r13
  c4c3_p1s3j2_13 <- c4c13*r13
  c4c3_p1s3j3_13 <- c4c13*r13
  c4c3_p1s3j4_13 <- c4c13*r13
  c1c3_p2s1j1_13 <- c1c13*r13*phi_p
  c1c3_p2s1j2_13 <- c1c13*r13*phi_p
  c1c3_p2s1j3_13 <- c1c13*r13*phi_p
  c1c3_p2s1j4_13 <- c1c13*r13*phi_p
  c1c3_p2s2j1_13 <- c1c13*r13*phi_p
  c1c3_p2s2j2_13 <- c1c13*r13*phi_p
  c1c3_p2s2j3_13 <- c1c13*r13*phi_p
  c1c3_p2s2j4_13 <- c1c13*r13*phi_p
  c1c3_p2s3j1_13 <- c1c13*r13*phi_p
  c1c3_p2s3j2_13 <- c1c13*r13*phi_p
  c1c3_p2s3j3_13 <- c1c13*r13*phi_p
  c1c3_p2s3j4_13 <- c1c13*r13*phi_p
  c2c4_p2s1j1_13 <- (1-stay13)*end_nr
  c2c4_p2s1j2_13 <- (1-stay13)*end_nr
  c2c4_p2s1j3_13 <- (1-stay13)*end_nr
  c2c4_p2s1j4_13 <- (1-stay13)*end_nr
  c2c4_p2s2j1_13 <- (1-stay13)*end_nr
  c2c4_p2s2j2_13 <- (1-stay13)*end_nr
  c2c4_p2s2j3_13 <- (1-stay13)*end_nr
  c2c4_p2s2j4_13 <- (1-stay13)*end_nr
  c2c4_p2s3j1_13 <- (1-stay13)*end_nr
  c2c4_p2s3j2_13 <- (1-stay13)*end_nr
  c2c4_p2s3j3_13 <- (1-stay13)*end_nr
  c2c4_p2s3j4_13 <- (1-stay13)*end_nr
  c3c4_p2s1j1_13 <- (1-stay13)*end_r
  c3c4_p2s1j2_13 <- (1-stay13)*end_r
  c3c4_p2s1j3_13 <- (1-stay13)*end_r
  c3c4_p2s1j4_13 <- (1-stay13)*end_r
  c3c4_p2s2j1_13 <- (1-stay13)*end_r
  c3c4_p2s2j2_13 <- (1-stay13)*end_r
  c3c4_p2s2j3_13 <- (1-stay13)*end_r
  c3c4_p2s2j4_13 <- (1-stay13)*end_r
  c3c4_p2s3j1_13 <- (1-stay13)*end_r
  c3c4_p2s3j2_13 <- (1-stay13)*end_r
  c3c4_p2s3j3_13 <- (1-stay13)*end_r
  c3c4_p2s3j4_13 <- (1-stay13)*end_r
  c4c3_p2s1j1_13 <- c4c13*r13*phi_p
  c4c3_p2s1j2_13 <- c4c13*r13*phi_p
  c4c3_p2s1j3_13 <- c4c13*r13*phi_p
  c4c3_p2s1j4_13 <- c4c13*r13*phi_p
  c4c3_p2s2j1_13 <- c4c13*r13*phi_p
  c4c3_p2s2j2_13 <- c4c13*r13*phi_p
  c4c3_p2s2j3_13 <- c4c13*r13*phi_p
  c4c3_p2s2j4_13 <- c4c13*r13*phi_p
  c4c3_p2s3j1_13 <- c4c13*r13*phi_p
  c4c3_p2s3j2_13 <- c4c13*r13*phi_p
  c4c3_p2s3j3_13 <- c4c13*r13*phi_p
  c4c3_p2s3j4_13 <- c4c13*r13*phi_p
  c1c3_p1s1j1_14 <- c1c14*r14
  c1c3_p1s1j2_14 <- c1c14*r14
  c1c3_p1s1j3_14 <- c1c14*r14
  c1c3_p1s1j4_14 <- c1c14*r14
  c1c3_p1s2j1_14 <- c1c14*r14
  c1c3_p1s2j2_14 <- c1c14*r14
  c1c3_p1s2j3_14 <- c1c14*r14
  c1c3_p1s2j4_14 <- c1c14*r14
  c1c3_p1s3j1_14 <- c1c14*r14
  c1c3_p1s3j2_14 <- c1c14*r14
  c1c3_p1s3j3_14 <- c1c14*r14
  c1c3_p1s3j4_14 <- c1c14*r14
  c2c4_p1s1j1_14 <- (1-stay14)*end_nr
  c2c4_p1s1j2_14 <- (1-stay14)*end_nr
  c2c4_p1s1j3_14 <- (1-stay14)*end_nr
  c2c4_p1s1j4_14 <- (1-stay14)*end_nr
  c2c4_p1s2j1_14 <- (1-stay14)*end_nr
  c2c4_p1s2j2_14 <- (1-stay14)*end_nr
  c2c4_p1s2j3_14 <- (1-stay14)*end_nr
  c2c4_p1s2j4_14 <- (1-stay14)*end_nr
  c2c4_p1s3j1_14 <- (1-stay14)*end_nr
  c2c4_p1s3j2_14 <- (1-stay14)*end_nr
  c2c4_p1s3j3_14 <- (1-stay14)*end_nr
  c2c4_p1s3j4_14 <- (1-stay14)*end_nr
  c3c4_p1s1j1_14 <- (1-stay14)*end_r
  c3c4_p1s1j2_14 <- (1-stay14)*end_r
  c3c4_p1s1j3_14 <- (1-stay14)*end_r
  c3c4_p1s1j4_14 <- (1-stay14)*end_r
  c3c4_p1s2j1_14 <- (1-stay14)*end_r
  c3c4_p1s2j2_14 <- (1-stay14)*end_r
  c3c4_p1s2j3_14 <- (1-stay14)*end_r
  c3c4_p1s2j4_14 <- (1-stay14)*end_r
  c3c4_p1s3j1_14 <- (1-stay14)*end_r
  c3c4_p1s3j2_14 <- (1-stay14)*end_r
  c3c4_p1s3j3_14 <- (1-stay14)*end_r
  c3c4_p1s3j4_14 <- (1-stay14)*end_r
  c4c3_p1s1j1_14 <- c4c14*r14
  c4c3_p1s1j2_14 <- c4c14*r14
  c4c3_p1s1j3_14 <- c4c14*r14
  c4c3_p1s1j4_14 <- c4c14*r14
  c4c3_p1s2j1_14 <- c4c14*r14
  c4c3_p1s2j2_14 <- c4c14*r14
  c4c3_p1s2j3_14 <- c4c14*r14
  c4c3_p1s2j4_14 <- c4c14*r14
  c4c3_p1s3j1_14 <- c4c14*r14
  c4c3_p1s3j2_14 <- c4c14*r14
  c4c3_p1s3j3_14 <- c4c14*r14
  c4c3_p1s3j4_14 <- c4c14*r14
  c1c3_p2s1j1_14 <- c1c14*r14*phi_p
  c1c3_p2s1j2_14 <- c1c14*r14*phi_p
  c1c3_p2s1j3_14 <- c1c14*r14*phi_p
  c1c3_p2s1j4_14 <- c1c14*r14*phi_p
  c1c3_p2s2j1_14 <- c1c14*r14*phi_p
  c1c3_p2s2j2_14 <- c1c14*r14*phi_p
  c1c3_p2s2j3_14 <- c1c14*r14*phi_p
  c1c3_p2s2j4_14 <- c1c14*r14*phi_p
  c1c3_p2s3j1_14 <- c1c14*r14*phi_p
  c1c3_p2s3j2_14 <- c1c14*r14*phi_p
  c1c3_p2s3j3_14 <- c1c14*r14*phi_p
  c1c3_p2s3j4_14 <- c1c14*r14*phi_p
  c2c4_p2s1j1_14 <- (1-stay14)*end_nr
  c2c4_p2s1j2_14 <- (1-stay14)*end_nr
  c2c4_p2s1j3_14 <- (1-stay14)*end_nr
  c2c4_p2s1j4_14 <- (1-stay14)*end_nr
  c2c4_p2s2j1_14 <- (1-stay14)*end_nr
  c2c4_p2s2j2_14 <- (1-stay14)*end_nr
  c2c4_p2s2j3_14 <- (1-stay14)*end_nr
  c2c4_p2s2j4_14 <- (1-stay14)*end_nr
  c2c4_p2s3j1_14 <- (1-stay14)*end_nr
  c2c4_p2s3j2_14 <- (1-stay14)*end_nr
  c2c4_p2s3j3_14 <- (1-stay14)*end_nr
  c2c4_p2s3j4_14 <- (1-stay14)*end_nr
  c3c4_p2s1j1_14 <- (1-stay14)*end_r
  c3c4_p2s1j2_14 <- (1-stay14)*end_r
  c3c4_p2s1j3_14 <- (1-stay14)*end_r
  c3c4_p2s1j4_14 <- (1-stay14)*end_r
  c3c4_p2s2j1_14 <- (1-stay14)*end_r
  c3c4_p2s2j2_14 <- (1-stay14)*end_r
  c3c4_p2s2j3_14 <- (1-stay14)*end_r
  c3c4_p2s2j4_14 <- (1-stay14)*end_r
  c3c4_p2s3j1_14 <- (1-stay14)*end_r
  c3c4_p2s3j2_14 <- (1-stay14)*end_r
  c3c4_p2s3j3_14 <- (1-stay14)*end_r
  c3c4_p2s3j4_14 <- (1-stay14)*end_r
  c4c3_p2s1j1_14 <- c4c14*r14*phi_p
  c4c3_p2s1j2_14 <- c4c14*r14*phi_p
  c4c3_p2s1j3_14 <- c4c14*r14*phi_p
  c4c3_p2s1j4_14 <- c4c14*r14*phi_p
  c4c3_p2s2j1_14 <- c4c14*r14*phi_p
  c4c3_p2s2j2_14 <- c4c14*r14*phi_p
  c4c3_p2s2j3_14 <- c4c14*r14*phi_p
  c4c3_p2s2j4_14 <- c4c14*r14*phi_p
  c4c3_p2s3j1_14 <- c4c14*r14*phi_p
  c4c3_p2s3j2_14 <- c4c14*r14*phi_p
  c4c3_p2s3j3_14 <- c4c14*r14*phi_p
  c4c3_p2s3j4_14 <- c4c14*r14*phi_p
  c1c3_p1s1j1_15 <- c1c15*r15
  c1c3_p1s1j2_15 <- c1c15*r15
  c1c3_p1s1j3_15 <- c1c15*r15
  c1c3_p1s1j4_15 <- c1c15*r15
  c1c3_p1s2j1_15 <- c1c15*r15
  c1c3_p1s2j2_15 <- c1c15*r15
  c1c3_p1s2j3_15 <- c1c15*r15
  c1c3_p1s2j4_15 <- c1c15*r15
  c1c3_p1s3j1_15 <- c1c15*r15
  c1c3_p1s3j2_15 <- c1c15*r15
  c1c3_p1s3j3_15 <- c1c15*r15
  c1c3_p1s3j4_15 <- c1c15*r15
  c2c4_p1s1j1_15 <- (1-stay15)*end_nr
  c2c4_p1s1j2_15 <- (1-stay15)*end_nr
  c2c4_p1s1j3_15 <- (1-stay15)*end_nr
  c2c4_p1s1j4_15 <- (1-stay15)*end_nr
  c2c4_p1s2j1_15 <- (1-stay15)*end_nr
  c2c4_p1s2j2_15 <- (1-stay15)*end_nr
  c2c4_p1s2j3_15 <- (1-stay15)*end_nr
  c2c4_p1s2j4_15 <- (1-stay15)*end_nr
  c2c4_p1s3j1_15 <- (1-stay15)*end_nr
  c2c4_p1s3j2_15 <- (1-stay15)*end_nr
  c2c4_p1s3j3_15 <- (1-stay15)*end_nr
  c2c4_p1s3j4_15 <- (1-stay15)*end_nr
  c3c4_p1s1j1_15 <- (1-stay15)*end_r
  c3c4_p1s1j2_15 <- (1-stay15)*end_r
  c3c4_p1s1j3_15 <- (1-stay15)*end_r
  c3c4_p1s1j4_15 <- (1-stay15)*end_r
  c3c4_p1s2j1_15 <- (1-stay15)*end_r
  c3c4_p1s2j2_15 <- (1-stay15)*end_r
  c3c4_p1s2j3_15 <- (1-stay15)*end_r
  c3c4_p1s2j4_15 <- (1-stay15)*end_r
  c3c4_p1s3j1_15 <- (1-stay15)*end_r
  c3c4_p1s3j2_15 <- (1-stay15)*end_r
  c3c4_p1s3j3_15 <- (1-stay15)*end_r
  c3c4_p1s3j4_15 <- (1-stay15)*end_r
  c4c3_p1s1j1_15 <- c4c15*r15
  c4c3_p1s1j2_15 <- c4c15*r15
  c4c3_p1s1j3_15 <- c4c15*r15
  c4c3_p1s1j4_15 <- c4c15*r15
  c4c3_p1s2j1_15 <- c4c15*r15
  c4c3_p1s2j2_15 <- c4c15*r15
  c4c3_p1s2j3_15 <- c4c15*r15
  c4c3_p1s2j4_15 <- c4c15*r15
  c4c3_p1s3j1_15 <- c4c15*r15
  c4c3_p1s3j2_15 <- c4c15*r15
  c4c3_p1s3j3_15 <- c4c15*r15
  c4c3_p1s3j4_15 <- c4c15*r15
  c1c3_p2s1j1_15 <- c1c15*r15*phi_p
  c1c3_p2s1j2_15 <- c1c15*r15*phi_p
  c1c3_p2s1j3_15 <- c1c15*r15*phi_p
  c1c3_p2s1j4_15 <- c1c15*r15*phi_p
  c1c3_p2s2j1_15 <- c1c15*r15*phi_p
  c1c3_p2s2j2_15 <- c1c15*r15*phi_p
  c1c3_p2s2j3_15 <- c1c15*r15*phi_p
  c1c3_p2s2j4_15 <- c1c15*r15*phi_p
  c1c3_p2s3j1_15 <- c1c15*r15*phi_p
  c1c3_p2s3j2_15 <- c1c15*r15*phi_p
  c1c3_p2s3j3_15 <- c1c15*r15*phi_p
  c1c3_p2s3j4_15 <- c1c15*r15*phi_p
  c2c4_p2s1j1_15 <- (1-stay15)*end_nr
  c2c4_p2s1j2_15 <- (1-stay15)*end_nr
  c2c4_p2s1j3_15 <- (1-stay15)*end_nr
  c2c4_p2s1j4_15 <- (1-stay15)*end_nr
  c2c4_p2s2j1_15 <- (1-stay15)*end_nr
  c2c4_p2s2j2_15 <- (1-stay15)*end_nr
  c2c4_p2s2j3_15 <- (1-stay15)*end_nr
  c2c4_p2s2j4_15 <- (1-stay15)*end_nr
  c2c4_p2s3j1_15 <- (1-stay15)*end_nr
  c2c4_p2s3j2_15 <- (1-stay15)*end_nr
  c2c4_p2s3j3_15 <- (1-stay15)*end_nr
  c2c4_p2s3j4_15 <- (1-stay15)*end_nr
  c3c4_p2s1j1_15 <- (1-stay15)*end_r
  c3c4_p2s1j2_15 <- (1-stay15)*end_r
  c3c4_p2s1j3_15 <- (1-stay15)*end_r
  c3c4_p2s1j4_15 <- (1-stay15)*end_r
  c3c4_p2s2j1_15 <- (1-stay15)*end_r
  c3c4_p2s2j2_15 <- (1-stay15)*end_r
  c3c4_p2s2j3_15 <- (1-stay15)*end_r
  c3c4_p2s2j4_15 <- (1-stay15)*end_r
  c3c4_p2s3j1_15 <- (1-stay15)*end_r
  c3c4_p2s3j2_15 <- (1-stay15)*end_r
  c3c4_p2s3j3_15 <- (1-stay15)*end_r
  c3c4_p2s3j4_15 <- (1-stay15)*end_r
  c4c3_p2s1j1_15 <- c4c15*r15*phi_p
  c4c3_p2s1j2_15 <- c4c15*r15*phi_p
  c4c3_p2s1j3_15 <- c4c15*r15*phi_p
  c4c3_p2s1j4_15 <- c4c15*r15*phi_p
  c4c3_p2s2j1_15 <- c4c15*r15*phi_p
  c4c3_p2s2j2_15 <- c4c15*r15*phi_p
  c4c3_p2s2j3_15 <- c4c15*r15*phi_p
  c4c3_p2s2j4_15 <- c4c15*r15*phi_p
  c4c3_p2s3j1_15 <- c4c15*r15*phi_p
  c4c3_p2s3j2_15 <- c4c15*r15*phi_p
  c4c3_p2s3j3_15 <- c4c15*r15*phi_p
  c4c3_p2s3j4_15 <- c4c15*r15*phi_p
  c1c3_p1s1j1_16 <- c1c16*r16
  c1c3_p1s1j2_16 <- c1c16*r16
  c1c3_p1s1j3_16 <- c1c16*r16
  c1c3_p1s1j4_16 <- c1c16*r16
  c1c3_p1s2j1_16 <- c1c16*r16
  c1c3_p1s2j2_16 <- c1c16*r16
  c1c3_p1s2j3_16 <- c1c16*r16
  c1c3_p1s2j4_16 <- c1c16*r16
  c1c3_p1s3j1_16 <- c1c16*r16
  c1c3_p1s3j2_16 <- c1c16*r16
  c1c3_p1s3j3_16 <- c1c16*r16
  c1c3_p1s3j4_16 <- c1c16*r16
  c2c4_p1s1j1_16 <- (1-stay16)*end_nr
  c2c4_p1s1j2_16 <- (1-stay16)*end_nr
  c2c4_p1s1j3_16 <- (1-stay16)*end_nr
  c2c4_p1s1j4_16 <- (1-stay16)*end_nr
  c2c4_p1s2j1_16 <- (1-stay16)*end_nr
  c2c4_p1s2j2_16 <- (1-stay16)*end_nr
  c2c4_p1s2j3_16 <- (1-stay16)*end_nr
  c2c4_p1s2j4_16 <- (1-stay16)*end_nr
  c2c4_p1s3j1_16 <- (1-stay16)*end_nr
  c2c4_p1s3j2_16 <- (1-stay16)*end_nr
  c2c4_p1s3j3_16 <- (1-stay16)*end_nr
  c2c4_p1s3j4_16 <- (1-stay16)*end_nr
  c3c4_p1s1j1_16 <- (1-stay16)*end_r
  c3c4_p1s1j2_16 <- (1-stay16)*end_r
  c3c4_p1s1j3_16 <- (1-stay16)*end_r
  c3c4_p1s1j4_16 <- (1-stay16)*end_r
  c3c4_p1s2j1_16 <- (1-stay16)*end_r
  c3c4_p1s2j2_16 <- (1-stay16)*end_r
  c3c4_p1s2j3_16 <- (1-stay16)*end_r
  c3c4_p1s2j4_16 <- (1-stay16)*end_r
  c3c4_p1s3j1_16 <- (1-stay16)*end_r
  c3c4_p1s3j2_16 <- (1-stay16)*end_r
  c3c4_p1s3j3_16 <- (1-stay16)*end_r
  c3c4_p1s3j4_16 <- (1-stay16)*end_r
  c4c3_p1s1j1_16 <- c4c16*r16
  c4c3_p1s1j2_16 <- c4c16*r16
  c4c3_p1s1j3_16 <- c4c16*r16
  c4c3_p1s1j4_16 <- c4c16*r16
  c4c3_p1s2j1_16 <- c4c16*r16
  c4c3_p1s2j2_16 <- c4c16*r16
  c4c3_p1s2j3_16 <- c4c16*r16
  c4c3_p1s2j4_16 <- c4c16*r16
  c4c3_p1s3j1_16 <- c4c16*r16
  c4c3_p1s3j2_16 <- c4c16*r16
  c4c3_p1s3j3_16 <- c4c16*r16
  c4c3_p1s3j4_16 <- c4c16*r16
  c1c3_p2s1j1_16 <- c1c16*r16*phi_p
  c1c3_p2s1j2_16 <- c1c16*r16*phi_p
  c1c3_p2s1j3_16 <- c1c16*r16*phi_p
  c1c3_p2s1j4_16 <- c1c16*r16*phi_p
  c1c3_p2s2j1_16 <- c1c16*r16*phi_p
  c1c3_p2s2j2_16 <- c1c16*r16*phi_p
  c1c3_p2s2j3_16 <- c1c16*r16*phi_p
  c1c3_p2s2j4_16 <- c1c16*r16*phi_p
  c1c3_p2s3j1_16 <- c1c16*r16*phi_p
  c1c3_p2s3j2_16 <- c1c16*r16*phi_p
  c1c3_p2s3j3_16 <- c1c16*r16*phi_p
  c1c3_p2s3j4_16 <- c1c16*r16*phi_p
  c2c4_p2s1j1_16 <- (1-stay16)*end_nr
  c2c4_p2s1j2_16 <- (1-stay16)*end_nr
  c2c4_p2s1j3_16 <- (1-stay16)*end_nr
  c2c4_p2s1j4_16 <- (1-stay16)*end_nr
  c2c4_p2s2j1_16 <- (1-stay16)*end_nr
  c2c4_p2s2j2_16 <- (1-stay16)*end_nr
  c2c4_p2s2j3_16 <- (1-stay16)*end_nr
  c2c4_p2s2j4_16 <- (1-stay16)*end_nr
  c2c4_p2s3j1_16 <- (1-stay16)*end_nr
  c2c4_p2s3j2_16 <- (1-stay16)*end_nr
  c2c4_p2s3j3_16 <- (1-stay16)*end_nr
  c2c4_p2s3j4_16 <- (1-stay16)*end_nr
  c3c4_p2s1j1_16 <- (1-stay16)*end_r
  c3c4_p2s1j2_16 <- (1-stay16)*end_r
  c3c4_p2s1j3_16 <- (1-stay16)*end_r
  c3c4_p2s1j4_16 <- (1-stay16)*end_r
  c3c4_p2s2j1_16 <- (1-stay16)*end_r
  c3c4_p2s2j2_16 <- (1-stay16)*end_r
  c3c4_p2s2j3_16 <- (1-stay16)*end_r
  c3c4_p2s2j4_16 <- (1-stay16)*end_r
  c3c4_p2s3j1_16 <- (1-stay16)*end_r
  c3c4_p2s3j2_16 <- (1-stay16)*end_r
  c3c4_p2s3j3_16 <- (1-stay16)*end_r
  c3c4_p2s3j4_16 <- (1-stay16)*end_r
  c4c3_p2s1j1_16 <- c4c16*r16*phi_p
  c4c3_p2s1j2_16 <- c4c16*r16*phi_p
  c4c3_p2s1j3_16 <- c4c16*r16*phi_p
  c4c3_p2s1j4_16 <- c4c16*r16*phi_p
  c4c3_p2s2j1_16 <- c4c16*r16*phi_p
  c4c3_p2s2j2_16 <- c4c16*r16*phi_p
  c4c3_p2s2j3_16 <- c4c16*r16*phi_p
  c4c3_p2s2j4_16 <- c4c16*r16*phi_p
  c4c3_p2s3j1_16 <- c4c16*r16*phi_p
  c4c3_p2s3j2_16 <- c4c16*r16*phi_p
  c4c3_p2s3j3_16 <- c4c16*r16*phi_p
  c4c3_p2s3j4_16 <- c4c16*r16*phi_p
  c1c3_p1s1j1_17 <- c1c17*r17
  c1c3_p1s1j2_17 <- c1c17*r17
  c1c3_p1s1j3_17 <- c1c17*r17
  c1c3_p1s1j4_17 <- c1c17*r17
  c1c3_p1s2j1_17 <- c1c17*r17
  c1c3_p1s2j2_17 <- c1c17*r17
  c1c3_p1s2j3_17 <- c1c17*r17
  c1c3_p1s2j4_17 <- c1c17*r17
  c1c3_p1s3j1_17 <- c1c17*r17
  c1c3_p1s3j2_17 <- c1c17*r17
  c1c3_p1s3j3_17 <- c1c17*r17
  c1c3_p1s3j4_17 <- c1c17*r17
  c2c4_p1s1j1_17 <- (1-stay17)*end_nr
  c2c4_p1s1j2_17 <- (1-stay17)*end_nr
  c2c4_p1s1j3_17 <- (1-stay17)*end_nr
  c2c4_p1s1j4_17 <- (1-stay17)*end_nr
  c2c4_p1s2j1_17 <- (1-stay17)*end_nr
  c2c4_p1s2j2_17 <- (1-stay17)*end_nr
  c2c4_p1s2j3_17 <- (1-stay17)*end_nr
  c2c4_p1s2j4_17 <- (1-stay17)*end_nr
  c2c4_p1s3j1_17 <- (1-stay17)*end_nr
  c2c4_p1s3j2_17 <- (1-stay17)*end_nr
  c2c4_p1s3j3_17 <- (1-stay17)*end_nr
  c2c4_p1s3j4_17 <- (1-stay17)*end_nr
  c3c4_p1s1j1_17 <- (1-stay17)*end_r
  c3c4_p1s1j2_17 <- (1-stay17)*end_r
  c3c4_p1s1j3_17 <- (1-stay17)*end_r
  c3c4_p1s1j4_17 <- (1-stay17)*end_r
  c3c4_p1s2j1_17 <- (1-stay17)*end_r
  c3c4_p1s2j2_17 <- (1-stay17)*end_r
  c3c4_p1s2j3_17 <- (1-stay17)*end_r
  c3c4_p1s2j4_17 <- (1-stay17)*end_r
  c3c4_p1s3j1_17 <- (1-stay17)*end_r
  c3c4_p1s3j2_17 <- (1-stay17)*end_r
  c3c4_p1s3j3_17 <- (1-stay17)*end_r
  c3c4_p1s3j4_17 <- (1-stay17)*end_r
  c4c3_p1s1j1_17 <- c4c17*r17
  c4c3_p1s1j2_17 <- c4c17*r17
  c4c3_p1s1j3_17 <- c4c17*r17
  c4c3_p1s1j4_17 <- c4c17*r17
  c4c3_p1s2j1_17 <- c4c17*r17
  c4c3_p1s2j2_17 <- c4c17*r17
  c4c3_p1s2j3_17 <- c4c17*r17
  c4c3_p1s2j4_17 <- c4c17*r17
  c4c3_p1s3j1_17 <- c4c17*r17
  c4c3_p1s3j2_17 <- c4c17*r17
  c4c3_p1s3j3_17 <- c4c17*r17
  c4c3_p1s3j4_17 <- c4c17*r17
  c1c3_p2s1j1_17 <- c1c17*r17*phi_p
  c1c3_p2s1j2_17 <- c1c17*r17*phi_p
  c1c3_p2s1j3_17 <- c1c17*r17*phi_p
  c1c3_p2s1j4_17 <- c1c17*r17*phi_p
  c1c3_p2s2j1_17 <- c1c17*r17*phi_p
  c1c3_p2s2j2_17 <- c1c17*r17*phi_p
  c1c3_p2s2j3_17 <- c1c17*r17*phi_p
  c1c3_p2s2j4_17 <- c1c17*r17*phi_p
  c1c3_p2s3j1_17 <- c1c17*r17*phi_p
  c1c3_p2s3j2_17 <- c1c17*r17*phi_p
  c1c3_p2s3j3_17 <- c1c17*r17*phi_p
  c1c3_p2s3j4_17 <- c1c17*r17*phi_p
  c2c4_p2s1j1_17 <- (1-stay17)*end_nr
  c2c4_p2s1j2_17 <- (1-stay17)*end_nr
  c2c4_p2s1j3_17 <- (1-stay17)*end_nr
  c2c4_p2s1j4_17 <- (1-stay17)*end_nr
  c2c4_p2s2j1_17 <- (1-stay17)*end_nr
  c2c4_p2s2j2_17 <- (1-stay17)*end_nr
  c2c4_p2s2j3_17 <- (1-stay17)*end_nr
  c2c4_p2s2j4_17 <- (1-stay17)*end_nr
  c2c4_p2s3j1_17 <- (1-stay17)*end_nr
  c2c4_p2s3j2_17 <- (1-stay17)*end_nr
  c2c4_p2s3j3_17 <- (1-stay17)*end_nr
  c2c4_p2s3j4_17 <- (1-stay17)*end_nr
  c3c4_p2s1j1_17 <- (1-stay17)*end_r
  c3c4_p2s1j2_17 <- (1-stay17)*end_r
  c3c4_p2s1j3_17 <- (1-stay17)*end_r
  c3c4_p2s1j4_17 <- (1-stay17)*end_r
  c3c4_p2s2j1_17 <- (1-stay17)*end_r
  c3c4_p2s2j2_17 <- (1-stay17)*end_r
  c3c4_p2s2j3_17 <- (1-stay17)*end_r
  c3c4_p2s2j4_17 <- (1-stay17)*end_r
  c3c4_p2s3j1_17 <- (1-stay17)*end_r
  c3c4_p2s3j2_17 <- (1-stay17)*end_r
  c3c4_p2s3j3_17 <- (1-stay17)*end_r
  c3c4_p2s3j4_17 <- (1-stay17)*end_r
  c4c3_p2s1j1_17 <- c4c17*r17*phi_p
  c4c3_p2s1j2_17 <- c4c17*r17*phi_p
  c4c3_p2s1j3_17 <- c4c17*r17*phi_p
  c4c3_p2s1j4_17 <- c4c17*r17*phi_p
  c4c3_p2s2j1_17 <- c4c17*r17*phi_p
  c4c3_p2s2j2_17 <- c4c17*r17*phi_p
  c4c3_p2s2j3_17 <- c4c17*r17*phi_p
  c4c3_p2s2j4_17 <- c4c17*r17*phi_p
  c4c3_p2s3j1_17 <- c4c17*r17*phi_p
  c4c3_p2s3j2_17 <- c4c17*r17*phi_p
  c4c3_p2s3j3_17 <- c4c17*r17*phi_p
  c4c3_p2s3j4_17 <- c4c17*r17*phi_p
  
  
  ds_p1c1s1_10 <- 1 - on_p1c1s1_10
  ds_p1c1s2_10 <- 1 - on_p1c1s2_10
  ds_p1c1s3_10 <- 1 - on_p1c1s3_10
  ds_p1c2s1_10 <- 1 - on_p1c2s1_10
  ds_p1c2s2_10 <- 1 - on_p1c2s2_10
  ds_p1c2s3_10 <- 1 - on_p1c2s3_10
  ds_p1c3s1_10 <- 1 - on_p1c3s1_10
  ds_p1c3s2_10 <- 1 - on_p1c3s2_10
  ds_p1c3s3_10 <- 1 - on_p1c3s3_10
  ds_p1c4s1_10 <- 1 - on_p1c4s1_10
  ds_p1c4s2_10 <- 1 - on_p1c4s2_10
  ds_p1c4s3_10 <- 1 - on_p1c4s3_10
  ds_p2c1s1_10 <- 1 - on_p2c1s1_10
  ds_p2c1s2_10 <- 1 - on_p2c1s2_10
  ds_p2c1s3_10 <- 1 - on_p2c1s3_10
  ds_p2c2s1_10 <- 1 - on_p2c2s1_10
  ds_p2c2s2_10 <- 1 - on_p2c2s2_10
  ds_p2c2s3_10 <- 1 - on_p2c2s3_10
  ds_p2c3s1_10 <- 1 - on_p2c3s1_10
  ds_p2c3s2_10 <- 1 - on_p2c3s2_10
  ds_p2c3s3_10 <- 1 - on_p2c3s3_10
  ds_p2c4s1_10 <- 1 - on_p2c4s1_10
  ds_p2c4s2_10 <- 1 - on_p2c4s2_10
  ds_p2c4s3_10 <- 1 - on_p2c4s3_10
  ds_p1c1s1_11 <- 1 - on_p1c1s1_11
  ds_p1c1s2_11 <- 1 - on_p1c1s2_11
  ds_p1c1s3_11 <- 1 - on_p1c1s3_11
  ds_p1c2s1_11 <- 1 - on_p1c2s1_11
  ds_p1c2s2_11 <- 1 - on_p1c2s2_11
  ds_p1c2s3_11 <- 1 - on_p1c2s3_11
  ds_p1c3s1_11 <- 1 - on_p1c3s1_11
  ds_p1c3s2_11 <- 1 - on_p1c3s2_11
  ds_p1c3s3_11 <- 1 - on_p1c3s3_11
  ds_p1c4s1_11 <- 1 - on_p1c4s1_11
  ds_p1c4s2_11 <- 1 - on_p1c4s2_11
  ds_p1c4s3_11 <- 1 - on_p1c4s3_11
  ds_p2c1s1_11 <- 1 - on_p2c1s1_11
  ds_p2c1s2_11 <- 1 - on_p2c1s2_11
  ds_p2c1s3_11 <- 1 - on_p2c1s3_11
  ds_p2c2s1_11 <- 1 - on_p2c2s1_11
  ds_p2c2s2_11 <- 1 - on_p2c2s2_11
  ds_p2c2s3_11 <- 1 - on_p2c2s3_11
  ds_p2c3s1_11 <- 1 - on_p2c3s1_11
  ds_p2c3s2_11 <- 1 - on_p2c3s2_11
  ds_p2c3s3_11 <- 1 - on_p2c3s3_11
  ds_p2c4s1_11 <- 1 - on_p2c4s1_11
  ds_p2c4s2_11 <- 1 - on_p2c4s2_11
  ds_p2c4s3_11 <- 1 - on_p2c4s3_11
  ds_p1c1s1_12 <- 1 - on_p1c1s1_12
  ds_p1c1s2_12 <- 1 - on_p1c1s2_12
  ds_p1c1s3_12 <- 1 - on_p1c1s3_12
  ds_p1c2s1_12 <- 1 - on_p1c2s1_12
  ds_p1c2s2_12 <- 1 - on_p1c2s2_12
  ds_p1c2s3_12 <- 1 - on_p1c2s3_12
  ds_p1c3s1_12 <- 1 - on_p1c3s1_12
  ds_p1c3s2_12 <- 1 - on_p1c3s2_12
  ds_p1c3s3_12 <- 1 - on_p1c3s3_12
  ds_p1c4s1_12 <- 1 - on_p1c4s1_12
  ds_p1c4s2_12 <- 1 - on_p1c4s2_12
  ds_p1c4s3_12 <- 1 - on_p1c4s3_12
  ds_p2c1s1_12 <- 1 - on_p2c1s1_12
  ds_p2c1s2_12 <- 1 - on_p2c1s2_12
  ds_p2c1s3_12 <- 1 - on_p2c1s3_12
  ds_p2c2s1_12 <- 1 - on_p2c2s1_12
  ds_p2c2s2_12 <- 1 - on_p2c2s2_12
  ds_p2c2s3_12 <- 1 - on_p2c2s3_12
  ds_p2c3s1_12 <- 1 - on_p2c3s1_12
  ds_p2c3s2_12 <- 1 - on_p2c3s2_12
  ds_p2c3s3_12 <- 1 - on_p2c3s3_12
  ds_p2c4s1_12 <- 1 - on_p2c4s1_12
  ds_p2c4s2_12 <- 1 - on_p2c4s2_12
  ds_p2c4s3_12 <- 1 - on_p2c4s3_12
  ds_p1c1s1_13 <- 1 - on_p1c1s1_13
  ds_p1c1s2_13 <- 1 - on_p1c1s2_13
  ds_p1c1s3_13 <- 1 - on_p1c1s3_13
  ds_p1c2s1_13 <- 1 - on_p1c2s1_13
  ds_p1c2s2_13 <- 1 - on_p1c2s2_13
  ds_p1c2s3_13 <- 1 - on_p1c2s3_13
  ds_p1c3s1_13 <- 1 - on_p1c3s1_13
  ds_p1c3s2_13 <- 1 - on_p1c3s2_13
  ds_p1c3s3_13 <- 1 - on_p1c3s3_13
  ds_p1c4s1_13 <- 1 - on_p1c4s1_13
  ds_p1c4s2_13 <- 1 - on_p1c4s2_13
  ds_p1c4s3_13 <- 1 - on_p1c4s3_13
  ds_p2c1s1_13 <- 1 - on_p2c1s1_13
  ds_p2c1s2_13 <- 1 - on_p2c1s2_13
  ds_p2c1s3_13 <- 1 - on_p2c1s3_13
  ds_p2c2s1_13 <- 1 - on_p2c2s1_13
  ds_p2c2s2_13 <- 1 - on_p2c2s2_13
  ds_p2c2s3_13 <- 1 - on_p2c2s3_13
  ds_p2c3s1_13 <- 1 - on_p2c3s1_13
  ds_p2c3s2_13 <- 1 - on_p2c3s2_13
  ds_p2c3s3_13 <- 1 - on_p2c3s3_13
  ds_p2c4s1_13 <- 1 - on_p2c4s1_13
  ds_p2c4s2_13 <- 1 - on_p2c4s2_13
  ds_p2c4s3_13 <- 1 - on_p2c4s3_13
  ds_p1c1s1_14 <- 1 - on_p1c1s1_14
  ds_p1c1s2_14 <- 1 - on_p1c1s2_14
  ds_p1c1s3_14 <- 1 - on_p1c1s3_14
  ds_p1c2s1_14 <- 1 - on_p1c2s1_14
  ds_p1c2s2_14 <- 1 - on_p1c2s2_14
  ds_p1c2s3_14 <- 1 - on_p1c2s3_14
  ds_p1c3s1_14 <- 1 - on_p1c3s1_14
  ds_p1c3s2_14 <- 1 - on_p1c3s2_14
  ds_p1c3s3_14 <- 1 - on_p1c3s3_14
  ds_p1c4s1_14 <- 1 - on_p1c4s1_14
  ds_p1c4s2_14 <- 1 - on_p1c4s2_14
  ds_p1c4s3_14 <- 1 - on_p1c4s3_14
  ds_p2c1s1_14 <- 1 - on_p2c1s1_14
  ds_p2c1s2_14 <- 1 - on_p2c1s2_14
  ds_p2c1s3_14 <- 1 - on_p2c1s3_14
  ds_p2c2s1_14 <- 1 - on_p2c2s1_14
  ds_p2c2s2_14 <- 1 - on_p2c2s2_14
  ds_p2c2s3_14 <- 1 - on_p2c2s3_14
  ds_p2c3s1_14 <- 1 - on_p2c3s1_14
  ds_p2c3s2_14 <- 1 - on_p2c3s2_14
  ds_p2c3s3_14 <- 1 - on_p2c3s3_14
  ds_p2c4s1_14 <- 1 - on_p2c4s1_14
  ds_p2c4s2_14 <- 1 - on_p2c4s2_14
  ds_p2c4s3_14 <- 1 - on_p2c4s3_14
  ds_p1c1s1_15 <- 1 - on_p1c1s1_15
  ds_p1c1s2_15 <- 1 - on_p1c1s2_15
  ds_p1c1s3_15 <- 1 - on_p1c1s3_15
  ds_p1c2s1_15 <- 1 - on_p1c2s1_15
  ds_p1c2s2_15 <- 1 - on_p1c2s2_15
  ds_p1c2s3_15 <- 1 - on_p1c2s3_15
  ds_p1c3s1_15 <- 1 - on_p1c3s1_15
  ds_p1c3s2_15 <- 1 - on_p1c3s2_15
  ds_p1c3s3_15 <- 1 - on_p1c3s3_15
  ds_p1c4s1_15 <- 1 - on_p1c4s1_15
  ds_p1c4s2_15 <- 1 - on_p1c4s2_15
  ds_p1c4s3_15 <- 1 - on_p1c4s3_15
  ds_p2c1s1_15 <- 1 - on_p2c1s1_15
  ds_p2c1s2_15 <- 1 - on_p2c1s2_15
  ds_p2c1s3_15 <- 1 - on_p2c1s3_15
  ds_p2c2s1_15 <- 1 - on_p2c2s1_15
  ds_p2c2s2_15 <- 1 - on_p2c2s2_15
  ds_p2c2s3_15 <- 1 - on_p2c2s3_15
  ds_p2c3s1_15 <- 1 - on_p2c3s1_15
  ds_p2c3s2_15 <- 1 - on_p2c3s2_15
  ds_p2c3s3_15 <- 1 - on_p2c3s3_15
  ds_p2c4s1_15 <- 1 - on_p2c4s1_15
  ds_p2c4s2_15 <- 1 - on_p2c4s2_15
  ds_p2c4s3_15 <- 1 - on_p2c4s3_15
  ds_p1c1s1_16 <- 1 - on_p1c1s1_16
  ds_p1c1s2_16 <- 1 - on_p1c1s2_16
  ds_p1c1s3_16 <- 1 - on_p1c1s3_16
  ds_p1c2s1_16 <- 1 - on_p1c2s1_16
  ds_p1c2s2_16 <- 1 - on_p1c2s2_16
  ds_p1c2s3_16 <- 1 - on_p1c2s3_16
  ds_p1c3s1_16 <- 1 - on_p1c3s1_16
  ds_p1c3s2_16 <- 1 - on_p1c3s2_16
  ds_p1c3s3_16 <- 1 - on_p1c3s3_16
  ds_p1c4s1_16 <- 1 - on_p1c4s1_16
  ds_p1c4s2_16 <- 1 - on_p1c4s2_16
  ds_p1c4s3_16 <- 1 - on_p1c4s3_16
  ds_p2c1s1_16 <- 1 - on_p2c1s1_16
  ds_p2c1s2_16 <- 1 - on_p2c1s2_16
  ds_p2c1s3_16 <- 1 - on_p2c1s3_16
  ds_p2c2s1_16 <- 1 - on_p2c2s1_16
  ds_p2c2s2_16 <- 1 - on_p2c2s2_16
  ds_p2c2s3_16 <- 1 - on_p2c2s3_16
  ds_p2c3s1_16 <- 1 - on_p2c3s1_16
  ds_p2c3s2_16 <- 1 - on_p2c3s2_16
  ds_p2c3s3_16 <- 1 - on_p2c3s3_16
  ds_p2c4s1_16 <- 1 - on_p2c4s1_16
  ds_p2c4s2_16 <- 1 - on_p2c4s2_16
  ds_p2c4s3_16 <- 1 - on_p2c4s3_16
  ds_p1c1s1_17 <- 1 - on_p1c1s1_17
  ds_p1c1s2_17 <- 1 - on_p1c1s2_17
  ds_p1c1s3_17 <- 1 - on_p1c1s3_17
  ds_p1c2s1_17 <- 1 - on_p1c2s1_17
  ds_p1c2s2_17 <- 1 - on_p1c2s2_17
  ds_p1c2s3_17 <- 1 - on_p1c2s3_17
  ds_p1c3s1_17 <- 1 - on_p1c3s1_17
  ds_p1c3s2_17 <- 1 - on_p1c3s2_17
  ds_p1c3s3_17 <- 1 - on_p1c3s3_17
  ds_p1c4s1_17 <- 1 - on_p1c4s1_17
  ds_p1c4s2_17 <- 1 - on_p1c4s2_17
  ds_p1c4s3_17 <- 1 - on_p1c4s3_17
  ds_p2c1s1_17 <- 1 - on_p2c1s1_17
  ds_p2c1s2_17 <- 1 - on_p2c1s2_17
  ds_p2c1s3_17 <- 1 - on_p2c1s3_17
  ds_p2c2s1_17 <- 1 - on_p2c2s1_17
  ds_p2c2s2_17 <- 1 - on_p2c2s2_17
  ds_p2c2s3_17 <- 1 - on_p2c2s3_17
  ds_p2c3s1_17 <- 1 - on_p2c3s1_17
  ds_p2c3s2_17 <- 1 - on_p2c3s2_17
  ds_p2c3s3_17 <- 1 - on_p2c3s3_17
  ds_p2c4s1_17 <- 1 - on_p2c4s1_17
  ds_p2c4s2_17 <- 1 - on_p2c4s2_17
  ds_p2c4s3_17 <- 1 - on_p2c4s3_17
  
  
  # j1j2_p1c1s1_10 <- (ss_p1c1s1j1_10+a_p1c1s1j1_10+miss_p1c1s1_10)*on_p1c1s1_10 + ds_p1c1s1_10
  # j2j3_p1c1s1_10 <- fte_p1c1s1_10
  # j3j4_p1c1s1_10 <- cs_p1c1s1_10
  # j4j3_p1c1s1_10 <- endcust10
  # j1j2_p1c1s2_10 <- (ss_p1c1s2j1_10+a_p1c1s2j1_10+miss_p1c1s2_10)*on_p1c1s2_10 + ds_p1c1s2_10
  # j2j3_p1c1s2_10 <- fte_p1c1s2_10
  # j3j4_p1c1s2_10 <- cs_p1c1s2_10
  # j4j3_p1c1s2_10 <- endcust10
  # j1j2_p1c1s3_10 <- (ss_p1c1s3j1_10+a_p1c1s3j1_10+miss_p1c1s3_10)*on_p1c1s3_10 + ds_p1c1s3_10
  # j2j3_p1c1s3_10 <- fte_p1c1s3_10
  # j3j4_p1c1s3_10 <- cs_p1c1s3_10
  # j4j3_p1c1s3_10 <- endcust10
  # j1j2_p1c2s1_10 <- (ss_p1c2s1j1_10+a_p1c2s1j1_10+miss_p1c2s1_10)*on_p1c2s1_10 + ds_p1c2s1_10
  # j2j3_p1c2s1_10 <- fte_p1c2s1_10
  # j3j4_p1c2s1_10 <- cs_p1c2s1_10
  # j4j3_p1c2s1_10 <- endcust10
  # j1j2_p1c2s2_10 <- (ss_p1c2s2j1_10+a_p1c2s2j1_10+miss_p1c2s2_10)*on_p1c2s2_10 + ds_p1c2s2_10
  # j2j3_p1c2s2_10 <- fte_p1c2s2_10
  # j3j4_p1c2s2_10 <- cs_p1c2s2_10
  # j4j3_p1c2s2_10 <- endcust10
  # j1j2_p1c2s3_10 <- (ss_p1c2s3j1_10+a_p1c2s3j1_10+miss_p1c2s3_10)*on_p1c2s3_10 + ds_p1c2s3_10
  # j2j3_p1c2s3_10 <- fte_p1c2s3_10
  # j3j4_p1c2s3_10 <- cs_p1c2s3_10
  # j4j3_p1c2s3_10 <- endcust10
  # j1j2_p1c3s1_10 <- (ss_p1c3s1j1_10+a_p1c3s1j1_10+miss_p1c3s1_10)*on_p1c3s1_10 + ds_p1c3s1_10
  # j2j3_p1c3s1_10 <- fte_p1c3s1_10
  # j3j4_p1c3s1_10 <- cs_p1c3s1_10
  # j4j3_p1c3s1_10 <- endcust10
  # j1j2_p1c3s2_10 <- (ss_p1c3s2j1_10+a_p1c3s2j1_10+miss_p1c3s2_10)*on_p1c3s2_10 + ds_p1c3s2_10
  # j2j3_p1c3s2_10 <- fte_p1c3s2_10
  # j3j4_p1c3s2_10 <- cs_p1c3s2_10
  # j4j3_p1c3s2_10 <- endcust10
  # j1j2_p1c3s3_10 <- (ss_p1c3s3j1_10+a_p1c3s3j1_10+miss_p1c3s3_10)*on_p1c3s3_10 + ds_p1c3s3_10
  # j2j3_p1c3s3_10 <- fte_p1c3s3_10
  # j3j4_p1c3s3_10 <- cs_p1c3s3_10
  # j4j3_p1c3s3_10 <- endcust10
  # j1j2_p1c4s1_10 <- (ss_p1c4s1j1_10+a_p1c4s1j1_10+miss_p1c4s1_10)*on_p1c4s1_10 + ds_p1c4s1_10
  # j2j3_p1c4s1_10 <- fte_p1c4s1_10
  # j3j4_p1c4s1_10 <- cs_p1c4s1_10
  # j4j3_p1c4s1_10 <- endcust10
  # j1j2_p1c4s2_10 <- (ss_p1c4s2j1_10+a_p1c4s2j1_10+miss_p1c4s2_10)*on_p1c4s2_10 + ds_p1c4s2_10
  # j2j3_p1c4s2_10 <- fte_p1c4s2_10
  # j3j4_p1c4s2_10 <- cs_p1c4s2_10
  # j4j3_p1c4s2_10 <- endcust10
  # j1j2_p1c4s3_10 <- (ss_p1c4s3j1_10+a_p1c4s3j1_10+miss_p1c4s3_10)*on_p1c4s3_10 + ds_p1c4s3_10
  # j2j3_p1c4s3_10 <- fte_p1c4s3_10
  # j3j4_p1c4s3_10 <- cs_p1c4s3_10
  # j4j3_p1c4s3_10 <- endcust10
  # j1j2_p2c1s1_10 <- (ss_p2c1s1j1_10+a_p2c1s1j1_10+miss_p2c1s1_10)*on_p2c1s1_10 + ds_p2c1s1_10
  # j2j3_p2c1s1_10 <- fte_p2c1s1_10
  # j3j4_p2c1s1_10 <- cs_p2c1s1_10
  # j4j3_p2c1s1_10 <- endcust10
  # j1j2_p2c1s2_10 <- (ss_p2c1s2j1_10+a_p2c1s2j1_10+miss_p2c1s2_10)*on_p2c1s2_10 + ds_p2c1s2_10
  # j2j3_p2c1s2_10 <- fte_p2c1s2_10
  # j3j4_p2c1s2_10 <- cs_p2c1s2_10
  # j4j3_p2c1s2_10 <- endcust10
  # j1j2_p2c1s3_10 <- (ss_p2c1s3j1_10+a_p2c1s3j1_10+miss_p2c1s3_10)*on_p2c1s3_10 + ds_p2c1s3_10
  # j2j3_p2c1s3_10 <- fte_p2c1s3_10
  # j3j4_p2c1s3_10 <- cs_p2c1s3_10
  # j4j3_p2c1s3_10 <- endcust10
  # j1j2_p2c2s1_10 <- (ss_p2c2s1j1_10+a_p2c2s1j1_10+miss_p2c2s1_10)*on_p2c2s1_10 + ds_p2c2s1_10
  # j2j3_p2c2s1_10 <- fte_p2c2s1_10
  # j3j4_p2c2s1_10 <- cs_p2c2s1_10
  # j4j3_p2c2s1_10 <- endcust10
  # j1j2_p2c2s2_10 <- (ss_p2c2s2j1_10+a_p2c2s2j1_10+miss_p2c2s2_10)*on_p2c2s2_10 + ds_p2c2s2_10
  # j2j3_p2c2s2_10 <- fte_p2c2s2_10
  # j3j4_p2c2s2_10 <- cs_p2c2s2_10
  # j4j3_p2c2s2_10 <- endcust10
  # j1j2_p2c2s3_10 <- (ss_p2c2s3j1_10+a_p2c2s3j1_10+miss_p2c2s3_10)*on_p2c2s3_10 + ds_p2c2s3_10
  # j2j3_p2c2s3_10 <- fte_p2c2s3_10
  # j3j4_p2c2s3_10 <- cs_p2c2s3_10
  # j4j3_p2c2s3_10 <- endcust10
  # j1j2_p2c3s1_10 <- (ss_p2c3s1j1_10+a_p2c3s1j1_10+miss_p2c3s1_10)*on_p2c3s1_10 + ds_p2c3s1_10
  # j2j3_p2c3s1_10 <- fte_p2c3s1_10
  # j3j4_p2c3s1_10 <- cs_p2c3s1_10
  # j4j3_p2c3s1_10 <- endcust10
  # j1j2_p2c3s2_10 <- (ss_p2c3s2j1_10+a_p2c3s2j1_10+miss_p2c3s2_10)*on_p2c3s2_10 + ds_p2c3s2_10
  # j2j3_p2c3s2_10 <- fte_p2c3s2_10
  # j3j4_p2c3s2_10 <- cs_p2c3s2_10
  # j4j3_p2c3s2_10 <- endcust10
  # j1j2_p2c3s3_10 <- (ss_p2c3s3j1_10+a_p2c3s3j1_10+miss_p2c3s3_10)*on_p2c3s3_10 + ds_p2c3s3_10
  # j2j3_p2c3s3_10 <- fte_p2c3s3_10
  # j3j4_p2c3s3_10 <- cs_p2c3s3_10
  # j4j3_p2c3s3_10 <- endcust10
  # j1j2_p2c4s1_10 <- (ss_p2c4s1j1_10+a_p2c4s1j1_10+miss_p2c4s1_10)*on_p2c4s1_10 + ds_p2c4s1_10
  # j2j3_p2c4s1_10 <- fte_p2c4s1_10
  # j3j4_p2c4s1_10 <- cs_p2c4s1_10
  # j4j3_p2c4s1_10 <- endcust10
  # j1j2_p2c4s2_10 <- (ss_p2c4s2j1_10+a_p2c4s2j1_10+miss_p2c4s2_10)*on_p2c4s2_10 + ds_p2c4s2_10
  # j2j3_p2c4s2_10 <- fte_p2c4s2_10
  # j3j4_p2c4s2_10 <- cs_p2c4s2_10
  # j4j3_p2c4s2_10 <- endcust10
  # j1j2_p2c4s3_10 <- (ss_p2c4s3j1_10+a_p2c4s3j1_10+miss_p2c4s3_10)*on_p2c4s3_10 + ds_p2c4s3_10
  # j2j3_p2c4s3_10 <- fte_p2c4s3_10
  # j3j4_p2c4s3_10 <- cs_p2c4s3_10
  # j4j3_p2c4s3_10 <- endcust10
  # j1j2_p1c1s1_11 <- (ss_p1c1s1j1_11+a_p1c1s1j1_11+miss_p1c1s1_11)*on_p1c1s1_11 + ds_p1c1s1_11
  # j2j3_p1c1s1_11 <- fte_p1c1s1_11
  # j3j4_p1c1s1_11 <- cs_p1c1s1_11
  # j4j3_p1c1s1_11 <- endcust11
  # j1j2_p1c1s2_11 <- (ss_p1c1s2j1_11+a_p1c1s2j1_11+miss_p1c1s2_11)*on_p1c1s2_11 + ds_p1c1s2_11
  # j2j3_p1c1s2_11 <- fte_p1c1s2_11
  # j3j4_p1c1s2_11 <- cs_p1c1s2_11
  # j4j3_p1c1s2_11 <- endcust11
  # j1j2_p1c1s3_11 <- (ss_p1c1s3j1_11+a_p1c1s3j1_11+miss_p1c1s3_11)*on_p1c1s3_11 + ds_p1c1s3_11
  # j2j3_p1c1s3_11 <- fte_p1c1s3_11
  # j3j4_p1c1s3_11 <- cs_p1c1s3_11
  # j4j3_p1c1s3_11 <- endcust11
  # j1j2_p1c2s1_11 <- (ss_p1c2s1j1_11+a_p1c2s1j1_11+miss_p1c2s1_11)*on_p1c2s1_11 + ds_p1c2s1_11
  # j2j3_p1c2s1_11 <- fte_p1c2s1_11
  # j3j4_p1c2s1_11 <- cs_p1c2s1_11
  # j4j3_p1c2s1_11 <- endcust11
  # j1j2_p1c2s2_11 <- (ss_p1c2s2j1_11+a_p1c2s2j1_11+miss_p1c2s2_11)*on_p1c2s2_11 + ds_p1c2s2_11
  # j2j3_p1c2s2_11 <- fte_p1c2s2_11
  # j3j4_p1c2s2_11 <- cs_p1c2s2_11
  # j4j3_p1c2s2_11 <- endcust11
  # j1j2_p1c2s3_11 <- (ss_p1c2s3j1_11+a_p1c2s3j1_11+miss_p1c2s3_11)*on_p1c2s3_11 + ds_p1c2s3_11
  # j2j3_p1c2s3_11 <- fte_p1c2s3_11
  # j3j4_p1c2s3_11 <- cs_p1c2s3_11
  # j4j3_p1c2s3_11 <- endcust11
  # j1j2_p1c3s1_11 <- (ss_p1c3s1j1_11+a_p1c3s1j1_11+miss_p1c3s1_11)*on_p1c3s1_11 + ds_p1c3s1_11
  # j2j3_p1c3s1_11 <- fte_p1c3s1_11
  # j3j4_p1c3s1_11 <- cs_p1c3s1_11
  # j4j3_p1c3s1_11 <- endcust11
  # j1j2_p1c3s2_11 <- (ss_p1c3s2j1_11+a_p1c3s2j1_11+miss_p1c3s2_11)*on_p1c3s2_11 + ds_p1c3s2_11
  # j2j3_p1c3s2_11 <- fte_p1c3s2_11
  # j3j4_p1c3s2_11 <- cs_p1c3s2_11
  # j4j3_p1c3s2_11 <- endcust11
  # j1j2_p1c3s3_11 <- (ss_p1c3s3j1_11+a_p1c3s3j1_11+miss_p1c3s3_11)*on_p1c3s3_11 + ds_p1c3s3_11
  # j2j3_p1c3s3_11 <- fte_p1c3s3_11
  # j3j4_p1c3s3_11 <- cs_p1c3s3_11
  # j4j3_p1c3s3_11 <- endcust11
  # j1j2_p1c4s1_11 <- (ss_p1c4s1j1_11+a_p1c4s1j1_11+miss_p1c4s1_11)*on_p1c4s1_11 + ds_p1c4s1_11
  # j2j3_p1c4s1_11 <- fte_p1c4s1_11
  # j3j4_p1c4s1_11 <- cs_p1c4s1_11
  # j4j3_p1c4s1_11 <- endcust11
  # j1j2_p1c4s2_11 <- (ss_p1c4s2j1_11+a_p1c4s2j1_11+miss_p1c4s2_11)*on_p1c4s2_11 + ds_p1c4s2_11
  # j2j3_p1c4s2_11 <- fte_p1c4s2_11
  # j3j4_p1c4s2_11 <- cs_p1c4s2_11
  # j4j3_p1c4s2_11 <- endcust11
  # j1j2_p1c4s3_11 <- (ss_p1c4s3j1_11+a_p1c4s3j1_11+miss_p1c4s3_11)*on_p1c4s3_11 + ds_p1c4s3_11
  # j2j3_p1c4s3_11 <- fte_p1c4s3_11
  # j3j4_p1c4s3_11 <- cs_p1c4s3_11
  # j4j3_p1c4s3_11 <- endcust11
  # j1j2_p2c1s1_11 <- (ss_p2c1s1j1_11+a_p2c1s1j1_11+miss_p2c1s1_11)*on_p2c1s1_11 + ds_p2c1s1_11
  # j2j3_p2c1s1_11 <- fte_p2c1s1_11
  # j3j4_p2c1s1_11 <- cs_p2c1s1_11
  # j4j3_p2c1s1_11 <- endcust11
  # j1j2_p2c1s2_11 <- (ss_p2c1s2j1_11+a_p2c1s2j1_11+miss_p2c1s2_11)*on_p2c1s2_11 + ds_p2c1s2_11
  # j2j3_p2c1s2_11 <- fte_p2c1s2_11
  # j3j4_p2c1s2_11 <- cs_p2c1s2_11
  # j4j3_p2c1s2_11 <- endcust11
  # j1j2_p2c1s3_11 <- (ss_p2c1s3j1_11+a_p2c1s3j1_11+miss_p2c1s3_11)*on_p2c1s3_11 + ds_p2c1s3_11
  # j2j3_p2c1s3_11 <- fte_p2c1s3_11
  # j3j4_p2c1s3_11 <- cs_p2c1s3_11
  # j4j3_p2c1s3_11 <- endcust11
  # j1j2_p2c2s1_11 <- (ss_p2c2s1j1_11+a_p2c2s1j1_11+miss_p2c2s1_11)*on_p2c2s1_11 + ds_p2c2s1_11
  # j2j3_p2c2s1_11 <- fte_p2c2s1_11
  # j3j4_p2c2s1_11 <- cs_p2c2s1_11
  # j4j3_p2c2s1_11 <- endcust11
  # j1j2_p2c2s2_11 <- (ss_p2c2s2j1_11+a_p2c2s2j1_11+miss_p2c2s2_11)*on_p2c2s2_11 + ds_p2c2s2_11
  # j2j3_p2c2s2_11 <- fte_p2c2s2_11
  # j3j4_p2c2s2_11 <- cs_p2c2s2_11
  # j4j3_p2c2s2_11 <- endcust11
  # j1j2_p2c2s3_11 <- (ss_p2c2s3j1_11+a_p2c2s3j1_11+miss_p2c2s3_11)*on_p2c2s3_11 + ds_p2c2s3_11
  # j2j3_p2c2s3_11 <- fte_p2c2s3_11
  # j3j4_p2c2s3_11 <- cs_p2c2s3_11
  # j4j3_p2c2s3_11 <- endcust11
  # j1j2_p2c3s1_11 <- (ss_p2c3s1j1_11+a_p2c3s1j1_11+miss_p2c3s1_11)*on_p2c3s1_11 + ds_p2c3s1_11
  # j2j3_p2c3s1_11 <- fte_p2c3s1_11
  # j3j4_p2c3s1_11 <- cs_p2c3s1_11
  # j4j3_p2c3s1_11 <- endcust11
  # j1j2_p2c3s2_11 <- (ss_p2c3s2j1_11+a_p2c3s2j1_11+miss_p2c3s2_11)*on_p2c3s2_11 + ds_p2c3s2_11
  # j2j3_p2c3s2_11 <- fte_p2c3s2_11
  # j3j4_p2c3s2_11 <- cs_p2c3s2_11
  # j4j3_p2c3s2_11 <- endcust11
  # j1j2_p2c3s3_11 <- (ss_p2c3s3j1_11+a_p2c3s3j1_11+miss_p2c3s3_11)*on_p2c3s3_11 + ds_p2c3s3_11
  # j2j3_p2c3s3_11 <- fte_p2c3s3_11
  # j3j4_p2c3s3_11 <- cs_p2c3s3_11
  # j4j3_p2c3s3_11 <- endcust11
  # j1j2_p2c4s1_11 <- (ss_p2c4s1j1_11+a_p2c4s1j1_11+miss_p2c4s1_11)*on_p2c4s1_11 + ds_p2c4s1_11
  # j2j3_p2c4s1_11 <- fte_p2c4s1_11
  # j3j4_p2c4s1_11 <- cs_p2c4s1_11
  # j4j3_p2c4s1_11 <- endcust11
  # j1j2_p2c4s2_11 <- (ss_p2c4s2j1_11+a_p2c4s2j1_11+miss_p2c4s2_11)*on_p2c4s2_11 + ds_p2c4s2_11
  # j2j3_p2c4s2_11 <- fte_p2c4s2_11
  # j3j4_p2c4s2_11 <- cs_p2c4s2_11
  # j4j3_p2c4s2_11 <- endcust11
  # j1j2_p2c4s3_11 <- (ss_p2c4s3j1_11+a_p2c4s3j1_11+miss_p2c4s3_11)*on_p2c4s3_11 + ds_p2c4s3_11
  # j2j3_p2c4s3_11 <- fte_p2c4s3_11
  # j3j4_p2c4s3_11 <- cs_p2c4s3_11
  # j4j3_p2c4s3_11 <- endcust11
  # j1j2_p1c1s1_12 <- (ss_p1c1s1j1_12+a_p1c1s1j1_12+miss_p1c1s1_12)*on_p1c1s1_12 + ds_p1c1s1_12
  # j2j3_p1c1s1_12 <- fte_p1c1s1_12
  # j3j4_p1c1s1_12 <- cs_p1c1s1_12
  # j4j3_p1c1s1_12 <- endcust12
  # j1j2_p1c1s2_12 <- (ss_p1c1s2j1_12+a_p1c1s2j1_12+miss_p1c1s2_12)*on_p1c1s2_12 + ds_p1c1s2_12
  # j2j3_p1c1s2_12 <- fte_p1c1s2_12
  # j3j4_p1c1s2_12 <- cs_p1c1s2_12
  # j4j3_p1c1s2_12 <- endcust12
  # j1j2_p1c1s3_12 <- (ss_p1c1s3j1_12+a_p1c1s3j1_12+miss_p1c1s3_12)*on_p1c1s3_12 + ds_p1c1s3_12
  # j2j3_p1c1s3_12 <- fte_p1c1s3_12
  # j3j4_p1c1s3_12 <- cs_p1c1s3_12
  # j4j3_p1c1s3_12 <- endcust12
  # j1j2_p1c2s1_12 <- (ss_p1c2s1j1_12+a_p1c2s1j1_12+miss_p1c2s1_12)*on_p1c2s1_12 + ds_p1c2s1_12
  # j2j3_p1c2s1_12 <- fte_p1c2s1_12
  # j3j4_p1c2s1_12 <- cs_p1c2s1_12
  # j4j3_p1c2s1_12 <- endcust12
  # j1j2_p1c2s2_12 <- (ss_p1c2s2j1_12+a_p1c2s2j1_12+miss_p1c2s2_12)*on_p1c2s2_12 + ds_p1c2s2_12
  # j2j3_p1c2s2_12 <- fte_p1c2s2_12
  # j3j4_p1c2s2_12 <- cs_p1c2s2_12
  # j4j3_p1c2s2_12 <- endcust12
  # j1j2_p1c2s3_12 <- (ss_p1c2s3j1_12+a_p1c2s3j1_12+miss_p1c2s3_12)*on_p1c2s3_12 + ds_p1c2s3_12
  # j2j3_p1c2s3_12 <- fte_p1c2s3_12
  # j3j4_p1c2s3_12 <- cs_p1c2s3_12
  # j4j3_p1c2s3_12 <- endcust12
  # j1j2_p1c3s1_12 <- (ss_p1c3s1j1_12+a_p1c3s1j1_12+miss_p1c3s1_12)*on_p1c3s1_12 + ds_p1c3s1_12
  # j2j3_p1c3s1_12 <- fte_p1c3s1_12
  # j3j4_p1c3s1_12 <- cs_p1c3s1_12
  # j4j3_p1c3s1_12 <- endcust12
  # j1j2_p1c3s2_12 <- (ss_p1c3s2j1_12+a_p1c3s2j1_12+miss_p1c3s2_12)*on_p1c3s2_12 + ds_p1c3s2_12
  # j2j3_p1c3s2_12 <- fte_p1c3s2_12
  # j3j4_p1c3s2_12 <- cs_p1c3s2_12
  # j4j3_p1c3s2_12 <- endcust12
  # j1j2_p1c3s3_12 <- (ss_p1c3s3j1_12+a_p1c3s3j1_12+miss_p1c3s3_12)*on_p1c3s3_12 + ds_p1c3s3_12
  # j2j3_p1c3s3_12 <- fte_p1c3s3_12
  # j3j4_p1c3s3_12 <- cs_p1c3s3_12
  # j4j3_p1c3s3_12 <- endcust12
  # j1j2_p1c4s1_12 <- (ss_p1c4s1j1_12+a_p1c4s1j1_12+miss_p1c4s1_12)*on_p1c4s1_12 + ds_p1c4s1_12
  # j2j3_p1c4s1_12 <- fte_p1c4s1_12
  # j3j4_p1c4s1_12 <- cs_p1c4s1_12
  # j4j3_p1c4s1_12 <- endcust12
  # j1j2_p1c4s2_12 <- (ss_p1c4s2j1_12+a_p1c4s2j1_12+miss_p1c4s2_12)*on_p1c4s2_12 + ds_p1c4s2_12
  # j2j3_p1c4s2_12 <- fte_p1c4s2_12
  # j3j4_p1c4s2_12 <- cs_p1c4s2_12
  # j4j3_p1c4s2_12 <- endcust12
  # j1j2_p1c4s3_12 <- (ss_p1c4s3j1_12+a_p1c4s3j1_12+miss_p1c4s3_12)*on_p1c4s3_12 + ds_p1c4s3_12
  # j2j3_p1c4s3_12 <- fte_p1c4s3_12
  # j3j4_p1c4s3_12 <- cs_p1c4s3_12
  # j4j3_p1c4s3_12 <- endcust12
  # j1j2_p2c1s1_12 <- (ss_p2c1s1j1_12+a_p2c1s1j1_12+miss_p2c1s1_12)*on_p2c1s1_12 + ds_p2c1s1_12
  # j2j3_p2c1s1_12 <- fte_p2c1s1_12
  # j3j4_p2c1s1_12 <- cs_p2c1s1_12
  # j4j3_p2c1s1_12 <- endcust12
  # j1j2_p2c1s2_12 <- (ss_p2c1s2j1_12+a_p2c1s2j1_12+miss_p2c1s2_12)*on_p2c1s2_12 + ds_p2c1s2_12
  # j2j3_p2c1s2_12 <- fte_p2c1s2_12
  # j3j4_p2c1s2_12 <- cs_p2c1s2_12
  # j4j3_p2c1s2_12 <- endcust12
  # j1j2_p2c1s3_12 <- (ss_p2c1s3j1_12+a_p2c1s3j1_12+miss_p2c1s3_12)*on_p2c1s3_12 + ds_p2c1s3_12
  # j2j3_p2c1s3_12 <- fte_p2c1s3_12
  # j3j4_p2c1s3_12 <- cs_p2c1s3_12
  # j4j3_p2c1s3_12 <- endcust12
  # j1j2_p2c2s1_12 <- (ss_p2c2s1j1_12+a_p2c2s1j1_12+miss_p2c2s1_12)*on_p2c2s1_12 + ds_p2c2s1_12
  # j2j3_p2c2s1_12 <- fte_p2c2s1_12
  # j3j4_p2c2s1_12 <- cs_p2c2s1_12
  # j4j3_p2c2s1_12 <- endcust12
  # j1j2_p2c2s2_12 <- (ss_p2c2s2j1_12+a_p2c2s2j1_12+miss_p2c2s2_12)*on_p2c2s2_12 + ds_p2c2s2_12
  # j2j3_p2c2s2_12 <- fte_p2c2s2_12
  # j3j4_p2c2s2_12 <- cs_p2c2s2_12
  # j4j3_p2c2s2_12 <- endcust12
  # j1j2_p2c2s3_12 <- (ss_p2c2s3j1_12+a_p2c2s3j1_12+miss_p2c2s3_12)*on_p2c2s3_12 + ds_p2c2s3_12
  # j2j3_p2c2s3_12 <- fte_p2c2s3_12
  # j3j4_p2c2s3_12 <- cs_p2c2s3_12
  # j4j3_p2c2s3_12 <- endcust12
  # j1j2_p2c3s1_12 <- (ss_p2c3s1j1_12+a_p2c3s1j1_12+miss_p2c3s1_12)*on_p2c3s1_12 + ds_p2c3s1_12
  # j2j3_p2c3s1_12 <- fte_p2c3s1_12
  # j3j4_p2c3s1_12 <- cs_p2c3s1_12
  # j4j3_p2c3s1_12 <- endcust12
  # j1j2_p2c3s2_12 <- (ss_p2c3s2j1_12+a_p2c3s2j1_12+miss_p2c3s2_12)*on_p2c3s2_12 + ds_p2c3s2_12
  # j2j3_p2c3s2_12 <- fte_p2c3s2_12
  # j3j4_p2c3s2_12 <- cs_p2c3s2_12
  # j4j3_p2c3s2_12 <- endcust12
  # j1j2_p2c3s3_12 <- (ss_p2c3s3j1_12+a_p2c3s3j1_12+miss_p2c3s3_12)*on_p2c3s3_12 + ds_p2c3s3_12
  # j2j3_p2c3s3_12 <- fte_p2c3s3_12
  # j3j4_p2c3s3_12 <- cs_p2c3s3_12
  # j4j3_p2c3s3_12 <- endcust12
  # j1j2_p2c4s1_12 <- (ss_p2c4s1j1_12+a_p2c4s1j1_12+miss_p2c4s1_12)*on_p2c4s1_12 + ds_p2c4s1_12
  # j2j3_p2c4s1_12 <- fte_p2c4s1_12
  # j3j4_p2c4s1_12 <- cs_p2c4s1_12
  # j4j3_p2c4s1_12 <- endcust12
  # j1j2_p2c4s2_12 <- (ss_p2c4s2j1_12+a_p2c4s2j1_12+miss_p2c4s2_12)*on_p2c4s2_12 + ds_p2c4s2_12
  # j2j3_p2c4s2_12 <- fte_p2c4s2_12
  # j3j4_p2c4s2_12 <- cs_p2c4s2_12
  # j4j3_p2c4s2_12 <- endcust12
  # j1j2_p2c4s3_12 <- (ss_p2c4s3j1_12+a_p2c4s3j1_12+miss_p2c4s3_12)*on_p2c4s3_12 + ds_p2c4s3_12
  # j2j3_p2c4s3_12 <- fte_p2c4s3_12
  # j3j4_p2c4s3_12 <- cs_p2c4s3_12
  # j4j3_p2c4s3_12 <- endcust12
  # j1j2_p1c1s1_13 <- (ss_p1c1s1j1_13+a_p1c1s1j1_13+miss_p1c1s1_13)*on_p1c1s1_13 + ds_p1c1s1_13
  # j2j3_p1c1s1_13 <- fte_p1c1s1_13
  # j3j4_p1c1s1_13 <- cs_p1c1s1_13
  # j4j3_p1c1s1_13 <- endcust13
  # j1j2_p1c1s2_13 <- (ss_p1c1s2j1_13+a_p1c1s2j1_13+miss_p1c1s2_13)*on_p1c1s2_13 + ds_p1c1s2_13
  # j2j3_p1c1s2_13 <- fte_p1c1s2_13
  # j3j4_p1c1s2_13 <- cs_p1c1s2_13
  # j4j3_p1c1s2_13 <- endcust13
  # j1j2_p1c1s3_13 <- (ss_p1c1s3j1_13+a_p1c1s3j1_13+miss_p1c1s3_13)*on_p1c1s3_13 + ds_p1c1s3_13
  # j2j3_p1c1s3_13 <- fte_p1c1s3_13
  # j3j4_p1c1s3_13 <- cs_p1c1s3_13
  # j4j3_p1c1s3_13 <- endcust13
  # j1j2_p1c2s1_13 <- (ss_p1c2s1j1_13+a_p1c2s1j1_13+miss_p1c2s1_13)*on_p1c2s1_13 + ds_p1c2s1_13
  # j2j3_p1c2s1_13 <- fte_p1c2s1_13
  # j3j4_p1c2s1_13 <- cs_p1c2s1_13
  # j4j3_p1c2s1_13 <- endcust13
  # j1j2_p1c2s2_13 <- (ss_p1c2s2j1_13+a_p1c2s2j1_13+miss_p1c2s2_13)*on_p1c2s2_13 + ds_p1c2s2_13
  # j2j3_p1c2s2_13 <- fte_p1c2s2_13
  # j3j4_p1c2s2_13 <- cs_p1c2s2_13
  # j4j3_p1c2s2_13 <- endcust13
  # j1j2_p1c2s3_13 <- (ss_p1c2s3j1_13+a_p1c2s3j1_13+miss_p1c2s3_13)*on_p1c2s3_13 + ds_p1c2s3_13
  # j2j3_p1c2s3_13 <- fte_p1c2s3_13
  # j3j4_p1c2s3_13 <- cs_p1c2s3_13
  # j4j3_p1c2s3_13 <- endcust13
  # j1j2_p1c3s1_13 <- (ss_p1c3s1j1_13+a_p1c3s1j1_13+miss_p1c3s1_13)*on_p1c3s1_13 + ds_p1c3s1_13
  # j2j3_p1c3s1_13 <- fte_p1c3s1_13
  # j3j4_p1c3s1_13 <- cs_p1c3s1_13
  # j4j3_p1c3s1_13 <- endcust13
  # j1j2_p1c3s2_13 <- (ss_p1c3s2j1_13+a_p1c3s2j1_13+miss_p1c3s2_13)*on_p1c3s2_13 + ds_p1c3s2_13
  # j2j3_p1c3s2_13 <- fte_p1c3s2_13
  # j3j4_p1c3s2_13 <- cs_p1c3s2_13
  # j4j3_p1c3s2_13 <- endcust13
  # j1j2_p1c3s3_13 <- (ss_p1c3s3j1_13+a_p1c3s3j1_13+miss_p1c3s3_13)*on_p1c3s3_13 + ds_p1c3s3_13
  # j2j3_p1c3s3_13 <- fte_p1c3s3_13
  # j3j4_p1c3s3_13 <- cs_p1c3s3_13
  # j4j3_p1c3s3_13 <- endcust13
  # j1j2_p1c4s1_13 <- (ss_p1c4s1j1_13+a_p1c4s1j1_13+miss_p1c4s1_13)*on_p1c4s1_13 + ds_p1c4s1_13
  # j2j3_p1c4s1_13 <- fte_p1c4s1_13
  # j3j4_p1c4s1_13 <- cs_p1c4s1_13
  # j4j3_p1c4s1_13 <- endcust13
  # j1j2_p1c4s2_13 <- (ss_p1c4s2j1_13+a_p1c4s2j1_13+miss_p1c4s2_13)*on_p1c4s2_13 + ds_p1c4s2_13
  # j2j3_p1c4s2_13 <- fte_p1c4s2_13
  # j3j4_p1c4s2_13 <- cs_p1c4s2_13
  # j4j3_p1c4s2_13 <- endcust13
  # j1j2_p1c4s3_13 <- (ss_p1c4s3j1_13+a_p1c4s3j1_13+miss_p1c4s3_13)*on_p1c4s3_13 + ds_p1c4s3_13
  # j2j3_p1c4s3_13 <- fte_p1c4s3_13
  # j3j4_p1c4s3_13 <- cs_p1c4s3_13
  # j4j3_p1c4s3_13 <- endcust13
  # j1j2_p2c1s1_13 <- (ss_p2c1s1j1_13+a_p2c1s1j1_13+miss_p2c1s1_13)*on_p2c1s1_13 + ds_p2c1s1_13
  # j2j3_p2c1s1_13 <- fte_p2c1s1_13
  # j3j4_p2c1s1_13 <- cs_p2c1s1_13
  # j4j3_p2c1s1_13 <- endcust13
  # j1j2_p2c1s2_13 <- (ss_p2c1s2j1_13+a_p2c1s2j1_13+miss_p2c1s2_13)*on_p2c1s2_13 + ds_p2c1s2_13
  # j2j3_p2c1s2_13 <- fte_p2c1s2_13
  # j3j4_p2c1s2_13 <- cs_p2c1s2_13
  # j4j3_p2c1s2_13 <- endcust13
  # j1j2_p2c1s3_13 <- (ss_p2c1s3j1_13+a_p2c1s3j1_13+miss_p2c1s3_13)*on_p2c1s3_13 + ds_p2c1s3_13
  # j2j3_p2c1s3_13 <- fte_p2c1s3_13
  # j3j4_p2c1s3_13 <- cs_p2c1s3_13
  # j4j3_p2c1s3_13 <- endcust13
  # j1j2_p2c2s1_13 <- (ss_p2c2s1j1_13+a_p2c2s1j1_13+miss_p2c2s1_13)*on_p2c2s1_13 + ds_p2c2s1_13
  # j2j3_p2c2s1_13 <- fte_p2c2s1_13
  # j3j4_p2c2s1_13 <- cs_p2c2s1_13
  # j4j3_p2c2s1_13 <- endcust13
  # j1j2_p2c2s2_13 <- (ss_p2c2s2j1_13+a_p2c2s2j1_13+miss_p2c2s2_13)*on_p2c2s2_13 + ds_p2c2s2_13
  # j2j3_p2c2s2_13 <- fte_p2c2s2_13
  # j3j4_p2c2s2_13 <- cs_p2c2s2_13
  # j4j3_p2c2s2_13 <- endcust13
  # j1j2_p2c2s3_13 <- (ss_p2c2s3j1_13+a_p2c2s3j1_13+miss_p2c2s3_13)*on_p2c2s3_13 + ds_p2c2s3_13
  # j2j3_p2c2s3_13 <- fte_p2c2s3_13
  # j3j4_p2c2s3_13 <- cs_p2c2s3_13
  # j4j3_p2c2s3_13 <- endcust13
  # j1j2_p2c3s1_13 <- (ss_p2c3s1j1_13+a_p2c3s1j1_13+miss_p2c3s1_13)*on_p2c3s1_13 + ds_p2c3s1_13
  # j2j3_p2c3s1_13 <- fte_p2c3s1_13
  # j3j4_p2c3s1_13 <- cs_p2c3s1_13
  # j4j3_p2c3s1_13 <- endcust13
  # j1j2_p2c3s2_13 <- (ss_p2c3s2j1_13+a_p2c3s2j1_13+miss_p2c3s2_13)*on_p2c3s2_13 + ds_p2c3s2_13
  # j2j3_p2c3s2_13 <- fte_p2c3s2_13
  # j3j4_p2c3s2_13 <- cs_p2c3s2_13
  # j4j3_p2c3s2_13 <- endcust13
  # j1j2_p2c3s3_13 <- (ss_p2c3s3j1_13+a_p2c3s3j1_13+miss_p2c3s3_13)*on_p2c3s3_13 + ds_p2c3s3_13
  # j2j3_p2c3s3_13 <- fte_p2c3s3_13
  # j3j4_p2c3s3_13 <- cs_p2c3s3_13
  # j4j3_p2c3s3_13 <- endcust13
  # j1j2_p2c4s1_13 <- (ss_p2c4s1j1_13+a_p2c4s1j1_13+miss_p2c4s1_13)*on_p2c4s1_13 + ds_p2c4s1_13
  # j2j3_p2c4s1_13 <- fte_p2c4s1_13
  # j3j4_p2c4s1_13 <- cs_p2c4s1_13
  # j4j3_p2c4s1_13 <- endcust13
  # j1j2_p2c4s2_13 <- (ss_p2c4s2j1_13+a_p2c4s2j1_13+miss_p2c4s2_13)*on_p2c4s2_13 + ds_p2c4s2_13
  # j2j3_p2c4s2_13 <- fte_p2c4s2_13
  # j3j4_p2c4s2_13 <- cs_p2c4s2_13
  # j4j3_p2c4s2_13 <- endcust13
  # j1j2_p2c4s3_13 <- (ss_p2c4s3j1_13+a_p2c4s3j1_13+miss_p2c4s3_13)*on_p2c4s3_13 + ds_p2c4s3_13
  # j2j3_p2c4s3_13 <- fte_p2c4s3_13
  # j3j4_p2c4s3_13 <- cs_p2c4s3_13
  # j4j3_p2c4s3_13 <- endcust13
  # j1j2_p1c1s1_14 <- (ss_p1c1s1j1_14+a_p1c1s1j1_14+miss_p1c1s1_14)*on_p1c1s1_14 + ds_p1c1s1_14
  # j2j3_p1c1s1_14 <- fte_p1c1s1_14
  # j3j4_p1c1s1_14 <- cs_p1c1s1_14
  # j4j3_p1c1s1_14 <- endcust14
  # j1j2_p1c1s2_14 <- (ss_p1c1s2j1_14+a_p1c1s2j1_14+miss_p1c1s2_14)*on_p1c1s2_14 + ds_p1c1s2_14
  # j2j3_p1c1s2_14 <- fte_p1c1s2_14
  # j3j4_p1c1s2_14 <- cs_p1c1s2_14
  # j4j3_p1c1s2_14 <- endcust14
  # j1j2_p1c1s3_14 <- (ss_p1c1s3j1_14+a_p1c1s3j1_14+miss_p1c1s3_14)*on_p1c1s3_14 + ds_p1c1s3_14
  # j2j3_p1c1s3_14 <- fte_p1c1s3_14
  # j3j4_p1c1s3_14 <- cs_p1c1s3_14
  # j4j3_p1c1s3_14 <- endcust14
  # j1j2_p1c2s1_14 <- (ss_p1c2s1j1_14+a_p1c2s1j1_14+miss_p1c2s1_14)*on_p1c2s1_14 + ds_p1c2s1_14
  # j2j3_p1c2s1_14 <- fte_p1c2s1_14
  # j3j4_p1c2s1_14 <- cs_p1c2s1_14
  # j4j3_p1c2s1_14 <- endcust14
  # j1j2_p1c2s2_14 <- (ss_p1c2s2j1_14+a_p1c2s2j1_14+miss_p1c2s2_14)*on_p1c2s2_14 + ds_p1c2s2_14
  # j2j3_p1c2s2_14 <- fte_p1c2s2_14
  # j3j4_p1c2s2_14 <- cs_p1c2s2_14
  # j4j3_p1c2s2_14 <- endcust14
  # j1j2_p1c2s3_14 <- (ss_p1c2s3j1_14+a_p1c2s3j1_14+miss_p1c2s3_14)*on_p1c2s3_14 + ds_p1c2s3_14
  # j2j3_p1c2s3_14 <- fte_p1c2s3_14
  # j3j4_p1c2s3_14 <- cs_p1c2s3_14
  # j4j3_p1c2s3_14 <- endcust14
  # j1j2_p1c3s1_14 <- (ss_p1c3s1j1_14+a_p1c3s1j1_14+miss_p1c3s1_14)*on_p1c3s1_14 + ds_p1c3s1_14
  # j2j3_p1c3s1_14 <- fte_p1c3s1_14
  # j3j4_p1c3s1_14 <- cs_p1c3s1_14
  # j4j3_p1c3s1_14 <- endcust14
  # j1j2_p1c3s2_14 <- (ss_p1c3s2j1_14+a_p1c3s2j1_14+miss_p1c3s2_14)*on_p1c3s2_14 + ds_p1c3s2_14
  # j2j3_p1c3s2_14 <- fte_p1c3s2_14
  # j3j4_p1c3s2_14 <- cs_p1c3s2_14
  # j4j3_p1c3s2_14 <- endcust14
  # j1j2_p1c3s3_14 <- (ss_p1c3s3j1_14+a_p1c3s3j1_14+miss_p1c3s3_14)*on_p1c3s3_14 + ds_p1c3s3_14
  # j2j3_p1c3s3_14 <- fte_p1c3s3_14
  # j3j4_p1c3s3_14 <- cs_p1c3s3_14
  # j4j3_p1c3s3_14 <- endcust14
  # j1j2_p1c4s1_14 <- (ss_p1c4s1j1_14+a_p1c4s1j1_14+miss_p1c4s1_14)*on_p1c4s1_14 + ds_p1c4s1_14
  # j2j3_p1c4s1_14 <- fte_p1c4s1_14
  # j3j4_p1c4s1_14 <- cs_p1c4s1_14
  # j4j3_p1c4s1_14 <- endcust14
  # j1j2_p1c4s2_14 <- (ss_p1c4s2j1_14+a_p1c4s2j1_14+miss_p1c4s2_14)*on_p1c4s2_14 + ds_p1c4s2_14
  # j2j3_p1c4s2_14 <- fte_p1c4s2_14
  # j3j4_p1c4s2_14 <- cs_p1c4s2_14
  # j4j3_p1c4s2_14 <- endcust14
  # j1j2_p1c4s3_14 <- (ss_p1c4s3j1_14+a_p1c4s3j1_14+miss_p1c4s3_14)*on_p1c4s3_14 + ds_p1c4s3_14
  # j2j3_p1c4s3_14 <- fte_p1c4s3_14
  # j3j4_p1c4s3_14 <- cs_p1c4s3_14
  # j4j3_p1c4s3_14 <- endcust14
  # j1j2_p2c1s1_14 <- (ss_p2c1s1j1_14+a_p2c1s1j1_14+miss_p2c1s1_14)*on_p2c1s1_14 + ds_p2c1s1_14
  # j2j3_p2c1s1_14 <- fte_p2c1s1_14
  # j3j4_p2c1s1_14 <- cs_p2c1s1_14
  # j4j3_p2c1s1_14 <- endcust14
  # j1j2_p2c1s2_14 <- (ss_p2c1s2j1_14+a_p2c1s2j1_14+miss_p2c1s2_14)*on_p2c1s2_14 + ds_p2c1s2_14
  # j2j3_p2c1s2_14 <- fte_p2c1s2_14
  # j3j4_p2c1s2_14 <- cs_p2c1s2_14
  # j4j3_p2c1s2_14 <- endcust14
  # j1j2_p2c1s3_14 <- (ss_p2c1s3j1_14+a_p2c1s3j1_14+miss_p2c1s3_14)*on_p2c1s3_14 + ds_p2c1s3_14
  # j2j3_p2c1s3_14 <- fte_p2c1s3_14
  # j3j4_p2c1s3_14 <- cs_p2c1s3_14
  # j4j3_p2c1s3_14 <- endcust14
  # j1j2_p2c2s1_14 <- (ss_p2c2s1j1_14+a_p2c2s1j1_14+miss_p2c2s1_14)*on_p2c2s1_14 + ds_p2c2s1_14
  # j2j3_p2c2s1_14 <- fte_p2c2s1_14
  # j3j4_p2c2s1_14 <- cs_p2c2s1_14
  # j4j3_p2c2s1_14 <- endcust14
  # j1j2_p2c2s2_14 <- (ss_p2c2s2j1_14+a_p2c2s2j1_14+miss_p2c2s2_14)*on_p2c2s2_14 + ds_p2c2s2_14
  # j2j3_p2c2s2_14 <- fte_p2c2s2_14
  # j3j4_p2c2s2_14 <- cs_p2c2s2_14
  # j4j3_p2c2s2_14 <- endcust14
  # j1j2_p2c2s3_14 <- (ss_p2c2s3j1_14+a_p2c2s3j1_14+miss_p2c2s3_14)*on_p2c2s3_14 + ds_p2c2s3_14
  # j2j3_p2c2s3_14 <- fte_p2c2s3_14
  # j3j4_p2c2s3_14 <- cs_p2c2s3_14
  # j4j3_p2c2s3_14 <- endcust14
  # j1j2_p2c3s1_14 <- (ss_p2c3s1j1_14+a_p2c3s1j1_14+miss_p2c3s1_14)*on_p2c3s1_14 + ds_p2c3s1_14
  # j2j3_p2c3s1_14 <- fte_p2c3s1_14
  # j3j4_p2c3s1_14 <- cs_p2c3s1_14
  # j4j3_p2c3s1_14 <- endcust14
  # j1j2_p2c3s2_14 <- (ss_p2c3s2j1_14+a_p2c3s2j1_14+miss_p2c3s2_14)*on_p2c3s2_14 + ds_p2c3s2_14
  # j2j3_p2c3s2_14 <- fte_p2c3s2_14
  # j3j4_p2c3s2_14 <- cs_p2c3s2_14
  # j4j3_p2c3s2_14 <- endcust14
  # j1j2_p2c3s3_14 <- (ss_p2c3s3j1_14+a_p2c3s3j1_14+miss_p2c3s3_14)*on_p2c3s3_14 + ds_p2c3s3_14
  # j2j3_p2c3s3_14 <- fte_p2c3s3_14
  # j3j4_p2c3s3_14 <- cs_p2c3s3_14
  # j4j3_p2c3s3_14 <- endcust14
  # j1j2_p2c4s1_14 <- (ss_p2c4s1j1_14+a_p2c4s1j1_14+miss_p2c4s1_14)*on_p2c4s1_14 + ds_p2c4s1_14
  # j2j3_p2c4s1_14 <- fte_p2c4s1_14
  # j3j4_p2c4s1_14 <- cs_p2c4s1_14
  # j4j3_p2c4s1_14 <- endcust14
  # j1j2_p2c4s2_14 <- (ss_p2c4s2j1_14+a_p2c4s2j1_14+miss_p2c4s2_14)*on_p2c4s2_14 + ds_p2c4s2_14
  # j2j3_p2c4s2_14 <- fte_p2c4s2_14
  # j3j4_p2c4s2_14 <- cs_p2c4s2_14
  # j4j3_p2c4s2_14 <- endcust14
  # j1j2_p2c4s3_14 <- (ss_p2c4s3j1_14+a_p2c4s3j1_14+miss_p2c4s3_14)*on_p2c4s3_14 + ds_p2c4s3_14
  # j2j3_p2c4s3_14 <- fte_p2c4s3_14
  # j3j4_p2c4s3_14 <- cs_p2c4s3_14
  # j4j3_p2c4s3_14 <- endcust14
  # j1j2_p1c1s1_15 <- (ss_p1c1s1j1_15+a_p1c1s1j1_15+miss_p1c1s1_15)*on_p1c1s1_15 + ds_p1c1s1_15
  # j2j3_p1c1s1_15 <- fte_p1c1s1_15
  # j3j4_p1c1s1_15 <- cs_p1c1s1_15
  # j4j3_p1c1s1_15 <- endcust15
  # j1j2_p1c1s2_15 <- (ss_p1c1s2j1_15+a_p1c1s2j1_15+miss_p1c1s2_15)*on_p1c1s2_15 + ds_p1c1s2_15
  # j2j3_p1c1s2_15 <- fte_p1c1s2_15
  # j3j4_p1c1s2_15 <- cs_p1c1s2_15
  # j4j3_p1c1s2_15 <- endcust15
  # j1j2_p1c1s3_15 <- (ss_p1c1s3j1_15+a_p1c1s3j1_15+miss_p1c1s3_15)*on_p1c1s3_15 + ds_p1c1s3_15
  # j2j3_p1c1s3_15 <- fte_p1c1s3_15
  # j3j4_p1c1s3_15 <- cs_p1c1s3_15
  # j4j3_p1c1s3_15 <- endcust15
  # j1j2_p1c2s1_15 <- (ss_p1c2s1j1_15+a_p1c2s1j1_15+miss_p1c2s1_15)*on_p1c2s1_15 + ds_p1c2s1_15
  # j2j3_p1c2s1_15 <- fte_p1c2s1_15
  # j3j4_p1c2s1_15 <- cs_p1c2s1_15
  # j4j3_p1c2s1_15 <- endcust15
  # j1j2_p1c2s2_15 <- (ss_p1c2s2j1_15+a_p1c2s2j1_15+miss_p1c2s2_15)*on_p1c2s2_15 + ds_p1c2s2_15
  # j2j3_p1c2s2_15 <- fte_p1c2s2_15
  # j3j4_p1c2s2_15 <- cs_p1c2s2_15
  # j4j3_p1c2s2_15 <- endcust15
  # j1j2_p1c2s3_15 <- (ss_p1c2s3j1_15+a_p1c2s3j1_15+miss_p1c2s3_15)*on_p1c2s3_15 + ds_p1c2s3_15
  # j2j3_p1c2s3_15 <- fte_p1c2s3_15
  # j3j4_p1c2s3_15 <- cs_p1c2s3_15
  # j4j3_p1c2s3_15 <- endcust15
  # j1j2_p1c3s1_15 <- (ss_p1c3s1j1_15+a_p1c3s1j1_15+miss_p1c3s1_15)*on_p1c3s1_15 + ds_p1c3s1_15
  # j2j3_p1c3s1_15 <- fte_p1c3s1_15
  # j3j4_p1c3s1_15 <- cs_p1c3s1_15
  # j4j3_p1c3s1_15 <- endcust15
  # j1j2_p1c3s2_15 <- (ss_p1c3s2j1_15+a_p1c3s2j1_15+miss_p1c3s2_15)*on_p1c3s2_15 + ds_p1c3s2_15
  # j2j3_p1c3s2_15 <- fte_p1c3s2_15
  # j3j4_p1c3s2_15 <- cs_p1c3s2_15
  # j4j3_p1c3s2_15 <- endcust15
  # j1j2_p1c3s3_15 <- (ss_p1c3s3j1_15+a_p1c3s3j1_15+miss_p1c3s3_15)*on_p1c3s3_15 + ds_p1c3s3_15
  # j2j3_p1c3s3_15 <- fte_p1c3s3_15
  # j3j4_p1c3s3_15 <- cs_p1c3s3_15
  # j4j3_p1c3s3_15 <- endcust15
  # j1j2_p1c4s1_15 <- (ss_p1c4s1j1_15+a_p1c4s1j1_15+miss_p1c4s1_15)*on_p1c4s1_15 + ds_p1c4s1_15
  # j2j3_p1c4s1_15 <- fte_p1c4s1_15
  # j3j4_p1c4s1_15 <- cs_p1c4s1_15
  # j4j3_p1c4s1_15 <- endcust15
  # j1j2_p1c4s2_15 <- (ss_p1c4s2j1_15+a_p1c4s2j1_15+miss_p1c4s2_15)*on_p1c4s2_15 + ds_p1c4s2_15
  # j2j3_p1c4s2_15 <- fte_p1c4s2_15
  # j3j4_p1c4s2_15 <- cs_p1c4s2_15
  # j4j3_p1c4s2_15 <- endcust15
  # j1j2_p1c4s3_15 <- (ss_p1c4s3j1_15+a_p1c4s3j1_15+miss_p1c4s3_15)*on_p1c4s3_15 + ds_p1c4s3_15
  # j2j3_p1c4s3_15 <- fte_p1c4s3_15
  # j3j4_p1c4s3_15 <- cs_p1c4s3_15
  # j4j3_p1c4s3_15 <- endcust15
  # j1j2_p2c1s1_15 <- (ss_p2c1s1j1_15+a_p2c1s1j1_15+miss_p2c1s1_15)*on_p2c1s1_15 + ds_p2c1s1_15
  # j2j3_p2c1s1_15 <- fte_p2c1s1_15
  # j3j4_p2c1s1_15 <- cs_p2c1s1_15
  # j4j3_p2c1s1_15 <- endcust15
  # j1j2_p2c1s2_15 <- (ss_p2c1s2j1_15+a_p2c1s2j1_15+miss_p2c1s2_15)*on_p2c1s2_15 + ds_p2c1s2_15
  # j2j3_p2c1s2_15 <- fte_p2c1s2_15
  # j3j4_p2c1s2_15 <- cs_p2c1s2_15
  # j4j3_p2c1s2_15 <- endcust15
  # j1j2_p2c1s3_15 <- (ss_p2c1s3j1_15+a_p2c1s3j1_15+miss_p2c1s3_15)*on_p2c1s3_15 + ds_p2c1s3_15
  # j2j3_p2c1s3_15 <- fte_p2c1s3_15
  # j3j4_p2c1s3_15 <- cs_p2c1s3_15
  # j4j3_p2c1s3_15 <- endcust15
  # j1j2_p2c2s1_15 <- (ss_p2c2s1j1_15+a_p2c2s1j1_15+miss_p2c2s1_15)*on_p2c2s1_15 + ds_p2c2s1_15
  # j2j3_p2c2s1_15 <- fte_p2c2s1_15
  # j3j4_p2c2s1_15 <- cs_p2c2s1_15
  # j4j3_p2c2s1_15 <- endcust15
  # j1j2_p2c2s2_15 <- (ss_p2c2s2j1_15+a_p2c2s2j1_15+miss_p2c2s2_15)*on_p2c2s2_15 + ds_p2c2s2_15
  # j2j3_p2c2s2_15 <- fte_p2c2s2_15
  # j3j4_p2c2s2_15 <- cs_p2c2s2_15
  # j4j3_p2c2s2_15 <- endcust15
  # j1j2_p2c2s3_15 <- (ss_p2c2s3j1_15+a_p2c2s3j1_15+miss_p2c2s3_15)*on_p2c2s3_15 + ds_p2c2s3_15
  # j2j3_p2c2s3_15 <- fte_p2c2s3_15
  # j3j4_p2c2s3_15 <- cs_p2c2s3_15
  # j4j3_p2c2s3_15 <- endcust15
  # j1j2_p2c3s1_15 <- (ss_p2c3s1j1_15+a_p2c3s1j1_15+miss_p2c3s1_15)*on_p2c3s1_15 + ds_p2c3s1_15
  # j2j3_p2c3s1_15 <- fte_p2c3s1_15
  # j3j4_p2c3s1_15 <- cs_p2c3s1_15
  # j4j3_p2c3s1_15 <- endcust15
  # j1j2_p2c3s2_15 <- (ss_p2c3s2j1_15+a_p2c3s2j1_15+miss_p2c3s2_15)*on_p2c3s2_15 + ds_p2c3s2_15
  # j2j3_p2c3s2_15 <- fte_p2c3s2_15
  # j3j4_p2c3s2_15 <- cs_p2c3s2_15
  # j4j3_p2c3s2_15 <- endcust15
  # j1j2_p2c3s3_15 <- (ss_p2c3s3j1_15+a_p2c3s3j1_15+miss_p2c3s3_15)*on_p2c3s3_15 + ds_p2c3s3_15
  # j2j3_p2c3s3_15 <- fte_p2c3s3_15
  # j3j4_p2c3s3_15 <- cs_p2c3s3_15
  # j4j3_p2c3s3_15 <- endcust15
  # j1j2_p2c4s1_15 <- (ss_p2c4s1j1_15+a_p2c4s1j1_15+miss_p2c4s1_15)*on_p2c4s1_15 + ds_p2c4s1_15
  # j2j3_p2c4s1_15 <- fte_p2c4s1_15
  # j3j4_p2c4s1_15 <- cs_p2c4s1_15
  # j4j3_p2c4s1_15 <- endcust15
  # j1j2_p2c4s2_15 <- (ss_p2c4s2j1_15+a_p2c4s2j1_15+miss_p2c4s2_15)*on_p2c4s2_15 + ds_p2c4s2_15
  # j2j3_p2c4s2_15 <- fte_p2c4s2_15
  # j3j4_p2c4s2_15 <- cs_p2c4s2_15
  # j4j3_p2c4s2_15 <- endcust15
  # j1j2_p2c4s3_15 <- (ss_p2c4s3j1_15+a_p2c4s3j1_15+miss_p2c4s3_15)*on_p2c4s3_15 + ds_p2c4s3_15
  # j2j3_p2c4s3_15 <- fte_p2c4s3_15
  # j3j4_p2c4s3_15 <- cs_p2c4s3_15
  # j4j3_p2c4s3_15 <- endcust15
  # j1j2_p1c1s1_16 <- (ss_p1c1s1j1_16+a_p1c1s1j1_16+miss_p1c1s1_16)*on_p1c1s1_16 + ds_p1c1s1_16
  # j2j3_p1c1s1_16 <- fte_p1c1s1_16
  # j3j4_p1c1s1_16 <- cs_p1c1s1_16
  # j4j3_p1c1s1_16 <- endcust16
  # j1j2_p1c1s2_16 <- (ss_p1c1s2j1_16+a_p1c1s2j1_16+miss_p1c1s2_16)*on_p1c1s2_16 + ds_p1c1s2_16
  # j2j3_p1c1s2_16 <- fte_p1c1s2_16
  # j3j4_p1c1s2_16 <- cs_p1c1s2_16
  # j4j3_p1c1s2_16 <- endcust16
  # j1j2_p1c1s3_16 <- (ss_p1c1s3j1_16+a_p1c1s3j1_16+miss_p1c1s3_16)*on_p1c1s3_16 + ds_p1c1s3_16
  # j2j3_p1c1s3_16 <- fte_p1c1s3_16
  # j3j4_p1c1s3_16 <- cs_p1c1s3_16
  # j4j3_p1c1s3_16 <- endcust16
  # j1j2_p1c2s1_16 <- (ss_p1c2s1j1_16+a_p1c2s1j1_16+miss_p1c2s1_16)*on_p1c2s1_16 + ds_p1c2s1_16
  # j2j3_p1c2s1_16 <- fte_p1c2s1_16
  # j3j4_p1c2s1_16 <- cs_p1c2s1_16
  # j4j3_p1c2s1_16 <- endcust16
  # j1j2_p1c2s2_16 <- (ss_p1c2s2j1_16+a_p1c2s2j1_16+miss_p1c2s2_16)*on_p1c2s2_16 + ds_p1c2s2_16
  # j2j3_p1c2s2_16 <- fte_p1c2s2_16
  # j3j4_p1c2s2_16 <- cs_p1c2s2_16
  # j4j3_p1c2s2_16 <- endcust16
  # j1j2_p1c2s3_16 <- (ss_p1c2s3j1_16+a_p1c2s3j1_16+miss_p1c2s3_16)*on_p1c2s3_16 + ds_p1c2s3_16
  # j2j3_p1c2s3_16 <- fte_p1c2s3_16
  # j3j4_p1c2s3_16 <- cs_p1c2s3_16
  # j4j3_p1c2s3_16 <- endcust16
  # j1j2_p1c3s1_16 <- (ss_p1c3s1j1_16+a_p1c3s1j1_16+miss_p1c3s1_16)*on_p1c3s1_16 + ds_p1c3s1_16
  # j2j3_p1c3s1_16 <- fte_p1c3s1_16
  # j3j4_p1c3s1_16 <- cs_p1c3s1_16
  # j4j3_p1c3s1_16 <- endcust16
  # j1j2_p1c3s2_16 <- (ss_p1c3s2j1_16+a_p1c3s2j1_16+miss_p1c3s2_16)*on_p1c3s2_16 + ds_p1c3s2_16
  # j2j3_p1c3s2_16 <- fte_p1c3s2_16
  # j3j4_p1c3s2_16 <- cs_p1c3s2_16
  # j4j3_p1c3s2_16 <- endcust16
  # j1j2_p1c3s3_16 <- (ss_p1c3s3j1_16+a_p1c3s3j1_16+miss_p1c3s3_16)*on_p1c3s3_16 + ds_p1c3s3_16
  # j2j3_p1c3s3_16 <- fte_p1c3s3_16
  # j3j4_p1c3s3_16 <- cs_p1c3s3_16
  # j4j3_p1c3s3_16 <- endcust16
  # j1j2_p1c4s1_16 <- (ss_p1c4s1j1_16+a_p1c4s1j1_16+miss_p1c4s1_16)*on_p1c4s1_16 + ds_p1c4s1_16
  # j2j3_p1c4s1_16 <- fte_p1c4s1_16
  # j3j4_p1c4s1_16 <- cs_p1c4s1_16
  # j4j3_p1c4s1_16 <- endcust16
  # j1j2_p1c4s2_16 <- (ss_p1c4s2j1_16+a_p1c4s2j1_16+miss_p1c4s2_16)*on_p1c4s2_16 + ds_p1c4s2_16
  # j2j3_p1c4s2_16 <- fte_p1c4s2_16
  # j3j4_p1c4s2_16 <- cs_p1c4s2_16
  # j4j3_p1c4s2_16 <- endcust16
  # j1j2_p1c4s3_16 <- (ss_p1c4s3j1_16+a_p1c4s3j1_16+miss_p1c4s3_16)*on_p1c4s3_16 + ds_p1c4s3_16
  # j2j3_p1c4s3_16 <- fte_p1c4s3_16
  # j3j4_p1c4s3_16 <- cs_p1c4s3_16
  # j4j3_p1c4s3_16 <- endcust16
  # j1j2_p2c1s1_16 <- (ss_p2c1s1j1_16+a_p2c1s1j1_16+miss_p2c1s1_16)*on_p2c1s1_16 + ds_p2c1s1_16
  # j2j3_p2c1s1_16 <- fte_p2c1s1_16
  # j3j4_p2c1s1_16 <- cs_p2c1s1_16
  # j4j3_p2c1s1_16 <- endcust16
  # j1j2_p2c1s2_16 <- (ss_p2c1s2j1_16+a_p2c1s2j1_16+miss_p2c1s2_16)*on_p2c1s2_16 + ds_p2c1s2_16
  # j2j3_p2c1s2_16 <- fte_p2c1s2_16
  # j3j4_p2c1s2_16 <- cs_p2c1s2_16
  # j4j3_p2c1s2_16 <- endcust16
  # j1j2_p2c1s3_16 <- (ss_p2c1s3j1_16+a_p2c1s3j1_16+miss_p2c1s3_16)*on_p2c1s3_16 + ds_p2c1s3_16
  # j2j3_p2c1s3_16 <- fte_p2c1s3_16
  # j3j4_p2c1s3_16 <- cs_p2c1s3_16
  # j4j3_p2c1s3_16 <- endcust16
  # j1j2_p2c2s1_16 <- (ss_p2c2s1j1_16+a_p2c2s1j1_16+miss_p2c2s1_16)*on_p2c2s1_16 + ds_p2c2s1_16
  # j2j3_p2c2s1_16 <- fte_p2c2s1_16
  # j3j4_p2c2s1_16 <- cs_p2c2s1_16
  # j4j3_p2c2s1_16 <- endcust16
  # j1j2_p2c2s2_16 <- (ss_p2c2s2j1_16+a_p2c2s2j1_16+miss_p2c2s2_16)*on_p2c2s2_16 + ds_p2c2s2_16
  # j2j3_p2c2s2_16 <- fte_p2c2s2_16
  # j3j4_p2c2s2_16 <- cs_p2c2s2_16
  # j4j3_p2c2s2_16 <- endcust16
  # j1j2_p2c2s3_16 <- (ss_p2c2s3j1_16+a_p2c2s3j1_16+miss_p2c2s3_16)*on_p2c2s3_16 + ds_p2c2s3_16
  # j2j3_p2c2s3_16 <- fte_p2c2s3_16
  # j3j4_p2c2s3_16 <- cs_p2c2s3_16
  # j4j3_p2c2s3_16 <- endcust16
  # j1j2_p2c3s1_16 <- (ss_p2c3s1j1_16+a_p2c3s1j1_16+miss_p2c3s1_16)*on_p2c3s1_16 + ds_p2c3s1_16
  # j2j3_p2c3s1_16 <- fte_p2c3s1_16
  # j3j4_p2c3s1_16 <- cs_p2c3s1_16
  # j4j3_p2c3s1_16 <- endcust16
  # j1j2_p2c3s2_16 <- (ss_p2c3s2j1_16+a_p2c3s2j1_16+miss_p2c3s2_16)*on_p2c3s2_16 + ds_p2c3s2_16
  # j2j3_p2c3s2_16 <- fte_p2c3s2_16
  # j3j4_p2c3s2_16 <- cs_p2c3s2_16
  # j4j3_p2c3s2_16 <- endcust16
  # j1j2_p2c3s3_16 <- (ss_p2c3s3j1_16+a_p2c3s3j1_16+miss_p2c3s3_16)*on_p2c3s3_16 + ds_p2c3s3_16
  # j2j3_p2c3s3_16 <- fte_p2c3s3_16
  # j3j4_p2c3s3_16 <- cs_p2c3s3_16
  # j4j3_p2c3s3_16 <- endcust16
  # j1j2_p2c4s1_16 <- (ss_p2c4s1j1_16+a_p2c4s1j1_16+miss_p2c4s1_16)*on_p2c4s1_16 + ds_p2c4s1_16
  # j2j3_p2c4s1_16 <- fte_p2c4s1_16
  # j3j4_p2c4s1_16 <- cs_p2c4s1_16
  # j4j3_p2c4s1_16 <- endcust16
  # j1j2_p2c4s2_16 <- (ss_p2c4s2j1_16+a_p2c4s2j1_16+miss_p2c4s2_16)*on_p2c4s2_16 + ds_p2c4s2_16
  # j2j3_p2c4s2_16 <- fte_p2c4s2_16
  # j3j4_p2c4s2_16 <- cs_p2c4s2_16
  # j4j3_p2c4s2_16 <- endcust16
  # j1j2_p2c4s3_16 <- (ss_p2c4s3j1_16+a_p2c4s3j1_16+miss_p2c4s3_16)*on_p2c4s3_16 + ds_p2c4s3_16
  # j2j3_p2c4s3_16 <- fte_p2c4s3_16
  # j3j4_p2c4s3_16 <- cs_p2c4s3_16
  # j4j3_p2c4s3_16 <- endcust16
  # j1j2_p1c1s1_17 <- (ss_p1c1s1j1_17+a_p1c1s1j1_17+miss_p1c1s1_17)*on_p1c1s1_17 + ds_p1c1s1_17
  # j2j3_p1c1s1_17 <- fte_p1c1s1_17
  # j3j4_p1c1s1_17 <- cs_p1c1s1_17
  # j4j3_p1c1s1_17 <- endcust17
  # j1j2_p1c1s2_17 <- (ss_p1c1s2j1_17+a_p1c1s2j1_17+miss_p1c1s2_17)*on_p1c1s2_17 + ds_p1c1s2_17
  # j2j3_p1c1s2_17 <- fte_p1c1s2_17
  # j3j4_p1c1s2_17 <- cs_p1c1s2_17
  # j4j3_p1c1s2_17 <- endcust17
  # j1j2_p1c1s3_17 <- (ss_p1c1s3j1_17+a_p1c1s3j1_17+miss_p1c1s3_17)*on_p1c1s3_17 + ds_p1c1s3_17
  # j2j3_p1c1s3_17 <- fte_p1c1s3_17
  # j3j4_p1c1s3_17 <- cs_p1c1s3_17
  # j4j3_p1c1s3_17 <- endcust17
  # j1j2_p1c2s1_17 <- (ss_p1c2s1j1_17+a_p1c2s1j1_17+miss_p1c2s1_17)*on_p1c2s1_17 + ds_p1c2s1_17
  # j2j3_p1c2s1_17 <- fte_p1c2s1_17
  # j3j4_p1c2s1_17 <- cs_p1c2s1_17
  # j4j3_p1c2s1_17 <- endcust17
  # j1j2_p1c2s2_17 <- (ss_p1c2s2j1_17+a_p1c2s2j1_17+miss_p1c2s2_17)*on_p1c2s2_17 + ds_p1c2s2_17
  # j2j3_p1c2s2_17 <- fte_p1c2s2_17
  # j3j4_p1c2s2_17 <- cs_p1c2s2_17
  # j4j3_p1c2s2_17 <- endcust17
  # j1j2_p1c2s3_17 <- (ss_p1c2s3j1_17+a_p1c2s3j1_17+miss_p1c2s3_17)*on_p1c2s3_17 + ds_p1c2s3_17
  # j2j3_p1c2s3_17 <- fte_p1c2s3_17
  # j3j4_p1c2s3_17 <- cs_p1c2s3_17
  # j4j3_p1c2s3_17 <- endcust17
  # j1j2_p1c3s1_17 <- (ss_p1c3s1j1_17+a_p1c3s1j1_17+miss_p1c3s1_17)*on_p1c3s1_17 + ds_p1c3s1_17
  # j2j3_p1c3s1_17 <- fte_p1c3s1_17
  # j3j4_p1c3s1_17 <- cs_p1c3s1_17
  # j4j3_p1c3s1_17 <- endcust17
  # j1j2_p1c3s2_17 <- (ss_p1c3s2j1_17+a_p1c3s2j1_17+miss_p1c3s2_17)*on_p1c3s2_17 + ds_p1c3s2_17
  # j2j3_p1c3s2_17 <- fte_p1c3s2_17
  # j3j4_p1c3s2_17 <- cs_p1c3s2_17
  # j4j3_p1c3s2_17 <- endcust17
  # j1j2_p1c3s3_17 <- (ss_p1c3s3j1_17+a_p1c3s3j1_17+miss_p1c3s3_17)*on_p1c3s3_17 + ds_p1c3s3_17
  # j2j3_p1c3s3_17 <- fte_p1c3s3_17
  # j3j4_p1c3s3_17 <- cs_p1c3s3_17
  # j4j3_p1c3s3_17 <- endcust17
  # j1j2_p1c4s1_17 <- (ss_p1c4s1j1_17+a_p1c4s1j1_17+miss_p1c4s1_17)*on_p1c4s1_17 + ds_p1c4s1_17
  # j2j3_p1c4s1_17 <- fte_p1c4s1_17
  # j3j4_p1c4s1_17 <- cs_p1c4s1_17
  # j4j3_p1c4s1_17 <- endcust17
  # j1j2_p1c4s2_17 <- (ss_p1c4s2j1_17+a_p1c4s2j1_17+miss_p1c4s2_17)*on_p1c4s2_17 + ds_p1c4s2_17
  # j2j3_p1c4s2_17 <- fte_p1c4s2_17
  # j3j4_p1c4s2_17 <- cs_p1c4s2_17
  # j4j3_p1c4s2_17 <- endcust17
  # j1j2_p1c4s3_17 <- (ss_p1c4s3j1_17+a_p1c4s3j1_17+miss_p1c4s3_17)*on_p1c4s3_17 + ds_p1c4s3_17
  # j2j3_p1c4s3_17 <- fte_p1c4s3_17
  # j3j4_p1c4s3_17 <- cs_p1c4s3_17
  # j4j3_p1c4s3_17 <- endcust17
  # j1j2_p2c1s1_17 <- (ss_p2c1s1j1_17+a_p2c1s1j1_17+miss_p2c1s1_17)*on_p2c1s1_17 + ds_p2c1s1_17
  # j2j3_p2c1s1_17 <- fte_p2c1s1_17
  # j3j4_p2c1s1_17 <- cs_p2c1s1_17
  # j4j3_p2c1s1_17 <- endcust17
  # j1j2_p2c1s2_17 <- (ss_p2c1s2j1_17+a_p2c1s2j1_17+miss_p2c1s2_17)*on_p2c1s2_17 + ds_p2c1s2_17
  # j2j3_p2c1s2_17 <- fte_p2c1s2_17
  # j3j4_p2c1s2_17 <- cs_p2c1s2_17
  # j4j3_p2c1s2_17 <- endcust17
  # j1j2_p2c1s3_17 <- (ss_p2c1s3j1_17+a_p2c1s3j1_17+miss_p2c1s3_17)*on_p2c1s3_17 + ds_p2c1s3_17
  # j2j3_p2c1s3_17 <- fte_p2c1s3_17
  # j3j4_p2c1s3_17 <- cs_p2c1s3_17
  # j4j3_p2c1s3_17 <- endcust17
  # j1j2_p2c2s1_17 <- (ss_p2c2s1j1_17+a_p2c2s1j1_17+miss_p2c2s1_17)*on_p2c2s1_17 + ds_p2c2s1_17
  # j2j3_p2c2s1_17 <- fte_p2c2s1_17
  # j3j4_p2c2s1_17 <- cs_p2c2s1_17
  # j4j3_p2c2s1_17 <- endcust17
  # j1j2_p2c2s2_17 <- (ss_p2c2s2j1_17+a_p2c2s2j1_17+miss_p2c2s2_17)*on_p2c2s2_17 + ds_p2c2s2_17
  # j2j3_p2c2s2_17 <- fte_p2c2s2_17
  # j3j4_p2c2s2_17 <- cs_p2c2s2_17
  # j4j3_p2c2s2_17 <- endcust17
  # j1j2_p2c2s3_17 <- (ss_p2c2s3j1_17+a_p2c2s3j1_17+miss_p2c2s3_17)*on_p2c2s3_17 + ds_p2c2s3_17
  # j2j3_p2c2s3_17 <- fte_p2c2s3_17
  # j3j4_p2c2s3_17 <- cs_p2c2s3_17
  # j4j3_p2c2s3_17 <- endcust17
  # j1j2_p2c3s1_17 <- (ss_p2c3s1j1_17+a_p2c3s1j1_17+miss_p2c3s1_17)*on_p2c3s1_17 + ds_p2c3s1_17
  # j2j3_p2c3s1_17 <- fte_p2c3s1_17
  # j3j4_p2c3s1_17 <- cs_p2c3s1_17
  # j4j3_p2c3s1_17 <- endcust17
  # j1j2_p2c3s2_17 <- (ss_p2c3s2j1_17+a_p2c3s2j1_17+miss_p2c3s2_17)*on_p2c3s2_17 + ds_p2c3s2_17
  # j2j3_p2c3s2_17 <- fte_p2c3s2_17
  # j3j4_p2c3s2_17 <- cs_p2c3s2_17
  # j4j3_p2c3s2_17 <- endcust17
  # j1j2_p2c3s3_17 <- (ss_p2c3s3j1_17+a_p2c3s3j1_17+miss_p2c3s3_17)*on_p2c3s3_17 + ds_p2c3s3_17
  # j2j3_p2c3s3_17 <- fte_p2c3s3_17
  # j3j4_p2c3s3_17 <- cs_p2c3s3_17
  # j4j3_p2c3s3_17 <- endcust17
  # j1j2_p2c4s1_17 <- (ss_p2c4s1j1_17+a_p2c4s1j1_17+miss_p2c4s1_17)*on_p2c4s1_17 + ds_p2c4s1_17
  # j2j3_p2c4s1_17 <- fte_p2c4s1_17
  # j3j4_p2c4s1_17 <- cs_p2c4s1_17
  # j4j3_p2c4s1_17 <- endcust17
  # j1j2_p2c4s2_17 <- (ss_p2c4s2j1_17+a_p2c4s2j1_17+miss_p2c4s2_17)*on_p2c4s2_17 + ds_p2c4s2_17
  # j2j3_p2c4s2_17 <- fte_p2c4s2_17
  # j3j4_p2c4s2_17 <- cs_p2c4s2_17
  # j4j3_p2c4s2_17 <- endcust17
  # j1j2_p2c4s3_17 <- (ss_p2c4s3j1_17+a_p2c4s3j1_17+miss_p2c4s3_17)*on_p2c4s3_17 + ds_p2c4s3_17
  # j2j3_p2c4s3_17 <- fte_p2c4s3_17
  # j3j4_p2c4s3_17 <- cs_p2c4s3_17
  # j4j3_p2c4s3_17 <- endcust17
  
  
  j1j2_p1c1s1_10 <- (ss_p1c1s1j1_10)*on_p1c1s1_10 + ds_p1c1s1_10
  j2j3_p1c1s1_10 <- fte_p1c1s1_10
  j3j4_p1c1s1_10 <- cs_p1c1s1_10
  j4j3_p1c1s1_10 <- endcust10
  j1j2_p1c1s2_10 <- (ss_p1c1s2j1_10)*on_p1c1s2_10 + ds_p1c1s2_10
  j2j3_p1c1s2_10 <- fte_p1c1s2_10
  j3j4_p1c1s2_10 <- cs_p1c1s2_10
  j4j3_p1c1s2_10 <- endcust10
  j1j2_p1c1s3_10 <- (ss_p1c1s3j1_10)*on_p1c1s3_10 + ds_p1c1s3_10
  j2j3_p1c1s3_10 <- fte_p1c1s3_10
  j3j4_p1c1s3_10 <- cs_p1c1s3_10
  j4j3_p1c1s3_10 <- endcust10
  j1j2_p1c2s1_10 <- (ss_p1c2s1j1_10)*on_p1c2s1_10 + ds_p1c2s1_10
  j2j3_p1c2s1_10 <- fte_p1c2s1_10
  j3j4_p1c2s1_10 <- cs_p1c2s1_10
  j4j3_p1c2s1_10 <- endcust10
  j1j2_p1c2s2_10 <- (ss_p1c2s2j1_10)*on_p1c2s2_10 + ds_p1c2s2_10
  j2j3_p1c2s2_10 <- fte_p1c2s2_10
  j3j4_p1c2s2_10 <- cs_p1c2s2_10
  j4j3_p1c2s2_10 <- endcust10
  j1j2_p1c2s3_10 <- (ss_p1c2s3j1_10)*on_p1c2s3_10 + ds_p1c2s3_10
  j2j3_p1c2s3_10 <- fte_p1c2s3_10
  j3j4_p1c2s3_10 <- cs_p1c2s3_10
  j4j3_p1c2s3_10 <- endcust10
  j1j2_p1c3s1_10 <- (ss_p1c3s1j1_10)*on_p1c3s1_10 + ds_p1c3s1_10
  j2j3_p1c3s1_10 <- fte_p1c3s1_10
  j3j4_p1c3s1_10 <- cs_p1c3s1_10
  j4j3_p1c3s1_10 <- endcust10
  j1j2_p1c3s2_10 <- (ss_p1c3s2j1_10)*on_p1c3s2_10 + ds_p1c3s2_10
  j2j3_p1c3s2_10 <- fte_p1c3s2_10
  j3j4_p1c3s2_10 <- cs_p1c3s2_10
  j4j3_p1c3s2_10 <- endcust10
  j1j2_p1c3s3_10 <- (ss_p1c3s3j1_10)*on_p1c3s3_10 + ds_p1c3s3_10
  j2j3_p1c3s3_10 <- fte_p1c3s3_10
  j3j4_p1c3s3_10 <- cs_p1c3s3_10
  j4j3_p1c3s3_10 <- endcust10
  j1j2_p1c4s1_10 <- (ss_p1c4s1j1_10)*on_p1c4s1_10 + ds_p1c4s1_10
  j2j3_p1c4s1_10 <- fte_p1c4s1_10
  j3j4_p1c4s1_10 <- cs_p1c4s1_10
  j4j3_p1c4s1_10 <- endcust10
  j1j2_p1c4s2_10 <- (ss_p1c4s2j1_10)*on_p1c4s2_10 + ds_p1c4s2_10
  j2j3_p1c4s2_10 <- fte_p1c4s2_10
  j3j4_p1c4s2_10 <- cs_p1c4s2_10
  j4j3_p1c4s2_10 <- endcust10
  j1j2_p1c4s3_10 <- (ss_p1c4s3j1_10)*on_p1c4s3_10 + ds_p1c4s3_10
  j2j3_p1c4s3_10 <- fte_p1c4s3_10
  j3j4_p1c4s3_10 <- cs_p1c4s3_10
  j4j3_p1c4s3_10 <- endcust10
  j1j2_p2c1s1_10 <- (ss_p2c1s1j1_10)*on_p2c1s1_10 + ds_p2c1s1_10
  j2j3_p2c1s1_10 <- fte_p2c1s1_10
  j3j4_p2c1s1_10 <- cs_p2c1s1_10
  j4j3_p2c1s1_10 <- endcust10
  j1j2_p2c1s2_10 <- (ss_p2c1s2j1_10)*on_p2c1s2_10 + ds_p2c1s2_10
  j2j3_p2c1s2_10 <- fte_p2c1s2_10
  j3j4_p2c1s2_10 <- cs_p2c1s2_10
  j4j3_p2c1s2_10 <- endcust10
  j1j2_p2c1s3_10 <- (ss_p2c1s3j1_10)*on_p2c1s3_10 + ds_p2c1s3_10
  j2j3_p2c1s3_10 <- fte_p2c1s3_10
  j3j4_p2c1s3_10 <- cs_p2c1s3_10
  j4j3_p2c1s3_10 <- endcust10
  j1j2_p2c2s1_10 <- (ss_p2c2s1j1_10)*on_p2c2s1_10 + ds_p2c2s1_10
  j2j3_p2c2s1_10 <- fte_p2c2s1_10
  j3j4_p2c2s1_10 <- cs_p2c2s1_10
  j4j3_p2c2s1_10 <- endcust10
  j1j2_p2c2s2_10 <- (ss_p2c2s2j1_10)*on_p2c2s2_10 + ds_p2c2s2_10
  j2j3_p2c2s2_10 <- fte_p2c2s2_10
  j3j4_p2c2s2_10 <- cs_p2c2s2_10
  j4j3_p2c2s2_10 <- endcust10
  j1j2_p2c2s3_10 <- (ss_p2c2s3j1_10)*on_p2c2s3_10 + ds_p2c2s3_10
  j2j3_p2c2s3_10 <- fte_p2c2s3_10
  j3j4_p2c2s3_10 <- cs_p2c2s3_10
  j4j3_p2c2s3_10 <- endcust10
  j1j2_p2c3s1_10 <- (ss_p2c3s1j1_10)*on_p2c3s1_10 + ds_p2c3s1_10
  j2j3_p2c3s1_10 <- fte_p2c3s1_10
  j3j4_p2c3s1_10 <- cs_p2c3s1_10
  j4j3_p2c3s1_10 <- endcust10
  j1j2_p2c3s2_10 <- (ss_p2c3s2j1_10)*on_p2c3s2_10 + ds_p2c3s2_10
  j2j3_p2c3s2_10 <- fte_p2c3s2_10
  j3j4_p2c3s2_10 <- cs_p2c3s2_10
  j4j3_p2c3s2_10 <- endcust10
  j1j2_p2c3s3_10 <- (ss_p2c3s3j1_10)*on_p2c3s3_10 + ds_p2c3s3_10
  j2j3_p2c3s3_10 <- fte_p2c3s3_10
  j3j4_p2c3s3_10 <- cs_p2c3s3_10
  j4j3_p2c3s3_10 <- endcust10
  j1j2_p2c4s1_10 <- (ss_p2c4s1j1_10)*on_p2c4s1_10 + ds_p2c4s1_10
  j2j3_p2c4s1_10 <- fte_p2c4s1_10
  j3j4_p2c4s1_10 <- cs_p2c4s1_10
  j4j3_p2c4s1_10 <- endcust10
  j1j2_p2c4s2_10 <- (ss_p2c4s2j1_10)*on_p2c4s2_10 + ds_p2c4s2_10
  j2j3_p2c4s2_10 <- fte_p2c4s2_10
  j3j4_p2c4s2_10 <- cs_p2c4s2_10
  j4j3_p2c4s2_10 <- endcust10
  j1j2_p2c4s3_10 <- (ss_p2c4s3j1_10)*on_p2c4s3_10 + ds_p2c4s3_10
  j2j3_p2c4s3_10 <- fte_p2c4s3_10
  j3j4_p2c4s3_10 <- cs_p2c4s3_10
  j4j3_p2c4s3_10 <- endcust10
  j1j2_p1c1s1_11 <- (ss_p1c1s1j1_11)*on_p1c1s1_11 + ds_p1c1s1_11
  j2j3_p1c1s1_11 <- fte_p1c1s1_11
  j3j4_p1c1s1_11 <- cs_p1c1s1_11
  j4j3_p1c1s1_11 <- endcust11
  j1j2_p1c1s2_11 <- (ss_p1c1s2j1_11)*on_p1c1s2_11 + ds_p1c1s2_11
  j2j3_p1c1s2_11 <- fte_p1c1s2_11
  j3j4_p1c1s2_11 <- cs_p1c1s2_11
  j4j3_p1c1s2_11 <- endcust11
  j1j2_p1c1s3_11 <- (ss_p1c1s3j1_11)*on_p1c1s3_11 + ds_p1c1s3_11
  j2j3_p1c1s3_11 <- fte_p1c1s3_11
  j3j4_p1c1s3_11 <- cs_p1c1s3_11
  j4j3_p1c1s3_11 <- endcust11
  j1j2_p1c2s1_11 <- (ss_p1c2s1j1_11)*on_p1c2s1_11 + ds_p1c2s1_11
  j2j3_p1c2s1_11 <- fte_p1c2s1_11
  j3j4_p1c2s1_11 <- cs_p1c2s1_11
  j4j3_p1c2s1_11 <- endcust11
  j1j2_p1c2s2_11 <- (ss_p1c2s2j1_11)*on_p1c2s2_11 + ds_p1c2s2_11
  j2j3_p1c2s2_11 <- fte_p1c2s2_11
  j3j4_p1c2s2_11 <- cs_p1c2s2_11
  j4j3_p1c2s2_11 <- endcust11
  j1j2_p1c2s3_11 <- (ss_p1c2s3j1_11)*on_p1c2s3_11 + ds_p1c2s3_11
  j2j3_p1c2s3_11 <- fte_p1c2s3_11
  j3j4_p1c2s3_11 <- cs_p1c2s3_11
  j4j3_p1c2s3_11 <- endcust11
  j1j2_p1c3s1_11 <- (ss_p1c3s1j1_11)*on_p1c3s1_11 + ds_p1c3s1_11
  j2j3_p1c3s1_11 <- fte_p1c3s1_11
  j3j4_p1c3s1_11 <- cs_p1c3s1_11
  j4j3_p1c3s1_11 <- endcust11
  j1j2_p1c3s2_11 <- (ss_p1c3s2j1_11)*on_p1c3s2_11 + ds_p1c3s2_11
  j2j3_p1c3s2_11 <- fte_p1c3s2_11
  j3j4_p1c3s2_11 <- cs_p1c3s2_11
  j4j3_p1c3s2_11 <- endcust11
  j1j2_p1c3s3_11 <- (ss_p1c3s3j1_11)*on_p1c3s3_11 + ds_p1c3s3_11
  j2j3_p1c3s3_11 <- fte_p1c3s3_11
  j3j4_p1c3s3_11 <- cs_p1c3s3_11
  j4j3_p1c3s3_11 <- endcust11
  j1j2_p1c4s1_11 <- (ss_p1c4s1j1_11)*on_p1c4s1_11 + ds_p1c4s1_11
  j2j3_p1c4s1_11 <- fte_p1c4s1_11
  j3j4_p1c4s1_11 <- cs_p1c4s1_11
  j4j3_p1c4s1_11 <- endcust11
  j1j2_p1c4s2_11 <- (ss_p1c4s2j1_11)*on_p1c4s2_11 + ds_p1c4s2_11
  j2j3_p1c4s2_11 <- fte_p1c4s2_11
  j3j4_p1c4s2_11 <- cs_p1c4s2_11
  j4j3_p1c4s2_11 <- endcust11
  j1j2_p1c4s3_11 <- (ss_p1c4s3j1_11)*on_p1c4s3_11 + ds_p1c4s3_11
  j2j3_p1c4s3_11 <- fte_p1c4s3_11
  j3j4_p1c4s3_11 <- cs_p1c4s3_11
  j4j3_p1c4s3_11 <- endcust11
  j1j2_p2c1s1_11 <- (ss_p2c1s1j1_11)*on_p2c1s1_11 + ds_p2c1s1_11
  j2j3_p2c1s1_11 <- fte_p2c1s1_11
  j3j4_p2c1s1_11 <- cs_p2c1s1_11
  j4j3_p2c1s1_11 <- endcust11
  j1j2_p2c1s2_11 <- (ss_p2c1s2j1_11)*on_p2c1s2_11 + ds_p2c1s2_11
  j2j3_p2c1s2_11 <- fte_p2c1s2_11
  j3j4_p2c1s2_11 <- cs_p2c1s2_11
  j4j3_p2c1s2_11 <- endcust11
  j1j2_p2c1s3_11 <- (ss_p2c1s3j1_11)*on_p2c1s3_11 + ds_p2c1s3_11
  j2j3_p2c1s3_11 <- fte_p2c1s3_11
  j3j4_p2c1s3_11 <- cs_p2c1s3_11
  j4j3_p2c1s3_11 <- endcust11
  j1j2_p2c2s1_11 <- (ss_p2c2s1j1_11)*on_p2c2s1_11 + ds_p2c2s1_11
  j2j3_p2c2s1_11 <- fte_p2c2s1_11
  j3j4_p2c2s1_11 <- cs_p2c2s1_11
  j4j3_p2c2s1_11 <- endcust11
  j1j2_p2c2s2_11 <- (ss_p2c2s2j1_11)*on_p2c2s2_11 + ds_p2c2s2_11
  j2j3_p2c2s2_11 <- fte_p2c2s2_11
  j3j4_p2c2s2_11 <- cs_p2c2s2_11
  j4j3_p2c2s2_11 <- endcust11
  j1j2_p2c2s3_11 <- (ss_p2c2s3j1_11)*on_p2c2s3_11 + ds_p2c2s3_11
  j2j3_p2c2s3_11 <- fte_p2c2s3_11
  j3j4_p2c2s3_11 <- cs_p2c2s3_11
  j4j3_p2c2s3_11 <- endcust11
  j1j2_p2c3s1_11 <- (ss_p2c3s1j1_11)*on_p2c3s1_11 + ds_p2c3s1_11
  j2j3_p2c3s1_11 <- fte_p2c3s1_11
  j3j4_p2c3s1_11 <- cs_p2c3s1_11
  j4j3_p2c3s1_11 <- endcust11
  j1j2_p2c3s2_11 <- (ss_p2c3s2j1_11)*on_p2c3s2_11 + ds_p2c3s2_11
  j2j3_p2c3s2_11 <- fte_p2c3s2_11
  j3j4_p2c3s2_11 <- cs_p2c3s2_11
  j4j3_p2c3s2_11 <- endcust11
  j1j2_p2c3s3_11 <- (ss_p2c3s3j1_11)*on_p2c3s3_11 + ds_p2c3s3_11
  j2j3_p2c3s3_11 <- fte_p2c3s3_11
  j3j4_p2c3s3_11 <- cs_p2c3s3_11
  j4j3_p2c3s3_11 <- endcust11
  j1j2_p2c4s1_11 <- (ss_p2c4s1j1_11)*on_p2c4s1_11 + ds_p2c4s1_11
  j2j3_p2c4s1_11 <- fte_p2c4s1_11
  j3j4_p2c4s1_11 <- cs_p2c4s1_11
  j4j3_p2c4s1_11 <- endcust11
  j1j2_p2c4s2_11 <- (ss_p2c4s2j1_11)*on_p2c4s2_11 + ds_p2c4s2_11
  j2j3_p2c4s2_11 <- fte_p2c4s2_11
  j3j4_p2c4s2_11 <- cs_p2c4s2_11
  j4j3_p2c4s2_11 <- endcust11
  j1j2_p2c4s3_11 <- (ss_p2c4s3j1_11)*on_p2c4s3_11 + ds_p2c4s3_11
  j2j3_p2c4s3_11 <- fte_p2c4s3_11
  j3j4_p2c4s3_11 <- cs_p2c4s3_11
  j4j3_p2c4s3_11 <- endcust11
  j1j2_p1c1s1_12 <- (ss_p1c1s1j1_12)*on_p1c1s1_12 + ds_p1c1s1_12
  j2j3_p1c1s1_12 <- fte_p1c1s1_12
  j3j4_p1c1s1_12 <- cs_p1c1s1_12
  j4j3_p1c1s1_12 <- endcust12
  j1j2_p1c1s2_12 <- (ss_p1c1s2j1_12)*on_p1c1s2_12 + ds_p1c1s2_12
  j2j3_p1c1s2_12 <- fte_p1c1s2_12
  j3j4_p1c1s2_12 <- cs_p1c1s2_12
  j4j3_p1c1s2_12 <- endcust12
  j1j2_p1c1s3_12 <- (ss_p1c1s3j1_12)*on_p1c1s3_12 + ds_p1c1s3_12
  j2j3_p1c1s3_12 <- fte_p1c1s3_12
  j3j4_p1c1s3_12 <- cs_p1c1s3_12
  j4j3_p1c1s3_12 <- endcust12
  j1j2_p1c2s1_12 <- (ss_p1c2s1j1_12)*on_p1c2s1_12 + ds_p1c2s1_12
  j2j3_p1c2s1_12 <- fte_p1c2s1_12
  j3j4_p1c2s1_12 <- cs_p1c2s1_12
  j4j3_p1c2s1_12 <- endcust12
  j1j2_p1c2s2_12 <- (ss_p1c2s2j1_12)*on_p1c2s2_12 + ds_p1c2s2_12
  j2j3_p1c2s2_12 <- fte_p1c2s2_12
  j3j4_p1c2s2_12 <- cs_p1c2s2_12
  j4j3_p1c2s2_12 <- endcust12
  j1j2_p1c2s3_12 <- (ss_p1c2s3j1_12)*on_p1c2s3_12 + ds_p1c2s3_12
  j2j3_p1c2s3_12 <- fte_p1c2s3_12
  j3j4_p1c2s3_12 <- cs_p1c2s3_12
  j4j3_p1c2s3_12 <- endcust12
  j1j2_p1c3s1_12 <- (ss_p1c3s1j1_12)*on_p1c3s1_12 + ds_p1c3s1_12
  j2j3_p1c3s1_12 <- fte_p1c3s1_12
  j3j4_p1c3s1_12 <- cs_p1c3s1_12
  j4j3_p1c3s1_12 <- endcust12
  j1j2_p1c3s2_12 <- (ss_p1c3s2j1_12)*on_p1c3s2_12 + ds_p1c3s2_12
  j2j3_p1c3s2_12 <- fte_p1c3s2_12
  j3j4_p1c3s2_12 <- cs_p1c3s2_12
  j4j3_p1c3s2_12 <- endcust12
  j1j2_p1c3s3_12 <- (ss_p1c3s3j1_12)*on_p1c3s3_12 + ds_p1c3s3_12
  j2j3_p1c3s3_12 <- fte_p1c3s3_12
  j3j4_p1c3s3_12 <- cs_p1c3s3_12
  j4j3_p1c3s3_12 <- endcust12
  j1j2_p1c4s1_12 <- (ss_p1c4s1j1_12)*on_p1c4s1_12 + ds_p1c4s1_12
  j2j3_p1c4s1_12 <- fte_p1c4s1_12
  j3j4_p1c4s1_12 <- cs_p1c4s1_12
  j4j3_p1c4s1_12 <- endcust12
  j1j2_p1c4s2_12 <- (ss_p1c4s2j1_12)*on_p1c4s2_12 + ds_p1c4s2_12
  j2j3_p1c4s2_12 <- fte_p1c4s2_12
  j3j4_p1c4s2_12 <- cs_p1c4s2_12
  j4j3_p1c4s2_12 <- endcust12
  j1j2_p1c4s3_12 <- (ss_p1c4s3j1_12)*on_p1c4s3_12 + ds_p1c4s3_12
  j2j3_p1c4s3_12 <- fte_p1c4s3_12
  j3j4_p1c4s3_12 <- cs_p1c4s3_12
  j4j3_p1c4s3_12 <- endcust12
  j1j2_p2c1s1_12 <- (ss_p2c1s1j1_12)*on_p2c1s1_12 + ds_p2c1s1_12
  j2j3_p2c1s1_12 <- fte_p2c1s1_12
  j3j4_p2c1s1_12 <- cs_p2c1s1_12
  j4j3_p2c1s1_12 <- endcust12
  j1j2_p2c1s2_12 <- (ss_p2c1s2j1_12)*on_p2c1s2_12 + ds_p2c1s2_12
  j2j3_p2c1s2_12 <- fte_p2c1s2_12
  j3j4_p2c1s2_12 <- cs_p2c1s2_12
  j4j3_p2c1s2_12 <- endcust12
  j1j2_p2c1s3_12 <- (ss_p2c1s3j1_12)*on_p2c1s3_12 + ds_p2c1s3_12
  j2j3_p2c1s3_12 <- fte_p2c1s3_12
  j3j4_p2c1s3_12 <- cs_p2c1s3_12
  j4j3_p2c1s3_12 <- endcust12
  j1j2_p2c2s1_12 <- (ss_p2c2s1j1_12)*on_p2c2s1_12 + ds_p2c2s1_12
  j2j3_p2c2s1_12 <- fte_p2c2s1_12
  j3j4_p2c2s1_12 <- cs_p2c2s1_12
  j4j3_p2c2s1_12 <- endcust12
  j1j2_p2c2s2_12 <- (ss_p2c2s2j1_12)*on_p2c2s2_12 + ds_p2c2s2_12
  j2j3_p2c2s2_12 <- fte_p2c2s2_12
  j3j4_p2c2s2_12 <- cs_p2c2s2_12
  j4j3_p2c2s2_12 <- endcust12
  j1j2_p2c2s3_12 <- (ss_p2c2s3j1_12)*on_p2c2s3_12 + ds_p2c2s3_12
  j2j3_p2c2s3_12 <- fte_p2c2s3_12
  j3j4_p2c2s3_12 <- cs_p2c2s3_12
  j4j3_p2c2s3_12 <- endcust12
  j1j2_p2c3s1_12 <- (ss_p2c3s1j1_12)*on_p2c3s1_12 + ds_p2c3s1_12
  j2j3_p2c3s1_12 <- fte_p2c3s1_12
  j3j4_p2c3s1_12 <- cs_p2c3s1_12
  j4j3_p2c3s1_12 <- endcust12
  j1j2_p2c3s2_12 <- (ss_p2c3s2j1_12)*on_p2c3s2_12 + ds_p2c3s2_12
  j2j3_p2c3s2_12 <- fte_p2c3s2_12
  j3j4_p2c3s2_12 <- cs_p2c3s2_12
  j4j3_p2c3s2_12 <- endcust12
  j1j2_p2c3s3_12 <- (ss_p2c3s3j1_12)*on_p2c3s3_12 + ds_p2c3s3_12
  j2j3_p2c3s3_12 <- fte_p2c3s3_12
  j3j4_p2c3s3_12 <- cs_p2c3s3_12
  j4j3_p2c3s3_12 <- endcust12
  j1j2_p2c4s1_12 <- (ss_p2c4s1j1_12)*on_p2c4s1_12 + ds_p2c4s1_12
  j2j3_p2c4s1_12 <- fte_p2c4s1_12
  j3j4_p2c4s1_12 <- cs_p2c4s1_12
  j4j3_p2c4s1_12 <- endcust12
  j1j2_p2c4s2_12 <- (ss_p2c4s2j1_12)*on_p2c4s2_12 + ds_p2c4s2_12
  j2j3_p2c4s2_12 <- fte_p2c4s2_12
  j3j4_p2c4s2_12 <- cs_p2c4s2_12
  j4j3_p2c4s2_12 <- endcust12
  j1j2_p2c4s3_12 <- (ss_p2c4s3j1_12)*on_p2c4s3_12 + ds_p2c4s3_12
  j2j3_p2c4s3_12 <- fte_p2c4s3_12
  j3j4_p2c4s3_12 <- cs_p2c4s3_12
  j4j3_p2c4s3_12 <- endcust12
  j1j2_p1c1s1_13 <- (ss_p1c1s1j1_13)*on_p1c1s1_13 + ds_p1c1s1_13
  j2j3_p1c1s1_13 <- fte_p1c1s1_13
  j3j4_p1c1s1_13 <- cs_p1c1s1_13
  j4j3_p1c1s1_13 <- endcust13
  j1j2_p1c1s2_13 <- (ss_p1c1s2j1_13)*on_p1c1s2_13 + ds_p1c1s2_13
  j2j3_p1c1s2_13 <- fte_p1c1s2_13
  j3j4_p1c1s2_13 <- cs_p1c1s2_13
  j4j3_p1c1s2_13 <- endcust13
  j1j2_p1c1s3_13 <- (ss_p1c1s3j1_13)*on_p1c1s3_13 + ds_p1c1s3_13
  j2j3_p1c1s3_13 <- fte_p1c1s3_13
  j3j4_p1c1s3_13 <- cs_p1c1s3_13
  j4j3_p1c1s3_13 <- endcust13
  j1j2_p1c2s1_13 <- (ss_p1c2s1j1_13)*on_p1c2s1_13 + ds_p1c2s1_13
  j2j3_p1c2s1_13 <- fte_p1c2s1_13
  j3j4_p1c2s1_13 <- cs_p1c2s1_13
  j4j3_p1c2s1_13 <- endcust13
  j1j2_p1c2s2_13 <- (ss_p1c2s2j1_13)*on_p1c2s2_13 + ds_p1c2s2_13
  j2j3_p1c2s2_13 <- fte_p1c2s2_13
  j3j4_p1c2s2_13 <- cs_p1c2s2_13
  j4j3_p1c2s2_13 <- endcust13
  j1j2_p1c2s3_13 <- (ss_p1c2s3j1_13)*on_p1c2s3_13 + ds_p1c2s3_13
  j2j3_p1c2s3_13 <- fte_p1c2s3_13
  j3j4_p1c2s3_13 <- cs_p1c2s3_13
  j4j3_p1c2s3_13 <- endcust13
  j1j2_p1c3s1_13 <- (ss_p1c3s1j1_13)*on_p1c3s1_13 + ds_p1c3s1_13
  j2j3_p1c3s1_13 <- fte_p1c3s1_13
  j3j4_p1c3s1_13 <- cs_p1c3s1_13
  j4j3_p1c3s1_13 <- endcust13
  j1j2_p1c3s2_13 <- (ss_p1c3s2j1_13)*on_p1c3s2_13 + ds_p1c3s2_13
  j2j3_p1c3s2_13 <- fte_p1c3s2_13
  j3j4_p1c3s2_13 <- cs_p1c3s2_13
  j4j3_p1c3s2_13 <- endcust13
  j1j2_p1c3s3_13 <- (ss_p1c3s3j1_13)*on_p1c3s3_13 + ds_p1c3s3_13
  j2j3_p1c3s3_13 <- fte_p1c3s3_13
  j3j4_p1c3s3_13 <- cs_p1c3s3_13
  j4j3_p1c3s3_13 <- endcust13
  j1j2_p1c4s1_13 <- (ss_p1c4s1j1_13)*on_p1c4s1_13 + ds_p1c4s1_13
  j2j3_p1c4s1_13 <- fte_p1c4s1_13
  j3j4_p1c4s1_13 <- cs_p1c4s1_13
  j4j3_p1c4s1_13 <- endcust13
  j1j2_p1c4s2_13 <- (ss_p1c4s2j1_13)*on_p1c4s2_13 + ds_p1c4s2_13
  j2j3_p1c4s2_13 <- fte_p1c4s2_13
  j3j4_p1c4s2_13 <- cs_p1c4s2_13
  j4j3_p1c4s2_13 <- endcust13
  j1j2_p1c4s3_13 <- (ss_p1c4s3j1_13)*on_p1c4s3_13 + ds_p1c4s3_13
  j2j3_p1c4s3_13 <- fte_p1c4s3_13
  j3j4_p1c4s3_13 <- cs_p1c4s3_13
  j4j3_p1c4s3_13 <- endcust13
  j1j2_p2c1s1_13 <- (ss_p2c1s1j1_13)*on_p2c1s1_13 + ds_p2c1s1_13
  j2j3_p2c1s1_13 <- fte_p2c1s1_13
  j3j4_p2c1s1_13 <- cs_p2c1s1_13
  j4j3_p2c1s1_13 <- endcust13
  j1j2_p2c1s2_13 <- (ss_p2c1s2j1_13)*on_p2c1s2_13 + ds_p2c1s2_13
  j2j3_p2c1s2_13 <- fte_p2c1s2_13
  j3j4_p2c1s2_13 <- cs_p2c1s2_13
  j4j3_p2c1s2_13 <- endcust13
  j1j2_p2c1s3_13 <- (ss_p2c1s3j1_13)*on_p2c1s3_13 + ds_p2c1s3_13
  j2j3_p2c1s3_13 <- fte_p2c1s3_13
  j3j4_p2c1s3_13 <- cs_p2c1s3_13
  j4j3_p2c1s3_13 <- endcust13
  j1j2_p2c2s1_13 <- (ss_p2c2s1j1_13)*on_p2c2s1_13 + ds_p2c2s1_13
  j2j3_p2c2s1_13 <- fte_p2c2s1_13
  j3j4_p2c2s1_13 <- cs_p2c2s1_13
  j4j3_p2c2s1_13 <- endcust13
  j1j2_p2c2s2_13 <- (ss_p2c2s2j1_13)*on_p2c2s2_13 + ds_p2c2s2_13
  j2j3_p2c2s2_13 <- fte_p2c2s2_13
  j3j4_p2c2s2_13 <- cs_p2c2s2_13
  j4j3_p2c2s2_13 <- endcust13
  j1j2_p2c2s3_13 <- (ss_p2c2s3j1_13)*on_p2c2s3_13 + ds_p2c2s3_13
  j2j3_p2c2s3_13 <- fte_p2c2s3_13
  j3j4_p2c2s3_13 <- cs_p2c2s3_13
  j4j3_p2c2s3_13 <- endcust13
  j1j2_p2c3s1_13 <- (ss_p2c3s1j1_13)*on_p2c3s1_13 + ds_p2c3s1_13
  j2j3_p2c3s1_13 <- fte_p2c3s1_13
  j3j4_p2c3s1_13 <- cs_p2c3s1_13
  j4j3_p2c3s1_13 <- endcust13
  j1j2_p2c3s2_13 <- (ss_p2c3s2j1_13)*on_p2c3s2_13 + ds_p2c3s2_13
  j2j3_p2c3s2_13 <- fte_p2c3s2_13
  j3j4_p2c3s2_13 <- cs_p2c3s2_13
  j4j3_p2c3s2_13 <- endcust13
  j1j2_p2c3s3_13 <- (ss_p2c3s3j1_13)*on_p2c3s3_13 + ds_p2c3s3_13
  j2j3_p2c3s3_13 <- fte_p2c3s3_13
  j3j4_p2c3s3_13 <- cs_p2c3s3_13
  j4j3_p2c3s3_13 <- endcust13
  j1j2_p2c4s1_13 <- (ss_p2c4s1j1_13)*on_p2c4s1_13 + ds_p2c4s1_13
  j2j3_p2c4s1_13 <- fte_p2c4s1_13
  j3j4_p2c4s1_13 <- cs_p2c4s1_13
  j4j3_p2c4s1_13 <- endcust13
  j1j2_p2c4s2_13 <- (ss_p2c4s2j1_13)*on_p2c4s2_13 + ds_p2c4s2_13
  j2j3_p2c4s2_13 <- fte_p2c4s2_13
  j3j4_p2c4s2_13 <- cs_p2c4s2_13
  j4j3_p2c4s2_13 <- endcust13
  j1j2_p2c4s3_13 <- (ss_p2c4s3j1_13)*on_p2c4s3_13 + ds_p2c4s3_13
  j2j3_p2c4s3_13 <- fte_p2c4s3_13
  j3j4_p2c4s3_13 <- cs_p2c4s3_13
  j4j3_p2c4s3_13 <- endcust13
  j1j2_p1c1s1_14 <- (ss_p1c1s1j1_14)*on_p1c1s1_14 + ds_p1c1s1_14
  j2j3_p1c1s1_14 <- fte_p1c1s1_14
  j3j4_p1c1s1_14 <- cs_p1c1s1_14
  j4j3_p1c1s1_14 <- endcust14
  j1j2_p1c1s2_14 <- (ss_p1c1s2j1_14)*on_p1c1s2_14 + ds_p1c1s2_14
  j2j3_p1c1s2_14 <- fte_p1c1s2_14
  j3j4_p1c1s2_14 <- cs_p1c1s2_14
  j4j3_p1c1s2_14 <- endcust14
  j1j2_p1c1s3_14 <- (ss_p1c1s3j1_14)*on_p1c1s3_14 + ds_p1c1s3_14
  j2j3_p1c1s3_14 <- fte_p1c1s3_14
  j3j4_p1c1s3_14 <- cs_p1c1s3_14
  j4j3_p1c1s3_14 <- endcust14
  j1j2_p1c2s1_14 <- (ss_p1c2s1j1_14)*on_p1c2s1_14 + ds_p1c2s1_14
  j2j3_p1c2s1_14 <- fte_p1c2s1_14
  j3j4_p1c2s1_14 <- cs_p1c2s1_14
  j4j3_p1c2s1_14 <- endcust14
  j1j2_p1c2s2_14 <- (ss_p1c2s2j1_14)*on_p1c2s2_14 + ds_p1c2s2_14
  j2j3_p1c2s2_14 <- fte_p1c2s2_14
  j3j4_p1c2s2_14 <- cs_p1c2s2_14
  j4j3_p1c2s2_14 <- endcust14
  j1j2_p1c2s3_14 <- (ss_p1c2s3j1_14)*on_p1c2s3_14 + ds_p1c2s3_14
  j2j3_p1c2s3_14 <- fte_p1c2s3_14
  j3j4_p1c2s3_14 <- cs_p1c2s3_14
  j4j3_p1c2s3_14 <- endcust14
  j1j2_p1c3s1_14 <- (ss_p1c3s1j1_14)*on_p1c3s1_14 + ds_p1c3s1_14
  j2j3_p1c3s1_14 <- fte_p1c3s1_14
  j3j4_p1c3s1_14 <- cs_p1c3s1_14
  j4j3_p1c3s1_14 <- endcust14
  j1j2_p1c3s2_14 <- (ss_p1c3s2j1_14)*on_p1c3s2_14 + ds_p1c3s2_14
  j2j3_p1c3s2_14 <- fte_p1c3s2_14
  j3j4_p1c3s2_14 <- cs_p1c3s2_14
  j4j3_p1c3s2_14 <- endcust14
  j1j2_p1c3s3_14 <- (ss_p1c3s3j1_14)*on_p1c3s3_14 + ds_p1c3s3_14
  j2j3_p1c3s3_14 <- fte_p1c3s3_14
  j3j4_p1c3s3_14 <- cs_p1c3s3_14
  j4j3_p1c3s3_14 <- endcust14
  j1j2_p1c4s1_14 <- (ss_p1c4s1j1_14)*on_p1c4s1_14 + ds_p1c4s1_14
  j2j3_p1c4s1_14 <- fte_p1c4s1_14
  j3j4_p1c4s1_14 <- cs_p1c4s1_14
  j4j3_p1c4s1_14 <- endcust14
  j1j2_p1c4s2_14 <- (ss_p1c4s2j1_14)*on_p1c4s2_14 + ds_p1c4s2_14
  j2j3_p1c4s2_14 <- fte_p1c4s2_14
  j3j4_p1c4s2_14 <- cs_p1c4s2_14
  j4j3_p1c4s2_14 <- endcust14
  j1j2_p1c4s3_14 <- (ss_p1c4s3j1_14)*on_p1c4s3_14 + ds_p1c4s3_14
  j2j3_p1c4s3_14 <- fte_p1c4s3_14
  j3j4_p1c4s3_14 <- cs_p1c4s3_14
  j4j3_p1c4s3_14 <- endcust14
  j1j2_p2c1s1_14 <- (ss_p2c1s1j1_14)*on_p2c1s1_14 + ds_p2c1s1_14
  j2j3_p2c1s1_14 <- fte_p2c1s1_14
  j3j4_p2c1s1_14 <- cs_p2c1s1_14
  j4j3_p2c1s1_14 <- endcust14
  j1j2_p2c1s2_14 <- (ss_p2c1s2j1_14)*on_p2c1s2_14 + ds_p2c1s2_14
  j2j3_p2c1s2_14 <- fte_p2c1s2_14
  j3j4_p2c1s2_14 <- cs_p2c1s2_14
  j4j3_p2c1s2_14 <- endcust14
  j1j2_p2c1s3_14 <- (ss_p2c1s3j1_14)*on_p2c1s3_14 + ds_p2c1s3_14
  j2j3_p2c1s3_14 <- fte_p2c1s3_14
  j3j4_p2c1s3_14 <- cs_p2c1s3_14
  j4j3_p2c1s3_14 <- endcust14
  j1j2_p2c2s1_14 <- (ss_p2c2s1j1_14)*on_p2c2s1_14 + ds_p2c2s1_14
  j2j3_p2c2s1_14 <- fte_p2c2s1_14
  j3j4_p2c2s1_14 <- cs_p2c2s1_14
  j4j3_p2c2s1_14 <- endcust14
  j1j2_p2c2s2_14 <- (ss_p2c2s2j1_14)*on_p2c2s2_14 + ds_p2c2s2_14
  j2j3_p2c2s2_14 <- fte_p2c2s2_14
  j3j4_p2c2s2_14 <- cs_p2c2s2_14
  j4j3_p2c2s2_14 <- endcust14
  j1j2_p2c2s3_14 <- (ss_p2c2s3j1_14)*on_p2c2s3_14 + ds_p2c2s3_14
  j2j3_p2c2s3_14 <- fte_p2c2s3_14
  j3j4_p2c2s3_14 <- cs_p2c2s3_14
  j4j3_p2c2s3_14 <- endcust14
  j1j2_p2c3s1_14 <- (ss_p2c3s1j1_14)*on_p2c3s1_14 + ds_p2c3s1_14
  j2j3_p2c3s1_14 <- fte_p2c3s1_14
  j3j4_p2c3s1_14 <- cs_p2c3s1_14
  j4j3_p2c3s1_14 <- endcust14
  j1j2_p2c3s2_14 <- (ss_p2c3s2j1_14)*on_p2c3s2_14 + ds_p2c3s2_14
  j2j3_p2c3s2_14 <- fte_p2c3s2_14
  j3j4_p2c3s2_14 <- cs_p2c3s2_14
  j4j3_p2c3s2_14 <- endcust14
  j1j2_p2c3s3_14 <- (ss_p2c3s3j1_14)*on_p2c3s3_14 + ds_p2c3s3_14
  j2j3_p2c3s3_14 <- fte_p2c3s3_14
  j3j4_p2c3s3_14 <- cs_p2c3s3_14
  j4j3_p2c3s3_14 <- endcust14
  j1j2_p2c4s1_14 <- (ss_p2c4s1j1_14)*on_p2c4s1_14 + ds_p2c4s1_14
  j2j3_p2c4s1_14 <- fte_p2c4s1_14
  j3j4_p2c4s1_14 <- cs_p2c4s1_14
  j4j3_p2c4s1_14 <- endcust14
  j1j2_p2c4s2_14 <- (ss_p2c4s2j1_14)*on_p2c4s2_14 + ds_p2c4s2_14
  j2j3_p2c4s2_14 <- fte_p2c4s2_14
  j3j4_p2c4s2_14 <- cs_p2c4s2_14
  j4j3_p2c4s2_14 <- endcust14
  j1j2_p2c4s3_14 <- (ss_p2c4s3j1_14)*on_p2c4s3_14 + ds_p2c4s3_14
  j2j3_p2c4s3_14 <- fte_p2c4s3_14
  j3j4_p2c4s3_14 <- cs_p2c4s3_14
  j4j3_p2c4s3_14 <- endcust14
  j1j2_p1c1s1_15 <- (ss_p1c1s1j1_15)*on_p1c1s1_15 + ds_p1c1s1_15
  j2j3_p1c1s1_15 <- fte_p1c1s1_15
  j3j4_p1c1s1_15 <- cs_p1c1s1_15
  j4j3_p1c1s1_15 <- endcust15
  j1j2_p1c1s2_15 <- (ss_p1c1s2j1_15)*on_p1c1s2_15 + ds_p1c1s2_15
  j2j3_p1c1s2_15 <- fte_p1c1s2_15
  j3j4_p1c1s2_15 <- cs_p1c1s2_15
  j4j3_p1c1s2_15 <- endcust15
  j1j2_p1c1s3_15 <- (ss_p1c1s3j1_15)*on_p1c1s3_15 + ds_p1c1s3_15
  j2j3_p1c1s3_15 <- fte_p1c1s3_15
  j3j4_p1c1s3_15 <- cs_p1c1s3_15
  j4j3_p1c1s3_15 <- endcust15
  j1j2_p1c2s1_15 <- (ss_p1c2s1j1_15)*on_p1c2s1_15 + ds_p1c2s1_15
  j2j3_p1c2s1_15 <- fte_p1c2s1_15
  j3j4_p1c2s1_15 <- cs_p1c2s1_15
  j4j3_p1c2s1_15 <- endcust15
  j1j2_p1c2s2_15 <- (ss_p1c2s2j1_15)*on_p1c2s2_15 + ds_p1c2s2_15
  j2j3_p1c2s2_15 <- fte_p1c2s2_15
  j3j4_p1c2s2_15 <- cs_p1c2s2_15
  j4j3_p1c2s2_15 <- endcust15
  j1j2_p1c2s3_15 <- (ss_p1c2s3j1_15)*on_p1c2s3_15 + ds_p1c2s3_15
  j2j3_p1c2s3_15 <- fte_p1c2s3_15
  j3j4_p1c2s3_15 <- cs_p1c2s3_15
  j4j3_p1c2s3_15 <- endcust15
  j1j2_p1c3s1_15 <- (ss_p1c3s1j1_15)*on_p1c3s1_15 + ds_p1c3s1_15
  j2j3_p1c3s1_15 <- fte_p1c3s1_15
  j3j4_p1c3s1_15 <- cs_p1c3s1_15
  j4j3_p1c3s1_15 <- endcust15
  j1j2_p1c3s2_15 <- (ss_p1c3s2j1_15)*on_p1c3s2_15 + ds_p1c3s2_15
  j2j3_p1c3s2_15 <- fte_p1c3s2_15
  j3j4_p1c3s2_15 <- cs_p1c3s2_15
  j4j3_p1c3s2_15 <- endcust15
  j1j2_p1c3s3_15 <- (ss_p1c3s3j1_15)*on_p1c3s3_15 + ds_p1c3s3_15
  j2j3_p1c3s3_15 <- fte_p1c3s3_15
  j3j4_p1c3s3_15 <- cs_p1c3s3_15
  j4j3_p1c3s3_15 <- endcust15
  j1j2_p1c4s1_15 <- (ss_p1c4s1j1_15)*on_p1c4s1_15 + ds_p1c4s1_15
  j2j3_p1c4s1_15 <- fte_p1c4s1_15
  j3j4_p1c4s1_15 <- cs_p1c4s1_15
  j4j3_p1c4s1_15 <- endcust15
  j1j2_p1c4s2_15 <- (ss_p1c4s2j1_15)*on_p1c4s2_15 + ds_p1c4s2_15
  j2j3_p1c4s2_15 <- fte_p1c4s2_15
  j3j4_p1c4s2_15 <- cs_p1c4s2_15
  j4j3_p1c4s2_15 <- endcust15
  j1j2_p1c4s3_15 <- (ss_p1c4s3j1_15)*on_p1c4s3_15 + ds_p1c4s3_15
  j2j3_p1c4s3_15 <- fte_p1c4s3_15
  j3j4_p1c4s3_15 <- cs_p1c4s3_15
  j4j3_p1c4s3_15 <- endcust15
  j1j2_p2c1s1_15 <- (ss_p2c1s1j1_15)*on_p2c1s1_15 + ds_p2c1s1_15
  j2j3_p2c1s1_15 <- fte_p2c1s1_15
  j3j4_p2c1s1_15 <- cs_p2c1s1_15
  j4j3_p2c1s1_15 <- endcust15
  j1j2_p2c1s2_15 <- (ss_p2c1s2j1_15)*on_p2c1s2_15 + ds_p2c1s2_15
  j2j3_p2c1s2_15 <- fte_p2c1s2_15
  j3j4_p2c1s2_15 <- cs_p2c1s2_15
  j4j3_p2c1s2_15 <- endcust15
  j1j2_p2c1s3_15 <- (ss_p2c1s3j1_15)*on_p2c1s3_15 + ds_p2c1s3_15
  j2j3_p2c1s3_15 <- fte_p2c1s3_15
  j3j4_p2c1s3_15 <- cs_p2c1s3_15
  j4j3_p2c1s3_15 <- endcust15
  j1j2_p2c2s1_15 <- (ss_p2c2s1j1_15)*on_p2c2s1_15 + ds_p2c2s1_15
  j2j3_p2c2s1_15 <- fte_p2c2s1_15
  j3j4_p2c2s1_15 <- cs_p2c2s1_15
  j4j3_p2c2s1_15 <- endcust15
  j1j2_p2c2s2_15 <- (ss_p2c2s2j1_15)*on_p2c2s2_15 + ds_p2c2s2_15
  j2j3_p2c2s2_15 <- fte_p2c2s2_15
  j3j4_p2c2s2_15 <- cs_p2c2s2_15
  j4j3_p2c2s2_15 <- endcust15
  j1j2_p2c2s3_15 <- (ss_p2c2s3j1_15)*on_p2c2s3_15 + ds_p2c2s3_15
  j2j3_p2c2s3_15 <- fte_p2c2s3_15
  j3j4_p2c2s3_15 <- cs_p2c2s3_15
  j4j3_p2c2s3_15 <- endcust15
  j1j2_p2c3s1_15 <- (ss_p2c3s1j1_15)*on_p2c3s1_15 + ds_p2c3s1_15
  j2j3_p2c3s1_15 <- fte_p2c3s1_15
  j3j4_p2c3s1_15 <- cs_p2c3s1_15
  j4j3_p2c3s1_15 <- endcust15
  j1j2_p2c3s2_15 <- (ss_p2c3s2j1_15)*on_p2c3s2_15 + ds_p2c3s2_15
  j2j3_p2c3s2_15 <- fte_p2c3s2_15
  j3j4_p2c3s2_15 <- cs_p2c3s2_15
  j4j3_p2c3s2_15 <- endcust15
  j1j2_p2c3s3_15 <- (ss_p2c3s3j1_15)*on_p2c3s3_15 + ds_p2c3s3_15
  j2j3_p2c3s3_15 <- fte_p2c3s3_15
  j3j4_p2c3s3_15 <- cs_p2c3s3_15
  j4j3_p2c3s3_15 <- endcust15
  j1j2_p2c4s1_15 <- (ss_p2c4s1j1_15)*on_p2c4s1_15 + ds_p2c4s1_15
  j2j3_p2c4s1_15 <- fte_p2c4s1_15
  j3j4_p2c4s1_15 <- cs_p2c4s1_15
  j4j3_p2c4s1_15 <- endcust15
  j1j2_p2c4s2_15 <- (ss_p2c4s2j1_15)*on_p2c4s2_15 + ds_p2c4s2_15
  j2j3_p2c4s2_15 <- fte_p2c4s2_15
  j3j4_p2c4s2_15 <- cs_p2c4s2_15
  j4j3_p2c4s2_15 <- endcust15
  j1j2_p2c4s3_15 <- (ss_p2c4s3j1_15)*on_p2c4s3_15 + ds_p2c4s3_15
  j2j3_p2c4s3_15 <- fte_p2c4s3_15
  j3j4_p2c4s3_15 <- cs_p2c4s3_15
  j4j3_p2c4s3_15 <- endcust15
  j1j2_p1c1s1_16 <- (ss_p1c1s1j1_16)*on_p1c1s1_16 + ds_p1c1s1_16
  j2j3_p1c1s1_16 <- fte_p1c1s1_16
  j3j4_p1c1s1_16 <- cs_p1c1s1_16
  j4j3_p1c1s1_16 <- endcust16
  j1j2_p1c1s2_16 <- (ss_p1c1s2j1_16)*on_p1c1s2_16 + ds_p1c1s2_16
  j2j3_p1c1s2_16 <- fte_p1c1s2_16
  j3j4_p1c1s2_16 <- cs_p1c1s2_16
  j4j3_p1c1s2_16 <- endcust16
  j1j2_p1c1s3_16 <- (ss_p1c1s3j1_16)*on_p1c1s3_16 + ds_p1c1s3_16
  j2j3_p1c1s3_16 <- fte_p1c1s3_16
  j3j4_p1c1s3_16 <- cs_p1c1s3_16
  j4j3_p1c1s3_16 <- endcust16
  j1j2_p1c2s1_16 <- (ss_p1c2s1j1_16)*on_p1c2s1_16 + ds_p1c2s1_16
  j2j3_p1c2s1_16 <- fte_p1c2s1_16
  j3j4_p1c2s1_16 <- cs_p1c2s1_16
  j4j3_p1c2s1_16 <- endcust16
  j1j2_p1c2s2_16 <- (ss_p1c2s2j1_16)*on_p1c2s2_16 + ds_p1c2s2_16
  j2j3_p1c2s2_16 <- fte_p1c2s2_16
  j3j4_p1c2s2_16 <- cs_p1c2s2_16
  j4j3_p1c2s2_16 <- endcust16
  j1j2_p1c2s3_16 <- (ss_p1c2s3j1_16)*on_p1c2s3_16 + ds_p1c2s3_16
  j2j3_p1c2s3_16 <- fte_p1c2s3_16
  j3j4_p1c2s3_16 <- cs_p1c2s3_16
  j4j3_p1c2s3_16 <- endcust16
  j1j2_p1c3s1_16 <- (ss_p1c3s1j1_16)*on_p1c3s1_16 + ds_p1c3s1_16
  j2j3_p1c3s1_16 <- fte_p1c3s1_16
  j3j4_p1c3s1_16 <- cs_p1c3s1_16
  j4j3_p1c3s1_16 <- endcust16
  j1j2_p1c3s2_16 <- (ss_p1c3s2j1_16)*on_p1c3s2_16 + ds_p1c3s2_16
  j2j3_p1c3s2_16 <- fte_p1c3s2_16
  j3j4_p1c3s2_16 <- cs_p1c3s2_16
  j4j3_p1c3s2_16 <- endcust16
  j1j2_p1c3s3_16 <- (ss_p1c3s3j1_16)*on_p1c3s3_16 + ds_p1c3s3_16
  j2j3_p1c3s3_16 <- fte_p1c3s3_16
  j3j4_p1c3s3_16 <- cs_p1c3s3_16
  j4j3_p1c3s3_16 <- endcust16
  j1j2_p1c4s1_16 <- (ss_p1c4s1j1_16)*on_p1c4s1_16 + ds_p1c4s1_16
  j2j3_p1c4s1_16 <- fte_p1c4s1_16
  j3j4_p1c4s1_16 <- cs_p1c4s1_16
  j4j3_p1c4s1_16 <- endcust16
  j1j2_p1c4s2_16 <- (ss_p1c4s2j1_16)*on_p1c4s2_16 + ds_p1c4s2_16
  j2j3_p1c4s2_16 <- fte_p1c4s2_16
  j3j4_p1c4s2_16 <- cs_p1c4s2_16
  j4j3_p1c4s2_16 <- endcust16
  j1j2_p1c4s3_16 <- (ss_p1c4s3j1_16)*on_p1c4s3_16 + ds_p1c4s3_16
  j2j3_p1c4s3_16 <- fte_p1c4s3_16
  j3j4_p1c4s3_16 <- cs_p1c4s3_16
  j4j3_p1c4s3_16 <- endcust16
  j1j2_p2c1s1_16 <- (ss_p2c1s1j1_16)*on_p2c1s1_16 + ds_p2c1s1_16
  j2j3_p2c1s1_16 <- fte_p2c1s1_16
  j3j4_p2c1s1_16 <- cs_p2c1s1_16
  j4j3_p2c1s1_16 <- endcust16
  j1j2_p2c1s2_16 <- (ss_p2c1s2j1_16)*on_p2c1s2_16 + ds_p2c1s2_16
  j2j3_p2c1s2_16 <- fte_p2c1s2_16
  j3j4_p2c1s2_16 <- cs_p2c1s2_16
  j4j3_p2c1s2_16 <- endcust16
  j1j2_p2c1s3_16 <- (ss_p2c1s3j1_16)*on_p2c1s3_16 + ds_p2c1s3_16
  j2j3_p2c1s3_16 <- fte_p2c1s3_16
  j3j4_p2c1s3_16 <- cs_p2c1s3_16
  j4j3_p2c1s3_16 <- endcust16
  j1j2_p2c2s1_16 <- (ss_p2c2s1j1_16)*on_p2c2s1_16 + ds_p2c2s1_16
  j2j3_p2c2s1_16 <- fte_p2c2s1_16
  j3j4_p2c2s1_16 <- cs_p2c2s1_16
  j4j3_p2c2s1_16 <- endcust16
  j1j2_p2c2s2_16 <- (ss_p2c2s2j1_16)*on_p2c2s2_16 + ds_p2c2s2_16
  j2j3_p2c2s2_16 <- fte_p2c2s2_16
  j3j4_p2c2s2_16 <- cs_p2c2s2_16
  j4j3_p2c2s2_16 <- endcust16
  j1j2_p2c2s3_16 <- (ss_p2c2s3j1_16)*on_p2c2s3_16 + ds_p2c2s3_16
  j2j3_p2c2s3_16 <- fte_p2c2s3_16
  j3j4_p2c2s3_16 <- cs_p2c2s3_16
  j4j3_p2c2s3_16 <- endcust16
  j1j2_p2c3s1_16 <- (ss_p2c3s1j1_16)*on_p2c3s1_16 + ds_p2c3s1_16
  j2j3_p2c3s1_16 <- fte_p2c3s1_16
  j3j4_p2c3s1_16 <- cs_p2c3s1_16
  j4j3_p2c3s1_16 <- endcust16
  j1j2_p2c3s2_16 <- (ss_p2c3s2j1_16)*on_p2c3s2_16 + ds_p2c3s2_16
  j2j3_p2c3s2_16 <- fte_p2c3s2_16
  j3j4_p2c3s2_16 <- cs_p2c3s2_16
  j4j3_p2c3s2_16 <- endcust16
  j1j2_p2c3s3_16 <- (ss_p2c3s3j1_16)*on_p2c3s3_16 + ds_p2c3s3_16
  j2j3_p2c3s3_16 <- fte_p2c3s3_16
  j3j4_p2c3s3_16 <- cs_p2c3s3_16
  j4j3_p2c3s3_16 <- endcust16
  j1j2_p2c4s1_16 <- (ss_p2c4s1j1_16)*on_p2c4s1_16 + ds_p2c4s1_16
  j2j3_p2c4s1_16 <- fte_p2c4s1_16
  j3j4_p2c4s1_16 <- cs_p2c4s1_16
  j4j3_p2c4s1_16 <- endcust16
  j1j2_p2c4s2_16 <- (ss_p2c4s2j1_16)*on_p2c4s2_16 + ds_p2c4s2_16
  j2j3_p2c4s2_16 <- fte_p2c4s2_16
  j3j4_p2c4s2_16 <- cs_p2c4s2_16
  j4j3_p2c4s2_16 <- endcust16
  j1j2_p2c4s3_16 <- (ss_p2c4s3j1_16)*on_p2c4s3_16 + ds_p2c4s3_16
  j2j3_p2c4s3_16 <- fte_p2c4s3_16
  j3j4_p2c4s3_16 <- cs_p2c4s3_16
  j4j3_p2c4s3_16 <- endcust16
  j1j2_p1c1s1_17 <- (ss_p1c1s1j1_17)*on_p1c1s1_17 + ds_p1c1s1_17
  j2j3_p1c1s1_17 <- fte_p1c1s1_17
  j3j4_p1c1s1_17 <- cs_p1c1s1_17
  j4j3_p1c1s1_17 <- endcust17
  j1j2_p1c1s2_17 <- (ss_p1c1s2j1_17)*on_p1c1s2_17 + ds_p1c1s2_17
  j2j3_p1c1s2_17 <- fte_p1c1s2_17
  j3j4_p1c1s2_17 <- cs_p1c1s2_17
  j4j3_p1c1s2_17 <- endcust17
  j1j2_p1c1s3_17 <- (ss_p1c1s3j1_17)*on_p1c1s3_17 + ds_p1c1s3_17
  j2j3_p1c1s3_17 <- fte_p1c1s3_17
  j3j4_p1c1s3_17 <- cs_p1c1s3_17
  j4j3_p1c1s3_17 <- endcust17
  j1j2_p1c2s1_17 <- (ss_p1c2s1j1_17)*on_p1c2s1_17 + ds_p1c2s1_17
  j2j3_p1c2s1_17 <- fte_p1c2s1_17
  j3j4_p1c2s1_17 <- cs_p1c2s1_17
  j4j3_p1c2s1_17 <- endcust17
  j1j2_p1c2s2_17 <- (ss_p1c2s2j1_17)*on_p1c2s2_17 + ds_p1c2s2_17
  j2j3_p1c2s2_17 <- fte_p1c2s2_17
  j3j4_p1c2s2_17 <- cs_p1c2s2_17
  j4j3_p1c2s2_17 <- endcust17
  j1j2_p1c2s3_17 <- (ss_p1c2s3j1_17)*on_p1c2s3_17 + ds_p1c2s3_17
  j2j3_p1c2s3_17 <- fte_p1c2s3_17
  j3j4_p1c2s3_17 <- cs_p1c2s3_17
  j4j3_p1c2s3_17 <- endcust17
  j1j2_p1c3s1_17 <- (ss_p1c3s1j1_17)*on_p1c3s1_17 + ds_p1c3s1_17
  j2j3_p1c3s1_17 <- fte_p1c3s1_17
  j3j4_p1c3s1_17 <- cs_p1c3s1_17
  j4j3_p1c3s1_17 <- endcust17
  j1j2_p1c3s2_17 <- (ss_p1c3s2j1_17)*on_p1c3s2_17 + ds_p1c3s2_17
  j2j3_p1c3s2_17 <- fte_p1c3s2_17
  j3j4_p1c3s2_17 <- cs_p1c3s2_17
  j4j3_p1c3s2_17 <- endcust17
  j1j2_p1c3s3_17 <- (ss_p1c3s3j1_17)*on_p1c3s3_17 + ds_p1c3s3_17
  j2j3_p1c3s3_17 <- fte_p1c3s3_17
  j3j4_p1c3s3_17 <- cs_p1c3s3_17
  j4j3_p1c3s3_17 <- endcust17
  j1j2_p1c4s1_17 <- (ss_p1c4s1j1_17)*on_p1c4s1_17 + ds_p1c4s1_17
  j2j3_p1c4s1_17 <- fte_p1c4s1_17
  j3j4_p1c4s1_17 <- cs_p1c4s1_17
  j4j3_p1c4s1_17 <- endcust17
  j1j2_p1c4s2_17 <- (ss_p1c4s2j1_17)*on_p1c4s2_17 + ds_p1c4s2_17
  j2j3_p1c4s2_17 <- fte_p1c4s2_17
  j3j4_p1c4s2_17 <- cs_p1c4s2_17
  j4j3_p1c4s2_17 <- endcust17
  j1j2_p1c4s3_17 <- (ss_p1c4s3j1_17)*on_p1c4s3_17 + ds_p1c4s3_17
  j2j3_p1c4s3_17 <- fte_p1c4s3_17
  j3j4_p1c4s3_17 <- cs_p1c4s3_17
  j4j3_p1c4s3_17 <- endcust17
  j1j2_p2c1s1_17 <- (ss_p2c1s1j1_17)*on_p2c1s1_17 + ds_p2c1s1_17
  j2j3_p2c1s1_17 <- fte_p2c1s1_17
  j3j4_p2c1s1_17 <- cs_p2c1s1_17
  j4j3_p2c1s1_17 <- endcust17
  j1j2_p2c1s2_17 <- (ss_p2c1s2j1_17)*on_p2c1s2_17 + ds_p2c1s2_17
  j2j3_p2c1s2_17 <- fte_p2c1s2_17
  j3j4_p2c1s2_17 <- cs_p2c1s2_17
  j4j3_p2c1s2_17 <- endcust17
  j1j2_p2c1s3_17 <- (ss_p2c1s3j1_17)*on_p2c1s3_17 + ds_p2c1s3_17
  j2j3_p2c1s3_17 <- fte_p2c1s3_17
  j3j4_p2c1s3_17 <- cs_p2c1s3_17
  j4j3_p2c1s3_17 <- endcust17
  j1j2_p2c2s1_17 <- (ss_p2c2s1j1_17)*on_p2c2s1_17 + ds_p2c2s1_17
  j2j3_p2c2s1_17 <- fte_p2c2s1_17
  j3j4_p2c2s1_17 <- cs_p2c2s1_17
  j4j3_p2c2s1_17 <- endcust17
  j1j2_p2c2s2_17 <- (ss_p2c2s2j1_17)*on_p2c2s2_17 + ds_p2c2s2_17
  j2j3_p2c2s2_17 <- fte_p2c2s2_17
  j3j4_p2c2s2_17 <- cs_p2c2s2_17
  j4j3_p2c2s2_17 <- endcust17
  j1j2_p2c2s3_17 <- (ss_p2c2s3j1_17)*on_p2c2s3_17 + ds_p2c2s3_17
  j2j3_p2c2s3_17 <- fte_p2c2s3_17
  j3j4_p2c2s3_17 <- cs_p2c2s3_17
  j4j3_p2c2s3_17 <- endcust17
  j1j2_p2c3s1_17 <- (ss_p2c3s1j1_17)*on_p2c3s1_17 + ds_p2c3s1_17
  j2j3_p2c3s1_17 <- fte_p2c3s1_17
  j3j4_p2c3s1_17 <- cs_p2c3s1_17
  j4j3_p2c3s1_17 <- endcust17
  j1j2_p2c3s2_17 <- (ss_p2c3s2j1_17)*on_p2c3s2_17 + ds_p2c3s2_17
  j2j3_p2c3s2_17 <- fte_p2c3s2_17
  j3j4_p2c3s2_17 <- cs_p2c3s2_17
  j4j3_p2c3s2_17 <- endcust17
  j1j2_p2c3s3_17 <- (ss_p2c3s3j1_17)*on_p2c3s3_17 + ds_p2c3s3_17
  j2j3_p2c3s3_17 <- fte_p2c3s3_17
  j3j4_p2c3s3_17 <- cs_p2c3s3_17
  j4j3_p2c3s3_17 <- endcust17
  j1j2_p2c4s1_17 <- (ss_p2c4s1j1_17)*on_p2c4s1_17 + ds_p2c4s1_17
  j2j3_p2c4s1_17 <- fte_p2c4s1_17
  j3j4_p2c4s1_17 <- cs_p2c4s1_17
  j4j3_p2c4s1_17 <- endcust17
  j1j2_p2c4s2_17 <- (ss_p2c4s2j1_17)*on_p2c4s2_17 + ds_p2c4s2_17
  j2j3_p2c4s2_17 <- fte_p2c4s2_17
  j3j4_p2c4s2_17 <- cs_p2c4s2_17
  j4j3_p2c4s2_17 <- endcust17
  j1j2_p2c4s3_17 <- (ss_p2c4s3j1_17)*on_p2c4s3_17 + ds_p2c4s3_17
  j2j3_p2c4s3_17 <- fte_p2c4s3_17
  j3j4_p2c4s3_17 <- cs_p2c4s3_17
  j4j3_p2c4s3_17 <- endcust17
  

  
  ##############################################################################################################################
  # DIFFERENTIAL EQUATIONS # # #  # # #
  ###############################################################################################################################
  
 
  deriv(P1C1S1J1_10) <- t10_p1c1s1j1*pc_p1*turn10 - age_up*P1C1S1J1_10_lag + r*P2C1S1J1_10 - f*P1C1S1J1_10- s1s2_p1c1j1_10*P1C1S1J1_10- (c1c2_p1s1j1_10+c1c3_p1s1j1_10)*P1C1S1J1_10- j1j2_p1c1s1_10*P1C1S1J1_10
  deriv(P1C1S1J2_10) <- t10_p1c1s1j2*pc_p1*turn10 - age_up*P1C1S1J2_10_lag + r*P2C1S1J2_10 - f*P1C1S1J2_10- s1s2_p1c1j2_10*P1C1S1J2_10- (c1c2_p1s1j2_10+c1c3_p1s1j2_10)*P1C1S1J2_10+ j1j2_p1c1s1_10*P1C1S1J1_10 - j2j3_p1c1s1_10*P1C1S1J2_10
  deriv(P1C1S1J3_10) <- -age_up*P1C1S1J3_10_lag + r*P2C1S1J3_10 - f*P1C1S1J3_10- s1s2_p1c1j3_10*P1C1S1J3_10- (c1c2_p1s1j3_10+c1c3_p1s1j3_10)*P1C1S1J3_10+ j2j3_p1c1s1_10*P1C1S1J2_10 + j4j3_p1c1s1_10*P1C1S1J4_10 - j3j4_p1c1s1_10*P1C1S1J3_10
  deriv(P1C1S1J4_10) <- -age_up*P1C1S1J4_10_lag + r*P2C1S1J4_10 - f*P1C1S1J4_10- s1s2_p1c1j4_10*P1C1S1J4_10- (c1c2_p1s1j4_10+c1c3_p1s1j4_10)*P1C1S1J4_10+ j3j4_p1c1s1_10*P1C1S1J3_10 - j4j3_p1c1s1_10*P1C1S1J4_10
  deriv(P1C1S2J1_10) <- t10_p1c1s2j1*pc_p1*turn10 - age_up*P1C1S2J1_10_lag + r*P2C1S2J1_10 - f*P1C1S2J1_10+ s1s2_p1c1j1_10*P1C1S1J1_10 - s2s3_p1c1j1_10*P1C1S2J1_10 + s3s2_p1c1j1_10*P1C1S3J1_10- (c1c2_p1s2j1_10+c1c3_p1s2j1_10)*P1C1S2J1_10- j1j2_p1c1s2_10*P1C1S2J1_10
  deriv(P1C1S2J2_10) <- t10_p1c1s2j2*pc_p1*turn10 - age_up*P1C1S2J2_10_lag + r*P2C1S2J2_10 - f*P1C1S2J2_10+ s1s2_p1c1j2_10*P1C1S1J2_10 - s2s3_p1c1j2_10*P1C1S2J2_10 + s3s2_p1c1j2_10*P1C1S3J2_10- (c1c2_p1s2j2_10+c1c3_p1s2j2_10)*P1C1S2J2_10+ j1j2_p1c1s2_10*P1C1S2J1_10 - j2j3_p1c1s2_10*P1C1S2J2_10
  deriv(P1C1S2J3_10) <- -age_up*P1C1S2J3_10_lag + r*P2C1S2J3_10 - f*P1C1S2J3_10+ s1s2_p1c1j3_10*P1C1S1J3_10 - s2s3_p1c1j3_10*P1C1S2J3_10 + s3s2_p1c1j3_10*P1C1S3J3_10- (c1c2_p1s2j3_10+c1c3_p1s2j3_10)*P1C1S2J3_10+ j2j3_p1c1s2_10*P1C1S2J2_10 + j4j3_p1c1s2_10*P1C1S2J4_10 - j3j4_p1c1s2_10*P1C1S2J3_10
  deriv(P1C1S2J4_10) <- -age_up*P1C1S2J4_10_lag + r*P2C1S2J4_10 - f*P1C1S2J4_10+ s1s2_p1c1j4_10*P1C1S1J4_10 - s2s3_p1c1j4_10*P1C1S2J4_10 + s3s2_p1c1j4_10*P1C1S3J4_10- (c1c2_p1s2j4_10+c1c3_p1s2j4_10)*P1C1S2J4_10+ j3j4_p1c1s2_10*P1C1S2J3_10 - j4j3_p1c1s2_10*P1C1S2J4_10
  deriv(P1C1S3J1_10) <- t10_p1c1s3j1*pc_p1*turn10 - age_up*P1C1S3J1_10_lag + r*P2C1S3J1_10 - f*P1C1S3J1_10+ s2s3_p1c1j1_10*P1C1S2J1_10 - s3s2_p1c1j1_10*P1C1S3J1_10- (c1c2_p1s3j1_10+c1c3_p1s3j1_10)*P1C1S3J1_10- j1j2_p1c1s3_10*P1C1S3J1_10
  deriv(P1C1S3J2_10) <- t10_p1c1s3j2*pc_p1*turn10 - age_up*P1C1S3J2_10_lag + r*P2C1S3J2_10 - f*P1C1S3J2_10+ s2s3_p1c1j2_10*P1C1S2J2_10 - s3s2_p1c1j2_10*P1C1S3J2_10- (c1c2_p1s3j2_10+c1c3_p1s3j2_10)*P1C1S3J2_10+ j1j2_p1c1s3_10*P1C1S3J1_10 - j2j3_p1c1s3_10*P1C1S3J2_10
  deriv(P1C1S3J3_10) <- -age_up*P1C1S3J3_10_lag + r*P2C1S3J3_10 - f*P1C1S3J3_10+ s2s3_p1c1j3_10*P1C1S2J3_10 - s3s2_p1c1j3_10*P1C1S3J3_10- (c1c2_p1s3j3_10+c1c3_p1s3j3_10)*P1C1S3J3_10+ j2j3_p1c1s3_10*P1C1S3J2_10 + j4j3_p1c1s3_10*P1C1S3J4_10 - j3j4_p1c1s3_10*P1C1S3J3_10
  deriv(P1C1S3J4_10) <- -age_up*P1C1S3J4_10_lag + r*P2C1S3J4_10 - f*P1C1S3J4_10+ s2s3_p1c1j4_10*P1C1S2J4_10 - s3s2_p1c1j4_10*P1C1S3J4_10- (c1c2_p1s3j4_10+c1c3_p1s3j4_10)*P1C1S3J4_10+ j3j4_p1c1s3_10*P1C1S3J3_10 - j4j3_p1c1s3_10*P1C1S3J4_10
  deriv(P1C2S1J1_10) <- t10_p1c2s1j1*pc_p1*turn10 - age_up*P1C2S1J1_10_lag + r*P2C2S1J1_10 - f*P1C2S1J1_10- s1s2_p1c2j1_10*P1C2S1J1_10+ c1c2_p1s1j1_10*P1C1S1J1_10 + c3c2_p1s1j1_10*P1C3S1J1_10 + c4c2_p1s1j1_10*P1C4S1J1_10 - (c2c3_p1s1j1_10+c2c4_p1s1j1_10)*P1C2S1J1_10- j1j2_p1c2s1_10*P1C2S1J1_10
  deriv(P1C2S1J2_10) <- t10_p1c2s1j2*pc_p1*turn10 - age_up*P1C2S1J2_10_lag + r*P2C2S1J2_10 - f*P1C2S1J2_10- s1s2_p1c2j2_10*P1C2S1J2_10+ c1c2_p1s1j2_10*P1C1S1J2_10 + c3c2_p1s1j2_10*P1C3S1J2_10 + c4c2_p1s1j2_10*P1C4S1J2_10 - (c2c3_p1s1j2_10+c2c4_p1s1j2_10)*P1C2S1J2_10+ j1j2_p1c2s1_10*P1C2S1J1_10 - j2j3_p1c2s1_10*P1C2S1J2_10
  deriv(P1C2S1J3_10) <- -age_up*P1C2S1J3_10_lag + r*P2C2S1J3_10 - f*P1C2S1J3_10- s1s2_p1c2j3_10*P1C2S1J3_10+ c1c2_p1s1j3_10*P1C1S1J3_10 + c3c2_p1s1j3_10*P1C3S1J3_10 + c4c2_p1s1j3_10*P1C4S1J3_10 - (c2c3_p1s1j3_10+c2c4_p1s1j3_10)*P1C2S1J3_10+ j2j3_p1c2s1_10*P1C2S1J2_10 + j4j3_p1c2s1_10*P1C2S1J4_10 - j3j4_p1c2s1_10*P1C2S1J3_10
  deriv(P1C2S1J4_10) <- -age_up*P1C2S1J4_10_lag + r*P2C2S1J4_10 - f*P1C2S1J4_10- s1s2_p1c2j4_10*P1C2S1J4_10+ c1c2_p1s1j4_10*P1C1S1J4_10 + c3c2_p1s1j4_10*P1C3S1J4_10 + c4c2_p1s1j4_10*P1C4S1J4_10 - (c2c3_p1s1j4_10+c2c4_p1s1j4_10)*P1C2S1J4_10+ j3j4_p1c2s1_10*P1C2S1J3_10 - j4j3_p1c2s1_10*P1C2S1J4_10
  deriv(P1C2S2J1_10) <- t10_p1c2s2j1*pc_p1*turn10 - age_up*P1C2S2J1_10_lag + r*P2C2S2J1_10 - f*P1C2S2J1_10+ s1s2_p1c2j1_10*P1C2S1J1_10 - s2s3_p1c2j1_10*P1C2S2J1_10 + s3s2_p1c2j1_10*P1C2S3J1_10+ c1c2_p1s2j1_10*P1C1S2J1_10 + c3c2_p1s2j1_10*P1C3S2J1_10 + c4c2_p1s2j1_10*P1C4S2J1_10 - (c2c3_p1s2j1_10+c2c4_p1s2j1_10)*P1C2S2J1_10- j1j2_p1c2s2_10*P1C2S2J1_10
  deriv(P1C2S2J2_10) <- t10_p1c2s2j2*pc_p1*turn10 - age_up*P1C2S2J2_10_lag + r*P2C2S2J2_10 - f*P1C2S2J2_10+ s1s2_p1c2j2_10*P1C2S1J2_10 - s2s3_p1c2j2_10*P1C2S2J2_10 + s3s2_p1c2j2_10*P1C2S3J2_10+ c1c2_p1s2j2_10*P1C1S2J2_10 + c3c2_p1s2j2_10*P1C3S2J2_10 + c4c2_p1s2j2_10*P1C4S2J2_10 - (c2c3_p1s2j2_10+c2c4_p1s2j2_10)*P1C2S2J2_10+ j1j2_p1c2s2_10*P1C2S2J1_10 - j2j3_p1c2s2_10*P1C2S2J2_10
  deriv(P1C2S2J3_10) <- -age_up*P1C2S2J3_10_lag + r*P2C2S2J3_10 - f*P1C2S2J3_10+ s1s2_p1c2j3_10*P1C2S1J3_10 - s2s3_p1c2j3_10*P1C2S2J3_10 + s3s2_p1c2j3_10*P1C2S3J3_10+ c1c2_p1s2j3_10*P1C1S2J3_10 + c3c2_p1s2j3_10*P1C3S2J3_10 + c4c2_p1s2j3_10*P1C4S2J3_10 - (c2c3_p1s2j3_10+c2c4_p1s2j3_10)*P1C2S2J3_10+ j2j3_p1c2s2_10*P1C2S2J2_10 + j4j3_p1c2s2_10*P1C2S2J4_10 - j3j4_p1c2s2_10*P1C2S2J3_10
  deriv(P1C2S2J4_10) <- -age_up*P1C2S2J4_10_lag + r*P2C2S2J4_10 - f*P1C2S2J4_10+ s1s2_p1c2j4_10*P1C2S1J4_10 - s2s3_p1c2j4_10*P1C2S2J4_10 + s3s2_p1c2j4_10*P1C2S3J4_10+ c1c2_p1s2j4_10*P1C1S2J4_10 + c3c2_p1s2j4_10*P1C3S2J4_10 + c4c2_p1s2j4_10*P1C4S2J4_10 - (c2c3_p1s2j4_10+c2c4_p1s2j4_10)*P1C2S2J4_10+ j3j4_p1c2s2_10*P1C2S2J3_10 - j4j3_p1c2s2_10*P1C2S2J4_10
  deriv(P1C2S3J1_10) <- t10_p1c2s3j1*pc_p1*turn10 - age_up*P1C2S3J1_10_lag + r*P2C2S3J1_10 - f*P1C2S3J1_10+ s2s3_p1c2j1_10*P1C2S2J1_10 - s3s2_p1c2j1_10*P1C2S3J1_10+ c1c2_p1s3j1_10*P1C1S3J1_10 + c3c2_p1s3j1_10*P1C3S3J1_10 + c4c2_p1s3j1_10*P1C4S3J1_10 - (c2c3_p1s3j1_10+c2c4_p1s3j1_10)*P1C2S3J1_10- j1j2_p1c2s3_10*P1C2S3J1_10
  deriv(P1C2S3J2_10) <- t10_p1c2s3j2*pc_p1*turn10 - age_up*P1C2S3J2_10_lag + r*P2C2S3J2_10 - f*P1C2S3J2_10+ s2s3_p1c2j2_10*P1C2S2J2_10 - s3s2_p1c2j2_10*P1C2S3J2_10+ c1c2_p1s3j2_10*P1C1S3J2_10 + c3c2_p1s3j2_10*P1C3S3J2_10 + c4c2_p1s3j2_10*P1C4S3J2_10 - (c2c3_p1s3j2_10+c2c4_p1s3j2_10)*P1C2S3J2_10+ j1j2_p1c2s3_10*P1C2S3J1_10 - j2j3_p1c2s3_10*P1C2S3J2_10
  deriv(P1C2S3J3_10) <- -age_up*P1C2S3J3_10_lag + r*P2C2S3J3_10 - f*P1C2S3J3_10+ s2s3_p1c2j3_10*P1C2S2J3_10 - s3s2_p1c2j3_10*P1C2S3J3_10+ c1c2_p1s3j3_10*P1C1S3J3_10 + c3c2_p1s3j3_10*P1C3S3J3_10 + c4c2_p1s3j3_10*P1C4S3J3_10 - (c2c3_p1s3j3_10+c2c4_p1s3j3_10)*P1C2S3J3_10+ j2j3_p1c2s3_10*P1C2S3J2_10 + j4j3_p1c2s3_10*P1C2S3J4_10 - j3j4_p1c2s3_10*P1C2S3J3_10
  deriv(P1C2S3J4_10) <- -age_up*P1C2S3J4_10_lag + r*P2C2S3J4_10 - f*P1C2S3J4_10+ s2s3_p1c2j4_10*P1C2S2J4_10 - s3s2_p1c2j4_10*P1C2S3J4_10+ c1c2_p1s3j4_10*P1C1S3J4_10 + c3c2_p1s3j4_10*P1C3S3J4_10 + c4c2_p1s3j4_10*P1C4S3J4_10 - (c2c3_p1s3j4_10+c2c4_p1s3j4_10)*P1C2S3J4_10+ j3j4_p1c2s3_10*P1C2S3J3_10 - j4j3_p1c2s3_10*P1C2S3J4_10
  deriv(P1C3S1J1_10) <- t10_p1c3s1j1*pc_p1*turn10 - age_up*P1C3S1J1_10_lag + r*P2C3S1J1_10 - f*P1C3S1J1_10- s1s2_p1c3j1_10*P1C3S1J1_10+ c1c3_p1s1j1_10*P1C1S1J1_10+ c2c3_p1s1j1_10*P1C2S1J1_10 + c4c3_p1s1j1_10*P1C4S1J1_10 - (c3c2_p1s1j1_10+c3c4_p1s1j1_10)*P1C3S1J1_10- j1j2_p1c3s1_10*P1C3S1J1_10
  deriv(P1C3S1J2_10) <- t10_p1c3s1j2*pc_p1*turn10 - age_up*P1C3S1J2_10_lag + r*P2C3S1J2_10 - f*P1C3S1J2_10- s1s2_p1c3j2_10*P1C3S1J2_10+ c1c3_p1s1j2_10*P1C1S1J2_10+ c2c3_p1s1j2_10*P1C2S1J2_10 + c4c3_p1s1j2_10*P1C4S1J2_10 - (c3c2_p1s1j2_10+c3c4_p1s1j2_10)*P1C3S1J2_10+ j1j2_p1c3s1_10*P1C3S1J1_10 - j2j3_p1c3s1_10*P1C3S1J2_10
  deriv(P1C3S1J3_10) <- -age_up*P1C3S1J3_10_lag + r*P2C3S1J3_10 - f*P1C3S1J3_10- s1s2_p1c3j3_10*P1C3S1J3_10+ c1c3_p1s1j3_10*P1C1S1J3_10+ c2c3_p1s1j3_10*P1C2S1J3_10 + c4c3_p1s1j3_10*P1C4S1J3_10 - (c3c2_p1s1j3_10+c3c4_p1s1j3_10)*P1C3S1J3_10+ j2j3_p1c3s1_10*P1C3S1J2_10 + j4j3_p1c3s1_10*P1C3S1J4_10 - j3j4_p1c3s1_10*P1C3S1J3_10
  deriv(P1C3S1J4_10) <- -age_up*P1C3S1J4_10_lag + r*P2C3S1J4_10 - f*P1C3S1J4_10- s1s2_p1c3j4_10*P1C3S1J4_10+ c1c3_p1s1j4_10*P1C1S1J4_10+ c2c3_p1s1j4_10*P1C2S1J4_10 + c4c3_p1s1j4_10*P1C4S1J4_10 - (c3c2_p1s1j4_10+c3c4_p1s1j4_10)*P1C3S1J4_10+ j3j4_p1c3s1_10*P1C3S1J3_10 - j4j3_p1c3s1_10*P1C3S1J4_10
  deriv(P1C3S2J1_10) <- t10_p1c3s2j1*pc_p1*turn10 - age_up*P1C3S2J1_10_lag + r*P2C3S2J1_10 - f*P1C3S2J1_10+ s1s2_p1c3j1_10*P1C3S1J1_10 - s2s3_p1c3j1_10*P1C3S2J1_10 + s3s2_p1c3j1_10*P1C3S3J1_10+ c1c3_p1s2j1_10*P1C1S2J1_10+ c2c3_p1s2j1_10*P1C2S2J1_10 + c4c3_p1s2j1_10*P1C4S2J1_10 - (c3c2_p1s2j1_10+c3c4_p1s2j1_10)*P1C3S2J1_10- j1j2_p1c3s2_10*P1C3S2J1_10
  deriv(P1C3S2J2_10) <- t10_p1c3s2j2*pc_p1*turn10 - age_up*P1C3S2J2_10_lag + r*P2C3S2J2_10 - f*P1C3S2J2_10+ s1s2_p1c3j2_10*P1C3S1J2_10 - s2s3_p1c3j2_10*P1C3S2J2_10 + s3s2_p1c3j2_10*P1C3S3J2_10+ c1c3_p1s2j2_10*P1C1S2J2_10+ c2c3_p1s2j2_10*P1C2S2J2_10 + c4c3_p1s2j2_10*P1C4S2J2_10 - (c3c2_p1s2j2_10+c3c4_p1s2j2_10)*P1C3S2J2_10+ j1j2_p1c3s2_10*P1C3S2J1_10 - j2j3_p1c3s2_10*P1C3S2J2_10
  deriv(P1C3S2J3_10) <- -age_up*P1C3S2J3_10_lag + r*P2C3S2J3_10 - f*P1C3S2J3_10+ s1s2_p1c3j3_10*P1C3S1J3_10 - s2s3_p1c3j3_10*P1C3S2J3_10 + s3s2_p1c3j3_10*P1C3S3J3_10+ c1c3_p1s2j3_10*P1C1S2J3_10+ c2c3_p1s2j3_10*P1C2S2J3_10 + c4c3_p1s2j3_10*P1C4S2J3_10 - (c3c2_p1s2j3_10+c3c4_p1s2j3_10)*P1C3S2J3_10+ j2j3_p1c3s2_10*P1C3S2J2_10 + j4j3_p1c3s2_10*P1C3S2J4_10 - j3j4_p1c3s2_10*P1C3S2J3_10
  deriv(P1C3S2J4_10) <- -age_up*P1C3S2J4_10_lag + r*P2C3S2J4_10 - f*P1C3S2J4_10+ s1s2_p1c3j4_10*P1C3S1J4_10 - s2s3_p1c3j4_10*P1C3S2J4_10 + s3s2_p1c3j4_10*P1C3S3J4_10+ c1c3_p1s2j4_10*P1C1S2J4_10+ c2c3_p1s2j4_10*P1C2S2J4_10 + c4c3_p1s2j4_10*P1C4S2J4_10 - (c3c2_p1s2j4_10+c3c4_p1s2j4_10)*P1C3S2J4_10+ j3j4_p1c3s2_10*P1C3S2J3_10 - j4j3_p1c3s2_10*P1C3S2J4_10
  deriv(P1C3S3J1_10) <- t10_p1c3s3j1*pc_p1*turn10 - age_up*P1C3S3J1_10_lag + r*P2C3S3J1_10 - f*P1C3S3J1_10+ s2s3_p1c3j1_10*P1C3S2J1_10 - s3s2_p1c3j1_10*P1C3S3J1_10+ c1c3_p1s3j1_10*P1C1S3J1_10+ c2c3_p1s3j1_10*P1C2S3J1_10 + c4c3_p1s3j1_10*P1C4S3J1_10 - (c3c2_p1s3j1_10+c3c4_p1s3j1_10)*P1C3S3J1_10- j1j2_p1c3s3_10*P1C3S3J1_10
  deriv(P1C3S3J2_10) <- t10_p1c3s3j2*pc_p1*turn10 - age_up*P1C3S3J2_10_lag + r*P2C3S3J2_10 - f*P1C3S3J2_10+ s2s3_p1c3j2_10*P1C3S2J2_10 - s3s2_p1c3j2_10*P1C3S3J2_10+ c1c3_p1s3j2_10*P1C1S3J2_10+ c2c3_p1s3j2_10*P1C2S3J2_10 + c4c3_p1s3j2_10*P1C4S3J2_10 - (c3c2_p1s3j2_10+c3c4_p1s3j2_10)*P1C3S3J2_10+ j1j2_p1c3s3_10*P1C3S3J1_10 - j2j3_p1c3s3_10*P1C3S3J2_10
  deriv(P1C3S3J3_10) <- -age_up*P1C3S3J3_10_lag + r*P2C3S3J3_10 - f*P1C3S3J3_10+ s2s3_p1c3j3_10*P1C3S2J3_10 - s3s2_p1c3j3_10*P1C3S3J3_10+ c1c3_p1s3j3_10*P1C1S3J3_10+ c2c3_p1s3j3_10*P1C2S3J3_10 + c4c3_p1s3j3_10*P1C4S3J3_10 - (c3c2_p1s3j3_10+c3c4_p1s3j3_10)*P1C3S3J3_10+ j2j3_p1c3s3_10*P1C3S3J2_10 + j4j3_p1c3s3_10*P1C3S3J4_10 - j3j4_p1c3s3_10*P1C3S3J3_10
  deriv(P1C3S3J4_10) <- -age_up*P1C3S3J4_10_lag + r*P2C3S3J4_10 - f*P1C3S3J4_10+ s2s3_p1c3j4_10*P1C3S2J4_10 - s3s2_p1c3j4_10*P1C3S3J4_10+ c1c3_p1s3j4_10*P1C1S3J4_10+ c2c3_p1s3j4_10*P1C2S3J4_10 + c4c3_p1s3j4_10*P1C4S3J4_10 - (c3c2_p1s3j4_10+c3c4_p1s3j4_10)*P1C3S3J4_10+ j3j4_p1c3s3_10*P1C3S3J3_10 - j4j3_p1c3s3_10*P1C3S3J4_10
  deriv(P1C4S1J1_10) <- t10_p1c4s1j1*pc_p1*turn10 - age_up*P1C4S1J1_10_lag + r*P2C4S1J1_10 - f*P1C4S1J1_10- s1s2_p1c4j1_10*P1C4S1J1_10+ c2c4_p1s1j1_10*P1C2S1J1_10 + c3c4_p1s1j1_10*P1C3S1J1_10- (c4c2_p1s1j1_10+c4c3_p1s1j1_10)*P1C4S1J1_10- j1j2_p1c4s1_10*P1C4S1J1_10
  deriv(P1C4S1J2_10) <- t10_p1c4s1j2*pc_p1*turn10 - age_up*P1C4S1J2_10_lag + r*P2C4S1J2_10 - f*P1C4S1J2_10- s1s2_p1c4j2_10*P1C4S1J2_10+ c2c4_p1s1j2_10*P1C2S1J2_10 + c3c4_p1s1j2_10*P1C3S1J2_10- (c4c2_p1s1j2_10+c4c3_p1s1j2_10)*P1C4S1J2_10+ j1j2_p1c4s1_10*P1C4S1J1_10 - j2j3_p1c4s1_10*P1C4S1J2_10
  deriv(P1C4S1J3_10) <- -age_up*P1C4S1J3_10_lag + r*P2C4S1J3_10 - f*P1C4S1J3_10- s1s2_p1c4j3_10*P1C4S1J3_10+ c2c4_p1s1j3_10*P1C2S1J3_10 + c3c4_p1s1j3_10*P1C3S1J3_10- (c4c2_p1s1j3_10+c4c3_p1s1j3_10)*P1C4S1J3_10+ j2j3_p1c4s1_10*P1C4S1J2_10 + j4j3_p1c4s1_10*P1C4S1J4_10 - j3j4_p1c4s1_10*P1C4S1J3_10
  deriv(P1C4S1J4_10) <- -age_up*P1C4S1J4_10_lag + r*P2C4S1J4_10 - f*P1C4S1J4_10- s1s2_p1c4j4_10*P1C4S1J4_10+ c2c4_p1s1j4_10*P1C2S1J4_10 + c3c4_p1s1j4_10*P1C3S1J4_10- (c4c2_p1s1j4_10+c4c3_p1s1j4_10)*P1C4S1J4_10+ j3j4_p1c4s1_10*P1C4S1J3_10 - j4j3_p1c4s1_10*P1C4S1J4_10
  deriv(P1C4S2J1_10) <- t10_p1c4s2j1*pc_p1*turn10 - age_up*P1C4S2J1_10_lag + r*P2C4S2J1_10 - f*P1C4S2J1_10+ s1s2_p1c4j1_10*P1C4S1J1_10 - s2s3_p1c4j1_10*P1C4S2J1_10 + s3s2_p1c4j1_10*P1C4S3J1_10+ c2c4_p1s2j1_10*P1C2S2J1_10 + c3c4_p1s2j1_10*P1C3S2J1_10- (c4c2_p1s2j1_10+c4c3_p1s2j1_10)*P1C4S2J1_10- j1j2_p1c4s2_10*P1C4S2J1_10
  deriv(P1C4S2J2_10) <- t10_p1c4s2j2*pc_p1*turn10 - age_up*P1C4S2J2_10_lag + r*P2C4S2J2_10 - f*P1C4S2J2_10+ s1s2_p1c4j2_10*P1C4S1J2_10 - s2s3_p1c4j2_10*P1C4S2J2_10 + s3s2_p1c4j2_10*P1C4S3J2_10+ c2c4_p1s2j2_10*P1C2S2J2_10 + c3c4_p1s2j2_10*P1C3S2J2_10- (c4c2_p1s2j2_10+c4c3_p1s2j2_10)*P1C4S2J2_10+ j1j2_p1c4s2_10*P1C4S2J1_10 - j2j3_p1c4s2_10*P1C4S2J2_10
  deriv(P1C4S2J3_10) <- -age_up*P1C4S2J3_10_lag + r*P2C4S2J3_10 - f*P1C4S2J3_10+ s1s2_p1c4j3_10*P1C4S1J3_10 - s2s3_p1c4j3_10*P1C4S2J3_10 + s3s2_p1c4j3_10*P1C4S3J3_10+ c2c4_p1s2j3_10*P1C2S2J3_10 + c3c4_p1s2j3_10*P1C3S2J3_10- (c4c2_p1s2j3_10+c4c3_p1s2j3_10)*P1C4S2J3_10+ j2j3_p1c4s2_10*P1C4S2J2_10 + j4j3_p1c4s2_10*P1C4S2J4_10 - j3j4_p1c4s2_10*P1C4S2J3_10
  deriv(P1C4S2J4_10) <- -age_up*P1C4S2J4_10_lag + r*P2C4S2J4_10 - f*P1C4S2J4_10+ s1s2_p1c4j4_10*P1C4S1J4_10 - s2s3_p1c4j4_10*P1C4S2J4_10 + s3s2_p1c4j4_10*P1C4S3J4_10+ c2c4_p1s2j4_10*P1C2S2J4_10 + c3c4_p1s2j4_10*P1C3S2J4_10- (c4c2_p1s2j4_10+c4c3_p1s2j4_10)*P1C4S2J4_10+ j3j4_p1c4s2_10*P1C4S2J3_10 - j4j3_p1c4s2_10*P1C4S2J4_10
  deriv(P1C4S3J1_10) <- t10_p1c4s3j1*pc_p1*turn10 - age_up*P1C4S3J1_10_lag + r*P2C4S3J1_10 - f*P1C4S3J1_10+ s2s3_p1c4j1_10*P1C4S2J1_10 - s3s2_p1c4j1_10*P1C4S3J1_10+ c2c4_p1s3j1_10*P1C2S3J1_10 + c3c4_p1s3j1_10*P1C3S3J1_10- (c4c2_p1s3j1_10+c4c3_p1s3j1_10)*P1C4S3J1_10- j1j2_p1c4s3_10*P1C4S3J1_10
  deriv(P1C4S3J2_10) <- t10_p1c4s3j2*pc_p1*turn10 - age_up*P1C4S3J2_10_lag + r*P2C4S3J2_10 - f*P1C4S3J2_10+ s2s3_p1c4j2_10*P1C4S2J2_10 - s3s2_p1c4j2_10*P1C4S3J2_10+ c2c4_p1s3j2_10*P1C2S3J2_10 + c3c4_p1s3j2_10*P1C3S3J2_10- (c4c2_p1s3j2_10+c4c3_p1s3j2_10)*P1C4S3J2_10+ j1j2_p1c4s3_10*P1C4S3J1_10 - j2j3_p1c4s3_10*P1C4S3J2_10
  deriv(P1C4S3J3_10) <- -age_up*P1C4S3J3_10_lag + r*P2C4S3J3_10 - f*P1C4S3J3_10+ s2s3_p1c4j3_10*P1C4S2J3_10 - s3s2_p1c4j3_10*P1C4S3J3_10+ c2c4_p1s3j3_10*P1C2S3J3_10 + c3c4_p1s3j3_10*P1C3S3J3_10- (c4c2_p1s3j3_10+c4c3_p1s3j3_10)*P1C4S3J3_10+ j2j3_p1c4s3_10*P1C4S3J2_10 + j4j3_p1c4s3_10*P1C4S3J4_10 - j3j4_p1c4s3_10*P1C4S3J3_10
  deriv(P1C4S3J4_10) <- -age_up*P1C4S3J4_10_lag + r*P2C4S3J4_10 - f*P1C4S3J4_10+ s2s3_p1c4j4_10*P1C4S2J4_10 - s3s2_p1c4j4_10*P1C4S3J4_10+ c2c4_p1s3j4_10*P1C2S3J4_10 + c3c4_p1s3j4_10*P1C3S3J4_10- (c4c2_p1s3j4_10+c4c3_p1s3j4_10)*P1C4S3J4_10+ j3j4_p1c4s3_10*P1C4S3J3_10 - j4j3_p1c4s3_10*P1C4S3J4_10
  deriv(P2C1S1J1_10) <- t10_p2c1s1j1*pc_p2*turn10 - age_up*P2C1S1J1_10_lag  + f*P1C1S1J1_10 - r*P2C1S1J1_10- s1s2_p2c1j1_10*P2C1S1J1_10- (c1c2_p2s1j1_10+c1c3_p2s1j1_10)*P2C1S1J1_10- j1j2_p2c1s1_10*P2C1S1J1_10
  deriv(P2C1S1J2_10) <- t10_p2c1s1j2*pc_p2*turn10 - age_up*P2C1S1J2_10_lag  + f*P1C1S1J2_10 - r*P2C1S1J2_10- s1s2_p2c1j2_10*P2C1S1J2_10- (c1c2_p2s1j2_10+c1c3_p2s1j2_10)*P2C1S1J2_10+ j1j2_p2c1s1_10*P2C1S1J1_10 - j2j3_p2c1s1_10*P2C1S1J2_10
  deriv(P2C1S1J3_10) <- -age_up*P2C1S1J3_10_lag  + f*P1C1S1J3_10 - r*P2C1S1J3_10- s1s2_p2c1j3_10*P2C1S1J3_10- (c1c2_p2s1j3_10+c1c3_p2s1j3_10)*P2C1S1J3_10+ j2j3_p2c1s1_10*P2C1S1J2_10 + j4j3_p2c1s1_10*P2C1S1J4_10 - j3j4_p2c1s1_10*P2C1S1J3_10
  deriv(P2C1S1J4_10) <- -age_up*P2C1S1J4_10_lag  + f*P1C1S1J4_10 - r*P2C1S1J4_10- s1s2_p2c1j4_10*P2C1S1J4_10- (c1c2_p2s1j4_10+c1c3_p2s1j4_10)*P2C1S1J4_10+ j3j4_p2c1s1_10*P2C1S1J3_10 - j4j3_p2c1s1_10*P2C1S1J4_10
  deriv(P2C1S2J1_10) <- t10_p2c1s2j1*pc_p2*turn10 - age_up*P2C1S2J1_10_lag  + f*P1C1S2J1_10 - r*P2C1S2J1_10+ s1s2_p2c1j1_10*P2C1S1J1_10 - s2s3_p2c1j1_10*P2C1S2J1_10 + s3s2_p2c1j1_10*P2C1S3J1_10- (c1c2_p2s2j1_10+c1c3_p2s2j1_10)*P2C1S2J1_10- j1j2_p2c1s2_10*P2C1S2J1_10
  deriv(P2C1S2J2_10) <- t10_p2c1s2j2*pc_p2*turn10 - age_up*P2C1S2J2_10_lag  + f*P1C1S2J2_10 - r*P2C1S2J2_10+ s1s2_p2c1j2_10*P2C1S1J2_10 - s2s3_p2c1j2_10*P2C1S2J2_10 + s3s2_p2c1j2_10*P2C1S3J2_10- (c1c2_p2s2j2_10+c1c3_p2s2j2_10)*P2C1S2J2_10+ j1j2_p2c1s2_10*P2C1S2J1_10 - j2j3_p2c1s2_10*P2C1S2J2_10
  deriv(P2C1S2J3_10) <- -age_up*P2C1S2J3_10_lag  + f*P1C1S2J3_10 - r*P2C1S2J3_10+ s1s2_p2c1j3_10*P2C1S1J3_10 - s2s3_p2c1j3_10*P2C1S2J3_10 + s3s2_p2c1j3_10*P2C1S3J3_10- (c1c2_p2s2j3_10+c1c3_p2s2j3_10)*P2C1S2J3_10+ j2j3_p2c1s2_10*P2C1S2J2_10 + j4j3_p2c1s2_10*P2C1S2J4_10 - j3j4_p2c1s2_10*P2C1S2J3_10
  deriv(P2C1S2J4_10) <- -age_up*P2C1S2J4_10_lag  + f*P1C1S2J4_10 - r*P2C1S2J4_10+ s1s2_p2c1j4_10*P2C1S1J4_10 - s2s3_p2c1j4_10*P2C1S2J4_10 + s3s2_p2c1j4_10*P2C1S3J4_10- (c1c2_p2s2j4_10+c1c3_p2s2j4_10)*P2C1S2J4_10+ j3j4_p2c1s2_10*P2C1S2J3_10 - j4j3_p2c1s2_10*P2C1S2J4_10
  deriv(P2C1S3J1_10) <- t10_p2c1s3j1*pc_p2*turn10 - age_up*P2C1S3J1_10_lag  + f*P1C1S3J1_10 - r*P2C1S3J1_10+ s2s3_p2c1j1_10*P2C1S2J1_10 - s3s2_p2c1j1_10*P2C1S3J1_10- (c1c2_p2s3j1_10+c1c3_p2s3j1_10)*P2C1S3J1_10- j1j2_p2c1s3_10*P2C1S3J1_10
  deriv(P2C1S3J2_10) <- t10_p2c1s3j2*pc_p2*turn10 - age_up*P2C1S3J2_10_lag  + f*P1C1S3J2_10 - r*P2C1S3J2_10+ s2s3_p2c1j2_10*P2C1S2J2_10 - s3s2_p2c1j2_10*P2C1S3J2_10- (c1c2_p2s3j2_10+c1c3_p2s3j2_10)*P2C1S3J2_10+ j1j2_p2c1s3_10*P2C1S3J1_10 - j2j3_p2c1s3_10*P2C1S3J2_10
  deriv(P2C1S3J3_10) <- -age_up*P2C1S3J3_10_lag  + f*P1C1S3J3_10 - r*P2C1S3J3_10+ s2s3_p2c1j3_10*P2C1S2J3_10 - s3s2_p2c1j3_10*P2C1S3J3_10- (c1c2_p2s3j3_10+c1c3_p2s3j3_10)*P2C1S3J3_10+ j2j3_p2c1s3_10*P2C1S3J2_10 + j4j3_p2c1s3_10*P2C1S3J4_10 - j3j4_p2c1s3_10*P2C1S3J3_10
  deriv(P2C1S3J4_10) <- -age_up*P2C1S3J4_10_lag  + f*P1C1S3J4_10 - r*P2C1S3J4_10+ s2s3_p2c1j4_10*P2C1S2J4_10 - s3s2_p2c1j4_10*P2C1S3J4_10- (c1c2_p2s3j4_10+c1c3_p2s3j4_10)*P2C1S3J4_10+ j3j4_p2c1s3_10*P2C1S3J3_10 - j4j3_p2c1s3_10*P2C1S3J4_10
  deriv(P2C2S1J1_10) <- t10_p2c2s1j1*pc_p2*turn10 - age_up*P2C2S1J1_10_lag  + f*P1C2S1J1_10 - r*P2C2S1J1_10- s1s2_p2c2j1_10*P2C2S1J1_10+ c1c2_p2s1j1_10*P2C1S1J1_10 + c3c2_p2s1j1_10*P2C3S1J1_10 + c4c2_p2s1j1_10*P2C4S1J1_10 - (c2c3_p2s1j1_10+c2c4_p2s1j1_10)*P2C2S1J1_10- j1j2_p2c2s1_10*P2C2S1J1_10
  deriv(P2C2S1J2_10) <- t10_p2c2s1j2*pc_p2*turn10 - age_up*P2C2S1J2_10_lag  + f*P1C2S1J2_10 - r*P2C2S1J2_10- s1s2_p2c2j2_10*P2C2S1J2_10+ c1c2_p2s1j2_10*P2C1S1J2_10 + c3c2_p2s1j2_10*P2C3S1J2_10 + c4c2_p2s1j2_10*P2C4S1J2_10 - (c2c3_p2s1j2_10+c2c4_p2s1j2_10)*P2C2S1J2_10+ j1j2_p2c2s1_10*P2C2S1J1_10 - j2j3_p2c2s1_10*P2C2S1J2_10
  deriv(P2C2S1J3_10) <- -age_up*P2C2S1J3_10_lag  + f*P1C2S1J3_10 - r*P2C2S1J3_10- s1s2_p2c2j3_10*P2C2S1J3_10+ c1c2_p2s1j3_10*P2C1S1J3_10 + c3c2_p2s1j3_10*P2C3S1J3_10 + c4c2_p2s1j3_10*P2C4S1J3_10 - (c2c3_p2s1j3_10+c2c4_p2s1j3_10)*P2C2S1J3_10+ j2j3_p2c2s1_10*P2C2S1J2_10 + j4j3_p2c2s1_10*P2C2S1J4_10 - j3j4_p2c2s1_10*P2C2S1J3_10
  deriv(P2C2S1J4_10) <- -age_up*P2C2S1J4_10_lag  + f*P1C2S1J4_10 - r*P2C2S1J4_10- s1s2_p2c2j4_10*P2C2S1J4_10+ c1c2_p2s1j4_10*P2C1S1J4_10 + c3c2_p2s1j4_10*P2C3S1J4_10 + c4c2_p2s1j4_10*P2C4S1J4_10 - (c2c3_p2s1j4_10+c2c4_p2s1j4_10)*P2C2S1J4_10+ j3j4_p2c2s1_10*P2C2S1J3_10 - j4j3_p2c2s1_10*P2C2S1J4_10
  deriv(P2C2S2J1_10) <- t10_p2c2s2j1*pc_p2*turn10 - age_up*P2C2S2J1_10_lag  + f*P1C2S2J1_10 - r*P2C2S2J1_10+ s1s2_p2c2j1_10*P2C2S1J1_10 - s2s3_p2c2j1_10*P2C2S2J1_10 + s3s2_p2c2j1_10*P2C2S3J1_10+ c1c2_p2s2j1_10*P2C1S2J1_10 + c3c2_p2s2j1_10*P2C3S2J1_10 + c4c2_p2s2j1_10*P2C4S2J1_10 - (c2c3_p2s2j1_10+c2c4_p2s2j1_10)*P2C2S2J1_10- j1j2_p2c2s2_10*P2C2S2J1_10
  deriv(P2C2S2J2_10) <- t10_p2c2s2j2*pc_p2*turn10 - age_up*P2C2S2J2_10_lag  + f*P1C2S2J2_10 - r*P2C2S2J2_10+ s1s2_p2c2j2_10*P2C2S1J2_10 - s2s3_p2c2j2_10*P2C2S2J2_10 + s3s2_p2c2j2_10*P2C2S3J2_10+ c1c2_p2s2j2_10*P2C1S2J2_10 + c3c2_p2s2j2_10*P2C3S2J2_10 + c4c2_p2s2j2_10*P2C4S2J2_10 - (c2c3_p2s2j2_10+c2c4_p2s2j2_10)*P2C2S2J2_10+ j1j2_p2c2s2_10*P2C2S2J1_10 - j2j3_p2c2s2_10*P2C2S2J2_10
  deriv(P2C2S2J3_10) <- -age_up*P2C2S2J3_10_lag  + f*P1C2S2J3_10 - r*P2C2S2J3_10+ s1s2_p2c2j3_10*P2C2S1J3_10 - s2s3_p2c2j3_10*P2C2S2J3_10 + s3s2_p2c2j3_10*P2C2S3J3_10+ c1c2_p2s2j3_10*P2C1S2J3_10 + c3c2_p2s2j3_10*P2C3S2J3_10 + c4c2_p2s2j3_10*P2C4S2J3_10 - (c2c3_p2s2j3_10+c2c4_p2s2j3_10)*P2C2S2J3_10+ j2j3_p2c2s2_10*P2C2S2J2_10 + j4j3_p2c2s2_10*P2C2S2J4_10 - j3j4_p2c2s2_10*P2C2S2J3_10
  deriv(P2C2S2J4_10) <- -age_up*P2C2S2J4_10_lag  + f*P1C2S2J4_10 - r*P2C2S2J4_10+ s1s2_p2c2j4_10*P2C2S1J4_10 - s2s3_p2c2j4_10*P2C2S2J4_10 + s3s2_p2c2j4_10*P2C2S3J4_10+ c1c2_p2s2j4_10*P2C1S2J4_10 + c3c2_p2s2j4_10*P2C3S2J4_10 + c4c2_p2s2j4_10*P2C4S2J4_10 - (c2c3_p2s2j4_10+c2c4_p2s2j4_10)*P2C2S2J4_10+ j3j4_p2c2s2_10*P2C2S2J3_10 - j4j3_p2c2s2_10*P2C2S2J4_10
  deriv(P2C2S3J1_10) <- t10_p2c2s3j1*pc_p2*turn10 - age_up*P2C2S3J1_10_lag  + f*P1C2S3J1_10 - r*P2C2S3J1_10+ s2s3_p2c2j1_10*P2C2S2J1_10 - s3s2_p2c2j1_10*P2C2S3J1_10+ c1c2_p2s3j1_10*P2C1S3J1_10 + c3c2_p2s3j1_10*P2C3S3J1_10 + c4c2_p2s3j1_10*P2C4S3J1_10 - (c2c3_p2s3j1_10+c2c4_p2s3j1_10)*P2C2S3J1_10- j1j2_p2c2s3_10*P2C2S3J1_10
  deriv(P2C2S3J2_10) <- t10_p2c2s3j2*pc_p2*turn10 - age_up*P2C2S3J2_10_lag  + f*P1C2S3J2_10 - r*P2C2S3J2_10+ s2s3_p2c2j2_10*P2C2S2J2_10 - s3s2_p2c2j2_10*P2C2S3J2_10+ c1c2_p2s3j2_10*P2C1S3J2_10 + c3c2_p2s3j2_10*P2C3S3J2_10 + c4c2_p2s3j2_10*P2C4S3J2_10 - (c2c3_p2s3j2_10+c2c4_p2s3j2_10)*P2C2S3J2_10+ j1j2_p2c2s3_10*P2C2S3J1_10 - j2j3_p2c2s3_10*P2C2S3J2_10
  deriv(P2C2S3J3_10) <- -age_up*P2C2S3J3_10_lag  + f*P1C2S3J3_10 - r*P2C2S3J3_10+ s2s3_p2c2j3_10*P2C2S2J3_10 - s3s2_p2c2j3_10*P2C2S3J3_10+ c1c2_p2s3j3_10*P2C1S3J3_10 + c3c2_p2s3j3_10*P2C3S3J3_10 + c4c2_p2s3j3_10*P2C4S3J3_10 - (c2c3_p2s3j3_10+c2c4_p2s3j3_10)*P2C2S3J3_10+ j2j3_p2c2s3_10*P2C2S3J2_10 + j4j3_p2c2s3_10*P2C2S3J4_10 - j3j4_p2c2s3_10*P2C2S3J3_10
  deriv(P2C2S3J4_10) <- -age_up*P2C2S3J4_10_lag  + f*P1C2S3J4_10 - r*P2C2S3J4_10+ s2s3_p2c2j4_10*P2C2S2J4_10 - s3s2_p2c2j4_10*P2C2S3J4_10+ c1c2_p2s3j4_10*P2C1S3J4_10 + c3c2_p2s3j4_10*P2C3S3J4_10 + c4c2_p2s3j4_10*P2C4S3J4_10 - (c2c3_p2s3j4_10+c2c4_p2s3j4_10)*P2C2S3J4_10+ j3j4_p2c2s3_10*P2C2S3J3_10 - j4j3_p2c2s3_10*P2C2S3J4_10
  deriv(P2C3S1J1_10) <- t10_p2c3s1j1*pc_p2*turn10 - age_up*P2C3S1J1_10_lag  + f*P1C3S1J1_10 - r*P2C3S1J1_10- s1s2_p2c3j1_10*P2C3S1J1_10+ c1c3_p2s1j1_10*P2C1S1J1_10+ c2c3_p2s1j1_10*P2C2S1J1_10 + c4c3_p2s1j1_10*P2C4S1J1_10 - (c3c2_p2s1j1_10+c3c4_p2s1j1_10)*P2C3S1J1_10- j1j2_p2c3s1_10*P2C3S1J1_10
  deriv(P2C3S1J2_10) <- t10_p2c3s1j2*pc_p2*turn10 - age_up*P2C3S1J2_10_lag  + f*P1C3S1J2_10 - r*P2C3S1J2_10- s1s2_p2c3j2_10*P2C3S1J2_10+ c1c3_p2s1j2_10*P2C1S1J2_10+ c2c3_p2s1j2_10*P2C2S1J2_10 + c4c3_p2s1j2_10*P2C4S1J2_10 - (c3c2_p2s1j2_10+c3c4_p2s1j2_10)*P2C3S1J2_10+ j1j2_p2c3s1_10*P2C3S1J1_10 - j2j3_p2c3s1_10*P2C3S1J2_10
  deriv(P2C3S1J3_10) <- -age_up*P2C3S1J3_10_lag  + f*P1C3S1J3_10 - r*P2C3S1J3_10- s1s2_p2c3j3_10*P2C3S1J3_10+ c1c3_p2s1j3_10*P2C1S1J3_10+ c2c3_p2s1j3_10*P2C2S1J3_10 + c4c3_p2s1j3_10*P2C4S1J3_10 - (c3c2_p2s1j3_10+c3c4_p2s1j3_10)*P2C3S1J3_10+ j2j3_p2c3s1_10*P2C3S1J2_10 + j4j3_p2c3s1_10*P2C3S1J4_10 - j3j4_p2c3s1_10*P2C3S1J3_10
  deriv(P2C3S1J4_10) <- -age_up*P2C3S1J4_10_lag  + f*P1C3S1J4_10 - r*P2C3S1J4_10- s1s2_p2c3j4_10*P2C3S1J4_10+ c1c3_p2s1j4_10*P2C1S1J4_10+ c2c3_p2s1j4_10*P2C2S1J4_10 + c4c3_p2s1j4_10*P2C4S1J4_10 - (c3c2_p2s1j4_10+c3c4_p2s1j4_10)*P2C3S1J4_10+ j3j4_p2c3s1_10*P2C3S1J3_10 - j4j3_p2c3s1_10*P2C3S1J4_10
  deriv(P2C3S2J1_10) <- t10_p2c3s2j1*pc_p2*turn10 - age_up*P2C3S2J1_10_lag  + f*P1C3S2J1_10 - r*P2C3S2J1_10+ s1s2_p2c3j1_10*P2C3S1J1_10 - s2s3_p2c3j1_10*P2C3S2J1_10 + s3s2_p2c3j1_10*P2C3S3J1_10+ c1c3_p2s2j1_10*P2C1S2J1_10+ c2c3_p2s2j1_10*P2C2S2J1_10 + c4c3_p2s2j1_10*P2C4S2J1_10 - (c3c2_p2s2j1_10+c3c4_p2s2j1_10)*P2C3S2J1_10- j1j2_p2c3s2_10*P2C3S2J1_10
  deriv(P2C3S2J2_10) <- t10_p2c3s2j2*pc_p2*turn10 - age_up*P2C3S2J2_10_lag  + f*P1C3S2J2_10 - r*P2C3S2J2_10+ s1s2_p2c3j2_10*P2C3S1J2_10 - s2s3_p2c3j2_10*P2C3S2J2_10 + s3s2_p2c3j2_10*P2C3S3J2_10+ c1c3_p2s2j2_10*P2C1S2J2_10+ c2c3_p2s2j2_10*P2C2S2J2_10 + c4c3_p2s2j2_10*P2C4S2J2_10 - (c3c2_p2s2j2_10+c3c4_p2s2j2_10)*P2C3S2J2_10+ j1j2_p2c3s2_10*P2C3S2J1_10 - j2j3_p2c3s2_10*P2C3S2J2_10
  deriv(P2C3S2J3_10) <- -age_up*P2C3S2J3_10_lag  + f*P1C3S2J3_10 - r*P2C3S2J3_10+ s1s2_p2c3j3_10*P2C3S1J3_10 - s2s3_p2c3j3_10*P2C3S2J3_10 + s3s2_p2c3j3_10*P2C3S3J3_10+ c1c3_p2s2j3_10*P2C1S2J3_10+ c2c3_p2s2j3_10*P2C2S2J3_10 + c4c3_p2s2j3_10*P2C4S2J3_10 - (c3c2_p2s2j3_10+c3c4_p2s2j3_10)*P2C3S2J3_10+ j2j3_p2c3s2_10*P2C3S2J2_10 + j4j3_p2c3s2_10*P2C3S2J4_10 - j3j4_p2c3s2_10*P2C3S2J3_10
  deriv(P2C3S2J4_10) <- -age_up*P2C3S2J4_10_lag  + f*P1C3S2J4_10 - r*P2C3S2J4_10+ s1s2_p2c3j4_10*P2C3S1J4_10 - s2s3_p2c3j4_10*P2C3S2J4_10 + s3s2_p2c3j4_10*P2C3S3J4_10+ c1c3_p2s2j4_10*P2C1S2J4_10+ c2c3_p2s2j4_10*P2C2S2J4_10 + c4c3_p2s2j4_10*P2C4S2J4_10 - (c3c2_p2s2j4_10+c3c4_p2s2j4_10)*P2C3S2J4_10+ j3j4_p2c3s2_10*P2C3S2J3_10 - j4j3_p2c3s2_10*P2C3S2J4_10
  deriv(P2C3S3J1_10) <- t10_p2c3s3j1*pc_p2*turn10 - age_up*P2C3S3J1_10_lag  + f*P1C3S3J1_10 - r*P2C3S3J1_10+ s2s3_p2c3j1_10*P2C3S2J1_10 - s3s2_p2c3j1_10*P2C3S3J1_10+ c1c3_p2s3j1_10*P2C1S3J1_10+ c2c3_p2s3j1_10*P2C2S3J1_10 + c4c3_p2s3j1_10*P2C4S3J1_10 - (c3c2_p2s3j1_10+c3c4_p2s3j1_10)*P2C3S3J1_10- j1j2_p2c3s3_10*P2C3S3J1_10
  deriv(P2C3S3J2_10) <- t10_p2c3s3j2*pc_p2*turn10 - age_up*P2C3S3J2_10_lag  + f*P1C3S3J2_10 - r*P2C3S3J2_10+ s2s3_p2c3j2_10*P2C3S2J2_10 - s3s2_p2c3j2_10*P2C3S3J2_10+ c1c3_p2s3j2_10*P2C1S3J2_10+ c2c3_p2s3j2_10*P2C2S3J2_10 + c4c3_p2s3j2_10*P2C4S3J2_10 - (c3c2_p2s3j2_10+c3c4_p2s3j2_10)*P2C3S3J2_10+ j1j2_p2c3s3_10*P2C3S3J1_10 - j2j3_p2c3s3_10*P2C3S3J2_10
  deriv(P2C3S3J3_10) <- -age_up*P2C3S3J3_10_lag  + f*P1C3S3J3_10 - r*P2C3S3J3_10+ s2s3_p2c3j3_10*P2C3S2J3_10 - s3s2_p2c3j3_10*P2C3S3J3_10+ c1c3_p2s3j3_10*P2C1S3J3_10+ c2c3_p2s3j3_10*P2C2S3J3_10 + c4c3_p2s3j3_10*P2C4S3J3_10 - (c3c2_p2s3j3_10+c3c4_p2s3j3_10)*P2C3S3J3_10+ j2j3_p2c3s3_10*P2C3S3J2_10 + j4j3_p2c3s3_10*P2C3S3J4_10 - j3j4_p2c3s3_10*P2C3S3J3_10
  deriv(P2C3S3J4_10) <- -age_up*P2C3S3J4_10_lag  + f*P1C3S3J4_10 - r*P2C3S3J4_10+ s2s3_p2c3j4_10*P2C3S2J4_10 - s3s2_p2c3j4_10*P2C3S3J4_10+ c1c3_p2s3j4_10*P2C1S3J4_10+ c2c3_p2s3j4_10*P2C2S3J4_10 + c4c3_p2s3j4_10*P2C4S3J4_10 - (c3c2_p2s3j4_10+c3c4_p2s3j4_10)*P2C3S3J4_10+ j3j4_p2c3s3_10*P2C3S3J3_10 - j4j3_p2c3s3_10*P2C3S3J4_10
  deriv(P2C4S1J1_10) <- t10_p2c4s1j1*pc_p2*turn10 - age_up*P2C4S1J1_10_lag  + f*P1C4S1J1_10 - r*P2C4S1J1_10- s1s2_p2c4j1_10*P2C4S1J1_10+ c2c4_p2s1j1_10*P2C2S1J1_10 + c3c4_p2s1j1_10*P2C3S1J1_10- (c4c2_p2s1j1_10+c4c3_p2s1j1_10)*P2C4S1J1_10- j1j2_p2c4s1_10*P2C4S1J1_10
  deriv(P2C4S1J2_10) <- t10_p2c4s1j2*pc_p2*turn10 - age_up*P2C4S1J2_10_lag  + f*P1C4S1J2_10 - r*P2C4S1J2_10- s1s2_p2c4j2_10*P2C4S1J2_10+ c2c4_p2s1j2_10*P2C2S1J2_10 + c3c4_p2s1j2_10*P2C3S1J2_10- (c4c2_p2s1j2_10+c4c3_p2s1j2_10)*P2C4S1J2_10+ j1j2_p2c4s1_10*P2C4S1J1_10 - j2j3_p2c4s1_10*P2C4S1J2_10
  deriv(P2C4S1J3_10) <- -age_up*P2C4S1J3_10_lag  + f*P1C4S1J3_10 - r*P2C4S1J3_10- s1s2_p2c4j3_10*P2C4S1J3_10+ c2c4_p2s1j3_10*P2C2S1J3_10 + c3c4_p2s1j3_10*P2C3S1J3_10- (c4c2_p2s1j3_10+c4c3_p2s1j3_10)*P2C4S1J3_10+ j2j3_p2c4s1_10*P2C4S1J2_10 + j4j3_p2c4s1_10*P2C4S1J4_10 - j3j4_p2c4s1_10*P2C4S1J3_10
  deriv(P2C4S1J4_10) <- -age_up*P2C4S1J4_10_lag  + f*P1C4S1J4_10 - r*P2C4S1J4_10- s1s2_p2c4j4_10*P2C4S1J4_10+ c2c4_p2s1j4_10*P2C2S1J4_10 + c3c4_p2s1j4_10*P2C3S1J4_10- (c4c2_p2s1j4_10+c4c3_p2s1j4_10)*P2C4S1J4_10+ j3j4_p2c4s1_10*P2C4S1J3_10 - j4j3_p2c4s1_10*P2C4S1J4_10
  deriv(P2C4S2J1_10) <- t10_p2c4s2j1*pc_p2*turn10 - age_up*P2C4S2J1_10_lag  + f*P1C4S2J1_10 - r*P2C4S2J1_10+ s1s2_p2c4j1_10*P2C4S1J1_10 - s2s3_p2c4j1_10*P2C4S2J1_10 + s3s2_p2c4j1_10*P2C4S3J1_10+ c2c4_p2s2j1_10*P2C2S2J1_10 + c3c4_p2s2j1_10*P2C3S2J1_10- (c4c2_p2s2j1_10+c4c3_p2s2j1_10)*P2C4S2J1_10- j1j2_p2c4s2_10*P2C4S2J1_10
  deriv(P2C4S2J2_10) <- t10_p2c4s2j2*pc_p2*turn10 - age_up*P2C4S2J2_10_lag  + f*P1C4S2J2_10 - r*P2C4S2J2_10+ s1s2_p2c4j2_10*P2C4S1J2_10 - s2s3_p2c4j2_10*P2C4S2J2_10 + s3s2_p2c4j2_10*P2C4S3J2_10+ c2c4_p2s2j2_10*P2C2S2J2_10 + c3c4_p2s2j2_10*P2C3S2J2_10- (c4c2_p2s2j2_10+c4c3_p2s2j2_10)*P2C4S2J2_10+ j1j2_p2c4s2_10*P2C4S2J1_10 - j2j3_p2c4s2_10*P2C4S2J2_10
  deriv(P2C4S2J3_10) <- -age_up*P2C4S2J3_10_lag  + f*P1C4S2J3_10 - r*P2C4S2J3_10+ s1s2_p2c4j3_10*P2C4S1J3_10 - s2s3_p2c4j3_10*P2C4S2J3_10 + s3s2_p2c4j3_10*P2C4S3J3_10+ c2c4_p2s2j3_10*P2C2S2J3_10 + c3c4_p2s2j3_10*P2C3S2J3_10- (c4c2_p2s2j3_10+c4c3_p2s2j3_10)*P2C4S2J3_10+ j2j3_p2c4s2_10*P2C4S2J2_10 + j4j3_p2c4s2_10*P2C4S2J4_10 - j3j4_p2c4s2_10*P2C4S2J3_10
  deriv(P2C4S2J4_10) <- -age_up*P2C4S2J4_10_lag  + f*P1C4S2J4_10 - r*P2C4S2J4_10+ s1s2_p2c4j4_10*P2C4S1J4_10 - s2s3_p2c4j4_10*P2C4S2J4_10 + s3s2_p2c4j4_10*P2C4S3J4_10+ c2c4_p2s2j4_10*P2C2S2J4_10 + c3c4_p2s2j4_10*P2C3S2J4_10- (c4c2_p2s2j4_10+c4c3_p2s2j4_10)*P2C4S2J4_10+ j3j4_p2c4s2_10*P2C4S2J3_10 - j4j3_p2c4s2_10*P2C4S2J4_10
  deriv(P2C4S3J1_10) <- t10_p2c4s3j1*pc_p2*turn10 - age_up*P2C4S3J1_10_lag  + f*P1C4S3J1_10 - r*P2C4S3J1_10+ s2s3_p2c4j1_10*P2C4S2J1_10 - s3s2_p2c4j1_10*P2C4S3J1_10+ c2c4_p2s3j1_10*P2C2S3J1_10 + c3c4_p2s3j1_10*P2C3S3J1_10- (c4c2_p2s3j1_10+c4c3_p2s3j1_10)*P2C4S3J1_10- j1j2_p2c4s3_10*P2C4S3J1_10
  deriv(P2C4S3J2_10) <- t10_p2c4s3j2*pc_p2*turn10 - age_up*P2C4S3J2_10_lag  + f*P1C4S3J2_10 - r*P2C4S3J2_10+ s2s3_p2c4j2_10*P2C4S2J2_10 - s3s2_p2c4j2_10*P2C4S3J2_10+ c2c4_p2s3j2_10*P2C2S3J2_10 + c3c4_p2s3j2_10*P2C3S3J2_10- (c4c2_p2s3j2_10+c4c3_p2s3j2_10)*P2C4S3J2_10+ j1j2_p2c4s3_10*P2C4S3J1_10 - j2j3_p2c4s3_10*P2C4S3J2_10
  deriv(P2C4S3J3_10) <- -age_up*P2C4S3J3_10_lag  + f*P1C4S3J3_10 - r*P2C4S3J3_10+ s2s3_p2c4j3_10*P2C4S2J3_10 - s3s2_p2c4j3_10*P2C4S3J3_10+ c2c4_p2s3j3_10*P2C2S3J3_10 + c3c4_p2s3j3_10*P2C3S3J3_10- (c4c2_p2s3j3_10+c4c3_p2s3j3_10)*P2C4S3J3_10+ j2j3_p2c4s3_10*P2C4S3J2_10 + j4j3_p2c4s3_10*P2C4S3J4_10 - j3j4_p2c4s3_10*P2C4S3J3_10
  deriv(P2C4S3J4_10) <- -age_up*P2C4S3J4_10_lag  + f*P1C4S3J4_10 - r*P2C4S3J4_10+ s2s3_p2c4j4_10*P2C4S2J4_10 - s3s2_p2c4j4_10*P2C4S3J4_10+ c2c4_p2s3j4_10*P2C2S3J4_10 + c3c4_p2s3j4_10*P2C3S3J4_10- (c4c2_p2s3j4_10+c4c3_p2s3j4_10)*P2C4S3J4_10+ j3j4_p2c4s3_10*P2C4S3J3_10 - j4j3_p2c4s3_10*P2C4S3J4_10
  deriv(P1C1S1J1_11) <- age_up*P1C1S1J1_10_lag - age_up*P1C1S1J1_11_lag + r*P2C1S1J1_11 - f*P1C1S1J1_11- s1s2_p1c1j1_11*P1C1S1J1_11- (c1c2_p1s1j1_11+c1c3_p1s1j1_11)*P1C1S1J1_11- j1j2_p1c1s1_11*P1C1S1J1_11
  deriv(P1C1S1J2_11) <- age_up*P1C1S1J2_10_lag - age_up*P1C1S1J2_11_lag + r*P2C1S1J2_11 - f*P1C1S1J2_11- s1s2_p1c1j2_11*P1C1S1J2_11- (c1c2_p1s1j2_11+c1c3_p1s1j2_11)*P1C1S1J2_11+ j1j2_p1c1s1_11*P1C1S1J1_11 - j2j3_p1c1s1_11*P1C1S1J2_11
  deriv(P1C1S1J3_11) <- age_up*P1C1S1J3_10_lag - age_up*P1C1S1J3_11_lag + r*P2C1S1J3_11 - f*P1C1S1J3_11- s1s2_p1c1j3_11*P1C1S1J3_11- (c1c2_p1s1j3_11+c1c3_p1s1j3_11)*P1C1S1J3_11+ j2j3_p1c1s1_11*P1C1S1J2_11 + j4j3_p1c1s1_11*P1C1S1J4_11 - j3j4_p1c1s1_11*P1C1S1J3_11
  deriv(P1C1S1J4_11) <- age_up*P1C1S1J4_10_lag - age_up*P1C1S1J4_11_lag + r*P2C1S1J4_11 - f*P1C1S1J4_11- s1s2_p1c1j4_11*P1C1S1J4_11- (c1c2_p1s1j4_11+c1c3_p1s1j4_11)*P1C1S1J4_11+ j3j4_p1c1s1_11*P1C1S1J3_11 - j4j3_p1c1s1_11*P1C1S1J4_11
  deriv(P1C1S2J1_11) <- age_up*P1C1S2J1_10_lag - age_up*P1C1S2J1_11_lag + r*P2C1S2J1_11 - f*P1C1S2J1_11+ s1s2_p1c1j1_11*P1C1S1J1_11 - s2s3_p1c1j1_11*P1C1S2J1_11 + s3s2_p1c1j1_11*P1C1S3J1_11- (c1c2_p1s2j1_11+c1c3_p1s2j1_11)*P1C1S2J1_11- j1j2_p1c1s2_11*P1C1S2J1_11
  deriv(P1C1S2J2_11) <- age_up*P1C1S2J2_10_lag - age_up*P1C1S2J2_11_lag + r*P2C1S2J2_11 - f*P1C1S2J2_11+ s1s2_p1c1j2_11*P1C1S1J2_11 - s2s3_p1c1j2_11*P1C1S2J2_11 + s3s2_p1c1j2_11*P1C1S3J2_11- (c1c2_p1s2j2_11+c1c3_p1s2j2_11)*P1C1S2J2_11+ j1j2_p1c1s2_11*P1C1S2J1_11 - j2j3_p1c1s2_11*P1C1S2J2_11
  deriv(P1C1S2J3_11) <- age_up*P1C1S2J3_10_lag - age_up*P1C1S2J3_11_lag + r*P2C1S2J3_11 - f*P1C1S2J3_11+ s1s2_p1c1j3_11*P1C1S1J3_11 - s2s3_p1c1j3_11*P1C1S2J3_11 + s3s2_p1c1j3_11*P1C1S3J3_11- (c1c2_p1s2j3_11+c1c3_p1s2j3_11)*P1C1S2J3_11+ j2j3_p1c1s2_11*P1C1S2J2_11 + j4j3_p1c1s2_11*P1C1S2J4_11 - j3j4_p1c1s2_11*P1C1S2J3_11
  deriv(P1C1S2J4_11) <- age_up*P1C1S2J4_10_lag - age_up*P1C1S2J4_11_lag + r*P2C1S2J4_11 - f*P1C1S2J4_11+ s1s2_p1c1j4_11*P1C1S1J4_11 - s2s3_p1c1j4_11*P1C1S2J4_11 + s3s2_p1c1j4_11*P1C1S3J4_11- (c1c2_p1s2j4_11+c1c3_p1s2j4_11)*P1C1S2J4_11+ j3j4_p1c1s2_11*P1C1S2J3_11 - j4j3_p1c1s2_11*P1C1S2J4_11
  deriv(P1C1S3J1_11) <- age_up*P1C1S3J1_10_lag - age_up*P1C1S3J1_11_lag + r*P2C1S3J1_11 - f*P1C1S3J1_11+ s2s3_p1c1j1_11*P1C1S2J1_11 - s3s2_p1c1j1_11*P1C1S3J1_11- (c1c2_p1s3j1_11+c1c3_p1s3j1_11)*P1C1S3J1_11- j1j2_p1c1s3_11*P1C1S3J1_11
  deriv(P1C1S3J2_11) <- age_up*P1C1S3J2_10_lag - age_up*P1C1S3J2_11_lag + r*P2C1S3J2_11 - f*P1C1S3J2_11+ s2s3_p1c1j2_11*P1C1S2J2_11 - s3s2_p1c1j2_11*P1C1S3J2_11- (c1c2_p1s3j2_11+c1c3_p1s3j2_11)*P1C1S3J2_11+ j1j2_p1c1s3_11*P1C1S3J1_11 - j2j3_p1c1s3_11*P1C1S3J2_11
  deriv(P1C1S3J3_11) <- age_up*P1C1S3J3_10_lag - age_up*P1C1S3J3_11_lag + r*P2C1S3J3_11 - f*P1C1S3J3_11+ s2s3_p1c1j3_11*P1C1S2J3_11 - s3s2_p1c1j3_11*P1C1S3J3_11- (c1c2_p1s3j3_11+c1c3_p1s3j3_11)*P1C1S3J3_11+ j2j3_p1c1s3_11*P1C1S3J2_11 + j4j3_p1c1s3_11*P1C1S3J4_11 - j3j4_p1c1s3_11*P1C1S3J3_11
  deriv(P1C1S3J4_11) <- age_up*P1C1S3J4_10_lag - age_up*P1C1S3J4_11_lag + r*P2C1S3J4_11 - f*P1C1S3J4_11+ s2s3_p1c1j4_11*P1C1S2J4_11 - s3s2_p1c1j4_11*P1C1S3J4_11- (c1c2_p1s3j4_11+c1c3_p1s3j4_11)*P1C1S3J4_11+ j3j4_p1c1s3_11*P1C1S3J3_11 - j4j3_p1c1s3_11*P1C1S3J4_11
  deriv(P1C2S1J1_11) <- age_up*P1C2S1J1_10_lag - age_up*P1C2S1J1_11_lag + r*P2C2S1J1_11 - f*P1C2S1J1_11- s1s2_p1c2j1_11*P1C2S1J1_11+ c1c2_p1s1j1_11*P1C1S1J1_11 + c3c2_p1s1j1_11*P1C3S1J1_11 + c4c2_p1s1j1_11*P1C4S1J1_11 - (c2c3_p1s1j1_11+c2c4_p1s1j1_11)*P1C2S1J1_11- j1j2_p1c2s1_11*P1C2S1J1_11
  deriv(P1C2S1J2_11) <- age_up*P1C2S1J2_10_lag - age_up*P1C2S1J2_11_lag + r*P2C2S1J2_11 - f*P1C2S1J2_11- s1s2_p1c2j2_11*P1C2S1J2_11+ c1c2_p1s1j2_11*P1C1S1J2_11 + c3c2_p1s1j2_11*P1C3S1J2_11 + c4c2_p1s1j2_11*P1C4S1J2_11 - (c2c3_p1s1j2_11+c2c4_p1s1j2_11)*P1C2S1J2_11+ j1j2_p1c2s1_11*P1C2S1J1_11 - j2j3_p1c2s1_11*P1C2S1J2_11
  deriv(P1C2S1J3_11) <- age_up*P1C2S1J3_10_lag - age_up*P1C2S1J3_11_lag + r*P2C2S1J3_11 - f*P1C2S1J3_11- s1s2_p1c2j3_11*P1C2S1J3_11+ c1c2_p1s1j3_11*P1C1S1J3_11 + c3c2_p1s1j3_11*P1C3S1J3_11 + c4c2_p1s1j3_11*P1C4S1J3_11 - (c2c3_p1s1j3_11+c2c4_p1s1j3_11)*P1C2S1J3_11+ j2j3_p1c2s1_11*P1C2S1J2_11 + j4j3_p1c2s1_11*P1C2S1J4_11 - j3j4_p1c2s1_11*P1C2S1J3_11
  deriv(P1C2S1J4_11) <- age_up*P1C2S1J4_10_lag - age_up*P1C2S1J4_11_lag + r*P2C2S1J4_11 - f*P1C2S1J4_11- s1s2_p1c2j4_11*P1C2S1J4_11+ c1c2_p1s1j4_11*P1C1S1J4_11 + c3c2_p1s1j4_11*P1C3S1J4_11 + c4c2_p1s1j4_11*P1C4S1J4_11 - (c2c3_p1s1j4_11+c2c4_p1s1j4_11)*P1C2S1J4_11+ j3j4_p1c2s1_11*P1C2S1J3_11 - j4j3_p1c2s1_11*P1C2S1J4_11
  deriv(P1C2S2J1_11) <- age_up*P1C2S2J1_10_lag - age_up*P1C2S2J1_11_lag + r*P2C2S2J1_11 - f*P1C2S2J1_11+ s1s2_p1c2j1_11*P1C2S1J1_11 - s2s3_p1c2j1_11*P1C2S2J1_11 + s3s2_p1c2j1_11*P1C2S3J1_11+ c1c2_p1s2j1_11*P1C1S2J1_11 + c3c2_p1s2j1_11*P1C3S2J1_11 + c4c2_p1s2j1_11*P1C4S2J1_11 - (c2c3_p1s2j1_11+c2c4_p1s2j1_11)*P1C2S2J1_11- j1j2_p1c2s2_11*P1C2S2J1_11
  deriv(P1C2S2J2_11) <- age_up*P1C2S2J2_10_lag - age_up*P1C2S2J2_11_lag + r*P2C2S2J2_11 - f*P1C2S2J2_11+ s1s2_p1c2j2_11*P1C2S1J2_11 - s2s3_p1c2j2_11*P1C2S2J2_11 + s3s2_p1c2j2_11*P1C2S3J2_11+ c1c2_p1s2j2_11*P1C1S2J2_11 + c3c2_p1s2j2_11*P1C3S2J2_11 + c4c2_p1s2j2_11*P1C4S2J2_11 - (c2c3_p1s2j2_11+c2c4_p1s2j2_11)*P1C2S2J2_11+ j1j2_p1c2s2_11*P1C2S2J1_11 - j2j3_p1c2s2_11*P1C2S2J2_11
  deriv(P1C2S2J3_11) <- age_up*P1C2S2J3_10_lag - age_up*P1C2S2J3_11_lag + r*P2C2S2J3_11 - f*P1C2S2J3_11+ s1s2_p1c2j3_11*P1C2S1J3_11 - s2s3_p1c2j3_11*P1C2S2J3_11 + s3s2_p1c2j3_11*P1C2S3J3_11+ c1c2_p1s2j3_11*P1C1S2J3_11 + c3c2_p1s2j3_11*P1C3S2J3_11 + c4c2_p1s2j3_11*P1C4S2J3_11 - (c2c3_p1s2j3_11+c2c4_p1s2j3_11)*P1C2S2J3_11+ j2j3_p1c2s2_11*P1C2S2J2_11 + j4j3_p1c2s2_11*P1C2S2J4_11 - j3j4_p1c2s2_11*P1C2S2J3_11
  deriv(P1C2S2J4_11) <- age_up*P1C2S2J4_10_lag - age_up*P1C2S2J4_11_lag + r*P2C2S2J4_11 - f*P1C2S2J4_11+ s1s2_p1c2j4_11*P1C2S1J4_11 - s2s3_p1c2j4_11*P1C2S2J4_11 + s3s2_p1c2j4_11*P1C2S3J4_11+ c1c2_p1s2j4_11*P1C1S2J4_11 + c3c2_p1s2j4_11*P1C3S2J4_11 + c4c2_p1s2j4_11*P1C4S2J4_11 - (c2c3_p1s2j4_11+c2c4_p1s2j4_11)*P1C2S2J4_11+ j3j4_p1c2s2_11*P1C2S2J3_11 - j4j3_p1c2s2_11*P1C2S2J4_11
  deriv(P1C2S3J1_11) <- age_up*P1C2S3J1_10_lag - age_up*P1C2S3J1_11_lag + r*P2C2S3J1_11 - f*P1C2S3J1_11+ s2s3_p1c2j1_11*P1C2S2J1_11 - s3s2_p1c2j1_11*P1C2S3J1_11+ c1c2_p1s3j1_11*P1C1S3J1_11 + c3c2_p1s3j1_11*P1C3S3J1_11 + c4c2_p1s3j1_11*P1C4S3J1_11 - (c2c3_p1s3j1_11+c2c4_p1s3j1_11)*P1C2S3J1_11- j1j2_p1c2s3_11*P1C2S3J1_11
  deriv(P1C2S3J2_11) <- age_up*P1C2S3J2_10_lag - age_up*P1C2S3J2_11_lag + r*P2C2S3J2_11 - f*P1C2S3J2_11+ s2s3_p1c2j2_11*P1C2S2J2_11 - s3s2_p1c2j2_11*P1C2S3J2_11+ c1c2_p1s3j2_11*P1C1S3J2_11 + c3c2_p1s3j2_11*P1C3S3J2_11 + c4c2_p1s3j2_11*P1C4S3J2_11 - (c2c3_p1s3j2_11+c2c4_p1s3j2_11)*P1C2S3J2_11+ j1j2_p1c2s3_11*P1C2S3J1_11 - j2j3_p1c2s3_11*P1C2S3J2_11
  deriv(P1C2S3J3_11) <- age_up*P1C2S3J3_10_lag - age_up*P1C2S3J3_11_lag + r*P2C2S3J3_11 - f*P1C2S3J3_11+ s2s3_p1c2j3_11*P1C2S2J3_11 - s3s2_p1c2j3_11*P1C2S3J3_11+ c1c2_p1s3j3_11*P1C1S3J3_11 + c3c2_p1s3j3_11*P1C3S3J3_11 + c4c2_p1s3j3_11*P1C4S3J3_11 - (c2c3_p1s3j3_11+c2c4_p1s3j3_11)*P1C2S3J3_11+ j2j3_p1c2s3_11*P1C2S3J2_11 + j4j3_p1c2s3_11*P1C2S3J4_11 - j3j4_p1c2s3_11*P1C2S3J3_11
  deriv(P1C2S3J4_11) <- age_up*P1C2S3J4_10_lag - age_up*P1C2S3J4_11_lag + r*P2C2S3J4_11 - f*P1C2S3J4_11+ s2s3_p1c2j4_11*P1C2S2J4_11 - s3s2_p1c2j4_11*P1C2S3J4_11+ c1c2_p1s3j4_11*P1C1S3J4_11 + c3c2_p1s3j4_11*P1C3S3J4_11 + c4c2_p1s3j4_11*P1C4S3J4_11 - (c2c3_p1s3j4_11+c2c4_p1s3j4_11)*P1C2S3J4_11+ j3j4_p1c2s3_11*P1C2S3J3_11 - j4j3_p1c2s3_11*P1C2S3J4_11
  deriv(P1C3S1J1_11) <- age_up*P1C3S1J1_10_lag - age_up*P1C3S1J1_11_lag + r*P2C3S1J1_11 - f*P1C3S1J1_11- s1s2_p1c3j1_11*P1C3S1J1_11+ c1c3_p1s1j1_11*P1C1S1J1_11+ c2c3_p1s1j1_11*P1C2S1J1_11 + c4c3_p1s1j1_11*P1C4S1J1_11 - (c3c2_p1s1j1_11+c3c4_p1s1j1_11)*P1C3S1J1_11- j1j2_p1c3s1_11*P1C3S1J1_11
  deriv(P1C3S1J2_11) <- age_up*P1C3S1J2_10_lag - age_up*P1C3S1J2_11_lag + r*P2C3S1J2_11 - f*P1C3S1J2_11- s1s2_p1c3j2_11*P1C3S1J2_11+ c1c3_p1s1j2_11*P1C1S1J2_11+ c2c3_p1s1j2_11*P1C2S1J2_11 + c4c3_p1s1j2_11*P1C4S1J2_11 - (c3c2_p1s1j2_11+c3c4_p1s1j2_11)*P1C3S1J2_11+ j1j2_p1c3s1_11*P1C3S1J1_11 - j2j3_p1c3s1_11*P1C3S1J2_11
  deriv(P1C3S1J3_11) <- age_up*P1C3S1J3_10_lag - age_up*P1C3S1J3_11_lag + r*P2C3S1J3_11 - f*P1C3S1J3_11- s1s2_p1c3j3_11*P1C3S1J3_11+ c1c3_p1s1j3_11*P1C1S1J3_11+ c2c3_p1s1j3_11*P1C2S1J3_11 + c4c3_p1s1j3_11*P1C4S1J3_11 - (c3c2_p1s1j3_11+c3c4_p1s1j3_11)*P1C3S1J3_11+ j2j3_p1c3s1_11*P1C3S1J2_11 + j4j3_p1c3s1_11*P1C3S1J4_11 - j3j4_p1c3s1_11*P1C3S1J3_11
  deriv(P1C3S1J4_11) <- age_up*P1C3S1J4_10_lag - age_up*P1C3S1J4_11_lag + r*P2C3S1J4_11 - f*P1C3S1J4_11- s1s2_p1c3j4_11*P1C3S1J4_11+ c1c3_p1s1j4_11*P1C1S1J4_11+ c2c3_p1s1j4_11*P1C2S1J4_11 + c4c3_p1s1j4_11*P1C4S1J4_11 - (c3c2_p1s1j4_11+c3c4_p1s1j4_11)*P1C3S1J4_11+ j3j4_p1c3s1_11*P1C3S1J3_11 - j4j3_p1c3s1_11*P1C3S1J4_11
  deriv(P1C3S2J1_11) <- age_up*P1C3S2J1_10_lag - age_up*P1C3S2J1_11_lag + r*P2C3S2J1_11 - f*P1C3S2J1_11+ s1s2_p1c3j1_11*P1C3S1J1_11 - s2s3_p1c3j1_11*P1C3S2J1_11 + s3s2_p1c3j1_11*P1C3S3J1_11+ c1c3_p1s2j1_11*P1C1S2J1_11+ c2c3_p1s2j1_11*P1C2S2J1_11 + c4c3_p1s2j1_11*P1C4S2J1_11 - (c3c2_p1s2j1_11+c3c4_p1s2j1_11)*P1C3S2J1_11- j1j2_p1c3s2_11*P1C3S2J1_11
  deriv(P1C3S2J2_11) <- age_up*P1C3S2J2_10_lag - age_up*P1C3S2J2_11_lag + r*P2C3S2J2_11 - f*P1C3S2J2_11+ s1s2_p1c3j2_11*P1C3S1J2_11 - s2s3_p1c3j2_11*P1C3S2J2_11 + s3s2_p1c3j2_11*P1C3S3J2_11+ c1c3_p1s2j2_11*P1C1S2J2_11+ c2c3_p1s2j2_11*P1C2S2J2_11 + c4c3_p1s2j2_11*P1C4S2J2_11 - (c3c2_p1s2j2_11+c3c4_p1s2j2_11)*P1C3S2J2_11+ j1j2_p1c3s2_11*P1C3S2J1_11 - j2j3_p1c3s2_11*P1C3S2J2_11
  deriv(P1C3S2J3_11) <- age_up*P1C3S2J3_10_lag - age_up*P1C3S2J3_11_lag + r*P2C3S2J3_11 - f*P1C3S2J3_11+ s1s2_p1c3j3_11*P1C3S1J3_11 - s2s3_p1c3j3_11*P1C3S2J3_11 + s3s2_p1c3j3_11*P1C3S3J3_11+ c1c3_p1s2j3_11*P1C1S2J3_11+ c2c3_p1s2j3_11*P1C2S2J3_11 + c4c3_p1s2j3_11*P1C4S2J3_11 - (c3c2_p1s2j3_11+c3c4_p1s2j3_11)*P1C3S2J3_11+ j2j3_p1c3s2_11*P1C3S2J2_11 + j4j3_p1c3s2_11*P1C3S2J4_11 - j3j4_p1c3s2_11*P1C3S2J3_11
  deriv(P1C3S2J4_11) <- age_up*P1C3S2J4_10_lag - age_up*P1C3S2J4_11_lag + r*P2C3S2J4_11 - f*P1C3S2J4_11+ s1s2_p1c3j4_11*P1C3S1J4_11 - s2s3_p1c3j4_11*P1C3S2J4_11 + s3s2_p1c3j4_11*P1C3S3J4_11+ c1c3_p1s2j4_11*P1C1S2J4_11+ c2c3_p1s2j4_11*P1C2S2J4_11 + c4c3_p1s2j4_11*P1C4S2J4_11 - (c3c2_p1s2j4_11+c3c4_p1s2j4_11)*P1C3S2J4_11+ j3j4_p1c3s2_11*P1C3S2J3_11 - j4j3_p1c3s2_11*P1C3S2J4_11
  deriv(P1C3S3J1_11) <- age_up*P1C3S3J1_10_lag - age_up*P1C3S3J1_11_lag + r*P2C3S3J1_11 - f*P1C3S3J1_11+ s2s3_p1c3j1_11*P1C3S2J1_11 - s3s2_p1c3j1_11*P1C3S3J1_11+ c1c3_p1s3j1_11*P1C1S3J1_11+ c2c3_p1s3j1_11*P1C2S3J1_11 + c4c3_p1s3j1_11*P1C4S3J1_11 - (c3c2_p1s3j1_11+c3c4_p1s3j1_11)*P1C3S3J1_11- j1j2_p1c3s3_11*P1C3S3J1_11
  deriv(P1C3S3J2_11) <- age_up*P1C3S3J2_10_lag - age_up*P1C3S3J2_11_lag + r*P2C3S3J2_11 - f*P1C3S3J2_11+ s2s3_p1c3j2_11*P1C3S2J2_11 - s3s2_p1c3j2_11*P1C3S3J2_11+ c1c3_p1s3j2_11*P1C1S3J2_11+ c2c3_p1s3j2_11*P1C2S3J2_11 + c4c3_p1s3j2_11*P1C4S3J2_11 - (c3c2_p1s3j2_11+c3c4_p1s3j2_11)*P1C3S3J2_11+ j1j2_p1c3s3_11*P1C3S3J1_11 - j2j3_p1c3s3_11*P1C3S3J2_11
  deriv(P1C3S3J3_11) <- age_up*P1C3S3J3_10_lag - age_up*P1C3S3J3_11_lag + r*P2C3S3J3_11 - f*P1C3S3J3_11+ s2s3_p1c3j3_11*P1C3S2J3_11 - s3s2_p1c3j3_11*P1C3S3J3_11+ c1c3_p1s3j3_11*P1C1S3J3_11+ c2c3_p1s3j3_11*P1C2S3J3_11 + c4c3_p1s3j3_11*P1C4S3J3_11 - (c3c2_p1s3j3_11+c3c4_p1s3j3_11)*P1C3S3J3_11+ j2j3_p1c3s3_11*P1C3S3J2_11 + j4j3_p1c3s3_11*P1C3S3J4_11 - j3j4_p1c3s3_11*P1C3S3J3_11
  deriv(P1C3S3J4_11) <- age_up*P1C3S3J4_10_lag - age_up*P1C3S3J4_11_lag + r*P2C3S3J4_11 - f*P1C3S3J4_11+ s2s3_p1c3j4_11*P1C3S2J4_11 - s3s2_p1c3j4_11*P1C3S3J4_11+ c1c3_p1s3j4_11*P1C1S3J4_11+ c2c3_p1s3j4_11*P1C2S3J4_11 + c4c3_p1s3j4_11*P1C4S3J4_11 - (c3c2_p1s3j4_11+c3c4_p1s3j4_11)*P1C3S3J4_11+ j3j4_p1c3s3_11*P1C3S3J3_11 - j4j3_p1c3s3_11*P1C3S3J4_11
  deriv(P1C4S1J1_11) <- age_up*P1C4S1J1_10_lag - age_up*P1C4S1J1_11_lag + r*P2C4S1J1_11 - f*P1C4S1J1_11- s1s2_p1c4j1_11*P1C4S1J1_11+ c2c4_p1s1j1_11*P1C2S1J1_11 + c3c4_p1s1j1_11*P1C3S1J1_11- (c4c2_p1s1j1_11+c4c3_p1s1j1_11)*P1C4S1J1_11- j1j2_p1c4s1_11*P1C4S1J1_11
  deriv(P1C4S1J2_11) <- age_up*P1C4S1J2_10_lag - age_up*P1C4S1J2_11_lag + r*P2C4S1J2_11 - f*P1C4S1J2_11- s1s2_p1c4j2_11*P1C4S1J2_11+ c2c4_p1s1j2_11*P1C2S1J2_11 + c3c4_p1s1j2_11*P1C3S1J2_11- (c4c2_p1s1j2_11+c4c3_p1s1j2_11)*P1C4S1J2_11+ j1j2_p1c4s1_11*P1C4S1J1_11 - j2j3_p1c4s1_11*P1C4S1J2_11
  deriv(P1C4S1J3_11) <- age_up*P1C4S1J3_10_lag - age_up*P1C4S1J3_11_lag + r*P2C4S1J3_11 - f*P1C4S1J3_11- s1s2_p1c4j3_11*P1C4S1J3_11+ c2c4_p1s1j3_11*P1C2S1J3_11 + c3c4_p1s1j3_11*P1C3S1J3_11- (c4c2_p1s1j3_11+c4c3_p1s1j3_11)*P1C4S1J3_11+ j2j3_p1c4s1_11*P1C4S1J2_11 + j4j3_p1c4s1_11*P1C4S1J4_11 - j3j4_p1c4s1_11*P1C4S1J3_11
  deriv(P1C4S1J4_11) <- age_up*P1C4S1J4_10_lag - age_up*P1C4S1J4_11_lag + r*P2C4S1J4_11 - f*P1C4S1J4_11- s1s2_p1c4j4_11*P1C4S1J4_11+ c2c4_p1s1j4_11*P1C2S1J4_11 + c3c4_p1s1j4_11*P1C3S1J4_11- (c4c2_p1s1j4_11+c4c3_p1s1j4_11)*P1C4S1J4_11+ j3j4_p1c4s1_11*P1C4S1J3_11 - j4j3_p1c4s1_11*P1C4S1J4_11
  deriv(P1C4S2J1_11) <- age_up*P1C4S2J1_10_lag - age_up*P1C4S2J1_11_lag + r*P2C4S2J1_11 - f*P1C4S2J1_11+ s1s2_p1c4j1_11*P1C4S1J1_11 - s2s3_p1c4j1_11*P1C4S2J1_11 + s3s2_p1c4j1_11*P1C4S3J1_11+ c2c4_p1s2j1_11*P1C2S2J1_11 + c3c4_p1s2j1_11*P1C3S2J1_11- (c4c2_p1s2j1_11+c4c3_p1s2j1_11)*P1C4S2J1_11- j1j2_p1c4s2_11*P1C4S2J1_11
  deriv(P1C4S2J2_11) <- age_up*P1C4S2J2_10_lag - age_up*P1C4S2J2_11_lag + r*P2C4S2J2_11 - f*P1C4S2J2_11+ s1s2_p1c4j2_11*P1C4S1J2_11 - s2s3_p1c4j2_11*P1C4S2J2_11 + s3s2_p1c4j2_11*P1C4S3J2_11+ c2c4_p1s2j2_11*P1C2S2J2_11 + c3c4_p1s2j2_11*P1C3S2J2_11- (c4c2_p1s2j2_11+c4c3_p1s2j2_11)*P1C4S2J2_11+ j1j2_p1c4s2_11*P1C4S2J1_11 - j2j3_p1c4s2_11*P1C4S2J2_11
  deriv(P1C4S2J3_11) <- age_up*P1C4S2J3_10_lag - age_up*P1C4S2J3_11_lag + r*P2C4S2J3_11 - f*P1C4S2J3_11+ s1s2_p1c4j3_11*P1C4S1J3_11 - s2s3_p1c4j3_11*P1C4S2J3_11 + s3s2_p1c4j3_11*P1C4S3J3_11+ c2c4_p1s2j3_11*P1C2S2J3_11 + c3c4_p1s2j3_11*P1C3S2J3_11- (c4c2_p1s2j3_11+c4c3_p1s2j3_11)*P1C4S2J3_11+ j2j3_p1c4s2_11*P1C4S2J2_11 + j4j3_p1c4s2_11*P1C4S2J4_11 - j3j4_p1c4s2_11*P1C4S2J3_11
  deriv(P1C4S2J4_11) <- age_up*P1C4S2J4_10_lag - age_up*P1C4S2J4_11_lag + r*P2C4S2J4_11 - f*P1C4S2J4_11+ s1s2_p1c4j4_11*P1C4S1J4_11 - s2s3_p1c4j4_11*P1C4S2J4_11 + s3s2_p1c4j4_11*P1C4S3J4_11+ c2c4_p1s2j4_11*P1C2S2J4_11 + c3c4_p1s2j4_11*P1C3S2J4_11- (c4c2_p1s2j4_11+c4c3_p1s2j4_11)*P1C4S2J4_11+ j3j4_p1c4s2_11*P1C4S2J3_11 - j4j3_p1c4s2_11*P1C4S2J4_11
  deriv(P1C4S3J1_11) <- age_up*P1C4S3J1_10_lag - age_up*P1C4S3J1_11_lag + r*P2C4S3J1_11 - f*P1C4S3J1_11+ s2s3_p1c4j1_11*P1C4S2J1_11 - s3s2_p1c4j1_11*P1C4S3J1_11+ c2c4_p1s3j1_11*P1C2S3J1_11 + c3c4_p1s3j1_11*P1C3S3J1_11- (c4c2_p1s3j1_11+c4c3_p1s3j1_11)*P1C4S3J1_11- j1j2_p1c4s3_11*P1C4S3J1_11
  deriv(P1C4S3J2_11) <- age_up*P1C4S3J2_10_lag - age_up*P1C4S3J2_11_lag + r*P2C4S3J2_11 - f*P1C4S3J2_11+ s2s3_p1c4j2_11*P1C4S2J2_11 - s3s2_p1c4j2_11*P1C4S3J2_11+ c2c4_p1s3j2_11*P1C2S3J2_11 + c3c4_p1s3j2_11*P1C3S3J2_11- (c4c2_p1s3j2_11+c4c3_p1s3j2_11)*P1C4S3J2_11+ j1j2_p1c4s3_11*P1C4S3J1_11 - j2j3_p1c4s3_11*P1C4S3J2_11
  deriv(P1C4S3J3_11) <- age_up*P1C4S3J3_10_lag - age_up*P1C4S3J3_11_lag + r*P2C4S3J3_11 - f*P1C4S3J3_11+ s2s3_p1c4j3_11*P1C4S2J3_11 - s3s2_p1c4j3_11*P1C4S3J3_11+ c2c4_p1s3j3_11*P1C2S3J3_11 + c3c4_p1s3j3_11*P1C3S3J3_11- (c4c2_p1s3j3_11+c4c3_p1s3j3_11)*P1C4S3J3_11+ j2j3_p1c4s3_11*P1C4S3J2_11 + j4j3_p1c4s3_11*P1C4S3J4_11 - j3j4_p1c4s3_11*P1C4S3J3_11
  deriv(P1C4S3J4_11) <- age_up*P1C4S3J4_10_lag - age_up*P1C4S3J4_11_lag + r*P2C4S3J4_11 - f*P1C4S3J4_11+ s2s3_p1c4j4_11*P1C4S2J4_11 - s3s2_p1c4j4_11*P1C4S3J4_11+ c2c4_p1s3j4_11*P1C2S3J4_11 + c3c4_p1s3j4_11*P1C3S3J4_11- (c4c2_p1s3j4_11+c4c3_p1s3j4_11)*P1C4S3J4_11+ j3j4_p1c4s3_11*P1C4S3J3_11 - j4j3_p1c4s3_11*P1C4S3J4_11
  deriv(P2C1S1J1_11) <- age_up*P2C1S1J1_10_lag - age_up*P2C1S1J1_11_lag  + f*P1C1S1J1_11 - r*P2C1S1J1_11- s1s2_p2c1j1_11*P2C1S1J1_11- (c1c2_p2s1j1_11+c1c3_p2s1j1_11)*P2C1S1J1_11- j1j2_p2c1s1_11*P2C1S1J1_11
  deriv(P2C1S1J2_11) <- age_up*P2C1S1J2_10_lag - age_up*P2C1S1J2_11_lag  + f*P1C1S1J2_11 - r*P2C1S1J2_11- s1s2_p2c1j2_11*P2C1S1J2_11- (c1c2_p2s1j2_11+c1c3_p2s1j2_11)*P2C1S1J2_11+ j1j2_p2c1s1_11*P2C1S1J1_11 - j2j3_p2c1s1_11*P2C1S1J2_11
  deriv(P2C1S1J3_11) <- age_up*P2C1S1J3_10_lag - age_up*P2C1S1J3_11_lag  + f*P1C1S1J3_11 - r*P2C1S1J3_11- s1s2_p2c1j3_11*P2C1S1J3_11- (c1c2_p2s1j3_11+c1c3_p2s1j3_11)*P2C1S1J3_11+ j2j3_p2c1s1_11*P2C1S1J2_11 + j4j3_p2c1s1_11*P2C1S1J4_11 - j3j4_p2c1s1_11*P2C1S1J3_11
  deriv(P2C1S1J4_11) <- age_up*P2C1S1J4_10_lag - age_up*P2C1S1J4_11_lag  + f*P1C1S1J4_11 - r*P2C1S1J4_11- s1s2_p2c1j4_11*P2C1S1J4_11- (c1c2_p2s1j4_11+c1c3_p2s1j4_11)*P2C1S1J4_11+ j3j4_p2c1s1_11*P2C1S1J3_11 - j4j3_p2c1s1_11*P2C1S1J4_11
  deriv(P2C1S2J1_11) <- age_up*P2C1S2J1_10_lag - age_up*P2C1S2J1_11_lag  + f*P1C1S2J1_11 - r*P2C1S2J1_11+ s1s2_p2c1j1_11*P2C1S1J1_11 - s2s3_p2c1j1_11*P2C1S2J1_11 + s3s2_p2c1j1_11*P2C1S3J1_11- (c1c2_p2s2j1_11+c1c3_p2s2j1_11)*P2C1S2J1_11- j1j2_p2c1s2_11*P2C1S2J1_11
  deriv(P2C1S2J2_11) <- age_up*P2C1S2J2_10_lag - age_up*P2C1S2J2_11_lag  + f*P1C1S2J2_11 - r*P2C1S2J2_11+ s1s2_p2c1j2_11*P2C1S1J2_11 - s2s3_p2c1j2_11*P2C1S2J2_11 + s3s2_p2c1j2_11*P2C1S3J2_11- (c1c2_p2s2j2_11+c1c3_p2s2j2_11)*P2C1S2J2_11+ j1j2_p2c1s2_11*P2C1S2J1_11 - j2j3_p2c1s2_11*P2C1S2J2_11
  deriv(P2C1S2J3_11) <- age_up*P2C1S2J3_10_lag - age_up*P2C1S2J3_11_lag  + f*P1C1S2J3_11 - r*P2C1S2J3_11+ s1s2_p2c1j3_11*P2C1S1J3_11 - s2s3_p2c1j3_11*P2C1S2J3_11 + s3s2_p2c1j3_11*P2C1S3J3_11- (c1c2_p2s2j3_11+c1c3_p2s2j3_11)*P2C1S2J3_11+ j2j3_p2c1s2_11*P2C1S2J2_11 + j4j3_p2c1s2_11*P2C1S2J4_11 - j3j4_p2c1s2_11*P2C1S2J3_11
  deriv(P2C1S2J4_11) <- age_up*P2C1S2J4_10_lag - age_up*P2C1S2J4_11_lag  + f*P1C1S2J4_11 - r*P2C1S2J4_11+ s1s2_p2c1j4_11*P2C1S1J4_11 - s2s3_p2c1j4_11*P2C1S2J4_11 + s3s2_p2c1j4_11*P2C1S3J4_11- (c1c2_p2s2j4_11+c1c3_p2s2j4_11)*P2C1S2J4_11+ j3j4_p2c1s2_11*P2C1S2J3_11 - j4j3_p2c1s2_11*P2C1S2J4_11
  deriv(P2C1S3J1_11) <- age_up*P2C1S3J1_10_lag - age_up*P2C1S3J1_11_lag  + f*P1C1S3J1_11 - r*P2C1S3J1_11+ s2s3_p2c1j1_11*P2C1S2J1_11 - s3s2_p2c1j1_11*P2C1S3J1_11- (c1c2_p2s3j1_11+c1c3_p2s3j1_11)*P2C1S3J1_11- j1j2_p2c1s3_11*P2C1S3J1_11
  deriv(P2C1S3J2_11) <- age_up*P2C1S3J2_10_lag - age_up*P2C1S3J2_11_lag  + f*P1C1S3J2_11 - r*P2C1S3J2_11+ s2s3_p2c1j2_11*P2C1S2J2_11 - s3s2_p2c1j2_11*P2C1S3J2_11- (c1c2_p2s3j2_11+c1c3_p2s3j2_11)*P2C1S3J2_11+ j1j2_p2c1s3_11*P2C1S3J1_11 - j2j3_p2c1s3_11*P2C1S3J2_11
  deriv(P2C1S3J3_11) <- age_up*P2C1S3J3_10_lag - age_up*P2C1S3J3_11_lag  + f*P1C1S3J3_11 - r*P2C1S3J3_11+ s2s3_p2c1j3_11*P2C1S2J3_11 - s3s2_p2c1j3_11*P2C1S3J3_11- (c1c2_p2s3j3_11+c1c3_p2s3j3_11)*P2C1S3J3_11+ j2j3_p2c1s3_11*P2C1S3J2_11 + j4j3_p2c1s3_11*P2C1S3J4_11 - j3j4_p2c1s3_11*P2C1S3J3_11
  deriv(P2C1S3J4_11) <- age_up*P2C1S3J4_10_lag - age_up*P2C1S3J4_11_lag  + f*P1C1S3J4_11 - r*P2C1S3J4_11+ s2s3_p2c1j4_11*P2C1S2J4_11 - s3s2_p2c1j4_11*P2C1S3J4_11- (c1c2_p2s3j4_11+c1c3_p2s3j4_11)*P2C1S3J4_11+ j3j4_p2c1s3_11*P2C1S3J3_11 - j4j3_p2c1s3_11*P2C1S3J4_11
  deriv(P2C2S1J1_11) <- age_up*P2C2S1J1_10_lag - age_up*P2C2S1J1_11_lag  + f*P1C2S1J1_11 - r*P2C2S1J1_11- s1s2_p2c2j1_11*P2C2S1J1_11+ c1c2_p2s1j1_11*P2C1S1J1_11 + c3c2_p2s1j1_11*P2C3S1J1_11 + c4c2_p2s1j1_11*P2C4S1J1_11 - (c2c3_p2s1j1_11+c2c4_p2s1j1_11)*P2C2S1J1_11- j1j2_p2c2s1_11*P2C2S1J1_11
  deriv(P2C2S1J2_11) <- age_up*P2C2S1J2_10_lag - age_up*P2C2S1J2_11_lag  + f*P1C2S1J2_11 - r*P2C2S1J2_11- s1s2_p2c2j2_11*P2C2S1J2_11+ c1c2_p2s1j2_11*P2C1S1J2_11 + c3c2_p2s1j2_11*P2C3S1J2_11 + c4c2_p2s1j2_11*P2C4S1J2_11 - (c2c3_p2s1j2_11+c2c4_p2s1j2_11)*P2C2S1J2_11+ j1j2_p2c2s1_11*P2C2S1J1_11 - j2j3_p2c2s1_11*P2C2S1J2_11
  deriv(P2C2S1J3_11) <- age_up*P2C2S1J3_10_lag - age_up*P2C2S1J3_11_lag  + f*P1C2S1J3_11 - r*P2C2S1J3_11- s1s2_p2c2j3_11*P2C2S1J3_11+ c1c2_p2s1j3_11*P2C1S1J3_11 + c3c2_p2s1j3_11*P2C3S1J3_11 + c4c2_p2s1j3_11*P2C4S1J3_11 - (c2c3_p2s1j3_11+c2c4_p2s1j3_11)*P2C2S1J3_11+ j2j3_p2c2s1_11*P2C2S1J2_11 + j4j3_p2c2s1_11*P2C2S1J4_11 - j3j4_p2c2s1_11*P2C2S1J3_11
  deriv(P2C2S1J4_11) <- age_up*P2C2S1J4_10_lag - age_up*P2C2S1J4_11_lag  + f*P1C2S1J4_11 - r*P2C2S1J4_11- s1s2_p2c2j4_11*P2C2S1J4_11+ c1c2_p2s1j4_11*P2C1S1J4_11 + c3c2_p2s1j4_11*P2C3S1J4_11 + c4c2_p2s1j4_11*P2C4S1J4_11 - (c2c3_p2s1j4_11+c2c4_p2s1j4_11)*P2C2S1J4_11+ j3j4_p2c2s1_11*P2C2S1J3_11 - j4j3_p2c2s1_11*P2C2S1J4_11
  deriv(P2C2S2J1_11) <- age_up*P2C2S2J1_10_lag - age_up*P2C2S2J1_11_lag  + f*P1C2S2J1_11 - r*P2C2S2J1_11+ s1s2_p2c2j1_11*P2C2S1J1_11 - s2s3_p2c2j1_11*P2C2S2J1_11 + s3s2_p2c2j1_11*P2C2S3J1_11+ c1c2_p2s2j1_11*P2C1S2J1_11 + c3c2_p2s2j1_11*P2C3S2J1_11 + c4c2_p2s2j1_11*P2C4S2J1_11 - (c2c3_p2s2j1_11+c2c4_p2s2j1_11)*P2C2S2J1_11- j1j2_p2c2s2_11*P2C2S2J1_11
  deriv(P2C2S2J2_11) <- age_up*P2C2S2J2_10_lag - age_up*P2C2S2J2_11_lag  + f*P1C2S2J2_11 - r*P2C2S2J2_11+ s1s2_p2c2j2_11*P2C2S1J2_11 - s2s3_p2c2j2_11*P2C2S2J2_11 + s3s2_p2c2j2_11*P2C2S3J2_11+ c1c2_p2s2j2_11*P2C1S2J2_11 + c3c2_p2s2j2_11*P2C3S2J2_11 + c4c2_p2s2j2_11*P2C4S2J2_11 - (c2c3_p2s2j2_11+c2c4_p2s2j2_11)*P2C2S2J2_11+ j1j2_p2c2s2_11*P2C2S2J1_11 - j2j3_p2c2s2_11*P2C2S2J2_11
  deriv(P2C2S2J3_11) <- age_up*P2C2S2J3_10_lag - age_up*P2C2S2J3_11_lag  + f*P1C2S2J3_11 - r*P2C2S2J3_11+ s1s2_p2c2j3_11*P2C2S1J3_11 - s2s3_p2c2j3_11*P2C2S2J3_11 + s3s2_p2c2j3_11*P2C2S3J3_11+ c1c2_p2s2j3_11*P2C1S2J3_11 + c3c2_p2s2j3_11*P2C3S2J3_11 + c4c2_p2s2j3_11*P2C4S2J3_11 - (c2c3_p2s2j3_11+c2c4_p2s2j3_11)*P2C2S2J3_11+ j2j3_p2c2s2_11*P2C2S2J2_11 + j4j3_p2c2s2_11*P2C2S2J4_11 - j3j4_p2c2s2_11*P2C2S2J3_11
  deriv(P2C2S2J4_11) <- age_up*P2C2S2J4_10_lag - age_up*P2C2S2J4_11_lag  + f*P1C2S2J4_11 - r*P2C2S2J4_11+ s1s2_p2c2j4_11*P2C2S1J4_11 - s2s3_p2c2j4_11*P2C2S2J4_11 + s3s2_p2c2j4_11*P2C2S3J4_11+ c1c2_p2s2j4_11*P2C1S2J4_11 + c3c2_p2s2j4_11*P2C3S2J4_11 + c4c2_p2s2j4_11*P2C4S2J4_11 - (c2c3_p2s2j4_11+c2c4_p2s2j4_11)*P2C2S2J4_11+ j3j4_p2c2s2_11*P2C2S2J3_11 - j4j3_p2c2s2_11*P2C2S2J4_11
  deriv(P2C2S3J1_11) <- age_up*P2C2S3J1_10_lag - age_up*P2C2S3J1_11_lag  + f*P1C2S3J1_11 - r*P2C2S3J1_11+ s2s3_p2c2j1_11*P2C2S2J1_11 - s3s2_p2c2j1_11*P2C2S3J1_11+ c1c2_p2s3j1_11*P2C1S3J1_11 + c3c2_p2s3j1_11*P2C3S3J1_11 + c4c2_p2s3j1_11*P2C4S3J1_11 - (c2c3_p2s3j1_11+c2c4_p2s3j1_11)*P2C2S3J1_11- j1j2_p2c2s3_11*P2C2S3J1_11
  deriv(P2C2S3J2_11) <- age_up*P2C2S3J2_10_lag - age_up*P2C2S3J2_11_lag  + f*P1C2S3J2_11 - r*P2C2S3J2_11+ s2s3_p2c2j2_11*P2C2S2J2_11 - s3s2_p2c2j2_11*P2C2S3J2_11+ c1c2_p2s3j2_11*P2C1S3J2_11 + c3c2_p2s3j2_11*P2C3S3J2_11 + c4c2_p2s3j2_11*P2C4S3J2_11 - (c2c3_p2s3j2_11+c2c4_p2s3j2_11)*P2C2S3J2_11+ j1j2_p2c2s3_11*P2C2S3J1_11 - j2j3_p2c2s3_11*P2C2S3J2_11
  deriv(P2C2S3J3_11) <- age_up*P2C2S3J3_10_lag - age_up*P2C2S3J3_11_lag  + f*P1C2S3J3_11 - r*P2C2S3J3_11+ s2s3_p2c2j3_11*P2C2S2J3_11 - s3s2_p2c2j3_11*P2C2S3J3_11+ c1c2_p2s3j3_11*P2C1S3J3_11 + c3c2_p2s3j3_11*P2C3S3J3_11 + c4c2_p2s3j3_11*P2C4S3J3_11 - (c2c3_p2s3j3_11+c2c4_p2s3j3_11)*P2C2S3J3_11+ j2j3_p2c2s3_11*P2C2S3J2_11 + j4j3_p2c2s3_11*P2C2S3J4_11 - j3j4_p2c2s3_11*P2C2S3J3_11
  deriv(P2C2S3J4_11) <- age_up*P2C2S3J4_10_lag - age_up*P2C2S3J4_11_lag  + f*P1C2S3J4_11 - r*P2C2S3J4_11+ s2s3_p2c2j4_11*P2C2S2J4_11 - s3s2_p2c2j4_11*P2C2S3J4_11+ c1c2_p2s3j4_11*P2C1S3J4_11 + c3c2_p2s3j4_11*P2C3S3J4_11 + c4c2_p2s3j4_11*P2C4S3J4_11 - (c2c3_p2s3j4_11+c2c4_p2s3j4_11)*P2C2S3J4_11+ j3j4_p2c2s3_11*P2C2S3J3_11 - j4j3_p2c2s3_11*P2C2S3J4_11
  deriv(P2C3S1J1_11) <- age_up*P2C3S1J1_10_lag - age_up*P2C3S1J1_11_lag  + f*P1C3S1J1_11 - r*P2C3S1J1_11- s1s2_p2c3j1_11*P2C3S1J1_11+ c1c3_p2s1j1_11*P2C1S1J1_11+ c2c3_p2s1j1_11*P2C2S1J1_11 + c4c3_p2s1j1_11*P2C4S1J1_11 - (c3c2_p2s1j1_11+c3c4_p2s1j1_11)*P2C3S1J1_11- j1j2_p2c3s1_11*P2C3S1J1_11
  deriv(P2C3S1J2_11) <- age_up*P2C3S1J2_10_lag - age_up*P2C3S1J2_11_lag  + f*P1C3S1J2_11 - r*P2C3S1J2_11- s1s2_p2c3j2_11*P2C3S1J2_11+ c1c3_p2s1j2_11*P2C1S1J2_11+ c2c3_p2s1j2_11*P2C2S1J2_11 + c4c3_p2s1j2_11*P2C4S1J2_11 - (c3c2_p2s1j2_11+c3c4_p2s1j2_11)*P2C3S1J2_11+ j1j2_p2c3s1_11*P2C3S1J1_11 - j2j3_p2c3s1_11*P2C3S1J2_11
  deriv(P2C3S1J3_11) <- age_up*P2C3S1J3_10_lag - age_up*P2C3S1J3_11_lag  + f*P1C3S1J3_11 - r*P2C3S1J3_11- s1s2_p2c3j3_11*P2C3S1J3_11+ c1c3_p2s1j3_11*P2C1S1J3_11+ c2c3_p2s1j3_11*P2C2S1J3_11 + c4c3_p2s1j3_11*P2C4S1J3_11 - (c3c2_p2s1j3_11+c3c4_p2s1j3_11)*P2C3S1J3_11+ j2j3_p2c3s1_11*P2C3S1J2_11 + j4j3_p2c3s1_11*P2C3S1J4_11 - j3j4_p2c3s1_11*P2C3S1J3_11
  deriv(P2C3S1J4_11) <- age_up*P2C3S1J4_10_lag - age_up*P2C3S1J4_11_lag  + f*P1C3S1J4_11 - r*P2C3S1J4_11- s1s2_p2c3j4_11*P2C3S1J4_11+ c1c3_p2s1j4_11*P2C1S1J4_11+ c2c3_p2s1j4_11*P2C2S1J4_11 + c4c3_p2s1j4_11*P2C4S1J4_11 - (c3c2_p2s1j4_11+c3c4_p2s1j4_11)*P2C3S1J4_11+ j3j4_p2c3s1_11*P2C3S1J3_11 - j4j3_p2c3s1_11*P2C3S1J4_11
  deriv(P2C3S2J1_11) <- age_up*P2C3S2J1_10_lag - age_up*P2C3S2J1_11_lag  + f*P1C3S2J1_11 - r*P2C3S2J1_11+ s1s2_p2c3j1_11*P2C3S1J1_11 - s2s3_p2c3j1_11*P2C3S2J1_11 + s3s2_p2c3j1_11*P2C3S3J1_11+ c1c3_p2s2j1_11*P2C1S2J1_11+ c2c3_p2s2j1_11*P2C2S2J1_11 + c4c3_p2s2j1_11*P2C4S2J1_11 - (c3c2_p2s2j1_11+c3c4_p2s2j1_11)*P2C3S2J1_11- j1j2_p2c3s2_11*P2C3S2J1_11
  deriv(P2C3S2J2_11) <- age_up*P2C3S2J2_10_lag - age_up*P2C3S2J2_11_lag  + f*P1C3S2J2_11 - r*P2C3S2J2_11+ s1s2_p2c3j2_11*P2C3S1J2_11 - s2s3_p2c3j2_11*P2C3S2J2_11 + s3s2_p2c3j2_11*P2C3S3J2_11+ c1c3_p2s2j2_11*P2C1S2J2_11+ c2c3_p2s2j2_11*P2C2S2J2_11 + c4c3_p2s2j2_11*P2C4S2J2_11 - (c3c2_p2s2j2_11+c3c4_p2s2j2_11)*P2C3S2J2_11+ j1j2_p2c3s2_11*P2C3S2J1_11 - j2j3_p2c3s2_11*P2C3S2J2_11
  deriv(P2C3S2J3_11) <- age_up*P2C3S2J3_10_lag - age_up*P2C3S2J3_11_lag  + f*P1C3S2J3_11 - r*P2C3S2J3_11+ s1s2_p2c3j3_11*P2C3S1J3_11 - s2s3_p2c3j3_11*P2C3S2J3_11 + s3s2_p2c3j3_11*P2C3S3J3_11+ c1c3_p2s2j3_11*P2C1S2J3_11+ c2c3_p2s2j3_11*P2C2S2J3_11 + c4c3_p2s2j3_11*P2C4S2J3_11 - (c3c2_p2s2j3_11+c3c4_p2s2j3_11)*P2C3S2J3_11+ j2j3_p2c3s2_11*P2C3S2J2_11 + j4j3_p2c3s2_11*P2C3S2J4_11 - j3j4_p2c3s2_11*P2C3S2J3_11
  deriv(P2C3S2J4_11) <- age_up*P2C3S2J4_10_lag - age_up*P2C3S2J4_11_lag  + f*P1C3S2J4_11 - r*P2C3S2J4_11+ s1s2_p2c3j4_11*P2C3S1J4_11 - s2s3_p2c3j4_11*P2C3S2J4_11 + s3s2_p2c3j4_11*P2C3S3J4_11+ c1c3_p2s2j4_11*P2C1S2J4_11+ c2c3_p2s2j4_11*P2C2S2J4_11 + c4c3_p2s2j4_11*P2C4S2J4_11 - (c3c2_p2s2j4_11+c3c4_p2s2j4_11)*P2C3S2J4_11+ j3j4_p2c3s2_11*P2C3S2J3_11 - j4j3_p2c3s2_11*P2C3S2J4_11
  deriv(P2C3S3J1_11) <- age_up*P2C3S3J1_10_lag - age_up*P2C3S3J1_11_lag  + f*P1C3S3J1_11 - r*P2C3S3J1_11+ s2s3_p2c3j1_11*P2C3S2J1_11 - s3s2_p2c3j1_11*P2C3S3J1_11+ c1c3_p2s3j1_11*P2C1S3J1_11+ c2c3_p2s3j1_11*P2C2S3J1_11 + c4c3_p2s3j1_11*P2C4S3J1_11 - (c3c2_p2s3j1_11+c3c4_p2s3j1_11)*P2C3S3J1_11- j1j2_p2c3s3_11*P2C3S3J1_11
  deriv(P2C3S3J2_11) <- age_up*P2C3S3J2_10_lag - age_up*P2C3S3J2_11_lag  + f*P1C3S3J2_11 - r*P2C3S3J2_11+ s2s3_p2c3j2_11*P2C3S2J2_11 - s3s2_p2c3j2_11*P2C3S3J2_11+ c1c3_p2s3j2_11*P2C1S3J2_11+ c2c3_p2s3j2_11*P2C2S3J2_11 + c4c3_p2s3j2_11*P2C4S3J2_11 - (c3c2_p2s3j2_11+c3c4_p2s3j2_11)*P2C3S3J2_11+ j1j2_p2c3s3_11*P2C3S3J1_11 - j2j3_p2c3s3_11*P2C3S3J2_11
  deriv(P2C3S3J3_11) <- age_up*P2C3S3J3_10_lag - age_up*P2C3S3J3_11_lag  + f*P1C3S3J3_11 - r*P2C3S3J3_11+ s2s3_p2c3j3_11*P2C3S2J3_11 - s3s2_p2c3j3_11*P2C3S3J3_11+ c1c3_p2s3j3_11*P2C1S3J3_11+ c2c3_p2s3j3_11*P2C2S3J3_11 + c4c3_p2s3j3_11*P2C4S3J3_11 - (c3c2_p2s3j3_11+c3c4_p2s3j3_11)*P2C3S3J3_11+ j2j3_p2c3s3_11*P2C3S3J2_11 + j4j3_p2c3s3_11*P2C3S3J4_11 - j3j4_p2c3s3_11*P2C3S3J3_11
  deriv(P2C3S3J4_11) <- age_up*P2C3S3J4_10_lag - age_up*P2C3S3J4_11_lag  + f*P1C3S3J4_11 - r*P2C3S3J4_11+ s2s3_p2c3j4_11*P2C3S2J4_11 - s3s2_p2c3j4_11*P2C3S3J4_11+ c1c3_p2s3j4_11*P2C1S3J4_11+ c2c3_p2s3j4_11*P2C2S3J4_11 + c4c3_p2s3j4_11*P2C4S3J4_11 - (c3c2_p2s3j4_11+c3c4_p2s3j4_11)*P2C3S3J4_11+ j3j4_p2c3s3_11*P2C3S3J3_11 - j4j3_p2c3s3_11*P2C3S3J4_11
  deriv(P2C4S1J1_11) <- age_up*P2C4S1J1_10_lag - age_up*P2C4S1J1_11_lag  + f*P1C4S1J1_11 - r*P2C4S1J1_11- s1s2_p2c4j1_11*P2C4S1J1_11+ c2c4_p2s1j1_11*P2C2S1J1_11 + c3c4_p2s1j1_11*P2C3S1J1_11- (c4c2_p2s1j1_11+c4c3_p2s1j1_11)*P2C4S1J1_11- j1j2_p2c4s1_11*P2C4S1J1_11
  deriv(P2C4S1J2_11) <- age_up*P2C4S1J2_10_lag - age_up*P2C4S1J2_11_lag  + f*P1C4S1J2_11 - r*P2C4S1J2_11- s1s2_p2c4j2_11*P2C4S1J2_11+ c2c4_p2s1j2_11*P2C2S1J2_11 + c3c4_p2s1j2_11*P2C3S1J2_11- (c4c2_p2s1j2_11+c4c3_p2s1j2_11)*P2C4S1J2_11+ j1j2_p2c4s1_11*P2C4S1J1_11 - j2j3_p2c4s1_11*P2C4S1J2_11
  deriv(P2C4S1J3_11) <- age_up*P2C4S1J3_10_lag - age_up*P2C4S1J3_11_lag  + f*P1C4S1J3_11 - r*P2C4S1J3_11- s1s2_p2c4j3_11*P2C4S1J3_11+ c2c4_p2s1j3_11*P2C2S1J3_11 + c3c4_p2s1j3_11*P2C3S1J3_11- (c4c2_p2s1j3_11+c4c3_p2s1j3_11)*P2C4S1J3_11+ j2j3_p2c4s1_11*P2C4S1J2_11 + j4j3_p2c4s1_11*P2C4S1J4_11 - j3j4_p2c4s1_11*P2C4S1J3_11
  deriv(P2C4S1J4_11) <- age_up*P2C4S1J4_10_lag - age_up*P2C4S1J4_11_lag  + f*P1C4S1J4_11 - r*P2C4S1J4_11- s1s2_p2c4j4_11*P2C4S1J4_11+ c2c4_p2s1j4_11*P2C2S1J4_11 + c3c4_p2s1j4_11*P2C3S1J4_11- (c4c2_p2s1j4_11+c4c3_p2s1j4_11)*P2C4S1J4_11+ j3j4_p2c4s1_11*P2C4S1J3_11 - j4j3_p2c4s1_11*P2C4S1J4_11
  deriv(P2C4S2J1_11) <- age_up*P2C4S2J1_10_lag - age_up*P2C4S2J1_11_lag  + f*P1C4S2J1_11 - r*P2C4S2J1_11+ s1s2_p2c4j1_11*P2C4S1J1_11 - s2s3_p2c4j1_11*P2C4S2J1_11 + s3s2_p2c4j1_11*P2C4S3J1_11+ c2c4_p2s2j1_11*P2C2S2J1_11 + c3c4_p2s2j1_11*P2C3S2J1_11- (c4c2_p2s2j1_11+c4c3_p2s2j1_11)*P2C4S2J1_11- j1j2_p2c4s2_11*P2C4S2J1_11
  deriv(P2C4S2J2_11) <- age_up*P2C4S2J2_10_lag - age_up*P2C4S2J2_11_lag  + f*P1C4S2J2_11 - r*P2C4S2J2_11+ s1s2_p2c4j2_11*P2C4S1J2_11 - s2s3_p2c4j2_11*P2C4S2J2_11 + s3s2_p2c4j2_11*P2C4S3J2_11+ c2c4_p2s2j2_11*P2C2S2J2_11 + c3c4_p2s2j2_11*P2C3S2J2_11- (c4c2_p2s2j2_11+c4c3_p2s2j2_11)*P2C4S2J2_11+ j1j2_p2c4s2_11*P2C4S2J1_11 - j2j3_p2c4s2_11*P2C4S2J2_11
  deriv(P2C4S2J3_11) <- age_up*P2C4S2J3_10_lag - age_up*P2C4S2J3_11_lag  + f*P1C4S2J3_11 - r*P2C4S2J3_11+ s1s2_p2c4j3_11*P2C4S1J3_11 - s2s3_p2c4j3_11*P2C4S2J3_11 + s3s2_p2c4j3_11*P2C4S3J3_11+ c2c4_p2s2j3_11*P2C2S2J3_11 + c3c4_p2s2j3_11*P2C3S2J3_11- (c4c2_p2s2j3_11+c4c3_p2s2j3_11)*P2C4S2J3_11+ j2j3_p2c4s2_11*P2C4S2J2_11 + j4j3_p2c4s2_11*P2C4S2J4_11 - j3j4_p2c4s2_11*P2C4S2J3_11
  deriv(P2C4S2J4_11) <- age_up*P2C4S2J4_10_lag - age_up*P2C4S2J4_11_lag  + f*P1C4S2J4_11 - r*P2C4S2J4_11+ s1s2_p2c4j4_11*P2C4S1J4_11 - s2s3_p2c4j4_11*P2C4S2J4_11 + s3s2_p2c4j4_11*P2C4S3J4_11+ c2c4_p2s2j4_11*P2C2S2J4_11 + c3c4_p2s2j4_11*P2C3S2J4_11- (c4c2_p2s2j4_11+c4c3_p2s2j4_11)*P2C4S2J4_11+ j3j4_p2c4s2_11*P2C4S2J3_11 - j4j3_p2c4s2_11*P2C4S2J4_11
  deriv(P2C4S3J1_11) <- age_up*P2C4S3J1_10_lag - age_up*P2C4S3J1_11_lag  + f*P1C4S3J1_11 - r*P2C4S3J1_11+ s2s3_p2c4j1_11*P2C4S2J1_11 - s3s2_p2c4j1_11*P2C4S3J1_11+ c2c4_p2s3j1_11*P2C2S3J1_11 + c3c4_p2s3j1_11*P2C3S3J1_11- (c4c2_p2s3j1_11+c4c3_p2s3j1_11)*P2C4S3J1_11- j1j2_p2c4s3_11*P2C4S3J1_11
  deriv(P2C4S3J2_11) <- age_up*P2C4S3J2_10_lag - age_up*P2C4S3J2_11_lag  + f*P1C4S3J2_11 - r*P2C4S3J2_11+ s2s3_p2c4j2_11*P2C4S2J2_11 - s3s2_p2c4j2_11*P2C4S3J2_11+ c2c4_p2s3j2_11*P2C2S3J2_11 + c3c4_p2s3j2_11*P2C3S3J2_11- (c4c2_p2s3j2_11+c4c3_p2s3j2_11)*P2C4S3J2_11+ j1j2_p2c4s3_11*P2C4S3J1_11 - j2j3_p2c4s3_11*P2C4S3J2_11
  deriv(P2C4S3J3_11) <- age_up*P2C4S3J3_10_lag - age_up*P2C4S3J3_11_lag  + f*P1C4S3J3_11 - r*P2C4S3J3_11+ s2s3_p2c4j3_11*P2C4S2J3_11 - s3s2_p2c4j3_11*P2C4S3J3_11+ c2c4_p2s3j3_11*P2C2S3J3_11 + c3c4_p2s3j3_11*P2C3S3J3_11- (c4c2_p2s3j3_11+c4c3_p2s3j3_11)*P2C4S3J3_11+ j2j3_p2c4s3_11*P2C4S3J2_11 + j4j3_p2c4s3_11*P2C4S3J4_11 - j3j4_p2c4s3_11*P2C4S3J3_11
  deriv(P2C4S3J4_11) <- age_up*P2C4S3J4_10_lag - age_up*P2C4S3J4_11_lag  + f*P1C4S3J4_11 - r*P2C4S3J4_11+ s2s3_p2c4j4_11*P2C4S2J4_11 - s3s2_p2c4j4_11*P2C4S3J4_11+ c2c4_p2s3j4_11*P2C2S3J4_11 + c3c4_p2s3j4_11*P2C3S3J4_11- (c4c2_p2s3j4_11+c4c3_p2s3j4_11)*P2C4S3J4_11+ j3j4_p2c4s3_11*P2C4S3J3_11 - j4j3_p2c4s3_11*P2C4S3J4_11
  deriv(P1C1S1J1_12) <- age_up*P1C1S1J1_11_lag - age_up*P1C1S1J1_12_lag + r*P2C1S1J1_12 - f*P1C1S1J1_12- s1s2_p1c1j1_12*P1C1S1J1_12- (c1c2_p1s1j1_12+c1c3_p1s1j1_12)*P1C1S1J1_12- j1j2_p1c1s1_12*P1C1S1J1_12
  deriv(P1C1S1J2_12) <- age_up*P1C1S1J2_11_lag - age_up*P1C1S1J2_12_lag + r*P2C1S1J2_12 - f*P1C1S1J2_12- s1s2_p1c1j2_12*P1C1S1J2_12- (c1c2_p1s1j2_12+c1c3_p1s1j2_12)*P1C1S1J2_12+ j1j2_p1c1s1_12*P1C1S1J1_12 - j2j3_p1c1s1_12*P1C1S1J2_12
  deriv(P1C1S1J3_12) <- age_up*P1C1S1J3_11_lag - age_up*P1C1S1J3_12_lag + r*P2C1S1J3_12 - f*P1C1S1J3_12- s1s2_p1c1j3_12*P1C1S1J3_12- (c1c2_p1s1j3_12+c1c3_p1s1j3_12)*P1C1S1J3_12+ j2j3_p1c1s1_12*P1C1S1J2_12 + j4j3_p1c1s1_12*P1C1S1J4_12 - j3j4_p1c1s1_12*P1C1S1J3_12
  deriv(P1C1S1J4_12) <- age_up*P1C1S1J4_11_lag - age_up*P1C1S1J4_12_lag + r*P2C1S1J4_12 - f*P1C1S1J4_12- s1s2_p1c1j4_12*P1C1S1J4_12- (c1c2_p1s1j4_12+c1c3_p1s1j4_12)*P1C1S1J4_12+ j3j4_p1c1s1_12*P1C1S1J3_12 - j4j3_p1c1s1_12*P1C1S1J4_12
  deriv(P1C1S2J1_12) <- age_up*P1C1S2J1_11_lag - age_up*P1C1S2J1_12_lag + r*P2C1S2J1_12 - f*P1C1S2J1_12+ s1s2_p1c1j1_12*P1C1S1J1_12 - s2s3_p1c1j1_12*P1C1S2J1_12 + s3s2_p1c1j1_12*P1C1S3J1_12- (c1c2_p1s2j1_12+c1c3_p1s2j1_12)*P1C1S2J1_12- j1j2_p1c1s2_12*P1C1S2J1_12
  deriv(P1C1S2J2_12) <- age_up*P1C1S2J2_11_lag - age_up*P1C1S2J2_12_lag + r*P2C1S2J2_12 - f*P1C1S2J2_12+ s1s2_p1c1j2_12*P1C1S1J2_12 - s2s3_p1c1j2_12*P1C1S2J2_12 + s3s2_p1c1j2_12*P1C1S3J2_12- (c1c2_p1s2j2_12+c1c3_p1s2j2_12)*P1C1S2J2_12+ j1j2_p1c1s2_12*P1C1S2J1_12 - j2j3_p1c1s2_12*P1C1S2J2_12
  deriv(P1C1S2J3_12) <- age_up*P1C1S2J3_11_lag - age_up*P1C1S2J3_12_lag + r*P2C1S2J3_12 - f*P1C1S2J3_12+ s1s2_p1c1j3_12*P1C1S1J3_12 - s2s3_p1c1j3_12*P1C1S2J3_12 + s3s2_p1c1j3_12*P1C1S3J3_12- (c1c2_p1s2j3_12+c1c3_p1s2j3_12)*P1C1S2J3_12+ j2j3_p1c1s2_12*P1C1S2J2_12 + j4j3_p1c1s2_12*P1C1S2J4_12 - j3j4_p1c1s2_12*P1C1S2J3_12
  deriv(P1C1S2J4_12) <- age_up*P1C1S2J4_11_lag - age_up*P1C1S2J4_12_lag + r*P2C1S2J4_12 - f*P1C1S2J4_12+ s1s2_p1c1j4_12*P1C1S1J4_12 - s2s3_p1c1j4_12*P1C1S2J4_12 + s3s2_p1c1j4_12*P1C1S3J4_12- (c1c2_p1s2j4_12+c1c3_p1s2j4_12)*P1C1S2J4_12+ j3j4_p1c1s2_12*P1C1S2J3_12 - j4j3_p1c1s2_12*P1C1S2J4_12
  deriv(P1C1S3J1_12) <- age_up*P1C1S3J1_11_lag - age_up*P1C1S3J1_12_lag + r*P2C1S3J1_12 - f*P1C1S3J1_12+ s2s3_p1c1j1_12*P1C1S2J1_12 - s3s2_p1c1j1_12*P1C1S3J1_12- (c1c2_p1s3j1_12+c1c3_p1s3j1_12)*P1C1S3J1_12- j1j2_p1c1s3_12*P1C1S3J1_12
  deriv(P1C1S3J2_12) <- age_up*P1C1S3J2_11_lag - age_up*P1C1S3J2_12_lag + r*P2C1S3J2_12 - f*P1C1S3J2_12+ s2s3_p1c1j2_12*P1C1S2J2_12 - s3s2_p1c1j2_12*P1C1S3J2_12- (c1c2_p1s3j2_12+c1c3_p1s3j2_12)*P1C1S3J2_12+ j1j2_p1c1s3_12*P1C1S3J1_12 - j2j3_p1c1s3_12*P1C1S3J2_12
  deriv(P1C1S3J3_12) <- age_up*P1C1S3J3_11_lag - age_up*P1C1S3J3_12_lag + r*P2C1S3J3_12 - f*P1C1S3J3_12+ s2s3_p1c1j3_12*P1C1S2J3_12 - s3s2_p1c1j3_12*P1C1S3J3_12- (c1c2_p1s3j3_12+c1c3_p1s3j3_12)*P1C1S3J3_12+ j2j3_p1c1s3_12*P1C1S3J2_12 + j4j3_p1c1s3_12*P1C1S3J4_12 - j3j4_p1c1s3_12*P1C1S3J3_12
  deriv(P1C1S3J4_12) <- age_up*P1C1S3J4_11_lag - age_up*P1C1S3J4_12_lag + r*P2C1S3J4_12 - f*P1C1S3J4_12+ s2s3_p1c1j4_12*P1C1S2J4_12 - s3s2_p1c1j4_12*P1C1S3J4_12- (c1c2_p1s3j4_12+c1c3_p1s3j4_12)*P1C1S3J4_12+ j3j4_p1c1s3_12*P1C1S3J3_12 - j4j3_p1c1s3_12*P1C1S3J4_12
  deriv(P1C2S1J1_12) <- age_up*P1C2S1J1_11_lag - age_up*P1C2S1J1_12_lag + r*P2C2S1J1_12 - f*P1C2S1J1_12- s1s2_p1c2j1_12*P1C2S1J1_12+ c1c2_p1s1j1_12*P1C1S1J1_12 + c3c2_p1s1j1_12*P1C3S1J1_12 + c4c2_p1s1j1_12*P1C4S1J1_12 - (c2c3_p1s1j1_12+c2c4_p1s1j1_12)*P1C2S1J1_12- j1j2_p1c2s1_12*P1C2S1J1_12
  deriv(P1C2S1J2_12) <- age_up*P1C2S1J2_11_lag - age_up*P1C2S1J2_12_lag + r*P2C2S1J2_12 - f*P1C2S1J2_12- s1s2_p1c2j2_12*P1C2S1J2_12+ c1c2_p1s1j2_12*P1C1S1J2_12 + c3c2_p1s1j2_12*P1C3S1J2_12 + c4c2_p1s1j2_12*P1C4S1J2_12 - (c2c3_p1s1j2_12+c2c4_p1s1j2_12)*P1C2S1J2_12+ j1j2_p1c2s1_12*P1C2S1J1_12 - j2j3_p1c2s1_12*P1C2S1J2_12
  deriv(P1C2S1J3_12) <- age_up*P1C2S1J3_11_lag - age_up*P1C2S1J3_12_lag + r*P2C2S1J3_12 - f*P1C2S1J3_12- s1s2_p1c2j3_12*P1C2S1J3_12+ c1c2_p1s1j3_12*P1C1S1J3_12 + c3c2_p1s1j3_12*P1C3S1J3_12 + c4c2_p1s1j3_12*P1C4S1J3_12 - (c2c3_p1s1j3_12+c2c4_p1s1j3_12)*P1C2S1J3_12+ j2j3_p1c2s1_12*P1C2S1J2_12 + j4j3_p1c2s1_12*P1C2S1J4_12 - j3j4_p1c2s1_12*P1C2S1J3_12
  deriv(P1C2S1J4_12) <- age_up*P1C2S1J4_11_lag - age_up*P1C2S1J4_12_lag + r*P2C2S1J4_12 - f*P1C2S1J4_12- s1s2_p1c2j4_12*P1C2S1J4_12+ c1c2_p1s1j4_12*P1C1S1J4_12 + c3c2_p1s1j4_12*P1C3S1J4_12 + c4c2_p1s1j4_12*P1C4S1J4_12 - (c2c3_p1s1j4_12+c2c4_p1s1j4_12)*P1C2S1J4_12+ j3j4_p1c2s1_12*P1C2S1J3_12 - j4j3_p1c2s1_12*P1C2S1J4_12
  deriv(P1C2S2J1_12) <- age_up*P1C2S2J1_11_lag - age_up*P1C2S2J1_12_lag + r*P2C2S2J1_12 - f*P1C2S2J1_12+ s1s2_p1c2j1_12*P1C2S1J1_12 - s2s3_p1c2j1_12*P1C2S2J1_12 + s3s2_p1c2j1_12*P1C2S3J1_12+ c1c2_p1s2j1_12*P1C1S2J1_12 + c3c2_p1s2j1_12*P1C3S2J1_12 + c4c2_p1s2j1_12*P1C4S2J1_12 - (c2c3_p1s2j1_12+c2c4_p1s2j1_12)*P1C2S2J1_12- j1j2_p1c2s2_12*P1C2S2J1_12
  deriv(P1C2S2J2_12) <- age_up*P1C2S2J2_11_lag - age_up*P1C2S2J2_12_lag + r*P2C2S2J2_12 - f*P1C2S2J2_12+ s1s2_p1c2j2_12*P1C2S1J2_12 - s2s3_p1c2j2_12*P1C2S2J2_12 + s3s2_p1c2j2_12*P1C2S3J2_12+ c1c2_p1s2j2_12*P1C1S2J2_12 + c3c2_p1s2j2_12*P1C3S2J2_12 + c4c2_p1s2j2_12*P1C4S2J2_12 - (c2c3_p1s2j2_12+c2c4_p1s2j2_12)*P1C2S2J2_12+ j1j2_p1c2s2_12*P1C2S2J1_12 - j2j3_p1c2s2_12*P1C2S2J2_12
  deriv(P1C2S2J3_12) <- age_up*P1C2S2J3_11_lag - age_up*P1C2S2J3_12_lag + r*P2C2S2J3_12 - f*P1C2S2J3_12+ s1s2_p1c2j3_12*P1C2S1J3_12 - s2s3_p1c2j3_12*P1C2S2J3_12 + s3s2_p1c2j3_12*P1C2S3J3_12+ c1c2_p1s2j3_12*P1C1S2J3_12 + c3c2_p1s2j3_12*P1C3S2J3_12 + c4c2_p1s2j3_12*P1C4S2J3_12 - (c2c3_p1s2j3_12+c2c4_p1s2j3_12)*P1C2S2J3_12+ j2j3_p1c2s2_12*P1C2S2J2_12 + j4j3_p1c2s2_12*P1C2S2J4_12 - j3j4_p1c2s2_12*P1C2S2J3_12
  deriv(P1C2S2J4_12) <- age_up*P1C2S2J4_11_lag - age_up*P1C2S2J4_12_lag + r*P2C2S2J4_12 - f*P1C2S2J4_12+ s1s2_p1c2j4_12*P1C2S1J4_12 - s2s3_p1c2j4_12*P1C2S2J4_12 + s3s2_p1c2j4_12*P1C2S3J4_12+ c1c2_p1s2j4_12*P1C1S2J4_12 + c3c2_p1s2j4_12*P1C3S2J4_12 + c4c2_p1s2j4_12*P1C4S2J4_12 - (c2c3_p1s2j4_12+c2c4_p1s2j4_12)*P1C2S2J4_12+ j3j4_p1c2s2_12*P1C2S2J3_12 - j4j3_p1c2s2_12*P1C2S2J4_12
  deriv(P1C2S3J1_12) <- age_up*P1C2S3J1_11_lag - age_up*P1C2S3J1_12_lag + r*P2C2S3J1_12 - f*P1C2S3J1_12+ s2s3_p1c2j1_12*P1C2S2J1_12 - s3s2_p1c2j1_12*P1C2S3J1_12+ c1c2_p1s3j1_12*P1C1S3J1_12 + c3c2_p1s3j1_12*P1C3S3J1_12 + c4c2_p1s3j1_12*P1C4S3J1_12 - (c2c3_p1s3j1_12+c2c4_p1s3j1_12)*P1C2S3J1_12- j1j2_p1c2s3_12*P1C2S3J1_12
  deriv(P1C2S3J2_12) <- age_up*P1C2S3J2_11_lag - age_up*P1C2S3J2_12_lag + r*P2C2S3J2_12 - f*P1C2S3J2_12+ s2s3_p1c2j2_12*P1C2S2J2_12 - s3s2_p1c2j2_12*P1C2S3J2_12+ c1c2_p1s3j2_12*P1C1S3J2_12 + c3c2_p1s3j2_12*P1C3S3J2_12 + c4c2_p1s3j2_12*P1C4S3J2_12 - (c2c3_p1s3j2_12+c2c4_p1s3j2_12)*P1C2S3J2_12+ j1j2_p1c2s3_12*P1C2S3J1_12 - j2j3_p1c2s3_12*P1C2S3J2_12
  deriv(P1C2S3J3_12) <- age_up*P1C2S3J3_11_lag - age_up*P1C2S3J3_12_lag + r*P2C2S3J3_12 - f*P1C2S3J3_12+ s2s3_p1c2j3_12*P1C2S2J3_12 - s3s2_p1c2j3_12*P1C2S3J3_12+ c1c2_p1s3j3_12*P1C1S3J3_12 + c3c2_p1s3j3_12*P1C3S3J3_12 + c4c2_p1s3j3_12*P1C4S3J3_12 - (c2c3_p1s3j3_12+c2c4_p1s3j3_12)*P1C2S3J3_12+ j2j3_p1c2s3_12*P1C2S3J2_12 + j4j3_p1c2s3_12*P1C2S3J4_12 - j3j4_p1c2s3_12*P1C2S3J3_12
  deriv(P1C2S3J4_12) <- age_up*P1C2S3J4_11_lag - age_up*P1C2S3J4_12_lag + r*P2C2S3J4_12 - f*P1C2S3J4_12+ s2s3_p1c2j4_12*P1C2S2J4_12 - s3s2_p1c2j4_12*P1C2S3J4_12+ c1c2_p1s3j4_12*P1C1S3J4_12 + c3c2_p1s3j4_12*P1C3S3J4_12 + c4c2_p1s3j4_12*P1C4S3J4_12 - (c2c3_p1s3j4_12+c2c4_p1s3j4_12)*P1C2S3J4_12+ j3j4_p1c2s3_12*P1C2S3J3_12 - j4j3_p1c2s3_12*P1C2S3J4_12
  deriv(P1C3S1J1_12) <- age_up*P1C3S1J1_11_lag - age_up*P1C3S1J1_12_lag + r*P2C3S1J1_12 - f*P1C3S1J1_12- s1s2_p1c3j1_12*P1C3S1J1_12+ c1c3_p1s1j1_12*P1C1S1J1_12+ c2c3_p1s1j1_12*P1C2S1J1_12 + c4c3_p1s1j1_12*P1C4S1J1_12 - (c3c2_p1s1j1_12+c3c4_p1s1j1_12)*P1C3S1J1_12- j1j2_p1c3s1_12*P1C3S1J1_12
  deriv(P1C3S1J2_12) <- age_up*P1C3S1J2_11_lag - age_up*P1C3S1J2_12_lag + r*P2C3S1J2_12 - f*P1C3S1J2_12- s1s2_p1c3j2_12*P1C3S1J2_12+ c1c3_p1s1j2_12*P1C1S1J2_12+ c2c3_p1s1j2_12*P1C2S1J2_12 + c4c3_p1s1j2_12*P1C4S1J2_12 - (c3c2_p1s1j2_12+c3c4_p1s1j2_12)*P1C3S1J2_12+ j1j2_p1c3s1_12*P1C3S1J1_12 - j2j3_p1c3s1_12*P1C3S1J2_12
  deriv(P1C3S1J3_12) <- age_up*P1C3S1J3_11_lag - age_up*P1C3S1J3_12_lag + r*P2C3S1J3_12 - f*P1C3S1J3_12- s1s2_p1c3j3_12*P1C3S1J3_12+ c1c3_p1s1j3_12*P1C1S1J3_12+ c2c3_p1s1j3_12*P1C2S1J3_12 + c4c3_p1s1j3_12*P1C4S1J3_12 - (c3c2_p1s1j3_12+c3c4_p1s1j3_12)*P1C3S1J3_12+ j2j3_p1c3s1_12*P1C3S1J2_12 + j4j3_p1c3s1_12*P1C3S1J4_12 - j3j4_p1c3s1_12*P1C3S1J3_12
  deriv(P1C3S1J4_12) <- age_up*P1C3S1J4_11_lag - age_up*P1C3S1J4_12_lag + r*P2C3S1J4_12 - f*P1C3S1J4_12- s1s2_p1c3j4_12*P1C3S1J4_12+ c1c3_p1s1j4_12*P1C1S1J4_12+ c2c3_p1s1j4_12*P1C2S1J4_12 + c4c3_p1s1j4_12*P1C4S1J4_12 - (c3c2_p1s1j4_12+c3c4_p1s1j4_12)*P1C3S1J4_12+ j3j4_p1c3s1_12*P1C3S1J3_12 - j4j3_p1c3s1_12*P1C3S1J4_12
  deriv(P1C3S2J1_12) <- age_up*P1C3S2J1_11_lag - age_up*P1C3S2J1_12_lag + r*P2C3S2J1_12 - f*P1C3S2J1_12+ s1s2_p1c3j1_12*P1C3S1J1_12 - s2s3_p1c3j1_12*P1C3S2J1_12 + s3s2_p1c3j1_12*P1C3S3J1_12+ c1c3_p1s2j1_12*P1C1S2J1_12+ c2c3_p1s2j1_12*P1C2S2J1_12 + c4c3_p1s2j1_12*P1C4S2J1_12 - (c3c2_p1s2j1_12+c3c4_p1s2j1_12)*P1C3S2J1_12- j1j2_p1c3s2_12*P1C3S2J1_12
  deriv(P1C3S2J2_12) <- age_up*P1C3S2J2_11_lag - age_up*P1C3S2J2_12_lag + r*P2C3S2J2_12 - f*P1C3S2J2_12+ s1s2_p1c3j2_12*P1C3S1J2_12 - s2s3_p1c3j2_12*P1C3S2J2_12 + s3s2_p1c3j2_12*P1C3S3J2_12+ c1c3_p1s2j2_12*P1C1S2J2_12+ c2c3_p1s2j2_12*P1C2S2J2_12 + c4c3_p1s2j2_12*P1C4S2J2_12 - (c3c2_p1s2j2_12+c3c4_p1s2j2_12)*P1C3S2J2_12+ j1j2_p1c3s2_12*P1C3S2J1_12 - j2j3_p1c3s2_12*P1C3S2J2_12
  deriv(P1C3S2J3_12) <- age_up*P1C3S2J3_11_lag - age_up*P1C3S2J3_12_lag + r*P2C3S2J3_12 - f*P1C3S2J3_12+ s1s2_p1c3j3_12*P1C3S1J3_12 - s2s3_p1c3j3_12*P1C3S2J3_12 + s3s2_p1c3j3_12*P1C3S3J3_12+ c1c3_p1s2j3_12*P1C1S2J3_12+ c2c3_p1s2j3_12*P1C2S2J3_12 + c4c3_p1s2j3_12*P1C4S2J3_12 - (c3c2_p1s2j3_12+c3c4_p1s2j3_12)*P1C3S2J3_12+ j2j3_p1c3s2_12*P1C3S2J2_12 + j4j3_p1c3s2_12*P1C3S2J4_12 - j3j4_p1c3s2_12*P1C3S2J3_12
  deriv(P1C3S2J4_12) <- age_up*P1C3S2J4_11_lag - age_up*P1C3S2J4_12_lag + r*P2C3S2J4_12 - f*P1C3S2J4_12+ s1s2_p1c3j4_12*P1C3S1J4_12 - s2s3_p1c3j4_12*P1C3S2J4_12 + s3s2_p1c3j4_12*P1C3S3J4_12+ c1c3_p1s2j4_12*P1C1S2J4_12+ c2c3_p1s2j4_12*P1C2S2J4_12 + c4c3_p1s2j4_12*P1C4S2J4_12 - (c3c2_p1s2j4_12+c3c4_p1s2j4_12)*P1C3S2J4_12+ j3j4_p1c3s2_12*P1C3S2J3_12 - j4j3_p1c3s2_12*P1C3S2J4_12
  deriv(P1C3S3J1_12) <- age_up*P1C3S3J1_11_lag - age_up*P1C3S3J1_12_lag + r*P2C3S3J1_12 - f*P1C3S3J1_12+ s2s3_p1c3j1_12*P1C3S2J1_12 - s3s2_p1c3j1_12*P1C3S3J1_12+ c1c3_p1s3j1_12*P1C1S3J1_12+ c2c3_p1s3j1_12*P1C2S3J1_12 + c4c3_p1s3j1_12*P1C4S3J1_12 - (c3c2_p1s3j1_12+c3c4_p1s3j1_12)*P1C3S3J1_12- j1j2_p1c3s3_12*P1C3S3J1_12
  deriv(P1C3S3J2_12) <- age_up*P1C3S3J2_11_lag - age_up*P1C3S3J2_12_lag + r*P2C3S3J2_12 - f*P1C3S3J2_12+ s2s3_p1c3j2_12*P1C3S2J2_12 - s3s2_p1c3j2_12*P1C3S3J2_12+ c1c3_p1s3j2_12*P1C1S3J2_12+ c2c3_p1s3j2_12*P1C2S3J2_12 + c4c3_p1s3j2_12*P1C4S3J2_12 - (c3c2_p1s3j2_12+c3c4_p1s3j2_12)*P1C3S3J2_12+ j1j2_p1c3s3_12*P1C3S3J1_12 - j2j3_p1c3s3_12*P1C3S3J2_12
  deriv(P1C3S3J3_12) <- age_up*P1C3S3J3_11_lag - age_up*P1C3S3J3_12_lag + r*P2C3S3J3_12 - f*P1C3S3J3_12+ s2s3_p1c3j3_12*P1C3S2J3_12 - s3s2_p1c3j3_12*P1C3S3J3_12+ c1c3_p1s3j3_12*P1C1S3J3_12+ c2c3_p1s3j3_12*P1C2S3J3_12 + c4c3_p1s3j3_12*P1C4S3J3_12 - (c3c2_p1s3j3_12+c3c4_p1s3j3_12)*P1C3S3J3_12+ j2j3_p1c3s3_12*P1C3S3J2_12 + j4j3_p1c3s3_12*P1C3S3J4_12 - j3j4_p1c3s3_12*P1C3S3J3_12
  deriv(P1C3S3J4_12) <- age_up*P1C3S3J4_11_lag - age_up*P1C3S3J4_12_lag + r*P2C3S3J4_12 - f*P1C3S3J4_12+ s2s3_p1c3j4_12*P1C3S2J4_12 - s3s2_p1c3j4_12*P1C3S3J4_12+ c1c3_p1s3j4_12*P1C1S3J4_12+ c2c3_p1s3j4_12*P1C2S3J4_12 + c4c3_p1s3j4_12*P1C4S3J4_12 - (c3c2_p1s3j4_12+c3c4_p1s3j4_12)*P1C3S3J4_12+ j3j4_p1c3s3_12*P1C3S3J3_12 - j4j3_p1c3s3_12*P1C3S3J4_12
  deriv(P1C4S1J1_12) <- age_up*P1C4S1J1_11_lag - age_up*P1C4S1J1_12_lag + r*P2C4S1J1_12 - f*P1C4S1J1_12- s1s2_p1c4j1_12*P1C4S1J1_12+ c2c4_p1s1j1_12*P1C2S1J1_12 + c3c4_p1s1j1_12*P1C3S1J1_12- (c4c2_p1s1j1_12+c4c3_p1s1j1_12)*P1C4S1J1_12- j1j2_p1c4s1_12*P1C4S1J1_12
  deriv(P1C4S1J2_12) <- age_up*P1C4S1J2_11_lag - age_up*P1C4S1J2_12_lag + r*P2C4S1J2_12 - f*P1C4S1J2_12- s1s2_p1c4j2_12*P1C4S1J2_12+ c2c4_p1s1j2_12*P1C2S1J2_12 + c3c4_p1s1j2_12*P1C3S1J2_12- (c4c2_p1s1j2_12+c4c3_p1s1j2_12)*P1C4S1J2_12+ j1j2_p1c4s1_12*P1C4S1J1_12 - j2j3_p1c4s1_12*P1C4S1J2_12
  deriv(P1C4S1J3_12) <- age_up*P1C4S1J3_11_lag - age_up*P1C4S1J3_12_lag + r*P2C4S1J3_12 - f*P1C4S1J3_12- s1s2_p1c4j3_12*P1C4S1J3_12+ c2c4_p1s1j3_12*P1C2S1J3_12 + c3c4_p1s1j3_12*P1C3S1J3_12- (c4c2_p1s1j3_12+c4c3_p1s1j3_12)*P1C4S1J3_12+ j2j3_p1c4s1_12*P1C4S1J2_12 + j4j3_p1c4s1_12*P1C4S1J4_12 - j3j4_p1c4s1_12*P1C4S1J3_12
  deriv(P1C4S1J4_12) <- age_up*P1C4S1J4_11_lag - age_up*P1C4S1J4_12_lag + r*P2C4S1J4_12 - f*P1C4S1J4_12- s1s2_p1c4j4_12*P1C4S1J4_12+ c2c4_p1s1j4_12*P1C2S1J4_12 + c3c4_p1s1j4_12*P1C3S1J4_12- (c4c2_p1s1j4_12+c4c3_p1s1j4_12)*P1C4S1J4_12+ j3j4_p1c4s1_12*P1C4S1J3_12 - j4j3_p1c4s1_12*P1C4S1J4_12
  deriv(P1C4S2J1_12) <- age_up*P1C4S2J1_11_lag - age_up*P1C4S2J1_12_lag + r*P2C4S2J1_12 - f*P1C4S2J1_12+ s1s2_p1c4j1_12*P1C4S1J1_12 - s2s3_p1c4j1_12*P1C4S2J1_12 + s3s2_p1c4j1_12*P1C4S3J1_12+ c2c4_p1s2j1_12*P1C2S2J1_12 + c3c4_p1s2j1_12*P1C3S2J1_12- (c4c2_p1s2j1_12+c4c3_p1s2j1_12)*P1C4S2J1_12- j1j2_p1c4s2_12*P1C4S2J1_12
  deriv(P1C4S2J2_12) <- age_up*P1C4S2J2_11_lag - age_up*P1C4S2J2_12_lag + r*P2C4S2J2_12 - f*P1C4S2J2_12+ s1s2_p1c4j2_12*P1C4S1J2_12 - s2s3_p1c4j2_12*P1C4S2J2_12 + s3s2_p1c4j2_12*P1C4S3J2_12+ c2c4_p1s2j2_12*P1C2S2J2_12 + c3c4_p1s2j2_12*P1C3S2J2_12- (c4c2_p1s2j2_12+c4c3_p1s2j2_12)*P1C4S2J2_12+ j1j2_p1c4s2_12*P1C4S2J1_12 - j2j3_p1c4s2_12*P1C4S2J2_12
  deriv(P1C4S2J3_12) <- age_up*P1C4S2J3_11_lag - age_up*P1C4S2J3_12_lag + r*P2C4S2J3_12 - f*P1C4S2J3_12+ s1s2_p1c4j3_12*P1C4S1J3_12 - s2s3_p1c4j3_12*P1C4S2J3_12 + s3s2_p1c4j3_12*P1C4S3J3_12+ c2c4_p1s2j3_12*P1C2S2J3_12 + c3c4_p1s2j3_12*P1C3S2J3_12- (c4c2_p1s2j3_12+c4c3_p1s2j3_12)*P1C4S2J3_12+ j2j3_p1c4s2_12*P1C4S2J2_12 + j4j3_p1c4s2_12*P1C4S2J4_12 - j3j4_p1c4s2_12*P1C4S2J3_12
  deriv(P1C4S2J4_12) <- age_up*P1C4S2J4_11_lag - age_up*P1C4S2J4_12_lag + r*P2C4S2J4_12 - f*P1C4S2J4_12+ s1s2_p1c4j4_12*P1C4S1J4_12 - s2s3_p1c4j4_12*P1C4S2J4_12 + s3s2_p1c4j4_12*P1C4S3J4_12+ c2c4_p1s2j4_12*P1C2S2J4_12 + c3c4_p1s2j4_12*P1C3S2J4_12- (c4c2_p1s2j4_12+c4c3_p1s2j4_12)*P1C4S2J4_12+ j3j4_p1c4s2_12*P1C4S2J3_12 - j4j3_p1c4s2_12*P1C4S2J4_12
  deriv(P1C4S3J1_12) <- age_up*P1C4S3J1_11_lag - age_up*P1C4S3J1_12_lag + r*P2C4S3J1_12 - f*P1C4S3J1_12+ s2s3_p1c4j1_12*P1C4S2J1_12 - s3s2_p1c4j1_12*P1C4S3J1_12+ c2c4_p1s3j1_12*P1C2S3J1_12 + c3c4_p1s3j1_12*P1C3S3J1_12- (c4c2_p1s3j1_12+c4c3_p1s3j1_12)*P1C4S3J1_12- j1j2_p1c4s3_12*P1C4S3J1_12
  deriv(P1C4S3J2_12) <- age_up*P1C4S3J2_11_lag - age_up*P1C4S3J2_12_lag + r*P2C4S3J2_12 - f*P1C4S3J2_12+ s2s3_p1c4j2_12*P1C4S2J2_12 - s3s2_p1c4j2_12*P1C4S3J2_12+ c2c4_p1s3j2_12*P1C2S3J2_12 + c3c4_p1s3j2_12*P1C3S3J2_12- (c4c2_p1s3j2_12+c4c3_p1s3j2_12)*P1C4S3J2_12+ j1j2_p1c4s3_12*P1C4S3J1_12 - j2j3_p1c4s3_12*P1C4S3J2_12
  deriv(P1C4S3J3_12) <- age_up*P1C4S3J3_11_lag - age_up*P1C4S3J3_12_lag + r*P2C4S3J3_12 - f*P1C4S3J3_12+ s2s3_p1c4j3_12*P1C4S2J3_12 - s3s2_p1c4j3_12*P1C4S3J3_12+ c2c4_p1s3j3_12*P1C2S3J3_12 + c3c4_p1s3j3_12*P1C3S3J3_12- (c4c2_p1s3j3_12+c4c3_p1s3j3_12)*P1C4S3J3_12+ j2j3_p1c4s3_12*P1C4S3J2_12 + j4j3_p1c4s3_12*P1C4S3J4_12 - j3j4_p1c4s3_12*P1C4S3J3_12
  deriv(P1C4S3J4_12) <- age_up*P1C4S3J4_11_lag - age_up*P1C4S3J4_12_lag + r*P2C4S3J4_12 - f*P1C4S3J4_12+ s2s3_p1c4j4_12*P1C4S2J4_12 - s3s2_p1c4j4_12*P1C4S3J4_12+ c2c4_p1s3j4_12*P1C2S3J4_12 + c3c4_p1s3j4_12*P1C3S3J4_12- (c4c2_p1s3j4_12+c4c3_p1s3j4_12)*P1C4S3J4_12+ j3j4_p1c4s3_12*P1C4S3J3_12 - j4j3_p1c4s3_12*P1C4S3J4_12
  deriv(P2C1S1J1_12) <- age_up*P2C1S1J1_11_lag - age_up*P2C1S1J1_12_lag  + f*P1C1S1J1_12 - r*P2C1S1J1_12- s1s2_p2c1j1_12*P2C1S1J1_12- (c1c2_p2s1j1_12+c1c3_p2s1j1_12)*P2C1S1J1_12- j1j2_p2c1s1_12*P2C1S1J1_12
  deriv(P2C1S1J2_12) <- age_up*P2C1S1J2_11_lag - age_up*P2C1S1J2_12_lag  + f*P1C1S1J2_12 - r*P2C1S1J2_12- s1s2_p2c1j2_12*P2C1S1J2_12- (c1c2_p2s1j2_12+c1c3_p2s1j2_12)*P2C1S1J2_12+ j1j2_p2c1s1_12*P2C1S1J1_12 - j2j3_p2c1s1_12*P2C1S1J2_12
  deriv(P2C1S1J3_12) <- age_up*P2C1S1J3_11_lag - age_up*P2C1S1J3_12_lag  + f*P1C1S1J3_12 - r*P2C1S1J3_12- s1s2_p2c1j3_12*P2C1S1J3_12- (c1c2_p2s1j3_12+c1c3_p2s1j3_12)*P2C1S1J3_12+ j2j3_p2c1s1_12*P2C1S1J2_12 + j4j3_p2c1s1_12*P2C1S1J4_12 - j3j4_p2c1s1_12*P2C1S1J3_12
  deriv(P2C1S1J4_12) <- age_up*P2C1S1J4_11_lag - age_up*P2C1S1J4_12_lag  + f*P1C1S1J4_12 - r*P2C1S1J4_12- s1s2_p2c1j4_12*P2C1S1J4_12- (c1c2_p2s1j4_12+c1c3_p2s1j4_12)*P2C1S1J4_12+ j3j4_p2c1s1_12*P2C1S1J3_12 - j4j3_p2c1s1_12*P2C1S1J4_12
  deriv(P2C1S2J1_12) <- age_up*P2C1S2J1_11_lag - age_up*P2C1S2J1_12_lag  + f*P1C1S2J1_12 - r*P2C1S2J1_12+ s1s2_p2c1j1_12*P2C1S1J1_12 - s2s3_p2c1j1_12*P2C1S2J1_12 + s3s2_p2c1j1_12*P2C1S3J1_12- (c1c2_p2s2j1_12+c1c3_p2s2j1_12)*P2C1S2J1_12- j1j2_p2c1s2_12*P2C1S2J1_12
  deriv(P2C1S2J2_12) <- age_up*P2C1S2J2_11_lag - age_up*P2C1S2J2_12_lag  + f*P1C1S2J2_12 - r*P2C1S2J2_12+ s1s2_p2c1j2_12*P2C1S1J2_12 - s2s3_p2c1j2_12*P2C1S2J2_12 + s3s2_p2c1j2_12*P2C1S3J2_12- (c1c2_p2s2j2_12+c1c3_p2s2j2_12)*P2C1S2J2_12+ j1j2_p2c1s2_12*P2C1S2J1_12 - j2j3_p2c1s2_12*P2C1S2J2_12
  deriv(P2C1S2J3_12) <- age_up*P2C1S2J3_11_lag - age_up*P2C1S2J3_12_lag  + f*P1C1S2J3_12 - r*P2C1S2J3_12+ s1s2_p2c1j3_12*P2C1S1J3_12 - s2s3_p2c1j3_12*P2C1S2J3_12 + s3s2_p2c1j3_12*P2C1S3J3_12- (c1c2_p2s2j3_12+c1c3_p2s2j3_12)*P2C1S2J3_12+ j2j3_p2c1s2_12*P2C1S2J2_12 + j4j3_p2c1s2_12*P2C1S2J4_12 - j3j4_p2c1s2_12*P2C1S2J3_12
  deriv(P2C1S2J4_12) <- age_up*P2C1S2J4_11_lag - age_up*P2C1S2J4_12_lag  + f*P1C1S2J4_12 - r*P2C1S2J4_12+ s1s2_p2c1j4_12*P2C1S1J4_12 - s2s3_p2c1j4_12*P2C1S2J4_12 + s3s2_p2c1j4_12*P2C1S3J4_12- (c1c2_p2s2j4_12+c1c3_p2s2j4_12)*P2C1S2J4_12+ j3j4_p2c1s2_12*P2C1S2J3_12 - j4j3_p2c1s2_12*P2C1S2J4_12
  deriv(P2C1S3J1_12) <- age_up*P2C1S3J1_11_lag - age_up*P2C1S3J1_12_lag  + f*P1C1S3J1_12 - r*P2C1S3J1_12+ s2s3_p2c1j1_12*P2C1S2J1_12 - s3s2_p2c1j1_12*P2C1S3J1_12- (c1c2_p2s3j1_12+c1c3_p2s3j1_12)*P2C1S3J1_12- j1j2_p2c1s3_12*P2C1S3J1_12
  deriv(P2C1S3J2_12) <- age_up*P2C1S3J2_11_lag - age_up*P2C1S3J2_12_lag  + f*P1C1S3J2_12 - r*P2C1S3J2_12+ s2s3_p2c1j2_12*P2C1S2J2_12 - s3s2_p2c1j2_12*P2C1S3J2_12- (c1c2_p2s3j2_12+c1c3_p2s3j2_12)*P2C1S3J2_12+ j1j2_p2c1s3_12*P2C1S3J1_12 - j2j3_p2c1s3_12*P2C1S3J2_12
  deriv(P2C1S3J3_12) <- age_up*P2C1S3J3_11_lag - age_up*P2C1S3J3_12_lag  + f*P1C1S3J3_12 - r*P2C1S3J3_12+ s2s3_p2c1j3_12*P2C1S2J3_12 - s3s2_p2c1j3_12*P2C1S3J3_12- (c1c2_p2s3j3_12+c1c3_p2s3j3_12)*P2C1S3J3_12+ j2j3_p2c1s3_12*P2C1S3J2_12 + j4j3_p2c1s3_12*P2C1S3J4_12 - j3j4_p2c1s3_12*P2C1S3J3_12
  deriv(P2C1S3J4_12) <- age_up*P2C1S3J4_11_lag - age_up*P2C1S3J4_12_lag  + f*P1C1S3J4_12 - r*P2C1S3J4_12+ s2s3_p2c1j4_12*P2C1S2J4_12 - s3s2_p2c1j4_12*P2C1S3J4_12- (c1c2_p2s3j4_12+c1c3_p2s3j4_12)*P2C1S3J4_12+ j3j4_p2c1s3_12*P2C1S3J3_12 - j4j3_p2c1s3_12*P2C1S3J4_12
  deriv(P2C2S1J1_12) <- age_up*P2C2S1J1_11_lag - age_up*P2C2S1J1_12_lag  + f*P1C2S1J1_12 - r*P2C2S1J1_12- s1s2_p2c2j1_12*P2C2S1J1_12+ c1c2_p2s1j1_12*P2C1S1J1_12 + c3c2_p2s1j1_12*P2C3S1J1_12 + c4c2_p2s1j1_12*P2C4S1J1_12 - (c2c3_p2s1j1_12+c2c4_p2s1j1_12)*P2C2S1J1_12- j1j2_p2c2s1_12*P2C2S1J1_12
  deriv(P2C2S1J2_12) <- age_up*P2C2S1J2_11_lag - age_up*P2C2S1J2_12_lag  + f*P1C2S1J2_12 - r*P2C2S1J2_12- s1s2_p2c2j2_12*P2C2S1J2_12+ c1c2_p2s1j2_12*P2C1S1J2_12 + c3c2_p2s1j2_12*P2C3S1J2_12 + c4c2_p2s1j2_12*P2C4S1J2_12 - (c2c3_p2s1j2_12+c2c4_p2s1j2_12)*P2C2S1J2_12+ j1j2_p2c2s1_12*P2C2S1J1_12 - j2j3_p2c2s1_12*P2C2S1J2_12
  deriv(P2C2S1J3_12) <- age_up*P2C2S1J3_11_lag - age_up*P2C2S1J3_12_lag  + f*P1C2S1J3_12 - r*P2C2S1J3_12- s1s2_p2c2j3_12*P2C2S1J3_12+ c1c2_p2s1j3_12*P2C1S1J3_12 + c3c2_p2s1j3_12*P2C3S1J3_12 + c4c2_p2s1j3_12*P2C4S1J3_12 - (c2c3_p2s1j3_12+c2c4_p2s1j3_12)*P2C2S1J3_12+ j2j3_p2c2s1_12*P2C2S1J2_12 + j4j3_p2c2s1_12*P2C2S1J4_12 - j3j4_p2c2s1_12*P2C2S1J3_12
  deriv(P2C2S1J4_12) <- age_up*P2C2S1J4_11_lag - age_up*P2C2S1J4_12_lag  + f*P1C2S1J4_12 - r*P2C2S1J4_12- s1s2_p2c2j4_12*P2C2S1J4_12+ c1c2_p2s1j4_12*P2C1S1J4_12 + c3c2_p2s1j4_12*P2C3S1J4_12 + c4c2_p2s1j4_12*P2C4S1J4_12 - (c2c3_p2s1j4_12+c2c4_p2s1j4_12)*P2C2S1J4_12+ j3j4_p2c2s1_12*P2C2S1J3_12 - j4j3_p2c2s1_12*P2C2S1J4_12
  deriv(P2C2S2J1_12) <- age_up*P2C2S2J1_11_lag - age_up*P2C2S2J1_12_lag  + f*P1C2S2J1_12 - r*P2C2S2J1_12+ s1s2_p2c2j1_12*P2C2S1J1_12 - s2s3_p2c2j1_12*P2C2S2J1_12 + s3s2_p2c2j1_12*P2C2S3J1_12+ c1c2_p2s2j1_12*P2C1S2J1_12 + c3c2_p2s2j1_12*P2C3S2J1_12 + c4c2_p2s2j1_12*P2C4S2J1_12 - (c2c3_p2s2j1_12+c2c4_p2s2j1_12)*P2C2S2J1_12- j1j2_p2c2s2_12*P2C2S2J1_12
  deriv(P2C2S2J2_12) <- age_up*P2C2S2J2_11_lag - age_up*P2C2S2J2_12_lag  + f*P1C2S2J2_12 - r*P2C2S2J2_12+ s1s2_p2c2j2_12*P2C2S1J2_12 - s2s3_p2c2j2_12*P2C2S2J2_12 + s3s2_p2c2j2_12*P2C2S3J2_12+ c1c2_p2s2j2_12*P2C1S2J2_12 + c3c2_p2s2j2_12*P2C3S2J2_12 + c4c2_p2s2j2_12*P2C4S2J2_12 - (c2c3_p2s2j2_12+c2c4_p2s2j2_12)*P2C2S2J2_12+ j1j2_p2c2s2_12*P2C2S2J1_12 - j2j3_p2c2s2_12*P2C2S2J2_12
  deriv(P2C2S2J3_12) <- age_up*P2C2S2J3_11_lag - age_up*P2C2S2J3_12_lag  + f*P1C2S2J3_12 - r*P2C2S2J3_12+ s1s2_p2c2j3_12*P2C2S1J3_12 - s2s3_p2c2j3_12*P2C2S2J3_12 + s3s2_p2c2j3_12*P2C2S3J3_12+ c1c2_p2s2j3_12*P2C1S2J3_12 + c3c2_p2s2j3_12*P2C3S2J3_12 + c4c2_p2s2j3_12*P2C4S2J3_12 - (c2c3_p2s2j3_12+c2c4_p2s2j3_12)*P2C2S2J3_12+ j2j3_p2c2s2_12*P2C2S2J2_12 + j4j3_p2c2s2_12*P2C2S2J4_12 - j3j4_p2c2s2_12*P2C2S2J3_12
  deriv(P2C2S2J4_12) <- age_up*P2C2S2J4_11_lag - age_up*P2C2S2J4_12_lag  + f*P1C2S2J4_12 - r*P2C2S2J4_12+ s1s2_p2c2j4_12*P2C2S1J4_12 - s2s3_p2c2j4_12*P2C2S2J4_12 + s3s2_p2c2j4_12*P2C2S3J4_12+ c1c2_p2s2j4_12*P2C1S2J4_12 + c3c2_p2s2j4_12*P2C3S2J4_12 + c4c2_p2s2j4_12*P2C4S2J4_12 - (c2c3_p2s2j4_12+c2c4_p2s2j4_12)*P2C2S2J4_12+ j3j4_p2c2s2_12*P2C2S2J3_12 - j4j3_p2c2s2_12*P2C2S2J4_12
  deriv(P2C2S3J1_12) <- age_up*P2C2S3J1_11_lag - age_up*P2C2S3J1_12_lag  + f*P1C2S3J1_12 - r*P2C2S3J1_12+ s2s3_p2c2j1_12*P2C2S2J1_12 - s3s2_p2c2j1_12*P2C2S3J1_12+ c1c2_p2s3j1_12*P2C1S3J1_12 + c3c2_p2s3j1_12*P2C3S3J1_12 + c4c2_p2s3j1_12*P2C4S3J1_12 - (c2c3_p2s3j1_12+c2c4_p2s3j1_12)*P2C2S3J1_12- j1j2_p2c2s3_12*P2C2S3J1_12
  deriv(P2C2S3J2_12) <- age_up*P2C2S3J2_11_lag - age_up*P2C2S3J2_12_lag  + f*P1C2S3J2_12 - r*P2C2S3J2_12+ s2s3_p2c2j2_12*P2C2S2J2_12 - s3s2_p2c2j2_12*P2C2S3J2_12+ c1c2_p2s3j2_12*P2C1S3J2_12 + c3c2_p2s3j2_12*P2C3S3J2_12 + c4c2_p2s3j2_12*P2C4S3J2_12 - (c2c3_p2s3j2_12+c2c4_p2s3j2_12)*P2C2S3J2_12+ j1j2_p2c2s3_12*P2C2S3J1_12 - j2j3_p2c2s3_12*P2C2S3J2_12
  deriv(P2C2S3J3_12) <- age_up*P2C2S3J3_11_lag - age_up*P2C2S3J3_12_lag  + f*P1C2S3J3_12 - r*P2C2S3J3_12+ s2s3_p2c2j3_12*P2C2S2J3_12 - s3s2_p2c2j3_12*P2C2S3J3_12+ c1c2_p2s3j3_12*P2C1S3J3_12 + c3c2_p2s3j3_12*P2C3S3J3_12 + c4c2_p2s3j3_12*P2C4S3J3_12 - (c2c3_p2s3j3_12+c2c4_p2s3j3_12)*P2C2S3J3_12+ j2j3_p2c2s3_12*P2C2S3J2_12 + j4j3_p2c2s3_12*P2C2S3J4_12 - j3j4_p2c2s3_12*P2C2S3J3_12
  deriv(P2C2S3J4_12) <- age_up*P2C2S3J4_11_lag - age_up*P2C2S3J4_12_lag  + f*P1C2S3J4_12 - r*P2C2S3J4_12+ s2s3_p2c2j4_12*P2C2S2J4_12 - s3s2_p2c2j4_12*P2C2S3J4_12+ c1c2_p2s3j4_12*P2C1S3J4_12 + c3c2_p2s3j4_12*P2C3S3J4_12 + c4c2_p2s3j4_12*P2C4S3J4_12 - (c2c3_p2s3j4_12+c2c4_p2s3j4_12)*P2C2S3J4_12+ j3j4_p2c2s3_12*P2C2S3J3_12 - j4j3_p2c2s3_12*P2C2S3J4_12
  deriv(P2C3S1J1_12) <- age_up*P2C3S1J1_11_lag - age_up*P2C3S1J1_12_lag  + f*P1C3S1J1_12 - r*P2C3S1J1_12- s1s2_p2c3j1_12*P2C3S1J1_12+ c1c3_p2s1j1_12*P2C1S1J1_12+ c2c3_p2s1j1_12*P2C2S1J1_12 + c4c3_p2s1j1_12*P2C4S1J1_12 - (c3c2_p2s1j1_12+c3c4_p2s1j1_12)*P2C3S1J1_12- j1j2_p2c3s1_12*P2C3S1J1_12
  deriv(P2C3S1J2_12) <- age_up*P2C3S1J2_11_lag - age_up*P2C3S1J2_12_lag  + f*P1C3S1J2_12 - r*P2C3S1J2_12- s1s2_p2c3j2_12*P2C3S1J2_12+ c1c3_p2s1j2_12*P2C1S1J2_12+ c2c3_p2s1j2_12*P2C2S1J2_12 + c4c3_p2s1j2_12*P2C4S1J2_12 - (c3c2_p2s1j2_12+c3c4_p2s1j2_12)*P2C3S1J2_12+ j1j2_p2c3s1_12*P2C3S1J1_12 - j2j3_p2c3s1_12*P2C3S1J2_12
  deriv(P2C3S1J3_12) <- age_up*P2C3S1J3_11_lag - age_up*P2C3S1J3_12_lag  + f*P1C3S1J3_12 - r*P2C3S1J3_12- s1s2_p2c3j3_12*P2C3S1J3_12+ c1c3_p2s1j3_12*P2C1S1J3_12+ c2c3_p2s1j3_12*P2C2S1J3_12 + c4c3_p2s1j3_12*P2C4S1J3_12 - (c3c2_p2s1j3_12+c3c4_p2s1j3_12)*P2C3S1J3_12+ j2j3_p2c3s1_12*P2C3S1J2_12 + j4j3_p2c3s1_12*P2C3S1J4_12 - j3j4_p2c3s1_12*P2C3S1J3_12
  deriv(P2C3S1J4_12) <- age_up*P2C3S1J4_11_lag - age_up*P2C3S1J4_12_lag  + f*P1C3S1J4_12 - r*P2C3S1J4_12- s1s2_p2c3j4_12*P2C3S1J4_12+ c1c3_p2s1j4_12*P2C1S1J4_12+ c2c3_p2s1j4_12*P2C2S1J4_12 + c4c3_p2s1j4_12*P2C4S1J4_12 - (c3c2_p2s1j4_12+c3c4_p2s1j4_12)*P2C3S1J4_12+ j3j4_p2c3s1_12*P2C3S1J3_12 - j4j3_p2c3s1_12*P2C3S1J4_12
  deriv(P2C3S2J1_12) <- age_up*P2C3S2J1_11_lag - age_up*P2C3S2J1_12_lag  + f*P1C3S2J1_12 - r*P2C3S2J1_12+ s1s2_p2c3j1_12*P2C3S1J1_12 - s2s3_p2c3j1_12*P2C3S2J1_12 + s3s2_p2c3j1_12*P2C3S3J1_12+ c1c3_p2s2j1_12*P2C1S2J1_12+ c2c3_p2s2j1_12*P2C2S2J1_12 + c4c3_p2s2j1_12*P2C4S2J1_12 - (c3c2_p2s2j1_12+c3c4_p2s2j1_12)*P2C3S2J1_12- j1j2_p2c3s2_12*P2C3S2J1_12
  deriv(P2C3S2J2_12) <- age_up*P2C3S2J2_11_lag - age_up*P2C3S2J2_12_lag  + f*P1C3S2J2_12 - r*P2C3S2J2_12+ s1s2_p2c3j2_12*P2C3S1J2_12 - s2s3_p2c3j2_12*P2C3S2J2_12 + s3s2_p2c3j2_12*P2C3S3J2_12+ c1c3_p2s2j2_12*P2C1S2J2_12+ c2c3_p2s2j2_12*P2C2S2J2_12 + c4c3_p2s2j2_12*P2C4S2J2_12 - (c3c2_p2s2j2_12+c3c4_p2s2j2_12)*P2C3S2J2_12+ j1j2_p2c3s2_12*P2C3S2J1_12 - j2j3_p2c3s2_12*P2C3S2J2_12
  deriv(P2C3S2J3_12) <- age_up*P2C3S2J3_11_lag - age_up*P2C3S2J3_12_lag  + f*P1C3S2J3_12 - r*P2C3S2J3_12+ s1s2_p2c3j3_12*P2C3S1J3_12 - s2s3_p2c3j3_12*P2C3S2J3_12 + s3s2_p2c3j3_12*P2C3S3J3_12+ c1c3_p2s2j3_12*P2C1S2J3_12+ c2c3_p2s2j3_12*P2C2S2J3_12 + c4c3_p2s2j3_12*P2C4S2J3_12 - (c3c2_p2s2j3_12+c3c4_p2s2j3_12)*P2C3S2J3_12+ j2j3_p2c3s2_12*P2C3S2J2_12 + j4j3_p2c3s2_12*P2C3S2J4_12 - j3j4_p2c3s2_12*P2C3S2J3_12
  deriv(P2C3S2J4_12) <- age_up*P2C3S2J4_11_lag - age_up*P2C3S2J4_12_lag  + f*P1C3S2J4_12 - r*P2C3S2J4_12+ s1s2_p2c3j4_12*P2C3S1J4_12 - s2s3_p2c3j4_12*P2C3S2J4_12 + s3s2_p2c3j4_12*P2C3S3J4_12+ c1c3_p2s2j4_12*P2C1S2J4_12+ c2c3_p2s2j4_12*P2C2S2J4_12 + c4c3_p2s2j4_12*P2C4S2J4_12 - (c3c2_p2s2j4_12+c3c4_p2s2j4_12)*P2C3S2J4_12+ j3j4_p2c3s2_12*P2C3S2J3_12 - j4j3_p2c3s2_12*P2C3S2J4_12
  deriv(P2C3S3J1_12) <- age_up*P2C3S3J1_11_lag - age_up*P2C3S3J1_12_lag  + f*P1C3S3J1_12 - r*P2C3S3J1_12+ s2s3_p2c3j1_12*P2C3S2J1_12 - s3s2_p2c3j1_12*P2C3S3J1_12+ c1c3_p2s3j1_12*P2C1S3J1_12+ c2c3_p2s3j1_12*P2C2S3J1_12 + c4c3_p2s3j1_12*P2C4S3J1_12 - (c3c2_p2s3j1_12+c3c4_p2s3j1_12)*P2C3S3J1_12- j1j2_p2c3s3_12*P2C3S3J1_12
  deriv(P2C3S3J2_12) <- age_up*P2C3S3J2_11_lag - age_up*P2C3S3J2_12_lag  + f*P1C3S3J2_12 - r*P2C3S3J2_12+ s2s3_p2c3j2_12*P2C3S2J2_12 - s3s2_p2c3j2_12*P2C3S3J2_12+ c1c3_p2s3j2_12*P2C1S3J2_12+ c2c3_p2s3j2_12*P2C2S3J2_12 + c4c3_p2s3j2_12*P2C4S3J2_12 - (c3c2_p2s3j2_12+c3c4_p2s3j2_12)*P2C3S3J2_12+ j1j2_p2c3s3_12*P2C3S3J1_12 - j2j3_p2c3s3_12*P2C3S3J2_12
  deriv(P2C3S3J3_12) <- age_up*P2C3S3J3_11_lag - age_up*P2C3S3J3_12_lag  + f*P1C3S3J3_12 - r*P2C3S3J3_12+ s2s3_p2c3j3_12*P2C3S2J3_12 - s3s2_p2c3j3_12*P2C3S3J3_12+ c1c3_p2s3j3_12*P2C1S3J3_12+ c2c3_p2s3j3_12*P2C2S3J3_12 + c4c3_p2s3j3_12*P2C4S3J3_12 - (c3c2_p2s3j3_12+c3c4_p2s3j3_12)*P2C3S3J3_12+ j2j3_p2c3s3_12*P2C3S3J2_12 + j4j3_p2c3s3_12*P2C3S3J4_12 - j3j4_p2c3s3_12*P2C3S3J3_12
  deriv(P2C3S3J4_12) <- age_up*P2C3S3J4_11_lag - age_up*P2C3S3J4_12_lag  + f*P1C3S3J4_12 - r*P2C3S3J4_12+ s2s3_p2c3j4_12*P2C3S2J4_12 - s3s2_p2c3j4_12*P2C3S3J4_12+ c1c3_p2s3j4_12*P2C1S3J4_12+ c2c3_p2s3j4_12*P2C2S3J4_12 + c4c3_p2s3j4_12*P2C4S3J4_12 - (c3c2_p2s3j4_12+c3c4_p2s3j4_12)*P2C3S3J4_12+ j3j4_p2c3s3_12*P2C3S3J3_12 - j4j3_p2c3s3_12*P2C3S3J4_12
  deriv(P2C4S1J1_12) <- age_up*P2C4S1J1_11_lag - age_up*P2C4S1J1_12_lag  + f*P1C4S1J1_12 - r*P2C4S1J1_12- s1s2_p2c4j1_12*P2C4S1J1_12+ c2c4_p2s1j1_12*P2C2S1J1_12 + c3c4_p2s1j1_12*P2C3S1J1_12- (c4c2_p2s1j1_12+c4c3_p2s1j1_12)*P2C4S1J1_12- j1j2_p2c4s1_12*P2C4S1J1_12
  deriv(P2C4S1J2_12) <- age_up*P2C4S1J2_11_lag - age_up*P2C4S1J2_12_lag  + f*P1C4S1J2_12 - r*P2C4S1J2_12- s1s2_p2c4j2_12*P2C4S1J2_12+ c2c4_p2s1j2_12*P2C2S1J2_12 + c3c4_p2s1j2_12*P2C3S1J2_12- (c4c2_p2s1j2_12+c4c3_p2s1j2_12)*P2C4S1J2_12+ j1j2_p2c4s1_12*P2C4S1J1_12 - j2j3_p2c4s1_12*P2C4S1J2_12
  deriv(P2C4S1J3_12) <- age_up*P2C4S1J3_11_lag - age_up*P2C4S1J3_12_lag  + f*P1C4S1J3_12 - r*P2C4S1J3_12- s1s2_p2c4j3_12*P2C4S1J3_12+ c2c4_p2s1j3_12*P2C2S1J3_12 + c3c4_p2s1j3_12*P2C3S1J3_12- (c4c2_p2s1j3_12+c4c3_p2s1j3_12)*P2C4S1J3_12+ j2j3_p2c4s1_12*P2C4S1J2_12 + j4j3_p2c4s1_12*P2C4S1J4_12 - j3j4_p2c4s1_12*P2C4S1J3_12
  deriv(P2C4S1J4_12) <- age_up*P2C4S1J4_11_lag - age_up*P2C4S1J4_12_lag  + f*P1C4S1J4_12 - r*P2C4S1J4_12- s1s2_p2c4j4_12*P2C4S1J4_12+ c2c4_p2s1j4_12*P2C2S1J4_12 + c3c4_p2s1j4_12*P2C3S1J4_12- (c4c2_p2s1j4_12+c4c3_p2s1j4_12)*P2C4S1J4_12+ j3j4_p2c4s1_12*P2C4S1J3_12 - j4j3_p2c4s1_12*P2C4S1J4_12
  deriv(P2C4S2J1_12) <- age_up*P2C4S2J1_11_lag - age_up*P2C4S2J1_12_lag  + f*P1C4S2J1_12 - r*P2C4S2J1_12+ s1s2_p2c4j1_12*P2C4S1J1_12 - s2s3_p2c4j1_12*P2C4S2J1_12 + s3s2_p2c4j1_12*P2C4S3J1_12+ c2c4_p2s2j1_12*P2C2S2J1_12 + c3c4_p2s2j1_12*P2C3S2J1_12- (c4c2_p2s2j1_12+c4c3_p2s2j1_12)*P2C4S2J1_12- j1j2_p2c4s2_12*P2C4S2J1_12
  deriv(P2C4S2J2_12) <- age_up*P2C4S2J2_11_lag - age_up*P2C4S2J2_12_lag  + f*P1C4S2J2_12 - r*P2C4S2J2_12+ s1s2_p2c4j2_12*P2C4S1J2_12 - s2s3_p2c4j2_12*P2C4S2J2_12 + s3s2_p2c4j2_12*P2C4S3J2_12+ c2c4_p2s2j2_12*P2C2S2J2_12 + c3c4_p2s2j2_12*P2C3S2J2_12- (c4c2_p2s2j2_12+c4c3_p2s2j2_12)*P2C4S2J2_12+ j1j2_p2c4s2_12*P2C4S2J1_12 - j2j3_p2c4s2_12*P2C4S2J2_12
  deriv(P2C4S2J3_12) <- age_up*P2C4S2J3_11_lag - age_up*P2C4S2J3_12_lag  + f*P1C4S2J3_12 - r*P2C4S2J3_12+ s1s2_p2c4j3_12*P2C4S1J3_12 - s2s3_p2c4j3_12*P2C4S2J3_12 + s3s2_p2c4j3_12*P2C4S3J3_12+ c2c4_p2s2j3_12*P2C2S2J3_12 + c3c4_p2s2j3_12*P2C3S2J3_12- (c4c2_p2s2j3_12+c4c3_p2s2j3_12)*P2C4S2J3_12+ j2j3_p2c4s2_12*P2C4S2J2_12 + j4j3_p2c4s2_12*P2C4S2J4_12 - j3j4_p2c4s2_12*P2C4S2J3_12
  deriv(P2C4S2J4_12) <- age_up*P2C4S2J4_11_lag - age_up*P2C4S2J4_12_lag  + f*P1C4S2J4_12 - r*P2C4S2J4_12+ s1s2_p2c4j4_12*P2C4S1J4_12 - s2s3_p2c4j4_12*P2C4S2J4_12 + s3s2_p2c4j4_12*P2C4S3J4_12+ c2c4_p2s2j4_12*P2C2S2J4_12 + c3c4_p2s2j4_12*P2C3S2J4_12- (c4c2_p2s2j4_12+c4c3_p2s2j4_12)*P2C4S2J4_12+ j3j4_p2c4s2_12*P2C4S2J3_12 - j4j3_p2c4s2_12*P2C4S2J4_12
  deriv(P2C4S3J1_12) <- age_up*P2C4S3J1_11_lag - age_up*P2C4S3J1_12_lag  + f*P1C4S3J1_12 - r*P2C4S3J1_12+ s2s3_p2c4j1_12*P2C4S2J1_12 - s3s2_p2c4j1_12*P2C4S3J1_12+ c2c4_p2s3j1_12*P2C2S3J1_12 + c3c4_p2s3j1_12*P2C3S3J1_12- (c4c2_p2s3j1_12+c4c3_p2s3j1_12)*P2C4S3J1_12- j1j2_p2c4s3_12*P2C4S3J1_12
  deriv(P2C4S3J2_12) <- age_up*P2C4S3J2_11_lag - age_up*P2C4S3J2_12_lag  + f*P1C4S3J2_12 - r*P2C4S3J2_12+ s2s3_p2c4j2_12*P2C4S2J2_12 - s3s2_p2c4j2_12*P2C4S3J2_12+ c2c4_p2s3j2_12*P2C2S3J2_12 + c3c4_p2s3j2_12*P2C3S3J2_12- (c4c2_p2s3j2_12+c4c3_p2s3j2_12)*P2C4S3J2_12+ j1j2_p2c4s3_12*P2C4S3J1_12 - j2j3_p2c4s3_12*P2C4S3J2_12
  deriv(P2C4S3J3_12) <- age_up*P2C4S3J3_11_lag - age_up*P2C4S3J3_12_lag  + f*P1C4S3J3_12 - r*P2C4S3J3_12+ s2s3_p2c4j3_12*P2C4S2J3_12 - s3s2_p2c4j3_12*P2C4S3J3_12+ c2c4_p2s3j3_12*P2C2S3J3_12 + c3c4_p2s3j3_12*P2C3S3J3_12- (c4c2_p2s3j3_12+c4c3_p2s3j3_12)*P2C4S3J3_12+ j2j3_p2c4s3_12*P2C4S3J2_12 + j4j3_p2c4s3_12*P2C4S3J4_12 - j3j4_p2c4s3_12*P2C4S3J3_12
  deriv(P2C4S3J4_12) <- age_up*P2C4S3J4_11_lag - age_up*P2C4S3J4_12_lag  + f*P1C4S3J4_12 - r*P2C4S3J4_12+ s2s3_p2c4j4_12*P2C4S2J4_12 - s3s2_p2c4j4_12*P2C4S3J4_12+ c2c4_p2s3j4_12*P2C2S3J4_12 + c3c4_p2s3j4_12*P2C3S3J4_12- (c4c2_p2s3j4_12+c4c3_p2s3j4_12)*P2C4S3J4_12+ j3j4_p2c4s3_12*P2C4S3J3_12 - j4j3_p2c4s3_12*P2C4S3J4_12
  deriv(P1C1S1J1_13) <- age_up*P1C1S1J1_12_lag - age_up*P1C1S1J1_13_lag + r*P2C1S1J1_13 - f*P1C1S1J1_13- s1s2_p1c1j1_13*P1C1S1J1_13- (c1c2_p1s1j1_13+c1c3_p1s1j1_13)*P1C1S1J1_13- j1j2_p1c1s1_13*P1C1S1J1_13
  deriv(P1C1S1J2_13) <- age_up*P1C1S1J2_12_lag - age_up*P1C1S1J2_13_lag + r*P2C1S1J2_13 - f*P1C1S1J2_13- s1s2_p1c1j2_13*P1C1S1J2_13- (c1c2_p1s1j2_13+c1c3_p1s1j2_13)*P1C1S1J2_13+ j1j2_p1c1s1_13*P1C1S1J1_13 - j2j3_p1c1s1_13*P1C1S1J2_13
  deriv(P1C1S1J3_13) <- age_up*P1C1S1J3_12_lag - age_up*P1C1S1J3_13_lag + r*P2C1S1J3_13 - f*P1C1S1J3_13- s1s2_p1c1j3_13*P1C1S1J3_13- (c1c2_p1s1j3_13+c1c3_p1s1j3_13)*P1C1S1J3_13+ j2j3_p1c1s1_13*P1C1S1J2_13 + j4j3_p1c1s1_13*P1C1S1J4_13 - j3j4_p1c1s1_13*P1C1S1J3_13
  deriv(P1C1S1J4_13) <- age_up*P1C1S1J4_12_lag - age_up*P1C1S1J4_13_lag + r*P2C1S1J4_13 - f*P1C1S1J4_13- s1s2_p1c1j4_13*P1C1S1J4_13- (c1c2_p1s1j4_13+c1c3_p1s1j4_13)*P1C1S1J4_13+ j3j4_p1c1s1_13*P1C1S1J3_13 - j4j3_p1c1s1_13*P1C1S1J4_13
  deriv(P1C1S2J1_13) <- age_up*P1C1S2J1_12_lag - age_up*P1C1S2J1_13_lag + r*P2C1S2J1_13 - f*P1C1S2J1_13+ s1s2_p1c1j1_13*P1C1S1J1_13 - s2s3_p1c1j1_13*P1C1S2J1_13 + s3s2_p1c1j1_13*P1C1S3J1_13- (c1c2_p1s2j1_13+c1c3_p1s2j1_13)*P1C1S2J1_13- j1j2_p1c1s2_13*P1C1S2J1_13
  deriv(P1C1S2J2_13) <- age_up*P1C1S2J2_12_lag - age_up*P1C1S2J2_13_lag + r*P2C1S2J2_13 - f*P1C1S2J2_13+ s1s2_p1c1j2_13*P1C1S1J2_13 - s2s3_p1c1j2_13*P1C1S2J2_13 + s3s2_p1c1j2_13*P1C1S3J2_13- (c1c2_p1s2j2_13+c1c3_p1s2j2_13)*P1C1S2J2_13+ j1j2_p1c1s2_13*P1C1S2J1_13 - j2j3_p1c1s2_13*P1C1S2J2_13
  deriv(P1C1S2J3_13) <- age_up*P1C1S2J3_12_lag - age_up*P1C1S2J3_13_lag + r*P2C1S2J3_13 - f*P1C1S2J3_13+ s1s2_p1c1j3_13*P1C1S1J3_13 - s2s3_p1c1j3_13*P1C1S2J3_13 + s3s2_p1c1j3_13*P1C1S3J3_13- (c1c2_p1s2j3_13+c1c3_p1s2j3_13)*P1C1S2J3_13+ j2j3_p1c1s2_13*P1C1S2J2_13 + j4j3_p1c1s2_13*P1C1S2J4_13 - j3j4_p1c1s2_13*P1C1S2J3_13
  deriv(P1C1S2J4_13) <- age_up*P1C1S2J4_12_lag - age_up*P1C1S2J4_13_lag + r*P2C1S2J4_13 - f*P1C1S2J4_13+ s1s2_p1c1j4_13*P1C1S1J4_13 - s2s3_p1c1j4_13*P1C1S2J4_13 + s3s2_p1c1j4_13*P1C1S3J4_13- (c1c2_p1s2j4_13+c1c3_p1s2j4_13)*P1C1S2J4_13+ j3j4_p1c1s2_13*P1C1S2J3_13 - j4j3_p1c1s2_13*P1C1S2J4_13
  deriv(P1C1S3J1_13) <- age_up*P1C1S3J1_12_lag - age_up*P1C1S3J1_13_lag + r*P2C1S3J1_13 - f*P1C1S3J1_13+ s2s3_p1c1j1_13*P1C1S2J1_13 - s3s2_p1c1j1_13*P1C1S3J1_13- (c1c2_p1s3j1_13+c1c3_p1s3j1_13)*P1C1S3J1_13- j1j2_p1c1s3_13*P1C1S3J1_13
  deriv(P1C1S3J2_13) <- age_up*P1C1S3J2_12_lag - age_up*P1C1S3J2_13_lag + r*P2C1S3J2_13 - f*P1C1S3J2_13+ s2s3_p1c1j2_13*P1C1S2J2_13 - s3s2_p1c1j2_13*P1C1S3J2_13- (c1c2_p1s3j2_13+c1c3_p1s3j2_13)*P1C1S3J2_13+ j1j2_p1c1s3_13*P1C1S3J1_13 - j2j3_p1c1s3_13*P1C1S3J2_13
  deriv(P1C1S3J3_13) <- age_up*P1C1S3J3_12_lag - age_up*P1C1S3J3_13_lag + r*P2C1S3J3_13 - f*P1C1S3J3_13+ s2s3_p1c1j3_13*P1C1S2J3_13 - s3s2_p1c1j3_13*P1C1S3J3_13- (c1c2_p1s3j3_13+c1c3_p1s3j3_13)*P1C1S3J3_13+ j2j3_p1c1s3_13*P1C1S3J2_13 + j4j3_p1c1s3_13*P1C1S3J4_13 - j3j4_p1c1s3_13*P1C1S3J3_13
  deriv(P1C1S3J4_13) <- age_up*P1C1S3J4_12_lag - age_up*P1C1S3J4_13_lag + r*P2C1S3J4_13 - f*P1C1S3J4_13+ s2s3_p1c1j4_13*P1C1S2J4_13 - s3s2_p1c1j4_13*P1C1S3J4_13- (c1c2_p1s3j4_13+c1c3_p1s3j4_13)*P1C1S3J4_13+ j3j4_p1c1s3_13*P1C1S3J3_13 - j4j3_p1c1s3_13*P1C1S3J4_13
  deriv(P1C2S1J1_13) <- age_up*P1C2S1J1_12_lag - age_up*P1C2S1J1_13_lag + r*P2C2S1J1_13 - f*P1C2S1J1_13- s1s2_p1c2j1_13*P1C2S1J1_13+ c1c2_p1s1j1_13*P1C1S1J1_13 + c3c2_p1s1j1_13*P1C3S1J1_13 + c4c2_p1s1j1_13*P1C4S1J1_13 - (c2c3_p1s1j1_13+c2c4_p1s1j1_13)*P1C2S1J1_13- j1j2_p1c2s1_13*P1C2S1J1_13
  deriv(P1C2S1J2_13) <- age_up*P1C2S1J2_12_lag - age_up*P1C2S1J2_13_lag + r*P2C2S1J2_13 - f*P1C2S1J2_13- s1s2_p1c2j2_13*P1C2S1J2_13+ c1c2_p1s1j2_13*P1C1S1J2_13 + c3c2_p1s1j2_13*P1C3S1J2_13 + c4c2_p1s1j2_13*P1C4S1J2_13 - (c2c3_p1s1j2_13+c2c4_p1s1j2_13)*P1C2S1J2_13+ j1j2_p1c2s1_13*P1C2S1J1_13 - j2j3_p1c2s1_13*P1C2S1J2_13
  deriv(P1C2S1J3_13) <- age_up*P1C2S1J3_12_lag - age_up*P1C2S1J3_13_lag + r*P2C2S1J3_13 - f*P1C2S1J3_13- s1s2_p1c2j3_13*P1C2S1J3_13+ c1c2_p1s1j3_13*P1C1S1J3_13 + c3c2_p1s1j3_13*P1C3S1J3_13 + c4c2_p1s1j3_13*P1C4S1J3_13 - (c2c3_p1s1j3_13+c2c4_p1s1j3_13)*P1C2S1J3_13+ j2j3_p1c2s1_13*P1C2S1J2_13 + j4j3_p1c2s1_13*P1C2S1J4_13 - j3j4_p1c2s1_13*P1C2S1J3_13
  deriv(P1C2S1J4_13) <- age_up*P1C2S1J4_12_lag - age_up*P1C2S1J4_13_lag + r*P2C2S1J4_13 - f*P1C2S1J4_13- s1s2_p1c2j4_13*P1C2S1J4_13+ c1c2_p1s1j4_13*P1C1S1J4_13 + c3c2_p1s1j4_13*P1C3S1J4_13 + c4c2_p1s1j4_13*P1C4S1J4_13 - (c2c3_p1s1j4_13+c2c4_p1s1j4_13)*P1C2S1J4_13+ j3j4_p1c2s1_13*P1C2S1J3_13 - j4j3_p1c2s1_13*P1C2S1J4_13
  deriv(P1C2S2J1_13) <- age_up*P1C2S2J1_12_lag - age_up*P1C2S2J1_13_lag + r*P2C2S2J1_13 - f*P1C2S2J1_13+ s1s2_p1c2j1_13*P1C2S1J1_13 - s2s3_p1c2j1_13*P1C2S2J1_13 + s3s2_p1c2j1_13*P1C2S3J1_13+ c1c2_p1s2j1_13*P1C1S2J1_13 + c3c2_p1s2j1_13*P1C3S2J1_13 + c4c2_p1s2j1_13*P1C4S2J1_13 - (c2c3_p1s2j1_13+c2c4_p1s2j1_13)*P1C2S2J1_13- j1j2_p1c2s2_13*P1C2S2J1_13
  deriv(P1C2S2J2_13) <- age_up*P1C2S2J2_12_lag - age_up*P1C2S2J2_13_lag + r*P2C2S2J2_13 - f*P1C2S2J2_13+ s1s2_p1c2j2_13*P1C2S1J2_13 - s2s3_p1c2j2_13*P1C2S2J2_13 + s3s2_p1c2j2_13*P1C2S3J2_13+ c1c2_p1s2j2_13*P1C1S2J2_13 + c3c2_p1s2j2_13*P1C3S2J2_13 + c4c2_p1s2j2_13*P1C4S2J2_13 - (c2c3_p1s2j2_13+c2c4_p1s2j2_13)*P1C2S2J2_13+ j1j2_p1c2s2_13*P1C2S2J1_13 - j2j3_p1c2s2_13*P1C2S2J2_13
  deriv(P1C2S2J3_13) <- age_up*P1C2S2J3_12_lag - age_up*P1C2S2J3_13_lag + r*P2C2S2J3_13 - f*P1C2S2J3_13+ s1s2_p1c2j3_13*P1C2S1J3_13 - s2s3_p1c2j3_13*P1C2S2J3_13 + s3s2_p1c2j3_13*P1C2S3J3_13+ c1c2_p1s2j3_13*P1C1S2J3_13 + c3c2_p1s2j3_13*P1C3S2J3_13 + c4c2_p1s2j3_13*P1C4S2J3_13 - (c2c3_p1s2j3_13+c2c4_p1s2j3_13)*P1C2S2J3_13+ j2j3_p1c2s2_13*P1C2S2J2_13 + j4j3_p1c2s2_13*P1C2S2J4_13 - j3j4_p1c2s2_13*P1C2S2J3_13
  deriv(P1C2S2J4_13) <- age_up*P1C2S2J4_12_lag - age_up*P1C2S2J4_13_lag + r*P2C2S2J4_13 - f*P1C2S2J4_13+ s1s2_p1c2j4_13*P1C2S1J4_13 - s2s3_p1c2j4_13*P1C2S2J4_13 + s3s2_p1c2j4_13*P1C2S3J4_13+ c1c2_p1s2j4_13*P1C1S2J4_13 + c3c2_p1s2j4_13*P1C3S2J4_13 + c4c2_p1s2j4_13*P1C4S2J4_13 - (c2c3_p1s2j4_13+c2c4_p1s2j4_13)*P1C2S2J4_13+ j3j4_p1c2s2_13*P1C2S2J3_13 - j4j3_p1c2s2_13*P1C2S2J4_13
  deriv(P1C2S3J1_13) <- age_up*P1C2S3J1_12_lag - age_up*P1C2S3J1_13_lag + r*P2C2S3J1_13 - f*P1C2S3J1_13+ s2s3_p1c2j1_13*P1C2S2J1_13 - s3s2_p1c2j1_13*P1C2S3J1_13+ c1c2_p1s3j1_13*P1C1S3J1_13 + c3c2_p1s3j1_13*P1C3S3J1_13 + c4c2_p1s3j1_13*P1C4S3J1_13 - (c2c3_p1s3j1_13+c2c4_p1s3j1_13)*P1C2S3J1_13- j1j2_p1c2s3_13*P1C2S3J1_13
  deriv(P1C2S3J2_13) <- age_up*P1C2S3J2_12_lag - age_up*P1C2S3J2_13_lag + r*P2C2S3J2_13 - f*P1C2S3J2_13+ s2s3_p1c2j2_13*P1C2S2J2_13 - s3s2_p1c2j2_13*P1C2S3J2_13+ c1c2_p1s3j2_13*P1C1S3J2_13 + c3c2_p1s3j2_13*P1C3S3J2_13 + c4c2_p1s3j2_13*P1C4S3J2_13 - (c2c3_p1s3j2_13+c2c4_p1s3j2_13)*P1C2S3J2_13+ j1j2_p1c2s3_13*P1C2S3J1_13 - j2j3_p1c2s3_13*P1C2S3J2_13
  deriv(P1C2S3J3_13) <- age_up*P1C2S3J3_12_lag - age_up*P1C2S3J3_13_lag + r*P2C2S3J3_13 - f*P1C2S3J3_13+ s2s3_p1c2j3_13*P1C2S2J3_13 - s3s2_p1c2j3_13*P1C2S3J3_13+ c1c2_p1s3j3_13*P1C1S3J3_13 + c3c2_p1s3j3_13*P1C3S3J3_13 + c4c2_p1s3j3_13*P1C4S3J3_13 - (c2c3_p1s3j3_13+c2c4_p1s3j3_13)*P1C2S3J3_13+ j2j3_p1c2s3_13*P1C2S3J2_13 + j4j3_p1c2s3_13*P1C2S3J4_13 - j3j4_p1c2s3_13*P1C2S3J3_13
  deriv(P1C2S3J4_13) <- age_up*P1C2S3J4_12_lag - age_up*P1C2S3J4_13_lag + r*P2C2S3J4_13 - f*P1C2S3J4_13+ s2s3_p1c2j4_13*P1C2S2J4_13 - s3s2_p1c2j4_13*P1C2S3J4_13+ c1c2_p1s3j4_13*P1C1S3J4_13 + c3c2_p1s3j4_13*P1C3S3J4_13 + c4c2_p1s3j4_13*P1C4S3J4_13 - (c2c3_p1s3j4_13+c2c4_p1s3j4_13)*P1C2S3J4_13+ j3j4_p1c2s3_13*P1C2S3J3_13 - j4j3_p1c2s3_13*P1C2S3J4_13
  deriv(P1C3S1J1_13) <- age_up*P1C3S1J1_12_lag - age_up*P1C3S1J1_13_lag + r*P2C3S1J1_13 - f*P1C3S1J1_13- s1s2_p1c3j1_13*P1C3S1J1_13+ c1c3_p1s1j1_13*P1C1S1J1_13+ c2c3_p1s1j1_13*P1C2S1J1_13 + c4c3_p1s1j1_13*P1C4S1J1_13 - (c3c2_p1s1j1_13+c3c4_p1s1j1_13)*P1C3S1J1_13- j1j2_p1c3s1_13*P1C3S1J1_13
  deriv(P1C3S1J2_13) <- age_up*P1C3S1J2_12_lag - age_up*P1C3S1J2_13_lag + r*P2C3S1J2_13 - f*P1C3S1J2_13- s1s2_p1c3j2_13*P1C3S1J2_13+ c1c3_p1s1j2_13*P1C1S1J2_13+ c2c3_p1s1j2_13*P1C2S1J2_13 + c4c3_p1s1j2_13*P1C4S1J2_13 - (c3c2_p1s1j2_13+c3c4_p1s1j2_13)*P1C3S1J2_13+ j1j2_p1c3s1_13*P1C3S1J1_13 - j2j3_p1c3s1_13*P1C3S1J2_13
  deriv(P1C3S1J3_13) <- age_up*P1C3S1J3_12_lag - age_up*P1C3S1J3_13_lag + r*P2C3S1J3_13 - f*P1C3S1J3_13- s1s2_p1c3j3_13*P1C3S1J3_13+ c1c3_p1s1j3_13*P1C1S1J3_13+ c2c3_p1s1j3_13*P1C2S1J3_13 + c4c3_p1s1j3_13*P1C4S1J3_13 - (c3c2_p1s1j3_13+c3c4_p1s1j3_13)*P1C3S1J3_13+ j2j3_p1c3s1_13*P1C3S1J2_13 + j4j3_p1c3s1_13*P1C3S1J4_13 - j3j4_p1c3s1_13*P1C3S1J3_13
  deriv(P1C3S1J4_13) <- age_up*P1C3S1J4_12_lag - age_up*P1C3S1J4_13_lag + r*P2C3S1J4_13 - f*P1C3S1J4_13- s1s2_p1c3j4_13*P1C3S1J4_13+ c1c3_p1s1j4_13*P1C1S1J4_13+ c2c3_p1s1j4_13*P1C2S1J4_13 + c4c3_p1s1j4_13*P1C4S1J4_13 - (c3c2_p1s1j4_13+c3c4_p1s1j4_13)*P1C3S1J4_13+ j3j4_p1c3s1_13*P1C3S1J3_13 - j4j3_p1c3s1_13*P1C3S1J4_13
  deriv(P1C3S2J1_13) <- age_up*P1C3S2J1_12_lag - age_up*P1C3S2J1_13_lag + r*P2C3S2J1_13 - f*P1C3S2J1_13+ s1s2_p1c3j1_13*P1C3S1J1_13 - s2s3_p1c3j1_13*P1C3S2J1_13 + s3s2_p1c3j1_13*P1C3S3J1_13+ c1c3_p1s2j1_13*P1C1S2J1_13+ c2c3_p1s2j1_13*P1C2S2J1_13 + c4c3_p1s2j1_13*P1C4S2J1_13 - (c3c2_p1s2j1_13+c3c4_p1s2j1_13)*P1C3S2J1_13- j1j2_p1c3s2_13*P1C3S2J1_13
  deriv(P1C3S2J2_13) <- age_up*P1C3S2J2_12_lag - age_up*P1C3S2J2_13_lag + r*P2C3S2J2_13 - f*P1C3S2J2_13+ s1s2_p1c3j2_13*P1C3S1J2_13 - s2s3_p1c3j2_13*P1C3S2J2_13 + s3s2_p1c3j2_13*P1C3S3J2_13+ c1c3_p1s2j2_13*P1C1S2J2_13+ c2c3_p1s2j2_13*P1C2S2J2_13 + c4c3_p1s2j2_13*P1C4S2J2_13 - (c3c2_p1s2j2_13+c3c4_p1s2j2_13)*P1C3S2J2_13+ j1j2_p1c3s2_13*P1C3S2J1_13 - j2j3_p1c3s2_13*P1C3S2J2_13
  deriv(P1C3S2J3_13) <- age_up*P1C3S2J3_12_lag - age_up*P1C3S2J3_13_lag + r*P2C3S2J3_13 - f*P1C3S2J3_13+ s1s2_p1c3j3_13*P1C3S1J3_13 - s2s3_p1c3j3_13*P1C3S2J3_13 + s3s2_p1c3j3_13*P1C3S3J3_13+ c1c3_p1s2j3_13*P1C1S2J3_13+ c2c3_p1s2j3_13*P1C2S2J3_13 + c4c3_p1s2j3_13*P1C4S2J3_13 - (c3c2_p1s2j3_13+c3c4_p1s2j3_13)*P1C3S2J3_13+ j2j3_p1c3s2_13*P1C3S2J2_13 + j4j3_p1c3s2_13*P1C3S2J4_13 - j3j4_p1c3s2_13*P1C3S2J3_13
  deriv(P1C3S2J4_13) <- age_up*P1C3S2J4_12_lag - age_up*P1C3S2J4_13_lag + r*P2C3S2J4_13 - f*P1C3S2J4_13+ s1s2_p1c3j4_13*P1C3S1J4_13 - s2s3_p1c3j4_13*P1C3S2J4_13 + s3s2_p1c3j4_13*P1C3S3J4_13+ c1c3_p1s2j4_13*P1C1S2J4_13+ c2c3_p1s2j4_13*P1C2S2J4_13 + c4c3_p1s2j4_13*P1C4S2J4_13 - (c3c2_p1s2j4_13+c3c4_p1s2j4_13)*P1C3S2J4_13+ j3j4_p1c3s2_13*P1C3S2J3_13 - j4j3_p1c3s2_13*P1C3S2J4_13
  deriv(P1C3S3J1_13) <- age_up*P1C3S3J1_12_lag - age_up*P1C3S3J1_13_lag + r*P2C3S3J1_13 - f*P1C3S3J1_13+ s2s3_p1c3j1_13*P1C3S2J1_13 - s3s2_p1c3j1_13*P1C3S3J1_13+ c1c3_p1s3j1_13*P1C1S3J1_13+ c2c3_p1s3j1_13*P1C2S3J1_13 + c4c3_p1s3j1_13*P1C4S3J1_13 - (c3c2_p1s3j1_13+c3c4_p1s3j1_13)*P1C3S3J1_13- j1j2_p1c3s3_13*P1C3S3J1_13
  deriv(P1C3S3J2_13) <- age_up*P1C3S3J2_12_lag - age_up*P1C3S3J2_13_lag + r*P2C3S3J2_13 - f*P1C3S3J2_13+ s2s3_p1c3j2_13*P1C3S2J2_13 - s3s2_p1c3j2_13*P1C3S3J2_13+ c1c3_p1s3j2_13*P1C1S3J2_13+ c2c3_p1s3j2_13*P1C2S3J2_13 + c4c3_p1s3j2_13*P1C4S3J2_13 - (c3c2_p1s3j2_13+c3c4_p1s3j2_13)*P1C3S3J2_13+ j1j2_p1c3s3_13*P1C3S3J1_13 - j2j3_p1c3s3_13*P1C3S3J2_13
  deriv(P1C3S3J3_13) <- age_up*P1C3S3J3_12_lag - age_up*P1C3S3J3_13_lag + r*P2C3S3J3_13 - f*P1C3S3J3_13+ s2s3_p1c3j3_13*P1C3S2J3_13 - s3s2_p1c3j3_13*P1C3S3J3_13+ c1c3_p1s3j3_13*P1C1S3J3_13+ c2c3_p1s3j3_13*P1C2S3J3_13 + c4c3_p1s3j3_13*P1C4S3J3_13 - (c3c2_p1s3j3_13+c3c4_p1s3j3_13)*P1C3S3J3_13+ j2j3_p1c3s3_13*P1C3S3J2_13 + j4j3_p1c3s3_13*P1C3S3J4_13 - j3j4_p1c3s3_13*P1C3S3J3_13
  deriv(P1C3S3J4_13) <- age_up*P1C3S3J4_12_lag - age_up*P1C3S3J4_13_lag + r*P2C3S3J4_13 - f*P1C3S3J4_13+ s2s3_p1c3j4_13*P1C3S2J4_13 - s3s2_p1c3j4_13*P1C3S3J4_13+ c1c3_p1s3j4_13*P1C1S3J4_13+ c2c3_p1s3j4_13*P1C2S3J4_13 + c4c3_p1s3j4_13*P1C4S3J4_13 - (c3c2_p1s3j4_13+c3c4_p1s3j4_13)*P1C3S3J4_13+ j3j4_p1c3s3_13*P1C3S3J3_13 - j4j3_p1c3s3_13*P1C3S3J4_13
  deriv(P1C4S1J1_13) <- age_up*P1C4S1J1_12_lag - age_up*P1C4S1J1_13_lag + r*P2C4S1J1_13 - f*P1C4S1J1_13- s1s2_p1c4j1_13*P1C4S1J1_13+ c2c4_p1s1j1_13*P1C2S1J1_13 + c3c4_p1s1j1_13*P1C3S1J1_13- (c4c2_p1s1j1_13+c4c3_p1s1j1_13)*P1C4S1J1_13- j1j2_p1c4s1_13*P1C4S1J1_13
  deriv(P1C4S1J2_13) <- age_up*P1C4S1J2_12_lag - age_up*P1C4S1J2_13_lag + r*P2C4S1J2_13 - f*P1C4S1J2_13- s1s2_p1c4j2_13*P1C4S1J2_13+ c2c4_p1s1j2_13*P1C2S1J2_13 + c3c4_p1s1j2_13*P1C3S1J2_13- (c4c2_p1s1j2_13+c4c3_p1s1j2_13)*P1C4S1J2_13+ j1j2_p1c4s1_13*P1C4S1J1_13 - j2j3_p1c4s1_13*P1C4S1J2_13
  deriv(P1C4S1J3_13) <- age_up*P1C4S1J3_12_lag - age_up*P1C4S1J3_13_lag + r*P2C4S1J3_13 - f*P1C4S1J3_13- s1s2_p1c4j3_13*P1C4S1J3_13+ c2c4_p1s1j3_13*P1C2S1J3_13 + c3c4_p1s1j3_13*P1C3S1J3_13- (c4c2_p1s1j3_13+c4c3_p1s1j3_13)*P1C4S1J3_13+ j2j3_p1c4s1_13*P1C4S1J2_13 + j4j3_p1c4s1_13*P1C4S1J4_13 - j3j4_p1c4s1_13*P1C4S1J3_13
  deriv(P1C4S1J4_13) <- age_up*P1C4S1J4_12_lag - age_up*P1C4S1J4_13_lag + r*P2C4S1J4_13 - f*P1C4S1J4_13- s1s2_p1c4j4_13*P1C4S1J4_13+ c2c4_p1s1j4_13*P1C2S1J4_13 + c3c4_p1s1j4_13*P1C3S1J4_13- (c4c2_p1s1j4_13+c4c3_p1s1j4_13)*P1C4S1J4_13+ j3j4_p1c4s1_13*P1C4S1J3_13 - j4j3_p1c4s1_13*P1C4S1J4_13
  deriv(P1C4S2J1_13) <- age_up*P1C4S2J1_12_lag - age_up*P1C4S2J1_13_lag + r*P2C4S2J1_13 - f*P1C4S2J1_13+ s1s2_p1c4j1_13*P1C4S1J1_13 - s2s3_p1c4j1_13*P1C4S2J1_13 + s3s2_p1c4j1_13*P1C4S3J1_13+ c2c4_p1s2j1_13*P1C2S2J1_13 + c3c4_p1s2j1_13*P1C3S2J1_13- (c4c2_p1s2j1_13+c4c3_p1s2j1_13)*P1C4S2J1_13- j1j2_p1c4s2_13*P1C4S2J1_13
  deriv(P1C4S2J2_13) <- age_up*P1C4S2J2_12_lag - age_up*P1C4S2J2_13_lag + r*P2C4S2J2_13 - f*P1C4S2J2_13+ s1s2_p1c4j2_13*P1C4S1J2_13 - s2s3_p1c4j2_13*P1C4S2J2_13 + s3s2_p1c4j2_13*P1C4S3J2_13+ c2c4_p1s2j2_13*P1C2S2J2_13 + c3c4_p1s2j2_13*P1C3S2J2_13- (c4c2_p1s2j2_13+c4c3_p1s2j2_13)*P1C4S2J2_13+ j1j2_p1c4s2_13*P1C4S2J1_13 - j2j3_p1c4s2_13*P1C4S2J2_13
  deriv(P1C4S2J3_13) <- age_up*P1C4S2J3_12_lag - age_up*P1C4S2J3_13_lag + r*P2C4S2J3_13 - f*P1C4S2J3_13+ s1s2_p1c4j3_13*P1C4S1J3_13 - s2s3_p1c4j3_13*P1C4S2J3_13 + s3s2_p1c4j3_13*P1C4S3J3_13+ c2c4_p1s2j3_13*P1C2S2J3_13 + c3c4_p1s2j3_13*P1C3S2J3_13- (c4c2_p1s2j3_13+c4c3_p1s2j3_13)*P1C4S2J3_13+ j2j3_p1c4s2_13*P1C4S2J2_13 + j4j3_p1c4s2_13*P1C4S2J4_13 - j3j4_p1c4s2_13*P1C4S2J3_13
  deriv(P1C4S2J4_13) <- age_up*P1C4S2J4_12_lag - age_up*P1C4S2J4_13_lag + r*P2C4S2J4_13 - f*P1C4S2J4_13+ s1s2_p1c4j4_13*P1C4S1J4_13 - s2s3_p1c4j4_13*P1C4S2J4_13 + s3s2_p1c4j4_13*P1C4S3J4_13+ c2c4_p1s2j4_13*P1C2S2J4_13 + c3c4_p1s2j4_13*P1C3S2J4_13- (c4c2_p1s2j4_13+c4c3_p1s2j4_13)*P1C4S2J4_13+ j3j4_p1c4s2_13*P1C4S2J3_13 - j4j3_p1c4s2_13*P1C4S2J4_13
  deriv(P1C4S3J1_13) <- age_up*P1C4S3J1_12_lag - age_up*P1C4S3J1_13_lag + r*P2C4S3J1_13 - f*P1C4S3J1_13+ s2s3_p1c4j1_13*P1C4S2J1_13 - s3s2_p1c4j1_13*P1C4S3J1_13+ c2c4_p1s3j1_13*P1C2S3J1_13 + c3c4_p1s3j1_13*P1C3S3J1_13- (c4c2_p1s3j1_13+c4c3_p1s3j1_13)*P1C4S3J1_13- j1j2_p1c4s3_13*P1C4S3J1_13
  deriv(P1C4S3J2_13) <- age_up*P1C4S3J2_12_lag - age_up*P1C4S3J2_13_lag + r*P2C4S3J2_13 - f*P1C4S3J2_13+ s2s3_p1c4j2_13*P1C4S2J2_13 - s3s2_p1c4j2_13*P1C4S3J2_13+ c2c4_p1s3j2_13*P1C2S3J2_13 + c3c4_p1s3j2_13*P1C3S3J2_13- (c4c2_p1s3j2_13+c4c3_p1s3j2_13)*P1C4S3J2_13+ j1j2_p1c4s3_13*P1C4S3J1_13 - j2j3_p1c4s3_13*P1C4S3J2_13
  deriv(P1C4S3J3_13) <- age_up*P1C4S3J3_12_lag - age_up*P1C4S3J3_13_lag + r*P2C4S3J3_13 - f*P1C4S3J3_13+ s2s3_p1c4j3_13*P1C4S2J3_13 - s3s2_p1c4j3_13*P1C4S3J3_13+ c2c4_p1s3j3_13*P1C2S3J3_13 + c3c4_p1s3j3_13*P1C3S3J3_13- (c4c2_p1s3j3_13+c4c3_p1s3j3_13)*P1C4S3J3_13+ j2j3_p1c4s3_13*P1C4S3J2_13 + j4j3_p1c4s3_13*P1C4S3J4_13 - j3j4_p1c4s3_13*P1C4S3J3_13
  deriv(P1C4S3J4_13) <- age_up*P1C4S3J4_12_lag - age_up*P1C4S3J4_13_lag + r*P2C4S3J4_13 - f*P1C4S3J4_13+ s2s3_p1c4j4_13*P1C4S2J4_13 - s3s2_p1c4j4_13*P1C4S3J4_13+ c2c4_p1s3j4_13*P1C2S3J4_13 + c3c4_p1s3j4_13*P1C3S3J4_13- (c4c2_p1s3j4_13+c4c3_p1s3j4_13)*P1C4S3J4_13+ j3j4_p1c4s3_13*P1C4S3J3_13 - j4j3_p1c4s3_13*P1C4S3J4_13
  deriv(P2C1S1J1_13) <- age_up*P2C1S1J1_12_lag - age_up*P2C1S1J1_13_lag  + f*P1C1S1J1_13 - r*P2C1S1J1_13- s1s2_p2c1j1_13*P2C1S1J1_13- (c1c2_p2s1j1_13+c1c3_p2s1j1_13)*P2C1S1J1_13- j1j2_p2c1s1_13*P2C1S1J1_13
  deriv(P2C1S1J2_13) <- age_up*P2C1S1J2_12_lag - age_up*P2C1S1J2_13_lag  + f*P1C1S1J2_13 - r*P2C1S1J2_13- s1s2_p2c1j2_13*P2C1S1J2_13- (c1c2_p2s1j2_13+c1c3_p2s1j2_13)*P2C1S1J2_13+ j1j2_p2c1s1_13*P2C1S1J1_13 - j2j3_p2c1s1_13*P2C1S1J2_13
  deriv(P2C1S1J3_13) <- age_up*P2C1S1J3_12_lag - age_up*P2C1S1J3_13_lag  + f*P1C1S1J3_13 - r*P2C1S1J3_13- s1s2_p2c1j3_13*P2C1S1J3_13- (c1c2_p2s1j3_13+c1c3_p2s1j3_13)*P2C1S1J3_13+ j2j3_p2c1s1_13*P2C1S1J2_13 + j4j3_p2c1s1_13*P2C1S1J4_13 - j3j4_p2c1s1_13*P2C1S1J3_13
  deriv(P2C1S1J4_13) <- age_up*P2C1S1J4_12_lag - age_up*P2C1S1J4_13_lag  + f*P1C1S1J4_13 - r*P2C1S1J4_13- s1s2_p2c1j4_13*P2C1S1J4_13- (c1c2_p2s1j4_13+c1c3_p2s1j4_13)*P2C1S1J4_13+ j3j4_p2c1s1_13*P2C1S1J3_13 - j4j3_p2c1s1_13*P2C1S1J4_13
  deriv(P2C1S2J1_13) <- age_up*P2C1S2J1_12_lag - age_up*P2C1S2J1_13_lag  + f*P1C1S2J1_13 - r*P2C1S2J1_13+ s1s2_p2c1j1_13*P2C1S1J1_13 - s2s3_p2c1j1_13*P2C1S2J1_13 + s3s2_p2c1j1_13*P2C1S3J1_13- (c1c2_p2s2j1_13+c1c3_p2s2j1_13)*P2C1S2J1_13- j1j2_p2c1s2_13*P2C1S2J1_13
  deriv(P2C1S2J2_13) <- age_up*P2C1S2J2_12_lag - age_up*P2C1S2J2_13_lag  + f*P1C1S2J2_13 - r*P2C1S2J2_13+ s1s2_p2c1j2_13*P2C1S1J2_13 - s2s3_p2c1j2_13*P2C1S2J2_13 + s3s2_p2c1j2_13*P2C1S3J2_13- (c1c2_p2s2j2_13+c1c3_p2s2j2_13)*P2C1S2J2_13+ j1j2_p2c1s2_13*P2C1S2J1_13 - j2j3_p2c1s2_13*P2C1S2J2_13
  deriv(P2C1S2J3_13) <- age_up*P2C1S2J3_12_lag - age_up*P2C1S2J3_13_lag  + f*P1C1S2J3_13 - r*P2C1S2J3_13+ s1s2_p2c1j3_13*P2C1S1J3_13 - s2s3_p2c1j3_13*P2C1S2J3_13 + s3s2_p2c1j3_13*P2C1S3J3_13- (c1c2_p2s2j3_13+c1c3_p2s2j3_13)*P2C1S2J3_13+ j2j3_p2c1s2_13*P2C1S2J2_13 + j4j3_p2c1s2_13*P2C1S2J4_13 - j3j4_p2c1s2_13*P2C1S2J3_13
  deriv(P2C1S2J4_13) <- age_up*P2C1S2J4_12_lag - age_up*P2C1S2J4_13_lag  + f*P1C1S2J4_13 - r*P2C1S2J4_13+ s1s2_p2c1j4_13*P2C1S1J4_13 - s2s3_p2c1j4_13*P2C1S2J4_13 + s3s2_p2c1j4_13*P2C1S3J4_13- (c1c2_p2s2j4_13+c1c3_p2s2j4_13)*P2C1S2J4_13+ j3j4_p2c1s2_13*P2C1S2J3_13 - j4j3_p2c1s2_13*P2C1S2J4_13
  deriv(P2C1S3J1_13) <- age_up*P2C1S3J1_12_lag - age_up*P2C1S3J1_13_lag  + f*P1C1S3J1_13 - r*P2C1S3J1_13+ s2s3_p2c1j1_13*P2C1S2J1_13 - s3s2_p2c1j1_13*P2C1S3J1_13- (c1c2_p2s3j1_13+c1c3_p2s3j1_13)*P2C1S3J1_13- j1j2_p2c1s3_13*P2C1S3J1_13
  deriv(P2C1S3J2_13) <- age_up*P2C1S3J2_12_lag - age_up*P2C1S3J2_13_lag  + f*P1C1S3J2_13 - r*P2C1S3J2_13+ s2s3_p2c1j2_13*P2C1S2J2_13 - s3s2_p2c1j2_13*P2C1S3J2_13- (c1c2_p2s3j2_13+c1c3_p2s3j2_13)*P2C1S3J2_13+ j1j2_p2c1s3_13*P2C1S3J1_13 - j2j3_p2c1s3_13*P2C1S3J2_13
  deriv(P2C1S3J3_13) <- age_up*P2C1S3J3_12_lag - age_up*P2C1S3J3_13_lag  + f*P1C1S3J3_13 - r*P2C1S3J3_13+ s2s3_p2c1j3_13*P2C1S2J3_13 - s3s2_p2c1j3_13*P2C1S3J3_13- (c1c2_p2s3j3_13+c1c3_p2s3j3_13)*P2C1S3J3_13+ j2j3_p2c1s3_13*P2C1S3J2_13 + j4j3_p2c1s3_13*P2C1S3J4_13 - j3j4_p2c1s3_13*P2C1S3J3_13
  deriv(P2C1S3J4_13) <- age_up*P2C1S3J4_12_lag - age_up*P2C1S3J4_13_lag  + f*P1C1S3J4_13 - r*P2C1S3J4_13+ s2s3_p2c1j4_13*P2C1S2J4_13 - s3s2_p2c1j4_13*P2C1S3J4_13- (c1c2_p2s3j4_13+c1c3_p2s3j4_13)*P2C1S3J4_13+ j3j4_p2c1s3_13*P2C1S3J3_13 - j4j3_p2c1s3_13*P2C1S3J4_13
  deriv(P2C2S1J1_13) <- age_up*P2C2S1J1_12_lag - age_up*P2C2S1J1_13_lag  + f*P1C2S1J1_13 - r*P2C2S1J1_13- s1s2_p2c2j1_13*P2C2S1J1_13+ c1c2_p2s1j1_13*P2C1S1J1_13 + c3c2_p2s1j1_13*P2C3S1J1_13 + c4c2_p2s1j1_13*P2C4S1J1_13 - (c2c3_p2s1j1_13+c2c4_p2s1j1_13)*P2C2S1J1_13- j1j2_p2c2s1_13*P2C2S1J1_13
  deriv(P2C2S1J2_13) <- age_up*P2C2S1J2_12_lag - age_up*P2C2S1J2_13_lag  + f*P1C2S1J2_13 - r*P2C2S1J2_13- s1s2_p2c2j2_13*P2C2S1J2_13+ c1c2_p2s1j2_13*P2C1S1J2_13 + c3c2_p2s1j2_13*P2C3S1J2_13 + c4c2_p2s1j2_13*P2C4S1J2_13 - (c2c3_p2s1j2_13+c2c4_p2s1j2_13)*P2C2S1J2_13+ j1j2_p2c2s1_13*P2C2S1J1_13 - j2j3_p2c2s1_13*P2C2S1J2_13
  deriv(P2C2S1J3_13) <- age_up*P2C2S1J3_12_lag - age_up*P2C2S1J3_13_lag  + f*P1C2S1J3_13 - r*P2C2S1J3_13- s1s2_p2c2j3_13*P2C2S1J3_13+ c1c2_p2s1j3_13*P2C1S1J3_13 + c3c2_p2s1j3_13*P2C3S1J3_13 + c4c2_p2s1j3_13*P2C4S1J3_13 - (c2c3_p2s1j3_13+c2c4_p2s1j3_13)*P2C2S1J3_13+ j2j3_p2c2s1_13*P2C2S1J2_13 + j4j3_p2c2s1_13*P2C2S1J4_13 - j3j4_p2c2s1_13*P2C2S1J3_13
  deriv(P2C2S1J4_13) <- age_up*P2C2S1J4_12_lag - age_up*P2C2S1J4_13_lag  + f*P1C2S1J4_13 - r*P2C2S1J4_13- s1s2_p2c2j4_13*P2C2S1J4_13+ c1c2_p2s1j4_13*P2C1S1J4_13 + c3c2_p2s1j4_13*P2C3S1J4_13 + c4c2_p2s1j4_13*P2C4S1J4_13 - (c2c3_p2s1j4_13+c2c4_p2s1j4_13)*P2C2S1J4_13+ j3j4_p2c2s1_13*P2C2S1J3_13 - j4j3_p2c2s1_13*P2C2S1J4_13
  deriv(P2C2S2J1_13) <- age_up*P2C2S2J1_12_lag - age_up*P2C2S2J1_13_lag  + f*P1C2S2J1_13 - r*P2C2S2J1_13+ s1s2_p2c2j1_13*P2C2S1J1_13 - s2s3_p2c2j1_13*P2C2S2J1_13 + s3s2_p2c2j1_13*P2C2S3J1_13+ c1c2_p2s2j1_13*P2C1S2J1_13 + c3c2_p2s2j1_13*P2C3S2J1_13 + c4c2_p2s2j1_13*P2C4S2J1_13 - (c2c3_p2s2j1_13+c2c4_p2s2j1_13)*P2C2S2J1_13- j1j2_p2c2s2_13*P2C2S2J1_13
  deriv(P2C2S2J2_13) <- age_up*P2C2S2J2_12_lag - age_up*P2C2S2J2_13_lag  + f*P1C2S2J2_13 - r*P2C2S2J2_13+ s1s2_p2c2j2_13*P2C2S1J2_13 - s2s3_p2c2j2_13*P2C2S2J2_13 + s3s2_p2c2j2_13*P2C2S3J2_13+ c1c2_p2s2j2_13*P2C1S2J2_13 + c3c2_p2s2j2_13*P2C3S2J2_13 + c4c2_p2s2j2_13*P2C4S2J2_13 - (c2c3_p2s2j2_13+c2c4_p2s2j2_13)*P2C2S2J2_13+ j1j2_p2c2s2_13*P2C2S2J1_13 - j2j3_p2c2s2_13*P2C2S2J2_13
  deriv(P2C2S2J3_13) <- age_up*P2C2S2J3_12_lag - age_up*P2C2S2J3_13_lag  + f*P1C2S2J3_13 - r*P2C2S2J3_13+ s1s2_p2c2j3_13*P2C2S1J3_13 - s2s3_p2c2j3_13*P2C2S2J3_13 + s3s2_p2c2j3_13*P2C2S3J3_13+ c1c2_p2s2j3_13*P2C1S2J3_13 + c3c2_p2s2j3_13*P2C3S2J3_13 + c4c2_p2s2j3_13*P2C4S2J3_13 - (c2c3_p2s2j3_13+c2c4_p2s2j3_13)*P2C2S2J3_13+ j2j3_p2c2s2_13*P2C2S2J2_13 + j4j3_p2c2s2_13*P2C2S2J4_13 - j3j4_p2c2s2_13*P2C2S2J3_13
  deriv(P2C2S2J4_13) <- age_up*P2C2S2J4_12_lag - age_up*P2C2S2J4_13_lag  + f*P1C2S2J4_13 - r*P2C2S2J4_13+ s1s2_p2c2j4_13*P2C2S1J4_13 - s2s3_p2c2j4_13*P2C2S2J4_13 + s3s2_p2c2j4_13*P2C2S3J4_13+ c1c2_p2s2j4_13*P2C1S2J4_13 + c3c2_p2s2j4_13*P2C3S2J4_13 + c4c2_p2s2j4_13*P2C4S2J4_13 - (c2c3_p2s2j4_13+c2c4_p2s2j4_13)*P2C2S2J4_13+ j3j4_p2c2s2_13*P2C2S2J3_13 - j4j3_p2c2s2_13*P2C2S2J4_13
  deriv(P2C2S3J1_13) <- age_up*P2C2S3J1_12_lag - age_up*P2C2S3J1_13_lag  + f*P1C2S3J1_13 - r*P2C2S3J1_13+ s2s3_p2c2j1_13*P2C2S2J1_13 - s3s2_p2c2j1_13*P2C2S3J1_13+ c1c2_p2s3j1_13*P2C1S3J1_13 + c3c2_p2s3j1_13*P2C3S3J1_13 + c4c2_p2s3j1_13*P2C4S3J1_13 - (c2c3_p2s3j1_13+c2c4_p2s3j1_13)*P2C2S3J1_13- j1j2_p2c2s3_13*P2C2S3J1_13
  deriv(P2C2S3J2_13) <- age_up*P2C2S3J2_12_lag - age_up*P2C2S3J2_13_lag  + f*P1C2S3J2_13 - r*P2C2S3J2_13+ s2s3_p2c2j2_13*P2C2S2J2_13 - s3s2_p2c2j2_13*P2C2S3J2_13+ c1c2_p2s3j2_13*P2C1S3J2_13 + c3c2_p2s3j2_13*P2C3S3J2_13 + c4c2_p2s3j2_13*P2C4S3J2_13 - (c2c3_p2s3j2_13+c2c4_p2s3j2_13)*P2C2S3J2_13+ j1j2_p2c2s3_13*P2C2S3J1_13 - j2j3_p2c2s3_13*P2C2S3J2_13
  deriv(P2C2S3J3_13) <- age_up*P2C2S3J3_12_lag - age_up*P2C2S3J3_13_lag  + f*P1C2S3J3_13 - r*P2C2S3J3_13+ s2s3_p2c2j3_13*P2C2S2J3_13 - s3s2_p2c2j3_13*P2C2S3J3_13+ c1c2_p2s3j3_13*P2C1S3J3_13 + c3c2_p2s3j3_13*P2C3S3J3_13 + c4c2_p2s3j3_13*P2C4S3J3_13 - (c2c3_p2s3j3_13+c2c4_p2s3j3_13)*P2C2S3J3_13+ j2j3_p2c2s3_13*P2C2S3J2_13 + j4j3_p2c2s3_13*P2C2S3J4_13 - j3j4_p2c2s3_13*P2C2S3J3_13
  deriv(P2C2S3J4_13) <- age_up*P2C2S3J4_12_lag - age_up*P2C2S3J4_13_lag  + f*P1C2S3J4_13 - r*P2C2S3J4_13+ s2s3_p2c2j4_13*P2C2S2J4_13 - s3s2_p2c2j4_13*P2C2S3J4_13+ c1c2_p2s3j4_13*P2C1S3J4_13 + c3c2_p2s3j4_13*P2C3S3J4_13 + c4c2_p2s3j4_13*P2C4S3J4_13 - (c2c3_p2s3j4_13+c2c4_p2s3j4_13)*P2C2S3J4_13+ j3j4_p2c2s3_13*P2C2S3J3_13 - j4j3_p2c2s3_13*P2C2S3J4_13
  deriv(P2C3S1J1_13) <- age_up*P2C3S1J1_12_lag - age_up*P2C3S1J1_13_lag  + f*P1C3S1J1_13 - r*P2C3S1J1_13- s1s2_p2c3j1_13*P2C3S1J1_13+ c1c3_p2s1j1_13*P2C1S1J1_13+ c2c3_p2s1j1_13*P2C2S1J1_13 + c4c3_p2s1j1_13*P2C4S1J1_13 - (c3c2_p2s1j1_13+c3c4_p2s1j1_13)*P2C3S1J1_13- j1j2_p2c3s1_13*P2C3S1J1_13
  deriv(P2C3S1J2_13) <- age_up*P2C3S1J2_12_lag - age_up*P2C3S1J2_13_lag  + f*P1C3S1J2_13 - r*P2C3S1J2_13- s1s2_p2c3j2_13*P2C3S1J2_13+ c1c3_p2s1j2_13*P2C1S1J2_13+ c2c3_p2s1j2_13*P2C2S1J2_13 + c4c3_p2s1j2_13*P2C4S1J2_13 - (c3c2_p2s1j2_13+c3c4_p2s1j2_13)*P2C3S1J2_13+ j1j2_p2c3s1_13*P2C3S1J1_13 - j2j3_p2c3s1_13*P2C3S1J2_13
  deriv(P2C3S1J3_13) <- age_up*P2C3S1J3_12_lag - age_up*P2C3S1J3_13_lag  + f*P1C3S1J3_13 - r*P2C3S1J3_13- s1s2_p2c3j3_13*P2C3S1J3_13+ c1c3_p2s1j3_13*P2C1S1J3_13+ c2c3_p2s1j3_13*P2C2S1J3_13 + c4c3_p2s1j3_13*P2C4S1J3_13 - (c3c2_p2s1j3_13+c3c4_p2s1j3_13)*P2C3S1J3_13+ j2j3_p2c3s1_13*P2C3S1J2_13 + j4j3_p2c3s1_13*P2C3S1J4_13 - j3j4_p2c3s1_13*P2C3S1J3_13
  deriv(P2C3S1J4_13) <- age_up*P2C3S1J4_12_lag - age_up*P2C3S1J4_13_lag  + f*P1C3S1J4_13 - r*P2C3S1J4_13- s1s2_p2c3j4_13*P2C3S1J4_13+ c1c3_p2s1j4_13*P2C1S1J4_13+ c2c3_p2s1j4_13*P2C2S1J4_13 + c4c3_p2s1j4_13*P2C4S1J4_13 - (c3c2_p2s1j4_13+c3c4_p2s1j4_13)*P2C3S1J4_13+ j3j4_p2c3s1_13*P2C3S1J3_13 - j4j3_p2c3s1_13*P2C3S1J4_13
  deriv(P2C3S2J1_13) <- age_up*P2C3S2J1_12_lag - age_up*P2C3S2J1_13_lag  + f*P1C3S2J1_13 - r*P2C3S2J1_13+ s1s2_p2c3j1_13*P2C3S1J1_13 - s2s3_p2c3j1_13*P2C3S2J1_13 + s3s2_p2c3j1_13*P2C3S3J1_13+ c1c3_p2s2j1_13*P2C1S2J1_13+ c2c3_p2s2j1_13*P2C2S2J1_13 + c4c3_p2s2j1_13*P2C4S2J1_13 - (c3c2_p2s2j1_13+c3c4_p2s2j1_13)*P2C3S2J1_13- j1j2_p2c3s2_13*P2C3S2J1_13
  deriv(P2C3S2J2_13) <- age_up*P2C3S2J2_12_lag - age_up*P2C3S2J2_13_lag  + f*P1C3S2J2_13 - r*P2C3S2J2_13+ s1s2_p2c3j2_13*P2C3S1J2_13 - s2s3_p2c3j2_13*P2C3S2J2_13 + s3s2_p2c3j2_13*P2C3S3J2_13+ c1c3_p2s2j2_13*P2C1S2J2_13+ c2c3_p2s2j2_13*P2C2S2J2_13 + c4c3_p2s2j2_13*P2C4S2J2_13 - (c3c2_p2s2j2_13+c3c4_p2s2j2_13)*P2C3S2J2_13+ j1j2_p2c3s2_13*P2C3S2J1_13 - j2j3_p2c3s2_13*P2C3S2J2_13
  deriv(P2C3S2J3_13) <- age_up*P2C3S2J3_12_lag - age_up*P2C3S2J3_13_lag  + f*P1C3S2J3_13 - r*P2C3S2J3_13+ s1s2_p2c3j3_13*P2C3S1J3_13 - s2s3_p2c3j3_13*P2C3S2J3_13 + s3s2_p2c3j3_13*P2C3S3J3_13+ c1c3_p2s2j3_13*P2C1S2J3_13+ c2c3_p2s2j3_13*P2C2S2J3_13 + c4c3_p2s2j3_13*P2C4S2J3_13 - (c3c2_p2s2j3_13+c3c4_p2s2j3_13)*P2C3S2J3_13+ j2j3_p2c3s2_13*P2C3S2J2_13 + j4j3_p2c3s2_13*P2C3S2J4_13 - j3j4_p2c3s2_13*P2C3S2J3_13
  deriv(P2C3S2J4_13) <- age_up*P2C3S2J4_12_lag - age_up*P2C3S2J4_13_lag  + f*P1C3S2J4_13 - r*P2C3S2J4_13+ s1s2_p2c3j4_13*P2C3S1J4_13 - s2s3_p2c3j4_13*P2C3S2J4_13 + s3s2_p2c3j4_13*P2C3S3J4_13+ c1c3_p2s2j4_13*P2C1S2J4_13+ c2c3_p2s2j4_13*P2C2S2J4_13 + c4c3_p2s2j4_13*P2C4S2J4_13 - (c3c2_p2s2j4_13+c3c4_p2s2j4_13)*P2C3S2J4_13+ j3j4_p2c3s2_13*P2C3S2J3_13 - j4j3_p2c3s2_13*P2C3S2J4_13
  deriv(P2C3S3J1_13) <- age_up*P2C3S3J1_12_lag - age_up*P2C3S3J1_13_lag  + f*P1C3S3J1_13 - r*P2C3S3J1_13+ s2s3_p2c3j1_13*P2C3S2J1_13 - s3s2_p2c3j1_13*P2C3S3J1_13+ c1c3_p2s3j1_13*P2C1S3J1_13+ c2c3_p2s3j1_13*P2C2S3J1_13 + c4c3_p2s3j1_13*P2C4S3J1_13 - (c3c2_p2s3j1_13+c3c4_p2s3j1_13)*P2C3S3J1_13- j1j2_p2c3s3_13*P2C3S3J1_13
  deriv(P2C3S3J2_13) <- age_up*P2C3S3J2_12_lag - age_up*P2C3S3J2_13_lag  + f*P1C3S3J2_13 - r*P2C3S3J2_13+ s2s3_p2c3j2_13*P2C3S2J2_13 - s3s2_p2c3j2_13*P2C3S3J2_13+ c1c3_p2s3j2_13*P2C1S3J2_13+ c2c3_p2s3j2_13*P2C2S3J2_13 + c4c3_p2s3j2_13*P2C4S3J2_13 - (c3c2_p2s3j2_13+c3c4_p2s3j2_13)*P2C3S3J2_13+ j1j2_p2c3s3_13*P2C3S3J1_13 - j2j3_p2c3s3_13*P2C3S3J2_13
  deriv(P2C3S3J3_13) <- age_up*P2C3S3J3_12_lag - age_up*P2C3S3J3_13_lag  + f*P1C3S3J3_13 - r*P2C3S3J3_13+ s2s3_p2c3j3_13*P2C3S2J3_13 - s3s2_p2c3j3_13*P2C3S3J3_13+ c1c3_p2s3j3_13*P2C1S3J3_13+ c2c3_p2s3j3_13*P2C2S3J3_13 + c4c3_p2s3j3_13*P2C4S3J3_13 - (c3c2_p2s3j3_13+c3c4_p2s3j3_13)*P2C3S3J3_13+ j2j3_p2c3s3_13*P2C3S3J2_13 + j4j3_p2c3s3_13*P2C3S3J4_13 - j3j4_p2c3s3_13*P2C3S3J3_13
  deriv(P2C3S3J4_13) <- age_up*P2C3S3J4_12_lag - age_up*P2C3S3J4_13_lag  + f*P1C3S3J4_13 - r*P2C3S3J4_13+ s2s3_p2c3j4_13*P2C3S2J4_13 - s3s2_p2c3j4_13*P2C3S3J4_13+ c1c3_p2s3j4_13*P2C1S3J4_13+ c2c3_p2s3j4_13*P2C2S3J4_13 + c4c3_p2s3j4_13*P2C4S3J4_13 - (c3c2_p2s3j4_13+c3c4_p2s3j4_13)*P2C3S3J4_13+ j3j4_p2c3s3_13*P2C3S3J3_13 - j4j3_p2c3s3_13*P2C3S3J4_13
  deriv(P2C4S1J1_13) <- age_up*P2C4S1J1_12_lag - age_up*P2C4S1J1_13_lag  + f*P1C4S1J1_13 - r*P2C4S1J1_13- s1s2_p2c4j1_13*P2C4S1J1_13+ c2c4_p2s1j1_13*P2C2S1J1_13 + c3c4_p2s1j1_13*P2C3S1J1_13- (c4c2_p2s1j1_13+c4c3_p2s1j1_13)*P2C4S1J1_13- j1j2_p2c4s1_13*P2C4S1J1_13
  deriv(P2C4S1J2_13) <- age_up*P2C4S1J2_12_lag - age_up*P2C4S1J2_13_lag  + f*P1C4S1J2_13 - r*P2C4S1J2_13- s1s2_p2c4j2_13*P2C4S1J2_13+ c2c4_p2s1j2_13*P2C2S1J2_13 + c3c4_p2s1j2_13*P2C3S1J2_13- (c4c2_p2s1j2_13+c4c3_p2s1j2_13)*P2C4S1J2_13+ j1j2_p2c4s1_13*P2C4S1J1_13 - j2j3_p2c4s1_13*P2C4S1J2_13
  deriv(P2C4S1J3_13) <- age_up*P2C4S1J3_12_lag - age_up*P2C4S1J3_13_lag  + f*P1C4S1J3_13 - r*P2C4S1J3_13- s1s2_p2c4j3_13*P2C4S1J3_13+ c2c4_p2s1j3_13*P2C2S1J3_13 + c3c4_p2s1j3_13*P2C3S1J3_13- (c4c2_p2s1j3_13+c4c3_p2s1j3_13)*P2C4S1J3_13+ j2j3_p2c4s1_13*P2C4S1J2_13 + j4j3_p2c4s1_13*P2C4S1J4_13 - j3j4_p2c4s1_13*P2C4S1J3_13
  deriv(P2C4S1J4_13) <- age_up*P2C4S1J4_12_lag - age_up*P2C4S1J4_13_lag  + f*P1C4S1J4_13 - r*P2C4S1J4_13- s1s2_p2c4j4_13*P2C4S1J4_13+ c2c4_p2s1j4_13*P2C2S1J4_13 + c3c4_p2s1j4_13*P2C3S1J4_13- (c4c2_p2s1j4_13+c4c3_p2s1j4_13)*P2C4S1J4_13+ j3j4_p2c4s1_13*P2C4S1J3_13 - j4j3_p2c4s1_13*P2C4S1J4_13
  deriv(P2C4S2J1_13) <- age_up*P2C4S2J1_12_lag - age_up*P2C4S2J1_13_lag  + f*P1C4S2J1_13 - r*P2C4S2J1_13+ s1s2_p2c4j1_13*P2C4S1J1_13 - s2s3_p2c4j1_13*P2C4S2J1_13 + s3s2_p2c4j1_13*P2C4S3J1_13+ c2c4_p2s2j1_13*P2C2S2J1_13 + c3c4_p2s2j1_13*P2C3S2J1_13- (c4c2_p2s2j1_13+c4c3_p2s2j1_13)*P2C4S2J1_13- j1j2_p2c4s2_13*P2C4S2J1_13
  deriv(P2C4S2J2_13) <- age_up*P2C4S2J2_12_lag - age_up*P2C4S2J2_13_lag  + f*P1C4S2J2_13 - r*P2C4S2J2_13+ s1s2_p2c4j2_13*P2C4S1J2_13 - s2s3_p2c4j2_13*P2C4S2J2_13 + s3s2_p2c4j2_13*P2C4S3J2_13+ c2c4_p2s2j2_13*P2C2S2J2_13 + c3c4_p2s2j2_13*P2C3S2J2_13- (c4c2_p2s2j2_13+c4c3_p2s2j2_13)*P2C4S2J2_13+ j1j2_p2c4s2_13*P2C4S2J1_13 - j2j3_p2c4s2_13*P2C4S2J2_13
  deriv(P2C4S2J3_13) <- age_up*P2C4S2J3_12_lag - age_up*P2C4S2J3_13_lag  + f*P1C4S2J3_13 - r*P2C4S2J3_13+ s1s2_p2c4j3_13*P2C4S1J3_13 - s2s3_p2c4j3_13*P2C4S2J3_13 + s3s2_p2c4j3_13*P2C4S3J3_13+ c2c4_p2s2j3_13*P2C2S2J3_13 + c3c4_p2s2j3_13*P2C3S2J3_13- (c4c2_p2s2j3_13+c4c3_p2s2j3_13)*P2C4S2J3_13+ j2j3_p2c4s2_13*P2C4S2J2_13 + j4j3_p2c4s2_13*P2C4S2J4_13 - j3j4_p2c4s2_13*P2C4S2J3_13
  deriv(P2C4S2J4_13) <- age_up*P2C4S2J4_12_lag - age_up*P2C4S2J4_13_lag  + f*P1C4S2J4_13 - r*P2C4S2J4_13+ s1s2_p2c4j4_13*P2C4S1J4_13 - s2s3_p2c4j4_13*P2C4S2J4_13 + s3s2_p2c4j4_13*P2C4S3J4_13+ c2c4_p2s2j4_13*P2C2S2J4_13 + c3c4_p2s2j4_13*P2C3S2J4_13- (c4c2_p2s2j4_13+c4c3_p2s2j4_13)*P2C4S2J4_13+ j3j4_p2c4s2_13*P2C4S2J3_13 - j4j3_p2c4s2_13*P2C4S2J4_13
  deriv(P2C4S3J1_13) <- age_up*P2C4S3J1_12_lag - age_up*P2C4S3J1_13_lag  + f*P1C4S3J1_13 - r*P2C4S3J1_13+ s2s3_p2c4j1_13*P2C4S2J1_13 - s3s2_p2c4j1_13*P2C4S3J1_13+ c2c4_p2s3j1_13*P2C2S3J1_13 + c3c4_p2s3j1_13*P2C3S3J1_13- (c4c2_p2s3j1_13+c4c3_p2s3j1_13)*P2C4S3J1_13- j1j2_p2c4s3_13*P2C4S3J1_13
  deriv(P2C4S3J2_13) <- age_up*P2C4S3J2_12_lag - age_up*P2C4S3J2_13_lag  + f*P1C4S3J2_13 - r*P2C4S3J2_13+ s2s3_p2c4j2_13*P2C4S2J2_13 - s3s2_p2c4j2_13*P2C4S3J2_13+ c2c4_p2s3j2_13*P2C2S3J2_13 + c3c4_p2s3j2_13*P2C3S3J2_13- (c4c2_p2s3j2_13+c4c3_p2s3j2_13)*P2C4S3J2_13+ j1j2_p2c4s3_13*P2C4S3J1_13 - j2j3_p2c4s3_13*P2C4S3J2_13
  deriv(P2C4S3J3_13) <- age_up*P2C4S3J3_12_lag - age_up*P2C4S3J3_13_lag  + f*P1C4S3J3_13 - r*P2C4S3J3_13+ s2s3_p2c4j3_13*P2C4S2J3_13 - s3s2_p2c4j3_13*P2C4S3J3_13+ c2c4_p2s3j3_13*P2C2S3J3_13 + c3c4_p2s3j3_13*P2C3S3J3_13- (c4c2_p2s3j3_13+c4c3_p2s3j3_13)*P2C4S3J3_13+ j2j3_p2c4s3_13*P2C4S3J2_13 + j4j3_p2c4s3_13*P2C4S3J4_13 - j3j4_p2c4s3_13*P2C4S3J3_13
  deriv(P2C4S3J4_13) <- age_up*P2C4S3J4_12_lag - age_up*P2C4S3J4_13_lag  + f*P1C4S3J4_13 - r*P2C4S3J4_13+ s2s3_p2c4j4_13*P2C4S2J4_13 - s3s2_p2c4j4_13*P2C4S3J4_13+ c2c4_p2s3j4_13*P2C2S3J4_13 + c3c4_p2s3j4_13*P2C3S3J4_13- (c4c2_p2s3j4_13+c4c3_p2s3j4_13)*P2C4S3J4_13+ j3j4_p2c4s3_13*P2C4S3J3_13 - j4j3_p2c4s3_13*P2C4S3J4_13
  deriv(P1C1S1J1_14) <- age_up*P1C1S1J1_13_lag - age_up*P1C1S1J1_14_lag + r*P2C1S1J1_14 - f*P1C1S1J1_14- s1s2_p1c1j1_14*P1C1S1J1_14- (c1c2_p1s1j1_14+c1c3_p1s1j1_14)*P1C1S1J1_14- j1j2_p1c1s1_14*P1C1S1J1_14
  deriv(P1C1S1J2_14) <- age_up*P1C1S1J2_13_lag - age_up*P1C1S1J2_14_lag + r*P2C1S1J2_14 - f*P1C1S1J2_14- s1s2_p1c1j2_14*P1C1S1J2_14- (c1c2_p1s1j2_14+c1c3_p1s1j2_14)*P1C1S1J2_14+ j1j2_p1c1s1_14*P1C1S1J1_14 - j2j3_p1c1s1_14*P1C1S1J2_14
  deriv(P1C1S1J3_14) <- age_up*P1C1S1J3_13_lag - age_up*P1C1S1J3_14_lag + r*P2C1S1J3_14 - f*P1C1S1J3_14- s1s2_p1c1j3_14*P1C1S1J3_14- (c1c2_p1s1j3_14+c1c3_p1s1j3_14)*P1C1S1J3_14+ j2j3_p1c1s1_14*P1C1S1J2_14 + j4j3_p1c1s1_14*P1C1S1J4_14 - j3j4_p1c1s1_14*P1C1S1J3_14
  deriv(P1C1S1J4_14) <- age_up*P1C1S1J4_13_lag - age_up*P1C1S1J4_14_lag + r*P2C1S1J4_14 - f*P1C1S1J4_14- s1s2_p1c1j4_14*P1C1S1J4_14- (c1c2_p1s1j4_14+c1c3_p1s1j4_14)*P1C1S1J4_14+ j3j4_p1c1s1_14*P1C1S1J3_14 - j4j3_p1c1s1_14*P1C1S1J4_14
  deriv(P1C1S2J1_14) <- age_up*P1C1S2J1_13_lag - age_up*P1C1S2J1_14_lag + r*P2C1S2J1_14 - f*P1C1S2J1_14+ s1s2_p1c1j1_14*P1C1S1J1_14 - s2s3_p1c1j1_14*P1C1S2J1_14 + s3s2_p1c1j1_14*P1C1S3J1_14- (c1c2_p1s2j1_14+c1c3_p1s2j1_14)*P1C1S2J1_14- j1j2_p1c1s2_14*P1C1S2J1_14
  deriv(P1C1S2J2_14) <- age_up*P1C1S2J2_13_lag - age_up*P1C1S2J2_14_lag + r*P2C1S2J2_14 - f*P1C1S2J2_14+ s1s2_p1c1j2_14*P1C1S1J2_14 - s2s3_p1c1j2_14*P1C1S2J2_14 + s3s2_p1c1j2_14*P1C1S3J2_14- (c1c2_p1s2j2_14+c1c3_p1s2j2_14)*P1C1S2J2_14+ j1j2_p1c1s2_14*P1C1S2J1_14 - j2j3_p1c1s2_14*P1C1S2J2_14
  deriv(P1C1S2J3_14) <- age_up*P1C1S2J3_13_lag - age_up*P1C1S2J3_14_lag + r*P2C1S2J3_14 - f*P1C1S2J3_14+ s1s2_p1c1j3_14*P1C1S1J3_14 - s2s3_p1c1j3_14*P1C1S2J3_14 + s3s2_p1c1j3_14*P1C1S3J3_14- (c1c2_p1s2j3_14+c1c3_p1s2j3_14)*P1C1S2J3_14+ j2j3_p1c1s2_14*P1C1S2J2_14 + j4j3_p1c1s2_14*P1C1S2J4_14 - j3j4_p1c1s2_14*P1C1S2J3_14
  deriv(P1C1S2J4_14) <- age_up*P1C1S2J4_13_lag - age_up*P1C1S2J4_14_lag + r*P2C1S2J4_14 - f*P1C1S2J4_14+ s1s2_p1c1j4_14*P1C1S1J4_14 - s2s3_p1c1j4_14*P1C1S2J4_14 + s3s2_p1c1j4_14*P1C1S3J4_14- (c1c2_p1s2j4_14+c1c3_p1s2j4_14)*P1C1S2J4_14+ j3j4_p1c1s2_14*P1C1S2J3_14 - j4j3_p1c1s2_14*P1C1S2J4_14
  deriv(P1C1S3J1_14) <- age_up*P1C1S3J1_13_lag - age_up*P1C1S3J1_14_lag + r*P2C1S3J1_14 - f*P1C1S3J1_14+ s2s3_p1c1j1_14*P1C1S2J1_14 - s3s2_p1c1j1_14*P1C1S3J1_14- (c1c2_p1s3j1_14+c1c3_p1s3j1_14)*P1C1S3J1_14- j1j2_p1c1s3_14*P1C1S3J1_14
  deriv(P1C1S3J2_14) <- age_up*P1C1S3J2_13_lag - age_up*P1C1S3J2_14_lag + r*P2C1S3J2_14 - f*P1C1S3J2_14+ s2s3_p1c1j2_14*P1C1S2J2_14 - s3s2_p1c1j2_14*P1C1S3J2_14- (c1c2_p1s3j2_14+c1c3_p1s3j2_14)*P1C1S3J2_14+ j1j2_p1c1s3_14*P1C1S3J1_14 - j2j3_p1c1s3_14*P1C1S3J2_14
  deriv(P1C1S3J3_14) <- age_up*P1C1S3J3_13_lag - age_up*P1C1S3J3_14_lag + r*P2C1S3J3_14 - f*P1C1S3J3_14+ s2s3_p1c1j3_14*P1C1S2J3_14 - s3s2_p1c1j3_14*P1C1S3J3_14- (c1c2_p1s3j3_14+c1c3_p1s3j3_14)*P1C1S3J3_14+ j2j3_p1c1s3_14*P1C1S3J2_14 + j4j3_p1c1s3_14*P1C1S3J4_14 - j3j4_p1c1s3_14*P1C1S3J3_14
  deriv(P1C1S3J4_14) <- age_up*P1C1S3J4_13_lag - age_up*P1C1S3J4_14_lag + r*P2C1S3J4_14 - f*P1C1S3J4_14+ s2s3_p1c1j4_14*P1C1S2J4_14 - s3s2_p1c1j4_14*P1C1S3J4_14- (c1c2_p1s3j4_14+c1c3_p1s3j4_14)*P1C1S3J4_14+ j3j4_p1c1s3_14*P1C1S3J3_14 - j4j3_p1c1s3_14*P1C1S3J4_14
  deriv(P1C2S1J1_14) <- age_up*P1C2S1J1_13_lag - age_up*P1C2S1J1_14_lag + r*P2C2S1J1_14 - f*P1C2S1J1_14- s1s2_p1c2j1_14*P1C2S1J1_14+ c1c2_p1s1j1_14*P1C1S1J1_14 + c3c2_p1s1j1_14*P1C3S1J1_14 + c4c2_p1s1j1_14*P1C4S1J1_14 - (c2c3_p1s1j1_14+c2c4_p1s1j1_14)*P1C2S1J1_14- j1j2_p1c2s1_14*P1C2S1J1_14
  deriv(P1C2S1J2_14) <- age_up*P1C2S1J2_13_lag - age_up*P1C2S1J2_14_lag + r*P2C2S1J2_14 - f*P1C2S1J2_14- s1s2_p1c2j2_14*P1C2S1J2_14+ c1c2_p1s1j2_14*P1C1S1J2_14 + c3c2_p1s1j2_14*P1C3S1J2_14 + c4c2_p1s1j2_14*P1C4S1J2_14 - (c2c3_p1s1j2_14+c2c4_p1s1j2_14)*P1C2S1J2_14+ j1j2_p1c2s1_14*P1C2S1J1_14 - j2j3_p1c2s1_14*P1C2S1J2_14
  deriv(P1C2S1J3_14) <- age_up*P1C2S1J3_13_lag - age_up*P1C2S1J3_14_lag + r*P2C2S1J3_14 - f*P1C2S1J3_14- s1s2_p1c2j3_14*P1C2S1J3_14+ c1c2_p1s1j3_14*P1C1S1J3_14 + c3c2_p1s1j3_14*P1C3S1J3_14 + c4c2_p1s1j3_14*P1C4S1J3_14 - (c2c3_p1s1j3_14+c2c4_p1s1j3_14)*P1C2S1J3_14+ j2j3_p1c2s1_14*P1C2S1J2_14 + j4j3_p1c2s1_14*P1C2S1J4_14 - j3j4_p1c2s1_14*P1C2S1J3_14
  deriv(P1C2S1J4_14) <- age_up*P1C2S1J4_13_lag - age_up*P1C2S1J4_14_lag + r*P2C2S1J4_14 - f*P1C2S1J4_14- s1s2_p1c2j4_14*P1C2S1J4_14+ c1c2_p1s1j4_14*P1C1S1J4_14 + c3c2_p1s1j4_14*P1C3S1J4_14 + c4c2_p1s1j4_14*P1C4S1J4_14 - (c2c3_p1s1j4_14+c2c4_p1s1j4_14)*P1C2S1J4_14+ j3j4_p1c2s1_14*P1C2S1J3_14 - j4j3_p1c2s1_14*P1C2S1J4_14
  deriv(P1C2S2J1_14) <- age_up*P1C2S2J1_13_lag - age_up*P1C2S2J1_14_lag + r*P2C2S2J1_14 - f*P1C2S2J1_14+ s1s2_p1c2j1_14*P1C2S1J1_14 - s2s3_p1c2j1_14*P1C2S2J1_14 + s3s2_p1c2j1_14*P1C2S3J1_14+ c1c2_p1s2j1_14*P1C1S2J1_14 + c3c2_p1s2j1_14*P1C3S2J1_14 + c4c2_p1s2j1_14*P1C4S2J1_14 - (c2c3_p1s2j1_14+c2c4_p1s2j1_14)*P1C2S2J1_14- j1j2_p1c2s2_14*P1C2S2J1_14
  deriv(P1C2S2J2_14) <- age_up*P1C2S2J2_13_lag - age_up*P1C2S2J2_14_lag + r*P2C2S2J2_14 - f*P1C2S2J2_14+ s1s2_p1c2j2_14*P1C2S1J2_14 - s2s3_p1c2j2_14*P1C2S2J2_14 + s3s2_p1c2j2_14*P1C2S3J2_14+ c1c2_p1s2j2_14*P1C1S2J2_14 + c3c2_p1s2j2_14*P1C3S2J2_14 + c4c2_p1s2j2_14*P1C4S2J2_14 - (c2c3_p1s2j2_14+c2c4_p1s2j2_14)*P1C2S2J2_14+ j1j2_p1c2s2_14*P1C2S2J1_14 - j2j3_p1c2s2_14*P1C2S2J2_14
  deriv(P1C2S2J3_14) <- age_up*P1C2S2J3_13_lag - age_up*P1C2S2J3_14_lag + r*P2C2S2J3_14 - f*P1C2S2J3_14+ s1s2_p1c2j3_14*P1C2S1J3_14 - s2s3_p1c2j3_14*P1C2S2J3_14 + s3s2_p1c2j3_14*P1C2S3J3_14+ c1c2_p1s2j3_14*P1C1S2J3_14 + c3c2_p1s2j3_14*P1C3S2J3_14 + c4c2_p1s2j3_14*P1C4S2J3_14 - (c2c3_p1s2j3_14+c2c4_p1s2j3_14)*P1C2S2J3_14+ j2j3_p1c2s2_14*P1C2S2J2_14 + j4j3_p1c2s2_14*P1C2S2J4_14 - j3j4_p1c2s2_14*P1C2S2J3_14
  deriv(P1C2S2J4_14) <- age_up*P1C2S2J4_13_lag - age_up*P1C2S2J4_14_lag + r*P2C2S2J4_14 - f*P1C2S2J4_14+ s1s2_p1c2j4_14*P1C2S1J4_14 - s2s3_p1c2j4_14*P1C2S2J4_14 + s3s2_p1c2j4_14*P1C2S3J4_14+ c1c2_p1s2j4_14*P1C1S2J4_14 + c3c2_p1s2j4_14*P1C3S2J4_14 + c4c2_p1s2j4_14*P1C4S2J4_14 - (c2c3_p1s2j4_14+c2c4_p1s2j4_14)*P1C2S2J4_14+ j3j4_p1c2s2_14*P1C2S2J3_14 - j4j3_p1c2s2_14*P1C2S2J4_14
  deriv(P1C2S3J1_14) <- age_up*P1C2S3J1_13_lag - age_up*P1C2S3J1_14_lag + r*P2C2S3J1_14 - f*P1C2S3J1_14+ s2s3_p1c2j1_14*P1C2S2J1_14 - s3s2_p1c2j1_14*P1C2S3J1_14+ c1c2_p1s3j1_14*P1C1S3J1_14 + c3c2_p1s3j1_14*P1C3S3J1_14 + c4c2_p1s3j1_14*P1C4S3J1_14 - (c2c3_p1s3j1_14+c2c4_p1s3j1_14)*P1C2S3J1_14- j1j2_p1c2s3_14*P1C2S3J1_14
  deriv(P1C2S3J2_14) <- age_up*P1C2S3J2_13_lag - age_up*P1C2S3J2_14_lag + r*P2C2S3J2_14 - f*P1C2S3J2_14+ s2s3_p1c2j2_14*P1C2S2J2_14 - s3s2_p1c2j2_14*P1C2S3J2_14+ c1c2_p1s3j2_14*P1C1S3J2_14 + c3c2_p1s3j2_14*P1C3S3J2_14 + c4c2_p1s3j2_14*P1C4S3J2_14 - (c2c3_p1s3j2_14+c2c4_p1s3j2_14)*P1C2S3J2_14+ j1j2_p1c2s3_14*P1C2S3J1_14 - j2j3_p1c2s3_14*P1C2S3J2_14
  deriv(P1C2S3J3_14) <- age_up*P1C2S3J3_13_lag - age_up*P1C2S3J3_14_lag + r*P2C2S3J3_14 - f*P1C2S3J3_14+ s2s3_p1c2j3_14*P1C2S2J3_14 - s3s2_p1c2j3_14*P1C2S3J3_14+ c1c2_p1s3j3_14*P1C1S3J3_14 + c3c2_p1s3j3_14*P1C3S3J3_14 + c4c2_p1s3j3_14*P1C4S3J3_14 - (c2c3_p1s3j3_14+c2c4_p1s3j3_14)*P1C2S3J3_14+ j2j3_p1c2s3_14*P1C2S3J2_14 + j4j3_p1c2s3_14*P1C2S3J4_14 - j3j4_p1c2s3_14*P1C2S3J3_14
  deriv(P1C2S3J4_14) <- age_up*P1C2S3J4_13_lag - age_up*P1C2S3J4_14_lag + r*P2C2S3J4_14 - f*P1C2S3J4_14+ s2s3_p1c2j4_14*P1C2S2J4_14 - s3s2_p1c2j4_14*P1C2S3J4_14+ c1c2_p1s3j4_14*P1C1S3J4_14 + c3c2_p1s3j4_14*P1C3S3J4_14 + c4c2_p1s3j4_14*P1C4S3J4_14 - (c2c3_p1s3j4_14+c2c4_p1s3j4_14)*P1C2S3J4_14+ j3j4_p1c2s3_14*P1C2S3J3_14 - j4j3_p1c2s3_14*P1C2S3J4_14
  deriv(P1C3S1J1_14) <- age_up*P1C3S1J1_13_lag - age_up*P1C3S1J1_14_lag + r*P2C3S1J1_14 - f*P1C3S1J1_14- s1s2_p1c3j1_14*P1C3S1J1_14+ c1c3_p1s1j1_14*P1C1S1J1_14+ c2c3_p1s1j1_14*P1C2S1J1_14 + c4c3_p1s1j1_14*P1C4S1J1_14 - (c3c2_p1s1j1_14+c3c4_p1s1j1_14)*P1C3S1J1_14- j1j2_p1c3s1_14*P1C3S1J1_14
  deriv(P1C3S1J2_14) <- age_up*P1C3S1J2_13_lag - age_up*P1C3S1J2_14_lag + r*P2C3S1J2_14 - f*P1C3S1J2_14- s1s2_p1c3j2_14*P1C3S1J2_14+ c1c3_p1s1j2_14*P1C1S1J2_14+ c2c3_p1s1j2_14*P1C2S1J2_14 + c4c3_p1s1j2_14*P1C4S1J2_14 - (c3c2_p1s1j2_14+c3c4_p1s1j2_14)*P1C3S1J2_14+ j1j2_p1c3s1_14*P1C3S1J1_14 - j2j3_p1c3s1_14*P1C3S1J2_14
  deriv(P1C3S1J3_14) <- age_up*P1C3S1J3_13_lag - age_up*P1C3S1J3_14_lag + r*P2C3S1J3_14 - f*P1C3S1J3_14- s1s2_p1c3j3_14*P1C3S1J3_14+ c1c3_p1s1j3_14*P1C1S1J3_14+ c2c3_p1s1j3_14*P1C2S1J3_14 + c4c3_p1s1j3_14*P1C4S1J3_14 - (c3c2_p1s1j3_14+c3c4_p1s1j3_14)*P1C3S1J3_14+ j2j3_p1c3s1_14*P1C3S1J2_14 + j4j3_p1c3s1_14*P1C3S1J4_14 - j3j4_p1c3s1_14*P1C3S1J3_14
  deriv(P1C3S1J4_14) <- age_up*P1C3S1J4_13_lag - age_up*P1C3S1J4_14_lag + r*P2C3S1J4_14 - f*P1C3S1J4_14- s1s2_p1c3j4_14*P1C3S1J4_14+ c1c3_p1s1j4_14*P1C1S1J4_14+ c2c3_p1s1j4_14*P1C2S1J4_14 + c4c3_p1s1j4_14*P1C4S1J4_14 - (c3c2_p1s1j4_14+c3c4_p1s1j4_14)*P1C3S1J4_14+ j3j4_p1c3s1_14*P1C3S1J3_14 - j4j3_p1c3s1_14*P1C3S1J4_14
  deriv(P1C3S2J1_14) <- age_up*P1C3S2J1_13_lag - age_up*P1C3S2J1_14_lag + r*P2C3S2J1_14 - f*P1C3S2J1_14+ s1s2_p1c3j1_14*P1C3S1J1_14 - s2s3_p1c3j1_14*P1C3S2J1_14 + s3s2_p1c3j1_14*P1C3S3J1_14+ c1c3_p1s2j1_14*P1C1S2J1_14+ c2c3_p1s2j1_14*P1C2S2J1_14 + c4c3_p1s2j1_14*P1C4S2J1_14 - (c3c2_p1s2j1_14+c3c4_p1s2j1_14)*P1C3S2J1_14- j1j2_p1c3s2_14*P1C3S2J1_14
  deriv(P1C3S2J2_14) <- age_up*P1C3S2J2_13_lag - age_up*P1C3S2J2_14_lag + r*P2C3S2J2_14 - f*P1C3S2J2_14+ s1s2_p1c3j2_14*P1C3S1J2_14 - s2s3_p1c3j2_14*P1C3S2J2_14 + s3s2_p1c3j2_14*P1C3S3J2_14+ c1c3_p1s2j2_14*P1C1S2J2_14+ c2c3_p1s2j2_14*P1C2S2J2_14 + c4c3_p1s2j2_14*P1C4S2J2_14 - (c3c2_p1s2j2_14+c3c4_p1s2j2_14)*P1C3S2J2_14+ j1j2_p1c3s2_14*P1C3S2J1_14 - j2j3_p1c3s2_14*P1C3S2J2_14
  deriv(P1C3S2J3_14) <- age_up*P1C3S2J3_13_lag - age_up*P1C3S2J3_14_lag + r*P2C3S2J3_14 - f*P1C3S2J3_14+ s1s2_p1c3j3_14*P1C3S1J3_14 - s2s3_p1c3j3_14*P1C3S2J3_14 + s3s2_p1c3j3_14*P1C3S3J3_14+ c1c3_p1s2j3_14*P1C1S2J3_14+ c2c3_p1s2j3_14*P1C2S2J3_14 + c4c3_p1s2j3_14*P1C4S2J3_14 - (c3c2_p1s2j3_14+c3c4_p1s2j3_14)*P1C3S2J3_14+ j2j3_p1c3s2_14*P1C3S2J2_14 + j4j3_p1c3s2_14*P1C3S2J4_14 - j3j4_p1c3s2_14*P1C3S2J3_14
  deriv(P1C3S2J4_14) <- age_up*P1C3S2J4_13_lag - age_up*P1C3S2J4_14_lag + r*P2C3S2J4_14 - f*P1C3S2J4_14+ s1s2_p1c3j4_14*P1C3S1J4_14 - s2s3_p1c3j4_14*P1C3S2J4_14 + s3s2_p1c3j4_14*P1C3S3J4_14+ c1c3_p1s2j4_14*P1C1S2J4_14+ c2c3_p1s2j4_14*P1C2S2J4_14 + c4c3_p1s2j4_14*P1C4S2J4_14 - (c3c2_p1s2j4_14+c3c4_p1s2j4_14)*P1C3S2J4_14+ j3j4_p1c3s2_14*P1C3S2J3_14 - j4j3_p1c3s2_14*P1C3S2J4_14
  deriv(P1C3S3J1_14) <- age_up*P1C3S3J1_13_lag - age_up*P1C3S3J1_14_lag + r*P2C3S3J1_14 - f*P1C3S3J1_14+ s2s3_p1c3j1_14*P1C3S2J1_14 - s3s2_p1c3j1_14*P1C3S3J1_14+ c1c3_p1s3j1_14*P1C1S3J1_14+ c2c3_p1s3j1_14*P1C2S3J1_14 + c4c3_p1s3j1_14*P1C4S3J1_14 - (c3c2_p1s3j1_14+c3c4_p1s3j1_14)*P1C3S3J1_14- j1j2_p1c3s3_14*P1C3S3J1_14
  deriv(P1C3S3J2_14) <- age_up*P1C3S3J2_13_lag - age_up*P1C3S3J2_14_lag + r*P2C3S3J2_14 - f*P1C3S3J2_14+ s2s3_p1c3j2_14*P1C3S2J2_14 - s3s2_p1c3j2_14*P1C3S3J2_14+ c1c3_p1s3j2_14*P1C1S3J2_14+ c2c3_p1s3j2_14*P1C2S3J2_14 + c4c3_p1s3j2_14*P1C4S3J2_14 - (c3c2_p1s3j2_14+c3c4_p1s3j2_14)*P1C3S3J2_14+ j1j2_p1c3s3_14*P1C3S3J1_14 - j2j3_p1c3s3_14*P1C3S3J2_14
  deriv(P1C3S3J3_14) <- age_up*P1C3S3J3_13_lag - age_up*P1C3S3J3_14_lag + r*P2C3S3J3_14 - f*P1C3S3J3_14+ s2s3_p1c3j3_14*P1C3S2J3_14 - s3s2_p1c3j3_14*P1C3S3J3_14+ c1c3_p1s3j3_14*P1C1S3J3_14+ c2c3_p1s3j3_14*P1C2S3J3_14 + c4c3_p1s3j3_14*P1C4S3J3_14 - (c3c2_p1s3j3_14+c3c4_p1s3j3_14)*P1C3S3J3_14+ j2j3_p1c3s3_14*P1C3S3J2_14 + j4j3_p1c3s3_14*P1C3S3J4_14 - j3j4_p1c3s3_14*P1C3S3J3_14
  deriv(P1C3S3J4_14) <- age_up*P1C3S3J4_13_lag - age_up*P1C3S3J4_14_lag + r*P2C3S3J4_14 - f*P1C3S3J4_14+ s2s3_p1c3j4_14*P1C3S2J4_14 - s3s2_p1c3j4_14*P1C3S3J4_14+ c1c3_p1s3j4_14*P1C1S3J4_14+ c2c3_p1s3j4_14*P1C2S3J4_14 + c4c3_p1s3j4_14*P1C4S3J4_14 - (c3c2_p1s3j4_14+c3c4_p1s3j4_14)*P1C3S3J4_14+ j3j4_p1c3s3_14*P1C3S3J3_14 - j4j3_p1c3s3_14*P1C3S3J4_14
  deriv(P1C4S1J1_14) <- age_up*P1C4S1J1_13_lag - age_up*P1C4S1J1_14_lag + r*P2C4S1J1_14 - f*P1C4S1J1_14- s1s2_p1c4j1_14*P1C4S1J1_14+ c2c4_p1s1j1_14*P1C2S1J1_14 + c3c4_p1s1j1_14*P1C3S1J1_14- (c4c2_p1s1j1_14+c4c3_p1s1j1_14)*P1C4S1J1_14- j1j2_p1c4s1_14*P1C4S1J1_14
  deriv(P1C4S1J2_14) <- age_up*P1C4S1J2_13_lag - age_up*P1C4S1J2_14_lag + r*P2C4S1J2_14 - f*P1C4S1J2_14- s1s2_p1c4j2_14*P1C4S1J2_14+ c2c4_p1s1j2_14*P1C2S1J2_14 + c3c4_p1s1j2_14*P1C3S1J2_14- (c4c2_p1s1j2_14+c4c3_p1s1j2_14)*P1C4S1J2_14+ j1j2_p1c4s1_14*P1C4S1J1_14 - j2j3_p1c4s1_14*P1C4S1J2_14
  deriv(P1C4S1J3_14) <- age_up*P1C4S1J3_13_lag - age_up*P1C4S1J3_14_lag + r*P2C4S1J3_14 - f*P1C4S1J3_14- s1s2_p1c4j3_14*P1C4S1J3_14+ c2c4_p1s1j3_14*P1C2S1J3_14 + c3c4_p1s1j3_14*P1C3S1J3_14- (c4c2_p1s1j3_14+c4c3_p1s1j3_14)*P1C4S1J3_14+ j2j3_p1c4s1_14*P1C4S1J2_14 + j4j3_p1c4s1_14*P1C4S1J4_14 - j3j4_p1c4s1_14*P1C4S1J3_14
  deriv(P1C4S1J4_14) <- age_up*P1C4S1J4_13_lag - age_up*P1C4S1J4_14_lag + r*P2C4S1J4_14 - f*P1C4S1J4_14- s1s2_p1c4j4_14*P1C4S1J4_14+ c2c4_p1s1j4_14*P1C2S1J4_14 + c3c4_p1s1j4_14*P1C3S1J4_14- (c4c2_p1s1j4_14+c4c3_p1s1j4_14)*P1C4S1J4_14+ j3j4_p1c4s1_14*P1C4S1J3_14 - j4j3_p1c4s1_14*P1C4S1J4_14
  deriv(P1C4S2J1_14) <- age_up*P1C4S2J1_13_lag - age_up*P1C4S2J1_14_lag + r*P2C4S2J1_14 - f*P1C4S2J1_14+ s1s2_p1c4j1_14*P1C4S1J1_14 - s2s3_p1c4j1_14*P1C4S2J1_14 + s3s2_p1c4j1_14*P1C4S3J1_14+ c2c4_p1s2j1_14*P1C2S2J1_14 + c3c4_p1s2j1_14*P1C3S2J1_14- (c4c2_p1s2j1_14+c4c3_p1s2j1_14)*P1C4S2J1_14- j1j2_p1c4s2_14*P1C4S2J1_14
  deriv(P1C4S2J2_14) <- age_up*P1C4S2J2_13_lag - age_up*P1C4S2J2_14_lag + r*P2C4S2J2_14 - f*P1C4S2J2_14+ s1s2_p1c4j2_14*P1C4S1J2_14 - s2s3_p1c4j2_14*P1C4S2J2_14 + s3s2_p1c4j2_14*P1C4S3J2_14+ c2c4_p1s2j2_14*P1C2S2J2_14 + c3c4_p1s2j2_14*P1C3S2J2_14- (c4c2_p1s2j2_14+c4c3_p1s2j2_14)*P1C4S2J2_14+ j1j2_p1c4s2_14*P1C4S2J1_14 - j2j3_p1c4s2_14*P1C4S2J2_14
  deriv(P1C4S2J3_14) <- age_up*P1C4S2J3_13_lag - age_up*P1C4S2J3_14_lag + r*P2C4S2J3_14 - f*P1C4S2J3_14+ s1s2_p1c4j3_14*P1C4S1J3_14 - s2s3_p1c4j3_14*P1C4S2J3_14 + s3s2_p1c4j3_14*P1C4S3J3_14+ c2c4_p1s2j3_14*P1C2S2J3_14 + c3c4_p1s2j3_14*P1C3S2J3_14- (c4c2_p1s2j3_14+c4c3_p1s2j3_14)*P1C4S2J3_14+ j2j3_p1c4s2_14*P1C4S2J2_14 + j4j3_p1c4s2_14*P1C4S2J4_14 - j3j4_p1c4s2_14*P1C4S2J3_14
  deriv(P1C4S2J4_14) <- age_up*P1C4S2J4_13_lag - age_up*P1C4S2J4_14_lag + r*P2C4S2J4_14 - f*P1C4S2J4_14+ s1s2_p1c4j4_14*P1C4S1J4_14 - s2s3_p1c4j4_14*P1C4S2J4_14 + s3s2_p1c4j4_14*P1C4S3J4_14+ c2c4_p1s2j4_14*P1C2S2J4_14 + c3c4_p1s2j4_14*P1C3S2J4_14- (c4c2_p1s2j4_14+c4c3_p1s2j4_14)*P1C4S2J4_14+ j3j4_p1c4s2_14*P1C4S2J3_14 - j4j3_p1c4s2_14*P1C4S2J4_14
  deriv(P1C4S3J1_14) <- age_up*P1C4S3J1_13_lag - age_up*P1C4S3J1_14_lag + r*P2C4S3J1_14 - f*P1C4S3J1_14+ s2s3_p1c4j1_14*P1C4S2J1_14 - s3s2_p1c4j1_14*P1C4S3J1_14+ c2c4_p1s3j1_14*P1C2S3J1_14 + c3c4_p1s3j1_14*P1C3S3J1_14- (c4c2_p1s3j1_14+c4c3_p1s3j1_14)*P1C4S3J1_14- j1j2_p1c4s3_14*P1C4S3J1_14
  deriv(P1C4S3J2_14) <- age_up*P1C4S3J2_13_lag - age_up*P1C4S3J2_14_lag + r*P2C4S3J2_14 - f*P1C4S3J2_14+ s2s3_p1c4j2_14*P1C4S2J2_14 - s3s2_p1c4j2_14*P1C4S3J2_14+ c2c4_p1s3j2_14*P1C2S3J2_14 + c3c4_p1s3j2_14*P1C3S3J2_14- (c4c2_p1s3j2_14+c4c3_p1s3j2_14)*P1C4S3J2_14+ j1j2_p1c4s3_14*P1C4S3J1_14 - j2j3_p1c4s3_14*P1C4S3J2_14
  deriv(P1C4S3J3_14) <- age_up*P1C4S3J3_13_lag - age_up*P1C4S3J3_14_lag + r*P2C4S3J3_14 - f*P1C4S3J3_14+ s2s3_p1c4j3_14*P1C4S2J3_14 - s3s2_p1c4j3_14*P1C4S3J3_14+ c2c4_p1s3j3_14*P1C2S3J3_14 + c3c4_p1s3j3_14*P1C3S3J3_14- (c4c2_p1s3j3_14+c4c3_p1s3j3_14)*P1C4S3J3_14+ j2j3_p1c4s3_14*P1C4S3J2_14 + j4j3_p1c4s3_14*P1C4S3J4_14 - j3j4_p1c4s3_14*P1C4S3J3_14
  deriv(P1C4S3J4_14) <- age_up*P1C4S3J4_13_lag - age_up*P1C4S3J4_14_lag + r*P2C4S3J4_14 - f*P1C4S3J4_14+ s2s3_p1c4j4_14*P1C4S2J4_14 - s3s2_p1c4j4_14*P1C4S3J4_14+ c2c4_p1s3j4_14*P1C2S3J4_14 + c3c4_p1s3j4_14*P1C3S3J4_14- (c4c2_p1s3j4_14+c4c3_p1s3j4_14)*P1C4S3J4_14+ j3j4_p1c4s3_14*P1C4S3J3_14 - j4j3_p1c4s3_14*P1C4S3J4_14
  deriv(P2C1S1J1_14) <- age_up*P2C1S1J1_13_lag - age_up*P2C1S1J1_14_lag  + f*P1C1S1J1_14 - r*P2C1S1J1_14- s1s2_p2c1j1_14*P2C1S1J1_14- (c1c2_p2s1j1_14+c1c3_p2s1j1_14)*P2C1S1J1_14- j1j2_p2c1s1_14*P2C1S1J1_14
  deriv(P2C1S1J2_14) <- age_up*P2C1S1J2_13_lag - age_up*P2C1S1J2_14_lag  + f*P1C1S1J2_14 - r*P2C1S1J2_14- s1s2_p2c1j2_14*P2C1S1J2_14- (c1c2_p2s1j2_14+c1c3_p2s1j2_14)*P2C1S1J2_14+ j1j2_p2c1s1_14*P2C1S1J1_14 - j2j3_p2c1s1_14*P2C1S1J2_14
  deriv(P2C1S1J3_14) <- age_up*P2C1S1J3_13_lag - age_up*P2C1S1J3_14_lag  + f*P1C1S1J3_14 - r*P2C1S1J3_14- s1s2_p2c1j3_14*P2C1S1J3_14- (c1c2_p2s1j3_14+c1c3_p2s1j3_14)*P2C1S1J3_14+ j2j3_p2c1s1_14*P2C1S1J2_14 + j4j3_p2c1s1_14*P2C1S1J4_14 - j3j4_p2c1s1_14*P2C1S1J3_14
  deriv(P2C1S1J4_14) <- age_up*P2C1S1J4_13_lag - age_up*P2C1S1J4_14_lag  + f*P1C1S1J4_14 - r*P2C1S1J4_14- s1s2_p2c1j4_14*P2C1S1J4_14- (c1c2_p2s1j4_14+c1c3_p2s1j4_14)*P2C1S1J4_14+ j3j4_p2c1s1_14*P2C1S1J3_14 - j4j3_p2c1s1_14*P2C1S1J4_14
  deriv(P2C1S2J1_14) <- age_up*P2C1S2J1_13_lag - age_up*P2C1S2J1_14_lag  + f*P1C1S2J1_14 - r*P2C1S2J1_14+ s1s2_p2c1j1_14*P2C1S1J1_14 - s2s3_p2c1j1_14*P2C1S2J1_14 + s3s2_p2c1j1_14*P2C1S3J1_14- (c1c2_p2s2j1_14+c1c3_p2s2j1_14)*P2C1S2J1_14- j1j2_p2c1s2_14*P2C1S2J1_14
  deriv(P2C1S2J2_14) <- age_up*P2C1S2J2_13_lag - age_up*P2C1S2J2_14_lag  + f*P1C1S2J2_14 - r*P2C1S2J2_14+ s1s2_p2c1j2_14*P2C1S1J2_14 - s2s3_p2c1j2_14*P2C1S2J2_14 + s3s2_p2c1j2_14*P2C1S3J2_14- (c1c2_p2s2j2_14+c1c3_p2s2j2_14)*P2C1S2J2_14+ j1j2_p2c1s2_14*P2C1S2J1_14 - j2j3_p2c1s2_14*P2C1S2J2_14
  deriv(P2C1S2J3_14) <- age_up*P2C1S2J3_13_lag - age_up*P2C1S2J3_14_lag  + f*P1C1S2J3_14 - r*P2C1S2J3_14+ s1s2_p2c1j3_14*P2C1S1J3_14 - s2s3_p2c1j3_14*P2C1S2J3_14 + s3s2_p2c1j3_14*P2C1S3J3_14- (c1c2_p2s2j3_14+c1c3_p2s2j3_14)*P2C1S2J3_14+ j2j3_p2c1s2_14*P2C1S2J2_14 + j4j3_p2c1s2_14*P2C1S2J4_14 - j3j4_p2c1s2_14*P2C1S2J3_14
  deriv(P2C1S2J4_14) <- age_up*P2C1S2J4_13_lag - age_up*P2C1S2J4_14_lag  + f*P1C1S2J4_14 - r*P2C1S2J4_14+ s1s2_p2c1j4_14*P2C1S1J4_14 - s2s3_p2c1j4_14*P2C1S2J4_14 + s3s2_p2c1j4_14*P2C1S3J4_14- (c1c2_p2s2j4_14+c1c3_p2s2j4_14)*P2C1S2J4_14+ j3j4_p2c1s2_14*P2C1S2J3_14 - j4j3_p2c1s2_14*P2C1S2J4_14
  deriv(P2C1S3J1_14) <- age_up*P2C1S3J1_13_lag - age_up*P2C1S3J1_14_lag  + f*P1C1S3J1_14 - r*P2C1S3J1_14+ s2s3_p2c1j1_14*P2C1S2J1_14 - s3s2_p2c1j1_14*P2C1S3J1_14- (c1c2_p2s3j1_14+c1c3_p2s3j1_14)*P2C1S3J1_14- j1j2_p2c1s3_14*P2C1S3J1_14
  deriv(P2C1S3J2_14) <- age_up*P2C1S3J2_13_lag - age_up*P2C1S3J2_14_lag  + f*P1C1S3J2_14 - r*P2C1S3J2_14+ s2s3_p2c1j2_14*P2C1S2J2_14 - s3s2_p2c1j2_14*P2C1S3J2_14- (c1c2_p2s3j2_14+c1c3_p2s3j2_14)*P2C1S3J2_14+ j1j2_p2c1s3_14*P2C1S3J1_14 - j2j3_p2c1s3_14*P2C1S3J2_14
  deriv(P2C1S3J3_14) <- age_up*P2C1S3J3_13_lag - age_up*P2C1S3J3_14_lag  + f*P1C1S3J3_14 - r*P2C1S3J3_14+ s2s3_p2c1j3_14*P2C1S2J3_14 - s3s2_p2c1j3_14*P2C1S3J3_14- (c1c2_p2s3j3_14+c1c3_p2s3j3_14)*P2C1S3J3_14+ j2j3_p2c1s3_14*P2C1S3J2_14 + j4j3_p2c1s3_14*P2C1S3J4_14 - j3j4_p2c1s3_14*P2C1S3J3_14
  deriv(P2C1S3J4_14) <- age_up*P2C1S3J4_13_lag - age_up*P2C1S3J4_14_lag  + f*P1C1S3J4_14 - r*P2C1S3J4_14+ s2s3_p2c1j4_14*P2C1S2J4_14 - s3s2_p2c1j4_14*P2C1S3J4_14- (c1c2_p2s3j4_14+c1c3_p2s3j4_14)*P2C1S3J4_14+ j3j4_p2c1s3_14*P2C1S3J3_14 - j4j3_p2c1s3_14*P2C1S3J4_14
  deriv(P2C2S1J1_14) <- age_up*P2C2S1J1_13_lag - age_up*P2C2S1J1_14_lag  + f*P1C2S1J1_14 - r*P2C2S1J1_14- s1s2_p2c2j1_14*P2C2S1J1_14+ c1c2_p2s1j1_14*P2C1S1J1_14 + c3c2_p2s1j1_14*P2C3S1J1_14 + c4c2_p2s1j1_14*P2C4S1J1_14 - (c2c3_p2s1j1_14+c2c4_p2s1j1_14)*P2C2S1J1_14- j1j2_p2c2s1_14*P2C2S1J1_14
  deriv(P2C2S1J2_14) <- age_up*P2C2S1J2_13_lag - age_up*P2C2S1J2_14_lag  + f*P1C2S1J2_14 - r*P2C2S1J2_14- s1s2_p2c2j2_14*P2C2S1J2_14+ c1c2_p2s1j2_14*P2C1S1J2_14 + c3c2_p2s1j2_14*P2C3S1J2_14 + c4c2_p2s1j2_14*P2C4S1J2_14 - (c2c3_p2s1j2_14+c2c4_p2s1j2_14)*P2C2S1J2_14+ j1j2_p2c2s1_14*P2C2S1J1_14 - j2j3_p2c2s1_14*P2C2S1J2_14
  deriv(P2C2S1J3_14) <- age_up*P2C2S1J3_13_lag - age_up*P2C2S1J3_14_lag  + f*P1C2S1J3_14 - r*P2C2S1J3_14- s1s2_p2c2j3_14*P2C2S1J3_14+ c1c2_p2s1j3_14*P2C1S1J3_14 + c3c2_p2s1j3_14*P2C3S1J3_14 + c4c2_p2s1j3_14*P2C4S1J3_14 - (c2c3_p2s1j3_14+c2c4_p2s1j3_14)*P2C2S1J3_14+ j2j3_p2c2s1_14*P2C2S1J2_14 + j4j3_p2c2s1_14*P2C2S1J4_14 - j3j4_p2c2s1_14*P2C2S1J3_14
  deriv(P2C2S1J4_14) <- age_up*P2C2S1J4_13_lag - age_up*P2C2S1J4_14_lag  + f*P1C2S1J4_14 - r*P2C2S1J4_14- s1s2_p2c2j4_14*P2C2S1J4_14+ c1c2_p2s1j4_14*P2C1S1J4_14 + c3c2_p2s1j4_14*P2C3S1J4_14 + c4c2_p2s1j4_14*P2C4S1J4_14 - (c2c3_p2s1j4_14+c2c4_p2s1j4_14)*P2C2S1J4_14+ j3j4_p2c2s1_14*P2C2S1J3_14 - j4j3_p2c2s1_14*P2C2S1J4_14
  deriv(P2C2S2J1_14) <- age_up*P2C2S2J1_13_lag - age_up*P2C2S2J1_14_lag  + f*P1C2S2J1_14 - r*P2C2S2J1_14+ s1s2_p2c2j1_14*P2C2S1J1_14 - s2s3_p2c2j1_14*P2C2S2J1_14 + s3s2_p2c2j1_14*P2C2S3J1_14+ c1c2_p2s2j1_14*P2C1S2J1_14 + c3c2_p2s2j1_14*P2C3S2J1_14 + c4c2_p2s2j1_14*P2C4S2J1_14 - (c2c3_p2s2j1_14+c2c4_p2s2j1_14)*P2C2S2J1_14- j1j2_p2c2s2_14*P2C2S2J1_14
  deriv(P2C2S2J2_14) <- age_up*P2C2S2J2_13_lag - age_up*P2C2S2J2_14_lag  + f*P1C2S2J2_14 - r*P2C2S2J2_14+ s1s2_p2c2j2_14*P2C2S1J2_14 - s2s3_p2c2j2_14*P2C2S2J2_14 + s3s2_p2c2j2_14*P2C2S3J2_14+ c1c2_p2s2j2_14*P2C1S2J2_14 + c3c2_p2s2j2_14*P2C3S2J2_14 + c4c2_p2s2j2_14*P2C4S2J2_14 - (c2c3_p2s2j2_14+c2c4_p2s2j2_14)*P2C2S2J2_14+ j1j2_p2c2s2_14*P2C2S2J1_14 - j2j3_p2c2s2_14*P2C2S2J2_14
  deriv(P2C2S2J3_14) <- age_up*P2C2S2J3_13_lag - age_up*P2C2S2J3_14_lag  + f*P1C2S2J3_14 - r*P2C2S2J3_14+ s1s2_p2c2j3_14*P2C2S1J3_14 - s2s3_p2c2j3_14*P2C2S2J3_14 + s3s2_p2c2j3_14*P2C2S3J3_14+ c1c2_p2s2j3_14*P2C1S2J3_14 + c3c2_p2s2j3_14*P2C3S2J3_14 + c4c2_p2s2j3_14*P2C4S2J3_14 - (c2c3_p2s2j3_14+c2c4_p2s2j3_14)*P2C2S2J3_14+ j2j3_p2c2s2_14*P2C2S2J2_14 + j4j3_p2c2s2_14*P2C2S2J4_14 - j3j4_p2c2s2_14*P2C2S2J3_14
  deriv(P2C2S2J4_14) <- age_up*P2C2S2J4_13_lag - age_up*P2C2S2J4_14_lag  + f*P1C2S2J4_14 - r*P2C2S2J4_14+ s1s2_p2c2j4_14*P2C2S1J4_14 - s2s3_p2c2j4_14*P2C2S2J4_14 + s3s2_p2c2j4_14*P2C2S3J4_14+ c1c2_p2s2j4_14*P2C1S2J4_14 + c3c2_p2s2j4_14*P2C3S2J4_14 + c4c2_p2s2j4_14*P2C4S2J4_14 - (c2c3_p2s2j4_14+c2c4_p2s2j4_14)*P2C2S2J4_14+ j3j4_p2c2s2_14*P2C2S2J3_14 - j4j3_p2c2s2_14*P2C2S2J4_14
  deriv(P2C2S3J1_14) <- age_up*P2C2S3J1_13_lag - age_up*P2C2S3J1_14_lag  + f*P1C2S3J1_14 - r*P2C2S3J1_14+ s2s3_p2c2j1_14*P2C2S2J1_14 - s3s2_p2c2j1_14*P2C2S3J1_14+ c1c2_p2s3j1_14*P2C1S3J1_14 + c3c2_p2s3j1_14*P2C3S3J1_14 + c4c2_p2s3j1_14*P2C4S3J1_14 - (c2c3_p2s3j1_14+c2c4_p2s3j1_14)*P2C2S3J1_14- j1j2_p2c2s3_14*P2C2S3J1_14
  deriv(P2C2S3J2_14) <- age_up*P2C2S3J2_13_lag - age_up*P2C2S3J2_14_lag  + f*P1C2S3J2_14 - r*P2C2S3J2_14+ s2s3_p2c2j2_14*P2C2S2J2_14 - s3s2_p2c2j2_14*P2C2S3J2_14+ c1c2_p2s3j2_14*P2C1S3J2_14 + c3c2_p2s3j2_14*P2C3S3J2_14 + c4c2_p2s3j2_14*P2C4S3J2_14 - (c2c3_p2s3j2_14+c2c4_p2s3j2_14)*P2C2S3J2_14+ j1j2_p2c2s3_14*P2C2S3J1_14 - j2j3_p2c2s3_14*P2C2S3J2_14
  deriv(P2C2S3J3_14) <- age_up*P2C2S3J3_13_lag - age_up*P2C2S3J3_14_lag  + f*P1C2S3J3_14 - r*P2C2S3J3_14+ s2s3_p2c2j3_14*P2C2S2J3_14 - s3s2_p2c2j3_14*P2C2S3J3_14+ c1c2_p2s3j3_14*P2C1S3J3_14 + c3c2_p2s3j3_14*P2C3S3J3_14 + c4c2_p2s3j3_14*P2C4S3J3_14 - (c2c3_p2s3j3_14+c2c4_p2s3j3_14)*P2C2S3J3_14+ j2j3_p2c2s3_14*P2C2S3J2_14 + j4j3_p2c2s3_14*P2C2S3J4_14 - j3j4_p2c2s3_14*P2C2S3J3_14
  deriv(P2C2S3J4_14) <- age_up*P2C2S3J4_13_lag - age_up*P2C2S3J4_14_lag  + f*P1C2S3J4_14 - r*P2C2S3J4_14+ s2s3_p2c2j4_14*P2C2S2J4_14 - s3s2_p2c2j4_14*P2C2S3J4_14+ c1c2_p2s3j4_14*P2C1S3J4_14 + c3c2_p2s3j4_14*P2C3S3J4_14 + c4c2_p2s3j4_14*P2C4S3J4_14 - (c2c3_p2s3j4_14+c2c4_p2s3j4_14)*P2C2S3J4_14+ j3j4_p2c2s3_14*P2C2S3J3_14 - j4j3_p2c2s3_14*P2C2S3J4_14
  deriv(P2C3S1J1_14) <- age_up*P2C3S1J1_13_lag - age_up*P2C3S1J1_14_lag  + f*P1C3S1J1_14 - r*P2C3S1J1_14- s1s2_p2c3j1_14*P2C3S1J1_14+ c1c3_p2s1j1_14*P2C1S1J1_14+ c2c3_p2s1j1_14*P2C2S1J1_14 + c4c3_p2s1j1_14*P2C4S1J1_14 - (c3c2_p2s1j1_14+c3c4_p2s1j1_14)*P2C3S1J1_14- j1j2_p2c3s1_14*P2C3S1J1_14
  deriv(P2C3S1J2_14) <- age_up*P2C3S1J2_13_lag - age_up*P2C3S1J2_14_lag  + f*P1C3S1J2_14 - r*P2C3S1J2_14- s1s2_p2c3j2_14*P2C3S1J2_14+ c1c3_p2s1j2_14*P2C1S1J2_14+ c2c3_p2s1j2_14*P2C2S1J2_14 + c4c3_p2s1j2_14*P2C4S1J2_14 - (c3c2_p2s1j2_14+c3c4_p2s1j2_14)*P2C3S1J2_14+ j1j2_p2c3s1_14*P2C3S1J1_14 - j2j3_p2c3s1_14*P2C3S1J2_14
  deriv(P2C3S1J3_14) <- age_up*P2C3S1J3_13_lag - age_up*P2C3S1J3_14_lag  + f*P1C3S1J3_14 - r*P2C3S1J3_14- s1s2_p2c3j3_14*P2C3S1J3_14+ c1c3_p2s1j3_14*P2C1S1J3_14+ c2c3_p2s1j3_14*P2C2S1J3_14 + c4c3_p2s1j3_14*P2C4S1J3_14 - (c3c2_p2s1j3_14+c3c4_p2s1j3_14)*P2C3S1J3_14+ j2j3_p2c3s1_14*P2C3S1J2_14 + j4j3_p2c3s1_14*P2C3S1J4_14 - j3j4_p2c3s1_14*P2C3S1J3_14
  deriv(P2C3S1J4_14) <- age_up*P2C3S1J4_13_lag - age_up*P2C3S1J4_14_lag  + f*P1C3S1J4_14 - r*P2C3S1J4_14- s1s2_p2c3j4_14*P2C3S1J4_14+ c1c3_p2s1j4_14*P2C1S1J4_14+ c2c3_p2s1j4_14*P2C2S1J4_14 + c4c3_p2s1j4_14*P2C4S1J4_14 - (c3c2_p2s1j4_14+c3c4_p2s1j4_14)*P2C3S1J4_14+ j3j4_p2c3s1_14*P2C3S1J3_14 - j4j3_p2c3s1_14*P2C3S1J4_14
  deriv(P2C3S2J1_14) <- age_up*P2C3S2J1_13_lag - age_up*P2C3S2J1_14_lag  + f*P1C3S2J1_14 - r*P2C3S2J1_14+ s1s2_p2c3j1_14*P2C3S1J1_14 - s2s3_p2c3j1_14*P2C3S2J1_14 + s3s2_p2c3j1_14*P2C3S3J1_14+ c1c3_p2s2j1_14*P2C1S2J1_14+ c2c3_p2s2j1_14*P2C2S2J1_14 + c4c3_p2s2j1_14*P2C4S2J1_14 - (c3c2_p2s2j1_14+c3c4_p2s2j1_14)*P2C3S2J1_14- j1j2_p2c3s2_14*P2C3S2J1_14
  deriv(P2C3S2J2_14) <- age_up*P2C3S2J2_13_lag - age_up*P2C3S2J2_14_lag  + f*P1C3S2J2_14 - r*P2C3S2J2_14+ s1s2_p2c3j2_14*P2C3S1J2_14 - s2s3_p2c3j2_14*P2C3S2J2_14 + s3s2_p2c3j2_14*P2C3S3J2_14+ c1c3_p2s2j2_14*P2C1S2J2_14+ c2c3_p2s2j2_14*P2C2S2J2_14 + c4c3_p2s2j2_14*P2C4S2J2_14 - (c3c2_p2s2j2_14+c3c4_p2s2j2_14)*P2C3S2J2_14+ j1j2_p2c3s2_14*P2C3S2J1_14 - j2j3_p2c3s2_14*P2C3S2J2_14
  deriv(P2C3S2J3_14) <- age_up*P2C3S2J3_13_lag - age_up*P2C3S2J3_14_lag  + f*P1C3S2J3_14 - r*P2C3S2J3_14+ s1s2_p2c3j3_14*P2C3S1J3_14 - s2s3_p2c3j3_14*P2C3S2J3_14 + s3s2_p2c3j3_14*P2C3S3J3_14+ c1c3_p2s2j3_14*P2C1S2J3_14+ c2c3_p2s2j3_14*P2C2S2J3_14 + c4c3_p2s2j3_14*P2C4S2J3_14 - (c3c2_p2s2j3_14+c3c4_p2s2j3_14)*P2C3S2J3_14+ j2j3_p2c3s2_14*P2C3S2J2_14 + j4j3_p2c3s2_14*P2C3S2J4_14 - j3j4_p2c3s2_14*P2C3S2J3_14
  deriv(P2C3S2J4_14) <- age_up*P2C3S2J4_13_lag - age_up*P2C3S2J4_14_lag  + f*P1C3S2J4_14 - r*P2C3S2J4_14+ s1s2_p2c3j4_14*P2C3S1J4_14 - s2s3_p2c3j4_14*P2C3S2J4_14 + s3s2_p2c3j4_14*P2C3S3J4_14+ c1c3_p2s2j4_14*P2C1S2J4_14+ c2c3_p2s2j4_14*P2C2S2J4_14 + c4c3_p2s2j4_14*P2C4S2J4_14 - (c3c2_p2s2j4_14+c3c4_p2s2j4_14)*P2C3S2J4_14+ j3j4_p2c3s2_14*P2C3S2J3_14 - j4j3_p2c3s2_14*P2C3S2J4_14
  deriv(P2C3S3J1_14) <- age_up*P2C3S3J1_13_lag - age_up*P2C3S3J1_14_lag  + f*P1C3S3J1_14 - r*P2C3S3J1_14+ s2s3_p2c3j1_14*P2C3S2J1_14 - s3s2_p2c3j1_14*P2C3S3J1_14+ c1c3_p2s3j1_14*P2C1S3J1_14+ c2c3_p2s3j1_14*P2C2S3J1_14 + c4c3_p2s3j1_14*P2C4S3J1_14 - (c3c2_p2s3j1_14+c3c4_p2s3j1_14)*P2C3S3J1_14- j1j2_p2c3s3_14*P2C3S3J1_14
  deriv(P2C3S3J2_14) <- age_up*P2C3S3J2_13_lag - age_up*P2C3S3J2_14_lag  + f*P1C3S3J2_14 - r*P2C3S3J2_14+ s2s3_p2c3j2_14*P2C3S2J2_14 - s3s2_p2c3j2_14*P2C3S3J2_14+ c1c3_p2s3j2_14*P2C1S3J2_14+ c2c3_p2s3j2_14*P2C2S3J2_14 + c4c3_p2s3j2_14*P2C4S3J2_14 - (c3c2_p2s3j2_14+c3c4_p2s3j2_14)*P2C3S3J2_14+ j1j2_p2c3s3_14*P2C3S3J1_14 - j2j3_p2c3s3_14*P2C3S3J2_14
  deriv(P2C3S3J3_14) <- age_up*P2C3S3J3_13_lag - age_up*P2C3S3J3_14_lag  + f*P1C3S3J3_14 - r*P2C3S3J3_14+ s2s3_p2c3j3_14*P2C3S2J3_14 - s3s2_p2c3j3_14*P2C3S3J3_14+ c1c3_p2s3j3_14*P2C1S3J3_14+ c2c3_p2s3j3_14*P2C2S3J3_14 + c4c3_p2s3j3_14*P2C4S3J3_14 - (c3c2_p2s3j3_14+c3c4_p2s3j3_14)*P2C3S3J3_14+ j2j3_p2c3s3_14*P2C3S3J2_14 + j4j3_p2c3s3_14*P2C3S3J4_14 - j3j4_p2c3s3_14*P2C3S3J3_14
  deriv(P2C3S3J4_14) <- age_up*P2C3S3J4_13_lag - age_up*P2C3S3J4_14_lag  + f*P1C3S3J4_14 - r*P2C3S3J4_14+ s2s3_p2c3j4_14*P2C3S2J4_14 - s3s2_p2c3j4_14*P2C3S3J4_14+ c1c3_p2s3j4_14*P2C1S3J4_14+ c2c3_p2s3j4_14*P2C2S3J4_14 + c4c3_p2s3j4_14*P2C4S3J4_14 - (c3c2_p2s3j4_14+c3c4_p2s3j4_14)*P2C3S3J4_14+ j3j4_p2c3s3_14*P2C3S3J3_14 - j4j3_p2c3s3_14*P2C3S3J4_14
  deriv(P2C4S1J1_14) <- age_up*P2C4S1J1_13_lag - age_up*P2C4S1J1_14_lag  + f*P1C4S1J1_14 - r*P2C4S1J1_14- s1s2_p2c4j1_14*P2C4S1J1_14+ c2c4_p2s1j1_14*P2C2S1J1_14 + c3c4_p2s1j1_14*P2C3S1J1_14- (c4c2_p2s1j1_14+c4c3_p2s1j1_14)*P2C4S1J1_14- j1j2_p2c4s1_14*P2C4S1J1_14
  deriv(P2C4S1J2_14) <- age_up*P2C4S1J2_13_lag - age_up*P2C4S1J2_14_lag  + f*P1C4S1J2_14 - r*P2C4S1J2_14- s1s2_p2c4j2_14*P2C4S1J2_14+ c2c4_p2s1j2_14*P2C2S1J2_14 + c3c4_p2s1j2_14*P2C3S1J2_14- (c4c2_p2s1j2_14+c4c3_p2s1j2_14)*P2C4S1J2_14+ j1j2_p2c4s1_14*P2C4S1J1_14 - j2j3_p2c4s1_14*P2C4S1J2_14
  deriv(P2C4S1J3_14) <- age_up*P2C4S1J3_13_lag - age_up*P2C4S1J3_14_lag  + f*P1C4S1J3_14 - r*P2C4S1J3_14- s1s2_p2c4j3_14*P2C4S1J3_14+ c2c4_p2s1j3_14*P2C2S1J3_14 + c3c4_p2s1j3_14*P2C3S1J3_14- (c4c2_p2s1j3_14+c4c3_p2s1j3_14)*P2C4S1J3_14+ j2j3_p2c4s1_14*P2C4S1J2_14 + j4j3_p2c4s1_14*P2C4S1J4_14 - j3j4_p2c4s1_14*P2C4S1J3_14
  deriv(P2C4S1J4_14) <- age_up*P2C4S1J4_13_lag - age_up*P2C4S1J4_14_lag  + f*P1C4S1J4_14 - r*P2C4S1J4_14- s1s2_p2c4j4_14*P2C4S1J4_14+ c2c4_p2s1j4_14*P2C2S1J4_14 + c3c4_p2s1j4_14*P2C3S1J4_14- (c4c2_p2s1j4_14+c4c3_p2s1j4_14)*P2C4S1J4_14+ j3j4_p2c4s1_14*P2C4S1J3_14 - j4j3_p2c4s1_14*P2C4S1J4_14
  deriv(P2C4S2J1_14) <- age_up*P2C4S2J1_13_lag - age_up*P2C4S2J1_14_lag  + f*P1C4S2J1_14 - r*P2C4S2J1_14+ s1s2_p2c4j1_14*P2C4S1J1_14 - s2s3_p2c4j1_14*P2C4S2J1_14 + s3s2_p2c4j1_14*P2C4S3J1_14+ c2c4_p2s2j1_14*P2C2S2J1_14 + c3c4_p2s2j1_14*P2C3S2J1_14- (c4c2_p2s2j1_14+c4c3_p2s2j1_14)*P2C4S2J1_14- j1j2_p2c4s2_14*P2C4S2J1_14
  deriv(P2C4S2J2_14) <- age_up*P2C4S2J2_13_lag - age_up*P2C4S2J2_14_lag  + f*P1C4S2J2_14 - r*P2C4S2J2_14+ s1s2_p2c4j2_14*P2C4S1J2_14 - s2s3_p2c4j2_14*P2C4S2J2_14 + s3s2_p2c4j2_14*P2C4S3J2_14+ c2c4_p2s2j2_14*P2C2S2J2_14 + c3c4_p2s2j2_14*P2C3S2J2_14- (c4c2_p2s2j2_14+c4c3_p2s2j2_14)*P2C4S2J2_14+ j1j2_p2c4s2_14*P2C4S2J1_14 - j2j3_p2c4s2_14*P2C4S2J2_14
  deriv(P2C4S2J3_14) <- age_up*P2C4S2J3_13_lag - age_up*P2C4S2J3_14_lag  + f*P1C4S2J3_14 - r*P2C4S2J3_14+ s1s2_p2c4j3_14*P2C4S1J3_14 - s2s3_p2c4j3_14*P2C4S2J3_14 + s3s2_p2c4j3_14*P2C4S3J3_14+ c2c4_p2s2j3_14*P2C2S2J3_14 + c3c4_p2s2j3_14*P2C3S2J3_14- (c4c2_p2s2j3_14+c4c3_p2s2j3_14)*P2C4S2J3_14+ j2j3_p2c4s2_14*P2C4S2J2_14 + j4j3_p2c4s2_14*P2C4S2J4_14 - j3j4_p2c4s2_14*P2C4S2J3_14
  deriv(P2C4S2J4_14) <- age_up*P2C4S2J4_13_lag - age_up*P2C4S2J4_14_lag  + f*P1C4S2J4_14 - r*P2C4S2J4_14+ s1s2_p2c4j4_14*P2C4S1J4_14 - s2s3_p2c4j4_14*P2C4S2J4_14 + s3s2_p2c4j4_14*P2C4S3J4_14+ c2c4_p2s2j4_14*P2C2S2J4_14 + c3c4_p2s2j4_14*P2C3S2J4_14- (c4c2_p2s2j4_14+c4c3_p2s2j4_14)*P2C4S2J4_14+ j3j4_p2c4s2_14*P2C4S2J3_14 - j4j3_p2c4s2_14*P2C4S2J4_14
  deriv(P2C4S3J1_14) <- age_up*P2C4S3J1_13_lag - age_up*P2C4S3J1_14_lag  + f*P1C4S3J1_14 - r*P2C4S3J1_14+ s2s3_p2c4j1_14*P2C4S2J1_14 - s3s2_p2c4j1_14*P2C4S3J1_14+ c2c4_p2s3j1_14*P2C2S3J1_14 + c3c4_p2s3j1_14*P2C3S3J1_14- (c4c2_p2s3j1_14+c4c3_p2s3j1_14)*P2C4S3J1_14- j1j2_p2c4s3_14*P2C4S3J1_14
  deriv(P2C4S3J2_14) <- age_up*P2C4S3J2_13_lag - age_up*P2C4S3J2_14_lag  + f*P1C4S3J2_14 - r*P2C4S3J2_14+ s2s3_p2c4j2_14*P2C4S2J2_14 - s3s2_p2c4j2_14*P2C4S3J2_14+ c2c4_p2s3j2_14*P2C2S3J2_14 + c3c4_p2s3j2_14*P2C3S3J2_14- (c4c2_p2s3j2_14+c4c3_p2s3j2_14)*P2C4S3J2_14+ j1j2_p2c4s3_14*P2C4S3J1_14 - j2j3_p2c4s3_14*P2C4S3J2_14
  deriv(P2C4S3J3_14) <- age_up*P2C4S3J3_13_lag - age_up*P2C4S3J3_14_lag  + f*P1C4S3J3_14 - r*P2C4S3J3_14+ s2s3_p2c4j3_14*P2C4S2J3_14 - s3s2_p2c4j3_14*P2C4S3J3_14+ c2c4_p2s3j3_14*P2C2S3J3_14 + c3c4_p2s3j3_14*P2C3S3J3_14- (c4c2_p2s3j3_14+c4c3_p2s3j3_14)*P2C4S3J3_14+ j2j3_p2c4s3_14*P2C4S3J2_14 + j4j3_p2c4s3_14*P2C4S3J4_14 - j3j4_p2c4s3_14*P2C4S3J3_14
  deriv(P2C4S3J4_14) <- age_up*P2C4S3J4_13_lag - age_up*P2C4S3J4_14_lag  + f*P1C4S3J4_14 - r*P2C4S3J4_14+ s2s3_p2c4j4_14*P2C4S2J4_14 - s3s2_p2c4j4_14*P2C4S3J4_14+ c2c4_p2s3j4_14*P2C2S3J4_14 + c3c4_p2s3j4_14*P2C3S3J4_14- (c4c2_p2s3j4_14+c4c3_p2s3j4_14)*P2C4S3J4_14+ j3j4_p2c4s3_14*P2C4S3J3_14 - j4j3_p2c4s3_14*P2C4S3J4_14
  deriv(P1C1S1J1_15) <- age_up*P1C1S1J1_14_lag - age_up*P1C1S1J1_15_lag + r*P2C1S1J1_15 - f*P1C1S1J1_15- s1s2_p1c1j1_15*P1C1S1J1_15- (c1c2_p1s1j1_15+c1c3_p1s1j1_15)*P1C1S1J1_15- j1j2_p1c1s1_15*P1C1S1J1_15
  deriv(P1C1S1J2_15) <- age_up*P1C1S1J2_14_lag - age_up*P1C1S1J2_15_lag + r*P2C1S1J2_15 - f*P1C1S1J2_15- s1s2_p1c1j2_15*P1C1S1J2_15- (c1c2_p1s1j2_15+c1c3_p1s1j2_15)*P1C1S1J2_15+ j1j2_p1c1s1_15*P1C1S1J1_15 - j2j3_p1c1s1_15*P1C1S1J2_15
  deriv(P1C1S1J3_15) <- age_up*P1C1S1J3_14_lag - age_up*P1C1S1J3_15_lag + r*P2C1S1J3_15 - f*P1C1S1J3_15- s1s2_p1c1j3_15*P1C1S1J3_15- (c1c2_p1s1j3_15+c1c3_p1s1j3_15)*P1C1S1J3_15+ j2j3_p1c1s1_15*P1C1S1J2_15 + j4j3_p1c1s1_15*P1C1S1J4_15 - j3j4_p1c1s1_15*P1C1S1J3_15
  deriv(P1C1S1J4_15) <- age_up*P1C1S1J4_14_lag - age_up*P1C1S1J4_15_lag + r*P2C1S1J4_15 - f*P1C1S1J4_15- s1s2_p1c1j4_15*P1C1S1J4_15- (c1c2_p1s1j4_15+c1c3_p1s1j4_15)*P1C1S1J4_15+ j3j4_p1c1s1_15*P1C1S1J3_15 - j4j3_p1c1s1_15*P1C1S1J4_15
  deriv(P1C1S2J1_15) <- age_up*P1C1S2J1_14_lag - age_up*P1C1S2J1_15_lag + r*P2C1S2J1_15 - f*P1C1S2J1_15+ s1s2_p1c1j1_15*P1C1S1J1_15 - s2s3_p1c1j1_15*P1C1S2J1_15 + s3s2_p1c1j1_15*P1C1S3J1_15- (c1c2_p1s2j1_15+c1c3_p1s2j1_15)*P1C1S2J1_15- j1j2_p1c1s2_15*P1C1S2J1_15
  deriv(P1C1S2J2_15) <- age_up*P1C1S2J2_14_lag - age_up*P1C1S2J2_15_lag + r*P2C1S2J2_15 - f*P1C1S2J2_15+ s1s2_p1c1j2_15*P1C1S1J2_15 - s2s3_p1c1j2_15*P1C1S2J2_15 + s3s2_p1c1j2_15*P1C1S3J2_15- (c1c2_p1s2j2_15+c1c3_p1s2j2_15)*P1C1S2J2_15+ j1j2_p1c1s2_15*P1C1S2J1_15 - j2j3_p1c1s2_15*P1C1S2J2_15
  deriv(P1C1S2J3_15) <- age_up*P1C1S2J3_14_lag - age_up*P1C1S2J3_15_lag + r*P2C1S2J3_15 - f*P1C1S2J3_15+ s1s2_p1c1j3_15*P1C1S1J3_15 - s2s3_p1c1j3_15*P1C1S2J3_15 + s3s2_p1c1j3_15*P1C1S3J3_15- (c1c2_p1s2j3_15+c1c3_p1s2j3_15)*P1C1S2J3_15+ j2j3_p1c1s2_15*P1C1S2J2_15 + j4j3_p1c1s2_15*P1C1S2J4_15 - j3j4_p1c1s2_15*P1C1S2J3_15
  deriv(P1C1S2J4_15) <- age_up*P1C1S2J4_14_lag - age_up*P1C1S2J4_15_lag + r*P2C1S2J4_15 - f*P1C1S2J4_15+ s1s2_p1c1j4_15*P1C1S1J4_15 - s2s3_p1c1j4_15*P1C1S2J4_15 + s3s2_p1c1j4_15*P1C1S3J4_15- (c1c2_p1s2j4_15+c1c3_p1s2j4_15)*P1C1S2J4_15+ j3j4_p1c1s2_15*P1C1S2J3_15 - j4j3_p1c1s2_15*P1C1S2J4_15
  deriv(P1C1S3J1_15) <- age_up*P1C1S3J1_14_lag - age_up*P1C1S3J1_15_lag + r*P2C1S3J1_15 - f*P1C1S3J1_15+ s2s3_p1c1j1_15*P1C1S2J1_15 - s3s2_p1c1j1_15*P1C1S3J1_15- (c1c2_p1s3j1_15+c1c3_p1s3j1_15)*P1C1S3J1_15- j1j2_p1c1s3_15*P1C1S3J1_15
  deriv(P1C1S3J2_15) <- age_up*P1C1S3J2_14_lag - age_up*P1C1S3J2_15_lag + r*P2C1S3J2_15 - f*P1C1S3J2_15+ s2s3_p1c1j2_15*P1C1S2J2_15 - s3s2_p1c1j2_15*P1C1S3J2_15- (c1c2_p1s3j2_15+c1c3_p1s3j2_15)*P1C1S3J2_15+ j1j2_p1c1s3_15*P1C1S3J1_15 - j2j3_p1c1s3_15*P1C1S3J2_15
  deriv(P1C1S3J3_15) <- age_up*P1C1S3J3_14_lag - age_up*P1C1S3J3_15_lag + r*P2C1S3J3_15 - f*P1C1S3J3_15+ s2s3_p1c1j3_15*P1C1S2J3_15 - s3s2_p1c1j3_15*P1C1S3J3_15- (c1c2_p1s3j3_15+c1c3_p1s3j3_15)*P1C1S3J3_15+ j2j3_p1c1s3_15*P1C1S3J2_15 + j4j3_p1c1s3_15*P1C1S3J4_15 - j3j4_p1c1s3_15*P1C1S3J3_15
  deriv(P1C1S3J4_15) <- age_up*P1C1S3J4_14_lag - age_up*P1C1S3J4_15_lag + r*P2C1S3J4_15 - f*P1C1S3J4_15+ s2s3_p1c1j4_15*P1C1S2J4_15 - s3s2_p1c1j4_15*P1C1S3J4_15- (c1c2_p1s3j4_15+c1c3_p1s3j4_15)*P1C1S3J4_15+ j3j4_p1c1s3_15*P1C1S3J3_15 - j4j3_p1c1s3_15*P1C1S3J4_15
  deriv(P1C2S1J1_15) <- age_up*P1C2S1J1_14_lag - age_up*P1C2S1J1_15_lag + r*P2C2S1J1_15 - f*P1C2S1J1_15- s1s2_p1c2j1_15*P1C2S1J1_15+ c1c2_p1s1j1_15*P1C1S1J1_15 + c3c2_p1s1j1_15*P1C3S1J1_15 + c4c2_p1s1j1_15*P1C4S1J1_15 - (c2c3_p1s1j1_15+c2c4_p1s1j1_15)*P1C2S1J1_15- j1j2_p1c2s1_15*P1C2S1J1_15
  deriv(P1C2S1J2_15) <- age_up*P1C2S1J2_14_lag - age_up*P1C2S1J2_15_lag + r*P2C2S1J2_15 - f*P1C2S1J2_15- s1s2_p1c2j2_15*P1C2S1J2_15+ c1c2_p1s1j2_15*P1C1S1J2_15 + c3c2_p1s1j2_15*P1C3S1J2_15 + c4c2_p1s1j2_15*P1C4S1J2_15 - (c2c3_p1s1j2_15+c2c4_p1s1j2_15)*P1C2S1J2_15+ j1j2_p1c2s1_15*P1C2S1J1_15 - j2j3_p1c2s1_15*P1C2S1J2_15
  deriv(P1C2S1J3_15) <- age_up*P1C2S1J3_14_lag - age_up*P1C2S1J3_15_lag + r*P2C2S1J3_15 - f*P1C2S1J3_15- s1s2_p1c2j3_15*P1C2S1J3_15+ c1c2_p1s1j3_15*P1C1S1J3_15 + c3c2_p1s1j3_15*P1C3S1J3_15 + c4c2_p1s1j3_15*P1C4S1J3_15 - (c2c3_p1s1j3_15+c2c4_p1s1j3_15)*P1C2S1J3_15+ j2j3_p1c2s1_15*P1C2S1J2_15 + j4j3_p1c2s1_15*P1C2S1J4_15 - j3j4_p1c2s1_15*P1C2S1J3_15
  deriv(P1C2S1J4_15) <- age_up*P1C2S1J4_14_lag - age_up*P1C2S1J4_15_lag + r*P2C2S1J4_15 - f*P1C2S1J4_15- s1s2_p1c2j4_15*P1C2S1J4_15+ c1c2_p1s1j4_15*P1C1S1J4_15 + c3c2_p1s1j4_15*P1C3S1J4_15 + c4c2_p1s1j4_15*P1C4S1J4_15 - (c2c3_p1s1j4_15+c2c4_p1s1j4_15)*P1C2S1J4_15+ j3j4_p1c2s1_15*P1C2S1J3_15 - j4j3_p1c2s1_15*P1C2S1J4_15
  deriv(P1C2S2J1_15) <- age_up*P1C2S2J1_14_lag - age_up*P1C2S2J1_15_lag + r*P2C2S2J1_15 - f*P1C2S2J1_15+ s1s2_p1c2j1_15*P1C2S1J1_15 - s2s3_p1c2j1_15*P1C2S2J1_15 + s3s2_p1c2j1_15*P1C2S3J1_15+ c1c2_p1s2j1_15*P1C1S2J1_15 + c3c2_p1s2j1_15*P1C3S2J1_15 + c4c2_p1s2j1_15*P1C4S2J1_15 - (c2c3_p1s2j1_15+c2c4_p1s2j1_15)*P1C2S2J1_15- j1j2_p1c2s2_15*P1C2S2J1_15
  deriv(P1C2S2J2_15) <- age_up*P1C2S2J2_14_lag - age_up*P1C2S2J2_15_lag + r*P2C2S2J2_15 - f*P1C2S2J2_15+ s1s2_p1c2j2_15*P1C2S1J2_15 - s2s3_p1c2j2_15*P1C2S2J2_15 + s3s2_p1c2j2_15*P1C2S3J2_15+ c1c2_p1s2j2_15*P1C1S2J2_15 + c3c2_p1s2j2_15*P1C3S2J2_15 + c4c2_p1s2j2_15*P1C4S2J2_15 - (c2c3_p1s2j2_15+c2c4_p1s2j2_15)*P1C2S2J2_15+ j1j2_p1c2s2_15*P1C2S2J1_15 - j2j3_p1c2s2_15*P1C2S2J2_15
  deriv(P1C2S2J3_15) <- age_up*P1C2S2J3_14_lag - age_up*P1C2S2J3_15_lag + r*P2C2S2J3_15 - f*P1C2S2J3_15+ s1s2_p1c2j3_15*P1C2S1J3_15 - s2s3_p1c2j3_15*P1C2S2J3_15 + s3s2_p1c2j3_15*P1C2S3J3_15+ c1c2_p1s2j3_15*P1C1S2J3_15 + c3c2_p1s2j3_15*P1C3S2J3_15 + c4c2_p1s2j3_15*P1C4S2J3_15 - (c2c3_p1s2j3_15+c2c4_p1s2j3_15)*P1C2S2J3_15+ j2j3_p1c2s2_15*P1C2S2J2_15 + j4j3_p1c2s2_15*P1C2S2J4_15 - j3j4_p1c2s2_15*P1C2S2J3_15
  deriv(P1C2S2J4_15) <- age_up*P1C2S2J4_14_lag - age_up*P1C2S2J4_15_lag + r*P2C2S2J4_15 - f*P1C2S2J4_15+ s1s2_p1c2j4_15*P1C2S1J4_15 - s2s3_p1c2j4_15*P1C2S2J4_15 + s3s2_p1c2j4_15*P1C2S3J4_15+ c1c2_p1s2j4_15*P1C1S2J4_15 + c3c2_p1s2j4_15*P1C3S2J4_15 + c4c2_p1s2j4_15*P1C4S2J4_15 - (c2c3_p1s2j4_15+c2c4_p1s2j4_15)*P1C2S2J4_15+ j3j4_p1c2s2_15*P1C2S2J3_15 - j4j3_p1c2s2_15*P1C2S2J4_15
  deriv(P1C2S3J1_15) <- age_up*P1C2S3J1_14_lag - age_up*P1C2S3J1_15_lag + r*P2C2S3J1_15 - f*P1C2S3J1_15+ s2s3_p1c2j1_15*P1C2S2J1_15 - s3s2_p1c2j1_15*P1C2S3J1_15+ c1c2_p1s3j1_15*P1C1S3J1_15 + c3c2_p1s3j1_15*P1C3S3J1_15 + c4c2_p1s3j1_15*P1C4S3J1_15 - (c2c3_p1s3j1_15+c2c4_p1s3j1_15)*P1C2S3J1_15- j1j2_p1c2s3_15*P1C2S3J1_15
  deriv(P1C2S3J2_15) <- age_up*P1C2S3J2_14_lag - age_up*P1C2S3J2_15_lag + r*P2C2S3J2_15 - f*P1C2S3J2_15+ s2s3_p1c2j2_15*P1C2S2J2_15 - s3s2_p1c2j2_15*P1C2S3J2_15+ c1c2_p1s3j2_15*P1C1S3J2_15 + c3c2_p1s3j2_15*P1C3S3J2_15 + c4c2_p1s3j2_15*P1C4S3J2_15 - (c2c3_p1s3j2_15+c2c4_p1s3j2_15)*P1C2S3J2_15+ j1j2_p1c2s3_15*P1C2S3J1_15 - j2j3_p1c2s3_15*P1C2S3J2_15
  deriv(P1C2S3J3_15) <- age_up*P1C2S3J3_14_lag - age_up*P1C2S3J3_15_lag + r*P2C2S3J3_15 - f*P1C2S3J3_15+ s2s3_p1c2j3_15*P1C2S2J3_15 - s3s2_p1c2j3_15*P1C2S3J3_15+ c1c2_p1s3j3_15*P1C1S3J3_15 + c3c2_p1s3j3_15*P1C3S3J3_15 + c4c2_p1s3j3_15*P1C4S3J3_15 - (c2c3_p1s3j3_15+c2c4_p1s3j3_15)*P1C2S3J3_15+ j2j3_p1c2s3_15*P1C2S3J2_15 + j4j3_p1c2s3_15*P1C2S3J4_15 - j3j4_p1c2s3_15*P1C2S3J3_15
  deriv(P1C2S3J4_15) <- age_up*P1C2S3J4_14_lag - age_up*P1C2S3J4_15_lag + r*P2C2S3J4_15 - f*P1C2S3J4_15+ s2s3_p1c2j4_15*P1C2S2J4_15 - s3s2_p1c2j4_15*P1C2S3J4_15+ c1c2_p1s3j4_15*P1C1S3J4_15 + c3c2_p1s3j4_15*P1C3S3J4_15 + c4c2_p1s3j4_15*P1C4S3J4_15 - (c2c3_p1s3j4_15+c2c4_p1s3j4_15)*P1C2S3J4_15+ j3j4_p1c2s3_15*P1C2S3J3_15 - j4j3_p1c2s3_15*P1C2S3J4_15
  deriv(P1C3S1J1_15) <- age_up*P1C3S1J1_14_lag - age_up*P1C3S1J1_15_lag + r*P2C3S1J1_15 - f*P1C3S1J1_15- s1s2_p1c3j1_15*P1C3S1J1_15+ c1c3_p1s1j1_15*P1C1S1J1_15+ c2c3_p1s1j1_15*P1C2S1J1_15 + c4c3_p1s1j1_15*P1C4S1J1_15 - (c3c2_p1s1j1_15+c3c4_p1s1j1_15)*P1C3S1J1_15- j1j2_p1c3s1_15*P1C3S1J1_15
  deriv(P1C3S1J2_15) <- age_up*P1C3S1J2_14_lag - age_up*P1C3S1J2_15_lag + r*P2C3S1J2_15 - f*P1C3S1J2_15- s1s2_p1c3j2_15*P1C3S1J2_15+ c1c3_p1s1j2_15*P1C1S1J2_15+ c2c3_p1s1j2_15*P1C2S1J2_15 + c4c3_p1s1j2_15*P1C4S1J2_15 - (c3c2_p1s1j2_15+c3c4_p1s1j2_15)*P1C3S1J2_15+ j1j2_p1c3s1_15*P1C3S1J1_15 - j2j3_p1c3s1_15*P1C3S1J2_15
  deriv(P1C3S1J3_15) <- age_up*P1C3S1J3_14_lag - age_up*P1C3S1J3_15_lag + r*P2C3S1J3_15 - f*P1C3S1J3_15- s1s2_p1c3j3_15*P1C3S1J3_15+ c1c3_p1s1j3_15*P1C1S1J3_15+ c2c3_p1s1j3_15*P1C2S1J3_15 + c4c3_p1s1j3_15*P1C4S1J3_15 - (c3c2_p1s1j3_15+c3c4_p1s1j3_15)*P1C3S1J3_15+ j2j3_p1c3s1_15*P1C3S1J2_15 + j4j3_p1c3s1_15*P1C3S1J4_15 - j3j4_p1c3s1_15*P1C3S1J3_15
  deriv(P1C3S1J4_15) <- age_up*P1C3S1J4_14_lag - age_up*P1C3S1J4_15_lag + r*P2C3S1J4_15 - f*P1C3S1J4_15- s1s2_p1c3j4_15*P1C3S1J4_15+ c1c3_p1s1j4_15*P1C1S1J4_15+ c2c3_p1s1j4_15*P1C2S1J4_15 + c4c3_p1s1j4_15*P1C4S1J4_15 - (c3c2_p1s1j4_15+c3c4_p1s1j4_15)*P1C3S1J4_15+ j3j4_p1c3s1_15*P1C3S1J3_15 - j4j3_p1c3s1_15*P1C3S1J4_15
  deriv(P1C3S2J1_15) <- age_up*P1C3S2J1_14_lag - age_up*P1C3S2J1_15_lag + r*P2C3S2J1_15 - f*P1C3S2J1_15+ s1s2_p1c3j1_15*P1C3S1J1_15 - s2s3_p1c3j1_15*P1C3S2J1_15 + s3s2_p1c3j1_15*P1C3S3J1_15+ c1c3_p1s2j1_15*P1C1S2J1_15+ c2c3_p1s2j1_15*P1C2S2J1_15 + c4c3_p1s2j1_15*P1C4S2J1_15 - (c3c2_p1s2j1_15+c3c4_p1s2j1_15)*P1C3S2J1_15- j1j2_p1c3s2_15*P1C3S2J1_15
  deriv(P1C3S2J2_15) <- age_up*P1C3S2J2_14_lag - age_up*P1C3S2J2_15_lag + r*P2C3S2J2_15 - f*P1C3S2J2_15+ s1s2_p1c3j2_15*P1C3S1J2_15 - s2s3_p1c3j2_15*P1C3S2J2_15 + s3s2_p1c3j2_15*P1C3S3J2_15+ c1c3_p1s2j2_15*P1C1S2J2_15+ c2c3_p1s2j2_15*P1C2S2J2_15 + c4c3_p1s2j2_15*P1C4S2J2_15 - (c3c2_p1s2j2_15+c3c4_p1s2j2_15)*P1C3S2J2_15+ j1j2_p1c3s2_15*P1C3S2J1_15 - j2j3_p1c3s2_15*P1C3S2J2_15
  deriv(P1C3S2J3_15) <- age_up*P1C3S2J3_14_lag - age_up*P1C3S2J3_15_lag + r*P2C3S2J3_15 - f*P1C3S2J3_15+ s1s2_p1c3j3_15*P1C3S1J3_15 - s2s3_p1c3j3_15*P1C3S2J3_15 + s3s2_p1c3j3_15*P1C3S3J3_15+ c1c3_p1s2j3_15*P1C1S2J3_15+ c2c3_p1s2j3_15*P1C2S2J3_15 + c4c3_p1s2j3_15*P1C4S2J3_15 - (c3c2_p1s2j3_15+c3c4_p1s2j3_15)*P1C3S2J3_15+ j2j3_p1c3s2_15*P1C3S2J2_15 + j4j3_p1c3s2_15*P1C3S2J4_15 - j3j4_p1c3s2_15*P1C3S2J3_15
  deriv(P1C3S2J4_15) <- age_up*P1C3S2J4_14_lag - age_up*P1C3S2J4_15_lag + r*P2C3S2J4_15 - f*P1C3S2J4_15+ s1s2_p1c3j4_15*P1C3S1J4_15 - s2s3_p1c3j4_15*P1C3S2J4_15 + s3s2_p1c3j4_15*P1C3S3J4_15+ c1c3_p1s2j4_15*P1C1S2J4_15+ c2c3_p1s2j4_15*P1C2S2J4_15 + c4c3_p1s2j4_15*P1C4S2J4_15 - (c3c2_p1s2j4_15+c3c4_p1s2j4_15)*P1C3S2J4_15+ j3j4_p1c3s2_15*P1C3S2J3_15 - j4j3_p1c3s2_15*P1C3S2J4_15
  deriv(P1C3S3J1_15) <- age_up*P1C3S3J1_14_lag - age_up*P1C3S3J1_15_lag + r*P2C3S3J1_15 - f*P1C3S3J1_15+ s2s3_p1c3j1_15*P1C3S2J1_15 - s3s2_p1c3j1_15*P1C3S3J1_15+ c1c3_p1s3j1_15*P1C1S3J1_15+ c2c3_p1s3j1_15*P1C2S3J1_15 + c4c3_p1s3j1_15*P1C4S3J1_15 - (c3c2_p1s3j1_15+c3c4_p1s3j1_15)*P1C3S3J1_15- j1j2_p1c3s3_15*P1C3S3J1_15
  deriv(P1C3S3J2_15) <- age_up*P1C3S3J2_14_lag - age_up*P1C3S3J2_15_lag + r*P2C3S3J2_15 - f*P1C3S3J2_15+ s2s3_p1c3j2_15*P1C3S2J2_15 - s3s2_p1c3j2_15*P1C3S3J2_15+ c1c3_p1s3j2_15*P1C1S3J2_15+ c2c3_p1s3j2_15*P1C2S3J2_15 + c4c3_p1s3j2_15*P1C4S3J2_15 - (c3c2_p1s3j2_15+c3c4_p1s3j2_15)*P1C3S3J2_15+ j1j2_p1c3s3_15*P1C3S3J1_15 - j2j3_p1c3s3_15*P1C3S3J2_15
  deriv(P1C3S3J3_15) <- age_up*P1C3S3J3_14_lag - age_up*P1C3S3J3_15_lag + r*P2C3S3J3_15 - f*P1C3S3J3_15+ s2s3_p1c3j3_15*P1C3S2J3_15 - s3s2_p1c3j3_15*P1C3S3J3_15+ c1c3_p1s3j3_15*P1C1S3J3_15+ c2c3_p1s3j3_15*P1C2S3J3_15 + c4c3_p1s3j3_15*P1C4S3J3_15 - (c3c2_p1s3j3_15+c3c4_p1s3j3_15)*P1C3S3J3_15+ j2j3_p1c3s3_15*P1C3S3J2_15 + j4j3_p1c3s3_15*P1C3S3J4_15 - j3j4_p1c3s3_15*P1C3S3J3_15
  deriv(P1C3S3J4_15) <- age_up*P1C3S3J4_14_lag - age_up*P1C3S3J4_15_lag + r*P2C3S3J4_15 - f*P1C3S3J4_15+ s2s3_p1c3j4_15*P1C3S2J4_15 - s3s2_p1c3j4_15*P1C3S3J4_15+ c1c3_p1s3j4_15*P1C1S3J4_15+ c2c3_p1s3j4_15*P1C2S3J4_15 + c4c3_p1s3j4_15*P1C4S3J4_15 - (c3c2_p1s3j4_15+c3c4_p1s3j4_15)*P1C3S3J4_15+ j3j4_p1c3s3_15*P1C3S3J3_15 - j4j3_p1c3s3_15*P1C3S3J4_15
  deriv(P1C4S1J1_15) <- age_up*P1C4S1J1_14_lag - age_up*P1C4S1J1_15_lag + r*P2C4S1J1_15 - f*P1C4S1J1_15- s1s2_p1c4j1_15*P1C4S1J1_15+ c2c4_p1s1j1_15*P1C2S1J1_15 + c3c4_p1s1j1_15*P1C3S1J1_15- (c4c2_p1s1j1_15+c4c3_p1s1j1_15)*P1C4S1J1_15- j1j2_p1c4s1_15*P1C4S1J1_15
  deriv(P1C4S1J2_15) <- age_up*P1C4S1J2_14_lag - age_up*P1C4S1J2_15_lag + r*P2C4S1J2_15 - f*P1C4S1J2_15- s1s2_p1c4j2_15*P1C4S1J2_15+ c2c4_p1s1j2_15*P1C2S1J2_15 + c3c4_p1s1j2_15*P1C3S1J2_15- (c4c2_p1s1j2_15+c4c3_p1s1j2_15)*P1C4S1J2_15+ j1j2_p1c4s1_15*P1C4S1J1_15 - j2j3_p1c4s1_15*P1C4S1J2_15
  deriv(P1C4S1J3_15) <- age_up*P1C4S1J3_14_lag - age_up*P1C4S1J3_15_lag + r*P2C4S1J3_15 - f*P1C4S1J3_15- s1s2_p1c4j3_15*P1C4S1J3_15+ c2c4_p1s1j3_15*P1C2S1J3_15 + c3c4_p1s1j3_15*P1C3S1J3_15- (c4c2_p1s1j3_15+c4c3_p1s1j3_15)*P1C4S1J3_15+ j2j3_p1c4s1_15*P1C4S1J2_15 + j4j3_p1c4s1_15*P1C4S1J4_15 - j3j4_p1c4s1_15*P1C4S1J3_15
  deriv(P1C4S1J4_15) <- age_up*P1C4S1J4_14_lag - age_up*P1C4S1J4_15_lag + r*P2C4S1J4_15 - f*P1C4S1J4_15- s1s2_p1c4j4_15*P1C4S1J4_15+ c2c4_p1s1j4_15*P1C2S1J4_15 + c3c4_p1s1j4_15*P1C3S1J4_15- (c4c2_p1s1j4_15+c4c3_p1s1j4_15)*P1C4S1J4_15+ j3j4_p1c4s1_15*P1C4S1J3_15 - j4j3_p1c4s1_15*P1C4S1J4_15
  deriv(P1C4S2J1_15) <- age_up*P1C4S2J1_14_lag - age_up*P1C4S2J1_15_lag + r*P2C4S2J1_15 - f*P1C4S2J1_15+ s1s2_p1c4j1_15*P1C4S1J1_15 - s2s3_p1c4j1_15*P1C4S2J1_15 + s3s2_p1c4j1_15*P1C4S3J1_15+ c2c4_p1s2j1_15*P1C2S2J1_15 + c3c4_p1s2j1_15*P1C3S2J1_15- (c4c2_p1s2j1_15+c4c3_p1s2j1_15)*P1C4S2J1_15- j1j2_p1c4s2_15*P1C4S2J1_15
  deriv(P1C4S2J2_15) <- age_up*P1C4S2J2_14_lag - age_up*P1C4S2J2_15_lag + r*P2C4S2J2_15 - f*P1C4S2J2_15+ s1s2_p1c4j2_15*P1C4S1J2_15 - s2s3_p1c4j2_15*P1C4S2J2_15 + s3s2_p1c4j2_15*P1C4S3J2_15+ c2c4_p1s2j2_15*P1C2S2J2_15 + c3c4_p1s2j2_15*P1C3S2J2_15- (c4c2_p1s2j2_15+c4c3_p1s2j2_15)*P1C4S2J2_15+ j1j2_p1c4s2_15*P1C4S2J1_15 - j2j3_p1c4s2_15*P1C4S2J2_15
  deriv(P1C4S2J3_15) <- age_up*P1C4S2J3_14_lag - age_up*P1C4S2J3_15_lag + r*P2C4S2J3_15 - f*P1C4S2J3_15+ s1s2_p1c4j3_15*P1C4S1J3_15 - s2s3_p1c4j3_15*P1C4S2J3_15 + s3s2_p1c4j3_15*P1C4S3J3_15+ c2c4_p1s2j3_15*P1C2S2J3_15 + c3c4_p1s2j3_15*P1C3S2J3_15- (c4c2_p1s2j3_15+c4c3_p1s2j3_15)*P1C4S2J3_15+ j2j3_p1c4s2_15*P1C4S2J2_15 + j4j3_p1c4s2_15*P1C4S2J4_15 - j3j4_p1c4s2_15*P1C4S2J3_15
  deriv(P1C4S2J4_15) <- age_up*P1C4S2J4_14_lag - age_up*P1C4S2J4_15_lag + r*P2C4S2J4_15 - f*P1C4S2J4_15+ s1s2_p1c4j4_15*P1C4S1J4_15 - s2s3_p1c4j4_15*P1C4S2J4_15 + s3s2_p1c4j4_15*P1C4S3J4_15+ c2c4_p1s2j4_15*P1C2S2J4_15 + c3c4_p1s2j4_15*P1C3S2J4_15- (c4c2_p1s2j4_15+c4c3_p1s2j4_15)*P1C4S2J4_15+ j3j4_p1c4s2_15*P1C4S2J3_15 - j4j3_p1c4s2_15*P1C4S2J4_15
  deriv(P1C4S3J1_15) <- age_up*P1C4S3J1_14_lag - age_up*P1C4S3J1_15_lag + r*P2C4S3J1_15 - f*P1C4S3J1_15+ s2s3_p1c4j1_15*P1C4S2J1_15 - s3s2_p1c4j1_15*P1C4S3J1_15+ c2c4_p1s3j1_15*P1C2S3J1_15 + c3c4_p1s3j1_15*P1C3S3J1_15- (c4c2_p1s3j1_15+c4c3_p1s3j1_15)*P1C4S3J1_15- j1j2_p1c4s3_15*P1C4S3J1_15
  deriv(P1C4S3J2_15) <- age_up*P1C4S3J2_14_lag - age_up*P1C4S3J2_15_lag + r*P2C4S3J2_15 - f*P1C4S3J2_15+ s2s3_p1c4j2_15*P1C4S2J2_15 - s3s2_p1c4j2_15*P1C4S3J2_15+ c2c4_p1s3j2_15*P1C2S3J2_15 + c3c4_p1s3j2_15*P1C3S3J2_15- (c4c2_p1s3j2_15+c4c3_p1s3j2_15)*P1C4S3J2_15+ j1j2_p1c4s3_15*P1C4S3J1_15 - j2j3_p1c4s3_15*P1C4S3J2_15
  deriv(P1C4S3J3_15) <- age_up*P1C4S3J3_14_lag - age_up*P1C4S3J3_15_lag + r*P2C4S3J3_15 - f*P1C4S3J3_15+ s2s3_p1c4j3_15*P1C4S2J3_15 - s3s2_p1c4j3_15*P1C4S3J3_15+ c2c4_p1s3j3_15*P1C2S3J3_15 + c3c4_p1s3j3_15*P1C3S3J3_15- (c4c2_p1s3j3_15+c4c3_p1s3j3_15)*P1C4S3J3_15+ j2j3_p1c4s3_15*P1C4S3J2_15 + j4j3_p1c4s3_15*P1C4S3J4_15 - j3j4_p1c4s3_15*P1C4S3J3_15
  deriv(P1C4S3J4_15) <- age_up*P1C4S3J4_14_lag - age_up*P1C4S3J4_15_lag + r*P2C4S3J4_15 - f*P1C4S3J4_15+ s2s3_p1c4j4_15*P1C4S2J4_15 - s3s2_p1c4j4_15*P1C4S3J4_15+ c2c4_p1s3j4_15*P1C2S3J4_15 + c3c4_p1s3j4_15*P1C3S3J4_15- (c4c2_p1s3j4_15+c4c3_p1s3j4_15)*P1C4S3J4_15+ j3j4_p1c4s3_15*P1C4S3J3_15 - j4j3_p1c4s3_15*P1C4S3J4_15
  deriv(P2C1S1J1_15) <- age_up*P2C1S1J1_14_lag - age_up*P2C1S1J1_15_lag  + f*P1C1S1J1_15 - r*P2C1S1J1_15- s1s2_p2c1j1_15*P2C1S1J1_15- (c1c2_p2s1j1_15+c1c3_p2s1j1_15)*P2C1S1J1_15- j1j2_p2c1s1_15*P2C1S1J1_15
  deriv(P2C1S1J2_15) <- age_up*P2C1S1J2_14_lag - age_up*P2C1S1J2_15_lag  + f*P1C1S1J2_15 - r*P2C1S1J2_15- s1s2_p2c1j2_15*P2C1S1J2_15- (c1c2_p2s1j2_15+c1c3_p2s1j2_15)*P2C1S1J2_15+ j1j2_p2c1s1_15*P2C1S1J1_15 - j2j3_p2c1s1_15*P2C1S1J2_15
  deriv(P2C1S1J3_15) <- age_up*P2C1S1J3_14_lag - age_up*P2C1S1J3_15_lag  + f*P1C1S1J3_15 - r*P2C1S1J3_15- s1s2_p2c1j3_15*P2C1S1J3_15- (c1c2_p2s1j3_15+c1c3_p2s1j3_15)*P2C1S1J3_15+ j2j3_p2c1s1_15*P2C1S1J2_15 + j4j3_p2c1s1_15*P2C1S1J4_15 - j3j4_p2c1s1_15*P2C1S1J3_15
  deriv(P2C1S1J4_15) <- age_up*P2C1S1J4_14_lag - age_up*P2C1S1J4_15_lag  + f*P1C1S1J4_15 - r*P2C1S1J4_15- s1s2_p2c1j4_15*P2C1S1J4_15- (c1c2_p2s1j4_15+c1c3_p2s1j4_15)*P2C1S1J4_15+ j3j4_p2c1s1_15*P2C1S1J3_15 - j4j3_p2c1s1_15*P2C1S1J4_15
  deriv(P2C1S2J1_15) <- age_up*P2C1S2J1_14_lag - age_up*P2C1S2J1_15_lag  + f*P1C1S2J1_15 - r*P2C1S2J1_15+ s1s2_p2c1j1_15*P2C1S1J1_15 - s2s3_p2c1j1_15*P2C1S2J1_15 + s3s2_p2c1j1_15*P2C1S3J1_15- (c1c2_p2s2j1_15+c1c3_p2s2j1_15)*P2C1S2J1_15- j1j2_p2c1s2_15*P2C1S2J1_15
  deriv(P2C1S2J2_15) <- age_up*P2C1S2J2_14_lag - age_up*P2C1S2J2_15_lag  + f*P1C1S2J2_15 - r*P2C1S2J2_15+ s1s2_p2c1j2_15*P2C1S1J2_15 - s2s3_p2c1j2_15*P2C1S2J2_15 + s3s2_p2c1j2_15*P2C1S3J2_15- (c1c2_p2s2j2_15+c1c3_p2s2j2_15)*P2C1S2J2_15+ j1j2_p2c1s2_15*P2C1S2J1_15 - j2j3_p2c1s2_15*P2C1S2J2_15
  deriv(P2C1S2J3_15) <- age_up*P2C1S2J3_14_lag - age_up*P2C1S2J3_15_lag  + f*P1C1S2J3_15 - r*P2C1S2J3_15+ s1s2_p2c1j3_15*P2C1S1J3_15 - s2s3_p2c1j3_15*P2C1S2J3_15 + s3s2_p2c1j3_15*P2C1S3J3_15- (c1c2_p2s2j3_15+c1c3_p2s2j3_15)*P2C1S2J3_15+ j2j3_p2c1s2_15*P2C1S2J2_15 + j4j3_p2c1s2_15*P2C1S2J4_15 - j3j4_p2c1s2_15*P2C1S2J3_15
  deriv(P2C1S2J4_15) <- age_up*P2C1S2J4_14_lag - age_up*P2C1S2J4_15_lag  + f*P1C1S2J4_15 - r*P2C1S2J4_15+ s1s2_p2c1j4_15*P2C1S1J4_15 - s2s3_p2c1j4_15*P2C1S2J4_15 + s3s2_p2c1j4_15*P2C1S3J4_15- (c1c2_p2s2j4_15+c1c3_p2s2j4_15)*P2C1S2J4_15+ j3j4_p2c1s2_15*P2C1S2J3_15 - j4j3_p2c1s2_15*P2C1S2J4_15
  deriv(P2C1S3J1_15) <- age_up*P2C1S3J1_14_lag - age_up*P2C1S3J1_15_lag  + f*P1C1S3J1_15 - r*P2C1S3J1_15+ s2s3_p2c1j1_15*P2C1S2J1_15 - s3s2_p2c1j1_15*P2C1S3J1_15- (c1c2_p2s3j1_15+c1c3_p2s3j1_15)*P2C1S3J1_15- j1j2_p2c1s3_15*P2C1S3J1_15
  deriv(P2C1S3J2_15) <- age_up*P2C1S3J2_14_lag - age_up*P2C1S3J2_15_lag  + f*P1C1S3J2_15 - r*P2C1S3J2_15+ s2s3_p2c1j2_15*P2C1S2J2_15 - s3s2_p2c1j2_15*P2C1S3J2_15- (c1c2_p2s3j2_15+c1c3_p2s3j2_15)*P2C1S3J2_15+ j1j2_p2c1s3_15*P2C1S3J1_15 - j2j3_p2c1s3_15*P2C1S3J2_15
  deriv(P2C1S3J3_15) <- age_up*P2C1S3J3_14_lag - age_up*P2C1S3J3_15_lag  + f*P1C1S3J3_15 - r*P2C1S3J3_15+ s2s3_p2c1j3_15*P2C1S2J3_15 - s3s2_p2c1j3_15*P2C1S3J3_15- (c1c2_p2s3j3_15+c1c3_p2s3j3_15)*P2C1S3J3_15+ j2j3_p2c1s3_15*P2C1S3J2_15 + j4j3_p2c1s3_15*P2C1S3J4_15 - j3j4_p2c1s3_15*P2C1S3J3_15
  deriv(P2C1S3J4_15) <- age_up*P2C1S3J4_14_lag - age_up*P2C1S3J4_15_lag  + f*P1C1S3J4_15 - r*P2C1S3J4_15+ s2s3_p2c1j4_15*P2C1S2J4_15 - s3s2_p2c1j4_15*P2C1S3J4_15- (c1c2_p2s3j4_15+c1c3_p2s3j4_15)*P2C1S3J4_15+ j3j4_p2c1s3_15*P2C1S3J3_15 - j4j3_p2c1s3_15*P2C1S3J4_15
  deriv(P2C2S1J1_15) <- age_up*P2C2S1J1_14_lag - age_up*P2C2S1J1_15_lag  + f*P1C2S1J1_15 - r*P2C2S1J1_15- s1s2_p2c2j1_15*P2C2S1J1_15+ c1c2_p2s1j1_15*P2C1S1J1_15 + c3c2_p2s1j1_15*P2C3S1J1_15 + c4c2_p2s1j1_15*P2C4S1J1_15 - (c2c3_p2s1j1_15+c2c4_p2s1j1_15)*P2C2S1J1_15- j1j2_p2c2s1_15*P2C2S1J1_15
  deriv(P2C2S1J2_15) <- age_up*P2C2S1J2_14_lag - age_up*P2C2S1J2_15_lag  + f*P1C2S1J2_15 - r*P2C2S1J2_15- s1s2_p2c2j2_15*P2C2S1J2_15+ c1c2_p2s1j2_15*P2C1S1J2_15 + c3c2_p2s1j2_15*P2C3S1J2_15 + c4c2_p2s1j2_15*P2C4S1J2_15 - (c2c3_p2s1j2_15+c2c4_p2s1j2_15)*P2C2S1J2_15+ j1j2_p2c2s1_15*P2C2S1J1_15 - j2j3_p2c2s1_15*P2C2S1J2_15
  deriv(P2C2S1J3_15) <- age_up*P2C2S1J3_14_lag - age_up*P2C2S1J3_15_lag  + f*P1C2S1J3_15 - r*P2C2S1J3_15- s1s2_p2c2j3_15*P2C2S1J3_15+ c1c2_p2s1j3_15*P2C1S1J3_15 + c3c2_p2s1j3_15*P2C3S1J3_15 + c4c2_p2s1j3_15*P2C4S1J3_15 - (c2c3_p2s1j3_15+c2c4_p2s1j3_15)*P2C2S1J3_15+ j2j3_p2c2s1_15*P2C2S1J2_15 + j4j3_p2c2s1_15*P2C2S1J4_15 - j3j4_p2c2s1_15*P2C2S1J3_15
  deriv(P2C2S1J4_15) <- age_up*P2C2S1J4_14_lag - age_up*P2C2S1J4_15_lag  + f*P1C2S1J4_15 - r*P2C2S1J4_15- s1s2_p2c2j4_15*P2C2S1J4_15+ c1c2_p2s1j4_15*P2C1S1J4_15 + c3c2_p2s1j4_15*P2C3S1J4_15 + c4c2_p2s1j4_15*P2C4S1J4_15 - (c2c3_p2s1j4_15+c2c4_p2s1j4_15)*P2C2S1J4_15+ j3j4_p2c2s1_15*P2C2S1J3_15 - j4j3_p2c2s1_15*P2C2S1J4_15
  deriv(P2C2S2J1_15) <- age_up*P2C2S2J1_14_lag - age_up*P2C2S2J1_15_lag  + f*P1C2S2J1_15 - r*P2C2S2J1_15+ s1s2_p2c2j1_15*P2C2S1J1_15 - s2s3_p2c2j1_15*P2C2S2J1_15 + s3s2_p2c2j1_15*P2C2S3J1_15+ c1c2_p2s2j1_15*P2C1S2J1_15 + c3c2_p2s2j1_15*P2C3S2J1_15 + c4c2_p2s2j1_15*P2C4S2J1_15 - (c2c3_p2s2j1_15+c2c4_p2s2j1_15)*P2C2S2J1_15- j1j2_p2c2s2_15*P2C2S2J1_15
  deriv(P2C2S2J2_15) <- age_up*P2C2S2J2_14_lag - age_up*P2C2S2J2_15_lag  + f*P1C2S2J2_15 - r*P2C2S2J2_15+ s1s2_p2c2j2_15*P2C2S1J2_15 - s2s3_p2c2j2_15*P2C2S2J2_15 + s3s2_p2c2j2_15*P2C2S3J2_15+ c1c2_p2s2j2_15*P2C1S2J2_15 + c3c2_p2s2j2_15*P2C3S2J2_15 + c4c2_p2s2j2_15*P2C4S2J2_15 - (c2c3_p2s2j2_15+c2c4_p2s2j2_15)*P2C2S2J2_15+ j1j2_p2c2s2_15*P2C2S2J1_15 - j2j3_p2c2s2_15*P2C2S2J2_15
  deriv(P2C2S2J3_15) <- age_up*P2C2S2J3_14_lag - age_up*P2C2S2J3_15_lag  + f*P1C2S2J3_15 - r*P2C2S2J3_15+ s1s2_p2c2j3_15*P2C2S1J3_15 - s2s3_p2c2j3_15*P2C2S2J3_15 + s3s2_p2c2j3_15*P2C2S3J3_15+ c1c2_p2s2j3_15*P2C1S2J3_15 + c3c2_p2s2j3_15*P2C3S2J3_15 + c4c2_p2s2j3_15*P2C4S2J3_15 - (c2c3_p2s2j3_15+c2c4_p2s2j3_15)*P2C2S2J3_15+ j2j3_p2c2s2_15*P2C2S2J2_15 + j4j3_p2c2s2_15*P2C2S2J4_15 - j3j4_p2c2s2_15*P2C2S2J3_15
  deriv(P2C2S2J4_15) <- age_up*P2C2S2J4_14_lag - age_up*P2C2S2J4_15_lag  + f*P1C2S2J4_15 - r*P2C2S2J4_15+ s1s2_p2c2j4_15*P2C2S1J4_15 - s2s3_p2c2j4_15*P2C2S2J4_15 + s3s2_p2c2j4_15*P2C2S3J4_15+ c1c2_p2s2j4_15*P2C1S2J4_15 + c3c2_p2s2j4_15*P2C3S2J4_15 + c4c2_p2s2j4_15*P2C4S2J4_15 - (c2c3_p2s2j4_15+c2c4_p2s2j4_15)*P2C2S2J4_15+ j3j4_p2c2s2_15*P2C2S2J3_15 - j4j3_p2c2s2_15*P2C2S2J4_15
  deriv(P2C2S3J1_15) <- age_up*P2C2S3J1_14_lag - age_up*P2C2S3J1_15_lag  + f*P1C2S3J1_15 - r*P2C2S3J1_15+ s2s3_p2c2j1_15*P2C2S2J1_15 - s3s2_p2c2j1_15*P2C2S3J1_15+ c1c2_p2s3j1_15*P2C1S3J1_15 + c3c2_p2s3j1_15*P2C3S3J1_15 + c4c2_p2s3j1_15*P2C4S3J1_15 - (c2c3_p2s3j1_15+c2c4_p2s3j1_15)*P2C2S3J1_15- j1j2_p2c2s3_15*P2C2S3J1_15
  deriv(P2C2S3J2_15) <- age_up*P2C2S3J2_14_lag - age_up*P2C2S3J2_15_lag  + f*P1C2S3J2_15 - r*P2C2S3J2_15+ s2s3_p2c2j2_15*P2C2S2J2_15 - s3s2_p2c2j2_15*P2C2S3J2_15+ c1c2_p2s3j2_15*P2C1S3J2_15 + c3c2_p2s3j2_15*P2C3S3J2_15 + c4c2_p2s3j2_15*P2C4S3J2_15 - (c2c3_p2s3j2_15+c2c4_p2s3j2_15)*P2C2S3J2_15+ j1j2_p2c2s3_15*P2C2S3J1_15 - j2j3_p2c2s3_15*P2C2S3J2_15
  deriv(P2C2S3J3_15) <- age_up*P2C2S3J3_14_lag - age_up*P2C2S3J3_15_lag  + f*P1C2S3J3_15 - r*P2C2S3J3_15+ s2s3_p2c2j3_15*P2C2S2J3_15 - s3s2_p2c2j3_15*P2C2S3J3_15+ c1c2_p2s3j3_15*P2C1S3J3_15 + c3c2_p2s3j3_15*P2C3S3J3_15 + c4c2_p2s3j3_15*P2C4S3J3_15 - (c2c3_p2s3j3_15+c2c4_p2s3j3_15)*P2C2S3J3_15+ j2j3_p2c2s3_15*P2C2S3J2_15 + j4j3_p2c2s3_15*P2C2S3J4_15 - j3j4_p2c2s3_15*P2C2S3J3_15
  deriv(P2C2S3J4_15) <- age_up*P2C2S3J4_14_lag - age_up*P2C2S3J4_15_lag  + f*P1C2S3J4_15 - r*P2C2S3J4_15+ s2s3_p2c2j4_15*P2C2S2J4_15 - s3s2_p2c2j4_15*P2C2S3J4_15+ c1c2_p2s3j4_15*P2C1S3J4_15 + c3c2_p2s3j4_15*P2C3S3J4_15 + c4c2_p2s3j4_15*P2C4S3J4_15 - (c2c3_p2s3j4_15+c2c4_p2s3j4_15)*P2C2S3J4_15+ j3j4_p2c2s3_15*P2C2S3J3_15 - j4j3_p2c2s3_15*P2C2S3J4_15
  deriv(P2C3S1J1_15) <- age_up*P2C3S1J1_14_lag - age_up*P2C3S1J1_15_lag  + f*P1C3S1J1_15 - r*P2C3S1J1_15- s1s2_p2c3j1_15*P2C3S1J1_15+ c1c3_p2s1j1_15*P2C1S1J1_15+ c2c3_p2s1j1_15*P2C2S1J1_15 + c4c3_p2s1j1_15*P2C4S1J1_15 - (c3c2_p2s1j1_15+c3c4_p2s1j1_15)*P2C3S1J1_15- j1j2_p2c3s1_15*P2C3S1J1_15
  deriv(P2C3S1J2_15) <- age_up*P2C3S1J2_14_lag - age_up*P2C3S1J2_15_lag  + f*P1C3S1J2_15 - r*P2C3S1J2_15- s1s2_p2c3j2_15*P2C3S1J2_15+ c1c3_p2s1j2_15*P2C1S1J2_15+ c2c3_p2s1j2_15*P2C2S1J2_15 + c4c3_p2s1j2_15*P2C4S1J2_15 - (c3c2_p2s1j2_15+c3c4_p2s1j2_15)*P2C3S1J2_15+ j1j2_p2c3s1_15*P2C3S1J1_15 - j2j3_p2c3s1_15*P2C3S1J2_15
  deriv(P2C3S1J3_15) <- age_up*P2C3S1J3_14_lag - age_up*P2C3S1J3_15_lag  + f*P1C3S1J3_15 - r*P2C3S1J3_15- s1s2_p2c3j3_15*P2C3S1J3_15+ c1c3_p2s1j3_15*P2C1S1J3_15+ c2c3_p2s1j3_15*P2C2S1J3_15 + c4c3_p2s1j3_15*P2C4S1J3_15 - (c3c2_p2s1j3_15+c3c4_p2s1j3_15)*P2C3S1J3_15+ j2j3_p2c3s1_15*P2C3S1J2_15 + j4j3_p2c3s1_15*P2C3S1J4_15 - j3j4_p2c3s1_15*P2C3S1J3_15
  deriv(P2C3S1J4_15) <- age_up*P2C3S1J4_14_lag - age_up*P2C3S1J4_15_lag  + f*P1C3S1J4_15 - r*P2C3S1J4_15- s1s2_p2c3j4_15*P2C3S1J4_15+ c1c3_p2s1j4_15*P2C1S1J4_15+ c2c3_p2s1j4_15*P2C2S1J4_15 + c4c3_p2s1j4_15*P2C4S1J4_15 - (c3c2_p2s1j4_15+c3c4_p2s1j4_15)*P2C3S1J4_15+ j3j4_p2c3s1_15*P2C3S1J3_15 - j4j3_p2c3s1_15*P2C3S1J4_15
  deriv(P2C3S2J1_15) <- age_up*P2C3S2J1_14_lag - age_up*P2C3S2J1_15_lag  + f*P1C3S2J1_15 - r*P2C3S2J1_15+ s1s2_p2c3j1_15*P2C3S1J1_15 - s2s3_p2c3j1_15*P2C3S2J1_15 + s3s2_p2c3j1_15*P2C3S3J1_15+ c1c3_p2s2j1_15*P2C1S2J1_15+ c2c3_p2s2j1_15*P2C2S2J1_15 + c4c3_p2s2j1_15*P2C4S2J1_15 - (c3c2_p2s2j1_15+c3c4_p2s2j1_15)*P2C3S2J1_15- j1j2_p2c3s2_15*P2C3S2J1_15
  deriv(P2C3S2J2_15) <- age_up*P2C3S2J2_14_lag - age_up*P2C3S2J2_15_lag  + f*P1C3S2J2_15 - r*P2C3S2J2_15+ s1s2_p2c3j2_15*P2C3S1J2_15 - s2s3_p2c3j2_15*P2C3S2J2_15 + s3s2_p2c3j2_15*P2C3S3J2_15+ c1c3_p2s2j2_15*P2C1S2J2_15+ c2c3_p2s2j2_15*P2C2S2J2_15 + c4c3_p2s2j2_15*P2C4S2J2_15 - (c3c2_p2s2j2_15+c3c4_p2s2j2_15)*P2C3S2J2_15+ j1j2_p2c3s2_15*P2C3S2J1_15 - j2j3_p2c3s2_15*P2C3S2J2_15
  deriv(P2C3S2J3_15) <- age_up*P2C3S2J3_14_lag - age_up*P2C3S2J3_15_lag  + f*P1C3S2J3_15 - r*P2C3S2J3_15+ s1s2_p2c3j3_15*P2C3S1J3_15 - s2s3_p2c3j3_15*P2C3S2J3_15 + s3s2_p2c3j3_15*P2C3S3J3_15+ c1c3_p2s2j3_15*P2C1S2J3_15+ c2c3_p2s2j3_15*P2C2S2J3_15 + c4c3_p2s2j3_15*P2C4S2J3_15 - (c3c2_p2s2j3_15+c3c4_p2s2j3_15)*P2C3S2J3_15+ j2j3_p2c3s2_15*P2C3S2J2_15 + j4j3_p2c3s2_15*P2C3S2J4_15 - j3j4_p2c3s2_15*P2C3S2J3_15
  deriv(P2C3S2J4_15) <- age_up*P2C3S2J4_14_lag - age_up*P2C3S2J4_15_lag  + f*P1C3S2J4_15 - r*P2C3S2J4_15+ s1s2_p2c3j4_15*P2C3S1J4_15 - s2s3_p2c3j4_15*P2C3S2J4_15 + s3s2_p2c3j4_15*P2C3S3J4_15+ c1c3_p2s2j4_15*P2C1S2J4_15+ c2c3_p2s2j4_15*P2C2S2J4_15 + c4c3_p2s2j4_15*P2C4S2J4_15 - (c3c2_p2s2j4_15+c3c4_p2s2j4_15)*P2C3S2J4_15+ j3j4_p2c3s2_15*P2C3S2J3_15 - j4j3_p2c3s2_15*P2C3S2J4_15
  deriv(P2C3S3J1_15) <- age_up*P2C3S3J1_14_lag - age_up*P2C3S3J1_15_lag  + f*P1C3S3J1_15 - r*P2C3S3J1_15+ s2s3_p2c3j1_15*P2C3S2J1_15 - s3s2_p2c3j1_15*P2C3S3J1_15+ c1c3_p2s3j1_15*P2C1S3J1_15+ c2c3_p2s3j1_15*P2C2S3J1_15 + c4c3_p2s3j1_15*P2C4S3J1_15 - (c3c2_p2s3j1_15+c3c4_p2s3j1_15)*P2C3S3J1_15- j1j2_p2c3s3_15*P2C3S3J1_15
  deriv(P2C3S3J2_15) <- age_up*P2C3S3J2_14_lag - age_up*P2C3S3J2_15_lag  + f*P1C3S3J2_15 - r*P2C3S3J2_15+ s2s3_p2c3j2_15*P2C3S2J2_15 - s3s2_p2c3j2_15*P2C3S3J2_15+ c1c3_p2s3j2_15*P2C1S3J2_15+ c2c3_p2s3j2_15*P2C2S3J2_15 + c4c3_p2s3j2_15*P2C4S3J2_15 - (c3c2_p2s3j2_15+c3c4_p2s3j2_15)*P2C3S3J2_15+ j1j2_p2c3s3_15*P2C3S3J1_15 - j2j3_p2c3s3_15*P2C3S3J2_15
  deriv(P2C3S3J3_15) <- age_up*P2C3S3J3_14_lag - age_up*P2C3S3J3_15_lag  + f*P1C3S3J3_15 - r*P2C3S3J3_15+ s2s3_p2c3j3_15*P2C3S2J3_15 - s3s2_p2c3j3_15*P2C3S3J3_15+ c1c3_p2s3j3_15*P2C1S3J3_15+ c2c3_p2s3j3_15*P2C2S3J3_15 + c4c3_p2s3j3_15*P2C4S3J3_15 - (c3c2_p2s3j3_15+c3c4_p2s3j3_15)*P2C3S3J3_15+ j2j3_p2c3s3_15*P2C3S3J2_15 + j4j3_p2c3s3_15*P2C3S3J4_15 - j3j4_p2c3s3_15*P2C3S3J3_15
  deriv(P2C3S3J4_15) <- age_up*P2C3S3J4_14_lag - age_up*P2C3S3J4_15_lag  + f*P1C3S3J4_15 - r*P2C3S3J4_15+ s2s3_p2c3j4_15*P2C3S2J4_15 - s3s2_p2c3j4_15*P2C3S3J4_15+ c1c3_p2s3j4_15*P2C1S3J4_15+ c2c3_p2s3j4_15*P2C2S3J4_15 + c4c3_p2s3j4_15*P2C4S3J4_15 - (c3c2_p2s3j4_15+c3c4_p2s3j4_15)*P2C3S3J4_15+ j3j4_p2c3s3_15*P2C3S3J3_15 - j4j3_p2c3s3_15*P2C3S3J4_15
  deriv(P2C4S1J1_15) <- age_up*P2C4S1J1_14_lag - age_up*P2C4S1J1_15_lag  + f*P1C4S1J1_15 - r*P2C4S1J1_15- s1s2_p2c4j1_15*P2C4S1J1_15+ c2c4_p2s1j1_15*P2C2S1J1_15 + c3c4_p2s1j1_15*P2C3S1J1_15- (c4c2_p2s1j1_15+c4c3_p2s1j1_15)*P2C4S1J1_15- j1j2_p2c4s1_15*P2C4S1J1_15
  deriv(P2C4S1J2_15) <- age_up*P2C4S1J2_14_lag - age_up*P2C4S1J2_15_lag  + f*P1C4S1J2_15 - r*P2C4S1J2_15- s1s2_p2c4j2_15*P2C4S1J2_15+ c2c4_p2s1j2_15*P2C2S1J2_15 + c3c4_p2s1j2_15*P2C3S1J2_15- (c4c2_p2s1j2_15+c4c3_p2s1j2_15)*P2C4S1J2_15+ j1j2_p2c4s1_15*P2C4S1J1_15 - j2j3_p2c4s1_15*P2C4S1J2_15
  deriv(P2C4S1J3_15) <- age_up*P2C4S1J3_14_lag - age_up*P2C4S1J3_15_lag  + f*P1C4S1J3_15 - r*P2C4S1J3_15- s1s2_p2c4j3_15*P2C4S1J3_15+ c2c4_p2s1j3_15*P2C2S1J3_15 + c3c4_p2s1j3_15*P2C3S1J3_15- (c4c2_p2s1j3_15+c4c3_p2s1j3_15)*P2C4S1J3_15+ j2j3_p2c4s1_15*P2C4S1J2_15 + j4j3_p2c4s1_15*P2C4S1J4_15 - j3j4_p2c4s1_15*P2C4S1J3_15
  deriv(P2C4S1J4_15) <- age_up*P2C4S1J4_14_lag - age_up*P2C4S1J4_15_lag  + f*P1C4S1J4_15 - r*P2C4S1J4_15- s1s2_p2c4j4_15*P2C4S1J4_15+ c2c4_p2s1j4_15*P2C2S1J4_15 + c3c4_p2s1j4_15*P2C3S1J4_15- (c4c2_p2s1j4_15+c4c3_p2s1j4_15)*P2C4S1J4_15+ j3j4_p2c4s1_15*P2C4S1J3_15 - j4j3_p2c4s1_15*P2C4S1J4_15
  deriv(P2C4S2J1_15) <- age_up*P2C4S2J1_14_lag - age_up*P2C4S2J1_15_lag  + f*P1C4S2J1_15 - r*P2C4S2J1_15+ s1s2_p2c4j1_15*P2C4S1J1_15 - s2s3_p2c4j1_15*P2C4S2J1_15 + s3s2_p2c4j1_15*P2C4S3J1_15+ c2c4_p2s2j1_15*P2C2S2J1_15 + c3c4_p2s2j1_15*P2C3S2J1_15- (c4c2_p2s2j1_15+c4c3_p2s2j1_15)*P2C4S2J1_15- j1j2_p2c4s2_15*P2C4S2J1_15
  deriv(P2C4S2J2_15) <- age_up*P2C4S2J2_14_lag - age_up*P2C4S2J2_15_lag  + f*P1C4S2J2_15 - r*P2C4S2J2_15+ s1s2_p2c4j2_15*P2C4S1J2_15 - s2s3_p2c4j2_15*P2C4S2J2_15 + s3s2_p2c4j2_15*P2C4S3J2_15+ c2c4_p2s2j2_15*P2C2S2J2_15 + c3c4_p2s2j2_15*P2C3S2J2_15- (c4c2_p2s2j2_15+c4c3_p2s2j2_15)*P2C4S2J2_15+ j1j2_p2c4s2_15*P2C4S2J1_15 - j2j3_p2c4s2_15*P2C4S2J2_15
  deriv(P2C4S2J3_15) <- age_up*P2C4S2J3_14_lag - age_up*P2C4S2J3_15_lag  + f*P1C4S2J3_15 - r*P2C4S2J3_15+ s1s2_p2c4j3_15*P2C4S1J3_15 - s2s3_p2c4j3_15*P2C4S2J3_15 + s3s2_p2c4j3_15*P2C4S3J3_15+ c2c4_p2s2j3_15*P2C2S2J3_15 + c3c4_p2s2j3_15*P2C3S2J3_15- (c4c2_p2s2j3_15+c4c3_p2s2j3_15)*P2C4S2J3_15+ j2j3_p2c4s2_15*P2C4S2J2_15 + j4j3_p2c4s2_15*P2C4S2J4_15 - j3j4_p2c4s2_15*P2C4S2J3_15
  deriv(P2C4S2J4_15) <- age_up*P2C4S2J4_14_lag - age_up*P2C4S2J4_15_lag  + f*P1C4S2J4_15 - r*P2C4S2J4_15+ s1s2_p2c4j4_15*P2C4S1J4_15 - s2s3_p2c4j4_15*P2C4S2J4_15 + s3s2_p2c4j4_15*P2C4S3J4_15+ c2c4_p2s2j4_15*P2C2S2J4_15 + c3c4_p2s2j4_15*P2C3S2J4_15- (c4c2_p2s2j4_15+c4c3_p2s2j4_15)*P2C4S2J4_15+ j3j4_p2c4s2_15*P2C4S2J3_15 - j4j3_p2c4s2_15*P2C4S2J4_15
  deriv(P2C4S3J1_15) <- age_up*P2C4S3J1_14_lag - age_up*P2C4S3J1_15_lag  + f*P1C4S3J1_15 - r*P2C4S3J1_15+ s2s3_p2c4j1_15*P2C4S2J1_15 - s3s2_p2c4j1_15*P2C4S3J1_15+ c2c4_p2s3j1_15*P2C2S3J1_15 + c3c4_p2s3j1_15*P2C3S3J1_15- (c4c2_p2s3j1_15+c4c3_p2s3j1_15)*P2C4S3J1_15- j1j2_p2c4s3_15*P2C4S3J1_15
  deriv(P2C4S3J2_15) <- age_up*P2C4S3J2_14_lag - age_up*P2C4S3J2_15_lag  + f*P1C4S3J2_15 - r*P2C4S3J2_15+ s2s3_p2c4j2_15*P2C4S2J2_15 - s3s2_p2c4j2_15*P2C4S3J2_15+ c2c4_p2s3j2_15*P2C2S3J2_15 + c3c4_p2s3j2_15*P2C3S3J2_15- (c4c2_p2s3j2_15+c4c3_p2s3j2_15)*P2C4S3J2_15+ j1j2_p2c4s3_15*P2C4S3J1_15 - j2j3_p2c4s3_15*P2C4S3J2_15
  deriv(P2C4S3J3_15) <- age_up*P2C4S3J3_14_lag - age_up*P2C4S3J3_15_lag  + f*P1C4S3J3_15 - r*P2C4S3J3_15+ s2s3_p2c4j3_15*P2C4S2J3_15 - s3s2_p2c4j3_15*P2C4S3J3_15+ c2c4_p2s3j3_15*P2C2S3J3_15 + c3c4_p2s3j3_15*P2C3S3J3_15- (c4c2_p2s3j3_15+c4c3_p2s3j3_15)*P2C4S3J3_15+ j2j3_p2c4s3_15*P2C4S3J2_15 + j4j3_p2c4s3_15*P2C4S3J4_15 - j3j4_p2c4s3_15*P2C4S3J3_15
  deriv(P2C4S3J4_15) <- age_up*P2C4S3J4_14_lag - age_up*P2C4S3J4_15_lag  + f*P1C4S3J4_15 - r*P2C4S3J4_15+ s2s3_p2c4j4_15*P2C4S2J4_15 - s3s2_p2c4j4_15*P2C4S3J4_15+ c2c4_p2s3j4_15*P2C2S3J4_15 + c3c4_p2s3j4_15*P2C3S3J4_15- (c4c2_p2s3j4_15+c4c3_p2s3j4_15)*P2C4S3J4_15+ j3j4_p2c4s3_15*P2C4S3J3_15 - j4j3_p2c4s3_15*P2C4S3J4_15
  deriv(P1C1S1J1_16) <- age_up*(1-neet16_p1c1s1j1)*P1C1S1J1_15_lag - age_up*P1C1S1J1_16_lag + r*P2C1S1J1_16 - f*P1C1S1J1_16- s1s2_p1c1j1_16*P1C1S1J1_16- (c1c2_p1s1j1_16+c1c3_p1s1j1_16)*P1C1S1J1_16- j1j2_p1c1s1_16*P1C1S1J1_16
  deriv(P1C1S1J2_16) <- age_up*(1-neet16_p1c1s1j2)*P1C1S1J2_15_lag - age_up*P1C1S1J2_16_lag + r*P2C1S1J2_16 - f*P1C1S1J2_16- s1s2_p1c1j2_16*P1C1S1J2_16- (c1c2_p1s1j2_16+c1c3_p1s1j2_16)*P1C1S1J2_16+ j1j2_p1c1s1_16*P1C1S1J1_16 - j2j3_p1c1s1_16*P1C1S1J2_16
  deriv(P1C1S1J3_16) <- age_up*(1-neet16_p1c1s1j3)*P1C1S1J3_15_lag - age_up*P1C1S1J3_16_lag + r*P2C1S1J3_16 - f*P1C1S1J3_16- s1s2_p1c1j3_16*P1C1S1J3_16- (c1c2_p1s1j3_16+c1c3_p1s1j3_16)*P1C1S1J3_16+ j2j3_p1c1s1_16*P1C1S1J2_16 + j4j3_p1c1s1_16*P1C1S1J4_16 - j3j4_p1c1s1_16*P1C1S1J3_16
  deriv(P1C1S1J4_16) <- age_up*(1-neet16_p1c1s1j4)*P1C1S1J4_15_lag - age_up*P1C1S1J4_16_lag + r*P2C1S1J4_16 - f*P1C1S1J4_16- s1s2_p1c1j4_16*P1C1S1J4_16- (c1c2_p1s1j4_16+c1c3_p1s1j4_16)*P1C1S1J4_16+ j3j4_p1c1s1_16*P1C1S1J3_16 - j4j3_p1c1s1_16*P1C1S1J4_16
  deriv(P1C1S2J1_16) <- age_up*(neet16_p1c1s2j1*P1C1S2J1_15_lag+neet16_p1c1s1j1*P1C1S1J1_15_lag+neet16_p1c1s3j1*P1C1S3J1_15_lag) - age_up*P1C1S2J1_16_lag + r*P2C1S2J1_16 - f*P1C1S2J1_16+ s1s2_p1c1j1_16*P1C1S1J1_16 - s2s3_p1c1j1_16*P1C1S2J1_16 + s3s2_p1c1j1_16*P1C1S3J1_16- (c1c2_p1s2j1_16+c1c3_p1s2j1_16)*P1C1S2J1_16- j1j2_p1c1s2_16*P1C1S2J1_16
  deriv(P1C1S2J2_16) <- age_up*(neet16_p1c1s2j2*P1C1S2J2_15_lag+neet16_p1c1s1j2*P1C1S1J2_15_lag+neet16_p1c1s3j2*P1C1S3J2_15_lag) - age_up*P1C1S2J2_16_lag + r*P2C1S2J2_16 - f*P1C1S2J2_16+ s1s2_p1c1j2_16*P1C1S1J2_16 - s2s3_p1c1j2_16*P1C1S2J2_16 + s3s2_p1c1j2_16*P1C1S3J2_16- (c1c2_p1s2j2_16+c1c3_p1s2j2_16)*P1C1S2J2_16+ j1j2_p1c1s2_16*P1C1S2J1_16 - j2j3_p1c1s2_16*P1C1S2J2_16
  deriv(P1C1S2J3_16) <- age_up*(neet16_p1c1s2j3*P1C1S2J3_15_lag+neet16_p1c1s1j3*P1C1S1J3_15_lag+neet16_p1c1s3j3*P1C1S3J3_15_lag) - age_up*P1C1S2J3_16_lag + r*P2C1S2J3_16 - f*P1C1S2J3_16+ s1s2_p1c1j3_16*P1C1S1J3_16 - s2s3_p1c1j3_16*P1C1S2J3_16 + s3s2_p1c1j3_16*P1C1S3J3_16- (c1c2_p1s2j3_16+c1c3_p1s2j3_16)*P1C1S2J3_16+ j2j3_p1c1s2_16*P1C1S2J2_16 + j4j3_p1c1s2_16*P1C1S2J4_16 - j3j4_p1c1s2_16*P1C1S2J3_16
  deriv(P1C1S2J4_16) <- age_up*(neet16_p1c1s2j4*P1C1S2J4_15_lag+neet16_p1c1s1j4*P1C1S1J4_15_lag+neet16_p1c1s3j4*P1C1S3J4_15_lag) - age_up*P1C1S2J4_16_lag + r*P2C1S2J4_16 - f*P1C1S2J4_16+ s1s2_p1c1j4_16*P1C1S1J4_16 - s2s3_p1c1j4_16*P1C1S2J4_16 + s3s2_p1c1j4_16*P1C1S3J4_16- (c1c2_p1s2j4_16+c1c3_p1s2j4_16)*P1C1S2J4_16+ j3j4_p1c1s2_16*P1C1S2J3_16 - j4j3_p1c1s2_16*P1C1S2J4_16
  deriv(P1C1S3J1_16) <- age_up*((1-neet16_p1c1s3j1*P1C1S3J1_15_lag)+(1-neet16_p1c1s2j1)*P1C1S2J1_15_lag) - age_up*P1C1S3J1_16_lag + r*P2C1S3J1_16 - f*P1C1S3J1_16+ s2s3_p1c1j1_16*P1C1S2J1_16 - s3s2_p1c1j1_16*P1C1S3J1_16- (c1c2_p1s3j1_16+c1c3_p1s3j1_16)*P1C1S3J1_16- j1j2_p1c1s3_16*P1C1S3J1_16
  deriv(P1C1S3J2_16) <- age_up*((1-neet16_p1c1s3j2*P1C1S3J2_15_lag)+(1-neet16_p1c1s2j2)*P1C1S2J2_15_lag) - age_up*P1C1S3J2_16_lag + r*P2C1S3J2_16 - f*P1C1S3J2_16+ s2s3_p1c1j2_16*P1C1S2J2_16 - s3s2_p1c1j2_16*P1C1S3J2_16- (c1c2_p1s3j2_16+c1c3_p1s3j2_16)*P1C1S3J2_16+ j1j2_p1c1s3_16*P1C1S3J1_16 - j2j3_p1c1s3_16*P1C1S3J2_16
  deriv(P1C1S3J3_16) <- age_up*((1-neet16_p1c1s3j3*P1C1S3J3_15_lag)+(1-neet16_p1c1s2j3)*P1C1S2J3_15_lag) - age_up*P1C1S3J3_16_lag + r*P2C1S3J3_16 - f*P1C1S3J3_16+ s2s3_p1c1j3_16*P1C1S2J3_16 - s3s2_p1c1j3_16*P1C1S3J3_16- (c1c2_p1s3j3_16+c1c3_p1s3j3_16)*P1C1S3J3_16+ j2j3_p1c1s3_16*P1C1S3J2_16 + j4j3_p1c1s3_16*P1C1S3J4_16 - j3j4_p1c1s3_16*P1C1S3J3_16
  deriv(P1C1S3J4_16) <- age_up*((1-neet16_p1c1s3j4*P1C1S3J4_15_lag)+(1-neet16_p1c1s2j4)*P1C1S2J4_15_lag) - age_up*P1C1S3J4_16_lag + r*P2C1S3J4_16 - f*P1C1S3J4_16+ s2s3_p1c1j4_16*P1C1S2J4_16 - s3s2_p1c1j4_16*P1C1S3J4_16- (c1c2_p1s3j4_16+c1c3_p1s3j4_16)*P1C1S3J4_16+ j3j4_p1c1s3_16*P1C1S3J3_16 - j4j3_p1c1s3_16*P1C1S3J4_16
  deriv(P1C2S1J1_16) <- age_up*(1-neet16_p1c2s1j1)*P1C2S1J1_15_lag - age_up*P1C2S1J1_16_lag + r*P2C2S1J1_16 - f*P1C2S1J1_16- s1s2_p1c2j1_16*P1C2S1J1_16+ c1c2_p1s1j1_16*P1C1S1J1_16 + c3c2_p1s1j1_16*P1C3S1J1_16 + c4c2_p1s1j1_16*P1C4S1J1_16 - (c2c3_p1s1j1_16+c2c4_p1s1j1_16)*P1C2S1J1_16- j1j2_p1c2s1_16*P1C2S1J1_16
  deriv(P1C2S1J2_16) <- age_up*(1-neet16_p1c2s1j2)*P1C2S1J2_15_lag - age_up*P1C2S1J2_16_lag + r*P2C2S1J2_16 - f*P1C2S1J2_16- s1s2_p1c2j2_16*P1C2S1J2_16+ c1c2_p1s1j2_16*P1C1S1J2_16 + c3c2_p1s1j2_16*P1C3S1J2_16 + c4c2_p1s1j2_16*P1C4S1J2_16 - (c2c3_p1s1j2_16+c2c4_p1s1j2_16)*P1C2S1J2_16+ j1j2_p1c2s1_16*P1C2S1J1_16 - j2j3_p1c2s1_16*P1C2S1J2_16
  deriv(P1C2S1J3_16) <- age_up*(1-neet16_p1c2s1j3)*P1C2S1J3_15_lag - age_up*P1C2S1J3_16_lag + r*P2C2S1J3_16 - f*P1C2S1J3_16- s1s2_p1c2j3_16*P1C2S1J3_16+ c1c2_p1s1j3_16*P1C1S1J3_16 + c3c2_p1s1j3_16*P1C3S1J3_16 + c4c2_p1s1j3_16*P1C4S1J3_16 - (c2c3_p1s1j3_16+c2c4_p1s1j3_16)*P1C2S1J3_16+ j2j3_p1c2s1_16*P1C2S1J2_16 + j4j3_p1c2s1_16*P1C2S1J4_16 - j3j4_p1c2s1_16*P1C2S1J3_16
  deriv(P1C2S1J4_16) <- age_up*(1-neet16_p1c2s1j4)*P1C2S1J4_15_lag - age_up*P1C2S1J4_16_lag + r*P2C2S1J4_16 - f*P1C2S1J4_16- s1s2_p1c2j4_16*P1C2S1J4_16+ c1c2_p1s1j4_16*P1C1S1J4_16 + c3c2_p1s1j4_16*P1C3S1J4_16 + c4c2_p1s1j4_16*P1C4S1J4_16 - (c2c3_p1s1j4_16+c2c4_p1s1j4_16)*P1C2S1J4_16+ j3j4_p1c2s1_16*P1C2S1J3_16 - j4j3_p1c2s1_16*P1C2S1J4_16
  deriv(P1C2S2J1_16) <- age_up*(neet16_p1c2s2j1*P1C2S2J1_15_lag+neet16_p1c2s1j1*P1C2S1J1_15_lag+neet16_p1c2s3j1*P1C2S3J1_15_lag) - age_up*P1C2S2J1_16_lag + r*P2C2S2J1_16 - f*P1C2S2J1_16+ s1s2_p1c2j1_16*P1C2S1J1_16 - s2s3_p1c2j1_16*P1C2S2J1_16 + s3s2_p1c2j1_16*P1C2S3J1_16+ c1c2_p1s2j1_16*P1C1S2J1_16 + c3c2_p1s2j1_16*P1C3S2J1_16 + c4c2_p1s2j1_16*P1C4S2J1_16 - (c2c3_p1s2j1_16+c2c4_p1s2j1_16)*P1C2S2J1_16- j1j2_p1c2s2_16*P1C2S2J1_16
  deriv(P1C2S2J2_16) <- age_up*(neet16_p1c2s2j2*P1C2S2J2_15_lag+neet16_p1c2s1j2*P1C2S1J2_15_lag+neet16_p1c2s3j2*P1C2S3J2_15_lag) - age_up*P1C2S2J2_16_lag + r*P2C2S2J2_16 - f*P1C2S2J2_16+ s1s2_p1c2j2_16*P1C2S1J2_16 - s2s3_p1c2j2_16*P1C2S2J2_16 + s3s2_p1c2j2_16*P1C2S3J2_16+ c1c2_p1s2j2_16*P1C1S2J2_16 + c3c2_p1s2j2_16*P1C3S2J2_16 + c4c2_p1s2j2_16*P1C4S2J2_16 - (c2c3_p1s2j2_16+c2c4_p1s2j2_16)*P1C2S2J2_16+ j1j2_p1c2s2_16*P1C2S2J1_16 - j2j3_p1c2s2_16*P1C2S2J2_16
  deriv(P1C2S2J3_16) <- age_up*(neet16_p1c2s2j3*P1C2S2J3_15_lag+neet16_p1c2s1j3*P1C2S1J3_15_lag+neet16_p1c2s3j3*P1C2S3J3_15_lag) - age_up*P1C2S2J3_16_lag + r*P2C2S2J3_16 - f*P1C2S2J3_16+ s1s2_p1c2j3_16*P1C2S1J3_16 - s2s3_p1c2j3_16*P1C2S2J3_16 + s3s2_p1c2j3_16*P1C2S3J3_16+ c1c2_p1s2j3_16*P1C1S2J3_16 + c3c2_p1s2j3_16*P1C3S2J3_16 + c4c2_p1s2j3_16*P1C4S2J3_16 - (c2c3_p1s2j3_16+c2c4_p1s2j3_16)*P1C2S2J3_16+ j2j3_p1c2s2_16*P1C2S2J2_16 + j4j3_p1c2s2_16*P1C2S2J4_16 - j3j4_p1c2s2_16*P1C2S2J3_16
  deriv(P1C2S2J4_16) <- age_up*(neet16_p1c2s2j4*P1C2S2J4_15_lag+neet16_p1c2s1j4*P1C2S1J4_15_lag+neet16_p1c2s3j4*P1C2S3J4_15_lag) - age_up*P1C2S2J4_16_lag + r*P2C2S2J4_16 - f*P1C2S2J4_16+ s1s2_p1c2j4_16*P1C2S1J4_16 - s2s3_p1c2j4_16*P1C2S2J4_16 + s3s2_p1c2j4_16*P1C2S3J4_16+ c1c2_p1s2j4_16*P1C1S2J4_16 + c3c2_p1s2j4_16*P1C3S2J4_16 + c4c2_p1s2j4_16*P1C4S2J4_16 - (c2c3_p1s2j4_16+c2c4_p1s2j4_16)*P1C2S2J4_16+ j3j4_p1c2s2_16*P1C2S2J3_16 - j4j3_p1c2s2_16*P1C2S2J4_16
  deriv(P1C2S3J1_16) <- age_up*((1-neet16_p1c2s3j1*P1C2S3J1_15_lag)+(1-neet16_p1c2s2j1)*P1C2S2J1_15_lag) - age_up*P1C2S3J1_16_lag + r*P2C2S3J1_16 - f*P1C2S3J1_16+ s2s3_p1c2j1_16*P1C2S2J1_16 - s3s2_p1c2j1_16*P1C2S3J1_16+ c1c2_p1s3j1_16*P1C1S3J1_16 + c3c2_p1s3j1_16*P1C3S3J1_16 + c4c2_p1s3j1_16*P1C4S3J1_16 - (c2c3_p1s3j1_16+c2c4_p1s3j1_16)*P1C2S3J1_16- j1j2_p1c2s3_16*P1C2S3J1_16
  deriv(P1C2S3J2_16) <- age_up*((1-neet16_p1c2s3j2*P1C2S3J2_15_lag)+(1-neet16_p1c2s2j2)*P1C2S2J2_15_lag) - age_up*P1C2S3J2_16_lag + r*P2C2S3J2_16 - f*P1C2S3J2_16+ s2s3_p1c2j2_16*P1C2S2J2_16 - s3s2_p1c2j2_16*P1C2S3J2_16+ c1c2_p1s3j2_16*P1C1S3J2_16 + c3c2_p1s3j2_16*P1C3S3J2_16 + c4c2_p1s3j2_16*P1C4S3J2_16 - (c2c3_p1s3j2_16+c2c4_p1s3j2_16)*P1C2S3J2_16+ j1j2_p1c2s3_16*P1C2S3J1_16 - j2j3_p1c2s3_16*P1C2S3J2_16
  deriv(P1C2S3J3_16) <- age_up*((1-neet16_p1c2s3j3*P1C2S3J3_15_lag)+(1-neet16_p1c2s2j3)*P1C2S2J3_15_lag) - age_up*P1C2S3J3_16_lag + r*P2C2S3J3_16 - f*P1C2S3J3_16+ s2s3_p1c2j3_16*P1C2S2J3_16 - s3s2_p1c2j3_16*P1C2S3J3_16+ c1c2_p1s3j3_16*P1C1S3J3_16 + c3c2_p1s3j3_16*P1C3S3J3_16 + c4c2_p1s3j3_16*P1C4S3J3_16 - (c2c3_p1s3j3_16+c2c4_p1s3j3_16)*P1C2S3J3_16+ j2j3_p1c2s3_16*P1C2S3J2_16 + j4j3_p1c2s3_16*P1C2S3J4_16 - j3j4_p1c2s3_16*P1C2S3J3_16
  deriv(P1C2S3J4_16) <- age_up*((1-neet16_p1c2s3j4*P1C2S3J4_15_lag)+(1-neet16_p1c2s2j4)*P1C2S2J4_15_lag) - age_up*P1C2S3J4_16_lag + r*P2C2S3J4_16 - f*P1C2S3J4_16+ s2s3_p1c2j4_16*P1C2S2J4_16 - s3s2_p1c2j4_16*P1C2S3J4_16+ c1c2_p1s3j4_16*P1C1S3J4_16 + c3c2_p1s3j4_16*P1C3S3J4_16 + c4c2_p1s3j4_16*P1C4S3J4_16 - (c2c3_p1s3j4_16+c2c4_p1s3j4_16)*P1C2S3J4_16+ j3j4_p1c2s3_16*P1C2S3J3_16 - j4j3_p1c2s3_16*P1C2S3J4_16
  deriv(P1C3S1J1_16) <- age_up*(1-neet16_p1c3s1j1)*P1C3S1J1_15_lag - age_up*P1C3S1J1_16_lag + r*P2C3S1J1_16 - f*P1C3S1J1_16- s1s2_p1c3j1_16*P1C3S1J1_16+ c1c3_p1s1j1_16*P1C1S1J1_16+ c2c3_p1s1j1_16*P1C2S1J1_16 + c4c3_p1s1j1_16*P1C4S1J1_16 - (c3c2_p1s1j1_16+c3c4_p1s1j1_16)*P1C3S1J1_16- j1j2_p1c3s1_16*P1C3S1J1_16
  deriv(P1C3S1J2_16) <- age_up*(1-neet16_p1c3s1j2)*P1C3S1J2_15_lag - age_up*P1C3S1J2_16_lag + r*P2C3S1J2_16 - f*P1C3S1J2_16- s1s2_p1c3j2_16*P1C3S1J2_16+ c1c3_p1s1j2_16*P1C1S1J2_16+ c2c3_p1s1j2_16*P1C2S1J2_16 + c4c3_p1s1j2_16*P1C4S1J2_16 - (c3c2_p1s1j2_16+c3c4_p1s1j2_16)*P1C3S1J2_16+ j1j2_p1c3s1_16*P1C3S1J1_16 - j2j3_p1c3s1_16*P1C3S1J2_16
  deriv(P1C3S1J3_16) <- age_up*(1-neet16_p1c3s1j3)*P1C3S1J3_15_lag - age_up*P1C3S1J3_16_lag + r*P2C3S1J3_16 - f*P1C3S1J3_16- s1s2_p1c3j3_16*P1C3S1J3_16+ c1c3_p1s1j3_16*P1C1S1J3_16+ c2c3_p1s1j3_16*P1C2S1J3_16 + c4c3_p1s1j3_16*P1C4S1J3_16 - (c3c2_p1s1j3_16+c3c4_p1s1j3_16)*P1C3S1J3_16+ j2j3_p1c3s1_16*P1C3S1J2_16 + j4j3_p1c3s1_16*P1C3S1J4_16 - j3j4_p1c3s1_16*P1C3S1J3_16
  deriv(P1C3S1J4_16) <- age_up*(1-neet16_p1c3s1j4)*P1C3S1J4_15_lag - age_up*P1C3S1J4_16_lag + r*P2C3S1J4_16 - f*P1C3S1J4_16- s1s2_p1c3j4_16*P1C3S1J4_16+ c1c3_p1s1j4_16*P1C1S1J4_16+ c2c3_p1s1j4_16*P1C2S1J4_16 + c4c3_p1s1j4_16*P1C4S1J4_16 - (c3c2_p1s1j4_16+c3c4_p1s1j4_16)*P1C3S1J4_16+ j3j4_p1c3s1_16*P1C3S1J3_16 - j4j3_p1c3s1_16*P1C3S1J4_16
  deriv(P1C3S2J1_16) <- age_up*(neet16_p1c3s2j1*P1C3S2J1_15_lag+neet16_p1c3s1j1*P1C3S1J1_15_lag+neet16_p1c3s3j1*P1C3S3J1_15_lag) - age_up*P1C3S2J1_16_lag + r*P2C3S2J1_16 - f*P1C3S2J1_16+ s1s2_p1c3j1_16*P1C3S1J1_16 - s2s3_p1c3j1_16*P1C3S2J1_16 + s3s2_p1c3j1_16*P1C3S3J1_16+ c1c3_p1s2j1_16*P1C1S2J1_16+ c2c3_p1s2j1_16*P1C2S2J1_16 + c4c3_p1s2j1_16*P1C4S2J1_16 - (c3c2_p1s2j1_16+c3c4_p1s2j1_16)*P1C3S2J1_16- j1j2_p1c3s2_16*P1C3S2J1_16
  deriv(P1C3S2J2_16) <- age_up*(neet16_p1c3s2j2*P1C3S2J2_15_lag+neet16_p1c3s1j2*P1C3S1J2_15_lag+neet16_p1c3s3j2*P1C3S3J2_15_lag) - age_up*P1C3S2J2_16_lag + r*P2C3S2J2_16 - f*P1C3S2J2_16+ s1s2_p1c3j2_16*P1C3S1J2_16 - s2s3_p1c3j2_16*P1C3S2J2_16 + s3s2_p1c3j2_16*P1C3S3J2_16+ c1c3_p1s2j2_16*P1C1S2J2_16+ c2c3_p1s2j2_16*P1C2S2J2_16 + c4c3_p1s2j2_16*P1C4S2J2_16 - (c3c2_p1s2j2_16+c3c4_p1s2j2_16)*P1C3S2J2_16+ j1j2_p1c3s2_16*P1C3S2J1_16 - j2j3_p1c3s2_16*P1C3S2J2_16
  deriv(P1C3S2J3_16) <- age_up*(neet16_p1c3s2j3*P1C3S2J3_15_lag+neet16_p1c3s1j3*P1C3S1J3_15_lag+neet16_p1c3s3j3*P1C3S3J3_15_lag) - age_up*P1C3S2J3_16_lag + r*P2C3S2J3_16 - f*P1C3S2J3_16+ s1s2_p1c3j3_16*P1C3S1J3_16 - s2s3_p1c3j3_16*P1C3S2J3_16 + s3s2_p1c3j3_16*P1C3S3J3_16+ c1c3_p1s2j3_16*P1C1S2J3_16+ c2c3_p1s2j3_16*P1C2S2J3_16 + c4c3_p1s2j3_16*P1C4S2J3_16 - (c3c2_p1s2j3_16+c3c4_p1s2j3_16)*P1C3S2J3_16+ j2j3_p1c3s2_16*P1C3S2J2_16 + j4j3_p1c3s2_16*P1C3S2J4_16 - j3j4_p1c3s2_16*P1C3S2J3_16
  deriv(P1C3S2J4_16) <- age_up*(neet16_p1c3s2j4*P1C3S2J4_15_lag+neet16_p1c3s1j4*P1C3S1J4_15_lag+neet16_p1c3s3j4*P1C3S3J4_15_lag) - age_up*P1C3S2J4_16_lag + r*P2C3S2J4_16 - f*P1C3S2J4_16+ s1s2_p1c3j4_16*P1C3S1J4_16 - s2s3_p1c3j4_16*P1C3S2J4_16 + s3s2_p1c3j4_16*P1C3S3J4_16+ c1c3_p1s2j4_16*P1C1S2J4_16+ c2c3_p1s2j4_16*P1C2S2J4_16 + c4c3_p1s2j4_16*P1C4S2J4_16 - (c3c2_p1s2j4_16+c3c4_p1s2j4_16)*P1C3S2J4_16+ j3j4_p1c3s2_16*P1C3S2J3_16 - j4j3_p1c3s2_16*P1C3S2J4_16
  deriv(P1C3S3J1_16) <- age_up*((1-neet16_p1c3s3j1*P1C3S3J1_15_lag)+(1-neet16_p1c3s2j1)*P1C3S2J1_15_lag) - age_up*P1C3S3J1_16_lag + r*P2C3S3J1_16 - f*P1C3S3J1_16+ s2s3_p1c3j1_16*P1C3S2J1_16 - s3s2_p1c3j1_16*P1C3S3J1_16+ c1c3_p1s3j1_16*P1C1S3J1_16+ c2c3_p1s3j1_16*P1C2S3J1_16 + c4c3_p1s3j1_16*P1C4S3J1_16 - (c3c2_p1s3j1_16+c3c4_p1s3j1_16)*P1C3S3J1_16- j1j2_p1c3s3_16*P1C3S3J1_16
  deriv(P1C3S3J2_16) <- age_up*((1-neet16_p1c3s3j2*P1C3S3J2_15_lag)+(1-neet16_p1c3s2j2)*P1C3S2J2_15_lag) - age_up*P1C3S3J2_16_lag + r*P2C3S3J2_16 - f*P1C3S3J2_16+ s2s3_p1c3j2_16*P1C3S2J2_16 - s3s2_p1c3j2_16*P1C3S3J2_16+ c1c3_p1s3j2_16*P1C1S3J2_16+ c2c3_p1s3j2_16*P1C2S3J2_16 + c4c3_p1s3j2_16*P1C4S3J2_16 - (c3c2_p1s3j2_16+c3c4_p1s3j2_16)*P1C3S3J2_16+ j1j2_p1c3s3_16*P1C3S3J1_16 - j2j3_p1c3s3_16*P1C3S3J2_16
  deriv(P1C3S3J3_16) <- age_up*((1-neet16_p1c3s3j3*P1C3S3J3_15_lag)+(1-neet16_p1c3s2j3)*P1C3S2J3_15_lag) - age_up*P1C3S3J3_16_lag + r*P2C3S3J3_16 - f*P1C3S3J3_16+ s2s3_p1c3j3_16*P1C3S2J3_16 - s3s2_p1c3j3_16*P1C3S3J3_16+ c1c3_p1s3j3_16*P1C1S3J3_16+ c2c3_p1s3j3_16*P1C2S3J3_16 + c4c3_p1s3j3_16*P1C4S3J3_16 - (c3c2_p1s3j3_16+c3c4_p1s3j3_16)*P1C3S3J3_16+ j2j3_p1c3s3_16*P1C3S3J2_16 + j4j3_p1c3s3_16*P1C3S3J4_16 - j3j4_p1c3s3_16*P1C3S3J3_16
  deriv(P1C3S3J4_16) <- age_up*((1-neet16_p1c3s3j4*P1C3S3J4_15_lag)+(1-neet16_p1c3s2j4)*P1C3S2J4_15_lag) - age_up*P1C3S3J4_16_lag + r*P2C3S3J4_16 - f*P1C3S3J4_16+ s2s3_p1c3j4_16*P1C3S2J4_16 - s3s2_p1c3j4_16*P1C3S3J4_16+ c1c3_p1s3j4_16*P1C1S3J4_16+ c2c3_p1s3j4_16*P1C2S3J4_16 + c4c3_p1s3j4_16*P1C4S3J4_16 - (c3c2_p1s3j4_16+c3c4_p1s3j4_16)*P1C3S3J4_16+ j3j4_p1c3s3_16*P1C3S3J3_16 - j4j3_p1c3s3_16*P1C3S3J4_16
  deriv(P1C4S1J1_16) <- age_up*(1-neet16_p1c4s1j1)*P1C4S1J1_15_lag - age_up*P1C4S1J1_16_lag + r*P2C4S1J1_16 - f*P1C4S1J1_16- s1s2_p1c4j1_16*P1C4S1J1_16+ c2c4_p1s1j1_16*P1C2S1J1_16 + c3c4_p1s1j1_16*P1C3S1J1_16- (c4c2_p1s1j1_16+c4c3_p1s1j1_16)*P1C4S1J1_16- j1j2_p1c4s1_16*P1C4S1J1_16
  deriv(P1C4S1J2_16) <- age_up*(1-neet16_p1c4s1j2)*P1C4S1J2_15_lag - age_up*P1C4S1J2_16_lag + r*P2C4S1J2_16 - f*P1C4S1J2_16- s1s2_p1c4j2_16*P1C4S1J2_16+ c2c4_p1s1j2_16*P1C2S1J2_16 + c3c4_p1s1j2_16*P1C3S1J2_16- (c4c2_p1s1j2_16+c4c3_p1s1j2_16)*P1C4S1J2_16+ j1j2_p1c4s1_16*P1C4S1J1_16 - j2j3_p1c4s1_16*P1C4S1J2_16
  deriv(P1C4S1J3_16) <- age_up*(1-neet16_p1c4s1j3)*P1C4S1J3_15_lag - age_up*P1C4S1J3_16_lag + r*P2C4S1J3_16 - f*P1C4S1J3_16- s1s2_p1c4j3_16*P1C4S1J3_16+ c2c4_p1s1j3_16*P1C2S1J3_16 + c3c4_p1s1j3_16*P1C3S1J3_16- (c4c2_p1s1j3_16+c4c3_p1s1j3_16)*P1C4S1J3_16+ j2j3_p1c4s1_16*P1C4S1J2_16 + j4j3_p1c4s1_16*P1C4S1J4_16 - j3j4_p1c4s1_16*P1C4S1J3_16
  deriv(P1C4S1J4_16) <- age_up*(1-neet16_p1c4s1j4)*P1C4S1J4_15_lag - age_up*P1C4S1J4_16_lag + r*P2C4S1J4_16 - f*P1C4S1J4_16- s1s2_p1c4j4_16*P1C4S1J4_16+ c2c4_p1s1j4_16*P1C2S1J4_16 + c3c4_p1s1j4_16*P1C3S1J4_16- (c4c2_p1s1j4_16+c4c3_p1s1j4_16)*P1C4S1J4_16+ j3j4_p1c4s1_16*P1C4S1J3_16 - j4j3_p1c4s1_16*P1C4S1J4_16
  deriv(P1C4S2J1_16) <- age_up*(neet16_p1c4s2j1*P1C4S2J1_15_lag+neet16_p1c4s1j1*P1C4S1J1_15_lag+neet16_p1c4s3j1*P1C4S3J1_15_lag) - age_up*P1C4S2J1_16_lag + r*P2C4S2J1_16 - f*P1C4S2J1_16+ s1s2_p1c4j1_16*P1C4S1J1_16 - s2s3_p1c4j1_16*P1C4S2J1_16 + s3s2_p1c4j1_16*P1C4S3J1_16+ c2c4_p1s2j1_16*P1C2S2J1_16 + c3c4_p1s2j1_16*P1C3S2J1_16- (c4c2_p1s2j1_16+c4c3_p1s2j1_16)*P1C4S2J1_16- j1j2_p1c4s2_16*P1C4S2J1_16
  deriv(P1C4S2J2_16) <- age_up*(neet16_p1c4s2j2*P1C4S2J2_15_lag+neet16_p1c4s1j2*P1C4S1J2_15_lag+neet16_p1c4s3j2*P1C4S3J2_15_lag) - age_up*P1C4S2J2_16_lag + r*P2C4S2J2_16 - f*P1C4S2J2_16+ s1s2_p1c4j2_16*P1C4S1J2_16 - s2s3_p1c4j2_16*P1C4S2J2_16 + s3s2_p1c4j2_16*P1C4S3J2_16+ c2c4_p1s2j2_16*P1C2S2J2_16 + c3c4_p1s2j2_16*P1C3S2J2_16- (c4c2_p1s2j2_16+c4c3_p1s2j2_16)*P1C4S2J2_16+ j1j2_p1c4s2_16*P1C4S2J1_16 - j2j3_p1c4s2_16*P1C4S2J2_16
  deriv(P1C4S2J3_16) <- age_up*(neet16_p1c4s2j3*P1C4S2J3_15_lag+neet16_p1c4s1j3*P1C4S1J3_15_lag+neet16_p1c4s3j3*P1C4S3J3_15_lag) - age_up*P1C4S2J3_16_lag + r*P2C4S2J3_16 - f*P1C4S2J3_16+ s1s2_p1c4j3_16*P1C4S1J3_16 - s2s3_p1c4j3_16*P1C4S2J3_16 + s3s2_p1c4j3_16*P1C4S3J3_16+ c2c4_p1s2j3_16*P1C2S2J3_16 + c3c4_p1s2j3_16*P1C3S2J3_16- (c4c2_p1s2j3_16+c4c3_p1s2j3_16)*P1C4S2J3_16+ j2j3_p1c4s2_16*P1C4S2J2_16 + j4j3_p1c4s2_16*P1C4S2J4_16 - j3j4_p1c4s2_16*P1C4S2J3_16
  deriv(P1C4S2J4_16) <- age_up*(neet16_p1c4s2j4*P1C4S2J4_15_lag+neet16_p1c4s1j4*P1C4S1J4_15_lag+neet16_p1c4s3j4*P1C4S3J4_15_lag) - age_up*P1C4S2J4_16_lag + r*P2C4S2J4_16 - f*P1C4S2J4_16+ s1s2_p1c4j4_16*P1C4S1J4_16 - s2s3_p1c4j4_16*P1C4S2J4_16 + s3s2_p1c4j4_16*P1C4S3J4_16+ c2c4_p1s2j4_16*P1C2S2J4_16 + c3c4_p1s2j4_16*P1C3S2J4_16- (c4c2_p1s2j4_16+c4c3_p1s2j4_16)*P1C4S2J4_16+ j3j4_p1c4s2_16*P1C4S2J3_16 - j4j3_p1c4s2_16*P1C4S2J4_16
  deriv(P1C4S3J1_16) <- age_up*((1-neet16_p1c4s3j1*P1C4S3J1_15_lag)+(1-neet16_p1c4s2j1)*P1C4S2J1_15_lag) - age_up*P1C4S3J1_16_lag + r*P2C4S3J1_16 - f*P1C4S3J1_16+ s2s3_p1c4j1_16*P1C4S2J1_16 - s3s2_p1c4j1_16*P1C4S3J1_16+ c2c4_p1s3j1_16*P1C2S3J1_16 + c3c4_p1s3j1_16*P1C3S3J1_16- (c4c2_p1s3j1_16+c4c3_p1s3j1_16)*P1C4S3J1_16- j1j2_p1c4s3_16*P1C4S3J1_16
  deriv(P1C4S3J2_16) <- age_up*((1-neet16_p1c4s3j2*P1C4S3J2_15_lag)+(1-neet16_p1c4s2j2)*P1C4S2J2_15_lag) - age_up*P1C4S3J2_16_lag + r*P2C4S3J2_16 - f*P1C4S3J2_16+ s2s3_p1c4j2_16*P1C4S2J2_16 - s3s2_p1c4j2_16*P1C4S3J2_16+ c2c4_p1s3j2_16*P1C2S3J2_16 + c3c4_p1s3j2_16*P1C3S3J2_16- (c4c2_p1s3j2_16+c4c3_p1s3j2_16)*P1C4S3J2_16+ j1j2_p1c4s3_16*P1C4S3J1_16 - j2j3_p1c4s3_16*P1C4S3J2_16
  deriv(P1C4S3J3_16) <- age_up*((1-neet16_p1c4s3j3*P1C4S3J3_15_lag)+(1-neet16_p1c4s2j3)*P1C4S2J3_15_lag) - age_up*P1C4S3J3_16_lag + r*P2C4S3J3_16 - f*P1C4S3J3_16+ s2s3_p1c4j3_16*P1C4S2J3_16 - s3s2_p1c4j3_16*P1C4S3J3_16+ c2c4_p1s3j3_16*P1C2S3J3_16 + c3c4_p1s3j3_16*P1C3S3J3_16- (c4c2_p1s3j3_16+c4c3_p1s3j3_16)*P1C4S3J3_16+ j2j3_p1c4s3_16*P1C4S3J2_16 + j4j3_p1c4s3_16*P1C4S3J4_16 - j3j4_p1c4s3_16*P1C4S3J3_16
  deriv(P1C4S3J4_16) <- age_up*((1-neet16_p1c4s3j4*P1C4S3J4_15_lag)+(1-neet16_p1c4s2j4)*P1C4S2J4_15_lag) - age_up*P1C4S3J4_16_lag + r*P2C4S3J4_16 - f*P1C4S3J4_16+ s2s3_p1c4j4_16*P1C4S2J4_16 - s3s2_p1c4j4_16*P1C4S3J4_16+ c2c4_p1s3j4_16*P1C2S3J4_16 + c3c4_p1s3j4_16*P1C3S3J4_16- (c4c2_p1s3j4_16+c4c3_p1s3j4_16)*P1C4S3J4_16+ j3j4_p1c4s3_16*P1C4S3J3_16 - j4j3_p1c4s3_16*P1C4S3J4_16
  deriv(P2C1S1J1_16) <- age_up*(1-neet16_p2c1s1j1)*P2C1S1J1_15_lag - age_up*P2C1S1J1_16_lag  + f*P1C1S1J1_16 - r*P2C1S1J1_16- s1s2_p2c1j1_16*P2C1S1J1_16- (c1c2_p2s1j1_16+c1c3_p2s1j1_16)*P2C1S1J1_16- j1j2_p2c1s1_16*P2C1S1J1_16
  deriv(P2C1S1J2_16) <- age_up*(1-neet16_p2c1s1j2)*P2C1S1J2_15_lag - age_up*P2C1S1J2_16_lag  + f*P1C1S1J2_16 - r*P2C1S1J2_16- s1s2_p2c1j2_16*P2C1S1J2_16- (c1c2_p2s1j2_16+c1c3_p2s1j2_16)*P2C1S1J2_16+ j1j2_p2c1s1_16*P2C1S1J1_16 - j2j3_p2c1s1_16*P2C1S1J2_16
  deriv(P2C1S1J3_16) <- age_up*(1-neet16_p2c1s1j3)*P2C1S1J3_15_lag - age_up*P2C1S1J3_16_lag  + f*P1C1S1J3_16 - r*P2C1S1J3_16- s1s2_p2c1j3_16*P2C1S1J3_16- (c1c2_p2s1j3_16+c1c3_p2s1j3_16)*P2C1S1J3_16+ j2j3_p2c1s1_16*P2C1S1J2_16 + j4j3_p2c1s1_16*P2C1S1J4_16 - j3j4_p2c1s1_16*P2C1S1J3_16
  deriv(P2C1S1J4_16) <- age_up*(1-neet16_p2c1s1j4)*P2C1S1J4_15_lag - age_up*P2C1S1J4_16_lag  + f*P1C1S1J4_16 - r*P2C1S1J4_16- s1s2_p2c1j4_16*P2C1S1J4_16- (c1c2_p2s1j4_16+c1c3_p2s1j4_16)*P2C1S1J4_16+ j3j4_p2c1s1_16*P2C1S1J3_16 - j4j3_p2c1s1_16*P2C1S1J4_16
  deriv(P2C1S2J1_16) <- age_up*(neet16_p2c1s2j1*P2C1S2J1_15_lag+neet16_p2c1s1j1*P2C1S1J1_15_lag+neet16_p2c1s3j1*P2C1S3J1_15_lag) - age_up*P2C1S2J1_16_lag  + f*P1C1S2J1_16 - r*P2C1S2J1_16+ s1s2_p2c1j1_16*P2C1S1J1_16 - s2s3_p2c1j1_16*P2C1S2J1_16 + s3s2_p2c1j1_16*P2C1S3J1_16- (c1c2_p2s2j1_16+c1c3_p2s2j1_16)*P2C1S2J1_16- j1j2_p2c1s2_16*P2C1S2J1_16
  deriv(P2C1S2J2_16) <- age_up*(neet16_p2c1s2j2*P2C1S2J2_15_lag+neet16_p2c1s1j2*P2C1S1J2_15_lag+neet16_p2c1s3j2*P2C1S3J2_15_lag) - age_up*P2C1S2J2_16_lag  + f*P1C1S2J2_16 - r*P2C1S2J2_16+ s1s2_p2c1j2_16*P2C1S1J2_16 - s2s3_p2c1j2_16*P2C1S2J2_16 + s3s2_p2c1j2_16*P2C1S3J2_16- (c1c2_p2s2j2_16+c1c3_p2s2j2_16)*P2C1S2J2_16+ j1j2_p2c1s2_16*P2C1S2J1_16 - j2j3_p2c1s2_16*P2C1S2J2_16
  deriv(P2C1S2J3_16) <- age_up*(neet16_p2c1s2j3*P2C1S2J3_15_lag+neet16_p2c1s1j3*P2C1S1J3_15_lag+neet16_p2c1s3j3*P2C1S3J3_15_lag) - age_up*P2C1S2J3_16_lag  + f*P1C1S2J3_16 - r*P2C1S2J3_16+ s1s2_p2c1j3_16*P2C1S1J3_16 - s2s3_p2c1j3_16*P2C1S2J3_16 + s3s2_p2c1j3_16*P2C1S3J3_16- (c1c2_p2s2j3_16+c1c3_p2s2j3_16)*P2C1S2J3_16+ j2j3_p2c1s2_16*P2C1S2J2_16 + j4j3_p2c1s2_16*P2C1S2J4_16 - j3j4_p2c1s2_16*P2C1S2J3_16
  deriv(P2C1S2J4_16) <- age_up*(neet16_p2c1s2j4*P2C1S2J4_15_lag+neet16_p2c1s1j4*P2C1S1J4_15_lag+neet16_p2c1s3j4*P2C1S3J4_15_lag) - age_up*P2C1S2J4_16_lag  + f*P1C1S2J4_16 - r*P2C1S2J4_16+ s1s2_p2c1j4_16*P2C1S1J4_16 - s2s3_p2c1j4_16*P2C1S2J4_16 + s3s2_p2c1j4_16*P2C1S3J4_16- (c1c2_p2s2j4_16+c1c3_p2s2j4_16)*P2C1S2J4_16+ j3j4_p2c1s2_16*P2C1S2J3_16 - j4j3_p2c1s2_16*P2C1S2J4_16
  deriv(P2C1S3J1_16) <- age_up*((1-neet16_p2c1s3j1*P2C1S3J1_15_lag)+(1-neet16_p2c1s2j1)*P2C1S2J1_15_lag) - age_up*P2C1S3J1_16_lag  + f*P1C1S3J1_16 - r*P2C1S3J1_16+ s2s3_p2c1j1_16*P2C1S2J1_16 - s3s2_p2c1j1_16*P2C1S3J1_16- (c1c2_p2s3j1_16+c1c3_p2s3j1_16)*P2C1S3J1_16- j1j2_p2c1s3_16*P2C1S3J1_16
  deriv(P2C1S3J2_16) <- age_up*((1-neet16_p2c1s3j2*P2C1S3J2_15_lag)+(1-neet16_p2c1s2j2)*P2C1S2J2_15_lag) - age_up*P2C1S3J2_16_lag  + f*P1C1S3J2_16 - r*P2C1S3J2_16+ s2s3_p2c1j2_16*P2C1S2J2_16 - s3s2_p2c1j2_16*P2C1S3J2_16- (c1c2_p2s3j2_16+c1c3_p2s3j2_16)*P2C1S3J2_16+ j1j2_p2c1s3_16*P2C1S3J1_16 - j2j3_p2c1s3_16*P2C1S3J2_16
  deriv(P2C1S3J3_16) <- age_up*((1-neet16_p2c1s3j3*P2C1S3J3_15_lag)+(1-neet16_p2c1s2j3)*P2C1S2J3_15_lag) - age_up*P2C1S3J3_16_lag  + f*P1C1S3J3_16 - r*P2C1S3J3_16+ s2s3_p2c1j3_16*P2C1S2J3_16 - s3s2_p2c1j3_16*P2C1S3J3_16- (c1c2_p2s3j3_16+c1c3_p2s3j3_16)*P2C1S3J3_16+ j2j3_p2c1s3_16*P2C1S3J2_16 + j4j3_p2c1s3_16*P2C1S3J4_16 - j3j4_p2c1s3_16*P2C1S3J3_16
  deriv(P2C1S3J4_16) <- age_up*((1-neet16_p2c1s3j4*P2C1S3J4_15_lag)+(1-neet16_p2c1s2j4)*P2C1S2J4_15_lag) - age_up*P2C1S3J4_16_lag  + f*P1C1S3J4_16 - r*P2C1S3J4_16+ s2s3_p2c1j4_16*P2C1S2J4_16 - s3s2_p2c1j4_16*P2C1S3J4_16- (c1c2_p2s3j4_16+c1c3_p2s3j4_16)*P2C1S3J4_16+ j3j4_p2c1s3_16*P2C1S3J3_16 - j4j3_p2c1s3_16*P2C1S3J4_16
  deriv(P2C2S1J1_16) <- age_up*(1-neet16_p2c2s1j1)*P2C2S1J1_15_lag - age_up*P2C2S1J1_16_lag  + f*P1C2S1J1_16 - r*P2C2S1J1_16- s1s2_p2c2j1_16*P2C2S1J1_16+ c1c2_p2s1j1_16*P2C1S1J1_16 + c3c2_p2s1j1_16*P2C3S1J1_16 + c4c2_p2s1j1_16*P2C4S1J1_16 - (c2c3_p2s1j1_16+c2c4_p2s1j1_16)*P2C2S1J1_16- j1j2_p2c2s1_16*P2C2S1J1_16
  deriv(P2C2S1J2_16) <- age_up*(1-neet16_p2c2s1j2)*P2C2S1J2_15_lag - age_up*P2C2S1J2_16_lag  + f*P1C2S1J2_16 - r*P2C2S1J2_16- s1s2_p2c2j2_16*P2C2S1J2_16+ c1c2_p2s1j2_16*P2C1S1J2_16 + c3c2_p2s1j2_16*P2C3S1J2_16 + c4c2_p2s1j2_16*P2C4S1J2_16 - (c2c3_p2s1j2_16+c2c4_p2s1j2_16)*P2C2S1J2_16+ j1j2_p2c2s1_16*P2C2S1J1_16 - j2j3_p2c2s1_16*P2C2S1J2_16
  deriv(P2C2S1J3_16) <- age_up*(1-neet16_p2c2s1j3)*P2C2S1J3_15_lag - age_up*P2C2S1J3_16_lag  + f*P1C2S1J3_16 - r*P2C2S1J3_16- s1s2_p2c2j3_16*P2C2S1J3_16+ c1c2_p2s1j3_16*P2C1S1J3_16 + c3c2_p2s1j3_16*P2C3S1J3_16 + c4c2_p2s1j3_16*P2C4S1J3_16 - (c2c3_p2s1j3_16+c2c4_p2s1j3_16)*P2C2S1J3_16+ j2j3_p2c2s1_16*P2C2S1J2_16 + j4j3_p2c2s1_16*P2C2S1J4_16 - j3j4_p2c2s1_16*P2C2S1J3_16
  deriv(P2C2S1J4_16) <- age_up*(1-neet16_p2c2s1j4)*P2C2S1J4_15_lag - age_up*P2C2S1J4_16_lag  + f*P1C2S1J4_16 - r*P2C2S1J4_16- s1s2_p2c2j4_16*P2C2S1J4_16+ c1c2_p2s1j4_16*P2C1S1J4_16 + c3c2_p2s1j4_16*P2C3S1J4_16 + c4c2_p2s1j4_16*P2C4S1J4_16 - (c2c3_p2s1j4_16+c2c4_p2s1j4_16)*P2C2S1J4_16+ j3j4_p2c2s1_16*P2C2S1J3_16 - j4j3_p2c2s1_16*P2C2S1J4_16
  deriv(P2C2S2J1_16) <- age_up*(neet16_p2c2s2j1*P2C2S2J1_15_lag+neet16_p2c2s1j1*P2C2S1J1_15_lag+neet16_p2c2s3j1*P2C2S3J1_15_lag) - age_up*P2C2S2J1_16_lag  + f*P1C2S2J1_16 - r*P2C2S2J1_16+ s1s2_p2c2j1_16*P2C2S1J1_16 - s2s3_p2c2j1_16*P2C2S2J1_16 + s3s2_p2c2j1_16*P2C2S3J1_16+ c1c2_p2s2j1_16*P2C1S2J1_16 + c3c2_p2s2j1_16*P2C3S2J1_16 + c4c2_p2s2j1_16*P2C4S2J1_16 - (c2c3_p2s2j1_16+c2c4_p2s2j1_16)*P2C2S2J1_16- j1j2_p2c2s2_16*P2C2S2J1_16
  deriv(P2C2S2J2_16) <- age_up*(neet16_p2c2s2j2*P2C2S2J2_15_lag+neet16_p2c2s1j2*P2C2S1J2_15_lag+neet16_p2c2s3j2*P2C2S3J2_15_lag) - age_up*P2C2S2J2_16_lag  + f*P1C2S2J2_16 - r*P2C2S2J2_16+ s1s2_p2c2j2_16*P2C2S1J2_16 - s2s3_p2c2j2_16*P2C2S2J2_16 + s3s2_p2c2j2_16*P2C2S3J2_16+ c1c2_p2s2j2_16*P2C1S2J2_16 + c3c2_p2s2j2_16*P2C3S2J2_16 + c4c2_p2s2j2_16*P2C4S2J2_16 - (c2c3_p2s2j2_16+c2c4_p2s2j2_16)*P2C2S2J2_16+ j1j2_p2c2s2_16*P2C2S2J1_16 - j2j3_p2c2s2_16*P2C2S2J2_16
  deriv(P2C2S2J3_16) <- age_up*(neet16_p2c2s2j3*P2C2S2J3_15_lag+neet16_p2c2s1j3*P2C2S1J3_15_lag+neet16_p2c2s3j3*P2C2S3J3_15_lag) - age_up*P2C2S2J3_16_lag  + f*P1C2S2J3_16 - r*P2C2S2J3_16+ s1s2_p2c2j3_16*P2C2S1J3_16 - s2s3_p2c2j3_16*P2C2S2J3_16 + s3s2_p2c2j3_16*P2C2S3J3_16+ c1c2_p2s2j3_16*P2C1S2J3_16 + c3c2_p2s2j3_16*P2C3S2J3_16 + c4c2_p2s2j3_16*P2C4S2J3_16 - (c2c3_p2s2j3_16+c2c4_p2s2j3_16)*P2C2S2J3_16+ j2j3_p2c2s2_16*P2C2S2J2_16 + j4j3_p2c2s2_16*P2C2S2J4_16 - j3j4_p2c2s2_16*P2C2S2J3_16
  deriv(P2C2S2J4_16) <- age_up*(neet16_p2c2s2j4*P2C2S2J4_15_lag+neet16_p2c2s1j4*P2C2S1J4_15_lag+neet16_p2c2s3j4*P2C2S3J4_15_lag) - age_up*P2C2S2J4_16_lag  + f*P1C2S2J4_16 - r*P2C2S2J4_16+ s1s2_p2c2j4_16*P2C2S1J4_16 - s2s3_p2c2j4_16*P2C2S2J4_16 + s3s2_p2c2j4_16*P2C2S3J4_16+ c1c2_p2s2j4_16*P2C1S2J4_16 + c3c2_p2s2j4_16*P2C3S2J4_16 + c4c2_p2s2j4_16*P2C4S2J4_16 - (c2c3_p2s2j4_16+c2c4_p2s2j4_16)*P2C2S2J4_16+ j3j4_p2c2s2_16*P2C2S2J3_16 - j4j3_p2c2s2_16*P2C2S2J4_16
  deriv(P2C2S3J1_16) <- age_up*((1-neet16_p2c2s3j1*P2C2S3J1_15_lag)+(1-neet16_p2c2s2j1)*P2C2S2J1_15_lag) - age_up*P2C2S3J1_16_lag  + f*P1C2S3J1_16 - r*P2C2S3J1_16+ s2s3_p2c2j1_16*P2C2S2J1_16 - s3s2_p2c2j1_16*P2C2S3J1_16+ c1c2_p2s3j1_16*P2C1S3J1_16 + c3c2_p2s3j1_16*P2C3S3J1_16 + c4c2_p2s3j1_16*P2C4S3J1_16 - (c2c3_p2s3j1_16+c2c4_p2s3j1_16)*P2C2S3J1_16- j1j2_p2c2s3_16*P2C2S3J1_16
  deriv(P2C2S3J2_16) <- age_up*((1-neet16_p2c2s3j2*P2C2S3J2_15_lag)+(1-neet16_p2c2s2j2)*P2C2S2J2_15_lag) - age_up*P2C2S3J2_16_lag  + f*P1C2S3J2_16 - r*P2C2S3J2_16+ s2s3_p2c2j2_16*P2C2S2J2_16 - s3s2_p2c2j2_16*P2C2S3J2_16+ c1c2_p2s3j2_16*P2C1S3J2_16 + c3c2_p2s3j2_16*P2C3S3J2_16 + c4c2_p2s3j2_16*P2C4S3J2_16 - (c2c3_p2s3j2_16+c2c4_p2s3j2_16)*P2C2S3J2_16+ j1j2_p2c2s3_16*P2C2S3J1_16 - j2j3_p2c2s3_16*P2C2S3J2_16
  deriv(P2C2S3J3_16) <- age_up*((1-neet16_p2c2s3j3*P2C2S3J3_15_lag)+(1-neet16_p2c2s2j3)*P2C2S2J3_15_lag) - age_up*P2C2S3J3_16_lag  + f*P1C2S3J3_16 - r*P2C2S3J3_16+ s2s3_p2c2j3_16*P2C2S2J3_16 - s3s2_p2c2j3_16*P2C2S3J3_16+ c1c2_p2s3j3_16*P2C1S3J3_16 + c3c2_p2s3j3_16*P2C3S3J3_16 + c4c2_p2s3j3_16*P2C4S3J3_16 - (c2c3_p2s3j3_16+c2c4_p2s3j3_16)*P2C2S3J3_16+ j2j3_p2c2s3_16*P2C2S3J2_16 + j4j3_p2c2s3_16*P2C2S3J4_16 - j3j4_p2c2s3_16*P2C2S3J3_16
  deriv(P2C2S3J4_16) <- age_up*((1-neet16_p2c2s3j4*P2C2S3J4_15_lag)+(1-neet16_p2c2s2j4)*P2C2S2J4_15_lag) - age_up*P2C2S3J4_16_lag  + f*P1C2S3J4_16 - r*P2C2S3J4_16+ s2s3_p2c2j4_16*P2C2S2J4_16 - s3s2_p2c2j4_16*P2C2S3J4_16+ c1c2_p2s3j4_16*P2C1S3J4_16 + c3c2_p2s3j4_16*P2C3S3J4_16 + c4c2_p2s3j4_16*P2C4S3J4_16 - (c2c3_p2s3j4_16+c2c4_p2s3j4_16)*P2C2S3J4_16+ j3j4_p2c2s3_16*P2C2S3J3_16 - j4j3_p2c2s3_16*P2C2S3J4_16
  deriv(P2C3S1J1_16) <- age_up*(1-neet16_p2c3s1j1)*P2C3S1J1_15_lag - age_up*P2C3S1J1_16_lag  + f*P1C3S1J1_16 - r*P2C3S1J1_16- s1s2_p2c3j1_16*P2C3S1J1_16+ c1c3_p2s1j1_16*P2C1S1J1_16+ c2c3_p2s1j1_16*P2C2S1J1_16 + c4c3_p2s1j1_16*P2C4S1J1_16 - (c3c2_p2s1j1_16+c3c4_p2s1j1_16)*P2C3S1J1_16- j1j2_p2c3s1_16*P2C3S1J1_16
  deriv(P2C3S1J2_16) <- age_up*(1-neet16_p2c3s1j2)*P2C3S1J2_15_lag - age_up*P2C3S1J2_16_lag  + f*P1C3S1J2_16 - r*P2C3S1J2_16- s1s2_p2c3j2_16*P2C3S1J2_16+ c1c3_p2s1j2_16*P2C1S1J2_16+ c2c3_p2s1j2_16*P2C2S1J2_16 + c4c3_p2s1j2_16*P2C4S1J2_16 - (c3c2_p2s1j2_16+c3c4_p2s1j2_16)*P2C3S1J2_16+ j1j2_p2c3s1_16*P2C3S1J1_16 - j2j3_p2c3s1_16*P2C3S1J2_16
  deriv(P2C3S1J3_16) <- age_up*(1-neet16_p2c3s1j3)*P2C3S1J3_15_lag - age_up*P2C3S1J3_16_lag  + f*P1C3S1J3_16 - r*P2C3S1J3_16- s1s2_p2c3j3_16*P2C3S1J3_16+ c1c3_p2s1j3_16*P2C1S1J3_16+ c2c3_p2s1j3_16*P2C2S1J3_16 + c4c3_p2s1j3_16*P2C4S1J3_16 - (c3c2_p2s1j3_16+c3c4_p2s1j3_16)*P2C3S1J3_16+ j2j3_p2c3s1_16*P2C3S1J2_16 + j4j3_p2c3s1_16*P2C3S1J4_16 - j3j4_p2c3s1_16*P2C3S1J3_16
  deriv(P2C3S1J4_16) <- age_up*(1-neet16_p2c3s1j4)*P2C3S1J4_15_lag - age_up*P2C3S1J4_16_lag  + f*P1C3S1J4_16 - r*P2C3S1J4_16- s1s2_p2c3j4_16*P2C3S1J4_16+ c1c3_p2s1j4_16*P2C1S1J4_16+ c2c3_p2s1j4_16*P2C2S1J4_16 + c4c3_p2s1j4_16*P2C4S1J4_16 - (c3c2_p2s1j4_16+c3c4_p2s1j4_16)*P2C3S1J4_16+ j3j4_p2c3s1_16*P2C3S1J3_16 - j4j3_p2c3s1_16*P2C3S1J4_16
  deriv(P2C3S2J1_16) <- age_up*(neet16_p2c3s2j1*P2C3S2J1_15_lag+neet16_p2c3s1j1*P2C3S1J1_15_lag+neet16_p2c3s3j1*P2C3S3J1_15_lag) - age_up*P2C3S2J1_16_lag  + f*P1C3S2J1_16 - r*P2C3S2J1_16+ s1s2_p2c3j1_16*P2C3S1J1_16 - s2s3_p2c3j1_16*P2C3S2J1_16 + s3s2_p2c3j1_16*P2C3S3J1_16+ c1c3_p2s2j1_16*P2C1S2J1_16+ c2c3_p2s2j1_16*P2C2S2J1_16 + c4c3_p2s2j1_16*P2C4S2J1_16 - (c3c2_p2s2j1_16+c3c4_p2s2j1_16)*P2C3S2J1_16- j1j2_p2c3s2_16*P2C3S2J1_16
  deriv(P2C3S2J2_16) <- age_up*(neet16_p2c3s2j2*P2C3S2J2_15_lag+neet16_p2c3s1j2*P2C3S1J2_15_lag+neet16_p2c3s3j2*P2C3S3J2_15_lag) - age_up*P2C3S2J2_16_lag  + f*P1C3S2J2_16 - r*P2C3S2J2_16+ s1s2_p2c3j2_16*P2C3S1J2_16 - s2s3_p2c3j2_16*P2C3S2J2_16 + s3s2_p2c3j2_16*P2C3S3J2_16+ c1c3_p2s2j2_16*P2C1S2J2_16+ c2c3_p2s2j2_16*P2C2S2J2_16 + c4c3_p2s2j2_16*P2C4S2J2_16 - (c3c2_p2s2j2_16+c3c4_p2s2j2_16)*P2C3S2J2_16+ j1j2_p2c3s2_16*P2C3S2J1_16 - j2j3_p2c3s2_16*P2C3S2J2_16
  deriv(P2C3S2J3_16) <- age_up*(neet16_p2c3s2j3*P2C3S2J3_15_lag+neet16_p2c3s1j3*P2C3S1J3_15_lag+neet16_p2c3s3j3*P2C3S3J3_15_lag) - age_up*P2C3S2J3_16_lag  + f*P1C3S2J3_16 - r*P2C3S2J3_16+ s1s2_p2c3j3_16*P2C3S1J3_16 - s2s3_p2c3j3_16*P2C3S2J3_16 + s3s2_p2c3j3_16*P2C3S3J3_16+ c1c3_p2s2j3_16*P2C1S2J3_16+ c2c3_p2s2j3_16*P2C2S2J3_16 + c4c3_p2s2j3_16*P2C4S2J3_16 - (c3c2_p2s2j3_16+c3c4_p2s2j3_16)*P2C3S2J3_16+ j2j3_p2c3s2_16*P2C3S2J2_16 + j4j3_p2c3s2_16*P2C3S2J4_16 - j3j4_p2c3s2_16*P2C3S2J3_16
  deriv(P2C3S2J4_16) <- age_up*(neet16_p2c3s2j4*P2C3S2J4_15_lag+neet16_p2c3s1j4*P2C3S1J4_15_lag+neet16_p2c3s3j4*P2C3S3J4_15_lag) - age_up*P2C3S2J4_16_lag  + f*P1C3S2J4_16 - r*P2C3S2J4_16+ s1s2_p2c3j4_16*P2C3S1J4_16 - s2s3_p2c3j4_16*P2C3S2J4_16 + s3s2_p2c3j4_16*P2C3S3J4_16+ c1c3_p2s2j4_16*P2C1S2J4_16+ c2c3_p2s2j4_16*P2C2S2J4_16 + c4c3_p2s2j4_16*P2C4S2J4_16 - (c3c2_p2s2j4_16+c3c4_p2s2j4_16)*P2C3S2J4_16+ j3j4_p2c3s2_16*P2C3S2J3_16 - j4j3_p2c3s2_16*P2C3S2J4_16
  deriv(P2C3S3J1_16) <- age_up*((1-neet16_p2c3s3j1*P2C3S3J1_15_lag)+(1-neet16_p2c3s2j1)*P2C3S2J1_15_lag) - age_up*P2C3S3J1_16_lag  + f*P1C3S3J1_16 - r*P2C3S3J1_16+ s2s3_p2c3j1_16*P2C3S2J1_16 - s3s2_p2c3j1_16*P2C3S3J1_16+ c1c3_p2s3j1_16*P2C1S3J1_16+ c2c3_p2s3j1_16*P2C2S3J1_16 + c4c3_p2s3j1_16*P2C4S3J1_16 - (c3c2_p2s3j1_16+c3c4_p2s3j1_16)*P2C3S3J1_16- j1j2_p2c3s3_16*P2C3S3J1_16
  deriv(P2C3S3J2_16) <- age_up*((1-neet16_p2c3s3j2*P2C3S3J2_15_lag)+(1-neet16_p2c3s2j2)*P2C3S2J2_15_lag) - age_up*P2C3S3J2_16_lag  + f*P1C3S3J2_16 - r*P2C3S3J2_16+ s2s3_p2c3j2_16*P2C3S2J2_16 - s3s2_p2c3j2_16*P2C3S3J2_16+ c1c3_p2s3j2_16*P2C1S3J2_16+ c2c3_p2s3j2_16*P2C2S3J2_16 + c4c3_p2s3j2_16*P2C4S3J2_16 - (c3c2_p2s3j2_16+c3c4_p2s3j2_16)*P2C3S3J2_16+ j1j2_p2c3s3_16*P2C3S3J1_16 - j2j3_p2c3s3_16*P2C3S3J2_16
  deriv(P2C3S3J3_16) <- age_up*((1-neet16_p2c3s3j3*P2C3S3J3_15_lag)+(1-neet16_p2c3s2j3)*P2C3S2J3_15_lag) - age_up*P2C3S3J3_16_lag  + f*P1C3S3J3_16 - r*P2C3S3J3_16+ s2s3_p2c3j3_16*P2C3S2J3_16 - s3s2_p2c3j3_16*P2C3S3J3_16+ c1c3_p2s3j3_16*P2C1S3J3_16+ c2c3_p2s3j3_16*P2C2S3J3_16 + c4c3_p2s3j3_16*P2C4S3J3_16 - (c3c2_p2s3j3_16+c3c4_p2s3j3_16)*P2C3S3J3_16+ j2j3_p2c3s3_16*P2C3S3J2_16 + j4j3_p2c3s3_16*P2C3S3J4_16 - j3j4_p2c3s3_16*P2C3S3J3_16
  deriv(P2C3S3J4_16) <- age_up*((1-neet16_p2c3s3j4*P2C3S3J4_15_lag)+(1-neet16_p2c3s2j4)*P2C3S2J4_15_lag) - age_up*P2C3S3J4_16_lag  + f*P1C3S3J4_16 - r*P2C3S3J4_16+ s2s3_p2c3j4_16*P2C3S2J4_16 - s3s2_p2c3j4_16*P2C3S3J4_16+ c1c3_p2s3j4_16*P2C1S3J4_16+ c2c3_p2s3j4_16*P2C2S3J4_16 + c4c3_p2s3j4_16*P2C4S3J4_16 - (c3c2_p2s3j4_16+c3c4_p2s3j4_16)*P2C3S3J4_16+ j3j4_p2c3s3_16*P2C3S3J3_16 - j4j3_p2c3s3_16*P2C3S3J4_16
  deriv(P2C4S1J1_16) <- age_up*(1-neet16_p2c4s1j1)*P2C4S1J1_15_lag - age_up*P2C4S1J1_16_lag  + f*P1C4S1J1_16 - r*P2C4S1J1_16- s1s2_p2c4j1_16*P2C4S1J1_16+ c2c4_p2s1j1_16*P2C2S1J1_16 + c3c4_p2s1j1_16*P2C3S1J1_16- (c4c2_p2s1j1_16+c4c3_p2s1j1_16)*P2C4S1J1_16- j1j2_p2c4s1_16*P2C4S1J1_16
  deriv(P2C4S1J2_16) <- age_up*(1-neet16_p2c4s1j2)*P2C4S1J2_15_lag - age_up*P2C4S1J2_16_lag  + f*P1C4S1J2_16 - r*P2C4S1J2_16- s1s2_p2c4j2_16*P2C4S1J2_16+ c2c4_p2s1j2_16*P2C2S1J2_16 + c3c4_p2s1j2_16*P2C3S1J2_16- (c4c2_p2s1j2_16+c4c3_p2s1j2_16)*P2C4S1J2_16+ j1j2_p2c4s1_16*P2C4S1J1_16 - j2j3_p2c4s1_16*P2C4S1J2_16
  deriv(P2C4S1J3_16) <- age_up*(1-neet16_p2c4s1j3)*P2C4S1J3_15_lag - age_up*P2C4S1J3_16_lag  + f*P1C4S1J3_16 - r*P2C4S1J3_16- s1s2_p2c4j3_16*P2C4S1J3_16+ c2c4_p2s1j3_16*P2C2S1J3_16 + c3c4_p2s1j3_16*P2C3S1J3_16- (c4c2_p2s1j3_16+c4c3_p2s1j3_16)*P2C4S1J3_16+ j2j3_p2c4s1_16*P2C4S1J2_16 + j4j3_p2c4s1_16*P2C4S1J4_16 - j3j4_p2c4s1_16*P2C4S1J3_16
  deriv(P2C4S1J4_16) <- age_up*(1-neet16_p2c4s1j4)*P2C4S1J4_15_lag - age_up*P2C4S1J4_16_lag  + f*P1C4S1J4_16 - r*P2C4S1J4_16- s1s2_p2c4j4_16*P2C4S1J4_16+ c2c4_p2s1j4_16*P2C2S1J4_16 + c3c4_p2s1j4_16*P2C3S1J4_16- (c4c2_p2s1j4_16+c4c3_p2s1j4_16)*P2C4S1J4_16+ j3j4_p2c4s1_16*P2C4S1J3_16 - j4j3_p2c4s1_16*P2C4S1J4_16
  deriv(P2C4S2J1_16) <- age_up*(neet16_p2c4s2j1*P2C4S2J1_15_lag+neet16_p2c4s1j1*P2C4S1J1_15_lag+neet16_p2c4s3j1*P2C4S3J1_15_lag) - age_up*P2C4S2J1_16_lag  + f*P1C4S2J1_16 - r*P2C4S2J1_16+ s1s2_p2c4j1_16*P2C4S1J1_16 - s2s3_p2c4j1_16*P2C4S2J1_16 + s3s2_p2c4j1_16*P2C4S3J1_16+ c2c4_p2s2j1_16*P2C2S2J1_16 + c3c4_p2s2j1_16*P2C3S2J1_16- (c4c2_p2s2j1_16+c4c3_p2s2j1_16)*P2C4S2J1_16- j1j2_p2c4s2_16*P2C4S2J1_16
  deriv(P2C4S2J2_16) <- age_up*(neet16_p2c4s2j2*P2C4S2J2_15_lag+neet16_p2c4s1j2*P2C4S1J2_15_lag+neet16_p2c4s3j2*P2C4S3J2_15_lag) - age_up*P2C4S2J2_16_lag  + f*P1C4S2J2_16 - r*P2C4S2J2_16+ s1s2_p2c4j2_16*P2C4S1J2_16 - s2s3_p2c4j2_16*P2C4S2J2_16 + s3s2_p2c4j2_16*P2C4S3J2_16+ c2c4_p2s2j2_16*P2C2S2J2_16 + c3c4_p2s2j2_16*P2C3S2J2_16- (c4c2_p2s2j2_16+c4c3_p2s2j2_16)*P2C4S2J2_16+ j1j2_p2c4s2_16*P2C4S2J1_16 - j2j3_p2c4s2_16*P2C4S2J2_16
  deriv(P2C4S2J3_16) <- age_up*(neet16_p2c4s2j3*P2C4S2J3_15_lag+neet16_p2c4s1j3*P2C4S1J3_15_lag+neet16_p2c4s3j3*P2C4S3J3_15_lag) - age_up*P2C4S2J3_16_lag  + f*P1C4S2J3_16 - r*P2C4S2J3_16+ s1s2_p2c4j3_16*P2C4S1J3_16 - s2s3_p2c4j3_16*P2C4S2J3_16 + s3s2_p2c4j3_16*P2C4S3J3_16+ c2c4_p2s2j3_16*P2C2S2J3_16 + c3c4_p2s2j3_16*P2C3S2J3_16- (c4c2_p2s2j3_16+c4c3_p2s2j3_16)*P2C4S2J3_16+ j2j3_p2c4s2_16*P2C4S2J2_16 + j4j3_p2c4s2_16*P2C4S2J4_16 - j3j4_p2c4s2_16*P2C4S2J3_16
  deriv(P2C4S2J4_16) <- age_up*(neet16_p2c4s2j4*P2C4S2J4_15_lag+neet16_p2c4s1j4*P2C4S1J4_15_lag+neet16_p2c4s3j4*P2C4S3J4_15_lag) - age_up*P2C4S2J4_16_lag  + f*P1C4S2J4_16 - r*P2C4S2J4_16+ s1s2_p2c4j4_16*P2C4S1J4_16 - s2s3_p2c4j4_16*P2C4S2J4_16 + s3s2_p2c4j4_16*P2C4S3J4_16+ c2c4_p2s2j4_16*P2C2S2J4_16 + c3c4_p2s2j4_16*P2C3S2J4_16- (c4c2_p2s2j4_16+c4c3_p2s2j4_16)*P2C4S2J4_16+ j3j4_p2c4s2_16*P2C4S2J3_16 - j4j3_p2c4s2_16*P2C4S2J4_16
  deriv(P2C4S3J1_16) <- age_up*((1-neet16_p2c4s3j1*P2C4S3J1_15_lag)+(1-neet16_p2c4s2j1)*P2C4S2J1_15_lag) - age_up*P2C4S3J1_16_lag  + f*P1C4S3J1_16 - r*P2C4S3J1_16+ s2s3_p2c4j1_16*P2C4S2J1_16 - s3s2_p2c4j1_16*P2C4S3J1_16+ c2c4_p2s3j1_16*P2C2S3J1_16 + c3c4_p2s3j1_16*P2C3S3J1_16- (c4c2_p2s3j1_16+c4c3_p2s3j1_16)*P2C4S3J1_16- j1j2_p2c4s3_16*P2C4S3J1_16
  deriv(P2C4S3J2_16) <- age_up*((1-neet16_p2c4s3j2*P2C4S3J2_15_lag)+(1-neet16_p2c4s2j2)*P2C4S2J2_15_lag) - age_up*P2C4S3J2_16_lag  + f*P1C4S3J2_16 - r*P2C4S3J2_16+ s2s3_p2c4j2_16*P2C4S2J2_16 - s3s2_p2c4j2_16*P2C4S3J2_16+ c2c4_p2s3j2_16*P2C2S3J2_16 + c3c4_p2s3j2_16*P2C3S3J2_16- (c4c2_p2s3j2_16+c4c3_p2s3j2_16)*P2C4S3J2_16+ j1j2_p2c4s3_16*P2C4S3J1_16 - j2j3_p2c4s3_16*P2C4S3J2_16
  deriv(P2C4S3J3_16) <- age_up*((1-neet16_p2c4s3j3*P2C4S3J3_15_lag)+(1-neet16_p2c4s2j3)*P2C4S2J3_15_lag) - age_up*P2C4S3J3_16_lag  + f*P1C4S3J3_16 - r*P2C4S3J3_16+ s2s3_p2c4j3_16*P2C4S2J3_16 - s3s2_p2c4j3_16*P2C4S3J3_16+ c2c4_p2s3j3_16*P2C2S3J3_16 + c3c4_p2s3j3_16*P2C3S3J3_16- (c4c2_p2s3j3_16+c4c3_p2s3j3_16)*P2C4S3J3_16+ j2j3_p2c4s3_16*P2C4S3J2_16 + j4j3_p2c4s3_16*P2C4S3J4_16 - j3j4_p2c4s3_16*P2C4S3J3_16
  deriv(P2C4S3J4_16) <- age_up*((1-neet16_p2c4s3j4*P2C4S3J4_15_lag)+(1-neet16_p2c4s2j4)*P2C4S2J4_15_lag) - age_up*P2C4S3J4_16_lag  + f*P1C4S3J4_16 - r*P2C4S3J4_16+ s2s3_p2c4j4_16*P2C4S2J4_16 - s3s2_p2c4j4_16*P2C4S3J4_16+ c2c4_p2s3j4_16*P2C2S3J4_16 + c3c4_p2s3j4_16*P2C3S3J4_16- (c4c2_p2s3j4_16+c4c3_p2s3j4_16)*P2C4S3J4_16+ j3j4_p2c4s3_16*P2C4S3J3_16 - j4j3_p2c4s3_16*P2C4S3J4_16
  deriv(P1C1S1J1_17) <- age_up*P1C1S1J1_16_lag - age_up*P1C1S1J1_17_lag + r*P2C1S1J1_17 - f*P1C1S1J1_17- s1s2_p1c1j1_17*P1C1S1J1_17- (c1c2_p1s1j1_17+c1c3_p1s1j1_17)*P1C1S1J1_17- j1j2_p1c1s1_17*P1C1S1J1_17
  deriv(P1C1S1J2_17) <- age_up*P1C1S1J2_16_lag - age_up*P1C1S1J2_17_lag + r*P2C1S1J2_17 - f*P1C1S1J2_17- s1s2_p1c1j2_17*P1C1S1J2_17- (c1c2_p1s1j2_17+c1c3_p1s1j2_17)*P1C1S1J2_17+ j1j2_p1c1s1_17*P1C1S1J1_17 - j2j3_p1c1s1_17*P1C1S1J2_17
  deriv(P1C1S1J3_17) <- age_up*P1C1S1J3_16_lag - age_up*P1C1S1J3_17_lag + r*P2C1S1J3_17 - f*P1C1S1J3_17- s1s2_p1c1j3_17*P1C1S1J3_17- (c1c2_p1s1j3_17+c1c3_p1s1j3_17)*P1C1S1J3_17+ j2j3_p1c1s1_17*P1C1S1J2_17 + j4j3_p1c1s1_17*P1C1S1J4_17 - j3j4_p1c1s1_17*P1C1S1J3_17
  deriv(P1C1S1J4_17) <- age_up*P1C1S1J4_16_lag - age_up*P1C1S1J4_17_lag + r*P2C1S1J4_17 - f*P1C1S1J4_17- s1s2_p1c1j4_17*P1C1S1J4_17- (c1c2_p1s1j4_17+c1c3_p1s1j4_17)*P1C1S1J4_17+ j3j4_p1c1s1_17*P1C1S1J3_17 - j4j3_p1c1s1_17*P1C1S1J4_17
  deriv(P1C1S2J1_17) <- age_up*P1C1S2J1_16_lag - age_up*P1C1S2J1_17_lag + r*P2C1S2J1_17 - f*P1C1S2J1_17+ s1s2_p1c1j1_17*P1C1S1J1_17 - s2s3_p1c1j1_17*P1C1S2J1_17 + s3s2_p1c1j1_17*P1C1S3J1_17- (c1c2_p1s2j1_17+c1c3_p1s2j1_17)*P1C1S2J1_17- j1j2_p1c1s2_17*P1C1S2J1_17
  deriv(P1C1S2J2_17) <- age_up*P1C1S2J2_16_lag - age_up*P1C1S2J2_17_lag + r*P2C1S2J2_17 - f*P1C1S2J2_17+ s1s2_p1c1j2_17*P1C1S1J2_17 - s2s3_p1c1j2_17*P1C1S2J2_17 + s3s2_p1c1j2_17*P1C1S3J2_17- (c1c2_p1s2j2_17+c1c3_p1s2j2_17)*P1C1S2J2_17+ j1j2_p1c1s2_17*P1C1S2J1_17 - j2j3_p1c1s2_17*P1C1S2J2_17
  deriv(P1C1S2J3_17) <- age_up*P1C1S2J3_16_lag - age_up*P1C1S2J3_17_lag + r*P2C1S2J3_17 - f*P1C1S2J3_17+ s1s2_p1c1j3_17*P1C1S1J3_17 - s2s3_p1c1j3_17*P1C1S2J3_17 + s3s2_p1c1j3_17*P1C1S3J3_17- (c1c2_p1s2j3_17+c1c3_p1s2j3_17)*P1C1S2J3_17+ j2j3_p1c1s2_17*P1C1S2J2_17 + j4j3_p1c1s2_17*P1C1S2J4_17 - j3j4_p1c1s2_17*P1C1S2J3_17
  deriv(P1C1S2J4_17) <- age_up*P1C1S2J4_16_lag - age_up*P1C1S2J4_17_lag + r*P2C1S2J4_17 - f*P1C1S2J4_17+ s1s2_p1c1j4_17*P1C1S1J4_17 - s2s3_p1c1j4_17*P1C1S2J4_17 + s3s2_p1c1j4_17*P1C1S3J4_17- (c1c2_p1s2j4_17+c1c3_p1s2j4_17)*P1C1S2J4_17+ j3j4_p1c1s2_17*P1C1S2J3_17 - j4j3_p1c1s2_17*P1C1S2J4_17
  deriv(P1C1S3J1_17) <- age_up*P1C1S3J1_16_lag - age_up*P1C1S3J1_17_lag + r*P2C1S3J1_17 - f*P1C1S3J1_17+ s2s3_p1c1j1_17*P1C1S2J1_17 - s3s2_p1c1j1_17*P1C1S3J1_17- (c1c2_p1s3j1_17+c1c3_p1s3j1_17)*P1C1S3J1_17- j1j2_p1c1s3_17*P1C1S3J1_17
  deriv(P1C1S3J2_17) <- age_up*P1C1S3J2_16_lag - age_up*P1C1S3J2_17_lag + r*P2C1S3J2_17 - f*P1C1S3J2_17+ s2s3_p1c1j2_17*P1C1S2J2_17 - s3s2_p1c1j2_17*P1C1S3J2_17- (c1c2_p1s3j2_17+c1c3_p1s3j2_17)*P1C1S3J2_17+ j1j2_p1c1s3_17*P1C1S3J1_17 - j2j3_p1c1s3_17*P1C1S3J2_17
  deriv(P1C1S3J3_17) <- age_up*P1C1S3J3_16_lag - age_up*P1C1S3J3_17_lag + r*P2C1S3J3_17 - f*P1C1S3J3_17+ s2s3_p1c1j3_17*P1C1S2J3_17 - s3s2_p1c1j3_17*P1C1S3J3_17- (c1c2_p1s3j3_17+c1c3_p1s3j3_17)*P1C1S3J3_17+ j2j3_p1c1s3_17*P1C1S3J2_17 + j4j3_p1c1s3_17*P1C1S3J4_17 - j3j4_p1c1s3_17*P1C1S3J3_17
  deriv(P1C1S3J4_17) <- age_up*P1C1S3J4_16_lag - age_up*P1C1S3J4_17_lag + r*P2C1S3J4_17 - f*P1C1S3J4_17+ s2s3_p1c1j4_17*P1C1S2J4_17 - s3s2_p1c1j4_17*P1C1S3J4_17- (c1c2_p1s3j4_17+c1c3_p1s3j4_17)*P1C1S3J4_17+ j3j4_p1c1s3_17*P1C1S3J3_17 - j4j3_p1c1s3_17*P1C1S3J4_17
  deriv(P1C2S1J1_17) <- age_up*P1C2S1J1_16_lag - age_up*P1C2S1J1_17_lag + r*P2C2S1J1_17 - f*P1C2S1J1_17- s1s2_p1c2j1_17*P1C2S1J1_17+ c1c2_p1s1j1_17*P1C1S1J1_17 + c3c2_p1s1j1_17*P1C3S1J1_17 + c4c2_p1s1j1_17*P1C4S1J1_17 - (c2c3_p1s1j1_17+c2c4_p1s1j1_17)*P1C2S1J1_17- j1j2_p1c2s1_17*P1C2S1J1_17
  deriv(P1C2S1J2_17) <- age_up*P1C2S1J2_16_lag - age_up*P1C2S1J2_17_lag + r*P2C2S1J2_17 - f*P1C2S1J2_17- s1s2_p1c2j2_17*P1C2S1J2_17+ c1c2_p1s1j2_17*P1C1S1J2_17 + c3c2_p1s1j2_17*P1C3S1J2_17 + c4c2_p1s1j2_17*P1C4S1J2_17 - (c2c3_p1s1j2_17+c2c4_p1s1j2_17)*P1C2S1J2_17+ j1j2_p1c2s1_17*P1C2S1J1_17 - j2j3_p1c2s1_17*P1C2S1J2_17
  deriv(P1C2S1J3_17) <- age_up*P1C2S1J3_16_lag - age_up*P1C2S1J3_17_lag + r*P2C2S1J3_17 - f*P1C2S1J3_17- s1s2_p1c2j3_17*P1C2S1J3_17+ c1c2_p1s1j3_17*P1C1S1J3_17 + c3c2_p1s1j3_17*P1C3S1J3_17 + c4c2_p1s1j3_17*P1C4S1J3_17 - (c2c3_p1s1j3_17+c2c4_p1s1j3_17)*P1C2S1J3_17+ j2j3_p1c2s1_17*P1C2S1J2_17 + j4j3_p1c2s1_17*P1C2S1J4_17 - j3j4_p1c2s1_17*P1C2S1J3_17
  deriv(P1C2S1J4_17) <- age_up*P1C2S1J4_16_lag - age_up*P1C2S1J4_17_lag + r*P2C2S1J4_17 - f*P1C2S1J4_17- s1s2_p1c2j4_17*P1C2S1J4_17+ c1c2_p1s1j4_17*P1C1S1J4_17 + c3c2_p1s1j4_17*P1C3S1J4_17 + c4c2_p1s1j4_17*P1C4S1J4_17 - (c2c3_p1s1j4_17+c2c4_p1s1j4_17)*P1C2S1J4_17+ j3j4_p1c2s1_17*P1C2S1J3_17 - j4j3_p1c2s1_17*P1C2S1J4_17
  deriv(P1C2S2J1_17) <- age_up*P1C2S2J1_16_lag - age_up*P1C2S2J1_17_lag + r*P2C2S2J1_17 - f*P1C2S2J1_17+ s1s2_p1c2j1_17*P1C2S1J1_17 - s2s3_p1c2j1_17*P1C2S2J1_17 + s3s2_p1c2j1_17*P1C2S3J1_17+ c1c2_p1s2j1_17*P1C1S2J1_17 + c3c2_p1s2j1_17*P1C3S2J1_17 + c4c2_p1s2j1_17*P1C4S2J1_17 - (c2c3_p1s2j1_17+c2c4_p1s2j1_17)*P1C2S2J1_17- j1j2_p1c2s2_17*P1C2S2J1_17
  deriv(P1C2S2J2_17) <- age_up*P1C2S2J2_16_lag - age_up*P1C2S2J2_17_lag + r*P2C2S2J2_17 - f*P1C2S2J2_17+ s1s2_p1c2j2_17*P1C2S1J2_17 - s2s3_p1c2j2_17*P1C2S2J2_17 + s3s2_p1c2j2_17*P1C2S3J2_17+ c1c2_p1s2j2_17*P1C1S2J2_17 + c3c2_p1s2j2_17*P1C3S2J2_17 + c4c2_p1s2j2_17*P1C4S2J2_17 - (c2c3_p1s2j2_17+c2c4_p1s2j2_17)*P1C2S2J2_17+ j1j2_p1c2s2_17*P1C2S2J1_17 - j2j3_p1c2s2_17*P1C2S2J2_17
  deriv(P1C2S2J3_17) <- age_up*P1C2S2J3_16_lag - age_up*P1C2S2J3_17_lag + r*P2C2S2J3_17 - f*P1C2S2J3_17+ s1s2_p1c2j3_17*P1C2S1J3_17 - s2s3_p1c2j3_17*P1C2S2J3_17 + s3s2_p1c2j3_17*P1C2S3J3_17+ c1c2_p1s2j3_17*P1C1S2J3_17 + c3c2_p1s2j3_17*P1C3S2J3_17 + c4c2_p1s2j3_17*P1C4S2J3_17 - (c2c3_p1s2j3_17+c2c4_p1s2j3_17)*P1C2S2J3_17+ j2j3_p1c2s2_17*P1C2S2J2_17 + j4j3_p1c2s2_17*P1C2S2J4_17 - j3j4_p1c2s2_17*P1C2S2J3_17
  deriv(P1C2S2J4_17) <- age_up*P1C2S2J4_16_lag - age_up*P1C2S2J4_17_lag + r*P2C2S2J4_17 - f*P1C2S2J4_17+ s1s2_p1c2j4_17*P1C2S1J4_17 - s2s3_p1c2j4_17*P1C2S2J4_17 + s3s2_p1c2j4_17*P1C2S3J4_17+ c1c2_p1s2j4_17*P1C1S2J4_17 + c3c2_p1s2j4_17*P1C3S2J4_17 + c4c2_p1s2j4_17*P1C4S2J4_17 - (c2c3_p1s2j4_17+c2c4_p1s2j4_17)*P1C2S2J4_17+ j3j4_p1c2s2_17*P1C2S2J3_17 - j4j3_p1c2s2_17*P1C2S2J4_17
  deriv(P1C2S3J1_17) <- age_up*P1C2S3J1_16_lag - age_up*P1C2S3J1_17_lag + r*P2C2S3J1_17 - f*P1C2S3J1_17+ s2s3_p1c2j1_17*P1C2S2J1_17 - s3s2_p1c2j1_17*P1C2S3J1_17+ c1c2_p1s3j1_17*P1C1S3J1_17 + c3c2_p1s3j1_17*P1C3S3J1_17 + c4c2_p1s3j1_17*P1C4S3J1_17 - (c2c3_p1s3j1_17+c2c4_p1s3j1_17)*P1C2S3J1_17- j1j2_p1c2s3_17*P1C2S3J1_17
  deriv(P1C2S3J2_17) <- age_up*P1C2S3J2_16_lag - age_up*P1C2S3J2_17_lag + r*P2C2S3J2_17 - f*P1C2S3J2_17+ s2s3_p1c2j2_17*P1C2S2J2_17 - s3s2_p1c2j2_17*P1C2S3J2_17+ c1c2_p1s3j2_17*P1C1S3J2_17 + c3c2_p1s3j2_17*P1C3S3J2_17 + c4c2_p1s3j2_17*P1C4S3J2_17 - (c2c3_p1s3j2_17+c2c4_p1s3j2_17)*P1C2S3J2_17+ j1j2_p1c2s3_17*P1C2S3J1_17 - j2j3_p1c2s3_17*P1C2S3J2_17
  deriv(P1C2S3J3_17) <- age_up*P1C2S3J3_16_lag - age_up*P1C2S3J3_17_lag + r*P2C2S3J3_17 - f*P1C2S3J3_17+ s2s3_p1c2j3_17*P1C2S2J3_17 - s3s2_p1c2j3_17*P1C2S3J3_17+ c1c2_p1s3j3_17*P1C1S3J3_17 + c3c2_p1s3j3_17*P1C3S3J3_17 + c4c2_p1s3j3_17*P1C4S3J3_17 - (c2c3_p1s3j3_17+c2c4_p1s3j3_17)*P1C2S3J3_17+ j2j3_p1c2s3_17*P1C2S3J2_17 + j4j3_p1c2s3_17*P1C2S3J4_17 - j3j4_p1c2s3_17*P1C2S3J3_17
  deriv(P1C2S3J4_17) <- age_up*P1C2S3J4_16_lag - age_up*P1C2S3J4_17_lag + r*P2C2S3J4_17 - f*P1C2S3J4_17+ s2s3_p1c2j4_17*P1C2S2J4_17 - s3s2_p1c2j4_17*P1C2S3J4_17+ c1c2_p1s3j4_17*P1C1S3J4_17 + c3c2_p1s3j4_17*P1C3S3J4_17 + c4c2_p1s3j4_17*P1C4S3J4_17 - (c2c3_p1s3j4_17+c2c4_p1s3j4_17)*P1C2S3J4_17+ j3j4_p1c2s3_17*P1C2S3J3_17 - j4j3_p1c2s3_17*P1C2S3J4_17
  deriv(P1C3S1J1_17) <- age_up*P1C3S1J1_16_lag - age_up*P1C3S1J1_17_lag + r*P2C3S1J1_17 - f*P1C3S1J1_17- s1s2_p1c3j1_17*P1C3S1J1_17+ c1c3_p1s1j1_17*P1C1S1J1_17+ c2c3_p1s1j1_17*P1C2S1J1_17 + c4c3_p1s1j1_17*P1C4S1J1_17 - (c3c2_p1s1j1_17+c3c4_p1s1j1_17)*P1C3S1J1_17- j1j2_p1c3s1_17*P1C3S1J1_17
  deriv(P1C3S1J2_17) <- age_up*P1C3S1J2_16_lag - age_up*P1C3S1J2_17_lag + r*P2C3S1J2_17 - f*P1C3S1J2_17- s1s2_p1c3j2_17*P1C3S1J2_17+ c1c3_p1s1j2_17*P1C1S1J2_17+ c2c3_p1s1j2_17*P1C2S1J2_17 + c4c3_p1s1j2_17*P1C4S1J2_17 - (c3c2_p1s1j2_17+c3c4_p1s1j2_17)*P1C3S1J2_17+ j1j2_p1c3s1_17*P1C3S1J1_17 - j2j3_p1c3s1_17*P1C3S1J2_17
  deriv(P1C3S1J3_17) <- age_up*P1C3S1J3_16_lag - age_up*P1C3S1J3_17_lag + r*P2C3S1J3_17 - f*P1C3S1J3_17- s1s2_p1c3j3_17*P1C3S1J3_17+ c1c3_p1s1j3_17*P1C1S1J3_17+ c2c3_p1s1j3_17*P1C2S1J3_17 + c4c3_p1s1j3_17*P1C4S1J3_17 - (c3c2_p1s1j3_17+c3c4_p1s1j3_17)*P1C3S1J3_17+ j2j3_p1c3s1_17*P1C3S1J2_17 + j4j3_p1c3s1_17*P1C3S1J4_17 - j3j4_p1c3s1_17*P1C3S1J3_17
  deriv(P1C3S1J4_17) <- age_up*P1C3S1J4_16_lag - age_up*P1C3S1J4_17_lag + r*P2C3S1J4_17 - f*P1C3S1J4_17- s1s2_p1c3j4_17*P1C3S1J4_17+ c1c3_p1s1j4_17*P1C1S1J4_17+ c2c3_p1s1j4_17*P1C2S1J4_17 + c4c3_p1s1j4_17*P1C4S1J4_17 - (c3c2_p1s1j4_17+c3c4_p1s1j4_17)*P1C3S1J4_17+ j3j4_p1c3s1_17*P1C3S1J3_17 - j4j3_p1c3s1_17*P1C3S1J4_17
  deriv(P1C3S2J1_17) <- age_up*P1C3S2J1_16_lag - age_up*P1C3S2J1_17_lag + r*P2C3S2J1_17 - f*P1C3S2J1_17+ s1s2_p1c3j1_17*P1C3S1J1_17 - s2s3_p1c3j1_17*P1C3S2J1_17 + s3s2_p1c3j1_17*P1C3S3J1_17+ c1c3_p1s2j1_17*P1C1S2J1_17+ c2c3_p1s2j1_17*P1C2S2J1_17 + c4c3_p1s2j1_17*P1C4S2J1_17 - (c3c2_p1s2j1_17+c3c4_p1s2j1_17)*P1C3S2J1_17- j1j2_p1c3s2_17*P1C3S2J1_17
  deriv(P1C3S2J2_17) <- age_up*P1C3S2J2_16_lag - age_up*P1C3S2J2_17_lag + r*P2C3S2J2_17 - f*P1C3S2J2_17+ s1s2_p1c3j2_17*P1C3S1J2_17 - s2s3_p1c3j2_17*P1C3S2J2_17 + s3s2_p1c3j2_17*P1C3S3J2_17+ c1c3_p1s2j2_17*P1C1S2J2_17+ c2c3_p1s2j2_17*P1C2S2J2_17 + c4c3_p1s2j2_17*P1C4S2J2_17 - (c3c2_p1s2j2_17+c3c4_p1s2j2_17)*P1C3S2J2_17+ j1j2_p1c3s2_17*P1C3S2J1_17 - j2j3_p1c3s2_17*P1C3S2J2_17
  deriv(P1C3S2J3_17) <- age_up*P1C3S2J3_16_lag - age_up*P1C3S2J3_17_lag + r*P2C3S2J3_17 - f*P1C3S2J3_17+ s1s2_p1c3j3_17*P1C3S1J3_17 - s2s3_p1c3j3_17*P1C3S2J3_17 + s3s2_p1c3j3_17*P1C3S3J3_17+ c1c3_p1s2j3_17*P1C1S2J3_17+ c2c3_p1s2j3_17*P1C2S2J3_17 + c4c3_p1s2j3_17*P1C4S2J3_17 - (c3c2_p1s2j3_17+c3c4_p1s2j3_17)*P1C3S2J3_17+ j2j3_p1c3s2_17*P1C3S2J2_17 + j4j3_p1c3s2_17*P1C3S2J4_17 - j3j4_p1c3s2_17*P1C3S2J3_17
  deriv(P1C3S2J4_17) <- age_up*P1C3S2J4_16_lag - age_up*P1C3S2J4_17_lag + r*P2C3S2J4_17 - f*P1C3S2J4_17+ s1s2_p1c3j4_17*P1C3S1J4_17 - s2s3_p1c3j4_17*P1C3S2J4_17 + s3s2_p1c3j4_17*P1C3S3J4_17+ c1c3_p1s2j4_17*P1C1S2J4_17+ c2c3_p1s2j4_17*P1C2S2J4_17 + c4c3_p1s2j4_17*P1C4S2J4_17 - (c3c2_p1s2j4_17+c3c4_p1s2j4_17)*P1C3S2J4_17+ j3j4_p1c3s2_17*P1C3S2J3_17 - j4j3_p1c3s2_17*P1C3S2J4_17
  deriv(P1C3S3J1_17) <- age_up*P1C3S3J1_16_lag - age_up*P1C3S3J1_17_lag + r*P2C3S3J1_17 - f*P1C3S3J1_17+ s2s3_p1c3j1_17*P1C3S2J1_17 - s3s2_p1c3j1_17*P1C3S3J1_17+ c1c3_p1s3j1_17*P1C1S3J1_17+ c2c3_p1s3j1_17*P1C2S3J1_17 + c4c3_p1s3j1_17*P1C4S3J1_17 - (c3c2_p1s3j1_17+c3c4_p1s3j1_17)*P1C3S3J1_17- j1j2_p1c3s3_17*P1C3S3J1_17
  deriv(P1C3S3J2_17) <- age_up*P1C3S3J2_16_lag - age_up*P1C3S3J2_17_lag + r*P2C3S3J2_17 - f*P1C3S3J2_17+ s2s3_p1c3j2_17*P1C3S2J2_17 - s3s2_p1c3j2_17*P1C3S3J2_17+ c1c3_p1s3j2_17*P1C1S3J2_17+ c2c3_p1s3j2_17*P1C2S3J2_17 + c4c3_p1s3j2_17*P1C4S3J2_17 - (c3c2_p1s3j2_17+c3c4_p1s3j2_17)*P1C3S3J2_17+ j1j2_p1c3s3_17*P1C3S3J1_17 - j2j3_p1c3s3_17*P1C3S3J2_17
  deriv(P1C3S3J3_17) <- age_up*P1C3S3J3_16_lag - age_up*P1C3S3J3_17_lag + r*P2C3S3J3_17 - f*P1C3S3J3_17+ s2s3_p1c3j3_17*P1C3S2J3_17 - s3s2_p1c3j3_17*P1C3S3J3_17+ c1c3_p1s3j3_17*P1C1S3J3_17+ c2c3_p1s3j3_17*P1C2S3J3_17 + c4c3_p1s3j3_17*P1C4S3J3_17 - (c3c2_p1s3j3_17+c3c4_p1s3j3_17)*P1C3S3J3_17+ j2j3_p1c3s3_17*P1C3S3J2_17 + j4j3_p1c3s3_17*P1C3S3J4_17 - j3j4_p1c3s3_17*P1C3S3J3_17
  deriv(P1C3S3J4_17) <- age_up*P1C3S3J4_16_lag - age_up*P1C3S3J4_17_lag + r*P2C3S3J4_17 - f*P1C3S3J4_17+ s2s3_p1c3j4_17*P1C3S2J4_17 - s3s2_p1c3j4_17*P1C3S3J4_17+ c1c3_p1s3j4_17*P1C1S3J4_17+ c2c3_p1s3j4_17*P1C2S3J4_17 + c4c3_p1s3j4_17*P1C4S3J4_17 - (c3c2_p1s3j4_17+c3c4_p1s3j4_17)*P1C3S3J4_17+ j3j4_p1c3s3_17*P1C3S3J3_17 - j4j3_p1c3s3_17*P1C3S3J4_17
  deriv(P1C4S1J1_17) <- age_up*P1C4S1J1_16_lag - age_up*P1C4S1J1_17_lag + r*P2C4S1J1_17 - f*P1C4S1J1_17- s1s2_p1c4j1_17*P1C4S1J1_17+ c2c4_p1s1j1_17*P1C2S1J1_17 + c3c4_p1s1j1_17*P1C3S1J1_17- (c4c2_p1s1j1_17+c4c3_p1s1j1_17)*P1C4S1J1_17- j1j2_p1c4s1_17*P1C4S1J1_17
  deriv(P1C4S1J2_17) <- age_up*P1C4S1J2_16_lag - age_up*P1C4S1J2_17_lag + r*P2C4S1J2_17 - f*P1C4S1J2_17- s1s2_p1c4j2_17*P1C4S1J2_17+ c2c4_p1s1j2_17*P1C2S1J2_17 + c3c4_p1s1j2_17*P1C3S1J2_17- (c4c2_p1s1j2_17+c4c3_p1s1j2_17)*P1C4S1J2_17+ j1j2_p1c4s1_17*P1C4S1J1_17 - j2j3_p1c4s1_17*P1C4S1J2_17
  deriv(P1C4S1J3_17) <- age_up*P1C4S1J3_16_lag - age_up*P1C4S1J3_17_lag + r*P2C4S1J3_17 - f*P1C4S1J3_17- s1s2_p1c4j3_17*P1C4S1J3_17+ c2c4_p1s1j3_17*P1C2S1J3_17 + c3c4_p1s1j3_17*P1C3S1J3_17- (c4c2_p1s1j3_17+c4c3_p1s1j3_17)*P1C4S1J3_17+ j2j3_p1c4s1_17*P1C4S1J2_17 + j4j3_p1c4s1_17*P1C4S1J4_17 - j3j4_p1c4s1_17*P1C4S1J3_17
  deriv(P1C4S1J4_17) <- age_up*P1C4S1J4_16_lag - age_up*P1C4S1J4_17_lag + r*P2C4S1J4_17 - f*P1C4S1J4_17- s1s2_p1c4j4_17*P1C4S1J4_17+ c2c4_p1s1j4_17*P1C2S1J4_17 + c3c4_p1s1j4_17*P1C3S1J4_17- (c4c2_p1s1j4_17+c4c3_p1s1j4_17)*P1C4S1J4_17+ j3j4_p1c4s1_17*P1C4S1J3_17 - j4j3_p1c4s1_17*P1C4S1J4_17
  deriv(P1C4S2J1_17) <- age_up*P1C4S2J1_16_lag - age_up*P1C4S2J1_17_lag + r*P2C4S2J1_17 - f*P1C4S2J1_17+ s1s2_p1c4j1_17*P1C4S1J1_17 - s2s3_p1c4j1_17*P1C4S2J1_17 + s3s2_p1c4j1_17*P1C4S3J1_17+ c2c4_p1s2j1_17*P1C2S2J1_17 + c3c4_p1s2j1_17*P1C3S2J1_17- (c4c2_p1s2j1_17+c4c3_p1s2j1_17)*P1C4S2J1_17- j1j2_p1c4s2_17*P1C4S2J1_17
  deriv(P1C4S2J2_17) <- age_up*P1C4S2J2_16_lag - age_up*P1C4S2J2_17_lag + r*P2C4S2J2_17 - f*P1C4S2J2_17+ s1s2_p1c4j2_17*P1C4S1J2_17 - s2s3_p1c4j2_17*P1C4S2J2_17 + s3s2_p1c4j2_17*P1C4S3J2_17+ c2c4_p1s2j2_17*P1C2S2J2_17 + c3c4_p1s2j2_17*P1C3S2J2_17- (c4c2_p1s2j2_17+c4c3_p1s2j2_17)*P1C4S2J2_17+ j1j2_p1c4s2_17*P1C4S2J1_17 - j2j3_p1c4s2_17*P1C4S2J2_17
  deriv(P1C4S2J3_17) <- age_up*P1C4S2J3_16_lag - age_up*P1C4S2J3_17_lag + r*P2C4S2J3_17 - f*P1C4S2J3_17+ s1s2_p1c4j3_17*P1C4S1J3_17 - s2s3_p1c4j3_17*P1C4S2J3_17 + s3s2_p1c4j3_17*P1C4S3J3_17+ c2c4_p1s2j3_17*P1C2S2J3_17 + c3c4_p1s2j3_17*P1C3S2J3_17- (c4c2_p1s2j3_17+c4c3_p1s2j3_17)*P1C4S2J3_17+ j2j3_p1c4s2_17*P1C4S2J2_17 + j4j3_p1c4s2_17*P1C4S2J4_17 - j3j4_p1c4s2_17*P1C4S2J3_17
  deriv(P1C4S2J4_17) <- age_up*P1C4S2J4_16_lag - age_up*P1C4S2J4_17_lag + r*P2C4S2J4_17 - f*P1C4S2J4_17+ s1s2_p1c4j4_17*P1C4S1J4_17 - s2s3_p1c4j4_17*P1C4S2J4_17 + s3s2_p1c4j4_17*P1C4S3J4_17+ c2c4_p1s2j4_17*P1C2S2J4_17 + c3c4_p1s2j4_17*P1C3S2J4_17- (c4c2_p1s2j4_17+c4c3_p1s2j4_17)*P1C4S2J4_17+ j3j4_p1c4s2_17*P1C4S2J3_17 - j4j3_p1c4s2_17*P1C4S2J4_17
  deriv(P1C4S3J1_17) <- age_up*P1C4S3J1_16_lag - age_up*P1C4S3J1_17_lag + r*P2C4S3J1_17 - f*P1C4S3J1_17+ s2s3_p1c4j1_17*P1C4S2J1_17 - s3s2_p1c4j1_17*P1C4S3J1_17+ c2c4_p1s3j1_17*P1C2S3J1_17 + c3c4_p1s3j1_17*P1C3S3J1_17- (c4c2_p1s3j1_17+c4c3_p1s3j1_17)*P1C4S3J1_17- j1j2_p1c4s3_17*P1C4S3J1_17
  deriv(P1C4S3J2_17) <- age_up*P1C4S3J2_16_lag - age_up*P1C4S3J2_17_lag + r*P2C4S3J2_17 - f*P1C4S3J2_17+ s2s3_p1c4j2_17*P1C4S2J2_17 - s3s2_p1c4j2_17*P1C4S3J2_17+ c2c4_p1s3j2_17*P1C2S3J2_17 + c3c4_p1s3j2_17*P1C3S3J2_17- (c4c2_p1s3j2_17+c4c3_p1s3j2_17)*P1C4S3J2_17+ j1j2_p1c4s3_17*P1C4S3J1_17 - j2j3_p1c4s3_17*P1C4S3J2_17
  deriv(P1C4S3J3_17) <- age_up*P1C4S3J3_16_lag - age_up*P1C4S3J3_17_lag + r*P2C4S3J3_17 - f*P1C4S3J3_17+ s2s3_p1c4j3_17*P1C4S2J3_17 - s3s2_p1c4j3_17*P1C4S3J3_17+ c2c4_p1s3j3_17*P1C2S3J3_17 + c3c4_p1s3j3_17*P1C3S3J3_17- (c4c2_p1s3j3_17+c4c3_p1s3j3_17)*P1C4S3J3_17+ j2j3_p1c4s3_17*P1C4S3J2_17 + j4j3_p1c4s3_17*P1C4S3J4_17 - j3j4_p1c4s3_17*P1C4S3J3_17
  deriv(P1C4S3J4_17) <- age_up*P1C4S3J4_16_lag - age_up*P1C4S3J4_17_lag + r*P2C4S3J4_17 - f*P1C4S3J4_17+ s2s3_p1c4j4_17*P1C4S2J4_17 - s3s2_p1c4j4_17*P1C4S3J4_17+ c2c4_p1s3j4_17*P1C2S3J4_17 + c3c4_p1s3j4_17*P1C3S3J4_17- (c4c2_p1s3j4_17+c4c3_p1s3j4_17)*P1C4S3J4_17+ j3j4_p1c4s3_17*P1C4S3J3_17 - j4j3_p1c4s3_17*P1C4S3J4_17
  deriv(P2C1S1J1_17) <- age_up*P2C1S1J1_16_lag - age_up*P2C1S1J1_17_lag  + f*P1C1S1J1_17 - r*P2C1S1J1_17- s1s2_p2c1j1_17*P2C1S1J1_17- (c1c2_p2s1j1_17+c1c3_p2s1j1_17)*P2C1S1J1_17- j1j2_p2c1s1_17*P2C1S1J1_17
  deriv(P2C1S1J2_17) <- age_up*P2C1S1J2_16_lag - age_up*P2C1S1J2_17_lag  + f*P1C1S1J2_17 - r*P2C1S1J2_17- s1s2_p2c1j2_17*P2C1S1J2_17- (c1c2_p2s1j2_17+c1c3_p2s1j2_17)*P2C1S1J2_17+ j1j2_p2c1s1_17*P2C1S1J1_17 - j2j3_p2c1s1_17*P2C1S1J2_17
  deriv(P2C1S1J3_17) <- age_up*P2C1S1J3_16_lag - age_up*P2C1S1J3_17_lag  + f*P1C1S1J3_17 - r*P2C1S1J3_17- s1s2_p2c1j3_17*P2C1S1J3_17- (c1c2_p2s1j3_17+c1c3_p2s1j3_17)*P2C1S1J3_17+ j2j3_p2c1s1_17*P2C1S1J2_17 + j4j3_p2c1s1_17*P2C1S1J4_17 - j3j4_p2c1s1_17*P2C1S1J3_17
  deriv(P2C1S1J4_17) <- age_up*P2C1S1J4_16_lag - age_up*P2C1S1J4_17_lag  + f*P1C1S1J4_17 - r*P2C1S1J4_17- s1s2_p2c1j4_17*P2C1S1J4_17- (c1c2_p2s1j4_17+c1c3_p2s1j4_17)*P2C1S1J4_17+ j3j4_p2c1s1_17*P2C1S1J3_17 - j4j3_p2c1s1_17*P2C1S1J4_17
  deriv(P2C1S2J1_17) <- age_up*P2C1S2J1_16_lag - age_up*P2C1S2J1_17_lag  + f*P1C1S2J1_17 - r*P2C1S2J1_17+ s1s2_p2c1j1_17*P2C1S1J1_17 - s2s3_p2c1j1_17*P2C1S2J1_17 + s3s2_p2c1j1_17*P2C1S3J1_17- (c1c2_p2s2j1_17+c1c3_p2s2j1_17)*P2C1S2J1_17- j1j2_p2c1s2_17*P2C1S2J1_17
  deriv(P2C1S2J2_17) <- age_up*P2C1S2J2_16_lag - age_up*P2C1S2J2_17_lag  + f*P1C1S2J2_17 - r*P2C1S2J2_17+ s1s2_p2c1j2_17*P2C1S1J2_17 - s2s3_p2c1j2_17*P2C1S2J2_17 + s3s2_p2c1j2_17*P2C1S3J2_17- (c1c2_p2s2j2_17+c1c3_p2s2j2_17)*P2C1S2J2_17+ j1j2_p2c1s2_17*P2C1S2J1_17 - j2j3_p2c1s2_17*P2C1S2J2_17
  deriv(P2C1S2J3_17) <- age_up*P2C1S2J3_16_lag - age_up*P2C1S2J3_17_lag  + f*P1C1S2J3_17 - r*P2C1S2J3_17+ s1s2_p2c1j3_17*P2C1S1J3_17 - s2s3_p2c1j3_17*P2C1S2J3_17 + s3s2_p2c1j3_17*P2C1S3J3_17- (c1c2_p2s2j3_17+c1c3_p2s2j3_17)*P2C1S2J3_17+ j2j3_p2c1s2_17*P2C1S2J2_17 + j4j3_p2c1s2_17*P2C1S2J4_17 - j3j4_p2c1s2_17*P2C1S2J3_17
  deriv(P2C1S2J4_17) <- age_up*P2C1S2J4_16_lag - age_up*P2C1S2J4_17_lag  + f*P1C1S2J4_17 - r*P2C1S2J4_17+ s1s2_p2c1j4_17*P2C1S1J4_17 - s2s3_p2c1j4_17*P2C1S2J4_17 + s3s2_p2c1j4_17*P2C1S3J4_17- (c1c2_p2s2j4_17+c1c3_p2s2j4_17)*P2C1S2J4_17+ j3j4_p2c1s2_17*P2C1S2J3_17 - j4j3_p2c1s2_17*P2C1S2J4_17
  deriv(P2C1S3J1_17) <- age_up*P2C1S3J1_16_lag - age_up*P2C1S3J1_17_lag  + f*P1C1S3J1_17 - r*P2C1S3J1_17+ s2s3_p2c1j1_17*P2C1S2J1_17 - s3s2_p2c1j1_17*P2C1S3J1_17- (c1c2_p2s3j1_17+c1c3_p2s3j1_17)*P2C1S3J1_17- j1j2_p2c1s3_17*P2C1S3J1_17
  deriv(P2C1S3J2_17) <- age_up*P2C1S3J2_16_lag - age_up*P2C1S3J2_17_lag  + f*P1C1S3J2_17 - r*P2C1S3J2_17+ s2s3_p2c1j2_17*P2C1S2J2_17 - s3s2_p2c1j2_17*P2C1S3J2_17- (c1c2_p2s3j2_17+c1c3_p2s3j2_17)*P2C1S3J2_17+ j1j2_p2c1s3_17*P2C1S3J1_17 - j2j3_p2c1s3_17*P2C1S3J2_17
  deriv(P2C1S3J3_17) <- age_up*P2C1S3J3_16_lag - age_up*P2C1S3J3_17_lag  + f*P1C1S3J3_17 - r*P2C1S3J3_17+ s2s3_p2c1j3_17*P2C1S2J3_17 - s3s2_p2c1j3_17*P2C1S3J3_17- (c1c2_p2s3j3_17+c1c3_p2s3j3_17)*P2C1S3J3_17+ j2j3_p2c1s3_17*P2C1S3J2_17 + j4j3_p2c1s3_17*P2C1S3J4_17 - j3j4_p2c1s3_17*P2C1S3J3_17
  deriv(P2C1S3J4_17) <- age_up*P2C1S3J4_16_lag - age_up*P2C1S3J4_17_lag  + f*P1C1S3J4_17 - r*P2C1S3J4_17+ s2s3_p2c1j4_17*P2C1S2J4_17 - s3s2_p2c1j4_17*P2C1S3J4_17- (c1c2_p2s3j4_17+c1c3_p2s3j4_17)*P2C1S3J4_17+ j3j4_p2c1s3_17*P2C1S3J3_17 - j4j3_p2c1s3_17*P2C1S3J4_17
  deriv(P2C2S1J1_17) <- age_up*P2C2S1J1_16_lag - age_up*P2C2S1J1_17_lag  + f*P1C2S1J1_17 - r*P2C2S1J1_17- s1s2_p2c2j1_17*P2C2S1J1_17+ c1c2_p2s1j1_17*P2C1S1J1_17 + c3c2_p2s1j1_17*P2C3S1J1_17 + c4c2_p2s1j1_17*P2C4S1J1_17 - (c2c3_p2s1j1_17+c2c4_p2s1j1_17)*P2C2S1J1_17- j1j2_p2c2s1_17*P2C2S1J1_17
  deriv(P2C2S1J2_17) <- age_up*P2C2S1J2_16_lag - age_up*P2C2S1J2_17_lag  + f*P1C2S1J2_17 - r*P2C2S1J2_17- s1s2_p2c2j2_17*P2C2S1J2_17+ c1c2_p2s1j2_17*P2C1S1J2_17 + c3c2_p2s1j2_17*P2C3S1J2_17 + c4c2_p2s1j2_17*P2C4S1J2_17 - (c2c3_p2s1j2_17+c2c4_p2s1j2_17)*P2C2S1J2_17+ j1j2_p2c2s1_17*P2C2S1J1_17 - j2j3_p2c2s1_17*P2C2S1J2_17
  deriv(P2C2S1J3_17) <- age_up*P2C2S1J3_16_lag - age_up*P2C2S1J3_17_lag  + f*P1C2S1J3_17 - r*P2C2S1J3_17- s1s2_p2c2j3_17*P2C2S1J3_17+ c1c2_p2s1j3_17*P2C1S1J3_17 + c3c2_p2s1j3_17*P2C3S1J3_17 + c4c2_p2s1j3_17*P2C4S1J3_17 - (c2c3_p2s1j3_17+c2c4_p2s1j3_17)*P2C2S1J3_17+ j2j3_p2c2s1_17*P2C2S1J2_17 + j4j3_p2c2s1_17*P2C2S1J4_17 - j3j4_p2c2s1_17*P2C2S1J3_17
  deriv(P2C2S1J4_17) <- age_up*P2C2S1J4_16_lag - age_up*P2C2S1J4_17_lag  + f*P1C2S1J4_17 - r*P2C2S1J4_17- s1s2_p2c2j4_17*P2C2S1J4_17+ c1c2_p2s1j4_17*P2C1S1J4_17 + c3c2_p2s1j4_17*P2C3S1J4_17 + c4c2_p2s1j4_17*P2C4S1J4_17 - (c2c3_p2s1j4_17+c2c4_p2s1j4_17)*P2C2S1J4_17+ j3j4_p2c2s1_17*P2C2S1J3_17 - j4j3_p2c2s1_17*P2C2S1J4_17
  deriv(P2C2S2J1_17) <- age_up*P2C2S2J1_16_lag - age_up*P2C2S2J1_17_lag  + f*P1C2S2J1_17 - r*P2C2S2J1_17+ s1s2_p2c2j1_17*P2C2S1J1_17 - s2s3_p2c2j1_17*P2C2S2J1_17 + s3s2_p2c2j1_17*P2C2S3J1_17+ c1c2_p2s2j1_17*P2C1S2J1_17 + c3c2_p2s2j1_17*P2C3S2J1_17 + c4c2_p2s2j1_17*P2C4S2J1_17 - (c2c3_p2s2j1_17+c2c4_p2s2j1_17)*P2C2S2J1_17- j1j2_p2c2s2_17*P2C2S2J1_17
  deriv(P2C2S2J2_17) <- age_up*P2C2S2J2_16_lag - age_up*P2C2S2J2_17_lag  + f*P1C2S2J2_17 - r*P2C2S2J2_17+ s1s2_p2c2j2_17*P2C2S1J2_17 - s2s3_p2c2j2_17*P2C2S2J2_17 + s3s2_p2c2j2_17*P2C2S3J2_17+ c1c2_p2s2j2_17*P2C1S2J2_17 + c3c2_p2s2j2_17*P2C3S2J2_17 + c4c2_p2s2j2_17*P2C4S2J2_17 - (c2c3_p2s2j2_17+c2c4_p2s2j2_17)*P2C2S2J2_17+ j1j2_p2c2s2_17*P2C2S2J1_17 - j2j3_p2c2s2_17*P2C2S2J2_17
  deriv(P2C2S2J3_17) <- age_up*P2C2S2J3_16_lag - age_up*P2C2S2J3_17_lag  + f*P1C2S2J3_17 - r*P2C2S2J3_17+ s1s2_p2c2j3_17*P2C2S1J3_17 - s2s3_p2c2j3_17*P2C2S2J3_17 + s3s2_p2c2j3_17*P2C2S3J3_17+ c1c2_p2s2j3_17*P2C1S2J3_17 + c3c2_p2s2j3_17*P2C3S2J3_17 + c4c2_p2s2j3_17*P2C4S2J3_17 - (c2c3_p2s2j3_17+c2c4_p2s2j3_17)*P2C2S2J3_17+ j2j3_p2c2s2_17*P2C2S2J2_17 + j4j3_p2c2s2_17*P2C2S2J4_17 - j3j4_p2c2s2_17*P2C2S2J3_17
  deriv(P2C2S2J4_17) <- age_up*P2C2S2J4_16_lag - age_up*P2C2S2J4_17_lag  + f*P1C2S2J4_17 - r*P2C2S2J4_17+ s1s2_p2c2j4_17*P2C2S1J4_17 - s2s3_p2c2j4_17*P2C2S2J4_17 + s3s2_p2c2j4_17*P2C2S3J4_17+ c1c2_p2s2j4_17*P2C1S2J4_17 + c3c2_p2s2j4_17*P2C3S2J4_17 + c4c2_p2s2j4_17*P2C4S2J4_17 - (c2c3_p2s2j4_17+c2c4_p2s2j4_17)*P2C2S2J4_17+ j3j4_p2c2s2_17*P2C2S2J3_17 - j4j3_p2c2s2_17*P2C2S2J4_17
  deriv(P2C2S3J1_17) <- age_up*P2C2S3J1_16_lag - age_up*P2C2S3J1_17_lag  + f*P1C2S3J1_17 - r*P2C2S3J1_17+ s2s3_p2c2j1_17*P2C2S2J1_17 - s3s2_p2c2j1_17*P2C2S3J1_17+ c1c2_p2s3j1_17*P2C1S3J1_17 + c3c2_p2s3j1_17*P2C3S3J1_17 + c4c2_p2s3j1_17*P2C4S3J1_17 - (c2c3_p2s3j1_17+c2c4_p2s3j1_17)*P2C2S3J1_17- j1j2_p2c2s3_17*P2C2S3J1_17
  deriv(P2C2S3J2_17) <- age_up*P2C2S3J2_16_lag - age_up*P2C2S3J2_17_lag  + f*P1C2S3J2_17 - r*P2C2S3J2_17+ s2s3_p2c2j2_17*P2C2S2J2_17 - s3s2_p2c2j2_17*P2C2S3J2_17+ c1c2_p2s3j2_17*P2C1S3J2_17 + c3c2_p2s3j2_17*P2C3S3J2_17 + c4c2_p2s3j2_17*P2C4S3J2_17 - (c2c3_p2s3j2_17+c2c4_p2s3j2_17)*P2C2S3J2_17+ j1j2_p2c2s3_17*P2C2S3J1_17 - j2j3_p2c2s3_17*P2C2S3J2_17
  deriv(P2C2S3J3_17) <- age_up*P2C2S3J3_16_lag - age_up*P2C2S3J3_17_lag  + f*P1C2S3J3_17 - r*P2C2S3J3_17+ s2s3_p2c2j3_17*P2C2S2J3_17 - s3s2_p2c2j3_17*P2C2S3J3_17+ c1c2_p2s3j3_17*P2C1S3J3_17 + c3c2_p2s3j3_17*P2C3S3J3_17 + c4c2_p2s3j3_17*P2C4S3J3_17 - (c2c3_p2s3j3_17+c2c4_p2s3j3_17)*P2C2S3J3_17+ j2j3_p2c2s3_17*P2C2S3J2_17 + j4j3_p2c2s3_17*P2C2S3J4_17 - j3j4_p2c2s3_17*P2C2S3J3_17
  deriv(P2C2S3J4_17) <- age_up*P2C2S3J4_16_lag - age_up*P2C2S3J4_17_lag  + f*P1C2S3J4_17 - r*P2C2S3J4_17+ s2s3_p2c2j4_17*P2C2S2J4_17 - s3s2_p2c2j4_17*P2C2S3J4_17+ c1c2_p2s3j4_17*P2C1S3J4_17 + c3c2_p2s3j4_17*P2C3S3J4_17 + c4c2_p2s3j4_17*P2C4S3J4_17 - (c2c3_p2s3j4_17+c2c4_p2s3j4_17)*P2C2S3J4_17+ j3j4_p2c2s3_17*P2C2S3J3_17 - j4j3_p2c2s3_17*P2C2S3J4_17
  deriv(P2C3S1J1_17) <- age_up*P2C3S1J1_16_lag - age_up*P2C3S1J1_17_lag  + f*P1C3S1J1_17 - r*P2C3S1J1_17- s1s2_p2c3j1_17*P2C3S1J1_17+ c1c3_p2s1j1_17*P2C1S1J1_17+ c2c3_p2s1j1_17*P2C2S1J1_17 + c4c3_p2s1j1_17*P2C4S1J1_17 - (c3c2_p2s1j1_17+c3c4_p2s1j1_17)*P2C3S1J1_17- j1j2_p2c3s1_17*P2C3S1J1_17
  deriv(P2C3S1J2_17) <- age_up*P2C3S1J2_16_lag - age_up*P2C3S1J2_17_lag  + f*P1C3S1J2_17 - r*P2C3S1J2_17- s1s2_p2c3j2_17*P2C3S1J2_17+ c1c3_p2s1j2_17*P2C1S1J2_17+ c2c3_p2s1j2_17*P2C2S1J2_17 + c4c3_p2s1j2_17*P2C4S1J2_17 - (c3c2_p2s1j2_17+c3c4_p2s1j2_17)*P2C3S1J2_17+ j1j2_p2c3s1_17*P2C3S1J1_17 - j2j3_p2c3s1_17*P2C3S1J2_17
  deriv(P2C3S1J3_17) <- age_up*P2C3S1J3_16_lag - age_up*P2C3S1J3_17_lag  + f*P1C3S1J3_17 - r*P2C3S1J3_17- s1s2_p2c3j3_17*P2C3S1J3_17+ c1c3_p2s1j3_17*P2C1S1J3_17+ c2c3_p2s1j3_17*P2C2S1J3_17 + c4c3_p2s1j3_17*P2C4S1J3_17 - (c3c2_p2s1j3_17+c3c4_p2s1j3_17)*P2C3S1J3_17+ j2j3_p2c3s1_17*P2C3S1J2_17 + j4j3_p2c3s1_17*P2C3S1J4_17 - j3j4_p2c3s1_17*P2C3S1J3_17
  deriv(P2C3S1J4_17) <- age_up*P2C3S1J4_16_lag - age_up*P2C3S1J4_17_lag  + f*P1C3S1J4_17 - r*P2C3S1J4_17- s1s2_p2c3j4_17*P2C3S1J4_17+ c1c3_p2s1j4_17*P2C1S1J4_17+ c2c3_p2s1j4_17*P2C2S1J4_17 + c4c3_p2s1j4_17*P2C4S1J4_17 - (c3c2_p2s1j4_17+c3c4_p2s1j4_17)*P2C3S1J4_17+ j3j4_p2c3s1_17*P2C3S1J3_17 - j4j3_p2c3s1_17*P2C3S1J4_17
  deriv(P2C3S2J1_17) <- age_up*P2C3S2J1_16_lag - age_up*P2C3S2J1_17_lag  + f*P1C3S2J1_17 - r*P2C3S2J1_17+ s1s2_p2c3j1_17*P2C3S1J1_17 - s2s3_p2c3j1_17*P2C3S2J1_17 + s3s2_p2c3j1_17*P2C3S3J1_17+ c1c3_p2s2j1_17*P2C1S2J1_17+ c2c3_p2s2j1_17*P2C2S2J1_17 + c4c3_p2s2j1_17*P2C4S2J1_17 - (c3c2_p2s2j1_17+c3c4_p2s2j1_17)*P2C3S2J1_17- j1j2_p2c3s2_17*P2C3S2J1_17
  deriv(P2C3S2J2_17) <- age_up*P2C3S2J2_16_lag - age_up*P2C3S2J2_17_lag  + f*P1C3S2J2_17 - r*P2C3S2J2_17+ s1s2_p2c3j2_17*P2C3S1J2_17 - s2s3_p2c3j2_17*P2C3S2J2_17 + s3s2_p2c3j2_17*P2C3S3J2_17+ c1c3_p2s2j2_17*P2C1S2J2_17+ c2c3_p2s2j2_17*P2C2S2J2_17 + c4c3_p2s2j2_17*P2C4S2J2_17 - (c3c2_p2s2j2_17+c3c4_p2s2j2_17)*P2C3S2J2_17+ j1j2_p2c3s2_17*P2C3S2J1_17 - j2j3_p2c3s2_17*P2C3S2J2_17
  deriv(P2C3S2J3_17) <- age_up*P2C3S2J3_16_lag - age_up*P2C3S2J3_17_lag  + f*P1C3S2J3_17 - r*P2C3S2J3_17+ s1s2_p2c3j3_17*P2C3S1J3_17 - s2s3_p2c3j3_17*P2C3S2J3_17 + s3s2_p2c3j3_17*P2C3S3J3_17+ c1c3_p2s2j3_17*P2C1S2J3_17+ c2c3_p2s2j3_17*P2C2S2J3_17 + c4c3_p2s2j3_17*P2C4S2J3_17 - (c3c2_p2s2j3_17+c3c4_p2s2j3_17)*P2C3S2J3_17+ j2j3_p2c3s2_17*P2C3S2J2_17 + j4j3_p2c3s2_17*P2C3S2J4_17 - j3j4_p2c3s2_17*P2C3S2J3_17
  deriv(P2C3S2J4_17) <- age_up*P2C3S2J4_16_lag - age_up*P2C3S2J4_17_lag  + f*P1C3S2J4_17 - r*P2C3S2J4_17+ s1s2_p2c3j4_17*P2C3S1J4_17 - s2s3_p2c3j4_17*P2C3S2J4_17 + s3s2_p2c3j4_17*P2C3S3J4_17+ c1c3_p2s2j4_17*P2C1S2J4_17+ c2c3_p2s2j4_17*P2C2S2J4_17 + c4c3_p2s2j4_17*P2C4S2J4_17 - (c3c2_p2s2j4_17+c3c4_p2s2j4_17)*P2C3S2J4_17+ j3j4_p2c3s2_17*P2C3S2J3_17 - j4j3_p2c3s2_17*P2C3S2J4_17
  deriv(P2C3S3J1_17) <- age_up*P2C3S3J1_16_lag - age_up*P2C3S3J1_17_lag  + f*P1C3S3J1_17 - r*P2C3S3J1_17+ s2s3_p2c3j1_17*P2C3S2J1_17 - s3s2_p2c3j1_17*P2C3S3J1_17+ c1c3_p2s3j1_17*P2C1S3J1_17+ c2c3_p2s3j1_17*P2C2S3J1_17 + c4c3_p2s3j1_17*P2C4S3J1_17 - (c3c2_p2s3j1_17+c3c4_p2s3j1_17)*P2C3S3J1_17- j1j2_p2c3s3_17*P2C3S3J1_17
  deriv(P2C3S3J2_17) <- age_up*P2C3S3J2_16_lag - age_up*P2C3S3J2_17_lag  + f*P1C3S3J2_17 - r*P2C3S3J2_17+ s2s3_p2c3j2_17*P2C3S2J2_17 - s3s2_p2c3j2_17*P2C3S3J2_17+ c1c3_p2s3j2_17*P2C1S3J2_17+ c2c3_p2s3j2_17*P2C2S3J2_17 + c4c3_p2s3j2_17*P2C4S3J2_17 - (c3c2_p2s3j2_17+c3c4_p2s3j2_17)*P2C3S3J2_17+ j1j2_p2c3s3_17*P2C3S3J1_17 - j2j3_p2c3s3_17*P2C3S3J2_17
  deriv(P2C3S3J3_17) <- age_up*P2C3S3J3_16_lag - age_up*P2C3S3J3_17_lag  + f*P1C3S3J3_17 - r*P2C3S3J3_17+ s2s3_p2c3j3_17*P2C3S2J3_17 - s3s2_p2c3j3_17*P2C3S3J3_17+ c1c3_p2s3j3_17*P2C1S3J3_17+ c2c3_p2s3j3_17*P2C2S3J3_17 + c4c3_p2s3j3_17*P2C4S3J3_17 - (c3c2_p2s3j3_17+c3c4_p2s3j3_17)*P2C3S3J3_17+ j2j3_p2c3s3_17*P2C3S3J2_17 + j4j3_p2c3s3_17*P2C3S3J4_17 - j3j4_p2c3s3_17*P2C3S3J3_17
  deriv(P2C3S3J4_17) <- age_up*P2C3S3J4_16_lag - age_up*P2C3S3J4_17_lag  + f*P1C3S3J4_17 - r*P2C3S3J4_17+ s2s3_p2c3j4_17*P2C3S2J4_17 - s3s2_p2c3j4_17*P2C3S3J4_17+ c1c3_p2s3j4_17*P2C1S3J4_17+ c2c3_p2s3j4_17*P2C2S3J4_17 + c4c3_p2s3j4_17*P2C4S3J4_17 - (c3c2_p2s3j4_17+c3c4_p2s3j4_17)*P2C3S3J4_17+ j3j4_p2c3s3_17*P2C3S3J3_17 - j4j3_p2c3s3_17*P2C3S3J4_17
  deriv(P2C4S1J1_17) <- age_up*P2C4S1J1_16_lag - age_up*P2C4S1J1_17_lag  + f*P1C4S1J1_17 - r*P2C4S1J1_17- s1s2_p2c4j1_17*P2C4S1J1_17+ c2c4_p2s1j1_17*P2C2S1J1_17 + c3c4_p2s1j1_17*P2C3S1J1_17- (c4c2_p2s1j1_17+c4c3_p2s1j1_17)*P2C4S1J1_17- j1j2_p2c4s1_17*P2C4S1J1_17
  deriv(P2C4S1J2_17) <- age_up*P2C4S1J2_16_lag - age_up*P2C4S1J2_17_lag  + f*P1C4S1J2_17 - r*P2C4S1J2_17- s1s2_p2c4j2_17*P2C4S1J2_17+ c2c4_p2s1j2_17*P2C2S1J2_17 + c3c4_p2s1j2_17*P2C3S1J2_17- (c4c2_p2s1j2_17+c4c3_p2s1j2_17)*P2C4S1J2_17+ j1j2_p2c4s1_17*P2C4S1J1_17 - j2j3_p2c4s1_17*P2C4S1J2_17
  deriv(P2C4S1J3_17) <- age_up*P2C4S1J3_16_lag - age_up*P2C4S1J3_17_lag  + f*P1C4S1J3_17 - r*P2C4S1J3_17- s1s2_p2c4j3_17*P2C4S1J3_17+ c2c4_p2s1j3_17*P2C2S1J3_17 + c3c4_p2s1j3_17*P2C3S1J3_17- (c4c2_p2s1j3_17+c4c3_p2s1j3_17)*P2C4S1J3_17+ j2j3_p2c4s1_17*P2C4S1J2_17 + j4j3_p2c4s1_17*P2C4S1J4_17 - j3j4_p2c4s1_17*P2C4S1J3_17
  deriv(P2C4S1J4_17) <- age_up*P2C4S1J4_16_lag - age_up*P2C4S1J4_17_lag  + f*P1C4S1J4_17 - r*P2C4S1J4_17- s1s2_p2c4j4_17*P2C4S1J4_17+ c2c4_p2s1j4_17*P2C2S1J4_17 + c3c4_p2s1j4_17*P2C3S1J4_17- (c4c2_p2s1j4_17+c4c3_p2s1j4_17)*P2C4S1J4_17+ j3j4_p2c4s1_17*P2C4S1J3_17 - j4j3_p2c4s1_17*P2C4S1J4_17
  deriv(P2C4S2J1_17) <- age_up*P2C4S2J1_16_lag - age_up*P2C4S2J1_17_lag  + f*P1C4S2J1_17 - r*P2C4S2J1_17+ s1s2_p2c4j1_17*P2C4S1J1_17 - s2s3_p2c4j1_17*P2C4S2J1_17 + s3s2_p2c4j1_17*P2C4S3J1_17+ c2c4_p2s2j1_17*P2C2S2J1_17 + c3c4_p2s2j1_17*P2C3S2J1_17- (c4c2_p2s2j1_17+c4c3_p2s2j1_17)*P2C4S2J1_17- j1j2_p2c4s2_17*P2C4S2J1_17
  deriv(P2C4S2J2_17) <- age_up*P2C4S2J2_16_lag - age_up*P2C4S2J2_17_lag  + f*P1C4S2J2_17 - r*P2C4S2J2_17+ s1s2_p2c4j2_17*P2C4S1J2_17 - s2s3_p2c4j2_17*P2C4S2J2_17 + s3s2_p2c4j2_17*P2C4S3J2_17+ c2c4_p2s2j2_17*P2C2S2J2_17 + c3c4_p2s2j2_17*P2C3S2J2_17- (c4c2_p2s2j2_17+c4c3_p2s2j2_17)*P2C4S2J2_17+ j1j2_p2c4s2_17*P2C4S2J1_17 - j2j3_p2c4s2_17*P2C4S2J2_17
  deriv(P2C4S2J3_17) <- age_up*P2C4S2J3_16_lag - age_up*P2C4S2J3_17_lag  + f*P1C4S2J3_17 - r*P2C4S2J3_17+ s1s2_p2c4j3_17*P2C4S1J3_17 - s2s3_p2c4j3_17*P2C4S2J3_17 + s3s2_p2c4j3_17*P2C4S3J3_17+ c2c4_p2s2j3_17*P2C2S2J3_17 + c3c4_p2s2j3_17*P2C3S2J3_17- (c4c2_p2s2j3_17+c4c3_p2s2j3_17)*P2C4S2J3_17+ j2j3_p2c4s2_17*P2C4S2J2_17 + j4j3_p2c4s2_17*P2C4S2J4_17 - j3j4_p2c4s2_17*P2C4S2J3_17
  deriv(P2C4S2J4_17) <- age_up*P2C4S2J4_16_lag - age_up*P2C4S2J4_17_lag  + f*P1C4S2J4_17 - r*P2C4S2J4_17+ s1s2_p2c4j4_17*P2C4S1J4_17 - s2s3_p2c4j4_17*P2C4S2J4_17 + s3s2_p2c4j4_17*P2C4S3J4_17+ c2c4_p2s2j4_17*P2C2S2J4_17 + c3c4_p2s2j4_17*P2C3S2J4_17- (c4c2_p2s2j4_17+c4c3_p2s2j4_17)*P2C4S2J4_17+ j3j4_p2c4s2_17*P2C4S2J3_17 - j4j3_p2c4s2_17*P2C4S2J4_17
  deriv(P2C4S3J1_17) <- age_up*P2C4S3J1_16_lag - age_up*P2C4S3J1_17_lag  + f*P1C4S3J1_17 - r*P2C4S3J1_17+ s2s3_p2c4j1_17*P2C4S2J1_17 - s3s2_p2c4j1_17*P2C4S3J1_17+ c2c4_p2s3j1_17*P2C2S3J1_17 + c3c4_p2s3j1_17*P2C3S3J1_17- (c4c2_p2s3j1_17+c4c3_p2s3j1_17)*P2C4S3J1_17- j1j2_p2c4s3_17*P2C4S3J1_17
  deriv(P2C4S3J2_17) <- age_up*P2C4S3J2_16_lag - age_up*P2C4S3J2_17_lag  + f*P1C4S3J2_17 - r*P2C4S3J2_17+ s2s3_p2c4j2_17*P2C4S2J2_17 - s3s2_p2c4j2_17*P2C4S3J2_17+ c2c4_p2s3j2_17*P2C2S3J2_17 + c3c4_p2s3j2_17*P2C3S3J2_17- (c4c2_p2s3j2_17+c4c3_p2s3j2_17)*P2C4S3J2_17+ j1j2_p2c4s3_17*P2C4S3J1_17 - j2j3_p2c4s3_17*P2C4S3J2_17
  deriv(P2C4S3J3_17) <- age_up*P2C4S3J3_16_lag - age_up*P2C4S3J3_17_lag  + f*P1C4S3J3_17 - r*P2C4S3J3_17+ s2s3_p2c4j3_17*P2C4S2J3_17 - s3s2_p2c4j3_17*P2C4S3J3_17+ c2c4_p2s3j3_17*P2C2S3J3_17 + c3c4_p2s3j3_17*P2C3S3J3_17- (c4c2_p2s3j3_17+c4c3_p2s3j3_17)*P2C4S3J3_17+ j2j3_p2c4s3_17*P2C4S3J2_17 + j4j3_p2c4s3_17*P2C4S3J4_17 - j3j4_p2c4s3_17*P2C4S3J3_17
  deriv(P2C4S3J4_17) <- age_up*P2C4S3J4_16_lag - age_up*P2C4S3J4_17_lag  + f*P1C4S3J4_17 - r*P2C4S3J4_17+ s2s3_p2c4j4_17*P2C4S2J4_17 - s3s2_p2c4j4_17*P2C4S3J4_17+ c2c4_p2s3j4_17*P2C2S3J4_17 + c3c4_p2s3j4_17*P2C3S3J4_17- (c4c2_p2s3j4_17+c4c3_p2s3j4_17)*P2C4S3J4_17+ j3j4_p2c4s3_17*P2C4S3J3_17 - j4j3_p2c4s3_17*P2C4S3J4_17  
  
  
  # interpolation section
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
  end_r <- interpolate(lact, eres, "spline")
  lact[] <- user()
  enr[] <- user()
  eres[] <- user()
  dim(lact) <- user()
  dim(enr) <- length(lact)
  dim(eres) <- length(lact)
  
  
  endcust10 <- interpolate(lact, ec10, "spline")
  endcust11 <- interpolate(lact, ec11, "spline")
  endcust12 <- interpolate(lact, ec12, "spline")
  endcust13 <- interpolate(lact, ec13, "spline")
  endcust14 <- interpolate(lact, ec14, "spline")
  endcust15 <- interpolate(lact, ec15, "spline")
  endcust16 <- interpolate(lact, ec16, "spline")
  endcust17 <- interpolate(lact, ec17, "spline")

  ec10[] <- user()
  ec11[] <- user()
  ec12[] <- user()
  ec13[] <- user()
  ec14[] <- user()
  ec15[] <- user()
  ec16[] <- user()
  ec17[] <- user()
 
  dim(ec10) <- length(lact)
  dim(ec11) <- length(lact)
  dim(ec12) <- length(lact)
  dim(ec13) <- length(lact)
  dim(ec14) <- length(lact)
  dim(ec15) <- length(lact)
  dim(ec16) <- length(lact)
  dim(ec17) <- length(lact)
  
  
  fte_p1c1s1_10 <- interpolate(lact, ftep1c1s110, "spline")
  fte_p1c1s2_10 <- interpolate(lact, ftep1c1s210, "spline")
  fte_p1c1s3_10 <- interpolate(lact, ftep1c1s310, "spline")
  fte_p1c2s1_10 <- interpolate(lact, ftep1c2s110, "spline")
  fte_p1c2s2_10 <- interpolate(lact, ftep1c2s210, "spline")
  fte_p1c2s3_10 <- interpolate(lact, ftep1c2s310, "spline")
  fte_p1c3s1_10 <- interpolate(lact, ftep1c3s110, "spline")
  fte_p1c3s2_10 <- interpolate(lact, ftep1c3s210, "spline")
  fte_p1c3s3_10 <- interpolate(lact, ftep1c3s310, "spline")
  fte_p1c4s1_10 <- interpolate(lact, ftep1c4s110, "spline")
  fte_p1c4s2_10 <- interpolate(lact, ftep1c4s210, "spline")
  fte_p1c4s3_10 <- interpolate(lact, ftep1c4s310, "spline")
  fte_p2c1s1_10 <- interpolate(lact, ftep2c1s110, "spline")
  fte_p2c1s2_10 <- interpolate(lact, ftep2c1s210, "spline")
  fte_p2c1s3_10 <- interpolate(lact, ftep2c1s310, "spline")
  fte_p2c2s1_10 <- interpolate(lact, ftep2c2s110, "spline")
  fte_p2c2s2_10 <- interpolate(lact, ftep2c2s210, "spline")
  fte_p2c2s3_10 <- interpolate(lact, ftep2c2s310, "spline")
  fte_p2c3s1_10 <- interpolate(lact, ftep2c3s110, "spline")
  fte_p2c3s2_10 <- interpolate(lact, ftep2c3s210, "spline")
  fte_p2c3s3_10 <- interpolate(lact, ftep2c3s310, "spline")
  fte_p2c4s1_10 <- interpolate(lact, ftep2c4s110, "spline")
  fte_p2c4s2_10 <- interpolate(lact, ftep2c4s210, "spline")
  fte_p2c4s3_10 <- interpolate(lact, ftep2c4s310, "spline")
  fte_p1c1s1_11 <- interpolate(lact, ftep1c1s111, "spline")
  fte_p1c1s2_11 <- interpolate(lact, ftep1c1s211, "spline")
  fte_p1c1s3_11 <- interpolate(lact, ftep1c1s311, "spline")
  fte_p1c2s1_11 <- interpolate(lact, ftep1c2s111, "spline")
  fte_p1c2s2_11 <- interpolate(lact, ftep1c2s211, "spline")
  fte_p1c2s3_11 <- interpolate(lact, ftep1c2s311, "spline")
  fte_p1c3s1_11 <- interpolate(lact, ftep1c3s111, "spline")
  fte_p1c3s2_11 <- interpolate(lact, ftep1c3s211, "spline")
  fte_p1c3s3_11 <- interpolate(lact, ftep1c3s311, "spline")
  fte_p1c4s1_11 <- interpolate(lact, ftep1c4s111, "spline")
  fte_p1c4s2_11 <- interpolate(lact, ftep1c4s211, "spline")
  fte_p1c4s3_11 <- interpolate(lact, ftep1c4s311, "spline")
  fte_p2c1s1_11 <- interpolate(lact, ftep2c1s111, "spline")
  fte_p2c1s2_11 <- interpolate(lact, ftep2c1s211, "spline")
  fte_p2c1s3_11 <- interpolate(lact, ftep2c1s311, "spline")
  fte_p2c2s1_11 <- interpolate(lact, ftep2c2s111, "spline")
  fte_p2c2s2_11 <- interpolate(lact, ftep2c2s211, "spline")
  fte_p2c2s3_11 <- interpolate(lact, ftep2c2s311, "spline")
  fte_p2c3s1_11 <- interpolate(lact, ftep2c3s111, "spline")
  fte_p2c3s2_11 <- interpolate(lact, ftep2c3s211, "spline")
  fte_p2c3s3_11 <- interpolate(lact, ftep2c3s311, "spline")
  fte_p2c4s1_11 <- interpolate(lact, ftep2c4s111, "spline")
  fte_p2c4s2_11 <- interpolate(lact, ftep2c4s211, "spline")
  fte_p2c4s3_11 <- interpolate(lact, ftep2c4s311, "spline")
  fte_p1c1s1_12 <- interpolate(lact, ftep1c1s112, "spline")
  fte_p1c1s2_12 <- interpolate(lact, ftep1c1s212, "spline")
  fte_p1c1s3_12 <- interpolate(lact, ftep1c1s312, "spline")
  fte_p1c2s1_12 <- interpolate(lact, ftep1c2s112, "spline")
  fte_p1c2s2_12 <- interpolate(lact, ftep1c2s212, "spline")
  fte_p1c2s3_12 <- interpolate(lact, ftep1c2s312, "spline")
  fte_p1c3s1_12 <- interpolate(lact, ftep1c3s112, "spline")
  fte_p1c3s2_12 <- interpolate(lact, ftep1c3s212, "spline")
  fte_p1c3s3_12 <- interpolate(lact, ftep1c3s312, "spline")
  fte_p1c4s1_12 <- interpolate(lact, ftep1c4s112, "spline")
  fte_p1c4s2_12 <- interpolate(lact, ftep1c4s212, "spline")
  fte_p1c4s3_12 <- interpolate(lact, ftep1c4s312, "spline")
  fte_p2c1s1_12 <- interpolate(lact, ftep2c1s112, "spline")
  fte_p2c1s2_12 <- interpolate(lact, ftep2c1s212, "spline")
  fte_p2c1s3_12 <- interpolate(lact, ftep2c1s312, "spline")
  fte_p2c2s1_12 <- interpolate(lact, ftep2c2s112, "spline")
  fte_p2c2s2_12 <- interpolate(lact, ftep2c2s212, "spline")
  fte_p2c2s3_12 <- interpolate(lact, ftep2c2s312, "spline")
  fte_p2c3s1_12 <- interpolate(lact, ftep2c3s112, "spline")
  fte_p2c3s2_12 <- interpolate(lact, ftep2c3s212, "spline")
  fte_p2c3s3_12 <- interpolate(lact, ftep2c3s312, "spline")
  fte_p2c4s1_12 <- interpolate(lact, ftep2c4s112, "spline")
  fte_p2c4s2_12 <- interpolate(lact, ftep2c4s212, "spline")
  fte_p2c4s3_12 <- interpolate(lact, ftep2c4s312, "spline")
  fte_p1c1s1_13 <- interpolate(lact, ftep1c1s113, "spline")
  fte_p1c1s2_13 <- interpolate(lact, ftep1c1s213, "spline")
  fte_p1c1s3_13 <- interpolate(lact, ftep1c1s313, "spline")
  fte_p1c2s1_13 <- interpolate(lact, ftep1c2s113, "spline")
  fte_p1c2s2_13 <- interpolate(lact, ftep1c2s213, "spline")
  fte_p1c2s3_13 <- interpolate(lact, ftep1c2s313, "spline")
  fte_p1c3s1_13 <- interpolate(lact, ftep1c3s113, "spline")
  fte_p1c3s2_13 <- interpolate(lact, ftep1c3s213, "spline")
  fte_p1c3s3_13 <- interpolate(lact, ftep1c3s313, "spline")
  fte_p1c4s1_13 <- interpolate(lact, ftep1c4s113, "spline")
  fte_p1c4s2_13 <- interpolate(lact, ftep1c4s213, "spline")
  fte_p1c4s3_13 <- interpolate(lact, ftep1c4s313, "spline")
  fte_p2c1s1_13 <- interpolate(lact, ftep2c1s113, "spline")
  fte_p2c1s2_13 <- interpolate(lact, ftep2c1s213, "spline")
  fte_p2c1s3_13 <- interpolate(lact, ftep2c1s313, "spline")
  fte_p2c2s1_13 <- interpolate(lact, ftep2c2s113, "spline")
  fte_p2c2s2_13 <- interpolate(lact, ftep2c2s213, "spline")
  fte_p2c2s3_13 <- interpolate(lact, ftep2c2s313, "spline")
  fte_p2c3s1_13 <- interpolate(lact, ftep2c3s113, "spline")
  fte_p2c3s2_13 <- interpolate(lact, ftep2c3s213, "spline")
  fte_p2c3s3_13 <- interpolate(lact, ftep2c3s313, "spline")
  fte_p2c4s1_13 <- interpolate(lact, ftep2c4s113, "spline")
  fte_p2c4s2_13 <- interpolate(lact, ftep2c4s213, "spline")
  fte_p2c4s3_13 <- interpolate(lact, ftep2c4s313, "spline")
  fte_p1c1s1_14 <- interpolate(lact, ftep1c1s114, "spline")
  fte_p1c1s2_14 <- interpolate(lact, ftep1c1s214, "spline")
  fte_p1c1s3_14 <- interpolate(lact, ftep1c1s314, "spline")
  fte_p1c2s1_14 <- interpolate(lact, ftep1c2s114, "spline")
  fte_p1c2s2_14 <- interpolate(lact, ftep1c2s214, "spline")
  fte_p1c2s3_14 <- interpolate(lact, ftep1c2s314, "spline")
  fte_p1c3s1_14 <- interpolate(lact, ftep1c3s114, "spline")
  fte_p1c3s2_14 <- interpolate(lact, ftep1c3s214, "spline")
  fte_p1c3s3_14 <- interpolate(lact, ftep1c3s314, "spline")
  fte_p1c4s1_14 <- interpolate(lact, ftep1c4s114, "spline")
  fte_p1c4s2_14 <- interpolate(lact, ftep1c4s214, "spline")
  fte_p1c4s3_14 <- interpolate(lact, ftep1c4s314, "spline")
  fte_p2c1s1_14 <- interpolate(lact, ftep2c1s114, "spline")
  fte_p2c1s2_14 <- interpolate(lact, ftep2c1s214, "spline")
  fte_p2c1s3_14 <- interpolate(lact, ftep2c1s314, "spline")
  fte_p2c2s1_14 <- interpolate(lact, ftep2c2s114, "spline")
  fte_p2c2s2_14 <- interpolate(lact, ftep2c2s214, "spline")
  fte_p2c2s3_14 <- interpolate(lact, ftep2c2s314, "spline")
  fte_p2c3s1_14 <- interpolate(lact, ftep2c3s114, "spline")
  fte_p2c3s2_14 <- interpolate(lact, ftep2c3s214, "spline")
  fte_p2c3s3_14 <- interpolate(lact, ftep2c3s314, "spline")
  fte_p2c4s1_14 <- interpolate(lact, ftep2c4s114, "spline")
  fte_p2c4s2_14 <- interpolate(lact, ftep2c4s214, "spline")
  fte_p2c4s3_14 <- interpolate(lact, ftep2c4s314, "spline")
  fte_p1c1s1_15 <- interpolate(lact, ftep1c1s115, "spline")
  fte_p1c1s2_15 <- interpolate(lact, ftep1c1s215, "spline")
  fte_p1c1s3_15 <- interpolate(lact, ftep1c1s315, "spline")
  fte_p1c2s1_15 <- interpolate(lact, ftep1c2s115, "spline")
  fte_p1c2s2_15 <- interpolate(lact, ftep1c2s215, "spline")
  fte_p1c2s3_15 <- interpolate(lact, ftep1c2s315, "spline")
  fte_p1c3s1_15 <- interpolate(lact, ftep1c3s115, "spline")
  fte_p1c3s2_15 <- interpolate(lact, ftep1c3s215, "spline")
  fte_p1c3s3_15 <- interpolate(lact, ftep1c3s315, "spline")
  fte_p1c4s1_15 <- interpolate(lact, ftep1c4s115, "spline")
  fte_p1c4s2_15 <- interpolate(lact, ftep1c4s215, "spline")
  fte_p1c4s3_15 <- interpolate(lact, ftep1c4s315, "spline")
  fte_p2c1s1_15 <- interpolate(lact, ftep2c1s115, "spline")
  fte_p2c1s2_15 <- interpolate(lact, ftep2c1s215, "spline")
  fte_p2c1s3_15 <- interpolate(lact, ftep2c1s315, "spline")
  fte_p2c2s1_15 <- interpolate(lact, ftep2c2s115, "spline")
  fte_p2c2s2_15 <- interpolate(lact, ftep2c2s215, "spline")
  fte_p2c2s3_15 <- interpolate(lact, ftep2c2s315, "spline")
  fte_p2c3s1_15 <- interpolate(lact, ftep2c3s115, "spline")
  fte_p2c3s2_15 <- interpolate(lact, ftep2c3s215, "spline")
  fte_p2c3s3_15 <- interpolate(lact, ftep2c3s315, "spline")
  fte_p2c4s1_15 <- interpolate(lact, ftep2c4s115, "spline")
  fte_p2c4s2_15 <- interpolate(lact, ftep2c4s215, "spline")
  fte_p2c4s3_15 <- interpolate(lact, ftep2c4s315, "spline")
  fte_p1c1s1_16 <- interpolate(lact, ftep1c1s116, "spline")
  fte_p1c1s2_16 <- interpolate(lact, ftep1c1s216, "spline")
  fte_p1c1s3_16 <- interpolate(lact, ftep1c1s316, "spline")
  fte_p1c2s1_16 <- interpolate(lact, ftep1c2s116, "spline")
  fte_p1c2s2_16 <- interpolate(lact, ftep1c2s216, "spline")
  fte_p1c2s3_16 <- interpolate(lact, ftep1c2s316, "spline")
  fte_p1c3s1_16 <- interpolate(lact, ftep1c3s116, "spline")
  fte_p1c3s2_16 <- interpolate(lact, ftep1c3s216, "spline")
  fte_p1c3s3_16 <- interpolate(lact, ftep1c3s316, "spline")
  fte_p1c4s1_16 <- interpolate(lact, ftep1c4s116, "spline")
  fte_p1c4s2_16 <- interpolate(lact, ftep1c4s216, "spline")
  fte_p1c4s3_16 <- interpolate(lact, ftep1c4s316, "spline")
  fte_p2c1s1_16 <- interpolate(lact, ftep2c1s116, "spline")
  fte_p2c1s2_16 <- interpolate(lact, ftep2c1s216, "spline")
  fte_p2c1s3_16 <- interpolate(lact, ftep2c1s316, "spline")
  fte_p2c2s1_16 <- interpolate(lact, ftep2c2s116, "spline")
  fte_p2c2s2_16 <- interpolate(lact, ftep2c2s216, "spline")
  fte_p2c2s3_16 <- interpolate(lact, ftep2c2s316, "spline")
  fte_p2c3s1_16 <- interpolate(lact, ftep2c3s116, "spline")
  fte_p2c3s2_16 <- interpolate(lact, ftep2c3s216, "spline")
  fte_p2c3s3_16 <- interpolate(lact, ftep2c3s316, "spline")
  fte_p2c4s1_16 <- interpolate(lact, ftep2c4s116, "spline")
  fte_p2c4s2_16 <- interpolate(lact, ftep2c4s216, "spline")
  fte_p2c4s3_16 <- interpolate(lact, ftep2c4s316, "spline")
  fte_p1c1s1_17 <- interpolate(lact, ftep1c1s117, "spline")
  fte_p1c1s2_17 <- interpolate(lact, ftep1c1s217, "spline")
  fte_p1c1s3_17 <- interpolate(lact, ftep1c1s317, "spline")
  fte_p1c2s1_17 <- interpolate(lact, ftep1c2s117, "spline")
  fte_p1c2s2_17 <- interpolate(lact, ftep1c2s217, "spline")
  fte_p1c2s3_17 <- interpolate(lact, ftep1c2s317, "spline")
  fte_p1c3s1_17 <- interpolate(lact, ftep1c3s117, "spline")
  fte_p1c3s2_17 <- interpolate(lact, ftep1c3s217, "spline")
  fte_p1c3s3_17 <- interpolate(lact, ftep1c3s317, "spline")
  fte_p1c4s1_17 <- interpolate(lact, ftep1c4s117, "spline")
  fte_p1c4s2_17 <- interpolate(lact, ftep1c4s217, "spline")
  fte_p1c4s3_17 <- interpolate(lact, ftep1c4s317, "spline")
  fte_p2c1s1_17 <- interpolate(lact, ftep2c1s117, "spline")
  fte_p2c1s2_17 <- interpolate(lact, ftep2c1s217, "spline")
  fte_p2c1s3_17 <- interpolate(lact, ftep2c1s317, "spline")
  fte_p2c2s1_17 <- interpolate(lact, ftep2c2s117, "spline")
  fte_p2c2s2_17 <- interpolate(lact, ftep2c2s217, "spline")
  fte_p2c2s3_17 <- interpolate(lact, ftep2c2s317, "spline")
  fte_p2c3s1_17 <- interpolate(lact, ftep2c3s117, "spline")
  fte_p2c3s2_17 <- interpolate(lact, ftep2c3s217, "spline")
  fte_p2c3s3_17 <- interpolate(lact, ftep2c3s317, "spline")
  fte_p2c4s1_17 <- interpolate(lact, ftep2c4s117, "spline")
  fte_p2c4s2_17 <- interpolate(lact, ftep2c4s217, "spline")
  fte_p2c4s3_17 <- interpolate(lact, ftep2c4s317, "spline")
  
  dim(ftep1c1s110) <- length(lact)
  dim(ftep1c1s210) <- length(lact)
  dim(ftep1c1s310) <- length(lact)
  dim(ftep1c2s110) <- length(lact)
  dim(ftep1c2s210) <- length(lact)
  dim(ftep1c2s310) <- length(lact)
  dim(ftep1c3s110) <- length(lact)
  dim(ftep1c3s210) <- length(lact)
  dim(ftep1c3s310) <- length(lact)
  dim(ftep1c4s110) <- length(lact)
  dim(ftep1c4s210) <- length(lact)
  dim(ftep1c4s310) <- length(lact)
  dim(ftep2c1s110) <- length(lact)
  dim(ftep2c1s210) <- length(lact)
  dim(ftep2c1s310) <- length(lact)
  dim(ftep2c2s110) <- length(lact)
  dim(ftep2c2s210) <- length(lact)
  dim(ftep2c2s310) <- length(lact)
  dim(ftep2c3s110) <- length(lact)
  dim(ftep2c3s210) <- length(lact)
  dim(ftep2c3s310) <- length(lact)
  dim(ftep2c4s110) <- length(lact)
  dim(ftep2c4s210) <- length(lact)
  dim(ftep2c4s310) <- length(lact)
  dim(ftep1c1s111) <- length(lact)
  dim(ftep1c1s211) <- length(lact)
  dim(ftep1c1s311) <- length(lact)
  dim(ftep1c2s111) <- length(lact)
  dim(ftep1c2s211) <- length(lact)
  dim(ftep1c2s311) <- length(lact)
  dim(ftep1c3s111) <- length(lact)
  dim(ftep1c3s211) <- length(lact)
  dim(ftep1c3s311) <- length(lact)
  dim(ftep1c4s111) <- length(lact)
  dim(ftep1c4s211) <- length(lact)
  dim(ftep1c4s311) <- length(lact)
  dim(ftep2c1s111) <- length(lact)
  dim(ftep2c1s211) <- length(lact)
  dim(ftep2c1s311) <- length(lact)
  dim(ftep2c2s111) <- length(lact)
  dim(ftep2c2s211) <- length(lact)
  dim(ftep2c2s311) <- length(lact)
  dim(ftep2c3s111) <- length(lact)
  dim(ftep2c3s211) <- length(lact)
  dim(ftep2c3s311) <- length(lact)
  dim(ftep2c4s111) <- length(lact)
  dim(ftep2c4s211) <- length(lact)
  dim(ftep2c4s311) <- length(lact)
  dim(ftep1c1s112) <- length(lact)
  dim(ftep1c1s212) <- length(lact)
  dim(ftep1c1s312) <- length(lact)
  dim(ftep1c2s112) <- length(lact)
  dim(ftep1c2s212) <- length(lact)
  dim(ftep1c2s312) <- length(lact)
  dim(ftep1c3s112) <- length(lact)
  dim(ftep1c3s212) <- length(lact)
  dim(ftep1c3s312) <- length(lact)
  dim(ftep1c4s112) <- length(lact)
  dim(ftep1c4s212) <- length(lact)
  dim(ftep1c4s312) <- length(lact)
  dim(ftep2c1s112) <- length(lact)
  dim(ftep2c1s212) <- length(lact)
  dim(ftep2c1s312) <- length(lact)
  dim(ftep2c2s112) <- length(lact)
  dim(ftep2c2s212) <- length(lact)
  dim(ftep2c2s312) <- length(lact)
  dim(ftep2c3s112) <- length(lact)
  dim(ftep2c3s212) <- length(lact)
  dim(ftep2c3s312) <- length(lact)
  dim(ftep2c4s112) <- length(lact)
  dim(ftep2c4s212) <- length(lact)
  dim(ftep2c4s312) <- length(lact)
  dim(ftep1c1s113) <- length(lact)
  dim(ftep1c1s213) <- length(lact)
  dim(ftep1c1s313) <- length(lact)
  dim(ftep1c2s113) <- length(lact)
  dim(ftep1c2s213) <- length(lact)
  dim(ftep1c2s313) <- length(lact)
  dim(ftep1c3s113) <- length(lact)
  dim(ftep1c3s213) <- length(lact)
  dim(ftep1c3s313) <- length(lact)
  dim(ftep1c4s113) <- length(lact)
  dim(ftep1c4s213) <- length(lact)
  dim(ftep1c4s313) <- length(lact)
  dim(ftep2c1s113) <- length(lact)
  dim(ftep2c1s213) <- length(lact)
  dim(ftep2c1s313) <- length(lact)
  dim(ftep2c2s113) <- length(lact)
  dim(ftep2c2s213) <- length(lact)
  dim(ftep2c2s313) <- length(lact)
  dim(ftep2c3s113) <- length(lact)
  dim(ftep2c3s213) <- length(lact)
  dim(ftep2c3s313) <- length(lact)
  dim(ftep2c4s113) <- length(lact)
  dim(ftep2c4s213) <- length(lact)
  dim(ftep2c4s313) <- length(lact)
  dim(ftep1c1s114) <- length(lact)
  dim(ftep1c1s214) <- length(lact)
  dim(ftep1c1s314) <- length(lact)
  dim(ftep1c2s114) <- length(lact)
  dim(ftep1c2s214) <- length(lact)
  dim(ftep1c2s314) <- length(lact)
  dim(ftep1c3s114) <- length(lact)
  dim(ftep1c3s214) <- length(lact)
  dim(ftep1c3s314) <- length(lact)
  dim(ftep1c4s114) <- length(lact)
  dim(ftep1c4s214) <- length(lact)
  dim(ftep1c4s314) <- length(lact)
  dim(ftep2c1s114) <- length(lact)
  dim(ftep2c1s214) <- length(lact)
  dim(ftep2c1s314) <- length(lact)
  dim(ftep2c2s114) <- length(lact)
  dim(ftep2c2s214) <- length(lact)
  dim(ftep2c2s314) <- length(lact)
  dim(ftep2c3s114) <- length(lact)
  dim(ftep2c3s214) <- length(lact)
  dim(ftep2c3s314) <- length(lact)
  dim(ftep2c4s114) <- length(lact)
  dim(ftep2c4s214) <- length(lact)
  dim(ftep2c4s314) <- length(lact)
  dim(ftep1c1s115) <- length(lact)
  dim(ftep1c1s215) <- length(lact)
  dim(ftep1c1s315) <- length(lact)
  dim(ftep1c2s115) <- length(lact)
  dim(ftep1c2s215) <- length(lact)
  dim(ftep1c2s315) <- length(lact)
  dim(ftep1c3s115) <- length(lact)
  dim(ftep1c3s215) <- length(lact)
  dim(ftep1c3s315) <- length(lact)
  dim(ftep1c4s115) <- length(lact)
  dim(ftep1c4s215) <- length(lact)
  dim(ftep1c4s315) <- length(lact)
  dim(ftep2c1s115) <- length(lact)
  dim(ftep2c1s215) <- length(lact)
  dim(ftep2c1s315) <- length(lact)
  dim(ftep2c2s115) <- length(lact)
  dim(ftep2c2s215) <- length(lact)
  dim(ftep2c2s315) <- length(lact)
  dim(ftep2c3s115) <- length(lact)
  dim(ftep2c3s215) <- length(lact)
  dim(ftep2c3s315) <- length(lact)
  dim(ftep2c4s115) <- length(lact)
  dim(ftep2c4s215) <- length(lact)
  dim(ftep2c4s315) <- length(lact)
  dim(ftep1c1s116) <- length(lact)
  dim(ftep1c1s216) <- length(lact)
  dim(ftep1c1s316) <- length(lact)
  dim(ftep1c2s116) <- length(lact)
  dim(ftep1c2s216) <- length(lact)
  dim(ftep1c2s316) <- length(lact)
  dim(ftep1c3s116) <- length(lact)
  dim(ftep1c3s216) <- length(lact)
  dim(ftep1c3s316) <- length(lact)
  dim(ftep1c4s116) <- length(lact)
  dim(ftep1c4s216) <- length(lact)
  dim(ftep1c4s316) <- length(lact)
  dim(ftep2c1s116) <- length(lact)
  dim(ftep2c1s216) <- length(lact)
  dim(ftep2c1s316) <- length(lact)
  dim(ftep2c2s116) <- length(lact)
  dim(ftep2c2s216) <- length(lact)
  dim(ftep2c2s316) <- length(lact)
  dim(ftep2c3s116) <- length(lact)
  dim(ftep2c3s216) <- length(lact)
  dim(ftep2c3s316) <- length(lact)
  dim(ftep2c4s116) <- length(lact)
  dim(ftep2c4s216) <- length(lact)
  dim(ftep2c4s316) <- length(lact)
  dim(ftep1c1s117) <- length(lact)
  dim(ftep1c1s217) <- length(lact)
  dim(ftep1c1s317) <- length(lact)
  dim(ftep1c2s117) <- length(lact)
  dim(ftep1c2s217) <- length(lact)
  dim(ftep1c2s317) <- length(lact)
  dim(ftep1c3s117) <- length(lact)
  dim(ftep1c3s217) <- length(lact)
  dim(ftep1c3s317) <- length(lact)
  dim(ftep1c4s117) <- length(lact)
  dim(ftep1c4s217) <- length(lact)
  dim(ftep1c4s317) <- length(lact)
  dim(ftep2c1s117) <- length(lact)
  dim(ftep2c1s217) <- length(lact)
  dim(ftep2c1s317) <- length(lact)
  dim(ftep2c2s117) <- length(lact)
  dim(ftep2c2s217) <- length(lact)
  dim(ftep2c2s317) <- length(lact)
  dim(ftep2c3s117) <- length(lact)
  dim(ftep2c3s217) <- length(lact)
  dim(ftep2c3s317) <- length(lact)
  dim(ftep2c4s117) <- length(lact)
  dim(ftep2c4s217) <- length(lact)
  dim(ftep2c4s317) <- length(lact)
  

  ftep1c1s110[] <- user()
  ftep1c1s210[] <- user()
  ftep1c1s310[] <- user()
  ftep1c2s110[] <- user()
  ftep1c2s210[] <- user()
  ftep1c2s310[] <- user()
  ftep1c3s110[] <- user()
  ftep1c3s210[] <- user()
  ftep1c3s310[] <- user()
  ftep1c4s110[] <- user()
  ftep1c4s210[] <- user()
  ftep1c4s310[] <- user()
  ftep2c1s110[] <- user()
  ftep2c1s210[] <- user()
  ftep2c1s310[] <- user()
  ftep2c2s110[] <- user()
  ftep2c2s210[] <- user()
  ftep2c2s310[] <- user()
  ftep2c3s110[] <- user()
  ftep2c3s210[] <- user()
  ftep2c3s310[] <- user()
  ftep2c4s110[] <- user()
  ftep2c4s210[] <- user()
  ftep2c4s310[] <- user()
  ftep1c1s111[] <- user()
  ftep1c1s211[] <- user()
  ftep1c1s311[] <- user()
  ftep1c2s111[] <- user()
  ftep1c2s211[] <- user()
  ftep1c2s311[] <- user()
  ftep1c3s111[] <- user()
  ftep1c3s211[] <- user()
  ftep1c3s311[] <- user()
  ftep1c4s111[] <- user()
  ftep1c4s211[] <- user()
  ftep1c4s311[] <- user()
  ftep2c1s111[] <- user()
  ftep2c1s211[] <- user()
  ftep2c1s311[] <- user()
  ftep2c2s111[] <- user()
  ftep2c2s211[] <- user()
  ftep2c2s311[] <- user()
  ftep2c3s111[] <- user()
  ftep2c3s211[] <- user()
  ftep2c3s311[] <- user()
  ftep2c4s111[] <- user()
  ftep2c4s211[] <- user()
  ftep2c4s311[] <- user()
  ftep1c1s112[] <- user()
  ftep1c1s212[] <- user()
  ftep1c1s312[] <- user()
  ftep1c2s112[] <- user()
  ftep1c2s212[] <- user()
  ftep1c2s312[] <- user()
  ftep1c3s112[] <- user()
  ftep1c3s212[] <- user()
  ftep1c3s312[] <- user()
  ftep1c4s112[] <- user()
  ftep1c4s212[] <- user()
  ftep1c4s312[] <- user()
  ftep2c1s112[] <- user()
  ftep2c1s212[] <- user()
  ftep2c1s312[] <- user()
  ftep2c2s112[] <- user()
  ftep2c2s212[] <- user()
  ftep2c2s312[] <- user()
  ftep2c3s112[] <- user()
  ftep2c3s212[] <- user()
  ftep2c3s312[] <- user()
  ftep2c4s112[] <- user()
  ftep2c4s212[] <- user()
  ftep2c4s312[] <- user()
  ftep1c1s113[] <- user()
  ftep1c1s213[] <- user()
  ftep1c1s313[] <- user()
  ftep1c2s113[] <- user()
  ftep1c2s213[] <- user()
  ftep1c2s313[] <- user()
  ftep1c3s113[] <- user()
  ftep1c3s213[] <- user()
  ftep1c3s313[] <- user()
  ftep1c4s113[] <- user()
  ftep1c4s213[] <- user()
  ftep1c4s313[] <- user()
  ftep2c1s113[] <- user()
  ftep2c1s213[] <- user()
  ftep2c1s313[] <- user()
  ftep2c2s113[] <- user()
  ftep2c2s213[] <- user()
  ftep2c2s313[] <- user()
  ftep2c3s113[] <- user()
  ftep2c3s213[] <- user()
  ftep2c3s313[] <- user()
  ftep2c4s113[] <- user()
  ftep2c4s213[] <- user()
  ftep2c4s313[] <- user()
  ftep1c1s114[] <- user()
  ftep1c1s214[] <- user()
  ftep1c1s314[] <- user()
  ftep1c2s114[] <- user()
  ftep1c2s214[] <- user()
  ftep1c2s314[] <- user()
  ftep1c3s114[] <- user()
  ftep1c3s214[] <- user()
  ftep1c3s314[] <- user()
  ftep1c4s114[] <- user()
  ftep1c4s214[] <- user()
  ftep1c4s314[] <- user()
  ftep2c1s114[] <- user()
  ftep2c1s214[] <- user()
  ftep2c1s314[] <- user()
  ftep2c2s114[] <- user()
  ftep2c2s214[] <- user()
  ftep2c2s314[] <- user()
  ftep2c3s114[] <- user()
  ftep2c3s214[] <- user()
  ftep2c3s314[] <- user()
  ftep2c4s114[] <- user()
  ftep2c4s214[] <- user()
  ftep2c4s314[] <- user()
  ftep1c1s115[] <- user()
  ftep1c1s215[] <- user()
  ftep1c1s315[] <- user()
  ftep1c2s115[] <- user()
  ftep1c2s215[] <- user()
  ftep1c2s315[] <- user()
  ftep1c3s115[] <- user()
  ftep1c3s215[] <- user()
  ftep1c3s315[] <- user()
  ftep1c4s115[] <- user()
  ftep1c4s215[] <- user()
  ftep1c4s315[] <- user()
  ftep2c1s115[] <- user()
  ftep2c1s215[] <- user()
  ftep2c1s315[] <- user()
  ftep2c2s115[] <- user()
  ftep2c2s215[] <- user()
  ftep2c2s315[] <- user()
  ftep2c3s115[] <- user()
  ftep2c3s215[] <- user()
  ftep2c3s315[] <- user()
  ftep2c4s115[] <- user()
  ftep2c4s215[] <- user()
  ftep2c4s315[] <- user()
  ftep1c1s116[] <- user()
  ftep1c1s216[] <- user()
  ftep1c1s316[] <- user()
  ftep1c2s116[] <- user()
  ftep1c2s216[] <- user()
  ftep1c2s316[] <- user()
  ftep1c3s116[] <- user()
  ftep1c3s216[] <- user()
  ftep1c3s316[] <- user()
  ftep1c4s116[] <- user()
  ftep1c4s216[] <- user()
  ftep1c4s316[] <- user()
  ftep2c1s116[] <- user()
  ftep2c1s216[] <- user()
  ftep2c1s316[] <- user()
  ftep2c2s116[] <- user()
  ftep2c2s216[] <- user()
  ftep2c2s316[] <- user()
  ftep2c3s116[] <- user()
  ftep2c3s216[] <- user()
  ftep2c3s316[] <- user()
  ftep2c4s116[] <- user()
  ftep2c4s216[] <- user()
  ftep2c4s316[] <- user()
  ftep1c1s117[] <- user()
  ftep1c1s217[] <- user()
  ftep1c1s317[] <- user()
  ftep1c2s117[] <- user()
  ftep1c2s217[] <- user()
  ftep1c2s317[] <- user()
  ftep1c3s117[] <- user()
  ftep1c3s217[] <- user()
  ftep1c3s317[] <- user()
  ftep1c4s117[] <- user()
  ftep1c4s217[] <- user()
  ftep1c4s317[] <- user()
  ftep2c1s117[] <- user()
  ftep2c1s217[] <- user()
  ftep2c1s317[] <- user()
  ftep2c2s117[] <- user()
  ftep2c2s217[] <- user()
  ftep2c2s317[] <- user()
  ftep2c3s117[] <- user()
  ftep2c3s217[] <- user()
  ftep2c3s317[] <- user()
  ftep2c4s117[] <- user()
  ftep2c4s217[] <- user()
  ftep2c4s317[] <- user()
  
  output(turn10) <- turn10
  
  },
target = 'c')  
  

  
pars <- list(tt = t_turn10,
             y = v_turn10[,1],
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
             
             
             tau = 20,
             
             neet16 = 0.02, 
             vsig_p = 1,
             vsig_c = 1,
             vsig_s = 1, 
             vsig_j = 1,
             
             sig_p = 1,
             sig_c = 1,
             sig_j = 1,
             
             phi_p = 2,
             
             c1c10 = 0.00001,
             c1c11 = 0.00001,
             c1c12 = 0.00003,
             c1c13 = 0.00003,
             c1c14 = 0.00003,
             c1c15 = 0.00003,
             c1c16 = 0.00004,
             c1c17 = 0.00004,
             
             c4c10 = 0.003,
             c4c11 = 0.003,
             c4c12 = 0.003,
             c4c13 = 0.003,
             c4c14 = 0.003,
             c4c15 = 0.004,
             c4c16 = 0.005,
             c4c17 = 0.006,
             
             stay10 = 0.66, 
             stay11 = 0.66, 
             stay12 = 0.66, 
             stay13 = 0.66, 
             stay14 = 0.72, 
             stay15 = 0.80, 
             stay16 = 0.85, 
             stay17 = 0.9, 
             
             r10 = 0.2, 
             r11 = 0.22, 
             r12 = 0.25, 
             r13 = 0.28, 
             r14 = 0.3, 
             r15 = 0.4, 
             r16 = 0.5, 
             r17 = 0.6, 
             
            
             pc_p1 = 0.73,
             pc_p2 = 0.27,
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
             P2C4S3J4_17_ini = ic(a=17, p=2, c=4, s=3, j=4))
  



mod <- new_model$new(user = pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))

  


  
  mod_states <- mod_data %>%
    select(-turn10) %>% 
    pivot_longer(-t, names_to = "state", values_to = "count") %>%
    mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
           state = str_remove(state, "(\\d{2})"),
           poverty = ifelse(grepl("P1", state), "Not in poverty", "In poverty"),
           care = ifelse(grepl("C1", state), "Never", NA),
           care = ifelse(grepl("C2", state), "Not residential", care),
           care = ifelse(grepl("C3", state), "Residential", care),
           care = ifelse(grepl("C4", state), "Prior", care),
           school = ifelse(grepl("S1", state), "Never", "PRU"),
           school = ifelse(grepl("S3", state), "Prior", school),
           yjs = ifelse(grepl("J1", state), "No contact with YJS", NA),
           yjs = ifelse(grepl("J2", state), "Known to police", yjs),
           yjs = ifelse(grepl("J3", state), "In the YJS", yjs),
           yjs = ifelse(grepl("J4", state), "In custody", yjs)) %>% 
    select(-state)


  check <- mod_states %>% 
    filter(is.na(yjs))
  
  # c <- v_turn10_e_scenario + v_turn10_i_scenario
  
  
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
  
  

  compare_pop %>%
    ggplot() +
    geom_line(aes(x = t, y = count, group = compare, color =compare)) +
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
                mutate(compare = "Est data"))
  
  
  compare_care %>%
    filter(care == "Never") %>% 
    ggplot() +
    geom_line(aes(x = t, y = count, group = interaction(compare, poverty), color =interaction(compare, poverty))) +
    facet_wrap(~age) +
    scale_x_continuous(breaks = seq(0, 520, 52),
                       labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                  "2016", "2017", "2018", "2019", "2020")) +
    scale_color_manual(values=c("skyblue","navy", "pink", "red"))
  
  
  
  compare_care %>%
    filter(care == "Not residential") %>% 
    ggplot() +
    geom_line(aes(x = t, y = count, group = interaction(compare, poverty), color =interaction(compare, poverty))) +
    facet_wrap(~age) +
    scale_x_continuous(breaks = seq(0, 520, 52),
                       labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                  "2016", "2017", "2018", "2019", "2020")) +
    scale_color_manual(values=c("skyblue","navy", "pink", "red"))
  
  
  compare_care %>%
    filter(care == "Residential") %>% 
    ggplot() +
    geom_line(aes(x = t, y = count, group = interaction(compare, poverty), color =interaction(compare, poverty))) +
    facet_wrap(~age) +
    scale_x_continuous(breaks = seq(0, 520, 52),
                       labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                  "2016", "2017", "2018", "2019", "2020")) +
    scale_color_manual(values=c("skyblue","navy", "pink", "red"))
  
  
  
  compare_care %>%
    filter(care == "Prior") %>% 
    ggplot() +
    geom_line(aes(x = t, y = count, group = interaction(compare, poverty), color =interaction(compare, poverty))) +
    facet_wrap(~age) +
    scale_x_continuous(breaks = seq(0, 520, 52),
                       labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                  "2016", "2017", "2018", "2019", "2020")) +
    scale_color_manual(values=c("skyblue","navy", "pink", "red"))
  
  
  compare_care <- mod_states %>%
    group_by(t, poverty, age, school, care, yjs) %>% 
    summarise(count = sum(count)) 
  
  
  check <- mod_states %>%
    filter(care == "Prior",
           age == 10,
           poverty == "In poverty")
  
  
  compare_care %>%
    filter(care == "Prior",
           age == 10) %>% 
    ggplot() +
    geom_line(aes(x = t, y = count, group = interaction(school, poverty), color =interaction(school, poverty))) +
    facet_wrap(~yjs) +
    scale_x_continuous(breaks = seq(0, 520, 52),
                       labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                  "2016", "2017", "2018", "2019", "2020")) 
  
  # +
    scale_color_manual(values=c("skyblue","navy", "pink", "red"))
  
  
    
    
    mod_states %>%
      filter(school == "PRU",
             age == 10) %>% 
      ggplot() +
      geom_line(aes(x = t, y = count, group = interaction(care, poverty), color =interaction(care, poverty))) +
      facet_wrap(~yjs) +
      scale_x_continuous(breaks = seq(0, 520, 52),
                         labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                    "2016", "2017", "2018", "2019", "2020")) 
    
    
    
    
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
                  mutate(compare = "Est data"))   
    
    
    
    
    check <- mod_states %>%
      group_by(t, poverty, age, yjs) %>% 
      summarise(count = sum(count))  %>% 
      ggplot() +
      geom_line(aes(x = t, y = count, group = interaction(age, poverty), color =interaction(age, poverty))) +
      facet_wrap(~yjs) +
      scale_x_continuous(breaks = seq(0, 520, 52),
                         labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                    "2016", "2017", "2018", "2019", "2020")) 
    
    
    check
  
    
    
  age_pop <- mod_states %>%
    # filter(age %in% c(10, 12),
    #        poverty == "Not in poverty") %>% 
    group_by(t, age, care) %>%
    summarise(count = sum(count)) %>%
    ggplot() +
    geom_line(aes(x = t, y = count, group = care, color = care)) +
    facet_wrap(~age) +
    scale_x_continuous(breaks = seq(0, 520, 52),
                       labels = c("2010", "2011", "2012", "2013", "2014", "2015",
                                  "2016", "2017", "2018", "2019", "2020"))
  age_pop 
  
  
  
  init_c <- care_pov_pru %>% 
    filter(gender == "Boys",
           end_period_year == 2010) %>% 
    ungroup() %>% 
    mutate(`Never` = tot - smooth_count) %>% 
    rename(PRU = smooth_count,
           poverty = state) %>% 
    select(age, poverty, care, `Never`, PRU) %>% 
    group_by(poverty, care) %>% 
    arrange(age) %>% 
    mutate(Prior = lag(PRU) - PRU,
           Prior = ifelse(age != 11, 0, Prior)) %>% 
    ungroup() %>% 
    group_by(poverty, care) %>% 
    mutate(Prior = sum(Prior),
           Prior = ifelse(age == 10, 0, Prior),
           Never = Never - Prior) %>% 
    pivot_longer(c(Never, PRU, Prior),
                 names_to = "school",
                 values_to = "count") %>% 
    ungroup() %>% 
    bind_rows(care_pov_neet %>% 
                ungroup() %>% 
    filter(gender == "Boys",
           end_period_year == 2010) %>% 
              mutate(Never = tot - smooth_count,
                     Prior = 0) %>% 
              rename(PRU = smooth_count,
                     poverty = state) %>% 
              select(Never, PRU, age, care, poverty, Prior) %>% 
              pivot_longer(c(PRU, Never, Prior),
                           names_to = "school",
                           values_to = "count") %>% 
      ungroup()) 
  # %>% 
    group_by(school, care, poverty) %>% 
    arrange(age)

  
  
  
  
  
  save(init_c, file = "output/data/input/init_c.Rdata")

  
ic <- function(a = 10, p = 1, c = 1, s = 1, j = 1) {
  
  x <- init_c %>% 
  mutate(poverty = ifelse(poverty == "In poverty", 2, 1),
         care = ifelse(care == "Never", 1, care),
         care = ifelse(care == "Not residential", 2, care),
         care = ifelse(care == "Residential", 3, care),
         care = ifelse(care == "Prior", 4, care),
         school = ifelse(school == "Never", 1, school),
         school = ifelse(school == "PRU", 2, school),
         school = ifelse(school == "Prior", 3, school),
         age = as.numeric(age),
         poverty = as.numeric(poverty),
         care = as.numeric(care),
         school = as.numeric(school)
  # ,
  # yjs = ifelse(yjs == "No contact with YJS", 1, 4),
  # yjs = ifelse(yjs == "Known to police", 2, yjs),
  # yjs = ifelse(yjs == "In the YJS", 3, yjs)
  ) %>% 
    filter(age == a,
           poverty == p,
           care == c,
           school == s
           # ,
           # yjs == j
    ) %>% 
    select(count) %>% 
    unlist() %>% 
    unname() 
  
  if(j!=1){
    x<-0
  }
  return(x)
  
}
  
x <- init_c %>% 
  filter(age == 10) %>% 
  group_by(poverty) %>% 
  mutate(pc = count/sum(count))
  



x <- init_c %>% 
  filter(age == 10) %>% 
  mutate(poverty = ifelse(poverty == "In poverty", 2, 1),
         care = ifelse(care == "Never", 1, care),
         care = ifelse(care == "Not residential", 2, care),
         care = ifelse(care == "Residential", 3, care),
         care = ifelse(care == "Prior", 4, care),
         school = ifelse(school == "Never", 1, school),
         school = ifelse(school == "PRU", 2, school),
         school = ifelse(school == "Prior", 3, school),
         poverty = as.numeric(poverty),
         care = as.numeric(care),
         school = as.numeric(school)
         # ,
         # yjs = ifelse(yjs == "No contact with YJS", 1, 4),
         # yjs = ifelse(yjs == "Known to police", 2, yjs),
         # yjs = ifelse(yjs == "In the YJS", 3, yjs)
  ) %>% 
  group_by(poverty) %>% 
  mutate(pc = count/sum(count)) %>% 
  ungroup() %>% 
  filter(poverty == p,
         care == c,
         school == s
         # ,
         # yjs == j
  ) %>% 
  select(pc) %>% 
  unlist() %>% 
  unname() 



t10 <- function(p = 1, c = 1, s = 1, j = 1) {
  
  x <- init_c %>% 
    filter(age == 10) %>% 
    mutate(poverty = ifelse(poverty == "In poverty", 2, 1),
           care = ifelse(care == "Never", 1, care),
           care = ifelse(care == "Not residential", 2, care),
           care = ifelse(care == "Residential", 3, care),
           care = ifelse(care == "Prior", 4, care),
           school = ifelse(school == "Never", 1, school),
           school = ifelse(school == "PRU", 2, school),
           school = ifelse(school == "Prior", 3, school),
           poverty = as.numeric(poverty),
           care = as.numeric(care),
           school = as.numeric(school)
           # ,
           # yjs = ifelse(yjs == "No contact with YJS", 1, 4),
           # yjs = ifelse(yjs == "Known to police", 2, yjs),
           # yjs = ifelse(yjs == "In the YJS", 3, yjs)
    ) %>% 
    group_by(poverty) %>% 
    mutate(pc = count/sum(count)) %>% 
    ungroup() %>% 
    filter(poverty == p,
           care == c,
           school == s
           # ,
           # yjs == j
    ) %>% 
    select(pc) %>% 
    unlist() %>% 
    unname() 
  
  if(j!=1){
    x<-0
  }
  return(x)
  
}
  
  
  
  
  
  
  pop_in <- population %>% 
    filter(gender == "Boys",
           end_period_year == 2010) %>% 
    select(age, count) %>% 
    mutate(pov = count*0.2827833) %>% 
    left_join(care_cum_pc %>% 
                filter(gender == "Boys",
                       end_period_year == 2010) %>% 
                select(age, cum_pc) %>% 
                mutate(cum_pc = cum_pc/100)) %>% 
    mutate(pov_pc_care = cum_pc*3,
           pov_care_count = pov_pc_care*pov,
           care_count = count*cum_pc,
           np_care_count = count*cum_pc - pov_care_count,
           np_pc_care = np_care_count/(count-pov)) %>% 
    left_join(schools %>% 
                filter(gender == "Boys",
                       end_period_year == 2010,
                       school_type == "Pupil referral unit") %>% 
                select(count, fsm, age) %>% 
                pivot_wider(names_from = fsm,
                            values_from = count) %>% 
                rename(pru_pov = `FSM eligible`,
                       pru_np = `Not FSM eligible`)) %>% 
    mutate(pov_pc_pru = pru_pov/pov,
           np_pc_pru = pru_np/(count-pov)) %>% 
    mutate(pov_pc_pru = ifelse(age ==16, 0.06, pov_pc_pru),
           pov_pc_pru = ifelse(age ==17, 0.12, pov_pc_pru),
           np_pc_pru = ifelse(age ==16, 0.02, np_pc_pru),
           np_pc_pru = ifelse(age ==17, 0.04, pov_pc_pru)) %>% 
    select(pov_pc_pru, np_pc_pru, pov_pc_care, np_pc_care, age, count, pov) %>% 
    mutate(pov_pc_care_notpru = pov_pc_care - pov_pc_pru) %>% 
    mutate(pov_pc_care_notpru = ifelse(age ==17, -pov_pc_care_notpru, pov_pc_care_notpru))
  
  c <- schools %>% 
    filter(gender == "Boys",
           end_period_year == 2010,
           school_type == "Pupil referral unit") %>% 
    select(count, fsm, age) %>% 
    pivot_wider(names_from = fsm,
                values_from = count) %>% 
    rename(pru_pov = `FSM eligible`,
           pru_np = `Not FSM eligible`)
  
  
  
  
  IC <- read_xlsx("/Users/katehayes/Library/CloudStorage/GoogleDrive-khayes2@sheffield.ac.uk/My Drive/CL_drive_data/IC.xlsx")
  
  
  
  
  
  c <- C %>% 
    filter(age == 10) %>% 
    pivot_longer(-age, names_to = "states",
                 values_to = "count") %>% 
    mutate(P = ifelse(grepl("P1", states), "P1", "P2")) %>% 
    group_by(P) %>% 
    mutate(pc = count/sum(count))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  