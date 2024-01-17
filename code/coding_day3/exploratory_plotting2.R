###SETUP###
getwd()
setwd("/Users/mehulibasuroy/github/intersession_data_2024/code/coding_day3")
library(datasets)
library(viridisLite)

###DATA###
data("pressure")
head(pressure)
dim(pressure)
class(pressure)

###PLOTTING###
png("Pressure vs Temperature for Hg", width = 1000, height = 580)
plot(pressure$temperature, pressure$pressure, pch = 16, cex = 1.25, col = "orange",
     xlab = "Temperature", ylab = "Pressure", 
     main = "Vapor Pressure of Mercury as a Function of Temperature")
dev.off()
