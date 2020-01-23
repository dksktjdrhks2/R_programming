head(mutate(t, y = '2000', y1 = '2020'))

head(mutate(t, disp_rank = rank(disp)))

distinct(t, hp)

distinct(t, gear)

distinct(t, hp, cyl, gear)
