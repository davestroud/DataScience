library(repmis)
library(RCurl)

# Link to short sale data on the NYSE
NYSE <- "ftp://ftp.nyxdata.com/Historical%20Data%20Samples/Short%20Sales/NYSEshvol20151214.txt"

# Download site file to directory
download.file(NYSE, destfile = "/Users/davidstroud/Dropbox/Data_Science1/DataScienceSMU/shortsale.txt")

# Searching for literal characters
test <-readLines("shortsale.txt")
grep("AA", test)
test[3:9]

# Search the beginning of a sentence
grep("^C", test)

# Search the end of a sentence
grep("N$", test)

# Search for number and view using test function
grep("[0-2]", test)
test[c(17:21)]

# Find specific numbers . is wildcard character
grep("9.11", test)
test[c(1:12)]

# using the or statement
grep("AFE|ADP", test)
test[c(39)]

# What does this mean?
grep("[0-9]+(.*)[0-9]",test)



