# DECIDED - LATEST VERSION

# to -do
# 1. add in events, like missing, stop and search, arrests, all the prison events
# 2. figure out the transition to close
# 3. mortality - both county lines related and other]
# actually how the dynamics of recruitment are - is that they are responsive to demand.
# like either children are in a latent state? or recruitment parameters hit zero when demand is filled/ there is surplus?
# think about the effect of a child arrested, drugs seized, child removed from the CL labour pool bc has been incarcerated.
# 5. there is still something tricky to do with timing and when ftes are counted - with the remand delay etc
# 6. pc_rep - we can just set that equal to a lag of percentage of custodial offences that are prior offenders - but there is probably away to keep track of state makeup - like averaging the inflows over the last 40 days.
# 7. figure out how to do time varying parameters

#
# install.packages("drat")
# library(drat)
# drat:::add("mrc-ide")
# install.packages("odin")
# library(odin)
# install.packages("pkgload")
# library(pkgbuild)
# library(pkgload)

cl_draft = odin::odin({
  ##TIME STEPS IS WEEKS

  ##############################################################################################################################
  ##number of gender classes########################################################################################################################################
  ##############################################################################################################################
  N_gender <- user(2)

  ##############################################################################################################################
  # mixing ########################################################################################################################################
  ##############################################################################################################################
  alpha <- user(0.8) #class mixing
  beta <- user(0.95) #age mixing

  ##############################################################################################################################
  # aging in ########################################################################################################################################
  ##############################################################################################################################

  #kids coming in - total 7336 girls and 7842 boys yearly - so 141 girls and 151 boys weekly
  #they come in in a block and then we send them to their states by dividing up percentages


  pc_incl[] <- user(0)
  pc_excl[] <- user(0) #class breakdown - pc boys, girls excluded
  pc_close[] <- user(0) #class breakdown - pc boys, girls close


  ##############################################################################################################################
  # ageing out ##################################################################################################################
  ##############################################################################################################################

  age_up <- user(0.01923076923) # rate of ageing out of your age compartment - 1/52

  ##############################################################################################################################
  # PARAMETERS ########################################################################################################################################
  ###############################################################################################################################

  ##default in parentheses - timestep is weekly? lets try weekly

  # parameters to do with mixing
  # alpha <- user(1.5) #changes degree of assortativity in mixing across social classes ('1 -> infinity' is equiv to 'totally assortative -> totally proportional')
  x[,] <- user(0) #gender mixing

  contact <- user(7) #contact rate per week - 1 a day for 7 days?

  recruit_i[] <- user(0) #recruitment per contact? included -  you need 1000 contacts
  recruit_e[] <- user(0) #recruitment per contact? excluded - you need 500 contacts
  recruit_c[] <- user(0) #recruitment per contact? close - you need 200 contacts|?
  recruit_cust[] <- user(0) #recruitment per contact? in jail - you need 200 contacts|?

  associate_i[] <- user(0) #police association w other surveilled child per contact? included -  you need 1000 contacts
  associate_e[] <- user(0) #police association w other surveilled child per contact? excluded - you need 500 contacts
  associate_c[] <- user(0) #police association w other surveilled child per contact? close - you need 200 contacts|?

  # parameters to do with remand, fte, repeat offending


  r2c <- user(0.33) #percentage of custody remands that result in a custodial sentence
  r2nc <- user(0.33) #percentage of custody remands that result in a non-custodial sentence
  r2a <- user(0.33) #percentage of custody remands that result acquittal

  # end_rem <- user(0.175) #rate that sets the length of the average custody remand - should be 40 so 5.7 weeks, 1/5.7
  # end_cust <- user(0.05) #rate that sets the length of the custodial sentence - meant to be 139 so lets say 20 weeks, 1/20

  # surv <- user(1.1) #figure this out properly but its some sort of elevated risk of criminalisation that you get from beign already known to the police
  # cl_multiplier <- user(1) #some elevated risk of going missing, getting cautioned/sentenced etc if you're working CL (20%)

# parameters to do with changing social state

  # parameters to do with stopping working

  deter <- user(0) #rate of CL workers resolving to stop while doing a custodial sentence (note, they can be recruited back later)
  desist <- user(0.000) #probability of desisting at other times


  #########no priors to remand, nc, custodial states############################
  np2rem_i10[] <- user(0)
  np2rem_e10[] <- user(0)
  np2rem_c10[] <- user(0)
  np2rem_i11[] <- user(0)
  np2rem_e11[] <- user(0)
  np2rem_c11[] <- user(0)
  np2rem_i12[] <- user(0)
  np2rem_e12[] <- user(0)
  np2rem_c12[] <- user(0)
  np2rem_i13[] <- user(0)
  np2rem_e13[] <- user(0)
  np2rem_c13[] <- user(0)
  np2rem_i14[] <- user(0)
  np2rem_e14[] <- user(0)
  np2rem_c14[] <- user(0)
  np2rem_i15[] <- user(0)
  np2rem_e15[] <- user(0)
  np2rem_c15[] <- user(0)
  np2rem_i16[] <- user(0)
  np2rem_e16[] <- user(0)
  np2rem_c16[] <- user(0)
  np2rem_i17[] <- user(0)
  np2rem_e17[] <- user(0)
  np2rem_c17[] <- user(0)

  # np2nc_i10[] <- user(0)
  # np2nc_e10[] <- user(0)
  # np2nc_c10[] <- user(0)
  # np2nc_i11[] <- user(0)
  # np2nc_e11[] <- user(0)
  # np2nc_c11[] <- user(0)
  # np2nc_i12[] <- user(0)
  # np2nc_e12[] <- user(0)
  # np2nc_c12[] <- user(0)
  # np2nc_i13[] <- user(0)
  # np2nc_e13[] <- user(0)
  # np2nc_c13[] <- user(0)
  # np2nc_i14[] <- user(0)
  # np2nc_e14[] <- user(0)
  # np2nc_c14[] <- user(0)
  # np2nc_i15[] <- user(0)
  # np2nc_e15[] <- user(0)
  # np2nc_c15[] <- user(0)
  # np2nc_i16[] <- user(0)
  # np2nc_e16[] <- user(0)
  # np2nc_c16[] <- user(0)
  # np2nc_i17[] <- user(0)
  # np2nc_e17[] <- user(0)
  # np2nc_c17[] <- user(0)
  #
  # np2cust_i10[] <- user(0)
  # np2cust_e10[] <- user(0)
  # np2cust_c10[] <- user(0)
  # np2cust_i11[] <- user(0)
  # np2cust_e11[] <- user(0)
  # np2cust_c11[] <- user(0)
  # np2cust_i12[] <- user(0)
  # np2cust_e12[] <- user(0)
  # np2cust_c12[] <- user(0)
  # np2cust_i13[] <- user(0)
  # np2cust_e13[] <- user(0)
  # np2cust_c13[] <- user(0)
  # np2cust_i14[] <- user(0)
  # np2cust_e14[] <- user(0)
  # np2cust_c14[] <- user(0)
  # np2cust_i15[] <- user(0)
  # np2cust_e15[] <- user(0)
  # np2cust_c15[] <- user(0)
  # np2cust_i16[] <- user(0)
  # np2cust_e16[] <- user(0)
  # np2cust_c16[] <- user(0)
  # np2cust_i17[] <- user(0)
  # np2cust_e17[] <- user(0)
  # np2cust_c17[] <- user(0)


  ######### yes priors to remand, nc, custodial states############################
  prior2rem_i10[] <- user(0)
  prior2rem_e10[] <- user(0)
  prior2rem_c10[] <- user(0)
  prior2rem_i11[] <- user(0)
  prior2rem_e11[] <- user(0)
  prior2rem_c11[] <- user(0)
  prior2rem_i12[] <- user(0)
  prior2rem_e12[] <- user(0)
  prior2rem_c12[] <- user(0)
  prior2rem_i13[] <- user(0)
  prior2rem_e13[] <- user(0)
  prior2rem_c13[] <- user(0)
  prior2rem_i14[] <- user(0)
  prior2rem_e14[] <- user(0)
  prior2rem_c14[] <- user(0)
  prior2rem_i15[] <- user(0)
  prior2rem_e15[] <- user(0)
  prior2rem_c15[] <- user(0)
  prior2rem_i16[] <- user(0)
  prior2rem_e16[] <- user(0)
  prior2rem_c16[] <- user(0)
  prior2rem_i17[] <- user(0)
  prior2rem_e17[] <- user(0)
  prior2rem_c17[] <- user(0)

  prior2nc_i10[] <- user(0)
  prior2nc_e10[] <- user(0)
  prior2nc_c10[] <- user(0)
  prior2nc_i11[] <- user(0)
  prior2nc_e11[] <- user(0)
  prior2nc_c11[] <- user(0)
  prior2nc_i12[] <- user(0)
  prior2nc_e12[] <- user(0)
  prior2nc_c12[] <- user(0)
  prior2nc_i13[] <- user(0)
  prior2nc_e13[] <- user(0)
  prior2nc_c13[] <- user(0)
  prior2nc_i14[] <- user(0)
  prior2nc_e14[] <- user(0)
  prior2nc_c14[] <- user(0)
  prior2nc_i15[] <- user(0)
  prior2nc_e15[] <- user(0)
  prior2nc_c15[] <- user(0)
  prior2nc_i16[] <- user(0)
  prior2nc_e16[] <- user(0)
  prior2nc_c16[] <- user(0)
  prior2nc_i17[] <- user(0)
  prior2nc_e17[] <- user(0)
  prior2nc_c17[] <- user(0)

  prior2cust_i10[] <- user(0)
  prior2cust_e10[] <- user(0)
  prior2cust_c10[] <- user(0)
  prior2cust_i11[] <- user(0)
  prior2cust_e11[] <- user(0)
  prior2cust_c11[] <- user(0)
  prior2cust_i12[] <- user(0)
  prior2cust_e12[] <- user(0)
  prior2cust_c12[] <- user(0)
  prior2cust_i13[] <- user(0)
  prior2cust_e13[] <- user(0)
  prior2cust_c13[] <- user(0)
  prior2cust_i14[] <- user(0)
  prior2cust_e14[] <- user(0)
  prior2cust_c14[] <- user(0)
  prior2cust_i15[] <- user(0)
  prior2cust_e15[] <- user(0)
  prior2cust_c15[] <- user(0)
  prior2cust_i16[] <- user(0)
  prior2cust_e16[] <- user(0)
  prior2cust_c16[] <- user(0)
  prior2cust_i17[] <- user(0)
  prior2cust_e17[] <- user(0)
  prior2cust_c17[] <- user(0)


  arrest_uin10[] <- user(0)
  arrest_uen10[] <- user(0)
  arrest_ucn10[] <- user(0)
  arrest_win10[] <- user(0)
  arrest_wen10[] <- user(0)
  arrest_wcn10[] <- user(0)

  arrest_uin11[] <- user(0)
  arrest_uen11[] <- user(0)
  arrest_ucn11[] <- user(0)
  arrest_win11[] <- user(0)
  arrest_wen11[] <- user(0)
  arrest_wcn11[] <- user(0)

  arrest_uin12[] <- user(0)
  arrest_uen12[] <- user(0)
  arrest_ucn12[] <- user(0)
  arrest_win12[] <- user(0)
  arrest_wen12[] <- user(0)
  arrest_wcn12[] <- user(0)

  arrest_uin13[] <- user(0)
  arrest_uen13[] <- user(0)
  arrest_ucn13[] <- user(0)
  arrest_win13[] <- user(0)
  arrest_wen13[] <- user(0)
  arrest_wcn13[] <- user(0)

  arrest_uin14[] <- user(0)
  arrest_uen14[] <- user(0)
  arrest_ucn14[] <- user(0)
  arrest_win14[] <- user(0)
  arrest_wen14[] <- user(0)
  arrest_wcn14[] <- user(0)

  arrest_uin15[] <- user(0)
  arrest_uen15[] <- user(0)
  arrest_ucn15[] <- user(0)
  arrest_win15[] <- user(0)
  arrest_wen15[] <- user(0)
  arrest_wcn15[] <- user(0)

  arrest_uin16[] <- user(0)
  arrest_uen16[] <- user(0)
  arrest_ucn16[] <- user(0)
  arrest_win16[] <- user(0)
  arrest_wen16[] <- user(0)
  arrest_wcn16[] <- user(0)

  arrest_uin17[] <- user(0)
  arrest_uen17[] <- user(0)
  arrest_ucn17[] <- user(0)
  arrest_win17[] <- user(0)
  arrest_wen17[] <- user(0)
  arrest_wcn17[] <- user(0)

  # ss_uin10[] <- user(0)
  # ss_uen10[] <- user(0)
  # ss_ucn10[] <- user(0)
  # ss_win10[] <- user(0)
  # ss_wen10[] <- user(0)
  # ss_wcn10[] <- user(0)
  #
  # ss_uin11[] <- user(0)
  # ss_uen11[] <- user(0)
  # ss_ucn11[] <- user(0)
  # ss_win11[] <- user(0)
  # ss_wen11[] <- user(0)
  # ss_wcn11[] <- user(0)
  #
  # ss_uin12[] <- user(0)
  # ss_uen12[] <- user(0)
  # ss_ucn12[] <- user(0)
  # ss_win12[] <- user(0)
  # ss_wen12[] <- user(0)
  # ss_wcn12[] <- user(0)
  #
  # ss_uin13[] <- user(0)
  # ss_uen13[] <- user(0)
  # ss_ucn13[] <- user(0)
  # ss_win13[] <- user(0)
  # ss_wen13[] <- user(0)
  # ss_wcn13[] <- user(0)
  #
  # ss_uin14[] <- user(0)
  # ss_uen14[] <- user(0)
  # ss_ucn14[] <- user(0)
  # ss_win14[] <- user(0)
  # ss_wen14[] <- user(0)
  # ss_wcn14[] <- user(0)
  #
  # ss_uin15[] <- user(0)
  # ss_uen15[] <- user(0)
  # ss_ucn15[] <- user(0)
  # ss_win15[] <- user(0)
  # ss_wen15[] <- user(0)
  # ss_wcn15[] <- user(0)
  #
  # ss_uin16[] <- user(0)
  # ss_uen16[] <- user(0)
  # ss_ucn16[] <- user(0)
  # ss_win16[] <- user(0)
  # ss_wen16[] <- user(0)
  # ss_wcn16[] <- user(0)
  #
  # ss_uin17[] <- user(0)
  # ss_uen17[] <- user(0)
  # ss_ucn17[] <- user(0)
  # ss_win17[] <- user(0)
  # ss_wen17[] <- user(0)
  # ss_wcn17[] <- user(0)

  # missing_uin10[] <- user(0)
  # missing_uen10[] <- user(0)
  # missing_ucn10[] <- user(0)
  # missing_win10[] <- user(0)
  # missing_wen10[] <- user(0)
  # missing_wcn10[] <- user(0)
  #
  # missing_uin11[] <- user(0)
  # missing_uen11[] <- user(0)
  # missing_ucn11[] <- user(0)
  # missing_win11[] <- user(0)
  # missing_wen11[] <- user(0)
  # missing_wcn11[] <- user(0)
  #
  # missing_uin12[] <- user(0)
  # missing_uen12[] <- user(0)
  # missing_ucn12[] <- user(0)
  # missing_win12[] <- user(0)
  # missing_wen12[] <- user(0)
  # missing_wcn12[] <- user(0)
  #
  # missing_uin13[] <- user(0)
  # missing_uen13[] <- user(0)
  # missing_ucn13[] <- user(0)
  # missing_win13[] <- user(0)
  # missing_wen13[] <- user(0)
  # missing_wcn13[] <- user(0)
  #
  # missing_uin14[] <- user(0)
  # missing_uen14[] <- user(0)
  # missing_ucn14[] <- user(0)
  # missing_win14[] <- user(0)
  # missing_wen14[] <- user(0)
  # missing_wcn14[] <- user(0)
  #
  # missing_uin15[] <- user(0)
  # missing_uen15[] <- user(0)
  # missing_ucn15[] <- user(0)
  # missing_win15[] <- user(0)
  # missing_wen15[] <- user(0)
  # missing_wcn15[] <- user(0)
  #
  # missing_uin16[] <- user(0)
  # missing_uen16[] <- user(0)
  # missing_ucn16[] <- user(0)
  # missing_win16[] <- user(0)
  # missing_wen16[] <- user(0)
  # missing_wcn16[] <- user(0)
  #
  # missing_uin17[] <- user(0)
  # missing_uen17[] <- user(0)
  # missing_ucn17[] <- user(0)
  # missing_win17[] <- user(0)
  # missing_wen17[] <- user(0)
  # missing_wcn17[] <- user(0)






  ##############################################################################################################################
  ##initial conditions ########################################################################################################################################
  ##############################################################################################################################


  Uin10_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen10_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn10_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis10_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues10_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs10_ini[] <- user(0) #number initially uninvolved, surveilled - 100% of the close

  Uinc10_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc10_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc10_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win10_ini[] <- user(0) #number initially working, no police contact
  Wen10_ini[] <- user(0) #number initially working, no police contact
  Wcn10_ini[] <- user(0) #number initially working, no police contact

  Wis10_ini[] <- user(0) #number initially working, surveilled
  Wes10_ini[] <- user(0) #number initially working, surveilled
  Wcs10_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc10_ini[] <- user(0) #number initially working, in CSJ
  Wenc10_ini[] <- user(0) #number initially working, in CSJ
  Wcnc10_ini[] <- user(0) #number initially working, in CSJ

  Uics10_ini[] <- user(0) #number initially on custodial sentence
  Uecs10_ini[] <- user(0) #number initially on custodial sentence
  Uccs10_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics10_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs10_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs10_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf10_ini[] <- user(0) #number initially remanded to custody - none
  Uicrr10_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf10_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uecrr10_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf10_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr10_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these

  Wicrf10_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf10_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf10_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr10_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr10_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr10_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin10[]) <- Uin10_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen10[]) <- Uen10_ini[i]
  initial(Ucn10[]) <- Ucn10_ini[i]

  initial(Uis10[]) <- Uis10_ini[i]
  initial(Ues10[]) <- Ues10_ini[i]
  initial(Ucs10[]) <- Ucs10_ini[i]

  initial(Uinc10[]) <- Uinc10_ini[i]
  initial(Uenc10[]) <- Uenc10_ini[i]
  initial(Ucnc10[]) <- Ucnc10_ini[i]

  initial(Win10[]) <- Win10_ini[i]
  initial(Wen10[]) <- Wen10_ini[i]
  initial(Wcn10[]) <- Wcn10_ini[i]

  initial(Wis10[]) <- Wis10_ini[i]
  initial(Wes10[]) <- Wes10_ini[i]
  initial(Wcs10[]) <- Wcs10_ini[i]

  initial(Winc10[]) <- Winc10_ini[i]
  initial(Wenc10[]) <- Wenc10_ini[i]
  initial(Wcnc10[]) <- Wcnc10_ini[i]

  initial(Uics10[]) <- Uics10_ini[i]
  initial(Uecs10[]) <- Uecs10_ini[i]
  initial(Uccs10[]) <- Uccs10_ini[i]

  initial(Wics10[]) <- Wics10_ini[i]
  initial(Wecs10[]) <- Wecs10_ini[i]
  initial(Wccs10[]) <- Wccs10_ini[i]

  initial(Uicrf10[]) <- Uicrf10_ini[i]
  initial(Uecrf10[]) <- Uecrf10_ini[i]
  initial(Uccrf10[]) <- Uccrf10_ini[i]
  initial(Uicrr10[]) <- Uicrr10_ini[i]
  initial(Uecrr10[]) <- Uecrr10_ini[i]
  initial(Uccrr10[]) <- Uccrr10_ini[i]

  initial(Wicrf10[]) <- Wicrf10_ini[i]
  initial(Wecrf10[]) <- Wecrf10_ini[i]
  initial(Wccrf10[]) <- Wccrf10_ini[i]
  initial(Wicrr10[]) <- Wicrr10_ini[i]
  initial(Wecrr10[]) <- Wecrr10_ini[i]
  initial(Wccrr10[]) <- Wccrr10_ini[i]

  #################################
  Uin11_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen11_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn11_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis11_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues11_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs11_ini[] <- user(0) #number initially uninvolved, surveilled - 110% of the close

  Uinc11_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc11_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc11_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win11_ini[] <- user(0) #number initially working, no police contact
  Wen11_ini[] <- user(0) #number initially working, no police contact
  Wcn11_ini[] <- user(0) #number initially working, no police contact

  Wis11_ini[] <- user(0) #number initially working, surveilled
  Wes11_ini[] <- user(0) #number initially working, surveilled
  Wcs11_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc11_ini[] <- user(0) #number initially working, in CSJ
  Wenc11_ini[] <- user(0) #number initially working, in CSJ
  Wcnc11_ini[] <- user(0) #number initially working, in CSJ

  Uics11_ini[] <- user(0) #number initially on custodial sentence
  Uecs11_ini[] <- user(0) #number initially on custodial sentence
  Uccs11_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics11_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs11_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs11_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf11_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf11_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf11_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr11_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr11_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr11_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these


  Wicrf11_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf11_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf11_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr11_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr11_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr11_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin11[]) <- Uin11_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen11[]) <- Uen11_ini[i]
  initial(Ucn11[]) <- Ucn11_ini[i]

  initial(Uis11[]) <- Uis11_ini[i]
  initial(Ues11[]) <- Ues11_ini[i]
  initial(Ucs11[]) <- Ucs11_ini[i]

  initial(Uinc11[]) <- Uinc11_ini[i]
  initial(Uenc11[]) <- Uenc11_ini[i]
  initial(Ucnc11[]) <- Ucnc11_ini[i]

  initial(Win11[]) <- Win11_ini[i]
  initial(Wen11[]) <- Wen11_ini[i]
  initial(Wcn11[]) <- Wcn11_ini[i]

  initial(Wis11[]) <- Wis11_ini[i]
  initial(Wes11[]) <- Wes11_ini[i]
  initial(Wcs11[]) <- Wcs11_ini[i]

  initial(Winc11[]) <- Winc11_ini[i]
  initial(Wenc11[]) <- Wenc11_ini[i]
  initial(Wcnc11[]) <- Wcnc11_ini[i]

  initial(Uics11[]) <- Uics11_ini[i]
  initial(Uecs11[]) <- Uecs11_ini[i]
  initial(Uccs11[]) <- Uccs11_ini[i]

  initial(Wics11[]) <- Wics11_ini[i]
  initial(Wecs11[]) <- Wecs11_ini[i]
  initial(Wccs11[]) <- Wccs11_ini[i]

  initial(Uicrf11[]) <- Uicrf11_ini[i]
  initial(Uecrf11[]) <- Uecrf11_ini[i]
  initial(Uccrf11[]) <- Uccrf11_ini[i]
  initial(Uicrr11[]) <- Uicrr11_ini[i]
  initial(Uecrr11[]) <- Uecrr11_ini[i]
  initial(Uccrr11[]) <- Uccrr11_ini[i]

  initial(Wicrf11[]) <- Wicrf11_ini[i]
  initial(Wecrf11[]) <- Wecrf11_ini[i]
  initial(Wccrf11[]) <- Wccrf11_ini[i]
  initial(Wicrr11[]) <- Wicrr11_ini[i]
  initial(Wecrr11[]) <- Wecrr11_ini[i]
  initial(Wccrr11[]) <- Wccrr11_ini[i]


  #################################
  Uin12_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen12_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn12_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis12_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues12_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs12_ini[] <- user(0) #number initially uninvolved, surveilled - 120% of the close

  Uinc12_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc12_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc12_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win12_ini[] <- user(0) #number initially working, no police contact
  Wen12_ini[] <- user(0) #number initially working, no police contact
  Wcn12_ini[] <- user(0) #number initially working, no police contact

  Wis12_ini[] <- user(0) #number initially working, surveilled
  Wes12_ini[] <- user(0) #number initially working, surveilled
  Wcs12_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc12_ini[] <- user(0) #number initially working, in CSJ
  Wenc12_ini[] <- user(0) #number initially working, in CSJ
  Wcnc12_ini[] <- user(0) #number initially working, in CSJ

  Uics12_ini[] <- user(0) #number initially on custodial sentence
  Uecs12_ini[] <- user(0) #number initially on custodial sentence
  Uccs12_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics12_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs12_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs12_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf12_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf12_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf12_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr12_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr12_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr12_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these

  Wicrf12_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf12_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf12_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr12_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr12_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr12_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin12[]) <- Uin12_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen12[]) <- Uen12_ini[i]
  initial(Ucn12[]) <- Ucn12_ini[i]

  initial(Uis12[]) <- Uis12_ini[i]
  initial(Ues12[]) <- Ues12_ini[i]
  initial(Ucs12[]) <- Ucs12_ini[i]

  initial(Uinc12[]) <- Uinc12_ini[i]
  initial(Uenc12[]) <- Uenc12_ini[i]
  initial(Ucnc12[]) <- Ucnc12_ini[i]

  initial(Win12[]) <- Win12_ini[i]
  initial(Wen12[]) <- Wen12_ini[i]
  initial(Wcn12[]) <- Wcn12_ini[i]

  initial(Wis12[]) <- Wis12_ini[i]
  initial(Wes12[]) <- Wes12_ini[i]
  initial(Wcs12[]) <- Wcs12_ini[i]

  initial(Winc12[]) <- Winc12_ini[i]
  initial(Wenc12[]) <- Wenc12_ini[i]
  initial(Wcnc12[]) <- Wcnc12_ini[i]

  initial(Uics12[]) <- Uics12_ini[i]
  initial(Uecs12[]) <- Uecs12_ini[i]
  initial(Uccs12[]) <- Uccs12_ini[i]

  initial(Wics12[]) <- Wics12_ini[i]
  initial(Wecs12[]) <- Wecs12_ini[i]
  initial(Wccs12[]) <- Wccs12_ini[i]

  initial(Uicrf12[]) <- Uicrf12_ini[i]
  initial(Uecrf12[]) <- Uecrf12_ini[i]
  initial(Uccrf12[]) <- Uccrf12_ini[i]
  initial(Uicrr12[]) <- Uicrr12_ini[i]
  initial(Uecrr12[]) <- Uecrr12_ini[i]
  initial(Uccrr12[]) <- Uccrr12_ini[i]

  initial(Wicrf12[]) <- Wicrf12_ini[i]
  initial(Wecrf12[]) <- Wecrf12_ini[i]
  initial(Wccrf12[]) <- Wccrf12_ini[i]
  initial(Wicrr12[]) <- Wicrr12_ini[i]
  initial(Wecrr12[]) <- Wecrr12_ini[i]
  initial(Wccrr12[]) <- Wccrr12_ini[i]

  #################################
  Uin13_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen13_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn13_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis13_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues13_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs13_ini[] <- user(0) #number initially uninvolved, surveilled - 130% of the close

  Uinc13_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc13_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc13_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win13_ini[] <- user(0) #number initially working, no police contact
  Wen13_ini[] <- user(0) #number initially working, no police contact
  Wcn13_ini[] <- user(0) #number initially working, no police contact

  Wis13_ini[] <- user(0) #number initially working, surveilled
  Wes13_ini[] <- user(0) #number initially working, surveilled
  Wcs13_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc13_ini[] <- user(0) #number initially working, in CSJ
  Wenc13_ini[] <- user(0) #number initially working, in CSJ
  Wcnc13_ini[] <- user(0) #number initially working, in CSJ

  Uics13_ini[] <- user(0) #number initially on custodial sentence
  Uecs13_ini[] <- user(0) #number initially on custodial sentence
  Uccs13_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics13_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs13_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs13_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf13_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf13_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf13_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr13_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr13_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr13_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these


  Wicrf13_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf13_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf13_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr13_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr13_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr13_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin13[]) <- Uin13_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen13[]) <- Uen13_ini[i]
  initial(Ucn13[]) <- Ucn13_ini[i]

  initial(Uis13[]) <- Uis13_ini[i]
  initial(Ues13[]) <- Ues13_ini[i]
  initial(Ucs13[]) <- Ucs13_ini[i]

  initial(Uinc13[]) <- Uinc13_ini[i]
  initial(Uenc13[]) <- Uenc13_ini[i]
  initial(Ucnc13[]) <- Ucnc13_ini[i]

  initial(Win13[]) <- Win13_ini[i]
  initial(Wen13[]) <- Wen13_ini[i]
  initial(Wcn13[]) <- Wcn13_ini[i]

  initial(Wis13[]) <- Wis13_ini[i]
  initial(Wes13[]) <- Wes13_ini[i]
  initial(Wcs13[]) <- Wcs13_ini[i]

  initial(Winc13[]) <- Winc13_ini[i]
  initial(Wenc13[]) <- Wenc13_ini[i]
  initial(Wcnc13[]) <- Wcnc13_ini[i]

  initial(Uics13[]) <- Uics13_ini[i]
  initial(Uecs13[]) <- Uecs13_ini[i]
  initial(Uccs13[]) <- Uccs13_ini[i]

  initial(Wics13[]) <- Wics13_ini[i]
  initial(Wecs13[]) <- Wecs13_ini[i]
  initial(Wccs13[]) <- Wccs13_ini[i]

  initial(Uicrf13[]) <- Uicrf13_ini[i]
  initial(Uecrf13[]) <- Uecrf13_ini[i]
  initial(Uccrf13[]) <- Uccrf13_ini[i]
  initial(Uicrr13[]) <- Uicrr13_ini[i]
  initial(Uecrr13[]) <- Uecrr13_ini[i]
  initial(Uccrr13[]) <- Uccrr13_ini[i]

  initial(Wicrf13[]) <- Wicrf13_ini[i]
  initial(Wecrf13[]) <- Wecrf13_ini[i]
  initial(Wccrf13[]) <- Wccrf13_ini[i]
  initial(Wicrr13[]) <- Wicrr13_ini[i]
  initial(Wecrr13[]) <- Wecrr13_ini[i]
  initial(Wccrr13[]) <- Wccrr13_ini[i]

  #################################
  Uin14_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen14_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn14_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis14_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues14_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs14_ini[] <- user(0) #number initially uninvolved, surveilled - 140% of the close

  Uinc14_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc14_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc14_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win14_ini[] <- user(0) #number initially working, no police contact
  Wen14_ini[] <- user(0) #number initially working, no police contact
  Wcn14_ini[] <- user(0) #number initially working, no police contact

  Wis14_ini[] <- user(0) #number initially working, surveilled
  Wes14_ini[] <- user(0) #number initially working, surveilled
  Wcs14_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc14_ini[] <- user(0) #number initially working, in CSJ
  Wenc14_ini[] <- user(0) #number initially working, in CSJ
  Wcnc14_ini[] <- user(0) #number initially working, in CSJ

  Uics14_ini[] <- user(0) #number initially on custodial sentence
  Uecs14_ini[] <- user(0) #number initially on custodial sentence
  Uccs14_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics14_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs14_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs14_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf14_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf14_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf14_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr14_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr14_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr14_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these

  Wicrf14_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf14_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf14_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr14_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr14_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr14_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin14[]) <- Uin14_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen14[]) <- Uen14_ini[i]
  initial(Ucn14[]) <- Ucn14_ini[i]

  initial(Uis14[]) <- Uis14_ini[i]
  initial(Ues14[]) <- Ues14_ini[i]
  initial(Ucs14[]) <- Ucs14_ini[i]

  initial(Uinc14[]) <- Uinc14_ini[i]
  initial(Uenc14[]) <- Uenc14_ini[i]
  initial(Ucnc14[]) <- Ucnc14_ini[i]

  initial(Win14[]) <- Win14_ini[i]
  initial(Wen14[]) <- Wen14_ini[i]
  initial(Wcn14[]) <- Wcn14_ini[i]

  initial(Wis14[]) <- Wis14_ini[i]
  initial(Wes14[]) <- Wes14_ini[i]
  initial(Wcs14[]) <- Wcs14_ini[i]

  initial(Winc14[]) <- Winc14_ini[i]
  initial(Wenc14[]) <- Wenc14_ini[i]
  initial(Wcnc14[]) <- Wcnc14_ini[i]

  initial(Uics14[]) <- Uics14_ini[i]
  initial(Uecs14[]) <- Uecs14_ini[i]
  initial(Uccs14[]) <- Uccs14_ini[i]

  initial(Wics14[]) <- Wics14_ini[i]
  initial(Wecs14[]) <- Wecs14_ini[i]
  initial(Wccs14[]) <- Wccs14_ini[i]

  initial(Uicrf14[]) <- Uicrf14_ini[i]
  initial(Uecrf14[]) <- Uecrf14_ini[i]
  initial(Uccrf14[]) <- Uccrf14_ini[i]
  initial(Uicrr14[]) <- Uicrr14_ini[i]
  initial(Uecrr14[]) <- Uecrr14_ini[i]
  initial(Uccrr14[]) <- Uccrr14_ini[i]

  initial(Wicrf14[]) <- Wicrf14_ini[i]
  initial(Wecrf14[]) <- Wecrf14_ini[i]
  initial(Wccrf14[]) <- Wccrf14_ini[i]
  initial(Wicrr14[]) <- Wicrr14_ini[i]
  initial(Wecrr14[]) <- Wecrr14_ini[i]
  initial(Wccrr14[]) <- Wccrr14_ini[i]

  #################################
  Uin15_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen15_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn15_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis15_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues15_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs15_ini[] <- user(0) #number initially uninvolved, surveilled - 150% of the close

  Uinc15_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc15_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc15_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win15_ini[] <- user(0) #number initially working, no police contact
  Wen15_ini[] <- user(0) #number initially working, no police contact
  Wcn15_ini[] <- user(0) #number initially working, no police contact

  Wis15_ini[] <- user(0) #number initially working, surveilled
  Wes15_ini[] <- user(0) #number initially working, surveilled
  Wcs15_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc15_ini[] <- user(0) #number initially working, in CSJ
  Wenc15_ini[] <- user(0) #number initially working, in CSJ
  Wcnc15_ini[] <- user(0) #number initially working, in CSJ

  Uics15_ini[] <- user(0) #number initially on custodial sentence
  Uecs15_ini[] <- user(0) #number initially on custodial sentence
  Uccs15_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics15_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs15_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs15_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf15_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf15_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf15_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr15_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr15_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr15_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these

  Wicrf15_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf15_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf15_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr15_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr15_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr15_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin15[]) <- Uin15_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen15[]) <- Uen15_ini[i]
  initial(Ucn15[]) <- Ucn15_ini[i]

  initial(Uis15[]) <- Uis15_ini[i]
  initial(Ues15[]) <- Ues15_ini[i]
  initial(Ucs15[]) <- Ucs15_ini[i]

  initial(Uinc15[]) <- Uinc15_ini[i]
  initial(Uenc15[]) <- Uenc15_ini[i]
  initial(Ucnc15[]) <- Ucnc15_ini[i]

  initial(Win15[]) <- Win15_ini[i]
  initial(Wen15[]) <- Wen15_ini[i]
  initial(Wcn15[]) <- Wcn15_ini[i]

  initial(Wis15[]) <- Wis15_ini[i]
  initial(Wes15[]) <- Wes15_ini[i]
  initial(Wcs15[]) <- Wcs15_ini[i]

  initial(Winc15[]) <- Winc15_ini[i]
  initial(Wenc15[]) <- Wenc15_ini[i]
  initial(Wcnc15[]) <- Wcnc15_ini[i]

  initial(Uics15[]) <- Uics15_ini[i]
  initial(Uecs15[]) <- Uecs15_ini[i]
  initial(Uccs15[]) <- Uccs15_ini[i]

  initial(Wics15[]) <- Wics15_ini[i]
  initial(Wecs15[]) <- Wecs15_ini[i]
  initial(Wccs15[]) <- Wccs15_ini[i]

  initial(Uicrf15[]) <- Uicrf15_ini[i]
  initial(Uecrf15[]) <- Uecrf15_ini[i]
  initial(Uccrf15[]) <- Uccrf15_ini[i]
  initial(Uicrr15[]) <- Uicrr15_ini[i]
  initial(Uecrr15[]) <- Uecrr15_ini[i]
  initial(Uccrr15[]) <- Uccrr15_ini[i]

  initial(Wicrf15[]) <- Wicrf15_ini[i]
  initial(Wecrf15[]) <- Wecrf15_ini[i]
  initial(Wccrf15[]) <- Wccrf15_ini[i]
  initial(Wicrr15[]) <- Wicrr15_ini[i]
  initial(Wecrr15[]) <- Wecrr15_ini[i]
  initial(Wccrr15[]) <- Wccrr15_ini[i]

  #################################
  Uin16_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen16_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn16_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis16_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues16_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs16_ini[] <- user(0) #number initially uninvolved, surveilled - 160% of the close

  Uinc16_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc16_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc16_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win16_ini[] <- user(0) #number initially working, no police contact
  Wen16_ini[] <- user(0) #number initially working, no police contact
  Wcn16_ini[] <- user(0) #number initially working, no police contact

  Wis16_ini[] <- user(0) #number initially working, surveilled
  Wes16_ini[] <- user(0) #number initially working, surveilled
  Wcs16_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc16_ini[] <- user(0) #number initially working, in CSJ
  Wenc16_ini[] <- user(0) #number initially working, in CSJ
  Wcnc16_ini[] <- user(0) #number initially working, in CSJ

  Uics16_ini[] <- user(0) #number initially on custodial sentence
  Uecs16_ini[] <- user(0) #number initially on custodial sentence
  Uccs16_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics16_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs16_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs16_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf16_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf16_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf16_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr16_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr16_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr16_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these

  Wicrf16_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf16_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf16_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr16_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrr16_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrr16_ini[] <- user(0) #number of CL initially remanded to custody -


  initial(Uin16[]) <- Uin16_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen16[]) <- Uen16_ini[i]
  initial(Ucn16[]) <- Ucn16_ini[i]

  initial(Uis16[]) <- Uis16_ini[i]
  initial(Ues16[]) <- Ues16_ini[i]
  initial(Ucs16[]) <- Ucs16_ini[i]

  initial(Uinc16[]) <- Uinc16_ini[i]
  initial(Uenc16[]) <- Uenc16_ini[i]
  initial(Ucnc16[]) <- Ucnc16_ini[i]

  initial(Win16[]) <- Win16_ini[i]
  initial(Wen16[]) <- Wen16_ini[i]
  initial(Wcn16[]) <- Wcn16_ini[i]

  initial(Wis16[]) <- Wis16_ini[i]
  initial(Wes16[]) <- Wes16_ini[i]
  initial(Wcs16[]) <- Wcs16_ini[i]

  initial(Winc16[]) <- Winc16_ini[i]
  initial(Wenc16[]) <- Wenc16_ini[i]
  initial(Wcnc16[]) <- Wcnc16_ini[i]

  initial(Uics16[]) <- Uics16_ini[i]
  initial(Uecs16[]) <- Uecs16_ini[i]
  initial(Uccs16[]) <- Uccs16_ini[i]

  initial(Wics16[]) <- Wics16_ini[i]
  initial(Wecs16[]) <- Wecs16_ini[i]
  initial(Wccs16[]) <- Wccs16_ini[i]

  initial(Uicrf16[]) <- Uicrf16_ini[i]
  initial(Uecrf16[]) <- Uecrf16_ini[i]
  initial(Uccrf16[]) <- Uccrf16_ini[i]
  initial(Uicrr16[]) <- Uicrr16_ini[i]
  initial(Uecrr16[]) <- Uecrr16_ini[i]
  initial(Uccrr16[]) <- Uccrr16_ini[i]

  initial(Wicrf16[]) <- Wicrf16_ini[i]
  initial(Wecrf16[]) <- Wecrf16_ini[i]
  initial(Wccrf16[]) <- Wccrf16_ini[i]
  initial(Wicrr16[]) <- Wicrr16_ini[i]
  initial(Wecrr16[]) <- Wecrr16_ini[i]
  initial(Wccrr16[]) <- Wccrr16_ini[i]

  #################################
  Uin17_ini[] <- user(0) #number initially uninvolved, no police contact
  Uen17_ini[] <- user(0) #number initially uninvolved, no police contact - 93.6% of the excluded
  Ucn17_ini[] <- user(0) #number initially uninvolved, no police contact - zero for close, all already flagged

  Uis17_ini[] <- user(0) #number initially uninvolved, surveilled - zero for included
  Ues17_ini[] <- user(0) #number initially uninvolved, surveilled - 6.6% of the excluded
  Ucs17_ini[] <- user(0) #number initially uninvolved, surveilled - 170% of the close

  Uinc17_ini[] <- user(0) #number initially uninvolved, in CSJ - lets say 800 start in the CSJ (i just picked), and i split between 3
  Uenc17_ini[] <- user(0) #number initially uninvolved, in CSJ
  Ucnc17_ini[] <- user(0) #number initially uninvolved, in CSJ

  Win17_ini[] <- user(0) #number initially working, no police contact
  Wen17_ini[] <- user(0) #number initially working, no police contact
  Wcn17_ini[] <- user(0) #number initially working, no police contact

  Wis17_ini[] <- user(0) #number initially working, surveilled
  Wes17_ini[] <- user(0) #number initially working, surveilled
  Wcs17_ini[] <- user(0) #number initially working, surveilled -lets start small working & hope it takes off?

  Winc17_ini[] <- user(0) #number initially working, in CSJ
  Wenc17_ini[] <- user(0) #number initially working, in CSJ
  Wcnc17_ini[] <- user(0) #number initially working, in CSJ

  Uics17_ini[] <- user(0) #number initially on custodial sentence
  Uecs17_ini[] <- user(0) #number initially on custodial sentence
  Uccs17_ini[] <- user(0) #number initially on custodial sentence - prev of custodial sentence is 38 so, just split it

  Wics17_ini[] <- user(0) #number of CL initially on custodial sentence
  Wecs17_ini[] <- user(0) #number of CL initially on custodial sentence
  Wccs17_ini[] <- user(0) #number of CL initially on custodial sentence

  Uicrf17_ini[] <- user(0) #number initially remanded to custody - none
  Uecrf17_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrf17_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uicrr17_ini[] <- user(0) #number initially remanded to custody - none
  Uecrr17_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Uccrr17_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these

  Wicrf17_ini[] <- user(0) #number of CL initially remanded to custody
  Wecrf17_ini[] <- user(0) #number of CL initially remanded to custody -
  Wccrf17_ini[] <- user(0) #number of CL initially remanded to custody -
  Wicrr17_ini[] <- user(0) #number initially remanded to custody - none
  Wecrr17_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these
  Wccrr17_ini[] <- user(0) #number initially remanded to custody - prevalence of remand is 9.5 so just split between these


  initial(Uin17[]) <- Uin17_ini[i] #the old equal split for gender doesnt work bc girls are less likely to be close???
  initial(Uen17[]) <- Uen17_ini[i]
  initial(Ucn17[]) <- Ucn17_ini[i]

  initial(Uis17[]) <- Uis17_ini[i]
  initial(Ues17[]) <- Ues17_ini[i]
  initial(Ucs17[]) <- Ucs17_ini[i]

  initial(Uinc17[]) <- Uinc17_ini[i]
  initial(Uenc17[]) <- Uenc17_ini[i]
  initial(Ucnc17[]) <- Ucnc17_ini[i]

  initial(Win17[]) <- Win17_ini[i]
  initial(Wen17[]) <- Wen17_ini[i]
  initial(Wcn17[]) <- Wcn17_ini[i]

  initial(Wis17[]) <- Wis17_ini[i]
  initial(Wes17[]) <- Wes17_ini[i]
  initial(Wcs17[]) <- Wcs17_ini[i]

  initial(Winc17[]) <- Winc17_ini[i]
  initial(Wenc17[]) <- Wenc17_ini[i]
  initial(Wcnc17[]) <- Wcnc17_ini[i]

  initial(Uics17[]) <- Uics17_ini[i]
  initial(Uecs17[]) <- Uecs17_ini[i]
  initial(Uccs17[]) <- Uccs17_ini[i]

  initial(Wics17[]) <- Wics17_ini[i]
  initial(Wecs17[]) <- Wecs17_ini[i]
  initial(Wccs17[]) <- Wccs17_ini[i]

  initial(Uicrf17[]) <- Uicrf17_ini[i]
  initial(Uecrf17[]) <- Uecrf17_ini[i]
  initial(Uccrf17[]) <- Uccrf17_ini[i]
  initial(Uicrr17[]) <- Uicrr17_ini[i]
  initial(Uecrr17[]) <- Uecrr17_ini[i]
  initial(Uccrr17[]) <- Uccrr17_ini[i]

  initial(Wicrf17[]) <- Wicrf17_ini[i]
  initial(Wecrf17[]) <- Wecrf17_ini[i]
  initial(Wccrf17[]) <- Wccrf17_ini[i]
  initial(Wicrr17[]) <- Wicrr17_ini[i]
  initial(Wecrr17[]) <- Wecrr17_ini[i]
  initial(Wccrr17[]) <- Wccrr17_ini[i]




  ##############################################################################################################################
  ## setting dimen sions for everything ####################################################################
  ##############################################################################################################################

  ##############################################################################################################################
  # for individual model states######################################################
  dim(Uin10) <- N_gender
  dim(Uen10) <- N_gender
  dim(Ucn10) <- N_gender

  dim(Uis10) <- N_gender
  dim(Ues10) <- N_gender
  dim(Ucs10) <- N_gender

  dim(Uinc10) <- N_gender
  dim(Uenc10) <- N_gender
  dim(Ucnc10) <- N_gender

  dim(Win10) <- N_gender
  dim(Wen10) <- N_gender
  dim(Wcn10) <- N_gender

  dim(Wis10) <- N_gender
  dim(Wes10) <- N_gender
  dim(Wcs10) <- N_gender

  dim(Winc10) <- N_gender
  dim(Wenc10) <- N_gender
  dim(Wcnc10) <- N_gender

  dim(Uics10) <- N_gender
  dim(Uecs10) <- N_gender
  dim(Uccs10) <- N_gender

  dim(Wics10) <- N_gender
  dim(Wecs10) <- N_gender
  dim(Wccs10) <- N_gender

  dim(Uicrf10) <- N_gender
  dim(Uecrf10) <- N_gender
  dim(Uccrf10) <- N_gender
  dim(Uicrr10) <- N_gender
  dim(Uecrr10) <- N_gender
  dim(Uccrr10) <- N_gender

  dim(Wicrf10) <- N_gender
  dim(Wecrf10) <- N_gender
  dim(Wccrf10) <- N_gender
  dim(Wicrr10) <- N_gender
  dim(Wecrr10) <- N_gender
  dim(Wccrr10) <- N_gender

  # for individual model states
  dim(Uin11) <- N_gender
  dim(Uen11) <- N_gender
  dim(Ucn11) <- N_gender

  dim(Uis11) <- N_gender
  dim(Ues11) <- N_gender
  dim(Ucs11) <- N_gender

  dim(Uinc11) <- N_gender
  dim(Uenc11) <- N_gender
  dim(Ucnc11) <- N_gender

  dim(Win11) <- N_gender
  dim(Wen11) <- N_gender
  dim(Wcn11) <- N_gender

  dim(Wis11) <- N_gender
  dim(Wes11) <- N_gender
  dim(Wcs11) <- N_gender

  dim(Winc11) <- N_gender
  dim(Wenc11) <- N_gender
  dim(Wcnc11) <- N_gender

  dim(Uics11) <- N_gender
  dim(Uecs11) <- N_gender
  dim(Uccs11) <- N_gender

  dim(Wics11) <- N_gender
  dim(Wecs11) <- N_gender
  dim(Wccs11) <- N_gender

  dim(Uicrf11) <- N_gender
  dim(Uecrf11) <- N_gender
  dim(Uccrf11) <- N_gender
  dim(Uicrr11) <- N_gender
  dim(Uecrr11) <- N_gender
  dim(Uccrr11) <- N_gender

  dim(Wicrf11) <- N_gender
  dim(Wecrf11) <- N_gender
  dim(Wccrf11) <- N_gender
  dim(Wicrr11) <- N_gender
  dim(Wecrr11) <- N_gender
  dim(Wccrr11) <- N_gender

  # for individual model states
  dim(Uin12) <- N_gender
  dim(Uen12) <- N_gender
  dim(Ucn12) <- N_gender

  dim(Uis12) <- N_gender
  dim(Ues12) <- N_gender
  dim(Ucs12) <- N_gender

  dim(Uinc12) <- N_gender
  dim(Uenc12) <- N_gender
  dim(Ucnc12) <- N_gender

  dim(Win12) <- N_gender
  dim(Wen12) <- N_gender
  dim(Wcn12) <- N_gender

  dim(Wis12) <- N_gender
  dim(Wes12) <- N_gender
  dim(Wcs12) <- N_gender

  dim(Winc12) <- N_gender
  dim(Wenc12) <- N_gender
  dim(Wcnc12) <- N_gender

  dim(Uics12) <- N_gender
  dim(Uecs12) <- N_gender
  dim(Uccs12) <- N_gender

  dim(Wics12) <- N_gender
  dim(Wecs12) <- N_gender
  dim(Wccs12) <- N_gender

  dim(Uicrf12) <- N_gender
  dim(Uecrf12) <- N_gender
  dim(Uccrf12) <- N_gender
  dim(Uicrr12) <- N_gender
  dim(Uecrr12) <- N_gender
  dim(Uccrr12) <- N_gender

  dim(Wicrf12) <- N_gender
  dim(Wecrf12) <- N_gender
  dim(Wccrf12) <- N_gender
  dim(Wicrr12) <- N_gender
  dim(Wecrr12) <- N_gender
  dim(Wccrr12) <- N_gender

  # for individual model states
  dim(Uin13) <- N_gender
  dim(Uen13) <- N_gender
  dim(Ucn13) <- N_gender

  dim(Uis13) <- N_gender
  dim(Ues13) <- N_gender
  dim(Ucs13) <- N_gender

  dim(Uinc13) <- N_gender
  dim(Uenc13) <- N_gender
  dim(Ucnc13) <- N_gender

  dim(Win13) <- N_gender
  dim(Wen13) <- N_gender
  dim(Wcn13) <- N_gender

  dim(Wis13) <- N_gender
  dim(Wes13) <- N_gender
  dim(Wcs13) <- N_gender

  dim(Winc13) <- N_gender
  dim(Wenc13) <- N_gender
  dim(Wcnc13) <- N_gender

  dim(Uics13) <- N_gender
  dim(Uecs13) <- N_gender
  dim(Uccs13) <- N_gender

  dim(Wics13) <- N_gender
  dim(Wecs13) <- N_gender
  dim(Wccs13) <- N_gender

  dim(Uicrf13) <- N_gender
  dim(Uecrf13) <- N_gender
  dim(Uccrf13) <- N_gender
  dim(Uicrr13) <- N_gender
  dim(Uecrr13) <- N_gender
  dim(Uccrr13) <- N_gender

  dim(Wicrf13) <- N_gender
  dim(Wecrf13) <- N_gender
  dim(Wccrf13) <- N_gender
  dim(Wicrr13) <- N_gender
  dim(Wecrr13) <- N_gender
  dim(Wccrr13) <- N_gender

  # for individual model states
  dim(Uin14) <- N_gender
  dim(Uen14) <- N_gender
  dim(Ucn14) <- N_gender

  dim(Uis14) <- N_gender
  dim(Ues14) <- N_gender
  dim(Ucs14) <- N_gender

  dim(Uinc14) <- N_gender
  dim(Uenc14) <- N_gender
  dim(Ucnc14) <- N_gender

  dim(Win14) <- N_gender
  dim(Wen14) <- N_gender
  dim(Wcn14) <- N_gender

  dim(Wis14) <- N_gender
  dim(Wes14) <- N_gender
  dim(Wcs14) <- N_gender

  dim(Winc14) <- N_gender
  dim(Wenc14) <- N_gender
  dim(Wcnc14) <- N_gender

  dim(Uics14) <- N_gender
  dim(Uecs14) <- N_gender
  dim(Uccs14) <- N_gender

  dim(Wics14) <- N_gender
  dim(Wecs14) <- N_gender
  dim(Wccs14) <- N_gender

  dim(Uicrf14) <- N_gender
  dim(Uecrf14) <- N_gender
  dim(Uccrf14) <- N_gender
  dim(Uicrr14) <- N_gender
  dim(Uecrr14) <- N_gender
  dim(Uccrr14) <- N_gender

  dim(Wicrf14) <- N_gender
  dim(Wecrf14) <- N_gender
  dim(Wccrf14) <- N_gender
  dim(Wicrr14) <- N_gender
  dim(Wecrr14) <- N_gender
  dim(Wccrr14) <- N_gender

  # for individual model states
  dim(Uin15) <- N_gender
  dim(Uen15) <- N_gender
  dim(Ucn15) <- N_gender

  dim(Uis15) <- N_gender
  dim(Ues15) <- N_gender
  dim(Ucs15) <- N_gender

  dim(Uinc15) <- N_gender
  dim(Uenc15) <- N_gender
  dim(Ucnc15) <- N_gender

  dim(Win15) <- N_gender
  dim(Wen15) <- N_gender
  dim(Wcn15) <- N_gender

  dim(Wis15) <- N_gender
  dim(Wes15) <- N_gender
  dim(Wcs15) <- N_gender

  dim(Winc15) <- N_gender
  dim(Wenc15) <- N_gender
  dim(Wcnc15) <- N_gender

  dim(Uics15) <- N_gender
  dim(Uecs15) <- N_gender
  dim(Uccs15) <- N_gender

  dim(Wics15) <- N_gender
  dim(Wecs15) <- N_gender
  dim(Wccs15) <- N_gender

  dim(Uicrf15) <- N_gender
  dim(Uecrf15) <- N_gender
  dim(Uccrf15) <- N_gender
  dim(Uicrr15) <- N_gender
  dim(Uecrr15) <- N_gender
  dim(Uccrr15) <- N_gender

  dim(Wicrf15) <- N_gender
  dim(Wecrf15) <- N_gender
  dim(Wccrf15) <- N_gender
  dim(Wicrr15) <- N_gender
  dim(Wecrr15) <- N_gender
  dim(Wccrr15) <- N_gender

  # for individual model states
  dim(Uin16) <- N_gender
  dim(Uen16) <- N_gender
  dim(Ucn16) <- N_gender

  dim(Uis16) <- N_gender
  dim(Ues16) <- N_gender
  dim(Ucs16) <- N_gender

  dim(Uinc16) <- N_gender
  dim(Uenc16) <- N_gender
  dim(Ucnc16) <- N_gender

  dim(Win16) <- N_gender
  dim(Wen16) <- N_gender
  dim(Wcn16) <- N_gender

  dim(Wis16) <- N_gender
  dim(Wes16) <- N_gender
  dim(Wcs16) <- N_gender

  dim(Winc16) <- N_gender
  dim(Wenc16) <- N_gender
  dim(Wcnc16) <- N_gender

  dim(Uics16) <- N_gender
  dim(Uecs16) <- N_gender
  dim(Uccs16) <- N_gender

  dim(Wics16) <- N_gender
  dim(Wecs16) <- N_gender
  dim(Wccs16) <- N_gender

  dim(Uicrf16) <- N_gender
  dim(Uecrf16) <- N_gender
  dim(Uccrf16) <- N_gender
  dim(Uicrr16) <- N_gender
  dim(Uecrr16) <- N_gender
  dim(Uccrr16) <- N_gender

  dim(Wicrf16) <- N_gender
  dim(Wecrf16) <- N_gender
  dim(Wccrf16) <- N_gender
  dim(Wicrr16) <- N_gender
  dim(Wecrr16) <- N_gender
  dim(Wccrr16) <- N_gender

  # for individual model states
  dim(Uin17) <- N_gender
  dim(Uen17) <- N_gender
  dim(Ucn17) <- N_gender

  dim(Uis17) <- N_gender
  dim(Ues17) <- N_gender
  dim(Ucs17) <- N_gender

  dim(Uinc17) <- N_gender
  dim(Uenc17) <- N_gender
  dim(Ucnc17) <- N_gender

  dim(Win17) <- N_gender
  dim(Wen17) <- N_gender
  dim(Wcn17) <- N_gender

  dim(Wis17) <- N_gender
  dim(Wes17) <- N_gender
  dim(Wcs17) <- N_gender

  dim(Winc17) <- N_gender
  dim(Wenc17) <- N_gender
  dim(Wcnc17) <- N_gender

  dim(Uics17) <- N_gender
  dim(Uecs17) <- N_gender
  dim(Uccs17) <- N_gender

  dim(Wics17) <- N_gender
  dim(Wecs17) <- N_gender
  dim(Wccs17) <- N_gender

  dim(Uicrf17) <- N_gender
  dim(Uecrf17) <- N_gender
  dim(Uccrf17) <- N_gender
  dim(Uicrr17) <- N_gender
  dim(Uecrr17) <- N_gender
  dim(Uccrr17) <- N_gender

  dim(Wicrf17) <- N_gender
  dim(Wecrf17) <- N_gender
  dim(Wccrf17) <- N_gender
  dim(Wicrr17) <- N_gender
  dim(Wecrr17) <- N_gender
  dim(Wccrr17) <- N_gender


  # for initial conditions######################################################
  ##############################################################################################################################

  dim(Uin10_ini) <- N_gender
  dim(Uen10_ini) <- N_gender
  dim(Ucn10_ini) <- N_gender

  dim(Uis10_ini) <- N_gender
  dim(Ues10_ini) <- N_gender
  dim(Ucs10_ini) <- N_gender

  dim(Uinc10_ini) <- N_gender
  dim(Uenc10_ini) <- N_gender
  dim(Ucnc10_ini) <- N_gender

  dim(Win10_ini) <- N_gender
  dim(Wen10_ini) <- N_gender
  dim(Wcn10_ini) <- N_gender

  dim(Wis10_ini) <- N_gender
  dim(Wes10_ini) <- N_gender
  dim(Wcs10_ini) <- N_gender

  dim(Winc10_ini) <- N_gender
  dim(Wenc10_ini) <- N_gender
  dim(Wcnc10_ini) <- N_gender

  dim(Uics10_ini) <- N_gender
  dim(Uecs10_ini) <- N_gender
  dim(Uccs10_ini) <- N_gender

  dim(Wics10_ini) <- N_gender
  dim(Wecs10_ini) <- N_gender
  dim(Wccs10_ini) <- N_gender

  dim(Uicrf10_ini) <- N_gender
  dim(Uecrf10_ini) <- N_gender
  dim(Uccrf10_ini) <- N_gender
  dim(Uicrr10_ini) <- N_gender
  dim(Uecrr10_ini) <- N_gender
  dim(Uccrr10_ini) <- N_gender

  dim(Wicrf10_ini) <- N_gender
  dim(Wecrf10_ini) <- N_gender
  dim(Wccrf10_ini) <- N_gender
  dim(Wicrr10_ini) <- N_gender
  dim(Wecrr10_ini) <- N_gender
  dim(Wccrr10_ini) <- N_gender

  # for individual model states
  dim(Uin11_ini) <- N_gender
  dim(Uen11_ini) <- N_gender
  dim(Ucn11_ini) <- N_gender

  dim(Uis11_ini) <- N_gender
  dim(Ues11_ini) <- N_gender
  dim(Ucs11_ini) <- N_gender

  dim(Uinc11_ini) <- N_gender
  dim(Uenc11_ini) <- N_gender
  dim(Ucnc11_ini) <- N_gender

  dim(Win11_ini) <- N_gender
  dim(Wen11_ini) <- N_gender
  dim(Wcn11_ini) <- N_gender

  dim(Wis11_ini) <- N_gender
  dim(Wes11_ini) <- N_gender
  dim(Wcs11_ini) <- N_gender

  dim(Winc11_ini) <- N_gender
  dim(Wenc11_ini) <- N_gender
  dim(Wcnc11_ini) <- N_gender

  dim(Uics11_ini) <- N_gender
  dim(Uecs11_ini) <- N_gender
  dim(Uccs11_ini) <- N_gender

  dim(Wics11_ini) <- N_gender
  dim(Wecs11_ini) <- N_gender
  dim(Wccs11_ini) <- N_gender

  dim(Uicrf11_ini) <- N_gender
  dim(Uecrf11_ini) <- N_gender
  dim(Uccrf11_ini) <- N_gender
  dim(Uicrr11_ini) <- N_gender
  dim(Uecrr11_ini) <- N_gender
  dim(Uccrr11_ini) <- N_gender

  dim(Wicrf11_ini) <- N_gender
  dim(Wecrf11_ini) <- N_gender
  dim(Wccrf11_ini) <- N_gender
  dim(Wicrr11_ini) <- N_gender
  dim(Wecrr11_ini) <- N_gender
  dim(Wccrr11_ini) <- N_gender

  # for individual model states
  dim(Uin12_ini) <- N_gender
  dim(Uen12_ini) <- N_gender
  dim(Ucn12_ini) <- N_gender

  dim(Uis12_ini) <- N_gender
  dim(Ues12_ini) <- N_gender
  dim(Ucs12_ini) <- N_gender

  dim(Uinc12_ini) <- N_gender
  dim(Uenc12_ini) <- N_gender
  dim(Ucnc12_ini) <- N_gender

  dim(Win12_ini) <- N_gender
  dim(Wen12_ini) <- N_gender
  dim(Wcn12_ini) <- N_gender

  dim(Wis12_ini) <- N_gender
  dim(Wes12_ini) <- N_gender
  dim(Wcs12_ini) <- N_gender

  dim(Winc12_ini) <- N_gender
  dim(Wenc12_ini) <- N_gender
  dim(Wcnc12_ini) <- N_gender

  dim(Uics12_ini) <- N_gender
  dim(Uecs12_ini) <- N_gender
  dim(Uccs12_ini) <- N_gender

  dim(Wics12_ini) <- N_gender
  dim(Wecs12_ini) <- N_gender
  dim(Wccs12_ini) <- N_gender

  dim(Uicrf12_ini) <- N_gender
  dim(Uecrf12_ini) <- N_gender
  dim(Uccrf12_ini) <- N_gender
  dim(Uicrr12_ini) <- N_gender
  dim(Uecrr12_ini) <- N_gender
  dim(Uccrr12_ini) <- N_gender

  dim(Wicrf12_ini) <- N_gender
  dim(Wecrf12_ini) <- N_gender
  dim(Wccrf12_ini) <- N_gender
  dim(Wicrr12_ini) <- N_gender
  dim(Wecrr12_ini) <- N_gender
  dim(Wccrr12_ini) <- N_gender

  # for individual model states
  dim(Uin13_ini) <- N_gender
  dim(Uen13_ini) <- N_gender
  dim(Ucn13_ini) <- N_gender

  dim(Uis13_ini) <- N_gender
  dim(Ues13_ini) <- N_gender
  dim(Ucs13_ini) <- N_gender

  dim(Uinc13_ini) <- N_gender
  dim(Uenc13_ini) <- N_gender
  dim(Ucnc13_ini) <- N_gender

  dim(Win13_ini) <- N_gender
  dim(Wen13_ini) <- N_gender
  dim(Wcn13_ini) <- N_gender

  dim(Wis13_ini) <- N_gender
  dim(Wes13_ini) <- N_gender
  dim(Wcs13_ini) <- N_gender

  dim(Winc13_ini) <- N_gender
  dim(Wenc13_ini) <- N_gender
  dim(Wcnc13_ini) <- N_gender

  dim(Uics13_ini) <- N_gender
  dim(Uecs13_ini) <- N_gender
  dim(Uccs13_ini) <- N_gender

  dim(Wics13_ini) <- N_gender
  dim(Wecs13_ini) <- N_gender
  dim(Wccs13_ini) <- N_gender

  dim(Uicrf13_ini) <- N_gender
  dim(Uecrf13_ini) <- N_gender
  dim(Uccrf13_ini) <- N_gender
  dim(Uicrr13_ini) <- N_gender
  dim(Uecrr13_ini) <- N_gender
  dim(Uccrr13_ini) <- N_gender

  dim(Wicrf13_ini) <- N_gender
  dim(Wecrf13_ini) <- N_gender
  dim(Wccrf13_ini) <- N_gender
  dim(Wicrr13_ini) <- N_gender
  dim(Wecrr13_ini) <- N_gender
  dim(Wccrr13_ini) <- N_gender

  # for individual model states
  dim(Uin14_ini) <- N_gender
  dim(Uen14_ini) <- N_gender
  dim(Ucn14_ini) <- N_gender

  dim(Uis14_ini) <- N_gender
  dim(Ues14_ini) <- N_gender
  dim(Ucs14_ini) <- N_gender

  dim(Uinc14_ini) <- N_gender
  dim(Uenc14_ini) <- N_gender
  dim(Ucnc14_ini) <- N_gender

  dim(Win14_ini) <- N_gender
  dim(Wen14_ini) <- N_gender
  dim(Wcn14_ini) <- N_gender

  dim(Wis14_ini) <- N_gender
  dim(Wes14_ini) <- N_gender
  dim(Wcs14_ini) <- N_gender

  dim(Winc14_ini) <- N_gender
  dim(Wenc14_ini) <- N_gender
  dim(Wcnc14_ini) <- N_gender

  dim(Uics14_ini) <- N_gender
  dim(Uecs14_ini) <- N_gender
  dim(Uccs14_ini) <- N_gender

  dim(Wics14_ini) <- N_gender
  dim(Wecs14_ini) <- N_gender
  dim(Wccs14_ini) <- N_gender

  dim(Uicrf14_ini) <- N_gender
  dim(Uecrf14_ini) <- N_gender
  dim(Uccrf14_ini) <- N_gender
  dim(Uicrr14_ini) <- N_gender
  dim(Uecrr14_ini) <- N_gender
  dim(Uccrr14_ini) <- N_gender

  dim(Wicrf14_ini) <- N_gender
  dim(Wecrf14_ini) <- N_gender
  dim(Wccrf14_ini) <- N_gender
  dim(Wicrr14_ini) <- N_gender
  dim(Wecrr14_ini) <- N_gender
  dim(Wccrr14_ini) <- N_gender

  # for individual model states
  dim(Uin15_ini) <- N_gender
  dim(Uen15_ini) <- N_gender
  dim(Ucn15_ini) <- N_gender

  dim(Uis15_ini) <- N_gender
  dim(Ues15_ini) <- N_gender
  dim(Ucs15_ini) <- N_gender

  dim(Uinc15_ini) <- N_gender
  dim(Uenc15_ini) <- N_gender
  dim(Ucnc15_ini) <- N_gender

  dim(Win15_ini) <- N_gender
  dim(Wen15_ini) <- N_gender
  dim(Wcn15_ini) <- N_gender

  dim(Wis15_ini) <- N_gender
  dim(Wes15_ini) <- N_gender
  dim(Wcs15_ini) <- N_gender

  dim(Winc15_ini) <- N_gender
  dim(Wenc15_ini) <- N_gender
  dim(Wcnc15_ini) <- N_gender

  dim(Uics15_ini) <- N_gender
  dim(Uecs15_ini) <- N_gender
  dim(Uccs15_ini) <- N_gender

  dim(Wics15_ini) <- N_gender
  dim(Wecs15_ini) <- N_gender
  dim(Wccs15_ini) <- N_gender

  dim(Uicrf15_ini) <- N_gender
  dim(Uecrf15_ini) <- N_gender
  dim(Uccrf15_ini) <- N_gender
  dim(Uicrr15_ini) <- N_gender
  dim(Uecrr15_ini) <- N_gender
  dim(Uccrr15_ini) <- N_gender

  dim(Wicrf15_ini) <- N_gender
  dim(Wecrf15_ini) <- N_gender
  dim(Wccrf15_ini) <- N_gender
  dim(Wicrr15_ini) <- N_gender
  dim(Wecrr15_ini) <- N_gender
  dim(Wccrr15_ini) <- N_gender

  # for individual model states
  dim(Uin16_ini) <- N_gender
  dim(Uen16_ini) <- N_gender
  dim(Ucn16_ini) <- N_gender

  dim(Uis16_ini) <- N_gender
  dim(Ues16_ini) <- N_gender
  dim(Ucs16_ini) <- N_gender

  dim(Uinc16_ini) <- N_gender
  dim(Uenc16_ini) <- N_gender
  dim(Ucnc16_ini) <- N_gender

  dim(Win16_ini) <- N_gender
  dim(Wen16_ini) <- N_gender
  dim(Wcn16_ini) <- N_gender

  dim(Wis16_ini) <- N_gender
  dim(Wes16_ini) <- N_gender
  dim(Wcs16_ini) <- N_gender

  dim(Winc16_ini) <- N_gender
  dim(Wenc16_ini) <- N_gender
  dim(Wcnc16_ini) <- N_gender

  dim(Uics16_ini) <- N_gender
  dim(Uecs16_ini) <- N_gender
  dim(Uccs16_ini) <- N_gender

  dim(Wics16_ini) <- N_gender
  dim(Wecs16_ini) <- N_gender
  dim(Wccs16_ini) <- N_gender

  dim(Uicrf16_ini) <- N_gender
  dim(Uecrf16_ini) <- N_gender
  dim(Uccrf16_ini) <- N_gender
  dim(Uicrr16_ini) <- N_gender
  dim(Uecrr16_ini) <- N_gender
  dim(Uccrr16_ini) <- N_gender

  dim(Wicrf16_ini) <- N_gender
  dim(Wecrf16_ini) <- N_gender
  dim(Wccrf16_ini) <- N_gender
  dim(Wicrr16_ini) <- N_gender
  dim(Wecrr16_ini) <- N_gender
  dim(Wccrr16_ini) <- N_gender

  # for individual model states
  dim(Uin17_ini) <- N_gender
  dim(Uen17_ini) <- N_gender
  dim(Ucn17_ini) <- N_gender

  dim(Uis17_ini) <- N_gender
  dim(Ues17_ini) <- N_gender
  dim(Ucs17_ini) <- N_gender

  dim(Uinc17_ini) <- N_gender
  dim(Uenc17_ini) <- N_gender
  dim(Ucnc17_ini) <- N_gender

  dim(Win17_ini) <- N_gender
  dim(Wen17_ini) <- N_gender
  dim(Wcn17_ini) <- N_gender

  dim(Wis17_ini) <- N_gender
  dim(Wes17_ini) <- N_gender
  dim(Wcs17_ini) <- N_gender

  dim(Winc17_ini) <- N_gender
  dim(Wenc17_ini) <- N_gender
  dim(Wcnc17_ini) <- N_gender

  dim(Uics17_ini) <- N_gender
  dim(Uecs17_ini) <- N_gender
  dim(Uccs17_ini) <- N_gender

  dim(Wics17_ini) <- N_gender
  dim(Wecs17_ini) <- N_gender
  dim(Wccs17_ini) <- N_gender

  dim(Uicrf17_ini) <- N_gender
  dim(Uecrf17_ini) <- N_gender
  dim(Uccrf17_ini) <- N_gender
  dim(Uicrr17_ini) <- N_gender
  dim(Uecrr17_ini) <- N_gender
  dim(Uccrr17_ini) <- N_gender

  dim(Wicrf17_ini) <- N_gender
  dim(Wecrf17_ini) <- N_gender
  dim(Wccrf17_ini) <- N_gender
  dim(Wicrr17_ini) <- N_gender
  dim(Wecrr17_ini) <- N_gender
  dim(Wccrr17_ini) <- N_gender





  # groups of model states #############################################
  ##############################################################################################################################

  # total population
  dim(N) <- N_gender


# grouped into class states, and by age
  dim(I10) <- N_gender
  dim(I11) <- N_gender
  dim(I12) <- N_gender
  dim(I13) <- N_gender
  dim(I14) <- N_gender
  dim(I15) <- N_gender
  dim(I16) <- N_gender
  dim(I17) <- N_gender


  dim(E10) <- N_gender
  dim(E11) <- N_gender
  dim(E12) <- N_gender
  dim(E13) <- N_gender
  dim(E14) <- N_gender
  dim(E15) <- N_gender
  dim(E16) <- N_gender
  dim(E17) <- N_gender


  dim(C10) <- N_gender
  dim(C11) <- N_gender
  dim(C12) <- N_gender
  dim(C13) <- N_gender
  dim(C14) <- N_gender
  dim(C15) <- N_gender
  dim(C16) <- N_gender
  dim(C17) <- N_gender


  #groups of states for mixing, tracking incarceration, etc
  # in the community, uninvolved in county lines
  ####age and class################
  dim(UCOMi10) <- N_gender
  dim(UCOMe10) <- N_gender
  dim(UCOMc10) <- N_gender

  dim(UCOMi11) <- N_gender
  dim(UCOMe11) <- N_gender
  dim(UCOMc11) <- N_gender

  dim(UCOMi12) <- N_gender
  dim(UCOMe12) <- N_gender
  dim(UCOMc12) <- N_gender

  dim(UCOMi13) <- N_gender
  dim(UCOMe13) <- N_gender
  dim(UCOMc13) <- N_gender

  dim(UCOMi14) <- N_gender
  dim(UCOMe14) <- N_gender
  dim(UCOMc14) <- N_gender

  dim(UCOMi15) <- N_gender
  dim(UCOMe15) <- N_gender
  dim(UCOMc15) <- N_gender

  dim(UCOMi16) <- N_gender
  dim(UCOMe16) <- N_gender
  dim(UCOMc16) <- N_gender

  dim(UCOMi17) <- N_gender
  dim(UCOMe17) <- N_gender
  dim(UCOMc17) <- N_gender


# in the community, working for the county lines
  ####age and class################
  dim(WCOMi10) <- N_gender
  dim(WCOMe10) <- N_gender
  dim(WCOMc10) <- N_gender

  dim(WCOMi11) <- N_gender
  dim(WCOMe11) <- N_gender
  dim(WCOMc11) <- N_gender

  dim(WCOMi12) <- N_gender
  dim(WCOMe12) <- N_gender
  dim(WCOMc12) <- N_gender

  dim(WCOMi13) <- N_gender
  dim(WCOMe13) <- N_gender
  dim(WCOMc13) <- N_gender

  dim(WCOMi14) <- N_gender
  dim(WCOMe14) <- N_gender
  dim(WCOMc14) <- N_gender

  dim(WCOMi15) <- N_gender
  dim(WCOMe15) <- N_gender
  dim(WCOMc15) <- N_gender

  dim(WCOMi16) <- N_gender
  dim(WCOMe16) <- N_gender
  dim(WCOMc16) <- N_gender

  dim(WCOMi17) <- N_gender
  dim(WCOMe17) <- N_gender
  dim(WCOMc17) <- N_gender



 # in the community, surveilled by police
  #####age and class###############
  dim(SCOMi10) <- N_gender
  dim(SCOMe10) <- N_gender
  dim(SCOMc10) <- N_gender

  dim(SCOMi11) <- N_gender
  dim(SCOMe11) <- N_gender
  dim(SCOMc11) <- N_gender

  dim(SCOMi12) <- N_gender
  dim(SCOMe12) <- N_gender
  dim(SCOMc12) <- N_gender

  dim(SCOMi13) <- N_gender
  dim(SCOMe13) <- N_gender
  dim(SCOMc13) <- N_gender

  dim(SCOMi14) <- N_gender
  dim(SCOMe14) <- N_gender
  dim(SCOMc14) <- N_gender

  dim(SCOMi15) <- N_gender
  dim(SCOMe15) <- N_gender
  dim(SCOMc15) <- N_gender

  dim(SCOMi16) <- N_gender
  dim(SCOMe16) <- N_gender
  dim(SCOMc16) <- N_gender

  dim(SCOMi17) <- N_gender
  dim(SCOMe17) <- N_gender
  dim(SCOMc17) <- N_gender



 # total in the community
  ########class and age############
  dim(COMi10) <- N_gender
  dim(COMe10) <- N_gender
  dim(COMc10) <- N_gender

  dim(COMi11) <- N_gender
  dim(COMe11) <- N_gender
  dim(COMc11) <- N_gender

  dim(COMi12) <- N_gender
  dim(COMe12) <- N_gender
  dim(COMc12) <- N_gender

  dim(COMi13) <- N_gender
  dim(COMe13) <- N_gender
  dim(COMc13) <- N_gender

  dim(COMi14) <- N_gender
  dim(COMe14) <- N_gender
  dim(COMc14) <- N_gender

  dim(COMi15) <- N_gender
  dim(COMe15) <- N_gender
  dim(COMc15) <- N_gender

  dim(COMi16) <- N_gender
  dim(COMe16) <- N_gender
  dim(COMc16) <- N_gender

  dim(COMi17) <- N_gender
  dim(COMe17) <- N_gender
  dim(COMc17) <- N_gender

  #####total###############
  dim(WCUST) <- N_gender # county lines working in custody


  #####total###############
  dim(CUST) <- N_gender # total in custody


  # uninvolved in custody by age, calss
  dim(UCUSTi10) <- N_gender
  dim(UCUSTe10) <- N_gender
  dim(UCUSTc10) <- N_gender
  dim(UCUSTi11) <- N_gender
  dim(UCUSTe11) <- N_gender
  dim(UCUSTc11) <- N_gender
  dim(UCUSTi12) <- N_gender
  dim(UCUSTe12) <- N_gender
  dim(UCUSTc12) <- N_gender
  dim(UCUSTi13) <- N_gender
  dim(UCUSTe13) <- N_gender
  dim(UCUSTc13) <- N_gender
  dim(UCUSTi14) <- N_gender
  dim(UCUSTe14) <- N_gender
  dim(UCUSTc14) <- N_gender
  dim(UCUSTi15) <- N_gender
  dim(UCUSTe15) <- N_gender
  dim(UCUSTc15) <- N_gender
  dim(UCUSTi16) <- N_gender
  dim(UCUSTe16) <- N_gender
  dim(UCUSTc16) <- N_gender
  dim(UCUSTi17) <- N_gender
  dim(UCUSTe17) <- N_gender
  dim(UCUSTc17) <- N_gender



  #####both remand together##############
  dim(Uicr10) <- N_gender
  dim(Uecr10) <- N_gender
  dim(Uccr10) <- N_gender
  dim(Uicr11) <- N_gender
  dim(Uecr11) <- N_gender
  dim(Uccr11) <- N_gender
  dim(Uicr12) <- N_gender
  dim(Uecr12) <- N_gender
  dim(Uccr12) <- N_gender
  dim(Uicr13) <- N_gender
  dim(Uecr13) <- N_gender
  dim(Uccr13) <- N_gender
  dim(Uicr14) <- N_gender
  dim(Uecr14) <- N_gender
  dim(Uccr14) <- N_gender
  dim(Uicr15) <- N_gender
  dim(Uecr15) <- N_gender
  dim(Uccr15) <- N_gender
  dim(Uicr16) <- N_gender
  dim(Uecr16) <- N_gender
  dim(Uccr16) <- N_gender
  dim(Uicr17) <- N_gender
  dim(Uecr17) <- N_gender
  dim(Uccr17) <- N_gender

  dim(Wicr10) <- N_gender
  dim(Wecr10) <- N_gender
  dim(Wccr10) <- N_gender
  dim(Wicr11) <- N_gender
  dim(Wecr11) <- N_gender
  dim(Wccr11) <- N_gender
  dim(Wicr12) <- N_gender
  dim(Wecr12) <- N_gender
  dim(Wccr12) <- N_gender
  dim(Wicr13) <- N_gender
  dim(Wecr13) <- N_gender
  dim(Wccr13) <- N_gender
  dim(Wicr14) <- N_gender
  dim(Wecr14) <- N_gender
  dim(Wccr14) <- N_gender
  dim(Wicr15) <- N_gender
  dim(Wecr15) <- N_gender
  dim(Wccr15) <- N_gender
  dim(Wicr16) <- N_gender
  dim(Wecr16) <- N_gender
  dim(Wccr16) <- N_gender
  dim(Wicr17) <- N_gender
  dim(Wecr17) <- N_gender
  dim(Wccr17) <- N_gender







  # for PARAMETERS  ################################################################
  ##############################################################################################################################
  # dim(turn10) <- N_gender

  dim(pc_incl) <- N_gender
  dim(pc_excl) <- N_gender
  dim(pc_close) <- N_gender

#   dim(impov) <- N_gender
#   dim(close_i) <- N_gender #rates of moving to close
#   dim(close_e) <- N_gender #rates of moving to close

  dim(np2rem_i10) <- N_gender
  dim(np2rem_e10) <- N_gender
  dim(np2rem_c10) <- N_gender
  dim(np2rem_i11) <- N_gender
  dim(np2rem_e11) <- N_gender
  dim(np2rem_c11) <- N_gender
  dim(np2rem_i12) <- N_gender
  dim(np2rem_e12) <- N_gender
  dim(np2rem_c12) <- N_gender
  dim(np2rem_i13) <- N_gender
  dim(np2rem_e13) <- N_gender
  dim(np2rem_c13) <- N_gender
  dim(np2rem_i14) <- N_gender
  dim(np2rem_e14) <- N_gender
  dim(np2rem_c14) <- N_gender
  dim(np2rem_i15) <- N_gender
  dim(np2rem_e15) <- N_gender
  dim(np2rem_c15) <- N_gender
  dim(np2rem_i16) <- N_gender
  dim(np2rem_e16) <- N_gender
  dim(np2rem_c16) <- N_gender
  dim(np2rem_i17) <- N_gender
  dim(np2rem_e17) <- N_gender
  dim(np2rem_c17) <- N_gender

  # dim(np2nc_i10) <- N_gender
  # dim(np2nc_e10) <- N_gender
  # dim(np2nc_c10) <- N_gender
  # dim(np2nc_i11) <- N_gender
  # dim(np2nc_e11) <- N_gender
  # dim(np2nc_c11) <- N_gender
  # dim(np2nc_i12) <- N_gender
  # dim(np2nc_e12) <- N_gender
  # dim(np2nc_c12) <- N_gender
  # dim(np2nc_i13) <- N_gender
  # dim(np2nc_e13) <- N_gender
  # dim(np2nc_c13) <- N_gender
  # dim(np2nc_i14) <- N_gender
  # dim(np2nc_e14) <- N_gender
  # dim(np2nc_c14) <- N_gender
  # dim(np2nc_i15) <- N_gender
  # dim(np2nc_e15) <- N_gender
  # dim(np2nc_c15) <- N_gender
  # dim(np2nc_i16) <- N_gender
  # dim(np2nc_e16) <- N_gender
  # dim(np2nc_c16) <- N_gender
  # dim(np2nc_i17) <- N_gender
  # dim(np2nc_e17) <- N_gender
  # dim(np2nc_c17) <- N_gender
  #
  # dim(np2cust_i10) <- N_gender
  # dim(np2cust_e10) <- N_gender
  # dim(np2cust_c10) <- N_gender
  # dim(np2cust_i11) <- N_gender
  # dim(np2cust_e11) <- N_gender
  # dim(np2cust_c11) <- N_gender
  # dim(np2cust_i12) <- N_gender
  # dim(np2cust_e12) <- N_gender
  # dim(np2cust_c12) <- N_gender
  # dim(np2cust_i13) <- N_gender
  # dim(np2cust_e13) <- N_gender
  # dim(np2cust_c13) <- N_gender
  # dim(np2cust_i14) <- N_gender
  # dim(np2cust_e14) <- N_gender
  # dim(np2cust_c14) <- N_gender
  # dim(np2cust_i15) <- N_gender
  # dim(np2cust_e15) <- N_gender
  # dim(np2cust_c15) <- N_gender
  # dim(np2cust_i16) <- N_gender
  # dim(np2cust_e16) <- N_gender
  # dim(np2cust_c16) <- N_gender
  # dim(np2cust_i17) <- N_gender
  # dim(np2cust_e17) <- N_gender
  # dim(np2cust_c17) <- N_gender


  ######### yes priors to remand, nc, custodial states############################
  dim(prior2rem_i10) <- N_gender
  dim(prior2rem_e10) <- N_gender
  dim(prior2rem_c10) <- N_gender
  dim(prior2rem_i11) <- N_gender
  dim(prior2rem_e11) <- N_gender
  dim(prior2rem_c11) <- N_gender
  dim(prior2rem_i12) <- N_gender
  dim(prior2rem_e12) <- N_gender
  dim(prior2rem_c12) <- N_gender
  dim(prior2rem_i13) <- N_gender
  dim(prior2rem_e13) <- N_gender
  dim(prior2rem_c13) <- N_gender
  dim(prior2rem_i14) <- N_gender
  dim(prior2rem_e14) <- N_gender
  dim(prior2rem_c14) <- N_gender
  dim(prior2rem_i15) <- N_gender
  dim(prior2rem_e15) <- N_gender
  dim(prior2rem_c15) <- N_gender
  dim(prior2rem_i16) <- N_gender
  dim(prior2rem_e16) <- N_gender
  dim(prior2rem_c16) <- N_gender
  dim(prior2rem_i17) <- N_gender
  dim(prior2rem_e17) <- N_gender
  dim(prior2rem_c17) <- N_gender

  dim(prior2nc_i10) <- N_gender
  dim(prior2nc_e10) <- N_gender
  dim(prior2nc_c10) <- N_gender
  dim(prior2nc_i11) <- N_gender
  dim(prior2nc_e11) <- N_gender
  dim(prior2nc_c11) <- N_gender
  dim(prior2nc_i12) <- N_gender
  dim(prior2nc_e12) <- N_gender
  dim(prior2nc_c12) <- N_gender
  dim(prior2nc_i13) <- N_gender
  dim(prior2nc_e13) <- N_gender
  dim(prior2nc_c13) <- N_gender
  dim(prior2nc_i14) <- N_gender
  dim(prior2nc_e14) <- N_gender
  dim(prior2nc_c14) <- N_gender
  dim(prior2nc_i15) <- N_gender
  dim(prior2nc_e15) <- N_gender
  dim(prior2nc_c15) <- N_gender
  dim(prior2nc_i16) <- N_gender
  dim(prior2nc_e16) <- N_gender
  dim(prior2nc_c16) <- N_gender
  dim(prior2nc_i17) <- N_gender
  dim(prior2nc_e17) <- N_gender
  dim(prior2nc_c17) <- N_gender

  dim(prior2cust_i10) <- N_gender
  dim(prior2cust_e10) <- N_gender
  dim(prior2cust_c10) <- N_gender
  dim(prior2cust_i11) <- N_gender
  dim(prior2cust_e11) <- N_gender
  dim(prior2cust_c11) <- N_gender
  dim(prior2cust_i12) <- N_gender
  dim(prior2cust_e12) <- N_gender
  dim(prior2cust_c12) <- N_gender
  dim(prior2cust_i13) <- N_gender
  dim(prior2cust_e13) <- N_gender
  dim(prior2cust_c13) <- N_gender
  dim(prior2cust_i14) <- N_gender
  dim(prior2cust_e14) <- N_gender
  dim(prior2cust_c14) <- N_gender
  dim(prior2cust_i15) <- N_gender
  dim(prior2cust_e15) <- N_gender
  dim(prior2cust_c15) <- N_gender
  dim(prior2cust_i16) <- N_gender
  dim(prior2cust_e16) <- N_gender
  dim(prior2cust_c16) <- N_gender
  dim(prior2cust_i17) <- N_gender
  dim(prior2cust_e17) <- N_gender
  dim(prior2cust_c17) <- N_gender

  dim(np2csj_i10) <- N_gender
  dim(np2csj_e10) <- N_gender
  dim(np2csj_c10) <- N_gender
  dim(np2csj_i11) <- N_gender
  dim(np2csj_e11) <- N_gender
  dim(np2csj_c11) <- N_gender
  dim(np2csj_i12) <- N_gender
  dim(np2csj_e12) <- N_gender
  dim(np2csj_c12) <- N_gender
  dim(np2csj_i13) <- N_gender
  dim(np2csj_e13) <- N_gender
  dim(np2csj_c13) <- N_gender
  dim(np2csj_i14) <- N_gender
  dim(np2csj_e14) <- N_gender
  dim(np2csj_c14) <- N_gender
  dim(np2csj_i15) <- N_gender
  dim(np2csj_e15) <- N_gender
  dim(np2csj_c15) <- N_gender
  dim(np2csj_i16) <- N_gender
  dim(np2csj_e16) <- N_gender
  dim(np2csj_c16) <- N_gender
  dim(np2csj_i17) <- N_gender
  dim(np2csj_e17) <- N_gender
  dim(np2csj_c17) <- N_gender






  dim(recruit_i) <-N_gender
  dim(recruit_e) <-N_gender
  dim(recruit_c) <-N_gender
  dim(recruit_cust) <-N_gender

  dim(associate_i) <-N_gender
  dim(associate_e) <-N_gender
  dim(associate_c) <-N_gender



  dim(arrest_uin10) <- N_gender
  dim(arrest_uen10) <- N_gender
  dim(arrest_ucn10) <- N_gender
  dim(arrest_win10) <- N_gender
  dim(arrest_wen10) <- N_gender
  dim(arrest_wcn10) <- N_gender

  dim(arrest_uin11) <- N_gender
  dim(arrest_uen11) <- N_gender
  dim(arrest_ucn11) <- N_gender
  dim(arrest_win11) <- N_gender
  dim(arrest_wen11) <- N_gender
  dim(arrest_wcn11) <- N_gender

  dim(arrest_uin12) <- N_gender
  dim(arrest_uen12) <- N_gender
  dim(arrest_ucn12) <- N_gender
  dim(arrest_win12) <- N_gender
  dim(arrest_wen12) <- N_gender
  dim(arrest_wcn12) <- N_gender

  dim(arrest_uin13) <- N_gender
  dim(arrest_uen13) <- N_gender
  dim(arrest_ucn13) <- N_gender
  dim(arrest_win13) <- N_gender
  dim(arrest_wen13) <- N_gender
  dim(arrest_wcn13) <- N_gender

  dim(arrest_uin14) <- N_gender
  dim(arrest_uen14) <- N_gender
  dim(arrest_ucn14) <- N_gender
  dim(arrest_win14) <- N_gender
  dim(arrest_wen14) <- N_gender
  dim(arrest_wcn14) <- N_gender

  dim(arrest_uin15) <- N_gender
  dim(arrest_uen15) <- N_gender
  dim(arrest_ucn15) <- N_gender
  dim(arrest_win15) <- N_gender
  dim(arrest_wen15) <- N_gender
  dim(arrest_wcn15) <- N_gender

  dim(arrest_uin16) <- N_gender
  dim(arrest_uen16) <- N_gender
  dim(arrest_ucn16) <- N_gender
  dim(arrest_win16) <- N_gender
  dim(arrest_wen16) <- N_gender
  dim(arrest_wcn16) <- N_gender

  dim(arrest_uin17) <- N_gender
  dim(arrest_uen17) <- N_gender
  dim(arrest_ucn17) <- N_gender
  dim(arrest_win17) <- N_gender
  dim(arrest_wen17) <- N_gender
  dim(arrest_wcn17) <- N_gender

  # dim(ss_uin10) <- N_gender
  # dim(ss_uen10) <- N_gender
  # dim(ss_ucn10) <- N_gender
  # dim(ss_win10) <- N_gender
  # dim(ss_wen10) <- N_gender
  # dim(ss_wcn10) <- N_gender
  #
  # dim(ss_uin11) <- N_gender
  # dim(ss_uen11) <- N_gender
  # dim(ss_ucn11) <- N_gender
  # dim(ss_win11) <- N_gender
  # dim(ss_wen11) <- N_gender
  # dim(ss_wcn11) <- N_gender
  #
  # dim(ss_uin12) <- N_gender
  # dim(ss_uen12) <- N_gender
  # dim(ss_ucn12) <- N_gender
  # dim(ss_win12) <- N_gender
  # dim(ss_wen12) <- N_gender
  # dim(ss_wcn12) <- N_gender
  #
  # dim(ss_uin13) <- N_gender
  # dim(ss_uen13) <- N_gender
  # dim(ss_ucn13) <- N_gender
  # dim(ss_win13) <- N_gender
  # dim(ss_wen13) <- N_gender
  # dim(ss_wcn13) <- N_gender
  #
  # dim(ss_uin14) <- N_gender
  # dim(ss_uen14) <- N_gender
  # dim(ss_ucn14) <- N_gender
  # dim(ss_win14) <- N_gender
  # dim(ss_wen14) <- N_gender
  # dim(ss_wcn14) <- N_gender
  #
  # dim(ss_uin15) <- N_gender
  # dim(ss_uen15) <- N_gender
  # dim(ss_ucn15) <- N_gender
  # dim(ss_win15) <- N_gender
  # dim(ss_wen15) <- N_gender
  # dim(ss_wcn15) <- N_gender
  #
  # dim(ss_uin16) <- N_gender
  # dim(ss_uen16) <- N_gender
  # dim(ss_ucn16) <- N_gender
  # dim(ss_win16) <- N_gender
  # dim(ss_wen16) <- N_gender
  # dim(ss_wcn16) <- N_gender
  #
  # dim(ss_uin17) <- N_gender
  # dim(ss_uen17) <- N_gender
  # dim(ss_ucn17) <- N_gender
  # dim(ss_win17) <- N_gender
  # dim(ss_wen17) <- N_gender
  # dim(ss_wcn17) <- N_gender

  # dim(missing_uin10) <- N_gender
  # dim(missing_uen10) <- N_gender
  # dim(missing_ucn10) <- N_gender
  # dim(missing_win10) <- N_gender
  # dim(missing_wen10) <- N_gender
  # dim(missing_wcn10) <- N_gender
  #
  # dim(missing_uin11) <- N_gender
  # dim(missing_uen11) <- N_gender
  # dim(missing_ucn11) <- N_gender
  # dim(missing_win11) <- N_gender
  # dim(missing_wen11) <- N_gender
  # dim(missing_wcn11) <- N_gender
  #
  # dim(missing_uin12) <- N_gender
  # dim(missing_uen12) <- N_gender
  # dim(missing_ucn12) <- N_gender
  # dim(missing_win12) <- N_gender
  # dim(missing_wen12) <- N_gender
  # dim(missing_wcn12) <- N_gender
  #
  # dim(missing_uin13) <- N_gender
  # dim(missing_uen13) <- N_gender
  # dim(missing_ucn13) <- N_gender
  # dim(missing_win13) <- N_gender
  # dim(missing_wen13) <- N_gender
  # dim(missing_wcn13) <- N_gender
  #
  # dim(missing_uin14) <- N_gender
  # dim(missing_uen14) <- N_gender
  # dim(missing_ucn14) <- N_gender
  # dim(missing_win14) <- N_gender
  # dim(missing_wen14) <- N_gender
  # dim(missing_wcn14) <- N_gender
  #
  # dim(missing_uin15) <- N_gender
  # dim(missing_uen15) <- N_gender
  # dim(missing_ucn15) <- N_gender
  # dim(missing_win15) <- N_gender
  # dim(missing_wen15) <- N_gender
  # dim(missing_wcn15) <- N_gender
  #
  # dim(missing_uin16) <- N_gender
  # dim(missing_uen16) <- N_gender
  # dim(missing_ucn16) <- N_gender
  # dim(missing_win16) <- N_gender
  # dim(missing_wen16) <- N_gender
  # dim(missing_wcn16) <- N_gender
  #
  # dim(missing_uin17) <- N_gender
  # dim(missing_uen17) <- N_gender
  # dim(missing_ucn17) <- N_gender
  # dim(missing_win17) <- N_gender
  # dim(missing_wen17) <- N_gender
  # dim(missing_wcn17) <- N_gender



  dim(polcon_ui10) <- N_gender
  dim(polcon_ue10) <- N_gender
  dim(polcon_uc10) <- N_gender
  dim(polcon_wi10) <- N_gender
  dim(polcon_we10) <- N_gender
  dim(polcon_wc10) <- N_gender

  dim(polcon_ui11) <- N_gender
  dim(polcon_ue11) <- N_gender
  dim(polcon_uc11) <- N_gender
  dim(polcon_wi11) <- N_gender
  dim(polcon_we11) <- N_gender
  dim(polcon_wc11) <- N_gender

  dim(polcon_ui12) <- N_gender
  dim(polcon_ue12) <- N_gender
  dim(polcon_uc12) <- N_gender
  dim(polcon_wi12) <- N_gender
  dim(polcon_we12) <- N_gender
  dim(polcon_wc12) <- N_gender

  dim(polcon_ui13) <- N_gender
  dim(polcon_ue13) <- N_gender
  dim(polcon_uc13) <- N_gender
  dim(polcon_wi13) <- N_gender
  dim(polcon_we13) <- N_gender
  dim(polcon_wc13) <- N_gender

  dim(polcon_ui14) <- N_gender
  dim(polcon_ue14) <- N_gender
  dim(polcon_uc14) <- N_gender
  dim(polcon_wi14) <- N_gender
  dim(polcon_we14) <- N_gender
  dim(polcon_wc14) <- N_gender

  dim(polcon_ui15) <- N_gender
  dim(polcon_ue15) <- N_gender
  dim(polcon_uc15) <- N_gender
  dim(polcon_wi15) <- N_gender
  dim(polcon_we15) <- N_gender
  dim(polcon_wc15) <- N_gender

  dim(polcon_ui16) <- N_gender
  dim(polcon_ue16) <- N_gender
  dim(polcon_uc16) <- N_gender
  dim(polcon_wi16) <- N_gender
  dim(polcon_we16) <- N_gender
  dim(polcon_wc16) <- N_gender

  dim(polcon_ui17) <- N_gender
  dim(polcon_ue17) <- N_gender
  dim(polcon_uc17) <- N_gender
  dim(polcon_wi17) <- N_gender
  dim(polcon_we17) <- N_gender
  dim(polcon_wc17) <- N_gender




#for any expressions used in MIXING   ################################################################
####################################################################################################

  dim(cl_cust) <- N_gender

  dim(x) <- c(N_gender, N_gender)


  dim(I10_cl_contact) <- N_gender
  dim(I11_cl_contact) <- N_gender
  dim(I12_cl_contact) <- N_gender
  dim(I13_cl_contact) <- N_gender
  dim(I14_cl_contact) <- N_gender
  dim(I15_cl_contact) <- N_gender
  dim(I16_cl_contact) <- N_gender
  dim(I17_cl_contact) <- N_gender

  dim(E10_cl_contact) <- N_gender
  dim(E11_cl_contact) <- N_gender
  dim(E12_cl_contact) <- N_gender
  dim(E13_cl_contact) <- N_gender
  dim(E14_cl_contact) <- N_gender
  dim(E15_cl_contact) <- N_gender
  dim(E16_cl_contact) <- N_gender
  dim(E17_cl_contact) <- N_gender

  dim(C10_cl_contact) <- N_gender
  dim(C11_cl_contact) <- N_gender
  dim(C12_cl_contact) <- N_gender
  dim(C13_cl_contact) <- N_gender
  dim(C14_cl_contact) <- N_gender
  dim(C15_cl_contact) <- N_gender
  dim(C16_cl_contact) <- N_gender
  dim(C17_cl_contact) <- N_gender


  #####SURVEILLANCE#########################################################################################################################

  dim(I10_surv_contact) <- N_gender
  dim(I11_surv_contact) <- N_gender
  dim(I12_surv_contact) <- N_gender
  dim(I13_surv_contact) <- N_gender
  dim(I14_surv_contact) <- N_gender
  dim(I15_surv_contact) <- N_gender
  dim(I16_surv_contact) <- N_gender
  dim(I17_surv_contact) <- N_gender

  dim(E10_surv_contact) <- N_gender
  dim(E11_surv_contact) <- N_gender
  dim(E12_surv_contact) <- N_gender
  dim(E13_surv_contact) <- N_gender
  dim(E14_surv_contact) <- N_gender
  dim(E15_surv_contact) <- N_gender
  dim(E16_surv_contact) <- N_gender
  dim(E17_surv_contact) <- N_gender

  dim(C10_surv_contact) <- N_gender
  dim(C11_surv_contact) <- N_gender
  dim(C12_surv_contact) <- N_gender
  dim(C13_surv_contact) <- N_gender
  dim(C14_surv_contact) <- N_gender
  dim(C15_surv_contact) <- N_gender
  dim(C16_surv_contact) <- N_gender
  dim(C17_surv_contact) <- N_gender


################################################

  dim(I10_cl_mix) <- c(N_gender, N_gender)
  dim(I11_cl_mix) <- c(N_gender, N_gender)
  dim(I12_cl_mix) <- c(N_gender, N_gender)
  dim(I13_cl_mix) <- c(N_gender, N_gender)
  dim(I14_cl_mix) <- c(N_gender, N_gender)
  dim(I15_cl_mix) <- c(N_gender, N_gender)
  dim(I16_cl_mix) <- c(N_gender, N_gender)
  dim(I17_cl_mix) <- c(N_gender, N_gender)

  dim(E10_cl_mix) <- c(N_gender, N_gender)
  dim(E11_cl_mix) <- c(N_gender, N_gender)
  dim(E12_cl_mix) <- c(N_gender, N_gender)
  dim(E13_cl_mix) <- c(N_gender, N_gender)
  dim(E14_cl_mix) <- c(N_gender, N_gender)
  dim(E15_cl_mix) <- c(N_gender, N_gender)
  dim(E16_cl_mix) <- c(N_gender, N_gender)
  dim(E17_cl_mix) <- c(N_gender, N_gender)

  dim(C10_cl_mix) <- c(N_gender, N_gender)
  dim(C11_cl_mix) <- c(N_gender, N_gender)
  dim(C12_cl_mix) <- c(N_gender, N_gender)
  dim(C13_cl_mix) <- c(N_gender, N_gender)
  dim(C14_cl_mix) <- c(N_gender, N_gender)
  dim(C15_cl_mix) <- c(N_gender, N_gender)
  dim(C16_cl_mix) <- c(N_gender, N_gender)
  dim(C17_cl_mix) <- c(N_gender, N_gender)


  #####SURVEILLANCE#########################################################################################################################

  dim(I10_surv_mix) <- c(N_gender, N_gender)
  dim(I11_surv_mix) <- c(N_gender, N_gender)
  dim(I12_surv_mix) <- c(N_gender, N_gender)
  dim(I13_surv_mix) <- c(N_gender, N_gender)
  dim(I14_surv_mix) <- c(N_gender, N_gender)
  dim(I15_surv_mix) <- c(N_gender, N_gender)
  dim(I16_surv_mix) <- c(N_gender, N_gender)
  dim(I17_surv_mix) <- c(N_gender, N_gender)

  dim(E10_surv_mix) <- c(N_gender, N_gender)
  dim(E11_surv_mix) <- c(N_gender, N_gender)
  dim(E12_surv_mix) <- c(N_gender, N_gender)
  dim(E13_surv_mix) <- c(N_gender, N_gender)
  dim(E14_surv_mix) <- c(N_gender, N_gender)
  dim(E15_surv_mix) <- c(N_gender, N_gender)
  dim(E16_surv_mix) <- c(N_gender, N_gender)
  dim(E17_surv_mix) <- c(N_gender, N_gender)

  dim(C10_surv_mix) <- c(N_gender, N_gender)
  dim(C11_surv_mix) <- c(N_gender, N_gender)
  dim(C12_surv_mix) <- c(N_gender, N_gender)
  dim(C13_surv_mix) <- c(N_gender, N_gender)
  dim(C14_surv_mix) <- c(N_gender, N_gender)
  dim(C15_surv_mix) <- c(N_gender, N_gender)
  dim(C16_surv_mix) <- c(N_gender, N_gender)
  dim(C17_surv_mix) <- c(N_gender, N_gender)





# for anything we want to output
####################################################################################################
  # dim(test_prev_CL) <- N_gender
  # dim(test_custody_ratio) <- N_gender
  # dim(test_total_fte) <- N_gender
  # dim(test_total_rep) <- N_gender
  # dim(test_check) <- N_gender


  dim(RECi10) <- N_gender
  dim(RECe10) <- N_gender
  dim(RECc10) <- N_gender

  dim(RECi11) <- N_gender
  dim(RECe11) <- N_gender
  dim(RECc11) <- N_gender

  dim(RECi12) <- N_gender
  dim(RECe12) <- N_gender
  dim(RECc12) <- N_gender

  dim(RECi13) <- N_gender
  dim(RECe13) <- N_gender
  dim(RECc13) <- N_gender

  dim(RECi14) <- N_gender
  dim(RECe14) <- N_gender
  dim(RECc14) <- N_gender

  dim(RECi15) <- N_gender
  dim(RECe15) <- N_gender
  dim(RECc15) <- N_gender

  dim(RECi16) <- N_gender
  dim(RECe16) <- N_gender
  dim(RECc16) <- N_gender

  dim(RECi17) <- N_gender
  dim(RECe17) <- N_gender
  dim(RECc17) <- N_gender



########################################################################################################################
 ##############################################################################################################################
  ##intermediate quantities ########################################################################################
 ##############################################################################################################################

  # going to currently just set the res care rates as all of clsoe and have excl and incl the same....
  # parameters?

  polcon_ui10[] <- arrest_uin10[i] + s_s_i10[i] + missing_1014[i]
  polcon_ue10[] <- arrest_uen10[i] + s_s_ec10[i] + missing_1014[i]
  polcon_uc10[] <- arrest_ucn10[i] + s_s_ec10[i] + missing_rc1014[i]
  polcon_wi10[] <- arrest_win10[i] + s_s_i10[i] + missing_1014[i]
  polcon_we10[] <- arrest_wen10[i] + s_s_ec10[i] + missing_1014[i]
  polcon_wc10[] <- arrest_wcn10[i] + s_s_ec10[i] + missing_rc1014[i]

  polcon_ui11[] <- arrest_uin11[i] + s_s_i11[i] + missing_1014[i]
  polcon_ue11[] <- arrest_uen11[i] + s_s_ec11[i] + missing_1014[i]
  polcon_uc11[] <- arrest_ucn11[i] + s_s_ec11[i] + missing_rc1014[i]
  polcon_wi11[] <- arrest_win11[i] + s_s_i11[i] + missing_1014[i]
  polcon_we11[] <- arrest_wen11[i] + s_s_ec11[i] + missing_1014[i]
  polcon_wc11[] <- arrest_wcn11[i] + s_s_ec11[i] + missing_rc1014[i]

  polcon_ui12[] <- arrest_uin12[i] + s_s_i12[i] + missing_1014[i]
  polcon_ue12[] <- arrest_uen12[i] + s_s_ec12[i] + missing_1014[i]
  polcon_uc12[] <- arrest_ucn12[i] + s_s_ec12[i] + missing_rc1014[i]
  polcon_wi12[] <- arrest_win12[i] + s_s_i12[i] + missing_1014[i]
  polcon_we12[] <- arrest_wen12[i] + s_s_ec12[i] + missing_1014[i]
  polcon_wc12[] <- arrest_wcn12[i] + s_s_ec12[i] + missing_rc1014[i]

  polcon_ui13[] <- arrest_uin13[i] + s_s_i13[i] + missing_1014[i]
  polcon_ue13[] <- arrest_uen13[i] + s_s_ec13[i] + missing_1014[i]
  polcon_uc13[] <- arrest_ucn13[i] + s_s_ec13[i] + missing_rc1014[i]
  polcon_wi13[] <- arrest_win13[i] + s_s_i13[i] + missing_1014[i]
  polcon_we13[] <- arrest_wen13[i] + s_s_ec13[i] + missing_1014[i]
  polcon_wc13[] <- arrest_wcn13[i] + s_s_ec13[i] + missing_rc1014[i]

  polcon_ui14[] <- arrest_uin14[i] + s_s_i14[i] + missing_1014[i]
  polcon_ue14[] <- arrest_uen14[i] + s_s_ec14[i] + missing_1014[i]
  polcon_uc14[] <- arrest_ucn14[i] + s_s_ec14[i] + missing_rc1014[i]
  polcon_wi14[] <- arrest_win14[i] + s_s_i14[i] + missing_1014[i]
  polcon_we14[] <- arrest_wen14[i] + s_s_ec14[i] + missing_1014[i]
  polcon_wc14[] <- arrest_wcn14[i] + s_s_ec14[i] + missing_rc1014[i]

  polcon_ui15[] <- arrest_uin15[i] + s_s_i15[i] + missing_1517[i]
  polcon_ue15[] <- arrest_uen15[i] + s_s_ec15[i] + missing_1517[i]
  polcon_uc15[] <- arrest_ucn15[i] + s_s_ec15[i] + missing_rc1517[i]
  polcon_wi15[] <- arrest_win15[i] + s_s_i15[i] + missing_1517[i]
  polcon_we15[] <- arrest_wen15[i] + s_s_ec15[i] + missing_1517[i]
  polcon_wc15[] <- arrest_wcn15[i] + s_s_ec15[i] + missing_rc1517[i]

  polcon_ui16[] <- arrest_uin16[i] + s_s_i16[i] +  missing_1517[i]
  polcon_ue16[] <- arrest_uen16[i] + s_s_ec16[i] + missing_1517[i]
  polcon_uc16[] <- arrest_ucn16[i] + s_s_ec16[i] + missing_rc1517[i]
  polcon_wi16[] <- arrest_win16[i] + s_s_i16[i] + missing_1517[i]
  polcon_we16[] <- arrest_wen16[i] + s_s_ec16[i] + missing_1517[i]
  polcon_wc16[] <- arrest_wcn16[i] + s_s_ec16[i] + missing_rc1517[i]

  polcon_ui17[] <- arrest_uin17[i] + s_s_i17[i] + missing_1517[i]
  polcon_ue17[] <- arrest_uen17[i] + s_s_ec17[i] + missing_1517[i]
  polcon_uc17[] <- arrest_ucn17[i] + s_s_ec17[i] + missing_rc1517[i]
  polcon_wi17[] <- arrest_win17[i] + s_s_i17[i] + missing_1517[i]
  polcon_we17[] <- arrest_wen17[i] + s_s_ec17[i] + missing_1517[i]
  polcon_wc17[] <- arrest_wcn17[i] + s_s_ec17[i] + missing_rc1517[i]



  # GROUPS OF STATES
  Uicr10[] <- Uicrf10[i] + Uicrr10[i]
  Uecr10[] <- Uecrf10[i] + Uecrr10[i]
  Uccr10[] <- Uccrf10[i] + Uccrr10[i]
  Uicr11[] <- Uicrf11[i] + Uicrr11[i]
  Uecr11[] <- Uecrf11[i] + Uecrr11[i]
  Uccr11[] <- Uccrf11[i] + Uccrr11[i]
  Uicr12[] <- Uicrf12[i] + Uicrr12[i]
  Uecr12[] <- Uecrf12[i] + Uecrr12[i]
  Uccr12[] <- Uccrf12[i] + Uccrr12[i]
  Uicr13[] <- Uicrf13[i] + Uicrr13[i]
  Uecr13[] <- Uecrf13[i] + Uecrr13[i]
  Uccr13[] <- Uccrf13[i] + Uccrr13[i]
  Uicr14[] <- Uicrf14[i] + Uicrr14[i]
  Uecr14[] <- Uecrf14[i] + Uecrr14[i]
  Uccr14[] <- Uccrf14[i] + Uccrr14[i]
  Uicr15[] <- Uicrf15[i] + Uicrr15[i]
  Uecr15[] <- Uecrf15[i] + Uecrr15[i]
  Uccr15[] <- Uccrf15[i] + Uccrr15[i]
  Uicr16[] <- Uicrf16[i] + Uicrr16[i]
  Uecr16[] <- Uecrf16[i] + Uecrr16[i]
  Uccr16[] <- Uccrf16[i] + Uccrr16[i]
  Uicr17[] <- Uicrf17[i] + Uicrr17[i]
  Uecr17[] <- Uecrf17[i] + Uecrr17[i]
  Uccr17[] <- Uccrf17[i] + Uccrr17[i]

  Wicr10[] <- Wicrf10[i] + Wicrr10[i]
  Wecr10[] <- Wecrf10[i] + Wecrr10[i]
  Wccr10[] <- Wccrf10[i] + Wccrr10[i]
  Wicr11[] <- Wicrf11[i] + Wicrr11[i]
  Wecr11[] <- Wecrf11[i] + Wecrr11[i]
  Wccr11[] <- Wccrf11[i] + Wccrr11[i]
  Wicr12[] <- Wicrf12[i] + Wicrr12[i]
  Wecr12[] <- Wecrf12[i] + Wecrr12[i]
  Wccr12[] <- Wccrf12[i] + Wccrr12[i]
  Wicr13[] <- Wicrf13[i] + Wicrr13[i]
  Wecr13[] <- Wecrf13[i] + Wecrr13[i]
  Wccr13[] <- Wccrf13[i] + Wccrr13[i]
  Wicr14[] <- Wicrf14[i] + Wicrr14[i]
  Wecr14[] <- Wecrf14[i] + Wecrr14[i]
  Wccr14[] <- Wccrf14[i] + Wccrr14[i]
  Wicr15[] <- Wicrf15[i] + Wicrr15[i]
  Wecr15[] <- Wecrf15[i] + Wecrr15[i]
  Wccr15[] <- Wccrf15[i] + Wccrr15[i]
  Wicr16[] <- Wicrf16[i] + Wicrr16[i]
  Wecr16[] <- Wecrf16[i] + Wecrr16[i]
  Wccr16[] <- Wccrf16[i] + Wccrr16[i]
  Wicr17[] <- Wicrf17[i] + Wicrr17[i]
  Wecr17[] <- Wecrf17[i] + Wecrr17[i]
  Wccr17[] <- Wccrf17[i] + Wccrr17[i]







  ##total numbers in included class  for each age group
  I10[] <- Uin10[i] + Uis10[i] + Uinc10[i] + Win10[i] + Wis10[i] + Winc10[i] + Uics10[i] + Wics10[i] + Uicrf10[i] + Uicrr10[i] + Wicrf10[i] + Wicrr10[i]
  I11[] <- Uin11[i] + Uis11[i] + Uinc11[i] + Win11[i] + Wis11[i] + Winc11[i] + Uics11[i] + Wics11[i] + Uicrf11[i] + Uicrr11[i] + Wicrf11[i] + Wicrr11[i]
  I12[] <- Uin12[i] + Uis12[i] + Uinc12[i] + Win12[i] + Wis12[i] + Winc12[i] + Uics12[i] + Wics12[i] + Uicrf12[i] + Uicrr12[i] + Wicrf12[i] + Wicrr12[i]
  I13[] <- Uin13[i] + Uis13[i] + Uinc13[i] + Win13[i] + Wis13[i] + Winc13[i] + Uics13[i] + Wics13[i] + Uicrf13[i] + Uicrr13[i] + Wicrf13[i] + Wicrr13[i]
  I14[] <- Uin14[i] + Uis14[i] + Uinc14[i] + Win14[i] + Wis14[i] + Winc14[i] + Uics14[i] + Wics14[i] + Uicrf14[i] + Uicrr14[i] + Wicrf14[i] + Wicrr14[i]
  I15[] <- Uin15[i] + Uis15[i] + Uinc15[i] + Win15[i] + Wis15[i] + Winc15[i] + Uics15[i] + Wics15[i] + Uicrf15[i] + Uicrr15[i] + Wicrf15[i] + Wicrr15[i]
  I16[] <- Uin16[i] + Uis16[i] + Uinc16[i] + Win16[i] + Wis16[i] + Winc16[i] + Uics16[i] + Wics16[i] + Uicrf16[i] + Uicrr16[i] + Wicrf16[i] + Wicrr16[i]
  I17[] <- Uin17[i] + Uis17[i] + Uinc17[i] + Win17[i] + Wis17[i] + Winc17[i] + Uics17[i] + Wics17[i] + Uicrf17[i] + Uicrr17[i] + Wicrf17[i] + Wicrr17[i]



  ##total numbers in excluded class  for each age group
  E10[] <- Uen10[i] + Ues10[i] + Uenc10[i] + Wen10[i] + Wes10[i] + Wenc10[i] + Uecs10[i] + Wecs10[i] + Uecrf10[i] + Uecrr10[i] + Wecrf10[i] + Wecrr10[i]
  E11[] <- Uen11[i] + Ues11[i] + Uenc11[i] + Wen11[i] + Wes11[i] + Wenc11[i] + Uecs11[i] + Wecs11[i] + Uecrf11[i] + Uecrr11[i] + Wecrf11[i] + Wecrr11[i]
  E12[] <- Uen12[i] + Ues12[i] + Uenc12[i] + Wen12[i] + Wes12[i] + Wenc12[i] + Uecs12[i] + Wecs12[i] + Uecrf12[i] + Uecrr12[i] + Wecrf12[i] + Wecrr12[i]
  E13[] <- Uen13[i] + Ues13[i] + Uenc13[i] + Wen13[i] + Wes13[i] + Wenc13[i] + Uecs13[i] + Wecs13[i] + Uecrf13[i] + Uecrr13[i] + Wecrf13[i] + Wecrr13[i]
  E14[] <- Uen14[i] + Ues14[i] + Uenc14[i] + Wen14[i] + Wes14[i] + Wenc14[i] + Uecs14[i] + Wecs14[i] + Uecrf14[i] + Uecrr14[i] + Wecrf14[i] + Wecrr14[i]
  E15[] <- Uen15[i] + Ues15[i] + Uenc15[i] + Wen15[i] + Wes15[i] + Wenc15[i] + Uecs15[i] + Wecs15[i] + Uecrf15[i] + Uecrr15[i] + Wecrf15[i] + Wecrr15[i]
  E16[] <- Uen16[i] + Ues16[i] + Uenc16[i] + Wen16[i] + Wes16[i] + Wenc16[i] + Uecs16[i] + Wecs16[i] + Uecrf16[i] + Uecrr16[i] + Wecrf16[i] + Wecrr16[i]
  E17[] <- Uen17[i] + Ues17[i] + Uenc17[i] + Wen17[i] + Wes17[i] + Wenc17[i] + Uecs17[i] + Wecs17[i] + Uecrf17[i] + Uecrr17[i] + Wecrf17[i] + Wecrr17[i]




  ##total numbers in close class  for each age group
  C10[] <- Ucn10[i] + Ucs10[i] + Ucnc10[i] + Wcn10[i] + Wcs10[i] + Wcnc10[i] + Uccs10[i] + Wccs10[i] + Uccrf10[i] + Uccrr10[i] + Wccrf10[i] + Wccrr10[i]
  C11[] <- Ucn11[i] + Ucs11[i] + Ucnc11[i] + Wcn11[i] + Wcs11[i] + Wcnc11[i] + Uccs11[i] + Wccs11[i] + Uccrf11[i] + Uccrr11[i] + Wccrf11[i] + Wccrr11[i]
  C12[] <- Ucn12[i] + Ucs12[i] + Ucnc12[i] + Wcn12[i] + Wcs12[i] + Wcnc12[i] + Uccs12[i] + Wccs12[i] + Uccrf12[i] + Uccrr12[i] + Wccrf12[i] + Wccrr12[i]
  C13[] <- Ucn13[i] + Ucs13[i] + Ucnc13[i] + Wcn13[i] + Wcs13[i] + Wcnc13[i] + Uccs13[i] + Wccs13[i] + Uccrf13[i] + Uccrr13[i] + Wccrf13[i] + Wccrr13[i]
  C14[] <- Ucn14[i] + Ucs14[i] + Ucnc14[i] + Wcn14[i] + Wcs14[i] + Wcnc14[i] + Uccs14[i] + Wccs14[i] + Uccrf14[i] + Uccrr14[i] + Wccrf14[i] + Wccrr14[i]
  C15[] <- Ucn15[i] + Ucs15[i] + Ucnc15[i] + Wcn15[i] + Wcs15[i] + Wcnc15[i] + Uccs15[i] + Wccs15[i] + Uccrf15[i] + Uccrr15[i] + Wccrf15[i] + Wccrr15[i]
  C16[] <- Ucn16[i] + Ucs16[i] + Ucnc16[i] + Wcn16[i] + Wcs16[i] + Wcnc16[i] + Uccs16[i] + Wccs16[i] + Uccrf16[i] + Uccrr16[i] + Wccrf16[i] + Wccrr16[i]
  C17[] <- Ucn17[i] + Ucs17[i] + Ucnc17[i] + Wcn17[i] + Wcs17[i] + Wcnc17[i] + Uccs17[i] + Wccs17[i] + Uccrf17[i] + Uccrr17[i] + Wccrf17[i] + Wccrr17[i]



  # total population
  N[] <- I10[i] + E10[i] + C10[i] + I11[i] + E11[i] + C11[i] + I12[i] + E12[i] + C12[i] + I13[i] + E13[i] + C13[i] + I14[i] + E14[i] + C14[i] + I15[i] + E15[i] + C15[i] + I16[i] + E16[i] + C16[i] + I17[i] + E17[i] + C17[i]



##############################################################################################################################
##MAkING INTERMEDIATE QUANTITIES FOR MIXING - RECRUITMENT IN CUSTODY & COMMUNITY, SURVEILLANCE MIXING
##############################################################################################################################

  # uninvolved in community###########################################################################
  UCOMi10[] <- Uin10[i] + Uis10[i] + Uinc10[i]
  UCOMe10[] <- Uen10[i] + Ues10[i] + Uenc10[i]
  UCOMc10[] <- Ucn10[i] + Ucs10[i] + Ucnc10[i]

  UCOMi11[] <- Uin11[i] + Uis11[i] + Uinc11[i]
  UCOMe11[] <- Uen11[i] + Ues11[i] + Uenc11[i]
  UCOMc11[] <- Ucn11[i] + Ucs11[i] + Ucnc11[i]

  UCOMi12[] <- Uin12[i] + Uis12[i] + Uinc12[i]
  UCOMe12[] <- Uen12[i] + Ues12[i] + Uenc12[i]
  UCOMc12[] <- Ucn12[i] + Ucs12[i] + Ucnc12[i]

  UCOMi13[] <- Uin13[i] + Uis13[i] + Uinc13[i]
  UCOMe13[] <- Uen13[i] + Ues13[i] + Uenc13[i]
  UCOMc13[] <- Ucn13[i] + Ucs13[i] + Ucnc13[i]

  UCOMi14[] <- Uin14[i] + Uis14[i] + Uinc14[i]
  UCOMe14[] <- Uen14[i] + Ues14[i] + Uenc14[i]
  UCOMc14[] <- Ucn14[i] + Ucs14[i] + Ucnc14[i]

  UCOMi15[] <- Uin15[i] + Uis15[i] + Uinc15[i]
  UCOMe15[] <- Uen15[i] + Ues15[i] + Uenc15[i]
  UCOMc15[] <- Ucn15[i] + Ucs15[i] + Ucnc15[i]

  UCOMi16[] <- Uin16[i] + Uis16[i] + Uinc16[i]
  UCOMe16[] <- Uen16[i] + Ues16[i] + Uenc16[i]
  UCOMc16[] <- Ucn16[i] + Ucs16[i] + Ucnc16[i]

  UCOMi17[] <- Uin17[i] + Uis17[i] + Uinc17[i]
  UCOMe17[] <- Uen17[i] + Ues17[i] + Uenc17[i]
  UCOMc17[] <- Ucn17[i] + Ucs17[i] + Ucnc17[i]



  #involved in community###########################################################################
  WCOMi10[] <- Win10[i] + Wis10[i] + Winc10[i]
  WCOMe10[] <- Wen10[i] + Wes10[i] + Wenc10[i]
  WCOMc10[] <- Wcn10[i] + Wcs10[i] + Wcnc10[i]

  WCOMi11[] <- Win11[i] + Wis11[i] + Winc11[i]
  WCOMe11[] <- Wen11[i] + Wes11[i] + Wenc11[i]
  WCOMc11[] <- Wcn11[i] + Wcs11[i] + Wcnc11[i]

  WCOMi12[] <- Win12[i] + Wis12[i] + Winc12[i]
  WCOMe12[] <- Wen12[i] + Wes12[i] + Wenc12[i]
  WCOMc12[] <- Wcn12[i] + Wcs12[i] + Wcnc12[i]

  WCOMi13[] <- Win13[i] + Wis13[i] + Winc13[i]
  WCOMe13[] <- Wen13[i] + Wes13[i] + Wenc13[i]
  WCOMc13[] <- Wcn13[i] + Wcs13[i] + Wcnc13[i]

  WCOMi14[] <- Win14[i] + Wis14[i] + Winc14[i]
  WCOMe14[] <- Wen14[i] + Wes14[i] + Wenc14[i]
  WCOMc14[] <- Wcn14[i] + Wcs14[i] + Wcnc14[i]

  WCOMi15[] <- Win15[i] + Wis15[i] + Winc15[i]
  WCOMe15[] <- Wen15[i] + Wes15[i] + Wenc15[i]
  WCOMc15[] <- Wcn15[i] + Wcs15[i] + Wcnc15[i]

  WCOMi16[] <- Win16[i] + Wis16[i] + Winc16[i]
  WCOMe16[] <- Wen16[i] + Wes16[i] + Wenc16[i]
  WCOMc16[] <- Wcn16[i] + Wcs16[i] + Wcnc16[i]

  WCOMi17[] <- Win17[i] + Wis17[i] + Winc17[i]
  WCOMe17[] <- Wen17[i] + Wes17[i] + Wenc17[i]
  WCOMc17[] <- Wcn17[i] + Wcs17[i] + Wcnc17[i]



  # all community, working or not #########################################################################
  COMi10[] <- UCOMi10[i] + WCOMi10[i]
  COMe10[] <- UCOMe10[i] + WCOMe10[i]
  COMc10[] <- UCOMc10[i] + WCOMc10[i]

  COMi11[] <- UCOMi11[i] + WCOMi11[i]
  COMe11[] <- UCOMe11[i] + WCOMe11[i]
  COMc11[] <- UCOMc11[i] + WCOMc11[i]

  COMi12[] <- UCOMi12[i] + WCOMi12[i]
  COMe12[] <- UCOMe12[i] + WCOMe12[i]
  COMc12[] <- UCOMc12[i] + WCOMc12[i]

  COMi13[] <- UCOMi13[i] + WCOMi13[i]
  COMe13[] <- UCOMe13[i] + WCOMe13[i]
  COMc13[] <- UCOMc13[i] + WCOMc13[i]

  COMi14[] <- UCOMi14[i] + WCOMi14[i]
  COMe14[] <- UCOMe14[i] + WCOMe14[i]
  COMc14[] <- UCOMc14[i] + WCOMc14[i]

  COMi15[] <- UCOMi15[i] + WCOMi15[i]
  COMe15[] <- UCOMe15[i] + WCOMe15[i]
  COMc15[] <- UCOMc15[i] + WCOMc15[i]

  COMi16[] <- UCOMi16[i] + WCOMi16[i]
  COMe16[] <- UCOMe16[i] + WCOMe16[i]
  COMc16[] <- UCOMc16[i] + WCOMc16[i]

  COMi17[] <- UCOMi17[i] + WCOMi17[i]
  COMe17[] <- UCOMe17[i] + WCOMe17[i]
  COMc17[] <- UCOMc17[i] + WCOMc17[i]


  # surveilled in community, for surveilled mixing ########################################################################
  # includes both surveilled and Non-custodial, and both working and not

  SCOMi10[] <- Uis10[i] + Uinc10[i] + Wis10[i] + Winc10[i]
  SCOMe10[] <- Ues10[i] + Uenc10[i] + Wes10[i] + Wenc10[i]
  SCOMc10[] <- Ucs10[i] + Ucnc10[i] + Wcs10[i] + Wcnc10[i]

  SCOMi11[] <- Uis11[i] + Uinc11[i] + Wis11[i] + Winc11[i]
  SCOMe11[] <- Ues11[i] + Uenc11[i] + Wes11[i] + Wenc11[i]
  SCOMc11[] <- Ucs11[i] + Ucnc11[i] + Wcs11[i] + Wcnc11[i]

  SCOMi12[] <- Uis12[i] + Uinc12[i] + Wis12[i] + Winc12[i]
  SCOMe12[] <- Ues12[i] + Uenc12[i] + Wes12[i] + Wenc12[i]
  SCOMc12[] <- Ucs12[i] + Ucnc12[i] + Wcs12[i] + Wcnc12[i]

  SCOMi13[] <- Uis13[i] + Uinc13[i] + Wis13[i] + Winc13[i]
  SCOMe13[] <- Ues13[i] + Uenc13[i] + Wes13[i] + Wenc13[i]
  SCOMc13[] <- Ucs13[i] + Ucnc13[i] + Wcs13[i] + Wcnc13[i]

  SCOMi14[] <- Uis14[i] + Uinc14[i] + Wis14[i] + Winc14[i]
  SCOMe14[] <- Ues14[i] + Uenc14[i] + Wes14[i] + Wenc14[i]
  SCOMc14[] <- Ucs14[i] + Ucnc14[i] + Wcs14[i] + Wcnc14[i]

  SCOMi15[] <- Uis15[i] + Uinc15[i] + Wis15[i] + Winc15[i]
  SCOMe15[] <- Ues15[i] + Uenc15[i] + Wes15[i] + Wenc15[i]
  SCOMc15[] <- Ucs15[i] + Ucnc15[i] + Wcs15[i] + Wcnc15[i]

  SCOMi16[] <- Uis16[i] + Uinc16[i] + Wis16[i] + Winc16[i]
  SCOMe16[] <- Ues16[i] + Uenc16[i] + Wes16[i] + Wenc16[i]
  SCOMc16[] <- Ucs16[i] + Ucnc16[i] + Wcs16[i] + Wcnc16[i]

  SCOMi17[] <- Uis17[i] + Uinc17[i] + Wis17[i] + Winc17[i]
  SCOMe17[] <- Ues17[i] + Uenc17[i] + Wes17[i] + Wenc17[i]
  SCOMc17[] <- Ucs17[i] + Ucnc17[i] + Wcs17[i] + Wcnc17[i]



  #CUSTODY###########################################################################

  UCUSTi10[] <- Uicrf10[i] + Uicrr10[i] + Uics10[i]
  UCUSTe10[] <- Uecrf10[i] + Uecrr10[i] + Uecs10[i]
  UCUSTc10[] <- Uccrf10[i] + Uccrr10[i] + Uccs10[i]
  UCUSTi11[] <- Uicrf11[i] + Uicrr11[i] + Uics11[i]
  UCUSTe11[] <- Uecrf11[i] + Uecrr11[i] + Uecs11[i]
  UCUSTc11[] <- Uccrf11[i] + Uccrr11[i] + Uccs11[i]
  UCUSTi12[] <- Uicrf12[i] + Uicrr12[i] + Uics12[i]
  UCUSTe12[] <- Uecrf12[i] + Uecrr12[i] + Uecs12[i]
  UCUSTc12[] <- Uccrf12[i] + Uccrr12[i] + Uccs12[i]
  UCUSTi13[] <- Uicrf13[i] + Uicrr13[i] + Uics13[i]
  UCUSTe13[] <- Uecrf13[i] + Uecrr13[i] + Uecs13[i]
  UCUSTc13[] <- Uccrf13[i] + Uccrr13[i] + Uccs13[i]
  UCUSTi14[] <- Uicrf14[i] + Uicrr14[i] + Uics14[i]
  UCUSTe14[] <- Uecrf14[i] + Uecrr14[i] + Uecs14[i]
  UCUSTc14[] <- Uccrf14[i] + Uccrr14[i] + Uccs14[i]
  UCUSTi15[] <- Uicrf15[i] + Uicrr15[i] + Uics15[i]
  UCUSTe15[] <- Uecrf15[i] + Uecrr15[i] + Uecs15[i]
  UCUSTc15[] <- Uccrf15[i] + Uccrr15[i] + Uccs15[i]
  UCUSTi16[] <- Uicrf16[i] + Uicrr16[i] + Uics16[i]
  UCUSTe16[] <- Uecrf16[i] + Uecrr16[i] + Uecs16[i]
  UCUSTc16[] <- Uccrf16[i] + Uccrr16[i] + Uccs16[i]
  UCUSTi17[] <- Uicrf17[i] + Uicrr17[i] + Uics17[i]
  UCUSTe17[] <- Uecrf17[i] + Uecrr17[i] + Uecs17[i]
  UCUSTc17[] <- Uccrf17[i] + Uccrr17[i] + Uccs17[i]



  # total
  WCUST[] <- Wicrf10[i] + Wicrr10[i] + Wics10[i] + Wicrf11[i] + Wicrr11[i] + Wics11[i] + Wicrf12[i] + Wicrr12[i] + Wics12[i] + Wicrf13[i] + Wicrr13[i] + Wics13[i] + Wicrf14[i] + Wicrr14[i] + Wics14[i] + Wicrf15[i] + Wicrr15[i] + Wics15[i] + Wicrf16[i] + Wicrr16[i] + Wics16[i] + Wicrf17[i] + Wicrr17[i] + Wics17[i] + Wecrf10[i] + Wecrr10[i] + Wecs10[i] +Wecrf11[i] + Wecrr11[i] + Wecs11[i] + Wecrf12[i] + Wecrr12[i] + Wecs12[i] + Wecrf13[i] + Wecrr13[i] + Wecs13[i] + Wecrf14[i] + Wecrr14[i] + Wecs14[i] + Wecrf15[i] + Wecrr15[i] + Wecs15[i] + Wecrf16[i] + Wecrr16[i] + Wecs16[i] + Wecrf17[i] + Wecrr17[i] + Wecs17[i] + Wccrf10[i] + Wccrr10[i] + Wccs10[i] +Wccrf11[i] + Wccrr11[i] + Wccs11[i] + Wccrf12[i] + Wccrr12[i] + Wccs12[i] + Wccrf13[i] + Wccrr13[i] + Wccs13[i] + Wccrf14[i] + Wccrr14[i] + Wccs14[i] + Wccrf15[i] + Wccrr15[i] + Wccs15[i] + Wccrf16[i] + Wccrr16[i] + Wccs16[i] + Wccrf17[i] + Wccrr17[i] + Wccs17[i]

  # total in custody
  CUST[] <- Uicrf10[i] + Uicrr10[i] + Uics10[i] + Uicrf11[i] + Uicrr11[i] + Uics11[i] + Uicrf12[i] + Uicrr12[i] + Uics12[i] + Uicrf13[i] + Uicrr13[i] + Uics13[i] + Uicrf14[i] + Uicrr14[i] + Uics14[i] + Uicrf15[i] + Uicrr15[i] + Uics15[i] + Uicrf16[i] + Uicrr16[i] + Uics16[i] + Uicrf17[i] + Uicrr17[i] + Uics17[i] + Uecrf10[i] + Uecrr10[i] + Uecs10[i] +Uecrf11[i] + Uecrr11[i] + Uecs11[i] + Uecrf12[i] + Uecrr12[i] + Uecs12[i] + Uecrf13[i] + Uecrr13[i] + Uecs13[i] + Uecrf14[i] + Uecrr14[i] + Uecs14[i] + Uecrf15[i] + Uecrr15[i] + Uecs15[i] + Uecrf16[i] + Uecrr16[i] + Uecs16[i] + Uecrf17[i] + Uecrr17[i] + Uecs17[i] + Uccrf10[i] + Uccrr10[i] + Uccs10[i] +Uccrf11[i] + Uccrr11[i] + Uccs11[i] + Uccrf12[i] + Uccrr12[i] + Uccs12[i] + Uccrf13[i] + Uccrr13[i] + Uccs13[i] + Uccrf14[i] + Uccrr14[i] + Uccs14[i] + Uccrf15[i] + Uccrr15[i] + Uccs15[i] + Uccrf16[i] + Uccrr16[i] + Uccs16[i] + Uccrf17[i] + Uccrr17[i] + Uccs17[i] + Wicrf10[i] + Wicrr10[i] + Wics10[i] +Wicrf11[i] + Wicrr11[i] + Wics11[i] + Wicrf12[i] + Wicrr12[i] + Wics12[i] + Wicrf13[i] + Wicrr13[i] + Wics13[i] + Wicrf14[i] + Wicrr14[i] + Wics14[i] + Wicrf15[i] + Wicrr15[i] + Wics15[i] + Wicrf16[i] + Wicrr16[i] + Wics16[i] + Wicrf17[i] + Wicrr17[i] + Wics17[i] + Wecrf10[i] + Wecrr10[i] + Wecs10[i] +Wecrf11[i] + Wecrr11[i] + Wecs11[i] + Wecrf12[i] + Wecrr12[i] + Wecs12[i] + Wecrf13[i] + Wecrr13[i] + Wecs13[i] + Wecrf14[i] + Wecrr14[i] + Wecs14[i] + Wecrf15[i] + Wecrr15[i] + Wecs15[i] + Wecrf16[i] + Wecrr16[i] + Wecs16[i] + Wecrf17[i] + Wecrr17[i] + Wecs17[i] + Wccrf10[i] + Wccrr10[i] + Wccs10[i] +Wccrf11[i] + Wccrr11[i] + Wccs11[i] + Wccrf12[i] + Wccrr12[i] + Wccs12[i] + Wccrf13[i] + Wccrr13[i] + Wccs13[i] + Wccrf14[i] + Wccrr14[i] + Wccs14[i] + Wccrf15[i] + Wccrr15[i] + Wccs15[i] + Wccrf16[i] + Wccrr16[i] + Wccs16[i] + Wccrf17[i] + Wccrr17[i] + Wccs17[i]






  ##############################################################################################################################
  ##############################################################################################################################
  ##############################################################################################################################
  #####################DIFFERENTIAL EQUATIONS###############################################################
  ##############################################################################################################################
# could order everything in terms of a) change in age b) change in class c) change in police d) change in cl
  ##############################################################################################################################

  ######AGE TEN - YOUNGEST GROUP################################################################################################################################################
  ##differential equations - inclusion##############################################################################################################################
  deriv(Uin10[]) <- pc_incl[i]*turn10[i] - age_up*Uin10[i] + desist*Win10[i] - contact*recruit_i[i]*Uin10[i]*sum(I10_cl_mix[,i]) - contact*associate_i[i]*Uin10[i]*sum(I10_surv_mix[,i]) - polcon_ui10[i]*Uin10[i]
  deriv(Uis10[]) <- desist*Wis10[i] - contact*recruit_i[i]*Uis10[i]*sum(I10_cl_mix[,i]) + contact*associate_i[i]*Uin10[i]*sum(I10_surv_mix[,i]) + polcon_ui10[i]*Uin10[i] + r2a*end_rem[i]*Uicrf10[i] - np2csj_i10[i]*Uis10[i] - age_up*Uis10[i]
  deriv(Uinc10[]) <- desist*Winc10[i] - contact*recruit_i[i]*Uinc10[i]*sum(I10_cl_mix[,i]) + np2nc_i10[i]*Uis10[i] + r2a*end_rem[i]*Uicrr10[i] + r2nc*end_rem[i]*(Uicrf10[i] + Uicrr10[i]) + end_cust10[i]*Uics10[i] - (prior2rem_i10[i] + prior2cust_i10[i])*Uinc10[i] - age_up*Uinc10[i]
  deriv(Uicrf10[]) <- np2rem_i10[i]*Uis10[i] + deter*Wicrf10[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf10[i] - end_rem[i]*Uicrf10[i] - age_up*Uicrf10[i]
  deriv(Uicrr10[]) <- prior2rem_i10[i]*Uinc10[i] + deter*Wicrr10[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr10[i] - end_rem[i]*Uicrr10[i] - age_up*Uicrf10[i]
  deriv(Uics10[]) <- np2cust_i10[i]*Uis10[i] + prior2cust_i10[i]*Uinc10[i] + end_rem[i]*r2c*Uicr10[i] + deter*Wics10[i] - contact*recruit_cust[i]*cl_cust[i]*Uics10[i] - end_cust10[i]*Uics10[i] - age_up*Uics10[i]
  deriv(Win10[]) <- contact*recruit_i[i]*Uin10[i]*sum(I10_cl_mix[,i]) - desist*Win10[i] - contact*associate_i[i]*Win10[i]*sum(I10_surv_mix[,i]) - polcon_wi10[i]*Win10[i] - age_up*Win10[i]
  deriv(Wis10[]) <- contact*recruit_i[i]*Uis10[i]*sum(I10_cl_mix[,i]) - desist*Wis10[i] + contact*associate_i[i]*Win10[i]*sum(I10_surv_mix[,i]) + polcon_wi10[i]*Win10[i] + r2a*end_rem[i]*Wicrf10[i] - np2csj_i10[i]*Wis10[i] - age_up*Wis10[i]
  deriv(Winc10[]) <- contact*recruit_i[i]*Uinc10[i]*sum(I10_cl_mix[,i]) - desist*Winc10[i] + np2nc_i10[i]*Wis10[i] + r2a*end_rem[i]*Wicrr10[i] + r2nc*end_rem[i]*(Wicrf10[i] + Wicrr10[i]) + end_cust10[i]*Wics10[i] - (prior2rem_i10[i] + prior2cust_i10[i])*Winc10[i] - age_up*Winc10[i]
  deriv(Wicrf10[]) <- np2rem_i10[i]*Wis10[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf10[i] - deter*Wicrf10[i] - end_rem[i]*Wicrf10[i] - age_up*Wicrf10[i]
  deriv(Wicrr10[]) <- prior2rem_i10[i]*Winc10[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr10[i] - deter*Wicrr10[i] - end_rem[i]*Wicrr10[i] - age_up*Wicrr10[i]
  deriv(Wics10[]) <- np2cust_i10[i]*Wis10[i] + prior2cust_i10[i]*Winc10[i] + end_rem[i]*r2c*Wicr10[i] + contact*recruit_cust[i]*cl_cust[i]*Uics10[i] - deter*Wics10[i] - end_cust10[i]*Wics10[i] - age_up*Wics10[i]

  deriv(Uen10[]) <- pc_excl[i]*turn10[i] - age_up*Uen10[i] + desist*Wen10[i] - contact*recruit_e[i]*Uen10[i]*sum(E10_cl_mix[,i]) - contact*associate_e[i]*Uen10[i]*sum(E10_surv_mix[,i]) - polcon_ue10[i]*Uen10[i]
  deriv(Ues10[]) <- desist*Wes10[i] - contact*recruit_e[i]*Ues10[i]*sum(E10_cl_mix[,i]) + contact*associate_e[i]*Uen10[i]*sum(E10_surv_mix[,i]) + polcon_ue10[i]*Uen10[i] + r2a*end_rem[i]*Uecrf10[i] - np2csj_e10[i]*Ues10[i] - age_up*Ues10[i]
  deriv(Uenc10[]) <- desist*Wenc10[i] - contact*recruit_e[i]*Uenc10[i]*sum(E10_cl_mix[,i]) + np2nc_e10[i]*Ues10[i] + r2a*end_rem[i]*Uecrr10[i] + r2nc*end_rem[i]*(Uecrf10[i] + Uecrr10[i]) + end_cust10[i]*Uecs10[i] - (prior2rem_e10[i] + prior2cust_e10[i])*Uenc10[i] - age_up*Uenc10[i]
  deriv(Uecrf10[]) <- np2rem_e10[i]*Ues10[i] + deter*Wecrf10[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf10[i] - end_rem[i]*Uecrf10[i] - age_up*Uecrf10[i]
  deriv(Uecrr10[]) <- prior2rem_e10[i]*Uenc10[i] + deter*Wecrr10[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr10[i] - end_rem[i]*Uecrr10[i] - age_up*Uecrf10[i]
  deriv(Uecs10[]) <- np2cust_e10[i]*Ues10[i] + prior2cust_e10[i]*Uenc10[i] + end_rem[i]*r2c*Uecr10[i] + deter*Wecs10[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs10[i] - end_cust10[i]*Uecs10[i] - age_up*Uecs10[i]
  deriv(Wen10[]) <- contact*recruit_e[i]*Uen10[i]*sum(E10_cl_mix[,i]) - desist*Wen10[i] - contact*associate_e[i]*Wen10[i]*sum(E10_surv_mix[,i]) - polcon_we10[i]*Wen10[i] - age_up*Wen10[i]
  deriv(Wes10[]) <- contact*recruit_e[i]*Ues10[i]*sum(E10_cl_mix[,i]) - desist*Wes10[i] + contact*associate_e[i]*Wen10[i]*sum(E10_surv_mix[,i]) + polcon_we10[i]*Wen10[i] + r2a*end_rem[i]*Wecrf10[i] - np2csj_e10[i]*Wes10[i] - age_up*Wes10[i]
  deriv(Wenc10[]) <- contact*recruit_e[i]*Uenc10[i]*sum(E10_cl_mix[,i]) - desist*Wenc10[i] + np2nc_e10[i]*Wes10[i] + r2a*end_rem[i]*Wecrr10[i] + r2nc*end_rem[i]*(Wecrf10[i] + Wecrr10[i]) + end_cust10[i]*Wecs10[i] - (prior2rem_e10[i] + prior2cust_e10[i])*Wenc10[i] - age_up*Wenc10[i]
  deriv(Wecrf10[]) <- np2rem_e10[i]*Wes10[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf10[i] - deter*Wecrf10[i] - end_rem[i]*Wecrf10[i] - age_up*Wecrf10[i]
  deriv(Wecrr10[]) <- prior2rem_e10[i]*Wenc10[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr10[i] - deter*Wecrr10[i] - end_rem[i]*Wecrr10[i] - age_up*Wecrr10[i]
  deriv(Wecs10[]) <- np2cust_e10[i]*Wes10[i] + prior2cust_e10[i]*Wenc10[i] + end_rem[i]*r2c*Wecr10[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs10[i] - deter*Wecs10[i] - end_cust10[i]*Wecs10[i] - age_up*Wecs10[i]

  deriv(Ucn10[]) <- pc_close[i]*turn10[i] - age_up*Ucn10[i] + desist*Wcn10[i] - contact*recruit_c[i]*Ucn10[i]*sum(C10_cl_mix[,i]) - contact*associate_c[i]*Ucn10[i]*sum(C10_surv_mix[,i]) - polcon_uc10[i]*Ucn10[i]
  deriv(Ucs10[]) <- desist*Wcs10[i] - contact*recruit_c[i]*Ucs10[i]*sum(C10_cl_mix[,i]) + contact*associate_c[i]*Ucn10[i]*sum(C10_surv_mix[,i]) + polcon_uc10[i]*Ucn10[i] + r2a*end_rem[i]*Uccrf10[i] - np2csj_c10[i]*Ucs10[i] - age_up*Ucs10[i]
  deriv(Ucnc10[]) <- desist*Wcnc10[i] - contact*recruit_c[i]*Ucnc10[i]*sum(C10_cl_mix[,i]) + np2nc_c10[i]*Ucs10[i] + r2a*end_rem[i]*Uccrr10[i] + r2nc*end_rem[i]*(Uccrf10[i] + Uccrr10[i]) + end_cust10[i]*Uccs10[i] - (prior2rem_c10[i] + prior2cust_c10[i])*Ucnc10[i] - age_up*Ucnc10[i]
  deriv(Uccrf10[]) <- np2rem_c10[i]*Ucs10[i] + deter*Wccrf10[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf10[i] - end_rem[i]*Uccrf10[i] - age_up*Uccrf10[i]
  deriv(Uccrr10[]) <- prior2rem_c10[i]*Ucnc10[i] + deter*Wccrr10[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr10[i] - end_rem[i]*Uccrr10[i] - age_up*Uccrf10[i]
  deriv(Uccs10[]) <- np2cust_c10[i]*Ucs10[i] + prior2cust_c10[i]*Ucnc10[i] + end_rem[i]*r2c*Uccr10[i] + deter*Wccs10[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs10[i] - end_cust10[i]*Uccs10[i] - age_up*Uccs10[i]
  deriv(Wcn10[]) <- contact*recruit_c[i]*Ucn10[i]*sum(C10_cl_mix[,i]) - desist*Wcn10[i] - contact*associate_c[i]*Wcn10[i]*sum(C10_surv_mix[,i]) - polcon_wc10[i]*Wcn10[i] - age_up*Wcn10[i]
  deriv(Wcs10[]) <- contact*recruit_c[i]*Ucs10[i]*sum(C10_cl_mix[,i]) - desist*Wcs10[i] + contact*associate_c[i]*Wcn10[i]*sum(C10_surv_mix[,i]) + polcon_wc10[i]*Wcn10[i] + r2a*end_rem[i]*Wccrf10[i] - np2csj_c10[i]*Wcs10[i] - age_up*Wcs10[i]
  deriv(Wcnc10[]) <- contact*recruit_c[i]*Ucnc10[i]*sum(C10_cl_mix[,i]) - desist*Wcnc10[i] + np2nc_c10[i]*Wcs10[i] + r2a*end_rem[i]*Wccrr10[i] + r2nc*end_rem[i]*(Wccrf10[i] + Wccrr10[i]) + end_cust10[i]*Wccs10[i] - (prior2rem_c10[i] + prior2cust_c10[i])*Wcnc10[i] - age_up*Wcnc10[i]
  deriv(Wccrf10[]) <- np2rem_c10[i]*Wcs10[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf10[i] - deter*Wccrf10[i] - end_rem[i]*Wccrf10[i] - age_up*Wccrf10[i]
  deriv(Wccrr10[]) <- prior2rem_c10[i]*Wcnc10[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr10[i] - deter*Wccrr10[i] - end_rem[i]*Wccrr10[i] - age_up*Wccrr10[i]
  deriv(Wccs10[]) <- np2cust_c10[i]*Wcs10[i] + prior2cust_c10[i]*Wcnc10[i] + end_rem[i]*r2c*Wccr10[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs10[i] - deter*Wccs10[i] - end_cust10[i]*Wccs10[i] - age_up*Wccs10[i]

  deriv(Uin11[]) <- age_up*Uin10[i] - age_up*Uin11[i] + desist*Win11[i] - contact*recruit_i[i]*Uin11[i]*sum(I11_cl_mix[,i]) - contact*associate_i[i]*Uin11[i]*sum(I11_surv_mix[,i]) - polcon_ui11[i]*Uin11[i]
  deriv(Uis11[]) <- age_up*Uis10[i] + desist*Wis11[i] - contact*recruit_i[i]*Uis11[i]*sum(I11_cl_mix[,i]) + contact*associate_i[i]*Uin11[i]*sum(I11_surv_mix[,i]) + polcon_ui11[i]*Uin11[i] + r2a*end_rem[i]*Uicrf11[i] - np2csj_i11[i]*Uis11[i] - age_up*Uis11[i]
  deriv(Uinc11[]) <- age_up*Uinc10[i] + desist*Winc11[i] - contact*recruit_i[i]*Uinc11[i]*sum(I11_cl_mix[,i]) + np2nc_i11[i]*Uis11[i] + r2a*end_rem[i]*Uicrr11[i] + r2nc*end_rem[i]*(Uicrf11[i] + Uicrr11[i]) + end_cust11[i]*Uics11[i] - (prior2rem_i11[i] + prior2cust_i11[i])*Uinc11[i] - age_up*Uinc11[i]
  deriv(Uicrf11[]) <- age_up*Uicrf10[i] + np2rem_i11[i]*Uis11[i] + deter*Wicrf11[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf11[i] - end_rem[i]*Uicrf11[i] - age_up*Uicrf11[i]
  deriv(Uicrr11[]) <- age_up*Uicrr10[i] + prior2rem_i11[i]*Uinc11[i] + deter*Wicrr11[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr11[i] - end_rem[i]*Uicrr11[i] - age_up*Uicrf11[i]
  deriv(Uics11[]) <- age_up*Uics10[i] + np2cust_i11[i]*Uis11[i] + prior2cust_i11[i]*Uinc11[i] + end_rem[i]*r2c*Uicr11[i] + deter*Wics11[i] - contact*recruit_cust[i]*cl_cust[i]*Uics11[i] - end_cust11[i]*Uics11[i] - age_up*Uics11[i]
  deriv(Win11[]) <- age_up*Win10[i] + contact*recruit_i[i]*Uin11[i]*sum(I11_cl_mix[,i]) - desist*Win11[i] - contact*associate_i[i]*Win11[i]*sum(I11_surv_mix[,i]) - polcon_wi11[i]*Win11[i] - age_up*Win11[i]
  deriv(Wis11[]) <- age_up*Wis10[i] + contact*recruit_i[i]*Uis11[i]*sum(I11_cl_mix[,i]) - desist*Wis11[i] + contact*associate_i[i]*Win11[i]*sum(I11_surv_mix[,i]) + polcon_wi11[i]*Win11[i] + r2a*end_rem[i]*Wicrf11[i] - np2csj_i11[i]*Wis11[i] - age_up*Wis11[i]
  deriv(Winc11[]) <- age_up*Winc10[i] + contact*recruit_i[i]*Uinc11[i]*sum(I11_cl_mix[,i]) - desist*Winc11[i] + np2nc_i11[i]*Wis11[i] + r2a*end_rem[i]*Wicrr11[i] + r2nc*end_rem[i]*(Wicrf11[i] + Wicrr11[i]) + end_cust11[i]*Wics11[i] - (prior2rem_i11[i] + prior2cust_i11[i])*Winc11[i] - age_up*Winc11[i]
  deriv(Wicrf11[]) <- age_up*Wicrf10[i] + np2rem_i11[i]*Wis11[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf11[i] - deter*Wicrf11[i] - end_rem[i]*Wicrf11[i] - age_up*Wicrf11[i]
  deriv(Wicrr11[]) <- age_up*Wicrr10[i] + prior2rem_i11[i]*Winc11[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr11[i] - deter*Wicrr11[i] - end_rem[i]*Wicrr11[i] - age_up*Wicrr11[i]
  deriv(Wics11[]) <- age_up*Wics10[i] + np2cust_i11[i]*Wis11[i] + prior2cust_i11[i]*Winc11[i] + end_rem[i]*r2c*Wicr11[i] + contact*recruit_cust[i]*cl_cust[i]*Uics11[i] - deter*Wics11[i] - end_cust11[i]*Wics11[i] - age_up*Wics11[i]

  deriv(Uen11[]) <- age_up*Uen10[i] - age_up*Uen11[i] + desist*Wen11[i] - contact*recruit_e[i]*Uen11[i]*sum(E11_cl_mix[,i]) - contact*associate_e[i]*Uen11[i]*sum(E11_surv_mix[,i]) - polcon_ue11[i]*Uen11[i]
  deriv(Ues11[]) <- age_up*Ues10[i] + desist*Wes11[i] - contact*recruit_e[i]*Ues11[i]*sum(E11_cl_mix[,i]) + contact*associate_e[i]*Uen11[i]*sum(E11_surv_mix[,i]) + polcon_ue11[i]*Uen11[i] + r2a*end_rem[i]*Uecrf11[i] - np2csj_e11[i]*Ues11[i] - age_up*Ues11[i]
  deriv(Uenc11[]) <- age_up*Uenc10[i] + desist*Wenc11[i] - contact*recruit_e[i]*Uenc11[i]*sum(E11_cl_mix[,i]) + np2nc_e11[i]*Ues11[i] + r2a*end_rem[i]*Uecrr11[i] + r2nc*end_rem[i]*(Uecrf11[i] + Uecrr11[i]) + end_cust11[i]*Uecs11[i] - (prior2rem_e11[i] + prior2cust_e11[i])*Uenc11[i] - age_up*Uenc11[i]
  deriv(Uecrf11[]) <- age_up*Uecrf10[i] + np2rem_e11[i]*Ues11[i] + deter*Wecrf11[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf11[i] - end_rem[i]*Uecrf11[i] - age_up*Uecrf11[i]
  deriv(Uecrr11[]) <- age_up*Uecrr10[i] + prior2rem_e11[i]*Uenc11[i] + deter*Wecrr11[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr11[i] - end_rem[i]*Uecrr11[i] - age_up*Uecrf11[i]
  deriv(Uecs11[]) <- age_up*Uecs10[i] + np2cust_e11[i]*Ues11[i] + prior2cust_e11[i]*Uenc11[i] + end_rem[i]*r2c*Uecr11[i] + deter*Wecs11[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs11[i] - end_cust11[i]*Uecs11[i] - age_up*Uecs11[i]
  deriv(Wen11[]) <- age_up*Wen10[i] + contact*recruit_e[i]*Uen11[i]*sum(E11_cl_mix[,i]) - desist*Wen11[i] - contact*associate_e[i]*Wen11[i]*sum(E11_surv_mix[,i]) - polcon_we11[i]*Wen11[i] - age_up*Wen11[i]
  deriv(Wes11[]) <- age_up*Wes10[i] + contact*recruit_e[i]*Ues11[i]*sum(E11_cl_mix[,i]) - desist*Wes11[i] + contact*associate_e[i]*Wen11[i]*sum(E11_surv_mix[,i]) + polcon_we11[i]*Wen11[i] + r2a*end_rem[i]*Wecrf11[i] - np2csj_e11[i]*Wes11[i] - age_up*Wes11[i]
  deriv(Wenc11[]) <- age_up*Wenc10[i] + contact*recruit_e[i]*Uenc11[i]*sum(E11_cl_mix[,i]) - desist*Wenc11[i] + np2nc_e11[i]*Wes11[i] + r2a*end_rem[i]*Wecrr11[i] + r2nc*end_rem[i]*(Wecrf11[i] + Wecrr11[i]) + end_cust11[i]*Wecs11[i] - (prior2rem_e11[i] + prior2cust_e11[i])*Wenc11[i] - age_up*Wenc11[i]
  deriv(Wecrf11[]) <- age_up*Wecrf10[i] + np2rem_e11[i]*Wes11[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf11[i] - deter*Wecrf11[i] - end_rem[i]*Wecrf11[i] - age_up*Wecrf11[i]
  deriv(Wecrr11[]) <- age_up*Wecrr10[i] + prior2rem_e11[i]*Wenc11[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr11[i] - deter*Wecrr11[i] - end_rem[i]*Wecrr11[i] - age_up*Wecrr11[i]
  deriv(Wecs11[]) <- age_up*Wecs10[i] + np2cust_e11[i]*Wes11[i] + prior2cust_e11[i]*Wenc11[i] + end_rem[i]*r2c*Wecr11[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs11[i] - deter*Wecs11[i] - end_cust11[i]*Wecs11[i] - age_up*Wecs11[i]

  deriv(Ucn11[]) <- age_up*Ucn10[i] - age_up*Ucn11[i] + desist*Wcn11[i] - contact*recruit_c[i]*Ucn11[i]*sum(C11_cl_mix[,i]) - contact*associate_c[i]*Ucn11[i]*sum(C11_surv_mix[,i]) - polcon_uc11[i]*Ucn11[i]
  deriv(Ucs11[]) <- age_up*Ucs10[i] + desist*Wcs11[i] - contact*recruit_c[i]*Ucs11[i]*sum(C11_cl_mix[,i]) + contact*associate_c[i]*Ucn11[i]*sum(C11_surv_mix[,i]) + polcon_uc11[i]*Ucn11[i] + r2a*end_rem[i]*Uccrf11[i] - np2csj_c11[i]*Ucs11[i] - age_up*Ucs11[i]
  deriv(Ucnc11[]) <- age_up*Ucnc10[i] + desist*Wcnc11[i] - contact*recruit_c[i]*Ucnc11[i]*sum(C11_cl_mix[,i]) + np2nc_c11[i]*Ucs11[i] + r2a*end_rem[i]*Uccrr11[i] + r2nc*end_rem[i]*(Uccrf11[i] + Uccrr11[i]) + end_cust11[i]*Uccs11[i] - (prior2rem_c11[i] + prior2cust_c11[i])*Ucnc11[i] - age_up*Ucnc11[i]
  deriv(Uccrf11[]) <- age_up*Uccrf10[i] + np2rem_c11[i]*Ucs11[i] + deter*Wccrf11[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf11[i] - end_rem[i]*Uccrf11[i] - age_up*Uccrf11[i]
  deriv(Uccrr11[]) <- age_up*Uccrr10[i] + prior2rem_c11[i]*Ucnc11[i] + deter*Wccrr11[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr11[i] - end_rem[i]*Uccrr11[i] - age_up*Uccrf11[i]
  deriv(Uccs11[]) <- age_up*Uccs10[i] + np2cust_c11[i]*Ucs11[i] + prior2cust_c11[i]*Ucnc11[i] + end_rem[i]*r2c*Uccr11[i] + deter*Wccs11[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs11[i] - end_cust11[i]*Uccs11[i] - age_up*Uccs11[i]
  deriv(Wcn11[]) <- age_up*Wcn10[i] + contact*recruit_c[i]*Ucn11[i]*sum(C11_cl_mix[,i]) - desist*Wcn11[i] - contact*associate_c[i]*Wcn11[i]*sum(C11_surv_mix[,i]) - polcon_wc11[i]*Wcn11[i] - age_up*Wcn11[i]
  deriv(Wcs11[]) <- age_up*Wcs10[i] + contact*recruit_c[i]*Ucs11[i]*sum(C11_cl_mix[,i]) - desist*Wcs11[i] + contact*associate_c[i]*Wcn11[i]*sum(C11_surv_mix[,i]) + polcon_wc11[i]*Wcn11[i] + r2a*end_rem[i]*Wccrf11[i] - np2csj_c11[i]*Wcs11[i] - age_up*Wcs11[i]
  deriv(Wcnc11[]) <- age_up*Wcnc10[i] + contact*recruit_c[i]*Ucnc11[i]*sum(C11_cl_mix[,i]) - desist*Wcnc11[i] + np2nc_c11[i]*Wcs11[i] + r2a*end_rem[i]*Wccrr11[i] + r2nc*end_rem[i]*(Wccrf11[i] + Wccrr11[i]) + end_cust11[i]*Wccs11[i] - (prior2rem_c11[i] + prior2cust_c11[i])*Wcnc11[i] - age_up*Wcnc11[i]
  deriv(Wccrf11[]) <- age_up*Wccrf10[i] + np2rem_c11[i]*Wcs11[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf11[i] - deter*Wccrf11[i] - end_rem[i]*Wccrf11[i] - age_up*Wccrf11[i]
  deriv(Wccrr11[]) <- age_up*Wccrr10[i] + prior2rem_c11[i]*Wcnc11[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr11[i] - deter*Wccrr11[i] - end_rem[i]*Wccrr11[i] - age_up*Wccrr11[i]
  deriv(Wccs11[]) <- age_up*Wccs10[i] + np2cust_c11[i]*Wcs11[i] + prior2cust_c11[i]*Wcnc11[i] + end_rem[i]*r2c*Wccr11[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs11[i] - deter*Wccs11[i] - end_cust11[i]*Wccs11[i] - age_up*Wccs11[i]



  deriv(Uin12[]) <- age_up*Uin11[i] - age_up*Uin12[i] + desist*Win12[i] - contact*recruit_i[i]*Uin12[i]*sum(I12_cl_mix[,i]) - contact*associate_i[i]*Uin12[i]*sum(I12_surv_mix[,i]) - polcon_ui12[i]*Uin12[i]
  deriv(Uis12[]) <- age_up*Uis11[i] + desist*Wis12[i] - contact*recruit_i[i]*Uis12[i]*sum(I12_cl_mix[,i]) + contact*associate_i[i]*Uin12[i]*sum(I12_surv_mix[,i]) + polcon_ui12[i]*Uin12[i] + r2a*end_rem[i]*Uicrf12[i] - np2csj_i12[i]*Uis12[i] - age_up*Uis12[i]
  deriv(Uinc12[]) <- age_up*Uinc11[i] + desist*Winc12[i] - contact*recruit_i[i]*Uinc12[i]*sum(I12_cl_mix[,i]) + np2nc_i12[i]*Uis12[i] + r2a*end_rem[i]*Uicrr12[i] + r2nc*end_rem[i]*(Uicrf12[i] + Uicrr12[i]) + end_cust12[i]*Uics12[i] - (prior2rem_i12[i] + prior2cust_i12[i])*Uinc12[i] - age_up*Uinc12[i]
  deriv(Uicrf12[]) <- age_up*Uicrf11[i] + np2rem_i12[i]*Uis12[i] + deter*Wicrf12[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf12[i] - end_rem[i]*Uicrf12[i] - age_up*Uicrf12[i]
  deriv(Uicrr12[]) <- age_up*Uicrr11[i] + prior2rem_i12[i]*Uinc12[i] + deter*Wicrr12[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr12[i] - end_rem[i]*Uicrr12[i] - age_up*Uicrf12[i]
  deriv(Uics12[]) <- age_up*Uics11[i] + np2cust_i12[i]*Uis12[i] + prior2cust_i12[i]*Uinc12[i] + end_rem[i]*r2c*Uicr12[i] + deter*Wics12[i] - contact*recruit_cust[i]*cl_cust[i]*Uics12[i] - end_cust12[i]*Uics12[i] - age_up*Uics12[i]
  deriv(Win12[]) <- age_up*Win11[i] + contact*recruit_i[i]*Uin12[i]*sum(I12_cl_mix[,i]) - desist*Win12[i] - contact*associate_i[i]*Win12[i]*sum(I12_surv_mix[,i]) - polcon_wi12[i]*Win12[i] - age_up*Win12[i]
  deriv(Wis12[]) <- age_up*Wis11[i] + contact*recruit_i[i]*Uis12[i]*sum(I12_cl_mix[,i]) - desist*Wis12[i] + contact*associate_i[i]*Win12[i]*sum(I12_surv_mix[,i]) + polcon_wi12[i]*Win12[i] + r2a*end_rem[i]*Wicrf12[i] - np2csj_i12[i]*Wis12[i] - age_up*Wis12[i]
  deriv(Winc12[]) <- age_up*Winc11[i] + contact*recruit_i[i]*Uinc12[i]*sum(I12_cl_mix[,i]) - desist*Winc12[i] + np2nc_i12[i]*Wis12[i] + r2a*end_rem[i]*Wicrr12[i] + r2nc*end_rem[i]*(Wicrf12[i] + Wicrr12[i]) + end_cust12[i]*Wics12[i] - (prior2rem_i12[i] + prior2cust_i12[i])*Winc12[i] - age_up*Winc12[i]
  deriv(Wicrf12[]) <- age_up*Wicrf11[i] + np2rem_i12[i]*Wis12[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf12[i] - deter*Wicrf12[i] - end_rem[i]*Wicrf12[i] - age_up*Wicrf12[i]
  deriv(Wicrr12[]) <- age_up*Wicrr11[i] + prior2rem_i12[i]*Winc12[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr12[i] - deter*Wicrr12[i] - end_rem[i]*Wicrr12[i] - age_up*Wicrr12[i]
  deriv(Wics12[]) <- age_up*Wics11[i] + np2cust_i12[i]*Wis12[i] + prior2cust_i12[i]*Winc12[i] + end_rem[i]*r2c*Wicr12[i] + contact*recruit_cust[i]*cl_cust[i]*Uics12[i] - deter*Wics12[i] - end_cust12[i]*Wics12[i] - age_up*Wics12[i]

  deriv(Uen12[]) <- age_up*Uen11[i] - age_up*Uen12[i] + desist*Wen12[i] - contact*recruit_e[i]*Uen12[i]*sum(E12_cl_mix[,i]) - contact*associate_e[i]*Uen12[i]*sum(E12_surv_mix[,i]) - polcon_ue12[i]*Uen12[i]
  deriv(Ues12[]) <- age_up*Ues11[i] + desist*Wes12[i] - contact*recruit_e[i]*Ues12[i]*sum(E12_cl_mix[,i]) + contact*associate_e[i]*Uen12[i]*sum(E12_surv_mix[,i]) + polcon_ue12[i]*Uen12[i] + r2a*end_rem[i]*Uecrf12[i] - np2csj_e12[i]*Ues12[i] - age_up*Ues12[i]
  deriv(Uenc12[]) <- age_up*Uenc11[i] + desist*Wenc12[i] - contact*recruit_e[i]*Uenc12[i]*sum(E12_cl_mix[,i]) + np2nc_e12[i]*Ues12[i] + r2a*end_rem[i]*Uecrr12[i] + r2nc*end_rem[i]*(Uecrf12[i] + Uecrr12[i]) + end_cust12[i]*Uecs12[i] - (prior2rem_e12[i] + prior2cust_e12[i])*Uenc12[i] - age_up*Uenc12[i]
  deriv(Uecrf12[]) <- age_up*Uecrf11[i] + np2rem_e12[i]*Ues12[i] + deter*Wecrf12[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf12[i] - end_rem[i]*Uecrf12[i] - age_up*Uecrf12[i]
  deriv(Uecrr12[]) <- age_up*Uecrr11[i] + prior2rem_e12[i]*Uenc12[i] + deter*Wecrr12[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr12[i] - end_rem[i]*Uecrr12[i] - age_up*Uecrf12[i]
  deriv(Uecs12[]) <- age_up*Uecs11[i] + np2cust_e12[i]*Ues12[i] + prior2cust_e12[i]*Uenc12[i] + end_rem[i]*r2c*Uecr12[i] + deter*Wecs12[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs12[i] - end_cust12[i]*Uecs12[i] - age_up*Uecs12[i]
  deriv(Wen12[]) <- age_up*Wen11[i] + contact*recruit_e[i]*Uen12[i]*sum(E12_cl_mix[,i]) - desist*Wen12[i] - contact*associate_e[i]*Wen12[i]*sum(E12_surv_mix[,i]) - polcon_we12[i]*Wen12[i] - age_up*Wen12[i]
  deriv(Wes12[]) <- age_up*Wes11[i] + contact*recruit_e[i]*Ues12[i]*sum(E12_cl_mix[,i]) - desist*Wes12[i] + contact*associate_e[i]*Wen12[i]*sum(E12_surv_mix[,i]) + polcon_we12[i]*Wen12[i] + r2a*end_rem[i]*Wecrf12[i] - np2csj_e12[i]*Wes12[i] - age_up*Wes12[i]
  deriv(Wenc12[]) <- age_up*Wenc11[i] + contact*recruit_e[i]*Uenc12[i]*sum(E12_cl_mix[,i]) - desist*Wenc12[i] + np2nc_e12[i]*Wes12[i] + r2a*end_rem[i]*Wecrr12[i] + r2nc*end_rem[i]*(Wecrf12[i] + Wecrr12[i]) + end_cust12[i]*Wecs12[i] - (prior2rem_e12[i] + prior2cust_e12[i])*Wenc12[i] - age_up*Wenc12[i]
  deriv(Wecrf12[]) <- age_up*Wecrf11[i] + np2rem_e12[i]*Wes12[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf12[i] - deter*Wecrf12[i] - end_rem[i]*Wecrf12[i] - age_up*Wecrf12[i]
  deriv(Wecrr12[]) <- age_up*Wecrr11[i] + prior2rem_e12[i]*Wenc12[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr12[i] - deter*Wecrr12[i] - end_rem[i]*Wecrr12[i] - age_up*Wecrr12[i]
  deriv(Wecs12[]) <- age_up*Wecs11[i] + np2cust_e12[i]*Wes12[i] + prior2cust_e12[i]*Wenc12[i] + end_rem[i]*r2c*Wecr12[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs12[i] - deter*Wecs12[i] - end_cust12[i]*Wecs12[i] - age_up*Wecs12[i]

  deriv(Ucn12[]) <- age_up*Ucn11[i] - age_up*Ucn12[i] + desist*Wcn12[i] - contact*recruit_c[i]*Ucn12[i]*sum(C12_cl_mix[,i]) - contact*associate_c[i]*Ucn12[i]*sum(C12_surv_mix[,i]) - polcon_uc12[i]*Ucn12[i]
  deriv(Ucs12[]) <- age_up*Ucs11[i] + desist*Wcs12[i] - contact*recruit_c[i]*Ucs12[i]*sum(C12_cl_mix[,i]) + contact*associate_c[i]*Ucn12[i]*sum(C12_surv_mix[,i]) + polcon_uc12[i]*Ucn12[i] + r2a*end_rem[i]*Uccrf12[i] - np2csj_c12[i]*Ucs12[i] - age_up*Ucs12[i]
  deriv(Ucnc12[]) <- age_up*Ucnc11[i] + desist*Wcnc12[i] - contact*recruit_c[i]*Ucnc12[i]*sum(C12_cl_mix[,i]) + np2nc_c12[i]*Ucs12[i] + r2a*end_rem[i]*Uccrr12[i] + r2nc*end_rem[i]*(Uccrf12[i] + Uccrr12[i]) + end_cust12[i]*Uccs12[i] - (prior2rem_c12[i] + prior2cust_c12[i])*Ucnc12[i] - age_up*Ucnc12[i]
  deriv(Uccrf12[]) <- age_up*Uccrf11[i] + np2rem_c12[i]*Ucs12[i] + deter*Wccrf12[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf12[i] - end_rem[i]*Uccrf12[i] - age_up*Uccrf12[i]
  deriv(Uccrr12[]) <- age_up*Uccrr11[i] + prior2rem_c12[i]*Ucnc12[i] + deter*Wccrr12[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr12[i] - end_rem[i]*Uccrr12[i] - age_up*Uccrf12[i]
  deriv(Uccs12[]) <- age_up*Uccs11[i] + np2cust_c12[i]*Ucs12[i] + prior2cust_c12[i]*Ucnc12[i] + end_rem[i]*r2c*Uccr12[i] + deter*Wccs12[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs12[i] - end_cust12[i]*Uccs12[i] - age_up*Uccs12[i]
  deriv(Wcn12[]) <- age_up*Wcn11[i] + contact*recruit_c[i]*Ucn12[i]*sum(C12_cl_mix[,i]) - desist*Wcn12[i] - contact*associate_c[i]*Wcn12[i]*sum(C12_surv_mix[,i]) - polcon_wc12[i]*Wcn12[i] - age_up*Wcn12[i]
  deriv(Wcs12[]) <- age_up*Wcs11[i] + contact*recruit_c[i]*Ucs12[i]*sum(C12_cl_mix[,i]) - desist*Wcs12[i] + contact*associate_c[i]*Wcn12[i]*sum(C12_surv_mix[,i]) + polcon_wc12[i]*Wcn12[i] + r2a*end_rem[i]*Wccrf12[i] - np2csj_c12[i]*Wcs12[i] - age_up*Wcs12[i]
  deriv(Wcnc12[]) <- age_up*Wcnc11[i] + contact*recruit_c[i]*Ucnc12[i]*sum(C12_cl_mix[,i]) - desist*Wcnc12[i] + np2nc_c12[i]*Wcs12[i] + r2a*end_rem[i]*Wccrr12[i] + r2nc*end_rem[i]*(Wccrf12[i] + Wccrr12[i]) + end_cust12[i]*Wccs12[i] - (prior2rem_c12[i] + prior2cust_c12[i])*Wcnc12[i] - age_up*Wcnc12[i]
  deriv(Wccrf12[]) <- age_up*Wccrf11[i] + np2rem_c12[i]*Wcs12[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf12[i] - deter*Wccrf12[i] - end_rem[i]*Wccrf12[i] - age_up*Wccrf12[i]
  deriv(Wccrr12[]) <- age_up*Wccrr11[i] + prior2rem_c12[i]*Wcnc12[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr12[i] - deter*Wccrr12[i] - end_rem[i]*Wccrr12[i] - age_up*Wccrr12[i]
  deriv(Wccs12[]) <- age_up*Wccs11[i] + np2cust_c12[i]*Wcs12[i] + prior2cust_c12[i]*Wcnc12[i] + end_rem[i]*r2c*Wccr12[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs12[i] - deter*Wccs12[i] - end_cust12[i]*Wccs12[i] - age_up*Wccs12[i]




  deriv(Uin13[]) <- age_up*Uin12[i] - age_up*Uin13[i] + desist*Win13[i] - contact*recruit_i[i]*Uin13[i]*sum(I13_cl_mix[,i]) - contact*associate_i[i]*Uin13[i]*sum(I13_surv_mix[,i]) - polcon_ui13[i]*Uin13[i]
  deriv(Uis13[]) <- age_up*Uis12[i] + desist*Wis13[i] - contact*recruit_i[i]*Uis13[i]*sum(I13_cl_mix[,i]) + contact*associate_i[i]*Uin13[i]*sum(I13_surv_mix[,i]) + polcon_ui13[i]*Uin13[i] + r2a*end_rem[i]*Uicrf13[i] - np2csj_i13[i]*Uis13[i] - age_up*Uis13[i]
  deriv(Uinc13[]) <- age_up*Uinc12[i] + desist*Winc13[i] - contact*recruit_i[i]*Uinc13[i]*sum(I13_cl_mix[,i]) + np2nc_i13[i]*Uis13[i] + r2a*end_rem[i]*Uicrr13[i] + r2nc*end_rem[i]*(Uicrf13[i] + Uicrr13[i]) + end_cust13[i]*Uics13[i] - (prior2rem_i13[i] + prior2cust_i13[i])*Uinc13[i] - age_up*Uinc13[i]
  deriv(Uicrf13[]) <- age_up*Uicrf12[i] + np2rem_i13[i]*Uis13[i] + deter*Wicrf13[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf13[i] - end_rem[i]*Uicrf13[i] - age_up*Uicrf13[i]
  deriv(Uicrr13[]) <- age_up*Uicrr12[i] + prior2rem_i13[i]*Uinc13[i] + deter*Wicrr13[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr13[i] - end_rem[i]*Uicrr13[i] - age_up*Uicrf13[i]
  deriv(Uics13[]) <- age_up*Uics12[i] + np2cust_i13[i]*Uis13[i] + prior2cust_i13[i]*Uinc13[i] + end_rem[i]*r2c*Uicr13[i] + deter*Wics13[i] - contact*recruit_cust[i]*cl_cust[i]*Uics13[i] - end_cust13[i]*Uics13[i] - age_up*Uics13[i]
  deriv(Win13[]) <- age_up*Win12[i] + contact*recruit_i[i]*Uin13[i]*sum(I13_cl_mix[,i]) - desist*Win13[i] - contact*associate_i[i]*Win13[i]*sum(I13_surv_mix[,i]) - polcon_wi13[i]*Win13[i] - age_up*Win13[i]
  deriv(Wis13[]) <- age_up*Wis12[i] + contact*recruit_i[i]*Uis13[i]*sum(I13_cl_mix[,i]) - desist*Wis13[i] + contact*associate_i[i]*Win13[i]*sum(I13_surv_mix[,i]) + polcon_wi13[i]*Win13[i] + r2a*end_rem[i]*Wicrf13[i] - np2csj_i13[i]*Wis13[i] - age_up*Wis13[i]
  deriv(Winc13[]) <- age_up*Winc12[i] + contact*recruit_i[i]*Uinc13[i]*sum(I13_cl_mix[,i]) - desist*Winc13[i] + np2nc_i13[i]*Wis13[i] + r2a*end_rem[i]*Wicrr13[i] + r2nc*end_rem[i]*(Wicrf13[i] + Wicrr13[i]) + end_cust13[i]*Wics13[i] - (prior2rem_i13[i] + prior2cust_i13[i])*Winc13[i] - age_up*Winc13[i]
  deriv(Wicrf13[]) <- age_up*Wicrf12[i] + np2rem_i13[i]*Wis13[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf13[i] - deter*Wicrf13[i] - end_rem[i]*Wicrf13[i] - age_up*Wicrf13[i]
  deriv(Wicrr13[]) <- age_up*Wicrr12[i] + prior2rem_i13[i]*Winc13[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr13[i] - deter*Wicrr13[i] - end_rem[i]*Wicrr13[i] - age_up*Wicrr13[i]
  deriv(Wics13[]) <- age_up*Wics12[i] + np2cust_i13[i]*Wis13[i] + prior2cust_i13[i]*Winc13[i] + end_rem[i]*r2c*Wicr13[i] + contact*recruit_cust[i]*cl_cust[i]*Uics13[i] - deter*Wics13[i] - end_cust13[i]*Wics13[i] - age_up*Wics13[i]

  deriv(Uen13[]) <- age_up*Uen12[i] - age_up*Uen13[i] + desist*Wen13[i] - contact*recruit_e[i]*Uen13[i]*sum(E13_cl_mix[,i]) - contact*associate_e[i]*Uen13[i]*sum(E13_surv_mix[,i]) - polcon_ue13[i]*Uen13[i]
  deriv(Ues13[]) <- age_up*Ues12[i] + desist*Wes13[i] - contact*recruit_e[i]*Ues13[i]*sum(E13_cl_mix[,i]) + contact*associate_e[i]*Uen13[i]*sum(E13_surv_mix[,i]) + polcon_ue13[i]*Uen13[i] + r2a*end_rem[i]*Uecrf13[i] - np2csj_e13[i]*Ues13[i] - age_up*Ues13[i]
  deriv(Uenc13[]) <- age_up*Uenc12[i] + desist*Wenc13[i] - contact*recruit_e[i]*Uenc13[i]*sum(E13_cl_mix[,i]) + np2nc_e13[i]*Ues13[i] + r2a*end_rem[i]*Uecrr13[i] + r2nc*end_rem[i]*(Uecrf13[i] + Uecrr13[i]) + end_cust13[i]*Uecs13[i] - (prior2rem_e13[i] + prior2cust_e13[i])*Uenc13[i] - age_up*Uenc13[i]
  deriv(Uecrf13[]) <- age_up*Uecrf12[i] + np2rem_e13[i]*Ues13[i] + deter*Wecrf13[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf13[i] - end_rem[i]*Uecrf13[i] - age_up*Uecrf13[i]
  deriv(Uecrr13[]) <- age_up*Uecrr12[i] + prior2rem_e13[i]*Uenc13[i] + deter*Wecrr13[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr13[i] - end_rem[i]*Uecrr13[i] - age_up*Uecrf13[i]
  deriv(Uecs13[]) <- age_up*Uecs12[i] + np2cust_e13[i]*Ues13[i] + prior2cust_e13[i]*Uenc13[i] + end_rem[i]*r2c*Uecr13[i] + deter*Wecs13[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs13[i] - end_cust13[i]*Uecs13[i] - age_up*Uecs13[i]
  deriv(Wen13[]) <- age_up*Wen12[i] + contact*recruit_e[i]*Uen13[i]*sum(E13_cl_mix[,i]) - desist*Wen13[i] - contact*associate_e[i]*Wen13[i]*sum(E13_surv_mix[,i]) - polcon_we13[i]*Wen13[i] - age_up*Wen13[i]
  deriv(Wes13[]) <- age_up*Wes12[i] + contact*recruit_e[i]*Ues13[i]*sum(E13_cl_mix[,i]) - desist*Wes13[i] + contact*associate_e[i]*Wen13[i]*sum(E13_surv_mix[,i]) + polcon_we13[i]*Wen13[i] + r2a*end_rem[i]*Wecrf13[i] - np2csj_e13[i]*Wes13[i] - age_up*Wes13[i]
  deriv(Wenc13[]) <- age_up*Wenc12[i] + contact*recruit_e[i]*Uenc13[i]*sum(E13_cl_mix[,i]) - desist*Wenc13[i] + np2nc_e13[i]*Wes13[i] + r2a*end_rem[i]*Wecrr13[i] + r2nc*end_rem[i]*(Wecrf13[i] + Wecrr13[i]) + end_cust13[i]*Wecs13[i] - (prior2rem_e13[i] + prior2cust_e13[i])*Wenc13[i] - age_up*Wenc13[i]
  deriv(Wecrf13[]) <- age_up*Wecrf12[i] + np2rem_e13[i]*Wes13[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf13[i] - deter*Wecrf13[i] - end_rem[i]*Wecrf13[i] - age_up*Wecrf13[i]
  deriv(Wecrr13[]) <- age_up*Wecrr12[i] + prior2rem_e13[i]*Wenc13[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr13[i] - deter*Wecrr13[i] - end_rem[i]*Wecrr13[i] - age_up*Wecrr13[i]
  deriv(Wecs13[]) <- age_up*Wecs12[i] + np2cust_e13[i]*Wes13[i] + prior2cust_e13[i]*Wenc13[i] + end_rem[i]*r2c*Wecr13[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs13[i] - deter*Wecs13[i] - end_cust13[i]*Wecs13[i] - age_up*Wecs13[i]

  deriv(Ucn13[]) <- age_up*Ucn12[i] - age_up*Ucn13[i] + desist*Wcn13[i] - contact*recruit_c[i]*Ucn13[i]*sum(C13_cl_mix[,i]) - contact*associate_c[i]*Ucn13[i]*sum(C13_surv_mix[,i]) - polcon_uc13[i]*Ucn13[i]
  deriv(Ucs13[]) <- age_up*Ucs12[i] + desist*Wcs13[i] - contact*recruit_c[i]*Ucs13[i]*sum(C13_cl_mix[,i]) + contact*associate_c[i]*Ucn13[i]*sum(C13_surv_mix[,i]) + polcon_uc13[i]*Ucn13[i] + r2a*end_rem[i]*Uccrf13[i] - np2csj_c13[i]*Ucs13[i] - age_up*Ucs13[i]
  deriv(Ucnc13[]) <- age_up*Ucnc12[i] + desist*Wcnc13[i] - contact*recruit_c[i]*Ucnc13[i]*sum(C13_cl_mix[,i]) + np2nc_c13[i]*Ucs13[i] + r2a*end_rem[i]*Uccrr13[i] + r2nc*end_rem[i]*(Uccrf13[i] + Uccrr13[i]) + end_cust13[i]*Uccs13[i] - (prior2rem_c13[i] + prior2cust_c13[i])*Ucnc13[i] - age_up*Ucnc13[i]
  deriv(Uccrf13[]) <- age_up*Uccrf12[i] + np2rem_c13[i]*Ucs13[i] + deter*Wccrf13[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf13[i] - end_rem[i]*Uccrf13[i] - age_up*Uccrf13[i]
  deriv(Uccrr13[]) <- age_up*Uccrr12[i] + prior2rem_c13[i]*Ucnc13[i] + deter*Wccrr13[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr13[i] - end_rem[i]*Uccrr13[i] - age_up*Uccrf13[i]
  deriv(Uccs13[]) <- age_up*Uccs12[i] + np2cust_c13[i]*Ucs13[i] + prior2cust_c13[i]*Ucnc13[i] + end_rem[i]*r2c*Uccr13[i] + deter*Wccs13[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs13[i] - end_cust13[i]*Uccs13[i] - age_up*Uccs13[i]
  deriv(Wcn13[]) <- age_up*Wcn12[i] + contact*recruit_c[i]*Ucn13[i]*sum(C13_cl_mix[,i]) - desist*Wcn13[i] - contact*associate_c[i]*Wcn13[i]*sum(C13_surv_mix[,i]) - polcon_wc13[i]*Wcn13[i] - age_up*Wcn13[i]
  deriv(Wcs13[]) <- age_up*Wcs12[i] + contact*recruit_c[i]*Ucs13[i]*sum(C13_cl_mix[,i]) - desist*Wcs13[i] + contact*associate_c[i]*Wcn13[i]*sum(C13_surv_mix[,i]) + polcon_wc13[i]*Wcn13[i] + r2a*end_rem[i]*Wccrf13[i] - np2csj_c13[i]*Wcs13[i] - age_up*Wcs13[i]
  deriv(Wcnc13[]) <- age_up*Wcnc12[i] + contact*recruit_c[i]*Ucnc13[i]*sum(C13_cl_mix[,i]) - desist*Wcnc13[i] + np2nc_c13[i]*Wcs13[i] + r2a*end_rem[i]*Wccrr13[i] + r2nc*end_rem[i]*(Wccrf13[i] + Wccrr13[i]) + end_cust13[i]*Wccs13[i] - (prior2rem_c13[i] + prior2cust_c13[i])*Wcnc13[i] - age_up*Wcnc13[i]
  deriv(Wccrf13[]) <- age_up*Wccrf12[i] + np2rem_c13[i]*Wcs13[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf13[i] - deter*Wccrf13[i] - end_rem[i]*Wccrf13[i] - age_up*Wccrf13[i]
  deriv(Wccrr13[]) <- age_up*Wccrr12[i] + prior2rem_c13[i]*Wcnc13[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr13[i] - deter*Wccrr13[i] - end_rem[i]*Wccrr13[i] - age_up*Wccrr13[i]
  deriv(Wccs13[]) <- age_up*Wccs12[i] + np2cust_c13[i]*Wcs13[i] + prior2cust_c13[i]*Wcnc13[i] + end_rem[i]*r2c*Wccr13[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs13[i] - deter*Wccs13[i] - end_cust13[i]*Wccs13[i] - age_up*Wccs13[i]




  deriv(Uin14[]) <- age_up*Uin13[i] - age_up*Uin14[i] + desist*Win14[i] - contact*recruit_i[i]*Uin14[i]*sum(I14_cl_mix[,i]) - contact*associate_i[i]*Uin14[i]*sum(I14_surv_mix[,i]) - polcon_ui14[i]*Uin14[i]
  deriv(Uis14[]) <- age_up*Uis13[i] + desist*Wis14[i] - contact*recruit_i[i]*Uis14[i]*sum(I14_cl_mix[,i]) + contact*associate_i[i]*Uin14[i]*sum(I14_surv_mix[,i]) + polcon_ui14[i]*Uin14[i] + r2a*end_rem[i]*Uicrf14[i] - np2csj_i14[i]*Uis14[i] - age_up*Uis14[i]
  deriv(Uinc14[]) <- age_up*Uinc13[i] + desist*Winc14[i] - contact*recruit_i[i]*Uinc14[i]*sum(I14_cl_mix[,i]) + np2nc_i14[i]*Uis14[i] + r2a*end_rem[i]*Uicrr14[i] + r2nc*end_rem[i]*(Uicrf14[i] + Uicrr14[i]) + end_cust14[i]*Uics14[i] - (prior2rem_i14[i] + prior2cust_i14[i])*Uinc14[i] - age_up*Uinc14[i]
  deriv(Uicrf14[]) <- age_up*Uicrf13[i] + np2rem_i14[i]*Uis14[i] + deter*Wicrf14[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf14[i] - end_rem[i]*Uicrf14[i] - age_up*Uicrf14[i]
  deriv(Uicrr14[]) <- age_up*Uicrr13[i] + prior2rem_i14[i]*Uinc14[i] + deter*Wicrr14[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr14[i] - end_rem[i]*Uicrr14[i] - age_up*Uicrf14[i]
  deriv(Uics14[]) <- age_up*Uics13[i] + np2cust_i14[i]*Uis14[i] + prior2cust_i14[i]*Uinc14[i] + end_rem[i]*r2c*Uicr14[i] + deter*Wics14[i] - contact*recruit_cust[i]*cl_cust[i]*Uics14[i] - end_cust14[i]*Uics14[i] - age_up*Uics14[i]
  deriv(Win14[]) <- age_up*Win13[i] + contact*recruit_i[i]*Uin14[i]*sum(I14_cl_mix[,i]) - desist*Win14[i] - contact*associate_i[i]*Win14[i]*sum(I14_surv_mix[,i]) - polcon_wi14[i]*Win14[i] - age_up*Win14[i]
  deriv(Wis14[]) <- age_up*Wis13[i] + contact*recruit_i[i]*Uis14[i]*sum(I14_cl_mix[,i]) - desist*Wis14[i] + contact*associate_i[i]*Win14[i]*sum(I14_surv_mix[,i]) + polcon_wi14[i]*Win14[i] + r2a*end_rem[i]*Wicrf14[i] - np2csj_i14[i]*Wis14[i] - age_up*Wis14[i]
  deriv(Winc14[]) <- age_up*Winc13[i] + contact*recruit_i[i]*Uinc14[i]*sum(I14_cl_mix[,i]) - desist*Winc14[i] + np2nc_i14[i]*Wis14[i] + r2a*end_rem[i]*Wicrr14[i] + r2nc*end_rem[i]*(Wicrf14[i] + Wicrr14[i]) + end_cust14[i]*Wics14[i] - (prior2rem_i14[i] + prior2cust_i14[i])*Winc14[i] - age_up*Winc14[i]
  deriv(Wicrf14[]) <- age_up*Wicrf13[i] + np2rem_i14[i]*Wis14[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf14[i] - deter*Wicrf14[i] - end_rem[i]*Wicrf14[i] - age_up*Wicrf14[i]
  deriv(Wicrr14[]) <- age_up*Wicrr13[i] + prior2rem_i14[i]*Winc14[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr14[i] - deter*Wicrr14[i] - end_rem[i]*Wicrr14[i] - age_up*Wicrr14[i]
  deriv(Wics14[]) <- age_up*Wics13[i] + np2cust_i14[i]*Wis14[i] + prior2cust_i14[i]*Winc14[i] + end_rem[i]*r2c*Wicr14[i] + contact*recruit_cust[i]*cl_cust[i]*Uics14[i] - deter*Wics14[i] - end_cust14[i]*Wics14[i] - age_up*Wics14[i]

  deriv(Uen14[]) <- age_up*Uen13[i] - age_up*Uen14[i] + desist*Wen14[i] - contact*recruit_e[i]*Uen14[i]*sum(E14_cl_mix[,i]) - contact*associate_e[i]*Uen14[i]*sum(E14_surv_mix[,i]) - polcon_ue14[i]*Uen14[i]
  deriv(Ues14[]) <- age_up*Ues13[i] + desist*Wes14[i] - contact*recruit_e[i]*Ues14[i]*sum(E14_cl_mix[,i]) + contact*associate_e[i]*Uen14[i]*sum(E14_surv_mix[,i]) + polcon_ue14[i]*Uen14[i] + r2a*end_rem[i]*Uecrf14[i] - np2csj_e14[i]*Ues14[i] - age_up*Ues14[i]
  deriv(Uenc14[]) <- age_up*Uenc13[i] + desist*Wenc14[i] - contact*recruit_e[i]*Uenc14[i]*sum(E14_cl_mix[,i]) + np2nc_e14[i]*Ues14[i] + r2a*end_rem[i]*Uecrr14[i] + r2nc*end_rem[i]*(Uecrf14[i] + Uecrr14[i]) + end_cust14[i]*Uecs14[i] - (prior2rem_e14[i] + prior2cust_e14[i])*Uenc14[i] - age_up*Uenc14[i]
  deriv(Uecrf14[]) <- age_up*Uecrf13[i] + np2rem_e14[i]*Ues14[i] + deter*Wecrf14[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf14[i] - end_rem[i]*Uecrf14[i] - age_up*Uecrf14[i]
  deriv(Uecrr14[]) <- age_up*Uecrr13[i] + prior2rem_e14[i]*Uenc14[i] + deter*Wecrr14[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr14[i] - end_rem[i]*Uecrr14[i] - age_up*Uecrf14[i]
  deriv(Uecs14[]) <- age_up*Uecs13[i] + np2cust_e14[i]*Ues14[i] + prior2cust_e14[i]*Uenc14[i] + end_rem[i]*r2c*Uecr14[i] + deter*Wecs14[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs14[i] - end_cust14[i]*Uecs14[i] - age_up*Uecs14[i]
  deriv(Wen14[]) <- age_up*Wen13[i] + contact*recruit_e[i]*Uen14[i]*sum(E14_cl_mix[,i]) - desist*Wen14[i] - contact*associate_e[i]*Wen14[i]*sum(E14_surv_mix[,i]) - polcon_we14[i]*Wen14[i] - age_up*Wen14[i]
  deriv(Wes14[]) <- age_up*Wes13[i] + contact*recruit_e[i]*Ues14[i]*sum(E14_cl_mix[,i]) - desist*Wes14[i] + contact*associate_e[i]*Wen14[i]*sum(E14_surv_mix[,i]) + polcon_we14[i]*Wen14[i] + r2a*end_rem[i]*Wecrf14[i] - np2csj_e14[i]*Wes14[i] - age_up*Wes14[i]
  deriv(Wenc14[]) <- age_up*Wenc13[i] + contact*recruit_e[i]*Uenc14[i]*sum(E14_cl_mix[,i]) - desist*Wenc14[i] + np2nc_e14[i]*Wes14[i] + r2a*end_rem[i]*Wecrr14[i] + r2nc*end_rem[i]*(Wecrf14[i] + Wecrr14[i]) + end_cust14[i]*Wecs14[i] - (prior2rem_e14[i] + prior2cust_e14[i])*Wenc14[i] - age_up*Wenc14[i]
  deriv(Wecrf14[]) <- age_up*Wecrf13[i] + np2rem_e14[i]*Wes14[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf14[i] - deter*Wecrf14[i] - end_rem[i]*Wecrf14[i] - age_up*Wecrf14[i]
  deriv(Wecrr14[]) <- age_up*Wecrr13[i] + prior2rem_e14[i]*Wenc14[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr14[i] - deter*Wecrr14[i] - end_rem[i]*Wecrr14[i] - age_up*Wecrr14[i]
  deriv(Wecs14[]) <- age_up*Wecs13[i] + np2cust_e14[i]*Wes14[i] + prior2cust_e14[i]*Wenc14[i] + end_rem[i]*r2c*Wecr14[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs14[i] - deter*Wecs14[i] - end_cust14[i]*Wecs14[i] - age_up*Wecs14[i]

  deriv(Ucn14[]) <- age_up*Ucn13[i] - age_up*Ucn14[i] + desist*Wcn14[i] - contact*recruit_c[i]*Ucn14[i]*sum(C14_cl_mix[,i]) - contact*associate_c[i]*Ucn14[i]*sum(C14_surv_mix[,i]) - polcon_uc14[i]*Ucn14[i]
  deriv(Ucs14[]) <- age_up*Ucs13[i] + desist*Wcs14[i] - contact*recruit_c[i]*Ucs14[i]*sum(C14_cl_mix[,i]) + contact*associate_c[i]*Ucn14[i]*sum(C14_surv_mix[,i]) + polcon_uc14[i]*Ucn14[i] + r2a*end_rem[i]*Uccrf14[i] - np2csj_c14[i]*Ucs14[i] - age_up*Ucs14[i]
  deriv(Ucnc14[]) <- age_up*Ucnc13[i] + desist*Wcnc14[i] - contact*recruit_c[i]*Ucnc14[i]*sum(C14_cl_mix[,i]) + np2nc_c14[i]*Ucs14[i] + r2a*end_rem[i]*Uccrr14[i] + r2nc*end_rem[i]*(Uccrf14[i] + Uccrr14[i]) + end_cust14[i]*Uccs14[i] - (prior2rem_c14[i] + prior2cust_c14[i])*Ucnc14[i] - age_up*Ucnc14[i]
  deriv(Uccrf14[]) <- age_up*Uccrf13[i] + np2rem_c14[i]*Ucs14[i] + deter*Wccrf14[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf14[i] - end_rem[i]*Uccrf14[i] - age_up*Uccrf14[i]
  deriv(Uccrr14[]) <- age_up*Uccrr13[i] + prior2rem_c14[i]*Ucnc14[i] + deter*Wccrr14[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr14[i] - end_rem[i]*Uccrr14[i] - age_up*Uccrf14[i]
  deriv(Uccs14[]) <- age_up*Uccs13[i] + np2cust_c14[i]*Ucs14[i] + prior2cust_c14[i]*Ucnc14[i] + end_rem[i]*r2c*Uccr14[i] + deter*Wccs14[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs14[i] - end_cust14[i]*Uccs14[i] - age_up*Uccs14[i]
  deriv(Wcn14[]) <- age_up*Wcn13[i] + contact*recruit_c[i]*Ucn14[i]*sum(C14_cl_mix[,i]) - desist*Wcn14[i] - contact*associate_c[i]*Wcn14[i]*sum(C14_surv_mix[,i]) - polcon_wc14[i]*Wcn14[i] - age_up*Wcn14[i]
  deriv(Wcs14[]) <- age_up*Wcs13[i] + contact*recruit_c[i]*Ucs14[i]*sum(C14_cl_mix[,i]) - desist*Wcs14[i] + contact*associate_c[i]*Wcn14[i]*sum(C14_surv_mix[,i]) + polcon_wc14[i]*Wcn14[i] + r2a*end_rem[i]*Wccrf14[i] - np2csj_c14[i]*Wcs14[i] - age_up*Wcs14[i]
  deriv(Wcnc14[]) <- age_up*Wcnc13[i] + contact*recruit_c[i]*Ucnc14[i]*sum(C14_cl_mix[,i]) - desist*Wcnc14[i] + np2nc_c14[i]*Wcs14[i] + r2a*end_rem[i]*Wccrr14[i] + r2nc*end_rem[i]*(Wccrf14[i] + Wccrr14[i]) + end_cust14[i]*Wccs14[i] - (prior2rem_c14[i] + prior2cust_c14[i])*Wcnc14[i] - age_up*Wcnc14[i]
  deriv(Wccrf14[]) <- age_up*Wccrf13[i] + np2rem_c14[i]*Wcs14[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf14[i] - deter*Wccrf14[i] - end_rem[i]*Wccrf14[i] - age_up*Wccrf14[i]
  deriv(Wccrr14[]) <- age_up*Wccrr13[i] + prior2rem_c14[i]*Wcnc14[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr14[i] - deter*Wccrr14[i] - end_rem[i]*Wccrr14[i] - age_up*Wccrr14[i]
  deriv(Wccs14[]) <- age_up*Wccs13[i] + np2cust_c14[i]*Wcs14[i] + prior2cust_c14[i]*Wcnc14[i] + end_rem[i]*r2c*Wccr14[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs14[i] - deter*Wccs14[i] - end_cust14[i]*Wccs14[i] - age_up*Wccs14[i]




  deriv(Uin15[]) <- age_up*Uin14[i] - age_up*Uin15[i] + desist*Win15[i] - contact*recruit_i[i]*Uin15[i]*sum(I15_cl_mix[,i]) - contact*associate_i[i]*Uin15[i]*sum(I15_surv_mix[,i]) - polcon_ui15[i]*Uin15[i]
  deriv(Uis15[]) <- age_up*Uis14[i] + desist*Wis15[i] - contact*recruit_i[i]*Uis15[i]*sum(I15_cl_mix[,i]) + contact*associate_i[i]*Uin15[i]*sum(I15_surv_mix[,i]) + polcon_ui15[i]*Uin15[i] + r2a*end_rem[i]*Uicrf15[i] - np2csj_i15[i]*Uis15[i] - age_up*Uis15[i]
  deriv(Uinc15[]) <- age_up*Uinc14[i] + desist*Winc15[i] - contact*recruit_i[i]*Uinc15[i]*sum(I15_cl_mix[,i]) + np2nc_i15[i]*Uis15[i] + r2a*end_rem[i]*Uicrr15[i] + r2nc*end_rem[i]*(Uicrf15[i] + Uicrr15[i]) + end_cust15[i]*Uics15[i] - (prior2rem_i15[i] + prior2cust_i15[i])*Uinc15[i] - age_up*Uinc15[i]
  deriv(Uicrf15[]) <- age_up*Uicrf14[i] + np2rem_i15[i]*Uis15[i] + deter*Wicrf15[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf15[i] - end_rem[i]*Uicrf15[i] - age_up*Uicrf15[i]
  deriv(Uicrr15[]) <- age_up*Uicrr14[i] + prior2rem_i15[i]*Uinc15[i] + deter*Wicrr15[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr15[i] - end_rem[i]*Uicrr15[i] - age_up*Uicrf15[i]
  deriv(Uics15[]) <- age_up*Uics14[i] + np2cust_i15[i]*Uis15[i] + prior2cust_i15[i]*Uinc15[i] + end_rem[i]*r2c*Uicr15[i] + deter*Wics15[i] - contact*recruit_cust[i]*cl_cust[i]*Uics15[i] - end_cust15[i]*Uics15[i] - age_up*Uics15[i]
  deriv(Win15[]) <- age_up*Win14[i] + contact*recruit_i[i]*Uin15[i]*sum(I15_cl_mix[,i]) - desist*Win15[i] - contact*associate_i[i]*Win15[i]*sum(I15_surv_mix[,i]) - polcon_wi15[i]*Win15[i] - age_up*Win15[i]
  deriv(Wis15[]) <- age_up*Wis14[i] + contact*recruit_i[i]*Uis15[i]*sum(I15_cl_mix[,i]) - desist*Wis15[i] + contact*associate_i[i]*Win15[i]*sum(I15_surv_mix[,i]) + polcon_wi15[i]*Win15[i] + r2a*end_rem[i]*Wicrf15[i] - np2csj_i15[i]*Wis15[i] - age_up*Wis15[i]
  deriv(Winc15[]) <- age_up*Winc14[i] + contact*recruit_i[i]*Uinc15[i]*sum(I15_cl_mix[,i]) - desist*Winc15[i] + np2nc_i15[i]*Wis15[i] + r2a*end_rem[i]*Wicrr15[i] + r2nc*end_rem[i]*(Wicrf15[i] + Wicrr15[i]) + end_cust15[i]*Wics15[i] - (prior2rem_i15[i] + prior2cust_i15[i])*Winc15[i] - age_up*Winc15[i]
  deriv(Wicrf15[]) <- age_up*Wicrf14[i] + np2rem_i15[i]*Wis15[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf15[i] - deter*Wicrf15[i] - end_rem[i]*Wicrf15[i] - age_up*Wicrf15[i]
  deriv(Wicrr15[]) <- age_up*Wicrr14[i] + prior2rem_i15[i]*Winc15[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr15[i] - deter*Wicrr15[i] - end_rem[i]*Wicrr15[i] - age_up*Wicrr15[i]
  deriv(Wics15[]) <- age_up*Wics14[i] + np2cust_i15[i]*Wis15[i] + prior2cust_i15[i]*Winc15[i] + end_rem[i]*r2c*Wicr15[i] + contact*recruit_cust[i]*cl_cust[i]*Uics15[i] - deter*Wics15[i] - end_cust15[i]*Wics15[i] - age_up*Wics15[i]

  deriv(Uen15[]) <- age_up*Uen14[i] - age_up*Uen15[i] + desist*Wen15[i] - contact*recruit_e[i]*Uen15[i]*sum(E15_cl_mix[,i]) - contact*associate_e[i]*Uen15[i]*sum(E15_surv_mix[,i]) - polcon_ue15[i]*Uen15[i]
  deriv(Ues15[]) <- age_up*Ues14[i] + desist*Wes15[i] - contact*recruit_e[i]*Ues15[i]*sum(E15_cl_mix[,i]) + contact*associate_e[i]*Uen15[i]*sum(E15_surv_mix[,i]) + polcon_ue15[i]*Uen15[i] + r2a*end_rem[i]*Uecrf15[i] - np2csj_e15[i]*Ues15[i] - age_up*Ues15[i]
  deriv(Uenc15[]) <- age_up*Uenc14[i] + desist*Wenc15[i] - contact*recruit_e[i]*Uenc15[i]*sum(E15_cl_mix[,i]) + np2nc_e15[i]*Ues15[i] + r2a*end_rem[i]*Uecrr15[i] + r2nc*end_rem[i]*(Uecrf15[i] + Uecrr15[i]) + end_cust15[i]*Uecs15[i] - (prior2rem_e15[i] + prior2cust_e15[i])*Uenc15[i] - age_up*Uenc15[i]
  deriv(Uecrf15[]) <- age_up*Uecrf14[i] + np2rem_e15[i]*Ues15[i] + deter*Wecrf15[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf15[i] - end_rem[i]*Uecrf15[i] - age_up*Uecrf15[i]
  deriv(Uecrr15[]) <- age_up*Uecrr14[i] + prior2rem_e15[i]*Uenc15[i] + deter*Wecrr15[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr15[i] - end_rem[i]*Uecrr15[i] - age_up*Uecrf15[i]
  deriv(Uecs15[]) <- age_up*Uecs14[i] + np2cust_e15[i]*Ues15[i] + prior2cust_e15[i]*Uenc15[i] + end_rem[i]*r2c*Uecr15[i] + deter*Wecs15[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs15[i] - end_cust15[i]*Uecs15[i] - age_up*Uecs15[i]
  deriv(Wen15[]) <- age_up*Wen14[i] + contact*recruit_e[i]*Uen15[i]*sum(E15_cl_mix[,i]) - desist*Wen15[i] - contact*associate_e[i]*Wen15[i]*sum(E15_surv_mix[,i]) - polcon_we15[i]*Wen15[i] - age_up*Wen15[i]
  deriv(Wes15[]) <- age_up*Wes14[i] + contact*recruit_e[i]*Ues15[i]*sum(E15_cl_mix[,i]) - desist*Wes15[i] + contact*associate_e[i]*Wen15[i]*sum(E15_surv_mix[,i]) + polcon_we15[i]*Wen15[i] + r2a*end_rem[i]*Wecrf15[i] - np2csj_e15[i]*Wes15[i] - age_up*Wes15[i]
  deriv(Wenc15[]) <- age_up*Wenc14[i] + contact*recruit_e[i]*Uenc15[i]*sum(E15_cl_mix[,i]) - desist*Wenc15[i] + np2nc_e15[i]*Wes15[i] + r2a*end_rem[i]*Wecrr15[i] + r2nc*end_rem[i]*(Wecrf15[i] + Wecrr15[i]) + end_cust15[i]*Wecs15[i] - (prior2rem_e15[i] + prior2cust_e15[i])*Wenc15[i] - age_up*Wenc15[i]
  deriv(Wecrf15[]) <- age_up*Wecrf14[i] + np2rem_e15[i]*Wes15[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf15[i] - deter*Wecrf15[i] - end_rem[i]*Wecrf15[i] - age_up*Wecrf15[i]
  deriv(Wecrr15[]) <- age_up*Wecrr14[i] + prior2rem_e15[i]*Wenc15[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr15[i] - deter*Wecrr15[i] - end_rem[i]*Wecrr15[i] - age_up*Wecrr15[i]
  deriv(Wecs15[]) <- age_up*Wecs14[i] + np2cust_e15[i]*Wes15[i] + prior2cust_e15[i]*Wenc15[i] + end_rem[i]*r2c*Wecr15[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs15[i] - deter*Wecs15[i] - end_cust15[i]*Wecs15[i] - age_up*Wecs15[i]

  deriv(Ucn15[]) <- age_up*Ucn14[i] - age_up*Ucn15[i] + desist*Wcn15[i] - contact*recruit_c[i]*Ucn15[i]*sum(C15_cl_mix[,i]) - contact*associate_c[i]*Ucn15[i]*sum(C15_surv_mix[,i]) - polcon_uc15[i]*Ucn15[i]
  deriv(Ucs15[]) <- age_up*Ucs14[i] + desist*Wcs15[i] - contact*recruit_c[i]*Ucs15[i]*sum(C15_cl_mix[,i]) + contact*associate_c[i]*Ucn15[i]*sum(C15_surv_mix[,i]) + polcon_uc15[i]*Ucn15[i] + r2a*end_rem[i]*Uccrf15[i] - np2csj_c15[i]*Ucs15[i] - age_up*Ucs15[i]
  deriv(Ucnc15[]) <- age_up*Ucnc14[i] + desist*Wcnc15[i] - contact*recruit_c[i]*Ucnc15[i]*sum(C15_cl_mix[,i]) + np2nc_c15[i]*Ucs15[i] + r2a*end_rem[i]*Uccrr15[i] + r2nc*end_rem[i]*(Uccrf15[i] + Uccrr15[i]) + end_cust15[i]*Uccs15[i] - (prior2rem_c15[i] + prior2cust_c15[i])*Ucnc15[i] - age_up*Ucnc15[i]
  deriv(Uccrf15[]) <- age_up*Uccrf14[i] + np2rem_c15[i]*Ucs15[i] + deter*Wccrf15[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf15[i] - end_rem[i]*Uccrf15[i] - age_up*Uccrf15[i]
  deriv(Uccrr15[]) <- age_up*Uccrr14[i] + prior2rem_c15[i]*Ucnc15[i] + deter*Wccrr15[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr15[i] - end_rem[i]*Uccrr15[i] - age_up*Uccrf15[i]
  deriv(Uccs15[]) <- age_up*Uccs14[i] + np2cust_c15[i]*Ucs15[i] + prior2cust_c15[i]*Ucnc15[i] + end_rem[i]*r2c*Uccr15[i] + deter*Wccs15[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs15[i] - end_cust15[i]*Uccs15[i] - age_up*Uccs15[i]
  deriv(Wcn15[]) <- age_up*Wcn14[i] + contact*recruit_c[i]*Ucn15[i]*sum(C15_cl_mix[,i]) - desist*Wcn15[i] - contact*associate_c[i]*Wcn15[i]*sum(C15_surv_mix[,i]) - polcon_wc15[i]*Wcn15[i] - age_up*Wcn15[i]
  deriv(Wcs15[]) <- age_up*Wcs14[i] + contact*recruit_c[i]*Ucs15[i]*sum(C15_cl_mix[,i]) - desist*Wcs15[i] + contact*associate_c[i]*Wcn15[i]*sum(C15_surv_mix[,i]) + polcon_wc15[i]*Wcn15[i] + r2a*end_rem[i]*Wccrf15[i] - np2csj_c15[i]*Wcs15[i] - age_up*Wcs15[i]
  deriv(Wcnc15[]) <- age_up*Wcnc14[i] + contact*recruit_c[i]*Ucnc15[i]*sum(C15_cl_mix[,i]) - desist*Wcnc15[i] + np2nc_c15[i]*Wcs15[i] + r2a*end_rem[i]*Wccrr15[i] + r2nc*end_rem[i]*(Wccrf15[i] + Wccrr15[i]) + end_cust15[i]*Wccs15[i] - (prior2rem_c15[i] + prior2cust_c15[i])*Wcnc15[i] - age_up*Wcnc15[i]
  deriv(Wccrf15[]) <- age_up*Wccrf14[i] + np2rem_c15[i]*Wcs15[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf15[i] - deter*Wccrf15[i] - end_rem[i]*Wccrf15[i] - age_up*Wccrf15[i]
  deriv(Wccrr15[]) <- age_up*Wccrr14[i] + prior2rem_c15[i]*Wcnc15[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr15[i] - deter*Wccrr15[i] - end_rem[i]*Wccrr15[i] - age_up*Wccrr15[i]
  deriv(Wccs15[]) <- age_up*Wccs14[i] + np2cust_c15[i]*Wcs15[i] + prior2cust_c15[i]*Wcnc15[i] + end_rem[i]*r2c*Wccr15[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs15[i] - deter*Wccs15[i] - end_cust15[i]*Wccs15[i] - age_up*Wccs15[i]



  deriv(Uin16[]) <- age_up*Uin15[i] - age_up*Uin16[i] + desist*Win16[i] - contact*recruit_i[i]*Uin16[i]*sum(I16_cl_mix[,i]) - contact*associate_i[i]*Uin16[i]*sum(I16_surv_mix[,i]) - polcon_ui16[i]*Uin16[i]
  deriv(Uis16[]) <- age_up*Uis15[i] + desist*Wis16[i] - contact*recruit_i[i]*Uis16[i]*sum(I16_cl_mix[,i]) + contact*associate_i[i]*Uin16[i]*sum(I16_surv_mix[,i]) + polcon_ui16[i]*Uin16[i] + r2a*end_rem[i]*Uicrf16[i] - np2csj_i16[i]*Uis16[i] - age_up*Uis16[i]
  deriv(Uinc16[]) <- age_up*Uinc15[i] + desist*Winc16[i] - contact*recruit_i[i]*Uinc16[i]*sum(I16_cl_mix[,i]) + np2nc_i16[i]*Uis16[i] + r2a*end_rem[i]*Uicrr16[i] + r2nc*end_rem[i]*(Uicrf16[i] + Uicrr16[i]) + end_cust16[i]*Uics16[i] - (prior2rem_i16[i] + prior2cust_i16[i])*Uinc16[i] - age_up*Uinc16[i]
  deriv(Uicrf16[]) <- age_up*Uicrf15[i] + np2rem_i16[i]*Uis16[i] + deter*Wicrf16[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf16[i] - end_rem[i]*Uicrf16[i] - age_up*Uicrf16[i]
  deriv(Uicrr16[]) <- age_up*Uicrr15[i] + prior2rem_i16[i]*Uinc16[i] + deter*Wicrr16[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr16[i] - end_rem[i]*Uicrr16[i] - age_up*Uicrf16[i]
  deriv(Uics16[]) <- age_up*Uics15[i] + np2cust_i16[i]*Uis16[i] + prior2cust_i16[i]*Uinc16[i] + end_rem[i]*r2c*Uicr16[i] + deter*Wics16[i] - contact*recruit_cust[i]*cl_cust[i]*Uics16[i] - end_cust16[i]*Uics16[i] - age_up*Uics16[i]
  deriv(Win16[]) <- age_up*Win15[i] + contact*recruit_i[i]*Uin16[i]*sum(I16_cl_mix[,i]) - desist*Win16[i] - contact*associate_i[i]*Win16[i]*sum(I16_surv_mix[,i]) - polcon_wi16[i]*Win16[i] - age_up*Win16[i]
  deriv(Wis16[]) <- age_up*Wis15[i] + contact*recruit_i[i]*Uis16[i]*sum(I16_cl_mix[,i]) - desist*Wis16[i] + contact*associate_i[i]*Win16[i]*sum(I16_surv_mix[,i]) + polcon_wi16[i]*Win16[i] + r2a*end_rem[i]*Wicrf16[i] - np2csj_i16[i]*Wis16[i] - age_up*Wis16[i]
  deriv(Winc16[]) <- age_up*Winc15[i] + contact*recruit_i[i]*Uinc16[i]*sum(I16_cl_mix[,i]) - desist*Winc16[i] + np2nc_i16[i]*Wis16[i] + r2a*end_rem[i]*Wicrr16[i] + r2nc*end_rem[i]*(Wicrf16[i] + Wicrr16[i]) + end_cust16[i]*Wics16[i] - (prior2rem_i16[i] + prior2cust_i16[i])*Winc16[i] - age_up*Winc16[i]
  deriv(Wicrf16[]) <- age_up*Wicrf15[i] + np2rem_i16[i]*Wis16[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf16[i] - deter*Wicrf16[i] - end_rem[i]*Wicrf16[i] - age_up*Wicrf16[i]
  deriv(Wicrr16[]) <- age_up*Wicrr15[i] + prior2rem_i16[i]*Winc16[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr16[i] - deter*Wicrr16[i] - end_rem[i]*Wicrr16[i] - age_up*Wicrr16[i]
  deriv(Wics16[]) <- age_up*Wics15[i] + np2cust_i16[i]*Wis16[i] + prior2cust_i16[i]*Winc16[i] + end_rem[i]*r2c*Wicr16[i] + contact*recruit_cust[i]*cl_cust[i]*Uics16[i] - deter*Wics16[i] - end_cust16[i]*Wics16[i] - age_up*Wics16[i]

  deriv(Uen16[]) <- age_up*Uen15[i] - age_up*Uen16[i] + desist*Wen16[i] - contact*recruit_e[i]*Uen16[i]*sum(E16_cl_mix[,i]) - contact*associate_e[i]*Uen16[i]*sum(E16_surv_mix[,i]) - polcon_ue16[i]*Uen16[i]
  deriv(Ues16[]) <- age_up*Ues15[i] + desist*Wes16[i] - contact*recruit_e[i]*Ues16[i]*sum(E16_cl_mix[,i]) + contact*associate_e[i]*Uen16[i]*sum(E16_surv_mix[,i]) + polcon_ue16[i]*Uen16[i] + r2a*end_rem[i]*Uecrf16[i] - np2csj_e16[i]*Ues16[i] - age_up*Ues16[i]
  deriv(Uenc16[]) <- age_up*Uenc15[i] + desist*Wenc16[i] - contact*recruit_e[i]*Uenc16[i]*sum(E16_cl_mix[,i]) + np2nc_e16[i]*Ues16[i] + r2a*end_rem[i]*Uecrr16[i] + r2nc*end_rem[i]*(Uecrf16[i] + Uecrr16[i]) + end_cust16[i]*Uecs16[i] - (prior2rem_e16[i] + prior2cust_e16[i])*Uenc16[i] - age_up*Uenc16[i]
  deriv(Uecrf16[]) <- age_up*Uecrf15[i] + np2rem_e16[i]*Ues16[i] + deter*Wecrf16[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf16[i] - end_rem[i]*Uecrf16[i] - age_up*Uecrf16[i]
  deriv(Uecrr16[]) <- age_up*Uecrr15[i] + prior2rem_e16[i]*Uenc16[i] + deter*Wecrr16[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr16[i] - end_rem[i]*Uecrr16[i] - age_up*Uecrf16[i]
  deriv(Uecs16[]) <- age_up*Uecs15[i] + np2cust_e16[i]*Ues16[i] + prior2cust_e16[i]*Uenc16[i] + end_rem[i]*r2c*Uecr16[i] + deter*Wecs16[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs16[i] - end_cust16[i]*Uecs16[i] - age_up*Uecs16[i]
  deriv(Wen16[]) <- age_up*Wen15[i] + contact*recruit_e[i]*Uen16[i]*sum(E16_cl_mix[,i]) - desist*Wen16[i] - contact*associate_e[i]*Wen16[i]*sum(E16_surv_mix[,i]) - polcon_we16[i]*Wen16[i] - age_up*Wen16[i]
  deriv(Wes16[]) <- age_up*Wes15[i] + contact*recruit_e[i]*Ues16[i]*sum(E16_cl_mix[,i]) - desist*Wes16[i] + contact*associate_e[i]*Wen16[i]*sum(E16_surv_mix[,i]) + polcon_we16[i]*Wen16[i] + r2a*end_rem[i]*Wecrf16[i] - np2csj_e16[i]*Wes16[i] - age_up*Wes16[i]
  deriv(Wenc16[]) <- age_up*Wenc15[i] + contact*recruit_e[i]*Uenc16[i]*sum(E16_cl_mix[,i]) - desist*Wenc16[i] + np2nc_e16[i]*Wes16[i] + r2a*end_rem[i]*Wecrr16[i] + r2nc*end_rem[i]*(Wecrf16[i] + Wecrr16[i]) + end_cust16[i]*Wecs16[i] - (prior2rem_e16[i] + prior2cust_e16[i])*Wenc16[i] - age_up*Wenc16[i]
  deriv(Wecrf16[]) <- age_up*Wecrf15[i] + np2rem_e16[i]*Wes16[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf16[i] - deter*Wecrf16[i] - end_rem[i]*Wecrf16[i] - age_up*Wecrf16[i]
  deriv(Wecrr16[]) <- age_up*Wecrr15[i] + prior2rem_e16[i]*Wenc16[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr16[i] - deter*Wecrr16[i] - end_rem[i]*Wecrr16[i] - age_up*Wecrr16[i]
  deriv(Wecs16[]) <- age_up*Wecs15[i] + np2cust_e16[i]*Wes16[i] + prior2cust_e16[i]*Wenc16[i] + end_rem[i]*r2c*Wecr16[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs16[i] - deter*Wecs16[i] - end_cust16[i]*Wecs16[i] - age_up*Wecs16[i]

  deriv(Ucn16[]) <- age_up*Ucn15[i] - age_up*Ucn16[i] + desist*Wcn16[i] - contact*recruit_c[i]*Ucn16[i]*sum(C16_cl_mix[,i]) - contact*associate_c[i]*Ucn16[i]*sum(C16_surv_mix[,i]) - polcon_uc16[i]*Ucn16[i]
  deriv(Ucs16[]) <- age_up*Ucs15[i] + desist*Wcs16[i] - contact*recruit_c[i]*Ucs16[i]*sum(C16_cl_mix[,i]) + contact*associate_c[i]*Ucn16[i]*sum(C16_surv_mix[,i]) + polcon_uc16[i]*Ucn16[i] + r2a*end_rem[i]*Uccrf16[i] - np2csj_c16[i]*Ucs16[i] - age_up*Ucs16[i]
  deriv(Ucnc16[]) <- age_up*Ucnc15[i] + desist*Wcnc16[i] - contact*recruit_c[i]*Ucnc16[i]*sum(C16_cl_mix[,i]) + np2nc_c16[i]*Ucs16[i] + r2a*end_rem[i]*Uccrr16[i] + r2nc*end_rem[i]*(Uccrf16[i] + Uccrr16[i]) + end_cust16[i]*Uccs16[i] - (prior2rem_c16[i] + prior2cust_c16[i])*Ucnc16[i] - age_up*Ucnc16[i]
  deriv(Uccrf16[]) <- age_up*Uccrf15[i] + np2rem_c16[i]*Ucs16[i] + deter*Wccrf16[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf16[i] - end_rem[i]*Uccrf16[i] - age_up*Uccrf16[i]
  deriv(Uccrr16[]) <- age_up*Uccrr15[i] + prior2rem_c16[i]*Ucnc16[i] + deter*Wccrr16[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr16[i] - end_rem[i]*Uccrr16[i] - age_up*Uccrf16[i]
  deriv(Uccs16[]) <- age_up*Uccs15[i] + np2cust_c16[i]*Ucs16[i] + prior2cust_c16[i]*Ucnc16[i] + end_rem[i]*r2c*Uccr16[i] + deter*Wccs16[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs16[i] - end_cust16[i]*Uccs16[i] - age_up*Uccs16[i]
  deriv(Wcn16[]) <- age_up*Wcn15[i] + contact*recruit_c[i]*Ucn16[i]*sum(C16_cl_mix[,i]) - desist*Wcn16[i] - contact*associate_c[i]*Wcn16[i]*sum(C16_surv_mix[,i]) - polcon_wc16[i]*Wcn16[i] - age_up*Wcn16[i]
  deriv(Wcs16[]) <- age_up*Wcs15[i] + contact*recruit_c[i]*Ucs16[i]*sum(C16_cl_mix[,i]) - desist*Wcs16[i] + contact*associate_c[i]*Wcn16[i]*sum(C16_surv_mix[,i]) + polcon_wc16[i]*Wcn16[i] + r2a*end_rem[i]*Wccrf16[i] - np2csj_c16[i]*Wcs16[i] - age_up*Wcs16[i]
  deriv(Wcnc16[]) <- age_up*Wcnc15[i] + contact*recruit_c[i]*Ucnc16[i]*sum(C16_cl_mix[,i]) - desist*Wcnc16[i] + np2nc_c16[i]*Wcs16[i] + r2a*end_rem[i]*Wccrr16[i] + r2nc*end_rem[i]*(Wccrf16[i] + Wccrr16[i]) + end_cust16[i]*Wccs16[i] - (prior2rem_c16[i] + prior2cust_c16[i])*Wcnc16[i] - age_up*Wcnc16[i]
  deriv(Wccrf16[]) <- age_up*Wccrf15[i] + np2rem_c16[i]*Wcs16[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf16[i] - deter*Wccrf16[i] - end_rem[i]*Wccrf16[i] - age_up*Wccrf16[i]
  deriv(Wccrr16[]) <- age_up*Wccrr15[i] + prior2rem_c16[i]*Wcnc16[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr16[i] - deter*Wccrr16[i] - end_rem[i]*Wccrr16[i] - age_up*Wccrr16[i]
  deriv(Wccs16[]) <- age_up*Wccs15[i] + np2cust_c16[i]*Wcs16[i] + prior2cust_c16[i]*Wcnc16[i] + end_rem[i]*r2c*Wccr16[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs16[i] - deter*Wccs16[i] - end_cust16[i]*Wccs16[i] - age_up*Wccs16[i]


  deriv(Uin17[]) <- age_up*Uin16[i] - age_up*Uin17[i] + desist*Win17[i] - contact*recruit_i[i]*Uin17[i]*sum(I17_cl_mix[,i]) - contact*associate_i[i]*Uin17[i]*sum(I17_surv_mix[,i]) - polcon_ui17[i]*Uin17[i]
  deriv(Uis17[]) <- age_up*Uis16[i] + desist*Wis17[i] - contact*recruit_i[i]*Uis17[i]*sum(I17_cl_mix[,i]) + contact*associate_i[i]*Uin17[i]*sum(I17_surv_mix[,i]) + polcon_ui17[i]*Uin17[i] + r2a*end_rem[i]*Uicrf17[i] - np2csj_i17[i]*Uis17[i] - age_up*Uis17[i]
  deriv(Uinc17[]) <- age_up*Uinc16[i] + desist*Winc17[i] - contact*recruit_i[i]*Uinc17[i]*sum(I17_cl_mix[,i]) + np2nc_i17[i]*Uis17[i] + r2a*end_rem[i]*Uicrr17[i] + r2nc*end_rem[i]*(Uicrf17[i] + Uicrr17[i]) + end_cust17[i]*Uics17[i] - (prior2rem_i17[i] + prior2cust_i17[i])*Uinc17[i] - age_up*Uinc17[i]
  deriv(Uicrf17[]) <- age_up*Uicrf16[i] + np2rem_i17[i]*Uis17[i] + deter*Wicrf17[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrf17[i] - end_rem[i]*Uicrf17[i] - age_up*Uicrf17[i]
  deriv(Uicrr17[]) <- age_up*Uicrr16[i] + prior2rem_i17[i]*Uinc17[i] + deter*Wicrr17[i] - contact*recruit_cust[i]*cl_cust[i]*Uicrr17[i] - end_rem[i]*Uicrr17[i] - age_up*Uicrf17[i]
  deriv(Uics17[]) <- age_up*Uics16[i] + np2cust_i17[i]*Uis17[i] + prior2cust_i17[i]*Uinc17[i] + end_rem[i]*r2c*Uicr17[i] + deter*Wics17[i] - contact*recruit_cust[i]*cl_cust[i]*Uics17[i] - end_cust17[i]*Uics17[i] - age_up*Uics17[i]
  deriv(Win17[]) <- age_up*Win16[i] + contact*recruit_i[i]*Uin17[i]*sum(I17_cl_mix[,i]) - desist*Win17[i] - contact*associate_i[i]*Win17[i]*sum(I17_surv_mix[,i]) - polcon_wi17[i]*Win17[i] - age_up*Win17[i]
  deriv(Wis17[]) <- age_up*Wis16[i] + contact*recruit_i[i]*Uis17[i]*sum(I17_cl_mix[,i]) - desist*Wis17[i] + contact*associate_i[i]*Win17[i]*sum(I17_surv_mix[,i]) + polcon_wi17[i]*Win17[i] + r2a*end_rem[i]*Wicrf17[i] - np2csj_i17[i]*Wis17[i] - age_up*Wis17[i]
  deriv(Winc17[]) <- age_up*Winc16[i] + contact*recruit_i[i]*Uinc17[i]*sum(I17_cl_mix[,i]) - desist*Winc17[i] + np2nc_i17[i]*Wis17[i] + r2a*end_rem[i]*Wicrr17[i] + r2nc*end_rem[i]*(Wicrf17[i] + Wicrr17[i]) + end_cust17[i]*Wics17[i] - (prior2rem_i17[i] + prior2cust_i17[i])*Winc17[i] - age_up*Winc17[i]
  deriv(Wicrf17[]) <- age_up*Wicrf16[i] + np2rem_i17[i]*Wis17[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrf17[i] - deter*Wicrf17[i] - end_rem[i]*Wicrf17[i] - age_up*Wicrf17[i]
  deriv(Wicrr17[]) <- age_up*Wicrr16[i] + prior2rem_i17[i]*Winc17[i] + contact*recruit_cust[i]*cl_cust[i]*Uicrr17[i] - deter*Wicrr17[i] - end_rem[i]*Wicrr17[i] - age_up*Wicrr17[i]
  deriv(Wics17[]) <- age_up*Wics16[i] + np2cust_i17[i]*Wis17[i] + prior2cust_i17[i]*Winc17[i] + end_rem[i]*r2c*Wicr17[i] + contact*recruit_cust[i]*cl_cust[i]*Uics17[i] - deter*Wics17[i] - end_cust17[i]*Wics17[i] - age_up*Wics17[i]

  deriv(Uen17[]) <- age_up*Uen16[i] - age_up*Uen17[i] + desist*Wen17[i] - contact*recruit_e[i]*Uen17[i]*sum(E17_cl_mix[,i]) - contact*associate_e[i]*Uen17[i]*sum(E17_surv_mix[,i]) - polcon_ue17[i]*Uen17[i]
  deriv(Ues17[]) <- age_up*Ues16[i] + desist*Wes17[i] - contact*recruit_e[i]*Ues17[i]*sum(E17_cl_mix[,i]) + contact*associate_e[i]*Uen17[i]*sum(E17_surv_mix[,i]) + polcon_ue17[i]*Uen17[i] + r2a*end_rem[i]*Uecrf17[i] - np2csj_e17[i]*Ues17[i] - age_up*Ues17[i]
  deriv(Uenc17[]) <- age_up*Uenc16[i] + desist*Wenc17[i] - contact*recruit_e[i]*Uenc17[i]*sum(E17_cl_mix[,i]) + np2nc_e17[i]*Ues17[i] + r2a*end_rem[i]*Uecrr17[i] + r2nc*end_rem[i]*(Uecrf17[i] + Uecrr17[i]) + end_cust17[i]*Uecs17[i] - (prior2rem_e17[i] + prior2cust_e17[i])*Uenc17[i] - age_up*Uenc17[i]
  deriv(Uecrf17[]) <- age_up*Uecrf16[i] + np2rem_e17[i]*Ues17[i] + deter*Wecrf17[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrf17[i] - end_rem[i]*Uecrf17[i] - age_up*Uecrf17[i]
  deriv(Uecrr17[]) <- age_up*Uecrr16[i] + prior2rem_e17[i]*Uenc17[i] + deter*Wecrr17[i] - contact*recruit_cust[i]*cl_cust[i]*Uecrr17[i] - end_rem[i]*Uecrr17[i] - age_up*Uecrf17[i]
  deriv(Uecs17[]) <- age_up*Uecs16[i] + np2cust_e17[i]*Ues17[i] + prior2cust_e17[i]*Uenc17[i] + end_rem[i]*r2c*Uecr17[i] + deter*Wecs17[i] - contact*recruit_cust[i]*cl_cust[i]*Uecs17[i] - end_cust17[i]*Uecs17[i] - age_up*Uecs17[i]
  deriv(Wen17[]) <- age_up*Wen16[i] + contact*recruit_e[i]*Uen17[i]*sum(E17_cl_mix[,i]) - desist*Wen17[i] - contact*associate_e[i]*Wen17[i]*sum(E17_surv_mix[,i]) - polcon_we17[i]*Wen17[i] - age_up*Wen17[i]
  deriv(Wes17[]) <- age_up*Wes16[i] + contact*recruit_e[i]*Ues17[i]*sum(E17_cl_mix[,i]) - desist*Wes17[i] + contact*associate_e[i]*Wen17[i]*sum(E17_surv_mix[,i]) + polcon_we17[i]*Wen17[i] + r2a*end_rem[i]*Wecrf17[i] - np2csj_e17[i]*Wes17[i] - age_up*Wes17[i]
  deriv(Wenc17[]) <- age_up*Wenc16[i] + contact*recruit_e[i]*Uenc17[i]*sum(E17_cl_mix[,i]) - desist*Wenc17[i] + np2nc_e17[i]*Wes17[i] + r2a*end_rem[i]*Wecrr17[i] + r2nc*end_rem[i]*(Wecrf17[i] + Wecrr17[i]) + end_cust17[i]*Wecs17[i] - (prior2rem_e17[i] + prior2cust_e17[i])*Wenc17[i] - age_up*Wenc17[i]
  deriv(Wecrf17[]) <- age_up*Wecrf16[i] + np2rem_e17[i]*Wes17[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrf17[i] - deter*Wecrf17[i] - end_rem[i]*Wecrf17[i] - age_up*Wecrf17[i]
  deriv(Wecrr17[]) <- age_up*Wecrr16[i] + prior2rem_e17[i]*Wenc17[i] + contact*recruit_cust[i]*cl_cust[i]*Uecrr17[i] - deter*Wecrr17[i] - end_rem[i]*Wecrr17[i] - age_up*Wecrr17[i]
  deriv(Wecs17[]) <- age_up*Wecs16[i] + np2cust_e17[i]*Wes17[i] + prior2cust_e17[i]*Wenc17[i] + end_rem[i]*r2c*Wecr17[i] + contact*recruit_cust[i]*cl_cust[i]*Uecs17[i] - deter*Wecs17[i] - end_cust17[i]*Wecs17[i] - age_up*Wecs17[i]

  deriv(Ucn17[]) <- age_up*Ucn16[i] - age_up*Ucn17[i] + desist*Wcn17[i] - contact*recruit_c[i]*Ucn17[i]*sum(C17_cl_mix[,i]) - contact*associate_c[i]*Ucn17[i]*sum(C17_surv_mix[,i]) - polcon_uc17[i]*Ucn17[i]
  deriv(Ucs17[]) <- age_up*Ucs16[i] + desist*Wcs17[i] - contact*recruit_c[i]*Ucs17[i]*sum(C17_cl_mix[,i]) + contact*associate_c[i]*Ucn17[i]*sum(C17_surv_mix[,i]) + polcon_uc17[i]*Ucn17[i] + r2a*end_rem[i]*Uccrf17[i] - np2csj_c17[i]*Ucs17[i] - age_up*Ucs17[i]
  deriv(Ucnc17[]) <- age_up*Ucnc16[i] + desist*Wcnc17[i] - contact*recruit_c[i]*Ucnc17[i]*sum(C17_cl_mix[,i]) + np2nc_c17[i]*Ucs17[i] + r2a*end_rem[i]*Uccrr17[i] + r2nc*end_rem[i]*(Uccrf17[i] + Uccrr17[i]) + end_cust17[i]*Uccs17[i] - (prior2rem_c17[i] + prior2cust_c17[i])*Ucnc17[i] - age_up*Ucnc17[i]
  deriv(Uccrf17[]) <- age_up*Uccrf16[i] + np2rem_c17[i]*Ucs17[i] + deter*Wccrf17[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrf17[i] - end_rem[i]*Uccrf17[i] - age_up*Uccrf17[i]
  deriv(Uccrr17[]) <- age_up*Uccrr16[i] + prior2rem_c17[i]*Ucnc17[i] + deter*Wccrr17[i] - contact*recruit_cust[i]*cl_cust[i]*Uccrr17[i] - end_rem[i]*Uccrr17[i] - age_up*Uccrf17[i]
  deriv(Uccs17[]) <- age_up*Uccs16[i] + np2cust_c17[i]*Ucs17[i] + prior2cust_c17[i]*Ucnc17[i] + end_rem[i]*r2c*Uccr17[i] + deter*Wccs17[i] - contact*recruit_cust[i]*cl_cust[i]*Uccs17[i] - end_cust17[i]*Uccs17[i] - age_up*Uccs17[i]
  deriv(Wcn17[]) <- age_up*Wcn16[i] + contact*recruit_c[i]*Ucn17[i]*sum(C17_cl_mix[,i]) - desist*Wcn17[i] - contact*associate_c[i]*Wcn17[i]*sum(C17_surv_mix[,i]) - polcon_wc17[i]*Wcn17[i] - age_up*Wcn17[i]
  deriv(Wcs17[]) <- age_up*Wcs16[i] + contact*recruit_c[i]*Ucs17[i]*sum(C17_cl_mix[,i]) - desist*Wcs17[i] + contact*associate_c[i]*Wcn17[i]*sum(C17_surv_mix[,i]) + polcon_wc17[i]*Wcn17[i] + r2a*end_rem[i]*Wccrf17[i] - np2csj_c17[i]*Wcs17[i] - age_up*Wcs17[i]
  deriv(Wcnc17[]) <- age_up*Wcnc16[i] + contact*recruit_c[i]*Ucnc17[i]*sum(C17_cl_mix[,i]) - desist*Wcnc17[i] + np2nc_c17[i]*Wcs17[i] + r2a*end_rem[i]*Wccrr17[i] + r2nc*end_rem[i]*(Wccrf17[i] + Wccrr17[i]) + end_cust17[i]*Wccs17[i] - (prior2rem_c17[i] + prior2cust_c17[i])*Wcnc17[i] - age_up*Wcnc17[i]
  deriv(Wccrf17[]) <- age_up*Wccrf16[i] + np2rem_c17[i]*Wcs17[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrf17[i] - deter*Wccrf17[i] - end_rem[i]*Wccrf17[i] - age_up*Wccrf17[i]
  deriv(Wccrr17[]) <- age_up*Wccrr16[i] + prior2rem_c17[i]*Wcnc17[i] + contact*recruit_cust[i]*cl_cust[i]*Uccrr17[i] - deter*Wccrr17[i] - end_rem[i]*Wccrr17[i] - age_up*Wccrr17[i]
  deriv(Wccs17[]) <- age_up*Wccs16[i] + np2cust_c17[i]*Wcs17[i] + prior2cust_c17[i]*Wcnc17[i] + end_rem[i]*r2c*Wccr17[i] + contact*recruit_cust[i]*cl_cust[i]*Uccs17[i] - deter*Wccs17[i] - end_cust17[i]*Wccs17[i] - age_up*Wccs17[i]


  ##############################################################################################################################
  ##############################################################################################################################
  ##############################################################################################################################




  ######also bad ish########################################################################################################################

  np2csj_i10[] <- np2rem_i10[i] + np2nc_i10[i] + np2cust_i10[i]
  np2csj_e10[] <- np2rem_e10[i] + np2nc_e10[i] + np2cust_e10[i]
  np2csj_c10[] <- np2rem_c10[i] + np2nc_c10[i] + np2cust_c10[i]
  np2csj_i11[] <- np2rem_i11[i] + np2nc_i11[i] + np2cust_i11[i]
  np2csj_e11[] <- np2rem_e11[i] + np2nc_e11[i] + np2cust_e11[i]
  np2csj_c11[] <- np2rem_c11[i] + np2nc_c11[i] + np2cust_c11[i]
  np2csj_i12[] <- np2rem_i12[i] + np2nc_i12[i] + np2cust_i12[i]
  np2csj_e12[] <- np2rem_e12[i] + np2nc_e12[i] + np2cust_e12[i]
  np2csj_c12[] <- np2rem_c12[i] + np2nc_c12[i] + np2cust_c12[i]
  np2csj_i13[] <- np2rem_i13[i] + np2nc_i13[i] + np2cust_i13[i]
  np2csj_e13[] <- np2rem_e13[i] + np2nc_e13[i] + np2cust_e13[i]
  np2csj_c13[] <- np2rem_c13[i] + np2nc_c13[i] + np2cust_c13[i]
  np2csj_i14[] <- np2rem_i14[i] + np2nc_i14[i] + np2cust_i14[i]
  np2csj_e14[] <- np2rem_e14[i] + np2nc_e14[i] + np2cust_e14[i]
  np2csj_c14[] <- np2rem_c14[i] + np2nc_c14[i] + np2cust_c14[i]
  np2csj_i15[] <- np2rem_i15[i] + np2nc_i15[i] + np2cust_i15[i]
  np2csj_e15[] <- np2rem_e15[i] + np2nc_e15[i] + np2cust_e15[i]
  np2csj_c15[] <- np2rem_c15[i] + np2nc_c15[i] + np2cust_c15[i]
  np2csj_i16[] <- np2rem_i16[i] + np2nc_i16[i] + np2cust_i16[i]
  np2csj_e16[] <- np2rem_e16[i] + np2nc_e16[i] + np2cust_e16[i]
  np2csj_c16[] <- np2rem_c16[i] + np2nc_c16[i] + np2cust_c16[i]
  np2csj_i17[] <- np2rem_i17[i] + np2nc_i17[i] + np2cust_i17[i]
  np2csj_e17[] <- np2rem_e17[i] + np2nc_e17[i] + np2cust_e17[i]
  np2csj_c17[] <- np2rem_c17[i] + np2nc_c17[i] + np2cust_c17[i]

  ##############################################################################################################################
  # setting COMMUNITY MIXING - note that no one outside of jail mixes with those inside # # #   # # #
###############################################################################################################################

 ##############################################################################################################################
 # preferences across class and age
##############################################################################################################################

  #####################################
  pI10I10 <- sum(I10[])/sum(N[]) + sum(I11[])/sum(N[])*(1-beta) + sum(I12[])/sum(N[])*(1-beta^2) + sum(I13[])/sum(N[])*(1-beta^3) + sum(I14[])/sum(N[])*(1-beta^4) + sum(I15[])/sum(N[])*(1-beta^5) + sum(I16[])/sum(N[])*(1-beta^6) + sum(I17[])/sum(N[])*(1-beta^7) + sum(E10[])/sum(N[])*(1-alpha) + sum(E11[])/sum(N[])*(1-(beta*alpha)) + sum(E12[])/sum(N[])*(1-(beta^2)*alpha) + sum(E13[])/sum(N[])*(1-(beta^3)*alpha) + sum(E14[])/sum(N[])*(1-(beta^4)*alpha) + sum(E15[])/sum(N[])*(1-(beta^5)*alpha) + sum(E16[])/sum(N[])*(1-(beta^6)*alpha) + sum(E17[])/sum(N[])*(1-(beta^7)*alpha) + sum(C10[])/sum(N[])*(1-alpha^2) + sum(C11[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C12[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C13[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(C14[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(C15[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(C16[])/sum(N[])*(1-(beta^6)*(alpha^2)) + sum(C17[])/sum(N[])*(1-(beta^7)*(alpha^2))
  pI10I11 <- sum(I11[])/sum(N[])*beta
  pI10I12 <- sum(I12[])/sum(N[])*(beta^2)
  pI10I13 <- sum(I13[])/sum(N[])*(beta^3)
  pI10I14 <- sum(I14[])/sum(N[])*(beta^4)
  pI10I15 <- sum(I15[])/sum(N[])*(beta^5)
  pI10I16 <- sum(I16[])/sum(N[])*(beta^6)
  pI10I17 <- sum(I17[])/sum(N[])*(beta^7)

 pI10E10 <- sum(E10[])/sum(N[])*alpha
 pI10E11 <- sum(E11[])/sum(N[])*beta*alpha
 pI10E12 <- sum(E12[])/sum(N[])*(beta^2)*alpha
 pI10E13 <- sum(E13[])/sum(N[])*(beta^3)*alpha
 pI10E14 <- sum(E14[])/sum(N[])*(beta^4)*alpha
 pI10E15 <- sum(E15[])/sum(N[])*(beta^5)*alpha
 pI10E16 <- sum(E16[])/sum(N[])*(beta^6)*alpha
 pI10E17 <- sum(E17[])/sum(N[])*(beta^7)*alpha

 pI10C10 <- sum(C10[])/sum(N[])*(alpha^2)
 pI10C11 <- sum(C11[])/sum(N[])*beta*(alpha^2)
 pI10C12 <- sum(C12[])/sum(N[])*(beta^2)*(alpha^2)
 pI10C13 <- sum(C13[])/sum(N[])*(beta^3)*(alpha^2)
 pI10C14 <- sum(C14[])/sum(N[])*(beta^4)*(alpha^2)
 pI10C15 <- sum(C15[])/sum(N[])*(beta^5)*(alpha^2)
 pI10C16 <- sum(C16[])/sum(N[])*(beta^6)*(alpha^2)
 pI10C17 <- sum(C17[])/sum(N[])*(beta^7)*(alpha^2)


  #####################################
 pI11I10 <- sum(I10[])/sum(N[])*beta
 pI11I11 <- sum(I11[])/sum(N[]) + sum(I10[])/sum(N[])*(1-beta) + sum(I12[])/sum(N[])*(1-beta) + sum(I13[])/sum(N[])*(1-(beta^2)) + sum(I14[])/sum(N[])*(1-(beta^3)) + sum(I15[])/sum(N[])*(1-(beta^4)) + sum(I16[])/sum(N[])*(1-(beta^5)) + sum(I17[])/sum(N[])*(1-(beta^6)) + sum(E10[])/sum(N[])*(1-beta*alpha) + sum(E11[])/sum(N[])*(1-alpha) + sum(E12[])/sum(N[])*(1-(beta*alpha)) + sum(E13[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^6)*alpha)) + sum(C10[])/sum(N[])*(1-beta*(alpha^2)) + sum(C11[])/sum(N[])*(1-(alpha^2)) + sum(C12[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C13[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(C14[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(C15[])/sum(N[])*(1-((beta^4)*(alpha^2))) + sum(C16[])/sum(N[])*(1-((beta^5)*(alpha^2))) + sum(C17[])/sum(N[])*(1-((beta^6)*(alpha^2)))
 pI11I12 <- sum(I12[])/sum(N[])*beta
 pI11I13 <- sum(I13[])/sum(N[])*(beta^2)
 pI11I14 <- sum(I14[])/sum(N[])*(beta^3)
 pI11I15 <- sum(I15[])/sum(N[])*(beta^4)
 pI11I16 <- sum(I16[])/sum(N[])*(beta^5)
 pI11I17 <- sum(I17[])/sum(N[])*(beta^6)

 pI11E10 <- sum(E10[])/sum(N[])*beta*alpha
 pI11E11 <- sum(E11[])/sum(N[])*alpha
 pI11E12 <- sum(E12[])/sum(N[])*beta*alpha
 pI11E13 <- sum(E13[])/sum(N[])*(beta^2)*alpha
 pI11E14 <- sum(E14[])/sum(N[])*(beta^3)*alpha
 pI11E15 <- sum(E15[])/sum(N[])*(beta^4)*alpha
 pI11E16 <- sum(E16[])/sum(N[])*(beta^5)*alpha
 pI11E17 <- sum(E17[])/sum(N[])*(beta^6)*alpha


 pI11C10 <- sum(C10[])/sum(N[])*beta*(alpha^2)
 pI11C11 <- sum(C11[])/sum(N[])*(alpha^2)
 pI11C12 <- sum(C12[])/sum(N[])*beta*(alpha^2)
 pI11C13 <- sum(C13[])/sum(N[])*(beta^2)*(alpha^2)
 pI11C14 <- sum(C14[])/sum(N[])*(beta^3)*(alpha^2)
 pI11C15 <- sum(C15[])/sum(N[])*(beta^4)*(alpha^2)
 pI11C16 <- sum(C16[])/sum(N[])*(beta^5)*(alpha^2)
 pI11C17 <- sum(C17[])/sum(N[])*(beta^6)*(alpha^2)


  #####################################
  pI12I10 <- sum(I10[])/sum(N[])*(beta^2)
  pI12I11 <- sum(I11[])/sum(N[])*beta
  pI12I12 <- sum(I12[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^2)) + sum(I11[])/sum(N[])*(1-beta) + sum(I13[])/sum(N[])*(1-beta) + sum(I14[])/sum(N[])*(1-(beta^2)) + sum(I15[])/sum(N[])*(1-(beta^3)) + sum(I16[])/sum(N[])*(1-(beta^4)) + sum(I17[])/sum(N[])*(1-(beta^5)) + sum(E10[])/sum(N[])*(1-(beta^2)*alpha) + sum(E11[])/sum(N[])*(1-(beta*alpha)) + sum(E12[])/sum(N[])*(1-alpha) + sum(E13[])/sum(N[])*(1-(beta*alpha)) + sum(E14[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^5)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C11[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C12[])/sum(N[])*(1-(alpha^2)) + sum(C13[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C14[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(C15[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(C16[])/sum(N[])*(1-((beta^4)*(alpha^2))) + sum(C17[])/sum(N[])*(1-((beta^5)*(alpha^2)))
  pI12I13 <- sum(I13[])/sum(N[])*beta
  pI12I14 <- sum(I14[])/sum(N[])*(beta^2)
  pI12I15 <- sum(I15[])/sum(N[])*(beta^3)
  pI12I16 <- sum(I16[])/sum(N[])*(beta^4)
  pI12I17 <- sum(I17[])/sum(N[])*(beta^5)

  pI12E10 <- sum(E10[])/sum(N[])*(beta^2)*alpha
  pI12E11 <- sum(E11[])/sum(N[])*beta*alpha
  pI12E12 <- sum(E12[])/sum(N[])*alpha
  pI12E13 <- sum(E13[])/sum(N[])*beta*alpha
  pI12E14 <- sum(E14[])/sum(N[])*(beta^2)*alpha
  pI12E15 <- sum(E15[])/sum(N[])*(beta^3)*alpha
  pI12E16 <- sum(E16[])/sum(N[])*(beta^4)*alpha
  pI12E17 <- sum(E17[])/sum(N[])*(beta^5)*alpha

  pI12C10 <- sum(C10[])/sum(N[])*(beta^2)*(alpha^2)
  pI12C11 <- sum(C11[])/sum(N[])*beta*(alpha^2)
  pI12C12 <- sum(C12[])/sum(N[])*(alpha^2)
  pI12C13 <- sum(C13[])/sum(N[])*beta*(alpha^2)
  pI12C14 <- sum(C14[])/sum(N[])*(beta^2)*(alpha^2)
  pI12C15 <- sum(C15[])/sum(N[])*(beta^3)*(alpha^2)
  pI12C16 <- sum(C16[])/sum(N[])*(beta^4)*(alpha^2)
  pI12C17 <- sum(C17[])/sum(N[])*(beta^5)*(alpha^2)

  #####################################
  pI13I10 <- sum(I10[])/sum(N[])*(beta^3)
  pI13I11 <- sum(I11[])/sum(N[])*(beta^2)
  pI13I12 <- sum(I12[])/sum(N[])*beta
  pI13I13 <- sum(I13[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^3)) + sum(I11[])/sum(N[])*(1-(beta^2)) + sum(I12[])/sum(N[])*(1-beta) + sum(I14[])/sum(N[])*(1-beta) + sum(I15[])/sum(N[])*(1-(beta^2)) + sum(I16[])/sum(N[])*(1-(beta^3)) + sum(I17[])/sum(N[])*(1-(beta^4)) + sum(E10[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E12[])/sum(N[])*(1-(beta*alpha)) + sum(E13[])/sum(N[])*(1-alpha) + sum(E14[])/sum(N[])*(1-(beta*alpha)) + sum(E15[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^4)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(C11[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C12[])/sum(N[])*(1-beta*(alpha^2)) + sum(C13[])/sum(N[])*(1-(alpha^2)) + sum(C14[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C15[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(C16[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(C17[])/sum(N[])*(1-((beta^4)*(alpha^2)))
  pI13I14 <- sum(I14[])/sum(N[])*beta
  pI13I15 <- sum(I15[])/sum(N[])*(beta^2)
  pI13I16 <- sum(I16[])/sum(N[])*(beta^3)
  pI13I17 <- sum(I17[])/sum(N[])*(beta^4)

  pI13E10 <- sum(E10[])/sum(N[])*(beta^3)*alpha
  pI13E11 <- sum(E11[])/sum(N[])*(beta^2)*alpha
  pI13E12 <- sum(E12[])/sum(N[])*beta*alpha
  pI13E13 <- sum(E13[])/sum(N[])*alpha
  pI13E14 <- sum(E14[])/sum(N[])*beta*alpha
  pI13E15 <- sum(E15[])/sum(N[])*(beta^2)*alpha
  pI13E16 <- sum(E16[])/sum(N[])*(beta^3)*alpha
  pI13E17 <- sum(E17[])/sum(N[])*(beta^4)*alpha

  pI13C10 <- sum(C10[])/sum(N[])*(beta^3)*(alpha^2)
  pI13C11 <- sum(C11[])/sum(N[])*(beta^2)*(alpha^2)
  pI13C12 <- sum(C12[])/sum(N[])*beta*(alpha^2)
  pI13C13 <- sum(C13[])/sum(N[])*(alpha^2)
  pI13C14 <- sum(C14[])/sum(N[])*beta*(alpha^2)
  pI13C15 <- sum(C15[])/sum(N[])*(beta^2)*(alpha^2)
  pI13C16 <- sum(C16[])/sum(N[])*(beta^3)*(alpha^2)
  pI13C17 <- sum(C17[])/sum(N[])*(beta^4)*(alpha^2)

  #####################################
  pI14I10 <- sum(I10[])/sum(N[])*(beta^4)
  pI14I11 <- sum(I11[])/sum(N[])*(beta^3)
  pI14I12 <- sum(I12[])/sum(N[])*(beta^2)
  pI14I13 <- sum(I13[])/sum(N[])*beta
  pI14I14 <- sum(I14[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^4)) + sum(I11[])/sum(N[])*(1-(beta^3)) + sum(I12[])/sum(N[])*(1-(beta^2)) + sum(I13[])/sum(N[])*(1-beta) + sum(I15[])/sum(N[])*(1-beta) + sum(I16[])/sum(N[])*(1-(beta^2)) + sum(I17[])/sum(N[])*(1-(beta^3)) + sum(E10[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E13[])/sum(N[])*(1-(beta*alpha)) + sum(E14[])/sum(N[])*(1-alpha) + sum(E15[])/sum(N[])*(1-(beta*alpha)) + sum(E16[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^3)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(C11[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(C12[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C13[])/sum(N[])*(1-beta*(alpha^2)) + sum(C14[])/sum(N[])*(1-(alpha^2)) + sum(C15[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C16[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(C17[])/sum(N[])*(1-((beta^3)*(alpha^2)))
  pI14I15 <- sum(I15[])/sum(N[])*beta
  pI14I16 <- sum(I16[])/sum(N[])*(beta^2)
  pI14I17 <- sum(I17[])/sum(N[])*(beta^3)

  pI14E10 <- sum(E10[])/sum(N[])*(beta^4)*alpha
  pI14E11 <- sum(E11[])/sum(N[])*(beta^3)*alpha
  pI14E12 <- sum(E12[])/sum(N[])*(beta^2)*alpha
  pI14E13 <- sum(E13[])/sum(N[])*beta*alpha
  pI14E14 <- sum(E14[])/sum(N[])*alpha
  pI14E15 <- sum(E15[])/sum(N[])*beta*alpha
  pI14E16 <- sum(E16[])/sum(N[])*(beta^2)*alpha
  pI14E17 <- sum(E17[])/sum(N[])*(beta^3)*alpha

  pI14C10 <- sum(C10[])/sum(N[])*(beta^4)*(alpha^2)
  pI14C11 <- sum(C11[])/sum(N[])*(beta^3)*(alpha^2)
  pI14C12 <- sum(C12[])/sum(N[])*(beta^2)*(alpha^2)
  pI14C13 <- sum(C13[])/sum(N[])*beta*(alpha^2)
  pI14C14 <- sum(C14[])/sum(N[])*(alpha^2)
  pI14C15 <- sum(C15[])/sum(N[])*beta*(alpha^2)
  pI14C16 <- sum(C16[])/sum(N[])*(beta^2)*(alpha^2)
  pI14C17 <- sum(C17[])/sum(N[])*(beta^3)*(alpha^2)

  #####################################
  pI15I10 <- sum(I10[])/sum(N[])*(beta^5)
  pI15I11 <- sum(I11[])/sum(N[])*(beta^4)
  pI15I12 <- sum(I12[])/sum(N[])*(beta^3)
  pI15I13 <- sum(I13[])/sum(N[])*(beta^2)
  pI15I14 <- sum(I14[])/sum(N[])*beta
  pI15I15 <- sum(I15[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^5)) + sum(I11[])/sum(N[])*(1-(beta^4)) + sum(I12[])/sum(N[])*(1-(beta^3)) + sum(I13[])/sum(N[])*(1-(beta^2)) + sum(I14[])/sum(N[])*(1-beta) + sum(I16[])/sum(N[])*(1-beta) + sum(I17[])/sum(N[])*(1-(beta^2)) + sum(E10[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E14[])/sum(N[])*(1-(beta*alpha)) + sum(E15[])/sum(N[])*(1-alpha) + sum(E16[])/sum(N[])*(1-(beta*alpha)) + sum(E17[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(C11[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(C12[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(C13[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C14[])/sum(N[])*(1-beta*(alpha^2)) + sum(C15[])/sum(N[])*(1-(alpha^2)) + sum(C16[])/sum(N[])*(1-(beta*(alpha^2))) + sum(C17[])/sum(N[])*(1-((beta^2)*(alpha^2)))
  pI15I16 <- sum(I16[])/sum(N[])*beta
  pI15I17 <- sum(I17[])/sum(N[])*(beta^2)

  pI15E10 <- sum(E10[])/sum(N[])*(beta^5)*alpha
  pI15E11 <- sum(E11[])/sum(N[])*(beta^4)*alpha
  pI15E12 <- sum(E12[])/sum(N[])*(beta^3)*alpha
  pI15E13 <- sum(E13[])/sum(N[])*(beta^2)*alpha
  pI15E14 <- sum(E14[])/sum(N[])*beta*alpha
  pI15E15 <- sum(E15[])/sum(N[])*alpha
  pI15E16 <- sum(E16[])/sum(N[])*beta*alpha
  pI15E17 <- sum(E17[])/sum(N[])*(beta^2)*alpha

  pI15C10 <- sum(C10[])/sum(N[])*(beta^5)*(alpha^2)
  pI15C11 <- sum(C11[])/sum(N[])*(beta^4)*(alpha^2)
  pI15C12 <- sum(C12[])/sum(N[])*(beta^3)*(alpha^2)
  pI15C13 <- sum(C13[])/sum(N[])*(beta^2)*(alpha^2)
  pI15C14 <- sum(C14[])/sum(N[])*beta*(alpha^2)
  pI15C15 <- sum(C15[])/sum(N[])*(alpha^2)
  pI15C16 <- sum(C16[])/sum(N[])*beta*(alpha^2)
  pI15C17 <- sum(C17[])/sum(N[])*(beta^2)*(alpha^2)

  #####################################
  pI16I10 <- sum(I10[])/sum(N[])*(beta^6)
  pI16I11 <- sum(I11[])/sum(N[])*(beta^5)
  pI16I12 <- sum(I12[])/sum(N[])*(beta^4)
  pI16I13 <- sum(I13[])/sum(N[])*(beta^3)
  pI16I14 <- sum(I14[])/sum(N[])*(beta^2)
  pI16I15 <- sum(I15[])/sum(N[])*beta
  pI16I16 <- sum(I16[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^6)) + sum(I11[])/sum(N[])*(1-(beta^5)) + sum(I12[])/sum(N[])*(1-(beta^4)) + sum(I13[])/sum(N[])*(1-(beta^3)) + sum(I14[])/sum(N[])*(1-(beta^2)) + sum(I15[])/sum(N[])*(1-beta) + sum(I17[])/sum(N[])*(1-beta) + sum(E10[])/sum(N[])*(1-((beta^6)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E15[])/sum(N[])*(1-(beta*alpha)) + sum(E16[])/sum(N[])*(1-alpha) + sum(E17[])/sum(N[])*(1-(beta*alpha)) + sum(C10[])/sum(N[])*(1-(beta^6)*(alpha^2)) + sum(C11[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(C12[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(C13[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(C14[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C15[])/sum(N[])*(1-beta*(alpha^2)) + sum(C16[])/sum(N[])*(1-(alpha^2)) + sum(C17[])/sum(N[])*(1-(beta*(alpha^2)))
  pI16I17 <- sum(I17[])/sum(N[])*beta

  pI16E10 <- sum(E10[])/sum(N[])*(beta^6)*alpha
  pI16E11 <- sum(E11[])/sum(N[])*(beta^5)*alpha
  pI16E12 <- sum(E12[])/sum(N[])*(beta^4)*alpha
  pI16E13 <- sum(E13[])/sum(N[])*(beta^3)*alpha
  pI16E14 <- sum(E14[])/sum(N[])*(beta^2)*alpha
  pI16E15 <- sum(E15[])/sum(N[])*beta*alpha
  pI16E16 <- sum(E16[])/sum(N[])*alpha
  pI16E17 <- sum(E17[])/sum(N[])*beta*alpha

  pI16C10 <- sum(C10[])/sum(N[])*(beta^6)*(alpha^2)
  pI16C11 <- sum(C11[])/sum(N[])*(beta^5)*(alpha^2)
  pI16C12 <- sum(C12[])/sum(N[])*(beta^4)*(alpha^2)
  pI16C13 <- sum(C13[])/sum(N[])*(beta^3)*(alpha^2)
  pI16C14 <- sum(C14[])/sum(N[])*(beta^2)*(alpha^2)
  pI16C15 <- sum(C15[])/sum(N[])*beta*(alpha^2)
  pI16C16 <- sum(C16[])/sum(N[])*(alpha^2)
  pI16C17 <- sum(C17[])/sum(N[])*beta*(alpha^2)

  #####################################
  pI17I10 <- sum(I10[])/sum(N[])*(beta^7)
  pI17I11 <- sum(I11[])/sum(N[])*(beta^6)
  pI17I12 <- sum(I12[])/sum(N[])*(beta^5)
  pI17I13 <- sum(I13[])/sum(N[])*(beta^4)
  pI17I14 <- sum(I14[])/sum(N[])*(beta^3)
  pI17I15 <- sum(I15[])/sum(N[])*(beta^2)
  pI17I16 <- sum(I16[])/sum(N[])*beta
  pI17I17 <- sum(I17[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^7)) + sum(I11[])/sum(N[])*(1-(beta^6)) + sum(I12[])/sum(N[])*(1-(beta^5)) + sum(I13[])/sum(N[])*(1-(beta^4)) + sum(I14[])/sum(N[])*(1-(beta^3)) + sum(I15[])/sum(N[])*(1-(beta^2)) + sum(I16[])/sum(N[])*(1-beta) + sum(E10[])/sum(N[])*(1-((beta^7)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^6)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E16[])/sum(N[])*(1-(beta*alpha)) + sum(E17[])/sum(N[])*(1-alpha) + sum(C10[])/sum(N[])*(1-(beta^7)*(alpha^2)) + sum(C11[])/sum(N[])*(1-(beta^6)*(alpha^2)) + sum(C12[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(C13[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(C14[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(C15[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(C16[])/sum(N[])*(1-beta*(alpha^2)) + sum(C17[])/sum(N[])*(1-(alpha^2))

  pI17E10 <- sum(E10[])/sum(N[])*(beta^7)*alpha
  pI17E11 <- sum(E11[])/sum(N[])*(beta^6)*alpha
  pI17E12 <- sum(E12[])/sum(N[])*(beta^5)*alpha
  pI17E13 <- sum(E13[])/sum(N[])*(beta^4)*alpha
  pI17E14 <- sum(E14[])/sum(N[])*(beta^3)*alpha
  pI17E15 <- sum(E15[])/sum(N[])*(beta^2)*alpha
  pI17E16 <- sum(E16[])/sum(N[])*beta*alpha
  pI17E17 <- sum(E17[])/sum(N[])*alpha

  pI17C10 <- sum(C10[])/sum(N[])*(beta^7)*(alpha^2)
  pI17C11 <- sum(C11[])/sum(N[])*(beta^6)*(alpha^2)
  pI17C12 <- sum(C12[])/sum(N[])*(beta^5)*(alpha^2)
  pI17C13 <- sum(C13[])/sum(N[])*(beta^4)*(alpha^2)
  pI17C14 <- sum(C14[])/sum(N[])*(beta^3)*(alpha^2)
  pI17C15 <- sum(C15[])/sum(N[])*(beta^2)*(alpha^2)
  pI17C16 <- sum(C16[])/sum(N[])*beta*(alpha^2)
  pI17C17 <- sum(C17[])/sum(N[])*(alpha^2)

  #####################################
  pE10I10 <- sum(I10[])/sum(N[])*alpha
  pE10I11 <- sum(I11[])/sum(N[])*beta*alpha
  pE10I12 <- sum(I12[])/sum(N[])*(beta^2)*alpha
  pE10I13 <- sum(I13[])/sum(N[])*(beta^3)*alpha
  pE10I14 <- sum(I14[])/sum(N[])*(beta^4)*alpha
  pE10I15 <- sum(I15[])/sum(N[])*(beta^5)*alpha
  pE10I16 <- sum(I16[])/sum(N[])*(beta^6)*alpha
  pE10I17 <- sum(I17[])/sum(N[])*(beta^7)*alpha

  pE10E10 <- sum(E10[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(alpha)) + sum(I11[])/sum(N[])*(1-(beta*alpha)) + sum(I12[])/sum(N[])*(1-((beta^2)*alpha)) + sum(I13[])/sum(N[])*(1-((beta^3)*alpha)) + sum(I14[])/sum(N[])*(1-((beta^4)*alpha)) + sum(I15[])/sum(N[])*(1-((beta^5)*alpha)) + sum(I16[])/sum(N[])*(1-((beta^6)*alpha)) + sum(I17[])/sum(N[])*(1-((beta^7)*alpha)) + sum(E11[])/sum(N[])*(1-beta) + sum(E12[])/sum(N[])*(1-(beta^2)) + sum(E13[])/sum(N[])*(1-(beta^3)) + sum(E14[])/sum(N[])*(1-(beta^4)) + sum(E15[])/sum(N[])*(1-(beta^5)) + sum(E16[])/sum(N[])*(1-(beta^6)) + sum(E17[])/sum(N[])*(1-(beta^7)) + sum(C10[])/sum(N[])*(1-(alpha)) + sum(C11[])/sum(N[])*(1-(beta*alpha)) + sum(C12[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C13[])/sum(N[])*(1-((beta^3)*alpha)) + sum(C14[])/sum(N[])*(1-((beta^4)*alpha)) + sum(C15[])/sum(N[])*(1-((beta^5)*alpha)) + sum(C16[])/sum(N[])*(1-((beta^6)*alpha)) + sum(C17[])/sum(N[])*(1-((beta^7)*alpha))
  pE10E11 <- sum(E11[])/sum(N[])*beta
  pE10E12 <- sum(E12[])/sum(N[])*(beta^2)
  pE10E13 <- sum(E13[])/sum(N[])*(beta^3)
  pE10E14 <- sum(E14[])/sum(N[])*(beta^4)
  pE10E15 <- sum(E15[])/sum(N[])*(beta^5)
  pE10E16 <- sum(E16[])/sum(N[])*(beta^6)
  pE10E17 <- sum(E17[])/sum(N[])*(beta^7)

  pE10C10 <- sum(C10[])/sum(N[])*alpha
  pE10C11 <- sum(C11[])/sum(N[])*beta*alpha
  pE10C12 <- sum(C12[])/sum(N[])*(beta^2)*alpha
  pE10C13 <- sum(C13[])/sum(N[])*(beta^3)*alpha
  pE10C14 <- sum(C14[])/sum(N[])*(beta^4)*alpha
  pE10C15 <- sum(C15[])/sum(N[])*(beta^5)*alpha
  pE10C16 <- sum(C16[])/sum(N[])*(beta^6)*alpha
  pE10C17 <- sum(C17[])/sum(N[])*(beta^7)*alpha

  #####################################
  pE11I10 <- sum(I10[])/sum(N[])*beta*alpha
  pE11I11 <- sum(I11[])/sum(N[])*alpha
  pE11I12 <- sum(I12[])/sum(N[])*beta*alpha
  pE11I13 <- sum(I13[])/sum(N[])*(beta^2)*alpha
  pE11I14 <- sum(I14[])/sum(N[])*(beta^3)*alpha
  pE11I15 <- sum(I15[])/sum(N[])*(beta^4)*alpha
  pE11I16 <- sum(I16[])/sum(N[])*(beta^5)*alpha
  pE11I17 <- sum(I17[])/sum(N[])*(beta^6)*alpha

  pE11E10 <- sum(E10[])/sum(N[])*beta
  pE11E11 <- sum(E11[])/sum(N[]) + sum(I10[])/sum(N[])*(1-beta*alpha) + sum(I11[])/sum(N[])*(1-alpha) + sum(I12[])/sum(N[])*(1-(beta*alpha)) + sum(I13[])/sum(N[])*(1-((beta^2)*alpha)) + sum(I14[])/sum(N[])*(1-((beta^3)*alpha)) + sum(I15[])/sum(N[])*(1-((beta^4)*alpha)) + sum(I16[])/sum(N[])*(1-((beta^5)*alpha)) + sum(I17[])/sum(N[])*(1-((beta^6)*alpha)) + sum(E10[])/sum(N[])*(1-beta) + sum(E12[])/sum(N[])*(1-beta) + sum(E13[])/sum(N[])*(1-(beta^2)) + sum(E14[])/sum(N[])*(1-(beta^3)) + sum(E15[])/sum(N[])*(1-(beta^4)) + sum(E16[])/sum(N[])*(1-(beta^5)) + sum(E17[])/sum(N[])*(1-(beta^6)) + sum(C10[])/sum(N[])*(1-beta*alpha) + sum(C11[])/sum(N[])*(1-alpha) + sum(C12[])/sum(N[])*(1-(beta*alpha)) + sum(C13[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C14[])/sum(N[])*(1-((beta^3)*alpha)) + sum(C15[])/sum(N[])*(1-((beta^4)*alpha)) + sum(C16[])/sum(N[])*(1-((beta^5)*alpha)) + sum(C17[])/sum(N[])*(1-((beta^6)*alpha))
  pE11E12 <- sum(E12[])/sum(N[])*beta
  pE11E13 <- sum(E13[])/sum(N[])*(beta^2)
  pE11E14 <- sum(E14[])/sum(N[])*(beta^3)
  pE11E15 <- sum(E15[])/sum(N[])*(beta^4)
  pE11E16 <- sum(E16[])/sum(N[])*(beta^5)
  pE11E17 <- sum(E17[])/sum(N[])*(beta^6)

  pE11C10 <- sum(C10[])/sum(N[])*beta*alpha
  pE11C11 <- sum(C11[])/sum(N[])*alpha
  pE11C12 <- sum(C12[])/sum(N[])*beta*alpha
  pE11C13 <- sum(C13[])/sum(N[])*(beta^2)*alpha
  pE11C14 <- sum(C14[])/sum(N[])*(beta^3)*alpha
  pE11C15 <- sum(C15[])/sum(N[])*(beta^4)*alpha
  pE11C16 <- sum(C16[])/sum(N[])*(beta^5)*alpha
  pE11C17 <- sum(C17[])/sum(N[])*(beta^6)*alpha

  #####################################
  pE12I10 <- sum(I10[])/sum(N[])*(beta^2)*alpha
  pE12I11 <- sum(I11[])/sum(N[])*beta*alpha
  pE12I12 <- sum(I12[])/sum(N[])*alpha
  pE12I13 <- sum(I13[])/sum(N[])*beta*alpha
  pE12I14 <- sum(I14[])/sum(N[])*(beta^2)*alpha
  pE12I15 <- sum(I15[])/sum(N[])*(beta^3)*alpha
  pE12I16 <- sum(I16[])/sum(N[])*(beta^4)*alpha
  pE12I17 <- sum(I17[])/sum(N[])*(beta^5)*alpha

  pE12E10 <- sum(E10[])/sum(N[])*(beta^2)
  pE12E11 <- sum(E11[])/sum(N[])*beta
  pE12E12 <- sum(E12[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^2)*alpha) + sum(I11[])/sum(N[])*(1-(beta*alpha)) + sum(I12[])/sum(N[])*(1-alpha) + sum(I13[])/sum(N[])*(1-(beta*alpha)) + sum(I14[])/sum(N[])*(1-((beta^2)*alpha)) + sum(I15[])/sum(N[])*(1-((beta^3)*alpha)) + sum(I16[])/sum(N[])*(1-((beta^4)*alpha)) + sum(I17[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E10[])/sum(N[])*(1-(beta^2)) + sum(E11[])/sum(N[])*(1-beta) + sum(E13[])/sum(N[])*(1-beta) + sum(E14[])/sum(N[])*(1-(beta^2)) + sum(E15[])/sum(N[])*(1-(beta^3)) + sum(E16[])/sum(N[])*(1-(beta^4)) + sum(E17[])/sum(N[])*(1-(beta^5)) + sum(C10[])/sum(N[])*(1-(beta^2)*alpha) + sum(C11[])/sum(N[])*(1-(beta*alpha)) + sum(C12[])/sum(N[])*(1-alpha) + sum(C13[])/sum(N[])*(1-(beta*alpha)) + sum(C14[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C15[])/sum(N[])*(1-((beta^3)*alpha)) + sum(C16[])/sum(N[])*(1-((beta^4)*alpha)) + sum(C17[])/sum(N[])*(1-((beta^5)*alpha))
  pE12E13 <- sum(E13[])/sum(N[])*beta
  pE12E14 <- sum(E14[])/sum(N[])*(beta^2)
  pE12E15 <- sum(E15[])/sum(N[])*(beta^3)
  pE12E16 <- sum(E16[])/sum(N[])*(beta^4)
  pE12E17 <- sum(E17[])/sum(N[])*(beta^5)

  pE12C10 <- sum(C10[])/sum(N[])*(beta^2)*alpha
  pE12C11 <- sum(C11[])/sum(N[])*beta*alpha
  pE12C12 <- sum(C12[])/sum(N[])*alpha
  pE12C13 <- sum(C13[])/sum(N[])*beta*alpha
  pE12C14 <- sum(C14[])/sum(N[])*(beta^2)*alpha
  pE12C15 <- sum(C15[])/sum(N[])*(beta^3)*alpha
  pE12C16 <- sum(C16[])/sum(N[])*(beta^4)*alpha
  pE12C17 <- sum(C17[])/sum(N[])*(beta^5)*alpha

  #####################################
  pE13I10 <- sum(I10[])/sum(N[])*(beta^3)*alpha
  pE13I11 <- sum(I11[])/sum(N[])*(beta^2)*alpha
  pE13I12 <- sum(I12[])/sum(N[])*beta*alpha
  pE13I13 <- sum(I13[])/sum(N[])*alpha
  pE13I14 <- sum(I14[])/sum(N[])*beta*alpha
  pE13I15 <- sum(I15[])/sum(N[])*(beta^2)*alpha
  pE13I16 <- sum(I16[])/sum(N[])*(beta^3)*alpha
  pE13I17 <- sum(I17[])/sum(N[])*(beta^4)*alpha

  pE13E10 <- sum(E10[])/sum(N[])*(beta^3)
  pE13E11 <- sum(E11[])/sum(N[])*(beta^2)
  pE13E12 <- sum(E12[])/sum(N[])*beta
  pE13E13 <- sum(E13[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^3)*alpha) + sum(I11[])/sum(N[])*(1-(beta^2)*alpha) + sum(I12[])/sum(N[])*(1-beta*alpha) + sum(I13[])/sum(N[])*(1-alpha) + sum(I14[])/sum(N[])*(1-(beta*alpha)) + sum(I15[])/sum(N[])*(1-((beta^2)*alpha)) + sum(I16[])/sum(N[])*(1-((beta^3)*alpha)) + sum(I17[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E10[])/sum(N[])*(1-(beta^3)) + sum(E11[])/sum(N[])*(1-(beta^2)) + sum(E12[])/sum(N[])*(1-beta) + sum(E14[])/sum(N[])*(1-beta) + sum(E15[])/sum(N[])*(1-(beta^2)) + sum(E16[])/sum(N[])*(1-(beta^3)) + sum(E17[])/sum(N[])*(1-(beta^4)) + sum(C10[])/sum(N[])*(1-(beta^3)*alpha) + sum(C11[])/sum(N[])*(1-(beta^2)*alpha) + sum(C12[])/sum(N[])*(1-beta*alpha) + sum(C13[])/sum(N[])*(1-alpha) + sum(C14[])/sum(N[])*(1-(beta*alpha)) + sum(C15[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C16[])/sum(N[])*(1-((beta^3)*alpha)) + sum(C17[])/sum(N[])*(1-((beta^4)*alpha))
  pE13E14 <- sum(E14[])/sum(N[])*beta
  pE13E15 <- sum(E15[])/sum(N[])*(beta^2)
  pE13E16 <- sum(E16[])/sum(N[])*(beta^3)
  pE13E17 <- sum(E17[])/sum(N[])*(beta^4)

  pE13C10 <- sum(C10[])/sum(N[])*(beta^3)*alpha
  pE13C11 <- sum(C11[])/sum(N[])*(beta^2)*alpha
  pE13C12 <- sum(C12[])/sum(N[])*beta*alpha
  pE13C13 <- sum(C13[])/sum(N[])*alpha
  pE13C14 <- sum(C14[])/sum(N[])*beta*alpha
  pE13C15 <- sum(C15[])/sum(N[])*(beta^2)*alpha
  pE13C16 <- sum(C16[])/sum(N[])*(beta^3)*alpha
  pE13C17 <- sum(C17[])/sum(N[])*(beta^4)*alpha

  #####################################
  pE14I10 <- sum(I10[])/sum(N[])*(beta^4)*alpha
  pE14I11 <- sum(I11[])/sum(N[])*(beta^3)*alpha
  pE14I12 <- sum(I12[])/sum(N[])*(beta^2)*alpha
  pE14I13 <- sum(I13[])/sum(N[])*beta*alpha
  pE14I14 <- sum(I14[])/sum(N[])*alpha
  pE14I15 <- sum(I15[])/sum(N[])*beta*alpha
  pE14I16 <- sum(I16[])/sum(N[])*(beta^2)*alpha
  pE14I17 <- sum(I17[])/sum(N[])*(beta^3)*alpha

  pE14E10 <- sum(E10[])/sum(N[])*(beta^4)
  pE14E11 <- sum(E11[])/sum(N[])*(beta^3)
  pE14E12 <- sum(E12[])/sum(N[])*(beta^2)
  pE14E13 <- sum(E13[])/sum(N[])*beta
  pE14E14 <- sum(E14[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^4)*alpha) + sum(I11[])/sum(N[])*(1-(beta^3)*alpha) + sum(I12[])/sum(N[])*(1-(beta^2)*alpha) + sum(I13[])/sum(N[])*(1-beta*alpha) + sum(I14[])/sum(N[])*(1-alpha) + sum(I15[])/sum(N[])*(1-(beta*alpha)) + sum(I16[])/sum(N[])*(1-((beta^2)*alpha)) + sum(I17[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E10[])/sum(N[])*(1-(beta^4)) + sum(E11[])/sum(N[])*(1-(beta^3)) + sum(E12[])/sum(N[])*(1-(beta^2)) + sum(E13[])/sum(N[])*(1-beta) + sum(E15[])/sum(N[])*(1-beta) + sum(E16[])/sum(N[])*(1-(beta^2)) + sum(E17[])/sum(N[])*(1-(beta^3)) + sum(C10[])/sum(N[])*(1-(beta^4)*alpha) + sum(C11[])/sum(N[])*(1-(beta^3)*alpha) + sum(C12[])/sum(N[])*(1-(beta^2)*alpha) + sum(C13[])/sum(N[])*(1-beta*alpha) + sum(C14[])/sum(N[])*(1-alpha) + sum(C15[])/sum(N[])*(1-(beta*alpha)) + sum(C16[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C17[])/sum(N[])*(1-((beta^3)*alpha))
  pE14E15 <- sum(E15[])/sum(N[])*beta
  pE14E16 <- sum(E16[])/sum(N[])*(beta^2)
  pE14E17 <- sum(E17[])/sum(N[])*(beta^3)

  pE14C10 <- sum(C10[])/sum(N[])*(beta^4)*alpha
  pE14C11 <- sum(C11[])/sum(N[])*(beta^3)*alpha
  pE14C12 <- sum(C12[])/sum(N[])*(beta^2)*alpha
  pE14C13 <- sum(C13[])/sum(N[])*beta*alpha
  pE14C14 <- sum(C14[])/sum(N[])*alpha
  pE14C15 <- sum(C15[])/sum(N[])*beta*alpha
  pE14C16 <- sum(C16[])/sum(N[])*(beta^2)*alpha
  pE14C17 <- sum(C17[])/sum(N[])*(beta^3)*alpha

  #####################################
  pE15I10 <- sum(I10[])/sum(N[])*(beta^5)*alpha
  pE15I11 <- sum(I11[])/sum(N[])*(beta^4)*alpha
  pE15I12 <- sum(I12[])/sum(N[])*(beta^3)*alpha
  pE15I13 <- sum(I13[])/sum(N[])*(beta^2)*alpha
  pE15I14 <- sum(I14[])/sum(N[])*beta*alpha
  pE15I15 <- sum(I15[])/sum(N[])*alpha
  pE15I16 <- sum(I16[])/sum(N[])*beta*alpha
  pE15I17 <- sum(I17[])/sum(N[])*(beta^2)*alpha

  pE15E10 <- sum(E10[])/sum(N[])*(beta^5)
  pE15E11 <- sum(E11[])/sum(N[])*(beta^4)
  pE15E12 <- sum(E12[])/sum(N[])*(beta^3)
  pE15E13 <- sum(E13[])/sum(N[])*(beta^2)
  pE15E14 <- sum(E14[])/sum(N[])*beta
  pE15E15 <- sum(E15[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^5)*alpha) + sum(I11[])/sum(N[])*(1-(beta^4)*alpha) + sum(I12[])/sum(N[])*(1-(beta^3)*alpha) + sum(I13[])/sum(N[])*(1-(beta^2)*alpha) + sum(I14[])/sum(N[])*(1-beta*alpha) + sum(I15[])/sum(N[])*(1-alpha) + sum(I16[])/sum(N[])*(1-(beta*alpha)) + sum(I17[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E10[])/sum(N[])*(1-(beta^5)) + sum(E11[])/sum(N[])*(1-(beta^4)) + sum(E12[])/sum(N[])*(1-(beta^3)) + sum(E13[])/sum(N[])*(1-(beta^2)) + sum(E14[])/sum(N[])*(1-beta) + sum(E16[])/sum(N[])*(1-beta) + sum(E17[])/sum(N[])*(1-(beta^2)) + sum(C10[])/sum(N[])*(1-(beta^5)*alpha) + sum(C11[])/sum(N[])*(1-(beta^4)*alpha) + sum(C12[])/sum(N[])*(1-(beta^3)*alpha) + sum(C13[])/sum(N[])*(1-(beta^2)*alpha) + sum(C14[])/sum(N[])*(1-beta*alpha) + sum(C15[])/sum(N[])*(1-alpha) + sum(C16[])/sum(N[])*(1-(beta*alpha)) + sum(C17[])/sum(N[])*(1-((beta^2)*alpha))
  pE15E16 <- sum(E16[])/sum(N[])*beta
  pE15E17 <- sum(E17[])/sum(N[])*(beta^2)

  pE15C10 <- sum(C10[])/sum(N[])*(beta^5)*alpha
  pE15C11 <- sum(C11[])/sum(N[])*(beta^4)*alpha
  pE15C12 <- sum(C12[])/sum(N[])*(beta^3)*alpha
  pE15C13 <- sum(C13[])/sum(N[])*(beta^2)*alpha
  pE15C14 <- sum(C14[])/sum(N[])*beta*alpha
  pE15C15 <- sum(C15[])/sum(N[])*alpha
  pE15C16 <- sum(C16[])/sum(N[])*beta*alpha
  pE15C17 <- sum(C17[])/sum(N[])*(beta^2)*alpha

  #####################################
  pE16I10 <- sum(I10[])/sum(N[])*(beta^6)*alpha
  pE16I11 <- sum(I11[])/sum(N[])*(beta^5)*alpha
  pE16I12 <- sum(I12[])/sum(N[])*(beta^4)*alpha
  pE16I13 <- sum(I13[])/sum(N[])*(beta^3)*alpha
  pE16I14 <- sum(I14[])/sum(N[])*(beta^2)*alpha
  pE16I15 <- sum(I15[])/sum(N[])*beta*alpha
  pE16I16 <- sum(I16[])/sum(N[])*alpha
  pE16I17 <- sum(I17[])/sum(N[])*beta*alpha

  pE16E10 <- sum(E10[])/sum(N[])*(beta^6)
  pE16E11 <- sum(E11[])/sum(N[])*(beta^5)
  pE16E12 <- sum(E12[])/sum(N[])*(beta^4)
  pE16E13 <- sum(E13[])/sum(N[])*(beta^3)
  pE16E14 <- sum(E14[])/sum(N[])*(beta^2)
  pE16E15 <- sum(E15[])/sum(N[])*beta
  pE16E16 <- sum(E16[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^6)*alpha) + sum(I11[])/sum(N[])*(1-(beta^5)*alpha) + sum(I12[])/sum(N[])*(1-(beta^4)*alpha) + sum(I13[])/sum(N[])*(1-(beta^3)*alpha) + sum(I14[])/sum(N[])*(1-(beta^2)*alpha) + sum(I15[])/sum(N[])*(1-beta*alpha) + sum(I16[])/sum(N[])*(1-alpha) + sum(I17[])/sum(N[])*(1-(beta*alpha)) + sum(E10[])/sum(N[])*(1-(beta^6)) + sum(E11[])/sum(N[])*(1-(beta^5)) + sum(E12[])/sum(N[])*(1-(beta^4)) + sum(E13[])/sum(N[])*(1-(beta^3)) + sum(E14[])/sum(N[])*(1-(beta^2)) + sum(E15[])/sum(N[])*(1-beta) + sum(E17[])/sum(N[])*(1-beta) + sum(C10[])/sum(N[])*(1-(beta^6)*alpha) + sum(C11[])/sum(N[])*(1-(beta^5)*alpha) + sum(C12[])/sum(N[])*(1-(beta^4)*alpha) + sum(C13[])/sum(N[])*(1-(beta^3)*alpha) + sum(C14[])/sum(N[])*(1-(beta^2)*alpha) + sum(C15[])/sum(N[])*(1-beta*alpha) + sum(C16[])/sum(N[])*(1-alpha) + sum(C17[])/sum(N[])*(1-(beta*alpha))
  pE16E17 <- sum(E17[])/sum(N[])*beta

  pE16C10 <- sum(C10[])/sum(N[])*(beta^6)*alpha
  pE16C11 <- sum(C11[])/sum(N[])*(beta^5)*alpha
  pE16C12 <- sum(C12[])/sum(N[])*(beta^4)*alpha
  pE16C13 <- sum(C13[])/sum(N[])*(beta^3)*alpha
  pE16C14 <- sum(C14[])/sum(N[])*(beta^2)*alpha
  pE16C15 <- sum(C15[])/sum(N[])*beta*alpha
  pE16C16 <- sum(C16[])/sum(N[])*alpha
  pE16C17 <- sum(C17[])/sum(N[])*beta*alpha

  #####################################
  pE17I10 <- sum(I10[])/sum(N[])*(beta^7)*alpha
  pE17I11 <- sum(I11[])/sum(N[])*(beta^6)*alpha
  pE17I12 <- sum(I12[])/sum(N[])*(beta^5)*alpha
  pE17I13 <- sum(I13[])/sum(N[])*(beta^4)*alpha
  pE17I14 <- sum(I14[])/sum(N[])*(beta^3)*alpha
  pE17I15 <- sum(I15[])/sum(N[])*(beta^2)*alpha
  pE17I16 <- sum(I16[])/sum(N[])*beta*alpha
  pE17I17 <- sum(I17[])/sum(N[])*alpha

  pE17E10 <- sum(E10[])/sum(N[])*(beta^7)
  pE17E11 <- sum(E11[])/sum(N[])*(beta^6)
  pE17E12 <- sum(E12[])/sum(N[])*(beta^5)
  pE17E13 <- sum(E13[])/sum(N[])*(beta^4)
  pE17E14 <- sum(E14[])/sum(N[])*(beta^3)
  pE17E15 <- sum(E15[])/sum(N[])*(beta^2)
  pE17E16 <- sum(E16[])/sum(N[])*beta
  pE17E17 <- sum(E17[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^7)*alpha) + sum(I11[])/sum(N[])*(1-(beta^6)*alpha) + sum(I12[])/sum(N[])*(1-(beta^5)*alpha) + sum(I13[])/sum(N[])*(1-(beta^4)*alpha) + sum(I14[])/sum(N[])*(1-(beta^3)*alpha) + sum(I15[])/sum(N[])*(1-(beta^2)*alpha) + sum(I16[])/sum(N[])*(1-beta*alpha) + sum(I17[])/sum(N[])*(1-alpha) + sum(E10[])/sum(N[])*(1-(beta^7)) + sum(E11[])/sum(N[])*(1-(beta^6)) + sum(E12[])/sum(N[])*(1-(beta^5)) + sum(E13[])/sum(N[])*(1-(beta^4)) + sum(E14[])/sum(N[])*(1-(beta^3)) + sum(E15[])/sum(N[])*(1-(beta^2)) + sum(E16[])/sum(N[])*(1-beta) + sum(C10[])/sum(N[])*(1-(beta^7)*alpha) + sum(C11[])/sum(N[])*(1-(beta^6)*alpha) + sum(C12[])/sum(N[])*(1-(beta^5)*alpha) + sum(C13[])/sum(N[])*(1-(beta^4)*alpha) + sum(C14[])/sum(N[])*(1-(beta^3)*alpha) + sum(C15[])/sum(N[])*(1-(beta^2)*alpha) + sum(C16[])/sum(N[])*(1-beta*alpha) + sum(C17[])/sum(N[])*(1-alpha)

  pE17C10 <- sum(C10[])/sum(N[])*(beta^7)*alpha
  pE17C11 <- sum(C11[])/sum(N[])*(beta^6)*alpha
  pE17C12 <- sum(C12[])/sum(N[])*(beta^5)*alpha
  pE17C13 <- sum(C13[])/sum(N[])*(beta^4)*alpha
  pE17C14 <- sum(C14[])/sum(N[])*(beta^3)*alpha
  pE17C15 <- sum(C15[])/sum(N[])*(beta^2)*alpha
  pE17C16 <- sum(C16[])/sum(N[])*beta*alpha
  pE17C17 <- sum(C17[])/sum(N[])*alpha

  #####################################
  pC10I10 <- sum(I10[])/sum(N[])*(alpha^2)
  pC10I11 <- sum(I11[])/sum(N[])*beta*(alpha^2)
  pC10I12 <- sum(I12[])/sum(N[])*(beta^2)*(alpha^2)
  pC10I13 <- sum(I13[])/sum(N[])*(beta^3)*(alpha^2)
  pC10I14 <- sum(I14[])/sum(N[])*(beta^4)*(alpha^2)
  pC10I15 <- sum(I15[])/sum(N[])*(beta^5)*(alpha^2)
  pC10I16 <- sum(I16[])/sum(N[])*(beta^6)*(alpha^2)
  pC10I17 <- sum(I17[])/sum(N[])*(beta^7)*(alpha^2)

  pC10E10 <- sum(E10[])/sum(N[])*alpha
  pC10E11 <- sum(E11[])/sum(N[])*beta*alpha
  pC10E12 <- sum(E12[])/sum(N[])*(beta^2)*alpha
  pC10E13 <- sum(E13[])/sum(N[])*(beta^3)*alpha
  pC10E14 <- sum(E14[])/sum(N[])*(beta^4)*alpha
  pC10E15 <- sum(E15[])/sum(N[])*(beta^5)*alpha
  pC10E16 <- sum(E16[])/sum(N[])*(beta^6)*alpha
  pC10E17 <- sum(E17[])/sum(N[])*(beta^7)*alpha

  pC10C10 <- sum(C10[])/sum(N[]) + sum(I10[])/sum(N[])*(1-((alpha^2))) + sum(I11[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I12[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(I13[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(I14[])/sum(N[])*(1-((beta^4)*(alpha^2))) + sum(I15[])/sum(N[])*(1-((beta^5)*(alpha^2))) + sum(I16[])/sum(N[])*(1-((beta^6)*(alpha^2))) + sum(I17[])/sum(N[])*(1-((beta^7)*(alpha^2))) + sum(E10[])/sum(N[])*(1-(alpha)) + sum(E11[])/sum(N[])*(1-(beta*alpha)) + sum(E12[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^6)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^7)*alpha)) + sum(C11[])/sum(N[])*(1-beta) + sum(C12[])/sum(N[])*(1-(beta^2)) + sum(C13[])/sum(N[])*(1-(beta^3)) + sum(C14[])/sum(N[])*(1-(beta^4)) + sum(C15[])/sum(N[])*(1-(beta^5)) + sum(C16[])/sum(N[])*(1-(beta^6)) + sum(C17[])/sum(N[])*(1-(beta^7))
  pC10C11 <- sum(C11[])/sum(N[])*beta
  pC10C12 <- sum(C12[])/sum(N[])*(beta^2)
  pC10C13 <- sum(C13[])/sum(N[])*(beta^3)
  pC10C14 <- sum(C14[])/sum(N[])*(beta^4)
  pC10C15 <- sum(C15[])/sum(N[])*(beta^5)
  pC10C16 <- sum(C16[])/sum(N[])*(beta^6)
  pC10C17 <- sum(C17[])/sum(N[])*(beta^7)

  #####################################
  pC11I10 <- sum(I10[])/sum(N[])*beta*(alpha^2)
  pC11I11 <- sum(I11[])/sum(N[])*(alpha^2)
  pC11I12 <- sum(I12[])/sum(N[])*beta*(alpha^2)
  pC11I13 <- sum(I13[])/sum(N[])*(beta^2)*(alpha^2)
  pC11I14 <- sum(I14[])/sum(N[])*(beta^3)*(alpha^2)
  pC11I15 <- sum(I15[])/sum(N[])*(beta^4)*(alpha^2)
  pC11I16 <- sum(I16[])/sum(N[])*(beta^5)*(alpha^2)
  pC11I17 <- sum(I17[])/sum(N[])*(beta^6)*(alpha^2)

  pC11E10 <- sum(E10[])/sum(N[])*beta*alpha
  pC11E11 <- sum(E11[])/sum(N[])*alpha
  pC11E12 <- sum(E12[])/sum(N[])*beta*alpha
  pC11E13 <- sum(E13[])/sum(N[])*(beta^2)*alpha
  pC11E14 <- sum(E14[])/sum(N[])*(beta^3)*alpha
  pC11E15 <- sum(E15[])/sum(N[])*(beta^4)*alpha
  pC11E16 <- sum(E16[])/sum(N[])*(beta^5)*alpha
  pC11E17 <- sum(E17[])/sum(N[])*(beta^6)*alpha

  pC11C10 <- sum(C10[])/sum(N[])*beta
  pC11C11 <- sum(C11[])/sum(N[]) + sum(I10[])/sum(N[])*(1-beta*(alpha^2)) + sum(I11[])/sum(N[])*(1-(alpha^2)) + sum(I12[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I13[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(I14[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(I15[])/sum(N[])*(1-((beta^4)*(alpha^2))) + sum(I16[])/sum(N[])*(1-((beta^5)*(alpha^2))) + sum(I17[])/sum(N[])*(1-((beta^6)*(alpha^2))) + sum(E10[])/sum(N[])*(1-beta*alpha) + sum(E11[])/sum(N[])*(1-alpha) + sum(E12[])/sum(N[])*(1-(beta*alpha)) + sum(E13[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^6)*alpha)) + sum(C10[])/sum(N[])*(1-beta) + sum(C12[])/sum(N[])*(1-beta) + sum(C13[])/sum(N[])*(1-(beta^2)) + sum(C14[])/sum(N[])*(1-(beta^3)) + sum(C15[])/sum(N[])*(1-(beta^4)) + sum(C16[])/sum(N[])*(1-(beta^5)) + sum(C17[])/sum(N[])*(1-(beta^6))
  pC11C12 <- sum(C12[])/sum(N[])*beta
  pC11C13 <- sum(C13[])/sum(N[])*(beta^2)
  pC11C14 <- sum(C14[])/sum(N[])*(beta^3)
  pC11C15 <- sum(C15[])/sum(N[])*(beta^4)
  pC11C16 <- sum(C16[])/sum(N[])*(beta^5)
  pC11C17 <- sum(C17[])/sum(N[])*(beta^6)

  #####################################
  pC12I10 <- sum(I10[])/sum(N[])*(beta^2)*(alpha^2)
  pC12I11 <- sum(I11[])/sum(N[])*beta*(alpha^2)
  pC12I12 <- sum(I12[])/sum(N[])*(alpha^2)
  pC12I13 <- sum(I13[])/sum(N[])*beta*(alpha^2)
  pC12I14 <- sum(I14[])/sum(N[])*(beta^2)*(alpha^2)
  pC12I15 <- sum(I15[])/sum(N[])*(beta^3)*(alpha^2)
  pC12I16 <- sum(I16[])/sum(N[])*(beta^4)*(alpha^2)
  pC12I17 <- sum(I17[])/sum(N[])*(beta^5)*(alpha^2)

  pC12E10 <- sum(E10[])/sum(N[])*(beta^2)*alpha
  pC12E11 <- sum(E11[])/sum(N[])*beta*alpha
  pC12E12 <- sum(E12[])/sum(N[])*alpha
  pC12E13 <- sum(E13[])/sum(N[])*beta*alpha
  pC12E14 <- sum(E14[])/sum(N[])*(beta^2)*alpha
  pC12E15 <- sum(E15[])/sum(N[])*(beta^3)*alpha
  pC12E16 <- sum(E16[])/sum(N[])*(beta^4)*alpha
  pC12E17 <- sum(E17[])/sum(N[])*(beta^5)*alpha

  pC12C10 <- sum(C10[])/sum(N[])*(beta^2)
  pC12C11 <- sum(C11[])/sum(N[])*beta
  pC12C12 <- sum(C12[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(I11[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I12[])/sum(N[])*(1-(alpha^2)) + sum(I13[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I14[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(I15[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(I16[])/sum(N[])*(1-((beta^4)*(alpha^2))) + sum(I17[])/sum(N[])*(1-((beta^5)*(alpha^2))) + sum(E10[])/sum(N[])*(1-(beta^2)*alpha) + sum(E11[])/sum(N[])*(1-(beta*alpha)) + sum(E12[])/sum(N[])*(1-alpha) + sum(E13[])/sum(N[])*(1-(beta*alpha)) + sum(E14[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^5)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^2)) + sum(C11[])/sum(N[])*(1-beta) + sum(C13[])/sum(N[])*(1-beta) + sum(C14[])/sum(N[])*(1-(beta^2)) + sum(C15[])/sum(N[])*(1-(beta^3)) + sum(C16[])/sum(N[])*(1-(beta^4)) + sum(C17[])/sum(N[])*(1-(beta^5))
  pC12C13 <- sum(C13[])/sum(N[])*beta
  pC12C14 <- sum(C14[])/sum(N[])*(beta^2)
  pC12C15 <- sum(C15[])/sum(N[])*(beta^3)
  pC12C16 <- sum(C16[])/sum(N[])*(beta^4)
  pC12C17 <- sum(C17[])/sum(N[])*(beta^5)

  #####################################
  pC13I10 <- sum(I10[])/sum(N[])*(beta^3)*(alpha^2)
  pC13I11 <- sum(I11[])/sum(N[])*(beta^2)*(alpha^2)
  pC13I12 <- sum(I12[])/sum(N[])*beta*(alpha^2)
  pC13I13 <- sum(I13[])/sum(N[])*(alpha^2)
  pC13I14 <- sum(I14[])/sum(N[])*beta*(alpha^2)
  pC13I15 <- sum(I15[])/sum(N[])*(beta^2)*(alpha^2)
  pC13I16 <- sum(I16[])/sum(N[])*(beta^3)*(alpha^2)
  pC13I17 <- sum(I17[])/sum(N[])*(beta^4)*(alpha^2)

  pC13E10 <- sum(E10[])/sum(N[])*(beta^3)*alpha
  pC13E11 <- sum(E11[])/sum(N[])*(beta^2)*alpha
  pC13E12 <- sum(E12[])/sum(N[])*beta*alpha
  pC13E13 <- sum(E13[])/sum(N[])*alpha
  pC13E14 <- sum(E14[])/sum(N[])*beta*alpha
  pC13E15 <- sum(E15[])/sum(N[])*(beta^2)*alpha
  pC13E16 <- sum(E16[])/sum(N[])*(beta^3)*alpha
  pC13E17 <- sum(E17[])/sum(N[])*(beta^4)*alpha

  pC13C10 <- sum(C10[])/sum(N[])*(beta^3)
  pC13C11 <- sum(C11[])/sum(N[])*(beta^2)
  pC13C12 <- sum(C12[])/sum(N[])*beta
  pC13C13 <- sum(C13[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(I11[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(I12[])/sum(N[])*(1-beta*(alpha^2)) + sum(I13[])/sum(N[])*(1-(alpha^2)) + sum(I14[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I15[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(I16[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(I17[])/sum(N[])*(1-((beta^4)*(alpha^2))) + sum(E10[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E12[])/sum(N[])*(1-(beta*alpha)) + sum(E13[])/sum(N[])*(1-alpha) + sum(E14[])/sum(N[])*(1-(beta*alpha)) + sum(E15[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E16[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^4)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^3)) + sum(C11[])/sum(N[])*(1-(beta^2)) + sum(C12[])/sum(N[])*(1-beta) + sum(C14[])/sum(N[])*(1-beta) + sum(C15[])/sum(N[])*(1-(beta^2)) + sum(C16[])/sum(N[])*(1-(beta^3)) + sum(C17[])/sum(N[])*(1-(beta^4))
  pC13C14 <- sum(C14[])/sum(N[])*beta
  pC13C15 <- sum(C15[])/sum(N[])*(beta^2)
  pC13C16 <- sum(C16[])/sum(N[])*(beta^3)
  pC13C17 <- sum(C17[])/sum(N[])*(beta^4)

  #####################################
  pC14I10 <- sum(I10[])/sum(N[])*(beta^4)*(alpha^2)
  pC14I11 <- sum(I11[])/sum(N[])*(beta^3)*(alpha^2)
  pC14I12 <- sum(I12[])/sum(N[])*(beta^2)*(alpha^2)
  pC14I13 <- sum(I13[])/sum(N[])*beta*(alpha^2)
  pC14I14 <- sum(I14[])/sum(N[])*(alpha^2)
  pC14I15 <- sum(I15[])/sum(N[])*beta*(alpha^2)
  pC14I16 <- sum(I16[])/sum(N[])*(beta^2)*(alpha^2)
  pC14I17 <- sum(I17[])/sum(N[])*(beta^3)*(alpha^2)

  pC14E10 <- sum(E10[])/sum(N[])*(beta^4)*alpha
  pC14E11 <- sum(E11[])/sum(N[])*(beta^3)*alpha
  pC14E12 <- sum(E12[])/sum(N[])*(beta^2)*alpha
  pC14E13 <- sum(E13[])/sum(N[])*beta*alpha
  pC14E14 <- sum(E14[])/sum(N[])*alpha
  pC14E15 <- sum(E15[])/sum(N[])*beta*alpha
  pC14E16 <- sum(E16[])/sum(N[])*(beta^2)*alpha
  pC14E17 <- sum(E17[])/sum(N[])*(beta^3)*alpha

  pC14C10 <- sum(C10[])/sum(N[])*(beta^4)
  pC14C11 <- sum(C11[])/sum(N[])*(beta^3)
  pC14C12 <- sum(C12[])/sum(N[])*(beta^2)
  pC14C13 <- sum(C13[])/sum(N[])*beta
  pC14C14 <- sum(C14[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(I11[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(I12[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(I13[])/sum(N[])*(1-beta*(alpha^2)) + sum(I14[])/sum(N[])*(1-(alpha^2)) + sum(I15[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I16[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(I17[])/sum(N[])*(1-((beta^3)*(alpha^2))) + sum(E10[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E13[])/sum(N[])*(1-(beta*alpha)) + sum(E14[])/sum(N[])*(1-alpha) + sum(E15[])/sum(N[])*(1-(beta*alpha)) + sum(E16[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E17[])/sum(N[])*(1-((beta^3)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^4)) + sum(C11[])/sum(N[])*(1-(beta^3)) + sum(C12[])/sum(N[])*(1-(beta^2)) + sum(C13[])/sum(N[])*(1-beta) + sum(C15[])/sum(N[])*(1-beta) + sum(C16[])/sum(N[])*(1-(beta^2)) + sum(C17[])/sum(N[])*(1-(beta^3))
  pC14C15 <- sum(C15[])/sum(N[])*beta
  pC14C16 <- sum(C16[])/sum(N[])*(beta^2)
  pC14C17 <- sum(C17[])/sum(N[])*(beta^3)

  #####################################
  pC15I10 <- sum(I10[])/sum(N[])*(beta^5)*(alpha^2)
  pC15I11 <- sum(I11[])/sum(N[])*(beta^4)*(alpha^2)
  pC15I12 <- sum(I12[])/sum(N[])*(beta^3)*(alpha^2)
  pC15I13 <- sum(I13[])/sum(N[])*(beta^2)*(alpha^2)
  pC15I14 <- sum(I14[])/sum(N[])*beta*(alpha^2)
  pC15I15 <- sum(I15[])/sum(N[])*(alpha^2)
  pC15I16 <- sum(I16[])/sum(N[])*beta*(alpha^2)
  pC15I17 <- sum(I17[])/sum(N[])*(beta^2)*(alpha^2)

  pC15E10 <- sum(E10[])/sum(N[])*(beta^5)*alpha
  pC15E11 <- sum(E11[])/sum(N[])*(beta^4)*alpha
  pC15E12 <- sum(E12[])/sum(N[])*(beta^3)*alpha
  pC15E13 <- sum(E13[])/sum(N[])*(beta^2)*alpha
  pC15E14 <- sum(E14[])/sum(N[])*beta*alpha
  pC15E15 <- sum(E15[])/sum(N[])*alpha
  pC15E16 <- sum(E16[])/sum(N[])*beta*alpha
  pC15E17 <- sum(E17[])/sum(N[])*(beta^2)*alpha

  pC15C10 <- sum(C10[])/sum(N[])*(beta^5)
  pC15C11 <- sum(C11[])/sum(N[])*(beta^4)
  pC15C12 <- sum(C12[])/sum(N[])*(beta^3)
  pC15C13 <- sum(C13[])/sum(N[])*(beta^2)
  pC15C14 <- sum(C14[])/sum(N[])*beta
  pC15C15 <- sum(C15[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(I11[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(I12[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(I13[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(I14[])/sum(N[])*(1-beta*(alpha^2)) + sum(I15[])/sum(N[])*(1-(alpha^2)) + sum(I16[])/sum(N[])*(1-(beta*(alpha^2))) + sum(I17[])/sum(N[])*(1-((beta^2)*(alpha^2))) + sum(E10[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E14[])/sum(N[])*(1-(beta*alpha)) + sum(E15[])/sum(N[])*(1-alpha) + sum(E16[])/sum(N[])*(1-(beta*alpha)) + sum(E17[])/sum(N[])*(1-((beta^2)*alpha)) + sum(C10[])/sum(N[])*(1-(beta^5)) + sum(C11[])/sum(N[])*(1-(beta^4)) + sum(C12[])/sum(N[])*(1-(beta^3)) + sum(C13[])/sum(N[])*(1-(beta^2)) + sum(C14[])/sum(N[])*(1-beta) + sum(C16[])/sum(N[])*(1-beta) + sum(C17[])/sum(N[])*(1-(beta^2))
  pC15C16 <- sum(C16[])/sum(N[])*beta
  pC15C17 <- sum(C17[])/sum(N[])*(beta^2)

  #####################################
  pC16I10 <- sum(I10[])/sum(N[])*(beta^6)*(alpha^2)
  pC16I11 <- sum(I11[])/sum(N[])*(beta^5)*(alpha^2)
  pC16I12 <- sum(I12[])/sum(N[])*(beta^4)*(alpha^2)
  pC16I13 <- sum(I13[])/sum(N[])*(beta^3)*(alpha^2)
  pC16I14 <- sum(I14[])/sum(N[])*(beta^2)*(alpha^2)
  pC16I15 <- sum(I15[])/sum(N[])*beta*(alpha^2)
  pC16I16 <- sum(I16[])/sum(N[])*(alpha^2)
  pC16I17 <- sum(I17[])/sum(N[])*beta*(alpha^2)

  pC16E10 <- sum(E10[])/sum(N[])*(beta^6)*alpha
  pC16E11 <- sum(E11[])/sum(N[])*(beta^5)*alpha
  pC16E12 <- sum(E12[])/sum(N[])*(beta^4)*alpha
  pC16E13 <- sum(E13[])/sum(N[])*(beta^3)*alpha
  pC16E14 <- sum(E14[])/sum(N[])*(beta^2)*alpha
  pC16E15 <- sum(E15[])/sum(N[])*beta*alpha
  pC16E16 <- sum(E16[])/sum(N[])*alpha
  pC16E17 <- sum(E17[])/sum(N[])*beta*alpha

  pC16C10 <- sum(C10[])/sum(N[])*(beta^6)
  pC16C11 <- sum(C11[])/sum(N[])*(beta^5)
  pC16C12 <- sum(C12[])/sum(N[])*(beta^4)
  pC16C13 <- sum(C13[])/sum(N[])*(beta^3)
  pC16C14 <- sum(C14[])/sum(N[])*(beta^2)
  pC16C15 <- sum(C15[])/sum(N[])*beta
  pC16C16 <- sum(C16[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^6)*(alpha^2)) + sum(I11[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(I12[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(I13[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(I14[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(I15[])/sum(N[])*(1-beta*(alpha^2)) + sum(I16[])/sum(N[])*(1-(alpha^2)) + sum(I17[])/sum(N[])*(1-(beta*(alpha^2))) + sum(E10[])/sum(N[])*(1-((beta^6)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E15[])/sum(N[])*(1-(beta*alpha)) + sum(E16[])/sum(N[])*(1-alpha) + sum(E17[])/sum(N[])*(1-(beta*alpha)) + sum(C10[])/sum(N[])*(1-(beta^6)) + sum(C11[])/sum(N[])*(1-(beta^5)) + sum(C12[])/sum(N[])*(1-(beta^4)) + sum(C13[])/sum(N[])*(1-(beta^3)) + sum(C14[])/sum(N[])*(1-(beta^2)) + sum(C15[])/sum(N[])*(1-beta) + sum(C17[])/sum(N[])*(1-beta)
  pC16C17 <- sum(C17[])/sum(N[])*beta

  #####################################
  pC17I10 <- sum(I10[])/sum(N[])*(beta^7)*(alpha^2)
  pC17I11 <- sum(I11[])/sum(N[])*(beta^6)*(alpha^2)
  pC17I12 <- sum(I12[])/sum(N[])*(beta^5)*(alpha^2)
  pC17I13 <- sum(I13[])/sum(N[])*(beta^4)*(alpha^2)
  pC17I14 <- sum(I14[])/sum(N[])*(beta^3)*(alpha^2)
  pC17I15 <- sum(I15[])/sum(N[])*(beta^2)*(alpha^2)
  pC17I16 <- sum(I16[])/sum(N[])*beta*(alpha^2)
  pC17I17 <- sum(I17[])/sum(N[])*(alpha^2)

  pC17E10 <- sum(E10[])/sum(N[])*(beta^7)*alpha
  pC17E11 <- sum(E11[])/sum(N[])*(beta^6)*alpha
  pC17E12 <- sum(E12[])/sum(N[])*(beta^5)*alpha
  pC17E13 <- sum(E13[])/sum(N[])*(beta^4)*alpha
  pC17E14 <- sum(E14[])/sum(N[])*(beta^3)*alpha
  pC17E15 <- sum(E15[])/sum(N[])*(beta^2)*alpha
  pC17E16 <- sum(E16[])/sum(N[])*beta*alpha
  pC17E17 <- sum(E17[])/sum(N[])*alpha

  pC17C10 <- sum(C10[])/sum(N[])*(beta^7)
  pC17C11 <- sum(C11[])/sum(N[])*(beta^6)
  pC17C12 <- sum(C12[])/sum(N[])*(beta^5)
  pC17C13 <- sum(C13[])/sum(N[])*(beta^4)
  pC17C14 <- sum(C14[])/sum(N[])*(beta^3)
  pC17C15 <- sum(C15[])/sum(N[])*(beta^2)
  pC17C16 <- sum(C16[])/sum(N[])*beta
  pC17C17 <- sum(C17[])/sum(N[]) + sum(I10[])/sum(N[])*(1-(beta^7)*(alpha^2)) + sum(I11[])/sum(N[])*(1-(beta^6)*(alpha^2)) + sum(I12[])/sum(N[])*(1-(beta^5)*(alpha^2)) + sum(I13[])/sum(N[])*(1-(beta^4)*(alpha^2)) + sum(I14[])/sum(N[])*(1-(beta^3)*(alpha^2)) + sum(I15[])/sum(N[])*(1-(beta^2)*(alpha^2)) + sum(I16[])/sum(N[])*(1-beta*(alpha^2)) + sum(I17[])/sum(N[])*(1-(alpha^2)) + sum(E10[])/sum(N[])*(1-((beta^7)*alpha)) + sum(E11[])/sum(N[])*(1-((beta^6)*alpha)) + sum(E12[])/sum(N[])*(1-((beta^5)*alpha)) + sum(E13[])/sum(N[])*(1-((beta^4)*alpha)) + sum(E14[])/sum(N[])*(1-((beta^3)*alpha)) + sum(E15[])/sum(N[])*(1-((beta^2)*alpha)) + sum(E16[])/sum(N[])*(1-(beta*alpha)) + sum(E17[])/sum(N[])*(1-alpha) + sum(C10[])/sum(N[])*(1-(beta^7)) + sum(C11[])/sum(N[])*(1-(beta^6)) + sum(C12[])/sum(N[])*(1-(beta^5)) + sum(C13[])/sum(N[])*(1-(beta^4)) + sum(C14[])/sum(N[])*(1-(beta^3)) + sum(C15[])/sum(N[])*(1-(beta^2)) + sum(C16[])/sum(N[])*(1-beta)



##############################################################################################################################
 #proportion of cl in each age and class groups contacts
##############################################################################################################################

  ###COUNTY LINES CONTACTS################################################################################################################

  I10_cl_contact[] <- pI10I10*(WCOMi10[i]/COMi10[i]) + pI10I11*(WCOMi11[i]/COMi11[i]) + pI10I12*(WCOMi12[i]/COMi12[i]) + pI10I13*(WCOMi13[i]/COMi13[i]) + pI10I14*(WCOMi14[i]/COMi14[i]) + pI10I15*(WCOMi15[i]/COMi15[i]) + pI10I16*(WCOMi16[i]/COMi16[i]) + pI10I17*(WCOMi17[i]/COMi17[i]) +	pI10E10*(WCOMe10[i]/COMe10[i]) + pI10E11*(WCOMe11[i]/COMe11[i]) + pI10E12*(WCOMe12[i]/COMe12[i]) + pI10E13*(WCOMe13[i]/COMe13[i]) + pI10E14*(WCOMe14[i]/COMe14[i]) + pI10E15*(WCOMe15[i]/COMe15[i]) + pI10E16*(WCOMe16[i]/COMe16[i]) + pI10E17*(WCOMe17[i]/COMe17[i]) +	pI10C10*(WCOMc10[i]/COMc10[i]) + pI10C11*(WCOMc11[i]/COMc11[i]) + pI10C12*(WCOMc12[i]/COMc12[i]) + pI10C13*(WCOMc13[i]/COMc13[i]) + pI10C14*(WCOMc14[i]/COMc14[i]) + pI10C15*(WCOMc15[i]/COMc15[i]) + pI10C16*(WCOMc16[i]/COMc16[i]) + pI10C17*(WCOMc17[i]/COMc17[i])
  I11_cl_contact[] <- pI11I10*(WCOMi10[i]/COMi10[i]) + pI11I11*(WCOMi11[i]/COMi11[i]) + pI11I12*(WCOMi12[i]/COMi12[i]) + pI11I13*(WCOMi13[i]/COMi13[i]) + pI11I14*(WCOMi14[i]/COMi14[i]) + pI11I15*(WCOMi15[i]/COMi15[i]) + pI11I16*(WCOMi16[i]/COMi16[i]) + pI11I17*(WCOMi17[i]/COMi17[i]) +	pI11E10*(WCOMe10[i]/COMe10[i]) + pI11E11*(WCOMe11[i]/COMe11[i]) + pI11E12*(WCOMe12[i]/COMe12[i]) + pI11E13*(WCOMe13[i]/COMe13[i]) + pI11E14*(WCOMe14[i]/COMe14[i]) + pI11E15*(WCOMe15[i]/COMe15[i]) + pI11E16*(WCOMe16[i]/COMe16[i]) + pI11E17*(WCOMe17[i]/COMe17[i]) +	pI11C10*(WCOMc10[i]/COMc10[i]) + pI11C11*(WCOMc11[i]/COMc11[i]) + pI11C12*(WCOMc12[i]/COMc12[i]) + pI11C13*(WCOMc13[i]/COMc13[i]) + pI11C14*(WCOMc14[i]/COMc14[i]) + pI11C15*(WCOMc15[i]/COMc15[i]) + pI11C16*(WCOMc16[i]/COMc16[i]) + pI11C17*(WCOMc17[i]/COMc17[i])
  I12_cl_contact[] <- pI12I10*(WCOMi10[i]/COMi10[i]) + pI12I11*(WCOMi11[i]/COMi11[i]) + pI12I12*(WCOMi12[i]/COMi12[i]) + pI12I13*(WCOMi13[i]/COMi13[i]) + pI12I14*(WCOMi14[i]/COMi14[i]) + pI12I15*(WCOMi15[i]/COMi15[i]) + pI12I16*(WCOMi16[i]/COMi16[i]) + pI12I17*(WCOMi17[i]/COMi17[i]) +	pI12E10*(WCOMe10[i]/COMe10[i]) + pI12E11*(WCOMe11[i]/COMe11[i]) + pI12E12*(WCOMe12[i]/COMe12[i]) + pI12E13*(WCOMe13[i]/COMe13[i]) + pI12E14*(WCOMe14[i]/COMe14[i]) + pI12E15*(WCOMe15[i]/COMe15[i]) + pI12E16*(WCOMe16[i]/COMe16[i]) + pI12E17*(WCOMe17[i]/COMe17[i]) +	pI12C10*(WCOMc10[i]/COMc10[i]) + pI12C11*(WCOMc11[i]/COMc11[i]) + pI12C12*(WCOMc12[i]/COMc12[i]) + pI12C13*(WCOMc13[i]/COMc13[i]) + pI12C14*(WCOMc14[i]/COMc14[i]) + pI12C15*(WCOMc15[i]/COMc15[i]) + pI12C16*(WCOMc16[i]/COMc16[i]) + pI12C17*(WCOMc17[i]/COMc17[i])
  I13_cl_contact[] <- pI13I10*(WCOMi10[i]/COMi10[i]) + pI13I11*(WCOMi11[i]/COMi11[i]) + pI13I12*(WCOMi12[i]/COMi12[i]) + pI13I13*(WCOMi13[i]/COMi13[i]) + pI13I14*(WCOMi14[i]/COMi14[i]) + pI13I15*(WCOMi15[i]/COMi15[i]) + pI13I16*(WCOMi16[i]/COMi16[i]) + pI13I17*(WCOMi17[i]/COMi17[i]) +	pI13E10*(WCOMe10[i]/COMe10[i]) + pI13E11*(WCOMe11[i]/COMe11[i]) + pI13E12*(WCOMe12[i]/COMe12[i]) + pI13E13*(WCOMe13[i]/COMe13[i]) + pI13E14*(WCOMe14[i]/COMe14[i]) + pI13E15*(WCOMe15[i]/COMe15[i]) + pI13E16*(WCOMe16[i]/COMe16[i]) + pI13E17*(WCOMe17[i]/COMe17[i]) +	pI13C10*(WCOMc10[i]/COMc10[i]) + pI13C11*(WCOMc11[i]/COMc11[i]) + pI13C12*(WCOMc12[i]/COMc12[i]) + pI13C13*(WCOMc13[i]/COMc13[i]) + pI13C14*(WCOMc14[i]/COMc14[i]) + pI13C15*(WCOMc15[i]/COMc15[i]) + pI13C16*(WCOMc16[i]/COMc16[i]) + pI13C17*(WCOMc17[i]/COMc17[i])
  I14_cl_contact[] <- pI14I10*(WCOMi10[i]/COMi10[i]) + pI14I11*(WCOMi11[i]/COMi11[i]) + pI14I12*(WCOMi12[i]/COMi12[i]) + pI14I13*(WCOMi13[i]/COMi13[i]) + pI14I14*(WCOMi14[i]/COMi14[i]) + pI14I15*(WCOMi15[i]/COMi15[i]) + pI14I16*(WCOMi16[i]/COMi16[i]) + pI14I17*(WCOMi17[i]/COMi17[i]) +	pI14E10*(WCOMe10[i]/COMe10[i]) + pI14E11*(WCOMe11[i]/COMe11[i]) + pI14E12*(WCOMe12[i]/COMe12[i]) + pI14E13*(WCOMe13[i]/COMe13[i]) + pI14E14*(WCOMe14[i]/COMe14[i]) + pI14E15*(WCOMe15[i]/COMe15[i]) + pI14E16*(WCOMe16[i]/COMe16[i]) + pI14E17*(WCOMe17[i]/COMe17[i]) +	pI14C10*(WCOMc10[i]/COMc10[i]) + pI14C11*(WCOMc11[i]/COMc11[i]) + pI14C12*(WCOMc12[i]/COMc12[i]) + pI14C13*(WCOMc13[i]/COMc13[i]) + pI14C14*(WCOMc14[i]/COMc14[i]) + pI14C15*(WCOMc15[i]/COMc15[i]) + pI14C16*(WCOMc16[i]/COMc16[i]) + pI14C17*(WCOMc17[i]/COMc17[i])
  I15_cl_contact[] <- pI15I10*(WCOMi10[i]/COMi10[i]) + pI15I11*(WCOMi11[i]/COMi11[i]) + pI15I12*(WCOMi12[i]/COMi12[i]) + pI15I13*(WCOMi13[i]/COMi13[i]) + pI15I14*(WCOMi14[i]/COMi14[i]) + pI15I15*(WCOMi15[i]/COMi15[i]) + pI15I16*(WCOMi16[i]/COMi16[i]) + pI15I17*(WCOMi17[i]/COMi17[i]) +	pI15E10*(WCOMe10[i]/COMe10[i]) + pI15E11*(WCOMe11[i]/COMe11[i]) + pI15E12*(WCOMe12[i]/COMe12[i]) + pI15E13*(WCOMe13[i]/COMe13[i]) + pI15E14*(WCOMe14[i]/COMe14[i]) + pI15E15*(WCOMe15[i]/COMe15[i]) + pI15E16*(WCOMe16[i]/COMe16[i]) + pI15E17*(WCOMe17[i]/COMe17[i]) +	pI15C10*(WCOMc10[i]/COMc10[i]) + pI15C11*(WCOMc11[i]/COMc11[i]) + pI15C12*(WCOMc12[i]/COMc12[i]) + pI15C13*(WCOMc13[i]/COMc13[i]) + pI15C14*(WCOMc14[i]/COMc14[i]) + pI15C15*(WCOMc15[i]/COMc15[i]) + pI15C16*(WCOMc16[i]/COMc16[i]) + pI15C17*(WCOMc17[i]/COMc17[i])
  I16_cl_contact[] <- pI16I10*(WCOMi10[i]/COMi10[i]) + pI16I11*(WCOMi11[i]/COMi11[i]) + pI16I12*(WCOMi12[i]/COMi12[i]) + pI16I13*(WCOMi13[i]/COMi13[i]) + pI16I14*(WCOMi14[i]/COMi14[i]) + pI16I15*(WCOMi15[i]/COMi15[i]) + pI16I16*(WCOMi16[i]/COMi16[i]) + pI16I17*(WCOMi17[i]/COMi17[i]) +	pI16E10*(WCOMe10[i]/COMe10[i]) + pI16E11*(WCOMe11[i]/COMe11[i]) + pI16E12*(WCOMe12[i]/COMe12[i]) + pI16E13*(WCOMe13[i]/COMe13[i]) + pI16E14*(WCOMe14[i]/COMe14[i]) + pI16E15*(WCOMe15[i]/COMe15[i]) + pI16E16*(WCOMe16[i]/COMe16[i]) + pI16E17*(WCOMe17[i]/COMe17[i]) +	pI16C10*(WCOMc10[i]/COMc10[i]) + pI16C11*(WCOMc11[i]/COMc11[i]) + pI16C12*(WCOMc12[i]/COMc12[i]) + pI16C13*(WCOMc13[i]/COMc13[i]) + pI16C14*(WCOMc14[i]/COMc14[i]) + pI16C15*(WCOMc15[i]/COMc15[i]) + pI16C16*(WCOMc16[i]/COMc16[i]) + pI16C17*(WCOMc17[i]/COMc17[i])
  I17_cl_contact[] <- pI17I10*(WCOMi10[i]/COMi10[i]) + pI17I11*(WCOMi11[i]/COMi11[i]) + pI17I12*(WCOMi12[i]/COMi12[i]) + pI17I13*(WCOMi13[i]/COMi13[i]) + pI17I14*(WCOMi14[i]/COMi14[i]) + pI17I15*(WCOMi15[i]/COMi15[i]) + pI17I16*(WCOMi16[i]/COMi16[i]) + pI17I17*(WCOMi17[i]/COMi17[i]) +	pI17E10*(WCOMe10[i]/COMe10[i]) + pI17E11*(WCOMe11[i]/COMe11[i]) + pI17E12*(WCOMe12[i]/COMe12[i]) + pI17E13*(WCOMe13[i]/COMe13[i]) + pI17E14*(WCOMe14[i]/COMe14[i]) + pI17E15*(WCOMe15[i]/COMe15[i]) + pI17E16*(WCOMe16[i]/COMe16[i]) + pI17E17*(WCOMe17[i]/COMe17[i]) +	pI17C10*(WCOMc10[i]/COMc10[i]) + pI17C11*(WCOMc11[i]/COMc11[i]) + pI17C12*(WCOMc12[i]/COMc12[i]) + pI17C13*(WCOMc13[i]/COMc13[i]) + pI17C14*(WCOMc14[i]/COMc14[i]) + pI17C15*(WCOMc15[i]/COMc15[i]) + pI17C16*(WCOMc16[i]/COMc16[i]) + pI17C17*(WCOMc17[i]/COMc17[i])

  E10_cl_contact[] <- pE10I10*(WCOMi10[i]/COMi10[i]) + pE10I11*(WCOMi11[i]/COMi11[i]) + pE10I12*(WCOMi12[i]/COMi12[i]) + pE10I13*(WCOMi13[i]/COMi13[i]) + pE10I14*(WCOMi14[i]/COMi14[i]) + pE10I15*(WCOMi15[i]/COMi15[i]) + pE10I16*(WCOMi16[i]/COMi16[i]) + pE10I17*(WCOMi17[i]/COMi17[i]) +	pE10E10*(WCOMe10[i]/COMe10[i]) + pE10E11*(WCOMe11[i]/COMe11[i]) + pE10E12*(WCOMe12[i]/COMe12[i]) + pE10E13*(WCOMe13[i]/COMe13[i]) + pE10E14*(WCOMe14[i]/COMe14[i]) + pE10E15*(WCOMe15[i]/COMe15[i]) + pE10E16*(WCOMe16[i]/COMe16[i]) + pE10E17*(WCOMe17[i]/COMe17[i]) +	pE10C10*(WCOMc10[i]/COMc10[i]) + pE10C11*(WCOMc11[i]/COMc11[i]) + pE10C12*(WCOMc12[i]/COMc12[i]) + pE10C13*(WCOMc13[i]/COMc13[i]) + pE10C14*(WCOMc14[i]/COMc14[i]) + pE10C15*(WCOMc15[i]/COMc15[i]) + pE10C16*(WCOMc16[i]/COMc16[i]) + pE10C17*(WCOMc17[i]/COMc17[i])
  E11_cl_contact[] <- pE11I10*(WCOMi10[i]/COMi10[i]) + pE11I11*(WCOMi11[i]/COMi11[i]) + pE11I12*(WCOMi12[i]/COMi12[i]) + pE11I13*(WCOMi13[i]/COMi13[i]) + pE11I14*(WCOMi14[i]/COMi14[i]) + pE11I15*(WCOMi15[i]/COMi15[i]) + pE11I16*(WCOMi16[i]/COMi16[i]) + pE11I17*(WCOMi17[i]/COMi17[i]) +	pE11E10*(WCOMe10[i]/COMe10[i]) + pE11E11*(WCOMe11[i]/COMe11[i]) + pE11E12*(WCOMe12[i]/COMe12[i]) + pE11E13*(WCOMe13[i]/COMe13[i]) + pE11E14*(WCOMe14[i]/COMe14[i]) + pE11E15*(WCOMe15[i]/COMe15[i]) + pE11E16*(WCOMe16[i]/COMe16[i]) + pE11E17*(WCOMe17[i]/COMe17[i]) +	pE11C10*(WCOMc10[i]/COMc10[i]) + pE11C11*(WCOMc11[i]/COMc11[i]) + pE11C12*(WCOMc12[i]/COMc12[i]) + pE11C13*(WCOMc13[i]/COMc13[i]) + pE11C14*(WCOMc14[i]/COMc14[i]) + pE11C15*(WCOMc15[i]/COMc15[i]) + pE11C16*(WCOMc16[i]/COMc16[i]) + pE11C17*(WCOMc17[i]/COMc17[i])
  E12_cl_contact[] <- pE12I10*(WCOMi10[i]/COMi10[i]) + pE12I11*(WCOMi11[i]/COMi11[i]) + pE12I12*(WCOMi12[i]/COMi12[i]) + pE12I13*(WCOMi13[i]/COMi13[i]) + pE12I14*(WCOMi14[i]/COMi14[i]) + pE12I15*(WCOMi15[i]/COMi15[i]) + pE12I16*(WCOMi16[i]/COMi16[i]) + pE12I17*(WCOMi17[i]/COMi17[i]) +	pE12E10*(WCOMe10[i]/COMe10[i]) + pE12E11*(WCOMe11[i]/COMe11[i]) + pE12E12*(WCOMe12[i]/COMe12[i]) + pE12E13*(WCOMe13[i]/COMe13[i]) + pE12E14*(WCOMe14[i]/COMe14[i]) + pE12E15*(WCOMe15[i]/COMe15[i]) + pE12E16*(WCOMe16[i]/COMe16[i]) + pE12E17*(WCOMe17[i]/COMe17[i]) +	pE12C10*(WCOMc10[i]/COMc10[i]) + pE12C11*(WCOMc11[i]/COMc11[i]) + pE12C12*(WCOMc12[i]/COMc12[i]) + pE12C13*(WCOMc13[i]/COMc13[i]) + pE12C14*(WCOMc14[i]/COMc14[i]) + pE12C15*(WCOMc15[i]/COMc15[i]) + pE12C16*(WCOMc16[i]/COMc16[i]) + pE12C17*(WCOMc17[i]/COMc17[i])
  E13_cl_contact[] <- pE13I10*(WCOMi10[i]/COMi10[i]) + pE13I11*(WCOMi11[i]/COMi11[i]) + pE13I12*(WCOMi12[i]/COMi12[i]) + pE13I13*(WCOMi13[i]/COMi13[i]) + pE13I14*(WCOMi14[i]/COMi14[i]) + pE13I15*(WCOMi15[i]/COMi15[i]) + pE13I16*(WCOMi16[i]/COMi16[i]) + pE13I17*(WCOMi17[i]/COMi17[i]) +	pE13E10*(WCOMe10[i]/COMe10[i]) + pE13E11*(WCOMe11[i]/COMe11[i]) + pE13E12*(WCOMe12[i]/COMe12[i]) + pE13E13*(WCOMe13[i]/COMe13[i]) + pE13E14*(WCOMe14[i]/COMe14[i]) + pE13E15*(WCOMe15[i]/COMe15[i]) + pE13E16*(WCOMe16[i]/COMe16[i]) + pE13E17*(WCOMe17[i]/COMe17[i]) +	pE13C10*(WCOMc10[i]/COMc10[i]) + pE13C11*(WCOMc11[i]/COMc11[i]) + pE13C12*(WCOMc12[i]/COMc12[i]) + pE13C13*(WCOMc13[i]/COMc13[i]) + pE13C14*(WCOMc14[i]/COMc14[i]) + pE13C15*(WCOMc15[i]/COMc15[i]) + pE13C16*(WCOMc16[i]/COMc16[i]) + pE13C17*(WCOMc17[i]/COMc17[i])
  E14_cl_contact[] <- pE14I10*(WCOMi10[i]/COMi10[i]) + pE14I11*(WCOMi11[i]/COMi11[i]) + pE14I12*(WCOMi12[i]/COMi12[i]) + pE14I13*(WCOMi13[i]/COMi13[i]) + pE14I14*(WCOMi14[i]/COMi14[i]) + pE14I15*(WCOMi15[i]/COMi15[i]) + pE14I16*(WCOMi16[i]/COMi16[i]) + pE14I17*(WCOMi17[i]/COMi17[i]) +	pE14E10*(WCOMe10[i]/COMe10[i]) + pE14E11*(WCOMe11[i]/COMe11[i]) + pE14E12*(WCOMe12[i]/COMe12[i]) + pE14E13*(WCOMe13[i]/COMe13[i]) + pE14E14*(WCOMe14[i]/COMe14[i]) + pE14E15*(WCOMe15[i]/COMe15[i]) + pE14E16*(WCOMe16[i]/COMe16[i]) + pE14E17*(WCOMe17[i]/COMe17[i]) +	pE14C10*(WCOMc10[i]/COMc10[i]) + pE14C11*(WCOMc11[i]/COMc11[i]) + pE14C12*(WCOMc12[i]/COMc12[i]) + pE14C13*(WCOMc13[i]/COMc13[i]) + pE14C14*(WCOMc14[i]/COMc14[i]) + pE14C15*(WCOMc15[i]/COMc15[i]) + pE14C16*(WCOMc16[i]/COMc16[i]) + pE14C17*(WCOMc17[i]/COMc17[i])
  E15_cl_contact[] <- pE15I10*(WCOMi10[i]/COMi10[i]) + pE15I11*(WCOMi11[i]/COMi11[i]) + pE15I12*(WCOMi12[i]/COMi12[i]) + pE15I13*(WCOMi13[i]/COMi13[i]) + pE15I14*(WCOMi14[i]/COMi14[i]) + pE15I15*(WCOMi15[i]/COMi15[i]) + pE15I16*(WCOMi16[i]/COMi16[i]) + pE15I17*(WCOMi17[i]/COMi17[i]) +	pE15E10*(WCOMe10[i]/COMe10[i]) + pE15E11*(WCOMe11[i]/COMe11[i]) + pE15E12*(WCOMe12[i]/COMe12[i]) + pE15E13*(WCOMe13[i]/COMe13[i]) + pE15E14*(WCOMe14[i]/COMe14[i]) + pE15E15*(WCOMe15[i]/COMe15[i]) + pE15E16*(WCOMe16[i]/COMe16[i]) + pE15E17*(WCOMe17[i]/COMe17[i]) +	pE15C10*(WCOMc10[i]/COMc10[i]) + pE15C11*(WCOMc11[i]/COMc11[i]) + pE15C12*(WCOMc12[i]/COMc12[i]) + pE15C13*(WCOMc13[i]/COMc13[i]) + pE15C14*(WCOMc14[i]/COMc14[i]) + pE15C15*(WCOMc15[i]/COMc15[i]) + pE15C16*(WCOMc16[i]/COMc16[i]) + pE15C17*(WCOMc17[i]/COMc17[i])
  E16_cl_contact[] <- pE16I10*(WCOMi10[i]/COMi10[i]) + pE16I11*(WCOMi11[i]/COMi11[i]) + pE16I12*(WCOMi12[i]/COMi12[i]) + pE16I13*(WCOMi13[i]/COMi13[i]) + pE16I14*(WCOMi14[i]/COMi14[i]) + pE16I15*(WCOMi15[i]/COMi15[i]) + pE16I16*(WCOMi16[i]/COMi16[i]) + pE16I17*(WCOMi17[i]/COMi17[i]) +	pE16E10*(WCOMe10[i]/COMe10[i]) + pE16E11*(WCOMe11[i]/COMe11[i]) + pE16E12*(WCOMe12[i]/COMe12[i]) + pE16E13*(WCOMe13[i]/COMe13[i]) + pE16E14*(WCOMe14[i]/COMe14[i]) + pE16E15*(WCOMe15[i]/COMe15[i]) + pE16E16*(WCOMe16[i]/COMe16[i]) + pE16E17*(WCOMe17[i]/COMe17[i]) +	pE16C10*(WCOMc10[i]/COMc10[i]) + pE16C11*(WCOMc11[i]/COMc11[i]) + pE16C12*(WCOMc12[i]/COMc12[i]) + pE16C13*(WCOMc13[i]/COMc13[i]) + pE16C14*(WCOMc14[i]/COMc14[i]) + pE16C15*(WCOMc15[i]/COMc15[i]) + pE16C16*(WCOMc16[i]/COMc16[i]) + pE16C17*(WCOMc17[i]/COMc17[i])
  E17_cl_contact[] <- pE17I10*(WCOMi10[i]/COMi10[i]) + pE17I11*(WCOMi11[i]/COMi11[i]) + pE17I12*(WCOMi12[i]/COMi12[i]) + pE17I13*(WCOMi13[i]/COMi13[i]) + pE17I14*(WCOMi14[i]/COMi14[i]) + pE17I15*(WCOMi15[i]/COMi15[i]) + pE17I16*(WCOMi16[i]/COMi16[i]) + pE17I17*(WCOMi17[i]/COMi17[i]) +	pE17E10*(WCOMe10[i]/COMe10[i]) + pE17E11*(WCOMe11[i]/COMe11[i]) + pE17E12*(WCOMe12[i]/COMe12[i]) + pE17E13*(WCOMe13[i]/COMe13[i]) + pE17E14*(WCOMe14[i]/COMe14[i]) + pE17E15*(WCOMe15[i]/COMe15[i]) + pE17E16*(WCOMe16[i]/COMe16[i]) + pE17E17*(WCOMe17[i]/COMe17[i]) +	pE17C10*(WCOMc10[i]/COMc10[i]) + pE17C11*(WCOMc11[i]/COMc11[i]) + pE17C12*(WCOMc12[i]/COMc12[i]) + pE17C13*(WCOMc13[i]/COMc13[i]) + pE17C14*(WCOMc14[i]/COMc14[i]) + pE17C15*(WCOMc15[i]/COMc15[i]) + pE17C16*(WCOMc16[i]/COMc16[i]) + pE17C17*(WCOMc17[i]/COMc17[i])

  C10_cl_contact[] <- pC10I10*(WCOMi10[i]/COMi10[i]) + pC10I11*(WCOMi11[i]/COMi11[i]) + pC10I12*(WCOMi12[i]/COMi12[i]) + pC10I13*(WCOMi13[i]/COMi13[i]) + pC10I14*(WCOMi14[i]/COMi14[i]) + pC10I15*(WCOMi15[i]/COMi15[i]) + pC10I16*(WCOMi16[i]/COMi16[i]) + pC10I17*(WCOMi17[i]/COMi17[i]) +	pC10E10*(WCOMe10[i]/COMe10[i]) + pC10E11*(WCOMe11[i]/COMe11[i]) + pC10E12*(WCOMe12[i]/COMe12[i]) + pC10E13*(WCOMe13[i]/COMe13[i]) + pC10E14*(WCOMe14[i]/COMe14[i]) + pC10E15*(WCOMe15[i]/COMe15[i]) + pC10E16*(WCOMe16[i]/COMe16[i]) + pC10E17*(WCOMe17[i]/COMe17[i]) +	pC10C10*(WCOMc10[i]/COMc10[i]) + pC10C11*(WCOMc11[i]/COMc11[i]) + pC10C12*(WCOMc12[i]/COMc12[i]) + pC10C13*(WCOMc13[i]/COMc13[i]) + pC10C14*(WCOMc14[i]/COMc14[i]) + pC10C15*(WCOMc15[i]/COMc15[i]) + pC10C16*(WCOMc16[i]/COMc16[i]) + pC10C17*(WCOMc17[i]/COMc17[i])
  C11_cl_contact[] <- pC11I10*(WCOMi10[i]/COMi10[i]) + pC11I11*(WCOMi11[i]/COMi11[i]) + pC11I12*(WCOMi12[i]/COMi12[i]) + pC11I13*(WCOMi13[i]/COMi13[i]) + pC11I14*(WCOMi14[i]/COMi14[i]) + pC11I15*(WCOMi15[i]/COMi15[i]) + pC11I16*(WCOMi16[i]/COMi16[i]) + pC11I17*(WCOMi17[i]/COMi17[i]) +	pC11E10*(WCOMe10[i]/COMe10[i]) + pC11E11*(WCOMe11[i]/COMe11[i]) + pC11E12*(WCOMe12[i]/COMe12[i]) + pC11E13*(WCOMe13[i]/COMe13[i]) + pC11E14*(WCOMe14[i]/COMe14[i]) + pC11E15*(WCOMe15[i]/COMe15[i]) + pC11E16*(WCOMe16[i]/COMe16[i]) + pC11E17*(WCOMe17[i]/COMe17[i]) +	pC11C10*(WCOMc10[i]/COMc10[i]) + pC11C11*(WCOMc11[i]/COMc11[i]) + pC11C12*(WCOMc12[i]/COMc12[i]) + pC11C13*(WCOMc13[i]/COMc13[i]) + pC11C14*(WCOMc14[i]/COMc14[i]) + pC11C15*(WCOMc15[i]/COMc15[i]) + pC11C16*(WCOMc16[i]/COMc16[i]) + pC11C17*(WCOMc17[i]/COMc17[i])
  C12_cl_contact[] <- pC12I10*(WCOMi10[i]/COMi10[i]) + pC12I11*(WCOMi11[i]/COMi11[i]) + pC12I12*(WCOMi12[i]/COMi12[i]) + pC12I13*(WCOMi13[i]/COMi13[i]) + pC12I14*(WCOMi14[i]/COMi14[i]) + pC12I15*(WCOMi15[i]/COMi15[i]) + pC12I16*(WCOMi16[i]/COMi16[i]) + pC12I17*(WCOMi17[i]/COMi17[i]) +	pC12E10*(WCOMe10[i]/COMe10[i]) + pC12E11*(WCOMe11[i]/COMe11[i]) + pC12E12*(WCOMe12[i]/COMe12[i]) + pC12E13*(WCOMe13[i]/COMe13[i]) + pC12E14*(WCOMe14[i]/COMe14[i]) + pC12E15*(WCOMe15[i]/COMe15[i]) + pC12E16*(WCOMe16[i]/COMe16[i]) + pC12E17*(WCOMe17[i]/COMe17[i]) +	pC12C10*(WCOMc10[i]/COMc10[i]) + pC12C11*(WCOMc11[i]/COMc11[i]) + pC12C12*(WCOMc12[i]/COMc12[i]) + pC12C13*(WCOMc13[i]/COMc13[i]) + pC12C14*(WCOMc14[i]/COMc14[i]) + pC12C15*(WCOMc15[i]/COMc15[i]) + pC12C16*(WCOMc16[i]/COMc16[i]) + pC12C17*(WCOMc17[i]/COMc17[i])
  C13_cl_contact[] <- pC13I10*(WCOMi10[i]/COMi10[i]) + pC13I11*(WCOMi11[i]/COMi11[i]) + pC13I12*(WCOMi12[i]/COMi12[i]) + pC13I13*(WCOMi13[i]/COMi13[i]) + pC13I14*(WCOMi14[i]/COMi14[i]) + pC13I15*(WCOMi15[i]/COMi15[i]) + pC13I16*(WCOMi16[i]/COMi16[i]) + pC13I17*(WCOMi17[i]/COMi17[i]) +	pC13E10*(WCOMe10[i]/COMe10[i]) + pC13E11*(WCOMe11[i]/COMe11[i]) + pC13E12*(WCOMe12[i]/COMe12[i]) + pC13E13*(WCOMe13[i]/COMe13[i]) + pC13E14*(WCOMe14[i]/COMe14[i]) + pC13E15*(WCOMe15[i]/COMe15[i]) + pC13E16*(WCOMe16[i]/COMe16[i]) + pC13E17*(WCOMe17[i]/COMe17[i]) +	pC13C10*(WCOMc10[i]/COMc10[i]) + pC13C11*(WCOMc11[i]/COMc11[i]) + pC13C12*(WCOMc12[i]/COMc12[i]) + pC13C13*(WCOMc13[i]/COMc13[i]) + pC13C14*(WCOMc14[i]/COMc14[i]) + pC13C15*(WCOMc15[i]/COMc15[i]) + pC13C16*(WCOMc16[i]/COMc16[i]) + pC13C17*(WCOMc17[i]/COMc17[i])
  C14_cl_contact[] <- pC14I10*(WCOMi10[i]/COMi10[i]) + pC14I11*(WCOMi11[i]/COMi11[i]) + pC14I12*(WCOMi12[i]/COMi12[i]) + pC14I13*(WCOMi13[i]/COMi13[i]) + pC14I14*(WCOMi14[i]/COMi14[i]) + pC14I15*(WCOMi15[i]/COMi15[i]) + pC14I16*(WCOMi16[i]/COMi16[i]) + pC14I17*(WCOMi17[i]/COMi17[i]) +	pC14E10*(WCOMe10[i]/COMe10[i]) + pC14E11*(WCOMe11[i]/COMe11[i]) + pC14E12*(WCOMe12[i]/COMe12[i]) + pC14E13*(WCOMe13[i]/COMe13[i]) + pC14E14*(WCOMe14[i]/COMe14[i]) + pC14E15*(WCOMe15[i]/COMe15[i]) + pC14E16*(WCOMe16[i]/COMe16[i]) + pC14E17*(WCOMe17[i]/COMe17[i]) +	pC14C10*(WCOMc10[i]/COMc10[i]) + pC14C11*(WCOMc11[i]/COMc11[i]) + pC14C12*(WCOMc12[i]/COMc12[i]) + pC14C13*(WCOMc13[i]/COMc13[i]) + pC14C14*(WCOMc14[i]/COMc14[i]) + pC14C15*(WCOMc15[i]/COMc15[i]) + pC14C16*(WCOMc16[i]/COMc16[i]) + pC14C17*(WCOMc17[i]/COMc17[i])
  C15_cl_contact[] <- pC15I10*(WCOMi10[i]/COMi10[i]) + pC15I11*(WCOMi11[i]/COMi11[i]) + pC15I12*(WCOMi12[i]/COMi12[i]) + pC15I13*(WCOMi13[i]/COMi13[i]) + pC15I14*(WCOMi14[i]/COMi14[i]) + pC15I15*(WCOMi15[i]/COMi15[i]) + pC15I16*(WCOMi16[i]/COMi16[i]) + pC15I17*(WCOMi17[i]/COMi17[i]) +	pC15E10*(WCOMe10[i]/COMe10[i]) + pC15E11*(WCOMe11[i]/COMe11[i]) + pC15E12*(WCOMe12[i]/COMe12[i]) + pC15E13*(WCOMe13[i]/COMe13[i]) + pC15E14*(WCOMe14[i]/COMe14[i]) + pC15E15*(WCOMe15[i]/COMe15[i]) + pC15E16*(WCOMe16[i]/COMe16[i]) + pC15E17*(WCOMe17[i]/COMe17[i]) +	pC15C10*(WCOMc10[i]/COMc10[i]) + pC15C11*(WCOMc11[i]/COMc11[i]) + pC15C12*(WCOMc12[i]/COMc12[i]) + pC15C13*(WCOMc13[i]/COMc13[i]) + pC15C14*(WCOMc14[i]/COMc14[i]) + pC15C15*(WCOMc15[i]/COMc15[i]) + pC15C16*(WCOMc16[i]/COMc16[i]) + pC15C17*(WCOMc17[i]/COMc17[i])
  C16_cl_contact[] <- pC16I10*(WCOMi10[i]/COMi10[i]) + pC16I11*(WCOMi11[i]/COMi11[i]) + pC16I12*(WCOMi12[i]/COMi12[i]) + pC16I13*(WCOMi13[i]/COMi13[i]) + pC16I14*(WCOMi14[i]/COMi14[i]) + pC16I15*(WCOMi15[i]/COMi15[i]) + pC16I16*(WCOMi16[i]/COMi16[i]) + pC16I17*(WCOMi17[i]/COMi17[i]) +	pC16E10*(WCOMe10[i]/COMe10[i]) + pC16E11*(WCOMe11[i]/COMe11[i]) + pC16E12*(WCOMe12[i]/COMe12[i]) + pC16E13*(WCOMe13[i]/COMe13[i]) + pC16E14*(WCOMe14[i]/COMe14[i]) + pC16E15*(WCOMe15[i]/COMe15[i]) + pC16E16*(WCOMe16[i]/COMe16[i]) + pC16E17*(WCOMe17[i]/COMe17[i]) +	pC16C10*(WCOMc10[i]/COMc10[i]) + pC16C11*(WCOMc11[i]/COMc11[i]) + pC16C12*(WCOMc12[i]/COMc12[i]) + pC16C13*(WCOMc13[i]/COMc13[i]) + pC16C14*(WCOMc14[i]/COMc14[i]) + pC16C15*(WCOMc15[i]/COMc15[i]) + pC16C16*(WCOMc16[i]/COMc16[i]) + pC16C17*(WCOMc17[i]/COMc17[i])
  C17_cl_contact[] <- pC17I10*(WCOMi10[i]/COMi10[i]) + pC17I11*(WCOMi11[i]/COMi11[i]) + pC17I12*(WCOMi12[i]/COMi12[i]) + pC17I13*(WCOMi13[i]/COMi13[i]) + pC17I14*(WCOMi14[i]/COMi14[i]) + pC17I15*(WCOMi15[i]/COMi15[i]) + pC17I16*(WCOMi16[i]/COMi16[i]) + pC17I17*(WCOMi17[i]/COMi17[i]) +	pC17E10*(WCOMe10[i]/COMe10[i]) + pC17E11*(WCOMe11[i]/COMe11[i]) + pC17E12*(WCOMe12[i]/COMe12[i]) + pC17E13*(WCOMe13[i]/COMe13[i]) + pC17E14*(WCOMe14[i]/COMe14[i]) + pC17E15*(WCOMe15[i]/COMe15[i]) + pC17E16*(WCOMe16[i]/COMe16[i]) + pC17E17*(WCOMe17[i]/COMe17[i]) +	pC17C10*(WCOMc10[i]/COMc10[i]) + pC17C11*(WCOMc11[i]/COMc11[i]) + pC17C12*(WCOMc12[i]/COMc12[i]) + pC17C13*(WCOMc13[i]/COMc13[i]) + pC17C14*(WCOMc14[i]/COMc14[i]) + pC17C15*(WCOMc15[i]/COMc15[i]) + pC17C16*(WCOMc16[i]/COMc16[i]) + pC17C17*(WCOMc17[i]/COMc17[i])

  I10_surv_contact[] <- pI10I10*(SCOMi10[i]/COMi10[i]) + pI10I11*(SCOMi11[i]/COMi11[i]) + pI10I12*(SCOMi12[i]/COMi12[i]) + pI10I13*(SCOMi13[i]/COMi13[i]) + pI10I14*(SCOMi14[i]/COMi14[i]) + pI10I15*(SCOMi15[i]/COMi15[i]) + pI10I16*(SCOMi16[i]/COMi16[i]) + pI10I17*(SCOMi17[i]/COMi17[i]) +	pI10E10*(SCOMe10[i]/COMe10[i]) + pI10E11*(SCOMe11[i]/COMe11[i]) + pI10E12*(SCOMe12[i]/COMe12[i]) + pI10E13*(SCOMe13[i]/COMe13[i]) + pI10E14*(SCOMe14[i]/COMe14[i]) + pI10E15*(SCOMe15[i]/COMe15[i]) + pI10E16*(SCOMe16[i]/COMe16[i]) + pI10E17*(SCOMe17[i]/COMe17[i]) +	pI10C10*(SCOMc10[i]/COMc10[i]) + pI10C11*(SCOMc11[i]/COMc11[i]) + pI10C12*(SCOMc12[i]/COMc12[i]) + pI10C13*(SCOMc13[i]/COMc13[i]) + pI10C14*(SCOMc14[i]/COMc14[i]) + pI10C15*(SCOMc15[i]/COMc15[i]) + pI10C16*(SCOMc16[i]/COMc16[i]) + pI10C17*(SCOMc17[i]/COMc17[i])
  I11_surv_contact[] <- pI11I10*(SCOMi10[i]/COMi10[i]) + pI11I11*(SCOMi11[i]/COMi11[i]) + pI11I12*(SCOMi12[i]/COMi12[i]) + pI11I13*(SCOMi13[i]/COMi13[i]) + pI11I14*(SCOMi14[i]/COMi14[i]) + pI11I15*(SCOMi15[i]/COMi15[i]) + pI11I16*(SCOMi16[i]/COMi16[i]) + pI11I17*(SCOMi17[i]/COMi17[i]) +	pI11E10*(SCOMe10[i]/COMe10[i]) + pI11E11*(SCOMe11[i]/COMe11[i]) + pI11E12*(SCOMe12[i]/COMe12[i]) + pI11E13*(SCOMe13[i]/COMe13[i]) + pI11E14*(SCOMe14[i]/COMe14[i]) + pI11E15*(SCOMe15[i]/COMe15[i]) + pI11E16*(SCOMe16[i]/COMe16[i]) + pI11E17*(SCOMe17[i]/COMe17[i]) +	pI11C10*(SCOMc10[i]/COMc10[i]) + pI11C11*(SCOMc11[i]/COMc11[i]) + pI11C12*(SCOMc12[i]/COMc12[i]) + pI11C13*(SCOMc13[i]/COMc13[i]) + pI11C14*(SCOMc14[i]/COMc14[i]) + pI11C15*(SCOMc15[i]/COMc15[i]) + pI11C16*(SCOMc16[i]/COMc16[i]) + pI11C17*(SCOMc17[i]/COMc17[i])
  I12_surv_contact[] <- pI12I10*(SCOMi10[i]/COMi10[i]) + pI12I11*(SCOMi11[i]/COMi11[i]) + pI12I12*(SCOMi12[i]/COMi12[i]) + pI12I13*(SCOMi13[i]/COMi13[i]) + pI12I14*(SCOMi14[i]/COMi14[i]) + pI12I15*(SCOMi15[i]/COMi15[i]) + pI12I16*(SCOMi16[i]/COMi16[i]) + pI12I17*(SCOMi17[i]/COMi17[i]) +	pI12E10*(SCOMe10[i]/COMe10[i]) + pI12E11*(SCOMe11[i]/COMe11[i]) + pI12E12*(SCOMe12[i]/COMe12[i]) + pI12E13*(SCOMe13[i]/COMe13[i]) + pI12E14*(SCOMe14[i]/COMe14[i]) + pI12E15*(SCOMe15[i]/COMe15[i]) + pI12E16*(SCOMe16[i]/COMe16[i]) + pI12E17*(SCOMe17[i]/COMe17[i]) +	pI12C10*(SCOMc10[i]/COMc10[i]) + pI12C11*(SCOMc11[i]/COMc11[i]) + pI12C12*(SCOMc12[i]/COMc12[i]) + pI12C13*(SCOMc13[i]/COMc13[i]) + pI12C14*(SCOMc14[i]/COMc14[i]) + pI12C15*(SCOMc15[i]/COMc15[i]) + pI12C16*(SCOMc16[i]/COMc16[i]) + pI12C17*(SCOMc17[i]/COMc17[i])
  I13_surv_contact[] <- pI13I10*(SCOMi10[i]/COMi10[i]) + pI13I11*(SCOMi11[i]/COMi11[i]) + pI13I12*(SCOMi12[i]/COMi12[i]) + pI13I13*(SCOMi13[i]/COMi13[i]) + pI13I14*(SCOMi14[i]/COMi14[i]) + pI13I15*(SCOMi15[i]/COMi15[i]) + pI13I16*(SCOMi16[i]/COMi16[i]) + pI13I17*(SCOMi17[i]/COMi17[i]) +	pI13E10*(SCOMe10[i]/COMe10[i]) + pI13E11*(SCOMe11[i]/COMe11[i]) + pI13E12*(SCOMe12[i]/COMe12[i]) + pI13E13*(SCOMe13[i]/COMe13[i]) + pI13E14*(SCOMe14[i]/COMe14[i]) + pI13E15*(SCOMe15[i]/COMe15[i]) + pI13E16*(SCOMe16[i]/COMe16[i]) + pI13E17*(SCOMe17[i]/COMe17[i]) +	pI13C10*(SCOMc10[i]/COMc10[i]) + pI13C11*(SCOMc11[i]/COMc11[i]) + pI13C12*(SCOMc12[i]/COMc12[i]) + pI13C13*(SCOMc13[i]/COMc13[i]) + pI13C14*(SCOMc14[i]/COMc14[i]) + pI13C15*(SCOMc15[i]/COMc15[i]) + pI13C16*(SCOMc16[i]/COMc16[i]) + pI13C17*(SCOMc17[i]/COMc17[i])
  I14_surv_contact[] <- pI14I10*(SCOMi10[i]/COMi10[i]) + pI14I11*(SCOMi11[i]/COMi11[i]) + pI14I12*(SCOMi12[i]/COMi12[i]) + pI14I13*(SCOMi13[i]/COMi13[i]) + pI14I14*(SCOMi14[i]/COMi14[i]) + pI14I15*(SCOMi15[i]/COMi15[i]) + pI14I16*(SCOMi16[i]/COMi16[i]) + pI14I17*(SCOMi17[i]/COMi17[i]) +	pI14E10*(SCOMe10[i]/COMe10[i]) + pI14E11*(SCOMe11[i]/COMe11[i]) + pI14E12*(SCOMe12[i]/COMe12[i]) + pI14E13*(SCOMe13[i]/COMe13[i]) + pI14E14*(SCOMe14[i]/COMe14[i]) + pI14E15*(SCOMe15[i]/COMe15[i]) + pI14E16*(SCOMe16[i]/COMe16[i]) + pI14E17*(SCOMe17[i]/COMe17[i]) +	pI14C10*(SCOMc10[i]/COMc10[i]) + pI14C11*(SCOMc11[i]/COMc11[i]) + pI14C12*(SCOMc12[i]/COMc12[i]) + pI14C13*(SCOMc13[i]/COMc13[i]) + pI14C14*(SCOMc14[i]/COMc14[i]) + pI14C15*(SCOMc15[i]/COMc15[i]) + pI14C16*(SCOMc16[i]/COMc16[i]) + pI14C17*(SCOMc17[i]/COMc17[i])
  I15_surv_contact[] <- pI15I10*(SCOMi10[i]/COMi10[i]) + pI15I11*(SCOMi11[i]/COMi11[i]) + pI15I12*(SCOMi12[i]/COMi12[i]) + pI15I13*(SCOMi13[i]/COMi13[i]) + pI15I14*(SCOMi14[i]/COMi14[i]) + pI15I15*(SCOMi15[i]/COMi15[i]) + pI15I16*(SCOMi16[i]/COMi16[i]) + pI15I17*(SCOMi17[i]/COMi17[i]) +	pI15E10*(SCOMe10[i]/COMe10[i]) + pI15E11*(SCOMe11[i]/COMe11[i]) + pI15E12*(SCOMe12[i]/COMe12[i]) + pI15E13*(SCOMe13[i]/COMe13[i]) + pI15E14*(SCOMe14[i]/COMe14[i]) + pI15E15*(SCOMe15[i]/COMe15[i]) + pI15E16*(SCOMe16[i]/COMe16[i]) + pI15E17*(SCOMe17[i]/COMe17[i]) +	pI15C10*(SCOMc10[i]/COMc10[i]) + pI15C11*(SCOMc11[i]/COMc11[i]) + pI15C12*(SCOMc12[i]/COMc12[i]) + pI15C13*(SCOMc13[i]/COMc13[i]) + pI15C14*(SCOMc14[i]/COMc14[i]) + pI15C15*(SCOMc15[i]/COMc15[i]) + pI15C16*(SCOMc16[i]/COMc16[i]) + pI15C17*(SCOMc17[i]/COMc17[i])
  I16_surv_contact[] <- pI16I10*(SCOMi10[i]/COMi10[i]) + pI16I11*(SCOMi11[i]/COMi11[i]) + pI16I12*(SCOMi12[i]/COMi12[i]) + pI16I13*(SCOMi13[i]/COMi13[i]) + pI16I14*(SCOMi14[i]/COMi14[i]) + pI16I15*(SCOMi15[i]/COMi15[i]) + pI16I16*(SCOMi16[i]/COMi16[i]) + pI16I17*(SCOMi17[i]/COMi17[i]) +	pI16E10*(SCOMe10[i]/COMe10[i]) + pI16E11*(SCOMe11[i]/COMe11[i]) + pI16E12*(SCOMe12[i]/COMe12[i]) + pI16E13*(SCOMe13[i]/COMe13[i]) + pI16E14*(SCOMe14[i]/COMe14[i]) + pI16E15*(SCOMe15[i]/COMe15[i]) + pI16E16*(SCOMe16[i]/COMe16[i]) + pI16E17*(SCOMe17[i]/COMe17[i]) +	pI16C10*(SCOMc10[i]/COMc10[i]) + pI16C11*(SCOMc11[i]/COMc11[i]) + pI16C12*(SCOMc12[i]/COMc12[i]) + pI16C13*(SCOMc13[i]/COMc13[i]) + pI16C14*(SCOMc14[i]/COMc14[i]) + pI16C15*(SCOMc15[i]/COMc15[i]) + pI16C16*(SCOMc16[i]/COMc16[i]) + pI16C17*(SCOMc17[i]/COMc17[i])
  I17_surv_contact[] <- pI17I10*(SCOMi10[i]/COMi10[i]) + pI17I11*(SCOMi11[i]/COMi11[i]) + pI17I12*(SCOMi12[i]/COMi12[i]) + pI17I13*(SCOMi13[i]/COMi13[i]) + pI17I14*(SCOMi14[i]/COMi14[i]) + pI17I15*(SCOMi15[i]/COMi15[i]) + pI17I16*(SCOMi16[i]/COMi16[i]) + pI17I17*(SCOMi17[i]/COMi17[i]) +	pI17E10*(SCOMe10[i]/COMe10[i]) + pI17E11*(SCOMe11[i]/COMe11[i]) + pI17E12*(SCOMe12[i]/COMe12[i]) + pI17E13*(SCOMe13[i]/COMe13[i]) + pI17E14*(SCOMe14[i]/COMe14[i]) + pI17E15*(SCOMe15[i]/COMe15[i]) + pI17E16*(SCOMe16[i]/COMe16[i]) + pI17E17*(SCOMe17[i]/COMe17[i]) +	pI17C10*(SCOMc10[i]/COMc10[i]) + pI17C11*(SCOMc11[i]/COMc11[i]) + pI17C12*(SCOMc12[i]/COMc12[i]) + pI17C13*(SCOMc13[i]/COMc13[i]) + pI17C14*(SCOMc14[i]/COMc14[i]) + pI17C15*(SCOMc15[i]/COMc15[i]) + pI17C16*(SCOMc16[i]/COMc16[i]) + pI17C17*(SCOMc17[i]/COMc17[i])

  E10_surv_contact[] <- pE10I10*(SCOMi10[i]/COMi10[i]) + pE10I11*(SCOMi11[i]/COMi11[i]) + pE10I12*(SCOMi12[i]/COMi12[i]) + pE10I13*(SCOMi13[i]/COMi13[i]) + pE10I14*(SCOMi14[i]/COMi14[i]) + pE10I15*(SCOMi15[i]/COMi15[i]) + pE10I16*(SCOMi16[i]/COMi16[i]) + pE10I17*(SCOMi17[i]/COMi17[i]) +	pE10E10*(SCOMe10[i]/COMe10[i]) + pE10E11*(SCOMe11[i]/COMe11[i]) + pE10E12*(SCOMe12[i]/COMe12[i]) + pE10E13*(SCOMe13[i]/COMe13[i]) + pE10E14*(SCOMe14[i]/COMe14[i]) + pE10E15*(SCOMe15[i]/COMe15[i]) + pE10E16*(SCOMe16[i]/COMe16[i]) + pE10E17*(SCOMe17[i]/COMe17[i]) +	pE10C10*(SCOMc10[i]/COMc10[i]) + pE10C11*(SCOMc11[i]/COMc11[i]) + pE10C12*(SCOMc12[i]/COMc12[i]) + pE10C13*(SCOMc13[i]/COMc13[i]) + pE10C14*(SCOMc14[i]/COMc14[i]) + pE10C15*(SCOMc15[i]/COMc15[i]) + pE10C16*(SCOMc16[i]/COMc16[i]) + pE10C17*(SCOMc17[i]/COMc17[i])
  E11_surv_contact[] <- pE11I10*(SCOMi10[i]/COMi10[i]) + pE11I11*(SCOMi11[i]/COMi11[i]) + pE11I12*(SCOMi12[i]/COMi12[i]) + pE11I13*(SCOMi13[i]/COMi13[i]) + pE11I14*(SCOMi14[i]/COMi14[i]) + pE11I15*(SCOMi15[i]/COMi15[i]) + pE11I16*(SCOMi16[i]/COMi16[i]) + pE11I17*(SCOMi17[i]/COMi17[i]) +	pE11E10*(SCOMe10[i]/COMe10[i]) + pE11E11*(SCOMe11[i]/COMe11[i]) + pE11E12*(SCOMe12[i]/COMe12[i]) + pE11E13*(SCOMe13[i]/COMe13[i]) + pE11E14*(SCOMe14[i]/COMe14[i]) + pE11E15*(SCOMe15[i]/COMe15[i]) + pE11E16*(SCOMe16[i]/COMe16[i]) + pE11E17*(SCOMe17[i]/COMe17[i]) +	pE11C10*(SCOMc10[i]/COMc10[i]) + pE11C11*(SCOMc11[i]/COMc11[i]) + pE11C12*(SCOMc12[i]/COMc12[i]) + pE11C13*(SCOMc13[i]/COMc13[i]) + pE11C14*(SCOMc14[i]/COMc14[i]) + pE11C15*(SCOMc15[i]/COMc15[i]) + pE11C16*(SCOMc16[i]/COMc16[i]) + pE11C17*(SCOMc17[i]/COMc17[i])
  E12_surv_contact[] <- pE12I10*(SCOMi10[i]/COMi10[i]) + pE12I11*(SCOMi11[i]/COMi11[i]) + pE12I12*(SCOMi12[i]/COMi12[i]) + pE12I13*(SCOMi13[i]/COMi13[i]) + pE12I14*(SCOMi14[i]/COMi14[i]) + pE12I15*(SCOMi15[i]/COMi15[i]) + pE12I16*(SCOMi16[i]/COMi16[i]) + pE12I17*(SCOMi17[i]/COMi17[i]) +	pE12E10*(SCOMe10[i]/COMe10[i]) + pE12E11*(SCOMe11[i]/COMe11[i]) + pE12E12*(SCOMe12[i]/COMe12[i]) + pE12E13*(SCOMe13[i]/COMe13[i]) + pE12E14*(SCOMe14[i]/COMe14[i]) + pE12E15*(SCOMe15[i]/COMe15[i]) + pE12E16*(SCOMe16[i]/COMe16[i]) + pE12E17*(SCOMe17[i]/COMe17[i]) +	pE12C10*(SCOMc10[i]/COMc10[i]) + pE12C11*(SCOMc11[i]/COMc11[i]) + pE12C12*(SCOMc12[i]/COMc12[i]) + pE12C13*(SCOMc13[i]/COMc13[i]) + pE12C14*(SCOMc14[i]/COMc14[i]) + pE12C15*(SCOMc15[i]/COMc15[i]) + pE12C16*(SCOMc16[i]/COMc16[i]) + pE12C17*(SCOMc17[i]/COMc17[i])
  E13_surv_contact[] <- pE13I10*(SCOMi10[i]/COMi10[i]) + pE13I11*(SCOMi11[i]/COMi11[i]) + pE13I12*(SCOMi12[i]/COMi12[i]) + pE13I13*(SCOMi13[i]/COMi13[i]) + pE13I14*(SCOMi14[i]/COMi14[i]) + pE13I15*(SCOMi15[i]/COMi15[i]) + pE13I16*(SCOMi16[i]/COMi16[i]) + pE13I17*(SCOMi17[i]/COMi17[i]) +	pE13E10*(SCOMe10[i]/COMe10[i]) + pE13E11*(SCOMe11[i]/COMe11[i]) + pE13E12*(SCOMe12[i]/COMe12[i]) + pE13E13*(SCOMe13[i]/COMe13[i]) + pE13E14*(SCOMe14[i]/COMe14[i]) + pE13E15*(SCOMe15[i]/COMe15[i]) + pE13E16*(SCOMe16[i]/COMe16[i]) + pE13E17*(SCOMe17[i]/COMe17[i]) +	pE13C10*(SCOMc10[i]/COMc10[i]) + pE13C11*(SCOMc11[i]/COMc11[i]) + pE13C12*(SCOMc12[i]/COMc12[i]) + pE13C13*(SCOMc13[i]/COMc13[i]) + pE13C14*(SCOMc14[i]/COMc14[i]) + pE13C15*(SCOMc15[i]/COMc15[i]) + pE13C16*(SCOMc16[i]/COMc16[i]) + pE13C17*(SCOMc17[i]/COMc17[i])
  E14_surv_contact[] <- pE14I10*(SCOMi10[i]/COMi10[i]) + pE14I11*(SCOMi11[i]/COMi11[i]) + pE14I12*(SCOMi12[i]/COMi12[i]) + pE14I13*(SCOMi13[i]/COMi13[i]) + pE14I14*(SCOMi14[i]/COMi14[i]) + pE14I15*(SCOMi15[i]/COMi15[i]) + pE14I16*(SCOMi16[i]/COMi16[i]) + pE14I17*(SCOMi17[i]/COMi17[i]) +	pE14E10*(SCOMe10[i]/COMe10[i]) + pE14E11*(SCOMe11[i]/COMe11[i]) + pE14E12*(SCOMe12[i]/COMe12[i]) + pE14E13*(SCOMe13[i]/COMe13[i]) + pE14E14*(SCOMe14[i]/COMe14[i]) + pE14E15*(SCOMe15[i]/COMe15[i]) + pE14E16*(SCOMe16[i]/COMe16[i]) + pE14E17*(SCOMe17[i]/COMe17[i]) +	pE14C10*(SCOMc10[i]/COMc10[i]) + pE14C11*(SCOMc11[i]/COMc11[i]) + pE14C12*(SCOMc12[i]/COMc12[i]) + pE14C13*(SCOMc13[i]/COMc13[i]) + pE14C14*(SCOMc14[i]/COMc14[i]) + pE14C15*(SCOMc15[i]/COMc15[i]) + pE14C16*(SCOMc16[i]/COMc16[i]) + pE14C17*(SCOMc17[i]/COMc17[i])
  E15_surv_contact[] <- pE15I10*(SCOMi10[i]/COMi10[i]) + pE15I11*(SCOMi11[i]/COMi11[i]) + pE15I12*(SCOMi12[i]/COMi12[i]) + pE15I13*(SCOMi13[i]/COMi13[i]) + pE15I14*(SCOMi14[i]/COMi14[i]) + pE15I15*(SCOMi15[i]/COMi15[i]) + pE15I16*(SCOMi16[i]/COMi16[i]) + pE15I17*(SCOMi17[i]/COMi17[i]) +	pE15E10*(SCOMe10[i]/COMe10[i]) + pE15E11*(SCOMe11[i]/COMe11[i]) + pE15E12*(SCOMe12[i]/COMe12[i]) + pE15E13*(SCOMe13[i]/COMe13[i]) + pE15E14*(SCOMe14[i]/COMe14[i]) + pE15E15*(SCOMe15[i]/COMe15[i]) + pE15E16*(SCOMe16[i]/COMe16[i]) + pE15E17*(SCOMe17[i]/COMe17[i]) +	pE15C10*(SCOMc10[i]/COMc10[i]) + pE15C11*(SCOMc11[i]/COMc11[i]) + pE15C12*(SCOMc12[i]/COMc12[i]) + pE15C13*(SCOMc13[i]/COMc13[i]) + pE15C14*(SCOMc14[i]/COMc14[i]) + pE15C15*(SCOMc15[i]/COMc15[i]) + pE15C16*(SCOMc16[i]/COMc16[i]) + pE15C17*(SCOMc17[i]/COMc17[i])
  E16_surv_contact[] <- pE16I10*(SCOMi10[i]/COMi10[i]) + pE16I11*(SCOMi11[i]/COMi11[i]) + pE16I12*(SCOMi12[i]/COMi12[i]) + pE16I13*(SCOMi13[i]/COMi13[i]) + pE16I14*(SCOMi14[i]/COMi14[i]) + pE16I15*(SCOMi15[i]/COMi15[i]) + pE16I16*(SCOMi16[i]/COMi16[i]) + pE16I17*(SCOMi17[i]/COMi17[i]) +	pE16E10*(SCOMe10[i]/COMe10[i]) + pE16E11*(SCOMe11[i]/COMe11[i]) + pE16E12*(SCOMe12[i]/COMe12[i]) + pE16E13*(SCOMe13[i]/COMe13[i]) + pE16E14*(SCOMe14[i]/COMe14[i]) + pE16E15*(SCOMe15[i]/COMe15[i]) + pE16E16*(SCOMe16[i]/COMe16[i]) + pE16E17*(SCOMe17[i]/COMe17[i]) +	pE16C10*(SCOMc10[i]/COMc10[i]) + pE16C11*(SCOMc11[i]/COMc11[i]) + pE16C12*(SCOMc12[i]/COMc12[i]) + pE16C13*(SCOMc13[i]/COMc13[i]) + pE16C14*(SCOMc14[i]/COMc14[i]) + pE16C15*(SCOMc15[i]/COMc15[i]) + pE16C16*(SCOMc16[i]/COMc16[i]) + pE16C17*(SCOMc17[i]/COMc17[i])
  E17_surv_contact[] <- pE17I10*(SCOMi10[i]/COMi10[i]) + pE17I11*(SCOMi11[i]/COMi11[i]) + pE17I12*(SCOMi12[i]/COMi12[i]) + pE17I13*(SCOMi13[i]/COMi13[i]) + pE17I14*(SCOMi14[i]/COMi14[i]) + pE17I15*(SCOMi15[i]/COMi15[i]) + pE17I16*(SCOMi16[i]/COMi16[i]) + pE17I17*(SCOMi17[i]/COMi17[i]) +	pE17E10*(SCOMe10[i]/COMe10[i]) + pE17E11*(SCOMe11[i]/COMe11[i]) + pE17E12*(SCOMe12[i]/COMe12[i]) + pE17E13*(SCOMe13[i]/COMe13[i]) + pE17E14*(SCOMe14[i]/COMe14[i]) + pE17E15*(SCOMe15[i]/COMe15[i]) + pE17E16*(SCOMe16[i]/COMe16[i]) + pE17E17*(SCOMe17[i]/COMe17[i]) +	pE17C10*(SCOMc10[i]/COMc10[i]) + pE17C11*(SCOMc11[i]/COMc11[i]) + pE17C12*(SCOMc12[i]/COMc12[i]) + pE17C13*(SCOMc13[i]/COMc13[i]) + pE17C14*(SCOMc14[i]/COMc14[i]) + pE17C15*(SCOMc15[i]/COMc15[i]) + pE17C16*(SCOMc16[i]/COMc16[i]) + pE17C17*(SCOMc17[i]/COMc17[i])

  C10_surv_contact[] <- pC10I10*(SCOMi10[i]/COMi10[i]) + pC10I11*(SCOMi11[i]/COMi11[i]) + pC10I12*(SCOMi12[i]/COMi12[i]) + pC10I13*(SCOMi13[i]/COMi13[i]) + pC10I14*(SCOMi14[i]/COMi14[i]) + pC10I15*(SCOMi15[i]/COMi15[i]) + pC10I16*(SCOMi16[i]/COMi16[i]) + pC10I17*(SCOMi17[i]/COMi17[i]) +	pC10E10*(SCOMe10[i]/COMe10[i]) + pC10E11*(SCOMe11[i]/COMe11[i]) + pC10E12*(SCOMe12[i]/COMe12[i]) + pC10E13*(SCOMe13[i]/COMe13[i]) + pC10E14*(SCOMe14[i]/COMe14[i]) + pC10E15*(SCOMe15[i]/COMe15[i]) + pC10E16*(SCOMe16[i]/COMe16[i]) + pC10E17*(SCOMe17[i]/COMe17[i]) +	pC10C10*(SCOMc10[i]/COMc10[i]) + pC10C11*(SCOMc11[i]/COMc11[i]) + pC10C12*(SCOMc12[i]/COMc12[i]) + pC10C13*(SCOMc13[i]/COMc13[i]) + pC10C14*(SCOMc14[i]/COMc14[i]) + pC10C15*(SCOMc15[i]/COMc15[i]) + pC10C16*(SCOMc16[i]/COMc16[i]) + pC10C17*(SCOMc17[i]/COMc17[i])
  C11_surv_contact[] <- pC11I10*(SCOMi10[i]/COMi10[i]) + pC11I11*(SCOMi11[i]/COMi11[i]) + pC11I12*(SCOMi12[i]/COMi12[i]) + pC11I13*(SCOMi13[i]/COMi13[i]) + pC11I14*(SCOMi14[i]/COMi14[i]) + pC11I15*(SCOMi15[i]/COMi15[i]) + pC11I16*(SCOMi16[i]/COMi16[i]) + pC11I17*(SCOMi17[i]/COMi17[i]) +	pC11E10*(SCOMe10[i]/COMe10[i]) + pC11E11*(SCOMe11[i]/COMe11[i]) + pC11E12*(SCOMe12[i]/COMe12[i]) + pC11E13*(SCOMe13[i]/COMe13[i]) + pC11E14*(SCOMe14[i]/COMe14[i]) + pC11E15*(SCOMe15[i]/COMe15[i]) + pC11E16*(SCOMe16[i]/COMe16[i]) + pC11E17*(SCOMe17[i]/COMe17[i]) +	pC11C10*(SCOMc10[i]/COMc10[i]) + pC11C11*(SCOMc11[i]/COMc11[i]) + pC11C12*(SCOMc12[i]/COMc12[i]) + pC11C13*(SCOMc13[i]/COMc13[i]) + pC11C14*(SCOMc14[i]/COMc14[i]) + pC11C15*(SCOMc15[i]/COMc15[i]) + pC11C16*(SCOMc16[i]/COMc16[i]) + pC11C17*(SCOMc17[i]/COMc17[i])
  C12_surv_contact[] <- pC12I10*(SCOMi10[i]/COMi10[i]) + pC12I11*(SCOMi11[i]/COMi11[i]) + pC12I12*(SCOMi12[i]/COMi12[i]) + pC12I13*(SCOMi13[i]/COMi13[i]) + pC12I14*(SCOMi14[i]/COMi14[i]) + pC12I15*(SCOMi15[i]/COMi15[i]) + pC12I16*(SCOMi16[i]/COMi16[i]) + pC12I17*(SCOMi17[i]/COMi17[i]) +	pC12E10*(SCOMe10[i]/COMe10[i]) + pC12E11*(SCOMe11[i]/COMe11[i]) + pC12E12*(SCOMe12[i]/COMe12[i]) + pC12E13*(SCOMe13[i]/COMe13[i]) + pC12E14*(SCOMe14[i]/COMe14[i]) + pC12E15*(SCOMe15[i]/COMe15[i]) + pC12E16*(SCOMe16[i]/COMe16[i]) + pC12E17*(SCOMe17[i]/COMe17[i]) +	pC12C10*(SCOMc10[i]/COMc10[i]) + pC12C11*(SCOMc11[i]/COMc11[i]) + pC12C12*(SCOMc12[i]/COMc12[i]) + pC12C13*(SCOMc13[i]/COMc13[i]) + pC12C14*(SCOMc14[i]/COMc14[i]) + pC12C15*(SCOMc15[i]/COMc15[i]) + pC12C16*(SCOMc16[i]/COMc16[i]) + pC12C17*(SCOMc17[i]/COMc17[i])
  C13_surv_contact[] <- pC13I10*(SCOMi10[i]/COMi10[i]) + pC13I11*(SCOMi11[i]/COMi11[i]) + pC13I12*(SCOMi12[i]/COMi12[i]) + pC13I13*(SCOMi13[i]/COMi13[i]) + pC13I14*(SCOMi14[i]/COMi14[i]) + pC13I15*(SCOMi15[i]/COMi15[i]) + pC13I16*(SCOMi16[i]/COMi16[i]) + pC13I17*(SCOMi17[i]/COMi17[i]) +	pC13E10*(SCOMe10[i]/COMe10[i]) + pC13E11*(SCOMe11[i]/COMe11[i]) + pC13E12*(SCOMe12[i]/COMe12[i]) + pC13E13*(SCOMe13[i]/COMe13[i]) + pC13E14*(SCOMe14[i]/COMe14[i]) + pC13E15*(SCOMe15[i]/COMe15[i]) + pC13E16*(SCOMe16[i]/COMe16[i]) + pC13E17*(SCOMe17[i]/COMe17[i]) +	pC13C10*(SCOMc10[i]/COMc10[i]) + pC13C11*(SCOMc11[i]/COMc11[i]) + pC13C12*(SCOMc12[i]/COMc12[i]) + pC13C13*(SCOMc13[i]/COMc13[i]) + pC13C14*(SCOMc14[i]/COMc14[i]) + pC13C15*(SCOMc15[i]/COMc15[i]) + pC13C16*(SCOMc16[i]/COMc16[i]) + pC13C17*(SCOMc17[i]/COMc17[i])
  C14_surv_contact[] <- pC14I10*(SCOMi10[i]/COMi10[i]) + pC14I11*(SCOMi11[i]/COMi11[i]) + pC14I12*(SCOMi12[i]/COMi12[i]) + pC14I13*(SCOMi13[i]/COMi13[i]) + pC14I14*(SCOMi14[i]/COMi14[i]) + pC14I15*(SCOMi15[i]/COMi15[i]) + pC14I16*(SCOMi16[i]/COMi16[i]) + pC14I17*(SCOMi17[i]/COMi17[i]) +	pC14E10*(SCOMe10[i]/COMe10[i]) + pC14E11*(SCOMe11[i]/COMe11[i]) + pC14E12*(SCOMe12[i]/COMe12[i]) + pC14E13*(SCOMe13[i]/COMe13[i]) + pC14E14*(SCOMe14[i]/COMe14[i]) + pC14E15*(SCOMe15[i]/COMe15[i]) + pC14E16*(SCOMe16[i]/COMe16[i]) + pC14E17*(SCOMe17[i]/COMe17[i]) +	pC14C10*(SCOMc10[i]/COMc10[i]) + pC14C11*(SCOMc11[i]/COMc11[i]) + pC14C12*(SCOMc12[i]/COMc12[i]) + pC14C13*(SCOMc13[i]/COMc13[i]) + pC14C14*(SCOMc14[i]/COMc14[i]) + pC14C15*(SCOMc15[i]/COMc15[i]) + pC14C16*(SCOMc16[i]/COMc16[i]) + pC14C17*(SCOMc17[i]/COMc17[i])
  C15_surv_contact[] <- pC15I10*(SCOMi10[i]/COMi10[i]) + pC15I11*(SCOMi11[i]/COMi11[i]) + pC15I12*(SCOMi12[i]/COMi12[i]) + pC15I13*(SCOMi13[i]/COMi13[i]) + pC15I14*(SCOMi14[i]/COMi14[i]) + pC15I15*(SCOMi15[i]/COMi15[i]) + pC15I16*(SCOMi16[i]/COMi16[i]) + pC15I17*(SCOMi17[i]/COMi17[i]) +	pC15E10*(SCOMe10[i]/COMe10[i]) + pC15E11*(SCOMe11[i]/COMe11[i]) + pC15E12*(SCOMe12[i]/COMe12[i]) + pC15E13*(SCOMe13[i]/COMe13[i]) + pC15E14*(SCOMe14[i]/COMe14[i]) + pC15E15*(SCOMe15[i]/COMe15[i]) + pC15E16*(SCOMe16[i]/COMe16[i]) + pC15E17*(SCOMe17[i]/COMe17[i]) +	pC15C10*(SCOMc10[i]/COMc10[i]) + pC15C11*(SCOMc11[i]/COMc11[i]) + pC15C12*(SCOMc12[i]/COMc12[i]) + pC15C13*(SCOMc13[i]/COMc13[i]) + pC15C14*(SCOMc14[i]/COMc14[i]) + pC15C15*(SCOMc15[i]/COMc15[i]) + pC15C16*(SCOMc16[i]/COMc16[i]) + pC15C17*(SCOMc17[i]/COMc17[i])
  C16_surv_contact[] <- pC16I10*(SCOMi10[i]/COMi10[i]) + pC16I11*(SCOMi11[i]/COMi11[i]) + pC16I12*(SCOMi12[i]/COMi12[i]) + pC16I13*(SCOMi13[i]/COMi13[i]) + pC16I14*(SCOMi14[i]/COMi14[i]) + pC16I15*(SCOMi15[i]/COMi15[i]) + pC16I16*(SCOMi16[i]/COMi16[i]) + pC16I17*(SCOMi17[i]/COMi17[i]) +	pC16E10*(SCOMe10[i]/COMe10[i]) + pC16E11*(SCOMe11[i]/COMe11[i]) + pC16E12*(SCOMe12[i]/COMe12[i]) + pC16E13*(SCOMe13[i]/COMe13[i]) + pC16E14*(SCOMe14[i]/COMe14[i]) + pC16E15*(SCOMe15[i]/COMe15[i]) + pC16E16*(SCOMe16[i]/COMe16[i]) + pC16E17*(SCOMe17[i]/COMe17[i]) +	pC16C10*(SCOMc10[i]/COMc10[i]) + pC16C11*(SCOMc11[i]/COMc11[i]) + pC16C12*(SCOMc12[i]/COMc12[i]) + pC16C13*(SCOMc13[i]/COMc13[i]) + pC16C14*(SCOMc14[i]/COMc14[i]) + pC16C15*(SCOMc15[i]/COMc15[i]) + pC16C16*(SCOMc16[i]/COMc16[i]) + pC16C17*(SCOMc17[i]/COMc17[i])
  C17_surv_contact[] <- pC17I10*(SCOMi10[i]/COMi10[i]) + pC17I11*(SCOMi11[i]/COMi11[i]) + pC17I12*(SCOMi12[i]/COMi12[i]) + pC17I13*(SCOMi13[i]/COMi13[i]) + pC17I14*(SCOMi14[i]/COMi14[i]) + pC17I15*(SCOMi15[i]/COMi15[i]) + pC17I16*(SCOMi16[i]/COMi16[i]) + pC17I17*(SCOMi17[i]/COMi17[i]) +	pC17E10*(SCOMe10[i]/COMe10[i]) + pC17E11*(SCOMe11[i]/COMe11[i]) + pC17E12*(SCOMe12[i]/COMe12[i]) + pC17E13*(SCOMe13[i]/COMe13[i]) + pC17E14*(SCOMe14[i]/COMe14[i]) + pC17E15*(SCOMe15[i]/COMe15[i]) + pC17E16*(SCOMe16[i]/COMe16[i]) + pC17E17*(SCOMe17[i]/COMe17[i]) +	pC17C10*(SCOMc10[i]/COMc10[i]) + pC17C11*(SCOMc11[i]/COMc11[i]) + pC17C12*(SCOMc12[i]/COMc12[i]) + pC17C13*(SCOMc13[i]/COMc13[i]) + pC17C14*(SCOMc14[i]/COMc14[i]) + pC17C15*(SCOMc15[i]/COMc15[i]) + pC17C16*(SCOMc16[i]/COMc16[i]) + pC17C17*(SCOMc17[i]/COMc17[i])

##############################################################################################################################
# adding age mixing
##############################################################################################################################

#####COUNTY LINES#########################################################################################################################
  I10_cl_mix[,] <- I10_cl_contact[i]*x[j,i]
  I11_cl_mix[,] <- I11_cl_contact[i]*x[j,i]
  I12_cl_mix[,] <- I12_cl_contact[i]*x[j,i]
  I13_cl_mix[,] <- I13_cl_contact[i]*x[j,i]
  I14_cl_mix[,] <- I14_cl_contact[i]*x[j,i]
  I15_cl_mix[,] <- I15_cl_contact[i]*x[j,i]
  I16_cl_mix[,] <- I16_cl_contact[i]*x[j,i]
  I17_cl_mix[,] <- I17_cl_contact[i]*x[j,i]

  E10_cl_mix[,] <- E10_cl_contact[i]*x[j,i]
  E11_cl_mix[,] <- E11_cl_contact[i]*x[j,i]
  E12_cl_mix[,] <- E12_cl_contact[i]*x[j,i]
  E13_cl_mix[,] <- E13_cl_contact[i]*x[j,i]
  E14_cl_mix[,] <- E14_cl_contact[i]*x[j,i]
  E15_cl_mix[,] <- E15_cl_contact[i]*x[j,i]
  E16_cl_mix[,] <- E16_cl_contact[i]*x[j,i]
  E17_cl_mix[,] <- E17_cl_contact[i]*x[j,i]

  C10_cl_mix[,] <- C10_cl_contact[i]*x[j,i]
  C11_cl_mix[,] <- C11_cl_contact[i]*x[j,i]
  C12_cl_mix[,] <- C12_cl_contact[i]*x[j,i]
  C13_cl_mix[,] <- C13_cl_contact[i]*x[j,i]
  C14_cl_mix[,] <- C14_cl_contact[i]*x[j,i]
  C15_cl_mix[,] <- C15_cl_contact[i]*x[j,i]
  C16_cl_mix[,] <- C16_cl_contact[i]*x[j,i]
  C17_cl_mix[,] <- C17_cl_contact[i]*x[j,i]


#####SURVEILLANCE#########################################################################################################################

  I10_surv_mix[,] <- I10_surv_contact[i]*x[j,i]
  I11_surv_mix[,] <- I11_surv_contact[i]*x[j,i]
  I12_surv_mix[,] <- I12_surv_contact[i]*x[j,i]
  I13_surv_mix[,] <- I13_surv_contact[i]*x[j,i]
  I14_surv_mix[,] <- I14_surv_contact[i]*x[j,i]
  I15_surv_mix[,] <- I15_surv_contact[i]*x[j,i]
  I16_surv_mix[,] <- I16_surv_contact[i]*x[j,i]
  I17_surv_mix[,] <- I17_surv_contact[i]*x[j,i]

  E10_surv_mix[,] <- E10_surv_contact[i]*x[j,i]
  E11_surv_mix[,] <- E11_surv_contact[i]*x[j,i]
  E12_surv_mix[,] <- E12_surv_contact[i]*x[j,i]
  E13_surv_mix[,] <- E13_surv_contact[i]*x[j,i]
  E14_surv_mix[,] <- E14_surv_contact[i]*x[j,i]
  E15_surv_mix[,] <- E15_surv_contact[i]*x[j,i]
  E16_surv_mix[,] <- E16_surv_contact[i]*x[j,i]
  E17_surv_mix[,] <- E17_surv_contact[i]*x[j,i]

  C10_surv_mix[,] <- C10_surv_contact[i]*x[j,i]
  C11_surv_mix[,] <- C11_surv_contact[i]*x[j,i]
  C12_surv_mix[,] <- C12_surv_contact[i]*x[j,i]
  C13_surv_mix[,] <- C13_surv_contact[i]*x[j,i]
  C14_surv_mix[,] <- C14_surv_contact[i]*x[j,i]
  C15_surv_mix[,] <- C15_surv_contact[i]*x[j,i]
  C16_surv_mix[,] <- C16_surv_contact[i]*x[j,i]
  C17_surv_mix[,] <- C17_surv_contact[i]*x[j,i]





  ##############################################################################################################################
   # setting MIXING in CUSTODIAL SETTINGS - note that no one outside of jail mixes with those inside # # #   # # #
  ##############################################################################################################################

  #m no assortative mixing by class in jail at all - total random mixing wrt class and age? (reasonable assumption maybe? custodial settings throw everyone together in tight quarters?)
  #however, completely assortative wrt gender - assumption based on gender-segregated jails
  cl_cust[] <- WCUST[i] / CUST[i]

  ##############################################################################################################################
  ##############################################################################################################################
   # INTERMEDIATE QUANTITIES - to make the ODEs a little more readable# # #   # # # # # #   # # ## # #   # # ## # #   # # ## # #   # # ## # #   # # ## #
  ##############################################################################################################################
  ##############################################################################################################################

  # come back to this maybe

  ##############################################################################################################################
  # QUANTITIES TO OUTPUT #   # # # # # #   # # ## # #   # # ## # #   # # ## # #   # # ## # #   # # ## #
  ##############################################################################################################################
  # total number of recruits for each class group
  # I THINK THERES A DECENT CASE FOR OUTPUTTING THIS
  # recruits from the community PLUS recruits from custody
  RECi10[] <- contact*recruit_i[i]*UCOMi10[i]*sum(I10_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi10[i]
  RECe10[] <- contact*recruit_e[i]*UCOMe10[i]*sum(E10_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe10[i]
  RECc10[] <- contact*recruit_c[i]*UCOMc10[i]*sum(C10_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc10[i]

  RECi11[] <- contact*recruit_i[i]*UCOMi11[i]*sum(I11_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi11[i]
  RECe11[] <- contact*recruit_e[i]*UCOMe11[i]*sum(E11_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe11[i]
  RECc11[] <- contact*recruit_c[i]*UCOMc11[i]*sum(C11_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc11[i]

  RECi12[] <- contact*recruit_i[i]*UCOMi12[i]*sum(I12_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi12[i]
  RECe12[] <- contact*recruit_e[i]*UCOMe12[i]*sum(E12_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe12[i]
  RECc12[] <- contact*recruit_c[i]*UCOMc12[i]*sum(C12_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc12[i]

  RECi13[] <- contact*recruit_i[i]*UCOMi13[i]*sum(I13_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi13[i]
  RECe13[] <- contact*recruit_e[i]*UCOMe13[i]*sum(E13_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe13[i]
  RECc13[] <- contact*recruit_c[i]*UCOMc13[i]*sum(C13_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc13[i]

  RECi14[] <- contact*recruit_i[i]*UCOMi14[i]*sum(I14_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi14[i]
  RECe14[] <- contact*recruit_e[i]*UCOMe14[i]*sum(E14_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe14[i]
  RECc14[] <- contact*recruit_c[i]*UCOMc14[i]*sum(C14_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc14[i]

  RECi15[] <- contact*recruit_i[i]*UCOMi15[i]*sum(I15_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi15[i]
  RECe15[] <- contact*recruit_e[i]*UCOMe15[i]*sum(E15_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe15[i]
  RECc15[] <- contact*recruit_c[i]*UCOMc15[i]*sum(C15_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc15[i]

  RECi16[] <- contact*recruit_i[i]*UCOMi16[i]*sum(I16_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi16[i]
  RECe16[] <- contact*recruit_e[i]*UCOMe16[i]*sum(E16_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe16[i]
  RECc16[] <- contact*recruit_c[i]*UCOMc16[i]*sum(C16_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc16[i]

  RECi17[] <- contact*recruit_i[i]*UCOMi17[i]*sum(I17_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTi17[i]
  RECe17[] <- contact*recruit_e[i]*UCOMe17[i]*sum(E17_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTe17[i]
  RECc17[] <- contact*recruit_c[i]*UCOMc17[i]*sum(C17_cl_mix[,i]) + contact*recruit_cust[i]*cl_cust[i]*UCUSTc17[i]


  # # why is there a population explosion
  # # check1[] <- age_up*Ucnc16[i]
  # # check2[] <- desist*Wcnc17[i]
  # # check3[] <- contact*recruit_c[i]*Ucnc17[i]*sum(C17_cl_mix[,i])
  # # check4[] <- np2nc_c17[i]*Ucs17[i]
  # # check5[] <- (1-r2c)*end_rem*Uccr17[i]
  # # check6[] <- end_cust*Uccs17[i]
  # check6[] <- (prior2rem_c17[i] + prior2cust_c17[i])*Ucnc17[i]
  # check6[] <- end_cust*Uccs17[i]





  ##############################################################################################################################
  # OUTPUTS - anything that should be counted/ tracked# # #   # # # # # #   # # ## # #   # # ## # #   # # ## # #   # # ## # #   # # ## #
  ##############################################################################################################################
#
#   output(test_prev_CL) <- test_prev_CL
#   output(test_custody_ratio) <- test_custody_ratio
#   output(test_total_rep) <- test_total_rep
#   output(test_total_fte) <- test_total_fte
#   output(test_total_rec) <- test_total_fte


  output(RECi10) <- RECi10
  output(RECe10) <- RECe10
  output(RECc10) <- RECc10

  output(RECi11) <- RECi11
  output(RECe11) <- RECe11
  output(RECc11) <- RECc11

  output(RECi12) <- RECi12
  output(RECe12) <- RECe12
  output(RECc12) <- RECc12

  output(RECi13) <- RECi13
  output(RECe13) <- RECe13
  output(RECc13) <- RECc13

  output(RECi14) <- RECi14
  output(RECe14) <- RECe14
  output(RECc14) <- RECc14

  output(RECi15) <- RECi15
  output(RECe15) <- RECe15
  output(RECc15) <- RECc15

  output(RECi16) <- RECi16
  output(RECe16) <- RECe16
  output(RECc16) <- RECc16

  output(RECi17) <- RECi17
  output(RECe17) <- RECe17
  output(RECc17) <- RECc17



  # trying some interpolation at very end
  turn10[] <- interpolate(tt, y, "linear")
  dim(turn10) <- N_gender
  tt[] <- user()
  y[, ] <- user()
  dim(tt) <- user()
  dim(y) <- c(length(tt), length(turn10))


  # another interpolation attempt
  end_cust10[] <- interpolate(t_ec, ec10, "linear")
  dim(end_cust10) <- N_gender
  t_ec[] <- user()
  ec10[, ] <- user()
  dim(t_ec) <- user()
  dim(ec10) <- c(length(t_ec), length(end_cust10))

  end_cust11[] <- interpolate(t_ec, ec11, "linear")
  dim(end_cust11) <- N_gender
  ec11[, ] <- user()
  dim(ec11) <- c(length(t_ec), length(end_cust11))

  end_cust12[] <- interpolate(t_ec, ec12, "linear")
  dim(end_cust12) <- N_gender
  ec12[, ] <- user()
  dim(ec12) <- c(length(t_ec), length(end_cust12))

  end_cust13[] <- interpolate(t_ec, ec13, "linear")
  dim(end_cust13) <- N_gender
  ec13[, ] <- user()
  dim(ec13) <- c(length(t_ec), length(end_cust13))

  end_cust14[] <- interpolate(t_ec, ec14, "linear")
  dim(end_cust14) <- N_gender
  ec14[, ] <- user()
  dim(ec14) <- c(length(t_ec), length(end_cust14))

  end_cust15[] <- interpolate(t_ec, ec15, "linear")
  dim(end_cust15) <- N_gender
  ec15[, ] <- user()
  dim(ec15) <- c(length(t_ec), length(end_cust15))

  end_cust16[] <- interpolate(t_ec, ec16, "linear")
  dim(end_cust16) <- N_gender
  ec16[, ] <- user()
  dim(ec16) <- c(length(t_ec), length(end_cust16))

  end_cust17[] <- interpolate(t_ec, ec17, "linear")
  dim(end_cust17) <- N_gender
  ec17[, ] <- user()
  dim(ec17) <- c(length(t_ec), length(end_cust17))


  # another interpolation attempt - remand duration, not seperate for genders
  end_rem[] <- interpolate(t_er, er, "linear")
  dim(end_rem) <- N_gender
  t_er[] <- user()
  er[, ] <- user()
  dim(t_er) <- user()
  dim(er) <- c(length(t_er), length(end_rem))


  # another interpolation attempt - stop and search rates, gender &class & age
  s_s_i10[] <- interpolate(tss, ssi10, "linear")
  dim(s_s_i10) <- N_gender
  tss[] <- user()
  ssi10[, ] <- user()
  dim(tss) <- user()
  dim(ssi10) <- c(length(tss), length(s_s_i10))

  s_s_i11[] <- interpolate(tss, ssi11, "linear")
  dim(s_s_i11) <- N_gender
  ssi11[, ] <- user()
  dim(ssi11) <- c(length(tss), length(s_s_i11))

  s_s_i12[] <- interpolate(tss, ssi12, "linear")
  dim(s_s_i12) <- N_gender
  ssi12[, ] <- user()
  dim(ssi12) <- c(length(tss), length(s_s_i12))

  s_s_i13[] <- interpolate(tss, ssi13, "linear")
  dim(s_s_i13) <- N_gender
  ssi13[, ] <- user()
  dim(ssi13) <- c(length(tss), length(s_s_i13))

  s_s_i14[] <- interpolate(tss, ssi14, "linear")
  dim(s_s_i14) <- N_gender
  ssi14[, ] <- user()
  dim(ssi14) <- c(length(tss), length(s_s_i14))

  s_s_i15[] <- interpolate(tss, ssi15, "linear")
  dim(s_s_i15) <- N_gender
  ssi15[, ] <- user()
  dim(ssi15) <- c(length(tss), length(s_s_i15))

  s_s_i16[] <- interpolate(tss, ssi16, "linear")
  dim(s_s_i16) <- N_gender
  ssi16[, ] <- user()
  dim(ssi16) <- c(length(tss), length(s_s_i16))

  s_s_i17[] <- interpolate(tss, ssi17, "linear")
  dim(s_s_i17) <- N_gender
  ssi17[, ] <- user()
  dim(ssi17) <- c(length(tss), length(s_s_i17))


  s_s_ec10[] <- interpolate(tss, ssec10, "linear")
  dim(s_s_ec10) <- N_gender
  ssec10[, ] <- user()
  dim(ssec10) <- c(length(tss), length(s_s_ec10))

  s_s_ec11[] <- interpolate(tss, ssec11, "linear")
  dim(s_s_ec11) <- N_gender
  ssec11[, ] <- user()
  dim(ssec11) <- c(length(tss), length(s_s_ec11))

  s_s_ec12[] <- interpolate(tss, ssec12, "linear")
  dim(s_s_ec12) <- N_gender
  ssec12[, ] <- user()
  dim(ssec12) <- c(length(tss), length(s_s_ec12))

  s_s_ec13[] <- interpolate(tss, ssec13, "linear")
  dim(s_s_ec13) <- N_gender
  ssec13[, ] <- user()
  dim(ssec13) <- c(length(tss), length(s_s_ec13))

  s_s_ec14[] <- interpolate(tss, ssec14, "linear")
  dim(s_s_ec14) <- N_gender
  ssec14[, ] <- user()
  dim(ssec14) <- c(length(tss), length(s_s_ec14))

  s_s_ec15[] <- interpolate(tss, ssec15, "linear")
  dim(s_s_ec15) <- N_gender
  ssec15[, ] <- user()
  dim(ssec15) <- c(length(tss), length(s_s_ec15))

  s_s_ec16[] <- interpolate(tss, ssec16, "linear")
  dim(s_s_ec16) <- N_gender
  ssec16[, ] <- user()
  dim(ssec16) <- c(length(tss), length(s_s_ec16))

  s_s_ec17[] <- interpolate(tss, ssec17, "linear")
  dim(s_s_ec17) <- N_gender
  ssec17[, ] <- user()
  dim(ssec17) <- c(length(tss), length(s_s_ec17))

  output(s_s_i10) <- s_s_i10
  output(s_s_i11) <- s_s_i11
  output(s_s_i12) <- s_s_i12
  output(s_s_i13) <- s_s_i13
  output(s_s_i14) <- s_s_i14
  output(s_s_i15) <- s_s_i15
  output(s_s_i16) <- s_s_i16
  output(s_s_i17) <- s_s_i17
  output(s_s_ec10) <- s_s_ec10
  output(s_s_ec11) <- s_s_ec11
  output(s_s_ec12) <- s_s_ec12
  output(s_s_ec13) <- s_s_ec13
  output(s_s_ec14) <- s_s_ec14
  output(s_s_ec15) <- s_s_ec15
  output(s_s_ec16) <- s_s_ec16
  output(s_s_ec17) <- s_s_ec17


  # another interpolation attempt - fte cust and non-cust
  np2nc_i10[] <- interpolate(tn, n2ni10, "linear")
  dim(np2nc_i10) <- N_gender
  tn[] <- user()
  n2ni10[, ] <- user()
  dim(tn) <- user()
  dim(n2ni10) <- c(length(tn), length(np2nc_i10))

  np2nc_i11[] <- interpolate(tn, n2ni11, "linear")
  dim(np2nc_i11) <- N_gender
  n2ni11[, ] <- user()
  dim(n2ni11) <- c(length(tn), length(np2nc_i11))

  np2nc_i12[] <- interpolate(tn, n2ni12, "linear")
  dim(np2nc_i12) <- N_gender
  n2ni12[, ] <- user()
  dim(n2ni12) <- c(length(tn), length(np2nc_i12))

  np2nc_i13[] <- interpolate(tn, n2ni13, "linear")
  dim(np2nc_i13) <- N_gender
  n2ni13[, ] <- user()
  dim(n2ni13) <- c(length(tn), length(np2nc_i13))

  np2nc_i14[] <- interpolate(tn, n2ni14, "linear")
  dim(np2nc_i14) <- N_gender
  n2ni14[, ] <- user()
  dim(n2ni14) <- c(length(tn), length(np2nc_i14))

  np2nc_i15[] <- interpolate(tn, n2ni15, "linear")
  dim(np2nc_i15) <- N_gender
  n2ni15[, ] <- user()
  dim(n2ni15) <- c(length(tn), length(np2nc_i15))

  np2nc_i16[] <- interpolate(tn, n2ni16, "linear")
  dim(np2nc_i16) <- N_gender
  n2ni16[, ] <- user()
  dim(n2ni16) <- c(length(tn), length(np2nc_i16))

  np2nc_i17[] <- interpolate(tn, n2ni17, "linear")
  dim(np2nc_i17) <- N_gender
  n2ni17[, ] <- user()
  dim(n2ni17) <- c(length(tn), length(np2nc_i17))

  np2nc_e10[] <- interpolate(tn, n2nec10, "linear")
  dim(np2nc_e10) <- N_gender
  n2nec10[, ] <- user()
  dim(n2nec10) <- c(length(tn), length(np2nc_e10))


  np2nc_e11[] <- interpolate(tn, n2nec11, "linear")
  dim(np2nc_e11) <- N_gender
  n2nec11[, ] <- user()
  dim(n2nec11) <- c(length(tn), length(np2nc_e11))

  np2nc_e12[] <- interpolate(tn, n2nec12, "linear")
  dim(np2nc_e12) <- N_gender
  n2nec12[, ] <- user()
  dim(n2nec12) <- c(length(tn), length(np2nc_e12))

  np2nc_e13[] <- interpolate(tn, n2nec13, "linear")
  dim(np2nc_e13) <- N_gender
  n2nec13[, ] <- user()
  dim(n2nec13) <- c(length(tn), length(np2nc_e13))

  np2nc_e14[] <- interpolate(tn, n2nec14, "linear")
  dim(np2nc_e14) <- N_gender
  n2nec14[, ] <- user()
  dim(n2nec14) <- c(length(tn), length(np2nc_e14))

  np2nc_e15[] <- interpolate(tn, n2nec15, "linear")
  dim(np2nc_e15) <- N_gender
  n2nec15[, ] <- user()
  dim(n2nec15) <- c(length(tn), length(np2nc_e15))

  np2nc_e16[] <- interpolate(tn, n2nec16, "linear")
  dim(np2nc_e16) <- N_gender
  n2nec16[, ] <- user()
  dim(n2nec16) <- c(length(tn), length(np2nc_e16))

  np2nc_e17[] <- interpolate(tn, n2nec17, "linear")
  dim(np2nc_e17) <- N_gender
  n2nec17[, ] <- user()
  dim(n2nec17) <- c(length(tn), length(np2nc_e17))

  np2nc_c10[] <- interpolate(tn, n2nec10, "linear")
  dim(np2nc_c10) <- N_gender


  np2nc_c11[] <- interpolate(tn, n2nec11, "linear")
  dim(np2nc_c11) <- N_gender


  np2nc_c12[] <- interpolate(tn, n2nec12, "linear")
  dim(np2nc_c12) <- N_gender


  np2nc_c13[] <- interpolate(tn, n2nec13, "linear")
  dim(np2nc_c13) <- N_gender


  np2nc_c14[] <- interpolate(tn, n2nec14, "linear")
  dim(np2nc_c14) <- N_gender


  np2nc_c15[] <- interpolate(tn, n2nec15, "linear")
  dim(np2nc_c15) <- N_gender


  np2nc_c16[] <- interpolate(tn, n2nec16, "linear")
  dim(np2nc_c16) <- N_gender


  np2nc_c17[] <- interpolate(tn, n2nec17, "linear")
  dim(np2nc_c17) <- N_gender




  np2cust_i10[] <- interpolate(tn, n2ci10, "linear")
  dim(np2cust_i10) <- N_gender
  n2ci10[, ] <- user()
  dim(n2ci10) <- c(length(tn), length(np2cust_i10))

  np2cust_i11[] <- interpolate(tn, n2ci11, "linear")
  dim(np2cust_i11) <- N_gender
  n2ci11[, ] <- user()
  dim(n2ci11) <- c(length(tn), length(np2cust_i11))

  np2cust_i12[] <- interpolate(tn, n2ci12, "linear")
  dim(np2cust_i12) <- N_gender
  n2ci12[, ] <- user()
  dim(n2ci12) <- c(length(tn), length(np2cust_i12))

  np2cust_i13[] <- interpolate(tn, n2ci13, "linear")
  dim(np2cust_i13) <- N_gender
  n2ci13[, ] <- user()
  dim(n2ci13) <- c(length(tn), length(np2cust_i13))

  np2cust_i14[] <- interpolate(tn, n2ci14, "linear")
  dim(np2cust_i14) <- N_gender
  n2ci14[, ] <- user()
  dim(n2ci14) <- c(length(tn), length(np2cust_i14))

  np2cust_i15[] <- interpolate(tn, n2ci15, "linear")
  dim(np2cust_i15) <- N_gender
  n2ci15[, ] <- user()
  dim(n2ci15) <- c(length(tn), length(np2cust_i15))

  np2cust_i16[] <- interpolate(tn, n2ci16, "linear")
  dim(np2cust_i16) <- N_gender
  n2ci16[, ] <- user()
  dim(n2ci16) <- c(length(tn), length(np2cust_i16))

  np2cust_i17[] <- interpolate(tn, n2ci17, "linear")
  dim(np2cust_i17) <- N_gender
  n2ci17[, ] <- user()
  dim(n2ci17) <- c(length(tn), length(np2cust_i17))

  np2cust_e10[] <- interpolate(tn, n2cec10, "linear")
  dim(np2cust_e10) <- N_gender
  n2cec10[, ] <- user()
  dim(n2cec10) <- c(length(tn), length(np2cust_e10))


  np2cust_e11[] <- interpolate(tn, n2cec11, "linear")
  dim(np2cust_e11) <- N_gender
  n2cec11[, ] <- user()
  dim(n2cec11) <- c(length(tn), length(np2cust_e11))

  np2cust_e12[] <- interpolate(tn, n2cec12, "linear")
  dim(np2cust_e12) <- N_gender
  n2cec12[, ] <- user()
  dim(n2cec12) <- c(length(tn), length(np2cust_e12))

  np2cust_e13[] <- interpolate(tn, n2cec13, "linear")
  dim(np2cust_e13) <- N_gender
  n2cec13[, ] <- user()
  dim(n2cec13) <- c(length(tn), length(np2cust_e13))

  np2cust_e14[] <- interpolate(tn, n2cec14, "linear")
  dim(np2cust_e14) <- N_gender
  n2cec14[, ] <- user()
  dim(n2cec14) <- c(length(tn), length(np2cust_e14))

  np2cust_e15[] <- interpolate(tn, n2cec15, "linear")
  dim(np2cust_e15) <- N_gender
  n2cec15[, ] <- user()
  dim(n2cec15) <- c(length(tn), length(np2cust_e15))

  np2cust_e16[] <- interpolate(tn, n2cec16, "linear")
  dim(np2cust_e16) <- N_gender
  n2cec16[, ] <- user() # HERE HERE HERE
  dim(n2cec16) <- c(length(tn), length(np2cust_e16))


  np2cust_e17[] <- interpolate(tn, n2cec17, "linear")
  dim(np2cust_e17) <- N_gender
  n2cec17[, ] <- user()
  dim(n2cec17) <- c(length(tn), length(np2cust_e17))

  np2cust_c10[] <- interpolate(tn, n2cec10, "linear")
  dim(np2cust_c10) <- N_gender


  np2cust_c11[] <- interpolate(tn, n2cec11, "linear")
  dim(np2cust_c11) <- N_gender


  np2cust_c12[] <- interpolate(tn, n2cec12, "linear")
  dim(np2cust_c12) <- N_gender


  np2cust_c13[] <- interpolate(tn, n2cec13, "linear")
  dim(np2cust_c13) <- N_gender


  np2cust_c14[] <- interpolate(tn, n2cec14, "linear")
  dim(np2cust_c14) <- N_gender


  np2cust_c15[] <- interpolate(tn, n2cec15, "linear")
  dim(np2cust_c15) <- N_gender


  np2cust_c16[] <- interpolate(tn, n2cec16, "linear")
  dim(np2cust_c16) <- N_gender


  np2cust_c17[] <- interpolate(tn, n2cec17, "linear")
  dim(np2cust_c17) <- N_gender



  output(np2nc_i10) <- np2nc_i10
  output(np2nc_e10) <-np2nc_e10
  output(np2nc_c10) <-np2nc_c10
  output(np2nc_i11) <-np2nc_i11
  output(np2nc_e11) <-np2nc_e11
  output(np2nc_c11) <-np2nc_c11
  output(np2nc_i12) <-np2nc_i12
  output(np2nc_e12) <-np2nc_e12
  output(np2nc_c12) <-np2nc_c12
  output(np2nc_i13) <-np2nc_i13
  output(np2nc_e13) <-np2nc_e13
  output(np2nc_c13) <-np2nc_c13
  output(np2nc_i14) <-np2nc_i14
  output(np2nc_e14) <-np2nc_e14
  output(np2nc_c14) <-np2nc_c14
  output(np2nc_i15) <-np2nc_i15
  output(np2nc_e15) <-np2nc_e15
  output(np2nc_c15) <-np2nc_c15
  output(np2nc_i16) <-np2nc_i16
  output(np2nc_e16) <-np2nc_e16
  output(np2nc_c16) <-np2nc_c16
  output(np2nc_i17) <-np2nc_i17
  output(np2nc_e17) <-np2nc_e17
  output(np2nc_c17) <-np2nc_c17

  output(np2cust_i10) <-np2cust_i10
  output(np2cust_e10) <-np2cust_e10
  output(np2cust_c10) <-np2cust_c10
  output(np2cust_i11) <-np2cust_i11
  output(np2cust_e11) <-np2cust_e11
  output(np2cust_c11) <-np2cust_c11
  output(np2cust_i12) <-np2cust_i12
  output(np2cust_e12) <-np2cust_e12
  output(np2cust_c12) <-np2cust_c12
  output(np2cust_i13) <-np2cust_i13
  output(np2cust_e13) <-np2cust_e13
  output(np2cust_c13) <-np2cust_c13
  output(np2cust_i14) <-np2cust_i14
  output(np2cust_e14) <-np2cust_e14
  output(np2cust_c14) <-np2cust_c14
  output(np2cust_i15) <-np2cust_i15
  output(np2cust_e15) <-np2cust_e15
  output(np2cust_c15) <-np2cust_c15
  output(np2cust_i16) <-np2cust_i16
  output(np2cust_e16) <-np2cust_e16
  output(np2cust_c16) <-np2cust_c16
  output(np2cust_i17) <-np2cust_i17
  output(np2cust_e17) <-np2cust_e17
  output(np2cust_c17) <-np2cust_c17



  # another interpolation attempt - missing (res care v not - currently close v incl/excl (need to change at some point))
  # and at some point definitely need to do a county lines bump!!!

  missing_rc1014[] <- interpolate(tm, missrc1014, "linear")
  dim(missing_rc1014) <- N_gender
  tm[] <- user()
  missrc1014[, ] <- user()
  dim(tm) <- user()
  dim(missrc1014) <- c(length(tm), length(missing_rc1014))

  missing_rc1517[] <- interpolate(tm, missrc1517, "linear")
  dim(missing_rc1517) <- N_gender
  missrc1517[, ] <- user()
  dim(missrc1517) <- c(length(tm), length(missing_rc1517))

  missing_1014[] <- interpolate(tm, miss1014, "linear")
  dim(missing_1014) <- N_gender
  miss1014[, ] <- user()
  dim(miss1014) <- c(length(tm), length(missing_1014))

  missing_1517[] <- interpolate(tm, miss1517, "linear")
  dim(missing_1517) <- N_gender
  miss1517[, ] <- user()
  dim(miss1517) <- c(length(tm), length(missing_1517))

  output(missing_rc1014) <- missing_rc1014
  output(missing_rc1517) <- missing_rc1517
  output(missing_1014) <- missing_1014
  output(missing_1517) <- missing_1517


},
target = 'c')        #or c









