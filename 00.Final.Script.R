#fubak script including all the different scripts during lectures
#------------------------------------------------------------------

#summary:
#01.Beginning 
#02.1 Population Density
#02.2 Poplation Distribuition
#03.1 Communities Multivariate Analysis 
#03.2 Communities Overlap
#------------------------------------------------------------------
#01 Beginning
# Here I can write anything I want! 42 is the meaning of life univcerse and all!

# R as calculator
2+3

# Assign to an object
Abdullah <- 2 + 3
Abdullah

Ali <- 5+3
Ali

Abdullah* Ali

Final <- Abdullah * Ali
Final

Final^2
# array
sophi <- c(10, 20, 30, 50, 70) # microplastics 
# fcuntions have parentheses and inside them there are arguments

paula <- c(100, 500, 600, 1000, 2000) # people

plot(paula, sophi)

plot(paula, sophi, xlab="number of people", ylab="microplastics")


people <- paula
microplastics <- sophi

plot(people, microplastics)
plot(people, microplastics, pch=19)
# https://www.google.com/search?client=ubuntu-sn&hs=yV6&sca_esv=570352775&channel=fs&sxsrf=AM9HkKknoSOcu32qjoErsqX4O1ILBOJX4w:1696347741672&q=point+symbols+in+R&tbm=isch&source=lnms&sa=X&ved=2ahUKEwia9brkm9qBAxVrQvEDHbEYDuMQ0pQJegQIChAB&biw=1760&bih=887&dpr=1.09#imgrc=lUw3nrgRKV8ynM

plot(people, microplastics, pch=19, cex=2)
plot(people, microplastics, pch=19, cex=2, col="blue")
#end
#------------------------------------------------------------------------------------
#02.1 Population Density

# Codes relatedtopopulation ecology
# A package is needed for point pattern analysis

install.packages("spatstat")
library(spatstat)

#Let's use bei data
#data desrciption
#https://CRAN.r-project.org/packages/spatstat

bei

# plotting the data
plot(bei)

#changing dimension - cex
plot(bei, cex=0.5)
plot(bei, cex=0.2)

#changing the symbol - pch

plot(bei, cex=0.2, pch=19)


# additional datasets
bei.extra
plot(bei.extra)


#let's use only part of dataset: elev
plot(bei.extra$elev)

elevation <- plot(bei.extra$elev)
elevation

elevation <- bei.extra$elev
plot(elevation)

#second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

.
.
.

##Lecture 04:
# Passing from points to a continuous surface
densitymap <- density(bei)

##colorRampPalette: for changing color
#100 is the gap (passing from 1 color to other)
colorRampPalette(c("black", "red", "orange", "yellow")) (100)
cl <- colorRampPalette(c("black", "red", "orange", "yellow")) (100)
plot (densitymap, col=cl)

#Don't use capital letter in R

cl2 <- colorRampPalette(c("oldlace", "rosybrown1", "tan2", "sienna")) (100)
plot (densitymap, col=cl2)
#
#Additional or New data set

plot(bei.extra)
#select only elevation not gradient 
f#for select elev we have two options
elev <- bei.extra [[1]] #bei.extra$elev
plot(elev)

#how to make multiframe:
In mf we have 2 boxes in graph left is density and right is elevation (in 1 row and 2 column)
#let's practice:
par(mfrow=1, c(1,2))
plot(densitymap)
plot(elev)
#so left m density map of right m elev ajayega
#but if you want upr density map aye or nichy elev so u have to do..
par(mfrow=c(2,1))
plot(densitymap)
plot(elev)

#assignment make 3 ggraph 
#1 with plot (bei) #2nd densitymap #3rd elevation

par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)

#---------------------------------------------------------------------------------------------
#02.2. Poplation Distribuition

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
#------------------------------------------------------------------
#03.1 Communities Multivariate Analysis 
#lecture 07

library(vegan)
data(dune)
head(dune)

### DECORANA is a program for aligning multivariate species data, performing correspondence analysis and detrended correspondence analysis (DCA)
##simple (taking data and align in simple way)

ord <- decorana(dune)
ldc1 = 3.7004 
ldc2 = 3.1166
ldc3 = 1.30055 
ldc4 = 1.47888

total = ldc1 + ldc2 + ldc3 + ldc4

pldc1 = ldc1 * 100/ total
pldc2 = ldc2 * 100/ total
pldc3 = ldc3 * 100/ total
pldc4 = ldc4 * 100/ total

pldc1
pldc2

plot(ord)
#------------------------------------------------------------------













