# 02 데이터 정제 #
install.packages("stringr")
library(stringr)
library(readxl)

x = read.csv("./excel_data/googleplaystore.csv", quote = "", header = TRUE, sep = ",", as.is = TRUE)
x <- read_excel("./excel_data/googleplaystore.xlsx")
View(x)

x$Price = str_replace(x$Price, '\\$', '')


x = x[-10473, ] # 10473행의 데이터가 이상하여 제거함.


x$Size = sub("Varies with device", NA, x$Size)

x$Size = sub("M", "e6", x$Size, fixed = TRUE)

x$Size = sub("k", "e3", x$Size, fixed = TRUE)

str(x) # Size(문자)
x$Size = as.numeric(x$Size)
str(x) # Size(숫자)
x$Size

x$Installs = str_replace(x$Installs, '\\+', '')
x$Installs = str_replace_all(x$Installs, ',', '' )


x$Installs = as.numeric(x$Installs)


x = na.omit(x)


str(x$Category)
x$Category = as.factor(x$Category)
str(x$Category)
x$Reviews = as.numeric(x$Reviews)
x$Type = as.factor(x$Type)
x$Price = as.numeric(x$Price)
x$`Content Rating` = as.factor(x$`Content Rating`)
x$Genres = as.factor(x$Genres)


library(lubridate)
x$`Last Updated` = mdy(x$`Last Updated`)

library(dplyr)
glimpse(x)

View(x)


# 03 탐색적 데이터 분석 
library(ggplot2)
library(dplyr)
x %>% ggplot(aes(Rating)) + geom_histogram(stat="count")

x %>% ggplot(aes(Rating, fill = Type)) + geom_histogram(stat="count",position = "dodge") 
str(x)
x%>%ggplot(aes(Rating, col = Type)) + geom_density()

x%>%ggplot(aes(Reviews, Rating, col = Type)) + geom_point(alpha = 0.2) + scale_x_log10()

x%>%ggplot(aes(Reviews, Rating, col = Type, size = Installs)) + geom_point(alpha = 0.2) + scale_x_log10() 
x%>%ggplot(aes(Reviews, Rating, size = Installs)) + geom_point(alpha = 0.2) +scale_x_log10() + facet_wrap(~Type) 

x%>%filter(Type=="Paid")%>%ggplot(aes(Reviews, Rating, size = Installs)) + geom_point(alpha = 0.2) + scale_x_log10()  
x%>%ggplot(aes(Reviews, Installs)) + geom_point(alpha = 0.2) + scale_x_log10() + scale_y_log10() 

x%>%ggplot(aes(Reviews, Installs)) + geom_point(alpha = 0.2) + scale_x_log10() + scale_y_log10() + geom_jitter()

x%>%filter(Type =="Paid" & Price < 5)%>%ggplot(aes(Price)) + geom_histogram(binwidth = 0.01)  

x%>%filter(Type =="Paid" & Price < 10 & Price > 5)%>%ggplot(aes(Price)) + geom_histogram(binwidth = 0.01) 

x%>%filter(Type =="Paid")%>%ggplot(aes(Price, Rating)) + geom_point(alpha = 0.2) 

x%>%filter(Type=="Paid")%>%ggplot(aes(Price, Rating)) + geom_point(alpha = 0.2) + scale_x_log10() 

top4 <- x%>%group_by(Category)%>%summarize(n = n())%>%arrange(desc(n))%>%head(4) 

top4

x%>%filter(Type=="Paid" & Price < 50 & Category %in% top4$Category)%>%ggplot(aes(Price, Rating)) + geom_point(alpha = 0.2) + facet_wrap(~Category) 

x%>%ggplot(aes(Size, Rating)) + geom_point(alpha = 0.1) 
x%>%ggplot(aes(Content.Rating, Rating)) + geom_point(alpha = 0.1) + geom_jitter() 
x%>%filter(Content.Rating!= "Adults only 18 +")%>%ggplot(aes(Rating, col = Content.Rating)) + geom_density()    

x%>%ggplot(aes(Category, Rating)) + geom_point(size = 0.1, position = "jitter") + coord_flip() 


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

# 다중 선형 회귀 분석
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
  te = deviance(m)/nrow(trainData)        
  te_total = c(te_total, te)
  
  prd = predict(m, newdata = testData)
  pe = mean((prd-testData$Rating)^2)      ror
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



# 결정 트리 모델
library(rpart)			 

r = rpart(Rating~., data = trainData)			
prd = predict(r, newdata = testData)			

# 랜덤 포리스트 모델(랜덤 포리스트 라이브러리)
library(randomForest)	

f = randomForest(Rating~., data = trainData)	
prd = predict(f, newdata = testData)	


# 랜덤 포리스트 모델(SVM 라이브러리)
library(e1071)		# SVM 라이브러리

f = svm(Rating~., data = trainData)		
prd = predict(f, newdata = testData)		



x%>%group_by(Category, Genres)%>%summarise(n = n())%>%arrange(Category)%>%ggplot(aes(Category, Genres, size = n)) + geom_point() + theme(axis.text.y = element_text(size = 5), axis.text.x = element_text(size = 7, angle = -45, hjust = 0, vjust = 0))


#https://data-make.tistory.com/81

library(randomForest)
# 1. sampling 
sn <- sample(1:nrow(iris), size = nrow(iris)*0.7)     

train <- iris[sn,]         
test <- iris[-sn,]         


forest_m <- randomForest(Species ~ ., data=train)
forest_m   

forest_m$predicted           
forest_m$importance       

forest_m$mtry      
forest_m$ntree     

# 3. 모델을 통한 예측 
new_data <- iris[10,-5] + 0.2
predict(forest_m, newdata = new_data, type = 'class')   

iris[10,'Species']

# 4. 모델 평가 


prd_v <- predict(forest_m, newdata = test, type = 'class')
sum(prd_v == test$Species) / nrow(test) * 100

# 4-2) train data에 대한 score 확인 
prd_v2 <- predict(forest_m, newdata = train, type = 'class')
sum(prd_v2 == train$Species) / nrow(train) * 100

# 5. 모델 시각화
layout(matrix(c(1,2),nrow=1),width=c(4,1)) 
par(mar=c(5,4,4,0)) 
plot(forest_m)
par(mar=c(5,0,4,2)) # 왼쪽 마진 제거 
plot(c(0,1),type="n", axes=F, xlab="", ylab="")
legend("top", colnames(forest_m$err.rate),col=1:4,cex=0.8,fill=1:4)



# http://blog.naver.com/PostView.nhn?blogId=pmw9440&logNo=221586667065

colnames(iris)

levels(iris$Species)


install.packages(e1071)
library(e1071)
train <- sample(1:150, 100) #무작위로 100개 추출 (학습데이터)
(sv <- svm(Species ~., data = iris, subset = train,  type = "C-classification"))



predict(sv, iris[-train,])



(tt <- table(iris$Species[-train], predict(sv, iris[-train,])))


sum(tt[row(tt) == col(tt)])/sum(tt) #정분류율

1-sum(tt[row(tt) == col(tt)])/sum(tt) #오분류율


