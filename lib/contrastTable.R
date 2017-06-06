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
  mat3 <- 
    matrix(nrow = nlevels(df$image) * nlevels(df$text), 
           ncol = nlevels(df$image) * nlevels(df$text)) %>% 
    data.frame 
  row.names(mat3) <- sprintf("%s-%s", 
                             rep(substr(levels(df$image), 1, 3), each = nlevels(df$text)), 
                             rep(substr(levels(df$text), 1, 3), nlevels(df$image)))
  names(mat3) <- row.names(mat3)
  mat3[ 1,  2] <- glht(glmObj, linfct = c("textAltruism = 0")) %>% getp
  mat3[ 1,  3] <- glht(glmObj, linfct = c("textEmpowerment = 0")) %>% getp
  mat3[ 1,  4] <- glht(glmObj, linfct = c("textSharing = 0")) %>% getp
  mat3[ 1,  5] <- glht(glmObj, linfct = c("textSocialNorms = 0")) %>% getp
  mat3[ 1,  6] <- glht(glmObj, linfct = c("imageFamily = 0")) %>% getp
  mat3[ 1,  7] <- glht(glmObj, linfct = c("imageFamily + textAltruism + imageFamily:textAltruism = 0")) %>% getp
  mat3[ 1,  8] <- glht(glmObj, linfct = c("imageFamily + textEmpowerment + imageFamily:textEmpowerment = 0")) %>% getp
  mat3[ 1,  9] <- glht(glmObj, linfct = c("imageFamily + textSharing + imageFamily:textSharing = 0")) %>% getp
  mat3[ 1, 10] <- glht(glmObj, linfct = c("imageFamily + textSocialNorms + imageFamily:textSocialNorms = 0")) %>% getp
  mat3[ 1, 11] <- glht(glmObj, linfct = c("imageVeteran = 0")) %>% getp
  mat3[ 1, 12] <- glht(glmObj, linfct = c("imageVeteran + textAltruism + imageVeteran:textAltruism = 0")) %>% getp
  mat3[ 1, 13] <- glht(glmObj, linfct = c("imageVeteran + textEmpowerment + imageVeteran:textEmpowerment = 0")) %>% getp
  mat3[ 1, 14] <- glht(glmObj, linfct = c("imageVeteran + textSharing + imageVeteran:textSharing = 0")) %>% getp
  mat3[ 1, 15] <- glht(glmObj, linfct = c("imageVeteran + textSocialNorms + imageVeteran:textSocialNorms = 0")) %>% getp
  mat3[ 2,  3] <- glht(glmObj, linfct = c("textAltruism - textEmpowerment = 0")) %>% getp
  mat3[ 2,  4] <- glht(glmObj, linfct = c("textAltruism - textSharing = 0")) %>% getp
  mat3[ 2,  5] <- glht(glmObj, linfct = c("textAltruism - textSocialNorms = 0")) %>% getp
  mat3[ 2,  6] <- glht(glmObj, linfct = c("textAltruism - imageFamily = 0")) %>% getp
  mat3[ 2,  7] <- glht(glmObj, linfct = c("               (imageFamily                + imageFamily:textAltruism) = 0")) %>% getp
  mat3[ 2,  8] <- glht(glmObj, linfct = c("textAltruism - (imageFamily + textEmpowerment + imageFamily:textEmpowerment) = 0")) %>% getp
  mat3[ 2,  9] <- glht(glmObj, linfct = c("textAltruism - (imageFamily + textSharing + imageFamily:textSharing) = 0")) %>% getp
  mat3[ 2, 10] <- glht(glmObj, linfct = c("textAltruism - (imageFamily + textSocialNorms + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 2, 11] <- glht(glmObj, linfct = c("textAltruism - imageVeteran = 0")) %>% getp
  mat3[ 2, 12] <- glht(glmObj, linfct = c("               (imageVeteran                + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 2, 13] <- glht(glmObj, linfct = c("textAltruism - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 2, 14] <- glht(glmObj, linfct = c("textAltruism - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 2, 15] <- glht(glmObj, linfct = c("textAltruism - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 3,  4] <- glht(glmObj, linfct = c("textEmpowerment - textSharing = 0")) %>% getp
  mat3[ 3,  5] <- glht(glmObj, linfct = c("textEmpowerment - textSocialNorms = 0")) %>% getp
  mat3[ 3,  6] <- glht(glmObj, linfct = c("textEmpowerment - imageFamily = 0")) %>% getp
  mat3[ 3,  7] <- glht(glmObj, linfct = c("textEmpowerment - (imageFamily + textAltruism + imageFamily:textAltruism) = 0")) %>% getp
  mat3[ 3,  8] <- glht(glmObj, linfct = c("                  (imageFamily                   + imageFamily:textEmpowerment) = 0")) %>% getp
  mat3[ 3,  9] <- glht(glmObj, linfct = c("textEmpowerment - (imageFamily + textSharing + imageFamily:textSharing) = 0")) %>% getp
  mat3[ 3, 10] <- glht(glmObj, linfct = c("textEmpowerment - (imageFamily + textSocialNorms + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 3, 11] <- glht(glmObj, linfct = c("textEmpowerment - imageVeteran = 0")) %>% getp
  mat3[ 3, 12] <- glht(glmObj, linfct = c("textEmpowerment - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 3, 13] <- glht(glmObj, linfct = c("                  (imageVeteran                   + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 3, 14] <- glht(glmObj, linfct = c("textEmpowerment - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 3, 15] <- glht(glmObj, linfct = c("textEmpowerment - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 4,  5] <- glht(glmObj, linfct = c("textSharing - textSocialNorms = 0")) %>% getp
  mat3[ 4,  6] <- glht(glmObj, linfct = c("textSharing - imageFamily = 0")) %>% getp
  mat3[ 4,  7] <- glht(glmObj, linfct = c("textSharing - (imageFamily + textAltruism + imageFamily:textAltruism) = 0")) %>% getp
  mat3[ 4,  8] <- glht(glmObj, linfct = c("textSharing - (imageFamily + textEmpowerment + imageFamily:textEmpowerment) = 0")) %>% getp
  mat3[ 4,  9] <- glht(glmObj, linfct = c("              (imageFamily               + imageFamily:textSharing) = 0")) %>% getp
  mat3[ 4, 10] <- glht(glmObj, linfct = c("textSharing - (imageFamily + textSocialNorms + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 4, 11] <- glht(glmObj, linfct = c("textSharing - imageVeteran = 0")) %>% getp
  mat3[ 4, 12] <- glht(glmObj, linfct = c("textSharing - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 4, 13] <- glht(glmObj, linfct = c("textSharing - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 4, 14] <- glht(glmObj, linfct = c("              (imageVeteran               + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 4, 15] <- glht(glmObj, linfct = c("textSharing - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 5,  6] <- glht(glmObj, linfct = c("textSocialNorms - imageFamily = 0")) %>% getp
  mat3[ 5,  7] <- glht(glmObj, linfct = c("textSocialNorms - (imageFamily + textAltruism + imageFamily:textAltruism) = 0")) %>% getp
  mat3[ 5,  8] <- glht(glmObj, linfct = c("textSocialNorms - (imageFamily + textEmpowerment + imageFamily:textEmpowerment) = 0")) %>% getp
  mat3[ 5,  9] <- glht(glmObj, linfct = c("textSocialNorms - (imageFamily + textSharing + imageFamily:textSharing) = 0")) %>% getp
  mat3[ 5, 10] <- glht(glmObj, linfct = c("                  (imageFamily                   + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 5, 11] <- glht(glmObj, linfct = c("textSocialNorms - imageVeteran = 0")) %>% getp
  mat3[ 5, 12] <- glht(glmObj, linfct = c("textSocialNorms - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 5, 13] <- glht(glmObj, linfct = c("textSocialNorms - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 5, 14] <- glht(glmObj, linfct = c("textSocialNorms - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 5, 15] <- glht(glmObj, linfct = c("                  (imageVeteran                   + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 6,  7] <- glht(glmObj, linfct = c("textAltruism + imageFamily:textAltruism = 0")) %>% getp
  mat3[ 6,  8] <- glht(glmObj, linfct = c("textEmpowerment + imageFamily:textEmpowerment = 0")) %>% getp
  mat3[ 6,  9] <- glht(glmObj, linfct = c("textSharing + imageFamily:textSharing = 0")) %>% getp
  mat3[ 6, 10] <- glht(glmObj, linfct = c("textSocialNorms + imageFamily:textSocialNorms = 0")) %>% getp
  mat3[ 6, 11] <- glht(glmObj, linfct = c("(imageFamily) - imageVeteran = 0")) %>% getp
  mat3[ 6, 12] <- glht(glmObj, linfct = c("(imageFamily) - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 6, 13] <- glht(glmObj, linfct = c("(imageFamily) - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 6, 14] <- glht(glmObj, linfct = c("(imageFamily) - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 6, 15] <- glht(glmObj, linfct = c("(imageFamily) - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 7,  8] <- glht(glmObj, linfct = c("(textAltruism + imageFamily:textAltruism) - (textEmpowerment + imageFamily:textEmpowerment) = 0")) %>% getp
  mat3[ 7,  9] <- glht(glmObj, linfct = c("(textAltruism + imageFamily:textAltruism) - (textSharing + imageFamily:textSharing) = 0")) %>% getp
  mat3[ 7, 10] <- glht(glmObj, linfct = c("(textAltruism + imageFamily:textAltruism) - (textSocialNorms + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 7, 11] <- glht(glmObj, linfct = c("(imageFamily + textAltruism + imageFamily:textAltruism) - imageVeteran = 0")) %>% getp
  mat3[ 7, 12] <- glht(glmObj, linfct = c("(imageFamily                + imageFamily:textAltruism) - (imageVeteran                + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 7, 13] <- glht(glmObj, linfct = c("(imageFamily + textAltruism + imageFamily:textAltruism) - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 7, 14] <- glht(glmObj, linfct = c("(imageFamily + textAltruism + imageFamily:textAltruism) - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 7, 15] <- glht(glmObj, linfct = c("(imageFamily + textAltruism + imageFamily:textAltruism) - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 8,  9] <- glht(glmObj, linfct = c("(textEmpowerment + imageFamily:textEmpowerment) - (textSharing + imageFamily:textSharing) = 0")) %>% getp
  mat3[ 8, 10] <- glht(glmObj, linfct = c("(textEmpowerment + imageFamily:textEmpowerment) - (textSocialNorms + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 8, 11] <- glht(glmObj, linfct = c("(imageFamily + textEmpowerment + imageFamily:textEmpowerment) - imageVeteran = 0")) %>% getp
  mat3[ 8, 12] <- glht(glmObj, linfct = c("(imageFamily + textEmpowerment + imageFamily:textEmpowerment) - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 8, 13] <- glht(glmObj, linfct = c("(imageFamily                   + imageFamily:textEmpowerment) - (imageVeteran                   + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 8, 14] <- glht(glmObj, linfct = c("(imageFamily + textEmpowerment + imageFamily:textEmpowerment) - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 8, 15] <- glht(glmObj, linfct = c("(imageFamily + textEmpowerment + imageFamily:textEmpowerment) - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[ 9, 10] <- glht(glmObj, linfct = c("(textEmpowerment + imageFamily:textSharing) - (textSocialNorms + imageFamily:textSocialNorms) = 0")) %>% getp
  mat3[ 9, 11] <- glht(glmObj, linfct = c("(imageFamily + textSharing + imageFamily:textSharing) - imageVeteran = 0")) %>% getp
  mat3[ 9, 12] <- glht(glmObj, linfct = c("(imageFamily + textSharing + imageFamily:textSharing) - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[ 9, 13] <- glht(glmObj, linfct = c("(imageFamily + textSharing + imageFamily:textSharing) - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[ 9, 14] <- glht(glmObj, linfct = c("(imageFamily               + imageFamily:textSharing) - (imageVeteran               + imageVeteran:textSharing) = 0")) %>% getp
  mat3[ 9, 15] <- glht(glmObj, linfct = c("(imageFamily + textSharing + imageFamily:textSharing) - (imageVeteran + textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[10, 11] <- glht(glmObj, linfct = c("(imageFamily + textSocialNorms + imageFamily:textSocialNorms) - imageVeteran = 0")) %>% getp
  mat3[10, 12] <- glht(glmObj, linfct = c("(imageFamily + textSocialNorms + imageFamily:textSocialNorms) - (imageVeteran + textAltruism + imageVeteran:textAltruism) = 0")) %>% getp
  mat3[10, 13] <- glht(glmObj, linfct = c("(imageFamily + textSocialNorms + imageFamily:textSocialNorms) - (imageVeteran + textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[10, 14] <- glht(glmObj, linfct = c("(imageFamily + textSocialNorms + imageFamily:textSocialNorms) - (imageVeteran + textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[10, 15] <- glht(glmObj, linfct = c("(imageFamily                   + imageFamily:textSocialNorms) - (imageVeteran                   + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[11, 12] <- glht(glmObj, linfct = c("textAltruism + imageVeteran:textAltruism = 0")) %>% getp
  mat3[11, 13] <- glht(glmObj, linfct = c("textEmpowerment + imageVeteran:textEmpowerment = 0")) %>% getp
  mat3[11, 14] <- glht(glmObj, linfct = c("textSharing + imageVeteran:textSharing = 0")) %>% getp
  mat3[11, 15] <- glht(glmObj, linfct = c("textSocialNorms + imageVeteran:textSocialNorms = 0")) %>% getp
  mat3[12, 13] <- glht(glmObj, linfct = c("(textAltruism + imageVeteran:textAltruism) - (textEmpowerment + imageVeteran:textEmpowerment) = 0")) %>% getp
  mat3[12, 14] <- glht(glmObj, linfct = c("(textAltruism + imageVeteran:textAltruism) - (textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[12, 15] <- glht(glmObj, linfct = c("(textAltruism + imageVeteran:textAltruism) - (textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[13, 14] <- glht(glmObj, linfct = c("(textEmpowerment + imageVeteran:textEmpowerment) - (textSharing + imageVeteran:textSharing) = 0")) %>% getp
  mat3[13, 15] <- glht(glmObj, linfct = c("(textEmpowerment + imageVeteran:textEmpowerment) - (textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  mat3[14, 15] <- glht(glmObj, linfct = c("(textSharing + imageVeteran:textSharing) - (textSocialNorms + imageVeteran:textSocialNorms) = 0")) %>% getp
  list(contrastImage = mat1,
       contrastText = mat2,
       contrastInteraction = mat3)
}
