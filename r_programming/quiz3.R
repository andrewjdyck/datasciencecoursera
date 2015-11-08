

library(datasets)
data(iris)

# Q1
mean(iris$Sepal.Length[iris$Species=='virginica'])
# 6.588

# Q2
apply(iris[, 1:4], 2, mean)

# Q3
data(mtcars)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# Q4
x <- with(mtcars, tapply(hp, cyl, mean))
abs(x["4"]-x["8"])
# 126.5779