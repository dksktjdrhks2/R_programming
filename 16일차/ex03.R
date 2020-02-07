colnames(iris)

levels(iris$Species)

install.packages('e1071')
library(e1071)

train <- sample(1:150, 100)
sv <- svm(Species ~ . , data = iris, subset = train, type = "C-classfication")

predict(sv, iris[-train,])

