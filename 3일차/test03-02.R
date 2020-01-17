id <- c(1:5)
age <- c(21:25)
sex <- c('f','m','f','m','m')
height <- c(167,178,168,176,188)
weight <- c(55,66,77,66,99)

a <- data.frame(id, height, sex, age, weight)
a

a[3,1]

aa <- data.frame(id, age, sex, height, weight)
aa

sum(aa[,2])

mean(aa[,5])

str(aa)

aa[4,5] / (aa[4,4]/100)^2

aa[5,5] <- 66
aa[5,4] <- 166
aa[5,5] / (aa[5,4]/100)^2
aa