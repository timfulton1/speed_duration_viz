# Load packages
library(dplyr)
library(ggplot2)
library(patchwork)
library(forcats)
library(showtext)

# Load data
speed_duration_raw <- read.csv("data/cs_data.csv")

# Assign colors
color1 = "#edae49"
color2 = "#2e4057"


# Add font
font_add_google("Roboto")
showtext_auto()


## Render plots
# Scatter plot 
scatter_plot <- speed_duration_raw %>% 
  ggplot(mapping = aes(x = d_prime, y = critical_speed, fill = gender, color = gender)) +
  theme_classic() + 
  theme(
    text = element_text(size = 18, family = "Roboto"),
    axis.title.x = element_text(margin = margin(t = 15)),
    axis.title.y = element_text(margin = margin(r = 15)),
    axis.text = element_text(color = "black"),
    legend.position = "bottom"
  ) + 
  scale_x_continuous(
    limit = c(70, 330),
    breaks = seq(from = 100, to = 300, by = 100)
  ) + 
  scale_y_continuous(
    limit = c(5.0, 6.5),
    breaks = seq(from = 5, to = 6.5, by = 0.5)
  ) +
  xlab("D' (m)") + 
  ylab("Critical Speed (m/s)") + 
  geom_point(
    shape = 21,
    alpha = 1, 
    color = "white",
    size = 3.5
  ) +
  scale_fill_manual(values = c(color1, color2)) + 
  scale_color_manual(values = c(color1, color2)) + 
  guides(
    fill = guide_legend(title = NULL, reverse=TRUE),
    color = guide_legend(title = NULL, reverse=TRUE)
  )


# x density plot
density_x <- speed_duration_raw %>% 
  ggplot(mapping = aes(x = d_prime, fill = factor(gender), color = factor(gender))) +
  theme_void() + 
  theme(legend.position = "none") +
  geom_density(
    alpha = 0.8,
    trim = TRUE
  ) +
  scale_x_continuous(
    limit = c(70, 310),
    breaks = seq(from = 100, to = 330, by = 100)
  ) + 
  scale_fill_manual(values = c(color1, color2)) +
  scale_color_manual(values = c(color1, color2))


# y density plot
density_y <- speed_duration_raw %>% 
  ggplot(mapping = aes(x = critical_speed, fill = factor(gender), color = factor(gender))) +
  theme_void() + 
  theme(legend.position = "none") +
  coord_flip() +
  geom_density(
    alpha = 0.8,
    trim = TRUE
  ) +
  scale_x_continuous(
    limit = c(5.0, 6.5),
    breaks = seq(from = 5, to = 6.5, by = 0.5)
  ) +
  scale_fill_manual(values = c(color1, color2)) +
  scale_color_manual(values = c(color1, color2))


# x boxplot 
boxplot_x <- speed_duration_raw %>% 
  ggplot(mapping = aes(x = fct_rev(factor(gender)), y = d_prime, fill = factor(gender), color = factor(gender))) +
  theme_void() +
  coord_flip() +
  geom_boxplot(
    alpha = 0.8,
    width = 0.75, 
    outlier.shape = NA,
    position = "dodge2"
  ) +
  scale_fill_manual(values = c(color1, color2)) +
  scale_color_manual(values = c(color1, color2)) +
  scale_y_continuous(
    limit = c(70, 310),
    breaks = seq(from = 100, to = 300, by = 100)
  ) +
  guides(
    fill = "none", 
    color = "none"
  ) 


# y boxplot 
boxplot_y <- speed_duration_raw %>% 
  ggplot(mapping = aes(x = factor(gender), y = critical_speed, fill = factor(gender), color = factor(gender))) +
  theme_void() +
  geom_boxplot(
    alpha = 0.8,
    width = 0.75, 
    outlier.shape = NA,
    position = "dodge2"
  ) +
  scale_fill_manual(values = c(color1, color2)) +
  scale_color_manual(values = c(color1, color2)) +
  scale_y_continuous(
    limit = c(5.0, 6.5),
    breaks = seq(from = 5, to = 6.5, by = 0.5)
  ) +
  guides(
    fill = "none", 
    color = "none"
  ) 


# Use plotspacer to create grid with an invisible plot
final_plot <- density_x + plot_spacer() + plot_spacer() + boxplot_x + plot_spacer() + plot_spacer() + scatter_plot + boxplot_y + density_y + plot_layout(ncol = 3, nrow = 3, widths = c(4, 0.5, 1), heights = c(1, 0.5, 4))


# Save the plot
ggsave(
  "plots/speed_duration.png", 
  plot = final_plot, 
  width = 8,
  height = 8,
  units = "in",
  dpi = 600
)
