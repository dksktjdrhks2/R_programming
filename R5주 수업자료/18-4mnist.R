### Sample for saver

library(tensorflow)

library(magrittr)

### MNIST for TensorFlow

### Data loading
#install_tensorflow(version = "1.14.0")

datasets <- tf$contrib$learn$datasets

mnist <- datasets$mnist$read_data_sets("MNIST-data", one_hot = TRUE)



### Placeholder 

xs <- tf$placeholder(tf$float32, shape(NULL , 784L))

ys <-tf$placeholder(tf$float32, shape(NULL, 10L))



### Model Building 

### Hidden layer 

hiddenLayer_Weight <- tf$Variable(tf$random_normal(shape(784L, 40L)), name = "h1W1")

hiddenLayer_bias <- tf$Variable(tf$zeros(shape(1, 40L)), name = "h1b1")

hiddenLayer_Wx_plus_b <- tf$matmul(xs, hiddenLayer_Weight)+ hiddenLayer_bias

hiddenLayer_output <- tf$nn$sigmoid(hiddenLayer_Wx_plus_b)



### output layer 

outputLayer_Weight <- tf$Variable(tf$random_normal(shape(40L, 10L)), name = "opW")

outputLayer_bias <- tf$Variable(tf$zeros(shape(1, 10L)), name = "opb")

outputLayer_Wx_plus_b <- tf$matmul(hiddenLayer_output, outputLayer_Weight)+ outputLayer_bias

output_layer_result <- tf$nn$softmax(outputLayer_Wx_plus_b)



### loss function, Gradient descent and learning rate

cross_entropy <- tf$reduce_mean(-tf$reduce_sum(ys*tf$log(output_layer_result), 
                                               
                                               reduction_indices = 1L))

learning_rate <- 0.4

train_step <- tf$train$AdamOptimizer(learning_rate)$minimize(cross_entropy)



### compute accuracy function

compute_accuracy <- function(model_result, v_xs, v_ys){
  
  y_pre <- sess$run(model_result, feed_dict = dict(xs = v_xs))
  
  correct_prediction <- tf$equal(tf$argmax(y_pre, 1L), tf$argmax(v_ys, 1L))
  
  accuracy <- tf$cast(correct_prediction, tf$float32) %>% tf$reduce_mean(.)
  
  result <- sess$run(accuracy, feed_dict = dict(xs = v_xs, ys = v_ys))
  
  return(result)
  
}



### Training

### Setting session and saver

sess <- tf$Session()

saver <- tf$train$Saver()

init <- tf$global_variables_initializer()

sess$run(init)



### Running

for (i in 1:1000){
  
  batches <- mnist$train$next_batch(100L)
  
  batch_xs <- batches[[1]]
  
  batch_ys <- batches[[2]]
  
  sess$run(train_step, feed_dict = dict(xs = batch_xs, ys = batch_ys))
  
  if(i %% 50 == 0){
    
    print(paste("Step =>", i, sep = " "))
    
    print(compute_accuracy(output_layer_result, mnist$test$images, mnist$test$labels))
    
  }
  
}

print("==== Saver is start ====")


saver$save(sess, 'D:./Rsunng/\\savemodel.ckpt', write_meta_graph = FALSE)

print("Save successfully")

print("==== Saver is end ====")

