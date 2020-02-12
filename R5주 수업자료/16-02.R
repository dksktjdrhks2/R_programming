
#### 1. if-else문   
# 조건문(conditional statement)에 따라 특정 명령을 실행을 하도록 하는 프로그래밍 명령문
# 조건에 따라 실행할 명령문을 달리해야 하는 경우에 사용


#if(비교 조건) {
#  조건이 참일 때 실행할 명령문(들)
#} else {
#  조건이 거짓 일 때 실행할 명령문(들)
#}

# 01 기본 if-else문

x <- 'A'
if(x == 'B'){
  y <- 200      # x가 B일 때 실행
} else{
  y <- 100      # x가 B가 아닌 나머지 경우 실행
}
y



# 02 else가 생략된 if문

x <- 'B'
y <- 100
if(x == 'A'){
  y <- 200       # x가 B일 때 실행
}
y


# 03 다중 if-else문

s <- 85

if (s > 90) {
  g <- 'A' 
} else if (s > 80) {
  g <- 'B' 
} else if (s > 70) {
  g <- 'C' 
} else if (s > 60) {
  g <- 'D' 
} else {
  g <- 'F' 
}
g
# 1. if와 else 다음에 있는 중괄호 { }는 프로그래밍에서 코드블록이라고 부름  
# 2. 여러 명령문을 하나로 묶어주는 역할   


# 04 조건문에서 논리 연산자의 사용


a <- 10
b <- 20
if(a>5 & b>5) {         # and 사용
  print (a+b)
}
if(a>5 | b>30) {        # or 사용
  print (a*b)
}


# 05 ifelse문(조건에 따라 둘 중 하나의 값 또는 변수를 선택할 때 사용)

a <- 10
b <- 20

if  (a>b) {
  c <- a
} else {
  c <- b
}
print(c)

a <- 10
b <- 20

c <- ifelse(a>b, a, b)
c

# 1. if-else문에서 발생할 수 있는 오류    
# 2. else는 반드시 if문의 코드블록이 끝나는 부분에 있는 }와 같은 줄에 작성해야 함






