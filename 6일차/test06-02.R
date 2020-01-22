t <- read_excel('./data/Sample1.xlsx')
t

stem(t$Y17_CNT)

hist(t$Y17_CNT)

freq(t$Y16_CNT, xlim = c(0,100), ylim = c(0,10), main = '16_CNT 분포')

sex <- table(t$SEX)

barplot(sex)

barplot(sex, ylim = c(0,10), main = 'BAR', xlab = '성별', ylab = '빈도수', names = c('여성','남성'),col = c('red', 'blue'))

t2 <- read_excel('./data/Sample1.xlsx')
t2

boxplot(t2$AMT17, t2$AMT16)
