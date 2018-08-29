#class 4

source("https://bioconductor.org/biocLite.R")
biocLite("affy")
biocLite("SpikeInSubset")
library(SpikeInSubset)
data(spikein95)
image(spikein95)
ids <- geneNames(spikein95)
ids[1:10]
mas5.eset <- mas5(spikein95)
mas5.e <- log2(exprs(mas5.eset))
boxplot(spikein95)
x11()
boxplot(mas5.e, col = 2:5)
density1 <- density(mas5.e[, 1])
plot(density1, main = "MAS5 expression measure distributions")
density2 <- density(mas5.e[, 2])
lines(density2, col = "red")
density3 <- density(mas5.e[, 3])
lines(density3, col = "blue")

#Making MA plots 
#M: difference in average log intensitites 
#A: average log intensities 

head(mas5.e)

#1:3 sample
#4:6 control

d <- rowMeans(mas5.e[,1:3]) - rowMeans(mas5.e[,4:6])
a <- rowMeans (mas5.e)

# plotting the data

plot(a,d, ylim = c(-5,5), main="Mas 5.0 normalized MA plot",

xlab = "A", ylab = "M", pch = ".")

abline(h = c(-1,1))
abline(h = c(-1.5,1.5), col="red")


rma.eset <- rma(spikein95)
rma.e <- exprs(rma.eset)

x11()
boxplot(mas5.e, col = 2:5, main="Mas 5.0 Norm")
x11()
boxplot(rma.e, col = 2:5, main="RMA Norm")







