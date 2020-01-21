t <- read_excel('./data/Sample1.xlsx')
t
dim(t)
str(t)
ls(t)
t <- rename(t, Y17_A=AMT17, Y17_C=Y17_CNT, Y16_A=AMT16, Y16_C=Y16_CNT)
t
t$A <- t$Y17_A + t$Y16_A
t$C <- t$Y17_C + t$Y16_C
t
