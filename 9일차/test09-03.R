t <- economics
head(t)

ggplot(t, aes(x = date, y = uempmed)) + 
  geom_line() +
  geom_abline(intercept = 4.1, slope = 0.0005)

ggplot(t, aes(x = date, y = uempmed)) +
  geom_line() +
  geom_hline(yintercept = mean(x$uempmed))

x_inter <- filter(t, uempmed == max(x$uempmed))$date

ggplot(t, aes(x = date, y = uempmed)) +
  geom_line() +
  geom_vline(xintercept = x_inter)
