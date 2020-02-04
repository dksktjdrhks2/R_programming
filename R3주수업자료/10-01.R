# 치킨집 데이터 다운로드하기
# LOCALDATA 웹사이트(http://www.localdata.kr/)에 접속한 후 [데이터받기 - 지역 다운로드]를 클릭한 후 지역별 목록에서 서울특별시의 다운로드 버튼을클릭합니다.
# 엑셀에서 필요없는 데이터 제거하기
# 데이터 가공 및 트리 맵 표현하기
# 소재지 전체 주소 가공하기

library("readxl") 			# 패키지 로드
ck <- read_excel("./치킨집_가공.xlsx") 	# 엑셀 데이터를 가져온 후 ck 변수에 할당
head(ck) 				# ck 확인
View(ck)
str(ck)

#소재지전체주소 열에서 11번째 글자부터 16번째 글자 앞까지 추출
addr <- substr(ck$소재지전체주소, 11, 16)
head(addr) 	# addr 확인
addr_num <- gsub("[0-9]","",addr) 		# 숫자 제거
addr_trim <- gsub(" ", "", addr_num)		# 공백 제거
head(addr_trim)				# addr_trim 확인

# 동별 업소 개수 확인하기
install.packages('dplyr') 
library(dplyr) 		# 패키지 로드

# 도수분포표 작성 후 데이터 프레임으로 변환
addr_count <- addr_trim %>% table() %>% data.frame() # 변수의 갯수 확인 함수 table()
head(addr_count) 		#daar_count 확인

# 트리맵으로 표현하기 
###### treemap(데이터세트, index = 구분열, vSize= 분포열, vColor, tatle = 제목)

install.packages("treemap")	 		
library(treemap) 			

# 동이름 열(.)과 치킨집 개수 열(Freq)로 트리 맵 표현
treemap(addr_count, index = ".", vSize = "Freq", title = "서대문구 동별 치킨집 분표")
addr_count
#내림차순으로 실제 데이터 확인
arrange(addr_count, desc(Freq)) %>% head()
