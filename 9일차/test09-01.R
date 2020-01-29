t <- airquality
t

ggplot(t, aes(x = Month, y = Wind))

ggplot(t, aes(x = Month, y = Temp)) + geom_point(size = 2, color = 'green')

ggplot(t, aes(x = Month, y = Temp)) + geom_line(size = 3, color = 'blue')

ggplot(t, aes(x = Month, y = Temp)) + geom_line(size = 1, color = 'yellow') + 
  geom_point(size = 2, color = 'pink')
