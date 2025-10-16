library(randomForest)
library(caret)
library(PerformanceAnalytics)
library(e1071)

FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv') 

str(FirePredictors)

sum(!complete.cases(FirePredictors))


for(i in 1:ncol(FirePredictors)) {
  FirePredictors[ , i][is.na(FirePredictors[ , i])] <- median(FirePredictors[ , i], na.rm=TRUE)
}

FirePredictors$fire <- as.factor(FirePredictors$fire)
str(FirePredictors)

#split between train and test
cutoff = round(0.7*nrow(FirePredictors))

train_data <- FirePredictors[1:cutoff,]
test_data <- FirePredictors[-(1:cutoff),]


str(train_data)
str(test_data)

test_data$fire <- as.integer(test2_data$fire)
train_data$fire <- as.integer(train2_data$fire)

#another way to split dataset CHATGPT METHOD FOR ACCURACY
set.seed(123)
trainIndex <- createDataPartition(FirePredictors$fire, p = .8, 
                                  list = FALSE, 
                                  times = 1)
trainData <- FirePredictors[trainIndex, ]
testData <- FirePredictors[-trainIndex, ]

trainData$fire <- as.vector(testData$fire)
testData$fire <- as.vector(testData$fire)
testData$fire <- as.factor(testData$fire)
trainData$fire <- as.factor(trainData$fire)

str(trainData)
str(testData)

Rfmodel <- randomForest(fire ~., data = trainData, type = "class", importance = TRUE, proximity = TRUE)
Rfmodel2 <- randomForest(fire ~., data = trainData, type = "regression" importance = TRUE, proximity = TRUE)

print(Rfmodel)
print(Rfmodel2)
Rfmodel2$type

predictions <- predict(Rfmodel, testData)
confusionMatrix(predictions, testData$fire)

#make this example reproducible
set.seed(1)

#fit the random forest model
model <- randomForest(
  formula = fire ~ .,
  data = FirePredictors
)



#display fitted model
model

which.min(model$mse)
sqrt(model$mse[which.min(model$mse)])

plot(model)
varImpPlot(model)
####Regression###
install.packages("ROSE")
library(ROSE)

# Create an oversampled dataset using the ROSE function
df_oversampled <- ROSE(fire ~ ., data = FirePredictors, seed = 123)$data
str(df_oversampled)

FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv') 

str(FirePredictors)

sum(!complete.cases(FirePredictors))

for(i in 1:ncol(FirePredictors)) {
  FirePredictors[ , i][is.na(FirePredictors[ , i])] <- median(FirePredictors[ , i], na.rm=TRUE)
}

FirePredictors[FirePredictors$fire == 0,]$fire <- "NoFire"
FirePredictors[FirePredictors$fire == 1,]$fire <- "Fire"
FirePredictors$fire <- as.factor(FirePredictors$fire)

FirePredictors$fire <- ifelse(test=FirePredictors$fire == 0, yes = "NoFire", no = "Fire")
FirePredictors$fire <- as.factor(FirePredictors$fire)
str(FirePredictors)

model3 <- randomForest(fire~., data = df_oversampled, proximity =TRUE)
model3
data(iris)
str(iris)

