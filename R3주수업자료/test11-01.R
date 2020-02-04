#2018년에 종로구와 중랑구 지역별 초미세먼지 농도를 상자 그림으로 시각화하고 t 검정으로
비교하시오. 
install.packages("readxl")
install.packages('dplyr')

# 원시데이터 가져오기
library(readxl) 		

#dust.xlsx 파일을 불러온 후 dust_anal에 할당
dust <- read_excel("./dust.xlsx")

View(dust) 	# 데이터 확인
str(dust)	# 데이터 속성 확인

# 비교할 지역 데이터만 추출하기

library(dplyr)		#dplyr 패키지 로드

# 종로구와 중랑구 데이터만 추출 및 확인(%in% => area=="종로" | area=="중랑")
dust_anal <- dust %>% filter(area %in% c("종로구" , "중랑구"))
View(dust_anal)

# 데이터 현황 파악하기
# dust_anal 데이터 세트에 yyyymmdd에 따른 데이터 수 파악
count(dust_anal, yyyymmdd) %>% arrange(desc(n))

# dust_anal 데이터 세트에 area에 따른 데이터 수 파악
count(dust_anal, area) %>% arrange(desc(n))

# area 값이 성북구인 데이터를 dust_anal_area_jo에 할당
jo <- subset(dust_anal, area =="종로구")

# area 값이 중구인 데이터를 dust_anal_area_ju에 할당
ju <- subset(dust_anal, area =="중랑구")

# 데이터 확인
jo
ju

# psych 패키지 설치 및 로드
install.packages("psych")
library(psych)

# 종로구의 미세먼지량에 대한 기초 통계량 도출
describe(jo$finedust)

# 중구의 미세먼지량에 대한 기초 통계량 도출
describe(ju$finedust)

# 분포 확인 및 가설 검정
# 성북구와 중구의 미세먼지 농도에 대해 boxplot을 통한 분포 차이 확인
boxplot(jo$finedust, ju$finedust,
        main = "finedust", xlab = "AREA", names = c("종로구", "중랑구"),
        ylab = "FINEDUST_PM", col = c("blue", "green"))

# dust_anal 데이터 세트에서 측정소명(area)에 따라 미세먼지 농도 평균에 대한 차이를 검증
t.test(data = dust_anal, finedust ~ area, var.equal = T)

# 분석 
# 분포가 비슷하다
# t 통계량은 (t = 0.044388), 자유도 (df = 728), 유의확률 (p-value = 0.9646)
# 검정결과는 p-value = 0.9646로 유의수준 0.05보다 크다.
# 그러므로 귀무가설(성부구와 중구의 미세먼지 평균은 차이가 나지 않는다)를 체택 => 차이가 나지않는다
# 참고 : 종로구(20.76164),중랑구(20.71507)
