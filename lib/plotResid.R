plotResid <- function (y, title) {
  require(ggplot2)
  theme_set(theme_bw())
  require(svglite)
  G <- 
    df %>% 
    ggplot +
    aes(x = date, y = get(y)) +
    facet_grid(adText ~ adImage) +
    geom_point(alpha = 1/2) +
    geom_smooth() +
    scale_x_date("Date") +
    scale_y_continuous("Residual count") +
    labs(title = title) +
    theme(legend.position = "bottom",
          panel.grid.minor = element_blank(),
          plot.title = element_text(hjust = 0.5))
  ggsave(paste0("../figures/", y, ".png"), dpi = 300)
  ggsave(paste0("../figures/", y, ".svg"), dpi = 300)
  file.info(paste0("../figures/", grep(y, list.files("../figures/"), value = TRUE)))[c("size", "mtime")]
}
