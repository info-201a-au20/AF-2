library("dplyr")
library("ggplot2")
library("plotly")
library("reshape2")

data_race <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)

chart_race <- function(data, location1, location2, location3, location4) {
  filtered_data <- data_race %>%
    select(Location, Asian, Hispanic, White, Black) %>%
    mutate(Other = 1 - (Asian + Hispanic + White + Black)) %>%
    filter(Location == location1 | Location == location2
           | Location == location3 | Location == location4)
  long <- melt(filtered_data, id = c("Location")) %>%
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