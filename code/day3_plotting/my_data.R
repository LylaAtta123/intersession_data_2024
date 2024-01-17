# Dataset used: Growth of Loblolly pine trees.
##### SETUP #####
getwd()
library(datasets)
library(viridisLite)

##### DATA #####
data("Loblolly")
class(Loblolly)
dim(Loblolly)
head(Loblolly)
summary(Loblolly)
unique(Loblolly$Seed)

##### PLOTTING #####
# histogram
hist(Loblolly$height, breaks = 30, main = "Loblolly Heights", xlab = "Tree Height (ft)", ylab = "Count")

# relationship between height and age
plot(Loblolly$age, Loblolly$height)
# generate a picture
png("general_age_height.png", width = 520, height = 520)
plot(Loblolly$age, Loblolly$height, pch = 19, cex = 0.8, col = "black", xlab = "Age (year)", ylab = "Tree Height (ft)", main = "Loblolly Tree Height vs Age")
dev.off()

# color by seed source: ordering according to increasing maximum height
col.seed.unique <- viridis::viridis(14)
# create a list for unique seed names
unique.seeds <- unique(Loblolly$Seed)
# assign it to names() for legend
names(col.seed.unique) <- unique.seeds
col.seed <- col.seed.unique[as.factor(Loblolly$Seed)]

png("color_based_seed.png", width = 520, height = 520)
plot(Loblolly$age, Loblolly$height, pch = 19, cex = 0.8, col = col.seed, xlab = "Age (year)", ylab = "Tree Height (ft)", main = "Loblolly Tree Height vs Age")

# add legend
legend(x=5, y=60, legend = names(col.seed.unique), col = col.seed.unique, pch = 16)

#print(col.seed.unique)
#a = as.factor(Loblolly$Seed)
dev.off()
