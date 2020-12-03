data <- read.csv("data/demographics_age.csv", stringsAsFactors = FALSE)
library("dplyr")
library("ggplot2")
library("plotly")

chart_two <- function(data) {
  filtered_df <- data %>%
    rename(Adults.over.65 = X65.) %>%
    select(Location, Children.0.18, Adults.19.25, Adults.26.34, Adults.35.54,
           Adults.55.64, Adults.over.65) %>%
    filter(Location == "Utah" | Location == "Maine"
           | Location == "New Hampshire" | Location == "District of Columbia")
  long <- melt(filtered_df, id = c("Location")) %>%
    rename(Age = variable, percentage = value)
  long$percentage <- long$percentage * 100
  pie_graph <- ggplot(long, aes(x = "Utah", y = percentage, fill = Age)) +
    geom_bar(stat = "identity", width = 1, color = "White") +
    scale_fill_brewer(palette = "Set2") +
    coord_polar("y", start = 0) +
    facet_wrap(~Location) +
    theme_void() +
    geom_text(aes(label = percentage), position = position_stack(vjust = 0.5),
              color = "White") +
    labs(title = "Age Distribution in Different States")
  return(pie_graph)
}