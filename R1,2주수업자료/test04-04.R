# 아래의 데이터 셋을 이용하여 물음에 답하시오.
id <- c(1, 2, 3, 4, 5, 6, 7, 8) 
area <- c('서울', '제주', '부산', '대전', '인천', '대전', '서울', '서울') 
sex <- c('f', 'm', 'f', 'm', 'f', 'm', 'f', 'f') 

t <- data.frame(id=id, area = area, sex = sex)
                                              
# 데이터 세트 t를 RDA 파일로 저장(파일명 t.rda)하고 불러오세요.
save(t, file = 'D:/Rsung/t.rda')      
# .rda 파일 불러오기
load('D:/Rsung/t.rda')                
# 데이터 세트 t를 csv 파일로 저장(파일명 t.csv) 하시오.
write.csv(x, file = 'D:/Rsung/t.csv')  
# t.csv 파일을 t1 데이터 세트로 저장하고 불러오세요.
t1 <- read.csv('D:/Rsung/x.csv')    
t1
# 데이터 세트 t를 txt 파일로 저장(파일명 t.txt)하고 하시오.
write.table(t, file = 'D:/Rsung/t.txt') 
# t.txt 파일을 t2 이름으로 저장하고 불러오세요.
t2 <- read.table('D:/Rsung/t.txt')    
t2

#file.choose() 사용하여 t.txt 파일을 불러오세요.
t3 <- read.table(file.choose()) 
t3
