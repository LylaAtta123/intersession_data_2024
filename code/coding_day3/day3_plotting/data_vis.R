getwd()
library(datasets)
library(viridisLite)
library(viridis)

data("faithful")

class(faithful)
dim(faithful)
table(faithful)
head(faithful)

#Scatterplot
plot(faithful$eruptions, faithful$waiting)
plot(faithful, pch = 1, cex = 0.75, col = "darkgreen",
     xlab = "Eruption time (min)", ylab = "Waiting Time (min)",
     main = "Old Faithful Geyser Data")

#Lines
lines(lowess(faithful$eruptions, faithful$waiting, f = 3, iter = 2),
      col = "red")
lines(lowess(faithful$eruptions, faithful$waiting, f = 2/3, iter = 3),
      col = "purple")

#Legend
legend(x = "topleft", legend = c("Line 1", "Line 2"), 
       col = c("red","purple"), pch = 16)

dev.off()
