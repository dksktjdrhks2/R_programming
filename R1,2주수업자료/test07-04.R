# summarize()함수로 데이터 요약하기
# summarize(데이터세트, 요약 결과 저장 열=통계함수)
# t에서 반환할 열을 지정한 후 mpg 열의 평균, 최솟값, 최댓값, 합을 요약해서 반환하시오.
summarise(t, mpg_mean = mean(mpg), mpg_min = min(mpg), mpg_max = max(mpg), sum(mpg))

# t에서 mpg 열의 평균, 최솟값, 최댓값, 합을 요약해서 반환하시오.
summarise(t, mean(mpg), min(mpg), max(mpg), sum(mpg))

# t 에서 mpg 별로 묶은 후 tt에 반환하고  tt 에서 mpg 별 개수 요약해서 반환하시오
tt <- group_by(t, mpg) 	     
summarise(tt, n()) 		             

# 데이터에서 샘플 추출하기
# t에서 5개의 샘플 데이터 추출하시오
sample_n(t, 5) 
#  t에서 30%를 샘플 데이터로 추출하시오
sample_frac(t, 0.3) 