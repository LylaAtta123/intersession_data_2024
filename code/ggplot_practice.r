#### Setup ####
getwd() # get working directory
setwd("/Users/kris/GitHub/intersession_datav_2024/code")

library(datasets)
library(viridis)
library(ggplot2) # load ggplot lib to envi.
library(gridExtra)

### Data ###
data('mpg') # load "mpg" to the environment
class(mpg) # checking the class of "mpg"
head(mpg) # gets the first 6 entry of the dataset
dim(mpg)
summary(mpg)

### Plotting ###
plt <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty,  y = hwy, shape = drv)) +
  labs(title = "mpg and drive" , x = "in city", y = "on hwy")

plt

## 
plt2 <- ggplot(data = mpg) + 
  geom_histogram(mapping = aes(x = cty), breaks = seq(from = 0, to =35, by = 5))

plt2

##
plt3 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x = cty, y = hwy, col = cyl)) +
  scale_color_viridis() +
  labs(title = "mpg by engine type")

plt3

##
plt4 <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty,  y = hwy, col = class)) +
  scale_color_viridis(discrete = TRUE, option = "plasma") +
  labs(title = "mpg and drive" , x = "in city", y = "on hwy")

plt4

# Printing multi plots on a single sheet
grid.arrange(plt3, plt4, ncol = 2, nrow = 1)

# saving printout
png('vehicle_characteristics.png', width = 10, height = 5, units = "in", res = 400)
grid.arrange(plt3, plt4, ncol=2, nrow=1)
dev.off()


