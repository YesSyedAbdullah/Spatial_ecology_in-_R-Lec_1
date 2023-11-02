##### BOOKS#########R coding  for ecology###### all codes####
# This is a script to visualize satellite data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy")

library(imageRy)
library(terra)

im.list()
sentinel.dolomites are satelites

b2<- im.import("sentinel.dolomites.b8.tiff")

b2 <- im.import("sentinel.dolomites.b2.tif") # b2 is the blue wavelength
b2

#######

clb<- colorRampPalette(c("dark grey", "grey", "light grey")) (100)


clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100) # 100 is the amount of colours in the gradient
plot(b2, col=clb)

#import the green band from sentinel-2 (band 3)
#
b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3, col-cl)

cl <- colorRampPalette(c("darkgrey", "grey", "lightgrey")) (100)
plot(b3, col=cl)

#####################################################################################################################################################################
##02/11/2023
library(imageRy)
library(terra)

im.list()
im.import("sentinel.dolomites.b2.tif")

cl<- colorRampPalette(c("black", "grey", "lightgrey")) (100)
plot(b2, col=cl)
#import the blue band from sentinel-2 (band 2 b2)
im.import("sentinel.dolomites.b2.tif")
plot(b2, col=cl)

#import the green band from sentinel-2 (band 3 b3)
b3<- im.import("sentinel.dolomites.b3.tif")
plot(b3, col=cl)

#import the red band from sentinel-2 (band 4)
b4<- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=cl)

#import the NIR band from sentinel-2 (band 8)
b8<- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=cl)

#multiframe sb pic ko sath la kr compare krengy. several graphs all together
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

#charon bands alg alg hain unko ek package m pack kr rhy ab #several layer all together in a one pack
#stack images
stacksent <- c(b2, b3, b4, b8)
dev.off() #it closes devices
plot(stacksent, col=cl)

plot(stacksent[[4]], col=cl)

##Exercise : plot in a multiframe the bands with different color ramps##############
par(mfrow=c(2,2)
clb <- colorRampPalette(c("darkblue", "blue", "lightblue")) (100)
plot(b2, col=clb)

clg <- colorRampPalette(c("darkgreen", "green", "lightgreen")) (100)
plot(b3, col=clg)
    
clr <- colorRampPalette(c("darkred", "red", "pink")) (100)
plot(b4, col=clr)

cln <- colorRampPalette(c("brown", "orange", "yellow")) (100)
plot(b8, col=cln)

par(mfrow=c(2,2))
plot(b2, col=clb)
plot(b3, col=clg)
plot(b4, col=clr)
plot(b8, col=cln)


#im.plotRGB: plotRGB choosing

#RGB space
#stacksent: 
#band2 blue element 1, stacksent[[1]]
#band3 green element 2,  stacksent[[2]]
#band4 red element 3,  stacksent[[3]]
#band 8 nir element 4,  stacksent[[4]]

im.plotRGB(stacksent, r=3, g=2, b=1)


















