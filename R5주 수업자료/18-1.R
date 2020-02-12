mydata <- iris[,1:4]   

fit <- kmeans(x=mydata, centers=3)
fit
fit$cluster  
fit$centers  


library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)


subset(mydata, fit$cluster==2)
