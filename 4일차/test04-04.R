id <- c(1:15)
sex <- c('f', 'm', 'm', 'm', 'f', 'f', 'm', 'f', 'm', 'f', 'm', 'm', 'm', 'm', 'f')
age <- c(11,42,33,41,7,31,22,8,14,65,11,20,33,84,15)

t <- data.frame(id, sex, age)

write.csv(t, './tt.csv')

t1 <- read.csv(file.choose())
t1

max(t$age)
mean(t$age)