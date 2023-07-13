load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/custody_avduration_10to19_legal_basis.Rdata")
load("/Users/katehayes/CLmodelR/Output/Data/Cleaned/custody_avduration_10to21.Rdata")


# going to use mean rather than median because mean is more relevant for duration calculations etc etc
med_to_mean <- custody_avduration_10to19_legal_basis %>%
  filter(end_period_year == 2015) %>%
  pivot_wider(names_from = measure, values_from = nights) %>%
  mutate(to_mean = Mean / Median) %>%
  select(legal_basis, to_mean) %>%
  pivot_wider(names_from = legal_basis, values_from = to_mean)

from19to21 <- custody_avduration_10to21 %>%
  filter(end_period_year %in% 2019:2021) %>%
  pivot_wider(names_from = end_period_year,
              values_from = nights) %>%
  mutate(`2020` = `2020` / `2019`,
         `2021` = `2021` / `2019`) %>%
  filter(level == "West Midlands (region)") %>% #i'll just take the WM increase since its most near to birminghamn & we're trying to make birmingham
  select(c(`2020`, `2021`))


duration <- custody_avduration_10to19_legal_basis %>%
  filter(!(end_period_year == 2015 & measure == "Median")) %>%
  mutate(nights = ifelse(measure == "Median",
                         case_when(legal_basis == "Detention and Training Order" ~ nights * med_to_mean$`Detention and Training Order`,
                                   legal_basis == "Section 90-92 or 226-228" ~ nights * med_to_mean$`Section 90-92 or 226-228`,
                                   legal_basis == "Remand" ~ nights * med_to_mean$`Remand`),
                         nights)) %>%
  select(-measure) %>%
  pivot_wider(names_from = end_period_year,
              values_from = nights) %>%
  mutate(`2020` = `2019` * from19to21$`2020`,
         `2021` = `2019` * from19to21$`2021`) %>%
  pivot_longer(c(starts_with("20")),
               names_to = "end_period_year",
               values_to = "nights") %>%
  mutate(end_period_year = as.numeric(end_period_year))



# Think i'll just use the E/W remand mean for duration of Birm remand
# Then for other custodial sentences, Ill take the weighted average of each type of legal basis

remand_duration <- duration %>%
  filter(legal_basis == "Remand")

save(remand_duration, file = "Output/Data/Processed/remand_duration.Rdata")

params_rem_rate <- remand_duration %>%
  mutate(value = 1 / nights,
         name = "end_rem",
         meaning = "Time varying transition rate through the remand compartment") %>%
  select(-c(legal_basis, nights))

save(params_rem_rate, file = "Output/Data/Processed/params_rem_rate.Rdata")

load("/Users/katehayes/CLmodelR/Output/Data/Processed/remand_duration.Rdata")

# ignoring that this measure is in march... for now....
end_rem <- remand_duration %>%
  select(end_period_year, nights) %>%
  mutate(nights = 1/(nights/7)) %>%
  filter(end_period_year <= 2020) %>%
  mutate(end_period_year = (end_period_year - 2010)*52) %>%
  rename(t = end_period_year) %>%
  arrange(t)


t_er <- end_rem$t
end_rem <- end_rem %>%
  select(nights) %>%
  mutate(nights2 = nights) %>%
  as.matrix()

save(t_er, file = "Output/Data/Input/t_er.Rdata")
save(end_rem, file = "Output/Data/Input/end_rem.Rdata")

# CUSTODIAL SENTENCES COMES IN HERE FROM THE PROCESS DISPOSALS FILE
load("/Users/katehayes/CLmodelR/Output/Data/Processed/custodial_sentences.Rdata")

custodial_sentence_duration <- custodial_sentences %>%
  select(-c(end_period_month, period_length)) %>%
  pivot_wider(names_from = disposal, values_from = count) %>%
  full_join(duration %>%
              filter(legal_basis != "Remand") %>%
              select(-c(level, end_period_month, period_length)) %>%
              pivot_wider(names_from = legal_basis, values_from = nights) %>%
              rename(`Nights - Section 90-92 or 226-228` = `Section 90-92 or 226-228`,
                     `Nights - Detention and Training Order` = `Detention and Training Order`)) %>%
  mutate(tot_sentences = `Section 90-92 or 226-228` + `Detention and Training Order`,
         tot_nights_dto = `Detention and Training Order` * `Nights - Detention and Training Order`,
         tot_nights_sec = `Section 90-92 or 226-228` * `Nights - Section 90-92 or 226-228`,
         nights = (tot_nights_dto + tot_nights_sec) / tot_sentences) %>%
  select(end_period_year, gender, age, nights)

# come back to this, do you still need month end values? and do you want to do a total yearly average?
save(custodial_sentence_duration, file = "Output/Data/Processed/custodial_sentence_duration.Rdata")

load("/Users/katehayes/CLmodelR/Output/Data/Processed/custodial_sentence_duration.Rdata")


end_cust <- custodial_sentence_duration %>%
  mutate(nights = 1/(nights/7)) %>%
  pivot_wider(names_from = age, values_from = nights) %>%
  rename(`10` = `10-14`,
         `17` = `17+`) %>%
  mutate(`11` = `10`,
         `12` = `10`,
         `13` = `10`,
         `14` = `10`) %>%
  filter(end_period_year <= 2020) %>%
  mutate(end_period_year = (end_period_year - 2010)*52) %>%
  rename(t = end_period_year) %>%
  arrange(t)

end_cust10 <- end_cust %>%
  select(t, gender, `10`) %>%
  pivot_wider(names_from = gender, values_from = `10`)

t_end_cust <- end_cust10$t

end_cust10 <- end_cust10 %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust11 <- end_cust %>%
  select(t, gender, `11`) %>%
  pivot_wider(names_from = gender, values_from = `11`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust12 <- end_cust %>%
  select(t, gender, `12`) %>%
  pivot_wider(names_from = gender, values_from = `12`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust13 <- end_cust %>%
  select(t, gender, `13`) %>%
  pivot_wider(names_from = gender, values_from = `13`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust14 <- end_cust %>%
  select(t, gender, `14`) %>%
  pivot_wider(names_from = gender, values_from = `14`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust15 <- end_cust %>%
  select(t, gender, `15`) %>%
  pivot_wider(names_from = gender, values_from = `15`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust16 <- end_cust %>%
  select(t, gender, `16`) %>%
  pivot_wider(names_from = gender, values_from = `16`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()

end_cust17 <- end_cust %>%
  select(t, gender, `17`) %>%
  pivot_wider(names_from = gender, values_from = `17`) %>%
  select(-t) %>%
  select(Boys, Girls) %>%
  as.matrix()


save(t_end_cust, file = "Output/Data/Input/t_end_cust.Rdata")
save(end_cust10, file = "Output/Data/Input/end_cust10.Rdata")
save(end_cust11, file = "Output/Data/Input/end_cust11.Rdata")
save(end_cust12, file = "Output/Data/Input/end_cust12.Rdata")
save(end_cust13, file = "Output/Data/Input/end_cust13.Rdata")
save(end_cust14, file = "Output/Data/Input/end_cust14.Rdata")
save(end_cust15, file = "Output/Data/Input/end_cust15.Rdata")
save(end_cust16, file = "Output/Data/Input/end_cust16.Rdata")
save(end_cust17, file = "Output/Data/Input/end_cust17.Rdata")



params_cust_rate <- custodial_sentence_duration %>%
  mutate(value = 1 / nights,
         name = "end_cust",
         meaning = "Time varying transition rate through the custodial sentence compartment; depends on gender and age groups") %>%
  select(-nights)

save(params_cust_rate, file = "Output/Data/Processed/params_cust_rate.Rdata")



check_cust_duration <- custodial_sentence_duration %>%
  ggplot() +
  geom_line(aes(x = end_period_year, y = nights, colour = age)) +
  facet_grid(~gender) +
  scale_x_continuous(name = "") +
  scale_y_continuous(name = "") +
  theme_classic() +
  theme(strip.background = element_blank())
check_cust_duration
ggsave(filename = "Output/Graphs/assumption_checks/custodial_duration_gen_age.png", check_cust_duration)
