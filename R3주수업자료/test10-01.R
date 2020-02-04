# 동대문구에 있는 레스토랑 수를 동별로 트리맵으로 표현하시오.

library("readxl") 			# 패키지 로드
re <- read_excel("./Rsung/레스토랑_가공.xlsx") 	# 엑셀 데이터를 가져온 후 re변수에 할당
re # re 확인
head(re,10)
View(re)
tail(re)

library(backports)  
library(zeallot)
#소재지전체주소 열에서 11번째 글자부터 16번째 글자 앞까지 추출
addr <- substr(re$소재지전체주소, 11, 16)
head(addr) 	# addr 확인
addr_num <- gsub("[0-9]","",addr) 		# 숫자 제거
addr_trim <- gsub(" ", "", addr_num)		# 공백 제거
head(addr_trim)				# addr_trim 확인

# 동별 업소 개수 확인하기
install.packages('dplyr') 
library(dplyr) 		# 패키지 로드

# 도수분포표 작성 후 데이터 프레임으로 변환
addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count) 		#daar_count 확인

install.packages("treemap")	 		# 패키지 설치
library(treemap) 				# 패키지 로드

# 동이름 열(.)과 치킨집 개수 열(Freq)로 트리 맵 표현
treemap(addr_count, index = ".", vSize = "Freq", title = "서대문구 동별 레스토랑 분표")

#내림차순으로 실제 데이터 확인
arrange(addr_count, desc(Freq)) %>% head()
