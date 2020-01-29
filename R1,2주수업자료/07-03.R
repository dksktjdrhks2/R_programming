# 03데이터 추가 및 중복 데이터 제거하기

# mutate() 함수로 열 추가하기
  # mutate(데이터세트, 추가할 열 이름 + 조건1,)
head(mutate(x, years = "1974"))		# mtcars에 years 열을 추가하고 데이터 값에 1974를 입력

# mtcars에 mpg_rank 열을 추가하고, rank() 함수로 mpg 열의 순위를 구한 후 할당
head(mutate(x, mpg_rank = rank(mpg)))

# distinct() 함수로 중복 값 제거하기

distinct(x, cyl)		# cyl 열에서 중복 값 제거
distinct(x, gear)		# gear 열에서 중복 값 제거
distinct(x, cyl, gear)		# cyl과 gear 열에서 중복 값 제거(동시 중복제거)


