tt <- mtcars
head(tt)

ggplot(tt, aes(x = hp)) +
  geom_bar(size = 2.5)

ggplot(tt, aes(x = factor(hp))) +
  geom_bar(size = 1.5)

ggplot(tt, aes(x = factor(hp))) +
  geom_bar(size = 1.5, aes(fill = factor(carb)))

ggplot(tt, aes(x = factor(hp))) +
  geom_bar(size = 1.5, aes(fill = factor(carb))) +
  coord_polar()

ttt <- airquality
head(ttt)

ggplot(ttt, aes(x = Day, y = Ozone, group = Day)) +
  geom_boxplot()

ggplot(ttt, aes(Solar.R)) + 
  geom_histogram(binwidth = 2)
