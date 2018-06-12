#k-means application 

#get the data from github repo https://raw.gitbubusercontent.com/olganydn/R/master/nufus.csv

url <- 'https://raw.githubusercontent.com/olgnaydn/R/master/nufus.csv'

d <- read.csv(url, header = TRUE, sep = ',', encoding="UTF-8", stringsAsFactors = FALSE)

#get help page of kmeans function 
help(kmeans)

#apply k-means 

c <-kmeans(d$population,5)

c
# each value in the c$cluster vector is assigned a certain k-mean (centroid)
c$cluster

head(d)

#first column is name of states in Turkey
# second is the population size of each state. 

#merge cluser lable and our dataset - puts cluster lable on each data point 
cd <- data.frame(d, c$cluster)

# get cities with cluster lable = 5 
cd5 <- cd[which(cd$c.cluster == 5),]
cd4 <- cd[which(cd$c.cluster == 4), ]
cd3 <- cd[which(cd$c.cluster == 3), ]
cd2 <- cd[which(cd$c.cluster == 2), ]
cd1 <- cd[which(cd$c.cluster == 1), ]


cd5
cd4
cd3
cd2
cd1
