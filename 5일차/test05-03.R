t
t %>% select(SEX)

t %>% select(ID, C, A, SEX)

t %>% select(-ID, -AGE, -A, -C)

t %>% filter(SEX == 'M')

t %>% filter(AREA != '서울', Y17_A >= 100000)
