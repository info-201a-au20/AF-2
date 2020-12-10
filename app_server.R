library(dplyr)
library(shiny)
library(ggplot2)
library(plotly)
library(reshape2)
library(ECharts2Shiny)
library(stringr)

source("scripts/race_chart.R")
source("scripts/election_chart.R")

data_race <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)
data_elect <- read.csv("data/winning_Odds.csv", stringsAsFactors = FALSE)


server <- function(input, output) {
  # Page 1
  output$bar_race <- renderPlotly({
     return(chart_race(data_race, input$Location1, input$ Location2,
                      input$Location3, input$Location4))
  }) 
  
  output$bar_election <- renderPlotly({
    return(chart_election(data_elect, input$State1, input$State2,
                          input$State3, input$State4))
  })
}