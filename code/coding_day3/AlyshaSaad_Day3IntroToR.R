### SETUP ###
setwd("/Users/alyshasaad-berreta/Desktop")
install.packages("viridis")
library(datasets)
library(viridis)

### DATA ###

data("iris")

class(iris)
dim(iris)
head(iris)

table(iris$Species)
table(iris[,5])
table(iris[,"Species"])

### PLOTTING ###
# png("iris_sepal.png", width = 520, height = 520)

# Plotting side-by-side: 
par(mfrow = c(1, 2))
plot(iris$Sepal.Length, iris$Sepal.Width, pch = 16, cex = 0.75, col = "blue",
     xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)",
     main = "Iris Sepal Characteristics")
plot(iris$Petal.Length, iris$Petal.Width, pch = 16, 
     cex = 0.75, col = "blue", xlab = "Petal Length (cm)", 
     ylab = "Petal Width (cm)", main = "Iris Petal Characteristics")

# Color by Species: 
col.species.unique <- viridis::viridis(3)
par(mfrow = c(1, 1))
plot(iris$Petal.Length, iris$Petal.Width, pch = 16, 
     cex = 0.75, col = col.species.unique, xlab = "Petal Length (cm)", 
     ylab = "Petal Width (cm)", main = "Iris Petal Characteristics")

col.species <- col.species.unique[as.factor(iris$Species)]
head(as.factor(iris$Species))
head(as.numeric(as.factor(iris$Species)))
