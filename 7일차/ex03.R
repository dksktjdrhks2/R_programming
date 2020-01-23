# dplyr 패키지
x <- mtcars
nrow(x)
str(x)

library(dplyr)

filter(x, cyl == 4)

filter(x, cyl >= 6, mpg >= 20)

head(arrange(x, wt))
head(arrange(x, mpg, desc(wt)))