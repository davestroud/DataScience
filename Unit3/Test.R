mean(c(2,4,5))

SleepData <- function(x) {
}


my_mean <- function(my_vector) {
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
  sum(my_vector) / length(my_vector)
}


remainder <- function(num, divisor=2) {
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
  num %% divisor
}


evaluate <- function(func, dat){
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
  func(dat)
}

evaluate(function(x){x+1}, 6)

# Evaluates the first number
evaluate(function(x){x[1]}, c(8, 4, 0))

# Evaluates the last number
evaluate(function(x){x[length(x)]}, c(8, 4, 0))


data <- data.frame(sex=c(rep('Male', 5), rep('Female', 5)))

str(data)

levels(df$Sex) <- c(1,0)

str(df$Sex)
hist(df$Sex)
hist(levels(df$Sex))
hist(df$Sex)


##########################

df$Sex <- as.factor(df$Sex)
data$isFemale <- as.numeric (df$Sex)

hist(df$Sex)
count(df$Sex=='male')

