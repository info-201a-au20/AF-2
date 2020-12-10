library(dplyr)
library(shiny)
library(ggplot2)
library(plotly)
library(reshape2)
library(ECharts2Shiny)
library(stringr)

source("scripts/race_chart.R")
source("scripts/election_chart.R")

data_age <- read.csv("data/demographics_age.csv", stringsAsFactors = FALSE)
data_race <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)
data_elect <- read.csv("data/winning_Odds.csv", stringsAsFactors = FALSE)
race_and_vote <- merge(data_race, data_elect, by = 1)
age_and_vote <- merge(age_data, data_elect, by = 1)

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
  # Page 4
  output$trump_white_table <- renderTable({
    trump_white_table <- function(data_fr) {
      trump_vote_table <- data_fr %>%
        group_by(Location) %>%
        arrange(desc(Trump.Odds), -White) %>%
        ungroup() %>%
        slice_head(n = 10) %>%
        select(Location, White, Trump.Odds)
      trump_voters_kable <- kable(trump_vote_table,
                                  col.names = c("Location",
                                                "White Populace",
                                                "Trump's Odds of Winning State"),
                                  align = "l")
      return(trump_voters_kable)
    }
    trump_white_table(race_and_vote)
  })
  output$trump_nonwhite_table <- renderTable({
    trump_nonwhite_table <- function(da_fr) {
      trump_nonwhite_vote <- da_fr %>%
        group_by(Location) %>%
        mutate(nonwhite_vote = 1 - White) %>%
        arrange(Trump.Odds, -nonwhite_vote) %>%
        ungroup() %>%
        slice_head(n = 10) %>%
        select(Location, nonwhite_vote, Trump.Odds)
      trump_nonwhite_kable <- kable(trump_nonwhite_vote,
                                    col.names = c("Location",
                                                  "Non-White Populace",
                                                  "Trump's Odds of Winning State"),
                                    align = "l")
      return(trump_nonwhite_kable)
    }
  })
  output$biden_age_table <- renderTable({
    biden_age_table <- function(dat_fr) {
      biden_age_vote <- dat_fr %>%
        group_by(Location) %>%
        arrange(desc(Biden.Odds), -Adults.19.25) %>%
        ungroup() %>%
        slice_head(n = 10) %>%
        select(Location, Adults.19.25, Biden.Odds)
      biden_age_kable <- kable(biden_age_vote,
                               col.names = c("Location",
                                             "Adults (19-25)",
                                             "Biden's Odds of Winning State"),
                               align = "l")
      return(biden_age_kable)
    }
  })
}
