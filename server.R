library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

my_server <- function(input, output) {
  nutrition <- read.csv("data/nutrition.csv")
  dataset <- read.csv("data/active.csv")

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
    } else { # if input$state == "Wisconsin"
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