#ui page for the shiny app
library(dplyr)
library(shiny)
library(plotly)
shinyUI(fluidPage(
  #title bar
  titlePanel("Sports Data"),
  
  #side bar
  sidebarLayout(
    #sidebar Panel
    sidebarPanel(
      sliderInput('slider', 
                   label="Days in a week you get exercise for more than 60 minutes", 
                   min = 0,
                   max = 7,
                   value = 0
      ),
      selectInput('question', label = 'Select an insightful question about exercise', 
                  choices = list("When I am physically active, I enjoy it." = 'enjoy',
                                 "When I am physically active, I find it fun." = 'fun',
                                 "When I am physically active, it gives me energy." = 'energy', 
                                 "When I am physically active, my body feels good." = 'BodyIsGood',
                                 "When I am physically active, it gives me a strong feeling ofsuccess." = 'success'
                                 ))
    ),
    #main panel
    mainPanel(
      plotlyOutput("bar")
    )
  )
))

