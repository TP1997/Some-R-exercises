set.seed(394452)
X <- numeric(8)
X[1] <- 100 # initial investment

results <- replicate(10000, {
  for (t in 1:7)
    X[t + 1] <- X[t] * exp(rnorm(1, mean = 0, sd = log(1.01)))
  X
})

#Structure of results displayed compactly:
str(results) # "results" is a 8*10000 matrix
  results[,1:5] # first five columns extracted

#Frequency of occurrences is calculated with the all
#function testing validity of the inequality below for
#the components of vector x ("2" indicates columnwise
#application):
table(apply(results, 2, function(x) all(x[2:8] > 100)))
#Stock price does not shrink below the investment (=100)
# never during the week with probability about 0.21.
# The corresponding probability for the following five
# days is about 0.25:
table(apply(results, 2, function(x) all(x[2:6] > 100)))