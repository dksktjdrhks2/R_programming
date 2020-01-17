id <- c(1:5)
major <- c('컴공','경영','컴공','컴공','영문')
mid_exam <- c(55,21,75,88,70)

exam <- data.frame(id,major,mid_exam)
exam

exam[,2]
exam[3,]
exam[2,3]

sum(exam[,3])
mean(exam[,3])

exam[5,3] <- 90
exam
