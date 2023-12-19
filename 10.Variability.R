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
