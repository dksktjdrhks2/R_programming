id <- c('a','b','c','d','e','f','g','h','i','j')
class <- c('4반','2반','3반','4반','2반','1반','1반','3반','4반','2반')
mid_exam <- c(11,22,33,44,55,66,77,77,99,100)
fin_exam <- c(51,42,33,24,15,36,47,57,69,70)

exam <- data.frame(id,class,mid_exam,fin_exam)
exam

# e 생성
id[5]

# id들이 소속한 반의 값
exam[,2]

# c의 값
exam[3,]

# h의 중간고사 점수
exam[8,3]

# b의 기말고사 점수
exam[2,4]

# 전체 중간고사 점수의 합
mid <- sum(exam[,3])
mid

# 전체 기말고사 점수의 합
fin <- sum(exam[,4])
fin

# 전체 중간고사 평균
mean(exam[,3])

# 전체 기말고사 평균
mean(exam[,4])

# a의 중간고사 점수
exam[1,3]

# 전체학생의 기말+중간 점수의 평균
mid_len <- length(exam[,3])
fin_len <- length(exam[,4])
(mid+fin) / (mid_len+fin_len)
## 방법2 ##
(mean(exam[,3])+mean(exam[,4])) / 2
## 방법3 ##
mean(c(mean(exam[,3]),mean(exam[,4])))

# a의 중간고사 값
exam[1,3]

# a의 중간, 기말고사 평균
mean(c(exam[1,3],exam[1,4]))

# j의 중간고사 점수를 0으로 변경
exam[10,3] <- 0

# g의 기말고사 점수를 74로 변경
exam[7,4] <- 74

exam
