#Permutation and randomization test

# gl() or "generate levels" is a handy function.
# Columnwise factor levels for A; 3 levels repeated 2 times:
A <- gl(3,2,24)
# Columnwise factor levels for B; 4 levels repeated 6 times:
B <- gl(4,6,24)

y <- c(5,5,0,4,0,8,11,9,5,10,12,8,5,0,0,6,5,10,12,16,16,15,22,26)

expr <- data.frame(A,B,y)

l <- aov(y~A*B, data = expr)

summary(l)

# random permutations are generated for each level of B
set.seed(788295)

fsamp <- function(F){
  f <- factor(sample(F[1:6], 6, replace = FALSE))      # Lev1
  f <- c(f,factor(sample(F[1:6], 6, replace = FALSE))) # Lev2
  f <- c(f,factor(sample(F[1:6], 6, replace = FALSE))) # Lev3
  f <- c(f,factor(sample(F[1:6], 6, replace = FALSE))) # Lev4
  
  f
}

v <- numeric(4999)
for (i in 1:4999){
  v[i] <- (anova(aov(expr$y~fsamp(expr$A)*expr$B))$F[1])
  
}

sum(v>4.217)/4999



