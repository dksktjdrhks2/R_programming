#문자형 데이터 a, b, c, d, e, f, g, i, h, j는 id 변수로, 
#문자형 데이터 4반, 2 반 , 3 반 , 4 반 , 2 반 , 1 반 , 1 반 , 3 반, 4 반 , 2 반은 class로 
#숫자형 데이터 11, 22, 33, 44, 55, 66, 77, 77, 99, 100는 mid_exam, 
#숫자형 데이터 51, 42, 33, 24, 15, 36, 47, 57, 69, 70는 fin_exam으로 하여
#exam라는 이름의 데이터 프래임을 구성하시오

#데이터 프래임 만드는 법과 데이터 변경
id <- c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'h', 'j')
class <- c('4반', '2반' , '3반' , '4반' , '2반' , '1반' , '1반' , '3반', '4반' , '2반')
mid_exam <- c(11, 22, 33, 44, 55, 66, 77, 77, 99, 100)
fin_exam <- c(51, 42, 33, 24, 15, 36, 47, 57, 69, 70)
#각 객체의 데이터를 exam의 프레임으로 이름으로 생성하시오.
exam <- data.frame(id, class, mid_exam, fin_exam)
exam

#e를 생성하시오.
id[5]
#id('a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'h', 'j')들이 소속한 반의  값을 생성하시오.
exam[,2]
#c의 id, class, mid_exam, fin_exam 순으로 값을 생성하시오.
exam[3,]
#h의 중간고사 점수를 구하시오.
exam[9,3]
#b의 기말고사 점수를 구하시오.
exam[2,4]
#전체 학생의 중간고사의 합을 생성하시오.
sum(mid_exam)
sum(exam[,3])
sum(exam[3])
#전체 학생의 기말고사의 합을 생성하시오.
sum(fin_exam)
sum(exam[,4])
sum(exam[4])
exam[4]
exam[,4]
#전체 학생의 중간고사의 평균을 구하시오.
mean(mid_exam)
mean(exam[,3])
mean(exam[3]) #프래임을 불러오면서 열의 변수 문자가 삽입되면서 에러 발생 / sum의 경우는 함수 자체가 많이쓰므로 가능하면 되게 된것 같음
exam[3]
exam[,3]
#전체 학생의 기말고사의 평균을 구하시오.
mean(fin_exam)
mean(exam[,4])

#전체 학생의 중간과 기말고사의 전체 평균을 구하시오.
(mean(mid_exam)+mean(fin_exam))/2
(mean(exam[,3])+mean(exam[,4]))/2
(sum(mid_exam)+sum(fin_exam))/20
(sum(exam[,3])+sum(exam[,4]))/20
mean(c(mid_exam,fin_exam))
#a의 중간고사 값을 생성하시오.
mid_exam[1]
#a의 중간, 기말고사 평균을 생성하시오.
(mid_exam[1]+fin_exam[1])/2
mid_exam[1]
#j의 중간고사 점수를 0점으로 정정하시오.
exam[10,3] <- '0'
exam
#g의 기말고사 점수를 74점으로 정정하시오.
exam[7,4] <- '74'
exam
#j의 반을  5반으로 정정하시오.
exam[10,2] <- '5반'  #유효하지 않은 값임(1반, 2반, 3반, 4반만 됨)
exam