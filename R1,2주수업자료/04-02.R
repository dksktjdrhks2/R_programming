# read.table() 함수로 TXT 파일 가져오기 
# 탭으로 구분된 TXT 파일 가져오기 => read.table(“원시데이터”)
x <- read.table("D:/Rsung/data/data_ex.txt")                        
x                                                                    
                            

x1 <- read.table("D:/Rsung/data/data_ex.txt", header = T) # header = T 값으로 입력하여 1행이 변수명으로 입력
x1 

x1 <- read.table("D:/Rsung/data/data_ex.txt", header = T, skip = 5) # skip = 5를 사용하여  6행부터 불러오기
x1

x1 <- read.table("D:/Rsung/data/data_ex.txt", header = T, nrows = 7) # nrows = 7를 사용하여 7행까지 불러오기
x1

#쉼표로 구분된 TXT 파일 가져오기(sep = ','), 1행을 변수명으로 (header = TRUE or header = T) 
x2 <- read.table("D:/Rsung/data/data_ex1.txt", header = T, sep = ',') # ,로 구분된 데이터(data_ex1.txt)를 불러오기
X2

#변수명이 없는 파일(data_ex2.txt)에 변수명을 추가하여 가져오기
varname <- c('id', 'sex','arg', 'area') # 변수명으로 사용할 값을 varname 변수에 할당
#col.names 옵션으로 변수명(varname 변수의 데이터 값) 지정 후 data_ex2.txt파일을 y2에 저장
x3 <- read.table("D:/Rsung/data/data_ex2.txt", sep = ',') #변수명이 없음
x3
x3 <- read.table("D:/Rsung/data/data_ex2.txt", sep = ',',col.names = varname) #col.names = varname으로 변수명이 추가
x3
