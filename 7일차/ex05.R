# 데이터 요약 샘플 추출

summarise(x, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))
summarise(x, mean(cyl), min(cyl), max(cyl))

gr_cyl <- group_by(x, cyl)
summarise(gr_cyl, n())

sample_n(x, 10) # x 데이터셋에서 랜덤하게 10개의 샘플데이터 추출

sample_frac(x, 0.2) # x 데이터셋에서 랜덤하게 20%만큼의 샘플데이터 추출
