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
