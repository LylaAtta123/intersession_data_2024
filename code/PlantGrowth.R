#### Setup ####
getwd() # get working directory
setwd("/Users/kris/GitHub/intersession_datav_2024/code")

# install.packages("viridis")

library(datasets) # this line loads the 
library(viridis) # this line loads the viridis library

### Data ###
data('PlantGrowth') # load "iris" to the environment
class(PlantGrowth) # checking the class of "iris"
head(PlantGrowth) # gets the first 6 entry of the dataset

### Plotting ###
col.groups.unique <- viridis::viridis(3)
col.groups <- col.groups.unique[as.factor(iris$group)]

png("PlantGrowth.png", width = 520, height = 520)
plot(PlantGrowth$group, PlantGrowth$weight, col = col.groups.unique, xlab = "Groups", ylab = "Weight", main = "Plant Growth")
 
dev.off() # close the current file
