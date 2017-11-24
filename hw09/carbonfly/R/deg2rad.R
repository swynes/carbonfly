#' Change degrees into radians
#'
#' This function will take coordinates in degrees and change them into radians
#' This is useful as our function that finds Greater Circle Distance requires radians
#'
#' @param deg The vector to be converted
#'
#' @return A vector that is radian version of \code{deg}.
#'
#' @details
#' This function isn't complicated.
#'
#' @examples
#' deg2rad(180)
#' deg2rad(90)

deg2rad <- function(deg) return(deg*pi/180) #Change degrees into radians
