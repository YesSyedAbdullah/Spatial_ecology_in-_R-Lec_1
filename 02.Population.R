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

####################Lecture 05###################











