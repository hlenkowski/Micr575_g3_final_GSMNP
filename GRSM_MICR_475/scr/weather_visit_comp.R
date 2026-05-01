#Comparing weather and visitation

library(readr)
library(tidyverse)
library(dplyr)
weather <- read_csv("output/weather.csv")
visitation <- read_csv("output/clean_visit.csv")

View(visitation)
View(weather)

#join data 
weather_visit <- left_join(weather, visitation, by = "month")
View(weather_visit)

write_csv(weather_visit, "output/weather_visit.csv")

##Question 3: 


  