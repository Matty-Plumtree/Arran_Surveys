# Define the jaccard Index function
jaccard <- function(a, b) {
  intersection = length(intersect(a, b))
  union = length(a) + length(b) - intersection
  return (intersection/union)
}
# Calculate unique orders for each site
unique_orders <- unique(SouthInvert$scientificName)
unique_orders1 <- unique(NorthInvert$scientificName)

# Create vectors for unique orders
a <- c(unique_orders)
b <- c(unique_orders1)

# Create vectors for unique orders
jaccard(a,b)

# Define the Sørenson Index function
sorenson <- function(a, b) {
  intersection = length(intersect(a, b))  
  total = length(a) + length(b)           
  return ((2 * intersection) / total)     
}

# Calculate unique orders for each site
unique_orders <- unique(SouthInvert$scientificName)  
unique_orders1 <- unique(NorthInvert$scientificName) 

# Create vectors for unique orders
a <- c(unique_orders)
b <- c(unique_orders1)

# Create vectors for unique orders
sorenson(a, b)
