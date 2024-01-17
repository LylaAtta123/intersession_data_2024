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
png("Abortion_plot",width = 520,height = 520 )
par(mfrow = c(2,3))
col.age_demographics<- viridis::viridis(3)
col.age <- col.age_demographics[as.factor(infert$education)]
plot(infert$age,infert$parity,pch = 16,cex = 1,col = col.age,xlab = "Age of Women during Abortion", ylab = "Number of Children Prior to Abortion", main = "Correlation Between Women's Age at Abortion and Number of Children",)
dev.off()
#