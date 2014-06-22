library(shiny)

data <- readRDS('./data/cars2010.rds')

#Names of variables minus fuel efficiency (FE)
variables <- names(data)
variables <- as.list(variables[-which(variables=='Fuel.Economy')])

#create List of variable names to be used in dropdown menu
dropDownList <- list()

for (col in seq(1:length(variables))) {
    dropDownList[variables[[col]]] = variables[[col]]
}

# Define UI for application that plots the relationship between the  chosen variables and fuel economy aas well as displaying the results of a linear regression on the chosen variables on fuel economy.
shinyUI(fluidPage(
  titlePanel("Exploring Fuel Economy"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Visualize and quantify which properties of a car influence fuel economy. To use the app, simply choose which car properties you'd like to explore. The app will plot the variables chosen and run a linear regression model using the chosen variables as predictors of  fuel economy."
        ),
      
      selectInput("var1", 'First Variable',
                  choices = dropDownList, 
                  selected = names(data)[[1]]),
      selectInput("var2", 'Second Variable',
                  choices = dropDownList, 
                  selected = names(data)[[2]]),

      br(),
      br(),

      p(
          "The type of plot you get will depend on the type of input:",
          tags$ul(
              tags$li("barcharts with average fuel economy if both inputs are categorical"),
              tags$li("scatterplots if one of the variables is continuous")
          )
      ),
    br(),
    br(),
    p(
        "The data comes from the fuel economy standards for cars from 2010, located at the ",
        a("fueleconomy.gov",href= "http://fueleconomy.gov/"),
        " website, and is available via the ", em("FuelEconomy"), "dataset in the ", 
        a("AppliedPredictiveModeling", href="http://cran.r-project.org/web/packages/AppliedPredictiveModeling/"), " package.",
        "This data uses the ", em("cars2010"), " dataset. Then variable names have been modified, and some binary variables turned to factors"
    )
    
  ),
    
    mainPanel(
        h4("Plot of the chosen variables effect on fuel economy"),
        plotOutput("plot"),
        
        h4("Results of linear regression of chosen variables on fuel economy"),
        verbatimTextOutput("summary")
        
      
    )
  )
))
