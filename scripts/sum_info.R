# Reading in dataframes
race_data <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE,
                      na.strings = FALSE)
turnout_2020_data <- read.csv("data/turnoutRates_2020.csv",
                              stringsAsFactors = FALSE, na.strings = FALSE)
age_data <- read.csv("data/demographics_age.csv", stringsAsFactors = FALSE,
                     na.strings = FALSE)

# Getting summary info for age of population distribution
age_sum_info <- function(d_frame) {
  sum_list <- list()
  sum_list$state_young_pop <- d_frame[d_frame$Adults.19.25 ==
                                         max(d_frame$Adults.19.25), "Location"]
  sum_list$state_old_pop <- d_frame[d_frame$X65. ==
                                       max(d_frame$X65.), "Location"]
  return(sum_list)
}

# Getting summary info for race of population distribution
race_sum_info <- function(da_frame) {
  r_sum_list <- list()
  r_sum_list$most_white_state <- da_frame[da_frame$White == max(da_frame$White),
                                          "Location"]
  r_sum_list$least_white_state <- da_frame[da_frame$White == 
                                             min(da_frame$White), "Location"]
  r_sum_list$largest_black_pop <- da_frame[da_frame$Black == 
                                             max(da_frame$Black), "Location"]
  return(r_sum_list)
}

