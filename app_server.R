library(dplyr)
library(shiny)
library(ggplot2)
library(plotly)
library(reshape2)
library(stringr)

source("scripts/race_chart.R")
source("scripts/election_chart.R")

data_age <- read.csv("data/demographics_age.csv", stringsAsFactors = FALSE)
data_race <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)
data_elect <- read.csv("data/winning_Odds.csv", stringsAsFactors = FALSE)
race_and_vote <- merge(data_race, data_elect, by = 1)
age_and_vote <- merge(data_age, data_elect, by = 1)

server <- function(input, output) {
  ### Interaction Page 1
  output$bar_race <- renderPlotly({
     return(chart_race(data_race, input$Location1, input$ Location2,
                      input$Location3, input$Location4))
  }) 
  ### Interaction Page 2
  output$bar_election <- renderPlotly({
    return(chart_election(data_elect, input$State1, input$State2,
                          input$State3, input$State4))
  })
}