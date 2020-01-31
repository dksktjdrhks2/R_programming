# 종로구 한식당 동별 트리맵
xx <- read_excel('./kor_food.xlsx')
xx

xx <- substr(xx$소재지전체주소, 11, 14)
xx <- gsub(' ', '', xx)
xx2 <- gsub('0~9', '', xx)
xx2

# 종로구 한식당 남성 여성 종사자 수