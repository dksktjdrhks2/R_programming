for(i in c("123", "123", "442")){
  print(i)
}

for(i in 1:9){
  if(i == 1){
    for(x in 2:9){
      cat(" |", x, "단 |", "\t")
    }
    cat("\n")
  }
  for(j in 2:9){
    cat(j, "*", i, "=", i*j, "\t")
  }
  cat("\n")
}

for(i in 1:20){
  if(i %% 2 == 0){
    cat(i, "=", "짝수\n")
  }else{
    cat(i, "=", "홀수\n")
  }
}
