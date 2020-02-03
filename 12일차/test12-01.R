library(readxl)
library(dplyr)
x <- read_excel('./excel_data/finedust.xlsx')

jong <- x %>% filter(area == "종로구")
joong <- x %>% filter(area == "중랑구")

jong
joong

jong <- table(jong)

library(psych)

describe(jong$finedust)

describe(joong$finedust)

boxplot(jong$finedust, joong$finedust, names = c('종로구', '중랑구'), xlab = '구군시', ylab = '미세먼지농도', col = c('orange','red'))

t.test(jong$finedust)

t.test(joong$finedust)
