#### SETUP ####
getwd()
library(datasets)
library(viridis)

#install.packages('ggplot2')
library(ggplot2)
#install.packages('gridExtra')
library(gridExtra)

data("ChickWeight")

#### DATA ####
class(ChickWeight)
dim(ChickWeight)
head(ChickWeight)

?scale_color_viridis
### PLOTTING ### 
 plt1 <- ggplot(data = ChickWeight) + 
  geom_point(mapping = aes( x = Time, y = weight, color = Diet)) +
   scale_color_viridis(discrete = TRUE, option = "turbo") + 
  labs(title = "Chick Weight based on Diet", x= "Time", y= "Chick Weight", color = "Diet") + theme_classic()
 
 plt1
 
 plt2 <- ggplot(data = ChickWeight) + 
   geom_point(mapping = aes( x = Time, y = weight, color = Chick)) +
   scale_color_viridis(discrete = TRUE, option = "mako") + 
   labs(title = "Chick Weight based on Diet", x= "Time", y= "Chick Weight", color = "Chick") + theme_classic()

 plt2
 
 
 plt3 <- ggplot(data = ChickWeight) + 
   geom_point(mapping = aes( x = Chick, y = weight, color = Diet)) +
   scale_color_viridis(discrete = TRUE, option = "plasma") + 
   labs(title = "Chick Weight based on Diet", x= "Chick", y= "Chick Weight", color = "Chick") + theme_classic()
 
 plt3
 
 #a line that signifies average would be helpful here 
 
 grid.arrange(plt1,plt2, ncol = 2, nrow = 1)
