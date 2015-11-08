
# Statistical Inference Quiz 1

#Q1
AorB <- .17
A <- .12
AandB <- .06
B <- AorB-A + AandB

#Q2
.75

#Q3
p/(1-p) = Y/X

#Q4
# Median must be zero

#Q5
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp
sum(x*p)

#Q6
A <- .05 # P(A)
Ac <- (1-A) #P(A^c)
sens <- .93 # P(T+|A)
spec <- .88 # P(T-|A^c)
sens2 <- (1-sens) #P(T-|A)

ans <- (spec*(Ac))/(spec*Ac+(1-sens)*A)


A <- .3 # P(A)
Ac <- (1-A) #P (A^c)
sens <- .75 # P(T+|A)
sens2 <- (1-sens) # P(T-|A)
spec <- .52 # P(T-|A^c)
spec2 <- (1-spec) # P(T+|A^c)

ans <- (spec*(Ac))/(spec*Ac+(1-sens)*A)
ans2 <- (A*sens)/(sens*A + spec2*Ac)


