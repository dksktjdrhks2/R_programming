# http://blog.naver.com/PostView.nhn?blogId=pmw9440&logNo=221586667065
# SVM 분류모델이란? 서포트 벡터 머신(support vector machine, SVM)은 기계 학습의 분야 중 하나로 패턴 인식, 자료 분석을 위한 지도 학습 모델이며, 주로 분류와 회귀 분석

colnames(iris)

levels(iris$Species)

#svm 모델 학습시키기

install.packages('e1071')
library(e1071)

train <- sample(1:150, 100) #무작위로 100개 추출 (학습데이터)
sv <- svm(Species ~., data = iris, subset = train,  type = "C-classification")  # sv모델생성( Species ~., data = 학습할 데이터, subset = trainr그룹,  type = SVM 수행방법 "C-classification")
#SVM-Kernel => "linear", "polynomial", "radial basis", "sigmoid"

#학습된 SVM 모델로 Test셋 예측하기
predict(sv, iris[-train,])  # SVM를 통해 예측된 class(Iris 예측분류) # -train는 테스트 데이터 셋

#정오분류표(confusion matrix) 작성
tt <- table(iris$Species[-train], predict(sv, iris[-train,]))  # 행:iris$Species[-train], 열: predict(sv, iris[-train,])

#정분류율 및 오불류율 계산
sum(tt[row(tt) == col(tt)])/sum(tt) #정분류율

1-sum(tt[row(tt) == col(tt)])/sum(tt) #오분류율

