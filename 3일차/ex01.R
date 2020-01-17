x <- c(1:6)
matrix(x, nrow = 2, ncol = 3)
matrix(x, nrow = 3, ncol = 2)
matrix(x, nrow = 3, ncol = 2, byrow = T)
matrix(x, nrow = 3, ncol = 4)
str(x)
length(x)
y <- c(1:8)
array(y, dim = c(3,2,4))

z <- list(c(1,2,3), '1', 'a')
z
z[1]
