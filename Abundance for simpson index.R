
library(vegan)
library(dplyr)

# Summarise the abundance for each order
abundance_by_order <- SouthInvert %>%
  group_by(order) %>%
  summarise(TotalAbundance = sum(individualCount, na.rm = TRUE)) %>%
  arrange(desc(TotalAbundance))

# Extract the abundance values as a vector
abundances <- abundance_by_order$TotalAbundance

# Calculate the Simpson Index, with this piece of code you can also just change it for shannon index too
simpson_index <- diversity(abundances, index = "shannon") 

# Print the Simpson Index
print(simpson_index)


# https://search.r-project.org/CRAN/refmans/abdiv/html/simpson.html <- I used this to help me


1.206757-0.9743148	
