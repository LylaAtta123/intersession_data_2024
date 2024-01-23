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

# Define the new order and labels for the Depression variable
new_order <- c("Not at all", "More than half of the days", "Nearly every day", "Several days")

# Use mutate and factor to reorganize and rename the Depression variable
df2 <- mentalHealth_tibble %>%
  mutate(Depression = factor(Depression, levels = new_order))


#grouping by level of depression 
result3 <- df2 %>%
  group_by(Depression, sex) %>%
  summarize(
    Self_Harm_Thoughts = sum(Self.Harm.Thoughts %in% c("Several days", "More than half of the days", "Nearly every day")),
    PoorEgo = sum(PoorEgo %in% c("Several days", "More than half of the days", "Nearly every day")),
    ConcentrationStruggle = sum(ConcentrationStuggle %in% c("Several days", "More than half of the days", "Nearly every day")),
    Anxious_Count = sum(Anxious %in% c("Several days", "More than half of the days", "Nearly every day"))
  )
result3


#Female 
result3_female <- result3 %>%
  filter(sex == "Female")
result3_female <- result3_female %>%
  select(-sex)

#Male
result3_male <- result3 %>%
  filter(sex == "Male")
result3_male <- result3_male %>%
  select(-sex)

# Reshape data for plotting
result_long_female <- tidyr::pivot_longer(result3_female, cols = -Depression, names_to = "Variable", values_to = "Count") 
result_long_male <- tidyr::pivot_longer(result3_male, cols = -Depression, names_to = "Variable", values_to = "Count") 

#Summary Stats 
summary_stats_female <- result_long_female %>%
  group_by(Depression, Variable) %>%
  summarise(
    fAverage = mean(Count),
    fSD = sd(Count)
  )

#why is the geom_errorbar not working and how to seperate the labels on the bottom?/geom point isn't working either 
plot_female <- ggplot(summary_stats_female, aes(x = Depression, y = fAverage, fill = Variable)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_errorbar(aes(ymin = fAverage - fSD, ymax = fAverage + fSD), color = "black", width = 0.2,
                position = position_dodge(width = 0.8)) +
  labs(title = "Depression Level Effect on Mental Health Female",
       x = "Depression Level",
       y = "Average Count",
       color = "Variable") +
  theme_minimal()

plot_female 

summary_stats_male <- result_long_male %>%
  group_by(Depression, Variable) %>%
  summarise(
    mAverage = mean(Count),
    mSD = sd(Count, na.rm = TRUE)
  )

plot_male <- ggplot(summary_stats_male, aes(x = Depression, y = mAverage, fill = Variable)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_errorbar(aes(ymin = mAverage - mSD, ymax = mAverage + mSD), color = "black") +
  labs(title = "Depression Level Effect on Mental Health Male",
       x = "Depression Level",
       y = "Average Count",
       color = "Variable") +
  theme_minimal()

plot_male

grid.arrange(plot_female, plot_male, ncol = 2)
