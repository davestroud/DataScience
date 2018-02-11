library(downloader) # For ease of downloading

# Download files form the internet
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/appleorange.csv", destfile="appleorange.csv")
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/stability.csv", destfile="stability.csv")

# Read in data, sAF ~ read in chr instead of factors
ao <- read.csv("BLT/appleorange.csv", stringsAsFactors = FALSE, header = FALSE)
str(ao)
aoraw <- ao
head(aoraw,10)
str(aoraw)
tail(aoraw,10)

# Delete last rows because of multiple na
aodata <- aoraw[3:700,]

# Rename columns
names(aodata) <- c("country", "countrynumber", "products", "productnumber","tonnes","year")
str(aodata)

# Change countrynumber from chr to integer
aodata$countrynumber <- as.integer(aodata$countrynumber)

# Identify "Food supply...."
fslines <- which(aodata$country == "Food supply quantity (tonnes) (tonnes)")

# Get rid of "Food supply...."
aodata <- aodata[(-1 * fslines),]
str(aodata)

# Clean up tonnes variable and make numeric using gsub
aodata$tonnes <- gsub("\xca", "", aodata$tonnes)
aodata$tonnes <- gsub(", tonnes \\(\\)", "", aodata$tonnes)
aodata$tonnes <- as.numeric(aodata$tonnes)
str(aodata)

# Change the year to 2009
aodata$year <- 2009

# Modify to make just apples dataset
apples <- aodata[aodata$productnumber == 2617, c(1,2,5)]
str(apples)

# Change column name to apples
names(apples)[3] <- "apples"
str(apples)

# Modify to make just oranges dataset
oranges <- aodata[aodata$productnumber == 2611, c(2,5)]
str(oranges)

# Change tonnes to oranges
names(oranges)[2] <- "oranges"

# Merge cleaned data
cleanao2 <- merge(apples, oranges, by="countrynumber", all=TRUE)
str(cleanao2)

# analyzing datasets
library(reshape2)


