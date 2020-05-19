#Hierarchical Clustering
getwd()

install.packages('cluster')
#importing Dataset
dataset <- read.csv('Mall_Customers.csv')

X <- dataset[4:5]

#Finding Optimal number of cluster through dendogram

dendogram <- hclust(dist(X,method = 'euclidean'), method = 'ward.D')
plot(dendogram,
     main = paste('Dendogram'),
     xlab = 'Customers',
     ylab = 'Eculidean Distance')

#Applying hierarchical clustering on mall dataset
HC <- hclust(dist(X,method = 'euclidean'), method = 'ward.D')
Y_HC <- cutree(dendogram, 5)
Y_HC


#Visualization

library(cluster)
clusplot(X,
         Y_HC,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels= 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
