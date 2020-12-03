# Loading needed data frame
data_race <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)

# Loading library needed
library("dplyr")
library("ggplot2")
library("plotly")
library("reshape2")

# Function that returns a stacked bar chart for visualization
chart_one <- function(data) {
  filtered_df <- data %>%
    select(Location, Asian, Hispanic, White, Black) %>%
    mutate(Other = 1 - (Asian + Hispanic + White + Black)) %>%
    filter(Location == "California" | Location == "New York"
           | Location == "Kentucky" | Location == "Wyoming")
  long <- melt(filtered_df, id = c("Location")) %>%
    rename(race = variable, percentage = value)
  long$percentage <- long$percentage * 100
  bar_graph <- ggplot(long, aes(x = Location, y = percentage, fill = race)) +
    geom_bar(stat = "identity") +
    scale_fill_brewer(palette = "Accent") +
    labs(title = "Race Distribution in Different States",
         y = "Percentage (%)")
  chart <- ggplotly(bar_graph)
  return(chart)
}