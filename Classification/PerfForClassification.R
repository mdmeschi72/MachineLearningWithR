## classification applications 
## classification with kNN 
## class package if for KNN 
## ROCR is for area under the curve. 
library(class)
library(ROCR)

knn_predict <- knn(train = train, test = test, cl = train$dd.test_diabet, k=5)

### classification with logistic regression 

model <- glm(dd.test_diabet~., family = binomial(link='logit'), data=train)
glm_predict <- predict(model, newdata=test[,1:8],type='response')
fixed_glm_predict <- ifelse(glm_predict > 0.5, 1, 0)
glm_pr <- prediction(fixed_glm_predict, test$dd.test_diabet)

### classification with classification tree ## 

model <- ctree(dd.test_diabet ~., data=train)
cftree_predict <- predict(model, newdata= test[,1:8], type="response")
fixed_cftree_predict <- ifelse(cftree_predict > 0.5, 1, 0)

cftree_pr <- prediction(fixed_cftree_predict, test$dd.test_diabet)

## comparing results #####
# create confusion matrix 

table(knn_predict, test$dd.test_diabet)

table(fixed_cftree_predict, test$dd.test_diabet)

# draw ROC curve 

glm_prf <- performance(glm_pr, measure = "tpr", x.measure = "fpr")
plot(glm_prf)
auc <- performance(glm_pr, measure = "auc")
auc <- auc@y.values[[1]]
auc

cftree_prf <- performance(cftree_pr, measure = "tpr", x.measure = "fpr")
plot(cftree_prf)
auc <- performance(cftree_pr, measure = "auc")
auc <- auc@y.values[[1]]
auc
