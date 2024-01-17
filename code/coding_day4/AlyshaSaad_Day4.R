#### SETUP ####
getwd()
setwd('/Users/alyshasaad-berreta/Desktop/GitHub/Data-Analysis-Intersession-2023')
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
plt <- ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, shape=drv)) +
  labs(title = "Vehicle mpg and drive", x= "mpg in city", y= "mpg on highway" )

## plot histogram
## cty as position on x axis
## set breaks of histogram starting at 0, ending at 35, every 5th number
plt2 <- ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty), breaks = seq(from=0, to=35, by=5))

## plot scatter plot with
## cty and hwy encoded as positions on x and y axis
## and quantitative variable cyl encoded as color/hue
plt3 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color = cyl)) +
  scale_color_viridis() +
  labs(title = "Vehicle mpg and engine type", x= "mpg in city", y= "mpg on highway", color= "# of cylinders" ) +
  theme_classic()

## multi-pannel visualization
multi_panel_plot <- grid.arrange(plt, plt2, plt3, ncol = 3)

