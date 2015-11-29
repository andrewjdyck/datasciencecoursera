
# Statistical Inf Quiz 4
#Q1
d1 <- data.frame(
  subject=1:5,
  baseline=c(140,138,150,148,135),
  week2=c(132,135,151,146,130)
)
t.test(d1$baseline,d1$week2, paired=TRUE, alternative = 'two.sided')
# 0.087

#Q2
1100 + qt(0.975, df=8)*30/sqrt(9)
# 1077 to 1123

#Q3 (wrong)
TeaTasting <-  matrix(c(3, 1, 1, 3), nrow = 2,
                      dimnames = list(Guess = c("Milk", "Tea"),
                         Truth = c("Milk", "Tea")))
pop <- matrix(c())
fisher.test()
#0.10

#Q4 (wrong)
10/1787
# 0.11

#Q5
t5 <- (-3-1)/sqrt((1.5^2)/9 + (1.8^2)/9)
round(1-pt(t5, df=17, lower.tail = FALSE), 4)

#Q6
# No, you wouldn't reject

#Q7
z <- qnorm(1-0.05)
1-pnorm(0 + z*0.04/sqrt(100), mean=.01, sd=0.04/sqrt(100))
# 0.80

#Q8
z <- qnorm(1-0.05)
n <- 120
1-pnorm(0 + z*0.04/sqrt(n), mean=.01, sd=0.04/sqrt(n))
# 140

#Q9
# larger power

