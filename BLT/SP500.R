# Libraries
library(tseries)

# Download the data.
SNPdata <- get.hist.quote('^gspc', quote = 'Close')

# Calculate log returns.
SNPret <- log(lag(SNPdata)) - log(SNPdata)

# Calculate volatility measure.
SNPvol <- sd(SNPret) * sqrt(250) * 100

# Vol function
Vol <- function(d, logrets) {
  var = 0
  lam = 0
  
  varlist <- c()
  for(r in logrets) {
    lam = lam*(1-1/d) + 1
    var = (1-1/lam)*var + (1/lam)*r^2
    varlist <- c(varlist, var)
  }
  sqrt(varlist)
}

# Calculate volatility over entire length of series for various three different decay factors.
volest <- Vol(10,SNPret)
volest2 <- Vol(30,SNPret)
volest3 <- Vol(100,SNPret)

# Plot the results, overlaying the volatility curves on the data, just as was done in the S&P example.