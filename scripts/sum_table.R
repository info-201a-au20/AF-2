# Loading library needed
library("dplyr")

# Loading needed data frame
age_data_table <- read.csv("data/demographics_age.csv",
                           stringsAsFactors = FALSE,
                           na.strings = FALSE)

sum_table_age <- function(data_fr) {
  sum_race_table <- data_fr %>%
    group_by(Location) %>%
    mutate(eligible_voters = 1 - Children.0.18) %>%
    arrange(-eligible_voters) %>%
    select(Location, eligible_voters)
    eligible_voters_kable <- kable(sum_race_table,
                                   col.names = c("Location",
                                                 "# of Eligible Voters"),
                                   align = "l")
    return(eligible_voters_kable)
}