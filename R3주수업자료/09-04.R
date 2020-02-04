# 텍스트 입력 및 도형 그리기
### geom_text(aes(label = 라벨명, vjust = 세로 위치, hjust = 가로 위치)
xx <- airquality
ggplot(xx, aes(x = Day, y = Temp)) + 		        # x축을 Day, y축을 Temp로 맵핑
  geom_point() + 				                                # 산점도 그리기
  geom_text(aes(label =Temp, vjust = 0, hjust = 0))    # 각 점에 Temp 값 입력하기

# 도형 및 화살표, annotate() 함수
# annotate("모양", xmin = x축 시작, xmax = x축 끝, ymin = y축 시작, ymax = y축 끝)

x <- mtcars
# 산점도에 사각형 그리기
ggplot(x, aes(x = wt, y = mpg)) + 		# x축을 wt, y축을 mpg로 맵핑
  geom_point() + 				# 산점도 그리기
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue") # x 축 3~4, y축 12~21 위치에 하늘색(skyblue) 투명한(alpha=0.5) 사각형(rect) 그리기

# 산점도에 사각형 및 화살표 그리기
ggplot(x, aes(x = wt, y = mpg)) + 		# x축을 wt, y축을 mpg로 맵핑
  geom_point() + 				# 산점도 그리기
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue") +  # x 축 3~4, y축 12~21 위치에 하늘색(skyblue) 투명한(alpha=0.5) 사각형(rect) 그리기
  annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color = "red", arrow = arrow()) # x축 2.5~3.7, y축10~17 위치에 빨간(red) 화살표 그리기

# 산점도에 사각형, 화살표, 레이블 추가하기
ggplot(x, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue") +
  annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color = "red", arrow = arrow()) +
  annotate("text", x = 2.5, y = 10, label = "point")

# 그래프 제목 및 축 제목을 추가하고 디자인 테마 적용하기
  
#### labs(x = "x축 이름", y = "y축 이름", title = "그래프 제목")

# 막대그래프에 제목 추가하여 gear에 따른 빈도 막대그래프 그리기  theme_gray()     # 테마적용
ggplot(x, aes(x = gear)) + geom_bar() +
  labs(x = "기어수", y = "자동차수", title = "변속기 기어별 자동차수") + # 제목 추가하기
  theme_gray()     # 테마적용

