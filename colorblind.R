Simulating color blind vision:

library(devtools)
install_github("clauswilke/colorblindr")
library(colorblindr)

library(ggplot2)

iris

fig <- ggplot(iris, aes(Sepal.Length, fill = Species)) + geom_density(alpha = 0.7)
fig  

cvd_grid(fig)

#######or (taken from prof. respoiratory)

library(devtools)
library(colorblindr)

install_github("clauswilke/colorblindr")

library(ggplot2)
fig <- ggplot(iris, aes(Sepal.Length, fill = Species)) + geom_density(alpha = 0.7)
fig
