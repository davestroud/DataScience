library(tidyr)
library(dplyr)
library(countrycode)
library(ggplot2)
library(repmis)
library(RCurl)
library(WDI)

# Get data
WDIsearch("fertilizer consumption")
FertConsumpData <- WDI(indicator = "AG.CON.FERT.PT.ZS")
dim(FertConsumpData)
str(FertConsumpData)
head(FertConsumpData)

# Convert from long format to wide format
SpreadFert <- spread(FertConsumpData, year, AG.CON.FERT.PT.ZS)
head(SpreadFert)

# Use arrange function to view data differently
SpreadFert <- arrange(SpreadFert, country)
head(SpreadFert)

# Use gather function create long format from wide format
GatheredFert <- gather(SpreadFert, Year, Fert, 3:9)
str(GatheredFert)
