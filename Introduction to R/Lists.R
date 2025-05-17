####Lists: allows you to gather a variety of objects under one name (that is, the name of the list) in an ordered way. 
##These objects can be matrices, vectors, data frames, even other lists, etc.

my_vector <- 1:10 
my_matrix <- matrix(1:9, ncol = 3)
my_df <- mtcars[1:10,]
my_list <- list(my_vector, my_matrix, my_df)
my_list

##can give names to the elements in the list
my_list <- list(my_vector, my_matrix, my_df)
names(my_list) <- c("vec", "mat", "df")
my_list

#another exp
moviename <- c("The Shining")
actors <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson")
reviews <- data.frame(scores = c(4.5, 4.0, 5.0),sources = c("IMDb1", "IMDb2", "IMDb3"),comments = c("Best Horror Film I Have Ever Seen", "A truly brilliant and scary film from Stanley Kubrick", "A masterpiece of psychological horror"))

shining_list <- list(moviename, actors, reviews)
shining_list 

###to select a component from a list
shining_list[1]  #gives the 1st component in the list

# Print the second element of the vector representing the actors
shining_list[[2]][2]