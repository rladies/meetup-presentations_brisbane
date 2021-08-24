

get.grid <- function(ngrid=100){
  seq(0, 10, length = ngrid)
}

get.depth <- function(x1, x2){
  mu1 <- c(5,6)
  mu2 <- c(3,4)
  sigma1 <- matrix(c(1,0.5,0.5,2), 2, 2)
  sigma2 <- matrix(c(1.5,0.7,0.7,1), 2, 2)
  dmvnorm(as.matrix(expand.grid(x1, x2)), mu1, sigma1) + dmvnorm(as.matrix(expand.grid(x1, x2)), mu2, sigma2)
}



