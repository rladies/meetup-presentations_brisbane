
# sample.depth is global variable
# dist.matrix.row <- dist.grid.samples[1,]

interpolate.depth <- function(dist.matrix.row){
  names(dist.matrix.row) <- 1:length(dist.matrix.row)
  nearest.neighbours <- sort(dist.matrix.row)[1:3]
  if(nearest.neighbours[1]==0) return(sample.depth[as.numeric(names(nearest.neighbours[1]))])
  depth.interpolated <- sample.depth[as.numeric(names(nearest.neighbours))]
  nearest.weight = as.numeric(1/as.numeric(nearest.neighbours)/sum(1/as.numeric(nearest.neighbours)))
  sum(nearest.weight * depth.interpolated)
}



