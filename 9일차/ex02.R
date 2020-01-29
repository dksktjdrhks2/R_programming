xx <- mtcars
head(xx)

ggplot(xx, aes(x = cyl)) + 
  geom_bar(width = 0.5)

ggplot(xx, aes(x = factor(cyl))) + 
  geom_bar(width = 0.5)

ggplot(xx, aes(x = factor(cyl))) + 
  geom_bar(width = 0.5) +
  geom_bar(aes(fill = factor(gear)))

ggplot(xx, aes(x = factor(cyl))) + 
  geom_bar(width = 0.5, aes(fill = factor(gear))) + 
  coord_polar()

ggplot(xx, aes(x = factor(cyl))) + 
  geom_bar(width = 0.5, aes(fill = factor(gear))) + 
  coord_polar()

ggplot(xx, aes(x = factor(cyl))) + 
  geom_bar(width = 0.5, aes(fill = factor(gear))) + 
  coord_polar(theta = 'y')

xxx <- airquality
ggplot(xxx, aes(x = Day, y = Temp, group = Day)) +
  geom_boxplot()

ggplot(xxx, aes(Temp)) +
  geom_histogram(binwidth = 1)

                 