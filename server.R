library(dplyr)
library(shiny)
library(plotly)
library(rsconnect)
source('BuildGraph.R')



shinyServer(function(input,output) {
  dataset <- read.csv("data/active.csv")
  output$bar <- renderPlotly({
    bar()
  })
  
  bar <- reactive({
    buildPlot(dataset,input$slider1, input$question)
  })
  
})

