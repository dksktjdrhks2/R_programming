id <- c(1:15)
sex <- c('f', 'm', 'm', 'm', 'f', 'f', 'm', 'f', 'm', 'f', 'm', 'm', 'm', 'm', 'f')
age <- c(11,42,33,41,7,31,22,8,14,65,11,20,33,84,15)

x <- data.frame(id=id, sex=sex, age=age)

write.csv(x, './xx.csv')
x1 <- read.csv(file.choose())
x1
head(x1)
tail(x1)
str(x1)
max(x1$age)
min(x1$age)
