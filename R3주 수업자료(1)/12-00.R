# googleVis 패키지
install.packages("googleVis")		
library(googleVis) 		

#####  gvisMotionChart(데이터세트, idvar = "기준 데이터", timevar = "날짜 데이터")
# 움직이는 차트 생성하기
library(ggplot2)  	#ggplot2 패키지 로드

x <- economics  # 미국의 경제지표를 날짜별로 나타나는 데이터 세트
str(x) # economics 데이터 세트 확인

# motion <- gvisMotionChart(economics, idvar = "psavert", timevar = "date") # 날짜별(date) 개인 저축률의 변화(pasvert) 값을 구한 후 motion 변수에 할당
# plot(motion) 	 	# motion 변수의 값으로 그래프 그리기

##### gvisGauge( 데이터 세트, labelvar = "측정 데이터", numvar = "값", options = list(그래프 옵션))

# 게이지 차트 그리기
# 게이지의 측정 데이터(labelvar)는 도시명, 값(numvar)은 인구수, 눈금은 0~1000으로 옵션 지정
gauge <- gvisGauge(CityPopularity, labelvar = "City", numvar = "Popularity", options = list(min = 0, max = 10000))
plot(gauge) 		#gauge 변수 값으로 그래프 그리기

# 구글 지도를 활용하는 ggmap 패키지
install.packages("ggmap") 	# ggmap 패키지 설치
library(ggmap) 		# ggmap 패키지 로드

# 구글 지도 가져오기
# 구글맵 인증키/구글맵 API 검색(https://cloud.google.com/maps-platform/#get-startsd/)/지도, 경로, 지역정보 체크/......)
register_google(key = 'AIzaSyAGkAU6aogi28q5BI2EHNjlWTRFIWS-yl0') # 구글맵 API 인증

gg_seoul <- get_googlemap("seoul", maptype = 'terrain') # 설정한 위치를 가져옴(satellite, terrain, roadmap, hybrid)
ggmap(gg_seoul) 	#gg_seoul의 위치 값에 따른 구글 지도 호출


# 구글 지도 위에 산점도 그리기
library(dplyr) 	# dplyr 패키지 로드
library(ggplot2) 	# ggplot2 패키지 로드

geo_code <- enc2utf8("대전역") %>% geocode() # 한글 검색을 위해 uft8로 변환한 후 위도와 경도 데이터를 geo_code 변수에 할당
geo_data <- as.numeric(geo_code) 	# 리스트를 숫자로 변환하여 geo_data 변수에 할당

get_googlemap(center = geo_data, maptype = "roadmap", zoom = 13) %>% ggmap() +  # 대전역의 위치 정보를 가져온 후 구글 지도 호출
  geom_point(data = geo_code, aes(x = geo_code$lon, y = geo_code$lat))  # geo_code에 있는 경도(lon)와 위도(lat) 값으로 산점도 그리기

