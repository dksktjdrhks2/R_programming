#기초 통계 함수
x1 <- c(1,2,3,4,5,6,10)
x1

mean(x1)

median(x1) # 중앙값 추출하기

x2 <- c(0,1,2,3,4,5,6,7,8,9,100)
x2

median(x2)
max(x2)
min(x2)

range(x2) # 범위 추출하기

quantile(x2) # 4분위수 구하기
quantile(x2, probs = 0.33)  # 4분위수 중 한 지점의 값만 추출하기

var(x2) # 분산

library(moments)

sd(x2) # 표준편차

kurtosis(x2)

skewness(x2)

x <- read_excel('./data/Sample1.xlsx')
x

library(descr) # descr install package 필요

x1 <- freq(x$AREA, plot = T) # plot = T >> plot 차트 표현허용
