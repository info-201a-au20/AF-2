library("dplyr")
source("./scripts/sum_info.R")


summary_info <- age_sum_info(age_data)
summary_race <- race_sum_info(race_data)

d_frame <- data.frame(summary_info, summary_race)

most_white_state <- pull(d_frame,most_white_state)
least_white_state <- pull(d_frame,least_white_state)
state_with_old_pop <- pull(d_frame,state_old_pop)
state_with_young_pop <- pull(d_frame, state_young_pop)
most_black_pop_state <- pull(d_frame, largest_black_pop)
