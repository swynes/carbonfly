library(shiny)
library(ggplot2)
library(dplyr)
library(cowplot)
library(DT)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })
  

      filtered <- reactive({
        if (is.null(input$countryInput)) {
          return(NULL)
        }    
        
      bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
      
      output$coolplot <- renderPlot({
        if (is.null(filtered())) {
          return()
        }
        ggplot(filtered(), aes(Alcohol_Content)) +
          geom_histogram() +
          labs(x = "Alcohol Content", y="Number of Beverages")
      })
        
  output$results <- DT::renderDataTable({
    filtered()
  })
  
})