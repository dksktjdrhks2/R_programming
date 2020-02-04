# project03 트위터 키워드 크롤링으로 워드클라우드 그리기

# 트위터 API 활용하기

# 트위터 app 생성하기

# 웹사이트 : http://apps.twitter.com/
  
#  API 키 생성하기

# 트위터 키워드 검색 및 워드클라우드 표현

# twiteR 패키지 설치 및 0Auth 인증하기

install.packages('twitteR')
library(twitteR) # twitteR 패키지 로드
# 키 값으로 0Auth 인증
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)

# 키워드 검색 및 결과 값 가져오기

keyword <- enc2utf8("월드컵") 	#데이터 형 변환 후 keyword 변수에 할당
# keyword 변수에 있는 키워드로 결과 값을 100개 검색
bigdata <- searchTwitter(keyword, n=100, lang="ko")

#크롤링 데이터를 데이터 프레임으로 변환하고 bigdata_df에 할당
bigdata_df <- twListToDF(bigdata)

str(bigdata_df) 		# bigdata_df 데이터 세트 구조 확인

bigdata_text <- bigdata_df$text 	# text 열 추출 후 bigdata_text에 할당
head(bigdata_text) 			# bigdata_text 데이터 확인

# 텍스트에서 명사만 추출하기

library(KoNLP) 		# KoNLP 패키지 로드
useSejongDic 		# 세종 사전 설정

bigdata_noun <- sapply(bigdata_text, extractNoun, USE.NAMES = F)  # 명사 추출
bigdata_noun <- unlist(bigdata_noun) 				  # 백터로 변환


# 2글자 이상인 단어만 추출하여 저장
bigdata_noun <- filter(function(x) { nchar(x) >= 2 }{, bigdata_noun)

bigdata_noun <- gsub("[A-Za-z0-9]", "", bigdata_noun) 	# 영어, 숫자 제거
bigdata_noun <- gsub("[~!@#$%^&*()-_|+=?:]", "", bigdata_noun) 	# 특수문자 제거
bigdata_noun <- gsub("(ㅜ|ㅠ)+", "", bigdata_noun)		# 한 개 이상의 ㅜ와 ㅠ 제거

word_table <- table(bigdata_noun) 		# 데이터 세트 형태로 저장

library(wordcloud2)		#패키지 로드
# 워드클라우드 표현, random-light 글자 색, 검은 배경색 적용
wordcloud2(word_table, fontFamily = "맑은 고딕", size = 5, color = "random-light", backgroundColor = "black")