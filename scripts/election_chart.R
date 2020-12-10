library("dplyr")
library("ggplot2")
library("plotly")
library("reshape2")
library(scales)

data_elect <- read.csv("data/winning_Odds.csv", stringsAsFactors = FALSE)

chart_election <- function(data_election, state1, state2, state3, state4) {
  data_elect$Biden.Votes <- as.numeric(gsub(",", "", data_elect$Biden.Votes))
  data_elect$Trump.Votes <- as.numeric(gsub(",", "", data_elect$Trump.Votes))
  filtered_df <- data_elect %>%
    rename(Biden = Biden.Votes, Trump = Trump.Votes) %>%
    select(State, Biden, Trump) %>%
    filter(State == state1 | State == state2 | State == state3
           | State == state4)
  long <- melt(filtered_df, id = c("State")) %>%
    rename(Votes = variable)
  bar_garph <- ggplot(long, aes(x = State, y = value, fill = Votes)) +
    geom_bar(stat = "identity", color = "black", position = "dodge") +
    scale_fill_manual(values = c("blue", "red")) +
    theme_classic() +
    labs(title = "President Election 2020",
         y = "Number of Votes") +
    scale_y_continuous(labels = comma)
  chart <- ggplotly(bar_garph)
  return(chart)
}