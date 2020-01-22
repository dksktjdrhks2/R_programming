x <- read_excel('./data/Sample1.xlsx')
x
str(x)
stem(x$AGE)
hist(x$AGE) # histogram 은 숫자형만 표현가능하다
freq(x$SEX) # 막대그래프는 문자형도 표현가능하다

hist(x$AGE, xlim = c(0,60), ylim = c(0,5), main = 'AGE 분포')

freq(x$SEX, main = '성별')

x1 <- table(x$SEX) # barplot함수는 숫자값만 받기때문에 table 함수로 문자 -> 숫자 로 변경해준다.
x1

barplot(x1, ylim = c(0,8), xlab = '성별', ylab = '빈도수(명)', names = c('여성','남성'), col = c('red','blue'))
            #y축 최댓값   #x축 레이블     #y축레이블          #그래프 각각의 이름설정   #그래프 색상설정

#상자 그림
boxplot(x$Y17_CNT, x$Y16_CNT, names = c('Y17', 'Y16'))

x3 <- c(1,2,3,4,5,6,7,25,27)
boxplot(x3) # 。로 표시되는값을 이상치(이상한값)라고한다
