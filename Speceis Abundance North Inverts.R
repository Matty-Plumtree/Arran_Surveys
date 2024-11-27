library(readxl)
library(ggplot2)

# This reads in our excel spreadsheet from arran
NorthInvert <- read_excel("ArranExcel.xlsx",sheet="North side invert transects")


# I had to get help from stack overflow for reording order and individual counts
ggplot(NorthInvert, aes(x = reorder(order, -individualCount), y = as.numeric(individualCount), fill = order)) +
  geom_bar(stat = "identity", colour = 'black') + # ensures that these values are used directly for the bar heights, instead of counting the occurrences of order.
  labs(title = "Order Abundance in North Side Transects",
       x = "Invertebrate Order",
       y = "Individual Counts",
       fill = "Order"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
