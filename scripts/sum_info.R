library(dplyr)
race_data <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE, 
                      na.strings = FALSE)
turnout_2020_data <- read.csv("data/turnoutRates_2020.csv", 
                              stringsAsFactors = FALSE, na.strings = FALSE)
age_data <- read.csv("data/demographics_age.csv", stringsAsFactors = FALSE,
                     na.strings = FALSE)

# Getting summary info for age of population distribution
age_sum_info <- function(d_frame) {
  sum_list <- list()
  sum_list$state_young_voters <- d_frame[d_frame$Adults.19.25 ==
                                         max(d_frame$Adults.19.25), "Location"]
  sum_list$state_old_voters <- d_frame[d_frame$X65. ==
                                       max(d_frame$X65.), "Location"]
  return(sum_list)
}

# Getting summary info for race of population distribution
race_sum_info <- function(d_frame) {
  r_sum_list <- list()
  r_sum_list$
}