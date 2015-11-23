

# Quiz 3

#q1
data(mtcars)
m1 <- lm(mpg ~ as.factor(cyl) + wt, data=mtcars)

# q2
m2 <- lm(mpg ~ as.factor(cyl), data=mtcars)
# holding weigt const, cyl has more impact

# q3
m3 <- lm(mpg ~ as.factor(cyl)*wt, data=mtcars)
lrtest(m1, m3)

# q4
m4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
# Estimated incr. per 1/2 ton weight.

# q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
mxy <- lm(y ~ x)
influence.measures(mxy)


# q6


# q7
# it's possible for the coef to change sign.



