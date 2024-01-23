#### SET UP ####
getwd()
setwd("\\Users\\William Mariscal\\intersession2024Group\\WM_code")

library(MPsychoR)
library(viridis)
library(viridisLite)
library(dplyr)
library(tidyr)
library(ggplot2)
library(gridExtra)
data("Rogers")
str(Rogers)


#R.Version()


#### DATA ####
dim(Rogers)
head(Rogers)
#physical <- Rogers %>%
#mutate(combined_variable = paste(onset, weightloss, weightgain, decappetite, incappetite, fatigue, agitation, sep = ", "))
#head(physical)

#### ORiginal ####

#plt <- ggplot(Rogers)+
#geom_point(aes(sad,weightloss,color = suicide))+
#scale_color_viridis(discrete = FALSE, option = "D")+
#labs(title = "Correlation between Mental and Physical Health", x = "Sadness",y = "Weightloss",color = "Suicide")
#plot(plt)

#Violin Plot style with weightloss

plt2 <- ggplot(Rogers) +
  geom_violin(aes(x = factor(sad), y = weightloss, fill = factor(suicide)), scale = "width") +
  labs(title = "Correlation between Mental and Physical Health", x = "Sadness", y = "Weightloss", fill = "Suicide")

# Display the violin plot
print(plt2)

#Violin Plot style with Weightgain
plt3 <- ggplot(Rogers) +
  geom_violin(aes(x = factor(sad), y = weightgain, fill = factor(suicide)), scale = "width") +
  labs(title = "Correlation between Mental and Physical Health", x = "Sadness", y = "Weightgain", fill = "Suicide")

# Display the violin plot
print(plt3)

#Multiple Arrangement for Plot 2 and 3
#png('Combined_plots.png',width = 800,height = 800)
grid.arrange(plt2,plt3, ncol = 2, nrow = 2)
#dev.off()

#### Attempt to combine ####
#Violin Plot Using all Physical Data
plt4 <- ggplot(Rogers) +
  geom_violin(aes(x = factor(sad), y = physical, fill = factor(suicide)), scale = "width") +
  labs(title = "Correlation between Mental and Physical Health", x = "Sadness", y = "Physical Changes", fill = "Suicide")
plot(plt4)

#### Attempt 2: Worked in merging ####
Rogers <- Rogers %>%
  mutate(physical_numeric = rowSums(select(., onset, weightloss, weightgain, decappetite, incappetite, fatigue, agitation)))

png("Merged_Data_Violin_PlotBorder.png", width = 1000, height = 1000)
plt5 <- ggplot(Rogers) +
  geom_violin(aes(x = factor(sad), y = physical_numeric, fill = factor(suicide)), scale = "width") +
  labs(title = "Correlation between Mental and Physical Health", x = "Sadness", y = "Physical Changes", fill = "Suicide")+
  theme(plot.background = element_rect(color = "black", linewidth = 1)  # Border around the plot
)
plot(plt5)
dev.off()



#### Attempt 3 ####
# Create a new variable "physical_numeric" representing the numeric combination
Rogers <- Rogers %>%
  mutate(physical_num = rowSums(select(., onset, weightloss, weightgain, decappetite, incappetite, fatigue, agitation)))

# Reshape the data for a grouped bar chart
df_long <- Rogers %>%
  select(physical_num, onset, weightloss, weightgain, decappetite, incappetite, fatigue, agitation, suicide) %>%
  tidyr::gather(variable, value, -physical_num, -suicide)

# Plot a grouped bar chart
plt_bar <- ggplot(df_long, aes(x = factor(variable), y = value, fill = factor(suicide))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Individual Variables Contribution to Physical Numeric",
       x = "Physical Variables",
       y = "Value",
       fill = "Suicide") +
  theme_minimal()

# Display the bar chart
plot(plt_bar)

#### Average Bar Raw Data ####
# Calculate the average for each variable based on 'suicide' values
png("Physical_Data_Bar_ChartwBorder.png", width = 800, height = 800)
df_avg <- Rogers %>%
  group_by(suicide) %>%
  summarize(
    avg_onset = mean(onset),
    avg_weightloss = mean(weightloss),
    avg_weightgain = mean(weightgain),
    avg_decappetite = mean(decappetite),
    avg_incappetite = mean(incappetite),
    avg_fatigue = mean(fatigue),
    avg_agitation = mean(agitation),
    physical_num = mean(physical_num)
  )

# Reshape the data for a grouped bar chart
df_avg_long <- df_avg %>%
  gather(variable, value, -suicide, -physical_num)

# Plot a grouped bar chart using the average values with bold titles and labels
plt_avg_bar <- ggplot(df_avg_long, aes(x = factor(variable), y = value, fill = factor(suicide))) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(value, 2)), position = position_dodge(width = 0.9), vjust = -0.5) +  # Display text labels
  labs(title = "Average Contribution of Variables to Physical Numeric",
       x = "Physical Variables",
       y = "Average Value",
       fill = "Suicide") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.title.x = element_text(face = "bold", size = 12),
    axis.title.y = element_text(face = "bold", size = 12),
    plot.background = element_rect(color = "black", linewidth = 1)  # Border around the plot
  )

# Display the bar chart
print(plt_avg_bar)
dev.off()