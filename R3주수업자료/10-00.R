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
# 힌트1 서대문구를 추출하는 방법
x <- substr(ck$소재지전체주소, 7, 30)
head(x)

# -를 제거하는 방법
x1 <-  gsub("-", " ", x)		
head(x1)

# 숫자를 제거하는 방법
x2 <- gsub("[0-9]","",x1)
head(x2)

# 글자를 제거하는 방법
x3 <- gsub("번지" ,"",x2)
head(x3)

# 공백을 제거하는 방법
x4 <- gsub(" ","",x3)
head(x4)

install.packages('dplyr') 
library(dplyr) 		# 패키지 로드

# 도수분포표 작성 후 데이터 프레임으로 변환
xx <- c('가', '나', '다', '라', '나', '다', '다', '라', '나', '나', '다', '나', '다')
xxx <- xx %>% table()%>% data.frame()
head(xxx)

install.packages("treemap")	 		
library(treemap) 

treemap(xxx, index = ".", vSize = "Freq", title = "가나다라 분표")
xxx

arrange(xxx, desc(Freq)) %>% head()


