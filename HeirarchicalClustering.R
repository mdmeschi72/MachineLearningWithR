
url <- 'https://raw.githubusercontent.com/olgnaydn/R/master/nufus.csv'
d <- read.csv(url, header = TRUE, sep = ',', encoding = "UTF-8", stringsAsFactors = FALSE)

# manual on hclust
help("hclust")

# calculate distances - need this for hclust 
# most used is eculidean for distance function 
ddist <- dist(d$population, method = "euclidean")

#apply hierarchical clustering 
hc <- hclust(ddist)

plot(hc, hang = 1, label=d$city)

# nice way to highlight the different clusters
# shows cluster dendrogram 
rect.hclust(hc, k=5, border = "red")
