x <- economics
str(x)
x
ggplot(x, aes(x = date, y = psavert)) +
  geom_line() +
  geom_abline(intercept = 12.0, slope = -0.0005)

ggplot(x, aes(x = date, y = psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(x$psavert))

library(dplyr)
x_inter <- filter(x, psavert == min(x$psavert))$date
x_inter

ggplot(x, aes(x = date, y = psavert)) +
  geom_line() +
  geom_vline(xintercept = x_inter)
