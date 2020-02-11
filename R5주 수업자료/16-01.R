  
#####  단순선령 회귀분석(단순선형/ 다중선형 / 로지스텍 회귀) 
      ##### 1.회귀분석 용어
# 독립변수(independent variable):주식시세에 영향을 미치는 요인들(기업의 매출액, 원유가격, 국제정세, 정부정책 발표)
# 종속변수(dependent variable): 독립변수의 영향에 따라 값이 결정되는 주식시세
# 예측모델(prediction model) 또는 예측모형: 독립변수에 해당하는 자료와 종속변수에 해당하는 자료를 모아 관계를 분석하고 이를 예측에 사용할 수 있는 통계적 방법
# 회귀분석(regression analysis): 회귀 이론을 기초로 독립변수(설명변수)가 종속변수(반응변수)에 미치는 영향을 파악하여 예측 모델을 도출하는 통계적 방법
# 회귀분석에서 독립변수의 수가 하나인 경우를 단순 회귀(simple regression) 
# 독립변수의 수가 두 개 이상인 경우를 다중 회귀(multiple regression)

    ##### 2.단순선형 회귀분석 목표
# 독립변수(x)와 종속변수(y) 사이의 선형관계를 파악하여 예측에 활용하는 통계적 방법
# y=wx+(w와 b갖을 찾는 것이 1차 목표) => x와 y오 구성된 데이터가 있어야 함

    ##### 3. R을 이용한 단순선형 회귀분석=>1차식의 형태를 가짐(y=wx+b)
# 3.1 주행속도와 제동거리 사이의 회귀모델 구하기 =>lm() 함수를 이용하여 쉽게 회귀식을 구할수 있음

head(cars)            # dist(종속변수)와speed(종속변수)는 cars의 열
plot(dist~speed, data=cars)         # 산점도를 통해 선형관계 확인 => 제동거리(dist)와 스피드(speed)의 관계(선형관계여야 회귀분석이 가능)

model <- lm(dist~speed, cars)       # 회귀모델 만들기 : lm(dist~speed, cars)=>회귀분석(종속변수~독립변수, 데이터셋)) 
model

abline(model)                       # 회귀선을 산점도 위에 표시
coef(model)[1]                      # b 값 출력(y절대값)
coef(model)[2]                      # W 값 출력(선형의 기울기)


# 3.2 주행속도에 따른 제동거리 구하기 => 주행속도(30.35.40) 데이터를 위에서 구한 회귀모델(회귀식)에 대입
b <- coef(model)[1]
W <- coef(model)[2]

speed <- 30                                 # 주행속도
dist <- W*speed + b                 
dist                                        # 제동거리

speed <- 35                                 # 주행속도
dist <- W*speed + b                 
dist                                        # 제동거리

speed <- 40                                 # 주행속도
dist <- W*speed + b                 
dist                                        # 제동거리


#3.3 예상 제동거리, 실제 제동거리, 오차 구하기

speed <- cars[,1]                           # cars[,1] => cars의 첫번째 열(speed),  cars[,2] => cars의 두번째 열(dist)
pred <- W * speed + b
pred                                       # 예상 제동거리 

compare <- data.frame(pred, cars[,2], pred-cars[,2]) # pred(예상 제동거리), cars[,2](실제 제동거리), pred-cars[,2](예상 제동거리-실제 제동거리=오차)
colnames(compare) <- c('예상','실제','오차') # 열의 이름을 변경
head(compare)


######   2. 다중선형 회귀분석
  # 1. 다중선형 회귀모델 만들기 => lm() 함수로 구함

library(car)
head(Prestige) # 교육(각 직업에 존재하는 평균 교육 기간) /여성 변수(직업에 종사하는 여성의 비율) 명성 변수(1960 년대 중반에 실시 된 사회 조사에서 각 직종의 명성 점수) census(인구조사) 

newdata <- Prestige[,c(1:4)]                 # 회귀식 작성을 위한 데이터 준비 : Prestige[,c(1:4)] =>Prestige의 1열에서 4열
plot(newdata, pch=16, col="blue", main="Matrix Scatterplot")            # 산점도를 통해 변수들의 분포 와 두 변수의 관계를 한 번에 볼 수 있도록 함
 
# Prestige 데이터로 mod1 모델만들기    
mod1 <- lm(income ~ education + prestige + women, data=newdata)  #  회귀식 도출 lm(종속변수(income)~독립변수(education)+독립변수(prestige)+독립변수(women)) 
             
summary(mod1)
   ##### mod1의 해석
# Regression 결과를 해석하는데 가장 먼저할 것은 F-statistics 를 확인. p-value가 매우 작아, 최소 한 변수가 유의하다는 것을 알 수 있다
# 어떤 변수가 유의한지를 확인하기 위해, coefficient table에서 확인. 이 때, t-value와 p-value 는 귀무가설 평균=0 로 놓고 구한 값으로, 귀무가설로부터 얼마나 벗어난지에 관한 지표이다. 

# Coefficients는 Estimate가 독립 변수들의 값
# X의 estimate 값은 다른 변수가 고정되어있을 때, X가 한 단위 변화했을 때, Y의 평균적인 변화량이다. 예를 들어,prestige의 estimate 는 141.435 인데, 이는 prestige 가 1 변화했을 때, income의 평균적인 변화량이다. education의 경우, p-value > 0.05 이므로 이러한 estimate 의 값이 유의하지 않다는 것을 알 수 있다. 

# Intercept(y절편)
# ***는 해당 변수가 종속변수를 설명하는 데 얼마나 중요한 변수인가를 나타냄. *가 많을수록 통계적으로 중요하다는 의미
   ### Signif. codes:  0 ‘***’ / 0.001 ‘**’ /  0.01 ‘*’ /  0.05 ‘.’ /  0.1 ‘ ’ / 1
# p-value: < 2.2e-16(구한 모델이 의미있는 모델인가?)에 있는 p-value(유의수준) 값은 구한 회귀모델이 의미 있는 모델인지(신뢰할 수 있는 모델인지)를 나타내는 것으로, 이 값이 작을수록 의미 있는 모델인 것을 나타냄
# Adjusted R-squared(모델이 income를 얼마나 설명가능한가?):  0.6323 에 있는 Adjusted R-squareed 값은 모델의 설명력을 나타내며 0~1 사이의 값을 갖음

# 문제1 : 평균교육연수가 9.5년, 여성비율이 20%, 평판도가 80 이라면 예상 평균 연봉은 얼마일까요?
   # income = -253.850 + 177.199 * education + 141.435 * prestige - 50.896 * women
   # income = -253.850 + 177.199 * 9.5 + 141.435 * 80 + 50.896 * 20 = 13762.26
# 문제2 mod1이 선형회귀 모델은 유의하느냐? 
   # F-statistic(F-통계량)의 p-value를 이용해서 확인 => 2.2e-16로 0.05보다 매우 작으면 유의

# 2. 다중선형 회귀모델에서 변수의 선택
library(MASS) 		# stepAIC( ) 함수 제공 

newdata2 <- Prestige[,c(1:5)] # 모델 구축에 사용할 데이터셋 생성
head(newdata2) 
mod2 <- lm(income ~ education + prestige +
             women + census, data= newdata2)
summary(mod2)

mod3 <- stepAIC(mod2) 	# stepAIC()=>모델에 기여하는 변수들을 선별할 수 있는 함수를 이용하면 중요도가 높은변수(***별이 많은 것)선택 가능
mod3 			# 변수 선택 후 결과 확인
summary(mod3) 		# 회귀모델 상세 내용 확인 Adjusted R-squared의 값이 0.6327으로 mod1의 0.6323 값 보다 크게 차이가 없다. 그래서 mod3 모델이 mod2모델 보다 나은 모델이다. 
  
# 3. 로지스틱 회귀분석
    # 회귀모델에서 종속변수의 값의 형태가 연속형 숫자가 아닌 범주형 값인 경우를 다루기 위한 통계적 방법 ex) iris 데이터셋에서 4개의 측정값으로  품종을 예측. 품종이 범주형 값
    # R에서 로지스틱 회귀 모델은 glm() 함수 이용

# 2. 로지스틱 회귀모델 만들기
iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species) # 범주형 자료를 정수로 변환
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new) 	# 로지스틱 회귀모델 도출 => glm(Species(종속변수) ~나머지는 종속변수., data= iris.new) 
summary(mod.iris) 			# 회귀모델의 상세 내용 확인
  

# 3. 로지스틱 회귀모델을 이용한 예측 =>수작업으로 계산하여 품종을 예측하는 방법 대신, 구해놓은 회귀모델을 이용하여 보다 편리한 방법으로 품종을 예측
# 예측 대상 데이터 생성(데이터프레임)
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown                            # 예측 대상 데이터

pred <- predict(mod.iris, unknown) # 품종 예측 predict(mod.iris(로지스틱 회귀모델을 의미), unknown(예측 대상 데이터를 의미))
pred                               # 예측 결과 출력 
round(pred,0)                      # 예측 결과 출력(소수 첫째 자리에서 반올림) 

# 실제 품종명 알아보기
pred <- round(pred,0)
pred
levels(iris$Species)
levels(iris$Species)[pred]

# 4. 다수의 데이터에 대한 예측  => 예측 대상 데이터가 여러 개인 경우에도 유사한 방법으로 예측
 

test <- iris[,1:4]                     # 예측 대상 데이터 준비
pred <- predict(mod.iris, test)        # 모델을 이용한 예측
pred <- round(pred,0)                   
pred                                   # 예측 결과 출력
answer <- as.integer(iris$Species)     # 실제 품종 정보
pred == answer                         # 예측 품종과 실제 품종이 같은지 비교
acc <- mean(pred == answer)            # 예측 정확도 계산
acc                                    # 예측 정확도 출력

