# Quiz 1

file_loc <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
file <- download.file(file_loc, './quiz1.csv')
data <- read.csv('~/Downloads/getdata-data-ss06hid.csv', as.is=TRUE)

library(xlsx)
dat <- read.xlsx('~/Downloads/getdata-data-DATA.gov_NGAP.xlsx', 
                  sheetIndex=1, 
                  startRow=18, endRow=23,
                  colIndex=7:15,
                  header=TRUE)
sum(dat$Zip*dat$Ext,na.rm=T) 

library(XML)
library(plyr)
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
doc <- xmlTreeParse('~/Downloads/getdata%2Fdata%2Frestaurants.xml')
rootNode <- xmlRoot(doc)
xpathApply(rootNode, "//zipcode", xmlValue)
rootNode['//zipcode']
ldply(xmlToList(doc), function(x) { data.frame(x[!names(x)=="author"]) } )
l <- xmlToList(doc)


library(data.table)
csv <- '~/Downloads/getdata-data-ss06pid.csv'
DT <- fread(csv)
DT[,mean(pwgtp15),by=SEX]
