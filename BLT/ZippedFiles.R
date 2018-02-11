# Downloading zip files from the internet
URL <- "http://bit.ly/1jXJgDh"

# Create a temp file to put zip file into
temp <- tempfile()

# Download compressed file into temporary file
download.file(URL,temp)

# Decompompress the file into the temporary file
UDSData <- read.csv(gzfile(temp,"uds_summary.csv"))

# Delete the temporary file
unlink(temp)

# Show variables in data
names(UDSData)

# Dimensions for the file
dim(UDSData)

# Variable types for the file
typeof(UDSData)
