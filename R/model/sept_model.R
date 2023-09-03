
##############################################################################################################################
## SETTING DIMENSIONS ####################################################################
##############################################################################################################################

##############################################################################################################################
## model states ####################################################################
##############################################################################################################################

##############################################################################################################################
## groups of states ####################################################################
##############################################################################################################################





##############################################################################################################################
## mixing components ####################################################################
##############################################################################################################################
dim(cl_cust) <- N_gender
dim(x) <- c(N_gender, N_gender)


# proportions of that group's contacts that are with county lines
dim(prop_I10) <- N_gender
dim(prop_E10) <- N_gender
dim(prop_P10) <- N_gender
dim(prop_I11) <- N_gender
dim(prop_E11) <- N_gender
dim(prop_P11) <- N_gender
dim(prop_I12) <- N_gender
dim(prop_E12) <- N_gender
dim(prop_P12) <- N_gender
dim(prop_I13) <- N_gender
dim(prop_E13) <- N_gender
dim(prop_P13) <- N_gender
dim(prop_I14) <- N_gender
dim(prop_E14) <- N_gender
dim(prop_P14) <- N_gender
dim(prop_I15) <- N_gender
dim(prop_E15) <- N_gender
dim(prop_P15) <- N_gender
dim(prop_I16) <- N_gender
dim(prop_E16) <- N_gender
dim(prop_P16) <- N_gender
dim(prop_I17) <- N_gender
dim(prop_E17) <- N_gender
dim(prop_P17) <- N_gender


# mixing matrices
dim(cl_mix_i_10) <- c(N_gender, N_gender)
dim(cl_mix_e_10) <- c(N_gender, N_gender)
dim(cl_mix_p_10) <- c(N_gender, N_gender)
dim(cl_mix_i_11) <- c(N_gender, N_gender)
dim(cl_mix_e_11) <- c(N_gender, N_gender)
dim(cl_mix_p_11) <- c(N_gender, N_gender)
dim(cl_mix_i_12) <- c(N_gender, N_gender)
dim(cl_mix_e_12) <- c(N_gender, N_gender)
dim(cl_mix_p_12) <- c(N_gender, N_gender)
dim(cl_mix_i_13) <- c(N_gender, N_gender)
dim(cl_mix_e_13) <- c(N_gender, N_gender)
dim(cl_mix_p_13) <- c(N_gender, N_gender)
dim(cl_mix_i_14) <- c(N_gender, N_gender)
dim(cl_mix_e_14) <- c(N_gender, N_gender)
dim(cl_mix_p_14) <- c(N_gender, N_gender)
dim(cl_mix_i_15) <- c(N_gender, N_gender)
dim(cl_mix_e_15) <- c(N_gender, N_gender)
dim(cl_mix_p_15) <- c(N_gender, N_gender)
dim(cl_mix_i_16) <- c(N_gender, N_gender)
dim(cl_mix_e_16) <- c(N_gender, N_gender)
dim(cl_mix_p_16) <- c(N_gender, N_gender)
dim(cl_mix_i_17) <- c(N_gender, N_gender)
dim(cl_mix_e_17) <- c(N_gender, N_gender)
dim(cl_mix_p_17) <- c(N_gender, N_gender)

##############################################################################################################################
# DIFFERENTIAL EQUATIONS # # #  # # #
###############################################################################################################################



##############################################################################################################################
# COMMUNITY MIXING - note that no one outside of jail mixes with those inside # # #  # # #
###############################################################################################################################





##############################################################################################################################
# preferences across class and age
##############################################################################################################################
pI10I10 <- beta
pE10I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP10I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI11I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE11I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP11I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI12I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE12I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP12I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI13I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE13I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP13I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI14I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE14I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP14I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI15I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE15I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP15I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI16I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE16I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP16I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pI17I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pE17I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])
pP17I10 <- (1 - beta)*sum(com_I_10[])/sum(com[])

pI10E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE10E10 <- beta
pP10E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI11E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE11E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP11E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI12E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE12E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP12E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI13E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE13E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP13E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI14E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE14E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP14E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI15E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE15E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP15E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI16E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE16E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP16E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pI17E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pE17E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])
pP17E10 <- (1 - beta)*sum(com_E_10[])/sum(com[])

pI10P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE10P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP10P10 <- beta
pI11P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE11P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP11P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pI12P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE12P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP12P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pI13P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE13P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP13P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pI14P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE14P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP14P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pI15P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE15P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP15P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pI16P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE16P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP16P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pI17P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pE17P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])
pP17P10 <- (1 - beta)*sum(com_P_10[])/sum(com[])

pI10I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE10I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP10I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI11I11 <- beta
pE11I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP11I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI12I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE12I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP12I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI13I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE13I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP13I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI14I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE14I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP14I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI15I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE15I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP15I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI16I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE16I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP16I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pI17I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pE17I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])
pP17I11 <- (1 - beta)*sum(com_I_11[])/sum(com[])

pI10E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE10E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP10E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI11E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE11E11 <- beta
pP11E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI12E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE12E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP12E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI13E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE13E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP13E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI14E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE14E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP14E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI15E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE15E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP15E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI16E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE16E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP16E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pI17E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pE17E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])
pP17E11 <- (1 - beta)*sum(com_E_11[])/sum(com[])

pI10P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE10P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP10P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pI11P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE11P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP11P11 <- beta
pI12P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE12P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP12P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pI13P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE13P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP13P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pI14P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE14P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP14P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pI15P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE15P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP15P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pI16P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE16P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP16P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pI17P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pE17P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])
pP17P11 <- (1 - beta)*sum(com_P_11[])/sum(com[])

pI10I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE10I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP10I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI11I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE11I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP11I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI12I12 <- beta
pE12I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP12I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI13I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE13I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP13I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI14I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE14I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP14I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI15I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE15I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP15I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI16I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE16I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP16I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pI17I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pE17I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])
pP17I12 <- (1 - beta)*sum(com_I_12[])/sum(com[])

pI10E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE10E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP10E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI11E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE11E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP11E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI12E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE12E12 <- beta
pP12E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI13E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE13E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP13E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI14E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE14E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP14E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI15E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE15E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP15E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI16E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE16E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP16E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pI17E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pE17E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])
pP17E12 <- (1 - beta)*sum(com_E_12[])/sum(com[])

pI10P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE10P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP10P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pI11P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE11P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP11P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pI12P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE12P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP12P12 <- beta
pI13P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE13P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP13P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pI14P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE14P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP14P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pI15P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE15P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP15P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pI16P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE16P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP16P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pI17P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pE17P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])
pP17P12 <- (1 - beta)*sum(com_P_12[])/sum(com[])

pI10I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE10I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP10I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI11I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE11I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP11I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI12I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE12I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP12I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI13I13 <- beta
pE13I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP13I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI14I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE14I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP14I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI15I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE15I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP15I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI16I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE16I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP16I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pI17I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pE17I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])
pP17I13 <- (1 - beta)*sum(com_I_13[])/sum(com[])

pI10E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE10E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP10E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI11E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE11E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP11E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI12E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE12E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP12E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI13E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE13E13 <- beta
pP13E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI14E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE14E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP14E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI15E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE15E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP15E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI16E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE16E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP16E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pI17E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pE17E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])
pP17E13 <- (1 - beta)*sum(com_E_13[])/sum(com[])

pI10P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE10P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP10P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pI11P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE11P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP11P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pI12P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE12P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP12P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pI13P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE13P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP13P13 <- beta
pI14P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE14P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP14P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pI15P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE15P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP15P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pI16P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE16P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP16P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pI17P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pE17P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])
pP17P13 <- (1 - beta)*sum(com_P_13[])/sum(com[])

pI10I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE10I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP10I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI11I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE11I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP11I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI12I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE12I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP12I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI13I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE13I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP13I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI14I14 <- beta
pE14I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP14I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI15I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE15I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP15I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI16I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE16I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP16I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pI17I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pE17I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])
pP17I14 <- (1 - beta)*sum(com_I_14[])/sum(com[])

pI10E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE10E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP10E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI11E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE11E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP11E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI12E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE12E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP12E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI13E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE13E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP13E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI14E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE14E14 <- beta
pP14E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI15E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE15E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP15E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI16E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE16E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP16E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pI17E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pE17E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])
pP17E14 <- (1 - beta)*sum(com_E_14[])/sum(com[])

pI10P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE10P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP10P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pI11P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE11P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP11P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pI12P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE12P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP12P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pI13P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE13P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP13P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pI14P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE14P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP14P14 <- beta
pI15P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE15P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP15P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pI16P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE16P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP16P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pI17P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pE17P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])
pP17P14 <- (1 - beta)*sum(com_P_14[])/sum(com[])

pI10I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE10I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP10I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI11I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE11I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP11I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI12I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE12I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP12I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI13I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE13I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP13I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI14I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE14I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP14I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI15I15 <- beta
pE15I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP15I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI16I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE16I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP16I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pI17I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pE17I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])
pP17I15 <- (1 - beta)*sum(com_I_15[])/sum(com[])

pI10E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE10E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP10E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI11E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE11E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP11E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI12E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE12E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP12E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI13E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE13E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP13E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI14E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE14E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP14E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI15E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE15E15 <- beta
pP15E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI16E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE16E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP16E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pI17E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pE17E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])
pP17E15 <- (1 - beta)*sum(com_E_15[])/sum(com[])

pI10P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE10P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP10P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pI11P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE11P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP11P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pI12P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE12P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP12P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pI13P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE13P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP13P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pI14P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE14P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP14P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pI15P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE15P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP15P15 <- beta
pI16P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE16P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP16P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pI17P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pE17P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])
pP17P15 <- (1 - beta)*sum(com_P_15[])/sum(com[])

pI10I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE10I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP10I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI11I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE11I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP11I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI12I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE12I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP12I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI13I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE13I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP13I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI14I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE14I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP14I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI15I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE15I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP15I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI16I16 <- beta
pE16I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP16I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pI17I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pE17I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])
pP17I16 <- (1 - beta)*sum(com_I_16[])/sum(com[])

pI10E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE10E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP10E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI11E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE11E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP11E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI12E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE12E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP12E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI13E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE13E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP13E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI14E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE14E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP14E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI15E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE15E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP15E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI16E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE16E16 <- beta
pP16E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pI17E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pE17E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])
pP17E16 <- (1 - beta)*sum(com_E_16[])/sum(com[])

pI10P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE10P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP10P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pI11P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE11P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP11P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pI12P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE12P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP12P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pI13P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE13P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP13P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pI14P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE14P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP14P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pI15P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE15P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP15P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pI16P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE16P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP16P16 <- beta
pI17P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pE17P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])
pP17P16 <- (1 - beta)*sum(com_P_16[])/sum(com[])

pI10I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE10I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP10I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI11I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE11I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP11I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI12I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE12I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP12I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI13I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE13I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP13I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI14I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE14I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP14I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI15I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE15I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP15I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI16I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pE16I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP16I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pI17I17 <- beta
pE17I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])
pP17I17 <- (1 - beta)*sum(com_I_17[])/sum(com[])

pI10E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE10E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP10E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI11E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE11E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP11E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI12E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE12E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP12E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI13E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE13E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP13E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI14E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE14E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP14E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI15E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE15E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP15E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI16E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE16E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pP16E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pI17E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])
pE17E17 <- beta
pP17E17 <- (1 - beta)*sum(com_E_17[])/sum(com[])

pI10P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE10P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP10P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI11P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE11P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP11P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI12P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE12P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP12P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI13P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE13P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP13P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI14P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE14P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP14P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI15P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE15P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP15P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI16P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE16P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP16P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pI17P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pE17P17 <- (1 - beta)*sum(com_P_17[])/sum(com[])
pP17P17 <- beta


##############################################################################################################################
#proportion of cl in each age and class groups contacts
##############################################################################################################################

prop_I10[] <- pI10I10*(com_IW_10[i]/com_I_10[i]) + pI10E10*(com_EW_10[i]/com_E_10[i]) + pI10P10*(com_PW_10[i]/com_P_10[i]) + pI10I11*(com_IW_11[i]/com_I_11[i]) + pI10E11*(com_EW_11[i]/com_E_11[i]) + pI10P11*(com_PW_11[i]/com_P_11[i]) + pI10I12*(com_IW_12[i]/com_I_12[i]) + pI10E12*(com_EW_12[i]/com_E_12[i]) + pI10P12*(com_PW_12[i]/com_P_12[i]) + pI10I13*(com_IW_13[i]/com_I_13[i]) + pI10E13*(com_EW_13[i]/com_E_13[i]) + pI10P13*(com_PW_13[i]/com_P_13[i]) + pI10I14*(com_IW_14[i]/com_I_14[i]) + pI10E14*(com_EW_14[i]/com_E_14[i]) + pI10P14*(com_PW_14[i]/com_P_14[i]) + pI10I15*(com_IW_15[i]/com_I_15[i]) + pI10E15*(com_EW_15[i]/com_E_15[i]) + pI10P15*(com_PW_15[i]/com_P_15[i]) + pI10I16*(com_IW_16[i]/com_I_16[i]) + pI10E16*(com_EW_16[i]/com_E_16[i]) + pI10P16*(com_PW_16[i]/com_P_16[i]) + pI10I17*(com_IW_17[i]/com_I_17[i]) + pI10E17*(com_EW_17[i]/com_E_17[i]) + pI10P17*(com_PW_17[i]/com_P_17[i])
prop_E10[] <- pE10I10*(com_IW_10[i]/com_I_10[i]) + pE10E10*(com_EW_10[i]/com_E_10[i]) + pE10P10*(com_PW_10[i]/com_P_10[i]) + pE10I11*(com_IW_11[i]/com_I_11[i]) + pE10E11*(com_EW_11[i]/com_E_11[i]) + pE10P11*(com_PW_11[i]/com_P_11[i]) + pE10I12*(com_IW_12[i]/com_I_12[i]) + pE10E12*(com_EW_12[i]/com_E_12[i]) + pE10P12*(com_PW_12[i]/com_P_12[i]) + pE10I13*(com_IW_13[i]/com_I_13[i]) + pE10E13*(com_EW_13[i]/com_E_13[i]) + pE10P13*(com_PW_13[i]/com_P_13[i]) + pE10I14*(com_IW_14[i]/com_I_14[i]) + pE10E14*(com_EW_14[i]/com_E_14[i]) + pE10P14*(com_PW_14[i]/com_P_14[i]) + pE10I15*(com_IW_15[i]/com_I_15[i]) + pE10E15*(com_EW_15[i]/com_E_15[i]) + pE10P15*(com_PW_15[i]/com_P_15[i]) + pE10I16*(com_IW_16[i]/com_I_16[i]) + pE10E16*(com_EW_16[i]/com_E_16[i]) + pE10P16*(com_PW_16[i]/com_P_16[i]) + pE10I17*(com_IW_17[i]/com_I_17[i]) + pE10E17*(com_EW_17[i]/com_E_17[i]) + pE10P17*(com_PW_17[i]/com_P_17[i])
prop_P10[] <- pP10I10*(com_IW_10[i]/com_I_10[i]) + pP10E10*(com_EW_10[i]/com_E_10[i]) + pP10P10*(com_PW_10[i]/com_P_10[i]) + pP10I11*(com_IW_11[i]/com_I_11[i]) + pP10E11*(com_EW_11[i]/com_E_11[i]) + pP10P11*(com_PW_11[i]/com_P_11[i]) + pP10I12*(com_IW_12[i]/com_I_12[i]) + pP10E12*(com_EW_12[i]/com_E_12[i]) + pP10P12*(com_PW_12[i]/com_P_12[i]) + pP10I13*(com_IW_13[i]/com_I_13[i]) + pP10E13*(com_EW_13[i]/com_E_13[i]) + pP10P13*(com_PW_13[i]/com_P_13[i]) + pP10I14*(com_IW_14[i]/com_I_14[i]) + pP10E14*(com_EW_14[i]/com_E_14[i]) + pP10P14*(com_PW_14[i]/com_P_14[i]) + pP10I15*(com_IW_15[i]/com_I_15[i]) + pP10E15*(com_EW_15[i]/com_E_15[i]) + pP10P15*(com_PW_15[i]/com_P_15[i]) + pP10I16*(com_IW_16[i]/com_I_16[i]) + pP10E16*(com_EW_16[i]/com_E_16[i]) + pP10P16*(com_PW_16[i]/com_P_16[i]) + pP10I17*(com_IW_17[i]/com_I_17[i]) + pP10E17*(com_EW_17[i]/com_E_17[i]) + pP10P17*(com_PW_17[i]/com_P_17[i])
prop_I11[] <- pI11I10*(com_IW_10[i]/com_I_10[i]) + pI11E10*(com_EW_10[i]/com_E_10[i]) + pI11P10*(com_PW_10[i]/com_P_10[i]) + pI11I11*(com_IW_11[i]/com_I_11[i]) + pI11E11*(com_EW_11[i]/com_E_11[i]) + pI11P11*(com_PW_11[i]/com_P_11[i]) + pI11I12*(com_IW_12[i]/com_I_12[i]) + pI11E12*(com_EW_12[i]/com_E_12[i]) + pI11P12*(com_PW_12[i]/com_P_12[i]) + pI11I13*(com_IW_13[i]/com_I_13[i]) + pI11E13*(com_EW_13[i]/com_E_13[i]) + pI11P13*(com_PW_13[i]/com_P_13[i]) + pI11I14*(com_IW_14[i]/com_I_14[i]) + pI11E14*(com_EW_14[i]/com_E_14[i]) + pI11P14*(com_PW_14[i]/com_P_14[i]) + pI11I15*(com_IW_15[i]/com_I_15[i]) + pI11E15*(com_EW_15[i]/com_E_15[i]) + pI11P15*(com_PW_15[i]/com_P_15[i]) + pI11I16*(com_IW_16[i]/com_I_16[i]) + pI11E16*(com_EW_16[i]/com_E_16[i]) + pI11P16*(com_PW_16[i]/com_P_16[i]) + pI11I17*(com_IW_17[i]/com_I_17[i]) + pI11E17*(com_EW_17[i]/com_E_17[i]) + pI11P17*(com_PW_17[i]/com_P_17[i])
prop_E11[] <- pE11I10*(com_IW_10[i]/com_I_10[i]) + pE11E10*(com_EW_10[i]/com_E_10[i]) + pE11P10*(com_PW_10[i]/com_P_10[i]) + pE11I11*(com_IW_11[i]/com_I_11[i]) + pE11E11*(com_EW_11[i]/com_E_11[i]) + pE11P11*(com_PW_11[i]/com_P_11[i]) + pE11I12*(com_IW_12[i]/com_I_12[i]) + pE11E12*(com_EW_12[i]/com_E_12[i]) + pE11P12*(com_PW_12[i]/com_P_12[i]) + pE11I13*(com_IW_13[i]/com_I_13[i]) + pE11E13*(com_EW_13[i]/com_E_13[i]) + pE11P13*(com_PW_13[i]/com_P_13[i]) + pE11I14*(com_IW_14[i]/com_I_14[i]) + pE11E14*(com_EW_14[i]/com_E_14[i]) + pE11P14*(com_PW_14[i]/com_P_14[i]) + pE11I15*(com_IW_15[i]/com_I_15[i]) + pE11E15*(com_EW_15[i]/com_E_15[i]) + pE11P15*(com_PW_15[i]/com_P_15[i]) + pE11I16*(com_IW_16[i]/com_I_16[i]) + pE11E16*(com_EW_16[i]/com_E_16[i]) + pE11P16*(com_PW_16[i]/com_P_16[i]) + pE11I17*(com_IW_17[i]/com_I_17[i]) + pE11E17*(com_EW_17[i]/com_E_17[i]) + pE11P17*(com_PW_17[i]/com_P_17[i])
prop_P11[] <- pP11I10*(com_IW_10[i]/com_I_10[i]) + pP11E10*(com_EW_10[i]/com_E_10[i]) + pP11P10*(com_PW_10[i]/com_P_10[i]) + pP11I11*(com_IW_11[i]/com_I_11[i]) + pP11E11*(com_EW_11[i]/com_E_11[i]) + pP11P11*(com_PW_11[i]/com_P_11[i]) + pP11I12*(com_IW_12[i]/com_I_12[i]) + pP11E12*(com_EW_12[i]/com_E_12[i]) + pP11P12*(com_PW_12[i]/com_P_12[i]) + pP11I13*(com_IW_13[i]/com_I_13[i]) + pP11E13*(com_EW_13[i]/com_E_13[i]) + pP11P13*(com_PW_13[i]/com_P_13[i]) + pP11I14*(com_IW_14[i]/com_I_14[i]) + pP11E14*(com_EW_14[i]/com_E_14[i]) + pP11P14*(com_PW_14[i]/com_P_14[i]) + pP11I15*(com_IW_15[i]/com_I_15[i]) + pP11E15*(com_EW_15[i]/com_E_15[i]) + pP11P15*(com_PW_15[i]/com_P_15[i]) + pP11I16*(com_IW_16[i]/com_I_16[i]) + pP11E16*(com_EW_16[i]/com_E_16[i]) + pP11P16*(com_PW_16[i]/com_P_16[i]) + pP11I17*(com_IW_17[i]/com_I_17[i]) + pP11E17*(com_EW_17[i]/com_E_17[i]) + pP11P17*(com_PW_17[i]/com_P_17[i])
prop_I12[] <- pI12I10*(com_IW_10[i]/com_I_10[i]) + pI12E10*(com_EW_10[i]/com_E_10[i]) + pI12P10*(com_PW_10[i]/com_P_10[i]) + pI12I11*(com_IW_11[i]/com_I_11[i]) + pI12E11*(com_EW_11[i]/com_E_11[i]) + pI12P11*(com_PW_11[i]/com_P_11[i]) + pI12I12*(com_IW_12[i]/com_I_12[i]) + pI12E12*(com_EW_12[i]/com_E_12[i]) + pI12P12*(com_PW_12[i]/com_P_12[i]) + pI12I13*(com_IW_13[i]/com_I_13[i]) + pI12E13*(com_EW_13[i]/com_E_13[i]) + pI12P13*(com_PW_13[i]/com_P_13[i]) + pI12I14*(com_IW_14[i]/com_I_14[i]) + pI12E14*(com_EW_14[i]/com_E_14[i]) + pI12P14*(com_PW_14[i]/com_P_14[i]) + pI12I15*(com_IW_15[i]/com_I_15[i]) + pI12E15*(com_EW_15[i]/com_E_15[i]) + pI12P15*(com_PW_15[i]/com_P_15[i]) + pI12I16*(com_IW_16[i]/com_I_16[i]) + pI12E16*(com_EW_16[i]/com_E_16[i]) + pI12P16*(com_PW_16[i]/com_P_16[i]) + pI12I17*(com_IW_17[i]/com_I_17[i]) + pI12E17*(com_EW_17[i]/com_E_17[i]) + pI12P17*(com_PW_17[i]/com_P_17[i])
prop_E12[] <- pE12I10*(com_IW_10[i]/com_I_10[i]) + pE12E10*(com_EW_10[i]/com_E_10[i]) + pE12P10*(com_PW_10[i]/com_P_10[i]) + pE12I11*(com_IW_11[i]/com_I_11[i]) + pE12E11*(com_EW_11[i]/com_E_11[i]) + pE12P11*(com_PW_11[i]/com_P_11[i]) + pE12I12*(com_IW_12[i]/com_I_12[i]) + pE12E12*(com_EW_12[i]/com_E_12[i]) + pE12P12*(com_PW_12[i]/com_P_12[i]) + pE12I13*(com_IW_13[i]/com_I_13[i]) + pE12E13*(com_EW_13[i]/com_E_13[i]) + pE12P13*(com_PW_13[i]/com_P_13[i]) + pE12I14*(com_IW_14[i]/com_I_14[i]) + pE12E14*(com_EW_14[i]/com_E_14[i]) + pE12P14*(com_PW_14[i]/com_P_14[i]) + pE12I15*(com_IW_15[i]/com_I_15[i]) + pE12E15*(com_EW_15[i]/com_E_15[i]) + pE12P15*(com_PW_15[i]/com_P_15[i]) + pE12I16*(com_IW_16[i]/com_I_16[i]) + pE12E16*(com_EW_16[i]/com_E_16[i]) + pE12P16*(com_PW_16[i]/com_P_16[i]) + pE12I17*(com_IW_17[i]/com_I_17[i]) + pE12E17*(com_EW_17[i]/com_E_17[i]) + pE12P17*(com_PW_17[i]/com_P_17[i])
prop_P12[] <- pP12I10*(com_IW_10[i]/com_I_10[i]) + pP12E10*(com_EW_10[i]/com_E_10[i]) + pP12P10*(com_PW_10[i]/com_P_10[i]) + pP12I11*(com_IW_11[i]/com_I_11[i]) + pP12E11*(com_EW_11[i]/com_E_11[i]) + pP12P11*(com_PW_11[i]/com_P_11[i]) + pP12I12*(com_IW_12[i]/com_I_12[i]) + pP12E12*(com_EW_12[i]/com_E_12[i]) + pP12P12*(com_PW_12[i]/com_P_12[i]) + pP12I13*(com_IW_13[i]/com_I_13[i]) + pP12E13*(com_EW_13[i]/com_E_13[i]) + pP12P13*(com_PW_13[i]/com_P_13[i]) + pP12I14*(com_IW_14[i]/com_I_14[i]) + pP12E14*(com_EW_14[i]/com_E_14[i]) + pP12P14*(com_PW_14[i]/com_P_14[i]) + pP12I15*(com_IW_15[i]/com_I_15[i]) + pP12E15*(com_EW_15[i]/com_E_15[i]) + pP12P15*(com_PW_15[i]/com_P_15[i]) + pP12I16*(com_IW_16[i]/com_I_16[i]) + pP12E16*(com_EW_16[i]/com_E_16[i]) + pP12P16*(com_PW_16[i]/com_P_16[i]) + pP12I17*(com_IW_17[i]/com_I_17[i]) + pP12E17*(com_EW_17[i]/com_E_17[i]) + pP12P17*(com_PW_17[i]/com_P_17[i])
prop_I13[] <- pI13I10*(com_IW_10[i]/com_I_10[i]) + pI13E10*(com_EW_10[i]/com_E_10[i]) + pI13P10*(com_PW_10[i]/com_P_10[i]) + pI13I11*(com_IW_11[i]/com_I_11[i]) + pI13E11*(com_EW_11[i]/com_E_11[i]) + pI13P11*(com_PW_11[i]/com_P_11[i]) + pI13I12*(com_IW_12[i]/com_I_12[i]) + pI13E12*(com_EW_12[i]/com_E_12[i]) + pI13P12*(com_PW_12[i]/com_P_12[i]) + pI13I13*(com_IW_13[i]/com_I_13[i]) + pI13E13*(com_EW_13[i]/com_E_13[i]) + pI13P13*(com_PW_13[i]/com_P_13[i]) + pI13I14*(com_IW_14[i]/com_I_14[i]) + pI13E14*(com_EW_14[i]/com_E_14[i]) + pI13P14*(com_PW_14[i]/com_P_14[i]) + pI13I15*(com_IW_15[i]/com_I_15[i]) + pI13E15*(com_EW_15[i]/com_E_15[i]) + pI13P15*(com_PW_15[i]/com_P_15[i]) + pI13I16*(com_IW_16[i]/com_I_16[i]) + pI13E16*(com_EW_16[i]/com_E_16[i]) + pI13P16*(com_PW_16[i]/com_P_16[i]) + pI13I17*(com_IW_17[i]/com_I_17[i]) + pI13E17*(com_EW_17[i]/com_E_17[i]) + pI13P17*(com_PW_17[i]/com_P_17[i])
prop_E13[] <- pE13I10*(com_IW_10[i]/com_I_10[i]) + pE13E10*(com_EW_10[i]/com_E_10[i]) + pE13P10*(com_PW_10[i]/com_P_10[i]) + pE13I11*(com_IW_11[i]/com_I_11[i]) + pE13E11*(com_EW_11[i]/com_E_11[i]) + pE13P11*(com_PW_11[i]/com_P_11[i]) + pE13I12*(com_IW_12[i]/com_I_12[i]) + pE13E12*(com_EW_12[i]/com_E_12[i]) + pE13P12*(com_PW_12[i]/com_P_12[i]) + pE13I13*(com_IW_13[i]/com_I_13[i]) + pE13E13*(com_EW_13[i]/com_E_13[i]) + pE13P13*(com_PW_13[i]/com_P_13[i]) + pE13I14*(com_IW_14[i]/com_I_14[i]) + pE13E14*(com_EW_14[i]/com_E_14[i]) + pE13P14*(com_PW_14[i]/com_P_14[i]) + pE13I15*(com_IW_15[i]/com_I_15[i]) + pE13E15*(com_EW_15[i]/com_E_15[i]) + pE13P15*(com_PW_15[i]/com_P_15[i]) + pE13I16*(com_IW_16[i]/com_I_16[i]) + pE13E16*(com_EW_16[i]/com_E_16[i]) + pE13P16*(com_PW_16[i]/com_P_16[i]) + pE13I17*(com_IW_17[i]/com_I_17[i]) + pE13E17*(com_EW_17[i]/com_E_17[i]) + pE13P17*(com_PW_17[i]/com_P_17[i])
prop_P13[] <- pP13I10*(com_IW_10[i]/com_I_10[i]) + pP13E10*(com_EW_10[i]/com_E_10[i]) + pP13P10*(com_PW_10[i]/com_P_10[i]) + pP13I11*(com_IW_11[i]/com_I_11[i]) + pP13E11*(com_EW_11[i]/com_E_11[i]) + pP13P11*(com_PW_11[i]/com_P_11[i]) + pP13I12*(com_IW_12[i]/com_I_12[i]) + pP13E12*(com_EW_12[i]/com_E_12[i]) + pP13P12*(com_PW_12[i]/com_P_12[i]) + pP13I13*(com_IW_13[i]/com_I_13[i]) + pP13E13*(com_EW_13[i]/com_E_13[i]) + pP13P13*(com_PW_13[i]/com_P_13[i]) + pP13I14*(com_IW_14[i]/com_I_14[i]) + pP13E14*(com_EW_14[i]/com_E_14[i]) + pP13P14*(com_PW_14[i]/com_P_14[i]) + pP13I15*(com_IW_15[i]/com_I_15[i]) + pP13E15*(com_EW_15[i]/com_E_15[i]) + pP13P15*(com_PW_15[i]/com_P_15[i]) + pP13I16*(com_IW_16[i]/com_I_16[i]) + pP13E16*(com_EW_16[i]/com_E_16[i]) + pP13P16*(com_PW_16[i]/com_P_16[i]) + pP13I17*(com_IW_17[i]/com_I_17[i]) + pP13E17*(com_EW_17[i]/com_E_17[i]) + pP13P17*(com_PW_17[i]/com_P_17[i])
prop_I14[] <- pI14I10*(com_IW_10[i]/com_I_10[i]) + pI14E10*(com_EW_10[i]/com_E_10[i]) + pI14P10*(com_PW_10[i]/com_P_10[i]) + pI14I11*(com_IW_11[i]/com_I_11[i]) + pI14E11*(com_EW_11[i]/com_E_11[i]) + pI14P11*(com_PW_11[i]/com_P_11[i]) + pI14I12*(com_IW_12[i]/com_I_12[i]) + pI14E12*(com_EW_12[i]/com_E_12[i]) + pI14P12*(com_PW_12[i]/com_P_12[i]) + pI14I13*(com_IW_13[i]/com_I_13[i]) + pI14E13*(com_EW_13[i]/com_E_13[i]) + pI14P13*(com_PW_13[i]/com_P_13[i]) + pI14I14*(com_IW_14[i]/com_I_14[i]) + pI14E14*(com_EW_14[i]/com_E_14[i]) + pI14P14*(com_PW_14[i]/com_P_14[i]) + pI14I15*(com_IW_15[i]/com_I_15[i]) + pI14E15*(com_EW_15[i]/com_E_15[i]) + pI14P15*(com_PW_15[i]/com_P_15[i]) + pI14I16*(com_IW_16[i]/com_I_16[i]) + pI14E16*(com_EW_16[i]/com_E_16[i]) + pI14P16*(com_PW_16[i]/com_P_16[i]) + pI14I17*(com_IW_17[i]/com_I_17[i]) + pI14E17*(com_EW_17[i]/com_E_17[i]) + pI14P17*(com_PW_17[i]/com_P_17[i])
prop_E14[] <- pE14I10*(com_IW_10[i]/com_I_10[i]) + pE14E10*(com_EW_10[i]/com_E_10[i]) + pE14P10*(com_PW_10[i]/com_P_10[i]) + pE14I11*(com_IW_11[i]/com_I_11[i]) + pE14E11*(com_EW_11[i]/com_E_11[i]) + pE14P11*(com_PW_11[i]/com_P_11[i]) + pE14I12*(com_IW_12[i]/com_I_12[i]) + pE14E12*(com_EW_12[i]/com_E_12[i]) + pE14P12*(com_PW_12[i]/com_P_12[i]) + pE14I13*(com_IW_13[i]/com_I_13[i]) + pE14E13*(com_EW_13[i]/com_E_13[i]) + pE14P13*(com_PW_13[i]/com_P_13[i]) + pE14I14*(com_IW_14[i]/com_I_14[i]) + pE14E14*(com_EW_14[i]/com_E_14[i]) + pE14P14*(com_PW_14[i]/com_P_14[i]) + pE14I15*(com_IW_15[i]/com_I_15[i]) + pE14E15*(com_EW_15[i]/com_E_15[i]) + pE14P15*(com_PW_15[i]/com_P_15[i]) + pE14I16*(com_IW_16[i]/com_I_16[i]) + pE14E16*(com_EW_16[i]/com_E_16[i]) + pE14P16*(com_PW_16[i]/com_P_16[i]) + pE14I17*(com_IW_17[i]/com_I_17[i]) + pE14E17*(com_EW_17[i]/com_E_17[i]) + pE14P17*(com_PW_17[i]/com_P_17[i])
prop_P14[] <- pP14I10*(com_IW_10[i]/com_I_10[i]) + pP14E10*(com_EW_10[i]/com_E_10[i]) + pP14P10*(com_PW_10[i]/com_P_10[i]) + pP14I11*(com_IW_11[i]/com_I_11[i]) + pP14E11*(com_EW_11[i]/com_E_11[i]) + pP14P11*(com_PW_11[i]/com_P_11[i]) + pP14I12*(com_IW_12[i]/com_I_12[i]) + pP14E12*(com_EW_12[i]/com_E_12[i]) + pP14P12*(com_PW_12[i]/com_P_12[i]) + pP14I13*(com_IW_13[i]/com_I_13[i]) + pP14E13*(com_EW_13[i]/com_E_13[i]) + pP14P13*(com_PW_13[i]/com_P_13[i]) + pP14I14*(com_IW_14[i]/com_I_14[i]) + pP14E14*(com_EW_14[i]/com_E_14[i]) + pP14P14*(com_PW_14[i]/com_P_14[i]) + pP14I15*(com_IW_15[i]/com_I_15[i]) + pP14E15*(com_EW_15[i]/com_E_15[i]) + pP14P15*(com_PW_15[i]/com_P_15[i]) + pP14I16*(com_IW_16[i]/com_I_16[i]) + pP14E16*(com_EW_16[i]/com_E_16[i]) + pP14P16*(com_PW_16[i]/com_P_16[i]) + pP14I17*(com_IW_17[i]/com_I_17[i]) + pP14E17*(com_EW_17[i]/com_E_17[i]) + pP14P17*(com_PW_17[i]/com_P_17[i])
prop_I15[] <- pI15I10*(com_IW_10[i]/com_I_10[i]) + pI15E10*(com_EW_10[i]/com_E_10[i]) + pI15P10*(com_PW_10[i]/com_P_10[i]) + pI15I11*(com_IW_11[i]/com_I_11[i]) + pI15E11*(com_EW_11[i]/com_E_11[i]) + pI15P11*(com_PW_11[i]/com_P_11[i]) + pI15I12*(com_IW_12[i]/com_I_12[i]) + pI15E12*(com_EW_12[i]/com_E_12[i]) + pI15P12*(com_PW_12[i]/com_P_12[i]) + pI15I13*(com_IW_13[i]/com_I_13[i]) + pI15E13*(com_EW_13[i]/com_E_13[i]) + pI15P13*(com_PW_13[i]/com_P_13[i]) + pI15I14*(com_IW_14[i]/com_I_14[i]) + pI15E14*(com_EW_14[i]/com_E_14[i]) + pI15P14*(com_PW_14[i]/com_P_14[i]) + pI15I15*(com_IW_15[i]/com_I_15[i]) + pI15E15*(com_EW_15[i]/com_E_15[i]) + pI15P15*(com_PW_15[i]/com_P_15[i]) + pI15I16*(com_IW_16[i]/com_I_16[i]) + pI15E16*(com_EW_16[i]/com_E_16[i]) + pI15P16*(com_PW_16[i]/com_P_16[i]) + pI15I17*(com_IW_17[i]/com_I_17[i]) + pI15E17*(com_EW_17[i]/com_E_17[i]) + pI15P17*(com_PW_17[i]/com_P_17[i])
prop_E15[] <- pE15I10*(com_IW_10[i]/com_I_10[i]) + pE15E10*(com_EW_10[i]/com_E_10[i]) + pE15P10*(com_PW_10[i]/com_P_10[i]) + pE15I11*(com_IW_11[i]/com_I_11[i]) + pE15E11*(com_EW_11[i]/com_E_11[i]) + pE15P11*(com_PW_11[i]/com_P_11[i]) + pE15I12*(com_IW_12[i]/com_I_12[i]) + pE15E12*(com_EW_12[i]/com_E_12[i]) + pE15P12*(com_PW_12[i]/com_P_12[i]) + pE15I13*(com_IW_13[i]/com_I_13[i]) + pE15E13*(com_EW_13[i]/com_E_13[i]) + pE15P13*(com_PW_13[i]/com_P_13[i]) + pE15I14*(com_IW_14[i]/com_I_14[i]) + pE15E14*(com_EW_14[i]/com_E_14[i]) + pE15P14*(com_PW_14[i]/com_P_14[i]) + pE15I15*(com_IW_15[i]/com_I_15[i]) + pE15E15*(com_EW_15[i]/com_E_15[i]) + pE15P15*(com_PW_15[i]/com_P_15[i]) + pE15I16*(com_IW_16[i]/com_I_16[i]) + pE15E16*(com_EW_16[i]/com_E_16[i]) + pE15P16*(com_PW_16[i]/com_P_16[i]) + pE15I17*(com_IW_17[i]/com_I_17[i]) + pE15E17*(com_EW_17[i]/com_E_17[i]) + pE15P17*(com_PW_17[i]/com_P_17[i])
prop_P15[] <- pP15I10*(com_IW_10[i]/com_I_10[i]) + pP15E10*(com_EW_10[i]/com_E_10[i]) + pP15P10*(com_PW_10[i]/com_P_10[i]) + pP15I11*(com_IW_11[i]/com_I_11[i]) + pP15E11*(com_EW_11[i]/com_E_11[i]) + pP15P11*(com_PW_11[i]/com_P_11[i]) + pP15I12*(com_IW_12[i]/com_I_12[i]) + pP15E12*(com_EW_12[i]/com_E_12[i]) + pP15P12*(com_PW_12[i]/com_P_12[i]) + pP15I13*(com_IW_13[i]/com_I_13[i]) + pP15E13*(com_EW_13[i]/com_E_13[i]) + pP15P13*(com_PW_13[i]/com_P_13[i]) + pP15I14*(com_IW_14[i]/com_I_14[i]) + pP15E14*(com_EW_14[i]/com_E_14[i]) + pP15P14*(com_PW_14[i]/com_P_14[i]) + pP15I15*(com_IW_15[i]/com_I_15[i]) + pP15E15*(com_EW_15[i]/com_E_15[i]) + pP15P15*(com_PW_15[i]/com_P_15[i]) + pP15I16*(com_IW_16[i]/com_I_16[i]) + pP15E16*(com_EW_16[i]/com_E_16[i]) + pP15P16*(com_PW_16[i]/com_P_16[i]) + pP15I17*(com_IW_17[i]/com_I_17[i]) + pP15E17*(com_EW_17[i]/com_E_17[i]) + pP15P17*(com_PW_17[i]/com_P_17[i])
prop_I16[] <- pI16I10*(com_IW_10[i]/com_I_10[i]) + pI16E10*(com_EW_10[i]/com_E_10[i]) + pI16P10*(com_PW_10[i]/com_P_10[i]) + pI16I11*(com_IW_11[i]/com_I_11[i]) + pI16E11*(com_EW_11[i]/com_E_11[i]) + pI16P11*(com_PW_11[i]/com_P_11[i]) + pI16I12*(com_IW_12[i]/com_I_12[i]) + pI16E12*(com_EW_12[i]/com_E_12[i]) + pI16P12*(com_PW_12[i]/com_P_12[i]) + pI16I13*(com_IW_13[i]/com_I_13[i]) + pI16E13*(com_EW_13[i]/com_E_13[i]) + pI16P13*(com_PW_13[i]/com_P_13[i]) + pI16I14*(com_IW_14[i]/com_I_14[i]) + pI16E14*(com_EW_14[i]/com_E_14[i]) + pI16P14*(com_PW_14[i]/com_P_14[i]) + pI16I15*(com_IW_15[i]/com_I_15[i]) + pI16E15*(com_EW_15[i]/com_E_15[i]) + pI16P15*(com_PW_15[i]/com_P_15[i]) + pI16I16*(com_IW_16[i]/com_I_16[i]) + pI16E16*(com_EW_16[i]/com_E_16[i]) + pI16P16*(com_PW_16[i]/com_P_16[i]) + pI16I17*(com_IW_17[i]/com_I_17[i]) + pI16E17*(com_EW_17[i]/com_E_17[i]) + pI16P17*(com_PW_17[i]/com_P_17[i])
prop_E16[] <- pE16I10*(com_IW_10[i]/com_I_10[i]) + pE16E10*(com_EW_10[i]/com_E_10[i]) + pE16P10*(com_PW_10[i]/com_P_10[i]) + pE16I11*(com_IW_11[i]/com_I_11[i]) + pE16E11*(com_EW_11[i]/com_E_11[i]) + pE16P11*(com_PW_11[i]/com_P_11[i]) + pE16I12*(com_IW_12[i]/com_I_12[i]) + pE16E12*(com_EW_12[i]/com_E_12[i]) + pE16P12*(com_PW_12[i]/com_P_12[i]) + pE16I13*(com_IW_13[i]/com_I_13[i]) + pE16E13*(com_EW_13[i]/com_E_13[i]) + pE16P13*(com_PW_13[i]/com_P_13[i]) + pE16I14*(com_IW_14[i]/com_I_14[i]) + pE16E14*(com_EW_14[i]/com_E_14[i]) + pE16P14*(com_PW_14[i]/com_P_14[i]) + pE16I15*(com_IW_15[i]/com_I_15[i]) + pE16E15*(com_EW_15[i]/com_E_15[i]) + pE16P15*(com_PW_15[i]/com_P_15[i]) + pE16I16*(com_IW_16[i]/com_I_16[i]) + pE16E16*(com_EW_16[i]/com_E_16[i]) + pE16P16*(com_PW_16[i]/com_P_16[i]) + pE16I17*(com_IW_17[i]/com_I_17[i]) + pE16E17*(com_EW_17[i]/com_E_17[i]) + pE16P17*(com_PW_17[i]/com_P_17[i])
prop_P16[] <- pP16I10*(com_IW_10[i]/com_I_10[i]) + pP16E10*(com_EW_10[i]/com_E_10[i]) + pP16P10*(com_PW_10[i]/com_P_10[i]) + pP16I11*(com_IW_11[i]/com_I_11[i]) + pP16E11*(com_EW_11[i]/com_E_11[i]) + pP16P11*(com_PW_11[i]/com_P_11[i]) + pP16I12*(com_IW_12[i]/com_I_12[i]) + pP16E12*(com_EW_12[i]/com_E_12[i]) + pP16P12*(com_PW_12[i]/com_P_12[i]) + pP16I13*(com_IW_13[i]/com_I_13[i]) + pP16E13*(com_EW_13[i]/com_E_13[i]) + pP16P13*(com_PW_13[i]/com_P_13[i]) + pP16I14*(com_IW_14[i]/com_I_14[i]) + pP16E14*(com_EW_14[i]/com_E_14[i]) + pP16P14*(com_PW_14[i]/com_P_14[i]) + pP16I15*(com_IW_15[i]/com_I_15[i]) + pP16E15*(com_EW_15[i]/com_E_15[i]) + pP16P15*(com_PW_15[i]/com_P_15[i]) + pP16I16*(com_IW_16[i]/com_I_16[i]) + pP16E16*(com_EW_16[i]/com_E_16[i]) + pP16P16*(com_PW_16[i]/com_P_16[i]) + pP16I17*(com_IW_17[i]/com_I_17[i]) + pP16E17*(com_EW_17[i]/com_E_17[i]) + pP16P17*(com_PW_17[i]/com_P_17[i])
prop_I17[] <- pI17I10*(com_IW_10[i]/com_I_10[i]) + pI17E10*(com_EW_10[i]/com_E_10[i]) + pI17P10*(com_PW_10[i]/com_P_10[i]) + pI17I11*(com_IW_11[i]/com_I_11[i]) + pI17E11*(com_EW_11[i]/com_E_11[i]) + pI17P11*(com_PW_11[i]/com_P_11[i]) + pI17I12*(com_IW_12[i]/com_I_12[i]) + pI17E12*(com_EW_12[i]/com_E_12[i]) + pI17P12*(com_PW_12[i]/com_P_12[i]) + pI17I13*(com_IW_13[i]/com_I_13[i]) + pI17E13*(com_EW_13[i]/com_E_13[i]) + pI17P13*(com_PW_13[i]/com_P_13[i]) + pI17I14*(com_IW_14[i]/com_I_14[i]) + pI17E14*(com_EW_14[i]/com_E_14[i]) + pI17P14*(com_PW_14[i]/com_P_14[i]) + pI17I15*(com_IW_15[i]/com_I_15[i]) + pI17E15*(com_EW_15[i]/com_E_15[i]) + pI17P15*(com_PW_15[i]/com_P_15[i]) + pI17I16*(com_IW_16[i]/com_I_16[i]) + pI17E16*(com_EW_16[i]/com_E_16[i]) + pI17P16*(com_PW_16[i]/com_P_16[i]) + pI17I17*(com_IW_17[i]/com_I_17[i]) + pI17E17*(com_EW_17[i]/com_E_17[i]) + pI17P17*(com_PW_17[i]/com_P_17[i])
prop_E17[] <- pE17I10*(com_IW_10[i]/com_I_10[i]) + pE17E10*(com_EW_10[i]/com_E_10[i]) + pE17P10*(com_PW_10[i]/com_P_10[i]) + pE17I11*(com_IW_11[i]/com_I_11[i]) + pE17E11*(com_EW_11[i]/com_E_11[i]) + pE17P11*(com_PW_11[i]/com_P_11[i]) + pE17I12*(com_IW_12[i]/com_I_12[i]) + pE17E12*(com_EW_12[i]/com_E_12[i]) + pE17P12*(com_PW_12[i]/com_P_12[i]) + pE17I13*(com_IW_13[i]/com_I_13[i]) + pE17E13*(com_EW_13[i]/com_E_13[i]) + pE17P13*(com_PW_13[i]/com_P_13[i]) + pE17I14*(com_IW_14[i]/com_I_14[i]) + pE17E14*(com_EW_14[i]/com_E_14[i]) + pE17P14*(com_PW_14[i]/com_P_14[i]) + pE17I15*(com_IW_15[i]/com_I_15[i]) + pE17E15*(com_EW_15[i]/com_E_15[i]) + pE17P15*(com_PW_15[i]/com_P_15[i]) + pE17I16*(com_IW_16[i]/com_I_16[i]) + pE17E16*(com_EW_16[i]/com_E_16[i]) + pE17P16*(com_PW_16[i]/com_P_16[i]) + pE17I17*(com_IW_17[i]/com_I_17[i]) + pE17E17*(com_EW_17[i]/com_E_17[i]) + pE17P17*(com_PW_17[i]/com_P_17[i])
prop_P17[] <- pP17I10*(com_IW_10[i]/com_I_10[i]) + pP17E10*(com_EW_10[i]/com_E_10[i]) + pP17P10*(com_PW_10[i]/com_P_10[i]) + pP17I11*(com_IW_11[i]/com_I_11[i]) + pP17E11*(com_EW_11[i]/com_E_11[i]) + pP17P11*(com_PW_11[i]/com_P_11[i]) + pP17I12*(com_IW_12[i]/com_I_12[i]) + pP17E12*(com_EW_12[i]/com_E_12[i]) + pP17P12*(com_PW_12[i]/com_P_12[i]) + pP17I13*(com_IW_13[i]/com_I_13[i]) + pP17E13*(com_EW_13[i]/com_E_13[i]) + pP17P13*(com_PW_13[i]/com_P_13[i]) + pP17I14*(com_IW_14[i]/com_I_14[i]) + pP17E14*(com_EW_14[i]/com_E_14[i]) + pP17P14*(com_PW_14[i]/com_P_14[i]) + pP17I15*(com_IW_15[i]/com_I_15[i]) + pP17E15*(com_EW_15[i]/com_E_15[i]) + pP17P15*(com_PW_15[i]/com_P_15[i]) + pP17I16*(com_IW_16[i]/com_I_16[i]) + pP17E16*(com_EW_16[i]/com_E_16[i]) + pP17P16*(com_PW_16[i]/com_P_16[i]) + pP17I17*(com_IW_17[i]/com_I_17[i]) + pP17E17*(com_EW_17[i]/com_E_17[i]) + pP17P17*(com_PW_17[i]/com_P_17[i])


##############################################################################################################################
# adding gender mixing, making mixing matrix
##############################################################################################################################

cl_mix_i_10[,] <- prop_I10[i]*x[j,i]
cl_mix_e_10[,] <- prop_E10[i]*x[j,i]
cl_mix_p_10[,] <- prop_P10[i]*x[j,i]
cl_mix_i_11[,] <- prop_I11[i]*x[j,i]
cl_mix_e_11[,] <- prop_E11[i]*x[j,i]
cl_mix_p_11[,] <- prop_P11[i]*x[j,i]
cl_mix_i_12[,] <- prop_I12[i]*x[j,i]
cl_mix_e_12[,] <- prop_E12[i]*x[j,i]
cl_mix_p_12[,] <- prop_P12[i]*x[j,i]
cl_mix_i_13[,] <- prop_I13[i]*x[j,i]
cl_mix_e_13[,] <- prop_E13[i]*x[j,i]
cl_mix_p_13[,] <- prop_P13[i]*x[j,i]
cl_mix_i_14[,] <- prop_I14[i]*x[j,i]
cl_mix_e_14[,] <- prop_E14[i]*x[j,i]
cl_mix_p_14[,] <- prop_P14[i]*x[j,i]
cl_mix_i_15[,] <- prop_I15[i]*x[j,i]
cl_mix_e_15[,] <- prop_E15[i]*x[j,i]
cl_mix_p_15[,] <- prop_P15[i]*x[j,i]
cl_mix_i_16[,] <- prop_I16[i]*x[j,i]
cl_mix_e_16[,] <- prop_E16[i]*x[j,i]
cl_mix_p_16[,] <- prop_P16[i]*x[j,i]
cl_mix_i_17[,] <- prop_I17[i]*x[j,i]
cl_mix_e_17[,] <- prop_E17[i]*x[j,i]
cl_mix_p_17[,] <- prop_P17[i]*x[j,i]


