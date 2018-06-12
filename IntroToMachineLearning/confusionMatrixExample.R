library(caret)
library(e1071)
data(iris)



#rename dataset

dataset <- iris



# set data set for 10 fold crosss validation (function from caret package)

control <- trainControl(method = "cv", number = 10)

metric <- "Accuracy"




# fit model linear discriminant analysis 
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl = control)


# set training data to 80% I guess - for 10 fold cross validation 
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)


# validate vs. the test set, which is denoted below is the reamining data after removing the training 
# dataset. 
validation <- dataset[-validation_index,]


# predictions object 
predictions <- predict(fit.lda, validation)
# display confusion matrix (performance metric of model using 10 fold cross validation with generalize linear model)
confusionMatrix(predictions, validation$Species)
