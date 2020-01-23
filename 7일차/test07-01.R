head(airquality, 6)

names(airquality) <- tolower(names(airquality))

head(airquality, 6)

t <- melt(airquality)

head(t,6)
tail(t,6)

t <- melt(airquality, id.vars = c('month', 'ozone'), measure.vars = 'solar.r')

head(t,6)
tail(t,6)