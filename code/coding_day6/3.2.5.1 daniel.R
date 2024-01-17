getwd()
setwd("C:/Users/陈星怿/intersession_data_2024/code/coding_day6")

library(nycflights13)
library(tidyverse)

#3.2.5.1
glimpse(flights)
condition1 <- flights %>%
  filter(arr_delay >= 120)

condition2 <- flights %>%
  filter(dest %in% c("IAH", "HOU"))
  
condition3 <- flights %>%
  filter(carrier %in% c("UA", "AA", "DL"))

condition4 <- flights %>%
  filter(month %in% c(7, 8, 9))

condition5 <- flights %>%
  filter(arr_delay > 120, dep_delay <= 0)

condition6 <- flights %>%
  filter(dep_delay >= 60, air_time - dep_delay > 30)

condition1
condition2
condition3
condition4
condition5
condition6
