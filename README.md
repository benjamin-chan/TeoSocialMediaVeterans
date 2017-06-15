# Using Social Media to Engage Veterans in Health Care

Attribute | Value
:---|:---
Principal investigator | Alan Teo, teoa@ohsu.edu, 503-220-8262 x52461
Main contact | Samuel Liebow, liebow@ohsu.edu
Statistician | Benjamin Chan, chanb@ohsu.edu, 503-494-5491
eIRB # | IRB15797
BDP project # | BDP-25


## Objectives

The overall objective of this study is to determine the feasibility of using
Facebook for identifying military veterans at risk for psychiatric problems,
then determine the appropriateness of multiple social media platforms for
engaging, supporting, and assisting these at-risk veterans. In this contract,
we will explore the following aim:

**Aim 1a:** Determine the feasibility of reaching recently deployed military
veterans through Facebook advertising. We will use Facebook ads to recruit
1000 self-reported veterans who have been deployed to Iraq or Afghanistan to
participate in a national online survey. Ad recruitment metrics and level of
social media use will determine feasibility of identifying and engaging
veterans.


## Deliverables

Analyze Facebook ad performance metrics by ad factors: image (3 levels) and
text (5 levels). Metrics include (a) number of ad clicks, (b) number of clicks
leading to consent to survey, (c) number of participants completing survey,
(d) number of "likes", (e) number of comments, and (f) number of shares. The
goal will be to determine if any image and text combination yields more
favorable metrics. Additionally, analyze ad performance by characteristics of
survey participants including (g) use of VA health services and (h) presence
of suicidality.

The metrics (a-f) will be modeled using count data models (such as Poisson or
negative-binomial models). Log(number of impressions) will be used as an
offset variable in the count models. Hurdle, zero-inflated count, or mixture
models will be explored, if necessary. Survey participant characteristics
(g-h) will be modeled using binomial data models (logistic regression or
alternative models).

Two data sets will be processed, cleaned, and provided by the investigator.
The first data set will be summarized data at the calendar day and ad type
level (1 row per calendar day, for each ad image and text type). The second
dataset with contain survey participant characteristics, (g) use of VA health
services, (h) presence of suicidality, and ad type.


## Results



## Methods



## Outputs

Full report: [HTML](docs/report.html) or [Markdown](docs/report.md)



## References

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



## Reproducibility

To recreate the analysis in this Git repository, execute `script.R` from the `scripts` directory.

```
$ cd scripts
$ /usr/bin/Rscript script.R
```

R package versions are listed in [`scripts/session.log`](scripts/session.log).
