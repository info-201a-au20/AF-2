# Loading needed data frame
data_result <- read.csv("data/winning_Odds.csv", stringsAsFactors = FALSE)

# Loading library needed
library(dplyr)
library(ggplot2)
library(plotly)
library(scales)

# Function that returns a side-by-side bar chart for visualization
chart_three <- function(data) {
  data$Biden.Votes <- as.numeric(gsub(",", "", data$Biden.Votes))
  data$Trump.Votes <- as.numeric(gsub(",", "", data$Trump.Votes))
  filtered_df <- data %>%
    rename(Biden = Biden.Votes, Trump = Trump.Votes) %>%
    select(State, Biden, Trump) %>%
    filter(State == "CA" | State == "NY" | State == "KY"
           | State == "WY" | State == "D.C."
           | State == "ME" | State == "UT" | State == "NH")
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