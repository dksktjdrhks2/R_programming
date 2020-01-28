corona <- readLines('./corona_tr.txt')
corona

corona_data <- sapply(corona, extractNoun, USE.NAMES = F)
corona_data

coda <- unlist(corona_data)
coda

co_table <- table(coda)
co_table

coda2 <- Filter(function(x){nchar(x) >= 2}, coda) # 2글자이상인 단어만 판별해서 변수안에 넣기
coda2

co_table2 <- table(coda2)
co_table2

sort(co_table2, decreasing = T)

wordcloud2(co_table2, color = 'random-light', backgroundColor = 'black', fontFamily = '맑은 고딕', size = 0.5,
           shape = 'triangle-forward')
