# 데이터 추출
install.packages('dplyr')
library(dplyr)
#필요한 데이터 추출하기
#변수를 추출하는 select()함수
# 선택한 변수 추출
t
# t데이터 세트에서 SEX변수 추출하시오.
t %>% select(SEX) 
# x데이터 세트에서 ID변수 추출 %>%(파이프 연산자:여러개의 함수를 연결하는 함수, 순서대로 실행이 되므로 순서대로 해석)
# t데이터 세트에서 ID, C, A, 성별 순으로 필드를 추출하시오.
t %>% select(ID, C, A, SEX)

# t데이터 세트에서 ID, ARG, A, C를 제외하고 추출하시오.
t %>% select(-ID, -AGE, -A, -C)

# t데이터 세트에서 남자만 추출하시오.
t %>% filter(SEX == 'M')    
# t데이터 세트에서 지역이 서울이 아니면서 Y17_A가 100000 이상인 경우만 추출하시오.
t %>% filter(AREA != '서울' & Y17_A >= 100000) # !=(같지 않다)
# t데이터 세트의 C 변수를 오름차순 정렬하시오.
t %>% arrange(C)  # x데이터 세트의 AGE 변수를 오름차순 정렬하시오.
# 내림차순 정렬하기 arrange()
# t데이터 세트의 Y17_A 변수를 내림차순 정렬하시오.
t %>% arrange(desc(Y17_A))  
# 변수 중첩 정렬하기 arrange()
# t데이터 세트의 AGE 변수는 오름차순 정렬로하고 나이가 같을 경우Y17_A 변수는 오름차순 정렬후에  AGE와 Y17_A 만 추출하시오.
t %>% arrange(AGE,Y17_A) %>% select(AGE,Y17_A) 

# t데이터 세트의 A의 합계를 요약해서 TOT_A로 보여 주시오.
t %>% summarise(TOT_A = sum(A))
# t 데이터 세트의 AREA에 있는 변수 값에 따라 그룹화하여 A의 총합계를 TOT_A로 보여 주시오.
t %>% group_by(AREA) %>% summarise(TOT_A = sum(A))

# 다음 데이터를 불러오세요
library(readxl)
t1 <- read_excel('./data/Sample2_m_history.xlsx')
t1
t2 <- read_excel('./data/Sample3_f_history.xlsx')
t2

#  t1의 데이터에  t2의 데이터를 아래에 붙인  t3에 ID, AMT17, Y17_CNT순으로 추출하시오
t3 <- bind_rows(t1,t2) %>% select(ID, AMT17, Y17_CNT)
t3
# 다음 데이터를 불러오세요
t4 <-read_excel('./data/Sample4_y17_history.xlsx')
t4
t5 <- read_excel('./data/Sample5_y16_history.xlsx')
t5

# ID를 기준 변수명으로 t4의 데이터에  t5의 데이터를 오른쪽으로 결합하고 남성 데이터 만 추출하시오.
#가로 결합
t6 <- left_join(t4, t5, by = 'ID') %>% filter(SEX == 'M') 
t6
# ID를 기준 변수명으로 t4와  t5를 결합하고 ID,AGE,AMT16 Y16_CNT 순으로 결측값이 없는 데이터만 추출하시오.
t7 <- inner_join(t4, t5, by = 'ID') %>% select(ID,AGE,AMT16,Y16_CNT)
t7
# ID를 기준 변수명으로 t4와  t5를 결합하고 모든 데이터를 추출하시오.arrange(desc(Y17_A))
t8 <- full_join(t4, t5, by = 'ID') %>% arrange(desc(AGE)) # 전부 결합 결측값은  NA로 표시
t8

