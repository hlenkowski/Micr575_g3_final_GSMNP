library(dplyr)
library(tidyverse)
library(ggthemes)

#pulling tidied version of visiation data
visitation <- read.csv("output/clean_visit.csv")

#change Year to factor for graph color purpose

visitation <- visitation |>
  mutate(as.factor(Year)) |>
  filter(Year >2019)

#assigning year colors so graphs are easier to read
year_colors <- c("#ff4938","#008a25","#3d4ba6","#debb0d","#9b4ddb", "#c41670")

##########
#Q1) How does park visitation change throughout the year?
##########

month_order <- c("JAN","FEB","MAR","APR","MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")

Q1 <- ggplot(data=visitation, aes(x=factor(month, levels=month_order), y=attendance, group=Year, color=as.factor(Year))) +
  geom_line() +
  geom_point() +
  scale_color_manual(values=year_colors) +
  labs(, x = "Month", y = "Attendance", fill = "Year") 
plot(Q1)

########
#Q2) How has park visitation changed in the past 5 years?
########

#Yearly visitation counts from 2020-2025 by year
Q2A <- ggplot(data=visitation, aes(x=Year, y=AnnualTotal, fill=as.factor(Year))) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=year_colors) +
  labs(title = "Visitation per Year", x = "Year", y = "Attendance", fill = "Year")
plot(Q2A)

#How has visitation changed in the past 5 years in monthly visitation? 
Q2B <- ggplot(data=visitation, aes(x=factor(month, levels=month_order), y=attendance, fill=as.factor(Year))) +
  geom_bar(position="dodge", stat="identity") +
  scale_fill_manual(values=year_colors) +
  labs(title = "Monthly Visitation per Year", x = "Month", y = "Attendance", fill = "Year")
plot(Q2B)