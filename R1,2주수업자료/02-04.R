#행렬 생성하기
x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow = 2, ncol = 3)                    #2행 3열
matrix(x, nrow = 3, ncol = 2)                    #2행 3열 /위->아래
matrix(x, nrow = 3, ncol = 2, byrow = T)         #2행 3열 /왼쪽->오른쪽
matrix(x, nrow = 3, ncol = 4)
str(x)
length(x)

# 배열 생성하기
y <- c(1, 2, 3, 4, 5, 6, 7, 8)
array(y, dim= c(1, 2, 2))
array(y, dim= c(2, 2, 3))
array(y, dim= c(2, 3, 4))
str(y)
length(y)

# 리스트 생성하기
z <- list(c(1, 2, 3, 4), 'hellow', '1') #숫자와 문자 동시 생성
z
str(z)
length(z)