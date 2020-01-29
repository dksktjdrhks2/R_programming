# 엑셀파일 불러오기 t 변수명으로 저장하고 불러 오시오..
t <- read_excel('./data/Sample1.xlsx') # t <- read_excel('./data/Sample1.xlsx')=> 실습용(실습 변수이름은 t)
# t세트의 테이블과 구조를 확인하시오. 
str(t)
# t세트의 데이터의 메뉴명을 확인하시오. 
ls(t)

install.packages('dplyr')
library(dplyr) 

#t데이터 세트에서 AMT17를 Y17_A로, Y17_CNT를 Y17_C로,AMT16를 Y16_A로, Y16_CNT를 Y16_C로변경하시오.
t <- rename(t, Y17_A = AMT17, Y17_C = Y17_CNT, Y16_A = AMT16, Y16_C = Y16_CNT) 
t 

#t데이터 세트에서 Y17_AMT와 Y16_AMT를 더해서 A에 Y17_CNT와 Y16_CNT를 더해서 C로 데이터명을 생성하시오.
t$A <- t$Y17_A + t$Y16_A 
t$C <- t$Y17_C + t$Y16_C 
t

# AGE가 30이상이면  Y, 아니면, N 으로 표시되는 필드를 작성하시오.(t의 필드명(A45_YN))
t$A30_YN <- ifelse(t$AGE >= 30, 'Y', 'N') 
t
# SEX가 남자이면  Y, 아니면, N 으로 표시되는 필드를 작성하시오.(t의 필드명(SEXM_YN))
t$SEXM_YN <- ifelse(t$SEX == 'M', 'Y', 'N') 
t
# 새로 생성한 필드A가 100000이상이면  우수, 아니면, 불량 으로 표시되는 필드를 작성하시오.(t의 필드명(A100000))
t$A1000000 <- ifelse(t$A >= 1000000, '우수', '불량') 
t
# AGE가 45세 이상, 40세 이상, 35세 이상, 30세 이상, 25세 미만으로 5가지로 구분하시오.(t의 필드명: A_G5)
t$A_G5 <- ifelse(t$AGE >= 45,'A1.45++',
                     ifelse(t$AGE >= 40,'A2.4044',
                            ifelse(t$AGE >= 35,'A3.3539',
                                   ifelse(t$AGE >= 30,'A4.3034',
                                          'A5.0029'))))  
t


