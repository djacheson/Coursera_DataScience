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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Visualize Fuel Economy"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create plots to visualize which aspects of a car influence fuel economy"
        ),
      
      selectInput("var1", 'First Variable',
                  choices = dropDownList, 
                  selected = names(data)[[1]]),
      selectInput("var2", 'Second Variable',
                  choices = dropDownList, 
                  selected = names(data)[[2]]),
      
      br(),
      br(),
      br(),
      
      p("This shiny app lets you explore how various properties of cars influence their fuel economy.
        To use the app, simply choose which variables you'd like to display and the plot will automatically update."),
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
      plotOutput("plot")
    )
  )
))
