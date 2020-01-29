# 05함수와 함수를 연결하는 %>% 연산자

# mtcars에서 cyl별  그룹으로 묶고 개수(n())로 요약
group_by(x, cyl) %>% summarise(n())

# mtcars에서 mpg로 순위를 구하여 xx 열에 추가하고 x1로 반환
x1 <- mutate(x, xx = rank(mpg))

# mp_rank에서 xx를 기준으로 정렬
arrange(x1, xx)

#mtcars에서 mpg로 순위를 구하고 mpg_rank 열에 추가한 후 mpg_rank 열로 정렬
mutate(x, xx = rank(mpg)) %>% arrange(xx)

