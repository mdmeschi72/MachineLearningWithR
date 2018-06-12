# logistic regression application 

file <- "/home/mark/r/MachineLearningWithR/Classification/diabetes.csv"
dd<- read.table(file, sep = ",")
head(dd)
# assigning colnames 
colnames(dd) <- c('pregnant_not', 'glucose_tolerance', 'diastolic_blood_pressure', 'triceps_skin_fold_thickness',
                  'serum_insulin', 'bmi', 'diabetes_pedigree', 'age', 'test_diabet')

#we are getting summary labels
table(dd$test_diabet)

#setting row numbers in dd variable 
# dim function returns (rows,columns)
r <- dim(dd)[1]

# set number of columns 
c <- dim(dd)[2]

#calculate mean and standard dev for each columns 
cm <- apply(dd[,1:8], 2, mean)
sd <- apply(dd[,1:8], 2, sd)

# setting null matrix 
std_dd <- matrix(nrow = r, ncol = c-1)

# normalization calculation process 
for (i in 1:(c-1))
{
  for(j in 1:r)
  {
    std <- (dd[j,i] - cm[i])/csd[i]
    std_dd[j,i] <- std
  }
}

#concating normalized variable and label (build df from matrix)
dd_std <- data.frame(std_dd, dd$test_diabet)

# summary function gives quandrants of each var for normalized data 
summary(std_dd)

#divide dataset into train and test 
train_size <- round(dim(dd_std)[1]*0.7)
test_size <- dim(dd_std)[1]-train_size

# create training and test datasets 
train <- dd_std[1:train_size,]
test <- dd_std[(train_size+1):dim(dd_std)[1],]

library(class)
help(glm)
#train logistic regression 
model <- glm(dd.test_diabet~., family=binomial(link = 'logit'), data=train)

# use the generated model to get predictions 
predictions <- predict(model, newdata=test[,1:8], type = 'response')

# converting predicted labels (using probability - if > .50 then lable 1, else 0)
fixed_predictions <- ifelse(predictions >0.5,1,0)

fixed_predictions
