library(shiny)
library(ggplot2)
library(plyr)

#read in the data
data <- readRDS('./data/cars2010.rds')

# Define server logic required to draw plots
shinyServer(function(input, output) {
    
    output$plot <- renderPlot({
    
        #Both input data types are numeric, so print a plotMatrix
        if (is.numeric(data[,which(names(data)==input$var1)]) & 
                is.numeric(data[,which(names(data)==input$var2)])) {
            plotData <- data[,names(data) %in% c("Fuel.Economy",input$var1,input$var2)]
            
            ggplot(data,aes_string(y='Fuel.Economy',x=input$var1, color=input$var2)) + 
                geom_point(size=3, position = 'jitter') + 
                scale_colour_gradient(low="green",high='purple') +
                ylab("Fuel Economy (mpg)") + 
                theme(
                    axis.text = element_text(size=14),
                    axis.title = element_text(size=16),
                    legend.text = element_text(size=14),
                    legend.title = element_text(size=16))
            
        }
        #Both inputs are factors
        else if (is.factor(data[,which(names(data)==input$var1)]) & 
                     is.factor(data[,which(names(data)==input$var2)])) {
            plotData <- ddply(data,c(input$var1,input$var2), summarize, Fuel.Economy = mean(Fuel.Economy))
            
            ggplot(plotData,aes_string(y='Fuel.Economy',x=input$var1, fill=input$var2)) + 
                geom_bar(stat='identity', position='dodge') +
                scale_colour_brewer(palette="Set2") +
                ylab("Fuel Economy (mpg)") + 
                theme(
                    axis.text = element_text(size=14),
                    axis.title = element_text(size=16),
                    legend.text = element_text(size=14),
                    legend.title = element_text(size=16))

        }
        else {
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
                scale_colour_brewer(palette="Set1") +
                ylab("Fuel Economy (mpg)") + 
                theme(
                    axis.text = element_text(size=14),
                    axis.title = element_text(size=16),
                    legend.text = element_text(size=14),
                    legend.title = element_text(size=16))
    
        }
    }) #end renderPlot
    
    output$summary <- renderPrint({
        model <- lm(as.formula(paste('Fuel.Economy ~', input$var1,'*',input$var2)), data = data)
        summary(model)        
    }) # end renderPrint
 }
)

