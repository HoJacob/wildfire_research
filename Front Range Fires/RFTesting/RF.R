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
library(caret)

iris$Species <- as.factor(ifelse(iris$Species == "setosa", 1, 0))

#Data
FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv')
FireAllPredictors <- read.csv('~/Rstudio/data/FireAllPredictors.csv')

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


sum(!complete.cases(FireAllPredictors))
# before we fit a random forest model we’ll fill in the missing values in each column with the column medians:
#replace NAs with column medians
for(i in 1:ncol(FireAllPredictors)) {
  FireAllPredictors[ , i][is.na(FireAllPredictors[ , i])] <- median(FireAllPredictors[ , i], na.rm=TRUE)
}
# sum(!complete.cases(FirePredictors))
# table(FirePredictors$fire)
# names(FirePredictors)
FireAllPredictors$fire <- as.factor(FireAllPredictors$fire)
str(FirePredictors)


##################Main################# 
n_folds <- 100
drop_percentage <- 0.20

# Calculate the number of observations to be dropped per fold
n_drop <- round(nrow(FireAllPredictors) * drop_percentage)
# Create an empty vector to store the accuracy of each fold
accuracy <- numeric(n_folds)
# Set the seed for reproducibility
set.seed(16)
# Loop through each fold

drop_idx <- sample(nrow(FireAllPredictors), n_drop)

train_data <- FireAllPredictors[-drop_idx, ]
#train_data$fire <- as.factor(train_data$fire)
test_data <- FireAllPredictors[drop_idx, ]
#test_data$fire <- as.factor(test_data$fire)

model <- randomForest(fire ~ ., data = train_data, ntree = 75,  mtry = 20, importance = TRUE,
                      proximity = TRUE)

probabilities <- predict(model, test_data, type ="prob")
predictions <- predict(model, test_data)

fire_prob = probabilities[,3]

idx_no_fire = which(predictions==0)
idx_fire = which(predictions==1)

fire_prob_FireEvent = fire_prob[idx_fire]
fire_prob_NoEvent = fire_prob[idx_no_fire]

i <- mean(fire_prob_FireEvent)
j <- mean(fire_prob_NoEvent)
length(idx_fire)


for (i in 1:3) {
  
  # Sample a random set of observations to be dropped
  drop_idx <- sample(nrow(FireAllPredictors), n_drop)
  
  # Split the dataset into training and testing sets
  train_data <- FireAllPredictors[-drop_idx, ]
  train_data$fire <- as.factor(train_data$fire)
  
  test_data <- FireAllPredictors[drop_idx, ]
  test_data$fire <- as.factor(test_data$fire)
  
  # Train a random forest model
  model <- randomForest(fire ~ ., data = train_data, ntree = 75,  mtry = 20, importance = TRUE,
                        proximity = TRUE)
  print(model)
  
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

