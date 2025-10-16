library(stats)
library(plotly)
library(tidyverse)
#Columns
# source("~/Rstudio/FireStoreIndex.R")
# source("~/Rstudio/small_plots/read.R")
# source("~/Rstudio/small_plots/read_with_fire.R")
# source("~/Rstudio/small_plots/data_frame.R")
FirePredictors <- read.csv('~/Rstudio/data/FirePredictors.csv')
str(FirePredictors)

sum(!complete.cases(FirePredictors))
# before we fit a random forest model we’ll fill in the missing values in each column with the column medians:
#replace NAs with column medians
for(i in 1:ncol(FirePredictors)) {
  FirePredictors[ , i][is.na(FirePredictors[ , i])] <- median(FirePredictors[ , i], na.rm=TRUE)
}
idx_fire = store_fire_index
for (fg in 2:34) {

  #total time series
  # total_datapoints = seq(1,100,1)
  total_datapoints =  FirePredictors[fg]
  title=colnames(total_datapoints)
 

  #idx defining which points in the time series had fires
  # idx_fire = c(51,75,85,90)
  
  
  
  #create data points just for fire days:
  fire_datapoints <- rep(NA, length(total_datapoints))
  fire_datapoints[idx_fire] = total_datapoints[idx_fire]
  
  #create data point for no fire days:
  noFire_datapoints <- rep(NA, length(total_datapoints))
  noFire_datapoints[-idx_fire] = total_datapoints[-idx_fire]
  
  
  # data_to_plot = data.frame(fire_Data = fire_datapoints, noFire_data = noFire_datapoints)
  # boxplot(data_to_plot, main=title)
  # text(y = fivenum(fire_datapoints), labels = fivenum(fire_datapoints), x=0.5)
  # text(y = fivenum(noFire_datapoints), labels = fivenum(noFire_datapoints), x=2.5)
  #a signicance test for difference of medians between two data sets
  ww=wilcox.test(noFire_datapoints, fire_datapoints , alternative = c("less"))
  cc = (mean(na.omit(fire_datapoints)) - mean(na.omit(noFire_datapoints))) / mean(na.omit(noFire_datapoints))
  cat( title,"|", cc, "|", ww$p.value,"\n")
  
         
  #p-value = 0.04158
  #a p-value tells you the probability that the difference between these datasets could happen at random.
  #thus, a low p-value means these data are likely different, and that it did not happen by chance
  
}
