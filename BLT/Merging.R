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
