#Comparing weather and visitation

library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)
weather <- read_csv("output/weather.csv")
visitation <- read_csv("output/clean_visit.csv")

View(visitation)
View(weather)

#join data 
weather_visit <- left_join(weather, visitation, by = "date")
View(weather_visit)

#rearrange months
custom_order <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG","SEP", "OCT", "NOV", "DEC")
weather_visit$month <- factor(weather_visit$month, levels = custom_order)

#Write csv
write_csv(weather_visit, "output/weather_visit.csv")

##Question 3: How do trends in park attendance compare to weather?

ggplot(weather_visit, aes(x = month, y = attendance)) +                
  # Shading based on temperature (color) and size based on precip
  geom_point(aes(color = mean_temp, size = precip), alpha = 0.7) +
  # Formatting
  scale_color_viridis_c(option = "plasma") + # Good color scale for temp
  labs(title = "Monthly Visitation Analysis",
       x = "Month",
       y = "Visitation Count",
       color = "Temp (C)",
       size = "Precip (mm)") +
  theme_minimal() +                
  theme(strip.text = element_text(face="bold", size=12))
  
