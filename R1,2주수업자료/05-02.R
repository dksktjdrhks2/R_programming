# 엑셀파일 불러오기
library(readxl)
x <- read_excel('./data/Sample1.xlsx') # t <- read_excel('./data/Sample1.xlsx')=> 실습용(실습 변수이름은 t)
x

# View 함수
View(x)
str(x)
dim(x)
ls(x)

## 변수명 변경하기
# 데이터 연산방식
install.packages('dplyr')
library(dplyr)  # 데이터처리 패키지(선택, 처리. 수정, 수정)
x <- rename(x, Y17_AMT = AMT17, Y16_AMT = AMT16) #x데이터 세트에서 AMT17를 Y17_AMT로, AMT16를 = Y16_AMT로 변경)
View(x) 

## 파생 변수 생성하기
# 데이터 연산방식
x$AMT <- x$Y17_AMT + x$Y16_AMT #x데이터 세트에서 Y17_AMT와 Y16_AMT를 더해서 AMT에 추가
x$CNT <- x$Y17_CNT + x$Y16_CNT #x데이터 세트에서 Y17_CNT와 Y16_CNT를 더해서 CNT에 추가
View(x)

# 변수 변환방식
x$AGE50_YN <- ifelse(x$AGE >= 50, 'Y', 'N') # AGE가 50이상이면  Y, 아니면, N $는 필드명(x의 필드명(AGE))
View(x)

# AGE가 50세 이상, 40세 이상, 30세 이상, 20세 이상, 20세 미만으로 5가지로 구분(필드명: AGE_GR10)
x$AGE_GR10 <- ifelse(x$AGE >= 50,'A1.50++',
                     ifelse(x$AGE >= 40,'A2.4049',
                            ifelse(x$AGE >= 30,'A3.3039',
                                   ifelse(x$AGE >= 20,'A4.2029',
                                          'A5.0019')))) # 괄호갯수가 일치 
x
View(x)
               
