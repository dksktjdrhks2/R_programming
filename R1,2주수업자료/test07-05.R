# t에서 hp별  그룹으로 묶고 개수(n())로 요약하시오
group_by(t, hp)  %>% summarise(n())

# t에서 mpg로 순위를 구하여 mpg_rank 열에 추가하고 t1로 반환하시오.
t1 <- mutate(t, tt = rank(mpg))

# mp_rank에서 tt를 기준으로 정렬하시오.
arrange(mp_rank, tt)

#mtcars에서 mpg로 순위를 구하고 mpg_rank 열에 추가한 후 mpg_rank 열로 정렬
mutate(t, tt = rank(mpg)) %>% arrange(tt)
