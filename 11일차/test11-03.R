x <- read_excel('./excel_data/finedust.xlsx')
x

dd_anal <- x %>% filter(area %in% c('성북구','중구'))
data.frame(dd_anal)
str(dd_anal)

count(dd_anal, yyyymmdd)

count(dd_anal, area)

ju <- x %>% filter(area == '중구')
su <- x %>% filter(area == '성북구')

ju <- data.frame(ju)
su <- data.frame(su)

ju
su

install.packages('psych')
library(psych)

describe(su$finedust)

describe(ju$finedust)

boxplot(su$finedust, ju$finedust, names = c('성북구', '중구'), xlab = '구군시', ylab = '미세먼지농도', col = c('orange','red'))

t.test(ju$finedust)

t.test(su$finedust)
