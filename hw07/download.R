# Download the raw data
install.packages("downloader")
library(downloader)
download(url = "http://bit.ly/lotr_raw-tsv", destfile = "lotr_raw.tsv")
