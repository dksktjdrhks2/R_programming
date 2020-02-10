
##########################        13_00
# 02 데이터 정제 #
install.packages("stringr")
library(stringr)

# 문자형 데이터를 문자형 그대로 읽어들임(factor형 변환 비활성화)
x = read.csv("./Rsung/googleplaystore.csv", header = TRUE, sep = ",", as.is = TRUE)
View(x)

# Price에 포함된 $ 기호를 제거함
x$Price = str_replace(x$Price, '\\$', '')

# 10473행의 데이터 항목 중 일부가 누락되어 제거함
x = x[-10473, ]

# Size열에서 값 대신 “Varies with device”로 표기된 데이터를 NA로 표시함
# Sys.setlocale('LC_ALL','C') 
x$Size = sub("Varies with device", NA, x$Size) 
# Mega byte를 의미하는 문자 M은 10의 6제곱으로 치환
x$Size = sub("M", "e6", x$Size, fixed = TRUE) 
# Kilo byte를 의미하는 문자 k도 10의 3제곱으로 치환
x$Size = sub("k", "e3", x$Size, fixed = TRUE)

# 문자열과 기호를 처리한 후 최종적으로 숫자형 데이터로 변환함
str(x) # Size(문자)
x$Size = as.numeric(x$Size)
str(x) # Size(숫자)
# Installs 열에 기록된 숫자보다 더 크다는 의미의 + 기호가 포함된 관측값과 
# 1,000 단위 숫자 구분에 사용되는 ,가 포함된 관측값이 있으므로 
# str_replace 함수를 사용해 빈 문자로 치환하여 처리함 
x$Installs = str_replace(x$Installs, '\\+', '')
x$Installs = str_replace_all(x$Installs, ',', '' )

# 숫자형으로 변환함. 
x$Installs = as.numeric(x$Installs)

# 데이터 원본과 문자열, 기호 등의 처리 과정에서 생긴 결측값을 제거함 
x = na.omit(x)

# 데이터 결함을 제거한 후 각 측정 항목의 데이터형을 고려하여 형 변환을 시행함
str(x$Category)
x$Category = as.factor(x$Category)
str(x$Category)
x$Reviews = as.numeric(x$Reviews)
x$Type = as.factor(x$Type)
x$Price = as.numeric(x$Price)
x$Content.Rating = as.factor(x$Content.Rating)
x$Genres = as.factor(x$Genres)

# 마지막 Date형의 손쉬운 변환을 위해 lubridate 라이브러리의 mdy 함수를 이용할 수 있음 
library(lubridate)
x$Last.Updated = mdy(x$Last.Updated) # mdy()는 (lubridate package 의 "y", "m", "d" 심볼을 이용한 함수)

library(dplyr)
glimpse(x) # 데이터 내용, 구조 파악하는 함수(데이터 내용, 구조, 타입을 파악한다. dplyr::glimpse() 함수가 유용하다. 데이터 구조를 파악할 수 있는 str(), 데이터 앞 부분을 보여주는 head()이 유용하다.}

View(x)


# 03 탐색적 데이터 분석 
library(ggplot2)
library(dplyr)
x %>% ggplot(aes(Rating)) + geom_histogram(stat="count") #플레이 스토어 앱의 평점의 전반적인 분위기(평점: Rating)

x %>% ggplot(aes(Rating, fill = Type)) + geom_histogram(stat="count",position = "dodge") # position = 'dodge'는 데이터의 종류를 나눠 따로 표시해주는 그래프
#무료앱이 유료앱보다 현저히많다.
#전체앱의 평점분도와 무료앱의 평점 분포가 유사하다.(가격대비 성능의 만족도로 해석)
str(x)
# x%>%ggplot(aes(Rating, col = Type)) + geom_density()

x%>%ggplot(aes(Reviews, Rating, col = Type)) + geom_point(alpha = 0.2) + scale_x_log10()# 평점과 리뷰 갯수의 관계=>평점이 높을수록 리뷰가 많다(변수간의 상호연관성이 있음)

x%>%ggplot(aes(Reviews, Rating, col = Type, size = Installs)) + geom_point(alpha = 0.2) + scale_x_log10() #앱의 설치 회수를 installs에 기록 => 많은 리뷰와 높은 평점이 인스톨 횟수도 많음 => 구글플레이 이용자는 보통 평점과 리뷰를 참고로 설치하므로 평점과 리뷰가 원인이고 설치횟수가 결과

x%>%ggplot(aes(Reviews, Rating, size = Installs)) + geom_point(alpha = 0.2) +scale_x_log10() + facet_wrap(~Type) # 무료앱과 유료앱의 비교(acet_wrap() 함수를 사용하여 면 분할을 구현) 

x%>%filter(Type=="Paid")%>%ggplot(aes(Reviews, Rating, size = Installs)) + geom_point(alpha = 0.2) + scale_x_log10()  # 유료앱의 평점과 리뷰의 산점도 표시(무료앱과 유사한 상관관계)
x%>%ggplot(aes(Reviews, Installs)) + geom_point(alpha = 0.2) + scale_x_log10() + scale_y_log10() # 리뷰와 설치회수의의 산점도 표시(무료앱과 유사한 상관관계)

x%>%ggplot(aes(Reviews, Installs)) + geom_point(alpha = 0.2) + scale_x_log10() + scale_y_log10() + geom_jitter()

x%>%filter(Type =="Paid" & Price < 5)%>%ggplot(aes(Price)) + geom_histogram(binwidth = 0.01)  # 가격의 분포 (5달러 이하를 확대해서 본 것)

x%>%filter(Type =="Paid" & Price < 10 & Price > 5)%>%ggplot(aes(Price)) + geom_histogram(binwidth = 0.01) # 5~10 달러 범위나 확대한 가격의 분포 (999 가격 정책)

x%>%filter(Type =="Paid")%>%ggplot(aes(Price, Rating)) + geom_point(alpha = 0.2) # 유료앱의 평점과 리뷰의 산포도(양끝에 편중)

x%>%filter(Type=="Paid")%>%ggplot(aes(Price, Rating)) + geom_point(alpha = 0.2) + scale_x_log10() # 유료앱의 평점과 가격의 산포도(가로축 로그 스케일)

top4 <- x%>%group_by(Category)%>%summarize(n = n())%>%arrange(desc(n))%>%head(4) # 33개의 카테고리 중에 앱의 갯수가 많은 순서대로 4종류 추출

top4

x%>%filter(Type=="Paid" & Price < 50 & Category %in% top4$Category)%>%ggplot(aes(Price, Rating)) + geom_point(alpha = 0.2) + facet_wrap(~Category) # 4종류 주요 카테고리에서 평점과 가격의 분포 특성

x%>%ggplot(aes(Size, Rating)) + geom_point(alpha = 0.1) # 평점과 크기의 산포도

x%>%ggplot(aes(Content.Rating, Rating)) + geom_point(alpha = 0.1) + geom_jitter() # 평점과 콘텐츠 등급의  산포도
# x%>%filter(Content.Rating!= "Adults only 18 +")%>%ggplot(aes(Rating, col = Content.Rating)) + geom_density()    # 평점과 콘텐츠 등급에 따른 평점의 확률 밀도 비교


x%>%ggplot(aes(Category, Rating)) + geom_point(size = 0.1, position = "jitter") + coord_flip() # 카테고리와 평점의 산전도


# 04 모델링과 예측 #
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

anova(lm.D9)
summary(lm.D90)

opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(lm.D9, las = 1)      # Residuals, Fitted, ...
par(opar)


m = lm(Rating ~ Size + Content.Rating + Category, data = x)


m


deviance(m)/nrow(x)


ps = select(x, Rating, Category, Size, Content.Rating)
library(caret)
data = ps[sample(nrow(ps)), ]
k = 10
q = nrow(data)/k
l = 1:nrow(data)

te_total = c()
pe_total = c()
for(i in 1:k) {
  test_list = ((i-1) * q+1) : (i * q)
  testData = data[test_list,]
  train_list = setdiff(l, test_list)
  trainData = data[train_list, ]
  
  m = lm(Rating~., data = trainData)
  # print(residuals(m))
  te = deviance(m)/nrow(trainData)        # mean squared error
  te_total = c(te_total, te)
  
  prd = predict(m, newdata = testData)
  pe = mean((prd-testData$Rating)^2)       # mean squared error
  pe_total = c(mse_total, pe)
}

(te_total)
(pe_total)


ps = select(x, Rating, Category)
#ps = select(x, Rating, Size)
#ps = select(x, Rating, Content.Rating)
#ps = select(x, Rating, Category, Size)
#ps = select(x, Rating, Category, Content.Rating)
#ps = select(x, Rating, Size, Content.Rating)
#ps = select(x, Rating, Category, Size, Content.Rating)




library(rpart)	

r = rpart(Rating~., data = trainData)	
prd = predict(r, newdata = testData)	


library(randomForest)	

f = randomForest(Rating~., data = trainData)
prd = predict(f, newdata = testData)	


# 랜덤 포리스트 모델(SVM 라이브러리)
library(e1071)		# SVM 라이브러리

f = svm(Rating~., data = trainData)		
prd = predict(f, newdata = testData)	



x%>%group_by(Category, Genres)%>%summarise(n = n())%>%arrange(Category)%>%ggplot(aes(Category, Genres, size = n)) + geom_point() + theme(axis.text.y = element_text(size = 5), axis.text.x = element_text(size = 7, angle = -45, hjust = 0, vjust = 0))

