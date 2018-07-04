# handling problems with imbalanced dataset 

file <- "/home/mark/r/MachineLearningWithR/Classification/diabetes.csv"
dd <- read.table(file,sep=",")

colnames(dd) <-  c('pregnant_not', 'glucose_tolerance', 'diastolic_blood_pressure', 'triceps_skin_fold_thickness',
                   'serum_insulin', 'bmi', 'diabetes_pedigree', 'age', 'test_diabet')

# getting summary for labels 
table(dd$test_diabet)
prop.table(table(dd$test_diabet))

#installing the oversampling package 
install.packages("ROSE")
library(ROSE)

# example of oversampling
over_sampled_dd <- ovun.sample(test_diabet ~ ., data = dd, method = "over", N = 1000)$data
table(over_sampled_dd$test_diabet)

# setting row numbers in dd variable 
r <- dim(over_sampled_dd)[1]

#setting col numbers in dd variable 
c <- dim(over_sampled_dd)[2]

#calculating mean variables col by col 
cm <- apply(over_sampled_dd[,1:8], 2, mean)

#calculating standard deviations col by col 
csd <- apply(over_sampled_dd[,1:8], 2, sd)

#setting NULL matrix 
std_dd <- matrix(nrow = r, ncol = c-1)

# calculating normalized variables col by col except last column 
for (i in 1:(c-1))
{
  for(j in 1:r)
  {
    std <- (over_sampled_dd[j,i] - cm[i])/csd[i]
    std_dd[j,i] <- std
  }
}

# get summar (min, median, mean, 1st/3rd quantile)
summary(std_dd)

#divide dataset into two subgroups train and test 
train_size <- round(dim(std_dd)[1]*0.7)
test_size <- dim(std_dd)[1]-train_size

# set training data and testing data 
train <- std_dd[1:train_size,]
test <- std_dd[(train_size+1):dim(dd_std)[1],]

#installing class package 
install.packages("class")
library(class)

#train knn model 
knn_predict <- knn(train = train, test = test, c1 = train$over_sampled_dd.test_diabet, k=5)
