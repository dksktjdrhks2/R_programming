t$A45_YN <- ifelse(t$AGE>=30, 'Y', 'N')
t
t$SEXM_YN <- ifelse(t$SEX == "M", 'Y', 'N')
t
t$A1000000 <- ifelse(t$A>=1000000, '우수', '불량')
t
t$G5 <- ifelse(t$AGE>=45, 'A1.45++',
               ifelse(t$AGE>=40, 'A2.4044',
                      ifelse(t$AGE>=35, 'A3.3539',
                             ifelse(t$AGE>=30, 'A4.3034', 'A5.0029'))))
t
