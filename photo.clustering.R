install.packages("jpeg")
install.packages("factoextra")
install.packages("gridExtra")
install.packages("ggplot2")
install.packages("rgdal")
library(jpeg)
library(ggplot2)
library(cluster)
library(dplyr)
library(raster)
library(rgdal)

setwd("D:\\R and R Studio\\Clustering.project\\image")
if(!"raster" %in% rownames(installed.packages())){install.packages("raster")}
photo <- system.file('fire.jpg',package='imager')

image <- stack("fire.jpg")
plot(image)

r = raster("fire.jpg", band = 3)
g = raster("fire.jpg", band = 2)
b = raster("fire.jpg", band = 1)
rgb = brick()
plot(g)

#just experement of the segmantion
rgb = brick(b,g,r)
plot(rgb)
plotRGB(rgb, r = 3, g = 2, b = 1, stretch = "lin")


ndvi = (mbr$fire.1 - mbr$fire.2)/(mbr$fire.1 - mbr$fire.2)
plot(ndvi)


kMeansResult <- kmeans(image[], centers=2)
result <- raster(image[[1]])
result <- setValues(result, kMeansResult$cluster)
plot(result)

kMeansResult <- kmeans(image[], centers=2)
result <- raster(image[[1]])
result <- setValues(result, kMeansResult$cluster)
plot(result)

kMeansResult <- kmeans(image[], centers=3)
result <- raster(image[[1]])
result <- setValues(result, kMeansResult$cluster)
plot(result)

plot(result, col=c("black", "orange","red"))


length(kMeansResult$cluster[kMeansResult$cluster==3])/length(kMeansResult$cluster)*100
