##dplyr 패키지
# 01dplyr 패키지

x <- mtcars   #내장 데이터 세트(mtcars)
nrow(mtcars) # 행의 갯수
str(mtcars)  # 데이터 속성

library(dplyr)

# 02 데이터 추출 및 정렬하기
# filter() 함수로 추출하기
filter(x, cyl ==4)  # mtcars에서 cyl 값이 4인 행만 추출
filter(x, cyl >= 6 & mpg >=20)

#arrange() 함수로 정렬하기
  # arrange(데이터 세트, 열1,열2, ...)
head(arrange(x, wt))     # mtcars에서 wt를 기준으로 오름차순 정렬한 후 head() 함수로 상위 데이터만 출력
head(arrange(x, mpg, desc(wt)))  # mtcars에서 mpg는 오름차순 정렬한 후 wt는 내림차수 후에 head() 함수로 상위 데이터만 출력
head(select(x, mpg, gear))   # mtcars에서 mtcars, mpg, gear 열 데이터만 출력



