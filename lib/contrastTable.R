contrastTable <- function (glmObj) {
  require(magrittr)
  require(dplyr)
  require(multcomp)
  getp <- function(glhtObj) {
    require(magrittr)
    glhtObj %>% summary %>% .$test %>% .$pvalues %>% as.numeric
  }
  mat1 <- matrix(nrow = nlevels(df$image), ncol = nlevels(df$image)) %>%data.frame 
  row.names(mat1) <- levels(df$image)
  names(mat1) <- row.names(mat1)
  mat1[1, 2] <- glmObj %>% summary %>% .$coef %>% .["imageFamily", "Pr(>|z|)"]
  mat1[1, 3] <- glmObj %>% summary %>% .$coef %>% .["imageVeteran", "Pr(>|z|)"]
  mat1[2, 3] <- glht(glmObj, linfct = c("imageFamily - imageVeteran = 0")) %>% getp
  mat2 <- matrix(nrow = nlevels(df$text), ncol = nlevels(df$text)) %>% data.frame 
  row.names(mat2) <- levels(df$text)
  names(mat2) <- row.names(mat2)
  mat2[1, 2] <- glmObj %>% summary %>% .$coef %>% .["textAltruism", "Pr(>|z|)"]
  mat2[1, 3] <- glmObj %>% summary %>% .$coef %>% .["textEmpowerment", "Pr(>|z|)"]
  mat2[1, 4] <- glmObj %>% summary %>% .$coef %>% .["textSharing", "Pr(>|z|)"]
  mat2[1, 5] <- glmObj %>% summary %>% .$coef %>% .["textSocialNorms", "Pr(>|z|)"]
  mat2[2, 3] <- glht(glmObj, linfct = c("textAltruism - textEmpowerment = 0")) %>% getp
  mat2[2, 4] <- glht(glmObj, linfct = c("textAltruism - textSharing = 0")) %>% getp
  mat2[2, 5] <- glht(glmObj, linfct = c("textAltruism - textSocialNorms = 0")) %>% getp
  mat2[3, 4] <- glht(glmObj, linfct = c("textEmpowerment - textSharing = 0")) %>% getp
  mat2[3, 5] <- glht(glmObj, linfct = c("textEmpowerment - textSocialNorms = 0")) %>% getp
  mat2[4, 5] <- glht(glmObj, linfct = c("textSharing - textSocialNorms = 0")) %>% getp
  list(contrastImage = mat1[1:2, 2:3],
       contrastText = mat2[1:4, 2:5])
}