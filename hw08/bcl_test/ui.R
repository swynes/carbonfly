library(shiny)
library(ggplot2)
library(shinythemes
        )
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("slate"),
  titlePanel("BC Liquor store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      checkboxGroupInput("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput"),
      img(src = "wine.jpg")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      DT::dataTableOutput("results"))
  )
)
)