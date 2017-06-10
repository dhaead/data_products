
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)





library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(data.table)
library(caret)
library(gbm)




#intrain<- createDataPartition(y=red$year, p=0.6,list=FALSE)
#training<-data.frame(red[intrain,])
#testing<-data.frame(red[-intrain,])
#dim(training)

#training<-training[complete.cases(training),]

red<-read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv")

red<-red[complete.cases(red),]


shinyUI(fluidPage(

  # Application title
  titlePanel("Beijing monthly pm2.5 levels"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Select a Year:",
                  min = 2010,
                  max = 2014,
                  value = 2010,step = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
