
install.packages(randomForest)
library(randomForest)


sn <- sample(1:nrow(iris), size = nrow(iris)*0.7)
str(iris)
dim(iris)
View(iris) 

train <- iris[sn,]        
test <- iris[-sn,]        

# 2. medel 생성
forest_m <- randomForest(Species ~ ., data=train)
forest_m  

forest_m$predicted         
forest_m$importance          

forest_m$mtry      
forest_m$ntree    


new_data <- iris[10,-5] + 0.2  
predict(forest_m, newdata = new_data, type = 'class')   

iris[10,'Species']  


prd_v <- predict(forest_m, newdata = test, type = 'class')
sum(prd_v == test$Species) / nrow(test) * 100


prd_v2 <- predict(forest_m, newdata = train, type = 'class')
sum(prd_v2 == train$Species) / nrow(train) * 100  


layout(matrix(c(1,2),nrow=1),width=c(4,1)) 
par(mar=c(5,4,4,0)) 
plot(forest_m)
par(mar=c(5,0,4,2))
plot(c(0,1),type="n", axes=F, xlab="", ylab="")
legend("top", colnames(forest_m$err.rate),col=1:4,cex=0.8,fill=1:4)


