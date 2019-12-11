data <- read.table("/home/tuoms/R/Scripts/MTTTA14/trees.txt", header=T)
data[1:5,] # first five rows extracted
summary(data$x) # range of x: [1100,1230]
summary(data$y) # range of y: [980.0,1029.9]
plot(data$x,data$y)

trees <- as.matrix(data)
trees <- as.data.frame(trees)
# dist() computes the distances
d <- dist(trees); d <- as.matrix(d); d <- as.data.frame(d);
diag(d)<-1000000
dv <- sapply(d,min); dmean<-mean(dv)
dmean # average distance in the data

#simulation starts (1000 draws)
dvv <- numeric(1000)
for (i in 1:1000) {
  dm<-data.frame(x=runif(237, 1100, 1230),
  y=runif(237, 980.9, 1029.9))
  dm <- dist(dm); dm<-as.matrix(dm); dm<-as.data.frame(dm);
  diag(dm) <- 100000
  dvv[i] <- mean(sapply(dm,min))
}
#def.off() command may be needed before the print command
hist(dvv, main="Distribution of the mean")
