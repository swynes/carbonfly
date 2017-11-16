# Download the raw data
library(downloader)

#To avoid working with a dataset I've already seen, and to practice finding
#and working with my own dataset, I download an nba csv from a github user

download(url = "https://raw.githubusercontent.com/AddisonGauss/NbaData2015-2016/master/nbasalariespoints.csv", destfile = "nbapoints.csv")
