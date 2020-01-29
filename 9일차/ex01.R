install.packages('ggplot2')
library(ggplot2)

x <- airquality
str(x)

head(x)
ggplot(x, aes(x = Day, y = Temp)) + geom_point(size = 2, color = 'darkblue')
#aes() 그래프를 그리기위한 기본 판을 만들어주는 함수

ggplot(x, aes(x = Day, y = Temp)) + geom_line(size = 1, color = 'blue')

ggplot(x, aes(x = Day, y = Temp)) + 
  geom_line(size = 1, color = 'blue') + 
  geom_point(size = 2, color = 'red')
