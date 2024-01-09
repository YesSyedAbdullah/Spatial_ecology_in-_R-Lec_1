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











