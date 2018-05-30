# This is the user-interface for the intro page of the Shiny web application. 
#install.packages("dplyr")
library(dplyr)
#install.packages("shiny")
library(shiny)
#install.packages("plotly")
library(plotly)
#install.packages("shinythemes")
library(shinythemes)

# Define UI that encases tabs for the web application
shinyUI
  (navbarPage
    (title="INFO498", theme = "darkly",
        (tabPanel("Home", id="home",
             h1("A look into the National Youth Physical Activity and Nutrition Study (NYPANS)"),
             h2("INFO 498 Population Health Metrics"),
             h3("Team 5: Suraj Chandrasekhar, Vansh Gambhir, Ashley Varma, & Zhanna Voloshina"),
             a(href="https://github.com/ashleyvarma/INFO-498-Final-Project", "Want to see our Project Repository? Click here!"),
             br(),
             h2("Project Description"),
             h3("Purpose"),
             p("The purpose of of our project was to look at how the combination of exercise and nutrition affected teenagers on a nationwide scale. 
              As in current times, there are teenagers that eat healthy but do not get as much exercise as recommended by the CDC and other government
              health organizations. Knowing this altruistic pattern of behavior, we thought it would be interesting to see which categorical factors are 
              contributing to nutritional detrements for the surveyed group. This examination into such data is especially important to what's occuring ", 
               tags$b("now"), (", as childhood obesity in America is becoming a growing nationwide problem. According to the CDC, \"Data from 2015-2016 show 
              that nearly 1 in 5 school age children and young people (6 to 19 years) in the United States has obesity.\""),
             h3("What is Being Examined Through Our Visualizations:"),
               tags$ul(tags$li("If students have PE class/like it ", tags$b("VS"), " how much fruit and vegetables they eat"),
                       tags$li("How often Teenagers work out over ", tags$b("60 minutes a day")," and how it affects their ", tags$b("opinion on exercise"))
                       #tags$li("vansh stuff ",tags$b("")," and ")
              ),
             h3("Dataset"),
             p("NPANS Dataset, Questionnaire, and Data Manuel can be found", tags$a(href="https://www.cdc.gov/healthyyouth/data/yrbs/nypans.htm", "here.")),
             p(" The National Youth Physical Activity and Nutrition Study (NYPANS) was conducted by the Centers for Disease Control and Prevention 
                  (CDC) in 2010 with three main purposes:
               \n1. To provide nationally representative data on behaviors and behavioral determinants related to nutrition and physical activity 
                among high school students
               \n2. To provide data to help improve the clarity and strengthen the validity of questions on the Youth Risk Behavior Survey (YRBS)
               \n3. To understand the associations among behaviors and behavioral determinants related to physical activity and nutrition and their
                association with body mass index
               \n NYPANS included a paper-and-pencil questionnaire administered to a nationally representative sample of students, height and weight
                measurements for these students using a standardized protocol, and telephone interviews to
               measure 24-hour dietary recalls among a subsample of these students. NYPANS used a three-stage cluster sample design to produce a 
               representative sample of
               students in grades 9 through 12. The target population consisted of all public, Catholic, and other private school students in 
               grades 9 through 12. 
                A weighting factor was applied to each student record to adjust for nonresponse and the oversampling of black and Hispanic students
               in the sample. The final, overall weights were scaled so the weighted count of students was equal to the total sample size, and the 
                weighted proportions of students in each grade
               matched population projections for the survey year."),
               
               p("In the NYPANS data set there were mainly only categorical options to explore, leaving the possibility to extrapolate 
                  correlations up to our own discernment.
                  Data points were left completely anonymous and unconnected from each other in those specific categories. Studying and 
                  utilizing the NYPANS Data 
                  Manuel was integral into our understanding of how some questions could be grouped together with other more similar
                  fields in the survey, and could then
                  be combined into an interactive information visualization for further considerations on whether such activity could 
                  be deemed as behavior to increase overall health."),
               br(),
               h3("Target Audience"),
               p("The primary target audience our findings would be most impactful to those in the Department of Education
                 who oversee policy implementation Office of Superintendent of Public Instruction's Food and Nutrition Services. 
                 The Food and Nutrition Service administers several programs that provide healthy food to children including the National 
                 School Lunch Program, School Breakfast Program, Child and Adult Care Food Program, Summer Food Service Program, Fresh Fruit
                 and Vegetable Program, and Special Milk Program. Each of these programs helps fight hunger and obesity by reimbursing organizations 
                 such as schools, child care centers, and after-school programs for providing healthy meals to children. They are the ones 
                 who work with the carefully developed budgets from the DoE for meal programs within public schools, and from the effects of 
                 what our group finds from the original data set they may learn that they could potentially be reaching out to appropriate NGO's 
                 for assistance if needed. Additionally from the data we coerce, it may be that they start to reform their current handling of such a
                 dense situation and can lead to a huge positive impact on a child's life which will help them along the way of their educational journey. 
                 As any educator knows, school is more than a learning institution, it is a second or even first home for many: providing students with 
                 fundamental resources for success will fulfill the goal of our target audience as they seek information through our findings.")
             ),
             
             ### Physical Activity tab panel ###
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
                 )  
            ### NEXT UI GOES HERE ###
          )
      )
  )
)
