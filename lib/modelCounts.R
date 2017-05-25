modelCounts <- function(y, offset) {
    require(MASS)
    require(broom)
    text <- paste(eval(y),
                  " ~ adImage + adText + adImage * adText",
                  sprintf("+ offset(log(%s))", eval(offset)))
    M <- glm.nb(formula(text), data = df)
    grid <- expand.grid(adImage = levels(df$adImage), 
                        adText = levels(df$adText), 
                        offset = 1000)
    names(grid) <- c("adImage", "adText", offset)
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
