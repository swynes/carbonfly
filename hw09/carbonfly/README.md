<!-- README.md is generated from README.Rmd. Please edit that file -->
carbonfly
=========

The goal of carbonfly is to provide functions that can be used to make calculations involving the carbon footprint of air travel.

Example
-------

This is a basic example which shows you how to solve a common problem that would inform your calculations: the distance between two points.

Distance between Toronto and Johannesburg (with longitude coordinates entered in first):

``` r
library(carbonfly)
gcd(-79.6248,43.6777,28.2411,-26.1367)
#> [1] 13362.56
```

How the functions are designed
------------------------------

The central function carboncalculator() relies on three other functions nested inside of it.

The first is deg2rad() which is not exported and viewable only to the developer. It takes any measurement in degrees (like longitude and latitude) and converts to radians, which is necessary for the gcd function.

The gcd() function measures greater circle distance. It contains a lot of trigonometry and is dependent on deg2rad()

CO2calculator() takes a distance input and converts it into a carbon footprint measured in kgCO2e (or total greenhouse gas emissions). This function has three conditionals that allow it to differentiate between short, medium, and long distance flights which have different emissions factors. It depends on gcd() and therefore deg2rad() as well. Do not confuse it with carboncalculator(). They have the same output type, but different inputs.

carboncalculator() is the central function of the package. It takes an input (two, IATA airport codes) and looks up their coordinates in a global data table (airport\_codes) stored as a datafile in this package. It is dependent on co2calculator(), gcd() and deg2rad() to convert these codes into coordinate degrees, then into radians, then into a greater circle distance and then into a carbon footprint.