
# Practical ML Quiz 4

library(caret)

#Q1
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)
set.seed(33833)

model1.1 <- train(y ~ ., data = vowel.train, method='rf')
model1.2 <- train(y ~ ., data=vowel.train, method='gbm')
pred1.1 <- predict(model1.1, vowel.test)
pred1.2 <- predict(model1.2, vowel.test)
acc1.1 <- sum(pred1.1==vowel.test$y)/length(vowel.test$y)
acc1.2 <- sum(pred1.2==vowel.test$y)/length(vowel.test$y)
aggreement <- vowel.test[pred1.1==pred1.2,]
pred1.3 <- predict(model1.1, aggreement)
acc1.3 <- sum(pred1.3==aggreement$y)/length(pred1.3)

# Ans
# RF Accuracy = 0.6082
# GBM Accuracy = 0.5152
# Agreement Accuracy = 0.6361


# Q2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)
model2_rf <- train(diagnosis ~ ., data=training, method='rf')
model2_gbm <- train(diagnosis ~ ., data=training, method='gbm')
model2_lda <- train(diagnosis ~ ., data=training, method='lda')

pred_rf <- predict(model2_rf, testing)
pred_gbm <- predict(model2_gbm, testing)
pred_lda <- predict(model2_lda, testing)

combined_data <- data.frame(
  diagnosis=testing$diagnosis, 
  rf=pred_rf, gbm=pred_gbm, lda=pred_lda)

model_comb <- train(diagnosis ~ ., data=combined_data, method='rf')
pred_comb <- predict(model_comb, combined_data)

acc_rf <- sum(pred_rf == testing$diagnosis)/length(pred_rf)
acc_gbm <- sum(pred_gbm == testing$diagnosis)/length(pred_gbm)
acc_lda <- sum(pred_lda == testing$diagnosis)/length(pred_lda)
acc_comb <- sum(pred_comb == combined_data$diagnosis)/length(pred_comb)

# Ans: Stacked Accuracy: 0.80 ; LDA & RF are the same.

# Q3
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)

model3 <- train(CompressiveStrength ~ ., data=training, method='lasso')
par(mfrow=c(1,1))
plot(model3$finalModel)
# Ans: Cement

# Q4
library(lubridate) # For year() function below
dat = read.csv("~/Downloads/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

library(forecast)
model4 <- bats(tstrain)

pred_bats <- forecast(model4, h=length(testing$visitsTumblr),level=c(95))
acc_bats <- accuracy(pred_bats, testing$visitsTumblr)
sum(testing$visitsTumblr <= pred_bats$upper)/nrow(testing)
# Ans: 96% (mine: 0.9617)


# Q5
set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
library(e1071)
model5 <- svm(CompressiveStrength ~., data=training)
pred_svm <- predict(model5, testing)
rmse <- sqrt(sum((pred_svm - testing$CompressiveStrength)^2))
mse <- sum((pred_svm - testing$CompressiveStrength)^2)
#Ans: 107.44 - did not get this one right