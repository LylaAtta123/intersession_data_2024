#FirstDataset - reading it as a csv 
mentalHealth <- read.csv("C:\\Users\\ishit\\Downloads\\Mental_Health_Survey_edited3.csv")
str(mentalHealth)
class(mentalHealth)
head(mentalHealth)

#### SETUP ####
getwd()

#install.packages("tidyverse")
#install.packages("nycflights13")

library(tidyverse)
library(nycflights13)
library(gridExtra) 
## Data Cleaning ## 
#removing unecessary variables 

mentalHealth_subset <- mentalHealth[, c("Depression", "Self.Harm.Thoughts", "PoorEgo", 
                                        "ConcentrationStuggle", "Anxious")]

mentalHealth_tibble <- as_tibble(mentalHealth_subset)
class(mentalHealth_tibble)
mentalHealth_tibble

glimpse(mentalHealth)
#to only include 3-4 times 
#data1 <- mentalHealth_tibble %>% filter(acha_12months_times_5 %in% c("3-4 times", "5-6 times"))
#data1 


## Data Visualization ##

# Filter out rows where depression is not missing
filtered_data <- mentalHealth[!is.na(mentalHealth$Depression), ]

# Create a bar plot
gathered_data <- filtered_data %>%
  gather(key = "race", value = "race_value", race_1:race_6)

# Create a bar plot
ggplot(gathered_data, aes(x = race, fill = Depression)) +
  geom_bar(position = "dodge", color = "black") +
  labs(title = "Depression Levels Across Races",
       x = "Race",
       y = "Count") +
  theme_minimal()
