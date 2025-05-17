############ Data visualization ############
##creating a plot, use ggplot2 package and ggplot() function
#aes( x= , y= ) + geom_point()


#our exp data;
#setting working dir
setwd("C:/Users/Ceyda/OneDrive/R_works")
food_consumption <- read.csv("food_consumption.csv")


#creating a scatter plot; --> to comapre 2 var
ggplot(food_consumption, aes(x = consumption, y = co2_emission)) +
geom_point()


### log scale -> a scale where each fixed distance represents a multiplication of the value
#To create this, you would add + scale_x_log10() to geom_point() or + scale_y_log10()  (depends on which axis you want to put on the log)
#When to use; for exp; Since population is spread over several orders of magnitude, with some countries having a much higher population than others
ggplot(food_consumption, aes(x = co2_emission, y = consumption)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()
  
#Adding other variables in the plot (such as categorical variables; mostly represented w/diff colors, and numeric var; mostly represented by size)
#to add color & size into plot to represent multiple varaibles;
ggplot(food_consumption, aes(x = consumption, y = co2_emission, color = country, size = year)) +
  geom_point()

##Faceting -> divide your plot into subplots to get one smaller graph for each var
## add + facet_wrap(~...)
ggplot(food_consumption, aes(x = consumption, y = co2_emission, color = country, size = year )) +
  geom_point() +
  facet_wrap(~ food_category)
