library(class)


tr.idx <- c(1:25,51:75, 101:125)    
ds.tr <- iris[tr.idx, 1:4]           
ds.ts <- iris[-tr.idx, 1:4]          
cl.tr <- factor(iris[tr.idx, 5])     
cl.ts <- factor(iris[-tr.idx, 5])    

pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE) 
pred

acc <- mean(pred==cl.ts)            
acc

table(pred,cl.ts)                    
