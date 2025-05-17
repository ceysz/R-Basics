######## Summary Statistics #######

#setting working dir
setwd("C:/Users/Ceyda/OneDrive/R_works")
food_consumption <- read.csv("food_consumption.csv")

#Mean & Median
mean(food_consumption$consumption)
median(food_consumption$consumption)

##Measures of Spread : it describes how spread apart or close together the data points are
#Variance =  measures the average distance from each data point to the data's mean
  #use var() function
  #The higher the variance, the more spread out the data is
var(food_consumption$consumption)

#Standarnd Dev = sd()
sd(food_consumption$co2_emission)

#Quantiles (percentiles); a generalized version of quartile, so they can split data into pieces
#quantile(var, probs = c(0, 0.2, 0.4, 0.6))
quantile(food_consumption$co2_emission, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1))  #splited into 5 pieces

#How to compute IQR (another way of measuring spread) --> IQR = quantile 3 - quantile 1
q1 <- quantile(food_consumption$co2_emission, 0.25)
q3 <- quantile(food_consumption$co2_emission, 0.75)
iqr <- q3 - q1
iqr

#Calculating upper and lower cutoffs for outliers; 
#If a value is less than q1 - 1.5 * IQR or greater than q3 + 1.5 * IQR it is considered as an outlier
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr
food_consumption %>%
  filter(co2_emission < lower| co2_emission > upper)