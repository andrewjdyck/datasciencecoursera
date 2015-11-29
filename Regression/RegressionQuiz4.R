# Regression Quiz 4
#Q1
library(MASS)
data("shuttle")
m1 <- glm(use ~ wind, data = shuttle, family = "binomial")
exp(m1$coefficients) # 0.969


#Q2 (wrong)
m2 <- glm(use ~ wind + magn, data = shuttle, family = "binomial")
exp(m2$coefficients) # 0.684

#Q3
m3 <- glm((1-(as.numeric(use)-1)) ~ wind , data = shuttle, family = "binomial")
# coefs reverse sign

#Q4
data("InsectSprays")
m4 <- glm(count ~ spray, family="poisson", data=InsectSprays)
1/exp(m4$coefficients) #0.9457

#Q5
# coefficient on x unchanged

#Q6
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
m6 <- lm(y ~ x + ifelse(x<0, 0, x))
sum(m6$coefficients[2:3])

