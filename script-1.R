library(tidyverse)

result <- sum(1:10)
print(result)

diamonds_plot <- ggplot(diamonds, aes(x = cut, y = price, fill = cut)) +
  geom_violin(trim = FALSE, alpha = 0.85, color = "white", linewidth = 0.4) +
  geom_boxplot(width = 0.14, fill = "white", outlier.shape = NA, alpha = 0.8) +
  scale_fill_brewer(palette = "Set2") +
  scale_y_log10() +
  labs(
    title = "Diamond prices across cut grades",
    subtitle = "The violin shows the price distribution; the inset box shows its median and middle 50%.",
    x = NULL,
    y = "Price (USD, logarithmic scale)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 20),
    plot.subtitle = element_text(color = "grey35"),
    panel.grid.minor = element_blank()
  )

ggsave("diamonds-1.png", plot = diamonds_plot, width = 10, height = 6, dpi = 300, bg = "white")
