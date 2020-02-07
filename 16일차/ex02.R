
install.packages(randomForest)
library(randomForest)

# 1. sampling
# iris데이터는 'Sepal.Length' 'Sepal.Width' 'Petal.Length' 'Petal.Width' 'Species' 5개 컬럼으로
# 되어 있으며 Species 컬럼에는 아이리스 종류 'setosa', 'versicolor', 'virginica' 등 3종류가 있음
# 실험은 모델을 적용하는 목적은 위의 'Sepal.Length' 'Sepal.Width' 'Petal.Length' 'Petal.Width' 수치형
# 4개를 독립변수로 이용하여 아이리스의 종류(Species)를 예측
# 아이리스 데이터는 150개 셋이 있기 떄문에 교차확인을 위해서 100개를 학습데이터로 추출하고,
# 나머지를 테스트 데이터로 사용

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


