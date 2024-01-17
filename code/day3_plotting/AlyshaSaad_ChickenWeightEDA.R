### SETUP ###
setwd("/Users/alyshasaad-berreta/Desktop")
library(datasets)

### DATA ###
data("chickwts")
class(chickwts)
dim(chickwts)
head(chickwts)

table(chickwts$feed)

### PLOTTING ###
par(mfrow = c(1, 2))
plot(chickwts$weight, chickwts$feed =='casein', pch = 16, cex = 0.75, col = "blue",
     xlab = "Casein Feed", ylab = "Chicken Weight (grams)",
     main = "Casein Feed vs Chicken Weight")
plot(chickwts$weight, chickwts$feed == 'horsebean', pch = 16, cex = 0.75, col = "blue",
     xlab = "Horsebean Feed", ylab = "Chicken Weight (grams)",
     main = "Horsebean Feed vs Chicken Weight")

par(mfrow = c(1, 2))
plot(chickwts$weight, chickwts$feed == 'meatmeal', pch = 16, cex = 0.75, col = "blue",
     xlab = "Meatmeal Feed", ylab = "Chicken Weight (grams)",
     main = "Meatmeal Feed vs Chicken Weight")
plot(chickwts$weight, chickwts$feed == 'soybean', pch = 16, cex = 0.75, col = "blue",
     xlab = "Soybean Feed", ylab = "Chicken Weight (grams)",
     main = "Soybean Feed vs Chicken Weight")

par(mfrow = c(1, 1))
plot(chickwts$weight, chickwts$feed == 'sunflower', pch = 16, cex = 0.75, col = "blue",
     xlab = "Sunflower Feed", ylab = "Chicken Weight (grams)",
     main = "Sunflower Feed vs Chicken Weight")

col.species.unique <- viridis::viridis(3)
plot(chickwts$weight, chickwts$feed, pch = 16, cex = 0.75, col = col.species.unique,
     xlab = "Feed", ylab = "Chicken Weight (grams)",
     main = "Feed vs Chicken Weight")