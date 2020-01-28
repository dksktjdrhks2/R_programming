word_data <- readLines('./song.txt')
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

add_words <- c('백두산', '남산', '철갑', '가을', '하늘', '달')
buildDictionary(user_dic = data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic = T)
# 내가 지정한 단어를 사전에 추가한다.

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

undata <- unlist(word_data2)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x){nchar(x) >= 2}, undata) # 2글자이상인 단어만 판별해서 변수안에 넣기
undata2

word_table2 <- table(undata2)
word_table2

sort(word_table2, decreasing = T)
