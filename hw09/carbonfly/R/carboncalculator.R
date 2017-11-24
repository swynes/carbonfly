#' Converts 
#'
#' Does not assume a spherical earth and is therefore more accurate.
#'
#' @param (long1, lat1, long2, lat2) The latitude and longitude in radians
#'
#' @return The distance between the coordinates \code{long1, lat1, long2, lat2}.
#'
#' @details
#' This function is complicated by a lot of trigonometry.
#'
#' The distance returned is in kilometers
#'
#'
#' @example
#' Distance from Toronto to Vancouver with coordinates in radians
#' gcd.vif(-1.385, 0.7618, -2.149, 0.86)
#' @export

library(carbonfly)
origin <- "YVR"
destination <- "YYZ"

carboncalculator(origin,destination)

carboncalculator <- function(origin, destination) {
  
  lat1 <- airport_codes %>% 
    filter(aircode == origin ) %$% c(lat)
  
  long1 <- airport_codes %>% 
    filter(aircode == origin ) %$% c(long)
  
  lat2 <- airport_codes %>% 
    filter(aircode == destination ) %$% c(lat)
  
  long2 <- airport_codes %>% 
    filter(aircode == destination ) %$% c(long)
  
  co2calculator(
    gcd.vif(
      deg2rad(long1),
      deg2rad(lat1),
      deg2rad(long2),
      deg2rad(lat2)))
  