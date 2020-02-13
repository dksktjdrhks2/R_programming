# 데이터 추출
install.packages('dplyr')
library(dplyr)
#필요한 데이터 추출하기
#변수를 추출하는 select()함수
# 선택한 변수 추출
x %>% select(ID)     # x데이터 세트에서 ID변수 추출 %>%(파이프 연산자:여러개의 함수를 연결하는 함수, 순서대로 실행이 되므로 순서대로 해석)
x %>% select(ID, AREA, Y17_CNT)

# 선택한 변수만 제외하고 추출
x %>% select(-AREA)     # x데이터 세트에서 AREA변수 제외하고 추출
x %>% select(-AREA, -Y17_CNT)

# 조건절을 추출하는 filter()함수
x %>% filter(AREA == '서울')     # x데이터 세트에서 AREA(지역)가 서울인 경우만 추출
x %>% filter(AREA == '서울' & Y17_CNT >= 10) # x데이터 세트에서 AREA(지역)가 서울이면서 Y17_CNT(17년 이용건수)가 10건 이상인 경우만 추출

# 데이터 정렬하기
# 오름차순 정렬하기 arrange()
x %>% arrange(AGE)  # x데이터 세트의 AGE 변수를 오름차순 정렬
# 내림차순 정렬하기 arrange()
x %>% arrange(desc(Y17_AMT))  # x데이터 세트의 Y17_AMT 변수를 내림차순 정렬
# 변수 중첩 정렬하기 arrange()
x %>% arrange(AGE, desc(Y17_AMT))  # x데이터 세트의 AGE 변수는 오름차순 정렬이고,나이 같을 경우Y17_AMT 변수는 내림차순 정렬. 

#데이터 요약하기
# 합계를 도출하는 summarise()함수 Y17_AMT의 합계를 요약해서 TOT_Y17_AMT로 보여 줌
x %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))
# 그룹별 합계를 도출하는 group_by()함수와 summarise()함수를 사용하여 
# AREA에 있는 변수 값에 따라 Y17_ATM의 총합계를 요약해서 TOT_Y17_AMT로 보여 줌
x %>% group_by(AREA) %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))

# 데이터 결합하기
# 세로 결합 bind_rows()함수

install.packages('readxl')
library(readxl)
x1 <- read_excel('./data/Sample2_m_history.xlsx')
x2 <- read_excel('./data/Sample3_f_history.xlsx')
View(x1)
View(x2)
x3 <- bind_rows(x1,x2) #카드이용자 남성(x1)과 여성(x2)을 세로로 결합
View(x3)

# 가로 결합, left_join()함수, inner_join()함수, full_join()함수
library('readxl')
x4 <- read_excel('./data/Sample4_y17_history.xlsx')
x5 <- read_excel('./data/Sample5_y16_history.xlsx')
View(x4)
View(x5)
#가로 결합
x6 <- left_join(x4, x5, by = 'ID') # 왼쪽기준으로 결합 오른쪽으로 결합 by의 ID는 기준변수명
x6
x7 <- inner_join(x4, x5, by = 'ID') # 결측값이  있는 것은 결합 안됨(NA가 없음)
x7
x8 <- full_join(x4, x5, by = 'ID') # 전부 결합 결측값은  NA로 표시
x8
x9 <- right_join(x4, x5, by = 'ID') # 오른쪽 기준으로 결합 왼쪽으로 결합
x9

