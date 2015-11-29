
# Getting data Quiz 4

# q1
d1 <- read.csv('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
               as.is=TRUE)
strsplit(names(d1), 'wgtp')[[123]] #'' '15'

#q2
d2 <- read.csv(
  'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
  as.is=TRUE,
  skip=5,
  head=FALSE,
  col.names = c('country', 'rank', 'n1', 'name', 'gdp', 'n2', 'n3', 'n4', 'n5', 'n6')
)
gdp <- as.numeric(gsub(',', '', d2$gdp))
mean(gdp[1:190], na.rm = TRUE) # 377652.4

#q3
grep('^United', d2$name[1:190]) # grep("^United",countryNames), 3

#q4
d4 <- read.csv(
  'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
  as.is=TRUE
)
matched <- merge(d2[1:190, ], d4, by.x='country', by.y='CountryCode', all.y=TRUE)
notes <- tolower(matched$Special.Notes)
length(grep('fiscal', notes[grep('june', notes)])) #13

#q5
install.packages('quantmod')
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
times2012 <- sampleTimes[grep('^2012', sampleTimes)]
length(times2012)
length(grep('Monday', weekdays(times2012)))
