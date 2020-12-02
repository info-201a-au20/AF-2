library(dplyr)

pop_race <- read.csv("Project-Midpoint/data/demographics_by_race.csv")
sum_info <- function(d_frame) {
  info <- list()
  info$length <- length(d_frame)
  info$max <- max(d_frame$Biden Votes)
}