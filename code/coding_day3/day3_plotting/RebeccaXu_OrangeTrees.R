#### SET UP ####
getwd()
setwd("/Users/rebeccaxu/intersession_data_2024/code/day3_plotting")

library(datasets)

#### SLEEP DATA ####
data("sleep")

class(sleep)
dim(sleep)
head(sleep)

# png("RebeccaXu_sleepdrug.png", width = 520, height = 520)
plot(sleep$group,sleep$extra, xlab = "Drug Given", 
     ylab = "Hours of Extra Sleep",
    main = "Sleep Drug")
# dev.off()

#### ORANGE DATA ####
data("Orange")

class(Orange)
dim(Orange)
head(Orange, 7)

table(Orange$Tree)

#### ORANGE plot ####

# png("RebeccaXu_OrangeTrees.png", width = 520, height = 520)
plot(Orange$age, Orange$circumference, 
     col = c(rep("red", 7), rep("orange", 7), rep("black", 7), 
             rep("green", 7), rep("blue", 7)), pch = 19,
     xlab = "Age (days since 12/31/1968)", 
     ylab = "Circumference (mm)",
     main = "Orange Tree Growth")
legend("bottomright", legend = paste("Tree", 1:5),  
       col = c("red", "orange", "black", "green", "blue"), pch = 19, 
       bty = "n")
# dev.off()

#### Another Orange Trees plot with viridis function ####
install.packages("viridis")
library(viridis)

# viridis color for each unique species
col.trees.unique <- viridis::viridis(length(unique(Orange$Tree)))
names(col.trees.unique) <- unique(Orange$Tree)

# make species color character vector in same order as trees in data
col.idx <- match(Orange$Tree, names(col.trees.unique))
col.trees <- col.trees.unique[col.idx]

# plot
#png("RebeccaXu_ViridisOrangeTrees.png", width = 520, height = 520)
plot(Orange$age, Orange$circumference,
     pch = 19, cex = 1.5, col = col.trees,
     main = "Orange Tree Growth",
     xlab = "Age (days since 12/31/1968)",
     ylab = "Circumference (mm)")

# legend
legend("bottomright",
       legend = paste("Tree", names(col.trees.unique)),
       col = col.trees.unique, pch = 19)
#dev.off()

