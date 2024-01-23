install.packages("MPsychoR")
library(MPsychoR)
library(viridis)
library(viridisLite)

library(dplyr)

library(ggplot2)
library(gridExtra)
data("Rogers")
str(Rogers)

library(tidyr)

Rogers <- Rogers %>%
  mutate(physical_num = rowSums(select(., onset, weightloss, weightgain, decappetite, incappetite, fatigue, agitation)))

Rogers 

# Reshape the data for a grouped bar chart
df_long <- Rogers %>%
  select(physical_num, onset, weightloss, weightgain, decappetite, incappetite, fatigue, agitation) %>%
  tidyr::gather(variable, value, -physical_num)

# Plot a grouped bar chart
plt_bar <- ggplot(df_long, aes(x = factor(variable), y = value, fill = suicide)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Individual Variables Contribution to Physical Numeric",
       x = "Physical Variables",
       y = "Value",
       fill = "Suicide") +
  theme_minimal()

# Display the bar chart
plt_bar