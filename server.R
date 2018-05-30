library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

my_server <- function(input, output) {
  nutrition <- read.csv("data/nutrition.csv")
  active <- read.csv("data/active.csv")
  active$e_q9 <- as.numeric(active$e_q9)
  
  output$bar_plot2 <- renderPlotly({
    if (input$slider1 == 0) {
      newdata <- active %>% filter(e_q9 == 0) %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
    }  
    if (input$slider1 == 2) {
      newdata <- active %>% filter(e_q9 == 1)   %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
    }  
    if (input$slider1 == 3) {
      newdata <- active %>% filter(e_q9 == 2) %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
    }  
    if (input$slider1 == 4) {
      newdata <- active %>% filter(e_q9 == 3)  %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
    }  
    if (input$slider1 == 5) {
      newdata <- active %>% filter(e_q9 == 4)  %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
      
    }  
    if (input$slider1 == 6) {
      newdata <- active %>% filter(e_q9 == 5) %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
      
    }  
    if (input$slider1 == 7) {
      newdata <- active %>% filter(e_q9 == 6) %>% group_by(input$question) %>% summarise(n())
      newdata$count <- newdata$`n()`
      colnames(newdata)[1] <- "done"
    }  
    
    newdata$count <- as.numeric(newdata$count)
    p2 <- plot_ly(data = newdata, x = newdata$done , y = newdata$count,type = "bar")
    return(p2)
  })

  output$bar_plot <- renderPlotly({
    if (input$pefeels == "1") {
      nutrition_test <- nutrition %>% filter(pe_class == 1)
    } else if (input$pefeels == "2") {
      nutrition_test <- nutrition %>% filter(pe_class == 2)
    } else if (input$pefeels == "3") {
      nutrition_test <- nutrition %>% filter(pe_class == 3)
    } else if (input$pefeels == "4") {
      nutrition_test <- nutrition %>% filter(pe_class == 4)
    } else if (input$pefeels == "5") {
      nutrition_test <- nutrition %>% filter(pe_class == 5)
    } else {
      nutrition_test <- nutrition %>% filter(pe_class == 6)
    }
    if (input$datatype == "Yes") {
      nutrition_test <- nutrition_test %>% filter(enjoy_pe == 2) %>% group_by(fruit) %>% summarise(n())
      nutrition_test$count <- nutrition_test$`n()`
    } else { # if input$datatype = "No"
      nutrition_test <- nutrition_test %>% filter(enjoy_pe == 1) %>% group_by(fruit) %>% summarise(n())
      nutrition_test$count <- nutrition_test$`n()`
    }
    # Creates the bar plot
    p <- plot_ly(data = nutrition_test, x = nutrition_test$fruit, y = nutrition_test$count,type = "bar") %>%
      layout(
        title = "Percentage PE Class Availability and Sentiment to Fruit Consumption",
        xaxis = list(title = "Total Fruit Consumption Per Week"),
        yaxis = list(title = "Count of Youths")
      )
    return(p)
  })

}
shinyServer(my_server)