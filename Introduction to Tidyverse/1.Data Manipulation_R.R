############ Data Manipulation ############


##Filter(): when you want to look only at a subset of your observations, based on a particular condition.
#Every time you apply a verb, you'll use a pipe operator "%>%" : is a percent, greater than, percent. It says "take whatever is before it, and feed it into the next step."

##Create a random data frame to use in the examples
country <- c("Argentina", "Ethiopia", "India", "Serbia", "Turkey", "England", "US")
food_category <- c("beef", "chichken", "fish", "rice", "Wheat")
year <- c(2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010)
food_consumption <- expand.grid(country = country, food_category = food_category, year = year)
nrow(food_consumption)
set.seed(7)
food_consumption$consumption <- runif(nrow(food_consumption), min = 0, max = 2000)
food_consumption$co2_emission <- runif(nrow(food_consumption), min = 0, max = 2000)

#########exporting files;
#library(writexl)
#write.csv(food_consumption, "food_consumption.csv")
#or
#write_xlsx-(food_consumption, "food_consumption.xlsx")

##########importing files;
#setwd("C:/Users/Ceyda/OneDrive/R_works")
#random_name <- read.csv("food_consumption.csv")


#filtering data for year
food_consumption %>%
  filter(year == 2005)
#filtering data both for year and the beef consumption to that specific year
food_consumption %>%
  filter(food_category == "beef", year == 2006)

# %in%  : checkes if the values in the ... column are included in the vector c("..", "...", "...")
food_consumption %>%
  filter(country %in% c("Turkey", "Argentina", "Serbia"))

#arrange():sorts the observations in a dataset, in ascending or descending order based on one of its variables.
#can use the arrange verb after the pipe operator. 
food_consumption %>%
  arrange(consumption)

#can also arrange for descending order; use desc()
food_consumption %>%
  arrange(desc(consumption))

#can use both;
food_consumption %>%
  filter(food_category == "rice", year == 2004) %>%
  arrange(desc(consumption))

#mutate():to add a new variable or change a variable in your dataset
#to add a new var:
new_table <- food_consumption %>%
  mutate(co2_kullanimi_haftalik = co2_emission * 7)
new_table

#to change a existing var:
new_table2 <- food_consumption %>%
  mutate(consumption = consumption / 10)
new_table2

#can use all in one pipe;
new_table3 <- food_consumption %>%
  filter(year == 2005) %>%
  mutate(consumption_daily = consumption / 360) %>%
  arrange(desc(consumption_daily))
new_table3

#count(): number of occurrences of a particular value or combination of values in a data frame.
#to calculate the frequency of unique values.

#weight by; wt = ...
food_consumption %>%
  count(country, wt = co2_emission, sort = TRUE)  ##can weigh your count by particular variables rather than finding the number of countries

#slice_max(): return the largest observations in each group
food_consumption %>%
  group_by(country) %>%
  slice_max(consumption)

#slice_min(): return the smallest observation in each group
food_consumption %>%
  select(country, consumption, year) %>%
  group_by(country) %>%
  slice_min(consumption)

#ungroup():Removes the grouping, making it possible to perform further operations on the entire data frame
food_consumption %>%
  group_by(country, year, food_category) %>%
  ungroup()

#Other helpers; contains(), starts_with(), ends_with(), last_col(), matches()

#relocate() : to change the position of columns in a data frame
food_consumption %>%
  relocate(food_category, .after = year)

food_consumption %>%
relocate(food_category, .after = last_col())
