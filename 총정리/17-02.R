
# 통계량 분석
  ### 공분산 (covariance)
  ### 상관계수 (correlation coefficient)
#  다변수 확률변수 간의 상관 관계를 숫자로 나타낸 것이 공분산과 상관계수

# 공분산 : 두 확률변수 사이의 관계를 선형관계로 나타낼 때  A변수가 변할 때 B변수가 변하는 정도
# 𝐶𝑜𝑣(𝑋, 𝑌)>0  : 두 확률변수 𝑋, 𝑌 의 공분산이 양수로 나오면 방향이 같이 변한다.
# 𝐶𝑜𝑣(𝑋, 𝑌)=0  : 두 확률변수 간에 어떠한 (선형) 관계가없다
# 𝐶𝑜𝑣(𝑋, 𝑌)<0  : 두 확률변수 𝑋, 𝑌 의 공분산이 양수로 나오면 방향이 다르게 변한다.

# 상관계수 => 어느정도의 절대적 상관관계인지를 파악하기 위해 공분산을 표준화시킨 상관계수를 통해 파악 (두 확률변수 𝑋, 𝑌의 공분산을 각 확률변수의 표준편차의 곱으로 나눈 값)
# -1 혹은 1에 가까울수록 강한 상관이고 0에 가까이 갈수록 약한 상관
# 공분산의 성질을 받아 양수일 경우 두 변수의 값의 변화는 같은 방향으로 진행되고, 음수일 경우는 서로 반대.
# 표본상관계수를 이용하여 추정

# 모집단 : 알고자 하는 대상 전체
# 표본 : 모집단의 일부분

# R에서는 cov() 함수를 이용하여 표본공분산을 구함
# R에서는 cor() 함수를 이용하여 표본상관계수를 구함

# 일반적으로 공분산과 상관계수라고 하면 포본공분산과 표본상관계수를 의미 
# 모집단의 경우에는 모집단임을 나타내는 표현으로 모집공분산 모집단 상관계수라 부름
# 주의 : 상관관계를 회귀분석의 인과관계와 혼동해서는 안된다.


#  아버지와 아들의 키 자료로부터 아버지와 아들의 키의 공분산과 상관계수?

#### 데이터 읽어오기
hf <- read.csv("C:/Rstudy/Rsung/Galton.csv", header=T, stringsAsFactors = FALSE) # header=T, stringsAsFactors = FALSE(R이 factor로 자동 변환되지 않게 하기 위해)
head(hf) # Family(가족번호) Father(아빠키) Mother(엄마키) Gender(성별) Height(키) Kids(자년의 수)
str(hf)
dim(hf)

#### factor로 변환
hf$Gender <- factor(hf$Gender, levels=c("M", "F")) # hf$Gender의 factor형 자료를 이용해서 수준을  "M", "F"으로 함
str(hf$Gender) # 내부적으로 정수로 출력되지만 각 수준은 문자열처럼 사용

#### 데이터 프레임 가공
hf.son <- subset(hf, Gender=="M") # subset 함수를 사용해서 성이 M인 값만 추출해서 hf.son에 저장
hf.son <- hf.son[c("Father", "Height")] # 관찰개수가 898 에서 465개로 줄어 들었으나 변수는 그대로 유지
str(hf.son) # 변수의 개수가  Father와 Height 축소

#### 산점도 그리기
par(mfrow=c(1, 1), mar=c(4, 4, 1, 1)) # 도포에 대한 지점 함수 mfrow=c(좌우 비율), mar=c(좌우 상하여백)
plot(Height~Father, pch=16, data=hf.son, xlab="아버지의 키(인치)", ylab="아들의 키(인치)") # 산점도 도표
abline(lm(Height~Father, data=hf.son), col="red", lwd=2) # 산점도 도표아들의 키에 대해 회귀분석으로 아버지의 키와의 관계를 선으로 보여뭄
  


# 표본공분산 구하기
f.mean <- mean(hf.son$Father)  # 표본공분산 계산을 위해 아버지의 키(hf.son$Father)의 평균을 변수 f.mean에 저장
s.mean <- mean(hf.son$Height)  # 표본공분산 계산을 위해 아들의 키(hf.son$Height)의 평균을 변수 s.mean에 저장

cov.num <- sum( (hf.son$Father-f.mean) * (hf.son$Height - s.mean) ) # 두 변수의 편차의 곱을 전부 합한 값을 변수 cov.num에 저장
cov.xy <- cov.num / (nrow(hf.son) - 1)   # 위에서 구한 cov.num(편차 곱의 합)을 (자료의 개수-1)로 나누고 변수 cov.xy에 저장한 후 출력
cov.xy
cov(hf.son$Father, hf.son$Height)    # R에서는 cov() 함수를 이용하여 표본공분산을 구함 
# 직접구한값과 R에서 구한 표본공분산과 비교하면 동일한 값임을 확인

# 표본 상관계수를 구함 (-1에서 1사이의 값을 가짐=>보통 0.3과0.7사이이면 뚜렷한 양적관계로 0.7과 1.0사이는 강한 양적선형관계)
r.xy <- cov.xy / (sd(hf.son$Father) * sd(hf.son$Height)) # 위 표본공분산을 두 변수의 표본표준편차의 곱으로 나누어 표본상관계수를 구하고, 이를 변수 r.xy에 저장한 후 출력
r.xy
cor(hf.son$Father, hf.son$Height) # R의 표본상관계수 함수는 cor()는 직접 구한 표본상관계수와 비교하면 동일한 값임을 확인

cor(iris[,1:4])
pairs(iris[,1:4]) # 산점도 행렬은 다수의 변수들 간의 관계를 한눈에 파악하는데 유용한 시각화 방법
plot(iris[,1:4]) 
