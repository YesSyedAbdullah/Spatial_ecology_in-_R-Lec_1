#Final script including all the different scripts during lectures
#------------------------------------------------------------------

#summary:
#01.Beginning 
#02.1 Population Density
#02.2 Poplation Distribuition
#03.1 Communities Multivariate Analysis 
#03.2 Communities Overlap 
#04. Remote Sensing Visualisation
#05. Spectral Indices
#06. Times Series
#07. External Data
#08. Copernicus Data 
#09. Classification
#10. Variability
#11. Principal Component Analysis

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
#03.2 Communities Overlap

#relation among species in time

#how different species overlap each other

library(overlap)

# data
data(kerinci)
head(kerinci)
summary(kerinci)

# selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger",]
tiger <- kerinci[kerinci$Sps=="tiger",]

# tiger
# The unit of time is the day, so values range from 0 to 1. 
# The package overlap works entirely in radians: fitting density curves uses trigonometric functions (sin, cos, tan),
# so this speeds up simulations. The conversion is straightforward: kerinci$Time * 2 * pi
kerinci$timeRad <- kerinci$Time * 2 * pi

kerinci$timeRad <- kerinci$Time *2 * pi

# selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger",]

plot(tiger$timeRad)

# selecting the time for the tiger
timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)

##exercise: select only data of monkey (macaque) individuals
# selecting the second species macaque
macaque <- kerinci[kerinci$Sps=="macaque",]
timemac <- macaque$timeRad
densityPlot(timemac, rug =TRUE)

#Overlap.......
overlapPlot (timetig, timemac)
#------------------------------------------------------------------
#04. Remote Sensing Visualisation

##### BOOKS#########R coding  for ecology###### all codes####
# This is a script to visualize satellite data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy") #this imageRy package is available in github not in CRAN.

library(imageRy)
library(terra) #terra pkg is used by imageRy pkg thats why we used it.

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

#multiframe sb pic ko sath la kr compare krengy. several graphs all together in  a single window
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
#------------------------------------------------------------------
#05. Spectral Indices
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
###################################################################################################################
09-11-2023
###################################################################################################################

#exercise: build multiframe with 1992 and 2006
par(mfrow=c(1,2)
im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

#DVI =NIR- RED
#bands: 1=NIR, 2=RED, 3=Green
dvi1992= m1992[[1]]-m1992[[2]]
plot(dvi1992)

cl<- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

#exercise: calculate the dvi of 2006
dvi2006=m2006[[1]]-m2006[[2]]
plot(dvi2006)

cl<- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi2006, col=cl)

#NDVI for 1992
ndvi1992= (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])  
ndvi1992= dvi1992/ (m1992[[1]] + m1992[[2]])   
plot(ndvi1992, col=cl)


#NDVI for 2006
ndvi2006= (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])  
ndvi2006= dvi2006/ (m2006[[1]] + m2006[[2]])   
plot(ndvi2006, col=cl)

par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

#speeding up calculation
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)
#------------------------------------------------------------------
#06. Times Series

#time series analysiss #before and after.
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
#------------------------------------------------------------------
#07. External Data 

#External data #to import the data from external part
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

#cyrophere for ice data.#login kro phly 
#------------------------------------------------------------------
#08. Copernicus Data

# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

library(ncdf4)
library(terra)

# install.packages("name_of_the_package_here")

setwd("~/Downloads") # in W*****s \ means /

soilm2023 <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc")
plot(soilm2023)

# there are two elements, let's use the first one!
plot(soilm2023[[1]])

cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(soilm2023[[1]], col=cl)

ext <- c(22, 26, 55, 57) # minlong, maxlong, minlat, maxlat
soilm2023c <- crop(soilm2023, ext)

plot(soilm2023c[[1]], col=cl)

# new image
soilm2023_24 <- rast("c_gls_SSM1km_202311240000_CEURO_S1CSAR_V1.2.1.nc")
plot(soilm2023_24)
soilm2023_24c <- crop(soilm2023_24, ext)
plot(soilm2023_24c[[1]], col=cl)

#------------------------------------------------------------------
#09. Classification

# Procedure for classifying remote sensing data

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

sunc <- im.classify(sun)

plotRGB(sun, 1, 2, 3)
plot(sunc)

#-----

im.list()

# Import the data
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# Classification of 1992
m1992c <- im.classify(m1992, num_clusters=2)

# classes of 1992:
# class 1: agricultural areas
# class 2: forest

#2006

m2006c <- im.classify(m2006, num_clusters=2)

# classes of 2006:
# class 1: agricultural areas
# class 2: forest

# final estimates
# 1992
freq1992 <- freq(m1992c)
freq1992

# 2006
freq2006 <- freq(m2006c)
freq2006

# percentages
tot1992 = ncell(m1992)
perc1992 = freq1992 * 100 / tot1992
perc1992

# 1992: forest = 83.08%, agriculture = 16.91%

tot2006 = ncell(m2006)
perc2006 = freq2006 * 100 / tot2006
perc2006

# 2006: forest = 45.31%, agriculture = 54.69%

# building the output table
cover <- c("forest", "agriculture") 
perc1992 <- c(83.08, 16.91)
perc2006 <- c(45.31, 54.69)

# final table
p <- data.frame(cover, perc1992, perc2006)
p

# final plot
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white"))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white"))
p1+p2

# final plot - rescaled
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1+p2

#########################################################################################################################################
# Classifying satellite images and estimate the amount of change

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

# https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6
# additional images: https://webbtelescope.org/contents/media/videos/1102-Video?Tag=Nebulas&page=1

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

sunc <- im.classify(sun, num_clusters=3)

# classify satellite data

im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
  
m1992c <- im.classify(m1992, num_clusters=2)                    
plot(m1992c)
# classes: forest=1; human=2

m2006c <- im.classify(m2006, num_clusters=2)
plot(m2006c)
# classes: forest=1; human=2

par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])

f1992 <- freq(m1992c)
f1992
tot1992 <- ncell(m1992c)
# percentage
p1992 <- f1992 * 100 / tot1992 
p1992
# forest: 83%; human: 17%

# percentage of 2006
f2006 <- freq(m2006c)
f2006
tot2006 <- ncell(m2006c)
# percentage
p2006 <- f2006 * 100 / tot2006 
p2006
# forest: 45%; human: 55%

# building the final table
class <- c("forest", "human")
y1992 <- c(83, 17)
y2006 <- c(45, 55) 

tabout <- data.frame(class, y1992, y2006)
tabout #for table making

# final output
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p1 + p2 #for comparing 2 plot in one page
#but issue is that different scales h dono graph m.. is ko same kro
#tou is k lye limit lgaty (ylim) see next step

# final output, rescaled
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2
#start from satelite images, to check the forest lost in 2 dates (1992 and 2006) so is k lye itni chizen ki.
#latex to solve problem in writing and help to maintain the mind safety.

#------------------------------------------------------------------
#10. Variability

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

sd3<- focal(nir, matrix(1/9, 3, 3), fun=sd) #3,3 is the describation of 3x3 (#because matrix is sqaure)
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

#------------------------------------------------------------------
#11. Principal Component Analysis

library(image)
library(terra)
library(viridis)

im.list()

sent<- im.import("sentinel.png")
pairs(sent)

#perform PCA on sent.
sentpc<- im.pca(sent)
sentpc
pc1<- sentpc$PC1
plot(pc1)

viridisc <-colorRampPalette(viridis(7)) (255)
plot(pc1, col=viridisc)

#calculating standard deviation on top of PC1
pc1sd3<- focal(pc1, matrix(1/9, 3, 3), fun=sd)
plot(pc1sd3, col= viridisc)

#calculating standard deviation on top of PC1 (7x7)
pc1sd7<- focal(pc1, matrix(1/49, 7, 7), fun=sd)
plot(pc1sd7, col= viridisc)

par(mfrow=c(2,3))
im.plotRGB(sent, 2, 1, 3)
#sd from the variabilityscript
plot(sd3, col= viridisc)
plot(sd7, col= viridisc)
plot(pc1sd3, col= viridisc)
plot(pc1sd3, col= viridisc)

#stack all the standard deviation layers
sdstack <- c(sd3, sd7, pc1sd3, pc1sd7)
plot(sdstack, col=viridisc)
names(sdstack) <- c("sd3", "sd7", "pc1sd3", "pc1sd7")
plot(sdstack, col=viridisc)
#------------------------------------------------------------------
