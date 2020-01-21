library(readxl)

x <- read_excel("./data/Sample1.xlsx")
x
str(x)
dim(x)
ls(x)
install.packages('dplyr')
library(dplyr)
x
x <- rename(x, Y17_AMT=AMT17, Y16_AMT=AMT16)
x
#파생변수 생성하기
x$AMT <- x$Y17_AMT + x$Y16_AMT
x$CNT <- x$Y17_CNT + x$Y16_CNT
x

x$AGE50_YN <- ifelse(x$AGE >= 50, 'Y', 'N')

x$AGE_GR5 <- ifelse(x$AGE>=50, "A1.50++", 
                    ifelse(x$AGE>=40, "A2.4049",
                           ifelse(x$AGE>=30, "A3.3039",
                                  ifelse(x$AGE>=20, "A4.2029", "A5.0019"))))
x