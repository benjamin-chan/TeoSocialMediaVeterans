---
title: "Using Social Media to Engage Veterans in Health Care"
date: "2017-05-23 11:16:56"
author: Benjamin Chan (chanb@ohsu.edu)
output:
  html_document:
    toc: true
    theme: simplex
---
# Preamble

Set working directory.



Load libraries.


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

Reproducibility steps.


```
## R version 3.3.3 (2017-03-06)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 7 x64 (build 7601) Service Pack 1
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  base     
## 
## other attached packages:
##  [1] broom_0.4.2      svglite_1.2.0    ggplot2_2.2.1    dplyr_0.5.0     
##  [5] magrittr_1.5     readxl_0.1.1     MASS_7.3-45      rmarkdown_1.4   
##  [9] knitr_1.15.1     checkpoint_0.4.0
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.10     mnormt_1.5-5     munsell_0.4.3    lattice_0.20-35 
##  [5] colorspace_1.3-2 R6_2.2.0         stringr_1.2.0    plyr_1.8.4      
##  [9] tools_3.3.3      parallel_3.3.3   grid_3.3.3       nlme_3.1-131    
## [13] gtable_0.2.0     psych_1.7.3.21   DBI_0.6          htmltools_0.3.5 
## [17] lazyeval_0.2.0   assertthat_0.1   rprojroot_1.2    digest_0.6.12   
## [21] tibble_1.2       tidyr_0.6.1      reshape2_1.4.2   evaluate_0.10   
## [25] stringi_1.1.3    gdtools_0.1.4    methods_3.3.3    scales_0.4.1    
## [29] backports_1.0.5  foreign_0.8-67
```

Source user-defined functions.


```
##         ../lib/plotRates.R
## value   ?                 
## visible FALSE
```


## References


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
##  $ adImage         : Factor w/ 3 levels "Computer","Family",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ adText          : Factor w/ 5 levels "Altruism","Empowerment",..: 1 1 1 1 1 1 1 1 1 1 ...
```


|adImage  |adText       | nDays|minDate    |maxDate    |
|:--------|:------------|-----:|:----------|:----------|
|Computer |Altruism     |    45|2017-01-15 |2017-03-14 |
|Computer |Empowerment  |    45|2017-01-15 |2017-03-14 |
|Computer |Incentive    |    45|2017-01-15 |2017-03-14 |
|Computer |Sharing      |    45|2017-01-15 |2017-03-14 |
|Computer |Social norms |    45|2017-01-15 |2017-03-14 |
|Family   |Altruism     |    45|2017-01-15 |2017-03-14 |
|Family   |Empowerment  |    46|2017-01-15 |2017-03-20 |
|Family   |Incentive    |    45|2017-01-15 |2017-03-14 |
|Family   |Sharing      |    45|2017-01-15 |2017-03-14 |
|Family   |Social norms |    45|2017-01-15 |2017-03-14 |
|Veteran  |Altruism     |    45|2017-01-15 |2017-03-14 |
|Veteran  |Empowerment  |    45|2017-01-15 |2017-03-14 |
|Veteran  |Incentive    |    45|2017-01-15 |2017-03-14 |
|Veteran  |Sharing      |    45|2017-01-15 |2017-03-14 |
|Veteran  |Social norms |    45|2017-01-15 |2017-03-14 |
# Plot data


## Impressions

This should be constant over time.

Image files saved as [PNG](../figures/impressions.png), [SVG](../figures/impressions.svg)

![impressions.png](../figures/impressions.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Reach

This should be constant over time.

Image files saved as [PNG](../figures/reach.png), [SVG](../figures/reach.svg)

![reach.png](../figures/reach.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Total clicks

Image files saved as [PNG](../figures/clicksTotal.png), [SVG](../figures/clicksTotal.svg)

![clicksTotal.png](../figures/clicksTotal.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Unique clicks

Image files saved as [PNG](../figures/clicksUnique.png), [SVG](../figures/clicksUnique.svg)

![clicksUnique.png](../figures/clicksUnique.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Total link clicks

Image files saved as [PNG](../figures/linkClicksTotal.png), [SVG](../figures/linkClicksTotal.svg)

![linkClicksTotal.png](../figures/linkClicksTotal.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Unique link clicks

Image files saved as [PNG](../figures/linkClicksUnique.png), [SVG](../figures/linkClicksUnique.svg)

![linkClicksUnique.png](../figures/linkClicksUnique.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Reactions

Image files saved as [PNG](../figures/reactions.png), [SVG](../figures/reactions.svg)

![reactions.png](../figures/reactions.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Comments

Image files saved as [PNG](../figures/comments.png), [SVG](../figures/comments.svg)

![comments.png](../figures/comments.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```


## Shares

Image files saved as [PNG](../figures/shares.png), [SVG](../figures/shares.svg)

![shares.png](../figures/shares.png)


```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```

```
## Saving 7 x 7 in image
```

```
## `geom_smooth()` using method = 'loess'
```
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


|term                              | estimate| std.error| statistic| p.value|
|:---------------------------------|--------:|---------:|---------:|-------:|
|(Intercept)                       |   -4.798|     0.056|   -85.037|   0.000|
|adImageFamily                     |    0.310|     0.075|     4.131|   0.000|
|adImageVeteran                    |    0.553|     0.071|     7.777|   0.000|
|adTextEmpowerment                 |    0.046|     0.081|     0.573|   0.566|
|adTextIncentive                   |   -0.118|     0.082|    -1.427|   0.154|
|adTextSharing                     |    0.163|     0.076|     2.151|   0.032|
|adTextSocial norms                |    0.296|     0.076|     3.910|   0.000|
|adImageFamily:adTextEmpowerment   |   -0.143|     0.108|    -1.326|   0.185|
|adImageVeteran:adTextEmpowerment  |   -0.286|     0.103|    -2.767|   0.006|
|adImageFamily:adTextIncentive     |   -0.161|     0.111|    -1.446|   0.148|
|adImageVeteran:adTextIncentive    |   -0.007|     0.102|    -0.068|   0.946|
|adImageFamily:adTextSharing       |   -0.215|     0.103|    -2.081|   0.037|
|adImageVeteran:adTextSharing      |   -0.012|     0.095|    -0.124|   0.901|
|adImageFamily:adTextSocial norms  |   -0.428|     0.105|    -4.089|   0.000|
|adImageVeteran:adTextSocial norms |   -0.060|     0.096|    -0.629|   0.530|

```
## 
## Call:
## glm.nb(formula = clicksTotal ~ adImage + adText + adImage * adText + 
##     offset(log(impressions)), data = ., init.theta = 33.93522219, 
##     link = log)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -3.2316  -0.7114  -0.0379   0.6036   2.7668  
## 
## Coefficients:
##                                    Estimate Std. Error z value Pr(>|z|)
## (Intercept)                       -4.797671   0.056419 -85.037  < 2e-16
## adImageFamily                      0.310288   0.075119   4.131 3.62e-05
## adImageVeteran                     0.552909   0.071094   7.777 7.42e-15
## adTextEmpowerment                  0.046318   0.080788   0.573  0.56642
## adTextIncentive                   -0.117563   0.082369  -1.427  0.15350
## adTextSharing                      0.162739   0.075675   2.151  0.03152
## adTextSocial norms                 0.295610   0.075608   3.910 9.24e-05
## adImageFamily:adTextEmpowerment   -0.142974   0.107839  -1.326  0.18490
## adImageVeteran:adTextEmpowerment  -0.285680   0.103227  -2.767  0.00565
## adImageFamily:adTextIncentive     -0.160905   0.111301  -1.446  0.14827
## adImageVeteran:adTextIncentive    -0.006924   0.102365  -0.068  0.94607
## adImageFamily:adTextSharing       -0.214610   0.103150  -2.081  0.03747
## adImageVeteran:adTextSharing      -0.011815   0.095198  -0.124  0.90123
## adImageFamily:adTextSocial norms  -0.428042   0.104689  -4.089 4.34e-05
## adImageVeteran:adTextSocial norms -0.060496   0.096224  -0.629  0.52955
##                                      
## (Intercept)                       ***
## adImageFamily                     ***
## adImageVeteran                    ***
## adTextEmpowerment                    
## adTextIncentive                      
## adTextSharing                     *  
## adTextSocial norms                ***
## adImageFamily:adTextEmpowerment      
## adImageVeteran:adTextEmpowerment  ** 
## adImageFamily:adTextIncentive        
## adImageVeteran:adTextIncentive       
## adImageFamily:adTextSharing       *  
## adImageVeteran:adTextSharing         
## adImageFamily:adTextSocial norms  ***
## adImageVeteran:adTextSocial norms    
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
## Warning in anova.negbin(M): tests made without re-estimating 'theta'
```

```
## Analysis of Deviance Table
## 
## Model: Negative Binomial(33.9352), link: log
## 
## Response: clicksTotal
## 
## Terms added sequentially (first to last)
## 
## 
##                Df Deviance Resid. Df Resid. Dev  Pr(>Chi)    
## NULL                             675    1111.83              
## adImage         2  294.443       673     817.39 < 2.2e-16 ***
## adText          4   89.168       669     728.22 < 2.2e-16 ***
## adImage:adText  8   41.482       661     686.74 1.694e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
