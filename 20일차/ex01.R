library(cvTools)                      
library(class)

k = 10                                
folds <- cvFolds(nrow(iris), K=k)    

acc <- c()                           
for (i in 1:k) {
  ts.idx <- folds$which == i           
  ds.tr <- iris[-ts.idx, 1:4]         
  ds.ts <- iris[ts.idx, 1:4]        
  cl.tr <- factor(iris[-ts.idx, 5])    
  cl.ts <- factor(iris[ts.idx, 5])     
  
  pred <- knn(ds.tr, ds.ts, cl.tr, k = 5) 
  acc[i] <- mean(pred==cl.ts)          
}
acc                                    
mean(acc)                              
