## SUMMARY

Find the new and improved app [here](https://swynes.shinyapps.io/bcl_test/).

Find the code for the ui [here](https://github.com/swynes/STAT545-hw-wynes-chris/blob/master/hw08/bcl_test/ui.R).

Find the code for the server [here](https://github.com/swynes/STAT545-hw-wynes-chris/blob/master/hw08/bcl_test/server.R).

The base of the app allows users to select Country, Price Range and Type of beverage and see a histogram of alcohol content and a table of
all beverage matching the specifications.

I expanded the app by
1) Adding an image of a wine bottle to the side panel
2) Making the table interactive using the [DT package](https://cran.r-project.org/web/packages/DT/DT.pdf)
  -This allows the user to select the number of visible entries per page and to search the table for content
3) Used the cowplot package to make a cleaner version of the histogram, with more user friendly axis labels
4) Used the [shinythemes](https://rstudio.github.io/shinythemes/) package to pick a more aesthetically pleasing theme for the app
5) Changed the radio buttons for typeinput to checkboxes so that the user can now see multiple types of beverages at the same time
