####k-최근접 이웃 분류
# 1. 분류 문제의 사례  : 분류 classification는 그룹이 있는 데이터에 대해 그룹을 모르는 데이터가 들어왔을 때 어떤 그룹에 속 하는지를 예측하는 기술
# 2. k-최근접 이웃 분류의 방법   


library(class)

# 훈련용 데이터와 테스트용 데이터 준비
tr.idx <- c(1:25,51:75, 101:125)      # 훈련용 데이터의 인덱스
ds.tr <- iris[tr.idx, 1:4]            # 훈련용 데이터셋  
ds.ts <- iris[-tr.idx, 1:4]           # 테스트용 데이터셋  
cl.tr <- factor(iris[tr.idx, 5])      # 훈련용 데이터셋의 그룹(품종) 정보
str(cl.tr)
cl.ts <- factor(iris[-tr.idx, 5])     # 테스트용 데이터셋의 그룹(품종) 정보
str(cl.ts)
pred <- knn(ds.tr, ds.ts, cl.tr, k=7, prob=TRUE) # knn()함수를 이용하여 테스트용 데이터셋으 그룹(품종) 정보를 예측하고 결과를 pred에 저장. knn(ds.tr(훈련용 데이터셋을 저장), ds.ts(테스트용 데이터셋 저장), cl.tr(훈련용 데이터셋의 그룹을 지정), k=3(최근접 이웃의 개수를 지정/ 가능하면 관측값의 갯수의 루트를 씌운 값보다 작은 것이 좋음), prob=TRUE(예측된 그룹에 대한 지지 확률을 표시 여부를 결정))
pred

# 테스트데이터에 대한 예측 결과와 예측 결과에 대한 지지 확률을 표시
acc <- mean(pred==cl.ts)              # 예측 정확도
acc

table(pred,cl.ts)                     # 예측값과 실제값 비교 통계

