#파일을 직접 경로를 통해서 불러오기 
id <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)                      
sex <- c('f','m','m','m','f','f','m','f','m','f','m','m','m','m','f')      
age <- c(11,42,33,41,7,31,22,9,14,65,11,20,33,84,15) 

x <- data.frame(id=id, sex=sex, age=age)                    
View(x)                                                         
# csv파일로 저장
write.csv(x, file = 'D:/Rsung/xx.csv')      # write.csv() 함수 사용하여 저장(데이터 세트, file = “경로 /파일명”)
x
x1 <- read.table(file.choose())             # 창이 뜨면 직접 y.csv 파일 클릭
x1                                          #15행의 데이터가 출력하나 데이터가 오른쪽으로 쏠려서 출력
x2 <- read.csv(file.choose())               # 창이 뜨면 직접 y.csv 파일 클릭
x2                                          #read.csv 함수로 불러오면 데이터가 각 변수 열 위치에 정렬되어서 출력
head(x1)                                    # xx.csv 파일 데이터 위에서 6행까지 불러오기
tail(x1)                                    # y.csv 파일 데이터 끝 위에서 6행까지 불러오기
str(x1)
max(x1$age)                                 # x1$age는 x1데이터세트에 있는 age 변수에서 가장 큰값이 출력
min(x1$age)                                 # x1$age는 x1데이터세트에 있는 age 변수에서 가장 작은값이 출력
