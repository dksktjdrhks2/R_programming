x <- c(1:8)
y <- c(8:1)
z <- c(1,3,5)

x+y
x*y

sum(x) + sum(y)
sum(x) * sum(y)
x*z

##################

str(x)

length(x)

matrix(x, nrow = 2, ncol = 4)

matrix(x, nrow = 4, ncol = 2)

matrix(x, nrow = 4, ncol = 2, byrow = T)

array(x, dim = c(2,2,3))

ls <- list(c(1:6), c('a','b','c'), '1')
ls
