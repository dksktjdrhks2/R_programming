# 03데이터 추가 및 중복 데이터 제거하기

# mutate() 함수로 열 추가하기
# 데이터 세트 t에서 mutate()함수로 y, y1열 추가하고 2000과 2020년을 상위 데이터만 출력하시오
head(mutate(t, y='2000', y1='2020'))

# 데이터 세트 t에서 disp_rank 열을 추가하고, disp 열의 순위를 구한 후 상위 데이터만 출력하시오
head(mutate(t, disp_rank = rank(disp)))

# distinct() 함수로 중복 값 제거하기
# 데이터 세트 t에서 hp열에서 중복 값 제거하시오
distinct(t, hp)		
# 데이터 세트 t에서 gear열에서 중복 값 제거하시오
distinct(t, gear)	
# 데이터 세트 t에서 hp, cyl과 gear열에서 중복 값 제거하시오
distinct(t,  hp, cyl, gear)		# cyl과 gear 열에서 중복 값 제거


