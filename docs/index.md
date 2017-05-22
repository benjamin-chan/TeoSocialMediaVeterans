---
title: "Using Social Media to Engage Veterans in Health Care"
date: "2017-05-22 14:45:43"
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
## [1] broom_0.4.2      svglite_1.2.0    ggplot2_2.2.1    dplyr_0.5.0     
## [5] magrittr_1.5     readxl_0.1.1     rmarkdown_1.4    knitr_1.15.1    
## [9] checkpoint_0.4.0
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.10     mnormt_1.5-5     munsell_0.4.3    lattice_0.20-35 
##  [5] colorspace_1.3-2 R6_2.2.0         stringr_1.2.0    plyr_1.8.4      
##  [9] tools_3.3.3      parallel_3.3.3   grid_3.3.3       nlme_3.1-131    
## [13] gtable_0.2.0     psych_1.7.3.21   DBI_0.6          htmltools_0.3.5 
## [17] lazyeval_0.2.0   assertthat_0.1   rprojroot_1.2    digest_0.6.12   
## [21] tibble_1.2       tidyr_0.6.1      reshape2_1.4.2   evaluate_0.10   
## [25] stringi_1.1.3    methods_3.3.3    gdtools_0.1.4    scales_0.4.1    
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
## Classes 'tbl_df', 'tbl' and 'data.frame':	676 obs. of  10 variables:
##  $ date            : Date, format: "2017-01-15" "2017-01-16" ...
##  $ clicksTotal     : num  7 12 19 13 15 6 9 5 5 1 ...
##  $ clicksUnique    : num  7 12 17 12 14 6 9 4 5 1 ...
##  $ linkClicksTotal : num  5 5 8 6 8 2 4 1 4 0 ...
##  $ linkClicksUnique: num  5 5 8 6 8 2 4 1 4 0 ...
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
