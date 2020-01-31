library(readxl)
library(treemap)
x <- read_excel('./restaurant.xlsx')
x

x <- substr(x$소재지전체주소, 12, 15)
x <- gsub(' ', '', x)
x <- table(x) %>% data.frame()
arrange(x, desc(Freq))

treemap(x, index = 'x', vSize = 'Freq', title = '동대문구 경양식 분포')
