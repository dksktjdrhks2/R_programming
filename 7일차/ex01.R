# reshape2 패키지 열, 행을 변경시키는 패키지

library(reshape2)

airquality

head(airquality)
tail(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)

x <- melt(airquality)
head(x)
tail(x)
x <- melt(airquality, id.vars = c('month', 'wind'), measure.vars = 'ozone')
x
head(x)
tail(x)
