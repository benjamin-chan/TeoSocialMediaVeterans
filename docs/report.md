---
title: "Using Social Media to Engage Veterans in Health Care"
date: "2017-06-05 13:47:35"
author: Benjamin Chan (chanb@ohsu.edu)
output:
  html_document:
    toc: true
    theme: simplex
---
# Preamble

Set working directory and load libraries.


```
## 
## Attaching package: 'dplyr'
```

```
## The following object is masked from 'package:MASS':
## 
##     select
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```
## Loading required package: mvtnorm
```

```
## Loading required package: survival
```

```
## Loading required package: TH.data
```

```
## 
## Attaching package: 'TH.data'
```

```
## The following object is masked from 'package:MASS':
## 
##     geyser
```

Reproducibility steps.


```
## R version 3.3.3 (2017-03-06)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 7 x64 (build 7601) Service Pack 1
## 
## attached base packages:
## [1] tools     stats     graphics  grDevices utils     datasets  base     
## 
## other attached packages:
##  [1] multcomp_1.4-6   TH.data_1.0-8    survival_2.41-2  mvtnorm_1.0-6   
##  [5] broom_0.4.2      svglite_1.2.0    ggplot2_2.2.1    dplyr_0.5.0     
##  [9] magrittr_1.5     readxl_0.1.1     MASS_7.3-45      rmarkdown_1.4   
## [13] knitr_1.15.1     checkpoint_0.4.0
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.10     plyr_1.8.4       methods_3.3.3    digest_0.6.12   
##  [5] evaluate_0.10    tibble_1.2       gtable_0.2.0     nlme_3.1-131    
##  [9] lattice_0.20-35  Matrix_1.2-8     psych_1.7.3.21   DBI_0.6         
## [13] parallel_3.3.3   stringr_1.2.0    gdtools_0.1.4    rprojroot_1.2   
## [17] grid_3.3.3       R6_2.2.0         foreign_0.8-67   reshape2_1.4.2  
## [21] tidyr_0.6.1      codetools_0.2-15 backports_1.0.5  scales_0.4.1    
## [25] htmltools_0.3.5  splines_3.3.3    assertthat_0.1   mnormt_1.5-5    
## [29] colorspace_1.3-2 sandwich_2.3-4   stringi_1.1.3    lazyeval_0.2.0  
## [33] munsell_0.4.3    zoo_1.7-14
```

References

* Zeileis, A., Kleiber, C., & Jackman, S. (2008). Regression Models for Count Data in R. Journal of Statistical Software, 27(8), 1 - 25. doi:[http://dx.doi.org/10.18637/jss.v027.i08](http://dx.doi.org/10.18637/jss.v027.i08)


```
## 
## To cite R in publications use:
## 
##   R Core Team (2017). R: A language and environment for
##   statistical computing. R Foundation for Statistical Computing,
##   Vienna, Austria. URL https://www.R-project.org/.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {R: A Language and Environment for Statistical Computing},
##     author = {{R Core Team}},
##     organization = {R Foundation for Statistical Computing},
##     address = {Vienna, Austria},
##     year = {2017},
##     url = {https://www.R-project.org/},
##   }
## 
## We have invested a lot of time and effort in creating R, please
## cite it when using it for data analysis. See also
## 'citation("pkgname")' for citing R packages.
```

```
## 
## To cite the MASS package in publications use:
## 
##   Venables, W. N. & Ripley, B. D. (2002) Modern Applied Statistics
##   with S. Fourth Edition. Springer, New York. ISBN 0-387-95457-0
## 
## A BibTeX entry for LaTeX users is
## 
##   @Book{,
##     title = {Modern Applied Statistics with S},
##     author = {W. N. Venables and B. D. Ripley},
##     publisher = {Springer},
##     edition = {Fourth},
##     address = {New York},
##     year = {2002},
##     note = {ISBN 0-387-95457-0},
##     url = {http://www.stats.ox.ac.uk/pub/MASS4},
##   }
```

```
## 
## Please cite the multcomp package by the following reference:
## 
##   Torsten Hothorn, Frank Bretz and Peter Westfall (2008).
##   Simultaneous Inference in General Parametric Models. Biometrical
##   Journal 50(3), 346--363.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Article{,
##     title = {Simultaneous Inference in General Parametric Models},
##     author = {Torsten Hothorn and Frank Bretz and Peter Westfall},
##     journal = {Biometrical Journal},
##     year = {2008},
##     volume = {50},
##     number = {3},
##     pages = {346--363},
##   }
```

Source user-defined functions.


```
##         ../lib/contrastTable.R ../lib/modelCounts.R ../lib/plotRates.R
## value   ?                      ?                    ?                 
## visible FALSE                  FALSE                FALSE             
##         ../lib/plotResid.R
## value   ?                 
## visible FALSE
```
# Read data


```
## Classes 'tbl_df', 'tbl' and 'data.frame':	676 obs. of  12 variables:
##  $ date            : Date, format: "2017-01-15" "2017-01-16" ...
##  $ clicksTotal     : num  7 12 19 13 15 6 9 5 5 1 ...
##  $ linkClicksTotal : num  5 5 8 6 8 2 4 1 4 0 ...
##  $ impressions     : num  737 1086 1487 1998 1862 ...
##  $ clicksUnique    : num  7 12 17 12 14 6 9 4 5 1 ...
##  $ linkClicksUnique: num  5 5 8 6 8 2 4 1 4 0 ...
##  $ reach           : num  736 1084 1480 1981 1853 ...
##  $ reactions       : num  1 5 7 4 2 0 0 3 0 0 ...
##  $ comments        : num  0 0 2 0 0 0 2 0 0 0 ...
##  $ shares          : num  0 2 4 3 3 2 3 1 1 0 ...
##  $ image           : Factor w/ 3 levels "Computer","Family",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ text            : Factor w/ 5 levels "Incentive","Altruism",..: 2 2 2 2 2 2 2 2 2 2 ...
```


|image    |text        | nDays|minDate    |maxDate    |
|:--------|:-----------|-----:|:----------|:----------|
|Computer |Incentive   |    45|2017-01-15 |2017-03-14 |
|Computer |Altruism    |    45|2017-01-15 |2017-03-14 |
|Computer |Empowerment |    45|2017-01-15 |2017-03-14 |
|Computer |Sharing     |    45|2017-01-15 |2017-03-14 |
|Computer |SocialNorms |    45|2017-01-15 |2017-03-14 |
|Family   |Incentive   |    45|2017-01-15 |2017-03-14 |
|Family   |Altruism    |    45|2017-01-15 |2017-03-14 |
|Family   |Empowerment |    46|2017-01-15 |2017-03-20 |
|Family   |Sharing     |    45|2017-01-15 |2017-03-14 |
|Family   |SocialNorms |    45|2017-01-15 |2017-03-14 |
|Veteran  |Incentive   |    45|2017-01-15 |2017-03-14 |
|Veteran  |Altruism    |    45|2017-01-15 |2017-03-14 |
|Veteran  |Empowerment |    45|2017-01-15 |2017-03-14 |
|Veteran  |Sharing     |    45|2017-01-15 |2017-03-14 |
|Veteran  |SocialNorms |    45|2017-01-15 |2017-03-14 |
# Correlate Facebook metrics data


|                 | clicksTotal| linkClicksTotal| impressions| clicksUnique| linkClicksUnique| reach| reactions| comments| shares|
|:----------------|-----------:|---------------:|-----------:|------------:|----------------:|-----:|---------:|--------:|------:|
|clicksTotal      |           1|            0.83|        0.71|         0.99|             0.83|  0.71|      0.49|     0.44|   0.66|
|linkClicksTotal  |          NA|            1.00|        0.65|         0.83|             1.00|  0.65|      0.09|     0.24|   0.32|
|impressions      |          NA|              NA|        1.00|         0.72|             0.65|  1.00|      0.30|     0.31|   0.40|
|clicksUnique     |          NA|              NA|          NA|         1.00|             0.83|  0.72|      0.50|     0.41|   0.65|
|linkClicksUnique |          NA|              NA|          NA|           NA|             1.00|  0.65|      0.09|     0.24|   0.32|
|reach            |          NA|              NA|          NA|           NA|               NA|  1.00|      0.30|     0.31|   0.40|
|reactions        |          NA|              NA|          NA|           NA|               NA|    NA|      1.00|     0.31|   0.33|
|comments         |          NA|              NA|          NA|           NA|               NA|    NA|        NA|     1.00|   0.25|
|shares           |          NA|              NA|          NA|           NA|               NA|    NA|        NA|       NA|   1.00|
# Model counts

* Use negative binomial model
* Factors
  * Ad `image`
  * Ad `text`
* Include full factorial interaction
* Use $\log(\text{impressions})$ or $\log(\text{reach})$ as an offset variable
* Calculate predicted counts per 1,000 impressions/reach

**Model**

$$
\begin{align*}
\log(y) = & \beta_0 + \\\\
          & \beta_1 x_\text{image: Family} + 
            \beta_2 x_\text{image: Veteran} + \\\\
          & \beta_3 x_\text{text: Empowerment} + 
            \beta_4 x_\text{text: Incentive} + 
            \beta_5 x_\text{text: Sharing} + 
            \beta_6 x_\text{text: Social norms} + \\\\
          & \gamma_1 x_\text{image: Family} x_\text{text: Empowerment} + 
            \gamma_2 x_\text{image: Family} x_\text{text: Incentive} +  \\\\
          & \gamma_3 x_\text{image: Family} x_\text{text: Sharing} + 
            \gamma_4 x_\text{image: Family} x_\text{text: Social norms} + \\\\
          & \gamma_5 x_\text{image: Veteran} x_\text{text: Empowerment} + 
            \gamma_6 x_\text{image: Veteran} x_\text{text: Incentive} +  \\\\
          & \gamma_7 x_\text{image: Veteran} x_\text{text: Sharing} + 
            \gamma_8 x_\text{image: Veteran} x_\text{text: Social norms} + \\\\
          & \log(x_\text{offset})
\end{align*}
$$


## Total clicks

Image files saved as [PNG](../figures/clicksTotal.png), [SVG](../figures/clicksTotal.svg)

![clicksTotal.png](../figures/clicksTotal.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | impressions|  pred| predLower| predUpper|
|:--------|:-----------|-----------:|-----:|---------:|---------:|
|Veteran  |SocialNorms |        1000| 18.14|     16.74|     19.65|
|Veteran  |Sharing     |        1000| 16.68|     15.47|     17.97|
|Veteran  |Altruism    |        1000| 14.34|     13.17|     15.61|
|Veteran  |Incentive   |        1000| 12.66|     11.64|     13.77|
|Veteran  |Empowerment |        1000| 11.29|     10.28|     12.39|
|Family   |Altruism    |        1000| 11.25|     10.21|     12.40|
|Computer |SocialNorms |        1000| 11.09|     10.04|     12.24|
|Family   |Sharing     |        1000| 10.68|      9.69|     11.77|
|Family   |Empowerment |        1000| 10.21|      9.23|     11.30|
|Family   |SocialNorms |        1000|  9.85|      8.89|     10.93|
|Computer |Sharing     |        1000|  9.71|      8.79|     10.72|
|Computer |Empowerment |        1000|  8.64|      7.71|      9.68|
|Family   |Incentive   |        1000|  8.52|      7.63|      9.50|
|Computer |Altruism    |        1000|  8.25|      7.39|      9.21|
|Computer |Incentive   |        1000|  7.33|      6.52|      8.25|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |  0.069|       0|
|Family   |     NA|       0|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.154|       0.049|   0.000|       0.000|
|Altruism    |       NA|       0.566|   0.032|       0.000|
|Empowerment |       NA|          NA|   0.129|       0.001|
|Sharing     |       NA|          NA|      NA|       0.062|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 33.93522219, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -3.2316  -0.7114  -0.0379   0.6036   2.7668  
## 
## Coefficients:
##                               Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                  -4.915234   0.060013 -81.903  < 2e-16 ***
## imageFamily                   0.149384   0.082128   1.819 0.068925 .  
## imageVeteran                  0.545986   0.073650   7.413 1.23e-13 ***
## textAltruism                  0.117563   0.082369   1.427 0.153500    
## textEmpowerment               0.163881   0.083338   1.966 0.049245 *  
## textSharing                   0.280302   0.078391   3.576 0.000349 ***
## textSocialNorms               0.413173   0.078326   5.275 1.33e-07 ***
## imageFamily:textAltruism      0.160905   0.111301   1.446 0.148268    
## imageVeteran:textAltruism     0.006924   0.102365   0.068 0.946075    
## imageFamily:textEmpowerment   0.017931   0.112834   0.159 0.873738    
## imageVeteran:textEmpowerment -0.278756   0.105004  -2.655 0.007938 ** 
## imageFamily:textSharing      -0.053705   0.108361  -0.496 0.620166    
## imageVeteran:textSharing     -0.004891   0.097122  -0.050 0.959835    
## imageFamily:textSocialNorms  -0.267137   0.109827  -2.432 0.015001 *  
## imageVeteran:textSocialNorms -0.053572   0.098128  -0.546 0.585106    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(33.9352) family taken to be 1)
## 
##     Null deviance: 1111.83  on 675  degrees of freedom
## Residual deviance:  686.74  on 661  degrees of freedom
## AIC: 3850.7
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  33.94 
##           Std. Err.:  6.11 
## 
##  2 x log-likelihood:  -3818.726
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/clicksTotalResid.png), [SVG](../figures/clicksTotalResid.svg)


## Unique clicks

Image files saved as [PNG](../figures/clicksUnique.png), [SVG](../figures/clicksUnique.svg)

![clicksUnique.png](../figures/clicksUnique.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | reach|  pred| predLower| predUpper|
|:--------|:-----------|-----:|-----:|---------:|---------:|
|Veteran  |SocialNorms |  1000| 16.66|     15.42|     17.99|
|Veteran  |Sharing     |  1000| 15.33|     14.28|     16.46|
|Veteran  |Altruism    |  1000| 13.63|     12.57|     14.78|
|Veteran  |Incentive   |  1000| 11.83|     10.91|     12.81|
|Family   |Altruism    |  1000| 10.76|      9.79|     11.83|
|Veteran  |Empowerment |  1000| 10.61|      9.69|     11.62|
|Computer |SocialNorms |  1000| 10.04|      9.10|     11.07|
|Family   |Sharing     |  1000| 10.03|      9.12|     11.03|
|Family   |Empowerment |  1000|  9.36|      8.48|     10.34|
|Family   |SocialNorms |  1000|  9.35|      8.44|     10.34|
|Computer |Sharing     |  1000|  8.91|      8.08|      9.83|
|Computer |Empowerment |  1000|  8.14|      7.28|      9.11|
|Family   |Incentive   |  1000|  8.05|      7.22|      8.97|
|Computer |Altruism    |  1000|  7.89|      7.07|      8.79|
|Computer |Incentive   |  1000|  7.08|      6.31|      7.95|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |  0.114|       0|
|Family   |     NA|       0|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.184|       0.089|   0.003|       0.000|
|Altruism    |       NA|       0.686|   0.100|       0.001|
|Empowerment |       NA|          NA|   0.235|       0.006|
|Sharing     |       NA|          NA|      NA|       0.092|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 50.32473536, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -3.2251  -0.7013  -0.0467   0.6165   2.9646  
## 
## Coefficients:
##                               Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                  -4.950237   0.059017 -83.878  < 2e-16 ***
## imageFamily                   0.127766   0.080905   1.579   0.1143    
## imageVeteran                  0.512761   0.071811   7.140 9.30e-13 ***
## textAltruism                  0.107545   0.080976   1.328   0.1841    
## textEmpowerment               0.139752   0.082300   1.698   0.0895 .  
## textSharing                   0.230026   0.077231   2.978   0.0029 ** 
## textSocialNorms               0.348881   0.077385   4.508 6.53e-06 ***
## imageFamily:textAltruism      0.183361   0.109270   1.678   0.0933 .  
## imageVeteran:textAltruism     0.034353   0.099731   0.344   0.7305    
## imageFamily:textEmpowerment   0.011930   0.111290   0.107   0.9146    
## imageVeteran:textEmpowerment -0.247904   0.102860  -2.410   0.0159 *  
## imageFamily:textSharing      -0.009564   0.106642  -0.090   0.9285    
## imageVeteran:textSharing      0.029539   0.094595   0.312   0.7548    
## imageFamily:textSocialNorms  -0.199273   0.108279  -1.840   0.0657 .  
## imageVeteran:textSocialNorms -0.006261   0.095930  -0.065   0.9480    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(50.3247) family taken to be 1)
## 
##     Null deviance: 1088.44  on 675  degrees of freedom
## Residual deviance:  666.42  on 661  degrees of freedom
## AIC: 3715.6
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  50.3 
##           Std. Err.:  12.2 
## 
##  2 x log-likelihood:  -3683.577
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/clicksUniqueResid.png), [SVG](../figures/clicksUniqueResid.svg)


## Total link clicks

Image files saved as [PNG](../figures/linkClicksTotal.png), [SVG](../figures/linkClicksTotal.svg)

![linkClicksTotal.png](../figures/linkClicksTotal.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | impressions|  pred| predLower| predUpper|
|:--------|:-----------|-----------:|-----:|---------:|---------:|
|Veteran  |SocialNorms |        1000| 11.48|     10.47|     12.58|
|Veteran  |Incentive   |        1000|  8.48|      7.72|      9.31|
|Veteran  |Sharing     |        1000|  7.90|      7.19|      8.67|
|Computer |SocialNorms |        1000|  6.31|      5.59|      7.13|
|Family   |SocialNorms |        1000|  5.21|      4.56|      5.94|
|Veteran  |Empowerment |        1000|  5.13|      4.53|      5.82|
|Computer |Sharing     |        1000|  5.01|      4.41|      5.69|
|Family   |Sharing     |        1000|  4.86|      4.26|      5.55|
|Computer |Incentive   |        1000|  4.84|      4.22|      5.57|
|Computer |Empowerment |        1000|  4.77|      4.13|      5.51|
|Family   |Empowerment |        1000|  4.57|      3.99|      5.24|
|Family   |Altruism    |        1000|  4.56|      3.97|      5.24|
|Family   |Incentive   |        1000|  4.43|      3.84|      5.11|
|Computer |Altruism    |        1000|  4.29|      3.72|      4.96|
|Veteran  |Altruism    |        1000|  4.24|      3.71|      4.84|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |   0.38|       0|
|Family   |     NA|       0|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.237|       0.882|   0.722|       0.005|
|Altruism    |       NA|       0.310|   0.114|       0.000|
|Empowerment |       NA|          NA|   0.615|       0.004|
|Sharing     |       NA|          NA|      NA|       0.010|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 37.15282495, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -3.2351  -0.7542  -0.0703   0.5668   2.7117  
## 
## Coefficients:
##                              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                  -5.33005    0.07085 -75.233  < 2e-16 ***
## imageFamily                  -0.08931    0.10167  -0.878 0.379714    
## imageVeteran                  0.55966    0.08561   6.538 6.25e-11 ***
## textAltruism                 -0.12075    0.10203  -1.183 0.236621    
## textEmpowerment              -0.01515    0.10218  -0.148 0.882103    
## textSharing                   0.03414    0.09600   0.356 0.722110    
## textSocialNorms               0.26461    0.09423   2.808 0.004982 ** 
## imageFamily:textAltruism      0.15008    0.14391   1.043 0.296992    
## imageVeteran:textAltruism    -0.57267    0.13174  -4.347 1.38e-05 ***
## imageFamily:textEmpowerment   0.04660    0.14342   0.325 0.745254    
## imageVeteran:textEmpowerment -0.48633    0.12964  -3.751 0.000176 ***
## imageFamily:textSharing       0.05909    0.13792   0.428 0.668323    
## imageVeteran:textSharing     -0.10523    0.11742  -0.896 0.370122    
## imageFamily:textSocialNorms  -0.10325    0.13700  -0.754 0.451044    
## imageVeteran:textSocialNorms  0.03848    0.11565   0.333 0.739337    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(37.1528) family taken to be 1)
## 
##     Null deviance: 1080.25  on 675  degrees of freedom
## Residual deviance:  675.51  on 661  degrees of freedom
## AIC: 3235.1
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  37.2 
##           Std. Err.:  11.5 
## 
##  2 x log-likelihood:  -3203.106
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/linkClicksTotalResid.png), [SVG](../figures/linkClicksTotalResid.svg)


## Unique link clicks

Image files saved as [PNG](../figures/linkClicksUnique.png), [SVG](../figures/linkClicksUnique.svg)

![linkClicksUnique.png](../figures/linkClicksUnique.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | reach|  pred| predLower| predUpper|
|:--------|:-----------|-----:|-----:|---------:|---------:|
|Veteran  |SocialNorms |  1000| 11.35|     10.37|     12.43|
|Veteran  |Incentive   |  1000|  8.48|      7.73|      9.31|
|Veteran  |Sharing     |  1000|  7.81|      7.12|      8.56|
|Computer |SocialNorms |  1000|  6.21|      5.49|      7.01|
|Family   |SocialNorms |  1000|  5.19|      4.54|      5.92|
|Veteran  |Empowerment |  1000|  5.07|      4.47|      5.74|
|Computer |Sharing     |  1000|  4.97|      4.38|      5.64|
|Family   |Sharing     |  1000|  4.84|      4.25|      5.52|
|Computer |Incentive   |  1000|  4.82|      4.20|      5.54|
|Computer |Empowerment |  1000|  4.77|      4.13|      5.51|
|Family   |Empowerment |  1000|  4.57|      3.99|      5.23|
|Family   |Altruism    |  1000|  4.54|      3.95|      5.21|
|Family   |Incentive   |  1000|  4.45|      3.86|      5.13|
|Computer |Altruism    |  1000|  4.29|      3.72|      4.95|
|Veteran  |Altruism    |  1000|  4.22|      3.69|      4.82|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |  0.422|       0|
|Family   |     NA|       0|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.248|       0.918|   0.753|       0.007|
|Altruism    |       NA|       0.301|   0.130|       0.000|
|Empowerment |       NA|          NA|   0.678|       0.006|
|Sharing     |       NA|          NA|      NA|       0.013|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 40.7437904, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -3.2411  -0.7580  -0.0693   0.5469   2.7292  
## 
## Coefficients:
##                              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                  -5.33405    0.07070 -75.446  < 2e-16 ***
## imageFamily                  -0.08134    0.10129  -0.803  0.42192    
## imageVeteran                  0.56412    0.08518   6.623 3.52e-11 ***
## textAltruism                 -0.11764    0.10176  -1.156  0.24768    
## textEmpowerment              -0.01052    0.10191  -0.103  0.91779    
## textSharing                   0.03012    0.09580   0.314  0.75317    
## textSocialNorms               0.25199    0.09417   2.676  0.00745 ** 
## imageFamily:textAltruism      0.13814    0.14345   0.963  0.33555    
## imageVeteran:textAltruism    -0.58099    0.13125  -4.427 9.57e-06 ***
## imageFamily:textEmpowerment   0.03722    0.14285   0.261  0.79442    
## imageVeteran:textEmpowerment -0.50421    0.12922  -3.902 9.54e-05 ***
## imageFamily:textSharing       0.05496    0.13747   0.400  0.68928    
## imageVeteran:textSharing     -0.11278    0.11688  -0.965  0.33458    
## imageFamily:textSocialNorms  -0.09826    0.13664  -0.719  0.47210    
## imageVeteran:textSocialNorms  0.03968    0.11523   0.344  0.73058    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(40.7438) family taken to be 1)
## 
##     Null deviance: 1076.26  on 675  degrees of freedom
## Residual deviance:  672.94  on 661  degrees of freedom
## AIC: 3217.5
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  40.7 
##           Std. Err.:  13.6 
## 
##  2 x log-likelihood:  -3185.508
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/linkClicksUniqueResid.png), [SVG](../figures/linkClicksUniqueResid.svg)


## Reactions

Image files saved as [PNG](../figures/reactions.png), [SVG](../figures/reactions.svg)

![reactions.png](../figures/reactions.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | impressions| pred| predLower| predUpper|
|:--------|:-----------|-----------:|----:|---------:|---------:|
|Veteran  |Altruism    |        1000| 6.47|      5.61|      7.46|
|Family   |Altruism    |        1000| 4.27|      3.61|      5.06|
|Veteran  |Empowerment |        1000| 2.34|      1.92|      2.85|
|Family   |Empowerment |        1000| 2.25|      1.82|      2.78|
|Veteran  |Sharing     |        1000| 2.22|      1.85|      2.66|
|Veteran  |SocialNorms |        1000| 2.16|      1.76|      2.65|
|Family   |Sharing     |        1000| 1.85|      1.48|      2.31|
|Computer |Altruism    |        1000| 1.70|      1.34|      2.16|
|Family   |SocialNorms |        1000| 1.60|      1.26|      2.05|
|Family   |Incentive   |        1000| 1.51|      1.17|      1.94|
|Computer |SocialNorms |        1000| 1.46|      1.13|      1.88|
|Computer |Empowerment |        1000| 1.27|      0.96|      1.68|
|Computer |Sharing     |        1000| 1.13|      0.86|      1.47|
|Veteran  |Incentive   |        1000| 1.11|      0.87|      1.42|
|Computer |Incentive   |        1000| 0.95|      0.70|      1.30|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |  0.024|   0.432|
|Family   |     NA|   0.092|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.004|       0.178|   0.413|       0.036|
|Altruism    |       NA|       0.123|   0.025|       0.393|
|Empowerment |       NA|          NA|   0.555|       0.471|
|Sharing     |       NA|          NA|      NA|       0.172|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 8.66717617, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -3.2285  -0.9696  -0.1044   0.5733   2.5948  
## 
## Coefficients:
##                              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                   -6.9569     0.1581 -43.996  < 2e-16 ***
## imageFamily                    0.4589     0.2038   2.252  0.02434 *  
## imageVeteran                   0.1578     0.2009   0.786  0.43203    
## textAltruism                   0.5787     0.1995   2.901  0.00372 ** 
## textEmpowerment                0.2878     0.2138   1.346  0.17833    
## textSharing                    0.1708     0.2086   0.819  0.41298    
## textSocialNorms                0.4272     0.2041   2.093  0.03638 *  
## imageFamily:textAltruism       0.4640     0.2523   1.839  0.06593 .  
## imageVeteran:textAltruism      1.1794     0.2459   4.797 1.61e-06 ***
## imageFamily:textEmpowerment    0.1132     0.2716   0.417  0.67682    
## imageVeteran:textEmpowerment   0.4522     0.2671   1.693  0.09049 .  
## imageFamily:textSharing        0.0339     0.2701   0.126  0.90012    
## imageVeteran:textSharing       0.5163     0.2596   1.989  0.04673 *  
## imageFamily:textSocialNorms   -0.3641     0.2715  -1.341  0.17990    
## imageVeteran:textSocialNorms   0.2346     0.2608   0.900  0.36835    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(8.6672) family taken to be 1)
## 
##     Null deviance: 1165.39  on 675  degrees of freedom
## Residual deviance:  753.66  on 661  degrees of freedom
## AIC: 2503.7
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  8.67 
##           Std. Err.:  2.03 
## 
##  2 x log-likelihood:  -2471.707
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/reactionsResid.png), [SVG](../figures/reactionsResid.svg)



## Comments

Image files saved as [PNG](../figures/comments.png), [SVG](../figures/comments.svg)

![comments.png](../figures/comments.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | impressions| pred| predLower| predUpper|
|:--------|:-----------|-----------:|----:|---------:|---------:|
|Veteran  |Empowerment |        1000| 1.01|      0.73|      1.39|
|Veteran  |SocialNorms |        1000| 1.01|      0.73|      1.39|
|Veteran  |Altruism    |        1000| 0.80|      0.57|      1.12|
|Family   |Altruism    |        1000| 0.79|      0.55|      1.14|
|Family   |Sharing     |        1000| 0.67|      0.46|      0.97|
|Family   |Empowerment |        1000| 0.59|      0.40|      0.89|
|Veteran  |Sharing     |        1000| 0.59|      0.42|      0.83|
|Computer |Sharing     |        1000| 0.49|      0.33|      0.75|
|Family   |Incentive   |        1000| 0.47|      0.30|      0.74|
|Computer |Empowerment |        1000| 0.44|      0.27|      0.72|
|Computer |SocialNorms |        1000| 0.44|      0.28|      0.70|
|Family   |SocialNorms |        1000| 0.42|      0.27|      0.68|
|Veteran  |Incentive   |        1000| 0.36|      0.23|      0.55|
|Computer |Altruism    |        1000| 0.28|      0.16|      0.49|
|Computer |Incentive   |        1000| 0.06|      0.02|      0.20|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |  0.001|   0.005|
|Family   |     NA|   0.392|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.021|       0.002|   0.001|       0.002|
|Altruism    |       NA|       0.232|   0.116|       0.223|
|Empowerment |       NA|          NA|   0.739|       0.999|
|Sharing     |       NA|          NA|      NA|       0.731|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 2.563164256, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.7722  -1.0058  -0.6424   0.4029   2.4644  
## 
## Coefficients:
##                              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                   -9.6700     0.5858 -16.507  < 2e-16 ***
## imageFamily                    2.0143     0.6295   3.200 0.001376 ** 
## imageVeteran                   1.7414     0.6257   2.783 0.005384 ** 
## textAltruism                   1.4987     0.6516   2.300 0.021441 *  
## textEmpowerment                1.9489     0.6355   3.067 0.002165 ** 
## textSharing                    2.0577     0.6234   3.301 0.000963 ***
## textSocialNorms                1.9486     0.6311   3.088 0.002018 ** 
## imageFamily:textAltruism      -0.9855     0.7156  -1.377 0.168429    
## imageVeteran:textAltruism     -0.7064     0.7095  -0.996 0.319440    
## imageFamily:textEmpowerment   -1.7250     0.7067  -2.441 0.014647 *  
## imageVeteran:textEmpowerment  -0.9173     0.6920  -1.326 0.184983    
## imageFamily:textSharing       -1.7165     0.6922  -2.480 0.013146 *  
## imageVeteran:textSharing      -1.5657     0.6840  -2.289 0.022089 *  
## imageFamily:textSocialNorms   -2.0575     0.7134  -2.884 0.003926 ** 
## imageVeteran:textSocialNorms  -0.9186     0.6881  -1.335 0.181865    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(2.5632) family taken to be 1)
## 
##     Null deviance: 706.85  on 675  degrees of freedom
## Residual deviance: 629.46  on 661  degrees of freedom
## AIC: 1455
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  2.563 
##           Std. Err.:  0.728 
## 
##  2 x log-likelihood:  -1423.011
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/commentsResid.png), [SVG](../figures/commentsResid.svg)


## Shares

Image files saved as [PNG](../figures/shares.png), [SVG](../figures/shares.svg)

![shares.png](../figures/shares.png)


```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```



|image    |text        | impressions| pred| predLower| predUpper|
|:--------|:-----------|-----------:|----:|---------:|---------:|
|Veteran  |Sharing     |        1000| 5.87|      5.01|      6.88|
|Family   |Sharing     |        1000| 3.06|      2.51|      3.75|
|Computer |Sharing     |        1000| 2.73|      2.22|      3.36|
|Veteran  |Empowerment |        1000| 2.65|      2.15|      3.25|
|Veteran  |Altruism    |        1000| 2.55|      2.08|      3.14|
|Veteran  |SocialNorms |        1000| 2.38|      1.92|      2.95|
|Computer |SocialNorms |        1000| 2.04|      1.62|      2.59|
|Family   |Empowerment |        1000| 1.89|      1.49|      2.40|
|Family   |SocialNorms |        1000| 1.71|      1.33|      2.19|
|Computer |Empowerment |        1000| 1.57|      1.19|      2.05|
|Veteran  |Incentive   |        1000| 1.41|      1.12|      1.79|
|Family   |Altruism    |        1000| 1.32|      1.00|      1.73|
|Computer |Altruism    |        1000| 1.27|      0.96|      1.68|
|Family   |Incentive   |        1000| 1.13|      0.84|      1.52|
|Computer |Incentive   |        1000| 0.78|      0.55|      1.11|



|         | Family| Veteran|
|:--------|------:|-------:|
|Computer |  0.119|   0.006|
|Family   |     NA|   0.241|

|            | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|--------:|-----------:|-------:|-----------:|
|Incentive   |    0.035|       0.002|   0.000|       0.000|
|Altruism    |       NA|       0.288|   0.000|       0.011|
|Empowerment |       NA|          NA|   0.001|       0.145|
|Sharing     |       NA|          NA|      NA|       0.069|

```
## 
## Call:
## glm.nb(formula = formula(text), data = df, init.theta = 5.336707895, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.6223  -1.0413  -0.1675   0.5480   2.6187  
## 
## Coefficients:
##                              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)                  -7.15195    0.17763 -40.262  < 2e-16 ***
## imageFamily                   0.36351    0.23336   1.558  0.11930    
## imageVeteran                  0.59009    0.21456   2.750  0.00596 ** 
## textAltruism                  0.48105    0.22840   2.106  0.03519 *  
## textEmpowerment               0.69269    0.22493   3.080  0.00207 ** 
## textSharing                   1.24937    0.20628   6.057 1.39e-09 ***
## textSocialNorms               0.95942    0.21434   4.476 7.60e-06 ***
## imageFamily:textAltruism     -0.32647    0.30755  -1.062  0.28846    
## imageVeteran:textAltruism     0.11107    0.27867   0.399  0.69022    
## imageFamily:textEmpowerment  -0.17556    0.29755  -0.590  0.55517    
## imageVeteran:textEmpowerment -0.06539    0.27596  -0.237  0.81270    
## imageFamily:textSharing      -0.24892    0.27565  -0.903  0.36651    
## imageVeteran:textSharing      0.17507    0.25214   0.694  0.48746    
## imageFamily:textSocialNorms  -0.54440    0.29211  -1.864  0.06237 .  
## imageVeteran:textSocialNorms -0.43823    0.26889  -1.630  0.10315    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for Negative Binomial(5.3367) family taken to be 1)
## 
##     Null deviance: 1058.9  on 675  degrees of freedom
## Residual deviance:  762.3  on 661  degrees of freedom
## AIC: 2589.1
## 
## Number of Fisher Scoring iterations: 1
## 
## 
##               Theta:  5.337 
##           Std. Err.:  0.904 
## 
##  2 x log-likelihood:  -2557.090
```

```
## Saving 7 x 7 in image
## Saving 7 x 7 in image
```

Image files saved as [PNG](../figures/sharesResid.png), [SVG](../figures/sharesResid.svg)
