#Tehtävä 7

set.seed(123)
gen1=function(n, pis, us, sss){
  u=t(pis) %*% us
  ss=t(pis) %*% sss
  return(rnorm(n, u, sqrt(ss)))
}

#Anna tunnusluvut:
pis=matrix(c(0.28,0.18,0.54), nrow = 3)
us=matrix(c(110,187,229), nrow = 3)
sss=matrix(c(354,320,845), nrow = 3)

gen1(10, pis, us, sss)

