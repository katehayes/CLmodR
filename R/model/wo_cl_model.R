# install.packages("odin")
# library(odin)



# object: gender, age, poverty, care, school
# get the IC's perfect
# get the aging working
# calibrate TO what FOR what


sep_model = odin::odin({
  
  
  tau <- user(52)
  
  
  
  
  ##############################################################################################################################
  ##PARAMETERS########################################################################################################################################
  ##############################################################################################################################
  
  
  # parameters
  N_gender <- user(2)
  age_up <- user(1/52)
  turn10[] <- user(0)
  # desination on ageing in
  pc_incl <- user(0)
  pc_excl <- user(0)
  
  
  #percentage of custody remands that result in a custodial sentence
  r2c <- user(0.33) 
  
  
  
  #PARAMETERS THAT MIGHT BE DELETED LATER
  r[] <- user(0) #leaving poverty
  f[] <- user(0) #entering poverty
  
  
  n2nr[] <- user(0) #
  n2r[] <- user(0) #
  p2care[] <- user(0) #
  p2nr[] <- user(0) #
  p2r[] <- user(0) #
  
  end_nr[] <- user(0)
  end_res[] <- user(0)
  
  nr2r[] <- user(0)
  nr2p[] <- user(0)
  
  r2nr[] <- user(0)
  r2p[] <- user(0)
  
  
  
  
  surv <- user(0.1)
  
  
  t10_ic1s1[] <- user(0)
  t10_ic2s1[] <- user(0)
  t10_ic3s1[] <- user(0)
  t10_ic4s1[] <- user(0)
  
  t10_ic1s2[] <- user(0)
  t10_ic2s2[] <- user(0)
  t10_ic3s2[] <- user(0)
  t10_ic4s2[] <- user(0)
  
  
  
  t10_ec1s1[] <- user(0)
  t10_ec2s1[] <- user(0)
  t10_ec3s1[] <- user(0)
  t10_ec4s1[] <- user(0)
  
  t10_ec1s2[] <- user(0)
  t10_ec2s2[] <- user(0)
  t10_ec3s2[] <- user(0)
  t10_ec4s2[] <- user(0)
  
  
  
  neet16_ic1s1[] <- user(0)
  neet16_ic2s1[] <- user(0)
  neet16_ic3s1[] <- user(0)
  neet16_ic4s1[] <- user(0)
  
  neet16_ic1s2[] <- user(0)
  neet16_ic2s2[] <- user(0)
  neet16_ic3s2[] <- user(0)
  neet16_ic4s2[] <- user(0)
  
  
  neet16_ec1s1[] <- user(0)
  neet16_ec2s1[] <- user(0)
  neet16_ec3s1[] <- user(0)
  neet16_ec4s1[] <- user(0)
  
  neet16_ec1s2[] <- user(0)
  neet16_ec2s2[] <- user(0)
  neet16_ec3s2[] <- user(0)
  neet16_ec4s2[] <- user(0)
  
  
  
  n2care_i_10[] <- user(0)
  n2care_i_11[] <- user(0)
  n2care_i_12[] <- user(0)
  n2care_i_13[] <- user(0)
  n2care_i_14[] <- user(0)
  n2care_i_15[] <- user(0)
  n2care_i_16[] <- user(0)
  n2care_i_17[] <- user(0)
  
  n2care_e_10[] <- user(0)
  n2care_e_11[] <- user(0)
  n2care_e_12[] <- user(0)
  n2care_e_13[] <- user(0)
  n2care_e_14[] <- user(0)
  n2care_e_15[] <- user(0)
  n2care_e_16[] <- user(0)
  n2care_e_17[] <- user(0)
  
  neet2m_i[] <- user(0)
  neet2m_e[] <- user(0)
  
  
  m2pru_ic1_10[] <- user(0)
  m2pru_ic2_10[] <- user(0)
  m2pru_ic3_10[] <- user(0)
  m2pru_ic4_10[] <- user(0)
  
  m2pru_ic1_11[] <- user(0)
  m2pru_ic2_11[] <- user(0)
  m2pru_ic3_11[] <- user(0)
  m2pru_ic4_11[] <- user(0)
  
  m2pru_ic1_12[] <- user(0)
  m2pru_ic2_12[] <- user(0)
  m2pru_ic3_12[] <- user(0)
  m2pru_ic4_12[] <- user(0)
  
  m2pru_ic1_13[] <- user(0)
  m2pru_ic2_13[] <- user(0)
  m2pru_ic3_13[] <- user(0)
  m2pru_ic4_13[] <- user(0)
  
  m2pru_ic1_14[] <- user(0)
  m2pru_ic2_14[] <- user(0)
  m2pru_ic3_14[] <- user(0)
  m2pru_ic4_14[] <- user(0)
  
  m2pru_ic1_15[] <- user(0)
  m2pru_ic2_15[] <- user(0)
  m2pru_ic3_15[] <- user(0)
  m2pru_ic4_15[] <- user(0)
  
  m2neet_ic1_16[] <- user(0)
  m2neet_ic2_16[] <- user(0)
  m2neet_ic3_16[] <- user(0)
  m2neet_ic4_16[] <- user(0)
  
  m2neet_ic1_17[] <- user(0)
  m2neet_ic2_17[] <- user(0)
  m2neet_ic3_17[] <- user(0)
  m2neet_ic4_17[] <- user(0)
  
  
  m2pru_ec1_10[] <- user(0)
  m2pru_ec2_10[] <- user(0)
  m2pru_ec3_10[] <- user(0)
  m2pru_ec4_10[] <- user(0)
  
  m2pru_ec1_11[] <- user(0)
  m2pru_ec2_11[] <- user(0)
  m2pru_ec3_11[] <- user(0)
  m2pru_ec4_11[] <- user(0)
  
  m2pru_ec1_12[] <- user(0)
  m2pru_ec2_12[] <- user(0)
  m2pru_ec3_12[] <- user(0)
  m2pru_ec4_12[] <- user(0)
  
  m2pru_ec1_13[] <- user(0)
  m2pru_ec2_13[] <- user(0)
  m2pru_ec3_13[] <- user(0)
  m2pru_ec4_13[] <- user(0)
  
  m2pru_ec1_14[] <- user(0)
  m2pru_ec2_14[] <- user(0)
  m2pru_ec3_14[] <- user(0)
  m2pru_ec4_14[] <- user(0)
  
  m2pru_ec1_15[] <- user(0)
  m2pru_ec2_15[] <- user(0)
  m2pru_ec3_15[] <- user(0)
  m2pru_ec4_15[] <- user(0)
  
  m2neet_ec1_16[] <- user(0)
  m2neet_ec2_16[] <- user(0)
  m2neet_ec3_16[] <- user(0)
  m2neet_ec4_16[] <- user(0)
  
  m2neet_ec1_17[] <- user(0)
  m2neet_ec2_17[] <- user(0)
  m2neet_ec3_17[] <- user(0)
  m2neet_ec4_17[] <- user(0)
  
  miss_ic1u_10[] <- user(0)
  miss_ic2u_10[] <- user(0)
  miss_ic3u_10[] <- user(0)
  miss_ic4u_10[] <- user(0)
  
  miss_ic1u_11[] <- user(0)
  miss_ic2u_11[] <- user(0)
  miss_ic3u_11[] <- user(0)
  miss_ic4u_11[] <- user(0)
  
  miss_ic1u_12[] <- user(0)
  miss_ic2u_12[] <- user(0)
  miss_ic3u_12[] <- user(0)
  miss_ic4u_12[] <- user(0)
  
  miss_ic1u_13[] <- user(0)
  miss_ic2u_13[] <- user(0)
  miss_ic3u_13[] <- user(0)
  miss_ic4u_13[] <- user(0)
  
  miss_ic1u_14[] <- user(0)
  miss_ic2u_14[] <- user(0)
  miss_ic3u_14[] <- user(0)
  miss_ic4u_14[] <- user(0)
  
  miss_ic1u_15[] <- user(0)
  miss_ic2u_15[] <- user(0)
  miss_ic3u_15[] <- user(0)
  miss_ic4u_15[] <- user(0)
  
  miss_ic1u_16[] <- user(0)
  miss_ic2u_16[] <- user(0)
  miss_ic3u_16[] <- user(0)
  miss_ic4u_16[] <- user(0)
  
  miss_ic1u_17[] <- user(0)
  miss_ic2u_17[] <- user(0)
  miss_ic3u_17[] <- user(0)
  miss_ic4u_17[] <- user(0)
  
  miss_ec1u_10[] <- user(0)
  miss_ec2u_10[] <- user(0)
  miss_ec3u_10[] <- user(0)
  miss_ec4u_10[] <- user(0)
  
  miss_ec1u_11[] <- user(0)
  miss_ec2u_11[] <- user(0)
  miss_ec3u_11[] <- user(0)
  miss_ec4u_11[] <- user(0)
  
  miss_ec1u_12[] <- user(0)
  miss_ec2u_12[] <- user(0)
  miss_ec3u_12[] <- user(0)
  miss_ec4u_12[] <- user(0)
  
  miss_ec1u_13[] <- user(0)
  miss_ec2u_13[] <- user(0)
  miss_ec3u_13[] <- user(0)
  miss_ec4u_13[] <- user(0)
  
  miss_ec1u_14[] <- user(0)
  miss_ec2u_14[] <- user(0)
  miss_ec3u_14[] <- user(0)
  miss_ec4u_14[] <- user(0)
  
  miss_ec1u_15[] <- user(0)
  miss_ec2u_15[] <- user(0)
  miss_ec3u_15[] <- user(0)
  miss_ec4u_15[] <- user(0)
  
  miss_ec1u_16[] <- user(0)
  miss_ec2u_16[] <- user(0)
  miss_ec3u_16[] <- user(0)
  miss_ec4u_16[] <- user(0)
  
  miss_ec1u_17[] <- user(0)
  miss_ec2u_17[] <- user(0)
  miss_ec3u_17[] <- user(0)
  miss_ec4u_17[] <- user(0)
  
  
  ##############################################################################################################################
  ## Delays ####################################################################
  ##############################################################################################################################
  
  
  IC1S1_10_lag[] <- delay(IC1S1_10[i], tau)
  IC2S1_10_lag[] <- delay(IC2S1_10[i], tau)
  IC3S1_10_lag[] <- delay(IC3S1_10[i], tau)
  IC4S1_10_lag[] <- delay(IC4S1_10[i], tau)
  
  IC1S1_11_lag[] <- delay(IC1S1_11[i], tau)
  IC2S1_11_lag[] <- delay(IC2S1_11[i], tau)
  IC3S1_11_lag[] <- delay(IC3S1_11[i], tau)
  IC4S1_11_lag[] <- delay(IC4S1_11[i], tau)
  
  IC1S1_12_lag[] <- delay(IC1S1_12[i], tau)
  IC2S1_12_lag[] <- delay(IC2S1_12[i], tau)
  IC3S1_12_lag[] <- delay(IC3S1_12[i], tau)
  IC4S1_12_lag[] <- delay(IC4S1_12[i], tau)
  
  IC1S1_13_lag[] <- delay(IC1S1_13[i], tau)
  IC2S1_13_lag[] <- delay(IC2S1_13[i], tau)
  IC3S1_13_lag[] <- delay(IC3S1_13[i], tau)
  IC4S1_13_lag[] <- delay(IC4S1_13[i], tau)
  
  IC1S1_14_lag[] <- delay(IC1S1_14[i], tau)
  IC2S1_14_lag[] <- delay(IC2S1_14[i], tau)
  IC3S1_14_lag[] <- delay(IC3S1_14[i], tau)
  IC4S1_14_lag[] <- delay(IC4S1_14[i], tau)
  
  IC1S1_15_lag[] <- delay(IC1S1_15[i], tau)
  IC2S1_15_lag[] <- delay(IC2S1_15[i], tau)
  IC3S1_15_lag[] <- delay(IC3S1_15[i], tau)
  IC4S1_15_lag[] <- delay(IC4S1_15[i], tau)
  
  IC1S1_16_lag[] <- delay(IC1S1_16[i], tau)
  IC2S1_16_lag[] <- delay(IC2S1_16[i], tau)
  IC3S1_16_lag[] <- delay(IC3S1_16[i], tau)
  IC4S1_16_lag[] <- delay(IC4S1_16[i], tau)
  
  IC1S1_17_lag[] <- delay(IC1S1_17[i], tau)
  IC2S1_17_lag[] <- delay(IC2S1_17[i], tau)
  IC3S1_17_lag[] <- delay(IC3S1_17[i], tau)
  IC4S1_17_lag[] <- delay(IC4S1_17[i], tau)
  
  
  
  IC1S2_10_lag[] <- delay(IC1S2_10[i], tau)
  IC2S2_10_lag[] <- delay(IC2S2_10[i], tau)
  IC3S2_10_lag[] <- delay(IC3S2_10[i], tau)
  IC4S2_10_lag[] <- delay(IC4S2_10[i], tau)
  
  IC1S2_11_lag[] <- delay(IC1S2_11[i], tau)
  IC2S2_11_lag[] <- delay(IC2S2_11[i], tau)
  IC3S2_11_lag[] <- delay(IC3S2_11[i], tau)
  IC4S2_11_lag[] <- delay(IC4S2_11[i], tau)
  
  IC1S2_12_lag[] <- delay(IC1S2_12[i], tau)
  IC2S2_12_lag[] <- delay(IC2S2_12[i], tau)
  IC3S2_12_lag[] <- delay(IC3S2_12[i], tau)
  IC4S2_12_lag[] <- delay(IC4S2_12[i], tau)
  
  IC1S2_13_lag[] <- delay(IC1S2_13[i], tau)
  IC2S2_13_lag[] <- delay(IC2S2_13[i], tau)
  IC3S2_13_lag[] <- delay(IC3S2_13[i], tau)
  IC4S2_13_lag[] <- delay(IC4S2_13[i], tau)
  
  IC1S2_14_lag[] <- delay(IC1S2_14[i], tau)
  IC2S2_14_lag[] <- delay(IC2S2_14[i], tau)
  IC3S2_14_lag[] <- delay(IC3S2_14[i], tau)
  IC4S2_14_lag[] <- delay(IC4S2_14[i], tau)
  
  IC1S2_15_lag[] <- delay(IC1S2_15[i], tau)
  IC2S2_15_lag[] <- delay(IC2S2_15[i], tau)
  IC3S2_15_lag[] <- delay(IC3S2_15[i], tau)
  IC4S2_15_lag[] <- delay(IC4S2_15[i], tau)
  
  IC1S2_16_lag[] <- delay(IC1S2_16[i], tau)
  IC2S2_16_lag[] <- delay(IC2S2_16[i], tau)
  IC3S2_16_lag[] <- delay(IC3S2_16[i], tau)
  IC4S2_16_lag[] <- delay(IC4S2_16[i], tau)
  
  IC1S2_17_lag[] <- delay(IC1S2_17[i], tau)
  IC2S2_17_lag[] <- delay(IC2S2_17[i], tau)
  IC3S2_17_lag[] <- delay(IC3S2_17[i], tau)
  IC4S2_17_lag[] <- delay(IC4S2_17[i], tau)
  
  
  
  EC1S1_10_lag[] <- delay(EC1S1_10[i], tau)
  EC2S1_10_lag[] <- delay(EC2S1_10[i], tau)
  EC3S1_10_lag[] <- delay(EC3S1_10[i], tau)
  EC4S1_10_lag[] <- delay(EC4S1_10[i], tau)
  
  EC1S1_11_lag[] <- delay(EC1S1_11[i], tau)
  EC2S1_11_lag[] <- delay(EC2S1_11[i], tau)
  EC3S1_11_lag[] <- delay(EC3S1_11[i], tau)
  EC4S1_11_lag[] <- delay(EC4S1_11[i], tau)
  
  EC1S1_12_lag[] <- delay(EC1S1_12[i], tau)
  EC2S1_12_lag[] <- delay(EC2S1_12[i], tau)
  EC3S1_12_lag[] <- delay(EC3S1_12[i], tau)
  EC4S1_12_lag[] <- delay(EC4S1_12[i], tau)
  
  EC1S1_13_lag[] <- delay(EC1S1_13[i], tau)
  EC2S1_13_lag[] <- delay(EC2S1_13[i], tau)
  EC3S1_13_lag[] <- delay(EC3S1_13[i], tau)
  EC4S1_13_lag[] <- delay(EC4S1_13[i], tau)
  
  EC1S1_14_lag[] <- delay(EC1S1_14[i], tau)
  EC2S1_14_lag[] <- delay(EC2S1_14[i], tau)
  EC3S1_14_lag[] <- delay(EC3S1_14[i], tau)
  EC4S1_14_lag[] <- delay(EC4S1_14[i], tau)
  
  EC1S1_15_lag[] <- delay(EC1S1_15[i], tau)
  EC2S1_15_lag[] <- delay(EC2S1_15[i], tau)
  EC3S1_15_lag[] <- delay(EC3S1_15[i], tau)
  EC4S1_15_lag[] <- delay(EC4S1_15[i], tau)
  
  EC1S1_16_lag[] <- delay(EC1S1_16[i], tau)
  EC2S1_16_lag[] <- delay(EC2S1_16[i], tau)
  EC3S1_16_lag[] <- delay(EC3S1_16[i], tau)
  EC4S1_16_lag[] <- delay(EC4S1_16[i], tau)
  
  EC1S1_17_lag[] <- delay(EC1S1_17[i], tau)
  EC2S1_17_lag[] <- delay(EC2S1_17[i], tau)
  EC3S1_17_lag[] <- delay(EC3S1_17[i], tau)
  EC4S1_17_lag[] <- delay(EC4S1_17[i], tau)
  
  
  
  EC1S2_10_lag[] <- delay(EC1S2_10[i], tau)
  EC2S2_10_lag[] <- delay(EC2S2_10[i], tau)
  EC3S2_10_lag[] <- delay(EC3S2_10[i], tau)
  EC4S2_10_lag[] <- delay(EC4S2_10[i], tau)
  
  EC1S2_11_lag[] <- delay(EC1S2_11[i], tau)
  EC2S2_11_lag[] <- delay(EC2S2_11[i], tau)
  EC3S2_11_lag[] <- delay(EC3S2_11[i], tau)
  EC4S2_11_lag[] <- delay(EC4S2_11[i], tau)
  
  EC1S2_12_lag[] <- delay(EC1S2_12[i], tau)
  EC2S2_12_lag[] <- delay(EC2S2_12[i], tau)
  EC3S2_12_lag[] <- delay(EC3S2_12[i], tau)
  EC4S2_12_lag[] <- delay(EC4S2_12[i], tau)
  
  EC1S2_13_lag[] <- delay(EC1S2_13[i], tau)
  EC2S2_13_lag[] <- delay(EC2S2_13[i], tau)
  EC3S2_13_lag[] <- delay(EC3S2_13[i], tau)
  EC4S2_13_lag[] <- delay(EC4S2_13[i], tau)
  
  EC1S2_14_lag[] <- delay(EC1S2_14[i], tau)
  EC2S2_14_lag[] <- delay(EC2S2_14[i], tau)
  EC3S2_14_lag[] <- delay(EC3S2_14[i], tau)
  EC4S2_14_lag[] <- delay(EC4S2_14[i], tau)
  
  EC1S2_15_lag[] <- delay(EC1S2_15[i], tau)
  EC2S2_15_lag[] <- delay(EC2S2_15[i], tau)
  EC3S2_15_lag[] <- delay(EC3S2_15[i], tau)
  EC4S2_15_lag[] <- delay(EC4S2_15[i], tau)
  
  EC1S2_16_lag[] <- delay(EC1S2_16[i], tau)
  EC2S2_16_lag[] <- delay(EC2S2_16[i], tau)
  EC3S2_16_lag[] <- delay(EC3S2_16[i], tau)
  EC4S2_16_lag[] <- delay(EC4S2_16[i], tau)
  
  EC1S2_17_lag[] <- delay(EC1S2_17[i], tau)
  EC2S2_17_lag[] <- delay(EC2S2_17[i], tau)
  EC3S2_17_lag[] <- delay(EC3S2_17[i], tau)
  EC4S2_17_lag[] <- delay(EC4S2_17[i], tau)
  
  ##############################################################################################################################
  ## INITIAL CONDITIONS ####################################################################
  ##############################################################################################################################
  
  
  IC1S1_10_ini[] <- user(0)
  IC2S1_10_ini[] <- user(0)
  IC3S1_10_ini[] <- user(0)
  IC4S1_10_ini[] <- user(0)
  
  IC1S1_11_ini[] <- user(0)
  IC2S1_11_ini[] <- user(0)
  IC3S1_11_ini[] <- user(0)
  IC4S1_11_ini[] <- user(0)
  
  IC1S1_12_ini[] <- user(0)
  IC2S1_12_ini[] <- user(0)
  IC3S1_12_ini[] <- user(0)
  IC4S1_12_ini[] <- user(0)
  
  IC1S1_13_ini[] <- user(0)
  IC2S1_13_ini[] <- user(0)
  IC3S1_13_ini[] <- user(0)
  IC4S1_13_ini[] <- user(0)
  
  IC1S1_14_ini[] <- user(0)
  IC2S1_14_ini[] <- user(0)
  IC3S1_14_ini[] <- user(0)
  IC4S1_14_ini[] <- user(0)
  
  IC1S1_15_ini[] <- user(0)
  IC2S1_15_ini[] <- user(0)
  IC3S1_15_ini[] <- user(0)
  IC4S1_15_ini[] <- user(0)
  
  IC1S1_16_ini[] <- user(0)
  IC2S1_16_ini[] <- user(0)
  IC3S1_16_ini[] <- user(0)
  IC4S1_16_ini[] <- user(0)
  
  IC1S1_17_ini[] <- user(0)
  IC2S1_17_ini[] <- user(0)
  IC3S1_17_ini[] <- user(0)
  IC4S1_17_ini[] <- user(0)
  
  
  
  IC1S2_10_ini[] <- user(0)
  IC2S2_10_ini[] <- user(0)
  IC3S2_10_ini[] <- user(0)
  IC4S2_10_ini[] <- user(0)
  
  IC1S2_11_ini[] <- user(0)
  IC2S2_11_ini[] <- user(0)
  IC3S2_11_ini[] <- user(0)
  IC4S2_11_ini[] <- user(0)
  
  IC1S2_12_ini[] <- user(0)
  IC2S2_12_ini[] <- user(0)
  IC3S2_12_ini[] <- user(0)
  IC4S2_12_ini[] <- user(0)
  
  IC1S2_13_ini[] <- user(0)
  IC2S2_13_ini[] <- user(0)
  IC3S2_13_ini[] <- user(0)
  IC4S2_13_ini[] <- user(0)
  
  IC1S2_14_ini[] <- user(0)
  IC2S2_14_ini[] <- user(0)
  IC3S2_14_ini[] <- user(0)
  IC4S2_14_ini[] <- user(0)
  
  IC1S2_15_ini[] <- user(0)
  IC2S2_15_ini[] <- user(0)
  IC3S2_15_ini[] <- user(0)
  IC4S2_15_ini[] <- user(0)
  
  IC1S2_16_ini[] <- user(0)
  IC2S2_16_ini[] <- user(0)
  IC3S2_16_ini[] <- user(0)
  IC4S2_16_ini[] <- user(0)
  
  IC1S2_17_ini[] <- user(0)
  IC2S2_17_ini[] <- user(0)
  IC3S2_17_ini[] <- user(0)
  IC4S2_17_ini[] <- user(0)
  
  
  
  
  
  EC1S1_10_ini[] <- user(0)
  EC2S1_10_ini[] <- user(0)
  EC3S1_10_ini[] <- user(0)
  EC4S1_10_ini[] <- user(0)
  
  EC1S1_11_ini[] <- user(0)
  EC2S1_11_ini[] <- user(0)
  EC3S1_11_ini[] <- user(0)
  EC4S1_11_ini[] <- user(0)
  
  EC1S1_12_ini[] <- user(0)
  EC2S1_12_ini[] <- user(0)
  EC3S1_12_ini[] <- user(0)
  EC4S1_12_ini[] <- user(0)
  
  EC1S1_13_ini[] <- user(0)
  EC2S1_13_ini[] <- user(0)
  EC3S1_13_ini[] <- user(0)
  EC4S1_13_ini[] <- user(0)
  
  EC1S1_14_ini[] <- user(0)
  EC2S1_14_ini[] <- user(0)
  EC3S1_14_ini[] <- user(0)
  EC4S1_14_ini[] <- user(0)
  
  EC1S1_15_ini[] <- user(0)
  EC2S1_15_ini[] <- user(0)
  EC3S1_15_ini[] <- user(0)
  EC4S1_15_ini[] <- user(0)
  
  EC1S1_16_ini[] <- user(0)
  EC2S1_16_ini[] <- user(0)
  EC3S1_16_ini[] <- user(0)
  EC4S1_16_ini[] <- user(0)
  
  EC1S1_17_ini[] <- user(0)
  EC2S1_17_ini[] <- user(0)
  EC3S1_17_ini[] <- user(0)
  EC4S1_17_ini[] <- user(0)
  
  
  
  EC1S2_10_ini[] <- user(0)
  EC2S2_10_ini[] <- user(0)
  EC3S2_10_ini[] <- user(0)
  EC4S2_10_ini[] <- user(0)
  
  EC1S2_11_ini[] <- user(0)
  EC2S2_11_ini[] <- user(0)
  EC3S2_11_ini[] <- user(0)
  EC4S2_11_ini[] <- user(0)
  
  EC1S2_12_ini[] <- user(0)
  EC2S2_12_ini[] <- user(0)
  EC3S2_12_ini[] <- user(0)
  EC4S2_12_ini[] <- user(0)
  
  EC1S2_13_ini[] <- user(0)
  EC2S2_13_ini[] <- user(0)
  EC3S2_13_ini[] <- user(0)
  EC4S2_13_ini[] <- user(0)
  
  EC1S2_14_ini[] <- user(0)
  EC2S2_14_ini[] <- user(0)
  EC3S2_14_ini[] <- user(0)
  EC4S2_14_ini[] <- user(0)
  
  EC1S2_15_ini[] <- user(0)
  EC2S2_15_ini[] <- user(0)
  EC3S2_15_ini[] <- user(0)
  EC4S2_15_ini[] <- user(0)
  
  EC1S2_16_ini[] <- user(0)
  EC2S2_16_ini[] <- user(0)
  EC3S2_16_ini[] <- user(0)
  EC4S2_16_ini[] <- user(0)
  
  EC1S2_17_ini[] <- user(0)
  EC2S2_17_ini[] <- user(0)
  EC3S2_17_ini[] <- user(0)
  EC4S2_17_ini[] <- user(0)
  
  
  
  initial(IC1S1_10[]) <- IC1S1_10_ini[i]
  initial(IC2S1_10[]) <- IC2S1_10_ini[i]
  initial(IC3S1_10[]) <- IC3S1_10_ini[i]
  initial(IC4S1_10[]) <- IC4S1_10_ini[i]
  
  initial(IC1S1_11[]) <- IC1S1_11_ini[i]
  initial(IC2S1_11[]) <- IC2S1_11_ini[i]
  initial(IC3S1_11[]) <- IC3S1_11_ini[i]
  initial(IC4S1_11[]) <- IC4S1_11_ini[i]
  
  initial(IC1S1_12[]) <- IC1S1_12_ini[i]
  initial(IC2S1_12[]) <- IC2S1_12_ini[i]
  initial(IC3S1_12[]) <- IC3S1_12_ini[i]
  initial(IC4S1_12[]) <- IC4S1_12_ini[i]
  
  initial(IC1S1_13[]) <- IC1S1_13_ini[i]
  initial(IC2S1_13[]) <- IC2S1_13_ini[i]
  initial(IC3S1_13[]) <- IC3S1_13_ini[i]
  initial(IC4S1_13[]) <- IC4S1_13_ini[i]
  
  initial(IC1S1_14[]) <- IC1S1_14_ini[i]
  initial(IC2S1_14[]) <- IC2S1_14_ini[i]
  initial(IC3S1_14[]) <- IC3S1_14_ini[i]
  initial(IC4S1_14[]) <- IC4S1_14_ini[i]
  
  initial(IC1S1_15[]) <- IC1S1_15_ini[i]
  initial(IC2S1_15[]) <- IC2S1_15_ini[i]
  initial(IC3S1_15[]) <- IC3S1_15_ini[i]
  initial(IC4S1_15[]) <- IC4S1_15_ini[i]
  
  initial(IC1S1_16[]) <- IC1S1_16_ini[i]
  initial(IC2S1_16[]) <- IC2S1_16_ini[i]
  initial(IC3S1_16[]) <- IC3S1_16_ini[i]
  initial(IC4S1_16[]) <- IC4S1_16_ini[i]
  
  initial(IC1S1_17[]) <- IC1S1_17_ini[i]
  initial(IC2S1_17[]) <- IC2S1_17_ini[i]
  initial(IC3S1_17[]) <- IC3S1_17_ini[i]
  initial(IC4S1_17[]) <- IC4S1_17_ini[i]
  
  
  
  initial(IC1S2_10[]) <- IC1S2_10_ini[i]
  initial(IC2S2_10[]) <- IC2S2_10_ini[i]
  initial(IC3S2_10[]) <- IC3S2_10_ini[i]
  initial(IC4S2_10[]) <- IC4S2_10_ini[i]
  
  initial(IC1S2_11[]) <- IC1S2_11_ini[i]
  initial(IC2S2_11[]) <- IC2S2_11_ini[i]
  initial(IC3S2_11[]) <- IC3S2_11_ini[i]
  initial(IC4S2_11[]) <- IC4S2_11_ini[i]
  
  initial(IC1S2_12[]) <- IC1S2_12_ini[i]
  initial(IC2S2_12[]) <- IC2S2_12_ini[i]
  initial(IC3S2_12[]) <- IC3S2_12_ini[i]
  initial(IC4S2_12[]) <- IC4S2_12_ini[i]
  
  initial(IC1S2_13[]) <- IC1S2_13_ini[i]
  initial(IC2S2_13[]) <- IC2S2_13_ini[i]
  initial(IC3S2_13[]) <- IC3S2_13_ini[i]
  initial(IC4S2_13[]) <- IC4S2_13_ini[i]
  
  initial(IC1S2_14[]) <- IC1S2_14_ini[i]
  initial(IC2S2_14[]) <- IC2S2_14_ini[i]
  initial(IC3S2_14[]) <- IC3S2_14_ini[i]
  initial(IC4S2_14[]) <- IC4S2_14_ini[i]
  
  initial(IC1S2_15[]) <- IC1S2_15_ini[i]
  initial(IC2S2_15[]) <- IC2S2_15_ini[i]
  initial(IC3S2_15[]) <- IC3S2_15_ini[i]
  initial(IC4S2_15[]) <- IC4S2_15_ini[i]
  
  initial(IC1S2_16[]) <- IC1S2_16_ini[i]
  initial(IC2S2_16[]) <- IC2S2_16_ini[i]
  initial(IC3S2_16[]) <- IC3S2_16_ini[i]
  initial(IC4S2_16[]) <- IC4S2_16_ini[i]
  
  initial(IC1S2_17[]) <- IC1S2_17_ini[i]
  initial(IC2S2_17[]) <- IC2S2_17_ini[i]
  initial(IC3S2_17[]) <- IC3S2_17_ini[i]
  initial(IC4S2_17[]) <- IC4S2_17_ini[i]
  
  
  initial(EC1S1_10[]) <- EC1S1_10_ini[i]
  initial(EC2S1_10[]) <- EC2S1_10_ini[i]
  initial(EC3S1_10[]) <- EC3S1_10_ini[i]
  initial(EC4S1_10[]) <- EC4S1_10_ini[i]
  
  initial(EC1S1_11[]) <- EC1S1_11_ini[i]
  initial(EC2S1_11[]) <- EC2S1_11_ini[i]
  initial(EC3S1_11[]) <- EC3S1_11_ini[i]
  initial(EC4S1_11[]) <- EC4S1_11_ini[i]
  
  initial(EC1S1_12[]) <- EC1S1_12_ini[i]
  initial(EC2S1_12[]) <- EC2S1_12_ini[i]
  initial(EC3S1_12[]) <- EC3S1_12_ini[i]
  initial(EC4S1_12[]) <- EC4S1_12_ini[i]
  
  initial(EC1S1_13[]) <- EC1S1_13_ini[i]
  initial(EC2S1_13[]) <- EC2S1_13_ini[i]
  initial(EC3S1_13[]) <- EC3S1_13_ini[i]
  initial(EC4S1_13[]) <- EC4S1_13_ini[i]
  
  initial(EC1S1_14[]) <- EC1S1_14_ini[i]
  initial(EC2S1_14[]) <- EC2S1_14_ini[i]
  initial(EC3S1_14[]) <- EC3S1_14_ini[i]
  initial(EC4S1_14[]) <- EC4S1_14_ini[i]
  
  initial(EC1S1_15[]) <- EC1S1_15_ini[i]
  initial(EC2S1_15[]) <- EC2S1_15_ini[i]
  initial(EC3S1_15[]) <- EC3S1_15_ini[i]
  initial(EC4S1_15[]) <- EC4S1_15_ini[i]
  
  initial(EC1S1_16[]) <- EC1S1_16_ini[i]
  initial(EC2S1_16[]) <- EC2S1_16_ini[i]
  initial(EC3S1_16[]) <- EC3S1_16_ini[i]
  initial(EC4S1_16[]) <- EC4S1_16_ini[i]
  
  initial(EC1S1_17[]) <- EC1S1_17_ini[i]
  initial(EC2S1_17[]) <- EC2S1_17_ini[i]
  initial(EC3S1_17[]) <- EC3S1_17_ini[i]
  initial(EC4S1_17[]) <- EC4S1_17_ini[i]
  
  
  
  initial(EC1S2_10[]) <- EC1S2_10_ini[i]
  initial(EC2S2_10[]) <- EC2S2_10_ini[i]
  initial(EC3S2_10[]) <- EC3S2_10_ini[i]
  initial(EC4S2_10[]) <- EC4S2_10_ini[i]
  
  initial(EC1S2_11[]) <- EC1S2_11_ini[i]
  initial(EC2S2_11[]) <- EC2S2_11_ini[i]
  initial(EC3S2_11[]) <- EC3S2_11_ini[i]
  initial(EC4S2_11[]) <- EC4S2_11_ini[i]
  
  initial(EC1S2_12[]) <- EC1S2_12_ini[i]
  initial(EC2S2_12[]) <- EC2S2_12_ini[i]
  initial(EC3S2_12[]) <- EC3S2_12_ini[i]
  initial(EC4S2_12[]) <- EC4S2_12_ini[i]
  
  initial(EC1S2_13[]) <- EC1S2_13_ini[i]
  initial(EC2S2_13[]) <- EC2S2_13_ini[i]
  initial(EC3S2_13[]) <- EC3S2_13_ini[i]
  initial(EC4S2_13[]) <- EC4S2_13_ini[i]
  
  initial(EC1S2_14[]) <- EC1S2_14_ini[i]
  initial(EC2S2_14[]) <- EC2S2_14_ini[i]
  initial(EC3S2_14[]) <- EC3S2_14_ini[i]
  initial(EC4S2_14[]) <- EC4S2_14_ini[i]
  
  initial(EC1S2_15[]) <- EC1S2_15_ini[i]
  initial(EC2S2_15[]) <- EC2S2_15_ini[i]
  initial(EC3S2_15[]) <- EC3S2_15_ini[i]
  initial(EC4S2_15[]) <- EC4S2_15_ini[i]
  
  initial(EC1S2_16[]) <- EC1S2_16_ini[i]
  initial(EC2S2_16[]) <- EC2S2_16_ini[i]
  initial(EC3S2_16[]) <- EC3S2_16_ini[i]
  initial(EC4S2_16[]) <- EC4S2_16_ini[i]
  
  initial(EC1S2_17[]) <- EC1S2_17_ini[i]
  initial(EC2S2_17[]) <- EC2S2_17_ini[i]
  initial(EC3S2_17[]) <- EC3S2_17_ini[i]
  initial(EC4S2_17[]) <- EC4S2_17_ini[i]
  
  
  
  
  
  ##############################################################################################################################
  ## SETTING DIMENSIONS ####################################################################
  ##############################################################################################################################
  
  ##############################################################################################################################
  ## model states ####################################################################
  ##############################################################################################################################
  
  dim(IC1S1_10) <- N_gender
  dim(IC2S1_10) <- N_gender
  dim(IC3S1_10) <- N_gender
  dim(IC4S1_10) <- N_gender
  
  dim(IC1S1_11) <- N_gender
  dim(IC2S1_11) <- N_gender
  dim(IC3S1_11) <- N_gender
  dim(IC4S1_11) <- N_gender
  
  dim(IC1S1_12) <- N_gender
  dim(IC2S1_12) <- N_gender
  dim(IC3S1_12) <- N_gender
  dim(IC4S1_12) <- N_gender
  
  dim(IC1S1_13) <- N_gender
  dim(IC2S1_13) <- N_gender
  dim(IC3S1_13) <- N_gender
  dim(IC4S1_13) <- N_gender
  
  dim(IC1S1_14) <- N_gender
  dim(IC2S1_14) <- N_gender
  dim(IC3S1_14) <- N_gender
  dim(IC4S1_14) <- N_gender
  
  dim(IC1S1_15) <- N_gender
  dim(IC2S1_15) <- N_gender
  dim(IC3S1_15) <- N_gender
  dim(IC4S1_15) <- N_gender
  
  dim(IC1S1_16) <- N_gender
  dim(IC2S1_16) <- N_gender
  dim(IC3S1_16) <- N_gender
  dim(IC4S1_16) <- N_gender
  
  dim(IC1S1_17) <- N_gender
  dim(IC2S1_17) <- N_gender
  dim(IC3S1_17) <- N_gender
  dim(IC4S1_17) <- N_gender
  
  
  
  dim(IC1S2_10) <- N_gender
  dim(IC2S2_10) <- N_gender
  dim(IC3S2_10) <- N_gender
  dim(IC4S2_10) <- N_gender
  
  dim(IC1S2_11) <- N_gender
  dim(IC2S2_11) <- N_gender
  dim(IC3S2_11) <- N_gender
  dim(IC4S2_11) <- N_gender
  
  dim(IC1S2_12) <- N_gender
  dim(IC2S2_12) <- N_gender
  dim(IC3S2_12) <- N_gender
  dim(IC4S2_12) <- N_gender
  
  dim(IC1S2_13) <- N_gender
  dim(IC2S2_13) <- N_gender
  dim(IC3S2_13) <- N_gender
  dim(IC4S2_13) <- N_gender
  
  dim(IC1S2_14) <- N_gender
  dim(IC2S2_14) <- N_gender
  dim(IC3S2_14) <- N_gender
  dim(IC4S2_14) <- N_gender
  
  dim(IC1S2_15) <- N_gender
  dim(IC2S2_15) <- N_gender
  dim(IC3S2_15) <- N_gender
  dim(IC4S2_15) <- N_gender
  
  dim(IC1S2_16) <- N_gender
  dim(IC2S2_16) <- N_gender
  dim(IC3S2_16) <- N_gender
  dim(IC4S2_16) <- N_gender
  
  dim(IC1S2_17) <- N_gender
  dim(IC2S2_17) <- N_gender
  dim(IC3S2_17) <- N_gender
  dim(IC4S2_17) <- N_gender
  
  
  dim(EC1S1_10) <- N_gender
  dim(EC2S1_10) <- N_gender
  dim(EC3S1_10) <- N_gender
  dim(EC4S1_10) <- N_gender
  
  dim(EC1S1_11) <- N_gender
  dim(EC2S1_11) <- N_gender
  dim(EC3S1_11) <- N_gender
  dim(EC4S1_11) <- N_gender
  
  dim(EC1S1_12) <- N_gender
  dim(EC2S1_12) <- N_gender
  dim(EC3S1_12) <- N_gender
  dim(EC4S1_12) <- N_gender
  
  dim(EC1S1_13) <- N_gender
  dim(EC2S1_13) <- N_gender
  dim(EC3S1_13) <- N_gender
  dim(EC4S1_13) <- N_gender
  
  dim(EC1S1_14) <- N_gender
  dim(EC2S1_14) <- N_gender
  dim(EC3S1_14) <- N_gender
  dim(EC4S1_14) <- N_gender
  
  dim(EC1S1_15) <- N_gender
  dim(EC2S1_15) <- N_gender
  dim(EC3S1_15) <- N_gender
  dim(EC4S1_15) <- N_gender
  
  dim(EC1S1_16) <- N_gender
  dim(EC2S1_16) <- N_gender
  dim(EC3S1_16) <- N_gender
  dim(EC4S1_16) <- N_gender
  
  dim(EC1S1_17) <- N_gender
  dim(EC2S1_17) <- N_gender
  dim(EC3S1_17) <- N_gender
  dim(EC4S1_17) <- N_gender
  
  
  
  dim(EC1S2_10) <- N_gender
  dim(EC2S2_10) <- N_gender
  dim(EC3S2_10) <- N_gender
  dim(EC4S2_10) <- N_gender
  
  dim(EC1S2_11) <- N_gender
  dim(EC2S2_11) <- N_gender
  dim(EC3S2_11) <- N_gender
  dim(EC4S2_11) <- N_gender
  
  dim(EC1S2_12) <- N_gender
  dim(EC2S2_12) <- N_gender
  dim(EC3S2_12) <- N_gender
  dim(EC4S2_12) <- N_gender
  
  dim(EC1S2_13) <- N_gender
  dim(EC2S2_13) <- N_gender
  dim(EC3S2_13) <- N_gender
  dim(EC4S2_13) <- N_gender
  
  dim(EC1S2_14) <- N_gender
  dim(EC2S2_14) <- N_gender
  dim(EC3S2_14) <- N_gender
  dim(EC4S2_14) <- N_gender
  
  dim(EC1S2_15) <- N_gender
  dim(EC2S2_15) <- N_gender
  dim(EC3S2_15) <- N_gender
  dim(EC4S2_15) <- N_gender
  
  dim(EC1S2_16) <- N_gender
  dim(EC2S2_16) <- N_gender
  dim(EC3S2_16) <- N_gender
  dim(EC4S2_16) <- N_gender
  
  dim(EC1S2_17) <- N_gender
  dim(EC2S2_17) <- N_gender
  dim(EC3S2_17) <- N_gender
  dim(EC4S2_17) <- N_gender
  
  
  
  ##############################################################################################################################
  ##initial conditions####################################################################
  ##############################################################################################################################
  dim(IC1S1_10_ini) <- N_gender
  dim(IC2S1_10_ini) <- N_gender
  dim(IC3S1_10_ini) <- N_gender
  dim(IC4S1_10_ini) <- N_gender
  
  dim(IC1S1_11_ini) <- N_gender
  dim(IC2S1_11_ini) <- N_gender
  dim(IC3S1_11_ini) <- N_gender
  dim(IC4S1_11_ini) <- N_gender
  
  dim(IC1S1_12_ini) <- N_gender
  dim(IC2S1_12_ini) <- N_gender
  dim(IC3S1_12_ini) <- N_gender
  dim(IC4S1_12_ini) <- N_gender
  
  dim(IC1S1_13_ini) <- N_gender
  dim(IC2S1_13_ini) <- N_gender
  dim(IC3S1_13_ini) <- N_gender
  dim(IC4S1_13_ini) <- N_gender
  
  dim(IC1S1_14_ini) <- N_gender
  dim(IC2S1_14_ini) <- N_gender
  dim(IC3S1_14_ini) <- N_gender
  dim(IC4S1_14_ini) <- N_gender
  
  dim(IC1S1_15_ini) <- N_gender
  dim(IC2S1_15_ini) <- N_gender
  dim(IC3S1_15_ini) <- N_gender
  dim(IC4S1_15_ini) <- N_gender
  
  dim(IC1S1_16_ini) <- N_gender
  dim(IC2S1_16_ini) <- N_gender
  dim(IC3S1_16_ini) <- N_gender
  dim(IC4S1_16_ini) <- N_gender
  
  dim(IC1S1_17_ini) <- N_gender
  dim(IC2S1_17_ini) <- N_gender
  dim(IC3S1_17_ini) <- N_gender
  dim(IC4S1_17_ini) <- N_gender
  
  
  
  dim(IC1S2_10_ini) <- N_gender
  dim(IC2S2_10_ini) <- N_gender
  dim(IC3S2_10_ini) <- N_gender
  dim(IC4S2_10_ini) <- N_gender
  
  dim(IC1S2_11_ini) <- N_gender
  dim(IC2S2_11_ini) <- N_gender
  dim(IC3S2_11_ini) <- N_gender
  dim(IC4S2_11_ini) <- N_gender
  
  dim(IC1S2_12_ini) <- N_gender
  dim(IC2S2_12_ini) <- N_gender
  dim(IC3S2_12_ini) <- N_gender
  dim(IC4S2_12_ini) <- N_gender
  
  dim(IC1S2_13_ini) <- N_gender
  dim(IC2S2_13_ini) <- N_gender
  dim(IC3S2_13_ini) <- N_gender
  dim(IC4S2_13_ini) <- N_gender
  
  dim(IC1S2_14_ini) <- N_gender
  dim(IC2S2_14_ini) <- N_gender
  dim(IC3S2_14_ini) <- N_gender
  dim(IC4S2_14_ini) <- N_gender
  
  dim(IC1S2_15_ini) <- N_gender
  dim(IC2S2_15_ini) <- N_gender
  dim(IC3S2_15_ini) <- N_gender
  dim(IC4S2_15_ini) <- N_gender
  
  dim(IC1S2_16_ini) <- N_gender
  dim(IC2S2_16_ini) <- N_gender
  dim(IC3S2_16_ini) <- N_gender
  dim(IC4S2_16_ini) <- N_gender
  
  dim(IC1S2_17_ini) <- N_gender
  dim(IC2S2_17_ini) <- N_gender
  dim(IC3S2_17_ini) <- N_gender
  dim(IC4S2_17_ini) <- N_gender
  
  
  
  dim(EC1S1_10_ini) <- N_gender
  dim(EC2S1_10_ini) <- N_gender
  dim(EC3S1_10_ini) <- N_gender
  dim(EC4S1_10_ini) <- N_gender
  
  dim(EC1S1_11_ini) <- N_gender
  dim(EC2S1_11_ini) <- N_gender
  dim(EC3S1_11_ini) <- N_gender
  dim(EC4S1_11_ini) <- N_gender
  
  dim(EC1S1_12_ini) <- N_gender
  dim(EC2S1_12_ini) <- N_gender
  dim(EC3S1_12_ini) <- N_gender
  dim(EC4S1_12_ini) <- N_gender
  
  dim(EC1S1_13_ini) <- N_gender
  dim(EC2S1_13_ini) <- N_gender
  dim(EC3S1_13_ini) <- N_gender
  dim(EC4S1_13_ini) <- N_gender
  
  dim(EC1S1_14_ini) <- N_gender
  dim(EC2S1_14_ini) <- N_gender
  dim(EC3S1_14_ini) <- N_gender
  dim(EC4S1_14_ini) <- N_gender
  
  dim(EC1S1_15_ini) <- N_gender
  dim(EC2S1_15_ini) <- N_gender
  dim(EC3S1_15_ini) <- N_gender
  dim(EC4S1_15_ini) <- N_gender
  
  dim(EC1S1_16_ini) <- N_gender
  dim(EC2S1_16_ini) <- N_gender
  dim(EC3S1_16_ini) <- N_gender
  dim(EC4S1_16_ini) <- N_gender
  
  dim(EC1S1_17_ini) <- N_gender
  dim(EC2S1_17_ini) <- N_gender
  dim(EC3S1_17_ini) <- N_gender
  dim(EC4S1_17_ini) <- N_gender
  
  
  
  dim(EC1S2_10_ini) <- N_gender
  dim(EC2S2_10_ini) <- N_gender
  dim(EC3S2_10_ini) <- N_gender
  dim(EC4S2_10_ini) <- N_gender
  
  dim(EC1S2_11_ini) <- N_gender
  dim(EC2S2_11_ini) <- N_gender
  dim(EC3S2_11_ini) <- N_gender
  dim(EC4S2_11_ini) <- N_gender
  
  dim(EC1S2_12_ini) <- N_gender
  dim(EC2S2_12_ini) <- N_gender
  dim(EC3S2_12_ini) <- N_gender
  dim(EC4S2_12_ini) <- N_gender
  
  dim(EC1S2_13_ini) <- N_gender
  dim(EC2S2_13_ini) <- N_gender
  dim(EC3S2_13_ini) <- N_gender
  dim(EC4S2_13_ini) <- N_gender
  
  dim(EC1S2_14_ini) <- N_gender
  dim(EC2S2_14_ini) <- N_gender
  dim(EC3S2_14_ini) <- N_gender
  dim(EC4S2_14_ini) <- N_gender
  
  dim(EC1S2_15_ini) <- N_gender
  dim(EC2S2_15_ini) <- N_gender
  dim(EC3S2_15_ini) <- N_gender
  dim(EC4S2_15_ini) <- N_gender
  
  dim(EC1S2_16_ini) <- N_gender
  dim(EC2S2_16_ini) <- N_gender
  dim(EC3S2_16_ini) <- N_gender
  dim(EC4S2_16_ini) <- N_gender
  
  dim(EC1S2_17_ini) <- N_gender
  dim(EC2S2_17_ini) <- N_gender
  dim(EC3S2_17_ini) <- N_gender
  dim(EC4S2_17_ini) <- N_gender
  
  
  
  ##############################################################################################################################
  ##lags####################################################################
  ##############################################################################################################################
  
  
  
  dim(IC1S1_10_lag) <- N_gender
  dim(IC2S1_10_lag) <- N_gender
  dim(IC3S1_10_lag) <- N_gender
  dim(IC4S1_10_lag) <- N_gender
  
  dim(IC1S1_11_lag) <- N_gender
  dim(IC2S1_11_lag) <- N_gender
  dim(IC3S1_11_lag) <- N_gender
  dim(IC4S1_11_lag) <- N_gender
  
  dim(IC1S1_12_lag) <- N_gender
  dim(IC2S1_12_lag) <- N_gender
  dim(IC3S1_12_lag) <- N_gender
  dim(IC4S1_12_lag) <- N_gender
  
  dim(IC1S1_13_lag) <- N_gender
  dim(IC2S1_13_lag) <- N_gender
  dim(IC3S1_13_lag) <- N_gender
  dim(IC4S1_13_lag) <- N_gender
  
  dim(IC1S1_14_lag) <- N_gender
  dim(IC2S1_14_lag) <- N_gender
  dim(IC3S1_14_lag) <- N_gender
  dim(IC4S1_14_lag) <- N_gender
  
  dim(IC1S1_15_lag) <- N_gender
  dim(IC2S1_15_lag) <- N_gender
  dim(IC3S1_15_lag) <- N_gender
  dim(IC4S1_15_lag) <- N_gender
  
  dim(IC1S1_16_lag) <- N_gender
  dim(IC2S1_16_lag) <- N_gender
  dim(IC3S1_16_lag) <- N_gender
  dim(IC4S1_16_lag) <- N_gender
  
  dim(IC1S1_17_lag) <- N_gender
  dim(IC2S1_17_lag) <- N_gender
  dim(IC3S1_17_lag) <- N_gender
  dim(IC4S1_17_lag) <- N_gender
  
  
  
  dim(IC1S2_10_lag) <- N_gender
  dim(IC2S2_10_lag) <- N_gender
  dim(IC3S2_10_lag) <- N_gender
  dim(IC4S2_10_lag) <- N_gender
  
  dim(IC1S2_11_lag) <- N_gender
  dim(IC2S2_11_lag) <- N_gender
  dim(IC3S2_11_lag) <- N_gender
  dim(IC4S2_11_lag) <- N_gender
  
  dim(IC1S2_12_lag) <- N_gender
  dim(IC2S2_12_lag) <- N_gender
  dim(IC3S2_12_lag) <- N_gender
  dim(IC4S2_12_lag) <- N_gender
  
  dim(IC1S2_13_lag) <- N_gender
  dim(IC2S2_13_lag) <- N_gender
  dim(IC3S2_13_lag) <- N_gender
  dim(IC4S2_13_lag) <- N_gender
  
  dim(IC1S2_14_lag) <- N_gender
  dim(IC2S2_14_lag) <- N_gender
  dim(IC3S2_14_lag) <- N_gender
  dim(IC4S2_14_lag) <- N_gender
  
  dim(IC1S2_15_lag) <- N_gender
  dim(IC2S2_15_lag) <- N_gender
  dim(IC3S2_15_lag) <- N_gender
  dim(IC4S2_15_lag) <- N_gender
  
  dim(IC1S2_16_lag) <- N_gender
  dim(IC2S2_16_lag) <- N_gender
  dim(IC3S2_16_lag) <- N_gender
  dim(IC4S2_16_lag) <- N_gender
  
  dim(IC1S2_17_lag) <- N_gender
  dim(IC2S2_17_lag) <- N_gender
  dim(IC3S2_17_lag) <- N_gender
  dim(IC4S2_17_lag) <- N_gender
  
  
  
  dim(EC1S1_10_lag) <- N_gender
  dim(EC2S1_10_lag) <- N_gender
  dim(EC3S1_10_lag) <- N_gender
  dim(EC4S1_10_lag) <- N_gender
  
  dim(EC1S1_11_lag) <- N_gender
  dim(EC2S1_11_lag) <- N_gender
  dim(EC3S1_11_lag) <- N_gender
  dim(EC4S1_11_lag) <- N_gender
  
  dim(EC1S1_12_lag) <- N_gender
  dim(EC2S1_12_lag) <- N_gender
  dim(EC3S1_12_lag) <- N_gender
  dim(EC4S1_12_lag) <- N_gender
  
  dim(EC1S1_13_lag) <- N_gender
  dim(EC2S1_13_lag) <- N_gender
  dim(EC3S1_13_lag) <- N_gender
  dim(EC4S1_13_lag) <- N_gender
  
  dim(EC1S1_14_lag) <- N_gender
  dim(EC2S1_14_lag) <- N_gender
  dim(EC3S1_14_lag) <- N_gender
  dim(EC4S1_14_lag) <- N_gender
  
  dim(EC1S1_15_lag) <- N_gender
  dim(EC2S1_15_lag) <- N_gender
  dim(EC3S1_15_lag) <- N_gender
  dim(EC4S1_15_lag) <- N_gender
  
  dim(EC1S1_16_lag) <- N_gender
  dim(EC2S1_16_lag) <- N_gender
  dim(EC3S1_16_lag) <- N_gender
  dim(EC4S1_16_lag) <- N_gender
  
  dim(EC1S1_17_lag) <- N_gender
  dim(EC2S1_17_lag) <- N_gender
  dim(EC3S1_17_lag) <- N_gender
  dim(EC4S1_17_lag) <- N_gender
  
  
  
  dim(EC1S2_10_lag) <- N_gender
  dim(EC2S2_10_lag) <- N_gender
  dim(EC3S2_10_lag) <- N_gender
  dim(EC4S2_10_lag) <- N_gender
  
  dim(EC1S2_11_lag) <- N_gender
  dim(EC2S2_11_lag) <- N_gender
  dim(EC3S2_11_lag) <- N_gender
  dim(EC4S2_11_lag) <- N_gender
  
  dim(EC1S2_12_lag) <- N_gender
  dim(EC2S2_12_lag) <- N_gender
  dim(EC3S2_12_lag) <- N_gender
  dim(EC4S2_12_lag) <- N_gender
  
  dim(EC1S2_13_lag) <- N_gender
  dim(EC2S2_13_lag) <- N_gender
  dim(EC3S2_13_lag) <- N_gender
  dim(EC4S2_13_lag) <- N_gender
  
  dim(EC1S2_14_lag) <- N_gender
  dim(EC2S2_14_lag) <- N_gender
  dim(EC3S2_14_lag) <- N_gender
  dim(EC4S2_14_lag) <- N_gender
  
  dim(EC1S2_15_lag) <- N_gender
  dim(EC2S2_15_lag) <- N_gender
  dim(EC3S2_15_lag) <- N_gender
  dim(EC4S2_15_lag) <- N_gender
  
  dim(EC1S2_16_lag) <- N_gender
  dim(EC2S2_16_lag) <- N_gender
  dim(EC3S2_16_lag) <- N_gender
  dim(EC4S2_16_lag) <- N_gender
  
  dim(EC1S2_17_lag) <- N_gender
  dim(EC2S2_17_lag) <- N_gender
  dim(EC3S2_17_lag) <- N_gender
  dim(EC4S2_17_lag) <- N_gender
  
  
  # parameters
  dim(turn10) <- N_gender
  
  dim(r) <- N_gender
  dim(f) <- N_gender
  
  dim(n2nr) <- N_gender
  dim(n2r) <- N_gender
  dim(p2care) <- N_gender
  dim(p2nr) <- N_gender
  dim(p2r) <- N_gender
  
  dim(end_nr) <- N_gender
  dim(end_res) <- N_gender
  
  dim(nr2r) <- N_gender
  dim(nr2p) <- N_gender
  
  dim(r2nr) <- N_gender
  dim(r2p) <- N_gender
  
  
  dim(t10_ic1s1) <- N_gender
  dim(t10_ic2s1) <- N_gender
  dim(t10_ic3s1) <- N_gender
  dim(t10_ic4s1) <- N_gender
  
  dim(t10_ic1s2) <- N_gender
  dim(t10_ic2s2) <- N_gender
  dim(t10_ic3s2) <- N_gender
  dim(t10_ic4s2) <- N_gender
  
  
  
  dim(t10_ec1s1) <- N_gender
  dim(t10_ec2s1) <- N_gender
  dim(t10_ec3s1) <- N_gender
  dim(t10_ec4s1) <- N_gender
  
  dim(t10_ec1s2) <- N_gender
  dim(t10_ec2s2) <- N_gender
  dim(t10_ec3s2) <- N_gender
  dim(t10_ec4s2) <- N_gender
  
  
  dim(neet16_ic1s1) <- N_gender
  dim(neet16_ic2s1) <- N_gender
  dim(neet16_ic3s1) <- N_gender
  dim(neet16_ic4s1) <- N_gender
  
  dim(neet16_ic1s2) <- N_gender
  dim(neet16_ic2s2) <- N_gender
  dim(neet16_ic3s2) <- N_gender
  dim(neet16_ic4s2) <- N_gender
  
  
  
  dim(neet16_ec1s1) <- N_gender
  dim(neet16_ec2s1) <- N_gender
  dim(neet16_ec3s1) <- N_gender
  dim(neet16_ec4s1) <- N_gender
  
  dim(neet16_ec1s2) <- N_gender
  dim(neet16_ec2s2) <- N_gender
  dim(neet16_ec3s2) <- N_gender
  dim(neet16_ec4s2) <- N_gender
  
  
  
  dim(n2care_i_10) <- N_gender
  dim(n2care_i_11) <- N_gender
  dim(n2care_i_12) <- N_gender
  dim(n2care_i_13) <- N_gender
  dim(n2care_i_14) <- N_gender
  dim(n2care_i_15) <- N_gender
  dim(n2care_i_16) <- N_gender
  dim(n2care_i_17) <- N_gender
  
  dim(n2care_e_10) <- N_gender
  dim(n2care_e_11) <- N_gender
  dim(n2care_e_12) <- N_gender
  dim(n2care_e_13) <- N_gender
  dim(n2care_e_14) <- N_gender
  dim(n2care_e_15) <- N_gender
  dim(n2care_e_16) <- N_gender
  dim(n2care_e_17) <- N_gender
  
  dim(neet2m_i) <- N_gender
  dim(neet2m_e) <- N_gender
  
  
  dim(m2pru_ic1_10) <- N_gender
  dim(m2pru_ic2_10) <- N_gender
  dim(m2pru_ic3_10) <- N_gender
  dim(m2pru_ic4_10) <- N_gender
  
  dim(m2pru_ic1_11) <- N_gender
  dim(m2pru_ic2_11) <- N_gender
  dim(m2pru_ic3_11) <- N_gender
  dim(m2pru_ic4_11) <- N_gender
  
  dim(m2pru_ic1_12) <- N_gender
  dim(m2pru_ic2_12) <- N_gender
  dim(m2pru_ic3_12) <- N_gender
  dim(m2pru_ic4_12) <- N_gender
  
  dim(m2pru_ic1_13) <- N_gender
  dim(m2pru_ic2_13) <- N_gender
  dim(m2pru_ic3_13) <- N_gender
  dim(m2pru_ic4_13) <- N_gender
  
  dim(m2pru_ic1_14) <- N_gender
  dim(m2pru_ic2_14) <- N_gender
  dim(m2pru_ic3_14) <- N_gender
  dim(m2pru_ic4_14) <- N_gender
  
  dim(m2pru_ic1_15) <- N_gender
  dim(m2pru_ic2_15) <- N_gender
  dim(m2pru_ic3_15) <- N_gender
  dim(m2pru_ic4_15) <- N_gender
  
  dim(m2neet_ic1_16) <- N_gender
  dim(m2neet_ic2_16) <- N_gender
  dim(m2neet_ic3_16) <- N_gender
  dim(m2neet_ic4_16) <- N_gender
  
  dim(m2neet_ic1_17) <- N_gender
  dim(m2neet_ic2_17) <- N_gender
  dim(m2neet_ic3_17) <- N_gender
  dim(m2neet_ic4_17) <- N_gender
  
  
  dim(m2pru_ec1_10) <- N_gender
  dim(m2pru_ec2_10) <- N_gender
  dim(m2pru_ec3_10) <- N_gender
  dim(m2pru_ec4_10) <- N_gender
  
  dim(m2pru_ec1_11) <- N_gender
  dim(m2pru_ec2_11) <- N_gender
  dim(m2pru_ec3_11) <- N_gender
  dim(m2pru_ec4_11) <- N_gender
  
  dim(m2pru_ec1_12) <- N_gender
  dim(m2pru_ec2_12) <- N_gender
  dim(m2pru_ec3_12) <- N_gender
  dim(m2pru_ec4_12) <- N_gender
  
  dim(m2pru_ec1_13) <- N_gender
  dim(m2pru_ec2_13) <- N_gender
  dim(m2pru_ec3_13) <- N_gender
  dim(m2pru_ec4_13) <- N_gender
  
  dim(m2pru_ec1_14) <- N_gender
  dim(m2pru_ec2_14) <- N_gender
  dim(m2pru_ec3_14) <- N_gender
  dim(m2pru_ec4_14) <- N_gender
  
  dim(m2pru_ec1_15) <- N_gender
  dim(m2pru_ec2_15) <- N_gender
  dim(m2pru_ec3_15) <- N_gender
  dim(m2pru_ec4_15) <- N_gender
  
  dim(m2neet_ec1_16) <- N_gender
  dim(m2neet_ec2_16) <- N_gender
  dim(m2neet_ec3_16) <- N_gender
  dim(m2neet_ec4_16) <- N_gender
  
  dim(m2neet_ec1_17) <- N_gender
  dim(m2neet_ec2_17) <- N_gender
  dim(m2neet_ec3_17) <- N_gender
  dim(m2neet_ec4_17) <- N_gender
  
  dim(miss_ic1u_10) <- N_gender
  dim(miss_ic2u_10) <- N_gender
  dim(miss_ic3u_10) <- N_gender
  dim(miss_ic4u_10) <- N_gender
  
  dim(miss_ic1u_11) <- N_gender
  dim(miss_ic2u_11) <- N_gender
  dim(miss_ic3u_11) <- N_gender
  dim(miss_ic4u_11) <- N_gender
  
  dim(miss_ic1u_12) <- N_gender
  dim(miss_ic2u_12) <- N_gender
  dim(miss_ic3u_12) <- N_gender
  dim(miss_ic4u_12) <- N_gender
  
  dim(miss_ic1u_13) <- N_gender
  dim(miss_ic2u_13) <- N_gender
  dim(miss_ic3u_13) <- N_gender
  dim(miss_ic4u_13) <- N_gender
  
  dim(miss_ic1u_14) <- N_gender
  dim(miss_ic2u_14) <- N_gender
  dim(miss_ic3u_14) <- N_gender
  dim(miss_ic4u_14) <- N_gender
  
  dim(miss_ic1u_15) <- N_gender
  dim(miss_ic2u_15) <- N_gender
  dim(miss_ic3u_15) <- N_gender
  dim(miss_ic4u_15) <- N_gender
  
  dim(miss_ic1u_16) <- N_gender
  dim(miss_ic2u_16) <- N_gender
  dim(miss_ic3u_16) <- N_gender
  dim(miss_ic4u_16) <- N_gender
  
  dim(miss_ic1u_17) <- N_gender
  dim(miss_ic2u_17) <- N_gender
  dim(miss_ic3u_17) <- N_gender
  dim(miss_ic4u_17) <- N_gender
  
  dim(miss_ec1u_10) <- N_gender
  dim(miss_ec2u_10) <- N_gender
  dim(miss_ec3u_10) <- N_gender
  dim(miss_ec4u_10) <- N_gender
  
  dim(miss_ec1u_11) <- N_gender
  dim(miss_ec2u_11) <- N_gender
  dim(miss_ec3u_11) <- N_gender
  dim(miss_ec4u_11) <- N_gender
  
  dim(miss_ec1u_12) <- N_gender
  dim(miss_ec2u_12) <- N_gender
  dim(miss_ec3u_12) <- N_gender
  dim(miss_ec4u_12) <- N_gender
  
  dim(miss_ec1u_13) <- N_gender
  dim(miss_ec2u_13) <- N_gender
  dim(miss_ec3u_13) <- N_gender
  dim(miss_ec4u_13) <- N_gender
  
  dim(miss_ec1u_14) <- N_gender
  dim(miss_ec2u_14) <- N_gender
  dim(miss_ec3u_14) <- N_gender
  dim(miss_ec4u_14) <- N_gender
  
  dim(miss_ec1u_15) <- N_gender
  dim(miss_ec2u_15) <- N_gender
  dim(miss_ec3u_15) <- N_gender
  dim(miss_ec4u_15) <- N_gender
  
  dim(miss_ec1u_16) <- N_gender
  dim(miss_ec2u_16) <- N_gender
  dim(miss_ec3u_16) <- N_gender
  dim(miss_ec4u_16) <- N_gender
  
  dim(miss_ec1u_17) <- N_gender
  dim(miss_ec2u_17) <- N_gender
  dim(miss_ec3u_17) <- N_gender
  dim(miss_ec4u_17) <- N_gender
  
  
  
  
  ##############################################################################################################################
  # DIFFERENTIAL EQUATIONS # # #  # # #
  ###############################################################################################################################
  deriv(IC1S1_10[]) <- t10_ic1s1[i]*pc_incl*turn10[i] - age_up*IC1S1_10_lag[i] + r[i]*EC1S1_10[i] - f[i]*IC1S1_10[i] - n2care_i_10[i]*IC1S1_10[i] - m2pru_ic1_10[i]*IC1S1_10[i] 
  deriv(IC2S1_10[]) <- t10_ic2s1[i]*pc_incl*turn10[i] - age_up*IC2S1_10_lag[i] + r[i]*EC2S1_10[i] - f[i]*IC2S1_10[i] + n2nr[i]*n2care_i_10[i]*IC1S1_10[i] + p2nr[i]*p2care[i]*IC4S1_10[i] + r2nr[i]*end_res[i]*IC3S1_10[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_10[i] - m2pru_ic2_10[i]*IC2S1_10[i] 
  deriv(IC3S1_10[]) <- t10_ic3s1[i]*pc_incl*turn10[i] - age_up*IC3S1_10_lag[i] + r[i]*EC3S1_10[i] - f[i]*IC3S1_10[i] + n2r[i]*n2care_i_10[i]*IC2S1_10[i] + p2r[i]*p2care[i]*IC4S1_10[i] + nr2r[i]*end_nr[i]*IC2S1_10[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_10[i] - m2pru_ic3_10[i]*IC3S1_10[i] 
  deriv(IC4S1_10[]) <- t10_ic4s1[i]*pc_incl*turn10[i] - age_up*IC4S1_10_lag[i] + r[i]*EC4S1_10[i] - f[i]*IC4S1_10[i] + nr2p[i]*end_nr[i]*IC2S1_10[i] + r2p[i]*end_res[i]*IC3S1_10[i] - p2care[i]*IC4S1_10[i] - m2pru_ic4_10[i]*IC4S1_10[i] 
  
  deriv(IC1S1_11[]) <- age_up*(IC1S1_10_lag[i] + IC1S2_10_lag[i]) - age_up*IC1S1_11_lag[i] + r[i]*EC1S1_11[i] - f[i]*IC1S1_11[i] - n2care_i_11[i]*IC1S1_11[i] - m2pru_ic1_11[i]*IC1S1_11[i] 
  deriv(IC2S1_11[]) <- age_up*(IC2S1_10_lag[i] + IC2S2_10_lag[i]) - age_up*IC2S1_11_lag[i] + r[i]*EC2S1_11[i] - f[i]*IC2S1_11[i] + n2nr[i]*n2care_i_11[i]*IC1S1_11[i] + p2nr[i]*p2care[i]*IC4S1_11[i] + r2nr[i]*end_res[i]*IC3S1_11[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_11[i] - m2pru_ic2_11[i]*IC2S1_11[i] 
  deriv(IC3S1_11[]) <- age_up*(IC3S1_10_lag[i] + IC3S2_10_lag[i]) - age_up*IC3S1_11_lag[i] + r[i]*EC3S1_11[i] - f[i]*IC3S1_11[i] + n2r[i]*n2care_i_11[i]*IC2S1_11[i] + p2r[i]*p2care[i]*IC4S1_11[i] + nr2r[i]*end_nr[i]*IC2S1_11[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_11[i] - m2pru_ic3_11[i]*IC3S1_11[i] 
  deriv(IC4S1_11[]) <- age_up*(IC4S1_10_lag[i] + IC4S2_10_lag[i]) - age_up*IC4S1_11_lag[i] + r[i]*EC4S1_11[i] - f[i]*IC4S1_11[i] + nr2p[i]*end_nr[i]*IC2S1_11[i] + r2p[i]*end_res[i]*IC3S1_11[i] - p2care[i]*IC4S1_11[i] - m2pru_ic4_11[i]*IC4S1_11[i] 
  
  deriv(IC1S1_12[]) <- age_up*IC1S1_11_lag[i] - age_up*IC1S1_12_lag[i] + r[i]*EC1S1_12[i] - f[i]*IC1S1_12[i] - n2care_i_12[i]*IC1S1_12[i] - m2pru_ic1_12[i]*IC1S1_12[i] 
  deriv(IC2S1_12[]) <- age_up*IC2S1_11_lag[i] - age_up*IC2S1_12_lag[i] + r[i]*EC2S1_12[i] - f[i]*IC2S1_12[i] + n2nr[i]*n2care_i_12[i]*IC1S1_12[i] + p2nr[i]*p2care[i]*IC4S1_12[i] + r2nr[i]*end_res[i]*IC3S1_12[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_12[i] - m2pru_ic2_12[i]*IC2S1_12[i] 
  deriv(IC3S1_12[]) <- age_up*IC3S1_11_lag[i] - age_up*IC3S1_12_lag[i] + r[i]*EC3S1_12[i] - f[i]*IC3S1_12[i] + n2r[i]*n2care_i_12[i]*IC2S1_12[i] + p2r[i]*p2care[i]*IC4S1_12[i] + nr2r[i]*end_nr[i]*IC2S1_12[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_12[i] - m2pru_ic3_12[i]*IC3S1_12[i] 
  deriv(IC4S1_12[]) <- age_up*IC4S1_11_lag[i] - age_up*IC4S1_12_lag[i] + r[i]*EC4S1_12[i] - f[i]*IC4S1_12[i] + nr2p[i]*end_nr[i]*IC2S1_12[i] + r2p[i]*end_res[i]*IC3S1_12[i] - p2care[i]*IC4S1_12[i] - m2pru_ic4_12[i]*IC4S1_12[i] 
  
  deriv(IC1S1_13[]) <- age_up*IC1S1_12_lag[i] - age_up*IC1S1_13_lag[i] + r[i]*EC1S1_13[i] - f[i]*IC1S1_13[i] - n2care_i_13[i]*IC1S1_13[i] - m2pru_ic1_13[i]*IC1S1_13[i] 
  deriv(IC2S1_13[]) <- age_up*IC2S1_12_lag[i] - age_up*IC2S1_13_lag[i] + r[i]*EC2S1_13[i] - f[i]*IC2S1_13[i] + n2nr[i]*n2care_i_13[i]*IC1S1_13[i] + p2nr[i]*p2care[i]*IC4S1_13[i] + r2nr[i]*end_res[i]*IC3S1_13[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_13[i] - m2pru_ic2_13[i]*IC2S1_13[i] 
  deriv(IC3S1_13[]) <- age_up*IC3S1_12_lag[i] - age_up*IC3S1_13_lag[i] + r[i]*EC3S1_13[i] - f[i]*IC3S1_13[i] + n2r[i]*n2care_i_13[i]*IC2S1_13[i] + p2r[i]*p2care[i]*IC4S1_13[i] + nr2r[i]*end_nr[i]*IC2S1_13[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_13[i] - m2pru_ic3_13[i]*IC3S1_13[i] 
  deriv(IC4S1_13[]) <- age_up*IC4S1_12_lag[i] - age_up*IC4S1_13_lag[i] + r[i]*EC4S1_13[i] - f[i]*IC4S1_13[i] + nr2p[i]*end_nr[i]*IC2S1_13[i] + r2p[i]*end_res[i]*IC3S1_13[i] - p2care[i]*IC4S1_13[i] - m2pru_ic4_13[i]*IC4S1_13[i] 
  
  deriv(IC1S1_14[]) <- age_up*IC1S1_13_lag[i] - age_up*IC1S1_14_lag[i] + r[i]*EC1S1_14[i] - f[i]*IC1S1_14[i] - n2care_i_14[i]*IC1S1_14[i] - m2pru_ic1_14[i]*IC1S1_14[i] 
  deriv(IC2S1_14[]) <- age_up*IC2S1_13_lag[i] - age_up*IC2S1_14_lag[i] + r[i]*EC2S1_14[i] - f[i]*IC2S1_14[i] + n2nr[i]*n2care_i_14[i]*IC1S1_14[i] + p2nr[i]*p2care[i]*IC4S1_14[i] + r2nr[i]*end_res[i]*IC3S1_14[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_14[i] - m2pru_ic2_14[i]*IC2S1_14[i] 
  deriv(IC3S1_14[]) <- age_up*IC3S1_13_lag[i] - age_up*IC3S1_14_lag[i] + r[i]*EC3S1_14[i] - f[i]*IC3S1_14[i] + n2r[i]*n2care_i_14[i]*IC2S1_14[i] + p2r[i]*p2care[i]*IC4S1_14[i] + nr2r[i]*end_nr[i]*IC2S1_14[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_14[i] - m2pru_ic3_14[i]*IC3S1_14[i] 
  deriv(IC4S1_14[]) <- age_up*IC4S1_13_lag[i] - age_up*IC4S1_14_lag[i] + r[i]*EC4S1_14[i] - f[i]*IC4S1_14[i] + nr2p[i]*end_nr[i]*IC2S1_14[i] + r2p[i]*end_res[i]*IC3S1_14[i] - p2care[i]*IC4S1_14[i] - m2pru_ic4_14[i]*IC4S1_14[i] 
  
  deriv(IC1S1_15[]) <- age_up*IC1S1_14_lag[i] - age_up*IC1S1_15_lag[i] + r[i]*EC1S1_15[i] - f[i]*IC1S1_15[i] - n2care_i_15[i]*IC1S1_15[i] - m2pru_ic1_15[i]*IC1S1_15[i] 
  deriv(IC2S1_15[]) <- age_up*IC2S1_14_lag[i] - age_up*IC2S1_15_lag[i] + r[i]*EC2S1_15[i] - f[i]*IC2S1_15[i] + n2nr[i]*n2care_i_15[i]*IC1S1_15[i] + p2nr[i]*p2care[i]*IC4S1_15[i] + r2nr[i]*end_res[i]*IC3S1_15[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_15[i] - m2pru_ic2_15[i]*IC2S1_15[i] 
  deriv(IC3S1_15[]) <- age_up*IC3S1_14_lag[i] - age_up*IC3S1_15_lag[i] + r[i]*EC3S1_15[i] - f[i]*IC3S1_15[i] + n2r[i]*n2care_i_15[i]*IC2S1_15[i] + p2r[i]*p2care[i]*IC4S1_15[i] + nr2r[i]*end_nr[i]*IC2S1_15[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_15[i] - m2pru_ic3_15[i]*IC3S1_15[i] 
  deriv(IC4S1_15[]) <- age_up*IC4S1_14_lag[i] - age_up*IC4S1_15_lag[i] + r[i]*EC4S1_15[i] - f[i]*IC4S1_15[i] + nr2p[i]*end_nr[i]*IC2S1_15[i] + r2p[i]*end_res[i]*IC3S1_15[i] - p2care[i]*IC4S1_15[i] - m2pru_ic4_15[i]*IC4S1_15[i] 
  
  # SEEMS LIKE THE INTUITIVE MEANING OF NEET16 IS THE PC OF KIDS THAT ARE NEET STRAIGHT AWAY ON TURNING 16
  # SO THE WAY ITS INCLUDED HERE IS BACKWARDS!!
  deriv(IC1S1_16[]) <- age_up*(neet16_ic1s1[i]*IC1S1_15_lag[i] + neet16_ic1s2[i]*IC1S2_15_lag[i]) - age_up*IC1S1_16_lag[i] + r[i]*EC1S1_16[i] - f[i]*IC1S1_16[i] - n2care_i_16[i]*IC1S1_16[i] + neet2m_i[i]*IC1S2_16[i] - m2neet_ic1_16[i]*IC1S1_16[i] 
  deriv(IC2S1_16[]) <- age_up*(neet16_ic2s1[i]*IC2S1_15_lag[i] + neet16_ic2s2[i]*IC2S2_15_lag[i]) - age_up*IC2S1_16_lag[i] + r[i]*EC2S1_16[i] - f[i]*IC2S1_16[i] + n2nr[i]*n2care_i_16[i]*IC1S1_16[i] + p2nr[i]*p2care[i]*IC4S1_16[i] + r2nr[i]*end_res[i]*IC3S1_16[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_16[i] + neet2m_i[i]*IC2S2_16[i] - m2neet_ic2_16[i]*IC2S1_16[i] 
  deriv(IC3S1_16[]) <- age_up*(neet16_ic3s1[i]*IC3S1_15_lag[i] + neet16_ic3s2[i]*IC3S2_15_lag[i]) - age_up*IC3S1_16_lag[i] + r[i]*EC3S1_16[i] - f[i]*IC3S1_16[i] + n2r[i]*n2care_i_16[i]*IC2S1_16[i] + p2r[i]*p2care[i]*IC4S1_16[i] + nr2r[i]*end_nr[i]*IC2S1_16[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_16[i] + neet2m_i[i]*IC3S2_16[i] - m2neet_ic3_16[i]*IC3S1_16[i] 
  deriv(IC4S1_16[]) <- age_up*(neet16_ic4s1[i]*IC4S1_15_lag[i] + neet16_ic4s2[i]*IC4S2_15_lag[i]) - age_up*IC4S1_16_lag[i] + r[i]*EC4S1_16[i] - f[i]*IC4S1_16[i] + nr2p[i]*end_nr[i]*IC2S1_16[i] + r2p[i]*end_res[i]*IC3S1_16[i] - p2care[i]*IC4S1_16[i] + neet2m_i[i]*IC4S2_16[i] - m2neet_ic4_16[i]*IC4S1_16[i] 
  
  deriv(IC1S1_17[]) <- age_up*IC1S1_16_lag[i] - age_up*IC1S1_17_lag[i] + r[i]*EC1S1_17[i] - f[i]*IC1S1_17[i] - n2care_i_17[i]*IC1S1_17[i] + neet2m_i[i]*IC1S2_17[i] - m2neet_ic1_17[i]*IC1S1_17[i] 
  deriv(IC2S1_17[]) <- age_up*IC2S1_16_lag[i] - age_up*IC2S1_17_lag[i] + r[i]*EC2S1_17[i] - f[i]*IC2S1_17[i] + n2nr[i]*n2care_i_17[i]*IC1S1_17[i] + p2nr[i]*p2care[i]*IC4S1_17[i] + r2nr[i]*end_res[i]*IC3S1_17[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S1_17[i] + neet2m_i[i]*IC2S2_17[i] - m2neet_ic2_17[i]*IC2S1_17[i] 
  deriv(IC3S1_17[]) <- age_up*IC3S1_16_lag[i] - age_up*IC3S1_17_lag[i] + r[i]*EC3S1_17[i] - f[i]*IC3S1_17[i] + n2r[i]*n2care_i_17[i]*IC2S1_17[i] + p2r[i]*p2care[i]*IC4S1_17[i] + nr2r[i]*end_nr[i]*IC2S1_17[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S1_17[i] + neet2m_i[i]*IC3S2_17[i] - m2neet_ic3_17[i]*IC3S1_17[i] 
  deriv(IC4S1_17[]) <- age_up*IC4S1_16_lag[i] - age_up*IC4S1_17_lag[i] + r[i]*EC4S1_17[i] - f[i]*IC4S1_17[i] + nr2p[i]*end_nr[i]*IC2S1_17[i] + r2p[i]*end_res[i]*IC3S1_17[i] - p2care[i]*IC4S1_17[i] + neet2m_i[i]*IC4S2_17[i] - m2neet_ic4_17[i]*IC4S1_17[i] 
  
  
  
  deriv(IC1S2_10[]) <- t10_ic1s2[i]*pc_incl*turn10[i] - age_up*IC1S2_10_lag[i] + r[i]*EC1S2_10[i] - f[i]*IC1S2_10[i] - n2care_i_10[i]*IC1S2_10[i] + m2pru_ic1_10[i]*IC1S1_10[i] 
  deriv(IC2S2_10[]) <- t10_ic2s2[i]*pc_incl*turn10[i] - age_up*IC2S2_10_lag[i] + r[i]*EC2S2_10[i] - f[i]*IC2S2_10[i] + n2nr[i]*n2care_i_10[i]*IC1S2_10[i] + p2nr[i]*p2care[i]*IC4S2_10[i] + r2nr[i]*end_res[i]*IC3S2_10[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_10[i] + m2pru_ic2_10[i]*IC2S1_10[i] 
  deriv(IC3S2_10[]) <- t10_ic3s2[i]*pc_incl*turn10[i] - age_up*IC3S2_10_lag[i] + r[i]*EC3S2_10[i] - f[i]*IC3S2_10[i] + n2r[i]*n2care_i_10[i]*IC2S2_10[i] + p2r[i]*p2care[i]*IC4S2_10[i] + nr2r[i]*end_nr[i]*IC2S2_10[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_10[i] + m2pru_ic3_10[i]*IC3S1_10[i] 
  deriv(IC4S2_10[]) <- t10_ic4s2[i]*pc_incl*turn10[i] - age_up*IC4S2_10_lag[i] + r[i]*EC4S2_10[i] - f[i]*IC4S2_10[i] + nr2p[i]*end_nr[i]*IC2S2_10[i] + r2p[i]*end_res[i]*IC3S2_10[i] - p2care[i]*IC4S2_10[i] + m2pru_ic4_10[i]*IC4S1_10[i] 
  
  deriv(IC1S2_11[]) <- -age_up*IC1S2_11_lag[i] + r[i]*EC1S2_11[i] - f[i]*IC1S2_11[i] - n2care_i_11[i]*IC1S2_11[i] + m2pru_ic1_11[i]*IC1S1_11[i] 
  deriv(IC2S2_11[]) <- -age_up*IC2S2_11_lag[i] + r[i]*EC2S2_11[i] - f[i]*IC2S2_11[i] + n2nr[i]*n2care_i_11[i]*IC1S2_11[i] + p2nr[i]*p2care[i]*IC4S2_11[i] + r2nr[i]*end_res[i]*IC3S2_11[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_11[i] + m2pru_ic2_11[i]*IC2S1_11[i] 
  deriv(IC3S2_11[]) <- -age_up*IC3S2_11_lag[i] + r[i]*EC3S2_11[i] - f[i]*IC3S2_11[i] + n2r[i]*n2care_i_11[i]*IC2S2_11[i] + p2r[i]*p2care[i]*IC4S2_11[i] + nr2r[i]*end_nr[i]*IC2S2_11[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_11[i] + m2pru_ic3_11[i]*IC3S1_11[i] 
  deriv(IC4S2_11[]) <- -age_up*IC4S2_11_lag[i] + r[i]*EC4S2_11[i] - f[i]*IC4S2_11[i] + nr2p[i]*end_nr[i]*IC2S2_11[i] + r2p[i]*end_res[i]*IC3S2_11[i] - p2care[i]*IC4S2_11[i] + m2pru_ic4_11[i]*IC4S1_11[i] 
  
  deriv(IC1S2_12[]) <- age_up*IC1S2_11_lag[i] - age_up*IC1S2_12_lag[i] + r[i]*EC1S2_12[i] - f[i]*IC1S2_12[i] - n2care_i_12[i]*IC1S2_12[i] + m2pru_ic1_12[i]*IC1S1_12[i] 
  deriv(IC2S2_12[]) <- age_up*IC2S2_11_lag[i] - age_up*IC2S2_12_lag[i] + r[i]*EC2S2_12[i] - f[i]*IC2S2_12[i] + n2nr[i]*n2care_i_12[i]*IC1S2_12[i] + p2nr[i]*p2care[i]*IC4S2_12[i] + r2nr[i]*end_res[i]*IC3S2_12[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_12[i] + m2pru_ic2_12[i]*IC2S1_12[i] 
  deriv(IC3S2_12[]) <- age_up*IC3S2_11_lag[i] - age_up*IC3S2_12_lag[i] + r[i]*EC3S2_12[i] - f[i]*IC3S2_12[i] + n2r[i]*n2care_i_12[i]*IC2S2_12[i] + p2r[i]*p2care[i]*IC4S2_12[i] + nr2r[i]*end_nr[i]*IC2S2_12[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_12[i] + m2pru_ic3_12[i]*IC3S1_12[i] 
  deriv(IC4S2_12[]) <- age_up*IC4S2_11_lag[i] - age_up*IC4S2_12_lag[i] + r[i]*EC4S2_12[i] - f[i]*IC4S2_12[i] + nr2p[i]*end_nr[i]*IC2S2_12[i] + r2p[i]*end_res[i]*IC3S2_12[i] - p2care[i]*IC4S2_12[i] + m2pru_ic4_12[i]*IC4S1_12[i] 
  
  deriv(IC1S2_13[]) <- age_up*IC1S2_12_lag[i] - age_up*IC1S2_13_lag[i] + r[i]*EC1S2_13[i] - f[i]*IC1S2_13[i] - n2care_i_13[i]*IC1S2_13[i] + m2pru_ic1_13[i]*IC1S1_13[i] 
  deriv(IC2S2_13[]) <- age_up*IC2S2_12_lag[i] - age_up*IC2S2_13_lag[i] + r[i]*EC2S2_13[i] - f[i]*IC2S2_13[i] + n2nr[i]*n2care_i_13[i]*IC1S2_13[i] + p2nr[i]*p2care[i]*IC4S2_13[i] + r2nr[i]*end_res[i]*IC3S2_13[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_13[i] + m2pru_ic2_13[i]*IC2S1_13[i] 
  deriv(IC3S2_13[]) <- age_up*IC3S2_12_lag[i] - age_up*IC3S2_13_lag[i] + r[i]*EC3S2_13[i] - f[i]*IC3S2_13[i] + n2r[i]*n2care_i_13[i]*IC2S2_13[i] + p2r[i]*p2care[i]*IC4S2_13[i] + nr2r[i]*end_nr[i]*IC2S2_13[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_13[i] + m2pru_ic3_13[i]*IC3S1_13[i] 
  deriv(IC4S2_13[]) <- age_up*IC4S2_12_lag[i] - age_up*IC4S2_13_lag[i] + r[i]*EC4S2_13[i] - f[i]*IC4S2_13[i] + nr2p[i]*end_nr[i]*IC2S2_13[i] + r2p[i]*end_res[i]*IC3S2_13[i] - p2care[i]*IC4S2_13[i] + m2pru_ic4_13[i]*IC4S1_13[i] 
  
  deriv(IC1S2_14[]) <- age_up*IC1S2_13_lag[i] - age_up*IC1S2_14_lag[i] + r[i]*EC1S2_14[i] - f[i]*IC1S2_14[i] - n2care_i_14[i]*IC1S2_14[i] + m2pru_ic1_14[i]*IC1S1_14[i] 
  deriv(IC2S2_14[]) <- age_up*IC2S2_13_lag[i] - age_up*IC2S2_14_lag[i] + r[i]*EC2S2_14[i] - f[i]*IC2S2_14[i] + n2nr[i]*n2care_i_14[i]*IC1S2_14[i] + p2nr[i]*p2care[i]*IC4S2_14[i] + r2nr[i]*end_res[i]*IC3S2_14[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_14[i] + m2pru_ic2_14[i]*IC2S1_14[i] 
  deriv(IC3S2_14[]) <- age_up*IC3S2_13_lag[i] - age_up*IC3S2_14_lag[i] + r[i]*EC3S2_14[i] - f[i]*IC3S2_14[i] + n2r[i]*n2care_i_14[i]*IC2S2_14[i] + p2r[i]*p2care[i]*IC4S2_14[i] + nr2r[i]*end_nr[i]*IC2S2_14[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_14[i] + m2pru_ic3_14[i]*IC3S1_14[i] 
  deriv(IC4S2_14[]) <- age_up*IC4S2_13_lag[i] - age_up*IC4S2_14_lag[i] + r[i]*EC4S2_14[i] - f[i]*IC4S2_14[i] + nr2p[i]*end_nr[i]*IC2S2_14[i] + r2p[i]*end_res[i]*IC3S2_14[i] - p2care[i]*IC4S2_14[i] + m2pru_ic4_14[i]*IC4S1_14[i] 
  
  deriv(IC1S2_15[]) <- age_up*IC1S2_14_lag[i] - age_up*IC1S2_15_lag[i] + r[i]*EC1S2_15[i] - f[i]*IC1S2_15[i] - n2care_i_15[i]*IC1S2_15[i] + m2pru_ic1_15[i]*IC1S1_15[i] 
  deriv(IC2S2_15[]) <- age_up*IC2S2_14_lag[i] - age_up*IC2S2_15_lag[i] + r[i]*EC2S2_15[i] - f[i]*IC2S2_15[i] + n2nr[i]*n2care_i_15[i]*IC1S2_15[i] + p2nr[i]*p2care[i]*IC4S2_15[i] + r2nr[i]*end_res[i]*IC3S2_15[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_15[i] + m2pru_ic2_15[i]*IC2S1_15[i] 
  deriv(IC3S2_15[]) <- age_up*IC3S2_14_lag[i] - age_up*IC3S2_15_lag[i] + r[i]*EC3S2_15[i] - f[i]*IC3S2_15[i] + n2r[i]*n2care_i_15[i]*IC2S2_15[i] + p2r[i]*p2care[i]*IC4S2_15[i] + nr2r[i]*end_nr[i]*IC2S2_15[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_15[i] + m2pru_ic3_15[i]*IC3S1_15[i] 
  deriv(IC4S2_15[]) <- age_up*IC4S2_14_lag[i] - age_up*IC4S2_15_lag[i] + r[i]*EC4S2_15[i] - f[i]*IC4S2_15[i] + nr2p[i]*end_nr[i]*IC2S2_15[i] + r2p[i]*end_res[i]*IC3S2_15[i] - p2care[i]*IC4S2_15[i] + m2pru_ic4_15[i]*IC4S1_15[i] 
  
  deriv(IC1S2_16[]) <- age_up*((1 - neet16_ic1s2[i])*IC1S2_15_lag[i] + (1 - neet16_ic1s1[i])*IC1S1_15_lag[i]) - age_up*IC1S2_16_lag[i] + r[i]*EC1S2_16[i] - f[i]*IC1S2_16[i] - n2care_i_16[i]*IC1S2_16[i] + m2neet_ic1_16[i]*IC1S1_16[i] - neet2m_i[i]*IC1S2_16[i] 
  deriv(IC2S2_16[]) <- age_up*((1 - neet16_ic2s2[i])*IC2S2_15_lag[i] + (1 - neet16_ic2s1[i])*IC2S1_15_lag[i]) - age_up*IC2S2_16_lag[i] + r[i]*EC2S2_16[i] - f[i]*IC2S2_16[i] + n2nr[i]*n2care_i_16[i]*IC1S2_16[i] + p2nr[i]*p2care[i]*IC4S2_16[i] + r2nr[i]*end_res[i]*IC3S2_16[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_16[i] + m2neet_ic2_16[i]*IC2S1_16[i] - neet2m_i[i]*IC2S2_16[i] 
  deriv(IC3S2_16[]) <- age_up*((1 - neet16_ic3s2[i])*IC3S2_15_lag[i] + (1 - neet16_ic3s1[i])*IC3S1_15_lag[i]) - age_up*IC3S2_16_lag[i] + r[i]*EC3S2_16[i] - f[i]*IC3S2_16[i] + n2r[i]*n2care_i_16[i]*IC2S2_16[i] + p2r[i]*p2care[i]*IC4S2_16[i] + nr2r[i]*end_nr[i]*IC2S2_16[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_16[i] + m2neet_ic3_16[i]*IC3S1_16[i] - neet2m_i[i]*IC3S2_16[i] 
  deriv(IC4S2_16[]) <- age_up*((1 - neet16_ic4s2[i])*IC4S2_15_lag[i] + (1 - neet16_ic4s1[i])*IC4S1_15_lag[i]) - age_up*IC4S2_16_lag[i] + r[i]*EC4S2_16[i] - f[i]*IC4S2_16[i] + nr2p[i]*end_nr[i]*IC2S2_16[i] + r2p[i]*end_res[i]*IC3S2_16[i] - p2care[i]*IC4S2_16[i] + m2neet_ic4_16[i]*IC4S1_16[i] - neet2m_i[i]*IC4S2_16[i] 
  
  deriv(IC1S2_17[]) <- age_up*IC1S2_16_lag[i] - age_up*IC1S2_17_lag[i] + r[i]*EC1S2_17[i] - f[i]*IC1S2_17[i] - n2care_i_17[i]*IC1S2_17[i] + m2neet_ic1_17[i]*IC1S1_17[i] - neet2m_i[i]*IC1S2_17[i] 
  deriv(IC2S2_17[]) <- age_up*IC2S2_16_lag[i] - age_up*IC2S2_17_lag[i] + r[i]*EC2S2_17[i] - f[i]*IC2S2_17[i] + n2nr[i]*n2care_i_17[i]*IC1S2_17[i] + p2nr[i]*p2care[i]*IC4S2_17[i] + r2nr[i]*end_res[i]*IC3S2_17[i] - (nr2r[i] + nr2p[i])*end_nr[i]*IC2S2_17[i] + m2neet_ic2_17[i]*IC2S1_17[i] - neet2m_i[i]*IC2S2_17[i] 
  deriv(IC3S2_17[]) <- age_up*IC3S2_16_lag[i] - age_up*IC3S2_17_lag[i] + r[i]*EC3S2_17[i] - f[i]*IC3S2_17[i] + n2r[i]*n2care_i_17[i]*IC2S2_17[i] + p2r[i]*p2care[i]*IC4S2_17[i] + nr2r[i]*end_nr[i]*IC2S2_17[i] - (r2nr[i] + r2p[i])*end_res[i]*IC3S2_17[i] + m2neet_ic3_17[i]*IC3S1_17[i] - neet2m_i[i]*IC3S2_17[i] 
  deriv(IC4S2_17[]) <- age_up*IC4S2_16_lag[i] - age_up*IC4S2_17_lag[i] + r[i]*EC4S2_17[i] - f[i]*IC4S2_17[i] + nr2p[i]*end_nr[i]*IC2S2_17[i] + r2p[i]*end_res[i]*IC3S2_17[i] - p2care[i]*IC4S2_17[i] + m2neet_ic4_17[i]*IC4S1_17[i] - neet2m_i[i]*IC4S2_17[i] 
  
  
  
  deriv(EC1S1_10[]) <- t10_ec1s1[i]*pc_excl*turn10[i] - age_up*EC1S1_10_lag[i] + f[i]*IC1S1_10[i] - r[i]*EC1S1_10[i] - n2care_e_10[i]*EC1S1_10[i] - m2pru_ec1_10[i]*EC1S1_10[i] 
  deriv(EC2S1_10[]) <- t10_ec2s1[i]*pc_excl*turn10[i] - age_up*EC2S1_10_lag[i] + f[i]*IC2S1_10[i] - r[i]*EC2S1_10[i] + n2nr[i]*n2care_e_10[i]*EC1S1_10[i] + p2nr[i]*p2care[i]*EC4S1_10[i] + r2nr[i]*end_res[i]*EC3S1_10[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_10[i] - m2pru_ec2_10[i]*EC2S1_10[i] 
  deriv(EC3S1_10[]) <- t10_ec3s1[i]*pc_excl*turn10[i] - age_up*EC3S1_10_lag[i] + f[i]*IC3S1_10[i] - r[i]*EC3S1_10[i] + n2r[i]*n2care_e_10[i]*EC2S1_10[i] + p2r[i]*p2care[i]*EC4S1_10[i] + nr2r[i]*end_nr[i]*EC2S1_10[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_10[i] - m2pru_ec3_10[i]*EC3S1_10[i] 
  deriv(EC4S1_10[]) <- t10_ec4s1[i]*pc_excl*turn10[i] - age_up*EC4S1_10_lag[i] + f[i]*IC4S1_10[i] - r[i]*EC4S1_10[i] + nr2p[i]*end_nr[i]*EC2S1_10[i] + r2p[i]*end_res[i]*EC3S1_10[i] - p2care[i]*EC4S1_10[i] - m2pru_ec4_10[i]*EC4S1_10[i] 
  
  deriv(EC1S1_11[]) <- age_up*(EC1S1_10_lag[i] + EC1S2_10_lag[i]) - age_up*EC1S1_11_lag[i] + f[i]*IC1S1_11[i] - r[i]*EC1S1_11[i] - n2care_e_11[i]*EC1S1_11[i] - m2pru_ec1_11[i]*EC1S1_11[i] 
  deriv(EC2S1_11[]) <- age_up*(EC2S1_10_lag[i] + EC2S2_10_lag[i]) - age_up*EC2S1_11_lag[i] + f[i]*IC2S1_11[i] - r[i]*EC2S1_11[i] + n2nr[i]*n2care_e_11[i]*EC1S1_11[i] + p2nr[i]*p2care[i]*EC4S1_11[i] + r2nr[i]*end_res[i]*EC3S1_11[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_11[i] - m2pru_ec2_11[i]*EC2S1_11[i] 
  deriv(EC3S1_11[]) <- age_up*(EC3S1_10_lag[i] + EC3S2_10_lag[i]) - age_up*EC3S1_11_lag[i] + f[i]*IC3S1_11[i] - r[i]*EC3S1_11[i] + n2r[i]*n2care_e_11[i]*EC2S1_11[i] + p2r[i]*p2care[i]*EC4S1_11[i] + nr2r[i]*end_nr[i]*EC2S1_11[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_11[i] - m2pru_ec3_11[i]*EC3S1_11[i] 
  deriv(EC4S1_11[]) <- age_up*(EC4S1_10_lag[i] + EC4S2_10_lag[i]) - age_up*EC4S1_11_lag[i] + f[i]*IC4S1_11[i] - r[i]*EC4S1_11[i] + nr2p[i]*end_nr[i]*EC2S1_11[i] + r2p[i]*end_res[i]*EC3S1_11[i] - p2care[i]*EC4S1_11[i] - m2pru_ec4_11[i]*EC4S1_11[i] 
  
  deriv(EC1S1_12[]) <- age_up*EC1S1_11_lag[i] - age_up*EC1S1_12_lag[i] + f[i]*IC1S1_12[i] - r[i]*EC1S1_12[i] - n2care_e_12[i]*EC1S1_12[i] - m2pru_ec1_12[i]*EC1S1_12[i] 
  deriv(EC2S1_12[]) <- age_up*EC2S1_11_lag[i] - age_up*EC2S1_12_lag[i] + f[i]*IC2S1_12[i] - r[i]*EC2S1_12[i] + n2nr[i]*n2care_e_12[i]*EC1S1_12[i] + p2nr[i]*p2care[i]*EC4S1_12[i] + r2nr[i]*end_res[i]*EC3S1_12[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_12[i] - m2pru_ec2_12[i]*EC2S1_12[i] 
  deriv(EC3S1_12[]) <- age_up*EC3S1_11_lag[i] - age_up*EC3S1_12_lag[i] + f[i]*IC3S1_12[i] - r[i]*EC3S1_12[i] + n2r[i]*n2care_e_12[i]*EC2S1_12[i] + p2r[i]*p2care[i]*EC4S1_12[i] + nr2r[i]*end_nr[i]*EC2S1_12[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_12[i] - m2pru_ec3_12[i]*EC3S1_12[i] 
  deriv(EC4S1_12[]) <- age_up*EC4S1_11_lag[i] - age_up*EC4S1_12_lag[i] + f[i]*IC4S1_12[i] - r[i]*EC4S1_12[i] + nr2p[i]*end_nr[i]*EC2S1_12[i] + r2p[i]*end_res[i]*EC3S1_12[i] - p2care[i]*EC4S1_12[i] - m2pru_ec4_12[i]*EC4S1_12[i] 
  
  deriv(EC1S1_13[]) <- age_up*EC1S1_12_lag[i] - age_up*EC1S1_13_lag[i] + f[i]*IC1S1_13[i] - r[i]*EC1S1_13[i] - n2care_e_13[i]*EC1S1_13[i] - m2pru_ec1_13[i]*EC1S1_13[i] 
  deriv(EC2S1_13[]) <- age_up*EC2S1_12_lag[i] - age_up*EC2S1_13_lag[i] + f[i]*IC2S1_13[i] - r[i]*EC2S1_13[i] + n2nr[i]*n2care_e_13[i]*EC1S1_13[i] + p2nr[i]*p2care[i]*EC4S1_13[i] + r2nr[i]*end_res[i]*EC3S1_13[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_13[i] - m2pru_ec2_13[i]*EC2S1_13[i] 
  deriv(EC3S1_13[]) <- age_up*EC3S1_12_lag[i] - age_up*EC3S1_13_lag[i] + f[i]*IC3S1_13[i] - r[i]*EC3S1_13[i] + n2r[i]*n2care_e_13[i]*EC2S1_13[i] + p2r[i]*p2care[i]*EC4S1_13[i] + nr2r[i]*end_nr[i]*EC2S1_13[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_13[i] - m2pru_ec3_13[i]*EC3S1_13[i] 
  deriv(EC4S1_13[]) <- age_up*EC4S1_12_lag[i] - age_up*EC4S1_13_lag[i] + f[i]*IC4S1_13[i] - r[i]*EC4S1_13[i] + nr2p[i]*end_nr[i]*EC2S1_13[i] + r2p[i]*end_res[i]*EC3S1_13[i] - p2care[i]*EC4S1_13[i] - m2pru_ec4_13[i]*EC4S1_13[i] 
  
  deriv(EC1S1_14[]) <- age_up*EC1S1_13_lag[i] - age_up*EC1S1_14_lag[i] + f[i]*IC1S1_14[i] - r[i]*EC1S1_14[i] - n2care_e_14[i]*EC1S1_14[i] - m2pru_ec1_14[i]*EC1S1_14[i] 
  deriv(EC2S1_14[]) <- age_up*EC2S1_13_lag[i] - age_up*EC2S1_14_lag[i] + f[i]*IC2S1_14[i] - r[i]*EC2S1_14[i] + n2nr[i]*n2care_e_14[i]*EC1S1_14[i] + p2nr[i]*p2care[i]*EC4S1_14[i] + r2nr[i]*end_res[i]*EC3S1_14[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_14[i] - m2pru_ec2_14[i]*EC2S1_14[i] 
  deriv(EC3S1_14[]) <- age_up*EC3S1_13_lag[i] - age_up*EC3S1_14_lag[i] + f[i]*IC3S1_14[i] - r[i]*EC3S1_14[i] + n2r[i]*n2care_e_14[i]*EC2S1_14[i] + p2r[i]*p2care[i]*EC4S1_14[i] + nr2r[i]*end_nr[i]*EC2S1_14[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_14[i] - m2pru_ec3_14[i]*EC3S1_14[i] 
  deriv(EC4S1_14[]) <- age_up*EC4S1_13_lag[i] - age_up*EC4S1_14_lag[i] + f[i]*IC4S1_14[i] - r[i]*EC4S1_14[i] + nr2p[i]*end_nr[i]*EC2S1_14[i] + r2p[i]*end_res[i]*EC3S1_14[i] - p2care[i]*EC4S1_14[i] - m2pru_ec4_14[i]*EC4S1_14[i] 
  
  deriv(EC1S1_15[]) <- age_up*EC1S1_14_lag[i] - age_up*EC1S1_15_lag[i] + f[i]*IC1S1_15[i] - r[i]*EC1S1_15[i] - n2care_e_15[i]*EC1S1_15[i] - m2pru_ec1_15[i]*EC1S1_15[i] 
  deriv(EC2S1_15[]) <- age_up*EC2S1_14_lag[i] - age_up*EC2S1_15_lag[i] + f[i]*IC2S1_15[i] - r[i]*EC2S1_15[i] + n2nr[i]*n2care_e_15[i]*EC1S1_15[i] + p2nr[i]*p2care[i]*EC4S1_15[i] + r2nr[i]*end_res[i]*EC3S1_15[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_15[i] - m2pru_ec2_15[i]*EC2S1_15[i] 
  deriv(EC3S1_15[]) <- age_up*EC3S1_14_lag[i] - age_up*EC3S1_15_lag[i] + f[i]*IC3S1_15[i] - r[i]*EC3S1_15[i] + n2r[i]*n2care_e_15[i]*EC2S1_15[i] + p2r[i]*p2care[i]*EC4S1_15[i] + nr2r[i]*end_nr[i]*EC2S1_15[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_15[i] - m2pru_ec3_15[i]*EC3S1_15[i] 
  deriv(EC4S1_15[]) <- age_up*EC4S1_14_lag[i] - age_up*EC4S1_15_lag[i] + f[i]*IC4S1_15[i] - r[i]*EC4S1_15[i] + nr2p[i]*end_nr[i]*EC2S1_15[i] + r2p[i]*end_res[i]*EC3S1_15[i] - p2care[i]*EC4S1_15[i] - m2pru_ec4_15[i]*EC4S1_15[i] 
  
  deriv(EC1S1_16[]) <- age_up*(neet16_ec1s1[i]*EC1S1_15_lag[i] + neet16_ec1s2[i]*EC1S2_15_lag[i]) - age_up*EC1S1_16_lag[i] + f[i]*IC1S1_16[i] - r[i]*EC1S1_16[i] - n2care_e_16[i]*EC1S1_16[i] + neet2m_e[i]*EC1S2_16[i] - m2neet_ec1_16[i]*EC1S1_16[i] 
  deriv(EC2S1_16[]) <- age_up*(neet16_ec2s1[i]*EC2S1_15_lag[i] + neet16_ec2s2[i]*EC2S2_15_lag[i]) - age_up*EC2S1_16_lag[i] + f[i]*IC2S1_16[i] - r[i]*EC2S1_16[i] + n2nr[i]*n2care_e_16[i]*EC1S1_16[i] + p2nr[i]*p2care[i]*EC4S1_16[i] + r2nr[i]*end_res[i]*EC3S1_16[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_16[i] + neet2m_e[i]*EC2S2_16[i] - m2neet_ec2_16[i]*EC2S1_16[i] 
  deriv(EC3S1_16[]) <- age_up*(neet16_ec3s1[i]*EC3S1_15_lag[i] + neet16_ec3s2[i]*EC3S2_15_lag[i]) - age_up*EC3S1_16_lag[i] + f[i]*IC3S1_16[i] - r[i]*EC3S1_16[i] + n2r[i]*n2care_e_16[i]*EC2S1_16[i] + p2r[i]*p2care[i]*EC4S1_16[i] + nr2r[i]*end_nr[i]*EC2S1_16[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_16[i] + neet2m_e[i]*EC3S2_16[i] - m2neet_ec3_16[i]*EC3S1_16[i] 
  deriv(EC4S1_16[]) <- age_up*(neet16_ec4s1[i]*EC4S1_15_lag[i] + neet16_ec4s2[i]*EC4S2_15_lag[i]) - age_up*EC4S1_16_lag[i] + f[i]*IC4S1_16[i] - r[i]*EC4S1_16[i] + nr2p[i]*end_nr[i]*EC2S1_16[i] + r2p[i]*end_res[i]*EC3S1_16[i] - p2care[i]*EC4S1_16[i] + neet2m_e[i]*EC4S2_16[i] - m2neet_ec4_16[i]*EC4S1_16[i] 
  
  deriv(EC1S1_17[]) <- age_up*EC1S1_16_lag[i] - age_up*EC1S1_17_lag[i] + f[i]*IC1S1_17[i] - r[i]*EC1S1_17[i] - n2care_e_17[i]*EC1S1_17[i] + neet2m_e[i]*EC1S2_17[i] - m2neet_ec1_17[i]*EC1S1_17[i] 
  deriv(EC2S1_17[]) <- age_up*EC2S1_16_lag[i] - age_up*EC2S1_17_lag[i] + f[i]*IC2S1_17[i] - r[i]*EC2S1_17[i] + n2nr[i]*n2care_e_17[i]*EC1S1_17[i] + p2nr[i]*p2care[i]*EC4S1_17[i] + r2nr[i]*end_res[i]*EC3S1_17[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S1_17[i] + neet2m_e[i]*EC2S2_17[i] - m2neet_ec2_17[i]*EC2S1_17[i] 
  deriv(EC3S1_17[]) <- age_up*EC3S1_16_lag[i] - age_up*EC3S1_17_lag[i] + f[i]*IC3S1_17[i] - r[i]*EC3S1_17[i] + n2r[i]*n2care_e_17[i]*EC2S1_17[i] + p2r[i]*p2care[i]*EC4S1_17[i] + nr2r[i]*end_nr[i]*EC2S1_17[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S1_17[i] + neet2m_e[i]*EC3S2_17[i] - m2neet_ec3_17[i]*EC3S1_17[i] 
  deriv(EC4S1_17[]) <- age_up*EC4S1_16_lag[i] - age_up*EC4S1_17_lag[i] + f[i]*IC4S1_17[i] - r[i]*EC4S1_17[i] + nr2p[i]*end_nr[i]*EC2S1_17[i] + r2p[i]*end_res[i]*EC3S1_17[i] - p2care[i]*EC4S1_17[i] + neet2m_e[i]*EC4S2_17[i] - m2neet_ec4_17[i]*EC4S1_17[i] 
  
  
  
  deriv(EC1S2_10[]) <- t10_ec1s2[i]*pc_excl*turn10[i] - age_up*EC1S2_10_lag[i] + f[i]*IC1S2_10[i] - r[i]*EC1S2_10[i] - n2care_e_10[i]*EC1S2_10[i] + m2pru_ec1_10[i]*EC1S1_10[i] 
  deriv(EC2S2_10[]) <- t10_ec2s2[i]*pc_excl*turn10[i] - age_up*EC2S2_10_lag[i] + f[i]*IC2S2_10[i] - r[i]*EC2S2_10[i] + n2nr[i]*n2care_e_10[i]*EC1S2_10[i] + p2nr[i]*p2care[i]*EC4S2_10[i] + r2nr[i]*end_res[i]*EC3S2_10[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_10[i] + m2pru_ec2_10[i]*EC2S1_10[i] 
  deriv(EC3S2_10[]) <- t10_ec3s2[i]*pc_excl*turn10[i] - age_up*EC3S2_10_lag[i] + f[i]*IC3S2_10[i] - r[i]*EC3S2_10[i] + n2r[i]*n2care_e_10[i]*EC2S2_10[i] + p2r[i]*p2care[i]*EC4S2_10[i] + nr2r[i]*end_nr[i]*EC2S2_10[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_10[i] + m2pru_ec3_10[i]*EC3S1_10[i] 
  deriv(EC4S2_10[]) <- t10_ec4s2[i]*pc_excl*turn10[i] - age_up*EC4S2_10_lag[i] + f[i]*IC4S2_10[i] - r[i]*EC4S2_10[i] + nr2p[i]*end_nr[i]*EC2S2_10[i] + r2p[i]*end_res[i]*EC3S2_10[i] - p2care[i]*EC4S2_10[i] + m2pru_ec4_10[i]*EC4S1_10[i] 
  
  deriv(EC1S2_11[]) <- -age_up*EC1S2_11_lag[i] + f[i]*IC1S2_11[i] - r[i]*EC1S2_11[i] - n2care_e_11[i]*EC1S2_11[i] + m2pru_ec1_11[i]*EC1S1_11[i] 
  deriv(EC2S2_11[]) <- -age_up*EC2S2_11_lag[i] + f[i]*IC2S2_11[i] - r[i]*EC2S2_11[i] + n2nr[i]*n2care_e_11[i]*EC1S2_11[i] + p2nr[i]*p2care[i]*EC4S2_11[i] + r2nr[i]*end_res[i]*EC3S2_11[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_11[i] + m2pru_ec2_11[i]*EC2S1_11[i] 
  deriv(EC3S2_11[]) <- -age_up*EC3S2_11_lag[i] + f[i]*IC3S2_11[i] - r[i]*EC3S2_11[i] + n2r[i]*n2care_e_11[i]*EC2S2_11[i] + p2r[i]*p2care[i]*EC4S2_11[i] + nr2r[i]*end_nr[i]*EC2S2_11[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_11[i] + m2pru_ec3_11[i]*EC3S1_11[i] 
  deriv(EC4S2_11[]) <- -age_up*EC4S2_11_lag[i] + f[i]*IC4S2_11[i] - r[i]*EC4S2_11[i] + nr2p[i]*end_nr[i]*EC2S2_11[i] + r2p[i]*end_res[i]*EC3S2_11[i] - p2care[i]*EC4S2_11[i] + m2pru_ec4_11[i]*EC4S1_11[i] 
  
  deriv(EC1S2_12[]) <- age_up*EC1S2_11_lag[i] - age_up*EC1S2_12_lag[i] + f[i]*IC1S2_12[i] - r[i]*EC1S2_12[i] - n2care_e_12[i]*EC1S2_12[i] + m2pru_ec1_12[i]*EC1S1_12[i] 
  deriv(EC2S2_12[]) <- age_up*EC2S2_11_lag[i] - age_up*EC2S2_12_lag[i] + f[i]*IC2S2_12[i] - r[i]*EC2S2_12[i] + n2nr[i]*n2care_e_12[i]*EC1S2_12[i] + p2nr[i]*p2care[i]*EC4S2_12[i] + r2nr[i]*end_res[i]*EC3S2_12[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_12[i] + m2pru_ec2_12[i]*EC2S1_12[i] 
  deriv(EC3S2_12[]) <- age_up*EC3S2_11_lag[i] - age_up*EC3S2_12_lag[i] + f[i]*IC3S2_12[i] - r[i]*EC3S2_12[i] + n2r[i]*n2care_e_12[i]*EC2S2_12[i] + p2r[i]*p2care[i]*EC4S2_12[i] + nr2r[i]*end_nr[i]*EC2S2_12[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_12[i] + m2pru_ec3_12[i]*EC3S1_12[i] 
  deriv(EC4S2_12[]) <- age_up*EC4S2_11_lag[i] - age_up*EC4S2_12_lag[i] + f[i]*IC4S2_12[i] - r[i]*EC4S2_12[i] + nr2p[i]*end_nr[i]*EC2S2_12[i] + r2p[i]*end_res[i]*EC3S2_12[i] - p2care[i]*EC4S2_12[i] + m2pru_ec4_12[i]*EC4S1_12[i] 
  
  deriv(EC1S2_13[]) <- age_up*EC1S2_12_lag[i] - age_up*EC1S2_13_lag[i] + f[i]*IC1S2_13[i] - r[i]*EC1S2_13[i] - n2care_e_13[i]*EC1S2_13[i] + m2pru_ec1_13[i]*EC1S1_13[i] 
  deriv(EC2S2_13[]) <- age_up*EC2S2_12_lag[i] - age_up*EC2S2_13_lag[i] + f[i]*IC2S2_13[i] - r[i]*EC2S2_13[i] + n2nr[i]*n2care_e_13[i]*EC1S2_13[i] + p2nr[i]*p2care[i]*EC4S2_13[i] + r2nr[i]*end_res[i]*EC3S2_13[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_13[i] + m2pru_ec2_13[i]*EC2S1_13[i] 
  deriv(EC3S2_13[]) <- age_up*EC3S2_12_lag[i] - age_up*EC3S2_13_lag[i] + f[i]*IC3S2_13[i] - r[i]*EC3S2_13[i] + n2r[i]*n2care_e_13[i]*EC2S2_13[i] + p2r[i]*p2care[i]*EC4S2_13[i] + nr2r[i]*end_nr[i]*EC2S2_13[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_13[i] + m2pru_ec3_13[i]*EC3S1_13[i] 
  deriv(EC4S2_13[]) <- age_up*EC4S2_12_lag[i] - age_up*EC4S2_13_lag[i] + f[i]*IC4S2_13[i] - r[i]*EC4S2_13[i] + nr2p[i]*end_nr[i]*EC2S2_13[i] + r2p[i]*end_res[i]*EC3S2_13[i] - p2care[i]*EC4S2_13[i] + m2pru_ec4_13[i]*EC4S1_13[i] 
  
  deriv(EC1S2_14[]) <- age_up*EC1S2_13_lag[i] - age_up*EC1S2_14_lag[i] + f[i]*IC1S2_14[i] - r[i]*EC1S2_14[i] - n2care_e_14[i]*EC1S2_14[i] + m2pru_ec1_14[i]*EC1S1_14[i] 
  deriv(EC2S2_14[]) <- age_up*EC2S2_13_lag[i] - age_up*EC2S2_14_lag[i] + f[i]*IC2S2_14[i] - r[i]*EC2S2_14[i] + n2nr[i]*n2care_e_14[i]*EC1S2_14[i] + p2nr[i]*p2care[i]*EC4S2_14[i] + r2nr[i]*end_res[i]*EC3S2_14[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_14[i] + m2pru_ec2_14[i]*EC2S1_14[i] 
  deriv(EC3S2_14[]) <- age_up*EC3S2_13_lag[i] - age_up*EC3S2_14_lag[i] + f[i]*IC3S2_14[i] - r[i]*EC3S2_14[i] + n2r[i]*n2care_e_14[i]*EC2S2_14[i] + p2r[i]*p2care[i]*EC4S2_14[i] + nr2r[i]*end_nr[i]*EC2S2_14[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_14[i] + m2pru_ec3_14[i]*EC3S1_14[i] 
  deriv(EC4S2_14[]) <- age_up*EC4S2_13_lag[i] - age_up*EC4S2_14_lag[i] + f[i]*IC4S2_14[i] - r[i]*EC4S2_14[i] + nr2p[i]*end_nr[i]*EC2S2_14[i] + r2p[i]*end_res[i]*EC3S2_14[i] - p2care[i]*EC4S2_14[i] + m2pru_ec4_14[i]*EC4S1_14[i] 
  
  deriv(EC1S2_15[]) <- age_up*EC1S2_14_lag[i] - age_up*EC1S2_15_lag[i] + f[i]*IC1S2_15[i] - r[i]*EC1S2_15[i] - n2care_e_15[i]*EC1S2_15[i] + m2pru_ec1_15[i]*EC1S1_15[i] 
  deriv(EC2S2_15[]) <- age_up*EC2S2_14_lag[i] - age_up*EC2S2_15_lag[i] + f[i]*IC2S2_15[i] - r[i]*EC2S2_15[i] + n2nr[i]*n2care_e_15[i]*EC1S2_15[i] + p2nr[i]*p2care[i]*EC4S2_15[i] + r2nr[i]*end_res[i]*EC3S2_15[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_15[i] + m2pru_ec2_15[i]*EC2S1_15[i] 
  deriv(EC3S2_15[]) <- age_up*EC3S2_14_lag[i] - age_up*EC3S2_15_lag[i] + f[i]*IC3S2_15[i] - r[i]*EC3S2_15[i] + n2r[i]*n2care_e_15[i]*EC2S2_15[i] + p2r[i]*p2care[i]*EC4S2_15[i] + nr2r[i]*end_nr[i]*EC2S2_15[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_15[i] + m2pru_ec3_15[i]*EC3S1_15[i] 
  deriv(EC4S2_15[]) <- age_up*EC4S2_14_lag[i] - age_up*EC4S2_15_lag[i] + f[i]*IC4S2_15[i] - r[i]*EC4S2_15[i] + nr2p[i]*end_nr[i]*EC2S2_15[i] + r2p[i]*end_res[i]*EC3S2_15[i] - p2care[i]*EC4S2_15[i] + m2pru_ec4_15[i]*EC4S1_15[i] 
  
  deriv(EC1S2_16[]) <- age_up*((1 - neet16_ec1s2[i])*EC1S2_15_lag[i] + (1 - neet16_ec1s1[i])*EC1S1_15_lag[i]) - age_up*EC1S2_16_lag[i] + f[i]*IC1S2_16[i] - r[i]*EC1S2_16[i] - n2care_e_16[i]*EC1S2_16[i] + m2neet_ec1_16[i]*EC1S1_16[i] - neet2m_e[i]*EC1S2_16[i] 
  deriv(EC2S2_16[]) <- age_up*((1 - neet16_ec2s2[i])*EC2S2_15_lag[i] + (1 - neet16_ec2s1[i])*EC2S1_15_lag[i]) - age_up*EC2S2_16_lag[i] + f[i]*IC2S2_16[i] - r[i]*EC2S2_16[i] + n2nr[i]*n2care_e_16[i]*EC1S2_16[i] + p2nr[i]*p2care[i]*EC4S2_16[i] + r2nr[i]*end_res[i]*EC3S2_16[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_16[i] + m2neet_ec2_16[i]*EC2S1_16[i] - neet2m_e[i]*EC2S2_16[i] 
  deriv(EC3S2_16[]) <- age_up*((1 - neet16_ec3s2[i])*EC3S2_15_lag[i] + (1 - neet16_ec3s1[i])*EC3S1_15_lag[i]) - age_up*EC3S2_16_lag[i] + f[i]*IC3S2_16[i] - r[i]*EC3S2_16[i] + n2r[i]*n2care_e_16[i]*EC2S2_16[i] + p2r[i]*p2care[i]*EC4S2_16[i] + nr2r[i]*end_nr[i]*EC2S2_16[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_16[i] + m2neet_ec3_16[i]*EC3S1_16[i] - neet2m_e[i]*EC3S2_16[i] 
  deriv(EC4S2_16[]) <- age_up*((1 - neet16_ec4s2[i])*EC4S2_15_lag[i] + (1 - neet16_ec4s1[i])*EC4S1_15_lag[i]) - age_up*EC4S2_16_lag[i] + f[i]*IC4S2_16[i] - r[i]*EC4S2_16[i] + nr2p[i]*end_nr[i]*EC2S2_16[i] + r2p[i]*end_res[i]*EC3S2_16[i] - p2care[i]*EC4S2_16[i] + m2neet_ec4_16[i]*EC4S1_16[i] - neet2m_e[i]*EC4S2_16[i] 
  
  deriv(EC1S2_17[]) <- age_up*EC1S2_16_lag[i] - age_up*EC1S2_17_lag[i] + f[i]*IC1S2_17[i] - r[i]*EC1S2_17[i] - n2care_e_17[i]*EC1S2_17[i] + m2neet_ec1_17[i]*EC1S1_17[i] - neet2m_e[i]*EC1S2_17[i] 
  deriv(EC2S2_17[]) <- age_up*EC2S2_16_lag[i] - age_up*EC2S2_17_lag[i] + f[i]*IC2S2_17[i] - r[i]*EC2S2_17[i] + n2nr[i]*n2care_e_17[i]*EC1S2_17[i] + p2nr[i]*p2care[i]*EC4S2_17[i] + r2nr[i]*end_res[i]*EC3S2_17[i] - (nr2r[i] + nr2p[i])*end_nr[i]*EC2S2_17[i] + m2neet_ec2_17[i]*EC2S1_17[i] - neet2m_e[i]*EC2S2_17[i] 
  deriv(EC3S2_17[]) <- age_up*EC3S2_16_lag[i] - age_up*EC3S2_17_lag[i] + f[i]*IC3S2_17[i] - r[i]*EC3S2_17[i] + n2r[i]*n2care_e_17[i]*EC2S2_17[i] + p2r[i]*p2care[i]*EC4S2_17[i] + nr2r[i]*end_nr[i]*EC2S2_17[i] - (r2nr[i] + r2p[i])*end_res[i]*EC3S2_17[i] + m2neet_ec3_17[i]*EC3S1_17[i] - neet2m_e[i]*EC3S2_17[i] 
  deriv(EC4S2_17[]) <- age_up*EC4S2_16_lag[i] - age_up*EC4S2_17_lag[i] + f[i]*IC4S2_17[i] - r[i]*EC4S2_17[i] + nr2p[i]*end_nr[i]*EC2S2_17[i] + r2p[i]*end_res[i]*EC3S2_17[i] - p2care[i]*EC4S2_17[i] + m2neet_ec4_17[i]*EC4S1_17[i] - neet2m_e[i]*EC4S2_17[i] 
  
  },
target = 'c')  


pars <- list(turn10 = c(100,100),
             pc_incl = 0.7,
             pc_excl = 0.3,
             
             t10_ic1s1 = c(0.01,0.01),
             t10_ic2s1 = c(0.01,0.01),
             t10_ic3s1 = c(0.01,0.01),
             t10_ic4s1 = c(0.01,0.01),
             
             t10_ic1s2 = c(0.01,0.01),
             t10_ic2s2 = c(0.01,0.01),
             t10_ic3s2 = c(0.01,0.01),
             t10_ic4s2 = c(0.01,0.01),
             
             
             
             t10_ec1s1 = c(0.01,0.01),
             t10_ec2s1 = c(0.01,0.01),
             t10_ec3s1 = c(0.01,0.01),
             t10_ec4s1 = c(0.01,0.01),
             
             t10_ec1s2 = c(0.01,0.01),
             t10_ec2s2 = c(0.01,0.01),
             t10_ec3s2 = c(0.01,0.01),
             t10_ec4s2 = c(0.01,0.01),
             
             
             
             
             neet16_ic1s1 = c(0.0001,0.0001),
             neet16_ic2s1 = c(0.0001,0.0001),
             neet16_ic3s1 = c(0.0001,0.0001),
             neet16_ic4s1 = c(0.0001,0.0001),
             
             neet16_ic1s2 = c(0.0001,0.0001),
             neet16_ic2s2 = c(0.0001,0.0001),
             neet16_ic3s2 = c(0.0001,0.0001),
             neet16_ic4s2 = c(0.0001,0.0001),
             
             
             
             neet16_ec1s1 = c(0.0001,0.0001),
             neet16_ec2s1 = c(0.0001,0.0001),
             neet16_ec3s1 = c(0.0001,0.0001),
             neet16_ec4s1 = c(0.0001,0.0001),
             
             neet16_ec1s2 = c(0.0001,0.0001),
             neet16_ec2s2 = c(0.0001,0.0001),
             neet16_ec3s2 = c(0.0001,0.0001),
             neet16_ec4s2 = c(0.0001,0.0001),
             
             
             r = c(0.0001,0.0001),
             f = c(0.0001,0.0001),
             
             n2nr = c(0.8,0.9),
             n2r = c(0.2,0.1),
             p2care = c(0.0001,0.0001),
             p2nr = c(0.8,0.9),
             p2r = c(0.2,0.1),
             
             end_nr = c(0.01,0.01),
             end_res = c(0.01,0.01),
             
             nr2r = c(0.3,0.3),
             nr2p = c(0.3,0.3),
             
             r2nr = c(0.3,0.3),
             r2p = c(0.3,0.3),
             
             n2care_i_10 = c(0.0001,0.0001),
             n2care_i_11 = c(0.0001,0.0001),
             n2care_i_12 = c(0.0001,0.0001),
             n2care_i_13 = c(0.0001,0.0001),
             n2care_i_14 = c(0.0001,0.0001),
             n2care_i_15 = c(0.0001,0.0001),
             n2care_i_16 = c(0.0001,0.0001),
             n2care_i_17 = c(0.0001,0.0001),
             
             n2care_e_10 = c(0.0001,0.0001),
             n2care_e_11 = c(0.0001,0.0001),
             n2care_e_12 = c(0.0001,0.0001),
             n2care_e_13 = c(0.0001,0.0001),
             n2care_e_14 = c(0.0001,0.0001),
             n2care_e_15 = c(0.0001,0.0001),
             n2care_e_16 = c(0.0001,0.0001),
             n2care_e_17 = c(0.0001,0.0001),
             
             
             neet2m_i = c(0.0001,0.0001),
             neet2m_e = c(0.0001,0.0001),
             
             m2pru_ic1_10 = c(0.0001,0.0001),
             m2pru_ic2_10 = c(0.0001,0.0001),
             m2pru_ic3_10 = c(0.0001,0.0001),
             m2pru_ic4_10 = c(0.0001,0.0001),
             
             m2pru_ic1_11 = c(0.0001,0.0001),
             m2pru_ic2_11 = c(0.0001,0.0001),
             m2pru_ic3_11 = c(0.0001,0.0001),
             m2pru_ic4_11 = c(0.0001,0.0001),
             
             m2pru_ic1_12 = c(0.0001,0.0001),
             m2pru_ic2_12 = c(0.0001,0.0001),
             m2pru_ic3_12 = c(0.0001,0.0001),
             m2pru_ic4_12 = c(0.0001,0.0001),
             
             m2pru_ic1_13 = c(0.0001,0.0001),
             m2pru_ic2_13 = c(0.0001,0.0001),
             m2pru_ic3_13 = c(0.0001,0.0001),
             m2pru_ic4_13 = c(0.0001,0.0001),
             
             m2pru_ic1_14 = c(0.0001,0.0001),
             m2pru_ic2_14 = c(0.0001,0.0001),
             m2pru_ic3_14 = c(0.0001,0.0001),
             m2pru_ic4_14 = c(0.0001,0.0001),
             
             m2pru_ic1_15 = c(0.0001,0.0001),
             m2pru_ic2_15 = c(0.0001,0.0001),
             m2pru_ic3_15 = c(0.0001,0.0001),
             m2pru_ic4_15 = c(0.0001,0.0001),
             
             m2pru_ec1_10 = c(0.0001,0.0001),
             m2pru_ec2_10 = c(0.0001,0.0001),
             m2pru_ec3_10 = c(0.0001,0.0001),
             m2pru_ec4_10 = c(0.0001,0.0001),
             
             m2pru_ec1_11 = c(0.0001,0.0001),
             m2pru_ec2_11 = c(0.0001,0.0001),
             m2pru_ec3_11 = c(0.0001,0.0001),
             m2pru_ec4_11 = c(0.0001,0.0001),
             
             m2pru_ec1_12 = c(0.0001,0.0001),
             m2pru_ec2_12 = c(0.0001,0.0001),
             m2pru_ec3_12 = c(0.0001,0.0001),
             m2pru_ec4_12 = c(0.0001,0.0001),
             
             m2pru_ec1_13 = c(0.0001,0.0001),
             m2pru_ec2_13 = c(0.0001,0.0001),
             m2pru_ec3_13 = c(0.0001,0.0001),
             m2pru_ec4_13 = c(0.0001,0.0001),
             
             m2pru_ec1_14 = c(0.0001,0.0001),
             m2pru_ec2_14 = c(0.0001,0.0001),
             m2pru_ec3_14 = c(0.0001,0.0001),
             m2pru_ec4_14 = c(0.0001,0.0001),
             
             m2pru_ec1_15 = c(0.0001,0.0001),
             m2pru_ec2_15 = c(0.0001,0.0001),
             m2pru_ec3_15 = c(0.0001,0.0001),
             m2pru_ec4_15 = c(0.0001,0.0001),
             
             m2neet_ic1_16 = c(0.0001,0.0001),
             m2neet_ic2_16 = c(0.0001,0.0001),
             m2neet_ic3_16 = c(0.0001,0.0001),
             m2neet_ic4_16 = c(0.0001,0.0001),
             
             m2neet_ic1_17 = c(0.0001,0.0001),
             m2neet_ic2_17 = c(0.0001,0.0001),
             m2neet_ic3_17 = c(0.0001,0.0001),
             m2neet_ic4_17 = c(0.0001,0.0001),
             
             m2neet_ec1_16 = c(0.0001,0.0001),
             m2neet_ec2_16 = c(0.0001,0.0001),
             m2neet_ec3_16 = c(0.0001,0.0001),
             m2neet_ec4_16 = c(0.0001,0.0001),
             
             m2neet_ec1_17 = c(0.0001,0.0001),
             m2neet_ec2_17 = c(0.0001,0.0001),
             m2neet_ec3_17 = c(0.0001,0.0001),
             m2neet_ec4_17 = c(0.0001,0.0001),
             
             miss_ic1u_10 = c(0.0001,0.0001),
             miss_ic2u_10 = c(0.0001,0.0001),
             miss_ic3u_10 = c(0.0001,0.0001),
             miss_ic4u_10 = c(0.0001,0.0001),
             
             miss_ic1u_11 = c(0.0001,0.0001),
             miss_ic2u_11 = c(0.0001,0.0001),
             miss_ic3u_11 = c(0.0001,0.0001),
             miss_ic4u_11 = c(0.0001,0.0001),
             
             miss_ic1u_12 = c(0.0001,0.0001),
             miss_ic2u_12 = c(0.0001,0.0001),
             miss_ic3u_12 = c(0.0001,0.0001),
             miss_ic4u_12 = c(0.0001,0.0001),
             
             miss_ic1u_13 = c(0.0001,0.0001),
             miss_ic2u_13 = c(0.0001,0.0001),
             miss_ic3u_13 = c(0.0001,0.0001),
             miss_ic4u_13 = c(0.0001,0.0001),
             
             miss_ic1u_14 = c(0.0001,0.0001),
             miss_ic2u_14 = c(0.0001,0.0001),
             miss_ic3u_14 = c(0.0001,0.0001),
             miss_ic4u_14 = c(0.0001,0.0001),
             
             miss_ic1u_15 = c(0.0001,0.0001),
             miss_ic2u_15 = c(0.0001,0.0001),
             miss_ic3u_15 = c(0.0001,0.0001),
             miss_ic4u_15 = c(0.0001,0.0001),
             
             miss_ic1u_16 = c(0.0001,0.0001),
             miss_ic2u_16 = c(0.0001,0.0001),
             miss_ic3u_16 = c(0.0001,0.0001),
             miss_ic4u_16 = c(0.0001,0.0001),
             
             miss_ic1u_17 = c(0.0001,0.0001),
             miss_ic2u_17 = c(0.0001,0.0001),
             miss_ic3u_17 = c(0.0001,0.0001),
             miss_ic4u_17 = c(0.0001,0.0001),
             
             
             miss_ec1u_10 = c(0.0001,0.0001),
             miss_ec2u_10 = c(0.0001,0.0001),
             miss_ec3u_10 = c(0.0001,0.0001),
             miss_ec4u_10 = c(0.0001,0.0001),
             
             miss_ec1u_11 = c(0.0001,0.0001),
             miss_ec2u_11 = c(0.0001,0.0001),
             miss_ec3u_11 = c(0.0001,0.0001),
             miss_ec4u_11 = c(0.0001,0.0001),
             
             miss_ec1u_12 = c(0.0001,0.0001),
             miss_ec2u_12 = c(0.0001,0.0001),
             miss_ec3u_12 = c(0.0001,0.0001),
             miss_ec4u_12 = c(0.0001,0.0001),
             
             miss_ec1u_13 = c(0.0001,0.0001),
             miss_ec2u_13 = c(0.0001,0.0001),
             miss_ec3u_13 = c(0.0001,0.0001),
             miss_ec4u_13 = c(0.0001,0.0001),
             
             miss_ec1u_14 = c(0.0001,0.0001),
             miss_ec2u_14 = c(0.0001,0.0001),
             miss_ec3u_14 = c(0.0001,0.0001),
             miss_ec4u_14 = c(0.0001,0.0001),
             
             miss_ec1u_15 = c(0.0001,0.0001),
             miss_ec2u_15 = c(0.0001,0.0001),
             miss_ec3u_15 = c(0.0001,0.0001),
             miss_ec4u_15 = c(0.0001,0.0001),
             
             miss_ec1u_16 = c(0.0001,0.0001),
             miss_ec2u_16 = c(0.0001,0.0001),
             miss_ec3u_16 = c(0.0001,0.0001),
             miss_ec4u_16 = c(0.0001,0.0001),
             
             miss_ec1u_17 = c(0.0001,0.0001),
             miss_ec2u_17 = c(0.0001,0.0001),
             miss_ec3u_17 = c(0.0001,0.0001),
             miss_ec4u_17 = c(0.0001,0.0001),
             
             
             
             # initial conditions
             IC1S1_10_ini = c(200,200),
             IC2S1_10_ini = c(200,200),
             IC3S1_10_ini = c(200,200),
             IC4S1_10_ini = c(200,200),
             
             IC1S1_11_ini = c(200,200),
             IC2S1_11_ini = c(200,200),
             IC3S1_11_ini = c(200,200),
             IC4S1_11_ini = c(200,200),
             
             IC1S1_12_ini = c(200,200),
             IC2S1_12_ini = c(200,200),
             IC3S1_12_ini = c(200,200),
             IC4S1_12_ini = c(200,200),
             
             IC1S1_13_ini = c(200,200),
             IC2S1_13_ini = c(200,200),
             IC3S1_13_ini = c(200,200),
             IC4S1_13_ini = c(200,200),
             
             IC1S1_14_ini = c(200,200),
             IC2S1_14_ini = c(200,200),
             IC3S1_14_ini = c(200,200),
             IC4S1_14_ini = c(200,200),
             
             IC1S1_15_ini = c(200,200),
             IC2S1_15_ini = c(200,200),
             IC3S1_15_ini = c(200,200),
             IC4S1_15_ini = c(200,200),
             
             IC1S1_16_ini = c(200,200),
             IC2S1_16_ini = c(200,200),
             IC3S1_16_ini = c(200,200),
             IC4S1_16_ini = c(200,200),
             
             IC1S1_17_ini = c(200,200),
             IC2S1_17_ini = c(200,200),
             IC3S1_17_ini = c(200,200),
             IC4S1_17_ini = c(200,200),
             
             
             
             IC1S2_10_ini = c(200,200),
             IC2S2_10_ini = c(200,200),
             IC3S2_10_ini = c(200,200),
             IC4S2_10_ini = c(200,200),
             
             IC1S2_11_ini = c(200,200),
             IC2S2_11_ini = c(200,200),
             IC3S2_11_ini = c(200,200),
             IC4S2_11_ini = c(200,200),
             
             IC1S2_12_ini = c(200,200),
             IC2S2_12_ini = c(200,200),
             IC3S2_12_ini = c(200,200),
             IC4S2_12_ini = c(200,200),
             
             IC1S2_13_ini = c(200,200),
             IC2S2_13_ini = c(200,200),
             IC3S2_13_ini = c(200,200),
             IC4S2_13_ini = c(200,200),
             
             IC1S2_14_ini = c(200,200),
             IC2S2_14_ini = c(200,200),
             IC3S2_14_ini = c(200,200),
             IC4S2_14_ini = c(200,200),
             
             IC1S2_15_ini = c(200,200),
             IC2S2_15_ini = c(200,200),
             IC3S2_15_ini = c(200,200),
             IC4S2_15_ini = c(200,200),
             
             IC1S2_16_ini = c(200,200),
             IC2S2_16_ini = c(200,200),
             IC3S2_16_ini = c(200,200),
             IC4S2_16_ini = c(200,200),
             
             IC1S2_17_ini = c(200,200),
             IC2S2_17_ini = c(200,200),
             IC3S2_17_ini = c(200,200),
             IC4S2_17_ini = c(200,200),
             
             
             
             
             
             EC1S1_10_ini = c(1,0),
             EC2S1_10_ini = c(1,0),
             EC3S1_10_ini = c(1,0),
             EC4S1_10_ini = c(1,0),
             
             EC1S1_11_ini = c(1,0),
             EC2S1_11_ini = c(1,0),
             EC3S1_11_ini = c(1,0),
             EC4S1_11_ini = c(1,0),
             
             EC1S1_12_ini = c(1,0),
             EC2S1_12_ini = c(1,0),
             EC3S1_12_ini = c(1,0),
             EC4S1_12_ini = c(1,0),
             
             EC1S1_13_ini = c(1,0),
             EC2S1_13_ini = c(1,0),
             EC3S1_13_ini = c(1,0),
             EC4S1_13_ini = c(1,0),
             
             EC1S1_14_ini = c(1,0),
             EC2S1_14_ini = c(1,0),
             EC3S1_14_ini = c(1,0),
             EC4S1_14_ini = c(1,0),
             
             EC1S1_15_ini = c(1,0),
             EC2S1_15_ini = c(1,0),
             EC3S1_15_ini = c(1,0),
             EC4S1_15_ini = c(1,0),
             
             EC1S1_16_ini = c(1,0),
             EC2S1_16_ini = c(1,0),
             EC3S1_16_ini = c(1,0),
             EC4S1_16_ini = c(1,0),
             
             EC1S1_17_ini = c(1,0),
             EC2S1_17_ini = c(1,0),
             EC3S1_17_ini = c(1,0),
             EC4S1_17_ini = c(1,0),
             
             
             
             EC1S2_10_ini = c(1,0),
             EC2S2_10_ini = c(1,0),
             EC3S2_10_ini = c(1,0),
             EC4S2_10_ini = c(1,0),
             
             EC1S2_11_ini = c(1,0),
             EC2S2_11_ini = c(1,0),
             EC3S2_11_ini = c(1,0),
             EC4S2_11_ini = c(1,0),
             
             EC1S2_12_ini = c(1,0),
             EC2S2_12_ini = c(1,0),
             EC3S2_12_ini = c(1,0),
             EC4S2_12_ini = c(1,0),
             
             EC1S2_13_ini = c(1,0),
             EC2S2_13_ini = c(1,0),
             EC3S2_13_ini = c(1,0),
             EC4S2_13_ini = c(1,0),
             
             EC1S2_14_ini = c(1,0),
             EC2S2_14_ini = c(1,0),
             EC3S2_14_ini = c(1,0),
             EC4S2_14_ini = c(1,0),
             
             EC1S2_15_ini = c(1,0),
             EC2S2_15_ini = c(1,0),
             EC3S2_15_ini = c(1,0),
             EC4S2_15_ini = c(1,0),
             
             EC1S2_16_ini = c(1,0),
             EC2S2_16_ini = c(1,0),
             EC3S2_16_ini = c(1,0),
             EC4S2_16_ini = c(1,0),
             
             EC1S2_17_ini = c(1,0),
             EC2S2_17_ini = c(1,0),
             EC3S2_17_ini = c(1,0),
             EC4S2_17_ini = c(1,0)
)



mod <- sep_model$new(user = pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))
