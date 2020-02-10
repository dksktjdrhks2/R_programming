

colnames(iris)

levels(iris$Species)


install.packages('e1071')
library(e1071)

train <- sample(1:150, 100)
sv <- svm(Species ~., data = iris, subset = train,  type = "C-classification")  


predict(sv, iris[-train,]) 


tt <- table(iris$Species[-train], predict(sv, iris[-train,])) 


sum(tt[row(tt) == col(tt)])/sum(tt)

1-sum(tt[row(tt) == col(tt)])/sum(tt) 
