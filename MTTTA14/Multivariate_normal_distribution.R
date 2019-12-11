# To comprehend the code below, try first these commands:
rnorm(2)
n <- 10
matrix(rnorm(2*n), nr=2)
r <- 0.3
r^(1!=diag(2))

# The simulation starts from here.
twodnorm<-function(n=1000, r=0){
 mm<-r^(1!=diag(2)); mm<-t(chol(mm)) # Cholesky decomposition
ma<-mm%*%matrix(rnorm(2*n), nr=2)
ma<-data.frame(x1=ma[1,], x2=ma[2,])
ma}

par(mfrow=c(2,2)) # Four figures into one.
## [ready for figure]
plot(twodnorm(r=0.0)); plot(twodnorm(r=0.3));
## [first two figures]
plot(twodnorm(r=0.6)); plot(twodnorm(r=0.9))
## [two figures more]
# Try varying the correlation coefficients r in the two
# above commands!
par(mfrow = c(1,1)) # Back to the one figure scheme.