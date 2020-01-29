#엑셀파일 불러오기
install.packages('readxl')                        #readxl 패키지 설치
library(readxl)                                     #readxl 패키지 로드

.libPaths("D:/R/library")                         # 경로 중간에 한글 이름이 있을 경우 경로 변경, 제어판에서 한글계정 이름 변경

# 엑셀파일(data_ex.xls)을 read_excel로 불러오기
x <- read_excel('D:/Rsung/data/data_ex.xls') # 절대경로
x
View(x)

x1 <- read_excel('./data/data_ex.xls') # 상대경로
x1

x2 <- read_excel(file.choose())
x2
                 