# This is the server logic of our Shiny web application. 

library(dplyr)
library(shiny)
library(plotly)
# install.packages("rsconnect")
library(rsconnect)
source('BuildGraph.R')

shinyServer(function(input,output) {
  ### Sports Data Server Logic ###
  dataset <- read.csv("data/active.csv")
  output$bar <- renderPlotly({
    bar()
  })
  
  bar <- reactive({
    buildPlot(dataset,input$slider1, input$question)
  })
  
})

