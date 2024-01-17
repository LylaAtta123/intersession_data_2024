#### SET UP ####
#setwd("C:\\Users\\William Mariscal\\intersession_data_2024\\code")

#library(help = datasets)
#library(datasets)
#data()
#setwd("C:\\Users\\William Mariscal\\)

#install.packages("viridis")


getwd()
library(datasets)
library(viridis)
library(viridisLite)

#### DATA ####
data("infert")
class(infert)
dim(infert)
head(infert)
table(infert$induced)
table(infert$parity)
table(infert$age)
#### PLOTTING ####
#par(mfrow = c(2,3))

png("AP_legend.png",width = 520,height = 520 )
# Generating unique colors based on the number of unique education levels in 'infert' data
unique_education <- unique(infert$education)
col.age.unique <- viridis::viridis(length(unique_education))
names(col.age.unique) <- unique_education

#Plotting
plot(infert$age,infert$parity,pch = 16,cex = 1, 
     col = col.age.unique[as.numeric(factor(infert$education))] ,
     xlab = "Age of Women during Abortion", ylab = "Number of Children Prior to Abortion", 
     main = "Correlation Between Women's Age at Abortion and Number of Children",)

#Legend
legend("topright", 
       legend = names(col.age.unique), 
       col = col.age.unique,pch = 16)

dev.off()