getwd() #working directory
setwd("C:/Users/a/Documents/R")

library(datasets)
install.packages("viridis")
library(viridis)

data("Indometh")
data("Nile")

summary(Indometh)
dim(Indometh)

table(Indometh$Subject)

plot(Indometh$time, Indometh$conc)
plot(Indometh[c(1:11),c(2,3)], pch = 16, cex = 0.75, col = 'blue',
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Time and Concentration")

col.species.unique <- viridis::viridis(length(unique(Indometh$Subject)))
col.species <- col.species.unique[Indometh$Subject]

par(mfrow = c(1,1))
plot(Indometh[,c(2,3)], pch = 16, cex = 0.75, col = col.species,
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Time vs Concentration")
names(col.species.unique) <- unique(Indometh$Subject)

legend (x=6, y=2.5,
        legend=names(col.species.unique),
        col=col.species.unique, pch = 16)

plot(Indometh[c(1:11),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[1],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 1")

  par(mfrow = c(2,3))
plot(Indometh[c(1:11),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[1],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 1")
plot(Indometh[c(12:22),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[2],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 2")
plot(Indometh[c(23:33),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[3],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 3")
plot(Indometh[c(34:44),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[4],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 4")
plot(Indometh[c(45:55),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[5],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 5")
plot(Indometh[c(56:66),c(2,3)], pch = 16, cex = 0.75, col = col.species.unique[6],
     xlab = "Time (hr)", ylab = "Concentration (mcg/ml)", 
     main = "Subject 6")



