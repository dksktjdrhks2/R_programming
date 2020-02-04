# 종로구에 있는 한식당에 동별로 트리맵으로 표현하시오.
# 종로구에 있는 한식당에 남성과 여성의 종사자 수를 구하시오.

library("readxl") 			# 패키지 로드
kre <- read_excel("D:/Rsung1/한식_가공.xlsx") 	# 엑셀 데이터를 가져온 후 kre변수에 할당
head(kre) 				# kre 확인
dim(kre)

m <- as.numeric(kre$'남성종사자수')
m
is.numeric(kre$'남성종사자수')
is.na(m)   # 결측값 조회( TRUE 값으로 반환)
table(is.na(m))
max(m, na.rm = T )  # 결측값 제외
min(m, na.rm = T)
sum(m, na.rm = T )
### kre %>% group_by(소재지전체주소) %>% summarise(토탈남성 = sum(is.numeric(kre$'남성종사자수')))
install.packages('descr')
library(descr)
mm <- freq(kre$'남성종사자수', plot=T)
mm
str(kre)
    
f <- as.numeric(kre$'여성종사자수')
f
is.numeric(kre$'여성종사자수')
is.na(f)   # 결측값 조회( TRUE 값으로 반환)
table(is.na(f))
max(f, na.rm = T )  # 결측값 제외
min(f, na.rm = T)
sum(f, na.rm = T )
str(kre)
ff <- freq(kre$'여성종사자수', plot=T)
ff
library(backports)  # 소스 작성시 자동완성기능이 안됨
library(zeallot)
#소재지전체주소 열에서 11번째 글자부터 14번째 글자 앞까지 추출
addr <- substr(kre$소재지전체주소, 11, 14)
head(addr) 	# addr 확인
addr_num <- gsub("[0-9]","",addr) 		# 숫자 제거
addr_trim <- gsub(" ", "", addr_num)
addr_trim <- gsub(" 번", "", addr_num)# 공백 제거

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
treemap(addr_count, index = ".", vSize = "Freq", title = "서대문구 동별 치킨집 분표")

#내림차순으로 실제 데이터 확인
arrange(addr_count, desc(Freq)) %>% head()
