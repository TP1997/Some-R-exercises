#Tehtävä 5
a=2
b=3
n=1000

set.seed(123)
#Generate n random variates from U(0,1)
u=runif(n)
#Generate n random variates from Weibull(a,b)
f=function(u){
  a=9
  b=2
  return(b*(-log(u))^(1/a))
}
x=sapply(u, f)
y=rweibull(n, shape = 1)

par(mfrow=c(2,1))
hist(x)
hist(y)



ff=function(x){
  return(x^2)
}
y=sapply(1:3, ff)

