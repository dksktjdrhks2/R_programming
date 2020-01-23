airquality
t1 <- melt(airquality, id.vars = c('month', 'day'), na.rm = T)

head(t1)
tail(t1)

t2 <- dcast(t1, month + day ~ variable)

head(t2)
tail(t2)

acast(t1, day ~ month ~ variable)

acast(t1, month ~ variable, mean)

acast(t1, month ~ variable, length)
