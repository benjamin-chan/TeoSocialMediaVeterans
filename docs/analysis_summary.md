# Using Social Media to Engage Veterans in Health Care: Summary of Analysis

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


## Summary of Facebook Ad Metrics Analysis

* Use negative binomial model
* Factors: ad `image`, ad `text`
* Include full factorial interaction

**Model**

Define the linear predictor as $\eta$, where

$$
\eta = \beta_0 + 
       \beta_1 x_\text{image: Family} + 
       \beta_2 x_\text{image: Veteran} + 
       \beta_3 x_\text{text: Altruism} + 
       \beta_4 x_\text{text: Empowerment} + 
       \beta_5 x_\text{text: Sharing} + 
       \beta_6 x_\text{text: Social norms} + 
       \gamma_1 x_\text{image: Family} x_\text{text: Altruism} + 
       \gamma_2 x_\text{image: Family} x_\text{text: Empowerment} + 
       \gamma_3 x_\text{image: Family} x_\text{text: Sharing} + 
       \gamma_4 x_\text{image: Family} x_\text{text: Social norms} + 
       \gamma_5 x_\text{image: Veteran} x_\text{text: Altruism} + 
       \gamma_6 x_\text{image: Veteran} x_\text{text: Empowerment} + 
       \gamma_7 x_\text{image: Veteran} x_\text{text: Sharing} + 
       \gamma_8 x_\text{image: Veteran} x_\text{text: Social norms}
$$

The model for impressions and reach is

$$
\log(y) = \eta
$$

Clicks, unique clicks, total link clicks, unique link clicks are bounded by and related to the number of impressions.
The model for these dependent variables uses impressions as an offset and is specified as

$$
\log(y) = \eta + \log(x_\text{impressions})
$$

Reactions, comments, and shares are bounded by and related to the number of clicks.
The model for these dependent variables uses all clicks as an offset and is specified as

$$
\log(y) = \eta + \log(x_\text{clicksAll})
$$


### Impressions


```
## impressions ~ image + text + image * text
```

Predicted values.


|image    |text        |    pred| predLower| predUpper|
|:--------|:-----------|-------:|---------:|---------:|
|Veteran  |Sharing     | 1757.73|   1559.21|   1981.54|
|Veteran  |Incentive   | 1602.71|   1421.67|   1806.81|
|Veteran  |Altruism    | 1312.31|   1164.01|   1479.50|
|Veteran  |Empowerment | 1275.38|   1131.25|   1437.87|
|Computer |Sharing     | 1256.49|   1114.49|   1416.58|
|Veteran  |SocialNorms | 1250.96|   1109.58|   1410.35|
|Family   |Empowerment | 1194.50|   1060.88|   1344.95|
|Family   |Sharing     | 1193.04|   1058.20|   1345.08|
|Family   |Altruism    | 1125.38|    998.16|   1268.81|
|Computer |SocialNorms | 1099.00|    974.76|   1239.08|
|Computer |Altruism    | 1097.71|    973.61|   1237.63|
|Family   |SocialNorms | 1093.20|    969.61|   1232.54|
|Family   |Incentive   | 1080.02|    957.92|   1217.69|
|Computer |Incentive   | 1056.07|    936.66|   1190.69|
|Computer |Empowerment |  977.13|    866.63|   1101.72|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.796|       0|
|Family   |NA       |     NA|       0|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.655|       0.370|   0.045|       0.645|
|Altruism    |NA        |       NA|       0.179|   0.119|       0.989|
|Empowerment |NA        |       NA|          NA|   0.004|       0.175|
|Sharing     |NA        |       NA|          NA|      NA|       0.122|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|

### Clicks, all


```
## clicksAll ~ image + text + image * text + offset(log(impressions))
```

Predicted values.


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

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.069|       0|
|Family   |NA       |     NA|       0|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.154|       0.049|   0.000|       0.000|
|Altruism    |NA        |       NA|       0.566|   0.032|       0.000|
|Empowerment |NA        |       NA|          NA|   0.129|       0.001|
|Sharing     |NA        |       NA|          NA|      NA|       0.062|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|

### Total link clicks


```
## linkClicks ~ image + text + image * text + offset(log(impressions))
```

Predicted values.


|image    |text        | impressions|  pred| predLower| predUpper|
|:--------|:-----------|-----------:|-----:|---------:|---------:|
|Veteran  |SocialNorms |        1000| 11.48|     10.49|     12.56|
|Veteran  |Incentive   |        1000|  8.58|      7.82|      9.41|
|Veteran  |Sharing     |        1000|  7.89|      7.20|      8.64|
|Computer |SocialNorms |        1000|  6.31|      5.59|      7.12|
|Family   |SocialNorms |        1000|  5.21|      4.57|      5.94|
|Veteran  |Empowerment |        1000|  5.19|      4.59|      5.88|
|Computer |Sharing     |        1000|  5.01|      4.42|      5.68|
|Computer |Incentive   |        1000|  5.00|      4.35|      5.73|
|Family   |Sharing     |        1000|  4.92|      4.32|      5.60|
|Computer |Empowerment |        1000|  4.77|      4.13|      5.51|
|Family   |Empowerment |        1000|  4.57|      4.00|      5.23|
|Family   |Altruism    |        1000|  4.56|      3.98|      5.23|
|Computer |Altruism    |        1000|  4.52|      3.91|      5.21|
|Family   |Incentive   |        1000|  4.43|      3.84|      5.10|
|Veteran  |Altruism    |        1000|  4.24|      3.71|      4.84|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.233|       0|
|Family   |NA       |     NA|       0|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |     0.32|       0.651|   0.974|       0.013|
|Altruism    |NA        |       NA|       0.594|   0.284|       0.000|
|Empowerment |NA        |       NA|          NA|   0.614|       0.003|
|Sharing     |NA        |       NA|          NA|      NA|       0.010|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|

### Reactions


```
## Warning in theta.ml(Y, mu, sum(w), w, limit = control$maxit, trace =
## control$trace > : iteration limit reached

## Warning in theta.ml(Y, mu, sum(w), w, limit = control$maxit, trace =
## control$trace > : iteration limit reached
```

```
## reactions ~ image + text + image * text + offset(log(clicksAll))
```

Predicted values.


|image    |text        | clicksAll| pred| predLower| predUpper|
|:--------|:-----------|---------:|----:|---------:|---------:|
|Veteran  |Altruism    |        10| 4.51|      4.08|      4.99|
|Family   |Altruism    |        10| 3.87|      3.38|      4.43|
|Family   |Empowerment |        10| 2.44|      2.04|      2.91|
|Computer |Altruism    |        10| 2.27|      1.83|      2.82|
|Family   |Incentive   |        10| 2.20|      1.75|      2.77|
|Computer |Empowerment |        10| 2.20|      1.69|      2.85|
|Veteran  |Empowerment |        10| 2.16|      1.82|      2.56|
|Family   |Sharing     |        10| 1.99|      1.63|      2.43|
|Computer |Incentive   |        10| 1.88|      1.41|      2.52|
|Family   |SocialNorms |        10| 1.85|      1.49|      2.31|
|Computer |SocialNorms |        10| 1.68|      1.33|      2.11|
|Computer |Sharing     |        10| 1.40|      1.10|      1.79|
|Veteran  |Sharing     |        10| 1.36|      1.17|      1.57|
|Veteran  |SocialNorms |        10| 1.27|      1.06|      1.52|
|Veteran  |Incentive   |        10| 1.00|      0.80|      1.24|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.413|   0.001|
|Family   |NA       |     NA|   0.000|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.308|       0.442|   0.128|       0.545|
|Altruism    |NA        |       NA|       0.840|   0.004|       0.059|
|Empowerment |NA        |       NA|          NA|   0.014|       0.131|
|Sharing     |NA        |       NA|          NA|      NA|       0.292|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|


## Summary of REDCap Survey Analysis

Inclusion criteria

* Respondents who consented
* Eligible, ineligible, or missing eligibility indicator

**Number included: n = 1329**


**Model**

* Use logistic regression model
* Factors: ad `image`, ad `text`
* Include full factorial interaction

Define the linear predictor as $\eta$, where

$$
\eta = \beta_0 + 
       \beta_1 x_\text{image: Family} + 
       \beta_2 x_\text{image: Veteran} + 
       \beta_3 x_\text{text: Altruism} + 
       \beta_4 x_\text{text: Empowerment} + 
       \beta_5 x_\text{text: Sharing} + 
       \beta_6 x_\text{text: Social norms} + 
       \gamma_1 x_\text{image: Family} x_\text{text: Altruism} + 
       \gamma_2 x_\text{image: Family} x_\text{text: Empowerment} + 
       \gamma_3 x_\text{image: Family} x_\text{text: Sharing} + 
       \gamma_4 x_\text{image: Family} x_\text{text: Social norms} + 
       \gamma_5 x_\text{image: Veteran} x_\text{text: Altruism} + 
       \gamma_6 x_\text{image: Veteran} x_\text{text: Empowerment} + 
       \gamma_7 x_\text{image: Veteran} x_\text{text: Sharing} + 
       \gamma_8 x_\text{image: Veteran} x_\text{text: Social norms}
$$

The model for survey and screener participation is

$$
\text{logit}(y) = \eta
$$


### Survey participation


```
## indSurveyParticipation ~ image + text + image * text
```

Predicted values.


|image    |text        | pred| predLower| predUpper|
|:--------|:-----------|----:|---------:|---------:|
|Veteran  |Sharing     | 0.59|      0.53|      0.66|
|Family   |Sharing     | 0.57|      0.42|      0.70|
|Family   |Incentive   | 0.56|      0.39|      0.71|
|Veteran  |Incentive   | 0.55|      0.49|      0.61|
|Computer |Sharing     | 0.54|      0.43|      0.65|
|Computer |Incentive   | 0.49|      0.34|      0.64|
|Veteran  |Altruism    | 0.46|      0.33|      0.59|
|Family   |Altruism    | 0.45|      0.25|      0.66|
|Family   |Empowerment | 0.44|      0.29|      0.61|
|Computer |Altruism    | 0.40|      0.27|      0.55|
|Veteran  |Empowerment | 0.40|      0.28|      0.52|
|Computer |Empowerment | 0.33|      0.13|      0.62|
|Family   |SocialNorms | 0.28|      0.17|      0.42|
|Computer |SocialNorms | 0.25|      0.17|      0.35|
|Veteran  |SocialNorms | 0.23|      0.18|      0.28|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.553|   0.447|
|Family   |NA       |     NA|   0.961|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.413|       0.349|   0.563|       0.008|
|Altruism    |NA        |       NA|       0.674|   0.125|       0.077|
|Empowerment |NA        |       NA|          NA|   0.184|       0.539|
|Sharing     |NA        |       NA|          NA|      NA|       0.000|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|


### Screener participation


```
## indScreenerParticipation ~ image + text + image * text
```

Predicted values.


|image    |text        | pred| predLower| predUpper|
|:--------|:-----------|----:|---------:|---------:|
|Family   |Incentive   | 0.72|      0.56|      0.84|
|Computer |Sharing     | 0.70|      0.60|      0.79|
|Veteran  |Sharing     | 0.69|      0.62|      0.74|
|Veteran  |Incentive   | 0.64|      0.58|      0.69|
|Family   |Sharing     | 0.63|      0.48|      0.76|
|Computer |Incentive   | 0.59|      0.43|      0.72|
|Computer |Empowerment | 0.58|      0.31|      0.82|
|Veteran  |Altruism    | 0.58|      0.45|      0.70|
|Veteran  |Empowerment | 0.57|      0.45|      0.69|
|Family   |Empowerment | 0.56|      0.39|      0.71|
|Family   |Altruism    | 0.55|      0.34|      0.75|
|Computer |Altruism    | 0.42|      0.29|      0.57|
|Computer |SocialNorms | 0.33|      0.24|      0.43|
|Family   |SocialNorms | 0.32|      0.20|      0.46|
|Veteran  |SocialNorms | 0.29|      0.24|      0.35|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.212|   0.531|
|Family   |NA       |     NA|   0.311|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.132|       0.990|   0.193|       0.007|
|Altruism    |NA        |       NA|       0.324|   0.002|       0.293|
|Empowerment |NA        |       NA|          NA|   0.405|       0.096|
|Sharing     |NA        |       NA|          NA|      NA|       0.000|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|


### Suicidality 


```
## indDSISS ~ image + text + image * text
```

Predicted values.


|image    |text        | pred| predLower| predUpper|
|:--------|:-----------|----:|---------:|---------:|
|Family   |Empowerment | 0.47|      0.26|      0.70|
|Computer |Incentive   | 0.43|      0.24|      0.64|
|Computer |Sharing     | 0.29|      0.18|      0.43|
|Computer |Altruism    | 0.28|      0.12|      0.52|
|Veteran  |SocialNorms | 0.25|      0.15|      0.37|
|Family   |SocialNorms | 0.23|      0.08|      0.52|
|Family   |Altruism    | 0.22|      0.06|      0.58|
|Veteran  |Sharing     | 0.21|      0.15|      0.29|
|Computer |Empowerment | 0.20|      0.03|      0.69|
|Family   |Incentive   | 0.20|      0.08|      0.43|
|Veteran  |Altruism    | 0.19|      0.08|      0.39|
|Computer |SocialNorms | 0.19|      0.07|      0.41|
|Veteran  |Incentive   | 0.17|      0.12|      0.23|
|Family   |Sharing     | 0.15|      0.06|      0.35|
|Veteran  |Empowerment | 0.15|      0.06|      0.33|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.123|   0.007|
|Family   |NA       |     NA|   0.717|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.331|       0.361|   0.247|       0.102|
|Altruism    |NA        |       NA|       0.727|   0.949|       0.521|
|Empowerment |NA        |       NA|          NA|   0.686|       0.961|
|Sharing     |NA        |       NA|          NA|      NA|       0.407|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|


### VA enrollment


```
## indVANeverEnrolled ~ image + text + image * text
```

Predicted values.


|image    |text        | pred| predLower| predUpper|
|:--------|:-----------|----:|---------:|---------:|
|Computer |Incentive   | 0.45|      0.26|      0.66|
|Family   |SocialNorms | 0.38|      0.17|      0.66|
|Family   |Sharing     | 0.38|      0.22|      0.58|
|Veteran  |Incentive   | 0.37|      0.30|      0.44|
|Family   |Altruism    | 0.33|      0.11|      0.67|
|Veteran  |SocialNorms | 0.33|      0.22|      0.45|
|Veteran  |Sharing     | 0.31|      0.24|      0.40|
|Family   |Incentive   | 0.30|      0.14|      0.53|
|Veteran  |Empowerment | 0.29|      0.15|      0.48|
|Computer |Sharing     | 0.29|      0.18|      0.43|
|Computer |Altruism    | 0.28|      0.12|      0.52|
|Veteran  |Altruism    | 0.23|      0.11|      0.43|
|Family   |Empowerment | 0.22|      0.09|      0.46|
|Computer |Empowerment | 0.20|      0.03|      0.69|
|Computer |SocialNorms | 0.17|      0.07|      0.38|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.306|   0.426|
|Family   |NA       |     NA|   0.557|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.254|       0.315|   0.168|       0.048|
|Altruism    |NA        |       NA|       0.727|   0.949|       0.429|
|Empowerment |NA        |       NA|          NA|   0.686|       0.890|
|Sharing     |NA        |       NA|          NA|      NA|       0.312|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|


### Use of VA health services 


```
## indVANotUse12mo ~ image + text + image * text
```

Predicted values.


|image    |text        | pred| predLower| predUpper|
|:--------|:-----------|----:|---------:|---------:|
|Family   |Altruism    | 0.78|      0.42|      0.94|
|Veteran  |Incentive   | 0.64|      0.57|      0.71|
|Computer |Incentive   | 0.59|      0.38|      0.77|
|Veteran  |SocialNorms | 0.57|      0.45|      0.69|
|Computer |Sharing     | 0.57|      0.43|      0.70|
|Veteran  |Sharing     | 0.54|      0.46|      0.62|
|Veteran  |Empowerment | 0.50|      0.32|      0.68|
|Computer |Altruism    | 0.50|      0.28|      0.72|
|Family   |SocialNorms | 0.46|      0.22|      0.72|
|Veteran  |Altruism    | 0.46|      0.28|      0.65|
|Family   |Incentive   | 0.45|      0.25|      0.66|
|Computer |SocialNorms | 0.39|      0.22|      0.60|
|Family   |Empowerment | 0.39|      0.20|      0.62|
|Family   |Sharing     | 0.38|      0.22|      0.58|
|Computer |Empowerment | 0.20|      0.03|      0.69|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.363|   0.634|
|Family   |NA       |     NA|   0.099|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.566|       0.144|   0.878|       0.184|
|Altruism    |NA        |       NA|       0.253|   0.603|       0.487|
|Empowerment |NA        |       NA|          NA|   0.147|       0.430|
|Sharing     |NA        |       NA|          NA|      NA|       0.157|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|


## Summary of Facebook Ad Cost Analysis

* Use linear regression model
* Factors: ad `image`, ad `text`
* Include full factorial interaction

**Model**

Define the linear predictor as $\eta$, where

$$
\eta = \beta_0 + 
       \beta_1 x_\text{image: Family} + 
       \beta_2 x_\text{image: Veteran} + 
       \beta_3 x_\text{text: Altruism} + 
       \beta_4 x_\text{text: Empowerment} + 
       \beta_5 x_\text{text: Sharing} + 
       \beta_6 x_\text{text: Social norms} + 
       \gamma_1 x_\text{image: Family} x_\text{text: Altruism} + 
       \gamma_2 x_\text{image: Family} x_\text{text: Empowerment} + 
       \gamma_3 x_\text{image: Family} x_\text{text: Sharing} + 
       \gamma_4 x_\text{image: Family} x_\text{text: Social norms} + 
       \gamma_5 x_\text{image: Veteran} x_\text{text: Altruism} + 
       \gamma_6 x_\text{image: Veteran} x_\text{text: Empowerment} + 
       \gamma_7 x_\text{image: Veteran} x_\text{text: Sharing} + 
       \gamma_8 x_\text{image: Veteran} x_\text{text: Social norms}
$$

The model for ad costs per unit is

$$
y = \eta
$$

### Cost per 1,000 impressions


```
## costPerImpression ~ image + text + image * text
```

Predicted values.


|image    |text        |  pred| predLower| predUpper|
|:--------|:-----------|-----:|---------:|---------:|
|Computer |Empowerment | 17.79|     17.00|     18.58|
|Computer |Incentive   | 16.73|     15.94|     17.52|
|Family   |Incentive   | 16.54|     15.75|     17.33|
|Family   |SocialNorms | 16.21|     15.42|     17.00|
|Computer |Altruism    | 16.11|     15.32|     16.90|
|Computer |SocialNorms | 15.79|     15.00|     16.57|
|Family   |Altruism    | 15.44|     14.65|     16.23|
|Family   |Empowerment | 15.09|     14.31|     15.87|
|Family   |Sharing     | 14.77|     13.98|     15.56|
|Computer |Sharing     | 14.15|     13.36|     14.94|
|Veteran  |Empowerment | 13.87|     13.08|     14.66|
|Veteran  |SocialNorms | 13.67|     12.88|     14.46|
|Veteran  |Altruism    | 13.05|     12.26|     13.84|
|Veteran  |Incentive   | 11.50|     10.71|     12.29|
|Veteran  |Sharing     | 10.10|      9.31|     10.89|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |   0.74|       0|
|Family   |NA       |     NA|       0|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.278|       0.063|   0.000|       0.099|
|Altruism    |NA        |       NA|       0.003|   0.001|       0.570|
|Empowerment |NA        |       NA|          NA|   0.000|       0.000|
|Sharing     |NA        |       NA|          NA|      NA|       0.004|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|

### Cost per 1,000 link click


```
## costPerLinkClick ~ image + text + image * text
```

Predicted values.


|image    |text        | pred| predLower| predUpper|
|:--------|:-----------|----:|---------:|---------:|
|Family   |Incentive   | 5.44|      4.71|      6.16|
|Computer |Empowerment | 4.62|      3.89|      5.35|
|Computer |Incentive   | 4.49|      3.75|      5.23|
|Family   |Altruism    | 4.32|      3.60|      5.05|
|Family   |SocialNorms | 4.26|      3.54|      4.99|
|Computer |Altruism    | 4.03|      3.28|      4.78|
|Veteran  |Altruism    | 4.01|      3.29|      4.74|
|Family   |Sharing     | 3.91|      3.18|      4.65|
|Family   |Empowerment | 3.38|      2.64|      4.11|
|Computer |Sharing     | 3.29|      2.57|      4.02|
|Veteran  |Empowerment | 3.14|      2.40|      3.87|
|Computer |SocialNorms | 2.88|      2.16|      3.61|
|Veteran  |Incentive   | 1.67|      0.93|      2.40|
|Veteran  |Sharing     | 1.42|      0.70|      2.15|
|Veteran  |SocialNorms | 1.31|      0.59|      2.04|

P-values comparing main effects.


|         |Computer | Family| Veteran|
|:--------|:--------|------:|-------:|
|Computer |NA       |  0.075|       0|
|Family   |NA       |     NA|       0|
|Veteran  |NA       |     NA|      NA|

|            |Incentive | Altruism| Empowerment| Sharing| SocialNorms|
|:-----------|:---------|--------:|-----------:|-------:|-----------:|
|Incentive   |NA        |    0.393|       0.808|   0.024|       0.002|
|Altruism    |NA        |       NA|       0.269|   0.167|       0.031|
|Empowerment |NA        |       NA|          NA|   0.011|       0.001|
|Sharing     |NA        |       NA|          NA|      NA|       0.432|
|SocialNorms |NA        |       NA|          NA|      NA|          NA|
