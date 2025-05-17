##working with datasets that contain different data types instead of only one. 
#A data frame has the variables of a dataset as columns and the observations as rows

#When working on big dataset: show only a small part of the entire dataset
#head() show the first observations of a data frame;
#tail() prints out the last observations in dataset;
#str() shows the structure of your dataset

###Creating data frame
#vectors
name <- c("Mercury", "Venus", "Earth", 
          "Mars", "Jupiter", "Saturn", 
          "Uranus", "Neptune")
type <- c("Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", 
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 
              11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 
              0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <-data.frame(name,type, diameter, rotation, rings)
planets_df

#check the structure
str(planets_df)

#can select first 5 values of diameter column
planets_df[1:5,"diameter"]
# or can use a diff method
planets_df[1:5,3]

#to select all elements of a variable (e.g.diameter)
planets_df[,3] #or 
planets_df[,"diameter"] #or
planets_df$diameter

#to select all the planets with rings
rings_vector <- planets_df$rings
planets_df[rings_vector, ]
#or can use
subset(planets_df, subset = rings)


###Sorting Data
#order() is a function that gives the ranked position of each element when it is applied on a variable
a <- c(100, 10, 1000)
order(a)
a[order(a)]

#order your data so it starts with the smallest planet and ends with the largest (sort by diameter)
positions <- order(planets_df$diameter)  
planets_df[order(planets_df$diameter), ]
