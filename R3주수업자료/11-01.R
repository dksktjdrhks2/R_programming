# project2 지역별 미세먼지 농도 비교하기
# 서울시 일별 미세먼지 데이터 다운로드(http://cleanair.seoul.go.kr)
# 엑셀에서 필요한 데이터만 남기기
# 상자 그림으로 시각화 및 t 검정(성북구와 중구의 미세먼지 농도 차이가 난다)
install.packages("readxl")
install.packages('dplyr')

# 데이터 수집 : 원시데이터 가져오기
library(readxl) 		

#dustdata.xlsx 파일을 불러온 후 저장
dustdata <- read_excel("./dustdata.xlsx")

View(dustdata) 	# 데이터 확인
str(dustdata)	# 데이터 속성 확인

# 데이터 가공 : 비교할 지역 데이터만 추출하기
library(dplyr)		

# 성북구와 중구 데이터만 추출 및 확인(%in% c() => area=="성북" | area=="중구") 후 데이터 세트에 할당
dustdata_anal <- dustdata %>% filter(area %in% c("성북구" , "중구"))  
View(dustdata_anal)

# 데이터 현황 파악하기
# dustdata_anal 데이터 세트에 yyyymmdd에 따른 데이터 수 파악 => count()
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))

# dustdata_anal 데이터 세트에 area에 따른 데이터 수 파악 => count()
count(dustdata_anal, area) %>% arrange(desc(n))

# area 값이 성북구인 데이터를 dust_anal_area_sb에 할당 => subset()
dust_anal_area_sb <- subset(dustdata_anal, area =="성북구")

# area 값이 중구인 데이터를 dust_anal_area_jg에 할당 => subset()
dust_anal_area_jg <- subset(dustdata_anal, area =="중구")

# 데이터 확인
dust_anal_area_sb
dust_anal_area_jg

# psych 패키지 설치 및 로드
install.packages("psych")
library(psych)

# 성북구의 미세먼지량에 대한 기초 통계량 도출 => describe()
describe(dust_anal_area_sb$finedust)

# 중구의 미세먼지량에 대한 기초 통계량 도출 => describe()
describe(dust_anal_area_jg$finedust)

#  데이터 분석 : 분포 시각화 확인 및 가설 검정
# 성북구와 중구의 미세먼지 농도에 대해 boxplot(main, namees, xlab, ylab, col)을 통한 분포 차이 확인
boxplot(dust_anal_area_sb$finedust, dust_anal_area_jg$finedust,
        main = "finedust_compare", xlab = "AREA", namees = c("성북구", "중구"),
        ylab = "FINEDUST_PM", col = c("blue", "green"))

# 데이터 세트에서 측정소명(area)에 따라 미세먼지 농도 평균에 대한 차이를 t검증
t.test(data = dustdata_anal, finedust ~ area, var.equal = T)

# 분석 
# 분포가 다르다
# t 통계량은 (t = 2.8347), 자유도 (df = 242), 유의확률 (p-value = 0.004975)
# 검정결과는 p-value = 0.004975로 유의수준 0.05보다 작다.
# 그러므로 귀무가설(성부구와 중구의 미세먼지 평균은 차이가 나지 않는다)를 기각 => 차이가 난다
# 참고 : 성북구(42.74590),중구(35.90984)
 

