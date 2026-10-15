library(tidyverse)

diamonds_plot <- ggplot(diamonds, aes(x = carat, y = price)) +
  geom_bin2d(bins = 35) +
  facet_wrap(vars(cut), nrow = 1) +
  scale_x_log10() +
  scale_y_log10() +
  scale_fill_viridis_c(
    option = "magma",
    trans = "sqrt",
    name = "Diamond\ncount"
  ) +
  labs(
    title = "A landscape of diamond prices",
    subtitle = "Each tile counts diamonds by carat and price, split by cut grade.",
    x = "Carat (log scale)",
    y = "Price in USD (log scale)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 20),
    plot.subtitle = element_text(color = "grey35"),
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold")
  )

ggsave("diamonds-2.png", plot = diamonds_plot, width = 12, height = 5.5, dpi = 300, bg = "white")
