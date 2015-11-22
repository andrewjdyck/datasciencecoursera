# Quiz 2

library(sqldf)
data <- read.csv('~/Downloads/getdata-data-ss06pid.csv', as.is=TRUE)

ht <- readLines('http://biostat.jhsph.edu/~jleek/contact.html')
sub <- ht[c(10, 20, 30, 100)]
nchar(sub)


file <- '~/Downloads/getdata-wksst8110.for'
head(readLines(file))
dat <- read.fwf(file, widths=c(10, 5, 8,5,4,4,5,8), skip=4)[5]
