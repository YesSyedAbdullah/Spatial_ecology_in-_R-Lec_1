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




