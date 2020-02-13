# 애국가로 형태소 분석하기
install.packages('KoNLP')
install.packages('stringi')
install.packages('vectrs')
install.packages("rlang")# 자바설치

remove.packages('KoNLP')
remove.packages('stringi')
remove.packages('vecters')
remove.packages('rlang')
library(KoNLP) # KoNLP 패키지로드시 에러 등장
library(rlang)
library(stringi)
library(readxl)

.libPaths('D:/Rstudy')
useSystemDic()	# 시스템 사전 설정
useSejongDic()	# 세종 사전 설정
useNIADic()	#NIADic 사전 설정

# 텍스트 다운로드 및 형태소 분석 실습

library(KoNLP) # KoNLP 패키지로드
useSejongDic()	# 세종 사전 설정

extractNoun('나는 학생이 아닙니다.')
# 텍스트 파일을 데이터로 가져온 후 word_data 변수에 할당
# https://www.mois.go.kr/frt/sub/a06/b08/nationalIcon_3/screen.do
word_data <- readLines("C:/Rstudy/Rsung/애국가(가사).txt")
word_data 	#word_data 확인
warnings()
# word_data 변수의 각 행에서 명사를 추출하여 word_data2  변수에 할당
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2 	#word_data2 확인

# 추가할 단어를 add_words 변수에 할당
add_words <- c("백두산", "남산", "철갑", "가을", "하늘", "달")

# add_words 변수의 데이터를 사용자 정의 단어(user_dic)로 추가
buildDictionary(user_dic = data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic = T)

# word_data 변수의 각 행에서 명사를 word_data2 변수에 할당
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2 	#word_data2 확인


undata <- unlist(word_data2) 	# word_data2를 백터로 변환한 후 undata 변수에 할당
undata 				# undata 확인

word_table <- table(undata) 		# undata의 빈도수 확인 후 word_table에 할당
word_table 			# word_table 확인

# undata에서 두 글자 이상인 단어만 선별한 후 undata2 변수의 할당
undata2 <- Filter(function(x) { nchar(x) >= 2 }, undata)
word_table2 <- table(undata2) 	# undata2의 빈도 확인 후 word_table2 변수에 할당
word_table2 			# word_table2 확인

sort(word_table2, decreasing = T) 	# word_table2를 내림차순 정렬


# 애국가 단어로 워드클라우드 만들기

install.packages("wordcloud2") 	# wordcloud2 패키지 설치

# wordcloud2() 함수의 다양한 옵션 알고가기

# 다양한 모양으로 워드클라우드 만들기

library(wordcloud2) 	# wordcloud2 패키지 로드
wordcloud2(word_table2)  	# word_table2의 워드 클라우드 생성

# color (색상), backgroundColor(배경색) 옵션 사용
wordcloud2(word_table2, color = "random-light", backgroundColor = "black")

# fontFamily(글꼴), size(크기), shape(모양) 옵션 사용
wordcloud2(word_table2, fontFamily = "맑은 고딕", size = 1.2, color = "random-light", backgroundColor = "black", shape = "star")

