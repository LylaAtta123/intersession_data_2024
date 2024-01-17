#### SETUP ####
getwd()
setwd('/Users/kalenclifton/intersession_data_2024/code/coding_day7/')

library(tidyverse)

#### DATA ####

##load new data
growth <- read.csv('https://raw.githubusercontent.com/kpclifton/intersession_data_2023/main/code/day4/cyanobacteria_growth.csv')

class(growth)
head(growth)


#### DATA TIDYING ####

# convert to tibble
growth_tbl <- as_tibble(growth)
class(growth_tbl)
growth_tbl

# looking at the unique categories in categorical data
table(growth_tbl$Iron)
table(growth_tbl$Trial)

# filter to only include 2nd and 3rd trials and 1x iron levels
data1 <- growth_tbl %>% 
  filter(Trial %in% c("2nd", "3rd")) %>% 
  filter(Iron == "1x")

data1


#### EXPLORATORY DATA VISUALIZATION ####

# plot OD as a function of Hours with Trial encoded with color
ggplot(data = data1) + 
  geom_point(mapping = aes(x = Hours, y= OD, color = Trial)) +
  theme_classic() +
  labs(title = "Growth in Trial 2 and 3 for Iron 1x")

# plot OD as a function of Trial
ggplot(data = data1) +
  geom_boxplot(mapping = aes(x=Trial, y=OD)) +
  theme_classic() +
  labs(title = "Growth in Trial 2 and 3 for Iron 1x")



#### DATA ANALYSIS ####

# hypothesize that statistical difference between the mean of Trial 2 and 3
# perform two-sided student's t-Test
# null hypothesis: mean(OD of Trial 2) = mean(OD of Trial 3)
# alternative hypothesis: mean(OD of Trial 2) != mean(OD of Trial 3)

Trial2 <- data1 %>% filter(Trial == "2nd")
Trial3 <- data1 %>% filter(Trial == "3rd")

t.test(Trial2$OD, Trial3$OD, alternative = "two.sided")

# alternative interface using formula syntax
t.test(OD ~ Trial, data = data1)

# want to find curve of best fit to model OD (which is a metric for growth) 
# as function of Hours for Trial 2
# from knowledge about cyanobacteria growth expect logistic with respect to time

# visualize relationship
ggplot(data = Trial2) +
  geom_point(mapping = aes(x=Hours, y=OD)) +
  theme_classic() +
  labs(title = "Growth in Trial 2 for 1x Iron")

# hasn't reached plateau phase so will just fit model for exponential growth
# OD = exp(Hours)

# using generalized linear regression function so rewrite to make linear
# OD = exp(Hours) becomes log(OD) = Hours

model <- glm(log(OD) ~ Hours, data = Trial2)
summary(model)
coef(model)

# log(OD) = beta + alpha*Hours
# log(OD) = coef(model)[1] + coef(model)[2]*Hours

predicted_OD = predict(model, Trial2)
predicted_OD

predicted_df <- data.frame(predicted_OD, Hours = Trial2$Hours)

ggplot(data = Trial2) +
  geom_point(mapping = aes(x=Hours, y=OD))+
  theme_classic() +
  labs(title = "Growth in Trial 2 for 1x Iron") +
  geom_line(mapping = aes(x=Hours, y =exp(predicted_OD)), data = predicted_df, color= "red")
  
