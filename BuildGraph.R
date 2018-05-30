library(sas7bdat)
library(dplyr)
library (plotly)
data <- read.sas7bdat("data/nypans2010.sas7bdat", debug=FALSE)

active <- data %>% select(e_q9, e_q57, e_q58, e_q59, e_q60, e_q61)
active[is.na(active)] <- 0
active$enjoy <- active$e_q57
active$fun <- active$e_q58
active$energy <- active$e_q59
active$BodyIsGood <- active$e_q60
active$success <- active$e_q61
active$e_q57 <- NULL
active$e_q58 <- NULL
active$e_q59 <- NULL
active$e_q60 <- NULL
active$e_q61 <- NULL
active$e_q9 <- as.numeric(active$e_q9)
active$e_q9 <- active$e_q9 - 1

write.csv(active, "data/active.csv")
test <- active %>% filter(as.numeric(enjoy) > 1) %>% group_by(enjoy) %>% summarise(n())


buildPlot <- function(dataset, slider, question){

  # Create Data Frame limtied to user selected stat
  x.equation = paste0("~",question)
  print("1")
  active$e_q9 <- as.numeric(active$e_q9)
  newdata <- active %>% filter(e_q9 == 2)  %>% group_by(BodyIsGood) %>% summarise(n())
  print(newdata)
  newdata$surveyed <- newdata$`n()`
  # Create a scatter plot of selected stat
    p <- plot_ly(
      newdata,
      x = eval(parse(text = x.equation)), 
      y = ~surveyed,
      type = 'bar'
    )
  return (p)
}

buildPlot(2, active$enjoy)

test <- active %>% filter(e_q9 == 2) %>%  filter(as.numeric(enjoy) > 1) %>% group_by(enjoy) %>% summarise(n())

test$surveyed <- test$`n()`

p <- plot_ly(
  test,
  x = ~enjoy,
  y = ~surveyed,
  type = 'bar'
)
p
