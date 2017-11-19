library(shiny)
library(ggplot2)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("BC Liquor store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results"))
  )
)
)