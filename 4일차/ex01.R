library(readxl)


x <- read_excel('D:/1월_R_YSK/data/data_ex.xls')
x

x1 <- read_excel('./data/data_ex.xls')
x1

x2 <- read_excel(file.choose())
x2
