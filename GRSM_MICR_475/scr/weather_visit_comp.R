#Comparing weather and visitation

library(readr)
library(tidyverse)
library(dplyr)
weather <- read_csv("output/weather.csv")
visitation <- read_csv("output/clean_visit.csv")

View(visitation)
View(weather)

#trying to make the csv files match
visit_match <- visitation |>
  select(-month)
View(visit_match)

weather_match <- weather |>
  mutate(month = ym(month)) |>
  rename(date = month)
View(weather_match)

weather_visit = full_join(visit_match, weather_match, by = "date")
###IMPORTANT: NEED TO UPDATE FILES BEFORE THIS WILL WORK
View(weather_visit)