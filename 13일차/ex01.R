register_google(key = 'AIzaSyCVz-J_favbhiZHjofk8rrGBWdHpiQwhoQ')
seoul <- get_googlemap("seoul", maptype = "roadmap")
ggmap(seoul)

geo_code <- enc2utf8('서울역') %>% geocode()
geo_data <- as.numeric(geo_code)
geo_data
get_googlemap(center = geo_data, maptype = "roadmap", zoom = 12) %>% ggmap() +
  geom_point(data = geo_code, aes(x=geo_code$lon, y=geo_code$lat), size = 2)
