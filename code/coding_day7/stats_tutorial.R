#### SETUP ####
getwd()
setwd('/Users/kalenclifton/intersession_data_2024/code/coding_day7/')

library(tidyverse)

#### DATA ####

##load new data
growth <- read.csv('https://raw.githubusercontent.com/kpclifton/intersession_data_2023/main/code/day4/cyanobacteria_growth.csv')



#### DATA TIDYING ####

# convert to tibble


# looking at the unique categories in categorical data


# filter to only include 2nd and 3rd trials and 1x iron levels


#### EXPLORATORY DATA VISUALIZATION ####

# plot OD as a function of Hours with Trial encoded with color


# plot OD as a function of Trial


#### DATA ANALYSIS ####

# hypothesize that statistical difference between the mean of Trial 2 and 3
# perform two-sided student's t-Test
# null hypothesis: mean(OD of Trial 2) = mean(OD of Trial 3)
# alternative hypothesis: mean(OD of Trial 2) != mean(OD of Trial 3)



# alternative interface using formula syntax


# want to find curve of best fit to model OD (which is a metric for growth) 
# as function of Hours for Trial 2
# from knowledge about cyanobacteria growth expect logistic with respect to time

# visualize relationship


# hasn't reached plateau phase so will just fit model for exponential growth
# OD = exp(Hours)

# using generalized linear regression function so rewrite to make linear
# OD = exp(Hours) becomes log(OD) = Hours



# log(OD) = beta + alpha*Hours
# log(OD) = coef(model)[1] + coef(model)[2]*Hours



