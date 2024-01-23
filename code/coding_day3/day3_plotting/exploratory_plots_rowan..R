##### SETUP #####
getwd()
setwd("/Users/17739/intersession_data_2024/code/day3_plotting")
getwd()
library(datasets)
install.packages("viridis")
library(viridisLite)
library(viridis)

### DATA ###
data("iris")
#imports data named iris

class(iris)
#should show up as "data.frame"
dim(iris)
# rows first columns second

head(iris)
# prints the table

table(iris$Species)
#$ outputs a certain column, can also do this with numbers
table(iris[,5])
table(iris[,"Species"])
#^^should output the exact same thing

### PLOTTING: relationships between diff variables ###
##relationship btwn sepal length and sepal width##
plot(iris$Sepal.Length, iris$Sepal.Width)
plot(iris[,c(1,2)])
#should have the same plot using this notation
#benefit of brackets is the axis labels look better

# png('iris_sepal.png', width = 520, height = 520)
plot(iris[,c(1,2)], pch = 16, cex = 0.75, col = "red",
     xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)",
     main = "Iris Sepal Characteristics")
#cex changes dot size, col changes color, pch changes plot char aka shape of dots
#xlab is x label, ylab is y label, main is title of plot
# dev.off()

plot(iris$Petal.Length, iris$Petal.Width, pch = 16, cex = 0.75, col = "blue",
     xlab = "Petal Length (cm)", ylab = "Petal Width (cm)",
     main = "Iris Petal Characteristics")

#plot graphs side by side, run below together
par(mfrow = c(1,2))
plot(iris[,c(1,2)], pch = 16, cex = 0.75, col = "red",
     xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)",
     main = "Iris Sepal Characteristics")
plot(iris$Petal.Length, iris$Petal.Width, pch = 16, cex = 0.75, col = "blue",
     xlab = "Petal Length (cm)", ylab = "Petal Width (cm)",
     main = "Iris Petal Characteristics")

### Color by Species ###
col.species.unique <- viridis::viridis(3)

par(mfrow = c(1,1))
plot(iris[,c(1,2)], pch = 16, cex = 0.75, col = col.species.unique,
     xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)",
     main = "Iris Sepal Characteristics")

col.species <- col.species.unique[as.factor(iris$Species)]
head(as.factor(iris$Species))
head(as.numeric(as.factor(iris$Species)))
tail(as.numeric(as.factor(iris$Species)))

tail(col.species)

#Legend
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
