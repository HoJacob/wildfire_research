#Anomaly Data
# (1) create a vector of nothing but NaN values that is the same length as your time series (e.g., empty_data <- rep(NA, length(WS))) 
# (2) define an index only corresponding to a given season (eg spring, idx_spring)
# (3) update the empty vector with anomaly values:
#   empty_data[idx_spring] = (original_ws_data[idx_spring] - mean(original_ws_data[idx_spring]) ) / std(original_ws_data[idx_spring])
# ... do this step for each of the 4 seasons.
# e.g.,:
#   original_ws_data[idx_fall] - mean(original_ws_data[idx_fall]) ) / std(original_ws_data[idx_fall])

#MEAN Wind Data
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

#MAX Wind Data
spring_max_ws_anomaly<- rep(NA, length(max_ws))
summer_max_ws_anomaly<- rep(NA, length(max_ws))
fall_max_ws_anomaly<- rep(NA, length(max_ws))
winter_max_ws_anomaly<- rep(NA, length(max_ws))

spring_max_ws_fire_anomaly<- rep(NA, length(max_ws))
summer_max_ws_fire_anomaly<- rep(NA, length(max_ws))
fall_max_ws_fire_anomaly<- rep(NA, length(max_ws))
winter_max_ws_fire_anomaly<- rep(NA, length(max_ws))

spring_max_ws_fire_ma_anomaly<- rep(NA, length(max_ws))
summer_max_ws_fire_ma_anomaly<- rep(NA, length(max_ws))
fall_max_ws_fire_ma_anomaly<- rep(NA, length(max_ws))
winter_max_ws_fire_ma_anomaly<- rep(NA, length(max_ws))

spring_max_ws_anomaly[idx_spring] = (max_ws[idx_spring] - mean(max_ws[idx_spring])) / sd(max_ws[idx_spring])
summer_max_ws_anomaly[idx_summer] = (max_ws[idx_summer] - mean(max_ws[idx_summer])) / sd(max_ws[idx_summer])
fall_max_ws_anomaly[idx_fall] = (max_ws[idx_fall] - mean(max_ws[idx_fall])) / sd(max_ws[idx_fall])
winter_max_ws_anomaly[idx_winter] = (max_ws[idx_winter] - mean(max_ws[idx_winter])) / sd(max_ws[idx_winter])

spring_max_ws_fire_anomaly[idx_firespring] = spring_max_ws_anomaly[idx_firespring]
summer_max_ws_fire_anomaly[idx_firesummer] = summer_max_ws_anomaly[idx_firesummer]
fall_max_ws_fire_anomaly[idx_firefall] = fall_max_ws_anomaly[idx_firefall]
winter_max_ws_fire_anomaly[idx_firewinter] = winter_max_ws_anomaly[idx_firewinter]

winter_max_ws_fire_ma_anomaly[length(winter_max_ws_fire_anomaly)-1]=winter_max_ws_anomaly[length(winter_max_ws_fire_anomaly)-1]

#Wind Data
spring_pct95_wind_anomaly<- rep(NA, length(pct95_wind))
summer_pct95_wind_anomaly<- rep(NA, length(pct95_wind))
fall_pct95_wind_anomaly<- rep(NA, length(pct95_wind))
winter_pct95_wind_anomaly<- rep(NA, length(pct95_wind))

spring_pct95_wind_fire_anomaly<- rep(NA, length(pct95_wind))
summer_pct95_wind_fire_anomaly<- rep(NA, length(pct95_wind))
fall_pct95_wind_fire_anomaly<- rep(NA, length(pct95_wind))
winter_pct95_wind_fire_anomaly<- rep(NA, length(pct95_wind))

spring_pct95_wind_fire_ma_anomaly<- rep(NA, length(pct95_wind))
summer_pct95_wind_fire_ma_anomaly<- rep(NA, length(pct95_wind))
fall_pct95_wind_fire_ma_anomaly<- rep(NA, length(pct95_wind))
winter_pct95_wind_fire_ma_anomaly<- rep(NA, length(pct95_wind))

spring_pct95_wind_anomaly[idx_spring] = (pct95_wind[idx_spring] - mean(pct95_wind[idx_spring])) / sd(pct95_wind[idx_spring])
summer_pct95_wind_anomaly[idx_summer] = (pct95_wind[idx_summer] - mean(pct95_wind[idx_summer])) / sd(pct95_wind[idx_summer])
fall_pct95_wind_anomaly[idx_fall] = (pct95_wind[idx_fall] - mean(pct95_wind[idx_fall])) / sd(pct95_wind[idx_fall])
winter_pct95_wind_anomaly[idx_winter] = (pct95_wind[idx_winter] - mean(pct95_wind[idx_winter])) / sd(pct95_wind[idx_winter])

spring_pct95_wind_fire_anomaly[idx_firespring] = spring_pct95_wind_anomaly[idx_firespring]
summer_pct95_wind_fire_anomaly[idx_firesummer] = summer_pct95_wind_anomaly[idx_firesummer]
fall_pct95_wind_fire_anomaly[idx_firefall] = fall_pct95_wind_anomaly[idx_firefall]
winter_pct95_wind_fire_anomaly[idx_firewinter] = winter_pct95_wind_anomaly[idx_firewinter]

winter_pct95_wind_fire_ma_anomaly[length(winter_pct95_wind_fire_anomaly)-1]=winter_pct95_wind_anomaly[length(winter_ws_fire_anomaly)-1]


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

#Wind Data with high 95% VPD
spring_high_vpd_ws_max_anomaly<- rep(NA, length(mean_ws))
summer_high_vpd_ws_max_anomaly<- rep(NA, length(mean_ws))
fall_high_vpd_ws_max_anomaly<- rep(NA, length(mean_ws))
winter_high_vpd_ws_max_anomaly<- rep(NA, length(mean_ws))

spring_high_vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))
summer_high_vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))
fall_high_vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))
winter_high_vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))

spring_high_vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))
summer_high_vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))
fall_high_vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))
winter_high_vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))

spring_high_vpd_ws_max_anomaly[idx_spring] = (high_vpd_ws_max[idx_spring] - mean(high_vpd_ws_max[idx_spring])) / sd(high_vpd_ws_max[idx_spring])
summer_high_vpd_ws_max_anomaly[idx_summer] = (high_vpd_ws_max[idx_summer] - mean(high_vpd_ws_max[idx_summer])) / sd(high_vpd_ws_max[idx_summer])
fall_high_vpd_ws_max_anomaly[idx_fall] = (high_vpd_ws_max[idx_fall] - mean(high_vpd_ws_max[idx_fall])) / sd(high_vpd_ws_max[idx_fall])
winter_high_vpd_ws_max_anomaly[idx_winter] = (high_vpd_ws_max[idx_winter] - mean(high_vpd_ws_max[idx_winter])) / sd(high_vpd_ws_max[idx_winter])

spring_high_vpd_ws_max_fire_anomaly[idx_firespring] = spring_high_vpd_ws_max_anomaly[idx_firespring]
summer_high_vpd_ws_max_fire_anomaly[idx_firesummer] = summer_high_vpd_ws_max_anomaly[idx_firesummer]
fall_high_vpd_ws_max_fire_anomaly[idx_firefall] = fall_high_vpd_ws_max_anomaly[idx_firefall]
winter_high_vpd_ws_max_fire_anomaly[idx_firewinter] = winter_high_vpd_ws_max_anomaly[idx_firewinter]

winter_high_vpd_ws_max_fire_ma_anomaly[length(winter_high_vpd_ws_max_fire_anomaly)-1]=winter_high_vpd_ws_max_anomaly[length(winter_high_vpd_ws_max_fire_anomaly)-1]

#Wind Data with high 99% VPD
spring_high_99vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))
summer_high_99vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))
fall_high_99vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))
winter_high_99vpd_ws_mean_anomaly<- rep(NA, length(mean_ws))

spring_high_99vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))
summer_high_99vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))
fall_high_99vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))
winter_high_99vpd_ws_mean_fire_anomaly<- rep(NA, length(mean_ws))

spring_high_99vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))
summer_high_99vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))
fall_high_99vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))
winter_high_99vpd_ws_mean_fire_ma_anomaly<- rep(NA, length(mean_ws))

spring_high_99vpd_ws_mean_anomaly[idx_spring] = (high_99vpd_ws_mean[idx_spring] - mean(high_99vpd_ws_mean[idx_spring])) / sd(high_99vpd_ws_mean[idx_spring])
summer_high_99vpd_ws_mean_anomaly[idx_summer] = (high_99vpd_ws_mean[idx_summer] - mean(high_99vpd_ws_mean[idx_summer])) / sd(high_99vpd_ws_mean[idx_summer])
fall_high_99vpd_ws_mean_anomaly[idx_fall] = (high_99vpd_ws_mean[idx_fall] - mean(high_99vpd_ws_mean[idx_fall])) / sd(high_99vpd_ws_mean[idx_fall])
winter_high_99vpd_ws_mean_anomaly[idx_winter] = (high_99vpd_ws_mean[idx_winter] - mean(high_99vpd_ws_mean[idx_winter])) / sd(high_99vpd_ws_mean[idx_winter])

spring_high_99vpd_ws_mean_fire_anomaly[idx_firespring] = spring_high_99vpd_ws_mean_anomaly[idx_firespring]
summer_high_99vpd_ws_mean_fire_anomaly[idx_firesummer] = summer_high_99vpd_ws_mean_anomaly[idx_firesummer]
fall_high_99vpd_ws_mean_fire_anomaly[idx_firefall] = fall_high_99vpd_ws_mean_anomaly[idx_firefall]
winter_high_99vpd_ws_mean_fire_anomaly[idx_firewinter] = winter_high_99vpd_ws_mean_anomaly[idx_firewinter]

winter_high_99vpd_ws_mean_fire_ma_anomaly[length(winter_high_99vpd_ws_mean_fire_anomaly)-1]=winter_high_99vpd_ws_mean_anomaly[length(winter_high_99vpd_ws_mean_fire_anomaly)-1]


#Wind Data with high 99% VPD
spring_high_99vpd_ws_max_anomaly<- rep(NA, length(mean_ws))
summer_high_99vpd_ws_max_anomaly<- rep(NA, length(mean_ws))
fall_high_99vpd_ws_max_anomaly<- rep(NA, length(mean_ws))
winter_high_99vpd_ws_max_anomaly<- rep(NA, length(mean_ws))

spring_high_99vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))
summer_high_99vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))
fall_high_99vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))
winter_high_99vpd_ws_max_fire_anomaly<- rep(NA, length(mean_ws))

spring_high_99vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))
summer_high_99vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))
fall_high_99vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))
winter_high_99vpd_ws_max_fire_ma_anomaly<- rep(NA, length(mean_ws))

spring_high_99vpd_ws_max_anomaly[idx_spring] = (high_99vpd_ws_max[idx_spring] - mean(high_99vpd_ws_max[idx_spring])) / sd(high_99vpd_ws_max[idx_spring])
summer_high_99vpd_ws_max_anomaly[idx_summer] = (high_99vpd_ws_max[idx_summer] - mean(high_99vpd_ws_max[idx_summer])) / sd(high_99vpd_ws_max[idx_summer])
fall_high_99vpd_ws_max_anomaly[idx_fall] = (high_99vpd_ws_max[idx_fall] - mean(high_99vpd_ws_max[idx_fall])) / sd(high_99vpd_ws_max[idx_fall])
winter_high_99vpd_ws_max_anomaly[idx_winter] = (high_99vpd_ws_max[idx_winter] - mean(high_99vpd_ws_max[idx_winter])) / sd(high_99vpd_ws_max[idx_winter])

spring_high_99vpd_ws_max_fire_anomaly[idx_firespring] = spring_high_99vpd_ws_max_anomaly[idx_firespring]
summer_high_99vpd_ws_max_fire_anomaly[idx_firesummer] = summer_high_99vpd_ws_max_anomaly[idx_firesummer]
fall_high_99vpd_ws_max_fire_anomaly[idx_firefall] = fall_high_99vpd_ws_max_anomaly[idx_firefall]
winter_high_99vpd_ws_max_fire_anomaly[idx_firewinter] = winter_high_99vpd_ws_max_anomaly[idx_firewinter]

winter_high_99vpd_ws_max_fire_ma_anomaly[length(winter_high_99vpd_ws_max_fire_anomaly)-1]=winter_high_99vpd_ws_max_anomaly[length(winter_high_99vpd_ws_max_fire_anomaly)-1]
