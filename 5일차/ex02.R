#데이터 추출방법
library(dplyr)

x
x %>% select(ID)

x %>% select(ID, AREA, Y17_CNT)

x %>% select(-AREA, -ID)

#조건에 부합하는 데이터만 빼내기
x %>% filter(AREA == '서울')

x %>% filter(AREA == '서울', Y17_CNT >= 10)

x %>% filter(AREA == '서울' & Y17_CNT >= 10)
