# 서대문구 동별 치킨집 숫자 파악하여 시각화하기
chicken
library(dplyr)

xx <- c('가', '나', '다', '라', '가', '나', '다', '라', '다', '라', '가', '나', '다', '라')
xxx <- xx %>% table() %>% data.frame()# 데이터의 빈도수 확인하기
xxx

install.packages('treemap')
library(treemap)

treemap(xxx, index = '.', vSize = 'Freq', title = '가나다라 분포')

arrange(xxx, desc(Freq)) %>% head()

library(readxl)

read_excel()
str(chicken)

addr <- substr(chicken$소재지전체주소, 12, 14)
addr1 <- gsub('[0~9]', '', addr)
addr1 <- gsub(' ', '', addr)
addr1 <- table(addr1) %>% data.frame()
addr1

treemap(addr1, index = 'addr1', vSize = 'Freq', title = '치킨집 분포')
