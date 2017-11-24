#' Finds the greenhouse gases emitted by travelling between two airports
#'
#' Input 
#'
#' @param (origin,destination) The origin airport and destination airport
#'
#' @return Total greenhouse gases in kgCO2e \code{origin,destination}.
#'
#' @details
#' Makes use of radiative forcing. For more information on whether the radiative
#' forcing multiplier is appropriate please see: 
#' https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2016
#' and
#' https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/553488/2016_methodology_paper_Final_V01-00.pdf
#'
#'
#' @example
#' carboncalculator("YVR","LGW")
#' @export

carboncalculator <- function(origin, destination) {
  
  if(!is.character(origin)){
    stop('this function only works for character input\n',
         'Please supply a three digit airport code\n',
         'You have provided an object of class:',class(origin)[1])
  }
  
  if(!is.character(destination)){
    stop('this function only works for character input\n',
         'Please supply a three digit airport code\n',
         'You have provided an object of class:',class(origin)[1])
  }
  
  lat1 <- airport_codes %>%
    filter(aircode == origin ) %$% c(lat)
  
  long1 <- airport_codes %>% 
    filter(aircode == origin ) %$% c(long)
  
  lat2 <- airport_codes %>% 
    filter(aircode == destination ) %$% c(lat)
  
  long2 <- airport_codes %>% 
    filter(aircode == destination ) %$% c(long)
  
  
  co2calculator(
    gcd(
      (long1),
      (lat1),
      (long2),
      (lat2)))
}
