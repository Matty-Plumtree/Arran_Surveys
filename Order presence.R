# Load necessary libraries
library(ggplot2)
library(dplyr)

# Assuming SouthInvert and NorthInvert are your data frames

# Prepare the data
south_orders <- SouthInvert %>%
  count(order) %>%
  mutate(Site = "South")

north_orders <- NorthInvert %>%
  count(order) %>%
  mutate(Site = "North")

# Combine the datasets
combined_data <- bind_rows(south_orders, north_orders)

# Create the bar plot
ggplot(combined_data, aes(x = reorder(order, n), y = n, fill = Site)) +
  geom_bar(stat = "identity", position = "dodge", colour = 'black') +
  labs(
    title = "Species presence from moth traps",
    x = "Order",
    y = "Presence Count",
    fill = "Site"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )