id <- c(1:10)
sex <- c('F','F','F','M','F','M','M','M','F','F')
age <- c(11,22,33,44,55,21,45,28,40,20)
area <- c('서울','부산','서울','제주','부산','대전','인천','대전','서울','서울')

member <- data.frame(id,sex,age,area)
id[3]
age[3]
member[,1]  # 1열을 불러온다
member[2,4] # 2행 4열을 불러온다
member[1,]  # 1행을 불러온다
member[4,3]
member[1,3] <- 22
member
member[5,2] <- 'M'
