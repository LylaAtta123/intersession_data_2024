## DATA ## 
# Load iris dataset using data(iris)
getwd() 
setwd('/Users/iriskwon/Documents/GitHub/intersession_data_2024/code/day3_plotting')
library(datasets) # loads the datasets package 
library(viridis)
class(iris)


## Exploratory Data Visualization ##
# Histogram
hist(iris$Sepal.Length, breaks = 30) # breaks = # of bins

# viridis color for each unique species 
col.species.unique <- viridis:: viridis(length(unique(iris$Species)))
names(col.species.unique) <- unique(iris$Species)
col.species.unique

# Scatterplot
png('iris_characteristics.png', width = 1000, height = 580) ## save figure 

par(mfrow = c(1,2))
plot(iris$Sepal.Length, iris$Sepal.Width, 
     pch = 16, cex = 1.5, col = col.species, 
     main = 'Iris Sepal Characteristics', 
     xlab = 'Sepal Length (cm)', ylab = 'Sepal Width (cm)')
plot(iris$Sepal.Length, iris$Sepal.Width, 
     pch = 16, cex = 1.5, col = col.species.unique, 
     main = 'Iris Petal Characteristics', 
     xlab = 'Sepal Length (cm)', ylab = 'Sepal Width (cm)')
# add legend for color to second plot
legend(x = 1, y = 2.5, 
       legend = names(col.species.unique), 
       col = col.species.unique, pch = 16)

dev.off()
