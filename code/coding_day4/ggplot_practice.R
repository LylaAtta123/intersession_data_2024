#### SETUP ####
getwd()
setwd('C:/Users/陈星怿/intersession_data_2024/code/coding_day4')
library(datasets)
library(viridis)
library(viridisLite)
library(ggplot2)
library(gridExtra)

table(Loblolly)

data("Loblolly")
plt <- ggplot(data = Loblolly) + geom_histogram(mapping = aes(x=age), breaks = seq(from = 0, to =35, by=1))
plt