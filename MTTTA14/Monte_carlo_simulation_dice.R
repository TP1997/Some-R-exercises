#Monte carlo simulation 2
#set.seed(123)
#Function to simulate 100-side dice rolling
rolldice=function(){
  dice=runif(1,1,100)
  if(dice<=51)
    return(FALSE)
  else
    return(TRUE)
}
#Function to simulate playing session:
play=function(tot_funds, wager_amount, total_plays){
  funds=numeric(total_plays+1)
  funds[1] = tot_funds
  
  for (play in 1:total_plays+1) {
    if(rolldice())
      tot_funds = tot_funds + wager_amount
    else
      tot_funds = tot_funds - wager_amount
    
    funds[play] = tot_funds
    
  }
  return(funds)
}

#The money player is starting with:
funds=10000
#The amount the player bets in each game:
wager=100
#The number of times the player plays the game:
total_plays=500

#Simulate the game
scenarios=10
results=replicate(scenarios, play(funds, wager, total_plays))

#plot the results
plot(results[,1], type = "l", xlab = "Play number", ylab = "Funds", col="red", ylim = c(min(results), max(results)) )
abline(h=funds)
for (i in 2:scenarios) {
  color=runif(3, 0, 255)
  lines(results[,i], col=color)
}

cat("The player starts with $",funds,"and ends with $",mean(results[total_plays+1,]))




