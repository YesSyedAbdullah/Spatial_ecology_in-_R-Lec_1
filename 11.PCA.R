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


