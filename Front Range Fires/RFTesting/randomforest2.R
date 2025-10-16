# Load necessary packages
library(randomForest)
library(plotly)
library(tidyverse)
library(data.table)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)
library(cowplot)
library(ggplot2)

# source("~/Rstudio/small_plots/read.R")
FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv')
str(FirePredictors)

sum(!complete.cases(FirePredictors))
# before we fit a random forest model we’ll fill in the missing values in each column with the column medians:
#replace NAs with column medians
for(i in 1:ncol(FirePredictors)) {
  FirePredictors[ , i][is.na(FirePredictors[ , i])] <- median(FirePredictors[ , i], na.rm=TRUE)
}
# sum(!complete.cases(FirePredictors))
# table(FirePredictors$fire)
# names(FirePredictors)
FirePredictors$fire <- as.factor(FirePredictors$fire)
str(FirePredictors)
which(FirePredictors$fire==0)

set.seed(16)
model <- randomForest(fire ~ ., data = FirePredictors, ntree=500, importance = TRUE, proximity=TRUE)
model

#Output from model for 500 trees
# Call:
#   randomForest(formula = fire ~ ., data = FirePredictors, importance = TRUE,      proximity = TRUE) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 5
# 
# OOB estimate of  error rate: 1.04%
# Confusion matrix:
#   0 1 2 class.error
# 0 13734 0 1 7.28067e-05
# 1   108 0 0 1.00000e+00
# 2    36 0 1 9.72973e-01

#Output from model for 250 trees
# Call:
#   randomForest(formula = fire ~ ., data = FirePredictors, ntree = 250,      importance = TRUE, proximity = TRUE) 
# Type of random forest: classification
# Number of trees: 250
# No. of variables tried at each split: 5
# 
# OOB estimate of  error rate: 1.04%
# Confusion matrix:
#   0 1 2 class.error
# 0 13734 0 1 7.28067e-05
# 1   108 0 0 1.00000e+00
# 2    36 0 1 9.72973e-01

#Output from model for 100 trees
# Call:
#   randomForest(formula = fire ~ ., data = FirePredictors, ntree = 100,      importance = TRUE, proximity = TRUE) 
# Type of random forest: classification
# Number of trees: 100
# No. of variables tried at each split: 5
# 
# OOB estimate of  error rate: 1.04%
# Confusion matrix:
#   0 1 2 class.error
# 0 13735 0 0    0.000000
# 1   108 0 0    1.000000
# 2    36 0 1    0.972973

#model$err.rate
#Plotting error rates
oob.error.data <-data.frame(
  Trees=rep(1:nrow(model$err.rate), times = 4),
  Type=rep(c("OOB", "0", "1", "2"), each=nrow(model$err.rate)),
  Error= c(model$err.rate[,"OOB"],
           model$err.rate[,"0"],
           model$err.rate[ ,"1"],
           model$err.rate[ ,"2"]
           )
)

ggplot(data=oob.error.data, aes(x=Trees, y=Error))+
  geom_line(aes(color=Type))

#Test Number of variables at each tree
oob.values <-vector(length=10)
for(i in 1:10){
  temp.model <-randomForest(fire ~ ., data = FirePredictors, mtry=i, ntree=500)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values

#Making an MDS plot with the random forest thing
distance.matrix <-dist(1-model$proximity)
mds.stuff <- cmdscale(distance.matrix, eig=TRUE, x.ret=TRUE)
mds.var.per <- round(mds.stuff$eig/sum(mds.stuff$eig)*100, 1)
mds.values <- mds.stuff$points
mds.data <- data.frame(Sample=rownames(mds.values),
                       X=mds.values[,1],
                       Y=mds.values[,2],
                       Satus=FirePredictors$fire)
ggplot(data=mds.data, aes(x=X, y=Y, label=Sample))+
  geom_text(aes(color=Status))+
  theme_bw()+
  xlab(paste("MDS1 - ", mds.var.per[1], "%", sep=""))+
  ylab(paste("MDS2 - ", mds.var.per[2], "%", sep=""))+
  ggtitle("MDS plot using (1-Random Prest Proximities)")

#K fold Cross Validation
FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv')
str(FirePredictors)

sum(!complete.cases(FirePredictors))
for(i in 1:ncol(FirePredictors)) {
  FirePredictors[ , i][is.na(FirePredictors[ , i])] <- median(FirePredictors[ , i], na.rm=TRUE)
}

FirePredictors$fire <- as.factor(FirePredictors$fire)
str(FirePredictors)

n_folds <- 10
drop_percentage <- 0.50

# Calculate the number of observations to be dropped per fold
n_drop <- round(nrow(FirePredictors) * drop_percentage)
# Create an empty vector to store the accuracy of each fold
accuracy <- numeric(n_folds)
# Set the seed for reproducibility
set.seed(16)
# Loop through each fold

for (i in 1:1) {
  
  # Sample a random set of observations to be dropped
  drop_idx <- sample(nrow(FirePredictors), n_drop)
  
  # Split the dataset into training and testing sets
  train_data <- FirePredictors[-drop_idx, ]
  test_data <- FirePredictors[drop_idx, ]
  
  # Train a random forest model
  model <- randomForest(fire ~ ., data = train_data, ntree = 75,  mtry = 20, importance = TRUE,
                        proximity = TRUE)
  print(model)
  
  model2 <- randomForest(fire ~ ., data = test_data, ntree = 75,  mtry = 20, importance = TRUE,
                        proximity = TRUE)
  print(model2)
  # Make predictions on the testing set
  predictions <- predict(model, test_data)
  probabilities <- predict(model, test_data, type ="prob")

  
  #print(model)
  # Calculate the accuracy of the model
  accuracy[i] <- mean(predictions == test_data$fire)
}
# Calculate the mean accuracy across all folds
mean_accuracy <- mean(accuracy)
pred_v_prob <- cbind(predictions, probabilities)


# for (i in 1:2){
#   set.seed(123)
#   independent <- sample(2, nrow(FirePredictors), replace = TRUE, prob = c(0.9, 0.1))
#   train <- FirePredictors[independent==1,]
#   test <- FirePredictors[independent==2,]
#   
#   rf_Test <- randomForest(fire~., data=train, type= "prob",
#                      ntree = 75,
#                      mtry = 20,
#                      importance = TRUE,
#                      proximity = TRUE)
#   print(rf_Test)
#   
# }
  
#Data partition
set.seed(123)
independent <- sample(2, nrow(FirePredictors), replace = TRUE, prob = c(0.7, 0.3))
train <- FirePredictors[independent==1,]
test <- FirePredictors[independent==2,]

#Make model
set.seed(222)
rf <- randomForest(fire~., data=train, 
                   ntree = 75,
                   mtry = 20,
                   importance = TRUE,
                   proximity = TRUE)
print(rf)
attributes(rf)
rf$confusion

#Prediction and Confusion Matrix- Train data
library(caret)

p1 <- predict(rf, train)
p1 <- predict(rf, train, type = "prob")
confusionMatrix(p1, train$fire)

#Prediction and Confusion Matrix - Test data
p2 <- predict(rf, test)
confusionMatrix(p2, test$fire)
view(p2)

#Error rate of Random Forest
plot(rf)

#Tune mtry

t <- tuneRF(train[,-33], train[,33],
       stepFactor = 0.5,
       plot = TRUE,
       ntreeTry = 75,
       trace = TRUE,
       improve = 0.05)

#No. of nodes for the trees
hist(treesize(rf),
     main = "No. of Nodes for the Trees",
     col = "blue")
#Variable Importance
varImpPlot(rf,
           sort = T,
           n.var = 10,
           main = "Top 10 variables for prediction")
importance(rf)
varUsed(rf)

#Partial Dependence plot
partialPlot(rf, train, max_fm100, "1")

#Extract Single Tree
getTree(rf, 1, labelVar = TRUE)

#Bulti-dimensional Scaling Plot
MDSplot(rf, train$fire)

#Result of confusionMatrix - Train Data
# Confusion Matrix and Statistics
# 
# Reference
# Prediction    0    1    2
# 0 9576    0    0
# 1    0   73    0
# 2    0    0   23
# 
# Overall Statistics
# 
# Accuracy : 1          
# 95% CI : (0.9996, 1)
# No Information Rate : 0.9901     
# P-Value [Acc > NIR] : < 2.2e-16  
# 
# Kappa : 1          
# 
# Mcnemar's Test P-Value : NA         
# 
# Statistics by Class:
# 
#                      Class: 0 Class: 1 Class: 2
# Sensitivity            1.0000 1.000000 1.000000
# Specificity            1.0000 1.000000 1.000000
# Pos Pred Value         1.0000 1.000000 1.000000
# Neg Pred Value         1.0000 1.000000 1.000000
# Prevalence             0.9901 0.007548 0.002378
# Detection Rate         0.9901 0.007548 0.002378
# Detection Prevalence   0.9901 0.007548 0.002378
# Balanced Accuracy      1.0000 1.000000 1.000000

# #Result of Confusion Matrix with Test Data
# Confusion Matrix and Statistics
# 
# Reference
# Prediction    0    1    2
# 0 4159   35   13
# 1    0    0    0
# 2    0    0    1
# 
# Overall Statistics
# 
# Accuracy : 0.9886          
# 95% CI : (0.9849, 0.9916)
# No Information Rate : 0.9884          
# P-Value [Acc > NIR] : 0.4807          
# 
# Kappa : 0.0397          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: 0 Class: 1  Class: 2
# Sensitivity           1.00000 0.000000 0.0714286
# Specificity           0.02041 1.000000 1.0000000
# Pos Pred Value        0.98859      NaN 1.0000000
# Neg Pred Value        1.00000 0.991683 0.9969099
# Prevalence            0.98836 0.008317 0.0033270
# Detection Rate        0.98836 0.000000 0.0002376
# Detection Prevalence  0.99976 0.000000 0.0002376
# Balanced Accuracy     0.51020 0.500000 0.5357143

#Splitting data into Train and Test
FirePredictors['row_id'] = rownames(FirePredictors)
set.seed(123)
train_data <- FirePredictors %>%
  sample_frac(0.8)
test_data <- FirePredictors %>%
  anti_join(train_data, by='row_id')
# Drop row_id from both dataframes
train_data[,'row_id'] <- NULL
test_data[,'row_id'] <- NULL

set.seed(120)  # Setting seed
classifier_RF = randomForest(x = train_data[-5],
                             y = train_data$fire,
                             ntree = 500)

classifier_RF

# Predicting the Test set results
y_pred = predict(classifier_RF, newdata = test_data[-5])

# Confusion Matrix
confusion_mtx = table(test_data[, 5], y_pred)
confusion_mtx

# Plotting model
plot(classifier_RF)

# Importance plot
importance(classifier_RF)

# Variable importance plot
varImpPlot(classifier_RF)

## another way:


#make this example reproducible
set.seed(1)

#fit the random forest model
model <- randomForest(
  formula = fire ~ .,
  data = FirePredictors
)

#display fitted model
model
# Call:
#   randomForest(formula = mean_ws ~ ., data = FirePredictors) 
# Type of random forest: regression
# Number of trees: 500
# No. of variables tried at each split: 1
# 
# Mean of squared resi

model1 <- randomForest(fire ~ ., 
                        data = FirePredictors, 
                        importance = TRUE,
                        proximity = TRUE)
print(model1)
# Call:
#   randomForest(formula = fire ~ ., data = FirePredictors, importance = TRUE,      proximity = TRUE) 
# Type of random forest: classification
# Number of trees: 500
# No. of variables tried at each split: 5
# 
# OOB estimate of  error rate: 1.05%
# Confusion matrix:
#   0 1 2 class.error
# 0 13734 0 1 7.28067e-05
# 1   108 0 0 1.00000e+00
# 2    37 0 0 1.00000e+00

#duals: 327.0914
# % Var explained: 61
# Output to be present
# As PNG file 
png(file = "randomForestClassification.png")

# Plot the error vs 
# The number of trees graph
plot(model1)

# Saving the file
dev.off()

# After executing the above code, the output is produced that shows the number of decision trees developed using the classification model for random forest algorithms, i.e. 500 decision trees. The confusion matrix is also known as the error matrix that shows the visualization of the performance of the classification model.

#find number of trees that produce lowest test MSE
which.min(model$mtry)

## [1] 82

#find RMSE of best model
sqrt(model$mse[which.min(model$mse)]) 

## [1] 17.64392

#plot the test MSE by number of trees
plot(model)

#produce variable importance plot
varImpPlot(model) 

model_tuned <- tuneRF(
  x=airquality[,-1], #define predictor variables
  y=airquality$mean_ws, #define response variable
  ntreeTry=500,
  mtryStart=4, 
  stepFactor=1.5,
  improve=0.01,
  trace=FALSE #don't show real-time progress
)

#define new observation

new <- data.frame(max_ws=150, pct95_wind=8, mean_vpd=70, mean_vpd=5, pct95_vpd,testDate=1)

#use fitted bagged model to predict Ozone value of new observation
predict(model, newdata=new)

# 27.19442
# Load predictor dataframe with climate variables and fire events
### predictor_df <- read.csv('climate_fire_data.csv')

# Split data into training and testing sets
set.seed(123)
train_indices <- sample(nrow(predictor_df), nrow(predictor_df) * 0.8)
train_df <- predictor_df[train_indices, ]
test_df <- predictor_df[-train_indices, ]

# Train the random forest model
rf_model <- randomForest(fire_event ~ ., data = train_df, ntree = 100)

# Make predictions on the test set
test_predictions <- predict(rf_model, newdata = test_df)

# Evaluate model performance
conf_mat <- table(test_df$fire_event, test_predictions)
accuracy <- sum(diag(conf_mat)) / sum(conf_mat)



#Data Partition 
set.seed(123)
independent <- sample(2, nrow(FirePredictors), replace = TRUE, prob = c(0.7, 0.3))
training <- FirePredictors[independent==1,]
testing <- FirePredictors[independent==2,]

#fit regression model
set.seed(16)
system.time(rf_fit <- train(fire ~ ., data = training, method = "rf", importance = TRUE, 
                            trControl = trainControl(method = 'cv', number = 10)))


#Random Forest
set.seed(222)
rf <- randomForest(fire~., data = training)
print(rf)
attributes(rf)

#Prediction using RF
p1 <- predict(rf, training)
p2 <- predict(rf, training, type = "prob")
