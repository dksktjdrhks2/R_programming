##dplyr 패키지
# 01dplyr 패키지

# 내장 데이터 세트 mtcars를 t로 저장하시오.
t <- mtcars   
# t의 행의 갯수와 데이터 속성을 확인하시오.
nrow(mtcars) # 행의 갯수
str(mtcars)  # 데이터 속성

library(dplyr)

# 02 데이터 t에서 cyl 값이 cyl 값이 8인 행만 추출하시오.
filter(t, cyl == 8) 

# 02 데이터 t에서 cyl 값이 cyl 값이 8이고 wt 2.0이상 행만 추출하시오.
filter(t, cyl >= 8 & wt >=2.0)

#arrange() 함수로 정렬하기
# arrange(데이터 세트, 열1,열2, ...)
# 데이터 세트 t에서 hp를 기준으로 오름차순 정렬한 후 head() 함수로 상위 데이터만 출력하시오
head(arrange(t, hp)) 
# 데이터 세트 t에서 disp는 오름차순 정렬한 후 hp는 내림차순 후에 함수로 상위 데이터만 출력하시오.
head(arrange(t, disp, desc(hp))) 
# 데이터 세트 t에서 mpg, carb 열 데이터만 출력하시오
head(select(t, mpg, carb))  



