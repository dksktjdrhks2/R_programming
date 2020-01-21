#데이터 정렬
x
x %>% arrange(AGE)
x %>% arrange(desc(Y17_AMT))

x %>% arrange(AGE, desc(Y17_AMT))

#데이터 요약
x %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))

#그룹별 합계
x %>% group_by(AREA) %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))

#데이터 결합 (세로)
#행 record / 열 field
library(readxl)
x1 <- read_excel('./data/Sample2_m_history.xlsx')
x1
x2 <- read_excel('./data/Sample3_f_history.xlsx')
x2
x3 <- bind_rows(x1, x2)
x3

#데이터 결합 (가로)
x4 <- read_excel('./data/Sample4_y17_history.xlsx')
x4
x5 <- read_excel('./data/Sample5_y16_history.xlsx')
x5
x6 <- left_join(x4, x5, by = 'ID')
x6
x7 <- inner_join(x4, x5, by = 'ID')
x7
x8 <- full_join(x4, x5, by = 'ID')
x8
