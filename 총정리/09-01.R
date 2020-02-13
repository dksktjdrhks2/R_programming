# ggplot2 패키지

# ggplot2 패키지 설치 

install.pack0ages("ggplot2")
library(ggplot2)

x <- airquality
str(x) 		# airquality 속성 확인
  #####   ggplot(데이터 세트, aes(데이터 속성)) /aes() 함수를 이용해서 x축과 y축을 맵핑
ggplot(x, aes(x = Day, y = Temp)) #x축은 Day 열, y 축은 Temp 열로 맵핑

# 산점도, geom_point() 함수

# x축을 Day, y축을 Temp로 맵핑한 후 산점도 그리기
ggplot(x, aes(x = Day, y = Temp)) + geom_point()

# 크기를 3, 색상을 빨강으로 적용하여 산점도 그리기
ggplot(x, aes(x = Day, y = Temp)) + geom_point(size = 3, color = "red")

# 꺽은선그래프, geom_line() 함수

# x축을 Day, y축을 Temp로 맵핑한 후 꺽은선그래프 그리기
ggplot(x, aes(x = Day, y = Temp)) + geom_line()

# 한 줄로 작성
ggplot(x, aes(x = Day, y = Temp)) + geom_point()

#여러 줄로 작성, 들여쓰기로 코드 연결 확인
ggplot(x, aes(x = Day, y = Temp)) + 
  geom_line()
#잘못된 줄바꿈
ggplot(x, aes(x = Day, y = Temp))
+ geom_line()

# x축을 Day, y축을 Temp로 맵핑한 후 꺽은선그래프와 산점도 그리기
ggplot(x, aes(x = Day, y = Temp)) +
  geom_line() +
  geom_point()

# 꺽은선그래프 색상과 산점도 크기를 변경하고 겹쳐 그리기
ggplot(x, aes(x = Day, y = Temp)) +
  geom_line(size = 1, color = "green") +
  geom_point(size = 3, color = "red")

