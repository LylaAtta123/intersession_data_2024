#### Setup ####
getwd() # get working directory
setwd("/Users/kris/GitHub/intersession_datav_2024/code")

install.packages("viridis")

library(datasets) # this line loads the 
library(viridis) # this line loads the viridis library

#### Data ####
data('iris') # load "iris" to the environment

class(iris) # checking the class of "iris"

head(iris) # gets the first 6 entry of the dataset

# tabulate different species
table(iris$Species)
table(iris[,5])
table(iris[,"Species"])

#### Plot ####
## relationship w/ length and width
# plot(iris$Sepal.Length, iris$Sepal.Width)

# png("iris_sepal.png", width = 520, height = 520)
plot(iris[,c(1,2)], pch = 16, cex = 0.75, col = "magenta", bty = "n", 
     xlab = "Sepal Length(cm)", ylab = "Sepal Width (cm)", main = "Iris Sepal Characters")
# dev.off() # close the current file

plot(iris$Petal.Length, iris$Petal.Width, pch = 16, cex = 0.75, col = "blue", bty = "n", 
     xlab = "Petal Length(cm)", ylab = "Petal Width (cm)", main = "Iris Petal Characters")


# plot two diagrams side-by-side
par(mfrow = c(1,2))
plot(iris[,c(1,2)], pch = 16, cex = 0.75, col = "magenta", bty = "n", 
     xlab = "Sepal Length(cm)", ylab = "Sepal Width (cm)", main = "Iris Sepal Characters")

plot(iris$Petal.Length, iris$Petal.Width, pch = 16, cex = 0.75, col = "blue", bty = "n", 
     xlab = "Petal Length(cm)", ylab = "Petal Width (cm)", main = "Iris Petal Characters")

# colour by species
col.species.unique <- viridis::viridis(3)
col.species <- col.species.unique[as.factor(iris$Species)]

png('iris_species.png', width = 1000, height = 520 )
par(mfrow = c(1,2))
plot(iris[,c(1,2)], pch = 16, cex = 0.75, col = col.species.unique, bty = "n", 
     xlab = "Sepal Length(cm)", ylab = "Sepal Width (cm)", main = "Iris Sepal Characters")

plot(iris$Petal.Length, iris$Petal.Width, pch = 16, cex = 0.75, col = col.species.unique, bty = "n", 
     xlab = "Petal Length(cm)", ylab = "Petal Width (cm)", main = "Iris Petal Characters")
dev.off()


