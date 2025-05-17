####### Types of graphs ########

#setting working dir
setwd("C:/Users/Ceyda/OneDrive/R_works")
food_consumption <- read.csv("food_consumption.csv")
food_consumption

#line plots: use geom_line()
graph <- food_consumption %>%
  group_by(year, country) %>%
  summarize(mean_consump = mean(consumption))
graph
ggplot(graph, aes(x = year, y =  mean_consump, color = country)) +
  expand_limits(y = 0) +
  geom_line()


#bar plots: use geom_col() --> x is the categorical var, y is the var that determines the height of the bar
#unlike line and scatter plots, bar plots always start w/0
graph <- food_consumption %>%
  filter(year == 2008) %>%
  group_by(country) %>%
  summarize(mean_consump = mean(consumption))
graph
ggplot(graph, aes(x = country, y =  mean_consump)) +
  geom_col()


# histograms: use geom_histogram()
#it only has x-axis --> represents the variable whose distribution you are examining. 
#The width of each bin in the histogram is chosen automatically
#To customize the width: geom_histogram(binwidth = )

graph1 <- food_consumption %>%
  filter(year == 2008) %>%
  group_by(country)
ggplot(graph1, aes(x = consumption)) +
  geom_histogram(binwidth = 100)     ##represents distribution of consump across countries in the year 2008


# boxplots: geom_boxplot()
#x is the category var, and y is the values that we're comparing
#The black line in the middle of each white box is the median
#The top and bottom of each box represent the 75th percentile and the 25th percentile of that group, meaning half of the distribution lies within that box
graph2 <- food_consumption %>%
  filter(year == 2004)
ggplot(graph2, aes(x = country, y = co2_emission)) +
  geom_boxplot() 
  

##we can add a titel to our graph; use ggtitle()
graph2 <- food_consumption %>%
  filter(year == 2004)
ggplot(graph2, aes(x = country, y = co2_emission)) +
  geom_boxplot() +
  ggtitle("slay queen")


  



