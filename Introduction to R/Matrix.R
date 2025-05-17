new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)
star_wars_matrix

#name rows and columns
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
rownames(star_wars_matrix) <- titles
colnames(star_wars_matrix) <- region

box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE, dimnames = list(titles, region))
star_wars_matrix

#calculates the totals for each row of a matrix
row_total <- rowSums(star_wars_matrix)
all_row_total <- cbind(star_wars_matrix, row_total)
all_row_total
# calculate columns
column_total <- colSums(all_row_total)
all_column_total <- rbind(all_row_total, column_total)
all_column_total

#Combine all into a single matrix
combined_matrix <- rbind(all_row_total, column_total)
combined_matrix

