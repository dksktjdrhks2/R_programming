# 게이지 차트 그리기
install.packages("googleVis")
install.packages('ggmap')
library(googleVis)
library(ggplot2)
library(ggmap)

gauge <- gvisGauge(CityPopularity, labelvar = "city", numvar = "Popularity", options = list(min = 0, max = 1000))
plot(gauge)

# API키 AIzaSyCVz-J_favbhiZHjofk8rrGBWdHpiQwhoQ

register_google(key = 'AIzaSyCVz-J_favbhiZHjofk8rrGBWdHpiQwhoQ')
seoul <- get_googlemap("seoul", maptype = "hybrid")
ggmap(seoul)
