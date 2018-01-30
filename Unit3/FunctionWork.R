AgeMed <- median(sleep$Age,na.rm = TRUE)
DurMin <- min(sleep$Duration,na.rm = TRUE)
DurMax <- max(sleep$Duration,na.rm = TRUE)
RsesAvg <-mean(sleep$RSES,na.rm=TRUE)
RsesSd <-sd(sleep$RSES,na.rm=TRUE)

report <- data.frame(AgeMed/5,RsesAvg/5,RsesSd/5,(DurMax-DurMin))

names(report)

colnames(report)[1] <- "MedianAge"
colnames(report)[2] <- "SelfEsteem"
colnames(report)[3] <- "SE_SD"
colnames(report)[4] <- "DurationRange"



SleepData <- function(x) {
  AgeMed <- median(sleep$Age,na.rm = TRUE)
  DurMin <- min(sleep$Duration,na.rm = TRUE)
  DurMax <- max(sleep$Duration,na.rm = TRUE)
  RsesAvg <-mean(sleep$RSES,na.rm=TRUE)
  RsesSd <-sd(sleep$RSES,na.rm=TRUE)
  
  colnames(report)[1] <- "MedianAge"
  colnames(report)[2] <- "SelfEsteem"
  colnames(report)[3] <- "SE_SD"
  colnames(report)[4] <- "DurationRange"
  
  report <- data.frame(AgeMed/5,RsesAvg/5,RsesSd/5,(DurMax-DurMin))
  return(report)
}


fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp * 32) * (5/9) + 273.15)
  return(kelvin)
}

# Male vs Female on the Titantic ~ categorical to numeric
class(df$Sex)
summary(df$Sex)
is.factor(df$Sex)

as.factor(df$Sex)

df$Sex <- as.factor(df$Sex)

is.factor(df$Sex)

hist(df$Sex)

####################
length(df$Sex)

sum(df$Sex)

sapply(df$Sex, unique)


vapply(df$Sex, class, character(1))


#######################

df$Sex <- as.factor(df$Sex)
df$Sex

hist(df$Sex)

summary(df$Sex)
hist(df$Sex)    
