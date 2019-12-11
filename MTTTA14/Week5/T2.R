#Tehtävä 2

m=1
n=2
p=1-m/(m+n)

set.seed(123456)
u=runif(1,0,1)
X=1
if(u<=p)
  X=0
