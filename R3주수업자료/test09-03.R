# 그래프에 객체 추가하기

# economics의 데이터세트를 불러와 변수명을 t로하고 구조를 불러오시오
t <- economics  
str(t) 
dim(t)

# t를 가지고 x축을 date, y축을 uempmed로 맵핑하고 꺽은선그래프에 사선(intercept = 4.18671, slope = 0.0005444) 을 그리기오
ggplot(t, aes(x = date, y = uempmed)) + 	
  geom_line() + 			
  geom_abline(intercept = 4.18671, slope = 0.0005444) 

# t를 가지고 x축을 date, y축을 uempmed로 맵핑하고 꺽은선그래프에 uempmed 데이터의 평균 값으로 평행선을 그리기오
ggplot(t, aes(x = date, y = uempmed)) + 	
  geom_line() + 			
  geom_hline(yintercept = mean(t$uempmed))

# t를 가지고 uempmed이 최대값일 때의 날짜(date)를 구해 x_inter 변수에 할당하고 꺽은선그래프에 uempmed 최댓 값으로 수직선을 그리기오
library(dplyr) 				
x_inter <- filter(t, uempmed == max(t$uempmed))$date  # 
ggplot(t, aes(x = date, y = uempmed)) + 
  geom_line() + 
  geom_vline(xintercept = x_inter)	

