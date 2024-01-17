#### SETUP ####
getwd()
setwd('/Users/kalenclifton/intersession_data_2024/code/')
library(datasets)
library(viridis)

#install.packages('ggplot2')
library(ggplot2)
data("mpg")

#### DATA ####
class(mpg)
dim(mpg)
head(mpg)
summary(mpg)

#### PLOTTING ####

## Code Template
# plt <- ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

## plot scatter plot 

ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, color=class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x=cty, y=hwy, shape=trans))

## plot histogram
ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty))

ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty), bins = 5)

ggplot(data = mpg) +
  geom_histogram(mapping = aes(x=cty), breaks = seq(5,35,5)) +
  xlab("mpg in the city") + ggtitle("Histogram")


