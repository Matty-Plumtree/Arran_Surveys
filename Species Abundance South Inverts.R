# Plot the South side invertebrate abundance with consistent colors
ggplot(SouthInvert, aes(x = reorder(order, -individualCount), y = as.numeric(individualCount), fill = order)) +
  geom_bar(stat = "identity", colour = 'black') + 
  scale_fill_manual(values = order_colors) +  # Use consistent color mapping from the North plot
  labs(
    title = "Order Abundance in South Site Transects",
    x = "Invertebrate Order",
    y = "Individual Counts",
    fill = "Order"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )