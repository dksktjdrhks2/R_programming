data <- read.csv('./excel_data/아파트(매매)__실거래가.csv')
data1 <- read_excel('./excel_data/역별_주소_및_전화번호.xlsx')


data <- data %>% filter(data$전용면적 > 85)
datas <- data %>% data.frame()

center_code <- data1 %>% filter(data1$역명 == '홍대입구')
center_code$구주소

center_code2 <- enc2utf8(as.character(center_code$구주소)) %>% geocode()
geo_data <- as.numeric(center_code2)

geo_code <- enc2utf8(paste(data$시군구,data$번지)) %>% geocode()
tb_code <- table(geo_code)
tb_code

str(df_geo)
str()

df_geo <- geo_code %>% data.frame()

datas <- rename(datas, "lat" = "geo_code$lat")
datas

View(datas)

length(geo_code$lon)
length(datas$시군구)

money <- paste0("마포구 85평이상 아파트 평균 거래가 : ",mean(as.numeric(gsub(',', '',datas$거래금액))), "(만)")

get_googlemap(center = geo_data, maptype = "roadmap", zoom = 13) %>% ggmap() +
  geom_point(data = datas, aes(x = lon, y = lat), size = 2, color='red') +
  geom_text(data = datas, aes(label = 거래금액), vjust = -1, size = 3) +
  annotate('text', x = 127.075, y = 37.615, label = money, size = 5, color = "darkblue", fontface = "bold")
