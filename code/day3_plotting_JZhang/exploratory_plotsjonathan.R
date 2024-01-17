#### SETUP ####
getwd()
setwd("C:/Users/jonat/intersession_data_2024/code/day3_plotting_JZhang")

library(datasets)
library(viridis)

#### DATA ####
data(USArrests)

class(USArrests)
dim(USArrests)
head(USArrests)

table(USArrests$Assault)
table(USArrests[,2])
table(USArrests[,"Assault"])

USArrests$Region <- c("South", "West", "West", "South", "West", "West", "Northeast", "South", "South", "South", "West", "West", "Midwest", "Midwest", "Midwest", "Midwest", "South", "South", "Northeast", "South", "Northeast", "Midwest", "Midwest", "South", "Midwest", "West", "Midwest", "West", "Northeast", "Northeast", "West", "Northeast", "South", "Midwest", "Midwest", "South", "West", "Northeast", "Northeast", "South", "Midwest", "South", "South", "West", "Northeast", "South", "West", "South", "Midwest", "South")
#### PLOTTING ####
#histogram
hist(USArrests$Murder, breaks = 15)
## relationship between murder and assault rates
plot(USArrests$Murder, USArrests$Assault)

# png('murder_rate.png',width = 520, height = 520)
plot(USArrests[,c(1,2)], pch = 16, cex = 0.75, col = 'red', 
     xlab = "Murder Rate (per 100k)", ylab = "Assault Rate (per 100k)", 
     main = "Crime Statistics in US States")
# dev.off()

plot(USArrests[,c(3,4)], pch = 16, cex = 0.75, col = 'red', 
     xlab = "% Urban Population", ylab = "Rape Rate (per 100k)", 
     main = "Other Crime Statistics in US States")

#plotting side by side
par(mfrow = c(1,2))
plot(USArrests[,c(1,2)], pch = 16, cex = 0.75, col = 'red', 
     xlab = "Murder Rate (per 100k)", ylab = "Assault Rate (per 100k)", 
     main = "Crime Statistics in US States")
plot(USArrests[,c(3,4)], pch = 16, cex = 0.75, col = 'red', 
     xlab = "% Urban Population", ylab = "Rape Rate (per 100k)", 
     main = "Other Crime Statistics in US States")
#color by region
col.region.unique <- viridis::viridis(length(unique(USArrests$Region)))
names(col.region.unique) <- unique(USArrests$Region)

col.idx <- match(USArrests$Region, names(col.region.unique))
col.region <- col.region.unique[col.idx]

#png('crime_regions.png',width = 1000, height = 520)
par(mfrow = c(1,2))
plot(USArrests[,c(1,2)], pch = 16, cex = 0.75, col = col.region, 
     xlab = "Murder Rate (per 100k)", ylab = "Assault Rate (per 100k)", 
     main = "Crime Statistics in US States")

plot(USArrests[,c(3,4)], pch = 16, cex = 0.75, col = col.region, 
     xlab = "% Urban Population", ylab = "Rape Rate (per 100k)", 
     main = "Other Crime Statistics in US States")
legend(x = "topleft", legend = unique(USArrests$Region), col = col.region.unique, pch = 16)

#dev.off()



