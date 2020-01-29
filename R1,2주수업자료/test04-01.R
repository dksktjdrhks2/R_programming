
# 엑셀파일(data_ex.xlsx)을 절대경로로  불러와서  t 변수로 저장하시오.
t <- read_excel('D:/Rsung/data/data_ex.xlsx')

# 엑셀파일(data_ex.xlsx)을 상대경로로  불러와서  t1 변수로 저장하시오.
t1 <- read_excel('./data/data_ex.xlsx')

# 엑셀파일(data_ex.xlsx)을 file.choose()로  불러와서  t2 변수로 저장하시오.
t2 <- read_excel(file.choose())
