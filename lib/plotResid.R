plotResid <- function (y, x, filename, title) {
  require(tools)
  require(ggplot2)
  theme_set(theme_bw())
  require(svglite)
  if (x == "date") {
    scaleX <- scale_x_date(toTitleCase(x))
  } else {
    scaleX <- scale_x_log10(toTitleCase(x))
  }
  G <- 
    df1 %>% 
    mutate(pred = predict(M$modelObject, type = "response"),
           resid = resid(M$modelObject, type = "response")) %>% 
    ggplot +
    aes(x = get(x), y = get(y)) +
    facet_grid(text ~ image) +
    geom_point(alpha = 1/2) +
    scaleX +
    scale_y_continuous("Residual count") +
    labs(title = title) +
    theme(legend.position = "bottom",
          panel.grid.minor = element_blank(),
          plot.title = element_text(hjust = 0.5))
  ggsave(paste0("../figures/", filename, ".png"), dpi = 300)
  ggsave(paste0("../figures/", filename, ".svg"), dpi = 300)
  # file.info(paste0("../figures/", grep(filename, list.files("../figures/"), value = TRUE)))[c("size", "mtime")]
}
