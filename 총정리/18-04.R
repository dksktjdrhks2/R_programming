# K-fold 교차 검증
# 예측모델을 개발하려면 그룹 정보가 포함된 데이터셋이 확보되어야 하는데, 데이터셋에 포함된 관측값의 개수는 많으면 많을수록 좋음
# 확보된 데이터셋은 훈련용 데이터training dataset와 테스트용 데이터test dataset로 나눌 수 있음
# 훈련용 데이터를 이용하여 분류(예측)모델을 개발하고, 테스트용 데이터를 이용하여 예측을 실시
# 머신러닝의 목표 중 하나는 예측 정확도가 높은 모델을 만드는 것

#1. k-fold 교차 검증의 방법   
#단, 훈련용과 테스트용으로 데이터를 나눌 때 데이터가 어떻게 나누어졌는가에 따라 모델의 성능이 달라지는 문제가 있음
#이 문제를 해결하는 방법은 데이터를 임의로 훈련용과 테스트용으로 나누어 모델을 개발하는 과정을 여러 번 반복하여 그곳에서 도출되는 예측 정확도의 평균을 구하는 것
#이것을 체계화한 방법론이 k-fold 교차 검증(k-fold cross validation)

library(cvTools)                       # cvFolds() 함수 지원

k = 10                                 # 10-fold
folds <- cvFolds(nrow(iris), K=k)      # 폴드 생성

acc <- c()                             # 폴드별 예측 정확도 저장용 벡터
for (i in 1:k) {
  ts.idx <- folds$which == i           # 테스트용 데이터의 인덱스 => which == i 는 i 번째 인덱스 값을 가져옴
  ds.tr <- iris[-ts.idx, 1:4]          # 훈련용 데이터셋  
  ds.ts <- iris[ts.idx, 1:4]           # 테스트용 데이터셋  
  cl.tr <- factor(iris[-ts.idx, 5])    # 훈련용 데이터셋의 그룹(품종) 정보
  cl.ts <- factor(iris[ts.idx, 5])     # 테스트용 데이터셋의 그룹(품종) 정보
  
  pred <- knn(ds.tr, ds.ts, cl.tr, k = 5) # 5개의 테스트 데이터를 통해서 k 최근접 이웃 알로리즘에 의해 예측을 실행하고 예측 정확도를 계산 한 뒤 ace벡터에 저장
  acc[i] <- mean(pred==cl.ts)          # 예측 정확도 pred==cl.ts 예측 정확도와 실제 테스트 정확도의 평균을 계산 한 뒤 ace벡터에 저장
}
acc                                    # 폴드별 예측 정확도
mean(acc)                              # 폴드평균 예측 정확도

