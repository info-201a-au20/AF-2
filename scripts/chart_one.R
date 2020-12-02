data <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)
library("dplyr")
library("ggplot2")
library("plotly")
library("reshape2")

chart_one <- function(data) {
  filtered_df <- data %>%
    select(Location, Asian, Hispanic, White, Black) %>%
    mutate(Other = 1 - (Asian + Hispanic + White + Black)) %>% 
    filter(Location == "California" | Location == "New York"
           | Location == "Kentucky" | Location == "Wyoming")
  long <- melt(filtered_df, id = c("Location"))
  ggplot(long, aes(x = Location, y = value, fill = variable)) +
    geom_bar(stat = "identity") +
    labs(title = "Race Distribution in Different States",
         y = "Ratio")
}