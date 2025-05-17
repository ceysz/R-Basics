#Factors--> used for categorical data (has limited num of categories; e.g. sex))

#create a vector that contains all the observations that belong to a limited number of categories & convert it to factor
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_sex_vector <- factor(sex_vector)
factor_sex_vector

#There are 2 types of categorical variable: nominal (categorical variable without an implied order) and an ordinal (have a natural ordering)
#Exp nominal
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector
#Exp ordinal
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

##############################3quick overview of the contents of a variable: use summary()
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
#"F", "M" isimlerine "Female", "Male" de??i??tirmek i??in levels() kullan
levels(factor_survey_vector) <- c("Female", "Male")
factor_survey_vector

# Generate summary for survey_vector
summary(survey_vector)

# Generate summary for factor_survey_vector
summary(factor_survey_vector)

####################################################
#comparing different elements in ordinal data
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))
data_analyst2 <-factor_speed_vector[2]
data_analyst5 <-factor_speed_vector[5]
data_analyst2>data_analyst5