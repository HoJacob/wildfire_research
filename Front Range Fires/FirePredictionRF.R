library(randomForest)
library(caret)
library(PerformanceAnalytics)
library(e1071)
install.packages("ROSE")
library(ROSE)
library(ggplot2)
library(tibble)
library(boot)
library(lhs)
#Import DataSet
FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv')
#RescaledFirePredictors <- read.csv("~/Rstudio/data/RescaledFirePredictors.csv")
WinterFirePredictors <- read.csv('~/Rstudio/data/WinterFirePredictors.csv')  
SpringFirePredictors <- read.csv('~/Rstudio/data/SpringFirePredictors.csv') 
SummerFirePredictors <- read.csv('~/Rstudio/data/SummerFirePredictors.csv') 
FallFirePredictors <- read.csv('~/Rstudio/data/FallFirePredictors.csv') 

library(here)

FirePredictors <- read.csv(
  here("Front Range Fires", "data", "FirePredictors.csv")
)

# RescaledFirePredictors <- read.csv(
#   here("Front Range Fires", "data", "RescaledFirePredictors.csv")
# )

WinterFirePredictors <- read.csv(
  here("Front Range Fires", "data", "WinterFirePredictors.csv")
)

SpringFirePredictors <- read.csv(
  here("Front Range Fires", "data", "SpringFirePredictors.csv")
)

SummerFirePredictors <- read.csv(
  here("Front Range Fires", "data", "SummerFirePredictors.csv")
)

FallFirePredictors <- read.csv(
  here("Front Range Fires", "data", "FallFirePredictors.csv")
)


str(FirePredictors)
str(WinterFirePredictors)
##str(RescaledFirePredictors)

dd=FirePredictors$pct95_wind
FirePredictors$pct95_wind <- dd * 10.0 

aa= WinterFirePredictors$pct95_wind.idx_winter
WinterFirePredictors$pct95_wind.idx_winter <- aa * 10

bb= SpringFirePredictors$pct95_wind.idx_spring.
SpringFirePredictors$pct95_wind.idx_spring. <- bb * 10

cc= SummerFirePredictors$pct95_wind.idx_summer.
SummerFirePredictors$pct95_wind.idx_summer. <- cc * 10

dd= FallFirePredictors$pct95_wind.idx_fall.
FallFirePredictors$pct95_wind.idx_fall. <- dd * 10

#All Seasons Dataset
sum(!complete.cases(FirePredictors))
for(i in 1:ncol(FirePredictors)) {
  FirePredictors[ , i][is.na(FirePredictors[ , i])] <- median(FirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
FirePredictors[FirePredictors$fire == 0,]$fire <- "NoFire"
FirePredictors[FirePredictors$fire == 1,]$fire <- "Fire"
FirePredictors$fire <- as.factor(FirePredictors$fire)

# FirePredictors$fire <- ifelse(test=FirePredictors$fire == 0, yes = "NoFire", no = "Fire")
# FirePredictors$fire <- as.factor(FirePredictors$fire)
str(FirePredictors)

#Rescaled Dataset
# sum(!complete.cases(RescaledFirePredictors))
# for(i in 1:ncol(RescaledFirePredictors)) {
#   RescaledFirePredictors[ , i][is.na(RescaledFirePredictors[ , i])] <- median(RescaledFirePredictors[ , i], na.rm=TRUE)
# }
# #Change "fire" as factor of "NoFire" and "Fire
# RescaledFirePredictors[RescaledFirePredictors$fire == 0,]$fire <- "NoFire"
# RescaledFirePredictors[RescaledFirePredictors$fire == 1,]$fire <- "Fire"
# RescaledFirePredictors$fire <- as.factor(RescaledFirePredictors$fire)



#Winter Dataset
#No Na values for Winter
sum(!complete.cases(WinterFirePredictors))
 for(i in 1:ncol(WinterFirePredictors)) {
   WinterFirePredictors[ , i][is.na(WinterFirePredictors[ , i])] <- median(WinterFirePredictors[ , i], na.rm=TRUE)
 }
#Change "fire" as factor of "NoFire" and "Fire
WinterFirePredictors[WinterFirePredictors$fire.idx_winter. == 0,]$fire.idx_winter. <- "NoFire"
WinterFirePredictors[WinterFirePredictors$fire.idx_winter. == 1,]$fire.idx_winter. <- "Fire"
WinterFirePredictors$fire.idx_winter. <- as.factor(WinterFirePredictors$fire.idx_winter.)

#Spring Dataset
sum(!complete.cases(SpringFirePredictors))
for(i in 1:ncol(SpringFirePredictors)) {
  SpringFirePredictors[ , i][is.na(SpringFirePredictors[ , i])] <- median(SpringFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
SpringFirePredictors[SpringFirePredictors$fire.idx_spring. == 0,]$fire.idx_spring. <- "NoFire"
SpringFirePredictors[SpringFirePredictors$fire.idx_spring. == 1,]$fire.idx_spring. <- "Fire"
SpringFirePredictors$fire.idx_spring. <- as.factor(SpringFirePredictors$fire.idx_spring.)

#Summer Dataset
sum(!complete.cases(SummerFirePredictors))
for(i in 1:ncol(SummerFirePredictors)) {
  SummerFirePredictors[ , i][is.na(SummerFirePredictors[ , i])] <- median(SummerFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
SummerFirePredictors[SummerFirePredictors$fire.idx_summer. == 0,]$fire.idx_summer. <- "NoFire"
SummerFirePredictors[SummerFirePredictors$fire.idx_summer. == 1,]$fire.idx_summer. <- "Fire"
SummerFirePredictors$fire.idx_summer. <- as.factor(SummerFirePredictors$fire.idx_summer.)

#Fall Dataset
sum(!complete.cases(FallFirePredictors))
for(i in 1:ncol(FallFirePredictors)) {
  FallFirePredictors[ , i][is.na(FallFirePredictors[ , i])] <- median(FallFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
FallFirePredictors[FallFirePredictors$fire.idx_fall. == 0,]$fire.idx_fall. <- "NoFire"
FallFirePredictors[FallFirePredictors$fire.idx_fall. == 1,]$fire.idx_fall. <- "Fire"
FallFirePredictors$fire.idx_fall. <- as.factor(FallFirePredictors$fire.idx_fall.)


####Create an oversampled dataset using the ROSE function
df_oversampled <- ROSE(fire ~ ., data = FirePredictors, seed = 123)$data
str(df_oversampled)

Winter_df_oversampled <- ROSE(fire.idx_winter. ~ ., data = WinterFirePredictors, seed = 123)$data
Spring_df_oversampled <- ROSE(fire.idx_spring. ~ ., data = SpringFirePredictors, seed = 123)$data
Summer_df_oversampled <- ROSE(fire.idx_summer. ~ ., data = SummerFirePredictors, seed = 123)$data
Fall_df_oversampled <- ROSE(fire.idx_fall. ~ ., data = FallFirePredictors, seed = 123)$data



nf <- which(Winter_df_oversampled == "NoFire")
fWin <- which(Winter_df_oversampled == "Fire")
fSpr <- which(Spring_df_oversampled == "Fire")
fSum <- which(Summer_df_oversampled == "Fire")
fFall <- which(Fall_df_oversampled == "Fire")
frWin <- which(WinterFirePredictors == "Fire")


#####Time Series of RF Model
TimeSeriesModel <- randomForest(fire~ ., data = df_oversampled, mtry = 13, proximity = TRUE)
TimeSeriesModel
TSProbabilities <- predict(TimeSeriesModel, FirePredictors, type ="prob")
TSfire_prob = TSProbabilities[,2]

year = TSfire_prob[1:365]
endyear = TSfire_prob[13515:13880]
quarteryear = TSfire_prob[4501:4866]
quarter2year = TSfire_prob[9003:9368]

plot(year, type = "l")
plot(endyear, type = "l")
plot(quarteryear, type = "l")
plot(quarter2year, type = "l")



#####K-fold cross validation of oversampled Dataset not using
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_Fire_eventprob = c()
all_No_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  drop_idx <- sample(nrow(df_oversampled), n_drop)
  
  
  train_data <- df_oversampled[-drop_idx, ]
  test_data <- df_oversampled[drop_idx, ]
  
  model <- randomForest(fire ~ ., data = train_data)
  # predictions <- predict(model, newdata = test_data)
  # 
  # accuracy[i] <- mean(predictions == test_data$fire)
  # 
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  #Fix
  for (k in 1:length(fire_prob_FireEvent) ){
    all_Fire_eventprob <- cbind(all_Fire_eventprob, fire_prob_FireEvent)
  }
  for (j in 1:length(fire_prob_NoEvent) ){
    all_No_eventprob <- cbind(all_No_eventprob, fire_prob_NoEvent)
  }

}

a <- mean(all_Fire_eventprob) 
b <- mean(all_No_eventprob)
c <- median(all_Fire_eventprob)
d <- median(all_No_eventprob)



#####K-fold cross validation of oversampled Dataset Testing using
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_Fire_eventprob = c()
all_No_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  #drop_idx <- sample(nrow(df_oversampled), n_drop)
  
  portion_size <- floor(nrow(df_oversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(df_oversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx

  train_data <- df_oversampled[-test_indices, ]
  test_data <- df_oversampled[test_indices, ]

  
  model <- randomForest(fire ~ ., data = train_data, ntree = 285, mtry = 32, maxdepth=19, minsplit = 11)

  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  all_Fire_eventprob <- c(all_Fire_eventprob, fire_prob_FireEvent)
  all_No_eventprob <- c(all_No_eventprob, fire_prob_NoEvent)
  
}

a <- mean(all_Fire_eventprob) 
b <- mean(all_No_eventprob)
c <- median(all_Fire_eventprob)
d <- median(all_No_eventprob)

# adjusted[1] 0.7122807
# > d
# [1] 0.2421053

#plot K-fold Oversampled Dataset
df1=c()
df1$all_Fire_eventprob<- c(all_Fire_eventprob, rep(NA, length(all_No_eventprob) - length(all_Fire_eventprob)))  #keep as integer  #keep as integer
df1$all_No_eventprob <- c(all_No_eventprob)
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

#Variable importance for Oversampled Dataset 
n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_oversampled) * drop_percentage)
set.seed(123)
drop_idx <- sample(nrow(df_oversampled), n_drop)
train_data <- df_oversampled[-drop_idx, ]
test_data <- df_oversampled[drop_idx, ]
model2 <- randomForest(fire ~ ., data = train_data)

custom_var_names <- c("Mean Fuel Moisture 100", "Mean Fuel Moisture 1000", "95th Percentile Fuel Moisture 100", "Mean Wind Speed", "95th Vapor Pressure Deficit", "Var 6", "Var 7", "Var 8", "Var 9", "Var 10")

varImpPlot(model2, sort = TRUE, n.var = 10, main = "Top 10 variables for prediction", names = custom_var_names)


varImpPlot(model2, type = c("bar", TRUE),
           sort = T,
           n.var = 10,
           main = "Top 10 variables for prediction")
importance(model2)
varUsed(model2)
oob.values <- vector(length = 25)
for(i in 1:25){
  temp.model <- randomForest(fire~., data = train_data, mtry = i, ntree = 500)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values



###Latin Hyper Cube Sampling of Oversampled Random Forest Model(Fitting/Tuning the Model)
n_samples <- 20
n_hyperparameters <- 4

param_ranges <- list(
  ntree = c(100, 700),
  mtry = c(1,33),
  max_depth = c(5, 30),
  min_samples_split = c(2, 20)
)

lhc_samples <- randomLHS(n = n_samples, k = n_hyperparameters)
colnames(lhc_samples) <- names(param_ranges)


for (i in 1:n_hyperparameters) {
  param_name <- names(param_ranges)[i]
  lhc_samples[, i] <- lhc_samples[, i] * (param_ranges[[param_name]][2] - param_ranges[[param_name]][1]) + param_ranges[[param_name]][1]
}

lhc_samples[, 2] <- round(lhc_samples[, 2])

#Create a function that creates a random forest with the given parameters

train_rf <- function(params, train_data, test_data){
  lhsModel <- randomForest(fire ~ ., data = train_data,  
                           ntree = round(params[1]),
                           mtry = round(params[2]),
                           maxdepth = round(params[3]),
                           minsplit = round(params[4]))
                          

  probabilities <- predict(lhsModel, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  skill_score <- median(fire_prob_FireEvent) - median(fire_prob_NoEvent)
  
  return(skill_score)
  
}


set.seed(123)
drop_percentage <- 0.2
n_drop <- round(nrow(df_oversampled) * drop_percentage)
drop_idx <- sample(1:nrow(df_oversampled), n_drop)
training_data <- df_oversampled[-drop_idx, ]
testing_data <- df_oversampled[drop_idx, ]

top_skill_score <- -Inf
best_params <- NULL


for (i in 1:num_samples) {
  params <- lhc_samples[i,]

  # Create a new random forest model for each iteration
  current_skill_score <- train_rf(params, train_data, test_data)
  
  # Print or log the results
  print(paste("Iteration", i, "/", num_samples, ": Hyperparameters:", params, ", Difference in Medians:", current_skill_score))
  
  # Update the best parameters if a higher difference is achieved
  if (current_skill_score > top_skill_score) {
    top_skill_score <- current_skill_score
    best_params <- params
  }
}

# Print the best hyperparameters and difference in medians
print(paste("Best Hyperparameters:", best_params))
print(paste("Best Difference in Medians:", top_skill_score))

# "Best Hyperparameters: 193.917754020076" "Best Hyperparameters: 30"              
# "Best Difference in Medians: 0.551546391752577"



#####K-fold cross validation of REAL Dataset
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
realdrop_percentage <- 0.3
realn_drop <- round(nrow(FirePredictors) * realdrop_percentage)
n_drop <- round(nrow(df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_RealFire_eventprob = c()
all_RealNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  drop_idx <- sample(nrow(df_oversampled), n_drop)
  realdrop_idx <- sample(nrow(FirePredictors), realn_drop)
  
  train_data <- df_oversampled[-drop_idx, ]
  #test_data <- df_oversampled[drop_idx, ]
  testfire_data <- FirePredictors[realdrop_idx,]
  
  model <- randomForest(fire ~ ., data = train_data)
  # predictions <- predict(model, newdata = test_data)
  # 
  # accuracy[i] <- mean(predictions == test_data$fire)
  # 
  probabilities <- predict(model, testfire_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(testfire_data$fire=="NoFire")
  idx_fire = which(testfire_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  #Fix
  for (k in 1:length(fire_prob_FireEvent) ){
    all_RealFire_eventprob <- cbind(all_RealFire_eventprob, fire_prob_FireEvent)
  }
  for (j in 1:length(fire_prob_NoEvent) ){
    all_RealNo_eventprob <- cbind(all_RealNo_eventprob, fire_prob_NoEvent)
  }
  
}

a <- mean(all_RealFire_eventprob) 
b <- mean(all_RealNo_eventprob)
c <- median(all_RealFire_eventprob)
d <- median(all_RealNo_eventprob)

dfreal=c()
dfreal$all_RealFire_eventprob <- c(all_RealFire_eventprob)  #keep as integer
dfreal$all_RealNo_eventprob <- c(all_RealNo_eventprob, rep(NA, length(all_RealNo_eventprob) - length(all_RealFire_eventprob)))  #keep as integer
str(dfreal) 
boxplot(dfreal, outline = TRUE, main ="10-Folds Cross-Validation Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)



#####K-fold cross validation of oversampled Winter Dataset 
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(Winter_df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_WinterFire_eventprob = c()
all_WinterNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  #drop_idx <- sample(nrow(df_oversampled), n_drop)
  
  portion_size <- floor(nrow(Winter_df_oversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(Winter_df_oversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  #train_indices <- setdiff(1:nrow(Winter_df_oversampled), test_indices)
  
  train_data <- Winter_df_oversampled[-test_indices, ]
  test_data <- Winter_df_oversampled[test_indices, ]
  #train_data <- df_oversampled[-drop_idx, ]
  #test_data <- df_oversampled[drop_idx, ]
  
  model <- randomForest(fire.idx_winter. ~ ., data = train_data)
  # predictions <- predict(model, newdata = test_data)
  # 
  # accuracy[i] <- mean(predictions == test_data$fire)
  # 
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  all_WinterFire_eventprob <- c(all_WinterFire_eventprob, fire_prob_FireEvent)
  all_WinterNo_eventprob <- c(all_WinterNo_eventprob, fire_prob_NoEvent)
  #Fix
  #for (k in 1:length(fire_prob_FireEvent) ){
    #all_WinterFire_eventprob <- c(all_WinterFire_eventprob, fire_prob_FireEvent)
  #}
  #for (j in 1:length(fire_prob_NoEvent) ){
    #all_WinterNo_eventprob <- c(all_WinterNo_eventprob, fire_prob_NoEvent)
  #}
  
}

hi = median(all_WinterFire_eventprob)
asd = median(all_WinterNo_eventprob)

#####K-fold cross validation of Spring oversampled Dataset Testing
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(Spring_df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_SpringFire_eventprob = c()
all_SpringNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  #drop_idx <- sample(nrow(df_oversampled), n_drop)
  
  portion_size <- floor(nrow(Spring_df_oversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(Spring_df_oversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  train_indices <- setdiff(1:nrow(Spring_df_oversampled), test_indices)
  
  train_data <- Spring_df_oversampled[train_indices, ]
  test_data <- Spring_df_oversampled[test_indices, ]
  #train_data <- df_oversampled[-drop_idx, ]
  #test_data <- df_oversampled[drop_idx, ]
  
  model <- randomForest(fire.idx_spring. ~ ., data = train_data)
  # predictions <- predict(model, newdata = test_data)
  # 
  # accuracy[i] <- mean(predictions == test_data$fire)
  # 
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  #all_Fire_eventprob <- c(all_Fire_eventprob, fire_prob_FireEvent)
  #all_No_eventprob <- c(all_No_eventprob, fire_prob_NoEvent)
  #Fix
  for (k in 1:length(fire_prob_FireEvent) ){
    all_SpringFire_eventprob <- c(all_SpringFire_eventprob, fire_prob_FireEvent)
  }
  for (j in 1:length(fire_prob_NoEvent) ){
    all_SpringNo_eventprob <- c(all_SpringNo_eventprob, fire_prob_NoEvent)
  }
  
}


#####K-fold cross validation of Summer oversampled Dataset Testing
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(Summer_df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_SummerFire_eventprob = c()
all_SummerNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  #drop_idx <- sample(nrow(df_oversampled), n_drop)
  
  portion_size <- floor(nrow(Summer_df_oversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(Summer_df_oversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  train_indices <- setdiff(1:nrow(Summer_df_oversampled), test_indices)
  
  train_data <- Summer_df_oversampled[train_indices, ]
  test_data <- Summer_df_oversampled[test_indices, ]
  #train_data <- df_oversampled[-drop_idx, ]
  #test_data <- df_oversampled[drop_idx, ]
  
  model <- randomForest(fire.idx_summer. ~ ., data = train_data)
  # predictions <- predict(model, newdata = test_data)
  # 
  # accuracy[i] <- mean(predictions == test_data$fire)
  # 
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  #all_Fire_eventprob <- c(all_Fire_eventprob, fire_prob_FireEvent)
  #all_No_eventprob <- c(all_No_eventprob, fire_prob_NoEvent)
  #Fix
  for (k in 1:length(fire_prob_FireEvent) ){
    all_SummerFire_eventprob <- c(all_SummerFire_eventprob, fire_prob_FireEvent)
  }
  for (j in 1:length(fire_prob_NoEvent) ){
    all_SummerNo_eventprob <- c(all_SummerNo_eventprob, fire_prob_NoEvent)
  }
  
}

a <- mean(all_Fire_eventprob) 
b <- mean(all_No_eventprob)
c <- median(all_Fire_eventprob)
d <- median(all_No_eventprob)

#####K-fold cross validation of Fall oversampled Dataset Testing
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(Fall_df_oversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_FallFire_eventprob = c()
all_FallNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  
  #drop_idx <- sample(nrow(df_oversampled), n_drop)
  
  portion_size <- floor(nrow(Fall_df_oversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(Fall_df_oversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  train_indices <- setdiff(1:nrow(Fall_df_oversampled), test_indices)
  
  train_data <- Fall_df_oversampled[train_indices, ]
  test_data <- Fall_df_oversampled[test_indices, ]
  #train_data <- df_oversampled[-drop_idx, ]
  #test_data <- df_oversampled[drop_idx, ]
  
  model <- randomForest(fire.idx_fall. ~ ., data = train_data)
  # predictions <- predict(model, newdata = test_data)
  # 
  # accuracy[i] <- mean(predictions == test_data$fire)
  # 
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$fire=="NoFire")
  idx_fire = which(test_data$fire=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  #all_Fire_eventprob <- c(all_Fire_eventprob, fire_prob_FireEvent)
  #all_No_eventprob <- c(all_No_eventprob, fire_prob_NoEvent)
  #Fix
  for (k in 1:length(fire_prob_FireEvent) ){
    all_FallFire_eventprob <- c(all_FallFire_eventprob, fire_prob_FireEvent)
  }
  for (j in 1:length(fire_prob_NoEvent) ){
    all_FallNo_eventprob <- c(all_FallNo_eventprob, fire_prob_NoEvent)
  }
  
}

#Boxplot seasonal
boxplot(all_WinterFire_eventprob, all_SpringFire_eventprob, all_SummerFire_eventprob, all_FallFire_eventprob)
dfseason=c()
dfseason$all_WinterFire_eventprob <- c(all_WinterFire_eventprob, rep(NA, length(all_SpringFire_eventprob) - length(all_WinterFire_eventprob)))  #keep as integer  #keep as integer
dfseason$all_SpringFire_eventprob <- c(all_SpringFire_eventprob)
dfseason$all_SummerFire_eventprob <- c(all_SummerFire_eventprob)
dfseason$all_FallFire_eventprob <- c(all_FallFire_eventprob, rep(NA, length(all_SpringFire_eventprob) - length(all_FallFire_eventprob)))  #keep as integer  #keep as integer
#dfseason$Season = rep(c("Winter", "Spring", "Summer", "Fall"))
names(dfseason) <- c("Winter", "Spring", "Summer", "Fall")
str(dfseason) 
boxplot(dfseason, outline = TRUE, main ="Seasonal 10-Folds Cross-Validation Results", xlab = "Fire Events", ylab = "Predicted Probability of Fire", mean = TRUE)

#Individual Seasons Boxplots
dfWinter=c()
dfWinter$all_WinterFire_eventprob <- c(all_WinterFire_eventprob)  #keep as integer
dfWinter$all_WinterNo_eventprob <- c(all_WinterNo_eventprob, rep(NA, length(all_WinterNo_eventprob) - length(all_WinterFire_eventprob)))  #keep as integer
names(dfWinter) <- c("Fire Occurrence", "No Fire Occurrence")
str(dfWinter) 
boxplot(dfWinter, outline = TRUE, main ="Winter 10-Folds Cross-Validation Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

dfSpring=c()
dfSpring$all_SpringFire_eventprob <- c(all_SpringFire_eventprob)  #keep as integer
dfSpring$all_SpringNo_eventprob <- c(all_SpringNo_eventprob, rep(NA, length(all_SpringNo_eventprob) - length(all_SpringFire_eventprob)))  #keep as integer
names(dfSpring) <- c("Fire Occurrence", "No Fire Occurrence")
str(dfSpring) 
boxplot(dfSpring, outline = TRUE, main ="Spring 10-Folds Cross-Validation Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

dfSummer=c()
dfSummer$all_SummerFire_eventprob <- c(all_SummerFire_eventprob)  #keep as integer
dfSummer$all_SummerNo_eventprob <- c(all_SummerNo_eventprob, rep(NA, length(all_SummerNo_eventprob) - length(all_SummerFire_eventprob)))  #keep as integer
names(dfSummer) <- c("Fire Occurrence", "No Fire Occurrence")
str(dfSummer) 
boxplot(dfSummer, outline = TRUE, main ="Summer 10-Folds Cross-Validation Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

dfFall=c()
dfFall$all_FallFire_eventprob <- c(all_FallFire_eventprob)  #keep as integer
dfFall$all_FallNo_eventprob <- c(all_FallNo_eventprob, rep(NA, length(all_FallNo_eventprob) - length(all_FallFire_eventprob)))  #keep as integer
names(dfSummer) <- c("Fire Occurrence", "No Fire Occurrence")
str(dfFall) 
boxplot(dfFall, outline = TRUE, main =list("Fall 10-Folds Cross-Validation Results",
        "Subtitle: Iris Dataset"), xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

#4-panel boxplots
par(mfrow = c(2,2) )
boxplot(dfWinter, outline = TRUE, main ="Winter 10-Folds Cross-Validation Results", sub = "n-fires = 1706", xlab = "n-fires = 1706", ylab = "Predicted Probability of Fire", mean = TRUE)
boxplot(dfSpring, outline = TRUE, main ="Spring 10-Folds Cross-Validation Results", sub = "n-fires = 1734", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)
boxplot(dfSummer, outline = TRUE, main ="Summer 10-Folds Cross-Validation Results", sub = "n-fires = 1734", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)
boxplot(dfFall, outline = TRUE, main ="Fall 10-Folds Cross-Validation Results", sub = "n-fires = 1716", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)



####Bootstrap k-fold oversampled dataset
set.seed(123)
#ask should this be total fires in real dataset or oversampled dataset 
total_fires=6853
total_no_fires = 7027
sample_size = total_fires 
nsamples = 1000 
store_sample_data=c()

for (i in 1:nsamples) {
  idx_rand <- sample(1:total_no_fires, 1)
  Prob_of_no_fire_sample = all_No_eventprob[idx_rand]
  sample_median = median(Prob_of_no_fire_sample)
  for (j in 1:length(sample_median)){
    store_sample_data <- rbind(store_sample_data, sample_median)
  }
}

medvalboot = median(store_sample_data)
boxplot(store_sample_data, main = "Bootstrap Significance Test on Random Forest", ylab = "Predicted Probability of Fire", xlab = "Non Fire Events")
  


#plot df
df1=c()
df1$all_Fire_eventprob <- c(all_Fire_eventprob)  #keep as integer
df1$all_No_eventprob <- c(all_No_eventprob, rep(NA, length(all_No_eventprob) - length(all_Fire_eventprob)))  #keep as integer
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

i <- mean(fire_prob_FireEvent) ##0.70594647887324
j <- mean(fire_prob_NoEvent) ##0.286457227138643
mean_accuracy <- mean(accuracy)



####Variable Importance
varImpPlot(model, type = c("bar", TRUE),
           sort = T,
           n.var = 10,
           main = "Top 10 variables for prediction")
importance(model)
varUsed(model)
oob.values <- vector(length = 25)
for(i in 1:25){
  temp.model <- randomForest(fire~., data = train_data, mtry = i, ntree = 500)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values

#####Accuracy
probabilities <- predict(model, test_data, type ="prob")
fire_prob = probabilities[,2]

idx_no_fire = which(test_data$fire=="NoFire")
idx_fire = which(test_data$fire=="Fire")

fire_prob_FireEvent = fire_prob[idx_fire]
fire_prob_NoEvent = fire_prob[idx_no_fire]
length(fire_prob_FireEvent)
length(fire_prob_NoEvent)

set.seed(234)
#plot df
df=c()
df$fire_prob_FireEvent <- c(fire_prob_FireEvent)  #keep as integer
df$fire_prob_NoEvent <- c(fire_prob_NoEvent, rep(NA, length(fire_prob_NoEvent) - length(fire_prob_FireEvent)))  #keep as integer
str(df) 
boxplot(df)


i <- mean(fire_prob_FireEvent) ##0.70594647887324
j <- mean(fire_prob_NoEvent) ##0.286457227138643
length(idx_fire)

####single tree
library(party)
data(iris)
model <- randomForest(fire ~ ., data = train_data, mtry = 13, proximity = TRUE)

cf <- cforest(fire~ ., data=test_data, controls=cforest_control(mtry=13, mincriterion=0))
pt <- party:::prettytree(cf@ensemble[[1]], names(cf@data@get("input")))
pt
nt <- new("BinaryTree")
nt@tree <- pt
nt@data <- cf@data
nt@responses <- cf@responses
nt
plot(nt)

###auto correlation
ac1 <- acf(df_oversampled$mean_fm100, lag.max = NULL, type = c("correlation", "covariance", "partial"), 
             plot =TRUE,na.action = na.fail, demean = TRUE)

ac2 <- acf(df_oversampled$mean_ws, lag.max = NULL, type = c("correlation", "covariance", "partial"), 
           plot =TRUE,na.action = na.fail, demean = TRUE)

ac3 <- acf(df_oversampled$mean_fm1000, lag.max = NULL, type = c("correlation", "covariance", "partial"), 
           plot =TRUE,na.action = na.fail, demean = TRUE)

ac4 <- acf(df_oversampled$mean_spei90, lag.max = NULL, type = c("correlation", "covariance", "partial"), 
           plot =TRUE,na.action = na.fail, demean = TRUE)

#Fit the Model
set.seed(123)
ind <- sample(2, nrow(df_oversampled), replace = TRUE, prob = c(0.7, 0.3))
train <- df_oversampled[ind ==1, ]
test <- df_oversampled[ind == 2, ]
str(train)
rf <- randomForest(fire~., data = train, ntree = 700, mtry = 8)
rf
plot(rf)

t <- tuneRF(train[,-34], train[,34],
            stepFactor = 0.5,
            plot = TRUE,
            ntreeTry = 300,
            trace = TRUE,
            improve = 0.05)

oob.values <- vector(length = 10)
for(i in 1:10){
  temp.model <- randomForest(fire~., data = train, mtry = i, ntree = 300)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values

#Making an MDS plot with the random forest thing
distance.matrix <-dist(1-rf$proximity)
mds.stuff <- cmdscale(distance.matrix, eig=TRUE, x.ret=TRUE)
mds.var.per <- round(mds.stuff$eig/sum(mds.stuff$eig)*100, 1)
mds.values <- mds.stuff$points
mds.data <- data.frame(Sample=rownames(mds.values),
                       X=mds.values[,1],
                       Y=mds.values[,2],
                       Satus=df_oversampled$fire)
ggplot(data=mds.data, aes(x=X, y=Y, label=Sample))+
  geom_text(aes(color=Status))+
  theme_bw()+
  xlab(paste("MDS1 - ", mds.var.per[1], "%", sep=""))+
  ylab(paste("MDS2 - ", mds.var.per[2], "%", sep=""))+
  ggtitle("MDS plot using (1-Random Prest Proximities)")

