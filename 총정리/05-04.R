#기초 통계함수
# 데이터의 특성 파악에 중점을 둔 기술 통계량

x1 <- c(1, 2, 3, 4, 5, 6, 10)
x1
mean(x1)            # 평균값
median(x1)          # 중앙값

x2 <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x2
median(x2)          # 변수중앙
max(x2)
min(x2)
range(x2)          # 변수범위

# 변수사분위수
quantile(x2)  # 데이터를 순서대로 정렬했을때 하위 25%, 50%, 75% 지점의 값(probs의 옵션에 따라 1, 2, 3사분위수로 구분)
quantile(x2, probs = 0.25)       # 변수 1사분위수(하위 25% 지점)
quantile(x2, probs = 0.5)       # 변수 2사분위수(하위 50% 지점)(=중앙값(median(x2)) )
median(x2)
quantile(x2, probs = 0.75)       # 변수 3사분위수(하위 75% 지점)
quantile(x2, probs = 0.8)       # 변수 하위 80% 지정의 값

install.packages('moments')
library(moments)
var(x2)     # 변수 분산
sd(x2)      # 변수 표준편차(분산의 양의 제곱근)
kurtosis( x2)  # 변수 첨도
               skewness(x2)  # 변수 왜도
# var(x2)     # 변수 분산(값의 평균으로 부터 떨어진 정도를 설명하는 통계량: 1~10까지(결과값에 제곱 연산값이 들어감) )#분산값이 적을수록 평균에  몰림 
# sd(x2)      # 변수 표준편차(분산값 값의 평균으로 데이터 값이 퍼진 정도를 설명하는 통계량) # 표준편차가 클수록 넓게 퍼짐

# install.packages('moments') #kurtosis()와 skewness() 함수사용을 위해 필요한 패캐지임, 설치해야함
# library(moments)
# kurtosis(x2)  # 변수 첨도(데이터 분포가 뽀족한 정도를 설명하는 통계량) # 통계량의 클수록 정규분포 대비 뽀족하고,값이 작으면 평평함
# skewness(x2)  # 변수 왜도(값이 한쪽으로 쏠린정도로값이 한쪽꼬리와 다른쪽 꼬리의 차이) # 통계량의 절대값이 클수록 비대칭이 심하고 +값이면 오늘쪽 꼬리가 길고 -값이면 왼쪽으로 꼬리가 긴 형태임

# 특성값이 얼마나 반복되는지 알 수 있는 빈도 분석
library(readxl)
x <- read_excel('./data/Sample1.xlsx')
x

install.packages("descr")
library(descr)
x1 <- freq(x$AREA, plot = T) # 지역별 빈도와 빈도에 따른 빈율분포 출력 # plot = F로 하면 막대 그래프를 제외함 
x1
