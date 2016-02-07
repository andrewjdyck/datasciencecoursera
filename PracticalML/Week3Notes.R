
library(ElemStatLearn)
data(ozone, package='ElemStatLearn')

t <- loess(temperature ~ ozone, data=ozone, span=0.2)
