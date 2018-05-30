# ui.R
library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
my_ui <- navbarPage(
  "Nutrition and Excercise with Teenagers",
  tabPanel(
    "PE & Students",
    sidebarLayout(
      sidebarPanel(
        selectInput("pefeels", "Student's Feelings about PE Class:",
          choices = c(
            "I didn't take PE"= "1",
            "Strongly Disagree"= "2",
            "Disagree"="3",
            "Neither Agree Nor Disagree"= "4",
            "Agree"= "5",
            "Strongly Agree"= "6"
  
          )
        ),
        radioButtons("datatype", "Students enjoy PE",
          choices = c("Yes", "No")
        )
      ),
      mainPanel(plotlyOutput("bar_plot"))
    )
    
  ),
  
  # Second tab with two widgets and a scatter plot
  tabPanel("Physical Activity", id="physicality",
           title = "Physical Activity",
           tags$p("This tab visualizes responses to questions about 
                  the days in a week in which teens got exercise for more than 60 minutes 
                  and the entailed feelings of such exercise. 
                  The questionnaire statements we focused on for this section were, 
                  When I am physically active, I enjoy it,
                  When I am physically active, I find it fun,
                  When I am physically active, it gives me energy, 
                  When I am physically active, my body feels good, and 
                  When I am physically active, it gives me a strong feeling ofsuccess."),
           tags$br(),
           #side bar
           sidebarLayout(
             #sidebar Panel
             sidebarPanel(
               sliderInput('slider1', 
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
               plotlyOutput("bar_plot2")
             )
           )
      )  
  
  
  
)
shinyUI(my_ui)