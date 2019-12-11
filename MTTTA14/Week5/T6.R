#Tehtävä 6
library(MASS)

#Set a,b > 0
a=2
b=2
#Create matrix V & Zero vector
p=5
V=diag(a, p ,p) + matrix(rep(b, p*p), nrow = p)
ZeroVec=matrix(0, nrow = p, ncol = 1)
#Generate vectors from N(0,V)
n=5
mvrnorm(n, ZeroVec, V)

f=function(a,b,p,n){
  V=diag(a, p ,p) + matrix(rep(b, p*p), nrow = p)
  ZeroVec=matrix(0, nrow = p, ncol = 1)
  
  mvrnorm(n, ZeroVec, V)
}

f(2,2,5,5)