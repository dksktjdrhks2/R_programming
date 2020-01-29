# 데이터의 이해도를 높이는 그래프
# 전체 형태를 파악하는 줄기 잎 그림
library(readxl)
x <- read_excel('./data/Sample1.xlsx')
x
# stem함수(전체 형태를 파악)
stem(x$AGE) # x$AGE => x의 AGE # stem함수는 AGE변수의 값이 자릿수에 따라 분류하여 시각화 방법(큰자리 줄기, 작은자리 잎) 히스토그램은 데이터의 분포에 따라 원래 특성을 상실하나 원데이터를 유지한 채로 자료 분석 가능 
# 히스토그램(도수 분포 상태를 기둥 모양으로 표현)
hist(x$AGE) #데이터가 연속적인 형태
hist(x$AGE, xlim = c(0, 60), ylim = c(0,5), main ='AGE분포') # xlim = 세로축범위 ylim = 가로축의 범위, main =제목

# 막대그래프(수량이 많고 적음을 확인)
freq(x$SEX, plot = T, main = '성별(barplot)')

# parplot()함수 사용
x1 <- table(x$SEX)
x1
barplot(x1)
# x1축을 0~8로 변경
barplot(x1, ylim = c(0, 8))

# x1축을 0~6로 변경
barplot(x1, ylim = c(0, 6))

# x1축을 0~8로 변경 및 그래프 제목이 BARPLOT, x축 제목 SEX, y축 제목 FREQUENCY, 막대 이름 Female', 'Male
barplot(x1, ylim = c(0, 6), main = 'BARPLOT', xlab='SEX', ylab='FREQUENCY', names =c('Female', 'Male'))

# x1축을 0~8로 변경 칼라 추가
barplot(x1, ylim = c(0, 8), main = 'BARPLOT', xlab='SEX', ylab='FREQUENCY', names =c('Female', 'Male'), col = c('pink', 'navy'))

# 상자그림
#분포 및 이상치(사분위)를 확인하는 상자 그림
library(readxl)
x2 <- read_excel('./data/Sample1.xlsx')
x2

boxplot(x2$Y17_CNT, x$Y16_CNT) #변수의 상자 그림 그리기

# 상자그림
x3 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 25) # 극단치 값(20, 25)은 동그라미로 표시
boxplot(x3)

