#naive  bayes applicationi 

install.packages("mlbench")
library(mlbench)

# has naive bayes model 
library(e1071)


#data set up 
data("HouseVotes84", package = "mlbench")

#building model 
model <- naiveBayes(Class ~ ., data = HouseVotes84)

# get the prediction 
prediction <- predict(model, HouseVotes84)

# measure performance 
# use confusion matrix 
confusionMatrix <- table(prediction, HouseVotes84$Class)
confusionMatrix
