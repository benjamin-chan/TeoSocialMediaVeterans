predictDichotomousRiskFactor <- function (M) {
  if (!any(class(M) == "glm")) stop("Requires a glm object") 
  if (M$family$link != "logit") stop("Requires logistic regression model")
  require(magrittr)
  require(dplyr)
  data.frame(x = c(TRUE, FALSE)) %>% 
    mutate(pred = predict(M, newdata = ., type = "response"),
           linPred = predict(M, newdata = ., type = "link", se.fit = TRUE)[["fit"]],
           seLinPred = predict(M, newdata = ., type = "link", se.fit = TRUE)[["se.fit"]]) %>% 
    mutate(predLower = exp(linPred + qnorm(0.025) * seLinPred) / (1 + exp(linPred + qnorm(0.025) * seLinPred)),
           predUpper = exp(linPred + qnorm(0.975) * seLinPred) / (1 + exp(linPred + qnorm(0.975) * seLinPred))) %>% 
    select(-c(linPred, seLinPred)) %>% 
    arrange(-pred)
}
