# 회귀분석(단순선형 / 다중선형 / 로지스텍 회귀)

###### 1. 회귀분석 용어
# 독립 변수(independent variable) : 종속변수(주식시세)에 영향을 미치는 요인들(기업의 매출액, 원유 가격, 국제 정세, 정부정책 발표) => 원인
# 종속 변수(dependent variable) : 독립변수의 영향에 따라 값이 결정되는 주식시세 => 결과
# 회귀 분석(regression analysis) : 회귀 이론을 기초로 독립변수(설명변수)가 종속변수(반응변수)에 미치는 영행을 파악하여 예측 모델을 도출하는 통계적 방법
# 단순 회귀 : 회귀 분석에서 독립 변수의 수가 하나인 경우
# 다중 회귀(multiple regression) : 독립 변수의 수가 두 개 이상인 경우

# 2. 단순 선명 회귀 분석 목표
# 독립변수(x)와 종속변수(y) 사이의 선형관계를 파악하여 예측에 활용하는 통계적 방법

# 3. R을 이용한 단순성형 회귀분석 => 1차식의 형태를 가짐(y = wx + b)
# 3.1 주행속도와  제동거리 사이의 회귀모델 구하기 => lm() 함수를 이용하여 쉽게 회귀식을 구할수 있음

head(cars) # dist(종속변수)와 speed(독립변수)는 cars의 열

plot(dist~speed, data=cars)  # 산점도를 통해 선형 관계 확인 => 제동거리(dist)와 스피드(speed)의 관계(선형관계여야 회귀 분석이 가능)

model <- lm(dist~speed, cars) # 회귀 모델 만들기 : lm(dist~speed, cars) => 회귀 분석(종속변수 ~ 독립변수, 데이터셋)
model

abline(model) # 회귀선을 산점도 위에 표시
# b 값 출력(y 절대값) / coef()함수에, b와 w값이 포함
coef(model)[1] # model에 있는 첫번째 값
coef(model)[2] # model에 있는 두번째 값                 


# 3.2 주행속도에 따른 제동거리 구하기

b <- coef(model)[1]
W <- coef(model)[2]

speed <- 30                               
dist <- W*speed + b                 
dist                                        

speed <- 35                                 
dist <- W*speed + b                 
dist                                        

speed <- 40                               
dist <- W*speed + b                 
dist                                        



speed <- cars[,1]                       
pred <- W * speed + b
pred                                        

# 3.3 예상 제동거리, 실제 제동거리, 오차 구하기
compare <- data.frame(pred, cars[,2], pred-cars[,2])
colnames(compare) <- c('예상','실제','오차')
head(compare)


   
####### 2. 다중선형 회귀분석
# 1. 다중선형 회귀모델 만들기 => lm() 함수로 구함
library(car)
head(Prestige)
# 교육(각 직업에 존재하는 평균 교육 기간) / 여성 변수(직업에 종사하는 여성의 비율) 
# 명성 변수 (1960년대 중반에 실시 된 사회 조사에서 각 직종의 명성 점수) / census(인구조사)

newdata <- Prestige[,c(1:4)]               
plot(newdata, pch=16, col="blue",          
     main="Matrix Scatterplot")
# 산점도를 통해 변수들의 분포와 두 변수의 관계를 한 번에 볼 수 있도록 함

# Prestige 데이터로 mod1 모델만들기
# 회귀식 도출 lm(종속변수(income)~독립변수(education)+독립변수(prestige)+독립변수(women))
mod1 <- lm(income ~ education + prestige + women, data=newdata) 
summary(mod1)
# mod1의 해석
# Regression 결과를 해석하는데 가장 먼저할 것은 F-statistics를 확인, p-value가 매우 작아, 최소 한 변수가 유의 하다는것을 알 수 있다.
# 어떤 변수가 유의한지를 확인하기 위해, Coefficients table에서 확인, 
# 이 때, t-value와 p-value는 귀무가설 평균=0로 놓고 구한 값으로, 귀무가설로부터 얼마나 벗어난지에 관한 지표이다.

# Coefficients는 Estimate가 독립 변수들의 값
# X의 estimate 값은 다른 변수가 고정되어있을 때, X가 한 단위 변화했을 때, y의 평균적인 변화량이다.
# 예를 들어, prestige의 estimate는 141,435 인데, 이는 prestige 가 1 변화했을 때,
# income의 평균적인 변화량이다, education의 경우, p-value > 0.05 이므로 이러한 estimate의 값의 유의하지 않다는 것을 알 수 있다.
# Intercept(y 절편)
# ***은 해당 변수가 종속변수를 설명하는데 얼마나 중요한 변수인가를 나타냄. *이 많을수록 통계적으로 중요하다는 의미
### Signif, codes : 0 '***' / 0.001 '**' / 0.05 '.' / 0.1 ' ' / 1
# p-value : < 2.2e-16(구한 모델이 의미있는 모델인가?)에 있는 p-value(유의수준) 값은 구한 회귀모델이
# 의미있는 모델인지(신뢰할 수 있는 모델인지)를 나타내는 것으로, 이 값이 작을수록 의미 있는 모델인 것을 나타냄
# Adjusted R-squared(모델이 income을 얼마나 설명가능한가?) : 0.6323 에 있는 Adjusted R-squared값은 모델의 설명력을
# 나타내며 0~1 사이의 값을 갖음
# 문제 1 : 평균 교육연수가 9.5년, 여성비율이 20%, 평판도가 80 이라면 예상 평균 연봉은 얼마인가?
#   income = 253.850 + 177.199 * education + 141.435 * prestige - 50.896 * women
#   income = 253.850 + 177.199 * 9.5 + 141.435 * 80 - 50.896 * 20 = 11,726.42
# 문제 2 : mod1이 선형회귀 모델은 유의하느냐?
# F-statistic(F-통계량)의 p-value 를 이용해서 확인 => 2.2e-16로 0.05보다 매우 작아서 유의하다.

library(MASS)
newdata2 <- Prestige[,c(1:5)] 
head(newdata2)
mod2 <- lm(income ~ education + prestige +
             women + census, data= newdata2)
mod3 <- stepAIC(mod2) 	
mod3 		
summary(mod3)
  

iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new) 
summary(mod.iris) 			
  


unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown                            
pred <- predict(mod.iris, unknown)
pred                               
round(pred,0)                    


pred <- round(pred,0)
pred
levels(iris$Species)
levels(iris$Species)[pred]

# 4. 다수의 데이터에 대한 예측   

test <- iris[,1:4]                     
pred <- predict(mod.iris, test)       
pred <- round(pred,0)                   
pred                                  
answer <- as.integer(iris$Species)     
pred == answer                        
acc <- mean(pred == answer)           
acc                                  