#데이터마이닝 => 텍스트 데이터에서 유용한 정보 또는 지식을 찾아내는 일
# document(문서) => 뉴스, 설명문, 트윗 하나하나
# corpus(말뭉치) => 특정 분야에서 발생하는 문서의 집합 예) 대선 관련 기사,사회학자가 모은 한 달간 트윗 문서 전체

# 02 DTM 구축 #
library(RCurl) # 웹 서버에 접속
library(XML)   # 웹 문서 처리

# 위키피디아의 “data science” 문서로 실험
t <- readLines('https://en.wikipedia.org/wiki/Data_science') # readLines 함수는 지정된 URL에서 html 파일을 읽어옴
d <- htmlParse(t, asText = TRUE)   # htmlParse와 xpathSApply 함수는 웹 문서를 R의 데이터 형으로 변환해줌
clean_doc <- xpathSApply(d,"//p", xmlValue)
str(d)
# 전처리
library(tm) # tm 라이브러리는 데이터 마이닝 함수 제공
library(SnowballC) # SnowballC 라이브러리는 어간을 추출하는 함수 제공

doc <- Corpus(VectorSource(clean_doc)) # 벡터화한 문서를 말뭉치화
inspect(doc) # 문서의 본문을 보여줌

######## 경고 메세지 등장(이유?) => 오류는 아니고 빈문서로 경고인듯
doc <- tm_map(doc, content_transformer(tolower))  # 소문자로 변환
doc <- tm_map(doc, removeNumbers)     # 숫자 제거
doc <- tm_map(doc, removeWords, stopwords('english'))   # 지정단어제거 불용어 제거
doc <- tm_map(doc, removePunctuation)    # 구두점제거
doc <- tm_map(doc, stripWhitespace)    # 공백문자 제거

dtm <- DocumentTermMatrix(doc)  # dtm 적용
dim(dtm)  # dtm의 변수를 보여줌
inspect(dtm)  # 상세내용을 요약해서 보여줌

# 03 단어 구름 #
library(wordcloud)

m <- as.matrix(dtm)   # dtm을 행렬로 변환
v <- sort(colSums(m), decreasing = TRUE)  # 빈도가 높은 순으로 정렬
d <- data.frame(word = names(v), freq = v)  # 데이터프레임을 만들고
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 100, random.order = FALSE, rot.per = 0.35) # 빈도가 높은 100개 단어 rot.per = 0.35(세로로 배치한 단어의 비율을 35%로 지시)

library(RColorBrewer) # 단어에 칼라를 입힘

pal <- brewer.pal(11,"Spectral") # 11가지 색을 제공하는 Spectral이라는 팔레트
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.50, colors = pal) # max.words = 50은 단어의 갯수를 50개로 제한, rot.per = 0.50(세로 가로 반반)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.50, colors = pal, family = "mono", font = 2) # family = "mono", font = 2 (폰트)

library(wordcloud2)
wordcloud2(d) # wordcloud2는 wordcloud 이후 버전으로 사용하기 좋고 자동으로 색상 입혀주고 단어를 다양한 방향으로 배치해 줌

d1 <- d[1:200, ]        # 200개 단어만 표시(wordcloud2에는 단어 개수 지정하는 옵션이 없어 미리 추출)
wordcloud2(d1, shape = 'star') # shape = 'star'은 배경 모양
wordcloud2(d1, minRotation = pi/4, maxRotation = pi/4, rotateRatio = 1.0) # minRotation = pi/4, maxRotation = pi/4는 단어 방향 범위 지정, rotateRatio = 1.0는 모든단어 한 방향


findFreqTerms(dtm, lowfreq = 12)  # lowfreq = 12는 발생빈도가 상위 12개 단어만 표시하라는 옵션

findAssocs(dtm, terms = 'harvard', corlimit = 0.7)  # ‘harvard’와 상관관계가 0.7이상인 단어를 표시하라는 옵션

barplot(d[1:10, ]$freq, las = 2, names.arg = d[1:10,]$word, col = 'lightblue', main = '발생 빈도 상위 단어', ylab = '단어 빈도') # 빈도가 높은 순으로 막대그래프로 보여줌 (barplot는 패키지 필요없음)

# 텍스트 이외의 응용 : gapminder 예제 
library(gapminder)
library(dplyr)

pop_siz <- gapminder%>%filter(year==2007)%>%group_by(continent)%>%summarize(sum(as.numeric(pop))) # gapminder데이터에 구름단어적용 실습(대륙별 인구 분포)
d <- data.frame(word = pop_siz[, 1], freq = pop_siz[, 2])
str(d)
head(d)
wordcloud(words = d[, 1], freq = d[, 2], min.freq = 1, max.words = 100, random.order = FALSE, rot.per = 0.35)
wordcloud2(d)

# 04 문서 분류 #
# 지도 학습(supervised learning)에 속하는 분류 문제

library(text2vec)  # 텍스트마이닝을 위해 사용
library(caret) # 성능평가

# movie_review 데이터
# text2vec 라이브러리가 제공
# 5000개의 샘플, 3개의 변수(id, sentiment, review)
  # id는 일련번호이므로 무시, sentiment는 반응 변수에 해당(1은 긍정 평가, 0은 부정 평가)
  # Review 변수는 영화를 평가하는 텍스트
str(movie_review)
head(movie_review)

# sampling : 데이터를 훈련 집합(mtrain)과 테스트 집합(mtest)로 나눔(6:4 비율로) 
train_list = createDataPartition(y= movie_review$sentiment, p = 0.6, list =  FALSE) # p = 0.6(6:4), list =  FALSE(결과를 리스트로 반환을 안하고 행렬로 반환)
str(train_list)
mtrain = movie_review[train_list, ] # 3000개
dim(mtrain)
mtest = movie_review[-train_list, ] # 2000개
dim(mtest)

# 훈련 집합으로 DTM 구축
doc = Corpus(VectorSource(mtrain$review)) # Corpus함수로 훈련데이터 벡터화
doc = tm_map(doc, content_transformer(tolower)) # 소문자로 변환
doc = tm_map(doc, removeNumbers) # 숫자 제거
doc = tm_map(doc, removeWords, stopwords('english')) # 불용어 제거
doc = tm_map(doc, removePunctuation) # 구두점제거
doc = tm_map(doc, stripWhitespace) # 공백문자 제거
dtm = DocumentTermMatrix(doc)  # doc를 dtm 적용
dim(dtm) # 사전의 크기는 36871 (3000개 훈련 문서에서 36871개의 단어가 추출됨)
str(dim)
inspect(dtm) # 3000*36871=110613000개의 칸 중에 295077개만 0이 아니고 나머지 110317923개는 0

dtm_small = removeSparseTerms(dtm, 0.90) # 사전이 아주 커서 그대로 적용하면 메모리 오류 발생 -> removeSparseTerms 함수로 줄임=>105개의 단어만 남음
str(dtm_small)
dim(dtm_small)
X = as.matrix(dtm_small)
dataTrain = as.data.frame(cbind(mtrain$sentiment, X)) # cbind 함수로 반응 변수 sentiment를 덧붙여 훈련데이터를 구축
dataTrain$V1 = as.factor(dataTrain$V1) # factor는 R에서 제공하는 categorical variable(범주형 변수)로 변환
colnames(dataTrain)[1] = 'y' #dataTrain의 1열의 이름을 Y로 지정
str(dataTrain)

# 결정 트리(다양한 의사결정 경로와 결과를 나타내는데 트리 구조)를 학습
library(rpart) # rpar는 분류 및 회귀 트리를 확장하기 위한 강력한 프레임 워크를 제공
r = rpart(y~., data = dataTrain) #dataTrain데이터에 있는 Y의 분류 및 회귀를 함
printcp(r) # r을 출력
par(mfrow = c(1, 1), xpd = NA)
plot(r)
text(r, use.n = TRUE)

# 랜덤 포리스트(의사결정트리를 이용해 만들어진 알고리즘)를 학습
library(randomForest)
f = randomForest(y~., data = dataTrain)
# 훈련 집합으로 DTM 구축

##$$$$ 예측과 성능평가$$$$
# 테스트 목적으로 남겨둔 mtest로 성능을 평가
  # 먼저 mtest에 전처리 적용 (학습 과정과 동일한 과정을 적용해야 함)
  # 훈련 집합이 사용한 사전을 테스트 과정에도 그대로 사용해야 함

docTest = Corpus(VectorSource(mtest$review))
docTest = tm_map(docTest, content_transformer(tolower)) 
docTest = tm_map(docTest, removeNumbers)
docTest = tm_map(docTest, removeWords, stopwords('english'))
docTest = tm_map(docTest, removePunctuation)
docTest = tm_map(docTest, stripWhitespace)

dtmTest = DocumentTermMatrix(docTest, control=list(dictionary=dtm_small$dimnames$Terms)) # control 옵션으로 학습 과정이 사용한 사전(control=list(dictionary=)을 여기서도 사용함

dim(dtmTest)
str(dtmTest)
inspect(dtmTest)

# 결정 트리 예측 
X = as.matrix(dtmTest)
dataTest = as.data.frame(cbind(mtest$sentiment, X)) # cbind 함수로 반응 변수 sentiment를 덧붙여 테스트데이터를 구축
dataTest$V1 = as.factor(dataTest$V1)
colnames(dataTest)[1] = 'y'
pr = predict(r, newdata = dataTest, type = 'class') # 모델을 통한 예측 => predict(r....)에서 r은 결정 트리 r
table(pr, dataTest$y)    # 결정 트리는 (570+934)/2000=75.2%의 정확률 
# 랜덤 포리스트로 예측   
pf = predict(f, newdata = dataTest)   # predict(f....)에서 f은 랜덤 포리스트 f
table(pf, dataTest$y)    # 랜덤 포리스트는 (738+770)/2000=75.4%의 정확률




# 05 영어 텍스트 마이닝을 이용한 한국어 처리 #

library(tm)
library(XML)
library(wordcloud2)
library(SnowballC)
library(RCurl)
t = readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0') #URL을 클릭하여 복사하고 R에서 붙여넣기 하면 UTF-8 표기로 바뀜
d = htmlParse(t, asText = TRUE)
clean_doc = xpathSApply(d, "//p", xmlValue)

# 전처리 수행
doc = Corpus(VectorSource(clean_doc))
inspect(doc)


doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace)

# DTM을 구축
dtm = DocumentTermMatrix(doc)
dim(dtm) # 39개 문장 각각을 문서로 간주하여 39개 문서 추출 이들 문서에서 1443개의 단어를 추출하여 사전 구축

inspect(dtm) #‘등’, ‘있다＇등을 단어로 추출하였고, ‘데이터’, ‘데이터를‘, ‘데이터의’를 다른 단어로 추출하는 한계

# 데이터 프레임으로 변환하고 단어 구름을 그리면,
m = as.matrix(dtm)
v = sort(colSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
d1 = d[1:500, ]                # 500개 단어만 표시
wordcloud2(d1) # ‘등’, ‘및‘, ‘있다＇등이 중요 자리 차지 ‘데이터’, ‘데이터를‘, ‘데이터의’가 다른 단어로 간주되어 중요 자리 차지 <- 영어 텍스트 마이닝을 한글에 적용한 탓

# 06 KoNLP를 이용한 한국어 텍스트 마이닝 #

library(KoNLP)
# SystemDic, SejongDic, NIADic이라는 세 종류의 사전을 지원함
useSystemDic()
useSejongDic()
useNIADic()
# 한국어 품사 태그셋 (Pos09는9 종류로 품사 구분/Pos22는 22 종류로 품사 구분)
# 한글 형태소 분석 예제
  # -형태소morpheme란 언어를 구성하는 가장 작은 문법 요소
  # - 형태소 분석이란 문장을 형태소 단위로 분할하는 작업

useSejongDic()
s='너에게 묻는다 연탄재 함부로 발로 차지 마라 너는 누구에게 한번이라도 뜨거운 사람이었느냐'
extractNoun(s) # extractNoun 함수는 명사를 추출

SimplePos22(s) # simplePos22 함수는 Pos22 단계까지 형태소 분석을 수행 => ‘너에게’를 ‘너’라는 대명사(NP)와 ‘에게‘라는 격조사(JC)로 분해

t=readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
d=htmlParse(t, asText=TRUE)
clean_doc=xpathSApply(d, "//p", xmlValue)


useSejongDic()

nouns = extractNoun(clean_doc) 
mnous = unlist(nouns)
mnous_freq = table(mnous)
v = sort(mnous_freq, decreasing = TRUE)

wordcloud2(v)             # 모든 단어 표시 
v1 = v[1:100]              # 상위 100개 단어만 골라 표시
wordcloud2(v1)



#트위터 API를 이용한 말뭉치 얻기 #
library(twitteR)

# 아래 임의의 키 값 대신 사용자가 실제로 생성한 4개의 키를 입력!

consumerKey = "twEhTjcTtzJSUYqnewJp8fQgm"
consumerSecret = "nJIcd0ldPlZiTpUey8oLFGPxyjkDReZl5aSkPVvPtXfwUhowXS"
accessToken = "67037524gWk67HzUfJnSoYJbZAuyqak62SxzfnYp4X2pWzNG6"
accessTokenSecret = "nWmXO2UT6pm6I0ZrizBwE94bOrdUJIsrt3pBCBSKbI4B0"

setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)
keyword <- enc2utf8("미세먼지")
twitdata <- searchTwitter(keyword, n=100, lang="ko")
twitdata_df <- twListToDF(twitdata)
twitdata_text = twitdata_df$text
twitdata_text

