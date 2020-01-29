
t <- read_excel('./data/Sample1.xlsx')
# t 데이터 Y17_CNT 변수를 전체 형태를 파악을 위해 자릿수에 따라 분류하여 시각화하시오.
stem(t$Y17_CNT)   
# t 데이터 Y17_CNT 변수를 도수 분포 상태를 기둥 모양으로 연속적으로 시각화하시오.
hist(t$Y17_CNT) #데이터가 연속적인 형태
# t 데이터 Y16_CNT 변수를 세로축범위(0~100) ylim = 가로축의 범위(0~10), main(17_CNT분포)로 시각화하시오.
hist(t$Y16_CNT, xlim = c(0, 100), ylim = c(0,3), main ='17_CNT분포') 

# t 데이터 SEX 변수를 수량 정도를 막대 그래프 형태로 시각화하시오. 
freq(t$SEX, plot = T, main = 'SEX분포')

# parplot()함수 사용
t1 <- table(x$SEX)

# t1 데이터 SEX 변수에서 가로값의 범위(0~10),제목(BAR), 가로레이블(성별), 세로레이블(빈도수), 여성과 남성의 데이터 이름(여성, 남성)과 칼라(red, blue)의 추가하여 시각화하시오. 
barplot(t1, ylim = c(0, 10), main = 'BAR', xlab='SEX', ylab='성별', names =c('여성', '남성'), col = c('red', 'blue')) # 칼라 추가

t2 <- read_excel('./data/Sample1.xlsx')

# t1 데이터 AMT17, AMT16 변수에서 외곽이 박스로 분포 및 이상치를 확인하는 상자그림으로 시각화하시오.
boxplot(t2$AMT17, t2$AMT16) 



