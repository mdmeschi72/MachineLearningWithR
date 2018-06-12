## with package ROCR from CRAN ## 
library(ROCR)
data(ROCR.simple)

pred <- prediction (ROCR.simple$predictions, ROCR.simple$labels)
perf <- performance(pred, "tpr", "fpr")
plot(perf, lty=4, col="red")
