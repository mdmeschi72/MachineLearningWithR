# clustering in 'r' 

# consumer price index in Turkey 

url <- "https://raw.githubusercontent.com/olgnaydn/R/master/dataset_tufe_vs_index.csv"
d <- read.csv(url, header = TRUE, sep = ',')
# first column is consumer price index in city istanbul and izmir by month from 2010 
head(d)


dc <- d[2:4]
#apply k-means 
c <- kmeans(dc,5)

c

#merging cluster label an d dataset 
dd <- data.frame(dc, c$cluster)
head(dd)

# apply hierarchical clustering 
# need to calculate distnace, euclidean is most common method 
# plot out to dendrogram to get the visualations of clusters 

ddist <- dist(dc, method= "euclidean")
hc <- hclust(ddist)
plot(hc, hang=-1, label = d$Tarih)

#apply density based clustering - dbscan 
eps <- kNNdistplot(as.matrix(dc), k=5)

cdb <- dbscan(as.matrix(dc), eps=10, minPts = 10)
cdb <- data.frame(d,cdb$cluster)

cdb
