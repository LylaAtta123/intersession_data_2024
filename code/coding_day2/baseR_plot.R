library(viridis)
library(datasets)
data("iris")
head(iris)

png('./../results/iris.png', width = 480, height = 480)
plot(iris[,'Sepal.Length'], iris[,'Petal.Length'], 
	pch = 16, cex = 0.5,
	xlab = 'Sepal Length', ylab = 'Petal Length',
	main = 'Iris Dataset')
dev.off()