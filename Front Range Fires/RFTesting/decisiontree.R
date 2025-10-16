# Load necessary packages
library(randomForest)
library(plotly)
library(tidyverse)
library(data.table)
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)
library(dplyr)
library(Metrics)
library(mlr)
library(ggplot2)
library(plotly)

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
d.tree = rpart(fire ~ ., 
               data=train_data, 
               method = 'class')
rpart.plot(d.tree, cex=0.6)
# Predict Values
predicted_values <- predict(d.tree, test_data, type = 'class')
# Getting Accuracy
accuracy(test_data$fire, predicted_values)
d.tree.custom = rpart(fire~ ., 
                      data=train_data, 
                      method = 'class',
                      control = c(maxdepth = 5, cp=0.001))
rpart.plot(d.tree.custom, cex=0.6)
# Predict test set data
predicted_values.custom <- predict(d.tree.custom, test_data, type = 'class')

# Accuracy of Custom D.Tree
accuracy(test_data$fire, predicted_values.custom)
