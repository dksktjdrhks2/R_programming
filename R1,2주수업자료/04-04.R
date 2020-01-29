# R 데이터 저장하고 불러오기

id <- c(1, 2, 3, 4, 5)                                
sex <- c('f', 'm', 'f', 'm', 'f')                      
age <- c(11, 22, 33, 44, 55)                      

x <- data.frame(id=id, sex=sex, age=age)  # id, sex, age로 데이터 프레임 생성 (id=id, sex=sex, age=age) 
x
View(x)                                                 

#RDA 파일로 저장하고 불러오기
# *.rda 파일로 저장하기 +=> save() 함수 사용
save(x, file = 'D:/Rsung/x.rda')      # save(데이터 세트, file = “파일명”) /전체 경로 작성 후 저장
# .rda 파일 불러오기
load('D:/Rsung/x.rda')                # load() 함수 사용: load(“경로/파일명”)
x
# *.csv 파일로 저장하기
write.csv(x, file = 'D:/Rsung/x.csv') # write.csv() 함수 사용; save(데이터 세트, file = “파일명”) 
# .csv 파일 불러오기
x1 <- read.table('D:/Rsung/x.csv')    # read.table 함수 사용: load(“경로/파일명”)
x1
x11 <- read.csv('D:/Rsung/x.csv')    # read.csv 함수 사용: load(“경로/파일명”)
x11
# *.txt 파일로 저장하기
write.table(x, file = 'D:/Rsung/x.txt') # write.csv() 함수 사용; save(데이터 세트, file = “파일명”) 
x
# .txt 파일 불러오기
x2 <- read.table('D:/Rsung/x.txt')    # read.table 함수 사용: load(“경로/파일명”)
x2
# .rda 파일 불러오기
load('D:/Rsung/x.rda')                # load() 함수 사용: load(“경로/파일명”)
x

#파일을 직접 경로를 통해서 불러오기 (x.txt)
x3 <- read.table(file.choose()) # read.table() 함수 안에 file.choose() 사용하여 직접 파일 클릭(rda파일은 안됨)