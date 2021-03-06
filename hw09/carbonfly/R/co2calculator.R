#' Calculate the carbon dioxide produced from travelling a certain distance by aircraft
#'
#' This function will take distance and convert it into kgCO2e
#' 
#'
#' @param distance The vector to be converted
#'
#' @return A vector that is a modified calculation of \code{distance}.
#'
#' @details
#' This function has three if statements because long, medium and short distance
#' Have different efficiencies. Flying short distance therefore uses a different emissions multiplier than medium or long etc.
#'
#' @examples
#' co2calculator(10)
#' co2calculator(1000)
#' co2calculator(10000)
#' @export

co2calculator <- function(distance) {
  
  if(!is.numeric(distance)){
    stop('this function only works for numeric input\n',
         'You have provided an object of class:',class(distance)[1])
  }
  
  #Uplift factor of an additional 8% added here to account for average distance added to a flight path by rerouting, holding patterns etc.
  co2e<- if(distance<=463){
    distance*0.27867*1.08 #short distance emissions factor
  }   else if (distance>463 && distance<3700) {
    distance*0.16844*1.08 #medium distance emissions factor
  } else if (distance>=3700) {
    distance*0.19162*1.08 #long distance emissions factor
  } 
  return(co2e) #measured in kgCO2e
}