xx <- mtcars
# 막대그래프, geom_bar() 함수
# mtcars에서 cyl 종류별 빈도수 확인
ggplot(xx, aes(x = cyl)) + geom_bar(width = 0.5)

#빈 범주를 제외(factor(cyl)을 사용하여 값이 있는 범주만 인식)하고 cyl 종류별 빈도수 확인 
ggplot(xx, aes(x = factor(cyl))) +  geom_bar(width = 0.5)

# 누적 막대그래프
# cyl 종류별 gear 빈도 누적 막대그래프
ggplot(xx, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear)))

# 누적 막대그래프로 선버스트 차트 그리기
ggplot(xx, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar()                       # 선버스트 차트로 변환

# 선버스트 차트를 원그래프 그리기
ggplot(xx, aes(x = factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar(theta='y')                       # 원그래프로 변환

# 상자 그림 & 히스토그램
# geom_boxplot()함수
#airquality에서 Day 열을 그룹 지어, 날짜별 온도 상자 그림을 그림
xxx <- airquality
ggplot(xxx, aes(x = Day, y = Temp, group = Day)) +  # group에 Day 옵션을 추가
  geom_boxplot()

# geom_histogram() 함수
# airquality에서 Temp의  히스토그램
ggplot(xxx, aes(Temp)) +
  geom_histogram()  # binwidth =1 을 사용하라는 메세지

ggplot(xxx, aes(Temp)) +
  geom_histogram(binwidth = 1)

