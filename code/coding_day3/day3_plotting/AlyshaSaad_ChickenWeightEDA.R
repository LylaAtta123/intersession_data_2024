### SETUP ###
setwd("/Users/alyshasaad-berreta/Desktop/GitHub/Data-Analysis-Intersession-2023/code/day3_plotting")
library(datasets)
library(ggplot2)

### DATA ###
data("chickwts")
class(chickwts)
dim(chickwts)
head(chickwts)

table(chickwts$feed)

### PLOTTING ###
plot(chickwts$weight, chickwts$feed =='casein', pch = 16, cex = 0.75, col = "blue",
     xlab = "Casein Feed", ylab = "Chicken Weight (grams)",
     main = "Casein Feed vs Chicken Weight")

plot(chickwts$weight, chickwts$feed == 'horsebean', pch = 16, cex = 0.75, col = "blue",
     xlab = "Horsebean Feed", ylab = "Chicken Weight (grams)",
     main = "Horsebean Feed vs Chicken Weight")

plot(chickwts$weight, chickwts$feed == 'meatmeal', pch = 16, cex = 0.75, col = "blue",
     xlab = "Meatmeal Feed", ylab = "Chicken Weight (grams)",
     main = "Meatmeal Feed vs Chicken Weight")

plot(chickwts$weight, chickwts$feed == 'soybean', pch = 16, cex = 0.75, col = "blue",
     xlab = "Soybean Feed", ylab = "Chicken Weight (grams)",
     main = "Soybean Feed vs Chicken Weight")

plot(chickwts$weight, chickwts$feed == 'sunflower', pch = 16, cex = 0.75, col = "blue",
     xlab = "Sunflower Feed", ylab = "Chicken Weight (grams)",
     main = "Sunflower Feed vs Chicken Weight")

col.species.unique <- viridis::viridis(3)
plot(chickwts$weight, chickwts$feed, pch = 16, cex = 0.75, col = col.species.unique,
     xlab = "Feed", ylab = "Chicken Weight (grams)",
     main = "Feed vs Chicken Weight")

col.species.unique <- viridis::viridis(6)
ggplot(chickwts, aes(x = weight, y = feed, color = feed)) +
  geom_point(aes(color = feed), size = 3) +
  scale_color_manual(values = col.species.unique) +
  labs(
    x = "Chicken Weight (grams)",
    y = "Feed",
    title = "Feed vs Chicken Weight" ,
    caption = "Figure One: Comparison between various feed types and the corresponding 
    weights of the chickens eating the specified feed, where each color represents a 
    different type of chicken feed. On average, chickens that ate horsebean or linseed 
    feed had lower weights than the chickens that ate another type
    of feed." 
  ) +
  guides(color = guide_legend(title = "Feed"))

col.species.unique <- viridis::viridis(6)
ggplot(chickwts, aes(x = feed, y = weight, color = feed)) +
  geom_point(aes(color = feed), size = 3) +
  scale_color_manual(values = col.species.unique) +
  labs(
    x = "Feed",
    y = "Chicken Weight (grams)",
    title = "Feed vs Chicken Weight",
    caption = "Figure One: Comparison between various feed types and the corresponding 
    weights of the chickens eating the specified feed, where each color represents a 
    different type of chicken feed. On average, chickens that ate horsebean or linseed 
    feed had lower weights than the chickens that ate another type
    of feed."
  )
guides(color = guide_legend(title = "Feed"))
