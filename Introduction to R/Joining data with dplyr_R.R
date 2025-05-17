########### Joining Data ###########


data(package = .packages(all.available = TRUE))
data(msleep)

msleep  #Table 1
msleep$genus <- NULL



animal_characteristics <- data.frame(
  name = c("Lion", "Capybara", "Bald Eagle", "Panda", "Elephant", "Walrus", "Penguin", "Red Fox", "Horse", "Dolphin"),
  sleep_total = c(12, 6, 8, 10, 4, 7, 16, 9, 8, 9),
  sleep_rem = c(2.5, 1.2, 2.3, 3, 1, 1.5, 4, 2.1, 3.2, 2.7),
  sleep_cycle = c(NA, 0.8, 1.2, 0.5, 0.9, 0.3, 1, 1.5, 0.6, 1.1),
  awake = c(12, 18, 16, 14, 20, 17, 8, 15, 16, 15)
  )                                                        #Table 2
animal_characteristics

#Linking 2 tables together; 
#inner_join() : returns only the rows that have matching values in both tables
#Only use when you want to include only the data that exists in both tables

all_sleep <- msleep %>%
  inner_join(animal_characteristics, by = c("name"))
all_sleep

#Left_join() : Keeps all rows from the left data frame (df1) and matches from the right data frame (df2). Missing matches are filled with NA.

all_sleep1 <- msleep %>%
  left_join(animal_characteristics, by = c("name"))
all_sleep1

#full_join(): Keeps all rows from both data frames. Missing matches are filled with NA.
all_sleep2 <- msleep %>%
  full_join(animal_characteristics, by = c("name"))
all_sleep2

#semi_join():Keeps only rows from the left data frame (df1) that have matches in the right data frame (df2). Does not include columns from df2.
all_sleep3 <- msleep %>%
  semi_join(animal_characteristics, by = c("name"))
all_sleep3

#anti_join():Keeps only rows from the left data frame (df1) that do not have matches in the right data frame (df2)
all_sleep4 <- msleep %>%
  semi_join(animal_characteristics, by = c("name"))
all_sleep4


#Count (counting the number of occurrences) by weight (to assign weights to each row based on the values in the weighted column):
msleep %>%
  count(order, wt = sleep_rem)

#Use replace_na to change the NAs in the "vore" column to "vore_unknown"
msleep_NA <- msleep %>%
  replace_na(list(vore = "vore_unknown"))
  
# as.integer: bir de??eri tamsay??(integer) veri tipine d??n????t??rmek i??in
msleep_integer <- msleep %>%
  mutate(sleep_total = as.integer(sleep_total))




