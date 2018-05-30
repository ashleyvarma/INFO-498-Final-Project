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
  )
)
shinyUI(my_ui)