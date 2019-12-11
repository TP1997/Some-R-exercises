a=1
b=2
c=3
y=matrix(c(1,2,3,4,5,6), ncol = 1)

X=matrix(c(rep(1,a), rep(0,b), rep(0,c),
           rep(0,a), rep(1,b), rep(0,c),
           rep(0,a), rep(0,b), rep(1,c)), ncol = 3)

#a.)
C = solve(t(X) %*% X)
round(C, 2)
#b.)
B1 = C %*% t(X)
B  = B1 %*% y
#c.)
H = X %*% B1
#d.)
Y = H %*% y
