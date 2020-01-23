group_by(t, hp) %>% summarise(n())

t2 <- mutate(t, tt = rank(mpg))

arrange(t2, tt)

mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)