
install.packages(randomForest)
library(randomForest)

# 1. sampling 
#  iris데이터는 "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species" 5개 컬럼으로 되어 있으며 Species 컬럼에는 아이리스 종류 "setosa", "versicolor, "virginica" 등이 3종류가 있음
# 실험은 모델을 적용하는 목적은 위의 "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width" 수치형 4개를 독립변수로 이용하여 아이리스의 종류(Species)를 예측
# 아이리스 데이터는 150개 셋이 있기 떄문에 교차확인을 위해서 100개를 학습데이터로 추출하고, 나머지를 테스트 데이터로 사용

sn <- sample(1:nrow(iris), size = nrow(iris)*0.7)
str(iris)
dim(iris)
View(iris) # 150개의 데이터

train <- iris[sn,]         # 70%의 랜덤  (train)데이터
test <- iris[-sn,]         # 나머지 30%의 랜덤 (test)데이터

# 2. medel 생성
forest_m <- randomForest(Species ~ ., data=train) # 행(실제데이터):Species ~ ., 열(테스크데이터):data=train
forest_m  #분류/ 트리의개수/ 후보의 개수/에러율/  # versicolor      0         33         3  0.08333333 => versicolor로 예측했지면 3개가 virginica로 예측(3개 오분류)

forest_m$predicted         # 학습된 모델을 통한 train data 의 예측값 확인
forest_m$importance        # 각 feature importance(각 불순도 기반 설명변수 중요도) 확인  

forest_m$mtry      # mtry 는 후보군으로 3가지 꽃종에서 2가지를 후보로 뽑아 분류에 사용
forest_m$ntree     # 모델의 ntree 값 확인(트리의 갯수)

# 3. 모델을 통한 예측 
new_data <- iris[10,-5] + 0.2  # iris[10,-5]는 10번째 데이터 -5는 필드 이고 거기에 각 각에 0.2씩 더해서 값변경
predict(forest_m, newdata = new_data, type = 'class')    # 500개 트리의 다중투표 결과

iris[10,'Species']  # iris데이터의 10번째 행에서 Species 열에서  결과값은 setosa

# 4. 모델 평가 
# 4-1) test data에 대한 score 확인

prd_v <- predict(forest_m, newdata = test, type = 'class')
sum(prd_v == test$Species) / nrow(test) * 100

# 4-2) train data에 대한 score 확인 
prd_v2 <- predict(forest_m, newdata = train, type = 'class')
sum(prd_v2 == train$Species) / nrow(train) * 100  #학습한 데이터이기 때문에 100%

# 5. 모델 시각화 ##### OOB(out of bag)은 훈련데이터에 포함되지않은 데이터로 훈련데이터와 오류측정시 사용
layout(matrix(c(1,2),nrow=1),width=c(4,1)) 
par(mar=c(5,4,4,0)) # par()는 그래프의 모양을 지정함수/ mar(마진)(5,4,4,0) 오른쪽 마진 제거 
plot(forest_m)
par(mar=c(5,0,4,2)) # 왼쪽 마진 제거 
plot(c(0,1),type="n", axes=F, xlab="", ylab="")
legend("top", colnames(forest_m$err.rate),col=1:4,cex=0.8,fill=1:4)


