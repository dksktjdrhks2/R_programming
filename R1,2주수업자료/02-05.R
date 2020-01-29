id <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
sex <- c('F','F','F','M','F','M','M','M','F','F')
age <- c(11, 22, 33, 44, 55, 21, 45, 28, 40, 20)
area <- c('서울', '부산','서울', '제주', '부산', '대전', '인천', '대전', '서울', '서울')

member <- data.frame(id, sex, age, area)
member
id[3]
member[1]
member[1,][
member[,1]
member[2]
member[2,4]
member[1,3]
member$id
member[1,1] <- 'M'
member
