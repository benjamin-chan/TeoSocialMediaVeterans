plotRates <- function (y, x, filename, title) {
  require(tools)
  require(ggplot2)
  theme_set(theme_bw())
  require(svglite)
  G <- 
    df %>% 
    ggplot +
    aes(x = get(x), y = get(y)) +
    facet_grid(text ~ image) +
    geom_smooth(method = "glm", method.args = list(family = "poisson")) +
    geom_point(alpha = 1/2) +
    scale_x_log10(toTitleCase(x)) +
    scale_y_continuous("Count") +
    labs(title = title) +
    theme(legend.position = "bottom",
          panel.grid.minor = element_blank(),
          plot.title = element_text(hjust = 0.5))
  ggsave(paste0("../figures/", filename, ".png"), dpi = 300)
  ggsave(paste0("../figures/", filename, ".svg"), dpi = 300)
  file.info(paste0("../figures/", grep(filename, list.files("../figures/"), value = TRUE)))[c("size", "mtime")]
}
