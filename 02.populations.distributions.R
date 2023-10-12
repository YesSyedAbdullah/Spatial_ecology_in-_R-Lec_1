###lecture 05########
#why populations disperse over the landscape in a certain manner?

#sdm mean Species distribution model
library(sdm)
library(terra)
library(rgdal)

file <- system.file("external/species.shp", package="sdm") 
rana <- vect(file)
rana$Occurrence

###Selecting presences of rana tagriana (frog)
rana[rana$Occurrence == 1,]
pres<- rana[rana$Occurrence == 1,] 

###exercise: select absence and call them abse
rana[rana$Occurrence==0,]
abse<- rana[rana$Occurrence==0,] or pres<- rana[rana$Occurrence != 1,] 
plot(abse)

#now exercies: left presence and right absence (beside each other)
par(mfrow=c(1,2))
plot(pres) #presence at left
plot(abse) #absence at right


#to use to del graph use: for graph nulling in plot tab
dev.off()

#exercise: plot pres and abse altogether with two different color
cl <- colorRampPalette("red")(100)
plot(pres, col=cl)
cl <- colorRampPalette("blue")(100)
plot(abse, col=cl)

##upr wlaa meny kia, 2 alg boxes m arha 
#but nichy wala sir ny karaya or dono ek hi box m arha h
#because he used plot and points 


plot(pres, col= "darkblue")
plot(abse, col= "lightblue")

plot(pres, col= "darkblue")
points(abse, col= "lightblue")

###############
#predictors: environmental variables (look at the path)

##elevation
elev<- system.file("external/elevation.asc", package="sdm")
elevmap <- rast(elev)
elevmap
plot(elevmap)
points(pres, cex=.5)

#temperature
temp <- system.file("external/temperature.asc", package="sdm")
temp
tempmap<- rast(temp)

plot(tempmap)
points(pres, cex=.5)

#vegetation
vege <- system.file("external/vegetation.asc", package="sdm")
vege
vegemap <- rast(vege)
plot(vegemap)
points(pres, cex=.5)

#precipitation
prec <- system.file("external/precipitation", package="sdm")
prec <- rast(vege)
plot(precmap)
points(pres, cex=.5)


#all 4 together  #final multiframe
par(mfrow=c(2,2)) 

#elev
plot(elevmap)
points(pres, cex=.5)

#temp
plot(tempmap)
points(pres, cex=.5)

#vege
plot(vegemap)
points(pres, cex=.5)

#prec    
plot(precmap)
points(pres, cex=.5)
