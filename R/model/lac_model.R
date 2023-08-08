load("/Users/katehayes/CLmodR/output/data/input/v_turn10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/t_turn10.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/t_lac.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/nres.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/res.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/endnr.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/endres.Rdata")

lac_model = odin::odin({
  
  # parameters
  N_gender <- user(2)
  age_up <- user(0.01923076923) # rate of ageing out of your age compartment - 1/52
  
  # what is their distribution across LAC states when kids turn 10 - what compartments do they age into
  # pc_nres[] <- user(0)
  # pc_res[] <- user(0)
  pc_prior[] <- user(0)
  
  # rate of entering care
  # np2lac[] <- user(0)
  # prior2lac[] <- user(0)
  
  #destination on entering care
  # np2nres[] <- user(0)
  # np2res[] <- user(0)
  # 
  # prior2nres[] <- user(0)
  # prior2res[] <- user(0)
  

  #destination of LAC compartments
  nr2nr <- user(0.3) #jsut made these nres ones up lol!!
  nr2res <- user(0.1)
  nr2exit <- user(0.7)
  
  res2nr <- user(0.3)
  res2res <- user(0.2)
  res2exit <- user(0.5)
  
  
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
  
  # dim(np2lac) <- N_gender
  # dim(prior2lac) <- N_gender
  # 
  # dim(np2nres) <- N_gender
  # dim(np2res) <- N_gender
  # dim(prior2nres) <- N_gender
  # dim(prior2res) <- N_gender
  
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
  deriv(LACnev10[]) <- (1-(pc_nres[i]-pc_res[i]-pc_prior[i]))*turn10[i] - age_up*LACnev10[i] - (nev2res10[i] + nev2nres10[i])*LACnev10[i]
  deriv(LACnres10[]) <- pc_nres[i]*turn10[i] - age_up*LACnres10[i] + nev2nres10[i]*LACnev10[i] + pri2nres10[i]*LACprior10[i] - (1-nr2nr)*end_nr[i]*LACnres10[i] + res2nr*end_res[i]*LACres10[i]
  deriv(LACres10[]) <- pc_res[i]*turn10[i] - age_up*LACres10[i] + nev2res10[i]*LACnev10[i] + pri2res10[i]*LACprior10[i] - (1-res2res)*end_res[i]*LACres10[i] + nr2res*end_nr[i]*LACnres10[i]
  deriv(LACprior10[]) <- pc_prior[i]*turn10[i] - age_up*LACprior10[i] - (pri2nres10[i]+pri2res10[i])*LACprior10[i] + nr2exit*end_nr[i]*LACnres10[i] + res2exit*end_res[i]*LACres10[i]
  
  deriv(LACnev11[]) <- age_up*LACnev10[i] - (nev2res11[i] + nev2nres11[i])*LACnev11[i] - age_up*LACnev11[i]
  deriv(LACnres11[]) <- age_up*LACnres10[i] + nev2nres11[i]*LACnev11[i] + pri2nres11[i]*LACprior11[i] - (1-nr2nr)*end_nr[i]*LACnres11[i] - age_up*LACnres11[i] + res2nr*end_res[i]*LACres11[i]
  deriv(LACres11[]) <- age_up*LACres10[i] + nev2res11[i]*LACnev11[i] + pri2res11[i]*LACprior11[i] - (1-res2res)*end_res[i]*LACres11[i] - age_up*LACres11[i] + nr2res*end_nr[i]*LACnres11[i]
  deriv(LACprior11[]) <- age_up*LACprior10[i] - (pri2nres11[i]+pri2res11[i])*LACprior11[i] + nr2exit*end_nr[i]*LACnres11[i] + res2exit*end_res[i]*LACres11[i] - age_up*LACprior11[i]
  
  deriv(LACnev12[]) <- age_up*LACnev11[i] - (nev2res12[i] + nev2nres12[i])*LACnev12[i] - age_up*LACnev12[i]
  deriv(LACnres12[]) <- age_up*LACnres11[i] + nev2nres12[i]*LACnev12[i] + pri2nres12[i]*LACprior12[i] - (1-nr2nr)*end_nr[i]*LACnres12[i] - age_up*LACnres12[i] + res2nr*end_res[i]*LACres12[i]
  deriv(LACres12[]) <- age_up*LACres11[i] + nev2res12[i]*LACnev12[i] + pri2res12[i]*LACprior12[i] - (1-res2res)*end_res[i]*LACres12[i] - age_up*LACres12[i] + nr2res*end_nr[i]*LACnres12[i]
  deriv(LACprior12[]) <- age_up*LACprior11[i] - (pri2nres12[i]+pri2res12[i])*LACprior12[i] + nr2exit*end_nr[i]*LACnres12[i] + res2exit*end_res[i]*LACres12[i] - age_up*LACprior12[i]
  
  deriv(LACnev13[]) <- age_up*LACnev12[i] - (nev2res13[i] + nev2nres13[i])*LACnev13[i] - age_up*LACnev13[i]
  deriv(LACnres13[]) <- age_up*LACnres12[i] + nev2nres13[i]*LACnev13[i] + pri2nres13[i]*LACprior13[i] - (1-nr2nr)*end_nr[i]*LACnres13[i] - age_up*LACnres13[i] + res2nr*end_res[i]*LACres13[i]
  deriv(LACres13[]) <- age_up*LACres12[i] + nev2res13[i]*LACnev13[i] + pri2res13[i]*LACprior13[i] - (1-res2res)*end_res[i]*LACres13[i] - age_up*LACres13[i] + nr2res*end_nr[i]*LACnres13[i]
  deriv(LACprior13[]) <- age_up*LACprior12[i] - (pri2nres13[i]+pri2res13[i])*LACprior13[i] + nr2exit*end_nr[i]*LACnres13[i] + res2exit*end_res[i]*LACres13[i] - age_up*LACprior13[i]
  
  deriv(LACnev14[]) <- age_up*LACnev13[i] - (nev2res14[i] + nev2nres14[i])*LACnev14[i] - age_up*LACnev14[i]
  deriv(LACnres14[]) <- age_up*LACnres13[i] + nev2nres14[i]*LACnev14[i] + pri2nres14[i]*LACprior14[i] - (1-nr2nr)*end_nr[i]*LACnres14[i] - age_up*LACnres14[i] + res2nr*end_res[i]*LACres14[i]
  deriv(LACres14[]) <- age_up*LACres13[i] + nev2res14[i]*LACnev14[i] + pri2res14[i]*LACprior14[i] - (1-res2res)*end_res[i]*LACres14[i] - age_up*LACres14[i] + nr2res*end_nr[i]*LACnres14[i]
  deriv(LACprior14[]) <- age_up*LACprior13[i] - (pri2nres14[i]+pri2res14[i])*LACprior14[i] + nr2exit*end_nr[i]*LACnres14[i] + res2exit*end_res[i]*LACres14[i] - age_up*LACprior14[i]
  
  deriv(LACnev15[]) <- age_up*LACnev14[i] - (nev2res15[i] + nev2nres15[i])*LACnev15[i] - age_up*LACnev15[i]
  deriv(LACnres15[]) <- age_up*LACnres14[i] + nev2nres15[i]*LACnev15[i] + pri2nres15[i]*LACprior15[i] - (1-nr2nr)*end_nr[i]*LACnres15[i] - age_up*LACnres15[i] + res2nr*end_res[i]*LACres15[i]
  deriv(LACres15[]) <- age_up*LACres14[i] + nev2res15[i]*LACnev15[i] + pri2res15[i]*LACprior15[i] - (1-res2res)*end_res[i]*LACres15[i] - age_up*LACres15[i] + nr2res*end_nr[i]*LACnres15[i]
  deriv(LACprior15[]) <- age_up*LACprior14[i] - (pri2nres15[i]+pri2res15[i])*LACprior15[i] + nr2exit*end_nr[i]*LACnres15[i] + res2exit*end_res[i]*LACres15[i] - age_up*LACprior15[i]
  
  deriv(LACnev16[]) <- age_up*LACnev15[i] - (nev2res16[i] + nev2nres16[i])*LACnev16[i] - age_up*LACnev16[i]
  deriv(LACnres16[]) <- age_up*LACnres15[i] + nev2nres16[i]*LACnev16[i] + pri2nres16[i]*LACprior16[i] - (1-nr2nr)*end_nr[i]*LACnres16[i] - age_up*LACnres16[i] + res2nr*end_res[i]*LACres16[i]
  deriv(LACres16[]) <- age_up*LACres15[i] + nev2res16[i]*LACnev16[i] + pri2res16[i]*LACprior16[i] - (1-res2res)*end_res[i]*LACres16[i] - age_up*LACres16[i] + nr2res*end_nr[i]*LACnres16[i]
  deriv(LACprior16[]) <- age_up*LACprior15[i] - (pri2nres16[i]+pri2res16[i])*LACprior16[i] + nr2exit*end_nr[i]*LACnres16[i] + res2exit*end_res[i]*LACres16[i] - age_up*LACprior16[i]
  
  deriv(LACnev17[]) <- age_up*LACnev16[i] - (nev2res17[i] + nev2nres17[i])*LACnev17[i] - age_up*LACnev17[i]
  deriv(LACnres17[]) <- age_up*LACnres16[i] + nev2nres17[i]*LACnev17[i] + pri2nres17[i]*LACprior17[i] - (1-nr2nr)*end_nr[i]*LACnres17[i] - age_up*LACnres17[i] + res2nr*end_res[i]*LACres17[i]
  deriv(LACres17[]) <- age_up*LACres16[i] + nev2res17[i]*LACnev17[i] + pri2res17[i]*LACprior17[i] - (1-res2res)*end_res[i]*LACres17[i] - age_up*LACres17[i] + nr2res*end_nr[i]*LACnres17[i]
  deriv(LACprior17[]) <- age_up*LACprior16[i] - (pri2nres17[i]+pri2res17[i])*LACprior17[i] + nr2exit*end_nr[i]*LACnres17[i] + res2exit*end_res[i]*LACres17[i] - age_up*LACprior17[i]
  
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
  
  
  
  end_nr[] <- interpolate(tlac, enr, "linear")
  dim(end_nr) <- N_gender
  enr[, ] <- user()
  dim(enr) <- c(length(tlac), length(end_nr))
  
  end_res[] <- interpolate(tlac, eres, "linear")
  dim(end_res) <- N_gender
  eres[, ] <- user()
  dim(eres) <- c(length(tlac), length(end_res))
  
  
  nev2nres10[] <- interpolate(tlac, n2nres10, "linear")
  dim(nev2nres10) <- N_gender
  n2nres10[, ] <- user()
  dim(n2nres10) <- c(length(tlac), length(nev2nres10))
  
  
  nev2nres11[] <- interpolate(tlac, n2nres11, "linear")
  dim(nev2nres11) <- N_gender
  n2nres11[, ] <- user()
  dim(n2nres11) <- c(length(tlac), length(nev2nres11))
  
  nev2nres12[] <- interpolate(tlac, n2nres12, "linear")
  dim(nev2nres12) <- N_gender
  n2nres12[, ] <- user()
  dim(n2nres12) <- c(length(tlac), length(nev2nres12))
  
  nev2nres13[] <- interpolate(tlac, n2nres13, "linear")
  dim(nev2nres13) <- N_gender
  n2nres13[, ] <- user()
  dim(n2nres13) <- c(length(tlac), length(nev2nres13))
  
  nev2nres14[] <- interpolate(tlac, n2nres14, "linear")
  dim(nev2nres14) <- N_gender
  n2nres14[, ] <- user()
  dim(n2nres14) <- c(length(tlac), length(nev2nres14))
  
  nev2nres15[] <- interpolate(tlac, n2nres15, "linear")
  dim(nev2nres15) <- N_gender
  n2nres15[, ] <- user()
  dim(n2nres15) <- c(length(tlac), length(nev2nres15))
  
  nev2nres16[] <- interpolate(tlac, n2nres16, "linear")
  dim(nev2nres16) <- N_gender
  n2nres16[, ] <- user()
  dim(n2nres16) <- c(length(tlac), length(nev2nres16))
  
  nev2nres17[] <- interpolate(tlac, n2nres17, "linear")
  dim(nev2nres17) <- N_gender
  n2nres17[, ] <- user()
  dim(n2nres17) <- c(length(tlac), length(nev2nres17))
  
  
  
  
  nev2res10[] <- interpolate(tlac, n2res10, "linear")
  dim(nev2res10) <- N_gender
  n2res10[, ] <- user()
  dim(n2res10) <- c(length(tlac), length(nev2res10))
  
  nev2res11[] <- interpolate(tlac, n2res11, "linear")
  dim(nev2res11) <- N_gender
  n2res11[, ] <- user()
  dim(n2res11) <- c(length(tlac), length(nev2res11))
  
  nev2res12[] <- interpolate(tlac, n2res12, "linear")
  dim(nev2res12) <- N_gender
  n2res12[, ] <- user()
  dim(n2res12) <- c(length(tlac), length(nev2res12))
  
  nev2res13[] <- interpolate(tlac, n2res13, "linear")
  dim(nev2res13) <- N_gender
  n2res13[, ] <- user()
  dim(n2res13) <- c(length(tlac), length(nev2res13))
  
  nev2res14[] <- interpolate(tlac, n2res14, "linear")
  dim(nev2res14) <- N_gender
  n2res14[, ] <- user()
  dim(n2res14) <- c(length(tlac), length(nev2res14))
  
  nev2res15[] <- interpolate(tlac, n2res15, "linear")
  dim(nev2res15) <- N_gender
  n2res15[, ] <- user()
  dim(n2res15) <- c(length(tlac), length(nev2res15))
  
  nev2res16[] <- interpolate(tlac, n2res16, "linear")
  dim(nev2res16) <- N_gender
  n2res16[, ] <- user()
  dim(n2res16) <- c(length(tlac), length(nev2res16))
  
  nev2res17[] <- interpolate(tlac, n2res17, "linear")
  dim(nev2res17) <- N_gender
  n2res17[, ] <- user()
  dim(n2res17) <- c(length(tlac), length(nev2res17))
  
  
  pri2nres10[] <- interpolate(tlac, p2nres10, "linear")
  dim(pri2nres10) <- N_gender
  p2nres10[, ] <- user()
  dim(p2nres10) <- c(length(tlac), length(pri2nres10))
  
  pri2nres11[] <- interpolate(tlac, p2nres11, "linear")
  dim(pri2nres11) <- N_gender
  p2nres11[, ] <- user()
  dim(p2nres11) <- c(length(tlac), length(pri2nres11))
  
  pri2nres12[] <- interpolate(tlac, p2nres12, "linear")
  dim(pri2nres12) <- N_gender
  p2nres12[, ] <- user()
  dim(p2nres12) <- c(length(tlac), length(pri2nres12))
  
  pri2nres13[] <- interpolate(tlac, p2nres13, "linear")
  dim(pri2nres13) <- N_gender
  p2nres13[, ] <- user()
  dim(p2nres13) <- c(length(tlac), length(pri2nres13))
  
  pri2nres14[] <- interpolate(tlac, p2nres14, "linear")
  dim(pri2nres14) <- N_gender
  p2nres14[, ] <- user()
  dim(p2nres14) <- c(length(tlac), length(pri2nres14))
  
  pri2nres15[] <- interpolate(tlac, p2nres15, "linear")
  dim(pri2nres15) <- N_gender
  p2nres15[, ] <- user()
  dim(p2nres15) <- c(length(tlac), length(pri2nres15))
  
  pri2nres16[] <- interpolate(tlac, p2nres16, "linear")
  dim(pri2nres16) <- N_gender
  p2nres16[, ] <- user()
  dim(p2nres16) <- c(length(tlac), length(pri2nres16))
  
  pri2nres17[] <- interpolate(tlac, p2nres17, "linear")
  dim(pri2nres17) <- N_gender
  p2nres17[, ] <- user()
  dim(p2nres17) <- c(length(tlac), length(pri2nres17))
  
  
  
  
  pri2res10[] <- interpolate(tlac, p2res10, "linear")
  dim(pri2res10) <- N_gender
  p2res10[, ] <- user()
  dim(p2res10) <- c(length(tlac), length(pri2res10))
  
  pri2res11[] <- interpolate(tlac, p2res11, "linear")
  dim(pri2res11) <- N_gender
  p2res11[, ] <- user()
  dim(p2res11) <- c(length(tlac), length(pri2res11))
  
  pri2res12[] <- interpolate(tlac, p2res12, "linear")
  dim(pri2res12) <- N_gender
  p2res12[, ] <- user()
  dim(p2res12) <- c(length(tlac), length(pri2res12))
  
  pri2res13[] <- interpolate(tlac, p2res13, "linear")
  dim(pri2res13) <- N_gender
  p2res13[, ] <- user()
  dim(p2res13) <- c(length(tlac), length(pri2res13))
  
  pri2res14[] <- interpolate(tlac, p2res14, "linear")
  dim(pri2res14) <- N_gender
  p2res14[, ] <- user()
  dim(p2res14) <- c(length(tlac), length(pri2res14))
  
  pri2res15[] <- interpolate(tlac, p2res15, "linear")
  dim(pri2res15) <- N_gender
  p2res15[, ] <- user()
  dim(p2res15) <- c(length(tlac), length(pri2res15))
  
  pri2res16[] <- interpolate(tlac, p2res16, "linear")
  dim(pri2res16) <- N_gender
  p2res16[, ] <- user()
  dim(p2res16) <- c(length(tlac), length(pri2res16))
  
  pri2res17[] <- interpolate(tlac, p2res17, "linear")
  dim(pri2res17) <- N_gender
  p2res17[, ] <- user()
  dim(p2res17) <- c(length(tlac), length(pri2res17))
  
  
  
  
  
  
  
  # ageing in at 10, what state do you occupy
  output(pc_nres) <- pc_nres
  output(pc_res) <- pc_res
  output(pc_prior) <- pc_prior
  
  # rate of entering care/#destination on entering care

  
  output(pri2res10) <- pri2res10
  output(pri2res11) <- pri2res11
  output(pri2res12) <- pri2res12
  output(pri2res13) <- pri2res13
  output(pri2res14) <- pri2res14
  output(pri2res15) <- pri2res15
  output(pri2res16) <- pri2res16
  output(pri2res17) <- pri2res17
  
  output(pri2nres10) <- pri2nres10
  output(pri2nres11) <- pri2nres11
  output(pri2nres12) <- pri2nres12
  output(pri2nres13) <- pri2nres13
  output(pri2nres14) <- pri2nres14
  output(pri2nres15) <- pri2nres15
  output(pri2nres16) <- pri2nres16
  output(pri2nres17) <- pri2nres17
  
  
  output(nev2res10) <- nev2res10
  output(nev2res11) <- nev2res11
  output(nev2res12) <- nev2res12
  output(nev2res13) <- nev2res13
  output(nev2res14) <- nev2res14
  output(nev2res15) <- nev2res15
  output(nev2res16) <- nev2res16
  output(nev2res17) <- nev2res17
  
  output(nev2nres10) <- nev2nres10
  output(nev2nres11) <- nev2nres11
  output(nev2nres12) <- nev2nres12
  output(nev2nres13) <- nev2nres13
  output(nev2nres14) <- nev2nres14
  output(nev2nres15) <- nev2nres15
  output(nev2nres16) <- nev2nres16
  output(nev2nres17) <- nev2nres17
  
  
  # duration of care states
  output(end_nr) <- end_nr
  output(end_res) <- end_res
  
  # end of nonres care episode, where do you go next
  output(nr2nr) <- nr2nr
  output(nr2res) <- nr2res
  output(nr2exit) <- nr2exit
  
  # end of res care episode, where do you go next
  output(res2nr) <- res2nr
  output(res2res) <- res2res
  output(res2exit) <- res2exit
  
},
target = 'c')  



lac_pars <- list(tt = t_turn10,
                 y = v_turn10,
                 
                 tlac = t_lac,
                 nrlac = nres,
                 rlac = res,
                 
                 enr = endnr,
                 eres = endres,
                 
                 n2nres10 = never2nres10,
                 n2nres11 = never2nres11,
                 n2nres12 = never2nres12,
                 n2nres13 = never2nres13,
                 n2nres14 = never2nres14,
                 n2nres15 = never2nres15,
                 n2nres16 = never2nres16,
                 n2nres17 = never2nres17,
                
                 n2res10 = never2res10,
                 n2res11 = never2res11,
                 n2res12 = never2res12,
                 n2res13 = never2res13,
                 n2res14 = never2res14,
                 n2res15 = never2res15,
                 n2res16 = never2res16,
                 n2res17 = never2res17,
                 
                 p2nres10 = prior2nres10,
                 p2nres11 = prior2nres11,
                 p2nres12 = prior2nres12,
                 p2nres13 = prior2nres13,
                 p2nres14 = prior2nres14,
                 p2nres15 = prior2nres15,
                 p2nres16 = prior2nres16,
                 p2nres17 = prior2nres17,
                 
                 p2res10 = prior2res10,
                 p2res11 = prior2res11,
                 p2res12 = prior2res12,
                 p2res13 = prior2res13,
                 p2res14 = prior2res14,
                 p2res15 = prior2res15,
                 p2res16 = prior2res16,
                 p2res17 = prior2res17,
                 
      
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
                 pc_prior = c(0.0066,0.0066)
                 
                 # rate of entering care
                 # np2lac = c(0.0000769,0.0000769),
                 # prior2lac = c(0.006,0.006)
                 
                 #destination on entering care
                 # np2nres = c(0.76,0.86),
                 # np2res = c(0.24,0.14),
                 # 
                 # prior2nres = c(0.7,0.8),
                 # prior2res = c(0.3,0.2)
)


mod <- lac_model$new(user = lac_pars)
t <- seq(0, 520, length.out = 1041)  #from 0 to 10 years, two steps a week or something
LAC_data <- as.data.frame(mod$run(t))


mod_states <- LAC_data %>%
  select(c(starts_with("LAC"), t)) %>% 
  pivot_longer(-t, names_to = "state", values_to = "count") %>%
  mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
         gender = if_else(grepl("\\[1\\]", state), "Boys", "Girls")) %>% 
  mutate(lac = ifelse(grepl("nev", state), "Never", NA),
         lac = ifelse(grepl("nres", state), "Not residential", lac),
         lac = ifelse(grepl("Cres", state), "Residential", lac),
         lac = ifelse(grepl("prior", state), "Prior", lac)) %>% 
  select(-state) %>% 
  group_by(t, gender, age)

mod_params <- LAC_data %>%
  select(-c(starts_with("LAC"))) %>% 
  pivot_longer(-t,
               names_to = "param",
               values_to = "value") %>% 
  filter(grepl("\\[", param)) %>% 
  mutate(gender = if_else(grepl("\\[1\\]", param), "Boys", "Girls")) %>% 
  bind_rows(LAC_data %>%
              select(-c(starts_with("LAC"))) %>% 
              pivot_longer(-t,
                           names_to = "param",
                           values_to = "value") %>% 
              filter(!grepl("\\[", param)) %>%
              mutate(gender = "Boys")) %>% 
  bind_rows(LAC_data %>%
              select(-c(starts_with("LAC"))) %>% 
              pivot_longer(-t,
                           names_to = "param",
                           values_to = "value") %>% 
              filter(!grepl("\\[", param)) %>%
              mutate(gender = "Girls")) %>% 
  mutate(param = str_remove_all(param, "\\[1\\]")) %>% 
  mutate(param = str_remove_all(param, "\\[2\\]")) %>% 
  arrange(t) %>% 
  mutate(age = as.numeric(str_extract_all(param, "(\\d{2})")),
         age = ifelse(is.na(age), "constant", age),
         param = str_remove_all(param, "(\\d{2})")) %>% 
  pivot_wider(names_from = age,
              values_from = value) %>% 
  mutate(across(starts_with("1"), ~ifelse(is.na(.x), constant, .x))) %>% 
  select(-constant) %>% 
  pivot_longer(starts_with("1"),
               names_to = "age",
               values_to = "value") %>% 
  pivot_wider(names_from = param,
              values_from = value) %>% 
  mutate(age = as.numeric(age))



# making flows

# mod_flows <- mod_states %>% 
#   pivot_wider(names_from = lac,
#               values_from = count) %>% 
#   full_join(mod_params) %>% 
#   mutate(NP2NRES = np2nres*np2lac*Never,
#          NP2RES = np2res*np2lac*Never,
#          
#          NRES2NRES = nr2nr*end_nr*`Not residential`,
#          NRES2RES = nr2res*end_nr*`Not residential`,
#          NRES2PRIOR = nr2exit*end_nr*`Not residential`,
#          
#          RES2NRES = res2nr*end_res*Residential,
#          RES2RES = res2res*end_res*Residential,
#          RES2PRIOR = res2exit*end_res*Residential,
#          
#          PRIOR2NRES = prior2nres*prior2lac*Prior,
#          PRIOR2RES = prior2res*prior2lac*Prior,
#          
#          NRESinflow = NP2NRES + NRES2NRES + RES2NRES + PRIOR2NRES,
#          RESinflow = NP2RES + NRES2RES + RES2RES + PRIOR2RES,
#          LACoutflow = NRES2PRIOR + RES2PRIOR) %>% 
#   mutate(check_resnp = NP2RES/RESinflow)
  


# counting the size of flows to/from LAC for calibration - you can prob do this after output but, writing here for now
# NP2NRES10[] <- np2nres[i]*np2lac[i]*LACnev10[i]
# NP2RES10[] <- np2res[i]*np2lac[i]*LACnev10[i]
# 
# NRES2NRES10[] <- nr2nr*end_nr*LACnres10[i]
# NRES2RES10[] <- nr2res*end_nr*LACnres10[i]
# NRES2PRIOR10[] <- nr2exit*end_nr*LACnres10[i]
# 
# RES2NRES10[] <- res2nr*end_res*LACres10[i]
# RES2RES10[] <- res2res*end_res*LACres10[i]
# RES2PRIOR10[] <- res2exit*end_res*LACres10[i]
# 
# PRIOR2NRES10[] <- prior2nres[i]*prior2lac[i]*LACprior10[i]
# PRIOR2RES10[] <- prior2res[i]*prior2lac[i]*LACprior10[i]
# 
# NRESinflow10[] <- NP2NRES10[i] + NRES2NRES10[i] + RES2NRES10[i] + PRIOR2NRES10[i]
# RESinflow10[] <- NP2RES10[i] + NRES2RES10[i] + RES2RES10[i] + PRIOR2RES10[i]
# LACoutflow10[] <- NRES2PRIOR10[i] + RES2PRIOR10[i]
# 
# 
# # conditions from literature
# # flows into res care
# # 10% of 10-13 year olds and 20% of 14-16 year olds enter res care with no prior care placement
# NP2RES10[i]/RESinflow10[i] ~ 0.1
# 
# # 40% of kids going to res care come direct from foster placement breakdown (in the small sample)
# # but for kids who are only ten, more of them are probably coming from foster and from adoption breakdown
# # so lets make it like 6% from adoption, 60% from foster plus kinship care breakdown? remaining 6% from other family breakdowns?
# NRES2RES10[i]/RESinflow10[i] ~ 0.6
# 
# # 15% going to res come direct from other care homes - 3% come at the expiry of a secure order
# RES2RES10[i]/RESinflow10[i] ~ 0.18
# 
# # 3% going to res come from an adoption breakdown, lets say 6 for 10 year olds though plus 6% from family breakdown
# PRIOR2RES10[i]/RESinflow10[i] ~ 0.12
# 
# # From the whole residential care sample, 12% returned home to live with someone with parental responsibility after their first residential care placement
# # 
# 
# # 50% of placements finishing for 10-17 year olds are their first ever placement
# # (so basically there should always be approx equal numbers comeing into the wo lac states from either non-lac side?)
# NP2NRES[i] + NP2RES[i] ~ PRIOR2NRES[i] + PRIOR2RES[i]
# 
# # (45\%) go on toexperience at least one more residential care placement at some point after their first residential care placement.. 
# #  restricting only to children who had a further episode of care (n=2,320, 80\% of the full sample) we find that 40\% (n=930) went into another residential care placement immediately 
# n=2,913 is full sample
# 55% only have 1 res placement
# n=590 their first res placement is their last care placement
# 45% have at least 2
# n=930 ie 31.9% have another placement immediately after their first
# 
# 
# OK LETS JUST GUESS & say that 40% of the people in the res care state are first time -
#   so then res2exit = 0.4*0.2 at least 
# # In fact, from the whole residential care sample, 12% (n=360 of 2,913 children) returned home to live with someone with parental responsibility after their first residential care placement, but only half of these children do not re-enter care.  
# so then res2exit, add an extra 6% for the people who will come back
# so thats res2exit at least 0.4*0.26
# 
# so again, 40% of the people are first time, so 
# res2res = 0.4*0.32 which is 0.13 at least - and then people probably go straight back after their 2nd and third too so..
# res2res = lets say 0.2??
#   
#   
#   
# # if about 20% of people in res care have no priors, and res care is 12% of all care, thats like 0.2x0.12 that go to res on their first care placement?