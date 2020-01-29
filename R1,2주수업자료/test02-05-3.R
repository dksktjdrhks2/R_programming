#1~5(1씩 증가) id변수로, 
#21~25(1씩 증가) age로 
#f, m, f, m, m sex로 
#167, 178, 168, 176, 188 height로

#데이터 프래임 만드는 법과 데이터 변경
id <- c(1:5)
age <- c(21:25)
sex <- c('f', 'm', 'f', 'm', 'm')
hegight <- c(167, 178, 168, 168, 188) # cm
weight <- c(55, 66, 77, 66, 99)
#a라는 이름의 데이터 프래임으로 id, 키, 성별, 나이, 몸무게 순으로구성하시오
a <- data.frame(id, hegight, sex, age, weight)
a

#id 3을 생성하시오.
id[3]
#2의 id, age, sex, hegight, weight 순으로 값을 생성하시오.
# 새롭운 데이터프래임은 aa로 하시오.
aa <- data.frame(id, age, sex, hegight, weight )
aa
aa[2,]
#전체의 나이의 합을구하시오.
sum(age)
sum(aa[,2])
#전체의 평균나이를 구하시오.
mean(age)
mean(aa[,2])
#3의 키를 구하시오.
aa[3,4]
aa[4,4]
#전체 키의 합을 구하시오.
sum(hegight)
sum(aa[,4])
sum(aa[4])
#전체 몸무게의 평균을 구하시오.
mean(weight)
mean(aa[,5])
mean(aa[5])

# aa의 데이터의 속성을 생성하시오.
str(aa)

# 4의 체지방률을 구하시오.(weight(kg) / (height(m)^2))  (제곱 : ^ 또는 **)
aa[4,4]
aa[4,5]
x <- aa[4,5]/((aa[4,4]/100)^2)
x
66/(1.68^2)

#5에 자신의 실제값으로 입력후 체지방을 구하시오.
aa[5,4] <- 66   # 숫자값으로 입력해야함 ''을 사용하면 에러
aa[5,5] <- 168
aa
(aa[5,4]/100)
x <- aa[5,4]/((aa[5,5]/100)^2)
x
