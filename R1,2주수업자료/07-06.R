# 05함수와 함수를 연결하는 %>% 연산자

# mtcars에서 cyl별  그룹으로 묶고 개수(n())로 요약
group_by(x, cyl) %>% summarise(n())

# mtcars에서 mpg로 순위를 구하여 mpg_rank 열에 추가하고 mp_rank로 반환
mp_rank <- mutate(x, mpg_rank = rank(mpg))

# mp_rank에서 mpg_rank를 기준으로 정렬
arrange(mp_rank, mpg_rank)

#mtcars에서 mpg로 순위를 구하고 mpg_rank 열에 추가한 후 mpg_rank 열로 정렬
mutate(x, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)
