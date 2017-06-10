
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
red<-read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv")

red<-red[complete.cases(red),]




shinyServer(function(input, output) {

  

  
  
  output$distPlot <- renderPlot({

    
    
    teh<-subset(red,year==input$bins)
    
    
    x <- teh[,3]#training[,2]
    
    y <- teh[,-2]$pm2.5#training[,-2]$pm2.5
    
    ggplot(teh,aes(x,y))+geom_point()
    
  })

})
