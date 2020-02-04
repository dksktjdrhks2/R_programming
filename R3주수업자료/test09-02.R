tt <- mtcars
# 막대그래프, geom_bar() 함수
# tt에서 hp 종류별 빈도수를 넓이가 1.5인 막대그래프로 확인하세요.
ggplot(tt, aes(x = hp)) + geom_bar(width = 1.5)

# tt에서 빈 범주를 제외 hp 종류별 빈도수를 넓이가 1.5인 막대그래프로 확인하세요
ggplot(tt, aes(x = factor(hp))) +
  geom_bar(width = 0.5)

# hp 종류별 carb 빈도 누적 막대그래프로 확인하세요
ggplot(tt, aes(x = factor(hp))) +
  geom_bar(aes(fill = factor(carb)))

#  hp 종류별 carb 빈도의 누적 막대그래프를 선버스트 차트로 변환하여 확인하세요
ggplot(tt, aes(x = factor(hp))) +
  geom_bar(aes(fill = factor(carb))) +
  coord_polar()                      

# hp 종류별 carb 빈도를 선버스트 차트를 원그래프로 변환하여 확인하세요
ggplot(tt, aes(x = factor(hp))) +
  geom_bar(aes(fill = factor(carb))) +
  coord_polar(theta='y')   

ttt <- airquality
# 상자 그림를 사용하여 t에서 Day 열을 그룹 지어, 날짜별 오존 그림을 추가 그리시오.
ggplot(ttt, aes(x = Day, y = Ozone, group = Day)) + geom_boxplot()  # NA값 37개 제외

# 두께가 2인 히스토그램을 사용하여 t에서 Day 열을 그룹 지어, 날짜별 태양열 상자 그림을 추가 그리시오.
ggplot(ttt, aes(Solar.R)) +  geom_histogram(binwidth = 2)

