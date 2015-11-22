
data <- read.csv('~/Downloads/getdata-data-ss06hid.csv', 
                 colClasses=rep('character', 188)
                 )

length(data[data$VAL == '24' & is.na(data$VAL)==FALSE,'VAL'])
# 53

library(xlsx)
dat <- read.xlsx('~/Downloads/getdata-data-DATA.gov_NGAP.xlsx', 
                 1,
                 startRow=18,
                 endRow=23)[, 7:15]
sum(dat$Zip*dat$Ext,na.rm=T)
# 36534720

# 28
library(XML)
xml_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'\
file <- '~/Downloads/getdata%2Fdata%2Frestaurants.xml'
doc <- xmlTreeParse(file, useInternal=TRUE)
root <- xmlRoot(doc)[[1]]

url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(url, './gettingdata/acs.csv', method='cu')
DT <- fread('./gettingdata/acs.csv')
