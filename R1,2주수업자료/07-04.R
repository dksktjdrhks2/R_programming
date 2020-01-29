# 04데이터 요약 및 샘플 추출하기
  
#  summarize()함수로 데이터 요약하기
      # summarize(데이터세트, 요약 결과 저장 열=통계함수)
# mtcars에서 반환할 열을 지정한 후 cyl 열의 평균, 최솟값, 최댓값 반환
summarise(x, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

# mtcars에서 cyl 열의 평균, 최솟값, 최댓값 반환
summarise(x, mean(cyl), min(cyl), max(cyl))

# 그룹별로 요약하기
gr_cyl <- group_by(x, cyl) 	     # mtcars에서 cyl 별로 묶은 후 gr_cyl에 반환
summarise(gr_cyl, n()) 		             # gr_cyl 에서 cyl 별 개수 요약
# 데이터에서 샘플 추출하기

sample_n(x, 10) 	# mtcars에서 10개의 샘플 데이터 추출
sample_frac(x, 0.2) 	# mtcars에서 20%를 샘플 데이터로 추출
