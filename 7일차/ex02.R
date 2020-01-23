# cast 함수
airquality
head(airquality)

x1 <- melt(airquality, id = c('month', 'day'), na.rm = T)
head(x1)
tail(x1)

x2 <- dcast(x1, month + day ~ variable)
head(x2)

acast(x1, day ~ month ~ variable) # 포함되지않은 변수는 분리된다.

acast(x1, month ~ variable, mean) # month를 기준으로 나머지 변수들의 평균을 낸다.

acast(x1, month ~ variable, sum) # month를 기준으로 나머지 변수들의 합을 구한다.
