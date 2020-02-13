
set.seed(0) # 임의의 정수 인수를 생성
rvnorm <- function(r) {
  x <- rnorm(50, 0, 1)      #정규확률분포 난수 발생 : rnorm(난수의 갯수 50개, mean =0, sd =1) 
  y <- rnorm(50, r*x, sqrt(1-r^2))    
  return(cbind(x,y))
}
# function(r) : 사용자 정의 함수
# par함수는 그래픽장치의 설정을 정의하는데 이용할 수 있는 함수로 여러 가지 그래픽인수는 그래픽의 속성을 정의하는 할 수 있으며, 이들 인수를 이용하여 화면의 분할 방법, 글자의 크기, 색상 등을 설정
# 데이터가 제각각인 수치로 나타나는 것을 '데이터 분포'
  
par(mfrow=c(1, 3), mar=c(2, 2, 2, 1), oma=c(0,0,0,0)) # par=>그림을 그리는 함수(mfrow=c(1, 3)=>행의 개수는 1, 열의 개수는 3인 그림, mar=내부 : 마진점이 있는 안쪽 , oma=외부마진 : 점이 있는 바깥쪽)

r1 <- rvnorm(0.8)  # 1에 가까울수록 같은 방향의 강한 상관을 나타남 
plot(r1, main="r=0.8")
abline(lm(r1[,2] ~ r1[,1]), col="red")

plot(rvnorm(0), main="r=0") # 0에 가까이 갈수록 약한 상관을 나타남 
abline(h=0, col="red")

r3 <- rvnorm(-0.8)  # -1 가까울수록 반대 방향의 강한 상관을 나타남 
plot(r3, main="r=0.8")
abline(lm(r3[,2] ~ r3[,1]), col="red")

