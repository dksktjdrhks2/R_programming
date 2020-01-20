t <- read.table("./data/data_ex.txt")
t

t1 <- read.table("./data/data_ex.txt", header = T, skip = 4)
View(t1)

varname <- c('id', 'sex', 'age', 'area')
t2 <- read.table("./data/data_ex2.txt", col.names = varname, sep = ',', nrows = 6)
t2

