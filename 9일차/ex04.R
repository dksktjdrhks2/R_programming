xx <- airquality
head(xx)

ggplot(xx, aes(x = Day, y = Temp)) +
  geom_point(size = 2, color = "darkblue") +
  geom_text(aes(label = Temp, vjust = 0, hjust = 0))

x <- mtcars
head(x)

ggplot(x, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = 'skyblue')

ggplot(x, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = 'skyblue') +
  annotate('segment', x = 2.5, xend = 3.5, y = 9, yend = 15, color = 'red', arrow = arrow())

ggplot(x, aes(x = wt, y = mpg)) +
  geom_point() +
  annotate('rect', xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = 'skyblue') +
  annotate('segment', x = 2.5, xend = 3.5, y = 9, yend = 15, color = 'red', arrow = arrow()) +
  annotate('text', x = 2.5, y = 9, label = "point", color = 'red')
