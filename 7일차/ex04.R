# 데이터 추가 중복 제거
mutate(x, years = '1974')

mutate(x, mpg_rank = rank(mpg))

distinct(x, cyl)

distinct(x, gear)

distinct(x, cyl, gear)
