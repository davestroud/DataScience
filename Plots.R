library(ggplot2)
library(gcookbook)

# simple data set
simpledat
barplot(simpledat,beside = TRUE)

# Switch axis
t(simpledat)

# generate chart with new axis
barplot(t(simpledat),beside=TRUE)

# generate a line chart w/ blue line
plot(simpledat[1,], type = "l")
lines(simpledat[2,], type = "l",col='blue')

# use reshape2 library and melt function to reshape data
library(reshape2)
melt(simpledat)

# data in library
simpledat_long


ggplot(simpledat_long, aes(x=Aval, y=value,
                           fill=Bval)) +
  geom_bar(stat = "identity", position = "dodge")
