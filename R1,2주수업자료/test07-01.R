# cast() 긴세로 데이터 모양을 가로로 전환
# acast(): 벡터, 행렬, 배열 형태를 변환
# dcast(): 데이터 프레임 형태를 변환

# dcast(데이터 세트, 기준 열 ~ 변환 열) 함수
airquality
head(airquality)
names(airquality) <- tolower(names(airquality))
head(airquality)
# airquality 데이터 세트의 월과 일의 열을 행으로 변환하고 결측값을 포함하여 t1으로 하고 앞과 뒷부분 6개를 불러 오시오
t1 <- melt(airquality,id = c("month","day"), na.rm = TRUE) 
head(t1) 
tail(t1)
# t1데이터세트의  변환열을 데이터 열로 변환하고 데이터프래임 생성하여 t2로 하고 앞과 뒷부분 6개를 불러 오시오
t2 <- dcast(x1, month + day ~ variable)  
head(t2)
t2
# 데이터 세트 t1을 기준 열과 변환 열을 분리 기준 열로 분리(배열)하여 불러 오시오.
acast(t1, day ~ month ~ variable)
# 변수들을 월 별 평균으로 요약하여 불러 오시오.
acast(t1, month ~ variable, mean) 
# 변수들을 월 별 길이를 요약하여 불러 오시오.
acast(t1, month ~ variable, length)  
