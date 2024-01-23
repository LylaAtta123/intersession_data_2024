###Group2
getwd()
setwd('/Users/leoqi')

library(datasets)
library(viridis)
library(ggplot2)
library(gridExtra)
library(tidyverse)
library(ggthemes)
library(ggplot2)
library(ggpubr)
install.packages("ggthemes")
install.packages("ggpubr")

file <- "c:/Downloads/Group 2 Data.csv"
data <- read.csv(file.choose())
data2 <- read.csv(file.choose())

head(data)
head(data2)

### Stress level related to time on Different Social Media Platform

plt <- ggplot(data = data, mapping = aes(x=Time, y = GAD7)) +
  geom_point(mapping = aes(color = Type, shape = Type), size = 3) +
  geom_smooth(method = "lm", color = "black") +
  labs(title = "GAD7 # vs Time spent on Social Media", 
  subtitle = "Higher GAD 7 value indicate more severe anxiety",
  x = "Time (min) /day", y = "GAD7") +
  theme_grey() +
  scale_color_brewer(palette = "PRGn") +
  stat_cor(method = "pearson", label.x=250, label.y=7)
plt

### Box plot categorizing
plt2 <- ggplot(data = data2, mapping = aes(x=GAD7, fill = Evaluation)) +
  geom_histogram(binwidth = 5) +
  labs(title = "GAD 7 Values related to Severity of Anxiety",
       subtitle = "0-4 (Minimal), 5-9 (Mild), 10-14 (Moderate), 15-21 (Severe)") +
  scale_color_brewer(palette = "Blues")
plt2
legend(1, 95, legend = c("0-4 (Minimal)", "5-9 (Mild)", "10-14 
                                    (Moderate)", "15-21 (Severe)"))

col.unique <- viridis::viridis(18)
names(col.unique) <- 4

col.idx <- match(Orange$age, names(col.species.unique))
col.id <- match()
col.species <- col.species.unique[col.idx]

