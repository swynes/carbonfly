## one script to rule them all

## clean out any previous work
outputs <- c("lotr_raw.tsv",                     # 00_download-data.R
             "lotr_clean.tsv",                   # 01_filter-reorder-plot.R
             "total-words-by-film-race.tsv",     # 02_aggregate-plot.R
             list.files(pattern = "*.png$"))
file.remove(outputs)

## run my scripts
source("C:/Users/AsusW10/Documents/STAT545/STAT545-hw-wynes-chris/hw07/00_download-data.R")
source("C:/Users/AsusW10/Documents/STAT545/STAT545-hw-wynes-chris/hw07/01_filter-reorder.R")
source("C:/Users/AsusW10/Documents/STAT545/STAT545-hw-wynes-chris/hw07/02_aggregate-plot.R")
