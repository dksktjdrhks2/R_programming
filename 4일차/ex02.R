x <- read.table("./data/data_ex.txt")
x

x1 <- read.table("./data/data_ex.txt", header = T)
x1

x2 <- read.table("./data/data_ex.txt", header = T, skip = 4)
x2

x2_n <- read.table("./data/data_ex.txt", header = T, nrows = 5)
x2_n

x3 <- read.table("./data/data_ex1.txt", header = T, sep = ',', skip = 4)
x3

varname <- c('id', 'sex', 'age', 'area')
x4 <- read.table("./data/data_ex2.txt", sep = ',', col.names = varname)
x4
