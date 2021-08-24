library(raster)

source('./R/generate_data.R')
source('./R/interpolate.R')

ngrid = 100
nsamp = 1000
seed = 3854

set.seed(seed)

x1 <- x2 <- get.grid(ngrid)
depth <- get.depth(x1, x2)

# quick plot
image(x1, x2, matrix(depth, ngrid, ngrid))
contour(x1, x2, matrix(depth, ngrid, ngrid), add = TRUE)

data = cbind(expand.grid(x1, x2),depth)
sample.idx = sample(1:ngrid^2, nsamp, replace=FALSE)

# nearest neighbors for interpolation
sample.x1.x2 <- data[sample.idx,1:2]
sample.depth <- data[sample.idx,3]

image(x1, x2, matrix(depth, ngrid, ngrid)) + points(sample.x1.x2[,1], sample.x1.x2[,2])

# nearest neighbors to get depth value
dist.grid.samples <- raster::pointDistance(expand.grid(x1, x2), sample.x1.x2, longlat=FALSE)
interpolated.depth <- apply(dist.grid.samples, 1, function(x) interpolate.depth(c(x)))

image(x1, x2, matrix(interpolated.depth, ngrid, ngrid)) 

save.image(file=paste0('./results/ngrid',ngrid,'nsamp',nsamp,'seed',seed,'.Rdata'))

