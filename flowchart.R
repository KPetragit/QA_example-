workflow_steps <- data.frame(
  x = rep(1, 6),
  y = seq(from = 6, to = 1, by = -1),
  step = c(
    "Pull data from Kobo server daily at 02:00",
    "Clean data using log of corrections",
    "Run quality assurance checks",
    "Log cases flagged in quality assurance checks",
    "Present flagged cases in dashboard",
    "Review & correct flagged cases in dashboard"
  )
)

library(ggplot2)
library(dplyr)
library(unhcrthemes)
library(extrafont)

# Define the workflow steps
workflow_steps <- data.frame(
  x = rep(1, 6),
  y = seq(from = 6, to = 1, by = -1),
  step = c(
    "Pull data from Kobo server daily at 02:00",
    "Clean data using log of corrections",
    "Run quality assurance checks",
    "Log cases flagged in quality assurance checks",
    "Present flagged cases in dashboard",
    "Review & correct flagged cases in dashboard"
  ),
  type = c(rep("Automated", 5), "Manual")
)

# Create the ggplot
flowchart <- ggplot(workflow_steps, aes(x = x, y = y, fill = type)) +
  # Add lines connecting steps
  geom_segment(
    aes(x = x, y = y, xend = x, yend = 1), 
    arrow = arrow(length = unit(0.25, "cm")),
    color = "#044F85",
    linewidth = 1
  ) +
  # Add points for each step
  geom_point(
    size = 15, 
    shape = 21,
    stroke = 1
  ) +
  # Add text labels
  geom_text(
    aes(label = step), 
    nudge_x = 0.2, 
    hjust = 0,
    size = 5
  ) +
  # Add feedback loop for last step
  geom_curve(
    x = 1, y = 1, 
    xend = 1, yend = 5, 
    curvature = -0.5,
    arrow = arrow(length = unit(0.25, "cm")),
    color = "#044F85",
    linewidth = 1
  ) +
  # Color scale
  scale_fill_unhcr_d() +
  # Theming
  theme_unhcr(grid = "", axis_text = F, axis_title = F) +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    legend.position = "bottom"
  ) +
  # Set coordinate system
  coord_cartesian(xlim = c(0.5, 3), ylim = c(0.5, 6.5))

# Print the flowchart
saveRDS(flowchart, "flowchart.rds")
