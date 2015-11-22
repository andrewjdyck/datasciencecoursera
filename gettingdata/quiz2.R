
# quiz2.R

# Q1
# 2013-11-07T13:25:07Z

# Q2
library(sqldf)
acs <- read.csv(
  './gettingdata/acs.csv', 
  as.is=TRUE, header=TRUE)
sqldf("select pwgtp1 from acs where AGEP < 50")

#q3
sqldf("select distinct AGEP from acs")

#Q4
library(XML)
dat <- readLines('http://biostat.jhsph.edu/~jleek/contact.html')
sapply(c(10, 20, 30, 100), function(x) nchar(dat[x]))

#Q5
dat <- read.fwf('https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for',
                widths = c(1,9, rep(c(5, 4, 1, 3), 4)),
                skip=4
)
sum(dat$V8)
