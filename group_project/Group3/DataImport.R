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

#### DATA ####
glimpse(mentalHealth)

## Data Tidying ## 
#First rename all categories to make it clear what's what --> done 
#evaluate the data that's needed by tidying 
#data visualize using ggplot 
#do statistical analysis 

## Data Cleaning ## 
#removing unecessary variables 
mentalHealth_subset <- mentalHealth[, c("Depression", "Anorexia", "Diabetes", 
                                        "High.Blood.Pressure", "High.Cholesterol")]

mentalHealth_tibble <- as_tibble(mentalHealth_subset)
class(mentalHealth_tibble)
mentalHealth_tibble

#to only include 3-4 times 
#data1 <- mentalHealth_tibble %>% filter(acha_12months_times_5 %in% c("3-4 times", "5-6 times"))
#data1 


## Data Visualization ##

# Define the new order and labels for the Depression variable
new_order <- c("Not at all", "More than half of the days", "Nearly every day", "Several days")

# Use mutate and factor to reorganize and rename the Depression variable
df2 <- mentalHealth_tibble %>%
  mutate(Depression = factor(Depression, levels = new_order))

#grouping by level of depression 
result <- df2 %>%
  group_by(Depression) %>%
  summarize(
    Anorexia_Count = sum(Anorexia == "Yes"),
    Diabetes_Count = sum(Diabetes == "Yes"),
    HighBloodPressure_Count = sum(High.Blood.Pressure == "Yes"),
    Endometriosi_Count = sum(Endometriosi == "Yes")
  )
result

# Reshape data for plotting
result_long <- tidyr::pivot_longer(result, cols = -Depression, names_to = "Variable", values_to = "Count") 

# Plotting
#how to change spacing between labels 
PhysicalHealth <- ggplot(result_long, aes(x = Depression, y = Count, fill = Variable)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(title = "Depression Level Effect on Anorexia, Endemetriosis , Diabetes, High Blood Pressure",
       x = "Depression Level",
       y = "Count",
       fill = "Variable") +
  theme_minimal()

PhysicalHealth

#Summary Stats 
summary_stats <- result_long %>%
  group_by(Depression, Variable) %>%
  summarise(
    Average = mean(Count),
    SD = sd(Count)
  )

#why is the geom_errorbar not working and how to seperate the labels on the bottom? 
plot5 <- ggplot(summary_stats, aes(x = Depression, y = Average, fill = Variable)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), color = "black", width = 0.2,
                position = position_dodge(width = 0.8)) +
  labs(title = "Depression Level Effect on Anorexia, Endemetriosis , Diabetes, High Blood Pressure",
       x = "Depression Level",
       y = "Average Count",
       color = "Variable") +
  theme_minimal()

plot5

#make the plots have averages and stds 
#Do mentalHealth 

#Do male vs female 


#Second Dataset
#library(datasets)
#install.packages("Rogers")
#data("Rogers")