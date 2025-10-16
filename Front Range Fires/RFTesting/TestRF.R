library(randomForest)
library(caret)
library(PerformanceAnalytics)
library(e1071)
install.packages("ROSE")
library(ROSE)

#Import DataSet
ps <- read.csv('~/Rstudio/data/FirePredictors.csv') #0, 1, 2 

FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv') 
str(FirePredictors)
dd=FirePredictors$pct95_wind
FirePredictors$pct95_wind <- dd * 10.0 
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


####Create an oversampled dataset using the ROSE function
df_oversampled <- ROSE(fire ~ ., data = FirePredictors, seed = 123)$data
str(df_oversampled)

# Create an undersampled dataset using the downSample function
#df_undersampled <- downSample(FirePredictors[, -1], FirePredictors$fire)

#Create Random Forest Model using oversampled dataset 
Badmodel <- randomForest(fire~., data = FirePredictors, proximity = TRUE)
Badmodel
FPmodel <- randomForest(fire~., data = df_oversampled, proximity =TRUE)
FPmodel

#plot(FPmodel)
###Box Plot fire_prob and no prob lets goooooo####

#split data into train and test and make model
drop_percentage <- 0.1
#drop_percentage <- 0.005
n_drop <- round(nrow(df_oversampled) * drop_percentage)

set.seed(123)
# Loop through each fold

for (i in 1:1) {
  # Sample a random set of observations to be dropped
  drop_idx <- sample(nrow(df_oversampled), n_drop)
  train_data <- df_oversampled[-drop_idx, ]
  test_data <- df_oversampled[drop_idx, ]
}  
  
model <- randomForest(fire ~ ., data = train_data, mtry = 13, proximity = TRUE)
model
plot(model)

#####K-fold cross validation
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
b<- mean(all_No_eventprob)

#plot df
df1=c()
df1$all_Fire_eventprob <- c(all_Fire_eventprob)  #keep as integer
df1$all_No_eventprob <- c(all_No_eventprob, rep(NA, length(all_No_eventprob) - length(all_Fire_eventprob)))  #keep as integer
str(df1) 
boxplot(df1, outline = FALSE, main ="10-folds Cross-Validation Results", xlab = "Classifiers", ylab = "Accuracy")

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


