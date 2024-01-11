#### Setup ####
getwd() # get working directory
setwd("/Users/kris/GitHub/intersession_datav_2024/code")

# install.packages("viridis")

library(datasets) # this line loads the 
library(viridis) # this line loads the viridis library

### Data ###
data('PlantGrowth') # load "Plantgrowth" to the environment
class(PlantGrowth) # checking the class of "iris"
head(PlantGrowth) # gets the first 6 entry of the dataset

### Plotting ###
par(mfrow = c(1,1))
col.groups.unique <- viridis::viridis(length(unique(PlantGrowth$group)))
names(col.groups.unique) <- unique(PlantGrowth$group)



png("PlantGrowth.png", width = 520, height = 520)
plot(PlantGrowth$group, PlantGrowth$weight, col = col.groups.unique, 
     xlab = "Groups", ylab = "Weight", main = "Plant Growth")

legend("bottomleft", 
       legend = names(col.groups.unique), col = col.groups.unique, pch = 16)
 
dev.off() # close the current file
