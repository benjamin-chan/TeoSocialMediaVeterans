modelBinomial <- function(y) {
    require(broom)
    text <- paste(eval(y),
                  " ~ image + text + image * text")
    grid <- expand.grid(image = levels(df2$image), 
                        text = levels(df2$text))
    M <- glm(formula(text), data = df2, family = binomial(link = "logit"))
    names(grid) <- c("image", "text")
    pred <- 
      grid %>% 
      mutate(pred = predict(M, newdata = ., type = "response"),
             linPred = predict(M, newdata = ., type = "link", se.fit = TRUE)[["fit"]],
             seLinPred = predict(M, newdata = ., type = "link", se.fit = TRUE)[["se.fit"]]) %>% 
      mutate(predLower = exp(linPred + qnorm(0.025) * seLinPred),
             predUpper = exp(linPred + qnorm(0.975) * seLinPred)) %>% 
      select(-c(linPred, seLinPred)) %>% 
      arrange(-pred)
    list(model = formula(text), modelObject = M, predict = pred)
}
