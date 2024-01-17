#### SETUP ####
getwd()
setwd('/Users/kalenclifton/intersession_data_2024/code/coding_day4/')
library(datasets)
library(viridis)

#install.packages('ggplot2')
library(ggplot2)
#install.packages('gridExtra')
library(gridExtra)
data("mpg")

#### DATA ####
class(mpg)
dim(mpg)
head(mpg)
summary(mpg)

#### PLOTTING ####

## Code Template
# plt <- ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>)) +
#  labs(title = <"TITLE">, x= <"X AXIS LABEL">, y= <"Y AXIS LABEL"> )

#Example

## plot scatter plot with 
## cty and hwy encoded as positions on x and y axis 
## and drv encoded as shape

ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, shape=drv), size=1, color='blue')  +
  labs(title = "Vehicle mpg and drive", x= "mpg in the city", y= "mpg on the highway", shape="type of drive" ) +
  theme_classic()

## plot histogram
## cty as position on x axis 
## set breaks of histogram starting at 0, ending at 35, every 5th number
ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty), breaks = seq(0,35,5)) +
  labs(title = "Histogram", x= "mpg in the city", y= "count" )

## plot scatter plot with 
## cty and hwy encoded as positions on x and y axis 
## and quantitative variable cyl encoded as color/hue

p1 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color=cyl)) +
  scale_color_viridis() +
  labs(title = "Vehicle mpg and engine type", x= "mpg in the city", y= "mpg on the highway", color="# of cylinders" )

## plot scatter plot with 
## cty and hwy encoded as positions on x and y axis 
## and categorical variable class encoded as color/hue

p2 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color=class)) +
  scale_color_viridis(discrete = TRUE, option = "plasma") + 
  labs(title = "Vehicle mpg and engine type", x= "mpg in the city", y= "mpg on the highway", color="# of cylinders" )

## multi-panel visualizations
grid.arrange(p1, p2, ncol=2, nrow = 1)

## save figure
png('vehicle_characteristics.png', width=10, height=5,res=400,units="in") ## save figure
grid.arrange(p1, p2, ncol=2, nrow = 1)
dev.off()






