#Tehtävä 8
#Old drug:
X1=c(34, 45, 23, 46, 37, 12, 19, 30, 27, 28)
#New drug:
X2=c(42, 36, 47, 28, 36, 39, 45, 26, 49, 20)
#Larger == better
#H0: uX1 = uX2
#H1: uX1 < uX2
tObs = t.test(X2,X1, alternative=c("less"), var.equal=TRUE)$statistic[["t"]]
#H0 hyväksytään 5% riskitasolla

#Observed mean difference from sample:
obsDiff = mean(X2)-mean(X1)

#Testaus ilman jakaumaoletusta:

#Divide combined sample randomly into two groups
perms = factorial(20) / (factorial(10) * factorial(10))
ts=numeric(perms)
simDiff=numeric(perms)

set.seed(87736)
z <- c(34, 45, 23, 46, 37, 12, 19, 30, 27, 28, 42, 36, 47, 28, 36, 39, 45, 26, 49, 20)
for (i in 1:perms) {
  x1_indeces <- sample(1:20,10, replace = FALSE)
  x1 <- z[x1_indeces]
  x2 <- z[-x1_indeces]
  
  ts[i]=t.test(x1,x2, alternative=c("less"), var.equal=TRUE)$statistic[["t"]]
  simDiff[i] = mean(x2) - mean(x1)
}
hist(ts)
sum(simDiff > obsDiff) / perms
sum(ts > tObs) / perms

