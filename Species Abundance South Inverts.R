library(readxl)
library(ggplot2)

# This reads in our excel spreadsheet from arran
SouthInvert <- read_excel("ArranExcel.xlsx",sheet="South side invert transects")


# I had to get help from stack overflow for reording order and individual counts
ggplot(SouthInvert, aes(x = reorder(order, -individualCount), y = as.numeric(individualCount), fill = order)) +
  geom_bar(stat = "identity") +
  labs(title = "Species Abundance in South Side Transects",
    x = "Invertebrate Order",
    y = "Individual Counts",
    fill = "Order"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
