setwd("C:/Users/zheng/intersession_data_2024/code/coding_day6")

install.packages("tidyverse")
install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

View(flights)
print(flights, width = Inf)
glimpse(flights)

flights1 <- filter(flights, dest== "IAH")
flights2 <- group_by(flights1, year, month, day)

###pipe###
# takes the thing on its left and passes it along to the function on its right
# Ctrl + Shift + M

group_by(filter(flights, dest=="IAH"), year, month, day)
flights %>% filter(dest=="IAH") %>% group_by(year, month, day)

# find all flights that departed more than 120 minutes (two hours) late
delayed_flights <- flights %>%
  filter(dep_delay > 120)

# Flights that departed on January 1
flights %>% 
  filter(month == 1 & day == 1)

##### arrange() #####
flights %>% 
  arrange(year, month, day, dep_time)






