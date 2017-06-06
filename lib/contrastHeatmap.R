contrastHeatmap <- function (mat, filename) {
  require(magrittr)
  require(reshape2)
  require(ggplot2)
  require(RColorBrewer)
  mat[lower.tri(mat)] <- mat %>% t %>% .[lower.tri(mat)]
  diag(mat) <- 1
  mat %>% 
    as.matrix %>% 
    melt %>% 
    mutate(sig = cut(value, breaks = c(0, 0.001, 0.01, 0.05, 0.1, 1), include.lowest = TRUE)) %>% 
    ggplot + 
    aes(x = Var1, y = Var2, fill = sig) +
    geom_tile(width = 0.8, height = 0.8) +
    scale_x_discrete("") +
    scale_y_discrete("") +
    scale_fill_brewer("p-value", palette = "RdYlBu", na.value = "white") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          panel.grid = element_blank())
  ggsave(paste0("../figures/", filename, ".png"), dpi = 300)
  ggsave(paste0("../figures/", filename, ".svg"), dpi = 300)
}
