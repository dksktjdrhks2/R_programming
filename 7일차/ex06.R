# %>% 함수를 연결하는 연결 연산자 (파이프)
group_by(x, cyl) %>% summarise(n()) # summarise(group_by(x, cyl), n())

x1 <- mutate(x, xx = rank(mpg))
x1

arrange(x1, xx)

mutate(x, xx = rank(mpg)) %>% arrange(xx) # arrange(mutate(x, xx = rank(mpg)), xx)
