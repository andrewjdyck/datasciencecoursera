
# Regression quiz 2
# Q1
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
m <- lm(y~x)
summary(m)


# Q2
summary(m)

# Q3
data("mtcars")
m <- lm(mtcars$mpg ~ mtcars$wt)
summary(m)
confint(m)


#q4
#The estimated expected change in mpg per 1,000 lb increase in weight.

#q5
int <- m$coefficients[1]
coef <- m$coefficients[2]
se1 <- summary(m)$coefficients[1,2]
se2 <- summary(m)$coefficients[2,2]
int + 1.96*se1 + (coef*3) + 1.96*se2
# 27.57


#q6
confint(m)[2,1]
# -12.973
x <- (mtcars$wt/2)
lm(mtcars$mpg ~ x)

#q7

# mult by 100

#q8
c <- 5
xx <- mtcars$wt + c
m2 <- lm(mtcars$mpg ~ xx)
m1 <- lm(mtcars$mpg ~ mtcars$wt)
i1 <- m1$coefficients[1]
i2 <- m2$coefficients[1]
# intercept == int - b*c
i1 - m1$coefficients[2]*c

# q9
m1 <- lm(mtcars$mpg ~ 1)
m2 <- lm(mtcars$mpg ~ mtcars$wt)
sum(m2$residuals)/sum(m1$residuals)
# 0.25

# q10
sum(rnorm(100000))
# residuals never sum to zero

