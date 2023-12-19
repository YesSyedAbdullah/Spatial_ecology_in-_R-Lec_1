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
focal
