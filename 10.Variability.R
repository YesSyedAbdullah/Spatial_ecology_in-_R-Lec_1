#measurment of R studio based variability 
library(imageRy)
library(terra)
library(viridis)


im.list()

sent<- im.import("sentinel.png")

#band1 =NIR
#band2 = red
#band3= green
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)

nir<- sent[[1]]
plot(nir)

#moving window
#focal

sd3<- focal(nir, matrix(1/9, 3, 3), fun=sd) #3,3 is the describation of 3x3 (qk matrix sqaure h)
plot(sd3)

viridisc<- colorRampPalette(viridis(7)) (255)
plot(sd3, col=viridisc)

#####################################21-12-2023###########################################

#Exercise: calculate the variability of 7x7 in a moving window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7)

viridisc<- colorRampPalette(viridis(7)) (255)
plot(sd7, col=viridisc)

#exercise 2: plot via par(mfrow()) the 3x3 and 7x7 standard deviation
par(mfrow=c(1,2))
plot(sd3, col=viridisc)
plot(sd7, col=viridisc)

#original image plus 7x7 std. deviation
im.plotRGB(sent, r=2, g=1, b=3)
plot(sd7, col=viridisc)

#high variability so more species

###############multivariate analysis###########

#principle component1: where we have high variability in the graph: (highest range) approx 90%
#principle component2 is the axis: perpendicular to above line in the graph with less range (lowest range approx, 10%)

