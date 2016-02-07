library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(pgmm)
library(ElemStatLearn)


#inTrain <- createDataPartition(y=segmentationOriginal$Case, p=0.7, list=FALSE)
training <- segmentationOriginal[segmentationOriginal$Case=='Train', ]
testing <- segmentationOriginal[segmentationOriginal$Case=='Test', ]
set.seed(125)
modelFit <- train(Class ~ ., method='rpart', data=training)
#predict(modelFit, newdata=testing)
plot(modelFit$finalModel, uniform = TRUE)
text(modelFit$finalModel, use.n=TRUE, all=TRUE, cex=.8)
print(modelFit$finalModel)
#1 a=PS, b=WS, c=PS, d=Not Possible

#2 The bias is larger and the variance is smaller. Under leave one out cross validation K is equal to the sample size.

#3 
library(pgmm)
data(olive)
olive = olive[,-1]
model3 <- train(Area ~ ., data=olive, method='rpart')
predict(model3, newdata = as.data.frame(t(colMeans(olive))))
#A: 2.783 It is strange because Area should be a qualitative variable - but tree is reporting the average value of Area as a numeric variable in the leaf predicted for newdata


#Q4: 
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
inTrain = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[inTrain,]
testSA = SAheart[-inTrain,]

set.seed(13234)
trainSA$chd <- factor(ifelse(trainSA$chd == 1, "yes", "no"),
                      levels = c("yes", "no"))
model4 <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, 
                method='glm', family=binomial, data=trainSA,
                trControl = trainControl(method = "none", classProbs = TRUE))
#model4 <- glm(chd ~ age + alcohol + obesity + tobacco + typea + ldl,
#              family='binomial', data=trainSA)

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
missClass(as.numeric(trainSA$chd)-1, predict(model4, type = 'prob')[,1])
#ANS: tes t = 0.31; train=0.27

#Q5
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train$y <- as.factor(vowel.train$y)

set.seed(33833)
model5 <- train(y ~ ., data=vowel.train, method='rf', prox=TRUE)
#Ans: x.2, x.1, x.5, x.6, x.8, x.4, x.9, x.3, x.7,x.10
