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

###Setup####
CaliFirePredictors <- read.csv(here("Sierra Nevada Fires", "cali_data", "CaliFirePredictors.csv" ))
#All Seasons Dataset
sum(!complete.cases(CaliFirePredictors))
for(i in 1:ncol(CaliFirePredictors)) {
  CaliFirePredictors[ , i][is.na(CaliFirePredictors[ , i])] <- median(CaliFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
CaliFirePredictors[CaliFirePredictors$caliFire == 0,]$caliFire <- "NoFire"
CaliFirePredictors[CaliFirePredictors$caliFire == 1,]$caliFire <- "Fire"
CaliFirePredictors$caliFire <- as.factor(CaliFirePredictors$caliFire)

str(CaliFirePredictors)
#Create Oversampled Dataset
df_caliOversampled <- ROSE(caliFire ~ ., data = CaliFirePredictors, seed = 123)$data
str(df_caliOversampled)

####K-fold cross validation of oversampled Dataset Testing using####
#df_oversampled

n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_caliOversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_Fire_eventprob = c()
all_No_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  portion_size <- floor(nrow(df_caliOversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(df_caliOversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  
  train_data <- df_caliOversampled[-test_indices, ]
  test_data <- df_caliOversampled[test_indices, ]
  
  
  model <- randomForest(caliFire ~ ., data = train_data)
  
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$caliFire=="NoFire")
  idx_fire = which(test_data$caliFire=="Fire")
  
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

print(a)
print(b)
print(c)
print(d)

wilcox.test(all_Fire_eventprob, all_No_eventprob)

df1=c()
df1$all_Fire_eventprob<- c(all_Fire_eventprob, rep(NA, length(all_No_eventprob) - length(all_Fire_eventprob)))  #keep as integer  #keep as integer
df1$all_No_eventprob <- c(all_No_eventprob)
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Cali Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

###Top Predictors#####
####Variable Importance

model <- randomForest(caliFire ~ ., data = train_data, importance = TRUE)
varImpPlot(model)

varImpPlot(model,
           type = 2,
           sort = TRUE,
           n.var = 10,
           main = "Top 10 variables for prediction")

varImpPlot(model, type = c("bar", TRUE),
           sort = T,
           main = "Top 10 variables for prediction")
importance(model)
varUsed(model)
oob.values <- vector(length = 25)
for(i in 1:25){
  temp.model <- randomForest(fire~., data = train_data, mtry = i, ntree = 500)
  oob.values[i] <- temp.model$err.rate[nrow(temp.model$err.rate),1]
}
oob.values

###Seasonal Predictors Setup####
CaliWinterFirePredictors <- read.csv(here("Sierra Nevada Fires", "cali_data", "CaliWinterFirePredictors.csv"))  
CaliSpringFirePredictors <- read.csv(here("Sierra Nevada Fires", "cali_data", "CaliSpringFirePredictors.csv")) 
CaliSummerFirePredictors <- read.csv(here("Sierra Nevada Fires", "cali_data", "CaliSummerFirePredictors.csv")) 
CaliFallFirePredictors <- read.csv(here("Sierra Nevada Fires", "cali_data", "CaliFallFirePredictors.csv")) 

##Winter Season Dataset
sum(!complete.cases(CaliWinterFirePredictors))
for(i in 1:ncol(CaliWinterFirePredictors)) {
  CaliWinterFirePredictors[ , i][is.na(CaliWinterFirePredictors[ , i])] <- median(CaliWinterFirePredictors[ , i], na.rm=TRUE)
}
str(CaliWinterFirePredictors)


CaliWinterFirePredictors$caliFire.idx_winter.
#Change "fire" as factor of "NoFire" and "Fire
CaliWinterFirePredictors[CaliWinterFirePredictors$caliFire.idx_winter. == 0,]$caliFire.idx_winter. <- "NoFire"
CaliWinterFirePredictors[CaliWinterFirePredictors$caliFire.idx_winter. == 1,]$caliFire.idx_winter. <- "Fire"
CaliWinterFirePredictors$caliFire.idx_winter. <- as.factor(CaliWinterFirePredictors$caliFire.idx_winter.)

str(CaliWinterFirePredictors)
#Create Oversampled Dataset
df_caliWinterOversampled <- ROSE(caliFire.idx_winter. ~ ., data = CaliWinterFirePredictors, seed = 123)$data
str(df_caliWinterOversampled)


##Spring
sum(!complete.cases(CaliSpringFirePredictors))
for(i in 1:ncol(CaliSpringFirePredictors)) {
  CaliSpringFirePredictors[ , i][is.na(CaliSpringFirePredictors[ , i])] <- median(CaliSpringFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
CaliSpringFirePredictors[CaliSpringFirePredictors$caliFire.idx_spring. == 0,]$caliFire.idx_spring. <- "NoFire"
CaliSpringFirePredictors[CaliSpringFirePredictors$caliFire.idx_spring. == 1,]$caliFire.idx_spring. <- "Fire"
CaliSpringFirePredictors$caliFire.idx_spring. <- as.factor(CaliSpringFirePredictors$caliFire.idx_spring.)

str(CaliSpringFirePredictors)
#Create Oversampled Dataset
df_caliSpringOversampled <- ROSE(caliFire.idx_spring. ~ ., data = CaliSpringFirePredictors, seed = 123)$data
str(df_caliSpringOversampled)


##Summer
sum(!complete.cases(CaliSummerFirePredictors))
for(i in 1:ncol(CaliSummerFirePredictors)) {
  CaliSummerFirePredictors[ , i][is.na(CaliSummerFirePredictors[ , i])] <- median(CaliSummerFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
CaliSummerFirePredictors[CaliSummerFirePredictors$caliFire.idx_summer. == 0,]$caliFire.idx_summer. <- "NoFire"
CaliSummerFirePredictors[CaliSummerFirePredictors$caliFire.idx_summer. == 1,]$caliFire.idx_summer. <- "Fire"
CaliSummerFirePredictors$caliFire.idx_summer. <- as.factor(CaliSummerFirePredictors$caliFire.idx_summer.)

str(CaliSummerFirePredictors)
#Create Oversampled Dataset
df_caliSummerOversampled <- ROSE(caliFire.idx_summer. ~ ., data = CaliSummerFirePredictors, seed = 123)$data
str(df_caliSummerOversampled)


##Fall
sum(!complete.cases(CaliFallFirePredictors))
for(i in 1:ncol(CaliFallFirePredictors)) {
  CaliFallFirePredictors[ , i][is.na(CaliFallFirePredictors[ , i])] <- median(CaliFallFirePredictors[ , i], na.rm=TRUE)
}
#Change "fire" as factor of "NoFire" and "Fire
CaliFallFirePredictors[CaliFallFirePredictors$caliFire.idx_fall. == 0,]$caliFire.idx_fall. <- "NoFire"
CaliFallFirePredictors[CaliFallFirePredictors$caliFire.idx_fall. == 1,]$caliFire.idx_fall. <- "Fire"
CaliFallFirePredictors$caliFire.idx_fall. <- as.factor(CaliFallFirePredictors$caliFire.idx_fall.)

str(CaliFallFirePredictors)
#Create Oversampled Dataset
df_caliFallOversampled <- ROSE(caliFire.idx_fall. ~ ., data = CaliFallFirePredictors, seed = 123)$data
str(df_caliFallOversampled)

###Seasonal K-Folds####
##Winter
n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_caliWinterOversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_WinterFire_eventprob = c()
all_WinterNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  portion_size <- floor(nrow(df_caliWinterOversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(df_caliWinterOversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  
  train_data <- df_caliWinterOversampled[-test_indices, ]
  test_data <- df_caliWinterOversampled[test_indices, ]
  
  
  model <- randomForest(caliFire.idx_winter. ~ ., data = train_data)
  
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$caliFire.idx_winter.=="NoFire")
  idx_fire = which(test_data$caliFire.idx_winter.=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  all_WinterFire_eventprob <- c(all_WinterFire_eventprob, fire_prob_FireEvent)
  all_WinterNo_eventprob <- c(all_WinterNo_eventprob, fire_prob_NoEvent)
  
}


wa <- median(all_WinterFire_eventprob)
wb <- median(all_WinterNo_eventprob)
print(wa)
print(wb)

wilcox.test(all_WinterFire_eventprob, all_WinterNo_eventprob)

df1=c()
df1$all_Fire_eventprob<- c(all_WinterFire_eventprob, rep(NA, length(all_WinterNo_eventprob) - length(all_WinterFire_eventprob)))  #keep as integer  #keep as integer
df1$all_WinterNo_eventprob <- c(all_WinterNo_eventprob)
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Cali Winter Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)


##Spring
n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_caliSpringOversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_SpringFire_eventprob = c()
all_SpringNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  portion_size <- floor(nrow(df_caliSpringOversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(df_caliSpringOversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  
  train_data <- df_caliSpringOversampled[-test_indices, ]
  test_data <- df_caliSpringOversampled[test_indices, ]
  
  
  model <- randomForest(caliFire.idx_spring. ~ ., data = train_data)
  
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$caliFire.idx_spring.=="NoFire")
  idx_fire = which(test_data$caliFire.idx_spring.=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  all_SpringFire_eventprob <- c(all_SpringFire_eventprob, fire_prob_FireEvent)
  all_SpringNo_eventprob <- c(all_SpringNo_eventprob, fire_prob_NoEvent)
  
}


sa <- median(all_SpringFire_eventprob)
sb <- median(all_SpringNo_eventprob)
print(sa)
print(sb)

wilcox.test(all_SpringFire_eventprob, all_SpringNo_eventprob)

df1=c()
df1$all_Fire_eventprob<- c(all_SpringFire_eventprob, rep(NA, length(all_SpringNo_eventprob) - length(all_SpringFire_eventprob)))  #keep as integer  #keep as integer
df1$all_SpringNo_eventprob <- c(all_SpringNo_eventprob)
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Cali Spring Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)



##Summer
n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_caliSummerOversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_SummerFire_eventprob = c()
all_SummerNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  portion_size <- floor(nrow(df_caliSummerOversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(df_caliSummerOversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  
  train_data <- df_caliSummerOversampled[-test_indices, ]
  test_data <- df_caliSummerOversampled[test_indices, ]
  
  
  model <- randomForest(caliFire.idx_summer. ~ ., data = train_data)
  
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$caliFire.idx_summer.=="NoFire")
  idx_fire = which(test_data$caliFire.idx_summer.=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  all_SummerFire_eventprob <- c(all_SummerFire_eventprob, fire_prob_FireEvent)
  all_SummerNo_eventprob <- c(all_SummerNo_eventprob, fire_prob_NoEvent)
  
}


sua <- median(all_SummerFire_eventprob)
sub <- median(all_SummerNo_eventprob)
print(sua)
print(sub)

wilcox.test(all_SummerFire_eventprob, all_SummerNo_eventprob)

df1=c()
df1$all_Fire_eventprob<- c(all_SummerFire_eventprob, rep(NA, length(all_SummerNo_eventprob) - length(all_SummerFire_eventprob)))  #keep as integer  #keep as integer
df1$all_SummerNo_eventprob <- c(all_SummerNo_eventprob)
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Cali Summer Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)


##Fall
n_folds <- 10
drop_percentage <- 0.2
n_drop <- round(nrow(df_caliFallOversampled) * drop_percentage)
# Create an empty vector to store the accuracy of each fold

accuracy <- numeric(n_folds)
all_FallFire_eventprob = c()
all_FallNo_eventprob = c()

set.seed(123)

for (i in 1:n_folds) {
  portion_size <- floor(nrow(df_caliFallOversampled) / n_folds)
  
  start_idx <- (i - 1) * portion_size + 1
  end_idx <- min(i * portion_size, nrow(df_caliFallOversampled))
  
  # Create a sequence of indices for the current portion
  test_indices <- start_idx:end_idx
  
  train_data <- df_caliFallOversampled[-test_indices, ]
  test_data <- df_caliFallOversampled[test_indices, ]
  
  
  model <- randomForest(caliFire.idx_fall. ~ ., data = train_data)
  
  probabilities <- predict(model, test_data, type ="prob")
  fire_prob = probabilities[,2]
  
  idx_no_fire = which(test_data$caliFire.idx_fall.=="NoFire")
  idx_fire = which(test_data$caliFire.idx_fall.=="Fire")
  
  fire_prob_FireEvent = fire_prob[idx_fire]
  fire_prob_NoEvent = fire_prob[idx_no_fire]
  
  length(fire_prob_FireEvent)
  length(fire_prob_NoEvent)
  
  all_FallFire_eventprob <- c(all_FallFire_eventprob, fire_prob_FireEvent)
  all_FallNo_eventprob <- c(all_FallNo_eventprob, fire_prob_NoEvent)
  
}


fa <- median(all_FallFire_eventprob)
fb <- median(all_FallNo_eventprob)
print(fa)
print(fb)

wilcox.test(all_FallFire_eventprob, all_FallNo_eventprob)

df1=c()
df1$all_Fire_eventprob<- c(all_FallFire_eventprob, rep(NA, length(all_FallNo_eventprob) - length(all_FallFire_eventprob)))  #keep as integer  #keep as integer
df1$all_FallNo_eventprob <- c(all_FallNo_eventprob)
names(df1) <- c("Fire Events", "Non Fire Events")
str(df1) 
boxplot(df1, outline = TRUE, main ="10-Folds Cross-Validation Cali Fall Results", xlab = "", ylab = "Predicted Probability of Fire", mean = TRUE)

