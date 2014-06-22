library(shiny)
library(ggplot2)
library(plyr)
# source("helpers.R")
# counties <- readRDS("data/counties.rds")
# library(maps)

data <- readRDS('./data/cars2010.rds')
#data <- readRDS('./carPlotter/data/cars2010.rds')



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    #reactive ({
    
        #Both input data types are numeric, so print a plotMatrix
        if (is.numeric(data[,which(names(data)==input$var1)]) & 
                is.numeric(data[,which(names(data)==input$var2)])) {
            plotData <- data[,names(data)==c("Fuel.Economy",input$var1,input$var2)]
            output$plot <- reactivePlot({
                plotmatrix(plotData)
                })
        }
        #Both inputs are factors
        else if (is.numeric(data[,which(names(data)==input$var1)]) & 
                     is.numeric(data[,which(names(data)==input$var2)])) {
            plotData <- ddply(data,c(input$var1,input$var2), .summarize, Fuel.Economy = mean(Fuel.Economy))
            output$plot <- renderPlot({
                ggplot(plotData,aes_string(y='Fuel.Economy',x=input$var1, fill=input$var2)) + 
                    geom_bar(stat='identity', position='dodge') +
                    theme(
                        axis.text = element_text(size=14),
                        axis.title = element_text(size=16),
                        legend.text = element_text(size=14),
                        legend.title = element_text(size=16))

                })
        }
        else {
            output$plot <- reactivePlot({
            #Determine which variable from the input is a factor
            if(is.factor(data[,input$var1])) {
                factorVar = input$var1
                nonFactorVar = input$var2
            } else {
                factorVar = input$var2
                nonFactorVar = input$var1
            }
            
            #plot the continuous on the x-axis, and use color for mapping of the factor variable
           
                ggplot(data,aes_string(y='Fuel.Economy',x=nonFactorVar, color=factorVar)) + 
                    geom_point(size=3, position = 'jitter') + 
                    theme(
                        axis.text = element_text(size=14),
                        axis.title = element_text(size=16),
                        legend.text = element_text(size=14),
                        legend.title = element_text(size=16))
                })
            
        }
    #}) #end reactive
 }
)

