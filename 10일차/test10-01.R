library(ggplot2)

t <- mtcars
head(t)

ggplot(t, aes(x = disp, y = qsec)) +
  geom_point() +
  annotate('rect', xmin = 200, xmax = 400, ymin = 16, ymax = 21, fill = 'skyblue', alpha = 0.3)

ggplot(t, aes(x = disp, y = qsec)) +
  geom_point() +
  annotate('segment', x = 100, xend = 300, y = 12, yend = 20, color = 'green', arrow = arrow()) +
  annotate('text', x = 100, y = 12, label = "start")

ggplot(t, aes(x = carb)) +
  geom_bar() +
  labs(x = 'carb수', y = '자동차수', title = 'carb별 자동차수')
