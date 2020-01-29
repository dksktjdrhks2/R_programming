 
id <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)                      
sex <- c('f','m','m','m','f','f','m','f','m','f','m','m','m','m','f')      
age <- c(11,42,33,41,7,31,22,9,14,65,11,20,33,84,15) 
                    
# 데이터 세트 t로하고 csv 파일로 저장(파일명 tt.csv)하시오.
t <- data.frame(id=id, sex=sex, age=age)
write.csv(t, file = 'D:/Rsung/tt.csv')      # write.csv() 함수 사용하여 저장(데이터 세트, file = “경로 /파일명”)

# tt.csv 파일을 choose 함수를 사용해서 t1 데이터 세트로 저장하고 불러오세요. 
t1 <- read.csv(file.choose())               # 창이 뜨면 직접 y.csv 파일 클릭
t1                                          #read.csv 함수로 불러오면 데이터가 각 변수 열 위치에 정렬되어서 출력
# tt.csv 파일 데이터를 위에서 6행까지 불러오세요.
head(t1)
# tt.csv 파일 데이터를 끝에서 6행까지 불러오세요.
tail(t1)
# tt.csv 파일 데이터를 구조를 불러오세요.
str(t1)

# x1$age는 x1데이터세트에 있는 age 변수에서 가장 큰값을 불러오세요. 
max(t1$age) 
# x1$age는 x1데이터세트에 있는 age 변수에서 가장 평균값을 불러오세요. 
mean(t1$age)                                
