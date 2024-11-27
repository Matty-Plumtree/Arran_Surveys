SouthInvert <- read_excel("ArranExcel.xlsx",sheet="South side invert transects")
library(vegan)
library(dplyr)

# Summarise the abundance for each order
abundance_by_order <- SouthInvert %>%
  group_by(order) %>%
  summarise(TotalAbundance = sum(individualCount, na.rm = TRUE)) %>%
  arrange(desc(TotalAbundance))

# Extract the abundance values as a vector
abundances <- abundance_by_order$TotalAbundance

# Calculate the Simpson Index
simpson_index <- diversity(abundances, index = "shannon")

# Print the Simpson Index
print(simpson_index)

# https://search.r-project.org/CRAN/refmans/abdiv/html/simpson.html <- I used this to help me

1.543476- 1.283699
