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

## Data Cleaning ## 
#removing unecessary variables 

mentalHealth_subset <- mentalHealth[, c("Depression", "Self.Harm.Thoughts", "PoorEgo", 
                                        "ConcentrationStuggle", "Anxious")]

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
result2 <- df2 %>%
  group_by(Depression) %>%
  summarize(
    Self_Harm_Thoughts = sum(Self.Harm.Thoughts %in% c("Several days", "More than half of the days", "Nearly every day")),
    PoorEgo = sum(PoorEgo %in% c("Several days", "More than half of the days", "Nearly every day")),
    ConcentrationStruggle = sum(ConcentrationStuggle %in% c("Several days", "More than half of the days", "Nearly every day")),
    Anxious_Count = sum(Anxious %in% c("Several days", "More than half of the days", "Nearly every day"))
  )
result2

# Reshape data for plotting
result_long <- tidyr::pivot_longer(result2, cols = -Depression, names_to = "Variable", values_to = "Count") 

# Plotting
#how to change spacing between labels 
PhysicalHealth2 <- ggplot(result_long, aes(x = Depression, y = Count, fill = Variable)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(title = "Depression Level Effect on Self Harm Thoughts, Poor Ego, Concentration Struggle, Anxious",
       x = "Depression Level",
       y = "Count",
       fill = "Variable") +
  theme_minimal()

PhysicalHealth2

#Summary Stats 
summary_stats2 <- result_long %>%
  group_by(Depression, Variable) %>%
  summarise(
    Average = mean(Count),
    SD = sd(Count)
  )

#why is the geom_errorbar not working and how to seperate the labels on the bottom?/geom point isn't working either 
plot6 <- ggplot(summary_stats2, aes(x = Depression, y = Average, fill = Variable)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_point(aes(color = Variable), size = 3, position = position_dodge(width = 0.8), color = "black") + 
  geom_errorbar(aes(ymin = Average - SD, ymax = Average + SD), color = "black", width = 0.2,
                position = position_dodge(width = 0.8)) +
  labs(title = "Depression Level Effect on Self Harm Thoughts, Poor Ego, Concentration Struggle, Anxious",
       x = "Depression Level",
       y = "Average Count",
       color = "Variable") +
  theme_minimal()

plot6
