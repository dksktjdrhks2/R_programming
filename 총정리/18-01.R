#####  군집화와 분류의 개요
# 1. 머신러닝의 등장   
  # 방대한 데이터를 컴퓨터가 스스로 분석하고 학습하여 미래를 예측하기 위한 예측모델을 만드는 기술
  # 머신러닝의 대표적 기술 중의 하나는 군집화(clusterig)와 분류(classification)

# 2. 군집화와 분류의 개념   
  # 군집화(clustering): 주어진 대상 데이터들을 유사성이 높은 것끼리 묶어주는 기술(비지도학습)
  # 이러한 묶음을 군집cluster, 범주category, 그룹group, class 등 다양한 용어로 부름
  # 분류(classification): 그룹group, class의 형태로 알려진 데이터들이 있을 때 그룹을 모르는 어떤 데이터에 대해 어느 그룹에 속하는지를 예측하는 기술(지도학습)

##### k-평균 군집화(kmeans)
# 먼저 군집의 중심점을 찾고 다른점들은 거리가 가장 가까운 중심점의 군집에 속하는 것으로 결정 하는 것 

mydata <- iris[,1:4]    # 데이터 준비(species 제외)

fit <- kmeans(x=mydata, centers=3) # kmeans(x=군집화대상, centers=군집의 갯수)
fit
# K-means clustering with 3 clusters of sizes 50, 62, 38 => 3개의 군집에  속한 데이터들의 개수
 
 ### 3개의 군집의 중심점 좌표값
# Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     5.006000    3.428000     1.462000    0.246000
# 2     5.901613    2.748387     4.393548    1.433871
# 3     6.850000    3.073684     5.742105    2.071053

 ### 각 데이터에 대한 군집번호


fit$cluster  # 각 데이터에 대한 군집 번호
fit$centers  # 각 군집의 중심점 좌표


# 차원 축소 후 군집 시각화
library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)
# 군집1은 군집2, 군집3에 비해 떨어져 있음(한 품종은 다른 두품종에 비해 특성이 매우 다르고 두품종은 유사)

# 데이터에서 두 번째 군집의 데이터만 추출
subset(mydata, fit$cluster==2)

