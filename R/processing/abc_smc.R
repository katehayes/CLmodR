
# https://github.com/cran/EasyABC/blob/master/R/EasyABC-internal.R

tidy_sim_data <- function(sim_data) {
  
  # take model output & put it in long format & a bit easier to work with
  sim_data <- sim_data %>%
    pivot_longer(-t, names_to = "state", values_to = "count") %>%
    mutate(age = as.numeric(str_extract_all(state, "(\\d{2})")),
           gender = if_else(grepl("\\[1\\]", state), "Boy", "Girl"),
           state = str_remove(state, "(\\d{2})"),
           state = str_remove(state, "\\[\\d{1}\\]"),
           class = substring(state, 1, 1),
           care = substring(state, 2, 3),
           school = substring(state, 4, 5)) %>%
    select(-state) 
  
}

# tidy_sim <- mod_data %>%
#   tidy_sim_data()


# when the month is january - schools census around the 18th - 3rd week
t_yearly_jan <- c(0:9)*52+3
# lots of care measures taken 31st of march
t_yearly_mar <- c(0:9)*52+13



pru_rate <- tidy_sim %>% 
  filter(t %in% t_yearly_jan,
         age %in% c(10:15)) %>% 
  group_by(t, age, gender, school) %>% 
  summarise(count = sum(count)) %>% 
  ungroup() %>% 
  group_by(t, age, gender) %>% 
  mutate(pc = count/sum(count)) %>% 
  filter(school == "S2")


obs_pru_rate <- schools

get_sum_stats <- function(sim_data) {
  
  # now what summary statistics do we want?
  
  # RATE OF PRU ATTENDANCE BY AGE & GENDER # # # # # # # # # # # # 
  # pars to be calibrated - m2pru, by age and gender, yearly realisation
  # whats the form? want to estimate relationships so that we can change certain inputs & there will be a dynamic response
  # that kind of means want to estimate risk multipliers, i think?
  # is the age multiplier constant over time? is the gender multiplier?
  # is the age*gender multiplier seperable into age mutliplied by gender?
  # maybe the word is decomposable - can the trends we decomposed neatly into a set of multiplier that are meaningful?
  
  # could i fit to a regression? describing likelihood of pru as function of
  # age gender and time?
  # and fit to the reg estimates?
  
  # or what about i spit out PRU rates by age and gen for each year
  # and the distance measure is the sum of sum of squared errors (like every error, for each gender and age at each time point combined)
  
  
  pru_rate <- sim_data %>% 
    filter(t %in% t_yearly_jan) 
  
}






run_mod <- function(candidate_pars, the_model){
  
  # a R function implementing the model to be simulated. 
  # It must take as arguments a vector of model parameter values 
  # and it must return a vector of summary statistics. 
  
  pars <- list(
    # CALIBRATION PARAMETERS
    
  )
  
  # loop to unpack the vector of candidate parameters and stick it in the 
  # pars list?
  

  mod <- the_model$new(user = pars)
  t <- seq(0, 520, length.out = 1041)  
  sim_data <- as.data.frame(mod$run(t))
  
  # from the model output calculate all the necessary summary stats
  # put them into a vector
  summary_stat_sim <- c()
  return(summary_stat_sim)
  
 
  # what about when you want a number of different values - like not a summary
  # statistic but the size of a state at yearly intervals
  
}


prior <- list(c("unif",0,1),c("normal",1,2)
  # a list of prior information. Each element of the list corresponds to a model
  # parameter. The list element must be a vector whose first argument determines
  # the type of prior distribution: possible values are "unif" for a uniform distribution on a segment, "normal" for a normal distribution, "lognormal" for a
  # lognormal distribution or "exponential" for an exponential distribution. The
  # following arguments of the list elements contain the characteritiscs of the prior
  # distribution chosen: for "unif", two numbers must be given: the minimum
  # and maximum values of the uniform distribution; for "normal", two numbers
  # must be given: the mean and standard deviation of the normal distribution; for
  # "lognormal", two numbers must be given: the mean and standard deviation
  # on the log scale of the lognormal distribution; for "exponential", one number
  # must be given: the rate of the exponential distribution
)


sim <- # 

summary_stat_target <- c(1.5,0.5)# a vector containing the targeted (observed) summary statistics

tolerance_tab <- c(1.5,0.5) #a vector containing the sequence of tolerance thresholds


prior_test <- ="X2 > X1" #a string expressing the constraints between model parameters
To add constraints to prior distributions (for instance, parameter 1 < parameter 2), users need
to use the parameter prior_test in the ABC functions of the package (see their online documentation).
This parameter prior_test will be evaluated as a logical expression, you can use
all the logical operators including "<", ">", . . . to define whether a parameter set respects the
constraint. Each parameter should be designated with "X1", "X2", . . . in the same order as in the
prior definition.




## FUNCTION ABC_sequential: Sequential ABC methods (Beaumont et al. 2009, Drovandi
## & Pettitt 2011, Del Moral et al. 2011, Lenormand et al. 2012)
ABC_sequential <- function(method, model, prior, nb_simul, summary_stat_target, prior_test = NULL, 
                           n_cluster = 1, use_seed = FALSE, verbose = FALSE, dist_weights=NULL, ...) {
  ## checking errors in the inputs
  if (missing(method)) 
    stop("'method' is missing")
  if (missing(model)) 
    stop("'model' is missing")
  if (missing(prior)) 
    stop("'prior' is missing")
  data = .wrap_constants_in_model(prior, model, use_seed)
  prior = data$new_prior
  model = data$new_model
  prior = .process_prior(prior)
  if (!is.null(prior_test)) 
    .check_prior_test(length(prior), prior_test)
  if (missing(nb_simul)) 
    stop("'nb_simul' is missing")
  if (missing(summary_stat_target)) 
    stop("'summary_stat_target' is missing")
  if (!any(method == c("Beaumont", "Drovandi", "Delmoral", "Lenormand", "Emulation"))) {
    stop("Method must be Beaumont, Drovandi, Delmoral, Lenormand or Emulation")
  }
  if (!is.vector(nb_simul)) 
    stop("'nb_simul' has to be a number.")
  if (length(nb_simul) > 1) 
    stop("'nb_simul' has to be a number.")
  if (nb_simul < 1) 
    stop("'nb_simul' must be a number larger than 1.")
  nb_simul = floor(nb_simul)
  if (!is.vector(summary_stat_target)) 
    stop("'summary_stat_target' has to be a vector.")
  if (!is.vector(n_cluster)) 
    stop("'n_cluster' has to be a number.")
  if (length(n_cluster) > 1) 
    stop("'n_cluster' has to be a number.")
  if (n_cluster < 1) 
    stop("'n_cluster' has to be a positive number.")
  n_cluster = floor(n_cluster)
  if (!is.logical(use_seed)) 
    stop("'use_seed' has to be boolean")
  if (!is.logical(verbose)) 
    stop("'verbose' has to be boolean")
  if (!is.null(dist_weights) && length(dist_weights)!=length(summary_stat_target)) {
    stop("'dist_weights' has to be the same length than 'summary_stat_target'")
  }
  sequential = NULL
  if (n_cluster == 1) {
    sequential = .ABC_sequential(method, model, prior, prior_test, nb_simul, 
                                 summary_stat_target, use_seed, verbose, dist_weights=dist_weights, ...)
  } else {
    if (method=="Emulation") {
      stop("'Emulation' method isn't yet available in 'cluster' mode'")
    }
    if (use_seed == FALSE) {
      stop("For parallel implementations, you must specify the option 'use_seed=TRUE' and modify your model accordingly - see the package's vignette for more details.")
    }
    sequential = .ABC_sequential_cluster(method, model, prior, prior_test, nb_simul, 
                                         summary_stat_target, n_cluster, use_seed, verbose, dist_weights=dist_weights, ...)
  }
  sequential
} 

## function to compute a distance between a matrix of simulated statistics (row:
## different simulations, columns: different summary statistics) and the array of
## data summary statistics
.compute_dist <- function(summary_stat_target, simul, sd_simul, dist_weights=NULL) {
  l = length(summary_stat_target)
  # If simul is not a matrix (which happens when l == 1) we tranform it into a
  # matrix
  if (!is.matrix(simul)) {
    if (length(summary_stat_target) == 1) {
      simul <- matrix(simul, length(simul), 1)
    } else {
      simul <- matrix(simul, 1, length(simul))
    }
  }
  dist=NULL
  if (!is.null(dist_weights)) {
    for (i in 1:l){
      dist = dist + (simul[,i] - summary_stat_target[i]) * (simul[,i] - summary_stat_target[i]) * (dist_weights[i]/sum(dist_weights))
    }
  } else {
    vartab = sd_simul^2
    # Ensure positivity of variances: the elements of vartab that are close to zero
    # are set to one
    vartab[vartab == 0] = 1
    dist=colSums((t(simul) - as.vector(summary_stat_target))^2/as.vector(vartab))
  }
  dist
}




# BELOW HERE IS JUST REJECTION SAMPLING

# set up
N <- 1000 #number of accepted particles
epsilon <- 20 #epsilon value
n_par <- 1 #how many parameters will be estimated
res <- matrix(ncol = n_par, n_row = N) #empty matrix to store results

#model parameters and the distance

#abc algorithm

i <- 1 #initiate counter of accepted particles
j <- 1 #initiate counter of proposed particles

while(i <= N) { #the number of accepted particles is less than N
  
  theta_star <- runif(1,0,1) #sample from prior distributions
  D_star <- run_model(theta_star) #simulate data set from the model
  distance <- calc_distance(D, D_star) #calculate distance
  
  if(distance <= epsilon) { #if the distance is less than or equal to the tolerance
    
    res[i, ] <- c(theta_star, distance) #store results
    i <- i + 1 #update counter
    
  }
  
  j <- j + 1 #update counter
  acc_rate <- i/j #calculate acceptance rate
  cat("current acceptance rate = ", round(acc_rate, 2), "\n")
  
}