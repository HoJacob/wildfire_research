library(plotly)
library(tidyverse)
#Columns

xxx <- read.csv('~/Downloads/new_file.csv')
firedates = xxx$Time
print(firedates)

x <- read.csv('~/Downloads/VS84-21_average.csv')
mean_ws = x$GridMath.applyFunctionOverGrid2D.S
testDate = x$Time

store_fire_index = c()
idx_spring = c()
idx_summer = c()
idx_fall = c()
idx_winter = c()
idx_firespring = c()
idx_firesummer = c()
idx_firefall = c()
idx_firewinter = c()
start_ff = 1

for (fg in 1:length(testDate)) {
  mm=format(as.Date(testDate[fg], format = "%Y-%m-%d"),"%m")
  if (mm=="03" || mm=="04" || mm =="05") {
    idx_spring = rbind(idx_spring, fg)
  }
  if (mm=="06" || mm=="07" || mm =="08") {
    idx_summer = rbind(idx_summer, fg)
  }
  if (mm=="09" || mm=="10" || mm =="11") {
    idx_fall = rbind(idx_fall, fg)
  }
  if (mm=="12" || mm=="01" || mm =="02") {
    idx_winter = rbind(idx_winter, fg)
  }
}

for (fi in 1:length(firedates)) {
  mm=format(as.Date(firedates[fi], format = "%Y-%m-%d"),"%m")
  for (ff in start_ff:length(testDate)) {
    if (grepl(firedates[fi], testDate[ff])) {
      store_fire_index = rbind(store_fire_index, ff)
      if (mm=="03" || mm=="04" || mm =="05") {
        idx_firespring = rbind(idx_firespring, ff)
      }
      if (mm=="06" || mm=="07" || mm =="08") {
        idx_firesummer = rbind(idx_firesummer, ff)
      }
      if (mm=="09" || mm=="10" || mm =="11") {
        idx_firefall = rbind(idx_firefall, ff)
      }
      if (mm=="12" || mm=="01" || mm =="02") {
        idx_firewinter = rbind(idx_firewinter, ff)
      }
      start_ff = ff
      break
    }
  }
}
print(store_fire_index)
print(length(store_fire_index))
xx <- read.csv('~/Downloads/VS84-21_max.csv')
max_ws = xx$GridMath.applyFunctionOverGrid2D.S

y <- read.csv('~/Downloads/VPD84-21_average.csv')
mean_vpd = y$GridMath.applyFunctionOverGrid2D.S

yy <- read.csv('~/Downloads/VPD84-21_max.csv')
max_vpd = yy$GridMath.applyFunctionOverGrid2D.S

z <- read.csv('~/Downloads/VS-95PRCNTLA.csv')
pct95_wind = z$GridMath.applyFunctionOverLevels.S

a <- read.csv('~/Downloads/VPD-95PRCNTLA.csv')
pct95_vpd = a$PPPPP

b <- read.csv('~/Downloads/VPDAVERAGE-VS95PRCNTLA.csv')
high_wind_vpd_mean = b$GridMath.applyFunctionOverGrid2D.S

c <- read.csv('~/Downloads/VPDmax-VS95PRCNTLA.csv')
high_wind_vpd_max = c$GridMath.applyFunctionOverGrid2D.S

d <- read.csv('~/Downloads/VSaverage-VPD95PRCNTLA.csv')
high_vpd_ws_mean = d$GridMath.applyFunctionOverGrid2D.S

e <- read.csv('~/Downloads/VSmax-VPD95PRCNTLA.csv')
high_vpd_ws_max = e$GridMath.applyFunctionOverGrid2D.S

bb <- read.csv('~/Downloads/VPDAVERAGE-VS99PRCNTLA.csv')
high_99wind_vpd_mean = bb$GridMath.applyFunctionOverGrid2D.S

cc <- read.csv('~/Downloads/VPDmax-VS99PRCNTLA.csv')
high_99wind_vpd_max = cc$GridMath.applyFunctionOverGrid2D.S

dd <- read.csv('~/Downloads/VSaverage-VPD99PRCNTLA.csv')
high_99vpd_ws_mean = dd$GridMath.applyFunctionOverGrid2D.S

ee <- read.csv('~/Downloads/VSmax-VPD99PRCNTLA.csv')
high_99vpd_ws_max = ee$GridMath.applyFunctionOverGrid2D.S

Predictors <-
  cbind(
    testDate,
    mean_ws,
    max_ws,
    mean_vpd,
    max_vpd,
    pct95_wind,
    pct95_vpd,
    high_wind_vpd_mean,
    high_wind_vpd_max,
    high_vpd_ws_mean,
    high_vpd_ws_max,
    high_99wind_vpd_mean,
    high_99wind_vpd_max,
    high_99vpd_ws_mean,
    high_99vpd_ws_max
  )
mean_ws_fire <- rep(NA, length(mean_ws)) 
mean_ws_fire_ma <- rep(NA, length(mean_ws))
mean_ws_fire[store_fire_index] = mean_ws[store_fire_index]
mean_ws_fire_ma[length(mean_ws)-1] = mean_ws[length(mean_ws)-1]

max_ws_fire <- rep(NA, length(max_ws)) 
max_ws_fire[store_fire_index] = max_ws[store_fire_index]
max_ws_fire_ma <- rep(NA, length(max_ws)) 
max_ws_fire_ma[length(mean_ws)-1] = max_ws[length(mean_ws)-1]

pct95_wind_fire <- rep(NA, length(pct95_wind)) 
pct95_wind_fire[store_fire_index] = pct95_wind[store_fire_index]
pct95_wind_fire_ma <- rep(NA, length(pct95_wind)) 
pct95_wind_fire_ma[length(mean_ws)-1] = pct95_wind[length(mean_ws)-1]

high_vpd_ws_mean_fire <- rep(NA, length(high_vpd_ws_mean)) 
high_vpd_ws_mean_fire[store_fire_index] = high_vpd_ws_mean[store_fire_index]
high_vpd_ws_mean_fire_ma <- rep(NA, length(high_vpd_ws_mean)) 
high_vpd_ws_mean_fire_ma[length(high_vpd_ws_mean)-1] = high_vpd_ws_mean[length(high_vpd_ws_mean)-1]

high_vpd_ws_max_fire <- rep(NA, length(high_vpd_ws_max)) 
high_vpd_ws_max_fire[store_fire_index] = high_vpd_ws_max[store_fire_index]
high_vpd_ws_max_fire_ma <- rep(NA, length(high_vpd_ws_max)) 
high_vpd_ws_max_fire_ma[length(high_vpd_ws_max)-1] = high_vpd_ws_max[length(high_vpd_ws_max)-1]

high_99vpd_ws_mean_fire <- rep(NA, length(high_99vpd_ws_mean)) 
high_99vpd_ws_mean_fire[store_fire_index] = high_99vpd_ws_mean[store_fire_index]
high_99vpd_ws_mean_fire_ma <- rep(NA, length(high_99vpd_ws_mean)) 
high_99vpd_ws_mean_fire_ma[length(mean_ws)-1] = high_99vpd_ws_mean[length(mean_ws)-1]

high_99vpd_ws_max_fire <- rep(NA, length(high_99vpd_ws_max)) 
high_99vpd_ws_max_fire[store_fire_index] = high_99vpd_ws_max[store_fire_index]
high_99vpd_ws_max_fire_ma <- rep(NA, length(high_99vpd_ws_max)) 
high_99vpd_ws_max_fire_ma[length(mean_ws)-1] = high_99vpd_ws_max[length(mean_ws)-1]

n <- length(mean_ws)
df <- tibble(
  ws = c(
    mean_ws,
    max_ws,
    pct95_wind,
    high_vpd_ws_mean,
    high_vpd_ws_max,
    high_99vpd_ws_mean,
    high_99vpd_ws_max
  ),
  ws_fire = c(
    mean_ws_fire,
    max_ws_fire,
    pct95_wind_fire,
    high_vpd_ws_mean_fire,
    high_vpd_ws_max_fire,
    high_99vpd_ws_mean_fire,
    high_99vpd_ws_max_fire
  ),
  ws_fire_ma = c(
    mean_ws_fire_ma,
    max_ws_fire_ma,
    pct95_wind_fire_ma,
    high_vpd_ws_mean_fire_ma,
    high_vpd_ws_max_fire_ma,
    high_99vpd_ws_mean_fire_ma,
    high_99vpd_ws_max_fire_ma
  ),
  vpd = c(
    mean_vpd,
    max_vpd,
    pct95_vpd,
    high_wind_vpd_mean,
    high_wind_vpd_max,
    high_99wind_vpd_mean,
    high_99wind_vpd_max
  )
  ,
  ws_name = c(
    rep("mean_ws", n),
    rep("max_ws", n),
    rep("95pct_wind", n),
    rep("high_vpd_95pct_ws_mean", n),
    rep("high_vpd_95pct_ws_max", n),
    rep("high_vpd_99pct_ws_mean", n),
    rep("high_vpd_99pct_ws_max", n)
  ),
  vpd_name = c(
    rep("mean_vpd", n),
    rep("max_vpd", n),
    rep("pct95_vpd", n),
    rep("high_wind_95pct_vpd_mean", n),
    rep("high_wind_95pct_vpd_max", n),
    rep("high_wind_99pct_vpd_mean", n),
    rep("high_wind_99pct_vpd_max", n)
  )
)

df %>%
  ggplot(aes(x =  ws_name, y = ws)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_name, y = ws_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  ws_name, y = ws_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Wind Speed Predictors", x = "Wind Speed Predictors", y = "Wind Speed (m/s)")

df %>%
  ggplot(aes(x =  ws_name, y = ws)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_name, y = ws_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  ws_name, y = ws_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Wind Speed Predictors", x = "Wind Speed Predictors", y = "Wind Speed (m/s)")

df %>%
  ggplot(aes(x = vpd_name, y = vpd)) +
  geom_boxplot(width = 0.5, lwd = 1.5, aes(color = vpd_name)) +
  # geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(subtitle = "VPD")


plots.dir.path <- list.files(tempdir(), pattern="rs-graphics", full.names = TRUE) 
plots.png.paths <- list.files(plots.dir.path, pattern=".png", full.names = TRUE)

file.copy(from=plots.png.paths, to="~/Downloads")

#Anomaly Data
# (1) create a vector of nothing but NaN values that is the same length as your time series (e.g., empty_data <- rep(NA, length(WS))) 
# (2) define an index only corresponding to a given season (eg spring, idx_spring)
# (3) update the empty vector with anomaly values:
#   empty_data[idx_spring] = (original_ws_data[idx_spring] - mean(original_ws_data[idx_spring]) ) / std(original_ws_data[idx_spring])
# ... do this step for each of the 4 seasons.
# e.g.,:
#   original_ws_data[idx_fall] - mean(original_ws_data[idx_fall]) ) / std(original_ws_data[idx_fall])

#Wind Data
spring_ws_anomaly<- rep(NA, length(mean_ws))
summer_ws_anomaly<- rep(NA, length(mean_ws))
fall_ws_anomaly<- rep(NA, length(mean_ws))
winter_ws_anomaly<- rep(NA, length(mean_ws))

spring_ws_fire_anomaly<- rep(NA, length(mean_ws))
summer_ws_fire_anomaly<- rep(NA, length(mean_ws))
fall_ws_fire_anomaly<- rep(NA, length(mean_ws))
winter_ws_fire_anomaly<- rep(NA, length(mean_ws))

spring_ws_fire_ma_anomaly<- rep(NA, length(mean_ws))
summer_ws_fire_ma_anomaly<- rep(NA, length(mean_ws))
fall_ws_fire_ma_anomaly<- rep(NA, length(mean_ws))
winter_ws_fire_ma_anomaly<- rep(NA, length(mean_ws))

spring_ws_anomaly[idx_spring] = (mean_ws[idx_spring] - mean(mean_ws[idx_spring])) / sd(mean_ws[idx_spring])
summer_ws_anomaly[idx_summer] = (mean_ws[idx_summer] - mean(mean_ws[idx_summer])) / sd(mean_ws[idx_summer])
fall_ws_anomaly[idx_fall] = (mean_ws[idx_fall] - mean(mean_ws[idx_fall])) / sd(mean_ws[idx_fall])
winter_ws_anomaly[idx_winter] = (mean_ws[idx_winter] - mean(mean_ws[idx_winter])) / sd(mean_ws[idx_winter])

spring_ws_fire_anomaly[idx_firespring] = spring_ws_anomaly[idx_firespring]
summer_ws_fire_anomaly[idx_firesummer] = summer_ws_anomaly[idx_firesummer]
fall_ws_fire_anomaly[idx_firefall] = fall_ws_anomaly[idx_firefall]
winter_ws_fire_anomaly[idx_firewinter] = winter_ws_anomaly[idx_firewinter]

winter_ws_fire_ma_anomaly[length(winter_ws_fire_anomaly)-1]=winter_ws_anomaly[length(winter_ws_fire_anomaly)-1]

#Wind Data with high 95% VPD
spring_high_vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))
summer_high_vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))
fall_high_vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))
winter_high_vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))

spring_high_vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))
summer_high_vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))
fall_high_vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))
winter_high_vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))

spring_high_vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))
summer_high_vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))
fall_high_vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))
winter_high_vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))

spring_high_vpd_ws_mean_anomaly[idx_spring] = (high_vpd_ws_mean[idx_spring] - mean(high_vpd_ws_mean[idx_spring])) / sd(high_vpd_ws_mean[idx_spring])
summer_high_vpd_ws_mean_anomaly[idx_summer] = (high_vpd_ws_mean[idx_summer] - mean(high_vpd_ws_mean[idx_summer])) / sd(high_vpd_ws_mean[idx_summer])
fall_high_vpd_ws_mean_anomaly[idx_fall] = (high_vpd_ws_mean[idx_fall] - mean(high_vpd_ws_mean[idx_fall])) / sd(high_vpd_ws_mean[idx_fall])
winter_high_vpd_ws_mean_anomaly[idx_winter] = (high_vpd_ws_mean[idx_winter] - mean(high_vpd_ws_mean[idx_winter])) / sd(high_vpd_ws_mean[idx_winter])

spring_high_vpd_ws_mean_fire_anomaly[idx_firespring] = spring_high_vpd_ws_mean_anomaly[idx_firespring]
summer_high_vpd_ws_mean_fire_anomaly[idx_firesummer] = summer_high_vpd_ws_mean_anomaly[idx_firesummer]
fall_high_vpd_ws_mean_fire_anomaly[idx_firefall] = fall_high_vpd_ws_mean_anomaly[idx_firefall]
winter_high_vpd_ws_mean_fire_anomaly[idx_firewinter] = winter_high_vpd_ws_mean_anomaly[idx_firewinter]

winter_high_vpd_ws_mean_fire_ma_anomaly[length(winter_high_vpd_ws_mean_fire_anomaly)-1]=winter_high_vpd_ws_mean_anomaly[length(winter_high_vpd_ws_mean_fire_anomaly)-1]

#VPD Data
spring_vpd_anomaly<- rep(NA, length(mean_vpd))
summer_vpd_anomaly<- rep(NA, length(mean_vpd))
fall_vpd_anomaly<- rep(NA, length(mean_vpd))
winter_vpd_anomaly<- rep(NA, length(mean_vpd))

spring_vpd_fire_anomaly<- rep(NA, length(mean_vpd))
summer_vpd_fire_anomaly<- rep(NA, length(mean_vpd))
fall_vpd_fire_anomaly<- rep(NA, length(mean_vpd))
winter_vpd_fire_anomaly<- rep(NA, length(mean_vpd))

spring_vpd_fire_ma_anomaly<- rep(NA, length(mean_vpd))
summer_vpd_fire_ma_anomaly<- rep(NA, length(mean_vpd))
fall_vpd_fire_ma_anomaly<- rep(NA, length(mean_vpd))
winter_vpd_fire_ma_anomaly<- rep(NA, length(mean_vpd))

spring_vpd_anomaly[idx_spring] = (mean_vpd[idx_spring] - mean(mean_vpd[idx_spring])) / sd(mean_vpd[idx_spring])
summer_vpd_anomaly[idx_summer] = (mean_vpd[idx_summer] - mean(mean_vpd[idx_summer])) / sd(mean_vpd[idx_summer])
fall_vpd_anomaly[idx_fall] = (mean_vpd[idx_fall] - mean(mean_vpd[idx_fall])) / sd(mean_vpd[idx_fall])
winter_vpd_anomaly[idx_winter] = (mean_vpd[idx_winter] - mean(mean_vpd[idx_winter])) / sd(mean_vpd[idx_winter])

spring_vpd_fire_anomaly[idx_firespring] = spring_vpd_anomaly[idx_firespring]
summer_vpd_fire_anomaly[idx_firesummer] = summer_vpd_anomaly[idx_firesummer]
fall_vpd_fire_anomaly[idx_firefall] = fall_vpd_anomaly[idx_firefall]
winter_vpd_fire_anomaly[idx_firewinter] = winter_vpd_anomaly[idx_firewinter]

winter_vpd_fire_ma_anomaly[length(winter_vpd_fire_anomaly)-1]=winter_vpd_anomaly[length(winter_vpd_fire_anomaly)-1]

df <- tibble(
  ws_season = c(
    spring_ws_anomaly,
    summer_ws_anomaly,
    fall_ws_anomaly,
    winter_ws_anomaly
  ),
  ws_season_fire = c(
    spring_ws_fire_anomaly,
    summer_ws_fire_anomaly,
    fall_ws_fire_anomaly,
    winter_ws_fire_anomaly
  ),
  ws_season_fire_ma = c(
    spring_ws_fire_ma_anomaly,
    summer_ws_fire_ma_anomaly,
    fall_ws_fire_ma_anomaly,
    winter_ws_fire_ma_anomaly
  ),
  high_vpd_ws_season = c(
    spring_high_vpd_ws_mean_anomaly,
    summer_high_vpd_ws_mean_anomaly,
    fall_high_vpd_ws_mean_anomaly,
    winter_high_vpd_ws_mean_anomaly
  ),
  high_vpd_ws_season_fire = c(
    spring_high_vpd_ws_mean_fire_anomaly,
    summer_high_vpd_ws_mean_fire_anomaly,
    fall_high_vpd_ws_mean_fire_anomaly,
    winter_high_vpd_ws_mean_fire_anomaly
  ),
  high_vpd_ws_season_fire_ma = c(
    spring_high_vpd_ws_mean_fire_ma_anomaly,
    summer_high_vpd_ws_mean_fire_ma_anomaly,
    fall_high_vpd_ws_mean_fire_ma_anomaly,
    winter_high_vpd_ws_mean_fire_ma_anomaly
  ),
  vpd_season = c(
    spring_vpd_anomaly,
    summer_vpd_anomaly,
    fall_vpd_anomaly,
    winter_vpd_anomaly
  ),
  vpd_season_fire = c(
    spring_vpd_fire_anomaly,
    summer_vpd_fire_anomaly,
    fall_vpd_fire_anomaly,
    winter_vpd_fire_anomaly
  ),
  vpd_season_fire_ma = c(
    spring_vpd_fire_ma_anomaly,
    summer_vpd_fire_ma_anomaly,
    fall_vpd_fire_ma_anomaly,
    winter_vpd_fire_ma_anomaly
  )
  ,
  ws_season_name = c(
    rep("spring_ws_anomaly", n),
    rep("summer_ws_anomaly", n),
    rep("fall_ws_anomaly", n),
    rep("winter_ws_anomaly", n)
  ),
  high_vpd_ws_season_name = c(
    rep("spring_high_vpd_ws_anomaly", n),
    rep("summer_high_vpd_ws_anomaly", n),
    rep("fall_high_vpd_ws_anomaly", n),
    rep("winter_high_vpd_ws_anomaly", n)
  ),
  vpd_season_name = c(
    rep("spring_vpd_anomaly", n),
    rep("summer_vpd_anomaly", n),
    rep("fall_vpd_anomaly", n),
    rep("winter_vpd_anomaly", n)
  )
)


df %>%
  ggplot(aes(x =  ws_season_name, y = ws_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_season_name, y = ws_season_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  ws_season_name, y = ws_season_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Wind Speed Anomaly Data", x = "WS Anomaly Data", y='')

df %>%
  ggplot(aes(x =  high_vpd_ws_season_name, y = high_vpd_ws_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  high_vpd_ws_season_name, y = high_vpd_ws_season_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  high_vpd_ws_season_name, y = high_vpd_ws_season_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT VPD Wind Speed Anomaly Data", x = "WS Anomaly Data", y='')


df %>%
  ggplot(aes(x =  vpd_season_name, y = vpd_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  vpd_season_name, y = vpd_season_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  vpd_season_name, y = vpd_season_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Vapor Pressure Deficit Anomaly Data", x = "VPD  Anomaly Data", y='')




boxplot(
  spring_ws_anomaly,
  spring_vpd_anomaly,
  col = c("red", "orange"),
  xlab = "",
  ylab = "Spring WS and VPD anomalies",
  xaxt = "n",
  main = "Spring WS and VPD anomalies",
  horizontal = FALSE
)

fires<- rep(NA, length(mean_vpd))
fires[idx_firespring] = spring_vpd_anomaly[idx_firespring]


