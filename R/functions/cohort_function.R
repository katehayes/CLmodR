# how to define the cohorts?
# cohort one - 17 years old on Jan 1st 2010
# cohort two - 16 years old on Jan 1st 2010
# cohort three - 15 years old on Jan 1st 2010
# cohort four - 14 years old on Jan 1st 2010
# cohort five - 13 years old on Jan 1st 2010
# cohort six - 12 years old on Jan 1st 2010
# cohort seven - 11 years old on Jan 1st 2010
# cohort eight - 10 years old on Jan 1st 2010
# cohort nine - 10 years old on Jan 1st 2011
# cohort ten - 10 years old on Jan 1st 2012
# cohort eleven - 10 years old on Jan 1st 2013
# cohort twelve - 10 years old on Jan 1st 2014
# cohort thirteen - 10 years old on Jan 1st 2015
# cohort fourteen - 10 years old on Jan 1st 2016
# cohort fifteen - 10 years old on Jan 1st 2017
# cohort sixteen - 10 years old on Jan 1st 2018
# cohort seventeen - 10 years old on Jan 1st 2019
# cohort eighteen - 10 years old on Jan 1st 2020

check <- schools %>% 
  mutate(cohort = case_when(end_period_year - age == 1993 ~"Cohort 1", 
                            end_period_year - age == 1994 ~"Cohort 2",
                            end_period_year - age == 1995 ~"Cohort 3",
                            end_period_year - age == 1996 ~"Cohort 4",
                            end_period_year - age == 1997 ~"Cohort 5",
                            end_period_year - age == 1998 ~"Cohort 6",
                            end_period_year - age == 1999 ~"Cohort 7",
                            end_period_year - age == 2000 ~"Cohort 8",
                            end_period_year - age == 2001 ~"Cohort 9",
                            end_period_year - age == 2002 ~"Cohort 10",
                            end_period_year - age == 2003 ~"Cohort 11",
                            end_period_year - age == 2004 ~"Cohort 12",
                            end_period_year - age == 2005 ~"Cohort 13",
                            end_period_year - age == 2006 ~"Cohort 14",
                            end_period_year - age == 2007 ~"Cohort 15",
                            end_period_year - age == 2008 ~"Cohort 16",
                            end_period_year - age == 2009 ~"Cohort 17",
                            end_period_year - age == 2010 ~"Cohort 18",
                            end_period_year - age == 2011 ~"Cohort 19",
                            end_period_year - age == 2012 ~"Cohort 20"))

