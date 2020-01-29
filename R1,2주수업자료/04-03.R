#read.table() 함수로 csv 파일 가져오기
x <- read.table("D:/Rsung/data/data_ex.csv")   # csv 파일 가져오기
x                                

x <- read.table("D:/Rsung/data/data_ex.csv", header = T)  # 변수명 삽입후 csv 파일 가져오기
x 

x1 <- read_excel("D:/R/data/data_ex.xlsx") # 엑셀파일 가져오기
x1
