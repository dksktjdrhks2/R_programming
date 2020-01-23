t <- mtcars
t

nrow(t)

filter(t, cyl == 8)

filter(t, cyl == 8, wt >= 2)

head(arrange(t, hp))

head(arrange(t, disp, -hp))

select(t, mpg, carb)
