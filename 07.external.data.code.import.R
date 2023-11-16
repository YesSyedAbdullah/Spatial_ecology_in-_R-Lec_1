#External data
Library(terra)
#sb sy phly R ko btana pry ga k wo data jsko import krna h R m wo kaha pr h

#set working directory #based on my work directory
#for window users: c:\\ users\path etc. -> c:// users/path etc.
setwd("C:/Users/utente/Documents/GCE & SDGs/Lectures/Spatial Ecology in R")
or
setwd("-/Spatial Ecology in R") #hm koi symbol use kr skty pury path k jaga (jesy prof. ny kia) but not in windows only macbook m
rast() #it is the exactly the same as im.import()
naja<- rast("Najaf Iraq lake.jpg")
plotRGB(naja, r=1, g=2, b=3) #Same as im.plotRGB

#exercise download the second image from same website and put it inside R
##No need to set working directory again
##setwd("C:/Users/utente/Documents/GCE & SDGs/Lectures/Spatial Ecology in R")
najaf2<- rast("Najaf Iraq lake 2023.jpg")
plotRGB(najaf2, r=1, g=2, b=3)

#two images together
par(mfrow=c(2,1))
plotRGB(naja, r=1, g=2, b=3) #Same as im.plotRGB
plotRGB(najaf2, r=1, g=2, b=3)

#exercise: multitemporal change detection
najadif = naja[[1]] - najaf2[[2]]
colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col=cl)

#exercise: new pic import
typhoon <- rast("ele.AMO2002250.jpg")
plotRGB(typhoon, r=1, g=2, b=3)
#now change the color/ bands
plotRGB(typhoon, r=2, g=1, b=3)
plotRGB(typhoon, r=3, g=2, b=1)

#the matogrosso image can be download directly from the earth observatory website as well
mato <- rast("matogrosso_l5_1992219.jpg")
plotRGB(mato, r=1, g=2, b=3)
#changing color
plotRGB(mato, r=3, g=2, b=1)











