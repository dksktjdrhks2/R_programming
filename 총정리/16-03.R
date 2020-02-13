#### 2. for문   
# 반복문(repetitive statement)은 정해진 동작을 반복적으로 수행할 때 사용하는 명령문
# 동일 명령문을 여러 번 반복해서 실행할 때 사용

#for (반복 변수 in 반복 범위) {
  # 반복할 명령문(들)
# } 

# 01 기본 for문

for(i in 1:5) {
  print('*')
}

# 02 반복 범위에 따른 반복 변수의 값 변화

for(i in 6:10) {
  print(i)
}


# 03 반복 변수를 이용한 구구단 출력

for(i in 1:9) {
  cat('2 *', i,'=', 2*i,'\n')     #cat( )은 주어진 입력을 출력하고 행을 바꾸지 않음 
}


# 04 for문 안에서 if문의 사용

for(i in 1:20) {
  if(i%%2==0) {     # 짝수인지 확인
    print(i)
  }
}


# 05 1~100 사이의 숫자의 합 출력

sum <- 0
for(i in 1:100) {
  sum <- sum + i    # sum에 i 값을 누적
}
sum


# 06 iris에서 꽃잎의 길이에 따른 분류 작업

norow <- nrow(iris)                               # iris의 행의 수
mylabel <- c( )                                   # 비어있는 벡터 선언
for(i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {              # 꽃잎의 길이에 따라 레이블 결정
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
mylabel                                    # 레이블 출력
newds <- data.frame(iris$Petal.Length, mylabel)   # 꽃잎의 길이와 레이블 결합
head(newds)                                       # 새로운 데이터셋 내용 출력

