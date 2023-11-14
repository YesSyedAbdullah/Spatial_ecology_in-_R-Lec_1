#time series analysiss
library(imageRy)
library(terra)

im.list()

#import the data
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

#difference b/w 2 images (jan and march)
#using the first element 
dif = EN01[[1]]-EN13[[1]]
plot(dif)

#pallette
cldif <-colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=cldif)

##New example: temperature in Greenland.
g2000<- im.import("greenland.2000.tif")
g2000
clg <-colorRampPalette(c("blue", "white", "red")) (100)
plot(g2000, cl=clg)

g2005<- im.import("greenland.2005.tif")
g2010<- im.import("greenland.2010.tif")
g2015<- im.import("greenland.2015.tif")

par(mfrow=c(2,1))
plot(g2000, cl=clg)
plot(g2015, cl=clg)

#stacking the data (all four data together)
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)

#exercise: make the differnece b/w the first and the final elements of the stack
dif1 =g2000[[1]]-g2015[[1]]
plot(dif1)

or

dif2<- stackg[[1]]-stackg[[4]]
plot(dif2, col=cldif)

#going to add RGB in 2000, 2005 and 2015,
#2000 for red
#2005 for green
#2015 for blue 

#if plot have high red tou temp zyda in 2000, if green clr is more so 2005 m temp zyda, or agr blue color zyda it means temp zyda hai 2015 m...
#exercise: making RGB plot using different years.

im.plotRGB(stackg, r=1, g=2, b=3)



