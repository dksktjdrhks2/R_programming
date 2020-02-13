# 그래프에 객체 추가하기

# 직선 추가하기
x <- economics  # 미국의 경제지표를 날짜별로 나타나는 데이터 세트
str(x) # economics 데이터 세트 확인
dim(x)

# 꺽은선그래프에 사선(그래프추세) 그리기
ggplot(x, aes(x = date, y = psavert)) + 	# x축을 date, y축을 psavert로 맵핑
  geom_line() + 				# 꺽은선그래프 그리기
  geom_abline(intercept = 12.18671, slope = -0.0005444)   # 절편 12.18671, 기울기 -0.000544로 사선 그리기(회귀분석을 통해서 값을 얻음)

# 꺽은선 그래프에 평행선(평균값) 그리기
ggplot(x, aes(x = date, y = psavert)) + 	
  geom_line() + 			
  geom_hline(yintercept = mean(x$psavert)) # psavert 평균 값으로 평생선 그리기

# 꺽은선그래프에 수직선() 그리기
library(dplyr) 				#filter() 함수 사용을 위한 패키지 로드
x_inter <- filter(x, psavert == min(x$psavert))$date  # 개인 저축률(psavert)이 최솟값일 때의 날짜(date)를 구해 x_inter 변수에 할당
ggplot(x, aes(x = date, y = psavert)) + 
  geom_line() + 
  geom_vline(xintercept = x_inter)	# x_inter 변수 값으로 수직선 그리기

