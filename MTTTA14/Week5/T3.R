#Tehtävä 3
set.seed(123)
n=10000
#Generate random numbers (coordinates) from uniform distribution
x=runif(n, 0, 1)
y=runif(n, 0, 1)
#Calculate point's distance from origin
z=sqrt(x^2+y^2)
#Get number of points which are outside of circle
outside=length(which(z<1))
#Approximate pi's value
pi=4*outside/n
