###### 지하철 2호선 역주변(마포구)의 85평형 아파트의 평균 가격을 구글맵에 표시하시오

# PROJECT 04 지하철역 주변 아파트 가격 알아보기
# 지하철역 정보 다운로드 및 전처리
# 지하철역 정보 웹사이트 : www.data.seoul.go.kr
# 아파트 실거래가 : rt.molit.go.kr
# 지하철역 데이터 가공하기

install.packages("dplyr") 	# dplyr 패키지 설치
install.packages("ggmap") 	# ggmap 패키지 설치
install.packages("ggplot2") 	# ggplot2 패키지 설치
library(dplyr) 		# dplyr 패키지 로드
library(ggmap) 		# ggmap 패키지 로드
library(ggplot2)


# 원시 데이터 가져오기

#csv 파일을 가져와서 statopn_data 변수에 할당
station_data <- read.csv("./Rsung/13._역별_주소_및_전화번호.csv") 
station_data
str(station_data)		# station_data 속성 확인

####### 구글맵 인증키/구글맵 API 검색(https://cloud.google.com/maps-platform/#get-startsd/)/지도, 경로, 지역정보 체크/......)
register_google(key = 'AIzaSyAGkAU6aogi28q5BI2EHNjlWTRFIWS-yl0')

# 지하철역 좌표 정보 구하기
# as.character() 함수로 문자형으로 변환한 후 station_code에 할당
station_code <- as.character(station_data$"구주소")
is.character(station_data$"구주소") # 문자인지 아닌지 물어볼때.
# geocode() 함수로 station_code 값을 위도와 경도로 변환
station_code <- geocode(station_code)

head(station_code) 			# station_code 데이터 앞부분 확인

# 문자형으로 변환하고 utf8로 변환한 후 위도와 경도로 변환(다시한번 같은 내용을 한줄로 코딩해서 반복 실행=>생략가능)
station_code <- as.character(station_data$"구주소") %>% enc2utf8() %>% geocode()
head(station_code) 			# station_code 데이터 앞부분 확인

# station_data와 statioon_code를 합친 후 station_code_final에 할당
station_code_final <- cbind(station_data, station_code)
head(station_code_final) 	#station_code_final의 앞부분 확인 

# 아파트 실거래가 데이터 가공하기

# 전용면적별 거래 가격
# csv 파일을 가져와서 apart_data 변수에 할당
apart_data <- read.csv("./Rsung/아파트(매매)__실거래가.csv")
head(apart_data)	#apart_data 앞부분 데이터 확인

#전용 면적의 값을 반올림하여 정수로 표현
apart_data$전용면적 = round(apart_data$전용면적)
head(apart_data)	# 데이터 앞부분 확인

# 전용면적을 기준으로 빈도를 구한 후 빈도에 따라 내림차순 정렬
count(apart_data, 전용면적) %>% arrange(desc(n))

# 전용면적이 85인 데이터만 추출하여 apart_data_85에 할당
apart_data_85 <- subset(apart_data, 전용면적 == "85")
head(apart_data_85) 	#apart_data_85 앞부분 확인

# 아파트 단지별 평균 거래 금액

# 쉼표를 공백("")으로 대체하여 제거
apart_data_85$거래금액 <- gsub(",", "", apart_data_85$거래금액)
head(apart_data_85) # 결과 확인하기

#거래금액을 정수형으로 변환하여 단지명별 평균을 구한 후 apart_data_85_cost 변수에 할당 => aggregate(계산열 ~ 기준열, 데이터셋, 연산함수)
apart_data_85_cost <- aggregate(as.integer(거래금액) ~ 단지명, apart_data_85, mean)
head(apart_data_85_cost) 	# apart_data_85_cos 앞부분 확인

# "as.integer(거래금액)"을 "거래금액"으로 변경하여 저장
apart_data_85_cost <- rename(apart_data_85_cost, "거래금액" = "as.integer(거래금액)")
head(apart_data_85_cost) 	# 결과 확인하기

# 단지명이 중복된 행을 제거하고 apart_data_85에 저장
# 처음부터 비교하여 중복 값이면 TRUE, 처음나오는 값이면 FALSE 반환
# 데이터 셋[!duplicated(중복검사열),] => FALSE인 데이터만 남겨서 배혈형태로 반환 
apart_data_85 <- apart_data_85[!duplicated(apart_data_85$단지명),]
head(apart_data_85) 	# 결과 확인하기

#"단지명" 을 기준으로 aprt_data_85와 apart_data_85_cost 합치기
apart_data_85 <- left_join(apart_data_85, apart_data_85_cost, by = "단지명")
head(apart_data_85)	# 결과 확인하기

# "단지명", "시군구", "번지", "전용면적, "거래금액.y" 만 추출하고 저장
apart_data_85 <- apart_data_85 %>% select("단지명", "시군구", "번지", "전용면적", "거래금액.y")
head(apart_data_85)	# 결과 확인하기

# "거래금액.y"를 "거래금액"으로 변경한 후 저장

# apart_data_85 <- rename(apart_data_85, "거래금액" = "거래금액.y") 
apart_data_85 <- rename(apart_data_85, "거래금액" = "거래금액.y") 
head(apart_data_85) 	# 결과 확인하기

# 시군구와 번지를 하나로 합치기

# "시군구"와 "번지" 열을 합친 후 apart_address에 저장 => paste(열, 열)열과 열 사이를 공백없이 합치는 함수
apart_address <- paste(apart_data_85$"시군구", apart_data_85$"번지")
head(apart_address) 	# 결과 확인하기

# "시군구"와 "번지" 열을 합친 후 데이터 프레임 구조로 저장
apart_address <- paste(apart_data_85$"시군구", apart_data_85$"번지") %>% data.frame()
head(apart_address) 	# 결과 확인하기

# "."을 "주소"로 변경하여 저장
apart_address <- rename(apart_address, "주소"= ".")
head(apart_address)

#아파트 주소를 위/경도 변환하여 apart_address_code에 저장 
apart_address_code <- as.character(apart_address$"주소") %>% enc2utf8() %>% geocode()
head(apart_address)

# 데이터 세트를 합친후 일부 열만 apart_code_final에 저장
apart_code_final <- cbind(apart_data_85, apart_address, apart_address_code) %>%
  
select("단지명", "전용면적","거래금액", "주소", lon, lat)
head(apart_code_final)

# 구글 지도에 지하철역과 아파트가격 표시하기
# 마포구 지도 가져오기
# 마포구 지도 가져와 mapo_map에 저장 =마포구:'mapogu', 지도형태 : 'roadmap', 확대비율 : 12
mapo_map <- get_googlemap('mapogu', maptype= 'roadmap', zoom = 12)
ggmap(mapo_map)

# 산점도를 이용한 지하철역 위치표시 및 역명 표시 =>point는 aes(x = lon, y = lat)/ colour = "red", size = 3로하고 text는 aes(label = 역명, vjust = -1)로
ggmap(mapo_map) +
  geom_point(data = station_code_final, aes(x = lon, y = lat), 
             colour = "red", size = 3) +
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1))  # vjust = -1(세로위치)
             
# 홍대입구역 지도 정보를 가져와 hongdae_map 변수에 저장
hongdae_map <- get_googlemap("hongdae station", maptype = "roadmap", zoom = 20)

# 홍대입구역 지도에 지하철 정보 및 아파트 정보 일괄 표시
ggmap(mapo_map) +
  geom_point(data = station_code_final, aes(x = lon, y = lat), colour = "red", size = 3) +
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1)) +
  geom_point(data = apart_code_final, aes(x = lon, y = lat))+
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = -1)) +
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = 1))
 
