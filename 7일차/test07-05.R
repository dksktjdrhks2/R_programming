summarise(t, mpg_mean = mean(mpg), mpg_min = min(mpg), mpg_max = max(mpg), mpg_sum = sum(mpg))

summarise(t, mean(mpg), min(mpg), max(mpg), sum(mpg))

tt <- group_by(t, mpg)
summarise(tt, n())

sample_n(t, 5)

sample_frac(t, 0.3)