install.packages('wordcloud2')
library(wordcloud2)

wordcloud2(word_table2, color = 'random-light', backgroundColor = 'black', fontFamily = '맑은 고딕', size = 0.5,
           shape = 'star')
