data <- read.csv('./excel_data/노원구.csv')
data1 <- read.csv('./excel_data/4호선.csv')
head(data1)

data <- data %>% filter(data$전용면적 > 115)
data
datas <- data %>% data.frame()


center_code <- data1 %>% filter(data1$당고개 == '노원')
center_code$구주소

center_code2 <- enc2utf8(as.character(center_code$서울특별시.노원구.상계4동.111)) %>% geocode()
geo_data <- as.numeric(center_code2)

geo_code <- enc2utf8(paste(data$시군구,data$번지)) %>% geocode()
geo_code

df_geo <- geo_code %>% data.frame()
df_geo

datas <- rename(datas, "lon" = "df_geo$lon")
datas <- cbind(datas, df_geo$lat)

View(datas)

money <- paste0("노원구 115평이상 아파트 평균 거래가 : ",mean(as.numeric(gsub(',', '',datas$거래금액))), "(만)")

get_googlemap(center = geo_data, maptype = "roadmap", zoom = 12) %>% ggmap() +
  geom_point(data = datas, aes(x = lon, y = lat), size = 2, color="red") +
  geom_text(data = datas, aes(label = 거래금액), vjust = -1, size = 3) +
  annotate('text', x = 127.075, y = 37.615, label = money, size = 5, color = "darkblue", fontface = "bold")
