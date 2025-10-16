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

# Hyperparameter Tuning training with mlr
getParamSet("classif.rpart")

d.tree.mlr <- makeClassifTask(
  data=train_data, 
  target="fire"
)

# Search Parameter for Max Depth
param_grid <- makeParamSet( 
  makeDiscreteParam("maxdepth", values=1:30))

# Define Grid
control_grid = makeTuneControlGrid()

# Define Cross Validation
resample = makeResampleDesc("CV", iters = 3L)

# Define Measure
measure = acc


set.seed(123) 
dt_tuneparam <- tuneParams(learner='classif.rpart', 
                           task=d.tree.mlr, 
                           resampling = resample,
                           measures = measure,
                           par.set=param_grid, 
                           control=control_grid, 
                           show.info = TRUE)

# Extracting results
result_hyperparam <- generateHyperParsEffectData(dt_tuneparam, partial.dep = TRUE)

# Plotting Accuracy Score across different maxdepth
ggplot(
  data = result_hyperparam$data,
  aes(x = maxdepth, y=acc.test.mean)
) + geom_line(color = 'darkblue')

dt_tuneparam

# Pick Up Best Params and train them
best_parameters = setHyperPars(
  makeLearner("classif.rpart", predict.type = "prob"), 
  par.vals = dt_tuneparam$x
)

best_model = train(best_parameters, d.tree.mlr)

d.tree.mlr.test <- makeClassifTask(
  data=test_data, 
  target="fire"
)

# Predicting the best Model
results <- predict(best_model, task = d.tree.mlr.test)$data

accuracy(results$truth, results$response)

# Tweaking multiple hyperparameters
param_grid_multi <- makeParamSet( 
  makeDiscreteParam("maxdepth", values=1:30),
  makeNumericParam("cp", lower = 0.001, upper = 0.01),
  makeDiscreteParam("minsplit", values=1:10)
)

dt_tuneparam_multi <- tuneParams(learner='classif.rpart', 
                                 task=d.tree.mlr, 
                                 resampling = resample,
                                 measures = measure,
                                 par.set=param_grid_multi, 
                                 control=control_grid, 
                                 show.info = TRUE)


# Extracting best Parameters from Multi Search
best_parameters_multi = setHyperPars(
  makeLearner("classif.rpart", predict.type = "prob"), 
  par.vals = dt_tuneparam_multi$x
)

best_model_multi = train(best_parameters_multi, d.tree.mlr)

# Predicting the best Model
results <- predict(best_model_multi, task = d.tree.mlr.test)$data

accuracy(results$truth, results$response)

# Extracting results from multigrid
result_hyperparam.multi <- generateHyperParsEffectData(dt_tuneparam_multi, partial.dep = TRUE)

# Sampling just for visualization
result_sample <- result_hyperparam.multi$data %>%
  sample_n(300)


hyperparam.plot <- plot_ly(result_sample, 
                           x = ~cp, 
                           y = ~maxdepth, 
                           z = ~minsplit,
                           marker = list(color = ~acc.test.mean,  colorscale = list(c(0, 1), c("darkred", "darkgreen")), showscale = TRUE))
hyperparam.plot <- hyperparam.plot %>% add_markers()
hyperparam.plot
