#K-Mean Clustering
getwd()

install.packages('cluster')
#importing Dataset
dataset <- read.csv('Mall_Customers.csv')

X <- dataset[4:5]

#Finding Optimal number of cluster through Elbow Method
set.seed(6)
wcss <- vector()
for (i  in 1:10) wcss[i]<- sum(kmeans(X,i)$withinss)
plot(1:10, wcss ,type = "b", main = paste('Cluster of Clients'), xlab = "Number of Customers", ylab = "WCSS")



#Applying K-Mean on mall dataset
set.seed(29)
kmean <- kmeans(X,5, iter.max = 300, nstart = 10)


#Visualization

library(cluster)
clusplot(X,
         kmean$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels= 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
