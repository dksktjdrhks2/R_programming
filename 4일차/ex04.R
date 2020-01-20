id <- c(1:5)
sex <- c('f', 'm', 'f', 'm', 'f')
age <- c(11,22,33,44,55)

x <- data.frame(id=id, sex=sex, age=age)
x

y
save(x, file = './x.rda')
load('./x.rda')
rm(x)

write.csv(x, file = './x.csv')
x <- read.csv('./x.csv')
x

write.table(x, './x.txt')
read.table('./x.txt')

x1 <- read.table(file.choose())
x1
