library(readxl)
library(ggplot2)
library(ggpattern)

# Read in the data
NorthInvert <- read_excel("ArranExcel.xlsx", sheet = "Vertebrates north")
SouthInvert <- read_excel("ArranExcel.xlsx", sheet = "Vertebrates south")

# Add site column and combine data
combined_data <- dplyr::bind_rows(
  dplyr::mutate(NorthInvert, Site = "North"),
  dplyr::mutate(SouthInvert, Site = "South")
)

# Prepare data for presence counts
presence_data <- combined_data %>%
  dplyr::group_by(scientificName, Site) %>%
  dplyr::summarise(Presence = n(), .groups = "drop")

# Create a consistent color palette
species_colors <- setNames(
  rainbow(length(unique(presence_data$scientificName))),
  unique(presence_data$scientificName)
)

# Create the plot
ggplot(presence_data, aes(x = scientificName, y = Presence, fill = Site, pattern = Site)) +
  geom_bar_pattern(
    stat = "identity",
    position = position_dodge(width = 0.9),
    color = "black",                # Black border for bars
    pattern_fill = "black",         # Pattern color
    pattern_angle = 45,            # Angle of pattern stripes
    pattern_density = 0.1,         # Stripe density
    pattern_spacing = 0.05         # Stripe spacing
  ) +
  scale_fill_manual(values = c("North" = "skyblue", "South" = "lightgreen")) +
  scale_pattern_manual(values = c("North" = "stripe", "South" = "none")) +
  labs(
    title = "Vertebrate Species Presence in North and South Sites",
    x = "Species",
    y = "Presence Count",
    fill = "Site",
    pattern = "Site Pattern"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
  )