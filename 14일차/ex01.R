
#데이터마이닝 => 텍스트 데이터에서 유용한 정보 또는 지식을 찾아내는 일
# document(문서) => 뉴스, 설명문, 트윗 하나하나
# corpus(말뭉치) => 특정 분야에서 발생하는 문서의 집합 예) 대선 관련 기사, 사회학자가 모은 한 달간 트윗 문서 전체
# 02 DTM 구축 #
library(RCurl)  # 웹 서버에 접속
library(XML)    # 웹 문서 처리

t <- readLines('https://en.wikipedia.org/wiki/Data_science') # 지정된 URL에서 html 파일을 읽어옴
d <- htmlParse(t, asText = TRUE)  # htmlParse, xpathSApply 함수는 지정된 데이터를 R 데이터 형으로 변환
clean_doc <- xpathSApply(d,"//p", xmlValue)
clean_doc


library(tm)
library(SnowballC)

doc <- Corpus(VectorSource(clean_doc))
inspect(doc)

doc <- tm_map(doc, content_transformer(tolower)) # 지정된 데이터를 소문자화 시켜준다
#경고메세지와 에러메시지는 다르다 
#경고 메세지는 명령이 실행되지만 에러메세지는 명령이 실행되지 않는다.
doc <- tm_map(doc, removeNumers)  # 숫자 제거
doc <- tm_map(doc, removeWords, stopwords('english')) # 불용어 제거 (한글로 치면 그리고...같은 단어들)
doc <- tm_map(doc, removePunctuation) # 구두점 제거
doc <- tm_map(doc, stripWhitespace) # 공백문자 제거

dtm <- DocumentTermMatrix(doc)  # dtm적용 지정된 데이터를 벡터화(열, 행 형태) 시켜준다
dim(dtm)  # dtm의 변수를 보여줌

inspect(dtm)

# 03 단어 구름 #
library(wordcloud)

m <- as.matrix(dtm) # dtm을 행렬로 변환
v <- sort(colSums(m), decreasing = TRUE)  # 빈도가 높은 순으로 정렬
d <- data.frame(word = names(v), freq = v)  # 데이터 프레임 생성
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 100, random.order = FALSE, rot.per = 0.35)
# 빈도가 높은 상위 100개의 단어를 단어구름 형태로 만든다.
# rot.per = 0.35 => 단어를 세로로 보여주는데 보여줄 단어의 비율 100개중 35%

library(RColorBrewer)

pal <- brewer.pal(11,"Spectral")  # 11가지 색을 제공하는 Spectral이라는 팔레트트
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.50, colors = pal)
wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 50, random.order = FALSE, rot.per = 0.50, colors = pal, family = "mono", font = 2)

library(wordcloud2)
wordcloud2(d)

d1 <- d[1:200, ]        # 200개 단어만 표시
wordcloud2(d1, shape = 'star')
wordcloud2(d1, minRotation = pi/4, maxRotation = pi/4, rotateRatio = 1.0)

findFreqTerms(dtm, lowfreq = 12) # 발생빈도 상위 12개 단어만 표시

findAssocs(dtm, terms = 'harvard', corlimit = 0.7) # harvard와 상관관계가 0.7 이상인 단어를 표시

barplot(d[1:10, ]$freq, las = 2, names.arg = d[1:10,]$word, col = 'lightblue', main = '발생 빈도 상위 단어', ylab = '단어 빈도')

library(gapminder)
library(dplyr)

pop_siz <- gapminder%>%filter(year==2007)%>%group_by(continent)%>%summarize(sum(as.numeric(pop)))
d <- data.frame(word = pop_siz[, 1], freq = pop_siz[, 2])
wordcloud(words = d[, 1], freq = d[, 2], min.freq = 1, max.words = 100, random.order = FALSE, rot.per = 0.35)
wordcloud2(d)

# 04 문서 분류 #

library(text2vec)
library(caret)

str(movie_review)

head(movie_review)

# 데이터를 훈련 집합(mtrain)과 테스트 집합(mtest)로 나눔
train_list <- createDataPartition(y= movie_review$sentiment, p = 0.6, list =  FALSE)
mtrain <- movie_review[train_list, ]
mtest <- movie_review[-train_list, ]

# 훈련 집합으로 DTM 구축
doc <- Corpus(VectorSource(mtrain$review))
doc <- tm_map(doc, content_transformer(tolower))
doc <- tm_map(doc, removeNumbers)
doc <- tm_map(doc, removeWords, stopwords('english'))
doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, stripWhitespace)
dtm <- DocumentTermMatrix(doc)
dim(dtm)
str(dim)
inspect(dtm)

dtm_small <- removeSparseTerms(dtm, 0.90)
X <- as.matrix(dtm_small)
dataTrain <- as.data.frame(cbind(mtrain$sentiment, X))
dataTrain$V1 <- as.factor(dataTrain$V1)
colnames(dataTrain)[1] <- 'y'


library(rpart)
r <- rpart(y~., data = dataTrain)
printcp(r)
par(mfrow = c(1, 1), xpd = NA)
plot(r) 
text(r, use.n = TRUE)

library(randomForest)
f <- randomForest(y~., data = dataTrain)


# 훈련 집합으로 DTM 구축
docTest <- Corpus(VectorSource(mtest$review))
docTest <- tm_map(docTest, content_transformer(tolower))
docTest <- tm_map(docTest, removeNumbers)
docTest <- tm_map(docTest, removeWords, stopwords('english'))
docTest <- tm_map(docTest, removePunctuation)
docTest <- tm_map(docTest, stripWhitespace)

dtmTest <- DocumentTermMatrix(docTest, control=list(dictionary=dtm_small$dimnames$Terms))

dim(dtmTest)
str(dtmTest)
inspect(dtmTest)


X <- as.matrix(dtmTest)
dataTest <- as.data.frame(cbind(mtest$sentiment, X))
dataTest$V1 <- as.factor(dataTest$V1)
colnames(dataTest)[1] <- 'y'
pr <- predict(r, newdata = dataTest, type = 'class')
table(pr, dataTest$y)

pf <- predict(f, newdata = dataTest)
table(pf, dataTest$y)


# 05 영어 텍스트 마이닝을 이용한 한국어 처리 #

library(tm)
library(XML)
library(wordcloud2)
library(SnowballC)
library(RCurl)
t <- readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
d <- htmlParse(t, asText = TRUE)
clean_doc <- xpathSApply(d, "//p", xmlValue)


doc <- Corpus(VectorSource(clean_doc))
inspect(doc)


doc <- tm_map(doc, content_transformer(tolower))
doc <- tm_map(doc, removeNumbers)
doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, stripWhitespace)

dtm <- DocumentTermMatrix(doc)
dim(dtm)
inspect(dtm)


m <- as.matrix(dtm)
v <- sort(colSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)
d1 <- d[1:500, ]                # 500개 단어만 표시
wordcloud2(d1)



# 06 KoNLP를 이용한 한국어 텍스트 마이닝 #

install.packages('KoNLP') 
library(KoNLP)
useSystemDic()
useSejongDic()
useNIADic()


useSejongDic()
s<-'너에게 묻는다 연탄재 함부로 발로 차지 마라 너는 누구에게 한번이라도 뜨거운 사람이었느냐'
extractNoun(s)

SimplePos22(s)


t<-readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
d<-htmlParse(t, asText=TRUE)
clean_doc<-xpathSApply(d, "//p", xmlValue)


useSejongDic()

nouns <- extractNoun(clean_doc)  
mnous <- unlist(nouns)
mnous_freq <- table(mnous)
v <- sort(mnous_freq, decreasing = TRUE)

wordcloud2(v)             # 모든 단어 표시 
v1 <- v[1:100]              # 상위 100개 단어만 골라 표시
wordcloud2(v1)

# [더 알아보기] 트위터 API를 이용한 말뭉치 얻기 #
library(twitteR)

# 아래 임의의 키 값 대신 사용자가 실제로 생성한 4개의 키를 입력!
###### 아래는 트위트 API를 이용한는 예제로 안해도됨(참고바람)
consumerKey <- "twEhTjcTtzJSUYqnewJp8fQgm"
consumerSecret <- "nJIcd0ldPlZiTpUey8oLFGPxyjkDReZl5aSkPVvPtXfwUhowXS"
accessToken <- "67037524gWk67HzUfJnSoYJbZAuyqak62SxzfnYp4X2pWzNG6"
accessTokenSecret <- "nWmXO2UT6pm6I0ZrizBwE94bOrdUJIsrt3pBCBSKbI4B0"

setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)
keyword <- enc2utf8("미세먼지")
twitdata <- searchTwitter(keyword, n=100, lang="ko")
twitdata_df <- twListToDF(twitdata)
twitdata_text <- twitdata_df$text
twitdata_text

