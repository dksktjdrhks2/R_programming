###### 지하철 4호선 역주변의 115평형 아파트의 평균 가격을 구글맵에 표시하시오

library(dplyr) 		# dplyr 패키지 로드
library(ggmap) 		# ggmap 패키지 로드
library(ggplot2)

# 지하철 4호선 원시 데이터 가져오기

#csv 파일을 가져와서 변수에 할당
station_data <- read.csv("./Rsung/4호선.csv") 
station_data

####### 구글맵 인증키(구글맵 API) 가져오기
register_google(key = 'AIzaSyAGkAU6aogi28q5BI2EHNjlWTRFIWS-yl0')

# 문자형으로 변환한 후 지하철역 좌표 정보 구하기
station_code <- as.character(station_data$"구주소")
is.character(station_data$"구주소")

# 위도와 경도로 변환
station_code <- geocode(station_code)

head(station_code)

# 두 개의 데이터셋을를 합친 후 새로운 데이터셋에에 할당
station_code_final <- cbind(station_data, station_code)
head(station_code_final) 	



# 아파트 실거래가 데이터 가공하기 전용면적별 거래 가격 csv 파일을 가져와서 변수에 할당
apart_data <- read.csv("./Rsung/노원구.csv")
head(apart_data)	#apart_data 앞부분 데이터 확인

#전용 면적의 값을 반올림하여 정수로 표현
apart_data$전용면적 = round(apart_data$전용면적)
head(apart_data)	# 데이터 앞부분 확인

# 전용면적을 기준으로 빈도를 구한 후 빈도에 따라 내림차순 정렬
count(apart_data, 전용면적) %>% arrange(desc(n))

# 전용면적이 115인 데이터만 추출하여 apart_data_115에 할당
apart_data_115 <- subset(apart_data, 전용면적 == "115")
head(apart_data_115) 	

# 아파트 단지별 평균 거래 금액

# 쉼표를 공백("")으로 대체하여 제거
apart_data_115$거래금액 <- gsub(",", "", apart_data_115$거래금액)
head(apart_data_115) # 결과 확인하기

#거래금액을 정수형으로 변환하여 단지명별 평균을 구한 후 apart_data_85_cost 변수에 할당
apart_data_115_cost <- aggregate(as.integer(거래금액) ~ 단지명, apart_data_115, mean)
head(apart_data_115_cost) 	# apart_data_115_cos 앞부분 확인

# "as.integer(거래금액)"을 "거래금액"으로 변경하여 저장
apart_data_115_cost <- rename(apart_data_115_cost, "거래금액" = "as.integer(거래금액)")
head(apart_data_115_cost) 	# 결과 확인하기

# 단지명이 중복된 행을 제거하고 apart_data_115에 저장
apart_data_115 <- apart_data_115[!duplicated(apart_data_85$단지명),]
head(apart_data_115) 	# 결과 확인하기

#"단지명" 을 기준으로 aprt_data_115와 apart_data_115_cost 합치기
apart_data_115 <- left_join(apart_data_115, apart_data_115_cost, by = "단지명")
head(apart_data_115)	# 결과 확인하기

# "단지명", "시군구", "번지", "전용면적, "거래금액.y" 만 추출하고 저장
apart_data_115 <- apart_data_115 %>% select("단지명", "시군구", "번지", "전용면적", "거래금액.y")

# "거래금액.y"를 "거래금액"으로 변경한 후 저장

# apart_data_115 <- rename(apart_data_85, "거래금액" = "거래금액.y") 
apart_data_115 <- rename(apart_data_115, "거래금액" = "거래금액.y") 
head(apart_data_115) 	# 결과 확인하기

# 시군구와 번지를 하나로 합치기

# "시군구"와 "번지" 열을 합친 후 저장
apart_address <- paste(apart_data_115$"시군구", apart_data_115$"번지")
head(apart_address) 	# 결과 확인하기

# "시군구"와 "번지" 열을 합친 후 데이터 프레임 구조로 저장
apart_address <- paste(apart_data_115$"시군구", apart_data_115$"번지") %>% data.frame()
head(apart_address) 	# 결과 확인하기

# "."을 "주소"로 변경하여 저장
apart_address <- rename(apart_address, "주소"= ".")
head(apart_address)

#아파트 주소를 위/경도 변환하여  저장 
apart_address_code <- as.character(apart_address$"주소") %>% enc2utf8() %>% geocode()
head(apart_address)

# 데이터 세트를 합친후 일부 열만 저장
apart_code_final <- cbind(apart_data_115, apart_address, apart_address_code) %>%
  
  select("단지명", "전용면적","거래금액", "주소", lon, lat)
head(apart_code_final)

# 노원구 지도 가져와 구글 지도에 지하철역과 아파트가격 표시하기
mapo_map <- get_googlemap('노원구', maptype= 'roadmap', zoom = 12)
ggmap(mapo_map)


# 산점도를 이용한 지하철역 위치표시 및 역명 표시
ggmap(mapo_map) +
  geom_point(data = station_code_final, aes(x = lon, y = lat), 
             colour = "red", size = 3) +
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1))

# 노원역 지도 정보를 가져와 변수에 저장
no_map <- get_googlemap("노원역", maptype = "roadmap", zoom = 12)

# 노원역 지도에 지하철 정보 및 아파트 정보 일괄 표시
ggmap(no_map) +
  geom_point(data = station_code_final, aes(x = lon, y = lat), colour = "red", size = 3) +
  geom_text(data = station_code_final, aes(label = 역명, vjust = -1)) +
  geom_point(data = apart_code_final, aes(x = lon, y = lat))+
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = -1)) +
  geom_text(data = apart_code_final, aes(label = 단지명, vjust = 1))

