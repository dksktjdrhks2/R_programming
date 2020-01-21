t %>% arrange(C)

t %>% arrange(desc(Y17_A))

t %>% arrange(AGE, Y17_A) %>% select(AGE, Y17_A)

t %>% summarise(TOT_A = sum(A))

t %>% group_by(AREA) %>% summarise(TOT_A = sum(A))

t1 <- read_excel('./data/Sample2_m_history.xlsx')
t1
t2 <- read_excel('./data/Sample3_f_history.xlsx')
t2

t3 <- bind_rows(x1, x2)

t3 %>% select(ID, AMT17, Y17_CNT)


#데이터 결합 (가로)
t4 <- read_excel('./data/Sample4_y17_history.xlsx')
t4
t5 <- read_excel('./data/Sample5_y16_history.xlsx')
t5

right_join(t4, t5, by = 'ID') %>% filter(SEX == 'M')

inner_join(t4, t5, by = 'ID') %>% select(ID, AGE, AMT16, Y16_CNT)

full_join(t4, t5, by = 'ID')
