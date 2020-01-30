x$AGE_GR5 <- ifelse(x$AGE>=50, "A1.50++", 
                    ifelse(x$AGE>=40, "A2.4049",
                           ifelse(x$AGE>=30, "A3.3039",
                                  ifelse(x$AGE>=20, "A4.2029", "A5.0019"))))
food$영업상태 <- ifelse(food$영업상태명 == '영업/정상', food$소재지전체주소, NULL)

addr <- substr(chicken$소재지전체주소, 12, 14)
addr1 <- gsub('[0~9]', '', addr)
addr1 <- gsub(' ', '', addr)
addr1 <- table(addr1) %>% data.frame()
addr1

treemap(addr1, index = 'addr1', vSize = 'Freq', title = '치킨집 분포')