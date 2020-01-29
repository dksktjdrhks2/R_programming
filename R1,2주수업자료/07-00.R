# 02reshape2패키지
# 02reshape2패키지(행과 열을 전환)

install.packages("reshape2")
library(reshape2)

# melt(데이터 세트, id.var ='기준 열', measure.var = '변환 열') 함수
airquality                          #airquality(내장 데이터 세트)
head(airquality)                    #head 함수로 데이터 기본 구조 파악, 변수명 대문자 포함, 앞에서 6개 출력
names(airquality) <- tolower(names(airquality))   # airquality의 변수명을  불러와(names():변수명을 불러오는 함수) 소문자로 대체
head(airquality)                    # 변수명 소문자  
x <- melt(airquality)               # 모든 열을 반환 (기준된 열을 미지정) 
x
head(x)
tail(x)
x <- melt(airquality,id.vars = c("month","wind"), measure.vars = "ozone")  # 기준값입력필수(id.vars = c("month","wind"), measure.vars = "ozone" )
x
head(x)                             # melt 함수 적용
tail(x)
# cast() 긴세로 데이터 모양을 가로로 전환
# acast(): 벡터, 행렬, 배열 형태를 변환
# dcast(): 데이터 프레임 형태를 변환

# dcast(데이터 세트, 기준 열 ~ 변환 열) 함수
airquality
head(airquality)
names(airquality) <- tolower(names(airquality))
head(airquality)
x1 <- melt(airquality,id = c("month","day"), na.rm = TRUE) # 열을 행으로 변환, 결측값을 포함
head(x1) 
tail(x1)
x1

x2 <- dcast(x1, month + day ~ variable)  # dcast 변환열을 데이터 열로 변환
head(x2)
x2
# acast(데이터 세트, 기준 열 ~ 변환 열 ~ 분리 기준 열) 함수/ 배열 형태로 표시
acast(x1, day ~ month ~ variable)
acast(x1, month ~ variable, mean) # 변수들을 월 별 평균으로 요약하기
dcast(x1, month ~ variable, sum)  # 변수들을 월 별 합으로 요약하기
