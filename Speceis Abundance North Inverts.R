library(readxl)
library(ggplot2)

# Read in the North and South side data
NorthInvert <- read_excel("ArranExcel.xlsx", sheet = "Vertebrates north")
SouthInvert <- read_excel("ArranExcel.xlsx", sheet = "Vertebrates south")

# Combine the two datasets to ensure consistent coloring
combined_orders <- unique(c(NorthInvert$order, SouthInvert$order))

# Define a consistent color palette for orders
order_colors <- setNames(
  rainbow(length(combined_orders)),  # Generate distinct colors
  combined_orders                   # Assign colors to orders
)

# Plot the North side invertebrate abundance with consistent colors
ggplot(NorthInvert, aes(x = reorder(order, -individualCount), y = as.numeric(individualCount), fill = order)) +
  geom_bar(stat = "identity", colour = 'black') + 
  scale_fill_manual(values = order_colors) +  # Use consistent color mapping
  labs(
    title = "Order Abundance in moth traps located on the North site",
    x = "Invertebrate Order",
    y = "Individual Counts",
    fill = "Order"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
