#' Find greater circle distance between two points, provided as radians.
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
#' @examples
#' Distance from Paris to Cairo by latitude and longitude corodinates
#' List longitude first
#' gcd(2.2945,48.8584,31.1342,29.9792)
#' 
#' @export

gcd <- function(long1, lat1, long2, lat2) {

  if(!is.numeric(long1)){
    stop('this function only works for numeric input\n',
         'For longitude 1, you have provided an object of class:',class(long1)[1])
  }
  if(!is.numeric(lat1)){
    stop('this function only works for numeric input\n',
         'For latitude 1, you have provided an object of class:',class(lat1)[1])
  }
  if(!is.numeric(long2)){
    stop('this function only works for numeric input\n',
         'For longitude 2, you have provided an object of class:',class(long2)[1])
  }
  if(!is.numeric(lat2)){
    stop('this function only works for numeric input\n',
         'For latitude 2, you have provided an object of class:',class(lat2)[1])
  }
  
  # Convert degrees to radians
  long1 <- deg2rad(long1)
  lat1 <- deg2rad(lat1)
  long2 <- deg2rad(long2)
  lat2 <- deg2rad(lat2)
  
  
  # WGS-84 ellipsoid parameters
  a <- 6378137         # length of major axis of the ellipsoid (radius at equator)
  b <- 6356752.314245  # length of minor axis of the ellipsoid (radius at the poles)
  f <- 1/298.257223563 # flattening of the ellipsoid

  L <- long2-long1 # difference in longitude
  U1 <- atan((1-f) * tan(lat1)) # reduced latitude
  U2 <- atan((1-f) * tan(lat2)) # reduced latitude
  sinU1 <- sin(U1)
  cosU1 <- cos(U1)
  sinU2 <- sin(U2)
  cosU2 <- cos(U2)

  cosSqAlpha <- NULL
  sinSigma <- NULL
  cosSigma <- NULL
  cos2SigmaM <- NULL
  sigma <- NULL

  lambda <- L
  lambdaP <- 0
  iterLimit <- 100
  while (abs(lambda-lambdaP) > 1e-12 & iterLimit>0) {
    sinLambda <- sin(lambda)
    cosLambda <- cos(lambda)
    sinSigma <- sqrt( (cosU2*sinLambda) * (cosU2*sinLambda) +
                        (cosU1*sinU2-sinU1*cosU2*cosLambda) * (cosU1*sinU2-sinU1*cosU2*cosLambda) )
    if (sinSigma==0) return(0)  # Co-incident points
    cosSigma <- sinU1*sinU2 + cosU1*cosU2*cosLambda
    sigma <- atan2(sinSigma, cosSigma)
    sinAlpha <- cosU1 * cosU2 * sinLambda / sinSigma
    cosSqAlpha <- 1 - sinAlpha*sinAlpha
    cos2SigmaM <- cosSigma - 2*sinU1*sinU2/cosSqAlpha
    if (is.na(cos2SigmaM)) cos2SigmaM <- 0  # Equatorial line: cosSqAlpha=0
    C <- f/16*cosSqAlpha*(4+f*(4-3*cosSqAlpha))
    lambdaP <- lambda
    lambda <- L + (1-C) * f * sinAlpha *
      (sigma + C*sinSigma*(cos2SigmaM+C*cosSigma*(-1+2*cos2SigmaM*cos2SigmaM)))
    iterLimit <- iterLimit - 1
  }
  if (iterLimit==0) return(NA)  # formula failed to converge
  uSq <- cosSqAlpha * (a*a - b*b) / (b*b)
  A <- 1 + uSq/16384*(4096+uSq*(-768+uSq*(320-175*uSq)))
  B <- uSq/1024 * (256+uSq*(-128+uSq*(74-47*uSq)))
  deltaSigma = B*sinSigma*(cos2SigmaM+B/4*(cosSigma*(-1+2*cos2SigmaM^2) -
                                             B/6*cos2SigmaM*(-3+4*sinSigma^2)*(-3+4*cos2SigmaM^2)))
  s <- b*A*(sigma-deltaSigma) / 1000

  return(s) # Distance in km
}
