
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fars

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/mentoldo/fars.svg?branch=main)](https://travis-ci.com/mentoldo/fars)
<!-- badges: end -->

The goal of fars is to describe data from the US National Highway
Traffic Safety Administration’s Fatality Analysis Reporting System, in
the time period 2013-2015. It has two functions `fars_summarize_years`
and `fars_map_state`

## Installation

You can install the development version of fars like so:

``` r
install_github('mentoldo/fars', build_vignettes=TRUE)
```

## Example

It has two functions `fars_summarize_years` and `fars_map_state`.

`fars_summarize_years` makes a frecuency table for accidents by months
for years passed as arguments for all US States.

``` r
library(fars)
## basic example code
library(kableExtra)

fars_summarize_years(c(2013, 2014, 2015)) %>% 
  kable()
#> [1] 2013
#> [1] "/home/psyche/R/x86_64-pc-linux-gnu-library/4.1/fars/extdata/accident_2013.csv.bz2"
#> [1] 2014
#> [1] "/home/psyche/R/x86_64-pc-linux-gnu-library/4.1/fars/extdata/accident_2014.csv.bz2"
#> [1] 2015
#> [1] "/home/psyche/R/x86_64-pc-linux-gnu-library/4.1/fars/extdata/accident_2015.csv.bz2"
```

<table>
<thead>
<tr>
<th style="text-align:right;">
MONTH
</th>
<th style="text-align:right;">
2013
</th>
<th style="text-align:right;">
2014
</th>
<th style="text-align:right;">
2015
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2230
</td>
<td style="text-align:right;">
2168
</td>
<td style="text-align:right;">
2368
</td>
</tr>
<tr>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
1952
</td>
<td style="text-align:right;">
1893
</td>
<td style="text-align:right;">
1968
</td>
</tr>
<tr>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
2356
</td>
<td style="text-align:right;">
2245
</td>
<td style="text-align:right;">
2385
</td>
</tr>
<tr>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
2300
</td>
<td style="text-align:right;">
2308
</td>
<td style="text-align:right;">
2430
</td>
</tr>
<tr>
<td style="text-align:right;">
5
</td>
<td style="text-align:right;">
2532
</td>
<td style="text-align:right;">
2596
</td>
<td style="text-align:right;">
2847
</td>
</tr>
<tr>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
2692
</td>
<td style="text-align:right;">
2583
</td>
<td style="text-align:right;">
2765
</td>
</tr>
<tr>
<td style="text-align:right;">
7
</td>
<td style="text-align:right;">
2660
</td>
<td style="text-align:right;">
2696
</td>
<td style="text-align:right;">
2998
</td>
</tr>
<tr>
<td style="text-align:right;">
8
</td>
<td style="text-align:right;">
2899
</td>
<td style="text-align:right;">
2800
</td>
<td style="text-align:right;">
3016
</td>
</tr>
<tr>
<td style="text-align:right;">
9
</td>
<td style="text-align:right;">
2741
</td>
<td style="text-align:right;">
2618
</td>
<td style="text-align:right;">
2865
</td>
</tr>
<tr>
<td style="text-align:right;">
10
</td>
<td style="text-align:right;">
2768
</td>
<td style="text-align:right;">
2831
</td>
<td style="text-align:right;">
3019
</td>
</tr>
<tr>
<td style="text-align:right;">
11
</td>
<td style="text-align:right;">
2615
</td>
<td style="text-align:right;">
2714
</td>
<td style="text-align:right;">
2724
</td>
</tr>
<tr>
<td style="text-align:right;">
12
</td>
<td style="text-align:right;">
2457
</td>
<td style="text-align:right;">
2604
</td>
<td style="text-align:right;">
2781
</td>
</tr>
</tbody>
</table>

`fars_map_state` plots the geolalization of all fatal crashes in
highways in the indicated year and state.

``` r
fars_map_state(26, 2015)
```

<img src="man/figures/README-example_map_state-1.png" width="100%" />
