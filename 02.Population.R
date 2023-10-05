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


















