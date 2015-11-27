

# Quiz 3

#q1
data(mtcars)
library(lmtest)
m1 <- lm(mpg ~ as.factor(cyl) + wt, data=mtcars)
# 6.071

# q2
m2 <- lm(mpg ~ as.factor(cyl), data=mtcars)
m22 <- lm(mpg ~ as.factor(cyl) + wt, data=mtcars)
# first ans: holding weigt const, cyl has more impact
# second ans: Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.

# q3
m3 <- lm(mpg ~ as.factor(cyl)*wt, data=mtcars)
m33 <- lm(mpg ~ as.factor(cyl) + wt + as.factor(cyl)*wt, data=mtcars)
lrtest(m1, m3)
lrtest(m1, m33)
# The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.

# q4 (wrong)
m4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
# first: Estimated incr. per 1/2 ton weight.
# second: The estimated expected change in MPG per half ton increase in weight for for a specific number of cylinders (4, 6, 8).

# q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
mxy <- lm(y ~ x)
influence.measures(mxy)
# .9946


# q6
# 134

# q7
# it's possible for the coef to change sign.



