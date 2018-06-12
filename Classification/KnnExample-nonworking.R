# KNN example (supervised machine learning)


file <- "/home/mark/r/MachineLearningWithR/Classification/diabetes.csv"
dd <- read.table(file, sep = ",")
head(dd)
# assign column names to the daa 
colnames(dd) <- c('pregnant_not', 'glucose_tolerance', 'diastolic_blood_pressure', 'triceps_skin_fold_thickness',
                  'serum_insulin', 'bmi', 'diabetes_pedigree', 'age', 'test_diabet')

# calculate the mean of numeric variables (Not the lable)
# the first variable specifies the members of the row that we want mean for, 
# the second column represents that we want the mean for each column
# third input var specifies to take the mean 
# apply (variable, margin, function)  Margin 1 = row, 2 = column 
cm <- apply(dd[,1:8], 2, mean)
cm
# take the standard deviation of each column 
csd <- apply(dd[,1:8], 2, sd)
csd
# normalize data 



# divide dataset into two subgroups - train/teset 
train_size <- round(dim(dd_std)[1]*0.7)
test_size <- dim(dd_std)[1] - train_size

# create train and test set based upon size 
train <- dd_std[1:train_size]
test <- dd_std[(train_size + 1):dim(dd_std)[1],]

# need the class package 
install.packages("class")
library(class)

# train the knn model 
knn_preidct <- knn(train = train, test = test, c1 = train$dd.test_diabet, k =5 )

# draw a plot comparing predicted labels an dreal labels 
plot(knn_predict, test$dd.test_diabet)


