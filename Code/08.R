#28-11-2023
#login and register yourself in copernicus:

## Data available at:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

library(ncdf4)
library(terra)
setwd("C:/Users/utente/Documents/GCE & SDGs/Lectures/Spatial Ecology in R/Assignment 28112023") #rough
Waterdata<- rast("g2_BIOPAR_WB-SWB_202012110000_H22V6_PROBAV_V1.4") #rough

setwd("C:/Users/utente/Downloads")
ssm <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc")

.
.#copy kro sir k file sy
.
  
cl <- colorRampPallete(c("red", "orange", "yellow")) (100)
plot(ssm[[1]], col=cl)

.
#crop function
ext<- c(22,26,55,57) #minlong, maxlong, minlat maxlat #plotgraph sy latitude and longitude dekho or wo likho..min or max kr k
ssmcrop<- crop(ssm, ext)
plot(ssmcrop[[1]], col=cl) #for cropping data
