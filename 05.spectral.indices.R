#har bar jb jb R open krogy tb tb library krna pryga

library(imageRy)
library(terra)
#import all bands in R 
im.list()

b2<- im.import("sentinel.dolomites.b2.tif")
b3<- im.import("sentinel.dolomites.b3.tif")
b4<- im.import("sentinel.dolomites.b4.tif")
b8<- im.import("sentinel.dolomites.b8.tif")

stacksent <- c(b2, b3, b4, b8)
plot(stacksent)

im.plotRGB(stacksent, r=3, g=2, b=1)
### 1, 2, 3, 4 bands ki sequences hain..
##red=3, green=2, blue=1, NIR=4

#######ksi 3 colors ko use kr skty tou ab NIR color ko layengy blue k jagay.. blue ko bye bye kro
im.plotRGB(stacksent, r=4, g=3, b=2)

##NIR k position ko change kr skty hain
im.plotRGB(stacksent, r=3, g=4, b=2)
im.plotRGB(stacksent, r=3, g=2, b=4)

###############################################SOME presentation and graphs in register
#######################################################################################
then,
install.packages("ggplot2")
install.packages("viridis")

library(ggplot2)
library(viridis)

#import new bands
im.list()
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

im.plotRGB(m1992, r=1, g=2, b=3)
####or 
im.plotRGB(m1992, 1,2,3) #both are same

#### now change the positions
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

#import the new/ recent images (from 1992 to 2006)
# import the 2006 image
m2006 <- im.import("matogrosso_ast_2006209_lrg")

im.plotRGB(m2006, r=2, g=3, b=1)

# Exercise: plot the 2006 image with NIR in the Green component of the RGB space
im.plotRGB(m2006, 2, 1, 3)

# Exercise: plot the 2006 image with NIR in the Blue component of the RGB space
im.plotRGB(m2006, 2, 3, 1)




