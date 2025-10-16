# Load necessary packages
library(randomForest)
library(plotly)
library(tidyverse)
library(data.table)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)

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
str(FirePredictors$fire)

# Splitting data into Train and Test
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
