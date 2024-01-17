###setup###
getwd()
setwd("C:/Users/zheng/intersession_data_2024/code/coding_day4")
getwd()
library(datasets)
library(viridis)
library(ggplot2)
library(gridExtra)

#datas
data(mpg)
class(mpg)
dim(mpg)
head(mpg)
summary(mpg)

# plt <- ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>)) +
#  labs(title = <"TITLE">, x= <"X AXIS LABEL">, y= <"Y AXIS LABEL"> )

#scatterplot#
plt <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x=cty, y=hwy, shape=drv)) +
  labs(title = "Vehicle mpg on highway and city and their drive", x= "in city (mpg)", y= "on highway (mpg)" )
plt

#histograms

plt2 <- ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty), breaks = seq(from=0, to=35, by=5)) +
  labs(title = "cities and their car counts", x= "cities", y= "counts" )

plt2

#scatter plots
plt3 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color = cyl)) +
  scale_color_viridis() +
  labs(title = "Vehicle mpg and engine type", x= "mpg in city", y= "mpg on highway", color= "# of cylinders" ) +
  theme_classic()

plt3

plt4 <- ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color = class)) +
  scale_color_viridis(discrete = TRUE, option = "plasma") +
  labs(title = "Vehicle mpg and engine type", x= "mpg in city", y= "mpg on highway", color= "class" ) +
  theme_classic()

plt4

## multi-panel visualizations
grid.arrange(plt, plt3, plt4, ncol=3, nrow=1)


