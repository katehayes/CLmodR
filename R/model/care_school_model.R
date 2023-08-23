load("/Users/katehayes/CLmodR/output/data/input/v_turn10.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/t_turn10.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/t_lac.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/nres.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/res.Rdata")

load("/Users/katehayes/CLmodR/output/data/input/endnr.Rdata")
load("/Users/katehayes/CLmodR/output/data/input/endres.Rdata")

casc_model = odin::odin({
  
  # parameters
  N_gender <- user(2)
  age_up <- user(0.01923076923) # rate of ageing out of your age compartment - 1/52
  
  # what is their distribution across LAC states when kids turn 10 - what compartments do they age into
  # pc_nres[] <- user(0)
  # pc_res[] <- user(0)
  # pc_prior[] <- user(0)
  
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
  ILACnev10_ini[] <- user(0) 
  ILACnres10_ini[] <- user(0) 
  ILACres10_ini[] <- user(0) 
  ILACprior10_ini[] <- user(0) 
  
  ILACnev11_ini[] <- user(0) 
  ILACnres11_ini[] <- user(0) 
  ILACres11_ini[] <- user(0) 
  ILACprior11_ini[] <- user(0) 
  
  ILACnev12_ini[] <- user(0) 
  ILACnres12_ini[] <- user(0) 
  ILACres12_ini[] <- user(0) 
  ILACprior12_ini[] <- user(0) 
  
  ILACnev13_ini[] <- user(0) 
  ILACnres13_ini[] <- user(0) 
  ILACres13_ini[] <- user(0) 
  ILACprior13_ini[] <- user(0) 
  
  ILACnev14_ini[] <- user(0) 
  ILACnres14_ini[] <- user(0) 
  ILACres14_ini[] <- user(0) 
  ILACprior14_ini[] <- user(0) 
  
  ILACnev15_ini[] <- user(0) 
  ILACnres15_ini[] <- user(0) 
  ILACres15_ini[] <- user(0) 
  ILACprior15_ini[] <- user(0) 
  
  ILACnev16_ini[] <- user(0) 
  ILACnres16_ini[] <- user(0) 
  ILACres16_ini[] <- user(0) 
  ILACprior16_ini[] <- user(0) 
  
  ILACnev17_ini[] <- user(0) 
  ILACnres17_ini[] <- user(0) 
  ILACres17_ini[] <- user(0) 
  ILACprior17_ini[] <- user(0) 
  
  
  ELACnev10_ini[] <- user(0) 
  ELACnres10_ini[] <- user(0) 
  ELACres10_ini[] <- user(0) 
  ELACprior10_ini[] <- user(0) 
  
  ELACnev11_ini[] <- user(0) 
  ELACnres11_ini[] <- user(0) 
  ELACres11_ini[] <- user(0) 
  ELACprior11_ini[] <- user(0) 
  
  ELACnev12_ini[] <- user(0) 
  ELACnres12_ini[] <- user(0) 
  ELACres12_ini[] <- user(0) 
  ELACprior12_ini[] <- user(0) 
  
  ELACnev13_ini[] <- user(0) 
  ELACnres13_ini[] <- user(0) 
  ELACres13_ini[] <- user(0) 
  ELACprior13_ini[] <- user(0) 
  
  ELACnev14_ini[] <- user(0) 
  ELACnres14_ini[] <- user(0) 
  ELACres14_ini[] <- user(0) 
  ELACprior14_ini[] <- user(0) 
  
  ELACnev15_ini[] <- user(0) 
  ELACnres15_ini[] <- user(0) 
  ELACres15_ini[] <- user(0) 
  ELACprior15_ini[] <- user(0) 
  
  ELACnev16_ini[] <- user(0) 
  ELACnres16_ini[] <- user(0) 
  ELACres16_ini[] <- user(0) 
  ELACprior16_ini[] <- user(0) 
  
  ELACnev17_ini[] <- user(0) 
  ELACnres17_ini[] <- user(0) 
  ELACres17_ini[] <- user(0) 
  ELACprior17_ini[] <- user(0) 
  
  
  
  initial(ILACnev10[]) <- ILACnev10_ini[i]
  initial(ILACnres10[]) <- ILACnres10_ini[i]
  initial(ILACres10[]) <- ILACres10_ini[i]
  initial(ILACprior10[]) <- ILACprior10_ini[i]
  
  initial(ILACnev11[]) <- ILACnev11_ini[i]
  initial(ILACnres11[]) <- ILACnres11_ini[i]
  initial(ILACres11[]) <- ILACres11_ini[i]
  initial(ILACprior11[]) <- ILACprior11_ini[i]
  
  initial(ILACnev12[]) <- ILACnev12_ini[i]
  initial(ILACnres12[]) <- ILACnres12_ini[i]
  initial(ILACres12[]) <- ILACres12_ini[i]
  initial(ILACprior12[]) <- ILACprior12_ini[i]
  
  initial(ILACnev13[]) <- ILACnev13_ini[i]
  initial(ILACnres13[]) <- ILACnres13_ini[i]
  initial(ILACres13[]) <- ILACres13_ini[i]
  initial(ILACprior13[]) <- ILACprior13_ini[i]
  
  initial(ILACnev14[]) <- ILACnev14_ini[i]
  initial(ILACnres14[]) <- ILACnres14_ini[i]
  initial(ILACres14[]) <- ILACres14_ini[i]
  initial(ILACprior14[]) <- ILACprior14_ini[i]
  
  initial(ILACnev15[]) <- ILACnev15_ini[i]
  initial(ILACnres15[]) <- ILACnres15_ini[i]
  initial(ILACres15[]) <- ILACres15_ini[i]
  initial(ILACprior15[]) <- ILACprior15_ini[i]
  
  initial(ILACnev16[]) <- ILACnev16_ini[i]
  initial(ILACnres16[]) <- ILACnres16_ini[i]
  initial(ILACres16[]) <- ILACres16_ini[i]
  initial(ILACprior16[]) <- ILACprior16_ini[i]
  
  initial(ILACnev17[]) <- ILACnev17_ini[i]
  initial(ILACnres17[]) <- ILACnres17_ini[i]
  initial(ILACres17[]) <- ILACres17_ini[i]
  initial(ILACprior17[]) <- ILACprior17_ini[i]
  
  
  initial(ELACnev10[]) <- ELACnev10_ini[i]
  initial(ELACnres10[]) <- ELACnres10_ini[i]
  initial(ELACres10[]) <- ELACres10_ini[i]
  initial(ELACprior10[]) <- ELACprior10_ini[i]
  
  initial(ELACnev11[]) <- ELACnev11_ini[i]
  initial(ELACnres11[]) <- ELACnres11_ini[i]
  initial(ELACres11[]) <- ELACres11_ini[i]
  initial(ELACprior11[]) <- ELACprior11_ini[i]
  
  initial(ELACnev12[]) <- ELACnev12_ini[i]
  initial(ELACnres12[]) <- ELACnres12_ini[i]
  initial(ELACres12[]) <- ELACres12_ini[i]
  initial(ELACprior12[]) <- ELACprior12_ini[i]
  
  initial(ELACnev13[]) <- ELACnev13_ini[i]
  initial(ELACnres13[]) <- ELACnres13_ini[i]
  initial(ELACres13[]) <- ELACres13_ini[i]
  initial(ELACprior13[]) <- ELACprior13_ini[i]
  
  initial(ELACnev14[]) <- ELACnev14_ini[i]
  initial(ELACnres14[]) <- ELACnres14_ini[i]
  initial(ELACres14[]) <- ELACres14_ini[i]
  initial(ELACprior14[]) <- ELACprior14_ini[i]
  
  initial(ELACnev15[]) <- ELACnev15_ini[i]
  initial(ELACnres15[]) <- ELACnres15_ini[i]
  initial(ELACres15[]) <- ELACres15_ini[i]
  initial(ELACprior15[]) <- ELACprior15_ini[i]
  
  initial(ELACnev16[]) <- ELACnev16_ini[i]
  initial(ELACnres16[]) <- ELACnres16_ini[i]
  initial(ELACres16[]) <- ELACres16_ini[i]
  initial(ELACprior16[]) <- ELACprior16_ini[i]
  
  initial(ELACnev17[]) <- ELACnev17_ini[i]
  initial(ELACnres17[]) <- ELACnres17_ini[i]
  initial(ELACres17[]) <- ELACres17_ini[i]
  initial(ELACprior17[]) <- ELACprior17_ini[i]
  
  
  
  
  
  # setting dimensions
  # parameters first
  # dim(pc_prior) <- N_gender
  
  # dim(np2lac) <- N_gender
  # dim(prior2lac) <- N_gender
  # 
  # dim(np2nres) <- N_gender
  # dim(np2res) <- N_gender
  # dim(prior2nres) <- N_gender
  # dim(prior2res) <- N_gender
  
  # now the initial conditions and states
  
  dim(ILACnev10_ini) <- N_gender
  dim(ILACnres10_ini) <- N_gender
  dim(ILACres10_ini) <- N_gender
  dim(ILACprior10_ini) <- N_gender
  
  dim(ILACnev10) <- N_gender
  dim(ILACnres10) <- N_gender
  dim(ILACres10) <- N_gender
  dim(ILACprior10) <- N_gender
  
  dim(ILACnev11_ini) <- N_gender
  dim(ILACnres11_ini) <- N_gender
  dim(ILACres11_ini) <- N_gender
  dim(ILACprior11_ini) <- N_gender
  
  dim(ILACnev11) <- N_gender
  dim(ILACnres11) <- N_gender
  dim(ILACres11) <- N_gender
  dim(ILACprior11) <- N_gender
  
  dim(ILACnev12_ini) <- N_gender
  dim(ILACnres12_ini) <- N_gender
  dim(ILACres12_ini) <- N_gender
  dim(ILACprior12_ini) <- N_gender
  
  dim(ILACnev12) <- N_gender
  dim(ILACnres12) <- N_gender
  dim(ILACres12) <- N_gender
  dim(ILACprior12) <- N_gender
  
  dim(ILACnev13_ini) <- N_gender
  dim(ILACnres13_ini) <- N_gender
  dim(ILACres13_ini) <- N_gender
  dim(ILACprior13_ini) <- N_gender
  
  dim(ILACnev13) <- N_gender
  dim(ILACnres13) <- N_gender
  dim(ILACres13) <- N_gender
  dim(ILACprior13) <- N_gender
  
  dim(ILACnev14_ini) <- N_gender
  dim(ILACnres14_ini) <- N_gender
  dim(ILACres14_ini) <- N_gender
  dim(ILACprior14_ini) <- N_gender
  
  dim(ILACnev14) <- N_gender
  dim(ILACnres14) <- N_gender
  dim(ILACres14) <- N_gender
  dim(ILACprior14) <- N_gender
  
  dim(ILACnev15_ini) <- N_gender
  dim(ILACnres15_ini) <- N_gender
  dim(ILACres15_ini) <- N_gender
  dim(ILACprior15_ini) <- N_gender
  
  dim(ILACnev15) <- N_gender
  dim(ILACnres15) <- N_gender
  dim(ILACres15) <- N_gender
  dim(ILACprior15) <- N_gender
  
  dim(ILACnev16_ini) <- N_gender
  dim(ILACnres16_ini) <- N_gender
  dim(ILACres16_ini) <- N_gender
  dim(ILACprior16_ini) <- N_gender
  
  dim(ILACnev16) <- N_gender
  dim(ILACnres16) <- N_gender
  dim(ILACres16) <- N_gender
  dim(ILACprior16) <- N_gender
  
  dim(ILACnev17_ini) <- N_gender
  dim(ILACnres17_ini) <- N_gender
  dim(ILACres17_ini) <- N_gender
  dim(ILACprior17_ini) <- N_gender
  
  dim(ILACnev17) <- N_gender
  dim(ILACnres17) <- N_gender
  dim(ILACres17) <- N_gender
  dim(ILACprior17) <- N_gender
  
  dim(ELACnev10_ini) <- N_gender
  dim(ELACnres10_ini) <- N_gender
  dim(ELACres10_ini) <- N_gender
  dim(ELACprior10_ini) <- N_gender
  
  dim(ELACnev10) <- N_gender
  dim(ELACnres10) <- N_gender
  dim(ELACres10) <- N_gender
  dim(ELACprior10) <- N_gender
  
  dim(ELACnev11_ini) <- N_gender
  dim(ELACnres11_ini) <- N_gender
  dim(ELACres11_ini) <- N_gender
  dim(ELACprior11_ini) <- N_gender
  
  dim(ELACnev11) <- N_gender
  dim(ELACnres11) <- N_gender
  dim(ELACres11) <- N_gender
  dim(ELACprior11) <- N_gender
  
  dim(ELACnev12_ini) <- N_gender
  dim(ELACnres12_ini) <- N_gender
  dim(ELACres12_ini) <- N_gender
  dim(ELACprior12_ini) <- N_gender
  
  dim(ELACnev12) <- N_gender
  dim(ELACnres12) <- N_gender
  dim(ELACres12) <- N_gender
  dim(ELACprior12) <- N_gender
  
  dim(ELACnev13_ini) <- N_gender
  dim(ELACnres13_ini) <- N_gender
  dim(ELACres13_ini) <- N_gender
  dim(ELACprior13_ini) <- N_gender
  
  dim(ELACnev13) <- N_gender
  dim(ELACnres13) <- N_gender
  dim(ELACres13) <- N_gender
  dim(ELACprior13) <- N_gender
  
  dim(ELACnev14_ini) <- N_gender
  dim(ELACnres14_ini) <- N_gender
  dim(ELACres14_ini) <- N_gender
  dim(ELACprior14_ini) <- N_gender
  
  dim(ELACnev14) <- N_gender
  dim(ELACnres14) <- N_gender
  dim(ELACres14) <- N_gender
  dim(ELACprior14) <- N_gender
  
  dim(ELACnev15_ini) <- N_gender
  dim(ELACnres15_ini) <- N_gender
  dim(ELACres15_ini) <- N_gender
  dim(ELACprior15_ini) <- N_gender
  
  dim(ELACnev15) <- N_gender
  dim(ELACnres15) <- N_gender
  dim(ELACres15) <- N_gender
  dim(ELACprior15) <- N_gender
  
  dim(ELACnev16_ini) <- N_gender
  dim(ELACnres16_ini) <- N_gender
  dim(ELACres16_ini) <- N_gender
  dim(ELACprior16_ini) <- N_gender
  
  dim(ELACnev16) <- N_gender
  dim(ELACnres16) <- N_gender
  dim(ELACres16) <- N_gender
  dim(ELACprior16) <- N_gender
  
  dim(ELACnev17_ini) <- N_gender
  dim(ELACnres17_ini) <- N_gender
  dim(ELACres17_ini) <- N_gender
  dim(ELACprior17_ini) <- N_gender
  
  dim(ELACnev17) <- N_gender
  dim(ELACnres17) <- N_gender
  dim(ELACres17) <- N_gender
  dim(ELACprior17) <- N_gender
  
  
  
  ##intermediate quantities
  
  
  # differential equations
  deriv(ILACnev10[]) <- (1-(pc_nres_i[i]-pc_res_i[i]-pc_prior_i[i]))*turn10_i[i] - age_up*ILACnev10[i] - (nev2res10i[i] + nev2nres10i[i])*ILACnev10[i] - f[i]*ILACnev10[i] + r[i]*ELACnev10[i]
  deriv(ILACnres10[]) <- pc_nres_i[i]*turn10_i[i] - age_up*ILACnres10[i] + nev2nres10i[i]*ILACnev10[i] + pri2nres10i[i]*ILACprior10[i] - (1-nr2nr)*end_nr[i]*ILACnres10[i] + res2nr*end_res[i]*ILACres10[i] - f[i]*ILACnres10[i] + r[i]*ELACnres10[i]
  deriv(ILACres10[]) <- pc_res_i[i]*turn10_i[i] - age_up*ILACres10[i] + nev2res10i[i]*ILACnev10[i] + pri2res10i[i]*ILACprior10[i] - (1-res2res)*end_res[i]*ILACres10[i] + nr2res*end_nr[i]*ILACnres10[i] - f[i]*ILACres10[i] + r[i]*ELACres10[i]
  deriv(ILACprior10[]) <- pc_prior_i[i]*turn10_i[i] - age_up*ILACprior10[i] - (pri2nres10i[i]+pri2res10i[i])*ILACprior10[i] + nr2exit*end_nr[i]*ILACnres10[i] + res2exit*end_res[i]*ILACres10[i] - f[i]*ILACprior10[i] + r[i]*ELACprior10[i]
  
  deriv(ILACnev11[]) <- age_up*ILACnev10[i] - (nev2res11i[i] + nev2nres11i[i])*ILACnev11[i] - age_up*ILACnev11[i] - f[i]*ILACnev11[i] + r[i]*ELACnev11[i]
  deriv(ILACnres11[]) <- age_up*ILACnres10[i] + nev2nres11i[i]*ILACnev11[i] + pri2nres11i[i]*ILACprior11[i] - (1-nr2nr)*end_nr[i]*ILACnres11[i] - age_up*ILACnres11[i] + res2nr*end_res[i]*ILACres11[i] - f[i]*ILACnres11[i] + r[i]*ELACnres11[i]
  deriv(ILACres11[]) <- age_up*ILACres10[i] + nev2res11i[i]*ILACnev11[i] + pri2res11i[i]*ILACprior11[i] - (1-res2res)*end_res[i]*ILACres11[i] - age_up*ILACres11[i] + nr2res*end_nr[i]*ILACnres11[i] - f[i]*ILACres11[i] + r[i]*ELACres11[i]
  deriv(ILACprior11[]) <- age_up*ILACprior10[i] - (pri2nres11i[i]+pri2res11i[i])*ILACprior11[i] + nr2exit*end_nr[i]*ILACnres11[i] + res2exit*end_res[i]*ILACres11[i] - age_up*ILACprior11[i] - f[i]*ILACprior11[i] + r[i]*ELACprior11[i]
  
  deriv(ILACnev12[]) <- age_up*ILACnev11[i] - (nev2res12i[i] + nev2nres12i[i])*ILACnev12[i] - age_up*ILACnev12[i] - f[i]*ILACnev12[i] + r[i]*ELACnev12[i]
  deriv(ILACnres12[]) <- age_up*ILACnres11[i] + nev2nres12i[i]*ILACnev12[i] + pri2nres12i[i]*ILACprior12[i] - (1-nr2nr)*end_nr[i]*ILACnres12[i] - age_up*ILACnres12[i] + res2nr*end_res[i]*ILACres12[i] - f[i]*ILACnres12[i] + r[i]*ELACnres12[i]
  deriv(ILACres12[]) <- age_up*ILACres11[i] + nev2res12i[i]*ILACnev12[i] + pri2res12i[i]*ILACprior12[i] - (1-res2res)*end_res[i]*ILACres12[i] - age_up*ILACres12[i] + nr2res*end_nr[i]*ILACnres12[i] - f[i]*ILACres12[i] + r[i]*ELACres12[i]
  deriv(ILACprior12[]) <- age_up*ILACprior11[i] - (pri2nres12i[i]+pri2res12i[i])*ILACprior12[i] + nr2exit*end_nr[i]*ILACnres12[i] + res2exit*end_res[i]*ILACres12[i] - age_up*ILACprior12[i] - f[i]*ILACprior12[i] + r[i]*ELACprior12[i]
  
  deriv(ILACnev13[]) <- age_up*ILACnev12[i] - (nev2res13i[i] + nev2nres13i[i])*ILACnev13[i] - age_up*ILACnev13[i] - f[i]*ILACnev13[i] + r[i]*ELACnev13[i]
  deriv(ILACnres13[]) <- age_up*ILACnres12[i] + nev2nres13i[i]*ILACnev13[i] + pri2nres13i[i]*ILACprior13[i] - (1-nr2nr)*end_nr[i]*ILACnres13[i] - age_up*ILACnres13[i] + res2nr*end_res[i]*ILACres13[i] - f[i]*ILACnres13[i] + r[i]*ELACnres13[i]
  deriv(ILACres13[]) <- age_up*ILACres12[i] + nev2res13i[i]*ILACnev13[i] + pri2res13i[i]*ILACprior13[i] - (1-res2res)*end_res[i]*ILACres13[i] - age_up*ILACres13[i] + nr2res*end_nr[i]*ILACnres13[i] - f[i]*ILACres13[i] + r[i]*ELACres13[i]
  deriv(ILACprior13[]) <- age_up*ILACprior12[i] - (pri2nres13i[i]+pri2res13i[i])*ILACprior13[i] + nr2exit*end_nr[i]*ILACnres13[i] + res2exit*end_res[i]*ILACres13[i] - age_up*ILACprior13[i] - f[i]*ILACprior13[i] + r[i]*ELACprior13[i]
  
  deriv(ILACnev14[]) <- age_up*ILACnev13[i] - (nev2res14i[i] + nev2nres14i[i])*ILACnev14[i] - age_up*ILACnev14[i] - f[i]*ILACnev14[i] + r[i]*ELACnev14[i]
  deriv(ILACnres14[]) <- age_up*ILACnres13[i] + nev2nres14i[i]*ILACnev14[i] + pri2nres14i[i]*ILACprior14[i] - (1-nr2nr)*end_nr[i]*ILACnres14[i] - age_up*ILACnres14[i] + res2nr*end_res[i]*ILACres14[i] - f[i]*ILACnres14[i] + r[i]*ELACnres14[i]
  deriv(ILACres14[]) <- age_up*ILACres13[i] + nev2res14i[i]*ILACnev14[i] + pri2res14i[i]*ILACprior14[i] - (1-res2res)*end_res[i]*ILACres14[i] - age_up*ILACres14[i] + nr2res*end_nr[i]*ILACnres14[i] - f[i]*ILACres14[i] + r[i]*ELACres14[i]
  deriv(ILACprior14[]) <- age_up*ILACprior13[i] - (pri2nres14i[i]+pri2res14i[i])*ILACprior14[i] + nr2exit*end_nr[i]*ILACnres14[i] + res2exit*end_res[i]*ILACres14[i] - age_up*ILACprior14[i] - f[i]*ILACprior14[i] + r[i]*ELACprior14[i]
  
  deriv(ILACnev15[]) <- age_up*ILACnev14[i] - (nev2res15i[i] + nev2nres15i[i])*ILACnev15[i] - age_up*ILACnev15[i] - f[i]*ILACnev15[i] + r[i]*ELACnev15[i]
  deriv(ILACnres15[]) <- age_up*ILACnres14[i] + nev2nres15i[i]*ILACnev15[i] + pri2nres15i[i]*ILACprior15[i] - (1-nr2nr)*end_nr[i]*ILACnres15[i] - age_up*ILACnres15[i] + res2nr*end_res[i]*ILACres15[i] - f[i]*ILACnres15[i] + r[i]*ELACnres15[i]
  deriv(ILACres15[]) <- age_up*ILACres14[i] + nev2res15i[i]*ILACnev15[i] + pri2res15i[i]*ILACprior15[i] - (1-res2res)*end_res[i]*ILACres15[i] - age_up*ILACres15[i] + nr2res*end_nr[i]*ILACnres15[i] - f[i]*ILACres15[i] + r[i]*ELACres15[i]
  deriv(ILACprior15[]) <- age_up*ILACprior14[i] - (pri2nres15i[i]+pri2res15i[i])*ILACprior15[i] + nr2exit*end_nr[i]*ILACnres15[i] + res2exit*end_res[i]*ILACres15[i] - age_up*ILACprior15[i] - f[i]*ILACprior15[i] + r[i]*ELACprior15[i]
  
  deriv(ILACnev16[]) <- age_up*ILACnev15[i] - (nev2res16i[i] + nev2nres16i[i])*ILACnev16[i] - age_up*ILACnev16[i] - f[i]*ILACnev16[i] + r[i]*ELACnev16[i]
  deriv(ILACnres16[]) <- age_up*ILACnres15[i] + nev2nres16i[i]*ILACnev16[i] + pri2nres16i[i]*ILACprior16[i] - (1-nr2nr)*end_nr[i]*ILACnres16[i] - age_up*ILACnres16[i] + res2nr*end_res[i]*ILACres16[i] - f[i]*ILACnres16[i] + r[i]*ELACnres16[i]
  deriv(ILACres16[]) <- age_up*ILACres15[i] + nev2res16i[i]*ILACnev16[i] + pri2res16i[i]*ILACprior16[i] - (1-res2res)*end_res[i]*ILACres16[i] - age_up*ILACres16[i] + nr2res*end_nr[i]*ILACnres16[i] - f[i]*ILACres16[i] + r[i]*ELACres16[i]
  deriv(ILACprior16[]) <- age_up*ILACprior15[i] - (pri2nres16i[i]+pri2res16i[i])*ILACprior16[i] + nr2exit*end_nr[i]*ILACnres16[i] + res2exit*end_res[i]*ILACres16[i] - age_up*ILACprior16[i] - f[i]*ILACprior16[i] + r[i]*ELACprior16[i]
  
  deriv(ILACnev17[]) <- age_up*ILACnev16[i] - (nev2res17i[i] + nev2nres17i[i])*ILACnev17[i] - age_up*ILACnev17[i] - f[i]*ILACnev17[i] + r[i]*ELACnev17[i]
  deriv(ILACnres17[]) <- age_up*ILACnres16[i] + nev2nres17i[i]*ILACnev17[i] + pri2nres17i[i]*ILACprior17[i] - (1-nr2nr)*end_nr[i]*ILACnres17[i] - age_up*ILACnres17[i] + res2nr*end_res[i]*ILACres17[i] - f[i]*ILACnres17[i] + r[i]*ELACnres17[i]
  deriv(ILACres17[]) <- age_up*ILACres16[i] + nev2res17i[i]*ILACnev17[i] + pri2res17i[i]*ILACprior17[i] - (1-res2res)*end_res[i]*ILACres17[i] - age_up*ILACres17[i] + nr2res*end_nr[i]*ILACnres17[i] - f[i]*ILACres17[i] + r[i]*ELACres17[i]
  deriv(ILACprior17[]) <- age_up*ILACprior16[i] - (pri2nres17i[i]+pri2res17i[i])*ILACprior17[i] + nr2exit*end_nr[i]*ILACnres17[i] + res2exit*end_res[i]*ILACres17[i] - age_up*ILACprior17[i] - f[i]*ILACprior17[i] + r[i]*ELACprior17[i]
  
  
  
  
  
  deriv(ELACnev10[]) <- (1-(pc_nres_e[i]-pc_res_e[i]-pc_prior_e[i]))*turn10_e[i] - age_up*ELACnev10[i] - (nev2res10e[i] + nev2nres10e[i])*ELACnev10[i] + f[i]*ILACnev10[i] - r[i]*ELACnev10[i]
  deriv(ELACnres10[]) <- pc_nres_e[i]*turn10_e[i] - age_up*ELACnres10[i] + nev2nres10e[i]*ELACnev10[i] + pri2nres10e[i]*ELACprior10[i] - (1-nr2nr)*end_nr[i]*ELACnres10[i] + res2nr*end_res[i]*ELACres10[i] + f[i]*ILACnres10[i] - r[i]*ELACnres10[i]
  deriv(ELACres10[]) <- pc_res_e[i]*turn10_e[i] - age_up*ELACres10[i] + nev2res10e[i]*ELACnev10[i] + pri2res10e[i]*ELACprior10[i] - (1-res2res)*end_res[i]*ELACres10[i] + nr2res*end_nr[i]*ELACnres10[i] + f[i]*ILACres10[i] - r[i]*ELACres10[i]
  deriv(ELACprior10[]) <- pc_prior_e[i]*turn10_e[i] - age_up*ELACprior10[i] - (pri2nres10e[i]+pri2res10e[i])*ELACprior10[i] + nr2exit*end_nr[i]*ELACnres10[i] + res2exit*end_res[i]*ELACres10[i] + f[i]*ILACprior10[i] - r[i]*ELACprior10[i]
  
  deriv(ELACnev11[]) <- age_up*ELACnev10[i] - (nev2res11e[i] + nev2nres11e[i])*ELACnev11[i] - age_up*ELACnev11[i] + f[i]*ILACnev11[i] - r[i]*ELACnev11[i]
  deriv(ELACnres11[]) <- age_up*ELACnres10[i] + nev2nres11e[i]*ELACnev11[i] + pri2nres11e[i]*ELACprior11[i] - (1-nr2nr)*end_nr[i]*ELACnres11[i] - age_up*ELACnres11[i] + res2nr*end_res[i]*ELACres11[i] + f[i]*ILACnres11[i] - r[i]*ELACnres11[i]
  deriv(ELACres11[]) <- age_up*ELACres10[i] + nev2res11e[i]*ELACnev11[i] + pri2res11e[i]*ELACprior11[i] - (1-res2res)*end_res[i]*ELACres11[i] - age_up*ELACres11[i] + nr2res*end_nr[i]*ELACnres11[i] + f[i]*ILACres11[i] - r[i]*ELACres11[i]
  deriv(ELACprior11[]) <- age_up*ELACprior10[i] - (pri2nres11e[i]+pri2res11e[i])*ELACprior11[i] + nr2exit*end_nr[i]*ELACnres11[i] + res2exit*end_res[i]*ELACres11[i] - age_up*ELACprior11[i] + f[i]*ILACprior11[i] - r[i]*ELACprior11[i]
  
  deriv(ELACnev12[]) <- age_up*ELACnev11[i] - (nev2res12e[i] + nev2nres12e[i])*ELACnev12[i] - age_up*ELACnev12[i] + f[i]*ILACnev12[i] - r[i]*ELACnev12[i]
  deriv(ELACnres12[]) <- age_up*ELACnres11[i] + nev2nres12e[i]*ELACnev12[i] + pri2nres12e[i]*ELACprior12[i] - (1-nr2nr)*end_nr[i]*ELACnres12[i] - age_up*ELACnres12[i] + res2nr*end_res[i]*ELACres12[i] + f[i]*ILACnres12[i] - r[i]*ELACnres12[i]
  deriv(ELACres12[]) <- age_up*ELACres11[i] + nev2res12e[i]*ELACnev12[i] + pri2res12e[i]*ELACprior12[i] - (1-res2res)*end_res[i]*ELACres12[i] - age_up*ELACres12[i] + nr2res*end_nr[i]*ELACnres12[i] + f[i]*ILACres12[i] - r[i]*ELACres12[i]
  deriv(ELACprior12[]) <- age_up*ELACprior11[i] - (pri2nres12e[i]+pri2res12e[i])*ELACprior12[i] + nr2exit*end_nr[i]*ELACnres12[i] + res2exit*end_res[i]*ELACres12[i] - age_up*ELACprior12[i] + f[i]*ILACprior12[i] - r[i]*ELACprior12[i]
  
  deriv(ELACnev13[]) <- age_up*ELACnev12[i] - (nev2res13e[i] + nev2nres13e[i])*ELACnev13[i] - age_up*ELACnev13[i] + f[i]*ILACnev13[i] - r[i]*ELACnev13[i]
  deriv(ELACnres13[]) <- age_up*ELACnres12[i] + nev2nres13e[i]*ELACnev13[i] + pri2nres13e[i]*ELACprior13[i] - (1-nr2nr)*end_nr[i]*ELACnres13[i] - age_up*ELACnres13[i] + res2nr*end_res[i]*ELACres13[i] + f[i]*ILACnres13[i] - r[i]*ELACnres13[i]
  deriv(ELACres13[]) <- age_up*ELACres12[i] + nev2res13e[i]*ELACnev13[i] + pri2res13e[i]*ELACprior13[i] - (1-res2res)*end_res[i]*ELACres13[i] - age_up*ELACres13[i] + nr2res*end_nr[i]*ELACnres13[i] + f[i]*ILACres13[i] - r[i]*ELACres13[i]
  deriv(ELACprior13[]) <- age_up*ELACprior12[i] - (pri2nres13e[i]+pri2res13e[i])*ELACprior13[i] + nr2exit*end_nr[i]*ELACnres13[i] + res2exit*end_res[i]*ELACres13[i] - age_up*ELACprior13[i] + f[i]*ILACprior13[i] - r[i]*ELACprior13[i]
  
  deriv(ELACnev14[]) <- age_up*ELACnev13[i] - (nev2res14e[i] + nev2nres14e[i])*ELACnev14[i] - age_up*ELACnev14[i] + f[i]*ILACnev14[i] - r[i]*ELACnev14[i]
  deriv(ELACnres14[]) <- age_up*ELACnres13[i] + nev2nres14e[i]*ELACnev14[i] + pri2nres14e[i]*ELACprior14[i] - (1-nr2nr)*end_nr[i]*ELACnres14[i] - age_up*ELACnres14[i] + res2nr*end_res[i]*ELACres14[i] + f[i]*ILACnres14[i] - r[i]*ELACnres14[i]
  deriv(ELACres14[]) <- age_up*ELACres13[i] + nev2res14e[i]*ELACnev14[i] + pri2res14e[i]*ELACprior14[i] - (1-res2res)*end_res[i]*ELACres14[i] - age_up*ELACres14[i] + nr2res*end_nr[i]*ELACnres14[i] + f[i]*ILACres14[i] - r[i]*ELACres14[i]
  deriv(ELACprior14[]) <- age_up*ELACprior13[i] - (pri2nres14e[i]+pri2res14e[i])*ELACprior14[i] + nr2exit*end_nr[i]*ELACnres14[i] + res2exit*end_res[i]*ELACres14[i] - age_up*ELACprior14[i] + f[i]*ILACprior14[i] - r[i]*ELACprior14[i]
  
  deriv(ELACnev15[]) <- age_up*ELACnev14[i] - (nev2res15e[i] + nev2nres15e[i])*ELACnev15[i] - age_up*ELACnev15[i] + f[i]*ILACnev15[i] - r[i]*ELACnev15[i]
  deriv(ELACnres15[]) <- age_up*ELACnres14[i] + nev2nres15e[i]*ELACnev15[i] + pri2nres15e[i]*ELACprior15[i] - (1-nr2nr)*end_nr[i]*ELACnres15[i] - age_up*ELACnres15[i] + res2nr*end_res[i]*ELACres15[i] + f[i]*ILACnres15[i] - r[i]*ELACnres15[i]
  deriv(ELACres15[]) <- age_up*ELACres14[i] + nev2res15e[i]*ELACnev15[i] + pri2res15e[i]*ELACprior15[i] - (1-res2res)*end_res[i]*ELACres15[i] - age_up*ELACres15[i] + nr2res*end_nr[i]*ELACnres15[i] + f[i]*ILACres15[i] - r[i]*ELACres15[i]
  deriv(ELACprior15[]) <- age_up*ELACprior14[i] - (pri2nres15e[i]+pri2res15e[i])*ELACprior15[i] + nr2exit*end_nr[i]*ELACnres15[i] + res2exit*end_res[i]*ELACres15[i] - age_up*ELACprior15[i] + f[i]*ILACprior15[i] - r[i]*ELACprior15[i]
  
  deriv(ELACnev16[]) <- age_up*ELACnev15[i] - (nev2res16e[i] + nev2nres16e[i])*ELACnev16[i] - age_up*ELACnev16[i] + f[i]*ILACnev16[i] - r[i]*ELACnev16[i]
  deriv(ELACnres16[]) <- age_up*ELACnres15[i] + nev2nres16e[i]*ELACnev16[i] + pri2nres16e[i]*ELACprior16[i] - (1-nr2nr)*end_nr[i]*ELACnres16[i] - age_up*ELACnres16[i] + res2nr*end_res[i]*ELACres16[i] + f[i]*ILACnres16[i] - r[i]*ELACnres16[i]
  deriv(ELACres16[]) <- age_up*ELACres15[i] + nev2res16e[i]*ELACnev16[i] + pri2res16e[i]*ELACprior16[i] - (1-res2res)*end_res[i]*ELACres16[i] - age_up*ELACres16[i] + nr2res*end_nr[i]*ELACnres16[i] + f[i]*ILACres16[i] - r[i]*ELACres16[i]
  deriv(ELACprior16[]) <- age_up*ELACprior15[i] - (pri2nres16e[i]+pri2res16e[i])*ELACprior16[i] + nr2exit*end_nr[i]*ELACnres16[i] + res2exit*end_res[i]*ELACres16[i] - age_up*ELACprior16[i] + f[i]*ILACprior16[i] - r[i]*ELACprior16[i]
  
  deriv(ELACnev17[]) <- age_up*ELACnev16[i] - (nev2res17e[i] + nev2nres17e[i])*ELACnev17[i] - age_up*ELACnev17[i] + f[i]*ILACnev17[i] - r[i]*ELACnev17[i]
  deriv(ELACnres17[]) <- age_up*ELACnres16[i] + nev2nres17e[i]*ELACnev17[i] + pri2nres17e[i]*ELACprior17[i] - (1-nr2nr)*end_nr[i]*ELACnres17[i] - age_up*ELACnres17[i] + res2nr*end_res[i]*ELACres17[i] + f[i]*ILACnres17[i] - r[i]*ELACnres17[i]
  deriv(ELACres17[]) <- age_up*ELACres16[i] + nev2res17e[i]*ELACnev17[i] + pri2res17e[i]*ELACprior17[i] - (1-res2res)*end_res[i]*ELACres17[i] - age_up*ELACres17[i] + nr2res*end_nr[i]*ELACnres17[i] + f[i]*ILACres17[i] - r[i]*ELACres17[i]
  deriv(ELACprior17[]) <- age_up*ELACprior16[i] - (pri2nres17e[i]+pri2res17e[i])*ELACprior17[i] + nr2exit*end_nr[i]*ELACnres17[i] + res2exit*end_res[i]*ELACres17[i] - age_up*ELACprior17[i] + f[i]*ILACprior17[i] - r[i]*ELACprior17[i]
  
  
  
  # interpolation section
  turn10_i[] <- interpolate(tt, yi, "spline")
  dim(turn10_i) <- N_gender
  tt[] <- user()
  yi[, ] <- user()
  dim(tt) <- user()
  dim(yi) <- c(length(tt), length(turn10_i))
  
  turn10_e[] <- interpolate(tt, ye, "spline")
  dim(turn10_e) <- N_gender
  ye[, ] <- user()
  dim(ye) <- c(length(tt), length(turn10_e))
  
  
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
  
  
  pc_nres_i[] <- interpolate(tlacadj, nrlaci, "spline")
  dim(pc_nres_i) <- N_gender
  tlacadj[] <- user()
  nrlaci[, ] <- user()
  dim(tlacadj) <- user()
  dim(nrlaci) <- c(length(tlacadj), length(pc_nres_i))
  
  pc_res_i[] <- interpolate(tlacadj, rlaci, "spline")
  dim(pc_res_i) <- N_gender
  rlaci[, ] <- user()
  dim(rlaci) <- c(length(tlacadj), length(pc_res_i))
  
  pc_prior_i[] <- interpolate(tlacadj, placi, "spline")
  dim(pc_prior_i) <- N_gender
  placi[, ] <- user()
  dim(placi) <- c(length(tlacadj), length(pc_prior_i))
  
  pc_nres_e[] <- interpolate(tlacadj, nrlace, "spline")
  dim(pc_nres_e) <- N_gender
  nrlace[, ] <- user()
  dim(nrlace) <- c(length(tlacadj), length(pc_nres_e))
  
  pc_res_e[] <- interpolate(tlacadj, rlace, "spline")
  dim(pc_res_e) <- N_gender
  rlace[, ] <- user()
  dim(rlace) <- c(length(tlacadj), length(pc_res_e))
  
  pc_prior_e[] <- interpolate(tlacadj, place, "spline")
  dim(pc_prior_e) <- N_gender
  place[, ] <- user()
  dim(place) <- c(length(tlacadj), length(pc_prior_e))
  
  end_nr[] <- interpolate(tlac, enr, "spline")
  dim(end_nr) <- N_gender
  tlac[] <- user()
  enr[, ] <- user()
  dim(tlac) <- user()
  dim(enr) <- c(length(tlac), length(end_nr))
  
  end_res[] <- interpolate(tlac, eres, "spline")
  dim(end_res) <- N_gender
  eres[, ] <- user()
  dim(eres) <- c(length(tlac), length(end_res))
  
  
  nev2nres10i[] <- interpolate(tlac, n2nres10i, "spline")
  dim(nev2nres10i) <- N_gender
  n2nres10i[, ] <- user()
  dim(n2nres10i) <- c(length(tlac), length(nev2nres10i))
  
  nev2nres11i[] <- interpolate(tlac, n2nres11i, "spline")
  dim(nev2nres11i) <- N_gender
  n2nres11i[, ] <- user()
  dim(n2nres11i) <- c(length(tlac), length(nev2nres11i))
  
  nev2nres12i[] <- interpolate(tlac, n2nres12i, "spline")
  dim(nev2nres12i) <- N_gender
  n2nres12i[, ] <- user()
  dim(n2nres12i) <- c(length(tlac), length(nev2nres12i))
  
  nev2nres13i[] <- interpolate(tlac, n2nres13i, "spline")
  dim(nev2nres13i) <- N_gender
  n2nres13i[, ] <- user()
  dim(n2nres13i) <- c(length(tlac), length(nev2nres13i))
  
  nev2nres14i[] <- interpolate(tlac, n2nres14i, "spline")
  dim(nev2nres14i) <- N_gender
  n2nres14i[, ] <- user()
  dim(n2nres14i) <- c(length(tlac), length(nev2nres14i))
  
  nev2nres15i[] <- interpolate(tlac, n2nres15i, "spline")
  dim(nev2nres15i) <- N_gender
  n2nres15i[, ] <- user()
  dim(n2nres15i) <- c(length(tlac), length(nev2nres15i))
  
  nev2nres16i[] <- interpolate(tlac, n2nres16i, "spline")
  dim(nev2nres16i) <- N_gender
  n2nres16i[, ] <- user()
  dim(n2nres16i) <- c(length(tlac), length(nev2nres16i))
  
  nev2nres17i[] <- interpolate(tlac, n2nres17i, "spline")
  dim(nev2nres17i) <- N_gender
  n2nres17i[, ] <- user()
  dim(n2nres17i) <- c(length(tlac), length(nev2nres17i))
  
  
  
  
  nev2res10i[] <- interpolate(tlac, n2res10i, "spline")
  dim(nev2res10i) <- N_gender
  n2res10i[, ] <- user()
  dim(n2res10i) <- c(length(tlac), length(nev2res10i))
  
  nev2res11i[] <- interpolate(tlac, n2res11i, "spline")
  dim(nev2res11i) <- N_gender
  n2res11i[, ] <- user()
  dim(n2res11i) <- c(length(tlac), length(nev2res11i))
  
  nev2res12i[] <- interpolate(tlac, n2res12i, "spline")
  dim(nev2res12i) <- N_gender
  n2res12i[, ] <- user()
  dim(n2res12i) <- c(length(tlac), length(nev2res12i))
  
  nev2res13i[] <- interpolate(tlac, n2res13i, "spline")
  dim(nev2res13i) <- N_gender
  n2res13i[, ] <- user()
  dim(n2res13i) <- c(length(tlac), length(nev2res13i))
  
  nev2res14i[] <- interpolate(tlac, n2res14i, "spline")
  dim(nev2res14i) <- N_gender
  n2res14i[, ] <- user()
  dim(n2res14i) <- c(length(tlac), length(nev2res14i))
  
  nev2res15i[] <- interpolate(tlac, n2res15i, "spline")
  dim(nev2res15i) <- N_gender
  n2res15i[, ] <- user()
  dim(n2res15i) <- c(length(tlac), length(nev2res15i))
  
  nev2res16i[] <- interpolate(tlac, n2res16i, "spline")
  dim(nev2res16i) <- N_gender
  n2res16i[, ] <- user()
  dim(n2res16i) <- c(length(tlac), length(nev2res16i))
  
  nev2res17i[] <- interpolate(tlac, n2res17i, "spline")
  dim(nev2res17i) <- N_gender
  n2res17i[, ] <- user()
  dim(n2res17i) <- c(length(tlac), length(nev2res17i))
  
  
  pri2nres10i[] <- interpolate(tlac, p2nres10i, "spline")
  dim(pri2nres10i) <- N_gender
  p2nres10i[, ] <- user()
  dim(p2nres10i) <- c(length(tlac), length(pri2nres10i))
  
  pri2nres11i[] <- interpolate(tlac, p2nres11i, "spline")
  dim(pri2nres11i) <- N_gender
  p2nres11i[, ] <- user()
  dim(p2nres11i) <- c(length(tlac), length(pri2nres11i))
  
  pri2nres12i[] <- interpolate(tlac, p2nres12i, "spline")
  dim(pri2nres12i) <- N_gender
  p2nres12i[, ] <- user()
  dim(p2nres12i) <- c(length(tlac), length(pri2nres12i))
  
  pri2nres13i[] <- interpolate(tlac, p2nres13i, "spline")
  dim(pri2nres13i) <- N_gender
  p2nres13i[, ] <- user()
  dim(p2nres13i) <- c(length(tlac), length(pri2nres13i))
  
  pri2nres14i[] <- interpolate(tlac, p2nres14i, "spline")
  dim(pri2nres14i) <- N_gender
  p2nres14i[, ] <- user()
  dim(p2nres14i) <- c(length(tlac), length(pri2nres14i))
  
  pri2nres15i[] <- interpolate(tlac, p2nres15i, "spline")
  dim(pri2nres15i) <- N_gender
  p2nres15i[, ] <- user()
  dim(p2nres15i) <- c(length(tlac), length(pri2nres15i))
  
  pri2nres16i[] <- interpolate(tlac, p2nres16i, "spline")
  dim(pri2nres16i) <- N_gender
  p2nres16i[, ] <- user()
  dim(p2nres16i) <- c(length(tlac), length(pri2nres16i))
  
  pri2nres17i[] <- interpolate(tlac, p2nres17i, "spline")
  dim(pri2nres17i) <- N_gender
  p2nres17i[, ] <- user()
  dim(p2nres17i) <- c(length(tlac), length(pri2nres17i))
  
  
  
  
  pri2res10i[] <- interpolate(tlac, p2res10i, "spline")
  dim(pri2res10i) <- N_gender
  p2res10i[, ] <- user()
  dim(p2res10i) <- c(length(tlac), length(pri2res10i))
  
  pri2res11i[] <- interpolate(tlac, p2res11i, "spline")
  dim(pri2res11i) <- N_gender
  p2res11i[, ] <- user()
  dim(p2res11i) <- c(length(tlac), length(pri2res11i))
  
  pri2res12i[] <- interpolate(tlac, p2res12i, "spline")
  dim(pri2res12i) <- N_gender
  p2res12i[, ] <- user()
  dim(p2res12i) <- c(length(tlac), length(pri2res12i))
  
  pri2res13i[] <- interpolate(tlac, p2res13i, "spline")
  dim(pri2res13i) <- N_gender
  p2res13i[, ] <- user()
  dim(p2res13i) <- c(length(tlac), length(pri2res13i))
  
  pri2res14i[] <- interpolate(tlac, p2res14i, "spline")
  dim(pri2res14i) <- N_gender
  p2res14i[, ] <- user()
  dim(p2res14i) <- c(length(tlac), length(pri2res14i))
  
  pri2res15i[] <- interpolate(tlac, p2res15i, "spline")
  dim(pri2res15i) <- N_gender
  p2res15i[, ] <- user()
  dim(p2res15i) <- c(length(tlac), length(pri2res15i))
  
  pri2res16i[] <- interpolate(tlac, p2res16i, "spline")
  dim(pri2res16i) <- N_gender
  p2res16i[, ] <- user()
  dim(p2res16i) <- c(length(tlac), length(pri2res16i))
  
  pri2res17i[] <- interpolate(tlac, p2res17i, "spline")
  dim(pri2res17i) <- N_gender
  p2res17i[, ] <- user()
  dim(p2res17i) <- c(length(tlac), length(pri2res17i))
  
  
  nev2nres10e[] <- interpolate(tlac, n2nres10e, "spline")
  dim(nev2nres10e) <- N_gender
  n2nres10e[, ] <- user()
  dim(n2nres10e) <- c(length(tlac), length(nev2nres10e))
  
  nev2nres11e[] <- interpolate(tlac, n2nres11e, "spline")
  dim(nev2nres11e) <- N_gender
  n2nres11e[, ] <- user()
  dim(n2nres11e) <- c(length(tlac), length(nev2nres11e))
  
  nev2nres12e[] <- interpolate(tlac, n2nres12e, "spline")
  dim(nev2nres12e) <- N_gender
  n2nres12e[, ] <- user()
  dim(n2nres12e) <- c(length(tlac), length(nev2nres12e))
  
  nev2nres13e[] <- interpolate(tlac, n2nres13e, "spline")
  dim(nev2nres13e) <- N_gender
  n2nres13e[, ] <- user()
  dim(n2nres13e) <- c(length(tlac), length(nev2nres13e))
  
  nev2nres14e[] <- interpolate(tlac, n2nres14e, "spline")
  dim(nev2nres14e) <- N_gender
  n2nres14e[, ] <- user()
  dim(n2nres14e) <- c(length(tlac), length(nev2nres14e))
  
  nev2nres15e[] <- interpolate(tlac, n2nres15e, "spline")
  dim(nev2nres15e) <- N_gender
  n2nres15e[, ] <- user()
  dim(n2nres15e) <- c(length(tlac), length(nev2nres15e))
  
  nev2nres16e[] <- interpolate(tlac, n2nres16e, "spline")
  dim(nev2nres16e) <- N_gender
  n2nres16e[, ] <- user()
  dim(n2nres16e) <- c(length(tlac), length(nev2nres16e))
  
  nev2nres17e[] <- interpolate(tlac, n2nres17e, "spline")
  dim(nev2nres17e) <- N_gender
  n2nres17e[, ] <- user()
  dim(n2nres17e) <- c(length(tlac), length(nev2nres17e))
  
  
  
  
  nev2res10e[] <- interpolate(tlac, n2res10e, "spline")
  dim(nev2res10e) <- N_gender
  n2res10e[, ] <- user()
  dim(n2res10e) <- c(length(tlac), length(nev2res10e))
  
  nev2res11e[] <- interpolate(tlac, n2res11e, "spline")
  dim(nev2res11e) <- N_gender
  n2res11e[, ] <- user()
  dim(n2res11e) <- c(length(tlac), length(nev2res11e))
  
  nev2res12e[] <- interpolate(tlac, n2res12e, "spline")
  dim(nev2res12e) <- N_gender
  n2res12e[, ] <- user()
  dim(n2res12e) <- c(length(tlac), length(nev2res12e))
  
  nev2res13e[] <- interpolate(tlac, n2res13e, "spline")
  dim(nev2res13e) <- N_gender
  n2res13e[, ] <- user()
  dim(n2res13e) <- c(length(tlac), length(nev2res13e))
  
  nev2res14e[] <- interpolate(tlac, n2res14e, "spline")
  dim(nev2res14e) <- N_gender
  n2res14e[, ] <- user()
  dim(n2res14e) <- c(length(tlac), length(nev2res14e))
  
  nev2res15e[] <- interpolate(tlac, n2res15e, "spline")
  dim(nev2res15e) <- N_gender
  n2res15e[, ] <- user()
  dim(n2res15e) <- c(length(tlac), length(nev2res15e))
  
  nev2res16e[] <- interpolate(tlac, n2res16e, "spline")
  dim(nev2res16e) <- N_gender
  n2res16e[, ] <- user()
  dim(n2res16e) <- c(length(tlac), length(nev2res16e))
  
  nev2res17e[] <- interpolate(tlac, n2res17e, "spline")
  dim(nev2res17e) <- N_gender
  n2res17e[, ] <- user()
  dim(n2res17e) <- c(length(tlac), length(nev2res17e))
  
  
  pri2nres10e[] <- interpolate(tlac, p2nres10e, "spline")
  dim(pri2nres10e) <- N_gender
  p2nres10e[, ] <- user()
  dim(p2nres10e) <- c(length(tlac), length(pri2nres10e))
  
  pri2nres11e[] <- interpolate(tlac, p2nres11e, "spline")
  dim(pri2nres11e) <- N_gender
  p2nres11e[, ] <- user()
  dim(p2nres11e) <- c(length(tlac), length(pri2nres11e))
  
  pri2nres12e[] <- interpolate(tlac, p2nres12e, "spline")
  dim(pri2nres12e) <- N_gender
  p2nres12e[, ] <- user()
  dim(p2nres12e) <- c(length(tlac), length(pri2nres12e))
  
  pri2nres13e[] <- interpolate(tlac, p2nres13e, "spline")
  dim(pri2nres13e) <- N_gender
  p2nres13e[, ] <- user()
  dim(p2nres13e) <- c(length(tlac), length(pri2nres13e))
  
  pri2nres14e[] <- interpolate(tlac, p2nres14e, "spline")
  dim(pri2nres14e) <- N_gender
  p2nres14e[, ] <- user()
  dim(p2nres14e) <- c(length(tlac), length(pri2nres14e))
  
  pri2nres15e[] <- interpolate(tlac, p2nres15e, "spline")
  dim(pri2nres15e) <- N_gender
  p2nres15e[, ] <- user()
  dim(p2nres15e) <- c(length(tlac), length(pri2nres15e))
  
  pri2nres16e[] <- interpolate(tlac, p2nres16e, "spline")
  dim(pri2nres16e) <- N_gender
  p2nres16e[, ] <- user()
  dim(p2nres16e) <- c(length(tlac), length(pri2nres16e))
  
  pri2nres17e[] <- interpolate(tlac, p2nres17e, "spline")
  dim(pri2nres17e) <- N_gender
  p2nres17e[, ] <- user()
  dim(p2nres17e) <- c(length(tlac), length(pri2nres17e))
  
  
  
  
  pri2res10e[] <- interpolate(tlac, p2res10e, "spline")
  dim(pri2res10e) <- N_gender
  p2res10e[, ] <- user()
  dim(p2res10e) <- c(length(tlac), length(pri2res10e))
  
  pri2res11e[] <- interpolate(tlac, p2res11e, "spline")
  dim(pri2res11e) <- N_gender
  p2res11e[, ] <- user()
  dim(p2res11e) <- c(length(tlac), length(pri2res11e))
  
  pri2res12e[] <- interpolate(tlac, p2res12e, "spline")
  dim(pri2res12e) <- N_gender
  p2res12e[, ] <- user()
  dim(p2res12e) <- c(length(tlac), length(pri2res12e))
  
  pri2res13e[] <- interpolate(tlac, p2res13e, "spline")
  dim(pri2res13e) <- N_gender
  p2res13e[, ] <- user()
  dim(p2res13e) <- c(length(tlac), length(pri2res13e))
  
  pri2res14e[] <- interpolate(tlac, p2res14e, "spline")
  dim(pri2res14e) <- N_gender
  p2res14e[, ] <- user()
  dim(p2res14e) <- c(length(tlac), length(pri2res14e))
  
  pri2res15e[] <- interpolate(tlac, p2res15e, "spline")
  dim(pri2res15e) <- N_gender
  p2res15e[, ] <- user()
  dim(p2res15e) <- c(length(tlac), length(pri2res15e))
  
  pri2res16e[] <- interpolate(tlac, p2res16e, "spline")
  dim(pri2res16e) <- N_gender
  p2res16e[, ] <- user()
  dim(p2res16e) <- c(length(tlac), length(pri2res16e))
  
  pri2res17e[] <- interpolate(tlac, p2res17e, "spline")
  dim(pri2res17e) <- N_gender
  p2res17e[, ] <- user()
  dim(p2res17e) <- c(length(tlac), length(pri2res17e))
  
  
  
  
  
  # ageing in at 10, what state do you occupy
  output(pc_nres_i) <- pc_nres_i
  output(pc_res_i) <- pc_res_i
  output(pc_prior_i) <- pc_prior_i
  output(pc_nres_e) <- pc_nres_e
  output(pc_res_e) <- pc_res_e
  output(pc_prior_e) <- pc_prior_e
  
  # rate of entering care/#destination on entering care
  
  
  output(pri2res10i) <- pri2res10i
  output(pri2res11i) <- pri2res11i
  output(pri2res12i) <- pri2res12i
  output(pri2res13i) <- pri2res13i
  output(pri2res14i) <- pri2res14i
  output(pri2res15i) <- pri2res15i
  output(pri2res16i) <- pri2res16i
  output(pri2res17i) <- pri2res17i
  
  output(pri2nres10i) <- pri2nres10i
  output(pri2nres11i) <- pri2nres11i
  output(pri2nres12i) <- pri2nres12i
  output(pri2nres13i) <- pri2nres13i
  output(pri2nres14i) <- pri2nres14i
  output(pri2nres15i) <- pri2nres15i
  output(pri2nres16i) <- pri2nres16i
  output(pri2nres17i) <- pri2nres17i
  
  output(nev2res10i) <- nev2res10i
  output(nev2res11i) <- nev2res11i
  output(nev2res12i) <- nev2res12i
  output(nev2res13i) <- nev2res13i
  output(nev2res14i) <- nev2res14i
  output(nev2res15i) <- nev2res15i
  output(nev2res16i) <- nev2res16i
  output(nev2res17i) <- nev2res17i
  
  output(nev2nres10i) <- nev2nres10i
  output(nev2nres11i) <- nev2nres11i
  output(nev2nres12i) <- nev2nres12i
  output(nev2nres13i) <- nev2nres13i
  output(nev2nres14i) <- nev2nres14i
  output(nev2nres15i) <- nev2nres15i
  output(nev2nres16i) <- nev2nres16i
  output(nev2nres17i) <- nev2nres17i
  
  output(pri2res10e) <- pri2res10e
  output(pri2res11e) <- pri2res11e
  output(pri2res12e) <- pri2res12e
  output(pri2res13e) <- pri2res13e
  output(pri2res14e) <- pri2res14e
  output(pri2res15e) <- pri2res15e
  output(pri2res16e) <- pri2res16e
  output(pri2res17e) <- pri2res17e
  
  output(pri2nres10e) <- pri2nres10e
  output(pri2nres11e) <- pri2nres11e
  output(pri2nres12e) <- pri2nres12e
  output(pri2nres13e) <- pri2nres13e
  output(pri2nres14e) <- pri2nres14e
  output(pri2nres15e) <- pri2nres15e
  output(pri2nres16e) <- pri2nres16e
  output(pri2nres17e) <- pri2nres17e
  
  output(nev2res10e) <- nev2res10e
  output(nev2res11e) <- nev2res11e
  output(nev2res12e) <- nev2res12e
  output(nev2res13e) <- nev2res13e
  output(nev2res14e) <- nev2res14e
  output(nev2res15e) <- nev2res15e
  output(nev2res16e) <- nev2res16e
  output(nev2res17e) <- nev2res17e
  
  output(nev2nres10e) <- nev2nres10e
  output(nev2nres11e) <- nev2nres11e
  output(nev2nres12e) <- nev2nres12e
  output(nev2nres13e) <- nev2nres13e
  output(nev2nres14e) <- nev2nres14e
  output(nev2nres15e) <- nev2nres15e
  output(nev2nres16e) <- nev2nres16e
  output(nev2nres17e) <- nev2nres17e
  
  
  
  
  
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
                 yi = v_turn10_i_scenario,
                 ye = v_turn10_e_scenario,
                 
                 rft = rf_t_scenario,
                 ri = rise_scenario,
                 fa = fall_scenario,
                 
                 tlac = t_lac,
                 tlacadj = t_lac_adj,
                 nrlaci = nresincl,
                 rlaci = resincl,
                 placi = priincl,
                 nrlace = nresexcl,
                 rlace = resexcl,
                 place = priexcl,
                 
                 
                 enr = endnr,
                 eres = endres,
                 
                 n2nres10i = never2nres10i,
                 n2nres11i = never2nres11i,
                 n2nres12i = never2nres12i,
                 n2nres13i = never2nres13i,
                 n2nres14i = never2nres14i,
                 n2nres15i = never2nres15i,
                 n2nres16i = never2nres16i,
                 n2nres17i = never2nres17i,
                 
                 n2res10i = never2res10i,
                 n2res11i = never2res11i,
                 n2res12i = never2res12i,
                 n2res13i = never2res13i,
                 n2res14i = never2res14i,
                 n2res15i = never2res15i,
                 n2res16i = never2res16i,
                 n2res17i = never2res17i,
                 
                 p2nres10i = prior2nres10i,
                 p2nres11i = prior2nres11i,
                 p2nres12i = prior2nres12i,
                 p2nres13i = prior2nres13i,
                 p2nres14i = prior2nres14i,
                 p2nres15i = prior2nres15i,
                 p2nres16i = prior2nres16i,
                 p2nres17i = prior2nres17i,
                 
                 p2res10i = prior2res10i,
                 p2res11i = prior2res11i,
                 p2res12i = prior2res12i,
                 p2res13i = prior2res13i,
                 p2res14i = prior2res14i,
                 p2res15i = prior2res15i,
                 p2res16i = prior2res16i,
                 p2res17i = prior2res17i,
                 
                 n2nres10e = never2nres10e,
                 n2nres11e = never2nres11e,
                 n2nres12e = never2nres12e,
                 n2nres13e = never2nres13e,
                 n2nres14e = never2nres14e,
                 n2nres15e = never2nres15e,
                 n2nres16e = never2nres16e,
                 n2nres17e = never2nres17e,
                 
                 n2res10e = never2res10e,
                 n2res11e = never2res11e,
                 n2res12e = never2res12e,
                 n2res13e = never2res13e,
                 n2res14e = never2res14e,
                 n2res15e = never2res15e,
                 n2res16e = never2res16e,
                 n2res17e = never2res17e,
                 
                 p2nres10e = prior2nres10e,
                 p2nres11e = prior2nres11e,
                 p2nres12e = prior2nres12e,
                 p2nres13e = prior2nres13e,
                 p2nres14e = prior2nres14e,
                 p2nres15e = prior2nres15e,
                 p2nres16e = prior2nres16e,
                 p2nres17e = prior2nres17e,
                 
                 p2res10e = prior2res10e,
                 p2res11e = prior2res11e,
                 p2res12e = prior2res12e,
                 p2res13e = prior2res13e,
                 p2res14e = prior2res14e,
                 p2res15e = prior2res15e,
                 p2res16e = prior2res16e,
                 p2res17e = prior2res17e,
                 
                 
                 
                 # INITIAL CONDITIONS
                 ILACnev10_ini = c(exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres10_ini = c(exact_ic %>% 
                                      filter(age == 10,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 10,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres10_ini = c(exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior10_ini = c(exact_ic %>% 
                                       filter(age == 10,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 10,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 ILACnev11_ini = c(exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres11_ini = c(exact_ic %>% 
                                      filter(age == 11,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 11,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres11_ini = c(exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior11_ini = c(exact_ic %>% 
                                       filter(age == 11,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 11,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 ILACnev12_ini = c(exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres12_ini = c(exact_ic %>% 
                                      filter(age == 12,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 12,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres12_ini = c(exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior12_ini = c(exact_ic %>% 
                                       filter(age == 12,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 12,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 
                 ILACnev13_ini = c(exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres13_ini = c(exact_ic %>% 
                                      filter(age == 13,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 13,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres13_ini = c(exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior13_ini = c(exact_ic %>% 
                                       filter(age == 13,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 13,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 
                 ILACnev14_ini = c(exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres14_ini = c(exact_ic %>% 
                                      filter(age == 14,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 14,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres14_ini = c(exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior14_ini = c(exact_ic %>% 
                                       filter(age == 14,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 14,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 
                 ILACnev15_ini = c(exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres15_ini = c(exact_ic %>% 
                                      filter(age == 15,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 15,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres15_ini = c(exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior15_ini = c(exact_ic %>% 
                                       filter(age == 15,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 15,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 
                 ILACnev16_ini = c(exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres16_ini = c(exact_ic %>% 
                                      filter(age == 16,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 16,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres16_ini = c(exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior16_ini = c(exact_ic %>% 
                                       filter(age == 16,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 16,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 
                 
                 ILACnev17_ini = c(exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Boys") %>% 
                                     select(nev_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Girls") %>% 
                                     select(nev_incl) %>% 
                                     unlist()),
                 ILACnres17_ini = c(exact_ic %>% 
                                      filter(age == 17,
                                             gender == "Boys") %>% 
                                      select(nres_incl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 17,
                                             gender == "Girls") %>% 
                                      select(nres_incl) %>% 
                                      unlist()),
                 ILACres17_ini = c(exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Boys") %>% 
                                     select(res_incl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Girls") %>% 
                                     select(res_incl) %>% 
                                     unlist()),
                 ILACprior17_ini = c(exact_ic %>% 
                                       filter(age == 17,
                                              gender == "Boys") %>% 
                                       select(pri_incl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 17,
                                              gender == "Girls") %>% 
                                       select(pri_incl) %>% 
                                       unlist()),
                 ELACnev10_ini = c(exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres10_ini = c(exact_ic %>% 
                                      filter(age == 10,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 10,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres10_ini = c(exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 10,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior10_ini = c(exact_ic %>% 
                                       filter(age == 10,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 10,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 ELACnev11_ini = c(exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres11_ini = c(exact_ic %>% 
                                      filter(age == 11,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 11,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres11_ini = c(exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 11,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior11_ini = c(exact_ic %>% 
                                       filter(age == 11,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 11,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 ELACnev12_ini = c(exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 
                 ELACnres12_ini = c(exact_ic %>% 
                                      filter(age == 12,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 12,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres12_ini = c(exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 12,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior12_ini = c(exact_ic %>% 
                                       filter(age == 12,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 12,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 
                 ELACnev13_ini = c(exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres13_ini = c(exact_ic %>% 
                                      filter(age == 13,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 13,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres13_ini = c(exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 13,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior13_ini = c(exact_ic %>% 
                                       filter(age == 13,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 13,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 
                 ELACnev14_ini = c(exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres14_ini = c(exact_ic %>% 
                                      filter(age == 14,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 14,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres14_ini = c(exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 14,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior14_ini = c(exact_ic %>% 
                                       filter(age == 14,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 14,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 
                 ELACnev15_ini = c(exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres15_ini = c(exact_ic %>% 
                                      filter(age == 15,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 15,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres15_ini = c(exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 15,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior15_ini = c(exact_ic %>% 
                                       filter(age == 15,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 15,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 
                 ELACnev16_ini = c(exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres16_ini = c(exact_ic %>% 
                                      filter(age == 16,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 16,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres16_ini = c(exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 16,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior16_ini = c(exact_ic %>% 
                                       filter(age == 16,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 16,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist()),
                 
                 
                 ELACnev17_ini = c(exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Boys") %>% 
                                     select(nev_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Girls") %>% 
                                     select(nev_excl) %>% 
                                     unlist()),
                 ELACnres17_ini = c(exact_ic %>% 
                                      filter(age == 17,
                                             gender == "Boys") %>% 
                                      select(nres_excl) %>% 
                                      unlist(), exact_ic %>% 
                                      filter(age == 17,
                                             gender == "Girls") %>% 
                                      select(nres_excl) %>% 
                                      unlist()),
                 ELACres17_ini = c(exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Boys") %>% 
                                     select(res_excl) %>% 
                                     unlist(), exact_ic %>% 
                                     filter(age == 17,
                                            gender == "Girls") %>% 
                                     select(res_excl) %>% 
                                     unlist()),
                 ELACprior17_ini = c(exact_ic %>% 
                                       filter(age == 17,
                                              gender == "Boys") %>% 
                                       select(pri_excl) %>% 
                                       unlist(), exact_ic %>% 
                                       filter(age == 17,
                                              gender == "Girls") %>% 
                                       select(pri_excl) %>% 
                                       unlist())
                 
                 
                 
                 # PARAMETERS
                 # pc_prior = c(0.0066,0.0066)
                 
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
# LAC_data <- as.data.frame(mod$run(t))

LAC_data_scenario <- as.data.frame(mod$run(t))