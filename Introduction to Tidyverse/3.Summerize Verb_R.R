################ Summerize Verb ##############
#data transformation w/dplyr
#summurize() :to summarize many observations into a single data point
#function to use in summarize; mean(), sum(), median(), min(), max()

#setting working dir
setwd("C:/Users/Ceyda/OneDrive/R_works")
food_consumption <- read.csv("food_consumption.csv")

#to summarize;
food_consumption %>%
  summarize(mean(consumption))

#Rather than summarizing the entire dataset, you may want to find the mean/median/sum etc. of consump for only one particular year
#first, filter then summarize
food_consumption %>%
  filter(year == 2005) %>%
  summarize(mean(consumption))

#can use multiple functions in summarize();
food_consumption %>%
  filter(year == 2008, country == "Serbia") %>%
  summarize(mean(consumption), max(co2_emission), sum(consumption))

##group_by(): summarize within groups instead of summarizing the entire dataset
food_consumption %>%
  group_by(year) %>%
  summarize(mean(consumption), max(co2_emission))

#creating graph based on summary we found;
graph <- food_consumption %>%
  group_by(year) %>%
  summarize(mean_consumption = mean(consumption))
graph
  ggplot(graph, aes(x = year, y = mean_consumption)) +
  geom_point()

#How to include 0-point in graph -> 
ggplot(graph, aes(x = year, y = mean_consumption)) +
  expand_limits(y = 0, x= 0) +
  geom_point()

#visualize it by color/size;
graph1 <- food_consumption %>%
  group_by(country, year) %>%
  summarize(mean_consumption = mean(consumption))
graph1

ggplot(graph1, aes(x = year, y = mean_consumption, color = country)) +
  expand_limits(y = 0) +
  geom_point()

#####
graph2 <- food_consumption %>%
  group_by(country) %>%
  filter(year == 2008) %>%
  summarize(mean_consumption = mean(consumption), mean_co2 = mean(co2_emission))
graph2
ggplot(graph2, aes(x = mean_consumption, y = mean_co2, color = country)) +
  expand_limits(y = 0, x = 0) +
  geom_point()
