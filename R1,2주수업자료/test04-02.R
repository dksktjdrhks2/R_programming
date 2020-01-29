# TXT 파일(data_ex.txt)을 불러와서  t 변수로 저장하시오
t <- read.table("D:/Rsung/data/data_ex.txt")                        

# TXT 파일(data_ex.txt)을 불러와서  t1 변수로 저장하고 1행은 변수명으로 하고 4행 부터 불러오세요.
t1 <- read.table("D:/Rsung/data/data_ex.txt", header = T, skip = 3) 

# TXT 파일(data_ex1.txt)을 불러와서  t2 변수로 저장후 쉼표로 구분하고, 변수명을 추가(ID, SEX, AGE, AREA)하여  6행까지 불러오세요.
varname <- c('ID', 'SEX', 'AGE', 'AREA')
t2 <- read.table("D:/Rsung/data/data_ex1.txt", header = T, sep = ',', nrows = 6, col.names = varname) 

