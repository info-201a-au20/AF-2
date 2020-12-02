library("dplyr")

data_2016 <- read.csv("data/turnoutRates_2016.csv", stringsAsFactors = FALSE)
data_2020 <- read.csv("data/turnoutRates_2020.csv", stringsAsFactors = FALSE)
age_data <- read.csv("data/demographics_age.csv", stringsAsFactors = FALSE)
race_data <- read.csv("data/demographics_race.csv", stringsAsFactors = FALSE)
