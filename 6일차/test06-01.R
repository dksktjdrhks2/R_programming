t1 <- c(1,2,3,4,5,99,100)

mean(t1)

median(t1)

t2 <- c(1,2,3,4,5,100)

median(t2)

max(t2)

min(t2)

range(t2)

quantile(t2)

quantile(t2, probs = 0.25)

quantile(t2, probs = 0.5) == median(t2)

var(t2)

sd(t2)

kurtosis(t2)

skewness(t2)

tt1 <- read_excel('./data/Sample1.xlsx')
tt1

freq(tt1$AREA)
