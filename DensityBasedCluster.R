#dbscan (density based scan in R)

url <- 'https://raw.githubusercontent.com/olgnaydn/R/master/nufus.csv'

#install dbscan package 
install.packages('dbscan')

#call the library 
library(dbscan)

#predict the eps variable 
# eps threshold is the k-nn distance where the points by example remains constant 
# this plot shows this to be 50k 
eps <- kNNdistplot(as.matrix(d$population), k=5 )

help("kNNdistplot")

#apply dbscan 
c <- dbscan(as.matrix(d$population), eps= 50000, minPts = 3)
#display the cluster column in the c dataframe
c$cluster

c

dc<- data.frame(d, c$cluster)
dc
head(dc)
