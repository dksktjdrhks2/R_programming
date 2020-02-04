# airquality의 데이터세트를 불러와 변수명을 t로하고 속성을 불러오시오
t <- airquality
str(t) 

# ggplot함수를 사용하여  x(행)은 월로 과 y(열)은 Wind로 축을 맵핑하시오
ggplot(t, aes(x = Month, y = Wind)) 

# x축을 Month, y축을 Temp로 맵핑한 후에 점의 크기를 2로 하고 녹색(green)의 산점도를 그리시오.
ggplot(t, aes(x = Month, y = Wind)) + geom_point(size = 2, color = "green")

# x축을 Month, y축을 Temp로 맵핑한 후에 선의 두께를 3으로 하고 파란색(blue)의 꺽은선그래프를 한줄로 표현하시오.
ggplot(t, aes(x = Month, y = Wind)) + geom_line(size = 2, color = "blue")

# 꺽은선그래프(크기= 1, 색= 노란색(yellow))와 산점도(크기= 2, 색= 핑크색(pink)를 겹쳐 여러줄로 표현하시오.
ggplot(t, aes(x = Month, y = Temp)) +
  geom_line(size = 1, color = "yellow") +
  geom_point(size = 2, color = "pink")

