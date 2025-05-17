######### Probability ###########

#prob of event = number of ways the event can happen / total number of possible 
#sample_n(): takes in a data frame and the number of rows we want to pull out
#need to set.seed() to generate the same random value each time
#To sample with replacement (when one picked out of the pool, replaced with the other so the total is conserved), set sample_n = TRUE

sales_ppl <- c("Ali", "Murat", "Mehmet", "Can", "H??sn??")
sample(sales_ppl, 5, replace = TRUE)

#Independence: 2 events are independent if the probability of the second event isn't affected by the outcome of the first event
   #when sampling with replacement, each pick is independent
#Dependence: when the outcome of the first changes the probability of the second
  #When sample without replacement, the probability that Ali is picked second depends on who gets picked 
  #If Ali is picked first, there's 0% probability that Ali will be picked second

#A probability distribution:describes the probability of each possible outcome in a scenario
# expected value of a distribution = the mean of a distribution
#calculated by; multiplying each value by its probability and summing

