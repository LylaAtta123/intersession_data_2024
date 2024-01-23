#### SETUP ####
getwd()
setwd('/Users/lylaatta/Documents/GitHub/intersession_data_2024/code/day3_plotting/lyla_demo_iris/')
library(datasets)
library(viridis)

data("iris")

#### DATA ####
class(iris)
dim(iris)
head(iris)
summary(iris)

#### PLOTTING ####

## plot histogram of Sepal Lengths
par(mfrow = c(1,1))
hist(iris$Sepal.Length, breaks = 30, 
     main = 'Iris Flower Sepal Lengths', xlab = 'Sepal Length (cm)', ylab = 'Count')

## plot Sepal Width vs Length
plot(iris$Sepal.Length, iris$Sepal.Width, pch = 16, cex = 1.5, col = 'blue')

## plot sepal and petal characteristics side by side
par(mfrow = c(1,2))
plot(iris$Sepal.Length, iris$Sepal.Width, 
     pch = 16, cex = 1.5, col = 'blue',
     main = 'Iris Sepal Characteristics', 
     xlab = 'Sepal Length (cm)', ylab = 'Sepal Width (cm)')
plot(iris$Petal.Length, iris$Petal.Width, 
     pch = 16, cex = 1.5, col = 'blue',
     main = 'Iris Petal Characteristics', 
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)')


## color by species and make color legend 
#viridis color for each unique species
col.species.unique <- viridis::viridis(length(unique(iris$Species)))
names(col.species.unique) <- unique(iris$Species)

#make species color character vector in same order as species in data 
col.idx <- match(iris$Species, names(col.species.unique))
col.species <- col.species.unique[col.idx]

png('iris_characteristics.png', width = 1000, height = 580) ## save figure

par(mfrow = c(1,2))
plot(iris$Sepal.Length, iris$Sepal.Width, 
     pch = 16, cex = 1.5, col = col.species,
     main = 'Iris Sepal Characteristics', 
     xlab = 'Sepal Length (cm)', ylab = 'Sepal Width (cm)')
plot(iris$Petal.Length, iris$Petal.Width, 
     pch = 16, cex = 1.5, col = col.species,
     main = 'Iris Petal Characteristics', 
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)')
## add legend to second plot
legend(x = 1, y = 2.5, 
       legend = names(col.species.unique),
       col = col.species.unique, pch = 16)
dev.off()


