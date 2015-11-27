

# Get data quiz 3

#q1
dd1 <- read.csv('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', header=TRUE, as.is=TRUE)
dd1$agricultureLogical = ifelse(dd1$ACR==3 & dd1$AGS == 6, TRUE, FALSE)
head(dd1[which(dd$agricultureLogical),1:6])

#q2
install.packages('jpeg')
library(jpeg)
dd2 <- readJPEG('./getdata-jeff.jpg')
quantile(dd2, c(.3,.8))
# -14191406-10904118

#q3
gdp <- read.csv('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', 
                header=TRUE, as.is=TRUE,
                skip=4)
names(gdp) = c('CountryCode', 'GDPrank', 'nothing', 'CountryName', 'GDP',
                              'x1', 'x2', 'x3', 'x4', 'x5')
edu <- read.csv('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv', header=TRUE, as.is=TRUE)
dd3 <- merge(gdp[1:195, c('CountryCode', 'GDPrank')], edu, by.x=gdp$CountryCode, by.y=edu$CountryCode, all.x=TRUE)
# 189, St. Kitts/Nevis

#q4
# 32.96667, 91.91304

# q5 
# 5
