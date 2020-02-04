# 도형 및 화살표, annotate() 함수
# annotate("모양", xmin = x축 시작, xmax = x축 끝, ymin = y축 시작, ymax = y축 끝)

t <- mtcars
# t를 x축을 disp, y축을 qsec로 하고 맵핑 산점도에 사각형 그리기오.( x축(200~400), y축(16~21) 위치에 하늘색(skyblue) 투명도(alpha=0.3) 사각형)
ggplot(t, aes(x = disp, y = qsec )) + 	
  geom_point() + 	
  annotate("rect", xmin = 200, xmax = 400, ymin = 16, ymax = 21, alpha = 0.3, fill = "yellow") 

# t를 x축을 disp, y축을 qsec로 하고 산점도에 사각형 및 화살표 그리기오.( x축(시작:200, 끝:300), y축(시작:12, 끝:20) 위치에 녹색(green) 사각형 그리기)
ggplot(t, aes(x = disp, y = qsec)) + 		# x축을 disp, y축을 qsec로 맵핑
  geom_point() + 			
  annotate("rect", xmin = 200, xmax = 400, ymin = 16, ymax = 21, alpha = 0.3, fill = "yellow") +  
  annotate("segment", x = 100, xend = 300, y = 12, yend = 20, color = "green", arrow = arrow()) 

# 위 조건 산점도에 사각형, 화살표, 레이블(start) 추가하기오.
ggplot(t, aes(x = disp, y = qsec)) + 		# x축을 disp, y축을 qsec로 맵핑
  geom_point() + 			
  annotate("rect", xmin = 200, xmax = 400, ymin = 16, ymax = 21, alpha = 0.3, fill = "yellow") +  
  annotate("segment", x = 100, xend = 300, y = 12, yend = 20, color = "green", arrow = arrow())+ 
  annotate("text", x = 100, y = 12, label = "start")

# 막대그래프에 제목 추가하여 gear에 따른 빈도 막대그래프 그리시오.
ggplot(t, aes(x = carb)) + geom_bar() +
  labs(x = "carb수", y = "자동차수", title = "carb별 자동차수") 	# 제목 추가하기