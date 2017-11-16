#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
bcl <- read.csv("C:/Users/AsusW10/Documents/STAT545/STAT545-hw-wynes-chris/hw08/bcl_test/bcl-data.csv", stringsAsFactors = FALSE)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("BC Liquor store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      selectInput("countryInput", "Country",
                  choices = c("CANADA", "FRANCE", "ITALY"))
    ),
    mainPanel(
      plotOutput("coolplot"),
    br(), br(),
    tableOutput("results"))
    )
  )
)