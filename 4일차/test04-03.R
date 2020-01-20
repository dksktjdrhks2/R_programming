id <- c(1:8)
area <- c('서울', '제주', '부산', '대전', '인천', '대전', '서울', '서울')
sex <- c('f', 'm', 'f', 'm', 'f', 'm', 'f', 'f')

t <- data.frame(id, area, sex)

save(t, file = './t.rda')
load('./t.rda')

write.csv(t, './t.csv')
t1 <- read.csv('./t.csv')
t1

write.table(t, './t.txt')
t2 <- read.table('./t.txt')
t2

t3 <- read.table(file.choose())
t3