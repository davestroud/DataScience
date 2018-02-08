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
head(GatheredFert)
str(GatheredFert)

# Change the name using the rename function
GatheredFert <- rename(GatheredFert, year=Year,FertilizerConsumption=Fert)
str(GatheredFert)

# View data on the basis of country and year using order function
GatheredFert <- GatheredFert[order(GatheredFert$country, GatheredFert$year),]
head(GatheredFert)

# Plot the data looking for outliers
ggplot(data = GatheredFert,aes(FertilizerConsumption))+ geom_density() + xlab("\n Fertilizer Consumption")+ylab("Density\n") + theme_bw()

# Focus on Fertilizer consumption that is less than 1000
FertOutliers <- subset(x=GatheredFert, FertilizerConsumption > 1000)
# Another example of how to subset
GatheredFertSub <- subset(x=GatheredFert, FertilizerConsumption <= 1000)

# Subset that removes Arab World from the data set
GatheredFertSub <- subset(x=GatheredFertSub, country != "Arab World")
str(GatheredFertSub)

# Get rid of missing values
GatheredFertSub <- subset(x=GatheredFertSub, !is.na(FertilizerConsumption))

# Preparing to merge FertConsumpData with GatheredFertSub
table(GatheredFertSub$country)

# Change name from Korea,Rep to South Korea
GatheredFertSub$country[GatheredFertSub$country == "Korea, Rep."] <- "South Korea"
FertConsumpData$country[FertConsumpData$country == "Korea, Rep."] <- "South Korea"

# Log transform fertilizer consumption, use 0.001 if min = -inf
GatheredFertSub$FertilizerConsumption[GatheredFertSub$FertilizerConsumption == 0] <- 0.001
GatheredFertSub$logFertConsumption <- log(GatheredFertSub$FertilizerConsumption)
summary(GatheredFertSub$logFertConsumption)

# Creating factor variables
attach(GatheredFertSub) # dont have to use $
GatheredFertSub$FertConsGroup[FertilizerConsumption <= 18] <- 1
GatheredFertSub$FertConsGroup[FertilizerConsumption > 18 & FertilizerConsumption <= 81] <- 2
GatheredFertSub$FertConsGroup[FertilizerConsumption > 81 & FertilizerConsumption <= 158 ] <- 3
GatheredFertSub$FertConsGroup[FertilizerConsumption > 158 ] <- 4
summary(GatheredFertSub$FertConsGroup)

# Create labels for the data
FCLabels <- c("low","medium low","medium high","high")
str(GatheredFertSub)

# Convert data to a factor with labels
GatheredFertSub$FertConsGroup <- factor(GatheredFertSub$FertConsGroup, labels = FCLabels)
summary(GatheredFertSub)
str(GatheredFertSub)

# Load file from URL address ~ two different ways
fileURL <- "https://github.com/fivethirtyeight/data/blob/master/congress-age/congress-terms.csv"
Congress <- source_data(fileURL, sep = ",", header = TRUE)

UrlAddress <- "https://raw.githubusercontent.com/christophergandrud/Disproportionality_Data/master/Disproportionality.csv"
DataURL <- getURL(UrlAddress)
