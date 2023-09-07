# install.packages("odin")
# library(odin)

sep_model = odin::odin({
  
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
  
  
  
  pc_rem <- user(0.05)
  end_rem <- user(0.25)
  end_cust <- user(0.05)
  
  surv <- user(0.1)
  
  
  t10_ic1s1j1u[] <- user(0)
  t10_ic2s1j1u[] <- user(0)
  t10_ic3s1j1u[] <- user(0)
  t10_ic4s1j1u[] <- user(0)
  
  t10_ic1s2j1u[] <- user(0)
  t10_ic2s2j1u[] <- user(0)
  t10_ic3s2j1u[] <- user(0)
  t10_ic4s2j1u[] <- user(0)
  
  t10_ic1s1j2u[] <- user(0)
  t10_ic2s1j2u[] <- user(0)
  t10_ic3s1j2u[] <- user(0)
  t10_ic4s1j2u[] <- user(0)
  
  t10_ic1s2j2u[] <- user(0)
  t10_ic2s2j2u[] <- user(0)
  t10_ic3s2j2u[] <- user(0)
  t10_ic4s2j2u[] <- user(0)
  
  t10_ic1s1j3u[] <- user(0)
  t10_ic2s1j3u[] <- user(0)
  t10_ic3s1j3u[] <- user(0)
  t10_ic4s1j3u[] <- user(0)
  
  t10_ic1s2j3u[] <- user(0)
  t10_ic2s2j3u[] <- user(0)
  t10_ic3s2j3u[] <- user(0)
  t10_ic4s2j3u[] <- user(0)
  
  t10_ic1s1j4u[] <- user(0)
  t10_ic2s1j4u[] <- user(0)
  t10_ic3s1j4u[] <- user(0)
  t10_ic4s1j4u[] <- user(0)
  
  t10_ic1s2j4u[] <- user(0)
  t10_ic2s2j4u[] <- user(0)
  t10_ic3s2j4u[] <- user(0)
  t10_ic4s2j4u[] <- user(0)
  
  t10_ic1s1j5u[] <- user(0)
  t10_ic2s1j5u[] <- user(0)
  t10_ic3s1j5u[] <- user(0)
  t10_ic4s1j5u[] <- user(0)
  
  t10_ic1s2j5u[] <- user(0)
  t10_ic2s2j5u[] <- user(0)
  t10_ic3s2j5u[] <- user(0)
  t10_ic4s2j5u[] <- user(0)
  
  t10_ec1s1j1u[] <- user(0)
  t10_ec2s1j1u[] <- user(0)
  t10_ec3s1j1u[] <- user(0)
  t10_ec4s1j1u[] <- user(0)
  
  t10_ec1s2j1u[] <- user(0)
  t10_ec2s2j1u[] <- user(0)
  t10_ec3s2j1u[] <- user(0)
  t10_ec4s2j1u[] <- user(0)
  
  t10_ec1s1j2u[] <- user(0)
  t10_ec2s1j2u[] <- user(0)
  t10_ec3s1j2u[] <- user(0)
  t10_ec4s1j2u[] <- user(0)
  
  t10_ec1s2j2u[] <- user(0)
  t10_ec2s2j2u[] <- user(0)
  t10_ec3s2j2u[] <- user(0)
  t10_ec4s2j2u[] <- user(0)
  
  t10_ec1s1j3u[] <- user(0)
  t10_ec2s1j3u[] <- user(0)
  t10_ec3s1j3u[] <- user(0)
  t10_ec4s1j3u[] <- user(0)
  
  t10_ec1s2j3u[] <- user(0)
  t10_ec2s2j3u[] <- user(0)
  t10_ec3s2j3u[] <- user(0)
  t10_ec4s2j3u[] <- user(0)
  
  t10_ec1s1j4u[] <- user(0)
  t10_ec2s1j4u[] <- user(0)
  t10_ec3s1j4u[] <- user(0)
  t10_ec4s1j4u[] <- user(0)
  
  t10_ec1s2j4u[] <- user(0)
  t10_ec2s2j4u[] <- user(0)
  t10_ec3s2j4u[] <- user(0)
  t10_ec4s2j4u[] <- user(0)
  
  t10_ec1s1j5u[] <- user(0)
  t10_ec2s1j5u[] <- user(0)
  t10_ec3s1j5u[] <- user(0)
  t10_ec4s1j5u[] <- user(0)
  
  t10_ec1s2j5u[] <- user(0)
  t10_ec2s2j5u[] <- user(0)
  t10_ec3s2j5u[] <- user(0)
  t10_ec4s2j5u[] <- user(0)
  
  neet16_ic1s1j1u[] <- user(0)
  neet16_ic2s1j1u[] <- user(0)
  neet16_ic3s1j1u[] <- user(0)
  neet16_ic4s1j1u[] <- user(0)
  
  neet16_ic1s2j1u[] <- user(0)
  neet16_ic2s2j1u[] <- user(0)
  neet16_ic3s2j1u[] <- user(0)
  neet16_ic4s2j1u[] <- user(0)
  
  neet16_ic1s1j2u[] <- user(0)
  neet16_ic2s1j2u[] <- user(0)
  neet16_ic3s1j2u[] <- user(0)
  neet16_ic4s1j2u[] <- user(0)
  
  neet16_ic1s2j2u[] <- user(0)
  neet16_ic2s2j2u[] <- user(0)
  neet16_ic3s2j2u[] <- user(0)
  neet16_ic4s2j2u[] <- user(0)
  
  neet16_ic1s1j3u[] <- user(0)
  neet16_ic2s1j3u[] <- user(0)
  neet16_ic3s1j3u[] <- user(0)
  neet16_ic4s1j3u[] <- user(0)
  
  neet16_ic1s2j3u[] <- user(0)
  neet16_ic2s2j3u[] <- user(0)
  neet16_ic3s2j3u[] <- user(0)
  neet16_ic4s2j3u[] <- user(0)
  
  neet16_ic1s1j4u[] <- user(0)
  neet16_ic2s1j4u[] <- user(0)
  neet16_ic3s1j4u[] <- user(0)
  neet16_ic4s1j4u[] <- user(0)
  
  neet16_ic1s2j4u[] <- user(0)
  neet16_ic2s2j4u[] <- user(0)
  neet16_ic3s2j4u[] <- user(0)
  neet16_ic4s2j4u[] <- user(0)
  
  neet16_ic1s1j5u[] <- user(0)
  neet16_ic2s1j5u[] <- user(0)
  neet16_ic3s1j5u[] <- user(0)
  neet16_ic4s1j5u[] <- user(0)
  
  neet16_ic1s2j5u[] <- user(0)
  neet16_ic2s2j5u[] <- user(0)
  neet16_ic3s2j5u[] <- user(0)
  neet16_ic4s2j5u[] <- user(0)
  
  neet16_ec1s1j1u[] <- user(0)
  neet16_ec2s1j1u[] <- user(0)
  neet16_ec3s1j1u[] <- user(0)
  neet16_ec4s1j1u[] <- user(0)
  
  neet16_ec1s2j1u[] <- user(0)
  neet16_ec2s2j1u[] <- user(0)
  neet16_ec3s2j1u[] <- user(0)
  neet16_ec4s2j1u[] <- user(0)
  
  neet16_ec1s1j2u[] <- user(0)
  neet16_ec2s1j2u[] <- user(0)
  neet16_ec3s1j2u[] <- user(0)
  neet16_ec4s1j2u[] <- user(0)
  
  neet16_ec1s2j2u[] <- user(0)
  neet16_ec2s2j2u[] <- user(0)
  neet16_ec3s2j2u[] <- user(0)
  neet16_ec4s2j2u[] <- user(0)
  
  neet16_ec1s1j3u[] <- user(0)
  neet16_ec2s1j3u[] <- user(0)
  neet16_ec3s1j3u[] <- user(0)
  neet16_ec4s1j3u[] <- user(0)
  
  neet16_ec1s2j3u[] <- user(0)
  neet16_ec2s2j3u[] <- user(0)
  neet16_ec3s2j3u[] <- user(0)
  neet16_ec4s2j3u[] <- user(0)
  
  neet16_ec1s1j4u[] <- user(0)
  neet16_ec2s1j4u[] <- user(0)
  neet16_ec3s1j4u[] <- user(0)
  neet16_ec4s1j4u[] <- user(0)
  
  neet16_ec1s2j4u[] <- user(0)
  neet16_ec2s2j4u[] <- user(0)
  neet16_ec3s2j4u[] <- user(0)
  neet16_ec4s2j4u[] <- user(0)
  
  neet16_ec1s1j5u[] <- user(0)
  neet16_ec2s1j5u[] <- user(0)
  neet16_ec3s1j5u[] <- user(0)
  neet16_ec4s1j5u[] <- user(0)
  
  neet16_ec1s2j5u[] <- user(0)
  neet16_ec2s2j5u[] <- user(0)
  neet16_ec3s2j5u[] <- user(0)
  neet16_ec4s2j5u[] <- user(0)
  
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
  
  np2nc_ic1s1u_10[] <- user(0)
  np2nc_ic2s1u_10[] <- user(0)
  np2nc_ic3s1u_10[] <- user(0)
  np2nc_ic4s1u_10[] <- user(0)
  
  np2nc_ic1s1u_11[] <- user(0)
  np2nc_ic2s1u_11[] <- user(0)
  np2nc_ic3s1u_11[] <- user(0)
  np2nc_ic4s1u_11[] <- user(0)
  
  np2nc_ic1s1u_12[] <- user(0)
  np2nc_ic2s1u_12[] <- user(0)
  np2nc_ic3s1u_12[] <- user(0)
  np2nc_ic4s1u_12[] <- user(0)
  
  np2nc_ic1s1u_13[] <- user(0)
  np2nc_ic2s1u_13[] <- user(0)
  np2nc_ic3s1u_13[] <- user(0)
  np2nc_ic4s1u_13[] <- user(0)
  
  np2nc_ic1s1u_14[] <- user(0)
  np2nc_ic2s1u_14[] <- user(0)
  np2nc_ic3s1u_14[] <- user(0)
  np2nc_ic4s1u_14[] <- user(0)
  
  np2nc_ic1s1u_15[] <- user(0)
  np2nc_ic2s1u_15[] <- user(0)
  np2nc_ic3s1u_15[] <- user(0)
  np2nc_ic4s1u_15[] <- user(0)
  
  np2nc_ic1s1u_16[] <- user(0)
  np2nc_ic2s1u_16[] <- user(0)
  np2nc_ic3s1u_16[] <- user(0)
  np2nc_ic4s1u_16[] <- user(0)
  
  np2nc_ic1s1u_17[] <- user(0)
  np2nc_ic2s1u_17[] <- user(0)
  np2nc_ic3s1u_17[] <- user(0)
  np2nc_ic4s1u_17[] <- user(0)
  
  
  
  np2nc_ic1s2u_10[] <- user(0)
  np2nc_ic2s2u_10[] <- user(0)
  np2nc_ic3s2u_10[] <- user(0)
  np2nc_ic4s2u_10[] <- user(0)
  
  np2nc_ic1s2u_11[] <- user(0)
  np2nc_ic2s2u_11[] <- user(0)
  np2nc_ic3s2u_11[] <- user(0)
  np2nc_ic4s2u_11[] <- user(0)
  
  np2nc_ic1s2u_12[] <- user(0)
  np2nc_ic2s2u_12[] <- user(0)
  np2nc_ic3s2u_12[] <- user(0)
  np2nc_ic4s2u_12[] <- user(0)
  
  np2nc_ic1s2u_13[] <- user(0)
  np2nc_ic2s2u_13[] <- user(0)
  np2nc_ic3s2u_13[] <- user(0)
  np2nc_ic4s2u_13[] <- user(0)
  
  np2nc_ic1s2u_14[] <- user(0)
  np2nc_ic2s2u_14[] <- user(0)
  np2nc_ic3s2u_14[] <- user(0)
  np2nc_ic4s2u_14[] <- user(0)
  
  np2nc_ic1s2u_15[] <- user(0)
  np2nc_ic2s2u_15[] <- user(0)
  np2nc_ic3s2u_15[] <- user(0)
  np2nc_ic4s2u_15[] <- user(0)
  
  np2nc_ic1s2u_16[] <- user(0)
  np2nc_ic2s2u_16[] <- user(0)
  np2nc_ic3s2u_16[] <- user(0)
  np2nc_ic4s2u_16[] <- user(0)
  
  np2nc_ic1s2u_17[] <- user(0)
  np2nc_ic2s2u_17[] <- user(0)
  np2nc_ic3s2u_17[] <- user(0)
  np2nc_ic4s2u_17[] <- user(0)
  
  np2nc_ec1s1u_10[] <- user(0)
  np2nc_ec2s1u_10[] <- user(0)
  np2nc_ec3s1u_10[] <- user(0)
  np2nc_ec4s1u_10[] <- user(0)
  
  np2nc_ec1s1u_11[] <- user(0)
  np2nc_ec2s1u_11[] <- user(0)
  np2nc_ec3s1u_11[] <- user(0)
  np2nc_ec4s1u_11[] <- user(0)
  
  np2nc_ec1s1u_12[] <- user(0)
  np2nc_ec2s1u_12[] <- user(0)
  np2nc_ec3s1u_12[] <- user(0)
  np2nc_ec4s1u_12[] <- user(0)
  
  np2nc_ec1s1u_13[] <- user(0)
  np2nc_ec2s1u_13[] <- user(0)
  np2nc_ec3s1u_13[] <- user(0)
  np2nc_ec4s1u_13[] <- user(0)
  
  np2nc_ec1s1u_14[] <- user(0)
  np2nc_ec2s1u_14[] <- user(0)
  np2nc_ec3s1u_14[] <- user(0)
  np2nc_ec4s1u_14[] <- user(0)
  
  np2nc_ec1s1u_15[] <- user(0)
  np2nc_ec2s1u_15[] <- user(0)
  np2nc_ec3s1u_15[] <- user(0)
  np2nc_ec4s1u_15[] <- user(0)
  
  np2nc_ec1s1u_16[] <- user(0)
  np2nc_ec2s1u_16[] <- user(0)
  np2nc_ec3s1u_16[] <- user(0)
  np2nc_ec4s1u_16[] <- user(0)
  
  np2nc_ec1s1u_17[] <- user(0)
  np2nc_ec2s1u_17[] <- user(0)
  np2nc_ec3s1u_17[] <- user(0)
  np2nc_ec4s1u_17[] <- user(0)
  
  
  
  np2nc_ec1s2u_10[] <- user(0)
  np2nc_ec2s2u_10[] <- user(0)
  np2nc_ec3s2u_10[] <- user(0)
  np2nc_ec4s2u_10[] <- user(0)
  
  np2nc_ec1s2u_11[] <- user(0)
  np2nc_ec2s2u_11[] <- user(0)
  np2nc_ec3s2u_11[] <- user(0)
  np2nc_ec4s2u_11[] <- user(0)
  
  np2nc_ec1s2u_12[] <- user(0)
  np2nc_ec2s2u_12[] <- user(0)
  np2nc_ec3s2u_12[] <- user(0)
  np2nc_ec4s2u_12[] <- user(0)
  
  np2nc_ec1s2u_13[] <- user(0)
  np2nc_ec2s2u_13[] <- user(0)
  np2nc_ec3s2u_13[] <- user(0)
  np2nc_ec4s2u_13[] <- user(0)
  
  np2nc_ec1s2u_14[] <- user(0)
  np2nc_ec2s2u_14[] <- user(0)
  np2nc_ec3s2u_14[] <- user(0)
  np2nc_ec4s2u_14[] <- user(0)
  
  np2nc_ec1s2u_15[] <- user(0)
  np2nc_ec2s2u_15[] <- user(0)
  np2nc_ec3s2u_15[] <- user(0)
  np2nc_ec4s2u_15[] <- user(0)
  
  np2nc_ec1s2u_16[] <- user(0)
  np2nc_ec2s2u_16[] <- user(0)
  np2nc_ec3s2u_16[] <- user(0)
  np2nc_ec4s2u_16[] <- user(0)
  
  np2nc_ec1s2u_17[] <- user(0)
  np2nc_ec2s2u_17[] <- user(0)
  np2nc_ec3s2u_17[] <- user(0)
  np2nc_ec4s2u_17[] <- user(0)
  
  
  np2charge_ic1s1u_10[] <- user(0)
  np2charge_ic2s1u_10[] <- user(0)
  np2charge_ic3s1u_10[] <- user(0)
  np2charge_ic4s1u_10[] <- user(0)
  
  np2charge_ic1s1u_11[] <- user(0)
  np2charge_ic2s1u_11[] <- user(0)
  np2charge_ic3s1u_11[] <- user(0)
  np2charge_ic4s1u_11[] <- user(0)
  
  np2charge_ic1s1u_12[] <- user(0)
  np2charge_ic2s1u_12[] <- user(0)
  np2charge_ic3s1u_12[] <- user(0)
  np2charge_ic4s1u_12[] <- user(0)
  
  np2charge_ic1s1u_13[] <- user(0)
  np2charge_ic2s1u_13[] <- user(0)
  np2charge_ic3s1u_13[] <- user(0)
  np2charge_ic4s1u_13[] <- user(0)
  
  np2charge_ic1s1u_14[] <- user(0)
  np2charge_ic2s1u_14[] <- user(0)
  np2charge_ic3s1u_14[] <- user(0)
  np2charge_ic4s1u_14[] <- user(0)
  
  np2charge_ic1s1u_15[] <- user(0)
  np2charge_ic2s1u_15[] <- user(0)
  np2charge_ic3s1u_15[] <- user(0)
  np2charge_ic4s1u_15[] <- user(0)
  
  np2charge_ic1s1u_16[] <- user(0)
  np2charge_ic2s1u_16[] <- user(0)
  np2charge_ic3s1u_16[] <- user(0)
  np2charge_ic4s1u_16[] <- user(0)
  
  np2charge_ic1s1u_17[] <- user(0)
  np2charge_ic2s1u_17[] <- user(0)
  np2charge_ic3s1u_17[] <- user(0)
  np2charge_ic4s1u_17[] <- user(0)
  
  
  
  np2charge_ic1s2u_10[] <- user(0)
  np2charge_ic2s2u_10[] <- user(0)
  np2charge_ic3s2u_10[] <- user(0)
  np2charge_ic4s2u_10[] <- user(0)
  
  np2charge_ic1s2u_11[] <- user(0)
  np2charge_ic2s2u_11[] <- user(0)
  np2charge_ic3s2u_11[] <- user(0)
  np2charge_ic4s2u_11[] <- user(0)
  
  np2charge_ic1s2u_12[] <- user(0)
  np2charge_ic2s2u_12[] <- user(0)
  np2charge_ic3s2u_12[] <- user(0)
  np2charge_ic4s2u_12[] <- user(0)
  
  np2charge_ic1s2u_13[] <- user(0)
  np2charge_ic2s2u_13[] <- user(0)
  np2charge_ic3s2u_13[] <- user(0)
  np2charge_ic4s2u_13[] <- user(0)
  
  np2charge_ic1s2u_14[] <- user(0)
  np2charge_ic2s2u_14[] <- user(0)
  np2charge_ic3s2u_14[] <- user(0)
  np2charge_ic4s2u_14[] <- user(0)
  
  np2charge_ic1s2u_15[] <- user(0)
  np2charge_ic2s2u_15[] <- user(0)
  np2charge_ic3s2u_15[] <- user(0)
  np2charge_ic4s2u_15[] <- user(0)
  
  np2charge_ic1s2u_16[] <- user(0)
  np2charge_ic2s2u_16[] <- user(0)
  np2charge_ic3s2u_16[] <- user(0)
  np2charge_ic4s2u_16[] <- user(0)
  
  np2charge_ic1s2u_17[] <- user(0)
  np2charge_ic2s2u_17[] <- user(0)
  np2charge_ic3s2u_17[] <- user(0)
  np2charge_ic4s2u_17[] <- user(0)
  
  np2charge_ec1s1u_10[] <- user(0)
  np2charge_ec2s1u_10[] <- user(0)
  np2charge_ec3s1u_10[] <- user(0)
  np2charge_ec4s1u_10[] <- user(0)
  
  np2charge_ec1s1u_11[] <- user(0)
  np2charge_ec2s1u_11[] <- user(0)
  np2charge_ec3s1u_11[] <- user(0)
  np2charge_ec4s1u_11[] <- user(0)
  
  np2charge_ec1s1u_12[] <- user(0)
  np2charge_ec2s1u_12[] <- user(0)
  np2charge_ec3s1u_12[] <- user(0)
  np2charge_ec4s1u_12[] <- user(0)
  
  np2charge_ec1s1u_13[] <- user(0)
  np2charge_ec2s1u_13[] <- user(0)
  np2charge_ec3s1u_13[] <- user(0)
  np2charge_ec4s1u_13[] <- user(0)
  
  np2charge_ec1s1u_14[] <- user(0)
  np2charge_ec2s1u_14[] <- user(0)
  np2charge_ec3s1u_14[] <- user(0)
  np2charge_ec4s1u_14[] <- user(0)
  
  np2charge_ec1s1u_15[] <- user(0)
  np2charge_ec2s1u_15[] <- user(0)
  np2charge_ec3s1u_15[] <- user(0)
  np2charge_ec4s1u_15[] <- user(0)
  
  np2charge_ec1s1u_16[] <- user(0)
  np2charge_ec2s1u_16[] <- user(0)
  np2charge_ec3s1u_16[] <- user(0)
  np2charge_ec4s1u_16[] <- user(0)
  
  np2charge_ec1s1u_17[] <- user(0)
  np2charge_ec2s1u_17[] <- user(0)
  np2charge_ec3s1u_17[] <- user(0)
  np2charge_ec4s1u_17[] <- user(0)
  
  
  
  np2charge_ec1s2u_10[] <- user(0)
  np2charge_ec2s2u_10[] <- user(0)
  np2charge_ec3s2u_10[] <- user(0)
  np2charge_ec4s2u_10[] <- user(0)
  
  np2charge_ec1s2u_11[] <- user(0)
  np2charge_ec2s2u_11[] <- user(0)
  np2charge_ec3s2u_11[] <- user(0)
  np2charge_ec4s2u_11[] <- user(0)
  
  np2charge_ec1s2u_12[] <- user(0)
  np2charge_ec2s2u_12[] <- user(0)
  np2charge_ec3s2u_12[] <- user(0)
  np2charge_ec4s2u_12[] <- user(0)
  
  np2charge_ec1s2u_13[] <- user(0)
  np2charge_ec2s2u_13[] <- user(0)
  np2charge_ec3s2u_13[] <- user(0)
  np2charge_ec4s2u_13[] <- user(0)
  
  np2charge_ec1s2u_14[] <- user(0)
  np2charge_ec2s2u_14[] <- user(0)
  np2charge_ec3s2u_14[] <- user(0)
  np2charge_ec4s2u_14[] <- user(0)
  
  np2charge_ec1s2u_15[] <- user(0)
  np2charge_ec2s2u_15[] <- user(0)
  np2charge_ec3s2u_15[] <- user(0)
  np2charge_ec4s2u_15[] <- user(0)
  
  np2charge_ec1s2u_16[] <- user(0)
  np2charge_ec2s2u_16[] <- user(0)
  np2charge_ec3s2u_16[] <- user(0)
  np2charge_ec4s2u_16[] <- user(0)
  
  np2charge_ec1s2u_17[] <- user(0)
  np2charge_ec2s2u_17[] <- user(0)
  np2charge_ec3s2u_17[] <- user(0)
  np2charge_ec4s2u_17[] <- user(0)
  
  
  
  p2charge_ic1s1u_10[] <- user(0)
  p2charge_ic2s1u_10[] <- user(0)
  p2charge_ic3s1u_10[] <- user(0)
  p2charge_ic4s1u_10[] <- user(0)
  
  p2charge_ic1s1u_11[] <- user(0)
  p2charge_ic2s1u_11[] <- user(0)
  p2charge_ic3s1u_11[] <- user(0)
  p2charge_ic4s1u_11[] <- user(0)
  
  p2charge_ic1s1u_12[] <- user(0)
  p2charge_ic2s1u_12[] <- user(0)
  p2charge_ic3s1u_12[] <- user(0)
  p2charge_ic4s1u_12[] <- user(0)
  
  p2charge_ic1s1u_13[] <- user(0)
  p2charge_ic2s1u_13[] <- user(0)
  p2charge_ic3s1u_13[] <- user(0)
  p2charge_ic4s1u_13[] <- user(0)
  
  p2charge_ic1s1u_14[] <- user(0)
  p2charge_ic2s1u_14[] <- user(0)
  p2charge_ic3s1u_14[] <- user(0)
  p2charge_ic4s1u_14[] <- user(0)
  
  p2charge_ic1s1u_15[] <- user(0)
  p2charge_ic2s1u_15[] <- user(0)
  p2charge_ic3s1u_15[] <- user(0)
  p2charge_ic4s1u_15[] <- user(0)
  
  p2charge_ic1s1u_16[] <- user(0)
  p2charge_ic2s1u_16[] <- user(0)
  p2charge_ic3s1u_16[] <- user(0)
  p2charge_ic4s1u_16[] <- user(0)
  
  p2charge_ic1s1u_17[] <- user(0)
  p2charge_ic2s1u_17[] <- user(0)
  p2charge_ic3s1u_17[] <- user(0)
  p2charge_ic4s1u_17[] <- user(0)
  
  
  
  p2charge_ic1s2u_10[] <- user(0)
  p2charge_ic2s2u_10[] <- user(0)
  p2charge_ic3s2u_10[] <- user(0)
  p2charge_ic4s2u_10[] <- user(0)
  
  p2charge_ic1s2u_11[] <- user(0)
  p2charge_ic2s2u_11[] <- user(0)
  p2charge_ic3s2u_11[] <- user(0)
  p2charge_ic4s2u_11[] <- user(0)
  
  p2charge_ic1s2u_12[] <- user(0)
  p2charge_ic2s2u_12[] <- user(0)
  p2charge_ic3s2u_12[] <- user(0)
  p2charge_ic4s2u_12[] <- user(0)
  
  p2charge_ic1s2u_13[] <- user(0)
  p2charge_ic2s2u_13[] <- user(0)
  p2charge_ic3s2u_13[] <- user(0)
  p2charge_ic4s2u_13[] <- user(0)
  
  p2charge_ic1s2u_14[] <- user(0)
  p2charge_ic2s2u_14[] <- user(0)
  p2charge_ic3s2u_14[] <- user(0)
  p2charge_ic4s2u_14[] <- user(0)
  
  p2charge_ic1s2u_15[] <- user(0)
  p2charge_ic2s2u_15[] <- user(0)
  p2charge_ic3s2u_15[] <- user(0)
  p2charge_ic4s2u_15[] <- user(0)
  
  p2charge_ic1s2u_16[] <- user(0)
  p2charge_ic2s2u_16[] <- user(0)
  p2charge_ic3s2u_16[] <- user(0)
  p2charge_ic4s2u_16[] <- user(0)
  
  p2charge_ic1s2u_17[] <- user(0)
  p2charge_ic2s2u_17[] <- user(0)
  p2charge_ic3s2u_17[] <- user(0)
  p2charge_ic4s2u_17[] <- user(0)
  
  p2charge_ec1s1u_10[] <- user(0)
  p2charge_ec2s1u_10[] <- user(0)
  p2charge_ec3s1u_10[] <- user(0)
  p2charge_ec4s1u_10[] <- user(0)
  
  p2charge_ec1s1u_11[] <- user(0)
  p2charge_ec2s1u_11[] <- user(0)
  p2charge_ec3s1u_11[] <- user(0)
  p2charge_ec4s1u_11[] <- user(0)
  
  p2charge_ec1s1u_12[] <- user(0)
  p2charge_ec2s1u_12[] <- user(0)
  p2charge_ec3s1u_12[] <- user(0)
  p2charge_ec4s1u_12[] <- user(0)
  
  p2charge_ec1s1u_13[] <- user(0)
  p2charge_ec2s1u_13[] <- user(0)
  p2charge_ec3s1u_13[] <- user(0)
  p2charge_ec4s1u_13[] <- user(0)
  
  p2charge_ec1s1u_14[] <- user(0)
  p2charge_ec2s1u_14[] <- user(0)
  p2charge_ec3s1u_14[] <- user(0)
  p2charge_ec4s1u_14[] <- user(0)
  
  p2charge_ec1s1u_15[] <- user(0)
  p2charge_ec2s1u_15[] <- user(0)
  p2charge_ec3s1u_15[] <- user(0)
  p2charge_ec4s1u_15[] <- user(0)
  
  p2charge_ec1s1u_16[] <- user(0)
  p2charge_ec2s1u_16[] <- user(0)
  p2charge_ec3s1u_16[] <- user(0)
  p2charge_ec4s1u_16[] <- user(0)
  
  p2charge_ec1s1u_17[] <- user(0)
  p2charge_ec2s1u_17[] <- user(0)
  p2charge_ec3s1u_17[] <- user(0)
  p2charge_ec4s1u_17[] <- user(0)
  
  
  
  p2charge_ec1s2u_10[] <- user(0)
  p2charge_ec2s2u_10[] <- user(0)
  p2charge_ec3s2u_10[] <- user(0)
  p2charge_ec4s2u_10[] <- user(0)
  
  p2charge_ec1s2u_11[] <- user(0)
  p2charge_ec2s2u_11[] <- user(0)
  p2charge_ec3s2u_11[] <- user(0)
  p2charge_ec4s2u_11[] <- user(0)
  
  p2charge_ec1s2u_12[] <- user(0)
  p2charge_ec2s2u_12[] <- user(0)
  p2charge_ec3s2u_12[] <- user(0)
  p2charge_ec4s2u_12[] <- user(0)
  
  p2charge_ec1s2u_13[] <- user(0)
  p2charge_ec2s2u_13[] <- user(0)
  p2charge_ec3s2u_13[] <- user(0)
  p2charge_ec4s2u_13[] <- user(0)
  
  p2charge_ec1s2u_14[] <- user(0)
  p2charge_ec2s2u_14[] <- user(0)
  p2charge_ec3s2u_14[] <- user(0)
  p2charge_ec4s2u_14[] <- user(0)
  
  p2charge_ec1s2u_15[] <- user(0)
  p2charge_ec2s2u_15[] <- user(0)
  p2charge_ec3s2u_15[] <- user(0)
  p2charge_ec4s2u_15[] <- user(0)
  
  p2charge_ec1s2u_16[] <- user(0)
  p2charge_ec2s2u_16[] <- user(0)
  p2charge_ec3s2u_16[] <- user(0)
  p2charge_ec4s2u_16[] <- user(0)
  
  p2charge_ec1s2u_17[] <- user(0)
  p2charge_ec2s2u_17[] <- user(0)
  p2charge_ec3s2u_17[] <- user(0)
  p2charge_ec4s2u_17[] <- user(0)
  
  
  ##############################################################################################################################
  ## INITIAL CONDITIONS ####################################################################
  ##############################################################################################################################
  IC1S1J1U_10_ini[] <- user(0)
  IC2S1J1U_10_ini[] <- user(0)
  IC3S1J1U_10_ini[] <- user(0)
  IC4S1J1U_10_ini[] <- user(0)
  
  IC1S1J1U_11_ini[] <- user(0)
  IC2S1J1U_11_ini[] <- user(0)
  IC3S1J1U_11_ini[] <- user(0)
  IC4S1J1U_11_ini[] <- user(0)
  
  IC1S1J1U_12_ini[] <- user(0)
  IC2S1J1U_12_ini[] <- user(0)
  IC3S1J1U_12_ini[] <- user(0)
  IC4S1J1U_12_ini[] <- user(0)
  
  IC1S1J1U_13_ini[] <- user(0)
  IC2S1J1U_13_ini[] <- user(0)
  IC3S1J1U_13_ini[] <- user(0)
  IC4S1J1U_13_ini[] <- user(0)
  
  IC1S1J1U_14_ini[] <- user(0)
  IC2S1J1U_14_ini[] <- user(0)
  IC3S1J1U_14_ini[] <- user(0)
  IC4S1J1U_14_ini[] <- user(0)
  
  IC1S1J1U_15_ini[] <- user(0)
  IC2S1J1U_15_ini[] <- user(0)
  IC3S1J1U_15_ini[] <- user(0)
  IC4S1J1U_15_ini[] <- user(0)
  
  IC1S1J1U_16_ini[] <- user(0)
  IC2S1J1U_16_ini[] <- user(0)
  IC3S1J1U_16_ini[] <- user(0)
  IC4S1J1U_16_ini[] <- user(0)
  
  IC1S1J1U_17_ini[] <- user(0)
  IC2S1J1U_17_ini[] <- user(0)
  IC3S1J1U_17_ini[] <- user(0)
  IC4S1J1U_17_ini[] <- user(0)
  
  
  
  IC1S2J1U_10_ini[] <- user(0)
  IC2S2J1U_10_ini[] <- user(0)
  IC3S2J1U_10_ini[] <- user(0)
  IC4S2J1U_10_ini[] <- user(0)
  
  IC1S2J1U_11_ini[] <- user(0)
  IC2S2J1U_11_ini[] <- user(0)
  IC3S2J1U_11_ini[] <- user(0)
  IC4S2J1U_11_ini[] <- user(0)
  
  IC1S2J1U_12_ini[] <- user(0)
  IC2S2J1U_12_ini[] <- user(0)
  IC3S2J1U_12_ini[] <- user(0)
  IC4S2J1U_12_ini[] <- user(0)
  
  IC1S2J1U_13_ini[] <- user(0)
  IC2S2J1U_13_ini[] <- user(0)
  IC3S2J1U_13_ini[] <- user(0)
  IC4S2J1U_13_ini[] <- user(0)
  
  IC1S2J1U_14_ini[] <- user(0)
  IC2S2J1U_14_ini[] <- user(0)
  IC3S2J1U_14_ini[] <- user(0)
  IC4S2J1U_14_ini[] <- user(0)
  
  IC1S2J1U_15_ini[] <- user(0)
  IC2S2J1U_15_ini[] <- user(0)
  IC3S2J1U_15_ini[] <- user(0)
  IC4S2J1U_15_ini[] <- user(0)
  
  IC1S2J1U_16_ini[] <- user(0)
  IC2S2J1U_16_ini[] <- user(0)
  IC3S2J1U_16_ini[] <- user(0)
  IC4S2J1U_16_ini[] <- user(0)
  
  IC1S2J1U_17_ini[] <- user(0)
  IC2S2J1U_17_ini[] <- user(0)
  IC3S2J1U_17_ini[] <- user(0)
  IC4S2J1U_17_ini[] <- user(0)
  
  
  
  IC1S1J2U_10_ini[] <- user(0)
  IC2S1J2U_10_ini[] <- user(0)
  IC3S1J2U_10_ini[] <- user(0)
  IC4S1J2U_10_ini[] <- user(0)
  
  IC1S1J2U_11_ini[] <- user(0)
  IC2S1J2U_11_ini[] <- user(0)
  IC3S1J2U_11_ini[] <- user(0)
  IC4S1J2U_11_ini[] <- user(0)
  
  IC1S1J2U_12_ini[] <- user(0)
  IC2S1J2U_12_ini[] <- user(0)
  IC3S1J2U_12_ini[] <- user(0)
  IC4S1J2U_12_ini[] <- user(0)
  
  IC1S1J2U_13_ini[] <- user(0)
  IC2S1J2U_13_ini[] <- user(0)
  IC3S1J2U_13_ini[] <- user(0)
  IC4S1J2U_13_ini[] <- user(0)
  
  IC1S1J2U_14_ini[] <- user(0)
  IC2S1J2U_14_ini[] <- user(0)
  IC3S1J2U_14_ini[] <- user(0)
  IC4S1J2U_14_ini[] <- user(0)
  
  IC1S1J2U_15_ini[] <- user(0)
  IC2S1J2U_15_ini[] <- user(0)
  IC3S1J2U_15_ini[] <- user(0)
  IC4S1J2U_15_ini[] <- user(0)
  
  IC1S1J2U_16_ini[] <- user(0)
  IC2S1J2U_16_ini[] <- user(0)
  IC3S1J2U_16_ini[] <- user(0)
  IC4S1J2U_16_ini[] <- user(0)
  
  IC1S1J2U_17_ini[] <- user(0)
  IC2S1J2U_17_ini[] <- user(0)
  IC3S1J2U_17_ini[] <- user(0)
  IC4S1J2U_17_ini[] <- user(0)
  
  
  
  IC1S2J2U_10_ini[] <- user(0)
  IC2S2J2U_10_ini[] <- user(0)
  IC3S2J2U_10_ini[] <- user(0)
  IC4S2J2U_10_ini[] <- user(0)
  
  IC1S2J2U_11_ini[] <- user(0)
  IC2S2J2U_11_ini[] <- user(0)
  IC3S2J2U_11_ini[] <- user(0)
  IC4S2J2U_11_ini[] <- user(0)
  
  IC1S2J2U_12_ini[] <- user(0)
  IC2S2J2U_12_ini[] <- user(0)
  IC3S2J2U_12_ini[] <- user(0)
  IC4S2J2U_12_ini[] <- user(0)
  
  IC1S2J2U_13_ini[] <- user(0)
  IC2S2J2U_13_ini[] <- user(0)
  IC3S2J2U_13_ini[] <- user(0)
  IC4S2J2U_13_ini[] <- user(0)
  
  IC1S2J2U_14_ini[] <- user(0)
  IC2S2J2U_14_ini[] <- user(0)
  IC3S2J2U_14_ini[] <- user(0)
  IC4S2J2U_14_ini[] <- user(0)
  
  IC1S2J2U_15_ini[] <- user(0)
  IC2S2J2U_15_ini[] <- user(0)
  IC3S2J2U_15_ini[] <- user(0)
  IC4S2J2U_15_ini[] <- user(0)
  
  IC1S2J2U_16_ini[] <- user(0)
  IC2S2J2U_16_ini[] <- user(0)
  IC3S2J2U_16_ini[] <- user(0)
  IC4S2J2U_16_ini[] <- user(0)
  
  IC1S2J2U_17_ini[] <- user(0)
  IC2S2J2U_17_ini[] <- user(0)
  IC3S2J2U_17_ini[] <- user(0)
  IC4S2J2U_17_ini[] <- user(0)
  
  
  
  IC1S1J3U_10_ini[] <- user(0)
  IC2S1J3U_10_ini[] <- user(0)
  IC3S1J3U_10_ini[] <- user(0)
  IC4S1J3U_10_ini[] <- user(0)
  
  IC1S1J3U_11_ini[] <- user(0)
  IC2S1J3U_11_ini[] <- user(0)
  IC3S1J3U_11_ini[] <- user(0)
  IC4S1J3U_11_ini[] <- user(0)
  
  IC1S1J3U_12_ini[] <- user(0)
  IC2S1J3U_12_ini[] <- user(0)
  IC3S1J3U_12_ini[] <- user(0)
  IC4S1J3U_12_ini[] <- user(0)
  
  IC1S1J3U_13_ini[] <- user(0)
  IC2S1J3U_13_ini[] <- user(0)
  IC3S1J3U_13_ini[] <- user(0)
  IC4S1J3U_13_ini[] <- user(0)
  
  IC1S1J3U_14_ini[] <- user(0)
  IC2S1J3U_14_ini[] <- user(0)
  IC3S1J3U_14_ini[] <- user(0)
  IC4S1J3U_14_ini[] <- user(0)
  
  IC1S1J3U_15_ini[] <- user(0)
  IC2S1J3U_15_ini[] <- user(0)
  IC3S1J3U_15_ini[] <- user(0)
  IC4S1J3U_15_ini[] <- user(0)
  
  IC1S1J3U_16_ini[] <- user(0)
  IC2S1J3U_16_ini[] <- user(0)
  IC3S1J3U_16_ini[] <- user(0)
  IC4S1J3U_16_ini[] <- user(0)
  
  IC1S1J3U_17_ini[] <- user(0)
  IC2S1J3U_17_ini[] <- user(0)
  IC3S1J3U_17_ini[] <- user(0)
  IC4S1J3U_17_ini[] <- user(0)
  
  
  
  IC1S2J3U_10_ini[] <- user(0)
  IC2S2J3U_10_ini[] <- user(0)
  IC3S2J3U_10_ini[] <- user(0)
  IC4S2J3U_10_ini[] <- user(0)
  
  IC1S2J3U_11_ini[] <- user(0)
  IC2S2J3U_11_ini[] <- user(0)
  IC3S2J3U_11_ini[] <- user(0)
  IC4S2J3U_11_ini[] <- user(0)
  
  IC1S2J3U_12_ini[] <- user(0)
  IC2S2J3U_12_ini[] <- user(0)
  IC3S2J3U_12_ini[] <- user(0)
  IC4S2J3U_12_ini[] <- user(0)
  
  IC1S2J3U_13_ini[] <- user(0)
  IC2S2J3U_13_ini[] <- user(0)
  IC3S2J3U_13_ini[] <- user(0)
  IC4S2J3U_13_ini[] <- user(0)
  
  IC1S2J3U_14_ini[] <- user(0)
  IC2S2J3U_14_ini[] <- user(0)
  IC3S2J3U_14_ini[] <- user(0)
  IC4S2J3U_14_ini[] <- user(0)
  
  IC1S2J3U_15_ini[] <- user(0)
  IC2S2J3U_15_ini[] <- user(0)
  IC3S2J3U_15_ini[] <- user(0)
  IC4S2J3U_15_ini[] <- user(0)
  
  IC1S2J3U_16_ini[] <- user(0)
  IC2S2J3U_16_ini[] <- user(0)
  IC3S2J3U_16_ini[] <- user(0)
  IC4S2J3U_16_ini[] <- user(0)
  
  IC1S2J3U_17_ini[] <- user(0)
  IC2S2J3U_17_ini[] <- user(0)
  IC3S2J3U_17_ini[] <- user(0)
  IC4S2J3U_17_ini[] <- user(0)
  
  
  
  IC1S1J4U_10_ini[] <- user(0)
  IC2S1J4U_10_ini[] <- user(0)
  IC3S1J4U_10_ini[] <- user(0)
  IC4S1J4U_10_ini[] <- user(0)
  
  IC1S1J4U_11_ini[] <- user(0)
  IC2S1J4U_11_ini[] <- user(0)
  IC3S1J4U_11_ini[] <- user(0)
  IC4S1J4U_11_ini[] <- user(0)
  
  IC1S1J4U_12_ini[] <- user(0)
  IC2S1J4U_12_ini[] <- user(0)
  IC3S1J4U_12_ini[] <- user(0)
  IC4S1J4U_12_ini[] <- user(0)
  
  IC1S1J4U_13_ini[] <- user(0)
  IC2S1J4U_13_ini[] <- user(0)
  IC3S1J4U_13_ini[] <- user(0)
  IC4S1J4U_13_ini[] <- user(0)
  
  IC1S1J4U_14_ini[] <- user(0)
  IC2S1J4U_14_ini[] <- user(0)
  IC3S1J4U_14_ini[] <- user(0)
  IC4S1J4U_14_ini[] <- user(0)
  
  IC1S1J4U_15_ini[] <- user(0)
  IC2S1J4U_15_ini[] <- user(0)
  IC3S1J4U_15_ini[] <- user(0)
  IC4S1J4U_15_ini[] <- user(0)
  
  IC1S1J4U_16_ini[] <- user(0)
  IC2S1J4U_16_ini[] <- user(0)
  IC3S1J4U_16_ini[] <- user(0)
  IC4S1J4U_16_ini[] <- user(0)
  
  IC1S1J4U_17_ini[] <- user(0)
  IC2S1J4U_17_ini[] <- user(0)
  IC3S1J4U_17_ini[] <- user(0)
  IC4S1J4U_17_ini[] <- user(0)
  
  
  
  IC1S2J4U_10_ini[] <- user(0)
  IC2S2J4U_10_ini[] <- user(0)
  IC3S2J4U_10_ini[] <- user(0)
  IC4S2J4U_10_ini[] <- user(0)
  
  IC1S2J4U_11_ini[] <- user(0)
  IC2S2J4U_11_ini[] <- user(0)
  IC3S2J4U_11_ini[] <- user(0)
  IC4S2J4U_11_ini[] <- user(0)
  
  IC1S2J4U_12_ini[] <- user(0)
  IC2S2J4U_12_ini[] <- user(0)
  IC3S2J4U_12_ini[] <- user(0)
  IC4S2J4U_12_ini[] <- user(0)
  
  IC1S2J4U_13_ini[] <- user(0)
  IC2S2J4U_13_ini[] <- user(0)
  IC3S2J4U_13_ini[] <- user(0)
  IC4S2J4U_13_ini[] <- user(0)
  
  IC1S2J4U_14_ini[] <- user(0)
  IC2S2J4U_14_ini[] <- user(0)
  IC3S2J4U_14_ini[] <- user(0)
  IC4S2J4U_14_ini[] <- user(0)
  
  IC1S2J4U_15_ini[] <- user(0)
  IC2S2J4U_15_ini[] <- user(0)
  IC3S2J4U_15_ini[] <- user(0)
  IC4S2J4U_15_ini[] <- user(0)
  
  IC1S2J4U_16_ini[] <- user(0)
  IC2S2J4U_16_ini[] <- user(0)
  IC3S2J4U_16_ini[] <- user(0)
  IC4S2J4U_16_ini[] <- user(0)
  
  IC1S2J4U_17_ini[] <- user(0)
  IC2S2J4U_17_ini[] <- user(0)
  IC3S2J4U_17_ini[] <- user(0)
  IC4S2J4U_17_ini[] <- user(0)
  
  
  
  IC1S1J5U_10_ini[] <- user(0)
  IC2S1J5U_10_ini[] <- user(0)
  IC3S1J5U_10_ini[] <- user(0)
  IC4S1J5U_10_ini[] <- user(0)
  
  IC1S1J5U_11_ini[] <- user(0)
  IC2S1J5U_11_ini[] <- user(0)
  IC3S1J5U_11_ini[] <- user(0)
  IC4S1J5U_11_ini[] <- user(0)
  
  IC1S1J5U_12_ini[] <- user(0)
  IC2S1J5U_12_ini[] <- user(0)
  IC3S1J5U_12_ini[] <- user(0)
  IC4S1J5U_12_ini[] <- user(0)
  
  IC1S1J5U_13_ini[] <- user(0)
  IC2S1J5U_13_ini[] <- user(0)
  IC3S1J5U_13_ini[] <- user(0)
  IC4S1J5U_13_ini[] <- user(0)
  
  IC1S1J5U_14_ini[] <- user(0)
  IC2S1J5U_14_ini[] <- user(0)
  IC3S1J5U_14_ini[] <- user(0)
  IC4S1J5U_14_ini[] <- user(0)
  
  IC1S1J5U_15_ini[] <- user(0)
  IC2S1J5U_15_ini[] <- user(0)
  IC3S1J5U_15_ini[] <- user(0)
  IC4S1J5U_15_ini[] <- user(0)
  
  IC1S1J5U_16_ini[] <- user(0)
  IC2S1J5U_16_ini[] <- user(0)
  IC3S1J5U_16_ini[] <- user(0)
  IC4S1J5U_16_ini[] <- user(0)
  
  IC1S1J5U_17_ini[] <- user(0)
  IC2S1J5U_17_ini[] <- user(0)
  IC3S1J5U_17_ini[] <- user(0)
  IC4S1J5U_17_ini[] <- user(0)
  
  
  
  IC1S2J5U_10_ini[] <- user(0)
  IC2S2J5U_10_ini[] <- user(0)
  IC3S2J5U_10_ini[] <- user(0)
  IC4S2J5U_10_ini[] <- user(0)
  
  IC1S2J5U_11_ini[] <- user(0)
  IC2S2J5U_11_ini[] <- user(0)
  IC3S2J5U_11_ini[] <- user(0)
  IC4S2J5U_11_ini[] <- user(0)
  
  IC1S2J5U_12_ini[] <- user(0)
  IC2S2J5U_12_ini[] <- user(0)
  IC3S2J5U_12_ini[] <- user(0)
  IC4S2J5U_12_ini[] <- user(0)
  
  IC1S2J5U_13_ini[] <- user(0)
  IC2S2J5U_13_ini[] <- user(0)
  IC3S2J5U_13_ini[] <- user(0)
  IC4S2J5U_13_ini[] <- user(0)
  
  IC1S2J5U_14_ini[] <- user(0)
  IC2S2J5U_14_ini[] <- user(0)
  IC3S2J5U_14_ini[] <- user(0)
  IC4S2J5U_14_ini[] <- user(0)
  
  IC1S2J5U_15_ini[] <- user(0)
  IC2S2J5U_15_ini[] <- user(0)
  IC3S2J5U_15_ini[] <- user(0)
  IC4S2J5U_15_ini[] <- user(0)
  
  IC1S2J5U_16_ini[] <- user(0)
  IC2S2J5U_16_ini[] <- user(0)
  IC3S2J5U_16_ini[] <- user(0)
  IC4S2J5U_16_ini[] <- user(0)
  
  IC1S2J5U_17_ini[] <- user(0)
  IC2S2J5U_17_ini[] <- user(0)
  IC3S2J5U_17_ini[] <- user(0)
  IC4S2J5U_17_ini[] <- user(0)
  
  EC1S1J1U_10_ini[] <- user(0)
  EC2S1J1U_10_ini[] <- user(0)
  EC3S1J1U_10_ini[] <- user(0)
  EC4S1J1U_10_ini[] <- user(0)
  
  EC1S1J1U_11_ini[] <- user(0)
  EC2S1J1U_11_ini[] <- user(0)
  EC3S1J1U_11_ini[] <- user(0)
  EC4S1J1U_11_ini[] <- user(0)
  
  EC1S1J1U_12_ini[] <- user(0)
  EC2S1J1U_12_ini[] <- user(0)
  EC3S1J1U_12_ini[] <- user(0)
  EC4S1J1U_12_ini[] <- user(0)
  
  EC1S1J1U_13_ini[] <- user(0)
  EC2S1J1U_13_ini[] <- user(0)
  EC3S1J1U_13_ini[] <- user(0)
  EC4S1J1U_13_ini[] <- user(0)
  
  EC1S1J1U_14_ini[] <- user(0)
  EC2S1J1U_14_ini[] <- user(0)
  EC3S1J1U_14_ini[] <- user(0)
  EC4S1J1U_14_ini[] <- user(0)
  
  EC1S1J1U_15_ini[] <- user(0)
  EC2S1J1U_15_ini[] <- user(0)
  EC3S1J1U_15_ini[] <- user(0)
  EC4S1J1U_15_ini[] <- user(0)
  
  EC1S1J1U_16_ini[] <- user(0)
  EC2S1J1U_16_ini[] <- user(0)
  EC3S1J1U_16_ini[] <- user(0)
  EC4S1J1U_16_ini[] <- user(0)
  
  EC1S1J1U_17_ini[] <- user(0)
  EC2S1J1U_17_ini[] <- user(0)
  EC3S1J1U_17_ini[] <- user(0)
  EC4S1J1U_17_ini[] <- user(0)
  
  
  
  EC1S2J1U_10_ini[] <- user(0)
  EC2S2J1U_10_ini[] <- user(0)
  EC3S2J1U_10_ini[] <- user(0)
  EC4S2J1U_10_ini[] <- user(0)
  
  EC1S2J1U_11_ini[] <- user(0)
  EC2S2J1U_11_ini[] <- user(0)
  EC3S2J1U_11_ini[] <- user(0)
  EC4S2J1U_11_ini[] <- user(0)
  
  EC1S2J1U_12_ini[] <- user(0)
  EC2S2J1U_12_ini[] <- user(0)
  EC3S2J1U_12_ini[] <- user(0)
  EC4S2J1U_12_ini[] <- user(0)
  
  EC1S2J1U_13_ini[] <- user(0)
  EC2S2J1U_13_ini[] <- user(0)
  EC3S2J1U_13_ini[] <- user(0)
  EC4S2J1U_13_ini[] <- user(0)
  
  EC1S2J1U_14_ini[] <- user(0)
  EC2S2J1U_14_ini[] <- user(0)
  EC3S2J1U_14_ini[] <- user(0)
  EC4S2J1U_14_ini[] <- user(0)
  
  EC1S2J1U_15_ini[] <- user(0)
  EC2S2J1U_15_ini[] <- user(0)
  EC3S2J1U_15_ini[] <- user(0)
  EC4S2J1U_15_ini[] <- user(0)
  
  EC1S2J1U_16_ini[] <- user(0)
  EC2S2J1U_16_ini[] <- user(0)
  EC3S2J1U_16_ini[] <- user(0)
  EC4S2J1U_16_ini[] <- user(0)
  
  EC1S2J1U_17_ini[] <- user(0)
  EC2S2J1U_17_ini[] <- user(0)
  EC3S2J1U_17_ini[] <- user(0)
  EC4S2J1U_17_ini[] <- user(0)
  
  
  
  EC1S1J2U_10_ini[] <- user(0)
  EC2S1J2U_10_ini[] <- user(0)
  EC3S1J2U_10_ini[] <- user(0)
  EC4S1J2U_10_ini[] <- user(0)
  
  EC1S1J2U_11_ini[] <- user(0)
  EC2S1J2U_11_ini[] <- user(0)
  EC3S1J2U_11_ini[] <- user(0)
  EC4S1J2U_11_ini[] <- user(0)
  
  EC1S1J2U_12_ini[] <- user(0)
  EC2S1J2U_12_ini[] <- user(0)
  EC3S1J2U_12_ini[] <- user(0)
  EC4S1J2U_12_ini[] <- user(0)
  
  EC1S1J2U_13_ini[] <- user(0)
  EC2S1J2U_13_ini[] <- user(0)
  EC3S1J2U_13_ini[] <- user(0)
  EC4S1J2U_13_ini[] <- user(0)
  
  EC1S1J2U_14_ini[] <- user(0)
  EC2S1J2U_14_ini[] <- user(0)
  EC3S1J2U_14_ini[] <- user(0)
  EC4S1J2U_14_ini[] <- user(0)
  
  EC1S1J2U_15_ini[] <- user(0)
  EC2S1J2U_15_ini[] <- user(0)
  EC3S1J2U_15_ini[] <- user(0)
  EC4S1J2U_15_ini[] <- user(0)
  
  EC1S1J2U_16_ini[] <- user(0)
  EC2S1J2U_16_ini[] <- user(0)
  EC3S1J2U_16_ini[] <- user(0)
  EC4S1J2U_16_ini[] <- user(0)
  
  EC1S1J2U_17_ini[] <- user(0)
  EC2S1J2U_17_ini[] <- user(0)
  EC3S1J2U_17_ini[] <- user(0)
  EC4S1J2U_17_ini[] <- user(0)
  
  
  
  EC1S2J2U_10_ini[] <- user(0)
  EC2S2J2U_10_ini[] <- user(0)
  EC3S2J2U_10_ini[] <- user(0)
  EC4S2J2U_10_ini[] <- user(0)
  
  EC1S2J2U_11_ini[] <- user(0)
  EC2S2J2U_11_ini[] <- user(0)
  EC3S2J2U_11_ini[] <- user(0)
  EC4S2J2U_11_ini[] <- user(0)
  
  EC1S2J2U_12_ini[] <- user(0)
  EC2S2J2U_12_ini[] <- user(0)
  EC3S2J2U_12_ini[] <- user(0)
  EC4S2J2U_12_ini[] <- user(0)
  
  EC1S2J2U_13_ini[] <- user(0)
  EC2S2J2U_13_ini[] <- user(0)
  EC3S2J2U_13_ini[] <- user(0)
  EC4S2J2U_13_ini[] <- user(0)
  
  EC1S2J2U_14_ini[] <- user(0)
  EC2S2J2U_14_ini[] <- user(0)
  EC3S2J2U_14_ini[] <- user(0)
  EC4S2J2U_14_ini[] <- user(0)
  
  EC1S2J2U_15_ini[] <- user(0)
  EC2S2J2U_15_ini[] <- user(0)
  EC3S2J2U_15_ini[] <- user(0)
  EC4S2J2U_15_ini[] <- user(0)
  
  EC1S2J2U_16_ini[] <- user(0)
  EC2S2J2U_16_ini[] <- user(0)
  EC3S2J2U_16_ini[] <- user(0)
  EC4S2J2U_16_ini[] <- user(0)
  
  EC1S2J2U_17_ini[] <- user(0)
  EC2S2J2U_17_ini[] <- user(0)
  EC3S2J2U_17_ini[] <- user(0)
  EC4S2J2U_17_ini[] <- user(0)
  
  
  
  EC1S1J3U_10_ini[] <- user(0)
  EC2S1J3U_10_ini[] <- user(0)
  EC3S1J3U_10_ini[] <- user(0)
  EC4S1J3U_10_ini[] <- user(0)
  
  EC1S1J3U_11_ini[] <- user(0)
  EC2S1J3U_11_ini[] <- user(0)
  EC3S1J3U_11_ini[] <- user(0)
  EC4S1J3U_11_ini[] <- user(0)
  
  EC1S1J3U_12_ini[] <- user(0)
  EC2S1J3U_12_ini[] <- user(0)
  EC3S1J3U_12_ini[] <- user(0)
  EC4S1J3U_12_ini[] <- user(0)
  
  EC1S1J3U_13_ini[] <- user(0)
  EC2S1J3U_13_ini[] <- user(0)
  EC3S1J3U_13_ini[] <- user(0)
  EC4S1J3U_13_ini[] <- user(0)
  
  EC1S1J3U_14_ini[] <- user(0)
  EC2S1J3U_14_ini[] <- user(0)
  EC3S1J3U_14_ini[] <- user(0)
  EC4S1J3U_14_ini[] <- user(0)
  
  EC1S1J3U_15_ini[] <- user(0)
  EC2S1J3U_15_ini[] <- user(0)
  EC3S1J3U_15_ini[] <- user(0)
  EC4S1J3U_15_ini[] <- user(0)
  
  EC1S1J3U_16_ini[] <- user(0)
  EC2S1J3U_16_ini[] <- user(0)
  EC3S1J3U_16_ini[] <- user(0)
  EC4S1J3U_16_ini[] <- user(0)
  
  EC1S1J3U_17_ini[] <- user(0)
  EC2S1J3U_17_ini[] <- user(0)
  EC3S1J3U_17_ini[] <- user(0)
  EC4S1J3U_17_ini[] <- user(0)
  
  
  
  EC1S2J3U_10_ini[] <- user(0)
  EC2S2J3U_10_ini[] <- user(0)
  EC3S2J3U_10_ini[] <- user(0)
  EC4S2J3U_10_ini[] <- user(0)
  
  EC1S2J3U_11_ini[] <- user(0)
  EC2S2J3U_11_ini[] <- user(0)
  EC3S2J3U_11_ini[] <- user(0)
  EC4S2J3U_11_ini[] <- user(0)
  
  EC1S2J3U_12_ini[] <- user(0)
  EC2S2J3U_12_ini[] <- user(0)
  EC3S2J3U_12_ini[] <- user(0)
  EC4S2J3U_12_ini[] <- user(0)
  
  EC1S2J3U_13_ini[] <- user(0)
  EC2S2J3U_13_ini[] <- user(0)
  EC3S2J3U_13_ini[] <- user(0)
  EC4S2J3U_13_ini[] <- user(0)
  
  EC1S2J3U_14_ini[] <- user(0)
  EC2S2J3U_14_ini[] <- user(0)
  EC3S2J3U_14_ini[] <- user(0)
  EC4S2J3U_14_ini[] <- user(0)
  
  EC1S2J3U_15_ini[] <- user(0)
  EC2S2J3U_15_ini[] <- user(0)
  EC3S2J3U_15_ini[] <- user(0)
  EC4S2J3U_15_ini[] <- user(0)
  
  EC1S2J3U_16_ini[] <- user(0)
  EC2S2J3U_16_ini[] <- user(0)
  EC3S2J3U_16_ini[] <- user(0)
  EC4S2J3U_16_ini[] <- user(0)
  
  EC1S2J3U_17_ini[] <- user(0)
  EC2S2J3U_17_ini[] <- user(0)
  EC3S2J3U_17_ini[] <- user(0)
  EC4S2J3U_17_ini[] <- user(0)
  
  
  
  EC1S1J4U_10_ini[] <- user(0)
  EC2S1J4U_10_ini[] <- user(0)
  EC3S1J4U_10_ini[] <- user(0)
  EC4S1J4U_10_ini[] <- user(0)
  
  EC1S1J4U_11_ini[] <- user(0)
  EC2S1J4U_11_ini[] <- user(0)
  EC3S1J4U_11_ini[] <- user(0)
  EC4S1J4U_11_ini[] <- user(0)
  
  EC1S1J4U_12_ini[] <- user(0)
  EC2S1J4U_12_ini[] <- user(0)
  EC3S1J4U_12_ini[] <- user(0)
  EC4S1J4U_12_ini[] <- user(0)
  
  EC1S1J4U_13_ini[] <- user(0)
  EC2S1J4U_13_ini[] <- user(0)
  EC3S1J4U_13_ini[] <- user(0)
  EC4S1J4U_13_ini[] <- user(0)
  
  EC1S1J4U_14_ini[] <- user(0)
  EC2S1J4U_14_ini[] <- user(0)
  EC3S1J4U_14_ini[] <- user(0)
  EC4S1J4U_14_ini[] <- user(0)
  
  EC1S1J4U_15_ini[] <- user(0)
  EC2S1J4U_15_ini[] <- user(0)
  EC3S1J4U_15_ini[] <- user(0)
  EC4S1J4U_15_ini[] <- user(0)
  
  EC1S1J4U_16_ini[] <- user(0)
  EC2S1J4U_16_ini[] <- user(0)
  EC3S1J4U_16_ini[] <- user(0)
  EC4S1J4U_16_ini[] <- user(0)
  
  EC1S1J4U_17_ini[] <- user(0)
  EC2S1J4U_17_ini[] <- user(0)
  EC3S1J4U_17_ini[] <- user(0)
  EC4S1J4U_17_ini[] <- user(0)
  
  
  
  EC1S2J4U_10_ini[] <- user(0)
  EC2S2J4U_10_ini[] <- user(0)
  EC3S2J4U_10_ini[] <- user(0)
  EC4S2J4U_10_ini[] <- user(0)
  
  EC1S2J4U_11_ini[] <- user(0)
  EC2S2J4U_11_ini[] <- user(0)
  EC3S2J4U_11_ini[] <- user(0)
  EC4S2J4U_11_ini[] <- user(0)
  
  EC1S2J4U_12_ini[] <- user(0)
  EC2S2J4U_12_ini[] <- user(0)
  EC3S2J4U_12_ini[] <- user(0)
  EC4S2J4U_12_ini[] <- user(0)
  
  EC1S2J4U_13_ini[] <- user(0)
  EC2S2J4U_13_ini[] <- user(0)
  EC3S2J4U_13_ini[] <- user(0)
  EC4S2J4U_13_ini[] <- user(0)
  
  EC1S2J4U_14_ini[] <- user(0)
  EC2S2J4U_14_ini[] <- user(0)
  EC3S2J4U_14_ini[] <- user(0)
  EC4S2J4U_14_ini[] <- user(0)
  
  EC1S2J4U_15_ini[] <- user(0)
  EC2S2J4U_15_ini[] <- user(0)
  EC3S2J4U_15_ini[] <- user(0)
  EC4S2J4U_15_ini[] <- user(0)
  
  EC1S2J4U_16_ini[] <- user(0)
  EC2S2J4U_16_ini[] <- user(0)
  EC3S2J4U_16_ini[] <- user(0)
  EC4S2J4U_16_ini[] <- user(0)
  
  EC1S2J4U_17_ini[] <- user(0)
  EC2S2J4U_17_ini[] <- user(0)
  EC3S2J4U_17_ini[] <- user(0)
  EC4S2J4U_17_ini[] <- user(0)
  
  
  
  EC1S1J5U_10_ini[] <- user(0)
  EC2S1J5U_10_ini[] <- user(0)
  EC3S1J5U_10_ini[] <- user(0)
  EC4S1J5U_10_ini[] <- user(0)
  
  EC1S1J5U_11_ini[] <- user(0)
  EC2S1J5U_11_ini[] <- user(0)
  EC3S1J5U_11_ini[] <- user(0)
  EC4S1J5U_11_ini[] <- user(0)
  
  EC1S1J5U_12_ini[] <- user(0)
  EC2S1J5U_12_ini[] <- user(0)
  EC3S1J5U_12_ini[] <- user(0)
  EC4S1J5U_12_ini[] <- user(0)
  
  EC1S1J5U_13_ini[] <- user(0)
  EC2S1J5U_13_ini[] <- user(0)
  EC3S1J5U_13_ini[] <- user(0)
  EC4S1J5U_13_ini[] <- user(0)
  
  EC1S1J5U_14_ini[] <- user(0)
  EC2S1J5U_14_ini[] <- user(0)
  EC3S1J5U_14_ini[] <- user(0)
  EC4S1J5U_14_ini[] <- user(0)
  
  EC1S1J5U_15_ini[] <- user(0)
  EC2S1J5U_15_ini[] <- user(0)
  EC3S1J5U_15_ini[] <- user(0)
  EC4S1J5U_15_ini[] <- user(0)
  
  EC1S1J5U_16_ini[] <- user(0)
  EC2S1J5U_16_ini[] <- user(0)
  EC3S1J5U_16_ini[] <- user(0)
  EC4S1J5U_16_ini[] <- user(0)
  
  EC1S1J5U_17_ini[] <- user(0)
  EC2S1J5U_17_ini[] <- user(0)
  EC3S1J5U_17_ini[] <- user(0)
  EC4S1J5U_17_ini[] <- user(0)
  
  
  
  EC1S2J5U_10_ini[] <- user(0)
  EC2S2J5U_10_ini[] <- user(0)
  EC3S2J5U_10_ini[] <- user(0)
  EC4S2J5U_10_ini[] <- user(0)
  
  EC1S2J5U_11_ini[] <- user(0)
  EC2S2J5U_11_ini[] <- user(0)
  EC3S2J5U_11_ini[] <- user(0)
  EC4S2J5U_11_ini[] <- user(0)
  
  EC1S2J5U_12_ini[] <- user(0)
  EC2S2J5U_12_ini[] <- user(0)
  EC3S2J5U_12_ini[] <- user(0)
  EC4S2J5U_12_ini[] <- user(0)
  
  EC1S2J5U_13_ini[] <- user(0)
  EC2S2J5U_13_ini[] <- user(0)
  EC3S2J5U_13_ini[] <- user(0)
  EC4S2J5U_13_ini[] <- user(0)
  
  EC1S2J5U_14_ini[] <- user(0)
  EC2S2J5U_14_ini[] <- user(0)
  EC3S2J5U_14_ini[] <- user(0)
  EC4S2J5U_14_ini[] <- user(0)
  
  EC1S2J5U_15_ini[] <- user(0)
  EC2S2J5U_15_ini[] <- user(0)
  EC3S2J5U_15_ini[] <- user(0)
  EC4S2J5U_15_ini[] <- user(0)
  
  EC1S2J5U_16_ini[] <- user(0)
  EC2S2J5U_16_ini[] <- user(0)
  EC3S2J5U_16_ini[] <- user(0)
  EC4S2J5U_16_ini[] <- user(0)
  
  EC1S2J5U_17_ini[] <- user(0)
  EC2S2J5U_17_ini[] <- user(0)
  EC3S2J5U_17_ini[] <- user(0)
  EC4S2J5U_17_ini[] <- user(0)
  
  
  initial(IC1S1J1U_10[]) <- IC1S1J1U_10_ini[i]
  initial(IC2S1J1U_10[]) <- IC2S1J1U_10_ini[i]
  initial(IC3S1J1U_10[]) <- IC3S1J1U_10_ini[i]
  initial(IC4S1J1U_10[]) <- IC4S1J1U_10_ini[i]
  
  initial(IC1S1J1U_11[]) <- IC1S1J1U_11_ini[i]
  initial(IC2S1J1U_11[]) <- IC2S1J1U_11_ini[i]
  initial(IC3S1J1U_11[]) <- IC3S1J1U_11_ini[i]
  initial(IC4S1J1U_11[]) <- IC4S1J1U_11_ini[i]
  
  initial(IC1S1J1U_12[]) <- IC1S1J1U_12_ini[i]
  initial(IC2S1J1U_12[]) <- IC2S1J1U_12_ini[i]
  initial(IC3S1J1U_12[]) <- IC3S1J1U_12_ini[i]
  initial(IC4S1J1U_12[]) <- IC4S1J1U_12_ini[i]
  
  initial(IC1S1J1U_13[]) <- IC1S1J1U_13_ini[i]
  initial(IC2S1J1U_13[]) <- IC2S1J1U_13_ini[i]
  initial(IC3S1J1U_13[]) <- IC3S1J1U_13_ini[i]
  initial(IC4S1J1U_13[]) <- IC4S1J1U_13_ini[i]
  
  initial(IC1S1J1U_14[]) <- IC1S1J1U_14_ini[i]
  initial(IC2S1J1U_14[]) <- IC2S1J1U_14_ini[i]
  initial(IC3S1J1U_14[]) <- IC3S1J1U_14_ini[i]
  initial(IC4S1J1U_14[]) <- IC4S1J1U_14_ini[i]
  
  initial(IC1S1J1U_15[]) <- IC1S1J1U_15_ini[i]
  initial(IC2S1J1U_15[]) <- IC2S1J1U_15_ini[i]
  initial(IC3S1J1U_15[]) <- IC3S1J1U_15_ini[i]
  initial(IC4S1J1U_15[]) <- IC4S1J1U_15_ini[i]
  
  initial(IC1S1J1U_16[]) <- IC1S1J1U_16_ini[i]
  initial(IC2S1J1U_16[]) <- IC2S1J1U_16_ini[i]
  initial(IC3S1J1U_16[]) <- IC3S1J1U_16_ini[i]
  initial(IC4S1J1U_16[]) <- IC4S1J1U_16_ini[i]
  
  initial(IC1S1J1U_17[]) <- IC1S1J1U_17_ini[i]
  initial(IC2S1J1U_17[]) <- IC2S1J1U_17_ini[i]
  initial(IC3S1J1U_17[]) <- IC3S1J1U_17_ini[i]
  initial(IC4S1J1U_17[]) <- IC4S1J1U_17_ini[i]
  
  
  
  initial(IC1S2J1U_10[]) <- IC1S2J1U_10_ini[i]
  initial(IC2S2J1U_10[]) <- IC2S2J1U_10_ini[i]
  initial(IC3S2J1U_10[]) <- IC3S2J1U_10_ini[i]
  initial(IC4S2J1U_10[]) <- IC4S2J1U_10_ini[i]
  
  initial(IC1S2J1U_11[]) <- IC1S2J1U_11_ini[i]
  initial(IC2S2J1U_11[]) <- IC2S2J1U_11_ini[i]
  initial(IC3S2J1U_11[]) <- IC3S2J1U_11_ini[i]
  initial(IC4S2J1U_11[]) <- IC4S2J1U_11_ini[i]
  
  initial(IC1S2J1U_12[]) <- IC1S2J1U_12_ini[i]
  initial(IC2S2J1U_12[]) <- IC2S2J1U_12_ini[i]
  initial(IC3S2J1U_12[]) <- IC3S2J1U_12_ini[i]
  initial(IC4S2J1U_12[]) <- IC4S2J1U_12_ini[i]
  
  initial(IC1S2J1U_13[]) <- IC1S2J1U_13_ini[i]
  initial(IC2S2J1U_13[]) <- IC2S2J1U_13_ini[i]
  initial(IC3S2J1U_13[]) <- IC3S2J1U_13_ini[i]
  initial(IC4S2J1U_13[]) <- IC4S2J1U_13_ini[i]
  
  initial(IC1S2J1U_14[]) <- IC1S2J1U_14_ini[i]
  initial(IC2S2J1U_14[]) <- IC2S2J1U_14_ini[i]
  initial(IC3S2J1U_14[]) <- IC3S2J1U_14_ini[i]
  initial(IC4S2J1U_14[]) <- IC4S2J1U_14_ini[i]
  
  initial(IC1S2J1U_15[]) <- IC1S2J1U_15_ini[i]
  initial(IC2S2J1U_15[]) <- IC2S2J1U_15_ini[i]
  initial(IC3S2J1U_15[]) <- IC3S2J1U_15_ini[i]
  initial(IC4S2J1U_15[]) <- IC4S2J1U_15_ini[i]
  
  initial(IC1S2J1U_16[]) <- IC1S2J1U_16_ini[i]
  initial(IC2S2J1U_16[]) <- IC2S2J1U_16_ini[i]
  initial(IC3S2J1U_16[]) <- IC3S2J1U_16_ini[i]
  initial(IC4S2J1U_16[]) <- IC4S2J1U_16_ini[i]
  
  initial(IC1S2J1U_17[]) <- IC1S2J1U_17_ini[i]
  initial(IC2S2J1U_17[]) <- IC2S2J1U_17_ini[i]
  initial(IC3S2J1U_17[]) <- IC3S2J1U_17_ini[i]
  initial(IC4S2J1U_17[]) <- IC4S2J1U_17_ini[i]
  
  
  
  initial(IC1S1J2U_10[]) <- IC1S1J2U_10_ini[i]
  initial(IC2S1J2U_10[]) <- IC2S1J2U_10_ini[i]
  initial(IC3S1J2U_10[]) <- IC3S1J2U_10_ini[i]
  initial(IC4S1J2U_10[]) <- IC4S1J2U_10_ini[i]
  
  initial(IC1S1J2U_11[]) <- IC1S1J2U_11_ini[i]
  initial(IC2S1J2U_11[]) <- IC2S1J2U_11_ini[i]
  initial(IC3S1J2U_11[]) <- IC3S1J2U_11_ini[i]
  initial(IC4S1J2U_11[]) <- IC4S1J2U_11_ini[i]
  
  initial(IC1S1J2U_12[]) <- IC1S1J2U_12_ini[i]
  initial(IC2S1J2U_12[]) <- IC2S1J2U_12_ini[i]
  initial(IC3S1J2U_12[]) <- IC3S1J2U_12_ini[i]
  initial(IC4S1J2U_12[]) <- IC4S1J2U_12_ini[i]
  
  initial(IC1S1J2U_13[]) <- IC1S1J2U_13_ini[i]
  initial(IC2S1J2U_13[]) <- IC2S1J2U_13_ini[i]
  initial(IC3S1J2U_13[]) <- IC3S1J2U_13_ini[i]
  initial(IC4S1J2U_13[]) <- IC4S1J2U_13_ini[i]
  
  initial(IC1S1J2U_14[]) <- IC1S1J2U_14_ini[i]
  initial(IC2S1J2U_14[]) <- IC2S1J2U_14_ini[i]
  initial(IC3S1J2U_14[]) <- IC3S1J2U_14_ini[i]
  initial(IC4S1J2U_14[]) <- IC4S1J2U_14_ini[i]
  
  initial(IC1S1J2U_15[]) <- IC1S1J2U_15_ini[i]
  initial(IC2S1J2U_15[]) <- IC2S1J2U_15_ini[i]
  initial(IC3S1J2U_15[]) <- IC3S1J2U_15_ini[i]
  initial(IC4S1J2U_15[]) <- IC4S1J2U_15_ini[i]
  
  initial(IC1S1J2U_16[]) <- IC1S1J2U_16_ini[i]
  initial(IC2S1J2U_16[]) <- IC2S1J2U_16_ini[i]
  initial(IC3S1J2U_16[]) <- IC3S1J2U_16_ini[i]
  initial(IC4S1J2U_16[]) <- IC4S1J2U_16_ini[i]
  
  initial(IC1S1J2U_17[]) <- IC1S1J2U_17_ini[i]
  initial(IC2S1J2U_17[]) <- IC2S1J2U_17_ini[i]
  initial(IC3S1J2U_17[]) <- IC3S1J2U_17_ini[i]
  initial(IC4S1J2U_17[]) <- IC4S1J2U_17_ini[i]
  
  
  
  initial(IC1S2J2U_10[]) <- IC1S2J2U_10_ini[i]
  initial(IC2S2J2U_10[]) <- IC2S2J2U_10_ini[i]
  initial(IC3S2J2U_10[]) <- IC3S2J2U_10_ini[i]
  initial(IC4S2J2U_10[]) <- IC4S2J2U_10_ini[i]
  
  initial(IC1S2J2U_11[]) <- IC1S2J2U_11_ini[i]
  initial(IC2S2J2U_11[]) <- IC2S2J2U_11_ini[i]
  initial(IC3S2J2U_11[]) <- IC3S2J2U_11_ini[i]
  initial(IC4S2J2U_11[]) <- IC4S2J2U_11_ini[i]
  
  initial(IC1S2J2U_12[]) <- IC1S2J2U_12_ini[i]
  initial(IC2S2J2U_12[]) <- IC2S2J2U_12_ini[i]
  initial(IC3S2J2U_12[]) <- IC3S2J2U_12_ini[i]
  initial(IC4S2J2U_12[]) <- IC4S2J2U_12_ini[i]
  
  initial(IC1S2J2U_13[]) <- IC1S2J2U_13_ini[i]
  initial(IC2S2J2U_13[]) <- IC2S2J2U_13_ini[i]
  initial(IC3S2J2U_13[]) <- IC3S2J2U_13_ini[i]
  initial(IC4S2J2U_13[]) <- IC4S2J2U_13_ini[i]
  
  initial(IC1S2J2U_14[]) <- IC1S2J2U_14_ini[i]
  initial(IC2S2J2U_14[]) <- IC2S2J2U_14_ini[i]
  initial(IC3S2J2U_14[]) <- IC3S2J2U_14_ini[i]
  initial(IC4S2J2U_14[]) <- IC4S2J2U_14_ini[i]
  
  initial(IC1S2J2U_15[]) <- IC1S2J2U_15_ini[i]
  initial(IC2S2J2U_15[]) <- IC2S2J2U_15_ini[i]
  initial(IC3S2J2U_15[]) <- IC3S2J2U_15_ini[i]
  initial(IC4S2J2U_15[]) <- IC4S2J2U_15_ini[i]
  
  initial(IC1S2J2U_16[]) <- IC1S2J2U_16_ini[i]
  initial(IC2S2J2U_16[]) <- IC2S2J2U_16_ini[i]
  initial(IC3S2J2U_16[]) <- IC3S2J2U_16_ini[i]
  initial(IC4S2J2U_16[]) <- IC4S2J2U_16_ini[i]
  
  initial(IC1S2J2U_17[]) <- IC1S2J2U_17_ini[i]
  initial(IC2S2J2U_17[]) <- IC2S2J2U_17_ini[i]
  initial(IC3S2J2U_17[]) <- IC3S2J2U_17_ini[i]
  initial(IC4S2J2U_17[]) <- IC4S2J2U_17_ini[i]
  
  
  
  initial(IC1S1J3U_10[]) <- IC1S1J3U_10_ini[i]
  initial(IC2S1J3U_10[]) <- IC2S1J3U_10_ini[i]
  initial(IC3S1J3U_10[]) <- IC3S1J3U_10_ini[i]
  initial(IC4S1J3U_10[]) <- IC4S1J3U_10_ini[i]
  
  initial(IC1S1J3U_11[]) <- IC1S1J3U_11_ini[i]
  initial(IC2S1J3U_11[]) <- IC2S1J3U_11_ini[i]
  initial(IC3S1J3U_11[]) <- IC3S1J3U_11_ini[i]
  initial(IC4S1J3U_11[]) <- IC4S1J3U_11_ini[i]
  
  initial(IC1S1J3U_12[]) <- IC1S1J3U_12_ini[i]
  initial(IC2S1J3U_12[]) <- IC2S1J3U_12_ini[i]
  initial(IC3S1J3U_12[]) <- IC3S1J3U_12_ini[i]
  initial(IC4S1J3U_12[]) <- IC4S1J3U_12_ini[i]
  
  initial(IC1S1J3U_13[]) <- IC1S1J3U_13_ini[i]
  initial(IC2S1J3U_13[]) <- IC2S1J3U_13_ini[i]
  initial(IC3S1J3U_13[]) <- IC3S1J3U_13_ini[i]
  initial(IC4S1J3U_13[]) <- IC4S1J3U_13_ini[i]
  
  initial(IC1S1J3U_14[]) <- IC1S1J3U_14_ini[i]
  initial(IC2S1J3U_14[]) <- IC2S1J3U_14_ini[i]
  initial(IC3S1J3U_14[]) <- IC3S1J3U_14_ini[i]
  initial(IC4S1J3U_14[]) <- IC4S1J3U_14_ini[i]
  
  initial(IC1S1J3U_15[]) <- IC1S1J3U_15_ini[i]
  initial(IC2S1J3U_15[]) <- IC2S1J3U_15_ini[i]
  initial(IC3S1J3U_15[]) <- IC3S1J3U_15_ini[i]
  initial(IC4S1J3U_15[]) <- IC4S1J3U_15_ini[i]
  
  initial(IC1S1J3U_16[]) <- IC1S1J3U_16_ini[i]
  initial(IC2S1J3U_16[]) <- IC2S1J3U_16_ini[i]
  initial(IC3S1J3U_16[]) <- IC3S1J3U_16_ini[i]
  initial(IC4S1J3U_16[]) <- IC4S1J3U_16_ini[i]
  
  initial(IC1S1J3U_17[]) <- IC1S1J3U_17_ini[i]
  initial(IC2S1J3U_17[]) <- IC2S1J3U_17_ini[i]
  initial(IC3S1J3U_17[]) <- IC3S1J3U_17_ini[i]
  initial(IC4S1J3U_17[]) <- IC4S1J3U_17_ini[i]
  
  
  
  initial(IC1S2J3U_10[]) <- IC1S2J3U_10_ini[i]
  initial(IC2S2J3U_10[]) <- IC2S2J3U_10_ini[i]
  initial(IC3S2J3U_10[]) <- IC3S2J3U_10_ini[i]
  initial(IC4S2J3U_10[]) <- IC4S2J3U_10_ini[i]
  
  initial(IC1S2J3U_11[]) <- IC1S2J3U_11_ini[i]
  initial(IC2S2J3U_11[]) <- IC2S2J3U_11_ini[i]
  initial(IC3S2J3U_11[]) <- IC3S2J3U_11_ini[i]
  initial(IC4S2J3U_11[]) <- IC4S2J3U_11_ini[i]
  
  initial(IC1S2J3U_12[]) <- IC1S2J3U_12_ini[i]
  initial(IC2S2J3U_12[]) <- IC2S2J3U_12_ini[i]
  initial(IC3S2J3U_12[]) <- IC3S2J3U_12_ini[i]
  initial(IC4S2J3U_12[]) <- IC4S2J3U_12_ini[i]
  
  initial(IC1S2J3U_13[]) <- IC1S2J3U_13_ini[i]
  initial(IC2S2J3U_13[]) <- IC2S2J3U_13_ini[i]
  initial(IC3S2J3U_13[]) <- IC3S2J3U_13_ini[i]
  initial(IC4S2J3U_13[]) <- IC4S2J3U_13_ini[i]
  
  initial(IC1S2J3U_14[]) <- IC1S2J3U_14_ini[i]
  initial(IC2S2J3U_14[]) <- IC2S2J3U_14_ini[i]
  initial(IC3S2J3U_14[]) <- IC3S2J3U_14_ini[i]
  initial(IC4S2J3U_14[]) <- IC4S2J3U_14_ini[i]
  
  initial(IC1S2J3U_15[]) <- IC1S2J3U_15_ini[i]
  initial(IC2S2J3U_15[]) <- IC2S2J3U_15_ini[i]
  initial(IC3S2J3U_15[]) <- IC3S2J3U_15_ini[i]
  initial(IC4S2J3U_15[]) <- IC4S2J3U_15_ini[i]
  
  initial(IC1S2J3U_16[]) <- IC1S2J3U_16_ini[i]
  initial(IC2S2J3U_16[]) <- IC2S2J3U_16_ini[i]
  initial(IC3S2J3U_16[]) <- IC3S2J3U_16_ini[i]
  initial(IC4S2J3U_16[]) <- IC4S2J3U_16_ini[i]
  
  initial(IC1S2J3U_17[]) <- IC1S2J3U_17_ini[i]
  initial(IC2S2J3U_17[]) <- IC2S2J3U_17_ini[i]
  initial(IC3S2J3U_17[]) <- IC3S2J3U_17_ini[i]
  initial(IC4S2J3U_17[]) <- IC4S2J3U_17_ini[i]
  
  
  
  initial(IC1S1J4U_10[]) <- IC1S1J4U_10_ini[i]
  initial(IC2S1J4U_10[]) <- IC2S1J4U_10_ini[i]
  initial(IC3S1J4U_10[]) <- IC3S1J4U_10_ini[i]
  initial(IC4S1J4U_10[]) <- IC4S1J4U_10_ini[i]
  
  initial(IC1S1J4U_11[]) <- IC1S1J4U_11_ini[i]
  initial(IC2S1J4U_11[]) <- IC2S1J4U_11_ini[i]
  initial(IC3S1J4U_11[]) <- IC3S1J4U_11_ini[i]
  initial(IC4S1J4U_11[]) <- IC4S1J4U_11_ini[i]
  
  initial(IC1S1J4U_12[]) <- IC1S1J4U_12_ini[i]
  initial(IC2S1J4U_12[]) <- IC2S1J4U_12_ini[i]
  initial(IC3S1J4U_12[]) <- IC3S1J4U_12_ini[i]
  initial(IC4S1J4U_12[]) <- IC4S1J4U_12_ini[i]
  
  initial(IC1S1J4U_13[]) <- IC1S1J4U_13_ini[i]
  initial(IC2S1J4U_13[]) <- IC2S1J4U_13_ini[i]
  initial(IC3S1J4U_13[]) <- IC3S1J4U_13_ini[i]
  initial(IC4S1J4U_13[]) <- IC4S1J4U_13_ini[i]
  
  initial(IC1S1J4U_14[]) <- IC1S1J4U_14_ini[i]
  initial(IC2S1J4U_14[]) <- IC2S1J4U_14_ini[i]
  initial(IC3S1J4U_14[]) <- IC3S1J4U_14_ini[i]
  initial(IC4S1J4U_14[]) <- IC4S1J4U_14_ini[i]
  
  initial(IC1S1J4U_15[]) <- IC1S1J4U_15_ini[i]
  initial(IC2S1J4U_15[]) <- IC2S1J4U_15_ini[i]
  initial(IC3S1J4U_15[]) <- IC3S1J4U_15_ini[i]
  initial(IC4S1J4U_15[]) <- IC4S1J4U_15_ini[i]
  
  initial(IC1S1J4U_16[]) <- IC1S1J4U_16_ini[i]
  initial(IC2S1J4U_16[]) <- IC2S1J4U_16_ini[i]
  initial(IC3S1J4U_16[]) <- IC3S1J4U_16_ini[i]
  initial(IC4S1J4U_16[]) <- IC4S1J4U_16_ini[i]
  
  initial(IC1S1J4U_17[]) <- IC1S1J4U_17_ini[i]
  initial(IC2S1J4U_17[]) <- IC2S1J4U_17_ini[i]
  initial(IC3S1J4U_17[]) <- IC3S1J4U_17_ini[i]
  initial(IC4S1J4U_17[]) <- IC4S1J4U_17_ini[i]
  
  
  
  initial(IC1S2J4U_10[]) <- IC1S2J4U_10_ini[i]
  initial(IC2S2J4U_10[]) <- IC2S2J4U_10_ini[i]
  initial(IC3S2J4U_10[]) <- IC3S2J4U_10_ini[i]
  initial(IC4S2J4U_10[]) <- IC4S2J4U_10_ini[i]
  
  initial(IC1S2J4U_11[]) <- IC1S2J4U_11_ini[i]
  initial(IC2S2J4U_11[]) <- IC2S2J4U_11_ini[i]
  initial(IC3S2J4U_11[]) <- IC3S2J4U_11_ini[i]
  initial(IC4S2J4U_11[]) <- IC4S2J4U_11_ini[i]
  
  initial(IC1S2J4U_12[]) <- IC1S2J4U_12_ini[i]
  initial(IC2S2J4U_12[]) <- IC2S2J4U_12_ini[i]
  initial(IC3S2J4U_12[]) <- IC3S2J4U_12_ini[i]
  initial(IC4S2J4U_12[]) <- IC4S2J4U_12_ini[i]
  
  initial(IC1S2J4U_13[]) <- IC1S2J4U_13_ini[i]
  initial(IC2S2J4U_13[]) <- IC2S2J4U_13_ini[i]
  initial(IC3S2J4U_13[]) <- IC3S2J4U_13_ini[i]
  initial(IC4S2J4U_13[]) <- IC4S2J4U_13_ini[i]
  
  initial(IC1S2J4U_14[]) <- IC1S2J4U_14_ini[i]
  initial(IC2S2J4U_14[]) <- IC2S2J4U_14_ini[i]
  initial(IC3S2J4U_14[]) <- IC3S2J4U_14_ini[i]
  initial(IC4S2J4U_14[]) <- IC4S2J4U_14_ini[i]
  
  initial(IC1S2J4U_15[]) <- IC1S2J4U_15_ini[i]
  initial(IC2S2J4U_15[]) <- IC2S2J4U_15_ini[i]
  initial(IC3S2J4U_15[]) <- IC3S2J4U_15_ini[i]
  initial(IC4S2J4U_15[]) <- IC4S2J4U_15_ini[i]
  
  initial(IC1S2J4U_16[]) <- IC1S2J4U_16_ini[i]
  initial(IC2S2J4U_16[]) <- IC2S2J4U_16_ini[i]
  initial(IC3S2J4U_16[]) <- IC3S2J4U_16_ini[i]
  initial(IC4S2J4U_16[]) <- IC4S2J4U_16_ini[i]
  
  initial(IC1S2J4U_17[]) <- IC1S2J4U_17_ini[i]
  initial(IC2S2J4U_17[]) <- IC2S2J4U_17_ini[i]
  initial(IC3S2J4U_17[]) <- IC3S2J4U_17_ini[i]
  initial(IC4S2J4U_17[]) <- IC4S2J4U_17_ini[i]
  
  
  
  initial(IC1S1J5U_10[]) <- IC1S1J5U_10_ini[i]
  initial(IC2S1J5U_10[]) <- IC2S1J5U_10_ini[i]
  initial(IC3S1J5U_10[]) <- IC3S1J5U_10_ini[i]
  initial(IC4S1J5U_10[]) <- IC4S1J5U_10_ini[i]
  
  initial(IC1S1J5U_11[]) <- IC1S1J5U_11_ini[i]
  initial(IC2S1J5U_11[]) <- IC2S1J5U_11_ini[i]
  initial(IC3S1J5U_11[]) <- IC3S1J5U_11_ini[i]
  initial(IC4S1J5U_11[]) <- IC4S1J5U_11_ini[i]
  
  initial(IC1S1J5U_12[]) <- IC1S1J5U_12_ini[i]
  initial(IC2S1J5U_12[]) <- IC2S1J5U_12_ini[i]
  initial(IC3S1J5U_12[]) <- IC3S1J5U_12_ini[i]
  initial(IC4S1J5U_12[]) <- IC4S1J5U_12_ini[i]
  
  initial(IC1S1J5U_13[]) <- IC1S1J5U_13_ini[i]
  initial(IC2S1J5U_13[]) <- IC2S1J5U_13_ini[i]
  initial(IC3S1J5U_13[]) <- IC3S1J5U_13_ini[i]
  initial(IC4S1J5U_13[]) <- IC4S1J5U_13_ini[i]
  
  initial(IC1S1J5U_14[]) <- IC1S1J5U_14_ini[i]
  initial(IC2S1J5U_14[]) <- IC2S1J5U_14_ini[i]
  initial(IC3S1J5U_14[]) <- IC3S1J5U_14_ini[i]
  initial(IC4S1J5U_14[]) <- IC4S1J5U_14_ini[i]
  
  initial(IC1S1J5U_15[]) <- IC1S1J5U_15_ini[i]
  initial(IC2S1J5U_15[]) <- IC2S1J5U_15_ini[i]
  initial(IC3S1J5U_15[]) <- IC3S1J5U_15_ini[i]
  initial(IC4S1J5U_15[]) <- IC4S1J5U_15_ini[i]
  
  initial(IC1S1J5U_16[]) <- IC1S1J5U_16_ini[i]
  initial(IC2S1J5U_16[]) <- IC2S1J5U_16_ini[i]
  initial(IC3S1J5U_16[]) <- IC3S1J5U_16_ini[i]
  initial(IC4S1J5U_16[]) <- IC4S1J5U_16_ini[i]
  
  initial(IC1S1J5U_17[]) <- IC1S1J5U_17_ini[i]
  initial(IC2S1J5U_17[]) <- IC2S1J5U_17_ini[i]
  initial(IC3S1J5U_17[]) <- IC3S1J5U_17_ini[i]
  initial(IC4S1J5U_17[]) <- IC4S1J5U_17_ini[i]
  
  
  
  initial(IC1S2J5U_10[]) <- IC1S2J5U_10_ini[i]
  initial(IC2S2J5U_10[]) <- IC2S2J5U_10_ini[i]
  initial(IC3S2J5U_10[]) <- IC3S2J5U_10_ini[i]
  initial(IC4S2J5U_10[]) <- IC4S2J5U_10_ini[i]
  
  initial(IC1S2J5U_11[]) <- IC1S2J5U_11_ini[i]
  initial(IC2S2J5U_11[]) <- IC2S2J5U_11_ini[i]
  initial(IC3S2J5U_11[]) <- IC3S2J5U_11_ini[i]
  initial(IC4S2J5U_11[]) <- IC4S2J5U_11_ini[i]
  
  initial(IC1S2J5U_12[]) <- IC1S2J5U_12_ini[i]
  initial(IC2S2J5U_12[]) <- IC2S2J5U_12_ini[i]
  initial(IC3S2J5U_12[]) <- IC3S2J5U_12_ini[i]
  initial(IC4S2J5U_12[]) <- IC4S2J5U_12_ini[i]
  
  initial(IC1S2J5U_13[]) <- IC1S2J5U_13_ini[i]
  initial(IC2S2J5U_13[]) <- IC2S2J5U_13_ini[i]
  initial(IC3S2J5U_13[]) <- IC3S2J5U_13_ini[i]
  initial(IC4S2J5U_13[]) <- IC4S2J5U_13_ini[i]
  
  initial(IC1S2J5U_14[]) <- IC1S2J5U_14_ini[i]
  initial(IC2S2J5U_14[]) <- IC2S2J5U_14_ini[i]
  initial(IC3S2J5U_14[]) <- IC3S2J5U_14_ini[i]
  initial(IC4S2J5U_14[]) <- IC4S2J5U_14_ini[i]
  
  initial(IC1S2J5U_15[]) <- IC1S2J5U_15_ini[i]
  initial(IC2S2J5U_15[]) <- IC2S2J5U_15_ini[i]
  initial(IC3S2J5U_15[]) <- IC3S2J5U_15_ini[i]
  initial(IC4S2J5U_15[]) <- IC4S2J5U_15_ini[i]
  
  initial(IC1S2J5U_16[]) <- IC1S2J5U_16_ini[i]
  initial(IC2S2J5U_16[]) <- IC2S2J5U_16_ini[i]
  initial(IC3S2J5U_16[]) <- IC3S2J5U_16_ini[i]
  initial(IC4S2J5U_16[]) <- IC4S2J5U_16_ini[i]
  
  initial(IC1S2J5U_17[]) <- IC1S2J5U_17_ini[i]
  initial(IC2S2J5U_17[]) <- IC2S2J5U_17_ini[i]
  initial(IC3S2J5U_17[]) <- IC3S2J5U_17_ini[i]
  initial(IC4S2J5U_17[]) <- IC4S2J5U_17_ini[i]
  

  
  ##############################################################################################################################
  ## SETTING DIMENSIONS ####################################################################
  ##############################################################################################################################
  
  ##############################################################################################################################
  ## model states ####################################################################
  ##############################################################################################################################
  
  dim(IC1S1J1U_10) <- N_gender
  dim(IC2S1J1U_10) <- N_gender
  dim(IC3S1J1U_10) <- N_gender
  dim(IC4S1J1U_10) <- N_gender
  
  dim(IC1S1J1U_11) <- N_gender
  dim(IC2S1J1U_11) <- N_gender
  dim(IC3S1J1U_11) <- N_gender
  dim(IC4S1J1U_11) <- N_gender
  
  dim(IC1S1J1U_12) <- N_gender
  dim(IC2S1J1U_12) <- N_gender
  dim(IC3S1J1U_12) <- N_gender
  dim(IC4S1J1U_12) <- N_gender
  
  dim(IC1S1J1U_13) <- N_gender
  dim(IC2S1J1U_13) <- N_gender
  dim(IC3S1J1U_13) <- N_gender
  dim(IC4S1J1U_13) <- N_gender
  
  dim(IC1S1J1U_14) <- N_gender
  dim(IC2S1J1U_14) <- N_gender
  dim(IC3S1J1U_14) <- N_gender
  dim(IC4S1J1U_14) <- N_gender
  
  dim(IC1S1J1U_15) <- N_gender
  dim(IC2S1J1U_15) <- N_gender
  dim(IC3S1J1U_15) <- N_gender
  dim(IC4S1J1U_15) <- N_gender
  
  dim(IC1S1J1U_16) <- N_gender
  dim(IC2S1J1U_16) <- N_gender
  dim(IC3S1J1U_16) <- N_gender
  dim(IC4S1J1U_16) <- N_gender
  
  dim(IC1S1J1U_17) <- N_gender
  dim(IC2S1J1U_17) <- N_gender
  dim(IC3S1J1U_17) <- N_gender
  dim(IC4S1J1U_17) <- N_gender
  
  
  
  dim(IC1S2J1U_10) <- N_gender
  dim(IC2S2J1U_10) <- N_gender
  dim(IC3S2J1U_10) <- N_gender
  dim(IC4S2J1U_10) <- N_gender
  
  dim(IC1S2J1U_11) <- N_gender
  dim(IC2S2J1U_11) <- N_gender
  dim(IC3S2J1U_11) <- N_gender
  dim(IC4S2J1U_11) <- N_gender
  
  dim(IC1S2J1U_12) <- N_gender
  dim(IC2S2J1U_12) <- N_gender
  dim(IC3S2J1U_12) <- N_gender
  dim(IC4S2J1U_12) <- N_gender
  
  dim(IC1S2J1U_13) <- N_gender
  dim(IC2S2J1U_13) <- N_gender
  dim(IC3S2J1U_13) <- N_gender
  dim(IC4S2J1U_13) <- N_gender
  
  dim(IC1S2J1U_14) <- N_gender
  dim(IC2S2J1U_14) <- N_gender
  dim(IC3S2J1U_14) <- N_gender
  dim(IC4S2J1U_14) <- N_gender
  
  dim(IC1S2J1U_15) <- N_gender
  dim(IC2S2J1U_15) <- N_gender
  dim(IC3S2J1U_15) <- N_gender
  dim(IC4S2J1U_15) <- N_gender
  
  dim(IC1S2J1U_16) <- N_gender
  dim(IC2S2J1U_16) <- N_gender
  dim(IC3S2J1U_16) <- N_gender
  dim(IC4S2J1U_16) <- N_gender
  
  dim(IC1S2J1U_17) <- N_gender
  dim(IC2S2J1U_17) <- N_gender
  dim(IC3S2J1U_17) <- N_gender
  dim(IC4S2J1U_17) <- N_gender
  
  
  
  dim(IC1S1J2U_10) <- N_gender
  dim(IC2S1J2U_10) <- N_gender
  dim(IC3S1J2U_10) <- N_gender
  dim(IC4S1J2U_10) <- N_gender
  
  dim(IC1S1J2U_11) <- N_gender
  dim(IC2S1J2U_11) <- N_gender
  dim(IC3S1J2U_11) <- N_gender
  dim(IC4S1J2U_11) <- N_gender
  
  dim(IC1S1J2U_12) <- N_gender
  dim(IC2S1J2U_12) <- N_gender
  dim(IC3S1J2U_12) <- N_gender
  dim(IC4S1J2U_12) <- N_gender
  
  dim(IC1S1J2U_13) <- N_gender
  dim(IC2S1J2U_13) <- N_gender
  dim(IC3S1J2U_13) <- N_gender
  dim(IC4S1J2U_13) <- N_gender
  
  dim(IC1S1J2U_14) <- N_gender
  dim(IC2S1J2U_14) <- N_gender
  dim(IC3S1J2U_14) <- N_gender
  dim(IC4S1J2U_14) <- N_gender
  
  dim(IC1S1J2U_15) <- N_gender
  dim(IC2S1J2U_15) <- N_gender
  dim(IC3S1J2U_15) <- N_gender
  dim(IC4S1J2U_15) <- N_gender
  
  dim(IC1S1J2U_16) <- N_gender
  dim(IC2S1J2U_16) <- N_gender
  dim(IC3S1J2U_16) <- N_gender
  dim(IC4S1J2U_16) <- N_gender
  
  dim(IC1S1J2U_17) <- N_gender
  dim(IC2S1J2U_17) <- N_gender
  dim(IC3S1J2U_17) <- N_gender
  dim(IC4S1J2U_17) <- N_gender
  
  
  
  dim(IC1S2J2U_10) <- N_gender
  dim(IC2S2J2U_10) <- N_gender
  dim(IC3S2J2U_10) <- N_gender
  dim(IC4S2J2U_10) <- N_gender
  
  dim(IC1S2J2U_11) <- N_gender
  dim(IC2S2J2U_11) <- N_gender
  dim(IC3S2J2U_11) <- N_gender
  dim(IC4S2J2U_11) <- N_gender
  
  dim(IC1S2J2U_12) <- N_gender
  dim(IC2S2J2U_12) <- N_gender
  dim(IC3S2J2U_12) <- N_gender
  dim(IC4S2J2U_12) <- N_gender
  
  dim(IC1S2J2U_13) <- N_gender
  dim(IC2S2J2U_13) <- N_gender
  dim(IC3S2J2U_13) <- N_gender
  dim(IC4S2J2U_13) <- N_gender
  
  dim(IC1S2J2U_14) <- N_gender
  dim(IC2S2J2U_14) <- N_gender
  dim(IC3S2J2U_14) <- N_gender
  dim(IC4S2J2U_14) <- N_gender
  
  dim(IC1S2J2U_15) <- N_gender
  dim(IC2S2J2U_15) <- N_gender
  dim(IC3S2J2U_15) <- N_gender
  dim(IC4S2J2U_15) <- N_gender
  
  dim(IC1S2J2U_16) <- N_gender
  dim(IC2S2J2U_16) <- N_gender
  dim(IC3S2J2U_16) <- N_gender
  dim(IC4S2J2U_16) <- N_gender
  
  dim(IC1S2J2U_17) <- N_gender
  dim(IC2S2J2U_17) <- N_gender
  dim(IC3S2J2U_17) <- N_gender
  dim(IC4S2J2U_17) <- N_gender
  
  
  
  dim(IC1S1J3U_10) <- N_gender
  dim(IC2S1J3U_10) <- N_gender
  dim(IC3S1J3U_10) <- N_gender
  dim(IC4S1J3U_10) <- N_gender
  
  dim(IC1S1J3U_11) <- N_gender
  dim(IC2S1J3U_11) <- N_gender
  dim(IC3S1J3U_11) <- N_gender
  dim(IC4S1J3U_11) <- N_gender
  
  dim(IC1S1J3U_12) <- N_gender
  dim(IC2S1J3U_12) <- N_gender
  dim(IC3S1J3U_12) <- N_gender
  dim(IC4S1J3U_12) <- N_gender
  
  dim(IC1S1J3U_13) <- N_gender
  dim(IC2S1J3U_13) <- N_gender
  dim(IC3S1J3U_13) <- N_gender
  dim(IC4S1J3U_13) <- N_gender
  
  dim(IC1S1J3U_14) <- N_gender
  dim(IC2S1J3U_14) <- N_gender
  dim(IC3S1J3U_14) <- N_gender
  dim(IC4S1J3U_14) <- N_gender
  
  dim(IC1S1J3U_15) <- N_gender
  dim(IC2S1J3U_15) <- N_gender
  dim(IC3S1J3U_15) <- N_gender
  dim(IC4S1J3U_15) <- N_gender
  
  dim(IC1S1J3U_16) <- N_gender
  dim(IC2S1J3U_16) <- N_gender
  dim(IC3S1J3U_16) <- N_gender
  dim(IC4S1J3U_16) <- N_gender
  
  dim(IC1S1J3U_17) <- N_gender
  dim(IC2S1J3U_17) <- N_gender
  dim(IC3S1J3U_17) <- N_gender
  dim(IC4S1J3U_17) <- N_gender
  
  
  
  dim(IC1S2J3U_10) <- N_gender
  dim(IC2S2J3U_10) <- N_gender
  dim(IC3S2J3U_10) <- N_gender
  dim(IC4S2J3U_10) <- N_gender
  
  dim(IC1S2J3U_11) <- N_gender
  dim(IC2S2J3U_11) <- N_gender
  dim(IC3S2J3U_11) <- N_gender
  dim(IC4S2J3U_11) <- N_gender
  
  dim(IC1S2J3U_12) <- N_gender
  dim(IC2S2J3U_12) <- N_gender
  dim(IC3S2J3U_12) <- N_gender
  dim(IC4S2J3U_12) <- N_gender
  
  dim(IC1S2J3U_13) <- N_gender
  dim(IC2S2J3U_13) <- N_gender
  dim(IC3S2J3U_13) <- N_gender
  dim(IC4S2J3U_13) <- N_gender
  
  dim(IC1S2J3U_14) <- N_gender
  dim(IC2S2J3U_14) <- N_gender
  dim(IC3S2J3U_14) <- N_gender
  dim(IC4S2J3U_14) <- N_gender
  
  dim(IC1S2J3U_15) <- N_gender
  dim(IC2S2J3U_15) <- N_gender
  dim(IC3S2J3U_15) <- N_gender
  dim(IC4S2J3U_15) <- N_gender
  
  dim(IC1S2J3U_16) <- N_gender
  dim(IC2S2J3U_16) <- N_gender
  dim(IC3S2J3U_16) <- N_gender
  dim(IC4S2J3U_16) <- N_gender
  
  dim(IC1S2J3U_17) <- N_gender
  dim(IC2S2J3U_17) <- N_gender
  dim(IC3S2J3U_17) <- N_gender
  dim(IC4S2J3U_17) <- N_gender
  
  
  
  dim(IC1S1J4U_10) <- N_gender
  dim(IC2S1J4U_10) <- N_gender
  dim(IC3S1J4U_10) <- N_gender
  dim(IC4S1J4U_10) <- N_gender
  
  dim(IC1S1J4U_11) <- N_gender
  dim(IC2S1J4U_11) <- N_gender
  dim(IC3S1J4U_11) <- N_gender
  dim(IC4S1J4U_11) <- N_gender
  
  dim(IC1S1J4U_12) <- N_gender
  dim(IC2S1J4U_12) <- N_gender
  dim(IC3S1J4U_12) <- N_gender
  dim(IC4S1J4U_12) <- N_gender
  
  dim(IC1S1J4U_13) <- N_gender
  dim(IC2S1J4U_13) <- N_gender
  dim(IC3S1J4U_13) <- N_gender
  dim(IC4S1J4U_13) <- N_gender
  
  dim(IC1S1J4U_14) <- N_gender
  dim(IC2S1J4U_14) <- N_gender
  dim(IC3S1J4U_14) <- N_gender
  dim(IC4S1J4U_14) <- N_gender
  
  dim(IC1S1J4U_15) <- N_gender
  dim(IC2S1J4U_15) <- N_gender
  dim(IC3S1J4U_15) <- N_gender
  dim(IC4S1J4U_15) <- N_gender
  
  dim(IC1S1J4U_16) <- N_gender
  dim(IC2S1J4U_16) <- N_gender
  dim(IC3S1J4U_16) <- N_gender
  dim(IC4S1J4U_16) <- N_gender
  
  dim(IC1S1J4U_17) <- N_gender
  dim(IC2S1J4U_17) <- N_gender
  dim(IC3S1J4U_17) <- N_gender
  dim(IC4S1J4U_17) <- N_gender
  
  
  
  dim(IC1S2J4U_10) <- N_gender
  dim(IC2S2J4U_10) <- N_gender
  dim(IC3S2J4U_10) <- N_gender
  dim(IC4S2J4U_10) <- N_gender
  
  dim(IC1S2J4U_11) <- N_gender
  dim(IC2S2J4U_11) <- N_gender
  dim(IC3S2J4U_11) <- N_gender
  dim(IC4S2J4U_11) <- N_gender
  
  dim(IC1S2J4U_12) <- N_gender
  dim(IC2S2J4U_12) <- N_gender
  dim(IC3S2J4U_12) <- N_gender
  dim(IC4S2J4U_12) <- N_gender
  
  dim(IC1S2J4U_13) <- N_gender
  dim(IC2S2J4U_13) <- N_gender
  dim(IC3S2J4U_13) <- N_gender
  dim(IC4S2J4U_13) <- N_gender
  
  dim(IC1S2J4U_14) <- N_gender
  dim(IC2S2J4U_14) <- N_gender
  dim(IC3S2J4U_14) <- N_gender
  dim(IC4S2J4U_14) <- N_gender
  
  dim(IC1S2J4U_15) <- N_gender
  dim(IC2S2J4U_15) <- N_gender
  dim(IC3S2J4U_15) <- N_gender
  dim(IC4S2J4U_15) <- N_gender
  
  dim(IC1S2J4U_16) <- N_gender
  dim(IC2S2J4U_16) <- N_gender
  dim(IC3S2J4U_16) <- N_gender
  dim(IC4S2J4U_16) <- N_gender
  
  dim(IC1S2J4U_17) <- N_gender
  dim(IC2S2J4U_17) <- N_gender
  dim(IC3S2J4U_17) <- N_gender
  dim(IC4S2J4U_17) <- N_gender
  
  
  
  dim(IC1S1J5U_10) <- N_gender
  dim(IC2S1J5U_10) <- N_gender
  dim(IC3S1J5U_10) <- N_gender
  dim(IC4S1J5U_10) <- N_gender
  
  dim(IC1S1J5U_11) <- N_gender
  dim(IC2S1J5U_11) <- N_gender
  dim(IC3S1J5U_11) <- N_gender
  dim(IC4S1J5U_11) <- N_gender
  
  dim(IC1S1J5U_12) <- N_gender
  dim(IC2S1J5U_12) <- N_gender
  dim(IC3S1J5U_12) <- N_gender
  dim(IC4S1J5U_12) <- N_gender
  
  dim(IC1S1J5U_13) <- N_gender
  dim(IC2S1J5U_13) <- N_gender
  dim(IC3S1J5U_13) <- N_gender
  dim(IC4S1J5U_13) <- N_gender
  
  dim(IC1S1J5U_14) <- N_gender
  dim(IC2S1J5U_14) <- N_gender
  dim(IC3S1J5U_14) <- N_gender
  dim(IC4S1J5U_14) <- N_gender
  
  dim(IC1S1J5U_15) <- N_gender
  dim(IC2S1J5U_15) <- N_gender
  dim(IC3S1J5U_15) <- N_gender
  dim(IC4S1J5U_15) <- N_gender
  
  dim(IC1S1J5U_16) <- N_gender
  dim(IC2S1J5U_16) <- N_gender
  dim(IC3S1J5U_16) <- N_gender
  dim(IC4S1J5U_16) <- N_gender
  
  dim(IC1S1J5U_17) <- N_gender
  dim(IC2S1J5U_17) <- N_gender
  dim(IC3S1J5U_17) <- N_gender
  dim(IC4S1J5U_17) <- N_gender
  
  
  
  dim(IC1S2J5U_10) <- N_gender
  dim(IC2S2J5U_10) <- N_gender
  dim(IC3S2J5U_10) <- N_gender
  dim(IC4S2J5U_10) <- N_gender
  
  dim(IC1S2J5U_11) <- N_gender
  dim(IC2S2J5U_11) <- N_gender
  dim(IC3S2J5U_11) <- N_gender
  dim(IC4S2J5U_11) <- N_gender
  
  dim(IC1S2J5U_12) <- N_gender
  dim(IC2S2J5U_12) <- N_gender
  dim(IC3S2J5U_12) <- N_gender
  dim(IC4S2J5U_12) <- N_gender
  
  dim(IC1S2J5U_13) <- N_gender
  dim(IC2S2J5U_13) <- N_gender
  dim(IC3S2J5U_13) <- N_gender
  dim(IC4S2J5U_13) <- N_gender
  
  dim(IC1S2J5U_14) <- N_gender
  dim(IC2S2J5U_14) <- N_gender
  dim(IC3S2J5U_14) <- N_gender
  dim(IC4S2J5U_14) <- N_gender
  
  dim(IC1S2J5U_15) <- N_gender
  dim(IC2S2J5U_15) <- N_gender
  dim(IC3S2J5U_15) <- N_gender
  dim(IC4S2J5U_15) <- N_gender
  
  dim(IC1S2J5U_16) <- N_gender
  dim(IC2S2J5U_16) <- N_gender
  dim(IC3S2J5U_16) <- N_gender
  dim(IC4S2J5U_16) <- N_gender
  
  dim(IC1S2J5U_17) <- N_gender
  dim(IC2S2J5U_17) <- N_gender
  dim(IC3S2J5U_17) <- N_gender
  dim(IC4S2J5U_17) <- N_gender
 
  ##############################################################################################################################
  ##initial conditions####################################################################
  ##############################################################################################################################
  dim(IC1S1J1U_10_ini) <- N_gender
  dim(IC2S1J1U_10_ini) <- N_gender
  dim(IC3S1J1U_10_ini) <- N_gender
  dim(IC4S1J1U_10_ini) <- N_gender
  
  dim(IC1S1J1U_11_ini) <- N_gender
  dim(IC2S1J1U_11_ini) <- N_gender
  dim(IC3S1J1U_11_ini) <- N_gender
  dim(IC4S1J1U_11_ini) <- N_gender
  
  dim(IC1S1J1U_12_ini) <- N_gender
  dim(IC2S1J1U_12_ini) <- N_gender
  dim(IC3S1J1U_12_ini) <- N_gender
  dim(IC4S1J1U_12_ini) <- N_gender
  
  dim(IC1S1J1U_13_ini) <- N_gender
  dim(IC2S1J1U_13_ini) <- N_gender
  dim(IC3S1J1U_13_ini) <- N_gender
  dim(IC4S1J1U_13_ini) <- N_gender
  
  dim(IC1S1J1U_14_ini) <- N_gender
  dim(IC2S1J1U_14_ini) <- N_gender
  dim(IC3S1J1U_14_ini) <- N_gender
  dim(IC4S1J1U_14_ini) <- N_gender
  
  dim(IC1S1J1U_15_ini) <- N_gender
  dim(IC2S1J1U_15_ini) <- N_gender
  dim(IC3S1J1U_15_ini) <- N_gender
  dim(IC4S1J1U_15_ini) <- N_gender
  
  dim(IC1S1J1U_16_ini) <- N_gender
  dim(IC2S1J1U_16_ini) <- N_gender
  dim(IC3S1J1U_16_ini) <- N_gender
  dim(IC4S1J1U_16_ini) <- N_gender
  
  dim(IC1S1J1U_17_ini) <- N_gender
  dim(IC2S1J1U_17_ini) <- N_gender
  dim(IC3S1J1U_17_ini) <- N_gender
  dim(IC4S1J1U_17_ini) <- N_gender
  
  
  
  dim(IC1S2J1U_10_ini) <- N_gender
  dim(IC2S2J1U_10_ini) <- N_gender
  dim(IC3S2J1U_10_ini) <- N_gender
  dim(IC4S2J1U_10_ini) <- N_gender
  
  dim(IC1S2J1U_11_ini) <- N_gender
  dim(IC2S2J1U_11_ini) <- N_gender
  dim(IC3S2J1U_11_ini) <- N_gender
  dim(IC4S2J1U_11_ini) <- N_gender
  
  dim(IC1S2J1U_12_ini) <- N_gender
  dim(IC2S2J1U_12_ini) <- N_gender
  dim(IC3S2J1U_12_ini) <- N_gender
  dim(IC4S2J1U_12_ini) <- N_gender
  
  dim(IC1S2J1U_13_ini) <- N_gender
  dim(IC2S2J1U_13_ini) <- N_gender
  dim(IC3S2J1U_13_ini) <- N_gender
  dim(IC4S2J1U_13_ini) <- N_gender
  
  dim(IC1S2J1U_14_ini) <- N_gender
  dim(IC2S2J1U_14_ini) <- N_gender
  dim(IC3S2J1U_14_ini) <- N_gender
  dim(IC4S2J1U_14_ini) <- N_gender
  
  dim(IC1S2J1U_15_ini) <- N_gender
  dim(IC2S2J1U_15_ini) <- N_gender
  dim(IC3S2J1U_15_ini) <- N_gender
  dim(IC4S2J1U_15_ini) <- N_gender
  
  dim(IC1S2J1U_16_ini) <- N_gender
  dim(IC2S2J1U_16_ini) <- N_gender
  dim(IC3S2J1U_16_ini) <- N_gender
  dim(IC4S2J1U_16_ini) <- N_gender
  
  dim(IC1S2J1U_17_ini) <- N_gender
  dim(IC2S2J1U_17_ini) <- N_gender
  dim(IC3S2J1U_17_ini) <- N_gender
  dim(IC4S2J1U_17_ini) <- N_gender
  
  
  
  dim(IC1S1J2U_10_ini) <- N_gender
  dim(IC2S1J2U_10_ini) <- N_gender
  dim(IC3S1J2U_10_ini) <- N_gender
  dim(IC4S1J2U_10_ini) <- N_gender
  
  dim(IC1S1J2U_11_ini) <- N_gender
  dim(IC2S1J2U_11_ini) <- N_gender
  dim(IC3S1J2U_11_ini) <- N_gender
  dim(IC4S1J2U_11_ini) <- N_gender
  
  dim(IC1S1J2U_12_ini) <- N_gender
  dim(IC2S1J2U_12_ini) <- N_gender
  dim(IC3S1J2U_12_ini) <- N_gender
  dim(IC4S1J2U_12_ini) <- N_gender
  
  dim(IC1S1J2U_13_ini) <- N_gender
  dim(IC2S1J2U_13_ini) <- N_gender
  dim(IC3S1J2U_13_ini) <- N_gender
  dim(IC4S1J2U_13_ini) <- N_gender
  
  dim(IC1S1J2U_14_ini) <- N_gender
  dim(IC2S1J2U_14_ini) <- N_gender
  dim(IC3S1J2U_14_ini) <- N_gender
  dim(IC4S1J2U_14_ini) <- N_gender
  
  dim(IC1S1J2U_15_ini) <- N_gender
  dim(IC2S1J2U_15_ini) <- N_gender
  dim(IC3S1J2U_15_ini) <- N_gender
  dim(IC4S1J2U_15_ini) <- N_gender
  
  dim(IC1S1J2U_16_ini) <- N_gender
  dim(IC2S1J2U_16_ini) <- N_gender
  dim(IC3S1J2U_16_ini) <- N_gender
  dim(IC4S1J2U_16_ini) <- N_gender
  
  dim(IC1S1J2U_17_ini) <- N_gender
  dim(IC2S1J2U_17_ini) <- N_gender
  dim(IC3S1J2U_17_ini) <- N_gender
  dim(IC4S1J2U_17_ini) <- N_gender
  
  
  
  dim(IC1S2J2U_10_ini) <- N_gender
  dim(IC2S2J2U_10_ini) <- N_gender
  dim(IC3S2J2U_10_ini) <- N_gender
  dim(IC4S2J2U_10_ini) <- N_gender
  
  dim(IC1S2J2U_11_ini) <- N_gender
  dim(IC2S2J2U_11_ini) <- N_gender
  dim(IC3S2J2U_11_ini) <- N_gender
  dim(IC4S2J2U_11_ini) <- N_gender
  
  dim(IC1S2J2U_12_ini) <- N_gender
  dim(IC2S2J2U_12_ini) <- N_gender
  dim(IC3S2J2U_12_ini) <- N_gender
  dim(IC4S2J2U_12_ini) <- N_gender
  
  dim(IC1S2J2U_13_ini) <- N_gender
  dim(IC2S2J2U_13_ini) <- N_gender
  dim(IC3S2J2U_13_ini) <- N_gender
  dim(IC4S2J2U_13_ini) <- N_gender
  
  dim(IC1S2J2U_14_ini) <- N_gender
  dim(IC2S2J2U_14_ini) <- N_gender
  dim(IC3S2J2U_14_ini) <- N_gender
  dim(IC4S2J2U_14_ini) <- N_gender
  
  dim(IC1S2J2U_15_ini) <- N_gender
  dim(IC2S2J2U_15_ini) <- N_gender
  dim(IC3S2J2U_15_ini) <- N_gender
  dim(IC4S2J2U_15_ini) <- N_gender
  
  dim(IC1S2J2U_16_ini) <- N_gender
  dim(IC2S2J2U_16_ini) <- N_gender
  dim(IC3S2J2U_16_ini) <- N_gender
  dim(IC4S2J2U_16_ini) <- N_gender
  
  dim(IC1S2J2U_17_ini) <- N_gender
  dim(IC2S2J2U_17_ini) <- N_gender
  dim(IC3S2J2U_17_ini) <- N_gender
  dim(IC4S2J2U_17_ini) <- N_gender
  
  
  
  dim(IC1S1J3U_10_ini) <- N_gender
  dim(IC2S1J3U_10_ini) <- N_gender
  dim(IC3S1J3U_10_ini) <- N_gender
  dim(IC4S1J3U_10_ini) <- N_gender
  
  dim(IC1S1J3U_11_ini) <- N_gender
  dim(IC2S1J3U_11_ini) <- N_gender
  dim(IC3S1J3U_11_ini) <- N_gender
  dim(IC4S1J3U_11_ini) <- N_gender
  
  dim(IC1S1J3U_12_ini) <- N_gender
  dim(IC2S1J3U_12_ini) <- N_gender
  dim(IC3S1J3U_12_ini) <- N_gender
  dim(IC4S1J3U_12_ini) <- N_gender
  
  dim(IC1S1J3U_13_ini) <- N_gender
  dim(IC2S1J3U_13_ini) <- N_gender
  dim(IC3S1J3U_13_ini) <- N_gender
  dim(IC4S1J3U_13_ini) <- N_gender
  
  dim(IC1S1J3U_14_ini) <- N_gender
  dim(IC2S1J3U_14_ini) <- N_gender
  dim(IC3S1J3U_14_ini) <- N_gender
  dim(IC4S1J3U_14_ini) <- N_gender
  
  dim(IC1S1J3U_15_ini) <- N_gender
  dim(IC2S1J3U_15_ini) <- N_gender
  dim(IC3S1J3U_15_ini) <- N_gender
  dim(IC4S1J3U_15_ini) <- N_gender
  
  dim(IC1S1J3U_16_ini) <- N_gender
  dim(IC2S1J3U_16_ini) <- N_gender
  dim(IC3S1J3U_16_ini) <- N_gender
  dim(IC4S1J3U_16_ini) <- N_gender
  
  dim(IC1S1J3U_17_ini) <- N_gender
  dim(IC2S1J3U_17_ini) <- N_gender
  dim(IC3S1J3U_17_ini) <- N_gender
  dim(IC4S1J3U_17_ini) <- N_gender
  
  
  
  dim(IC1S2J3U_10_ini) <- N_gender
  dim(IC2S2J3U_10_ini) <- N_gender
  dim(IC3S2J3U_10_ini) <- N_gender
  dim(IC4S2J3U_10_ini) <- N_gender
  
  dim(IC1S2J3U_11_ini) <- N_gender
  dim(IC2S2J3U_11_ini) <- N_gender
  dim(IC3S2J3U_11_ini) <- N_gender
  dim(IC4S2J3U_11_ini) <- N_gender
  
  dim(IC1S2J3U_12_ini) <- N_gender
  dim(IC2S2J3U_12_ini) <- N_gender
  dim(IC3S2J3U_12_ini) <- N_gender
  dim(IC4S2J3U_12_ini) <- N_gender
  
  dim(IC1S2J3U_13_ini) <- N_gender
  dim(IC2S2J3U_13_ini) <- N_gender
  dim(IC3S2J3U_13_ini) <- N_gender
  dim(IC4S2J3U_13_ini) <- N_gender
  
  dim(IC1S2J3U_14_ini) <- N_gender
  dim(IC2S2J3U_14_ini) <- N_gender
  dim(IC3S2J3U_14_ini) <- N_gender
  dim(IC4S2J3U_14_ini) <- N_gender
  
  dim(IC1S2J3U_15_ini) <- N_gender
  dim(IC2S2J3U_15_ini) <- N_gender
  dim(IC3S2J3U_15_ini) <- N_gender
  dim(IC4S2J3U_15_ini) <- N_gender
  
  dim(IC1S2J3U_16_ini) <- N_gender
  dim(IC2S2J3U_16_ini) <- N_gender
  dim(IC3S2J3U_16_ini) <- N_gender
  dim(IC4S2J3U_16_ini) <- N_gender
  
  dim(IC1S2J3U_17_ini) <- N_gender
  dim(IC2S2J3U_17_ini) <- N_gender
  dim(IC3S2J3U_17_ini) <- N_gender
  dim(IC4S2J3U_17_ini) <- N_gender
  
  
  
  dim(IC1S1J4U_10_ini) <- N_gender
  dim(IC2S1J4U_10_ini) <- N_gender
  dim(IC3S1J4U_10_ini) <- N_gender
  dim(IC4S1J4U_10_ini) <- N_gender
  
  dim(IC1S1J4U_11_ini) <- N_gender
  dim(IC2S1J4U_11_ini) <- N_gender
  dim(IC3S1J4U_11_ini) <- N_gender
  dim(IC4S1J4U_11_ini) <- N_gender
  
  dim(IC1S1J4U_12_ini) <- N_gender
  dim(IC2S1J4U_12_ini) <- N_gender
  dim(IC3S1J4U_12_ini) <- N_gender
  dim(IC4S1J4U_12_ini) <- N_gender
  
  dim(IC1S1J4U_13_ini) <- N_gender
  dim(IC2S1J4U_13_ini) <- N_gender
  dim(IC3S1J4U_13_ini) <- N_gender
  dim(IC4S1J4U_13_ini) <- N_gender
  
  dim(IC1S1J4U_14_ini) <- N_gender
  dim(IC2S1J4U_14_ini) <- N_gender
  dim(IC3S1J4U_14_ini) <- N_gender
  dim(IC4S1J4U_14_ini) <- N_gender
  
  dim(IC1S1J4U_15_ini) <- N_gender
  dim(IC2S1J4U_15_ini) <- N_gender
  dim(IC3S1J4U_15_ini) <- N_gender
  dim(IC4S1J4U_15_ini) <- N_gender
  
  dim(IC1S1J4U_16_ini) <- N_gender
  dim(IC2S1J4U_16_ini) <- N_gender
  dim(IC3S1J4U_16_ini) <- N_gender
  dim(IC4S1J4U_16_ini) <- N_gender
  
  dim(IC1S1J4U_17_ini) <- N_gender
  dim(IC2S1J4U_17_ini) <- N_gender
  dim(IC3S1J4U_17_ini) <- N_gender
  dim(IC4S1J4U_17_ini) <- N_gender
  
  
  
  dim(IC1S2J4U_10_ini) <- N_gender
  dim(IC2S2J4U_10_ini) <- N_gender
  dim(IC3S2J4U_10_ini) <- N_gender
  dim(IC4S2J4U_10_ini) <- N_gender
  
  dim(IC1S2J4U_11_ini) <- N_gender
  dim(IC2S2J4U_11_ini) <- N_gender
  dim(IC3S2J4U_11_ini) <- N_gender
  dim(IC4S2J4U_11_ini) <- N_gender
  
  dim(IC1S2J4U_12_ini) <- N_gender
  dim(IC2S2J4U_12_ini) <- N_gender
  dim(IC3S2J4U_12_ini) <- N_gender
  dim(IC4S2J4U_12_ini) <- N_gender
  
  dim(IC1S2J4U_13_ini) <- N_gender
  dim(IC2S2J4U_13_ini) <- N_gender
  dim(IC3S2J4U_13_ini) <- N_gender
  dim(IC4S2J4U_13_ini) <- N_gender
  
  dim(IC1S2J4U_14_ini) <- N_gender
  dim(IC2S2J4U_14_ini) <- N_gender
  dim(IC3S2J4U_14_ini) <- N_gender
  dim(IC4S2J4U_14_ini) <- N_gender
  
  dim(IC1S2J4U_15_ini) <- N_gender
  dim(IC2S2J4U_15_ini) <- N_gender
  dim(IC3S2J4U_15_ini) <- N_gender
  dim(IC4S2J4U_15_ini) <- N_gender
  
  dim(IC1S2J4U_16_ini) <- N_gender
  dim(IC2S2J4U_16_ini) <- N_gender
  dim(IC3S2J4U_16_ini) <- N_gender
  dim(IC4S2J4U_16_ini) <- N_gender
  
  dim(IC1S2J4U_17_ini) <- N_gender
  dim(IC2S2J4U_17_ini) <- N_gender
  dim(IC3S2J4U_17_ini) <- N_gender
  dim(IC4S2J4U_17_ini) <- N_gender
  
  
  
  dim(IC1S1J5U_10_ini) <- N_gender
  dim(IC2S1J5U_10_ini) <- N_gender
  dim(IC3S1J5U_10_ini) <- N_gender
  dim(IC4S1J5U_10_ini) <- N_gender
  
  dim(IC1S1J5U_11_ini) <- N_gender
  dim(IC2S1J5U_11_ini) <- N_gender
  dim(IC3S1J5U_11_ini) <- N_gender
  dim(IC4S1J5U_11_ini) <- N_gender
  
  dim(IC1S1J5U_12_ini) <- N_gender
  dim(IC2S1J5U_12_ini) <- N_gender
  dim(IC3S1J5U_12_ini) <- N_gender
  dim(IC4S1J5U_12_ini) <- N_gender
  
  dim(IC1S1J5U_13_ini) <- N_gender
  dim(IC2S1J5U_13_ini) <- N_gender
  dim(IC3S1J5U_13_ini) <- N_gender
  dim(IC4S1J5U_13_ini) <- N_gender
  
  dim(IC1S1J5U_14_ini) <- N_gender
  dim(IC2S1J5U_14_ini) <- N_gender
  dim(IC3S1J5U_14_ini) <- N_gender
  dim(IC4S1J5U_14_ini) <- N_gender
  
  dim(IC1S1J5U_15_ini) <- N_gender
  dim(IC2S1J5U_15_ini) <- N_gender
  dim(IC3S1J5U_15_ini) <- N_gender
  dim(IC4S1J5U_15_ini) <- N_gender
  
  dim(IC1S1J5U_16_ini) <- N_gender
  dim(IC2S1J5U_16_ini) <- N_gender
  dim(IC3S1J5U_16_ini) <- N_gender
  dim(IC4S1J5U_16_ini) <- N_gender
  
  dim(IC1S1J5U_17_ini) <- N_gender
  dim(IC2S1J5U_17_ini) <- N_gender
  dim(IC3S1J5U_17_ini) <- N_gender
  dim(IC4S1J5U_17_ini) <- N_gender
  
  
  
  dim(IC1S2J5U_10_ini) <- N_gender
  dim(IC2S2J5U_10_ini) <- N_gender
  dim(IC3S2J5U_10_ini) <- N_gender
  dim(IC4S2J5U_10_ini) <- N_gender
  
  dim(IC1S2J5U_11_ini) <- N_gender
  dim(IC2S2J5U_11_ini) <- N_gender
  dim(IC3S2J5U_11_ini) <- N_gender
  dim(IC4S2J5U_11_ini) <- N_gender
  
  dim(IC1S2J5U_12_ini) <- N_gender
  dim(IC2S2J5U_12_ini) <- N_gender
  dim(IC3S2J5U_12_ini) <- N_gender
  dim(IC4S2J5U_12_ini) <- N_gender
  
  dim(IC1S2J5U_13_ini) <- N_gender
  dim(IC2S2J5U_13_ini) <- N_gender
  dim(IC3S2J5U_13_ini) <- N_gender
  dim(IC4S2J5U_13_ini) <- N_gender
  
  dim(IC1S2J5U_14_ini) <- N_gender
  dim(IC2S2J5U_14_ini) <- N_gender
  dim(IC3S2J5U_14_ini) <- N_gender
  dim(IC4S2J5U_14_ini) <- N_gender
  
  dim(IC1S2J5U_15_ini) <- N_gender
  dim(IC2S2J5U_15_ini) <- N_gender
  dim(IC3S2J5U_15_ini) <- N_gender
  dim(IC4S2J5U_15_ini) <- N_gender
  
  dim(IC1S2J5U_16_ini) <- N_gender
  dim(IC2S2J5U_16_ini) <- N_gender
  dim(IC3S2J5U_16_ini) <- N_gender
  dim(IC4S2J5U_16_ini) <- N_gender
  
  dim(IC1S2J5U_17_ini) <- N_gender
  dim(IC2S2J5U_17_ini) <- N_gender
  dim(IC3S2J5U_17_ini) <- N_gender
  dim(IC4S2J5U_17_ini) <- N_gender
  

  
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
  
  
  dim(t10_ic1s1j1u) <- N_gender
  dim(t10_ic2s1j1u) <- N_gender
  dim(t10_ic3s1j1u) <- N_gender
  dim(t10_ic4s1j1u) <- N_gender
  
  dim(t10_ic1s2j1u) <- N_gender
  dim(t10_ic2s2j1u) <- N_gender
  dim(t10_ic3s2j1u) <- N_gender
  dim(t10_ic4s2j1u) <- N_gender
  
  dim(t10_ic1s1j2u) <- N_gender
  dim(t10_ic2s1j2u) <- N_gender
  dim(t10_ic3s1j2u) <- N_gender
  dim(t10_ic4s1j2u) <- N_gender
  
  dim(t10_ic1s2j2u) <- N_gender
  dim(t10_ic2s2j2u) <- N_gender
  dim(t10_ic3s2j2u) <- N_gender
  dim(t10_ic4s2j2u) <- N_gender
  
  dim(t10_ic1s1j3u) <- N_gender
  dim(t10_ic2s1j3u) <- N_gender
  dim(t10_ic3s1j3u) <- N_gender
  dim(t10_ic4s1j3u) <- N_gender
  
  dim(t10_ic1s2j3u) <- N_gender
  dim(t10_ic2s2j3u) <- N_gender
  dim(t10_ic3s2j3u) <- N_gender
  dim(t10_ic4s2j3u) <- N_gender
  
  dim(t10_ic1s1j4u) <- N_gender
  dim(t10_ic2s1j4u) <- N_gender
  dim(t10_ic3s1j4u) <- N_gender
  dim(t10_ic4s1j4u) <- N_gender
  
  dim(t10_ic1s2j4u) <- N_gender
  dim(t10_ic2s2j4u) <- N_gender
  dim(t10_ic3s2j4u) <- N_gender
  dim(t10_ic4s2j4u) <- N_gender
  
  dim(t10_ic1s1j5u) <- N_gender
  dim(t10_ic2s1j5u) <- N_gender
  dim(t10_ic3s1j5u) <- N_gender
  dim(t10_ic4s1j5u) <- N_gender
  
  dim(t10_ic1s2j5u) <- N_gender
  dim(t10_ic2s2j5u) <- N_gender
  dim(t10_ic3s2j5u) <- N_gender
  dim(t10_ic4s2j5u) <- N_gender
  
  dim(t10_ec1s1j1u) <- N_gender
  dim(t10_ec2s1j1u) <- N_gender
  dim(t10_ec3s1j1u) <- N_gender
  dim(t10_ec4s1j1u) <- N_gender
  
  dim(t10_ec1s2j1u) <- N_gender
  dim(t10_ec2s2j1u) <- N_gender
  dim(t10_ec3s2j1u) <- N_gender
  dim(t10_ec4s2j1u) <- N_gender
  
  dim(t10_ec1s1j2u) <- N_gender
  dim(t10_ec2s1j2u) <- N_gender
  dim(t10_ec3s1j2u) <- N_gender
  dim(t10_ec4s1j2u) <- N_gender
  
  dim(t10_ec1s2j2u) <- N_gender
  dim(t10_ec2s2j2u) <- N_gender
  dim(t10_ec3s2j2u) <- N_gender
  dim(t10_ec4s2j2u) <- N_gender
  
  dim(t10_ec1s1j3u) <- N_gender
  dim(t10_ec2s1j3u) <- N_gender
  dim(t10_ec3s1j3u) <- N_gender
  dim(t10_ec4s1j3u) <- N_gender
  
  dim(t10_ec1s2j3u) <- N_gender
  dim(t10_ec2s2j3u) <- N_gender
  dim(t10_ec3s2j3u) <- N_gender
  dim(t10_ec4s2j3u) <- N_gender
  
  dim(t10_ec1s1j4u) <- N_gender
  dim(t10_ec2s1j4u) <- N_gender
  dim(t10_ec3s1j4u) <- N_gender
  dim(t10_ec4s1j4u) <- N_gender
  
  dim(t10_ec1s2j4u) <- N_gender
  dim(t10_ec2s2j4u) <- N_gender
  dim(t10_ec3s2j4u) <- N_gender
  dim(t10_ec4s2j4u) <- N_gender
  
  dim(t10_ec1s1j5u) <- N_gender
  dim(t10_ec2s1j5u) <- N_gender
  dim(t10_ec3s1j5u) <- N_gender
  dim(t10_ec4s1j5u) <- N_gender
  
  dim(t10_ec1s2j5u) <- N_gender
  dim(t10_ec2s2j5u) <- N_gender
  dim(t10_ec3s2j5u) <- N_gender
  dim(t10_ec4s2j5u) <- N_gender
  
  dim(neet16_ic1s1j1u) <- N_gender
  dim(neet16_ic2s1j1u) <- N_gender
  dim(neet16_ic3s1j1u) <- N_gender
  dim(neet16_ic4s1j1u) <- N_gender
  
  dim(neet16_ic1s2j1u) <- N_gender
  dim(neet16_ic2s2j1u) <- N_gender
  dim(neet16_ic3s2j1u) <- N_gender
  dim(neet16_ic4s2j1u) <- N_gender
  
  dim(neet16_ic1s1j2u) <- N_gender
  dim(neet16_ic2s1j2u) <- N_gender
  dim(neet16_ic3s1j2u) <- N_gender
  dim(neet16_ic4s1j2u) <- N_gender
  
  dim(neet16_ic1s2j2u) <- N_gender
  dim(neet16_ic2s2j2u) <- N_gender
  dim(neet16_ic3s2j2u) <- N_gender
  dim(neet16_ic4s2j2u) <- N_gender
  
  dim(neet16_ic1s1j3u) <- N_gender
  dim(neet16_ic2s1j3u) <- N_gender
  dim(neet16_ic3s1j3u) <- N_gender
  dim(neet16_ic4s1j3u) <- N_gender
  
  dim(neet16_ic1s2j3u) <- N_gender
  dim(neet16_ic2s2j3u) <- N_gender
  dim(neet16_ic3s2j3u) <- N_gender
  dim(neet16_ic4s2j3u) <- N_gender
  
  dim(neet16_ic1s1j4u) <- N_gender
  dim(neet16_ic2s1j4u) <- N_gender
  dim(neet16_ic3s1j4u) <- N_gender
  dim(neet16_ic4s1j4u) <- N_gender
  
  dim(neet16_ic1s2j4u) <- N_gender
  dim(neet16_ic2s2j4u) <- N_gender
  dim(neet16_ic3s2j4u) <- N_gender
  dim(neet16_ic4s2j4u) <- N_gender
  
  dim(neet16_ic1s1j5u) <- N_gender
  dim(neet16_ic2s1j5u) <- N_gender
  dim(neet16_ic3s1j5u) <- N_gender
  dim(neet16_ic4s1j5u) <- N_gender
  
  dim(neet16_ic1s2j5u) <- N_gender
  dim(neet16_ic2s2j5u) <- N_gender
  dim(neet16_ic3s2j5u) <- N_gender
  dim(neet16_ic4s2j5u) <- N_gender
  
  dim(neet16_ec1s1j1u) <- N_gender
  dim(neet16_ec2s1j1u) <- N_gender
  dim(neet16_ec3s1j1u) <- N_gender
  dim(neet16_ec4s1j1u) <- N_gender
  
  dim(neet16_ec1s2j1u) <- N_gender
  dim(neet16_ec2s2j1u) <- N_gender
  dim(neet16_ec3s2j1u) <- N_gender
  dim(neet16_ec4s2j1u) <- N_gender
  
  dim(neet16_ec1s1j2u) <- N_gender
  dim(neet16_ec2s1j2u) <- N_gender
  dim(neet16_ec3s1j2u) <- N_gender
  dim(neet16_ec4s1j2u) <- N_gender
  
  dim(neet16_ec1s2j2u) <- N_gender
  dim(neet16_ec2s2j2u) <- N_gender
  dim(neet16_ec3s2j2u) <- N_gender
  dim(neet16_ec4s2j2u) <- N_gender
  
  dim(neet16_ec1s1j3u) <- N_gender
  dim(neet16_ec2s1j3u) <- N_gender
  dim(neet16_ec3s1j3u) <- N_gender
  dim(neet16_ec4s1j3u) <- N_gender
  
  dim(neet16_ec1s2j3u) <- N_gender
  dim(neet16_ec2s2j3u) <- N_gender
  dim(neet16_ec3s2j3u) <- N_gender
  dim(neet16_ec4s2j3u) <- N_gender
  
  dim(neet16_ec1s1j4u) <- N_gender
  dim(neet16_ec2s1j4u) <- N_gender
  dim(neet16_ec3s1j4u) <- N_gender
  dim(neet16_ec4s1j4u) <- N_gender
  
  dim(neet16_ec1s2j4u) <- N_gender
  dim(neet16_ec2s2j4u) <- N_gender
  dim(neet16_ec3s2j4u) <- N_gender
  dim(neet16_ec4s2j4u) <- N_gender
  
  dim(neet16_ec1s1j5u) <- N_gender
  dim(neet16_ec2s1j5u) <- N_gender
  dim(neet16_ec3s1j5u) <- N_gender
  dim(neet16_ec4s1j5u) <- N_gender
  
  dim(neet16_ec1s2j5u) <- N_gender
  dim(neet16_ec2s2j5u) <- N_gender
  dim(neet16_ec3s2j5u) <- N_gender
  dim(neet16_ec4s2j5u) <- N_gender
  
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
  
  dim(np2nc_ic1s1u_10) <- N_gender
  dim(np2nc_ic2s1u_10) <- N_gender
  dim(np2nc_ic3s1u_10) <- N_gender
  dim(np2nc_ic4s1u_10) <- N_gender
  
  dim(np2nc_ic1s1u_11) <- N_gender
  dim(np2nc_ic2s1u_11) <- N_gender
  dim(np2nc_ic3s1u_11) <- N_gender
  dim(np2nc_ic4s1u_11) <- N_gender
  
  dim(np2nc_ic1s1u_12) <- N_gender
  dim(np2nc_ic2s1u_12) <- N_gender
  dim(np2nc_ic3s1u_12) <- N_gender
  dim(np2nc_ic4s1u_12) <- N_gender
  
  dim(np2nc_ic1s1u_13) <- N_gender
  dim(np2nc_ic2s1u_13) <- N_gender
  dim(np2nc_ic3s1u_13) <- N_gender
  dim(np2nc_ic4s1u_13) <- N_gender
  
  dim(np2nc_ic1s1u_14) <- N_gender
  dim(np2nc_ic2s1u_14) <- N_gender
  dim(np2nc_ic3s1u_14) <- N_gender
  dim(np2nc_ic4s1u_14) <- N_gender
  
  dim(np2nc_ic1s1u_15) <- N_gender
  dim(np2nc_ic2s1u_15) <- N_gender
  dim(np2nc_ic3s1u_15) <- N_gender
  dim(np2nc_ic4s1u_15) <- N_gender
  
  dim(np2nc_ic1s1u_16) <- N_gender
  dim(np2nc_ic2s1u_16) <- N_gender
  dim(np2nc_ic3s1u_16) <- N_gender
  dim(np2nc_ic4s1u_16) <- N_gender
  
  dim(np2nc_ic1s1u_17) <- N_gender
  dim(np2nc_ic2s1u_17) <- N_gender
  dim(np2nc_ic3s1u_17) <- N_gender
  dim(np2nc_ic4s1u_17) <- N_gender
  
  
  
  dim(np2nc_ic1s2u_10) <- N_gender
  dim(np2nc_ic2s2u_10) <- N_gender
  dim(np2nc_ic3s2u_10) <- N_gender
  dim(np2nc_ic4s2u_10) <- N_gender
  
  dim(np2nc_ic1s2u_11) <- N_gender
  dim(np2nc_ic2s2u_11) <- N_gender
  dim(np2nc_ic3s2u_11) <- N_gender
  dim(np2nc_ic4s2u_11) <- N_gender
  
  dim(np2nc_ic1s2u_12) <- N_gender
  dim(np2nc_ic2s2u_12) <- N_gender
  dim(np2nc_ic3s2u_12) <- N_gender
  dim(np2nc_ic4s2u_12) <- N_gender
  
  dim(np2nc_ic1s2u_13) <- N_gender
  dim(np2nc_ic2s2u_13) <- N_gender
  dim(np2nc_ic3s2u_13) <- N_gender
  dim(np2nc_ic4s2u_13) <- N_gender
  
  dim(np2nc_ic1s2u_14) <- N_gender
  dim(np2nc_ic2s2u_14) <- N_gender
  dim(np2nc_ic3s2u_14) <- N_gender
  dim(np2nc_ic4s2u_14) <- N_gender
  
  dim(np2nc_ic1s2u_15) <- N_gender
  dim(np2nc_ic2s2u_15) <- N_gender
  dim(np2nc_ic3s2u_15) <- N_gender
  dim(np2nc_ic4s2u_15) <- N_gender
  
  dim(np2nc_ic1s2u_16) <- N_gender
  dim(np2nc_ic2s2u_16) <- N_gender
  dim(np2nc_ic3s2u_16) <- N_gender
  dim(np2nc_ic4s2u_16) <- N_gender
  
  dim(np2nc_ic1s2u_17) <- N_gender
  dim(np2nc_ic2s2u_17) <- N_gender
  dim(np2nc_ic3s2u_17) <- N_gender
  dim(np2nc_ic4s2u_17) <- N_gender
  
  dim(np2nc_ec1s1u_10) <- N_gender
  dim(np2nc_ec2s1u_10) <- N_gender
  dim(np2nc_ec3s1u_10) <- N_gender
  dim(np2nc_ec4s1u_10) <- N_gender
  
  dim(np2nc_ec1s1u_11) <- N_gender
  dim(np2nc_ec2s1u_11) <- N_gender
  dim(np2nc_ec3s1u_11) <- N_gender
  dim(np2nc_ec4s1u_11) <- N_gender
  
  dim(np2nc_ec1s1u_12) <- N_gender
  dim(np2nc_ec2s1u_12) <- N_gender
  dim(np2nc_ec3s1u_12) <- N_gender
  dim(np2nc_ec4s1u_12) <- N_gender
  
  dim(np2nc_ec1s1u_13) <- N_gender
  dim(np2nc_ec2s1u_13) <- N_gender
  dim(np2nc_ec3s1u_13) <- N_gender
  dim(np2nc_ec4s1u_13) <- N_gender
  
  dim(np2nc_ec1s1u_14) <- N_gender
  dim(np2nc_ec2s1u_14) <- N_gender
  dim(np2nc_ec3s1u_14) <- N_gender
  dim(np2nc_ec4s1u_14) <- N_gender
  
  dim(np2nc_ec1s1u_15) <- N_gender
  dim(np2nc_ec2s1u_15) <- N_gender
  dim(np2nc_ec3s1u_15) <- N_gender
  dim(np2nc_ec4s1u_15) <- N_gender
  
  dim(np2nc_ec1s1u_16) <- N_gender
  dim(np2nc_ec2s1u_16) <- N_gender
  dim(np2nc_ec3s1u_16) <- N_gender
  dim(np2nc_ec4s1u_16) <- N_gender
  
  dim(np2nc_ec1s1u_17) <- N_gender
  dim(np2nc_ec2s1u_17) <- N_gender
  dim(np2nc_ec3s1u_17) <- N_gender
  dim(np2nc_ec4s1u_17) <- N_gender
  
  
  
  dim(np2nc_ec1s2u_10) <- N_gender
  dim(np2nc_ec2s2u_10) <- N_gender
  dim(np2nc_ec3s2u_10) <- N_gender
  dim(np2nc_ec4s2u_10) <- N_gender
  
  dim(np2nc_ec1s2u_11) <- N_gender
  dim(np2nc_ec2s2u_11) <- N_gender
  dim(np2nc_ec3s2u_11) <- N_gender
  dim(np2nc_ec4s2u_11) <- N_gender
  
  dim(np2nc_ec1s2u_12) <- N_gender
  dim(np2nc_ec2s2u_12) <- N_gender
  dim(np2nc_ec3s2u_12) <- N_gender
  dim(np2nc_ec4s2u_12) <- N_gender
  
  dim(np2nc_ec1s2u_13) <- N_gender
  dim(np2nc_ec2s2u_13) <- N_gender
  dim(np2nc_ec3s2u_13) <- N_gender
  dim(np2nc_ec4s2u_13) <- N_gender
  
  dim(np2nc_ec1s2u_14) <- N_gender
  dim(np2nc_ec2s2u_14) <- N_gender
  dim(np2nc_ec3s2u_14) <- N_gender
  dim(np2nc_ec4s2u_14) <- N_gender
  
  dim(np2nc_ec1s2u_15) <- N_gender
  dim(np2nc_ec2s2u_15) <- N_gender
  dim(np2nc_ec3s2u_15) <- N_gender
  dim(np2nc_ec4s2u_15) <- N_gender
  
  dim(np2nc_ec1s2u_16) <- N_gender
  dim(np2nc_ec2s2u_16) <- N_gender
  dim(np2nc_ec3s2u_16) <- N_gender
  dim(np2nc_ec4s2u_16) <- N_gender
  
  dim(np2nc_ec1s2u_17) <- N_gender
  dim(np2nc_ec2s2u_17) <- N_gender
  dim(np2nc_ec3s2u_17) <- N_gender
  dim(np2nc_ec4s2u_17) <- N_gender
  
  
  dim(np2charge_ic1s1u_10) <- N_gender
  dim(np2charge_ic2s1u_10) <- N_gender
  dim(np2charge_ic3s1u_10) <- N_gender
  dim(np2charge_ic4s1u_10) <- N_gender
  
  dim(np2charge_ic1s1u_11) <- N_gender
  dim(np2charge_ic2s1u_11) <- N_gender
  dim(np2charge_ic3s1u_11) <- N_gender
  dim(np2charge_ic4s1u_11) <- N_gender
  
  dim(np2charge_ic1s1u_12) <- N_gender
  dim(np2charge_ic2s1u_12) <- N_gender
  dim(np2charge_ic3s1u_12) <- N_gender
  dim(np2charge_ic4s1u_12) <- N_gender
  
  dim(np2charge_ic1s1u_13) <- N_gender
  dim(np2charge_ic2s1u_13) <- N_gender
  dim(np2charge_ic3s1u_13) <- N_gender
  dim(np2charge_ic4s1u_13) <- N_gender
  
  dim(np2charge_ic1s1u_14) <- N_gender
  dim(np2charge_ic2s1u_14) <- N_gender
  dim(np2charge_ic3s1u_14) <- N_gender
  dim(np2charge_ic4s1u_14) <- N_gender
  
  dim(np2charge_ic1s1u_15) <- N_gender
  dim(np2charge_ic2s1u_15) <- N_gender
  dim(np2charge_ic3s1u_15) <- N_gender
  dim(np2charge_ic4s1u_15) <- N_gender
  
  dim(np2charge_ic1s1u_16) <- N_gender
  dim(np2charge_ic2s1u_16) <- N_gender
  dim(np2charge_ic3s1u_16) <- N_gender
  dim(np2charge_ic4s1u_16) <- N_gender
  
  dim(np2charge_ic1s1u_17) <- N_gender
  dim(np2charge_ic2s1u_17) <- N_gender
  dim(np2charge_ic3s1u_17) <- N_gender
  dim(np2charge_ic4s1u_17) <- N_gender
  
  
  
  dim(np2charge_ic1s2u_10) <- N_gender
  dim(np2charge_ic2s2u_10) <- N_gender
  dim(np2charge_ic3s2u_10) <- N_gender
  dim(np2charge_ic4s2u_10) <- N_gender
  
  dim(np2charge_ic1s2u_11) <- N_gender
  dim(np2charge_ic2s2u_11) <- N_gender
  dim(np2charge_ic3s2u_11) <- N_gender
  dim(np2charge_ic4s2u_11) <- N_gender
  
  dim(np2charge_ic1s2u_12) <- N_gender
  dim(np2charge_ic2s2u_12) <- N_gender
  dim(np2charge_ic3s2u_12) <- N_gender
  dim(np2charge_ic4s2u_12) <- N_gender
  
  dim(np2charge_ic1s2u_13) <- N_gender
  dim(np2charge_ic2s2u_13) <- N_gender
  dim(np2charge_ic3s2u_13) <- N_gender
  dim(np2charge_ic4s2u_13) <- N_gender
  
  dim(np2charge_ic1s2u_14) <- N_gender
  dim(np2charge_ic2s2u_14) <- N_gender
  dim(np2charge_ic3s2u_14) <- N_gender
  dim(np2charge_ic4s2u_14) <- N_gender
  
  dim(np2charge_ic1s2u_15) <- N_gender
  dim(np2charge_ic2s2u_15) <- N_gender
  dim(np2charge_ic3s2u_15) <- N_gender
  dim(np2charge_ic4s2u_15) <- N_gender
  
  dim(np2charge_ic1s2u_16) <- N_gender
  dim(np2charge_ic2s2u_16) <- N_gender
  dim(np2charge_ic3s2u_16) <- N_gender
  dim(np2charge_ic4s2u_16) <- N_gender
  
  dim(np2charge_ic1s2u_17) <- N_gender
  dim(np2charge_ic2s2u_17) <- N_gender
  dim(np2charge_ic3s2u_17) <- N_gender
  dim(np2charge_ic4s2u_17) <- N_gender
  
  dim(np2charge_ec1s1u_10) <- N_gender
  dim(np2charge_ec2s1u_10) <- N_gender
  dim(np2charge_ec3s1u_10) <- N_gender
  dim(np2charge_ec4s1u_10) <- N_gender
  
  dim(np2charge_ec1s1u_11) <- N_gender
  dim(np2charge_ec2s1u_11) <- N_gender
  dim(np2charge_ec3s1u_11) <- N_gender
  dim(np2charge_ec4s1u_11) <- N_gender
  
  dim(np2charge_ec1s1u_12) <- N_gender
  dim(np2charge_ec2s1u_12) <- N_gender
  dim(np2charge_ec3s1u_12) <- N_gender
  dim(np2charge_ec4s1u_12) <- N_gender
  
  dim(np2charge_ec1s1u_13) <- N_gender
  dim(np2charge_ec2s1u_13) <- N_gender
  dim(np2charge_ec3s1u_13) <- N_gender
  dim(np2charge_ec4s1u_13) <- N_gender
  
  dim(np2charge_ec1s1u_14) <- N_gender
  dim(np2charge_ec2s1u_14) <- N_gender
  dim(np2charge_ec3s1u_14) <- N_gender
  dim(np2charge_ec4s1u_14) <- N_gender
  
  dim(np2charge_ec1s1u_15) <- N_gender
  dim(np2charge_ec2s1u_15) <- N_gender
  dim(np2charge_ec3s1u_15) <- N_gender
  dim(np2charge_ec4s1u_15) <- N_gender
  
  dim(np2charge_ec1s1u_16) <- N_gender
  dim(np2charge_ec2s1u_16) <- N_gender
  dim(np2charge_ec3s1u_16) <- N_gender
  dim(np2charge_ec4s1u_16) <- N_gender
  
  dim(np2charge_ec1s1u_17) <- N_gender
  dim(np2charge_ec2s1u_17) <- N_gender
  dim(np2charge_ec3s1u_17) <- N_gender
  dim(np2charge_ec4s1u_17) <- N_gender
  
  
  
  dim(np2charge_ec1s2u_10) <- N_gender
  dim(np2charge_ec2s2u_10) <- N_gender
  dim(np2charge_ec3s2u_10) <- N_gender
  dim(np2charge_ec4s2u_10) <- N_gender
  
  dim(np2charge_ec1s2u_11) <- N_gender
  dim(np2charge_ec2s2u_11) <- N_gender
  dim(np2charge_ec3s2u_11) <- N_gender
  dim(np2charge_ec4s2u_11) <- N_gender
  
  dim(np2charge_ec1s2u_12) <- N_gender
  dim(np2charge_ec2s2u_12) <- N_gender
  dim(np2charge_ec3s2u_12) <- N_gender
  dim(np2charge_ec4s2u_12) <- N_gender
  
  dim(np2charge_ec1s2u_13) <- N_gender
  dim(np2charge_ec2s2u_13) <- N_gender
  dim(np2charge_ec3s2u_13) <- N_gender
  dim(np2charge_ec4s2u_13) <- N_gender
  
  dim(np2charge_ec1s2u_14) <- N_gender
  dim(np2charge_ec2s2u_14) <- N_gender
  dim(np2charge_ec3s2u_14) <- N_gender
  dim(np2charge_ec4s2u_14) <- N_gender
  
  dim(np2charge_ec1s2u_15) <- N_gender
  dim(np2charge_ec2s2u_15) <- N_gender
  dim(np2charge_ec3s2u_15) <- N_gender
  dim(np2charge_ec4s2u_15) <- N_gender
  
  dim(np2charge_ec1s2u_16) <- N_gender
  dim(np2charge_ec2s2u_16) <- N_gender
  dim(np2charge_ec3s2u_16) <- N_gender
  dim(np2charge_ec4s2u_16) <- N_gender
  
  dim(np2charge_ec1s2u_17) <- N_gender
  dim(np2charge_ec2s2u_17) <- N_gender
  dim(np2charge_ec3s2u_17) <- N_gender
  dim(np2charge_ec4s2u_17) <- N_gender
  
  
  
  dim(p2charge_ic1s1u_10) <- N_gender
  dim(p2charge_ic2s1u_10) <- N_gender
  dim(p2charge_ic3s1u_10) <- N_gender
  dim(p2charge_ic4s1u_10) <- N_gender
  
  dim(p2charge_ic1s1u_11) <- N_gender
  dim(p2charge_ic2s1u_11) <- N_gender
  dim(p2charge_ic3s1u_11) <- N_gender
  dim(p2charge_ic4s1u_11) <- N_gender
  
  dim(p2charge_ic1s1u_12) <- N_gender
  dim(p2charge_ic2s1u_12) <- N_gender
  dim(p2charge_ic3s1u_12) <- N_gender
  dim(p2charge_ic4s1u_12) <- N_gender
  
  dim(p2charge_ic1s1u_13) <- N_gender
  dim(p2charge_ic2s1u_13) <- N_gender
  dim(p2charge_ic3s1u_13) <- N_gender
  dim(p2charge_ic4s1u_13) <- N_gender
  
  dim(p2charge_ic1s1u_14) <- N_gender
  dim(p2charge_ic2s1u_14) <- N_gender
  dim(p2charge_ic3s1u_14) <- N_gender
  dim(p2charge_ic4s1u_14) <- N_gender
  
  dim(p2charge_ic1s1u_15) <- N_gender
  dim(p2charge_ic2s1u_15) <- N_gender
  dim(p2charge_ic3s1u_15) <- N_gender
  dim(p2charge_ic4s1u_15) <- N_gender
  
  dim(p2charge_ic1s1u_16) <- N_gender
  dim(p2charge_ic2s1u_16) <- N_gender
  dim(p2charge_ic3s1u_16) <- N_gender
  dim(p2charge_ic4s1u_16) <- N_gender
  
  dim(p2charge_ic1s1u_17) <- N_gender
  dim(p2charge_ic2s1u_17) <- N_gender
  dim(p2charge_ic3s1u_17) <- N_gender
  dim(p2charge_ic4s1u_17) <- N_gender
  
  
  
  dim(p2charge_ic1s2u_10) <- N_gender
  dim(p2charge_ic2s2u_10) <- N_gender
  dim(p2charge_ic3s2u_10) <- N_gender
  dim(p2charge_ic4s2u_10) <- N_gender
  
  dim(p2charge_ic1s2u_11) <- N_gender
  dim(p2charge_ic2s2u_11) <- N_gender
  dim(p2charge_ic3s2u_11) <- N_gender
  dim(p2charge_ic4s2u_11) <- N_gender
  
  dim(p2charge_ic1s2u_12) <- N_gender
  dim(p2charge_ic2s2u_12) <- N_gender
  dim(p2charge_ic3s2u_12) <- N_gender
  dim(p2charge_ic4s2u_12) <- N_gender
  
  dim(p2charge_ic1s2u_13) <- N_gender
  dim(p2charge_ic2s2u_13) <- N_gender
  dim(p2charge_ic3s2u_13) <- N_gender
  dim(p2charge_ic4s2u_13) <- N_gender
  
  dim(p2charge_ic1s2u_14) <- N_gender
  dim(p2charge_ic2s2u_14) <- N_gender
  dim(p2charge_ic3s2u_14) <- N_gender
  dim(p2charge_ic4s2u_14) <- N_gender
  
  dim(p2charge_ic1s2u_15) <- N_gender
  dim(p2charge_ic2s2u_15) <- N_gender
  dim(p2charge_ic3s2u_15) <- N_gender
  dim(p2charge_ic4s2u_15) <- N_gender
  
  dim(p2charge_ic1s2u_16) <- N_gender
  dim(p2charge_ic2s2u_16) <- N_gender
  dim(p2charge_ic3s2u_16) <- N_gender
  dim(p2charge_ic4s2u_16) <- N_gender
  
  dim(p2charge_ic1s2u_17) <- N_gender
  dim(p2charge_ic2s2u_17) <- N_gender
  dim(p2charge_ic3s2u_17) <- N_gender
  dim(p2charge_ic4s2u_17) <- N_gender
  
  dim(p2charge_ec1s1u_10) <- N_gender
  dim(p2charge_ec2s1u_10) <- N_gender
  dim(p2charge_ec3s1u_10) <- N_gender
  dim(p2charge_ec4s1u_10) <- N_gender
  
  dim(p2charge_ec1s1u_11) <- N_gender
  dim(p2charge_ec2s1u_11) <- N_gender
  dim(p2charge_ec3s1u_11) <- N_gender
  dim(p2charge_ec4s1u_11) <- N_gender
  
  dim(p2charge_ec1s1u_12) <- N_gender
  dim(p2charge_ec2s1u_12) <- N_gender
  dim(p2charge_ec3s1u_12) <- N_gender
  dim(p2charge_ec4s1u_12) <- N_gender
  
  dim(p2charge_ec1s1u_13) <- N_gender
  dim(p2charge_ec2s1u_13) <- N_gender
  dim(p2charge_ec3s1u_13) <- N_gender
  dim(p2charge_ec4s1u_13) <- N_gender
  
  dim(p2charge_ec1s1u_14) <- N_gender
  dim(p2charge_ec2s1u_14) <- N_gender
  dim(p2charge_ec3s1u_14) <- N_gender
  dim(p2charge_ec4s1u_14) <- N_gender
  
  dim(p2charge_ec1s1u_15) <- N_gender
  dim(p2charge_ec2s1u_15) <- N_gender
  dim(p2charge_ec3s1u_15) <- N_gender
  dim(p2charge_ec4s1u_15) <- N_gender
  
  dim(p2charge_ec1s1u_16) <- N_gender
  dim(p2charge_ec2s1u_16) <- N_gender
  dim(p2charge_ec3s1u_16) <- N_gender
  dim(p2charge_ec4s1u_16) <- N_gender
  
  dim(p2charge_ec1s1u_17) <- N_gender
  dim(p2charge_ec2s1u_17) <- N_gender
  dim(p2charge_ec3s1u_17) <- N_gender
  dim(p2charge_ec4s1u_17) <- N_gender
  
  
  
  dim(p2charge_ec1s2u_10) <- N_gender
  dim(p2charge_ec2s2u_10) <- N_gender
  dim(p2charge_ec3s2u_10) <- N_gender
  dim(p2charge_ec4s2u_10) <- N_gender
  
  dim(p2charge_ec1s2u_11) <- N_gender
  dim(p2charge_ec2s2u_11) <- N_gender
  dim(p2charge_ec3s2u_11) <- N_gender
  dim(p2charge_ec4s2u_11) <- N_gender
  
  dim(p2charge_ec1s2u_12) <- N_gender
  dim(p2charge_ec2s2u_12) <- N_gender
  dim(p2charge_ec3s2u_12) <- N_gender
  dim(p2charge_ec4s2u_12) <- N_gender
  
  dim(p2charge_ec1s2u_13) <- N_gender
  dim(p2charge_ec2s2u_13) <- N_gender
  dim(p2charge_ec3s2u_13) <- N_gender
  dim(p2charge_ec4s2u_13) <- N_gender
  
  dim(p2charge_ec1s2u_14) <- N_gender
  dim(p2charge_ec2s2u_14) <- N_gender
  dim(p2charge_ec3s2u_14) <- N_gender
  dim(p2charge_ec4s2u_14) <- N_gender
  
  dim(p2charge_ec1s2u_15) <- N_gender
  dim(p2charge_ec2s2u_15) <- N_gender
  dim(p2charge_ec3s2u_15) <- N_gender
  dim(p2charge_ec4s2u_15) <- N_gender
  
  dim(p2charge_ec1s2u_16) <- N_gender
  dim(p2charge_ec2s2u_16) <- N_gender
  dim(p2charge_ec3s2u_16) <- N_gender
  dim(p2charge_ec4s2u_16) <- N_gender
  
  dim(p2charge_ec1s2u_17) <- N_gender
  dim(p2charge_ec2s2u_17) <- N_gender
  dim(p2charge_ec3s2u_17) <- N_gender
  dim(p2charge_ec4s2u_17) <- N_gender
  
  
  ##############################################################################################################################
  # DIFFERENTIAL EQUATIONS # # #  # # #
  ###############################################################################################################################
  deriv(IC1S1J1U_10[]) <- 3
  deriv(IC2S1J1U_10[]) <- 3
  deriv(IC3S1J1U_10[]) <- 3
  deriv(IC4S1J1U_10[]) <- 3
  
  deriv(IC1S1J1U_11[]) <- 3
  deriv(IC2S1J1U_11[]) <- 3
  deriv(IC3S1J1U_11[]) <- 3
  deriv(IC4S1J1U_11[]) <- 3
  
  deriv(IC1S1J1U_12[]) <- 3
  deriv(IC2S1J1U_12[]) <- 3
  deriv(IC3S1J1U_12[]) <- 3
  deriv(IC4S1J1U_12[]) <- 3
  
  deriv(IC1S1J1U_13[]) <- 3
  deriv(IC2S1J1U_13[]) <- 3
  deriv(IC3S1J1U_13[]) <- 3
  deriv(IC4S1J1U_13[]) <- 3
  
  deriv(IC1S1J1U_14[]) <- 3
  deriv(IC2S1J1U_14[]) <- 3
  deriv(IC3S1J1U_14[]) <- 3
  deriv(IC4S1J1U_14[]) <- 3
  
  deriv(IC1S1J1U_15[]) <- 3
  deriv(IC2S1J1U_15[]) <- 3
  deriv(IC3S1J1U_15[]) <- 3
  deriv(IC4S1J1U_15[]) <- 3
  
  deriv(IC1S1J1U_16[]) <- 3
  deriv(IC2S1J1U_16[]) <- 3
  deriv(IC3S1J1U_16[]) <- 3
  deriv(IC4S1J1U_16[]) <- 3
  
  deriv(IC1S1J1U_17[]) <- 3
  deriv(IC2S1J1U_17[]) <- 3
  deriv(IC3S1J1U_17[]) <- 3
  deriv(IC4S1J1U_17[]) <- 3
  
  
  
  deriv(IC1S2J1U_10[]) <- 3
  deriv(IC2S2J1U_10[]) <- 3
  deriv(IC3S2J1U_10[]) <- 3
  deriv(IC4S2J1U_10[]) <- 3
  
  deriv(IC1S2J1U_11[]) <- 3
  deriv(IC2S2J1U_11[]) <- 3
  deriv(IC3S2J1U_11[]) <- 3
  deriv(IC4S2J1U_11[]) <- 3
  
  deriv(IC1S2J1U_12[]) <- 3
  deriv(IC2S2J1U_12[]) <- 3
  deriv(IC3S2J1U_12[]) <- 3
  deriv(IC4S2J1U_12[]) <- 3
  
  deriv(IC1S2J1U_13[]) <- 3
  deriv(IC2S2J1U_13[]) <- 3
  deriv(IC3S2J1U_13[]) <- 3
  deriv(IC4S2J1U_13[]) <- 3
  
  deriv(IC1S2J1U_14[]) <- 3
  deriv(IC2S2J1U_14[]) <- 3
  deriv(IC3S2J1U_14[]) <- 3
  deriv(IC4S2J1U_14[]) <- 3
  
  deriv(IC1S2J1U_15[]) <- 3
  deriv(IC2S2J1U_15[]) <- 3
  deriv(IC3S2J1U_15[]) <- 3
  deriv(IC4S2J1U_15[]) <- 3
  
  deriv(IC1S2J1U_16[]) <- 3
  deriv(IC2S2J1U_16[]) <- 3
  deriv(IC3S2J1U_16[]) <- 3
  deriv(IC4S2J1U_16[]) <- 3
  
  deriv(IC1S2J1U_17[]) <- 3
  deriv(IC2S2J1U_17[]) <- 3
  deriv(IC3S2J1U_17[]) <- 3
  deriv(IC4S2J1U_17[]) <- 3
  
  
  
  deriv(IC1S1J2U_10[]) <- 3
  deriv(IC2S1J2U_10[]) <- 3
  deriv(IC3S1J2U_10[]) <- 3
  deriv(IC4S1J2U_10[]) <- 3
  
  deriv(IC1S1J2U_11[]) <- 3
  deriv(IC2S1J2U_11[]) <- 3
  deriv(IC3S1J2U_11[]) <- 3
  deriv(IC4S1J2U_11[]) <- 3
  
  deriv(IC1S1J2U_12[]) <- 3
  deriv(IC2S1J2U_12[]) <- 3
  deriv(IC3S1J2U_12[]) <- 3
  deriv(IC4S1J2U_12[]) <- 3
  
  deriv(IC1S1J2U_13[]) <- 3
  deriv(IC2S1J2U_13[]) <- 3
  deriv(IC3S1J2U_13[]) <- 3
  deriv(IC4S1J2U_13[]) <- 3
  
  deriv(IC1S1J2U_14[]) <- 3
  deriv(IC2S1J2U_14[]) <- 3
  deriv(IC3S1J2U_14[]) <- 3
  deriv(IC4S1J2U_14[]) <- 3
  
  deriv(IC1S1J2U_15[]) <- 3
  deriv(IC2S1J2U_15[]) <- 3
  deriv(IC3S1J2U_15[]) <- 3
  deriv(IC4S1J2U_15[]) <- 3
  
  deriv(IC1S1J2U_16[]) <- 3
  deriv(IC2S1J2U_16[]) <- 3
  deriv(IC3S1J2U_16[]) <- 3
  deriv(IC4S1J2U_16[]) <- 3
  
  deriv(IC1S1J2U_17[]) <- 3
  deriv(IC2S1J2U_17[]) <- 3
  deriv(IC3S1J2U_17[]) <- 3
  deriv(IC4S1J2U_17[]) <- 3
  
  
  
  deriv(IC1S2J2U_10[]) <- 3
  deriv(IC2S2J2U_10[]) <- 3
  deriv(IC3S2J2U_10[]) <- 3
  deriv(IC4S2J2U_10[]) <- 3
  
  deriv(IC1S2J2U_11[]) <- 3
  deriv(IC2S2J2U_11[]) <- 3
  deriv(IC3S2J2U_11[]) <- 3
  deriv(IC4S2J2U_11[]) <- 3
  
  deriv(IC1S2J2U_12[]) <- 3
  deriv(IC2S2J2U_12[]) <- 3
  deriv(IC3S2J2U_12[]) <- 3
  deriv(IC4S2J2U_12[]) <- 3
  
  deriv(IC1S2J2U_13[]) <- 3
  deriv(IC2S2J2U_13[]) <- 3
  deriv(IC3S2J2U_13[]) <- 3
  deriv(IC4S2J2U_13[]) <- 3
  
  deriv(IC1S2J2U_14[]) <- 3
  deriv(IC2S2J2U_14[]) <- 3
  deriv(IC3S2J2U_14[]) <- 3
  deriv(IC4S2J2U_14[]) <- 3
  
  deriv(IC1S2J2U_15[]) <- 3
  deriv(IC2S2J2U_15[]) <- 3
  deriv(IC3S2J2U_15[]) <- 3
  deriv(IC4S2J2U_15[]) <- 3
  
  deriv(IC1S2J2U_16[]) <- 3
  deriv(IC2S2J2U_16[]) <- 3
  deriv(IC3S2J2U_16[]) <- 3
  deriv(IC4S2J2U_16[]) <- 3
  
  deriv(IC1S2J2U_17[]) <- 3
  deriv(IC2S2J2U_17[]) <- 3
  deriv(IC3S2J2U_17[]) <- 3
  deriv(IC4S2J2U_17[]) <- 3
  
  
  
  deriv(IC1S1J3U_10[]) <- 3
  deriv(IC2S1J3U_10[]) <- 3
  deriv(IC3S1J3U_10[]) <- 3
  deriv(IC4S1J3U_10[]) <- 3
  
  deriv(IC1S1J3U_11[]) <- 3
  deriv(IC2S1J3U_11[]) <- 3
  deriv(IC3S1J3U_11[]) <- 3
  deriv(IC4S1J3U_11[]) <- 3
  
  deriv(IC1S1J3U_12[]) <- 3
  deriv(IC2S1J3U_12[]) <- 3
  deriv(IC3S1J3U_12[]) <- 3
  deriv(IC4S1J3U_12[]) <- 3
  
  deriv(IC1S1J3U_13[]) <- 3
  deriv(IC2S1J3U_13[]) <- 3
  deriv(IC3S1J3U_13[]) <- 3
  deriv(IC4S1J3U_13[]) <- 3
  
  deriv(IC1S1J3U_14[]) <- 3
  deriv(IC2S1J3U_14[]) <- 3
  deriv(IC3S1J3U_14[]) <- 3
  deriv(IC4S1J3U_14[]) <- 3
  
  deriv(IC1S1J3U_15[]) <- 3
  deriv(IC2S1J3U_15[]) <- 3
  deriv(IC3S1J3U_15[]) <- 3
  deriv(IC4S1J3U_15[]) <- 3
  
  deriv(IC1S1J3U_16[]) <- 3
  deriv(IC2S1J3U_16[]) <- 3
  deriv(IC3S1J3U_16[]) <- 3
  deriv(IC4S1J3U_16[]) <- 3
  
  deriv(IC1S1J3U_17[]) <- 3
  deriv(IC2S1J3U_17[]) <- 3
  deriv(IC3S1J3U_17[]) <- 3
  deriv(IC4S1J3U_17[]) <- 3
  
  
  
  deriv(IC1S2J3U_10[]) <- 3
  deriv(IC2S2J3U_10[]) <- 3
  deriv(IC3S2J3U_10[]) <- 3
  deriv(IC4S2J3U_10[]) <- 3
  
  deriv(IC1S2J3U_11[]) <- 3
  deriv(IC2S2J3U_11[]) <- 3
  deriv(IC3S2J3U_11[]) <- 3
  deriv(IC4S2J3U_11[]) <- 3
  
  deriv(IC1S2J3U_12[]) <- 3
  deriv(IC2S2J3U_12[]) <- 3
  deriv(IC3S2J3U_12[]) <- 3
  deriv(IC4S2J3U_12[]) <- 3
  
  deriv(IC1S2J3U_13[]) <- 3
  deriv(IC2S2J3U_13[]) <- 3
  deriv(IC3S2J3U_13[]) <- 3
  deriv(IC4S2J3U_13[]) <- 3
  
  deriv(IC1S2J3U_14[]) <- 3
  deriv(IC2S2J3U_14[]) <- 3
  deriv(IC3S2J3U_14[]) <- 3
  deriv(IC4S2J3U_14[]) <- 3
  
  deriv(IC1S2J3U_15[]) <- 3
  deriv(IC2S2J3U_15[]) <- 3
  deriv(IC3S2J3U_15[]) <- 3
  deriv(IC4S2J3U_15[]) <- 3
  
  deriv(IC1S2J3U_16[]) <- 3
  deriv(IC2S2J3U_16[]) <- 3
  deriv(IC3S2J3U_16[]) <- 3
  deriv(IC4S2J3U_16[]) <- 3
  
  deriv(IC1S2J3U_17[]) <- 3
  deriv(IC2S2J3U_17[]) <- 3
  deriv(IC3S2J3U_17[]) <- 3
  deriv(IC4S2J3U_17[]) <- 3
  
  
  
  deriv(IC1S1J4U_10[]) <- 3
  deriv(IC2S1J4U_10[]) <- 3
  deriv(IC3S1J4U_10[]) <- 3
  deriv(IC4S1J4U_10[]) <- 3
  
  deriv(IC1S1J4U_11[]) <- 3
  deriv(IC2S1J4U_11[]) <- 3
  deriv(IC3S1J4U_11[]) <- 3
  deriv(IC4S1J4U_11[]) <- 3
  
  deriv(IC1S1J4U_12[]) <- 3
  deriv(IC2S1J4U_12[]) <- 3
  deriv(IC3S1J4U_12[]) <- 3
  deriv(IC4S1J4U_12[]) <- 3
  
  deriv(IC1S1J4U_13[]) <- 3
  deriv(IC2S1J4U_13[]) <- 3
  deriv(IC3S1J4U_13[]) <- 3
  deriv(IC4S1J4U_13[]) <- 3
  
  deriv(IC1S1J4U_14[]) <- 3
  deriv(IC2S1J4U_14[]) <- 3
  deriv(IC3S1J4U_14[]) <- 3
  deriv(IC4S1J4U_14[]) <- 3
  
  deriv(IC1S1J4U_15[]) <- 3
  deriv(IC2S1J4U_15[]) <- 3
  deriv(IC3S1J4U_15[]) <- 3
  deriv(IC4S1J4U_15[]) <- 3
  
  deriv(IC1S1J4U_16[]) <- 3
  deriv(IC2S1J4U_16[]) <- 3
  deriv(IC3S1J4U_16[]) <- 3
  deriv(IC4S1J4U_16[]) <- 3
  
  deriv(IC1S1J4U_17[]) <- 3
  deriv(IC2S1J4U_17[]) <- 3
  deriv(IC3S1J4U_17[]) <- 3
  deriv(IC4S1J4U_17[]) <- 3
  
  
  
  deriv(IC1S2J4U_10[]) <- 3
  deriv(IC2S2J4U_10[]) <- 3
  deriv(IC3S2J4U_10[]) <- 3
  deriv(IC4S2J4U_10[]) <- 3
  
  deriv(IC1S2J4U_11[]) <- 3
  deriv(IC2S2J4U_11[]) <- 3
  deriv(IC3S2J4U_11[]) <- 3
  deriv(IC4S2J4U_11[]) <- 3
  
  deriv(IC1S2J4U_12[]) <- 3
  deriv(IC2S2J4U_12[]) <- 3
  deriv(IC3S2J4U_12[]) <- 3
  deriv(IC4S2J4U_12[]) <- 3
  
  deriv(IC1S2J4U_13[]) <- 3
  deriv(IC2S2J4U_13[]) <- 3
  deriv(IC3S2J4U_13[]) <- 3
  deriv(IC4S2J4U_13[]) <- 3
  
  deriv(IC1S2J4U_14[]) <- 3
  deriv(IC2S2J4U_14[]) <- 3
  deriv(IC3S2J4U_14[]) <- 3
  deriv(IC4S2J4U_14[]) <- 3
  
  deriv(IC1S2J4U_15[]) <- 3
  deriv(IC2S2J4U_15[]) <- 3
  deriv(IC3S2J4U_15[]) <- 3
  deriv(IC4S2J4U_15[]) <- 3
  
  deriv(IC1S2J4U_16[]) <- 3
  deriv(IC2S2J4U_16[]) <- 3
  deriv(IC3S2J4U_16[]) <- 3
  deriv(IC4S2J4U_16[]) <- 3
  
  deriv(IC1S2J4U_17[]) <- 3
  deriv(IC2S2J4U_17[]) <- 3
  deriv(IC3S2J4U_17[]) <- 3
  deriv(IC4S2J4U_17[]) <- 3
  
  
  
  deriv(IC1S1J5U_10[]) <- 3
  deriv(IC2S1J5U_10[]) <- 3
  deriv(IC3S1J5U_10[]) <- 3
  deriv(IC4S1J5U_10[]) <- 3
  
  deriv(IC1S1J5U_11[]) <- 3
  deriv(IC2S1J5U_11[]) <- 3
  deriv(IC3S1J5U_11[]) <- 3
  deriv(IC4S1J5U_11[]) <- 3
  
  deriv(IC1S1J5U_12[]) <- 3
  deriv(IC2S1J5U_12[]) <- 3
  deriv(IC3S1J5U_12[]) <- 3
  deriv(IC4S1J5U_12[]) <- 3
  
  deriv(IC1S1J5U_13[]) <- 3
  deriv(IC2S1J5U_13[]) <- 3
  deriv(IC3S1J5U_13[]) <- 3
  deriv(IC4S1J5U_13[]) <- 3
  
  deriv(IC1S1J5U_14[]) <- 3
  deriv(IC2S1J5U_14[]) <- 3
  deriv(IC3S1J5U_14[]) <- 3
  deriv(IC4S1J5U_14[]) <- 3
  
  deriv(IC1S1J5U_15[]) <- 3
  deriv(IC2S1J5U_15[]) <- 3
  deriv(IC3S1J5U_15[]) <- 3
  deriv(IC4S1J5U_15[]) <- 3
  
  deriv(IC1S1J5U_16[]) <- 3
  deriv(IC2S1J5U_16[]) <- 3
  deriv(IC3S1J5U_16[]) <- 3
  deriv(IC4S1J5U_16[]) <- 3
  
  deriv(IC1S1J5U_17[]) <- 3
  deriv(IC2S1J5U_17[]) <- 3
  deriv(IC3S1J5U_17[]) <- 3
  deriv(IC4S1J5U_17[]) <- 3
  
  
  
  deriv(IC1S2J5U_10[]) <- 3
  deriv(IC2S2J5U_10[]) <- 3
  deriv(IC3S2J5U_10[]) <- 3
  deriv(IC4S2J5U_10[]) <- 3
  
  deriv(IC1S2J5U_11[]) <- 3
  deriv(IC2S2J5U_11[]) <- 3
  deriv(IC3S2J5U_11[]) <- 3
  deriv(IC4S2J5U_11[]) <- 3
  
  deriv(IC1S2J5U_12[]) <- 3
  deriv(IC2S2J5U_12[]) <- 3
  deriv(IC3S2J5U_12[]) <- 3
  deriv(IC4S2J5U_12[]) <- 3
  
  deriv(IC1S2J5U_13[]) <- 3
  deriv(IC2S2J5U_13[]) <- 3
  deriv(IC3S2J5U_13[]) <- 3
  deriv(IC4S2J5U_13[]) <- 3
  
  deriv(IC1S2J5U_14[]) <- 3
  deriv(IC2S2J5U_14[]) <- 3
  deriv(IC3S2J5U_14[]) <- 3
  deriv(IC4S2J5U_14[]) <- 3
  
  deriv(IC1S2J5U_15[]) <- 3
  deriv(IC2S2J5U_15[]) <- 3
  deriv(IC3S2J5U_15[]) <- 3
  deriv(IC4S2J5U_15[]) <- 3
  
  deriv(IC1S2J5U_16[]) <- 3
  deriv(IC2S2J5U_16[]) <- 3
  deriv(IC3S2J5U_16[]) <- 3
  deriv(IC4S2J5U_16[]) <- 3
  
  deriv(IC1S2J5U_17[]) <- 3
  deriv(IC2S2J5U_17[]) <- 3
  deriv(IC3S2J5U_17[]) <- 3
  deriv(IC4S2J5U_17[]) <- 3
  

},
target = 'c')  


pars <- list(turn10 = c(100,100),
             pc_incl = 0.7,
             pc_excl = 0.3,
             
             t10_ic1s1j1u = c(0.01,0.01),
             t10_ic2s1j1u = c(0.01,0.01),
             t10_ic3s1j1u = c(0.01,0.01),
             t10_ic4s1j1u = c(0.01,0.01),
             
             t10_ic1s2j1u = c(0.01,0.01),
             t10_ic2s2j1u = c(0.01,0.01),
             t10_ic3s2j1u = c(0.01,0.01),
             t10_ic4s2j1u = c(0.01,0.01),
             
             t10_ic1s1j2u = c(0.01,0.01),
             t10_ic2s1j2u = c(0.01,0.01),
             t10_ic3s1j2u = c(0.01,0.01),
             t10_ic4s1j2u = c(0.01,0.01),
             
             t10_ic1s2j2u = c(0.01,0.01),
             t10_ic2s2j2u = c(0.01,0.01),
             t10_ic3s2j2u = c(0.01,0.01),
             t10_ic4s2j2u = c(0.01,0.01),
             
             t10_ic1s1j3u = c(0.01,0.01),
             t10_ic2s1j3u = c(0.01,0.01),
             t10_ic3s1j3u = c(0.01,0.01),
             t10_ic4s1j3u = c(0.01,0.01),
             
             t10_ic1s2j3u = c(0.01,0.01),
             t10_ic2s2j3u = c(0.01,0.01),
             t10_ic3s2j3u = c(0.01,0.01),
             t10_ic4s2j3u = c(0.01,0.01),
             
             t10_ic1s1j4u = c(0.01,0.01),
             t10_ic2s1j4u = c(0.01,0.01),
             t10_ic3s1j4u = c(0.01,0.01),
             t10_ic4s1j4u = c(0.01,0.01),
             
             t10_ic1s2j4u = c(0.01,0.01),
             t10_ic2s2j4u = c(0.01,0.01),
             t10_ic3s2j4u = c(0.01,0.01),
             t10_ic4s2j4u = c(0.01,0.01),
             
             t10_ic1s1j5u = c(0.01,0.01),
             t10_ic2s1j5u = c(0.01,0.01),
             t10_ic3s1j5u = c(0.01,0.01),
             t10_ic4s1j5u = c(0.01,0.01),
             
             t10_ic1s2j5u = c(0.01,0.01),
             t10_ic2s2j5u = c(0.01,0.01),
             t10_ic3s2j5u = c(0.01,0.01),
             t10_ic4s2j5u = c(0.01,0.01),
             
             
             t10_ec1s1j1u = c(0.01,0.01),
             t10_ec2s1j1u = c(0.01,0.01),
             t10_ec3s1j1u = c(0.01,0.01),
             t10_ec4s1j1u = c(0.01,0.01),
             
             t10_ec1s2j1u = c(0.01,0.01),
             t10_ec2s2j1u = c(0.01,0.01),
             t10_ec3s2j1u = c(0.01,0.01),
             t10_ec4s2j1u = c(0.01,0.01),
             
             t10_ec1s1j2u = c(0.01,0.01),
             t10_ec2s1j2u = c(0.01,0.01),
             t10_ec3s1j2u = c(0.01,0.01),
             t10_ec4s1j2u = c(0.01,0.01),
             
             t10_ec1s2j2u = c(0.01,0.01),
             t10_ec2s2j2u = c(0.01,0.01),
             t10_ec3s2j2u = c(0.01,0.01),
             t10_ec4s2j2u = c(0.01,0.01),
             
             t10_ec1s1j3u = c(0.01,0.01),
             t10_ec2s1j3u = c(0.01,0.01),
             t10_ec3s1j3u = c(0.01,0.01),
             t10_ec4s1j3u = c(0.01,0.01),
             
             t10_ec1s2j3u = c(0.01,0.01),
             t10_ec2s2j3u = c(0.01,0.01),
             t10_ec3s2j3u = c(0.01,0.01),
             t10_ec4s2j3u = c(0.01,0.01),
             
             t10_ec1s1j4u = c(0.01,0.01),
             t10_ec2s1j4u = c(0.01,0.01),
             t10_ec3s1j4u = c(0.01,0.01),
             t10_ec4s1j4u = c(0.01,0.01),
             
             t10_ec1s2j4u = c(0.01,0.01),
             t10_ec2s2j4u = c(0.01,0.01),
             t10_ec3s2j4u = c(0.01,0.01),
             t10_ec4s2j4u = c(0.01,0.01),
             
             t10_ec1s1j5u = c(0.01,0.01),
             t10_ec2s1j5u = c(0.01,0.01),
             t10_ec3s1j5u = c(0.01,0.01),
             t10_ec4s1j5u = c(0.01,0.01),
             
             t10_ec1s2j5u = c(0.01,0.01),
             t10_ec2s2j5u = c(0.01,0.01),
             t10_ec3s2j5u = c(0.01,0.01),
             t10_ec4s2j5u = c(0.01,0.01),

             
             neet16_ic1s1j1u = c(0.0001,0.0001),
             neet16_ic2s1j1u = c(0.0001,0.0001),
             neet16_ic3s1j1u = c(0.0001,0.0001),
             neet16_ic4s1j1u = c(0.0001,0.0001),
             
             neet16_ic1s2j1u = c(0.0001,0.0001),
             neet16_ic2s2j1u = c(0.0001,0.0001),
             neet16_ic3s2j1u = c(0.0001,0.0001),
             neet16_ic4s2j1u = c(0.0001,0.0001),
             
             neet16_ic1s1j2u = c(0.0001,0.0001),
             neet16_ic2s1j2u = c(0.0001,0.0001),
             neet16_ic3s1j2u = c(0.0001,0.0001),
             neet16_ic4s1j2u = c(0.0001,0.0001),
             
             neet16_ic1s2j2u = c(0.0001,0.0001),
             neet16_ic2s2j2u = c(0.0001,0.0001),
             neet16_ic3s2j2u = c(0.0001,0.0001),
             neet16_ic4s2j2u = c(0.0001,0.0001),
             
             neet16_ic1s1j3u = c(0.0001,0.0001),
             neet16_ic2s1j3u = c(0.0001,0.0001),
             neet16_ic3s1j3u = c(0.0001,0.0001),
             neet16_ic4s1j3u = c(0.0001,0.0001),
             
             neet16_ic1s2j3u = c(0.0001,0.0001),
             neet16_ic2s2j3u = c(0.0001,0.0001),
             neet16_ic3s2j3u = c(0.0001,0.0001),
             neet16_ic4s2j3u = c(0.0001,0.0001),
             
             neet16_ic1s1j4u = c(0.0001,0.0001),
             neet16_ic2s1j4u = c(0.0001,0.0001),
             neet16_ic3s1j4u = c(0.0001,0.0001),
             neet16_ic4s1j4u = c(0.0001,0.0001),
             
             neet16_ic1s2j4u = c(0.0001,0.0001),
             neet16_ic2s2j4u = c(0.0001,0.0001),
             neet16_ic3s2j4u = c(0.0001,0.0001),
             neet16_ic4s2j4u = c(0.0001,0.0001),
             
             neet16_ic1s1j5u = c(0.0001,0.0001),
             neet16_ic2s1j5u = c(0.0001,0.0001),
             neet16_ic3s1j5u = c(0.0001,0.0001),
             neet16_ic4s1j5u = c(0.0001,0.0001),
             
             neet16_ic1s2j5u = c(0.0001,0.0001),
             neet16_ic2s2j5u = c(0.0001,0.0001),
             neet16_ic3s2j5u = c(0.0001,0.0001),
             neet16_ic4s2j5u = c(0.0001,0.0001),

             
             neet16_ec1s1j1u = c(0.0001,0.0001),
             neet16_ec2s1j1u = c(0.0001,0.0001),
             neet16_ec3s1j1u = c(0.0001,0.0001),
             neet16_ec4s1j1u = c(0.0001,0.0001),
             
             neet16_ec1s2j1u = c(0.0001,0.0001),
             neet16_ec2s2j1u = c(0.0001,0.0001),
             neet16_ec3s2j1u = c(0.0001,0.0001),
             neet16_ec4s2j1u = c(0.0001,0.0001),
             
             neet16_ec1s1j2u = c(0.0001,0.0001),
             neet16_ec2s1j2u = c(0.0001,0.0001),
             neet16_ec3s1j2u = c(0.0001,0.0001),
             neet16_ec4s1j2u = c(0.0001,0.0001),
             
             neet16_ec1s2j2u = c(0.0001,0.0001),
             neet16_ec2s2j2u = c(0.0001,0.0001),
             neet16_ec3s2j2u = c(0.0001,0.0001),
             neet16_ec4s2j2u = c(0.0001,0.0001),
             
             neet16_ec1s1j3u = c(0.0001,0.0001),
             neet16_ec2s1j3u = c(0.0001,0.0001),
             neet16_ec3s1j3u = c(0.0001,0.0001),
             neet16_ec4s1j3u = c(0.0001,0.0001),
             
             neet16_ec1s2j3u = c(0.0001,0.0001),
             neet16_ec2s2j3u = c(0.0001,0.0001),
             neet16_ec3s2j3u = c(0.0001,0.0001),
             neet16_ec4s2j3u = c(0.0001,0.0001),
             
             neet16_ec1s1j4u = c(0.0001,0.0001),
             neet16_ec2s1j4u = c(0.0001,0.0001),
             neet16_ec3s1j4u = c(0.0001,0.0001),
             neet16_ec4s1j4u = c(0.0001,0.0001),
             
             neet16_ec1s2j4u = c(0.0001,0.0001),
             neet16_ec2s2j4u = c(0.0001,0.0001),
             neet16_ec3s2j4u = c(0.0001,0.0001),
             neet16_ec4s2j4u = c(0.0001,0.0001),
             
             neet16_ec1s1j5u = c(0.0001,0.0001),
             neet16_ec2s1j5u = c(0.0001,0.0001),
             neet16_ec3s1j5u = c(0.0001,0.0001),
             neet16_ec4s1j5u = c(0.0001,0.0001),
             
             neet16_ec1s2j5u = c(0.0001,0.0001),
             neet16_ec2s2j5u = c(0.0001,0.0001),
             neet16_ec3s2j5u = c(0.0001,0.0001),
             neet16_ec4s2j5u = c(0.0001,0.0001),
             
             
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
             
             
             np2nc_ic1s1u_10 = c(0.0001,0.0001),
             np2nc_ic2s1u_10 = c(0.0001,0.0001),
             np2nc_ic3s1u_10 = c(0.0001,0.0001),
             np2nc_ic4s1u_10 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_11 = c(0.0001,0.0001),
             np2nc_ic2s1u_11 = c(0.0001,0.0001),
             np2nc_ic3s1u_11 = c(0.0001,0.0001),
             np2nc_ic4s1u_11 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_12 = c(0.0001,0.0001),
             np2nc_ic2s1u_12 = c(0.0001,0.0001),
             np2nc_ic3s1u_12 = c(0.0001,0.0001),
             np2nc_ic4s1u_12 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_13 = c(0.0001,0.0001),
             np2nc_ic2s1u_13 = c(0.0001,0.0001),
             np2nc_ic3s1u_13 = c(0.0001,0.0001),
             np2nc_ic4s1u_13 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_14 = c(0.0001,0.0001),
             np2nc_ic2s1u_14 = c(0.0001,0.0001),
             np2nc_ic3s1u_14 = c(0.0001,0.0001),
             np2nc_ic4s1u_14 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_15 = c(0.0001,0.0001),
             np2nc_ic2s1u_15 = c(0.0001,0.0001),
             np2nc_ic3s1u_15 = c(0.0001,0.0001),
             np2nc_ic4s1u_15 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_16 = c(0.0001,0.0001),
             np2nc_ic2s1u_16 = c(0.0001,0.0001),
             np2nc_ic3s1u_16 = c(0.0001,0.0001),
             np2nc_ic4s1u_16 = c(0.0001,0.0001),
             
             np2nc_ic1s1u_17 = c(0.0001,0.0001),
             np2nc_ic2s1u_17 = c(0.0001,0.0001),
             np2nc_ic3s1u_17 = c(0.0001,0.0001),
             np2nc_ic4s1u_17 = c(0.0001,0.0001),
             
             
             
             np2nc_ic1s2u_10 = c(0.0001,0.0001),
             np2nc_ic2s2u_10 = c(0.0001,0.0001),
             np2nc_ic3s2u_10 = c(0.0001,0.0001),
             np2nc_ic4s2u_10 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_11 = c(0.0001,0.0001),
             np2nc_ic2s2u_11 = c(0.0001,0.0001),
             np2nc_ic3s2u_11 = c(0.0001,0.0001),
             np2nc_ic4s2u_11 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_12 = c(0.0001,0.0001),
             np2nc_ic2s2u_12 = c(0.0001,0.0001),
             np2nc_ic3s2u_12 = c(0.0001,0.0001),
             np2nc_ic4s2u_12 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_13 = c(0.0001,0.0001),
             np2nc_ic2s2u_13 = c(0.0001,0.0001),
             np2nc_ic3s2u_13 = c(0.0001,0.0001),
             np2nc_ic4s2u_13 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_14 = c(0.0001,0.0001),
             np2nc_ic2s2u_14 = c(0.0001,0.0001),
             np2nc_ic3s2u_14 = c(0.0001,0.0001),
             np2nc_ic4s2u_14 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_15 = c(0.0001,0.0001),
             np2nc_ic2s2u_15 = c(0.0001,0.0001),
             np2nc_ic3s2u_15 = c(0.0001,0.0001),
             np2nc_ic4s2u_15 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_16 = c(0.0001,0.0001),
             np2nc_ic2s2u_16 = c(0.0001,0.0001),
             np2nc_ic3s2u_16 = c(0.0001,0.0001),
             np2nc_ic4s2u_16 = c(0.0001,0.0001),
             
             np2nc_ic1s2u_17 = c(0.0001,0.0001),
             np2nc_ic2s2u_17 = c(0.0001,0.0001),
             np2nc_ic3s2u_17 = c(0.0001,0.0001),
             np2nc_ic4s2u_17 = c(0.0001,0.0001),
             

             
             np2nc_ec1s1u_10 = c(0.0001,0.0001),
             np2nc_ec2s1u_10 = c(0.0001,0.0001),
             np2nc_ec3s1u_10 = c(0.0001,0.0001),
             np2nc_ec4s1u_10 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_11 = c(0.0001,0.0001),
             np2nc_ec2s1u_11 = c(0.0001,0.0001),
             np2nc_ec3s1u_11 = c(0.0001,0.0001),
             np2nc_ec4s1u_11 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_12 = c(0.0001,0.0001),
             np2nc_ec2s1u_12 = c(0.0001,0.0001),
             np2nc_ec3s1u_12 = c(0.0001,0.0001),
             np2nc_ec4s1u_12 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_13 = c(0.0001,0.0001),
             np2nc_ec2s1u_13 = c(0.0001,0.0001),
             np2nc_ec3s1u_13 = c(0.0001,0.0001),
             np2nc_ec4s1u_13 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_14 = c(0.0001,0.0001),
             np2nc_ec2s1u_14 = c(0.0001,0.0001),
             np2nc_ec3s1u_14 = c(0.0001,0.0001),
             np2nc_ec4s1u_14 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_15 = c(0.0001,0.0001),
             np2nc_ec2s1u_15 = c(0.0001,0.0001),
             np2nc_ec3s1u_15 = c(0.0001,0.0001),
             np2nc_ec4s1u_15 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_16 = c(0.0001,0.0001),
             np2nc_ec2s1u_16 = c(0.0001,0.0001),
             np2nc_ec3s1u_16 = c(0.0001,0.0001),
             np2nc_ec4s1u_16 = c(0.0001,0.0001),
             
             np2nc_ec1s1u_17 = c(0.0001,0.0001),
             np2nc_ec2s1u_17 = c(0.0001,0.0001),
             np2nc_ec3s1u_17 = c(0.0001,0.0001),
             np2nc_ec4s1u_17 = c(0.0001,0.0001),
             
             
             
             np2nc_ec1s2u_10 = c(0.0001,0.0001),
             np2nc_ec2s2u_10 = c(0.0001,0.0001),
             np2nc_ec3s2u_10 = c(0.0001,0.0001),
             np2nc_ec4s2u_10 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_11 = c(0.0001,0.0001),
             np2nc_ec2s2u_11 = c(0.0001,0.0001),
             np2nc_ec3s2u_11 = c(0.0001,0.0001),
             np2nc_ec4s2u_11 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_12 = c(0.0001,0.0001),
             np2nc_ec2s2u_12 = c(0.0001,0.0001),
             np2nc_ec3s2u_12 = c(0.0001,0.0001),
             np2nc_ec4s2u_12 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_13 = c(0.0001,0.0001),
             np2nc_ec2s2u_13 = c(0.0001,0.0001),
             np2nc_ec3s2u_13 = c(0.0001,0.0001),
             np2nc_ec4s2u_13 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_14 = c(0.0001,0.0001),
             np2nc_ec2s2u_14 = c(0.0001,0.0001),
             np2nc_ec3s2u_14 = c(0.0001,0.0001),
             np2nc_ec4s2u_14 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_15 = c(0.0001,0.0001),
             np2nc_ec2s2u_15 = c(0.0001,0.0001),
             np2nc_ec3s2u_15 = c(0.0001,0.0001),
             np2nc_ec4s2u_15 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_16 = c(0.0001,0.0001),
             np2nc_ec2s2u_16 = c(0.0001,0.0001),
             np2nc_ec3s2u_16 = c(0.0001,0.0001),
             np2nc_ec4s2u_16 = c(0.0001,0.0001),
             
             np2nc_ec1s2u_17 = c(0.0001,0.0001),
             np2nc_ec2s2u_17 = c(0.0001,0.0001),
             np2nc_ec3s2u_17 = c(0.0001,0.0001),
             np2nc_ec4s2u_17 = c(0.0001,0.0001),
             

             
             np2charge_ic1s1u_10 = c(0.0001,0.0001),
             np2charge_ic2s1u_10 = c(0.0001,0.0001),
             np2charge_ic3s1u_10 = c(0.0001,0.0001),
             np2charge_ic4s1u_10 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_11 = c(0.0001,0.0001),
             np2charge_ic2s1u_11 = c(0.0001,0.0001),
             np2charge_ic3s1u_11 = c(0.0001,0.0001),
             np2charge_ic4s1u_11 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_12 = c(0.0001,0.0001),
             np2charge_ic2s1u_12 = c(0.0001,0.0001),
             np2charge_ic3s1u_12 = c(0.0001,0.0001),
             np2charge_ic4s1u_12 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_13 = c(0.0001,0.0001),
             np2charge_ic2s1u_13 = c(0.0001,0.0001),
             np2charge_ic3s1u_13 = c(0.0001,0.0001),
             np2charge_ic4s1u_13 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_14 = c(0.0001,0.0001),
             np2charge_ic2s1u_14 = c(0.0001,0.0001),
             np2charge_ic3s1u_14 = c(0.0001,0.0001),
             np2charge_ic4s1u_14 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_15 = c(0.0001,0.0001),
             np2charge_ic2s1u_15 = c(0.0001,0.0001),
             np2charge_ic3s1u_15 = c(0.0001,0.0001),
             np2charge_ic4s1u_15 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_16 = c(0.0001,0.0001),
             np2charge_ic2s1u_16 = c(0.0001,0.0001),
             np2charge_ic3s1u_16 = c(0.0001,0.0001),
             np2charge_ic4s1u_16 = c(0.0001,0.0001),
             
             np2charge_ic1s1u_17 = c(0.0001,0.0001),
             np2charge_ic2s1u_17 = c(0.0001,0.0001),
             np2charge_ic3s1u_17 = c(0.0001,0.0001),
             np2charge_ic4s1u_17 = c(0.0001,0.0001),
             
             
             
             np2charge_ic1s2u_10 = c(0.0001,0.0001),
             np2charge_ic2s2u_10 = c(0.0001,0.0001),
             np2charge_ic3s2u_10 = c(0.0001,0.0001),
             np2charge_ic4s2u_10 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_11 = c(0.0001,0.0001),
             np2charge_ic2s2u_11 = c(0.0001,0.0001),
             np2charge_ic3s2u_11 = c(0.0001,0.0001),
             np2charge_ic4s2u_11 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_12 = c(0.0001,0.0001),
             np2charge_ic2s2u_12 = c(0.0001,0.0001),
             np2charge_ic3s2u_12 = c(0.0001,0.0001),
             np2charge_ic4s2u_12 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_13 = c(0.0001,0.0001),
             np2charge_ic2s2u_13 = c(0.0001,0.0001),
             np2charge_ic3s2u_13 = c(0.0001,0.0001),
             np2charge_ic4s2u_13 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_14 = c(0.0001,0.0001),
             np2charge_ic2s2u_14 = c(0.0001,0.0001),
             np2charge_ic3s2u_14 = c(0.0001,0.0001),
             np2charge_ic4s2u_14 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_15 = c(0.0001,0.0001),
             np2charge_ic2s2u_15 = c(0.0001,0.0001),
             np2charge_ic3s2u_15 = c(0.0001,0.0001),
             np2charge_ic4s2u_15 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_16 = c(0.0001,0.0001),
             np2charge_ic2s2u_16 = c(0.0001,0.0001),
             np2charge_ic3s2u_16 = c(0.0001,0.0001),
             np2charge_ic4s2u_16 = c(0.0001,0.0001),
             
             np2charge_ic1s2u_17 = c(0.0001,0.0001),
             np2charge_ic2s2u_17 = c(0.0001,0.0001),
             np2charge_ic3s2u_17 = c(0.0001,0.0001),
             np2charge_ic4s2u_17 = c(0.0001,0.0001),
             
             
             
             np2charge_ec1s1u_10 = c(0.0001,0.0001),
             np2charge_ec2s1u_10 = c(0.0001,0.0001),
             np2charge_ec3s1u_10 = c(0.0001,0.0001),
             np2charge_ec4s1u_10 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_11 = c(0.0001,0.0001),
             np2charge_ec2s1u_11 = c(0.0001,0.0001),
             np2charge_ec3s1u_11 = c(0.0001,0.0001),
             np2charge_ec4s1u_11 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_12 = c(0.0001,0.0001),
             np2charge_ec2s1u_12 = c(0.0001,0.0001),
             np2charge_ec3s1u_12 = c(0.0001,0.0001),
             np2charge_ec4s1u_12 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_13 = c(0.0001,0.0001),
             np2charge_ec2s1u_13 = c(0.0001,0.0001),
             np2charge_ec3s1u_13 = c(0.0001,0.0001),
             np2charge_ec4s1u_13 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_14 = c(0.0001,0.0001),
             np2charge_ec2s1u_14 = c(0.0001,0.0001),
             np2charge_ec3s1u_14 = c(0.0001,0.0001),
             np2charge_ec4s1u_14 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_15 = c(0.0001,0.0001),
             np2charge_ec2s1u_15 = c(0.0001,0.0001),
             np2charge_ec3s1u_15 = c(0.0001,0.0001),
             np2charge_ec4s1u_15 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_16 = c(0.0001,0.0001),
             np2charge_ec2s1u_16 = c(0.0001,0.0001),
             np2charge_ec3s1u_16 = c(0.0001,0.0001),
             np2charge_ec4s1u_16 = c(0.0001,0.0001),
             
             np2charge_ec1s1u_17 = c(0.0001,0.0001),
             np2charge_ec2s1u_17 = c(0.0001,0.0001),
             np2charge_ec3s1u_17 = c(0.0001,0.0001),
             np2charge_ec4s1u_17 = c(0.0001,0.0001),
             
             
             
             np2charge_ec1s2u_10 = c(0.0001,0.0001),
             np2charge_ec2s2u_10 = c(0.0001,0.0001),
             np2charge_ec3s2u_10 = c(0.0001,0.0001),
             np2charge_ec4s2u_10 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_11 = c(0.0001,0.0001),
             np2charge_ec2s2u_11 = c(0.0001,0.0001),
             np2charge_ec3s2u_11 = c(0.0001,0.0001),
             np2charge_ec4s2u_11 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_12 = c(0.0001,0.0001),
             np2charge_ec2s2u_12 = c(0.0001,0.0001),
             np2charge_ec3s2u_12 = c(0.0001,0.0001),
             np2charge_ec4s2u_12 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_13 = c(0.0001,0.0001),
             np2charge_ec2s2u_13 = c(0.0001,0.0001),
             np2charge_ec3s2u_13 = c(0.0001,0.0001),
             np2charge_ec4s2u_13 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_14 = c(0.0001,0.0001),
             np2charge_ec2s2u_14 = c(0.0001,0.0001),
             np2charge_ec3s2u_14 = c(0.0001,0.0001),
             np2charge_ec4s2u_14 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_15 = c(0.0001,0.0001),
             np2charge_ec2s2u_15 = c(0.0001,0.0001),
             np2charge_ec3s2u_15 = c(0.0001,0.0001),
             np2charge_ec4s2u_15 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_16 = c(0.0001,0.0001),
             np2charge_ec2s2u_16 = c(0.0001,0.0001),
             np2charge_ec3s2u_16 = c(0.0001,0.0001),
             np2charge_ec4s2u_16 = c(0.0001,0.0001),
             
             np2charge_ec1s2u_17 = c(0.0001,0.0001),
             np2charge_ec2s2u_17 = c(0.0001,0.0001),
             np2charge_ec3s2u_17 = c(0.0001,0.0001),
             np2charge_ec4s2u_17 = c(0.0001,0.0001),

             
             p2charge_ic1s1u_10 = c(0.0001,0.0001),
             p2charge_ic2s1u_10 = c(0.0001,0.0001),
             p2charge_ic3s1u_10 = c(0.0001,0.0001),
             p2charge_ic4s1u_10 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_11 = c(0.0001,0.0001),
             p2charge_ic2s1u_11 = c(0.0001,0.0001),
             p2charge_ic3s1u_11 = c(0.0001,0.0001),
             p2charge_ic4s1u_11 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_12 = c(0.0001,0.0001),
             p2charge_ic2s1u_12 = c(0.0001,0.0001),
             p2charge_ic3s1u_12 = c(0.0001,0.0001),
             p2charge_ic4s1u_12 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_13 = c(0.0001,0.0001),
             p2charge_ic2s1u_13 = c(0.0001,0.0001),
             p2charge_ic3s1u_13 = c(0.0001,0.0001),
             p2charge_ic4s1u_13 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_14 = c(0.0001,0.0001),
             p2charge_ic2s1u_14 = c(0.0001,0.0001),
             p2charge_ic3s1u_14 = c(0.0001,0.0001),
             p2charge_ic4s1u_14 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_15 = c(0.0001,0.0001),
             p2charge_ic2s1u_15 = c(0.0001,0.0001),
             p2charge_ic3s1u_15 = c(0.0001,0.0001),
             p2charge_ic4s1u_15 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_16 = c(0.0001,0.0001),
             p2charge_ic2s1u_16 = c(0.0001,0.0001),
             p2charge_ic3s1u_16 = c(0.0001,0.0001),
             p2charge_ic4s1u_16 = c(0.0001,0.0001),
             
             p2charge_ic1s1u_17 = c(0.0001,0.0001),
             p2charge_ic2s1u_17 = c(0.0001,0.0001),
             p2charge_ic3s1u_17 = c(0.0001,0.0001),
             p2charge_ic4s1u_17 = c(0.0001,0.0001),
             
             
             
             p2charge_ic1s2u_10 = c(0.0001,0.0001),
             p2charge_ic2s2u_10 = c(0.0001,0.0001),
             p2charge_ic3s2u_10 = c(0.0001,0.0001),
             p2charge_ic4s2u_10 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_11 = c(0.0001,0.0001),
             p2charge_ic2s2u_11 = c(0.0001,0.0001),
             p2charge_ic3s2u_11 = c(0.0001,0.0001),
             p2charge_ic4s2u_11 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_12 = c(0.0001,0.0001),
             p2charge_ic2s2u_12 = c(0.0001,0.0001),
             p2charge_ic3s2u_12 = c(0.0001,0.0001),
             p2charge_ic4s2u_12 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_13 = c(0.0001,0.0001),
             p2charge_ic2s2u_13 = c(0.0001,0.0001),
             p2charge_ic3s2u_13 = c(0.0001,0.0001),
             p2charge_ic4s2u_13 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_14 = c(0.0001,0.0001),
             p2charge_ic2s2u_14 = c(0.0001,0.0001),
             p2charge_ic3s2u_14 = c(0.0001,0.0001),
             p2charge_ic4s2u_14 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_15 = c(0.0001,0.0001),
             p2charge_ic2s2u_15 = c(0.0001,0.0001),
             p2charge_ic3s2u_15 = c(0.0001,0.0001),
             p2charge_ic4s2u_15 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_16 = c(0.0001,0.0001),
             p2charge_ic2s2u_16 = c(0.0001,0.0001),
             p2charge_ic3s2u_16 = c(0.0001,0.0001),
             p2charge_ic4s2u_16 = c(0.0001,0.0001),
             
             p2charge_ic1s2u_17 = c(0.0001,0.0001),
             p2charge_ic2s2u_17 = c(0.0001,0.0001),
             p2charge_ic3s2u_17 = c(0.0001,0.0001),
             p2charge_ic4s2u_17 = c(0.0001,0.0001),

             
             p2charge_ec1s1u_10 = c(0.0001,0.0001),
             p2charge_ec2s1u_10 = c(0.0001,0.0001),
             p2charge_ec3s1u_10 = c(0.0001,0.0001),
             p2charge_ec4s1u_10 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_11 = c(0.0001,0.0001),
             p2charge_ec2s1u_11 = c(0.0001,0.0001),
             p2charge_ec3s1u_11 = c(0.0001,0.0001),
             p2charge_ec4s1u_11 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_12 = c(0.0001,0.0001),
             p2charge_ec2s1u_12 = c(0.0001,0.0001),
             p2charge_ec3s1u_12 = c(0.0001,0.0001),
             p2charge_ec4s1u_12 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_13 = c(0.0001,0.0001),
             p2charge_ec2s1u_13 = c(0.0001,0.0001),
             p2charge_ec3s1u_13 = c(0.0001,0.0001),
             p2charge_ec4s1u_13 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_14 = c(0.0001,0.0001),
             p2charge_ec2s1u_14 = c(0.0001,0.0001),
             p2charge_ec3s1u_14 = c(0.0001,0.0001),
             p2charge_ec4s1u_14 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_15 = c(0.0001,0.0001),
             p2charge_ec2s1u_15 = c(0.0001,0.0001),
             p2charge_ec3s1u_15 = c(0.0001,0.0001),
             p2charge_ec4s1u_15 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_16 = c(0.0001,0.0001),
             p2charge_ec2s1u_16 = c(0.0001,0.0001),
             p2charge_ec3s1u_16 = c(0.0001,0.0001),
             p2charge_ec4s1u_16 = c(0.0001,0.0001),
             
             p2charge_ec1s1u_17 = c(0.0001,0.0001),
             p2charge_ec2s1u_17 = c(0.0001,0.0001),
             p2charge_ec3s1u_17 = c(0.0001,0.0001),
             p2charge_ec4s1u_17 = c(0.0001,0.0001),
             
             
             
             p2charge_ec1s2u_10 = c(0.0001,0.0001),
             p2charge_ec2s2u_10 = c(0.0001,0.0001),
             p2charge_ec3s2u_10 = c(0.0001,0.0001),
             p2charge_ec4s2u_10 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_11 = c(0.0001,0.0001),
             p2charge_ec2s2u_11 = c(0.0001,0.0001),
             p2charge_ec3s2u_11 = c(0.0001,0.0001),
             p2charge_ec4s2u_11 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_12 = c(0.0001,0.0001),
             p2charge_ec2s2u_12 = c(0.0001,0.0001),
             p2charge_ec3s2u_12 = c(0.0001,0.0001),
             p2charge_ec4s2u_12 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_13 = c(0.0001,0.0001),
             p2charge_ec2s2u_13 = c(0.0001,0.0001),
             p2charge_ec3s2u_13 = c(0.0001,0.0001),
             p2charge_ec4s2u_13 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_14 = c(0.0001,0.0001),
             p2charge_ec2s2u_14 = c(0.0001,0.0001),
             p2charge_ec3s2u_14 = c(0.0001,0.0001),
             p2charge_ec4s2u_14 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_15 = c(0.0001,0.0001),
             p2charge_ec2s2u_15 = c(0.0001,0.0001),
             p2charge_ec3s2u_15 = c(0.0001,0.0001),
             p2charge_ec4s2u_15 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_16 = c(0.0001,0.0001),
             p2charge_ec2s2u_16 = c(0.0001,0.0001),
             p2charge_ec3s2u_16 = c(0.0001,0.0001),
             p2charge_ec4s2u_16 = c(0.0001,0.0001),
             
             p2charge_ec1s2u_17 = c(0.0001,0.0001),
             p2charge_ec2s2u_17 = c(0.0001,0.0001),
             p2charge_ec3s2u_17 = c(0.0001,0.0001),
             p2charge_ec4s2u_17 = c(0.0001,0.0001),
             
             

             
             
             # initial conditions
             IC1S1J1U_10_ini = c(200,200),
             IC2S1J1U_10_ini = c(200,200),
             IC3S1J1U_10_ini = c(200,200),
             IC4S1J1U_10_ini = c(200,200),
             
             IC1S1J1U_11_ini = c(200,200),
             IC2S1J1U_11_ini = c(200,200),
             IC3S1J1U_11_ini = c(200,200),
             IC4S1J1U_11_ini = c(200,200),
             
             IC1S1J1U_12_ini = c(200,200),
             IC2S1J1U_12_ini = c(200,200),
             IC3S1J1U_12_ini = c(200,200),
             IC4S1J1U_12_ini = c(200,200),
             
             IC1S1J1U_13_ini = c(200,200),
             IC2S1J1U_13_ini = c(200,200),
             IC3S1J1U_13_ini = c(200,200),
             IC4S1J1U_13_ini = c(200,200),
             
             IC1S1J1U_14_ini = c(200,200),
             IC2S1J1U_14_ini = c(200,200),
             IC3S1J1U_14_ini = c(200,200),
             IC4S1J1U_14_ini = c(200,200),
             
             IC1S1J1U_15_ini = c(200,200),
             IC2S1J1U_15_ini = c(200,200),
             IC3S1J1U_15_ini = c(200,200),
             IC4S1J1U_15_ini = c(200,200),
             
             IC1S1J1U_16_ini = c(200,200),
             IC2S1J1U_16_ini = c(200,200),
             IC3S1J1U_16_ini = c(200,200),
             IC4S1J1U_16_ini = c(200,200),
             
             IC1S1J1U_17_ini = c(200,200),
             IC2S1J1U_17_ini = c(200,200),
             IC3S1J1U_17_ini = c(200,200),
             IC4S1J1U_17_ini = c(200,200),
             
             
             
             IC1S2J1U_10_ini = c(200,200),
             IC2S2J1U_10_ini = c(200,200),
             IC3S2J1U_10_ini = c(200,200),
             IC4S2J1U_10_ini = c(200,200),
             
             IC1S2J1U_11_ini = c(200,200),
             IC2S2J1U_11_ini = c(200,200),
             IC3S2J1U_11_ini = c(200,200),
             IC4S2J1U_11_ini = c(200,200),
             
             IC1S2J1U_12_ini = c(200,200),
             IC2S2J1U_12_ini = c(200,200),
             IC3S2J1U_12_ini = c(200,200),
             IC4S2J1U_12_ini = c(200,200),
             
             IC1S2J1U_13_ini = c(200,200),
             IC2S2J1U_13_ini = c(200,200),
             IC3S2J1U_13_ini = c(200,200),
             IC4S2J1U_13_ini = c(200,200),
             
             IC1S2J1U_14_ini = c(200,200),
             IC2S2J1U_14_ini = c(200,200),
             IC3S2J1U_14_ini = c(200,200),
             IC4S2J1U_14_ini = c(200,200),
             
             IC1S2J1U_15_ini = c(200,200),
             IC2S2J1U_15_ini = c(200,200),
             IC3S2J1U_15_ini = c(200,200),
             IC4S2J1U_15_ini = c(200,200),
             
             IC1S2J1U_16_ini = c(200,200),
             IC2S2J1U_16_ini = c(200,200),
             IC3S2J1U_16_ini = c(200,200),
             IC4S2J1U_16_ini = c(200,200),
             
             IC1S2J1U_17_ini = c(200,200),
             IC2S2J1U_17_ini = c(200,200),
             IC3S2J1U_17_ini = c(200,200),
             IC4S2J1U_17_ini = c(200,200),
             
             
             
             IC1S1J2U_10_ini = c(200,200),
             IC2S1J2U_10_ini = c(200,200),
             IC3S1J2U_10_ini = c(200,200),
             IC4S1J2U_10_ini = c(200,200),
             
             IC1S1J2U_11_ini = c(200,200),
             IC2S1J2U_11_ini = c(200,200),
             IC3S1J2U_11_ini = c(200,200),
             IC4S1J2U_11_ini = c(200,200),
             
             IC1S1J2U_12_ini = c(200,200),
             IC2S1J2U_12_ini = c(200,200),
             IC3S1J2U_12_ini = c(200,200),
             IC4S1J2U_12_ini = c(200,200),
             
             IC1S1J2U_13_ini = c(200,200),
             IC2S1J2U_13_ini = c(200,200),
             IC3S1J2U_13_ini = c(200,200),
             IC4S1J2U_13_ini = c(200,200),
             
             IC1S1J2U_14_ini = c(200,200),
             IC2S1J2U_14_ini = c(200,200),
             IC3S1J2U_14_ini = c(200,200),
             IC4S1J2U_14_ini = c(200,200),
             
             IC1S1J2U_15_ini = c(200,200),
             IC2S1J2U_15_ini = c(200,200),
             IC3S1J2U_15_ini = c(200,200),
             IC4S1J2U_15_ini = c(200,200),
             
             IC1S1J2U_16_ini = c(200,200),
             IC2S1J2U_16_ini = c(200,200),
             IC3S1J2U_16_ini = c(200,200),
             IC4S1J2U_16_ini = c(200,200),
             
             IC1S1J2U_17_ini = c(200,200),
             IC2S1J2U_17_ini = c(200,200),
             IC3S1J2U_17_ini = c(200,200),
             IC4S1J2U_17_ini = c(200,200),
             
             
             
             IC1S2J2U_10_ini = c(200,200),
             IC2S2J2U_10_ini = c(200,200),
             IC3S2J2U_10_ini = c(200,200),
             IC4S2J2U_10_ini = c(200,200),
             
             IC1S2J2U_11_ini = c(200,200),
             IC2S2J2U_11_ini = c(200,200),
             IC3S2J2U_11_ini = c(200,200),
             IC4S2J2U_11_ini = c(200,200),
             
             IC1S2J2U_12_ini = c(200,200),
             IC2S2J2U_12_ini = c(200,200),
             IC3S2J2U_12_ini = c(200,200),
             IC4S2J2U_12_ini = c(200,200),
             
             IC1S2J2U_13_ini = c(200,200),
             IC2S2J2U_13_ini = c(200,200),
             IC3S2J2U_13_ini = c(200,200),
             IC4S2J2U_13_ini = c(200,200),
             
             IC1S2J2U_14_ini = c(200,200),
             IC2S2J2U_14_ini = c(200,200),
             IC3S2J2U_14_ini = c(200,200),
             IC4S2J2U_14_ini = c(200,200),
             
             IC1S2J2U_15_ini = c(200,200),
             IC2S2J2U_15_ini = c(200,200),
             IC3S2J2U_15_ini = c(200,200),
             IC4S2J2U_15_ini = c(200,200),
             
             IC1S2J2U_16_ini = c(200,200),
             IC2S2J2U_16_ini = c(200,200),
             IC3S2J2U_16_ini = c(200,200),
             IC4S2J2U_16_ini = c(200,200),
             
             IC1S2J2U_17_ini = c(200,200),
             IC2S2J2U_17_ini = c(200,200),
             IC3S2J2U_17_ini = c(200,200),
             IC4S2J2U_17_ini = c(200,200),
             
             
             
             IC1S1J3U_10_ini = c(200,200),
             IC2S1J3U_10_ini = c(200,200),
             IC3S1J3U_10_ini = c(200,200),
             IC4S1J3U_10_ini = c(200,200),
             
             IC1S1J3U_11_ini = c(200,200),
             IC2S1J3U_11_ini = c(200,200),
             IC3S1J3U_11_ini = c(200,200),
             IC4S1J3U_11_ini = c(200,200),
             
             IC1S1J3U_12_ini = c(200,200),
             IC2S1J3U_12_ini = c(200,200),
             IC3S1J3U_12_ini = c(200,200),
             IC4S1J3U_12_ini = c(200,200),
             
             IC1S1J3U_13_ini = c(200,200),
             IC2S1J3U_13_ini = c(200,200),
             IC3S1J3U_13_ini = c(200,200),
             IC4S1J3U_13_ini = c(200,200),
             
             IC1S1J3U_14_ini = c(200,200),
             IC2S1J3U_14_ini = c(200,200),
             IC3S1J3U_14_ini = c(200,200),
             IC4S1J3U_14_ini = c(200,200),
             
             IC1S1J3U_15_ini = c(200,200),
             IC2S1J3U_15_ini = c(200,200),
             IC3S1J3U_15_ini = c(200,200),
             IC4S1J3U_15_ini = c(200,200),
             
             IC1S1J3U_16_ini = c(200,200),
             IC2S1J3U_16_ini = c(200,200),
             IC3S1J3U_16_ini = c(200,200),
             IC4S1J3U_16_ini = c(200,200),
             
             IC1S1J3U_17_ini = c(200,200),
             IC2S1J3U_17_ini = c(200,200),
             IC3S1J3U_17_ini = c(200,200),
             IC4S1J3U_17_ini = c(200,200),
             
             
             
             IC1S2J3U_10_ini = c(200,200),
             IC2S2J3U_10_ini = c(200,200),
             IC3S2J3U_10_ini = c(200,200),
             IC4S2J3U_10_ini = c(200,200),
             
             IC1S2J3U_11_ini = c(200,200),
             IC2S2J3U_11_ini = c(200,200),
             IC3S2J3U_11_ini = c(200,200),
             IC4S2J3U_11_ini = c(200,200),
             
             IC1S2J3U_12_ini = c(200,200),
             IC2S2J3U_12_ini = c(200,200),
             IC3S2J3U_12_ini = c(200,200),
             IC4S2J3U_12_ini = c(200,200),
             
             IC1S2J3U_13_ini = c(200,200),
             IC2S2J3U_13_ini = c(200,200),
             IC3S2J3U_13_ini = c(200,200),
             IC4S2J3U_13_ini = c(200,200),
             
             IC1S2J3U_14_ini = c(200,200),
             IC2S2J3U_14_ini = c(200,200),
             IC3S2J3U_14_ini = c(200,200),
             IC4S2J3U_14_ini = c(200,200),
             
             IC1S2J3U_15_ini = c(200,200),
             IC2S2J3U_15_ini = c(200,200),
             IC3S2J3U_15_ini = c(200,200),
             IC4S2J3U_15_ini = c(200,200),
             
             IC1S2J3U_16_ini = c(200,200),
             IC2S2J3U_16_ini = c(200,200),
             IC3S2J3U_16_ini = c(200,200),
             IC4S2J3U_16_ini = c(200,200),
             
             IC1S2J3U_17_ini = c(200,200),
             IC2S2J3U_17_ini = c(200,200),
             IC3S2J3U_17_ini = c(200,200),
             IC4S2J3U_17_ini = c(200,200),
             
             
             
             IC1S1J4U_10_ini = c(200,200),
             IC2S1J4U_10_ini = c(200,200),
             IC3S1J4U_10_ini = c(200,200),
             IC4S1J4U_10_ini = c(200,200),
             
             IC1S1J4U_11_ini = c(200,200),
             IC2S1J4U_11_ini = c(200,200),
             IC3S1J4U_11_ini = c(200,200),
             IC4S1J4U_11_ini = c(200,200),
             
             IC1S1J4U_12_ini = c(200,200),
             IC2S1J4U_12_ini = c(200,200),
             IC3S1J4U_12_ini = c(200,200),
             IC4S1J4U_12_ini = c(200,200),
             
             IC1S1J4U_13_ini = c(200,200),
             IC2S1J4U_13_ini = c(200,200),
             IC3S1J4U_13_ini = c(200,200),
             IC4S1J4U_13_ini = c(200,200),
             
             IC1S1J4U_14_ini = c(200,200),
             IC2S1J4U_14_ini = c(200,200),
             IC3S1J4U_14_ini = c(200,200),
             IC4S1J4U_14_ini = c(200,200),
             
             IC1S1J4U_15_ini = c(200,200),
             IC2S1J4U_15_ini = c(200,200),
             IC3S1J4U_15_ini = c(200,200),
             IC4S1J4U_15_ini = c(200,200),
             
             IC1S1J4U_16_ini = c(200,200),
             IC2S1J4U_16_ini = c(200,200),
             IC3S1J4U_16_ini = c(200,200),
             IC4S1J4U_16_ini = c(200,200),
             
             IC1S1J4U_17_ini = c(200,200),
             IC2S1J4U_17_ini = c(200,200),
             IC3S1J4U_17_ini = c(200,200),
             IC4S1J4U_17_ini = c(200,200),
             
             
             
             IC1S2J4U_10_ini = c(200,200),
             IC2S2J4U_10_ini = c(200,200),
             IC3S2J4U_10_ini = c(200,200),
             IC4S2J4U_10_ini = c(200,200),
             
             IC1S2J4U_11_ini = c(200,200),
             IC2S2J4U_11_ini = c(200,200),
             IC3S2J4U_11_ini = c(200,200),
             IC4S2J4U_11_ini = c(200,200),
             
             IC1S2J4U_12_ini = c(200,200),
             IC2S2J4U_12_ini = c(200,200),
             IC3S2J4U_12_ini = c(200,200),
             IC4S2J4U_12_ini = c(200,200),
             
             IC1S2J4U_13_ini = c(200,200),
             IC2S2J4U_13_ini = c(200,200),
             IC3S2J4U_13_ini = c(200,200),
             IC4S2J4U_13_ini = c(200,200),
             
             IC1S2J4U_14_ini = c(200,200),
             IC2S2J4U_14_ini = c(200,200),
             IC3S2J4U_14_ini = c(200,200),
             IC4S2J4U_14_ini = c(200,200),
             
             IC1S2J4U_15_ini = c(200,200),
             IC2S2J4U_15_ini = c(200,200),
             IC3S2J4U_15_ini = c(200,200),
             IC4S2J4U_15_ini = c(200,200),
             
             IC1S2J4U_16_ini = c(200,200),
             IC2S2J4U_16_ini = c(200,200),
             IC3S2J4U_16_ini = c(200,200),
             IC4S2J4U_16_ini = c(200,200),
             
             IC1S2J4U_17_ini = c(200,200),
             IC2S2J4U_17_ini = c(200,200),
             IC3S2J4U_17_ini = c(200,200),
             IC4S2J4U_17_ini = c(200,200),
             
             
             
             IC1S1J5U_10_ini = c(200,200),
             IC2S1J5U_10_ini = c(200,200),
             IC3S1J5U_10_ini = c(200,200),
             IC4S1J5U_10_ini = c(200,200),
             
             IC1S1J5U_11_ini = c(200,200),
             IC2S1J5U_11_ini = c(200,200),
             IC3S1J5U_11_ini = c(200,200),
             IC4S1J5U_11_ini = c(200,200),
             
             IC1S1J5U_12_ini = c(200,200),
             IC2S1J5U_12_ini = c(200,200),
             IC3S1J5U_12_ini = c(200,200),
             IC4S1J5U_12_ini = c(200,200),
             
             IC1S1J5U_13_ini = c(200,200),
             IC2S1J5U_13_ini = c(200,200),
             IC3S1J5U_13_ini = c(200,200),
             IC4S1J5U_13_ini = c(200,200),
             
             IC1S1J5U_14_ini = c(200,200),
             IC2S1J5U_14_ini = c(200,200),
             IC3S1J5U_14_ini = c(200,200),
             IC4S1J5U_14_ini = c(200,200),
             
             IC1S1J5U_15_ini = c(200,200),
             IC2S1J5U_15_ini = c(200,200),
             IC3S1J5U_15_ini = c(200,200),
             IC4S1J5U_15_ini = c(200,200),
             
             IC1S1J5U_16_ini = c(200,200),
             IC2S1J5U_16_ini = c(200,200),
             IC3S1J5U_16_ini = c(200,200),
             IC4S1J5U_16_ini = c(200,200),
             
             IC1S1J5U_17_ini = c(200,200),
             IC2S1J5U_17_ini = c(200,200),
             IC3S1J5U_17_ini = c(200,200),
             IC4S1J5U_17_ini = c(200,200),
             
             
             
             IC1S2J5U_10_ini = c(200,200),
             IC2S2J5U_10_ini = c(200,200),
             IC3S2J5U_10_ini = c(200,200),
             IC4S2J5U_10_ini = c(200,200),
             
             IC1S2J5U_11_ini = c(200,200),
             IC2S2J5U_11_ini = c(200,200),
             IC3S2J5U_11_ini = c(200,200),
             IC4S2J5U_11_ini = c(200,200),
             
             IC1S2J5U_12_ini = c(200,200),
             IC2S2J5U_12_ini = c(200,200),
             IC3S2J5U_12_ini = c(200,200),
             IC4S2J5U_12_ini = c(200,200),
             
             IC1S2J5U_13_ini = c(200,200),
             IC2S2J5U_13_ini = c(200,200),
             IC3S2J5U_13_ini = c(200,200),
             IC4S2J5U_13_ini = c(200,200),
             
             IC1S2J5U_14_ini = c(200,200),
             IC2S2J5U_14_ini = c(200,200),
             IC3S2J5U_14_ini = c(200,200),
             IC4S2J5U_14_ini = c(200,200),
             
             IC1S2J5U_15_ini = c(200,200),
             IC2S2J5U_15_ini = c(200,200),
             IC3S2J5U_15_ini = c(200,200),
             IC4S2J5U_15_ini = c(200,200),
             
             IC1S2J5U_16_ini = c(200,200),
             IC2S2J5U_16_ini = c(200,200),
             IC3S2J5U_16_ini = c(200,200),
             IC4S2J5U_16_ini = c(200,200),
             
             IC1S2J5U_17_ini = c(200,200),
             IC2S2J5U_17_ini = c(200,200),
             IC3S2J5U_17_ini = c(200,200),
             IC4S2J5U_17_ini = c(200,200),

             
             EC1S1J1U_10_ini = c(1,0),
             EC2S1J1U_10_ini = c(1,0),
             EC3S1J1U_10_ini = c(1,0),
             EC4S1J1U_10_ini = c(1,0),
             
             EC1S1J1U_11_ini = c(1,0),
             EC2S1J1U_11_ini = c(1,0),
             EC3S1J1U_11_ini = c(1,0),
             EC4S1J1U_11_ini = c(1,0),
             
             EC1S1J1U_12_ini = c(1,0),
             EC2S1J1U_12_ini = c(1,0),
             EC3S1J1U_12_ini = c(1,0),
             EC4S1J1U_12_ini = c(1,0),
             
             EC1S1J1U_13_ini = c(1,0),
             EC2S1J1U_13_ini = c(1,0),
             EC3S1J1U_13_ini = c(1,0),
             EC4S1J1U_13_ini = c(1,0),
             
             EC1S1J1U_14_ini = c(1,0),
             EC2S1J1U_14_ini = c(1,0),
             EC3S1J1U_14_ini = c(1,0),
             EC4S1J1U_14_ini = c(1,0),
             
             EC1S1J1U_15_ini = c(1,0),
             EC2S1J1U_15_ini = c(1,0),
             EC3S1J1U_15_ini = c(1,0),
             EC4S1J1U_15_ini = c(1,0),
             
             EC1S1J1U_16_ini = c(1,0),
             EC2S1J1U_16_ini = c(1,0),
             EC3S1J1U_16_ini = c(1,0),
             EC4S1J1U_16_ini = c(1,0),
             
             EC1S1J1U_17_ini = c(1,0),
             EC2S1J1U_17_ini = c(1,0),
             EC3S1J1U_17_ini = c(1,0),
             EC4S1J1U_17_ini = c(1,0),
             
             
             
             EC1S2J1U_10_ini = c(1,0),
             EC2S2J1U_10_ini = c(1,0),
             EC3S2J1U_10_ini = c(1,0),
             EC4S2J1U_10_ini = c(1,0),
             
             EC1S2J1U_11_ini = c(1,0),
             EC2S2J1U_11_ini = c(1,0),
             EC3S2J1U_11_ini = c(1,0),
             EC4S2J1U_11_ini = c(1,0),
             
             EC1S2J1U_12_ini = c(1,0),
             EC2S2J1U_12_ini = c(1,0),
             EC3S2J1U_12_ini = c(1,0),
             EC4S2J1U_12_ini = c(1,0),
             
             EC1S2J1U_13_ini = c(1,0),
             EC2S2J1U_13_ini = c(1,0),
             EC3S2J1U_13_ini = c(1,0),
             EC4S2J1U_13_ini = c(1,0),
             
             EC1S2J1U_14_ini = c(1,0),
             EC2S2J1U_14_ini = c(1,0),
             EC3S2J1U_14_ini = c(1,0),
             EC4S2J1U_14_ini = c(1,0),
             
             EC1S2J1U_15_ini = c(1,0),
             EC2S2J1U_15_ini = c(1,0),
             EC3S2J1U_15_ini = c(1,0),
             EC4S2J1U_15_ini = c(1,0),
             
             EC1S2J1U_16_ini = c(1,0),
             EC2S2J1U_16_ini = c(1,0),
             EC3S2J1U_16_ini = c(1,0),
             EC4S2J1U_16_ini = c(1,0),
             
             EC1S2J1U_17_ini = c(1,0),
             EC2S2J1U_17_ini = c(1,0),
             EC3S2J1U_17_ini = c(1,0),
             EC4S2J1U_17_ini = c(1,0),
             
             
             
             EC1S1J2U_10_ini = c(1,0),
             EC2S1J2U_10_ini = c(1,0),
             EC3S1J2U_10_ini = c(1,0),
             EC4S1J2U_10_ini = c(1,0),
             
             EC1S1J2U_11_ini = c(1,0),
             EC2S1J2U_11_ini = c(1,0),
             EC3S1J2U_11_ini = c(1,0),
             EC4S1J2U_11_ini = c(1,0),
             
             EC1S1J2U_12_ini = c(1,0),
             EC2S1J2U_12_ini = c(1,0),
             EC3S1J2U_12_ini = c(1,0),
             EC4S1J2U_12_ini = c(1,0),
             
             EC1S1J2U_13_ini = c(1,0),
             EC2S1J2U_13_ini = c(1,0),
             EC3S1J2U_13_ini = c(1,0),
             EC4S1J2U_13_ini = c(1,0),
             
             EC1S1J2U_14_ini = c(1,0),
             EC2S1J2U_14_ini = c(1,0),
             EC3S1J2U_14_ini = c(1,0),
             EC4S1J2U_14_ini = c(1,0),
             
             EC1S1J2U_15_ini = c(1,0),
             EC2S1J2U_15_ini = c(1,0),
             EC3S1J2U_15_ini = c(1,0),
             EC4S1J2U_15_ini = c(1,0),
             
             EC1S1J2U_16_ini = c(1,0),
             EC2S1J2U_16_ini = c(1,0),
             EC3S1J2U_16_ini = c(1,0),
             EC4S1J2U_16_ini = c(1,0),
             
             EC1S1J2U_17_ini = c(1,0),
             EC2S1J2U_17_ini = c(1,0),
             EC3S1J2U_17_ini = c(1,0),
             EC4S1J2U_17_ini = c(1,0),
             
             
             
             EC1S2J2U_10_ini = c(1,0),
             EC2S2J2U_10_ini = c(1,0),
             EC3S2J2U_10_ini = c(1,0),
             EC4S2J2U_10_ini = c(1,0),
             
             EC1S2J2U_11_ini = c(1,0),
             EC2S2J2U_11_ini = c(1,0),
             EC3S2J2U_11_ini = c(1,0),
             EC4S2J2U_11_ini = c(1,0),
             
             EC1S2J2U_12_ini = c(1,0),
             EC2S2J2U_12_ini = c(1,0),
             EC3S2J2U_12_ini = c(1,0),
             EC4S2J2U_12_ini = c(1,0),
             
             EC1S2J2U_13_ini = c(1,0),
             EC2S2J2U_13_ini = c(1,0),
             EC3S2J2U_13_ini = c(1,0),
             EC4S2J2U_13_ini = c(1,0),
             
             EC1S2J2U_14_ini = c(1,0),
             EC2S2J2U_14_ini = c(1,0),
             EC3S2J2U_14_ini = c(1,0),
             EC4S2J2U_14_ini = c(1,0),
             
             EC1S2J2U_15_ini = c(1,0),
             EC2S2J2U_15_ini = c(1,0),
             EC3S2J2U_15_ini = c(1,0),
             EC4S2J2U_15_ini = c(1,0),
             
             EC1S2J2U_16_ini = c(1,0),
             EC2S2J2U_16_ini = c(1,0),
             EC3S2J2U_16_ini = c(1,0),
             EC4S2J2U_16_ini = c(1,0),
             
             EC1S2J2U_17_ini = c(1,0),
             EC2S2J2U_17_ini = c(1,0),
             EC3S2J2U_17_ini = c(1,0),
             EC4S2J2U_17_ini = c(1,0),
             
             
             
             EC1S1J3U_10_ini = c(1,0),
             EC2S1J3U_10_ini = c(1,0),
             EC3S1J3U_10_ini = c(1,0),
             EC4S1J3U_10_ini = c(1,0),
             
             EC1S1J3U_11_ini = c(1,0),
             EC2S1J3U_11_ini = c(1,0),
             EC3S1J3U_11_ini = c(1,0),
             EC4S1J3U_11_ini = c(1,0),
             
             EC1S1J3U_12_ini = c(1,0),
             EC2S1J3U_12_ini = c(1,0),
             EC3S1J3U_12_ini = c(1,0),
             EC4S1J3U_12_ini = c(1,0),
             
             EC1S1J3U_13_ini = c(1,0),
             EC2S1J3U_13_ini = c(1,0),
             EC3S1J3U_13_ini = c(1,0),
             EC4S1J3U_13_ini = c(1,0),
             
             EC1S1J3U_14_ini = c(1,0),
             EC2S1J3U_14_ini = c(1,0),
             EC3S1J3U_14_ini = c(1,0),
             EC4S1J3U_14_ini = c(1,0),
             
             EC1S1J3U_15_ini = c(1,0),
             EC2S1J3U_15_ini = c(1,0),
             EC3S1J3U_15_ini = c(1,0),
             EC4S1J3U_15_ini = c(1,0),
             
             EC1S1J3U_16_ini = c(1,0),
             EC2S1J3U_16_ini = c(1,0),
             EC3S1J3U_16_ini = c(1,0),
             EC4S1J3U_16_ini = c(1,0),
             
             EC1S1J3U_17_ini = c(1,0),
             EC2S1J3U_17_ini = c(1,0),
             EC3S1J3U_17_ini = c(1,0),
             EC4S1J3U_17_ini = c(1,0),
             
             
             
             EC1S2J3U_10_ini = c(1,0),
             EC2S2J3U_10_ini = c(1,0),
             EC3S2J3U_10_ini = c(1,0),
             EC4S2J3U_10_ini = c(1,0),
             
             EC1S2J3U_11_ini = c(1,0),
             EC2S2J3U_11_ini = c(1,0),
             EC3S2J3U_11_ini = c(1,0),
             EC4S2J3U_11_ini = c(1,0),
             
             EC1S2J3U_12_ini = c(1,0),
             EC2S2J3U_12_ini = c(1,0),
             EC3S2J3U_12_ini = c(1,0),
             EC4S2J3U_12_ini = c(1,0),
             
             EC1S2J3U_13_ini = c(1,0),
             EC2S2J3U_13_ini = c(1,0),
             EC3S2J3U_13_ini = c(1,0),
             EC4S2J3U_13_ini = c(1,0),
             
             EC1S2J3U_14_ini = c(1,0),
             EC2S2J3U_14_ini = c(1,0),
             EC3S2J3U_14_ini = c(1,0),
             EC4S2J3U_14_ini = c(1,0),
             
             EC1S2J3U_15_ini = c(1,0),
             EC2S2J3U_15_ini = c(1,0),
             EC3S2J3U_15_ini = c(1,0),
             EC4S2J3U_15_ini = c(1,0),
             
             EC1S2J3U_16_ini = c(1,0),
             EC2S2J3U_16_ini = c(1,0),
             EC3S2J3U_16_ini = c(1,0),
             EC4S2J3U_16_ini = c(1,0),
             
             EC1S2J3U_17_ini = c(1,0),
             EC2S2J3U_17_ini = c(1,0),
             EC3S2J3U_17_ini = c(1,0),
             EC4S2J3U_17_ini = c(1,0),
             
             
             
             EC1S1J4U_10_ini = c(1,0),
             EC2S1J4U_10_ini = c(1,0),
             EC3S1J4U_10_ini = c(1,0),
             EC4S1J4U_10_ini = c(1,0),
             
             EC1S1J4U_11_ini = c(1,0),
             EC2S1J4U_11_ini = c(1,0),
             EC3S1J4U_11_ini = c(1,0),
             EC4S1J4U_11_ini = c(1,0),
             
             EC1S1J4U_12_ini = c(1,0),
             EC2S1J4U_12_ini = c(1,0),
             EC3S1J4U_12_ini = c(1,0),
             EC4S1J4U_12_ini = c(1,0),
             
             EC1S1J4U_13_ini = c(1,0),
             EC2S1J4U_13_ini = c(1,0),
             EC3S1J4U_13_ini = c(1,0),
             EC4S1J4U_13_ini = c(1,0),
             
             EC1S1J4U_14_ini = c(1,0),
             EC2S1J4U_14_ini = c(1,0),
             EC3S1J4U_14_ini = c(1,0),
             EC4S1J4U_14_ini = c(1,0),
             
             EC1S1J4U_15_ini = c(1,0),
             EC2S1J4U_15_ini = c(1,0),
             EC3S1J4U_15_ini = c(1,0),
             EC4S1J4U_15_ini = c(1,0),
             
             EC1S1J4U_16_ini = c(1,0),
             EC2S1J4U_16_ini = c(1,0),
             EC3S1J4U_16_ini = c(1,0),
             EC4S1J4U_16_ini = c(1,0),
             
             EC1S1J4U_17_ini = c(1,0),
             EC2S1J4U_17_ini = c(1,0),
             EC3S1J4U_17_ini = c(1,0),
             EC4S1J4U_17_ini = c(1,0),
             
             
             
             EC1S2J4U_10_ini = c(1,0),
             EC2S2J4U_10_ini = c(1,0),
             EC3S2J4U_10_ini = c(1,0),
             EC4S2J4U_10_ini = c(1,0),
             
             EC1S2J4U_11_ini = c(1,0),
             EC2S2J4U_11_ini = c(1,0),
             EC3S2J4U_11_ini = c(1,0),
             EC4S2J4U_11_ini = c(1,0),
             
             EC1S2J4U_12_ini = c(1,0),
             EC2S2J4U_12_ini = c(1,0),
             EC3S2J4U_12_ini = c(1,0),
             EC4S2J4U_12_ini = c(1,0),
             
             EC1S2J4U_13_ini = c(1,0),
             EC2S2J4U_13_ini = c(1,0),
             EC3S2J4U_13_ini = c(1,0),
             EC4S2J4U_13_ini = c(1,0),
             
             EC1S2J4U_14_ini = c(1,0),
             EC2S2J4U_14_ini = c(1,0),
             EC3S2J4U_14_ini = c(1,0),
             EC4S2J4U_14_ini = c(1,0),
             
             EC1S2J4U_15_ini = c(1,0),
             EC2S2J4U_15_ini = c(1,0),
             EC3S2J4U_15_ini = c(1,0),
             EC4S2J4U_15_ini = c(1,0),
             
             EC1S2J4U_16_ini = c(1,0),
             EC2S2J4U_16_ini = c(1,0),
             EC3S2J4U_16_ini = c(1,0),
             EC4S2J4U_16_ini = c(1,0),
             
             EC1S2J4U_17_ini = c(1,0),
             EC2S2J4U_17_ini = c(1,0),
             EC3S2J4U_17_ini = c(1,0),
             EC4S2J4U_17_ini = c(1,0),
             
             
             
             EC1S1J5U_10_ini = c(1,0),
             EC2S1J5U_10_ini = c(1,0),
             EC3S1J5U_10_ini = c(1,0),
             EC4S1J5U_10_ini = c(1,0),
             
             EC1S1J5U_11_ini = c(1,0),
             EC2S1J5U_11_ini = c(1,0),
             EC3S1J5U_11_ini = c(1,0),
             EC4S1J5U_11_ini = c(1,0),
             
             EC1S1J5U_12_ini = c(1,0),
             EC2S1J5U_12_ini = c(1,0),
             EC3S1J5U_12_ini = c(1,0),
             EC4S1J5U_12_ini = c(1,0),
             
             EC1S1J5U_13_ini = c(1,0),
             EC2S1J5U_13_ini = c(1,0),
             EC3S1J5U_13_ini = c(1,0),
             EC4S1J5U_13_ini = c(1,0),
             
             EC1S1J5U_14_ini = c(1,0),
             EC2S1J5U_14_ini = c(1,0),
             EC3S1J5U_14_ini = c(1,0),
             EC4S1J5U_14_ini = c(1,0),
             
             EC1S1J5U_15_ini = c(1,0),
             EC2S1J5U_15_ini = c(1,0),
             EC3S1J5U_15_ini = c(1,0),
             EC4S1J5U_15_ini = c(1,0),
             
             EC1S1J5U_16_ini = c(1,0),
             EC2S1J5U_16_ini = c(1,0),
             EC3S1J5U_16_ini = c(1,0),
             EC4S1J5U_16_ini = c(1,0),
             
             EC1S1J5U_17_ini = c(1,0),
             EC2S1J5U_17_ini = c(1,0),
             EC3S1J5U_17_ini = c(1,0),
             EC4S1J5U_17_ini = c(1,0),
             
             
             
             EC1S2J5U_10_ini = c(1,0),
             EC2S2J5U_10_ini = c(1,0),
             EC3S2J5U_10_ini = c(1,0),
             EC4S2J5U_10_ini = c(1,0),
             
             EC1S2J5U_11_ini = c(1,0),
             EC2S2J5U_11_ini = c(1,0),
             EC3S2J5U_11_ini = c(1,0),
             EC4S2J5U_11_ini = c(1,0),
             
             EC1S2J5U_12_ini = c(1,0),
             EC2S2J5U_12_ini = c(1,0),
             EC3S2J5U_12_ini = c(1,0),
             EC4S2J5U_12_ini = c(1,0),
             
             EC1S2J5U_13_ini = c(1,0),
             EC2S2J5U_13_ini = c(1,0),
             EC3S2J5U_13_ini = c(1,0),
             EC4S2J5U_13_ini = c(1,0),
             
             EC1S2J5U_14_ini = c(1,0),
             EC2S2J5U_14_ini = c(1,0),
             EC3S2J5U_14_ini = c(1,0),
             EC4S2J5U_14_ini = c(1,0),
             
             EC1S2J5U_15_ini = c(1,0),
             EC2S2J5U_15_ini = c(1,0),
             EC3S2J5U_15_ini = c(1,0),
             EC4S2J5U_15_ini = c(1,0),
             
             EC1S2J5U_16_ini = c(1,0),
             EC2S2J5U_16_ini = c(1,0),
             EC3S2J5U_16_ini = c(1,0),
             EC4S2J5U_16_ini = c(1,0),
             
             EC1S2J5U_17_ini = c(1,0),
             EC2S2J5U_17_ini = c(1,0),
             EC3S2J5U_17_ini = c(1,0),
             EC4S2J5U_17_ini = c(1,0)
      )



mod <- sep_model$new(user = pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
mod_data <- as.data.frame(mod$run(t))
