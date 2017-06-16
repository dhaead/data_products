
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
    #teh<-subset(red,year=="2010")
    
    
    x <- teh[,3]#training[,2]
    x<-month.name[as.factor(x)]
    
    
    y <- teh[,-2]$pm2.5#training[,-2]$pm2.5
    
    
    g<-ggplot(teh, aes(x, y)) + geom_boxplot()
    g<-g+labs(title = "PM 2.5 Counts by Month") + ylab("PM 2.5 Counts") + xlab("Month")
    g<-g+ theme(axis.text.x = element_text(face="bold", color="black", 
                                       size=11, angle=45),
            axis.text.y = element_text(face="bold", color="black", 
                                       size=11, angle=45))
    g
    
    
  })

  
  
  
  output$this<-renderTable({ 
    
    teh<-subset(red,year==input$bins)
    #teh<-subset(red,year=="2010")
    
    x <- teh[,3]#training[,2]
    x<-month.name[as.factor(x)]
    
    
    y <- teh[,-2]$pm2.5#training[,-2]$pm2.5
    
    paste("the mean for that year is",mean(y))
    
    
    })
  
  
})

