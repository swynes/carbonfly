% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/carboncalculator.R
\name{carboncalculator}
\alias{carboncalculator}
\title{Finds the greenhouse gases emitted by travelling between two airports}
\usage{
carboncalculator(origin, destination)
}
\arguments{
\item{(origin, destination)}{The origin airport and destination airport}
}
\value{
Total greenhouse gases in kgCO2e \code{origin,destination}.
}
\description{
Input
}
\details{
Makes use of radiative forcing. For more information on whether the radiative
forcing multiplier is appropriate please see: 
https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2016
and
https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/553488/2016_methodology_paper_Final_V01-00.pdf
}
