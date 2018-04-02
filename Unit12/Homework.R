library("dygraphs")
library("forecast")

# Warm Up: Brief Financial Data
summary(EuStockMarkets)
str(EuStockMarkets)
plot(EuStockMarkets[,"DAX"],main="Daily Closing Prices of Germany DAX (Ibis)",
     xlab="Year",ylab="Price",col="blue")
abline(h=0, v=1997, col="red")

#Decompose
EUComp <- decompose(EuStockMarkets[,"DAX"], type=c("multiplicative"), filter = NULL)
plot(EUComp)

