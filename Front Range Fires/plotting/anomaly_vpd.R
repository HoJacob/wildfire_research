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

#MAX VPD Data
spring_max_vpd_anomaly<- rep(NA, length(max_vpd))
summer_max_vpd_anomaly<- rep(NA, length(max_vpd))
fall_max_vpd_anomaly<- rep(NA, length(max_vpd))
winter_max_vpd_anomaly<- rep(NA, length(max_vpd))

spring_max_vpd_fire_anomaly<- rep(NA, length(max_vpd))
summer_max_vpd_fire_anomaly<- rep(NA, length(max_vpd))
fall_max_vpd_fire_anomaly<- rep(NA, length(max_vpd))
winter_max_vpd_fire_anomaly<- rep(NA, length(max_vpd))

spring_max_vpd_fire_ma_anomaly<- rep(NA, length(max_vpd))
summer_max_vpd_fire_ma_anomaly<- rep(NA, length(max_vpd))
fall_max_vpd_fire_ma_anomaly<- rep(NA, length(max_vpd))
winter_max_vpd_fire_ma_anomaly<- rep(NA, length(max_vpd))

spring_max_vpd_anomaly[idx_spring] = (max_vpd[idx_spring] - mean(max_vpd[idx_spring])) / sd(max_vpd[idx_spring])
summer_max_vpd_anomaly[idx_summer] = (max_vpd[idx_summer] - mean(max_vpd[idx_summer])) / sd(max_vpd[idx_summer])
fall_max_vpd_anomaly[idx_fall] = (max_vpd[idx_fall] - mean(max_vpd[idx_fall])) / sd(max_vpd[idx_fall])
winter_max_vpd_anomaly[idx_winter] = (max_vpd[idx_winter] - mean(max_vpd[idx_winter])) / sd(max_vpd[idx_winter])

spring_max_vpd_fire_anomaly[idx_firespring] = spring_max_vpd_anomaly[idx_firespring]
summer_max_vpd_fire_anomaly[idx_firesummer] = summer_max_vpd_anomaly[idx_firesummer]
fall_max_vpd_fire_anomaly[idx_firefall] = fall_max_vpd_anomaly[idx_firefall]
winter_max_vpd_fire_anomaly[idx_firewinter] = winter_max_vpd_anomaly[idx_firewinter]

winter_max_vpd_fire_ma_anomaly[length(winter_max_vpd_fire_anomaly)-1]=winter_max_vpd_anomaly[length(winter_vpd_fire_anomaly)-1]

#PCT95 VPD Data
spring_pct95_vpd_anomaly<- rep(NA, length(pct95_vpd))
summer_pct95_vpd_anomaly<- rep(NA, length(pct95_vpd))
fall_pct95_vpd_anomaly<- rep(NA, length(pct95_vpd))
winter_pct95_vpd_anomaly<- rep(NA, length(pct95_vpd))

spring_pct95_vpd_fire_anomaly<- rep(NA, length(pct95_vpd))
summer_pct95_vpd_fire_anomaly<- rep(NA, length(pct95_vpd))
fall_pct95_vpd_fire_anomaly<- rep(NA, length(pct95_vpd))
winter_pct95_vpd_fire_anomaly<- rep(NA, length(pct95_vpd))

spring_pct95_vpd_fire_ma_anomaly<- rep(NA, length(pct95_vpd))
summer_pct95_vpd_fire_ma_anomaly<- rep(NA, length(pct95_vpd))
fall_pct95_vpd_fire_ma_anomaly<- rep(NA, length(pct95_vpd))
winter_pct95_vpd_fire_ma_anomaly<- rep(NA, length(pct95_vpd))

spring_pct95_vpd_anomaly[idx_spring] = (pct95_vpd[idx_spring] - mean(pct95_vpd[idx_spring])) / sd(pct95_vpd[idx_spring])
summer_pct95_vpd_anomaly[idx_summer] = (pct95_vpd[idx_summer] - mean(pct95_vpd[idx_summer])) / sd(pct95_vpd[idx_summer])
fall_pct95_vpd_anomaly[idx_fall] = (pct95_vpd[idx_fall] - mean(pct95_vpd[idx_fall])) / sd(pct95_vpd[idx_fall])
winter_pct95_vpd_anomaly[idx_winter] = (pct95_vpd[idx_winter] - mean(pct95_vpd[idx_winter])) / sd(pct95_vpd[idx_winter])

spring_pct95_vpd_fire_anomaly[idx_firespring] = spring_pct95_vpd_anomaly[idx_firespring]
summer_pct95_vpd_fire_anomaly[idx_firesummer] = summer_pct95_vpd_anomaly[idx_firesummer]
fall_pct95_vpd_fire_anomaly[idx_firefall] = fall_pct95_vpd_anomaly[idx_firefall]
winter_pct95_vpd_fire_anomaly[idx_firewinter] = winter_pct95_vpd_anomaly[idx_firewinter]

winter_pct95_vpd_fire_ma_anomaly[length(winter_pct95_vpd_fire_anomaly)-1]=winter_pct95_vpd_anomaly[length(winter_vpd_fire_anomaly)-1]

#Wind Data with high 95% VPD
spring_high_wind_vpd_mean_anomaly<- rep(NA, length(high_wind_vpd_mean))
summer_high_wind_vpd_mean_anomaly<- rep(NA, length(high_wind_vpd_mean))
fall_high_wind_vpd_mean_anomaly<- rep(NA, length(high_wind_vpd_mean))
winter_high_wind_vpd_mean_anomaly<- rep(NA, length(high_wind_vpd_mean))

spring_high_wind_vpd_mean_fire_anomaly<- rep(NA, length(high_wind_vpd_mean))
summer_high_wind_vpd_mean_fire_anomaly<- rep(NA, length(high_wind_vpd_mean))
fall_high_wind_vpd_mean_fire_anomaly<- rep(NA, length(high_wind_vpd_mean))
winter_high_wind_vpd_mean_fire_anomaly<- rep(NA, length(high_wind_vpd_mean))

spring_high_wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_mean))
summer_high_wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_mean))
fall_high_wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_mean))
winter_high_wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_mean))

spring_high_wind_vpd_mean_anomaly[idx_spring] = (high_wind_vpd_mean[idx_spring] - mean(high_wind_vpd_mean[idx_spring])) / sd(high_wind_vpd_mean[idx_spring])
summer_high_wind_vpd_mean_anomaly[idx_summer] = (high_wind_vpd_mean[idx_summer] - mean(high_wind_vpd_mean[idx_summer])) / sd(high_wind_vpd_mean[idx_summer])
fall_high_wind_vpd_mean_anomaly[idx_fall] = (high_wind_vpd_mean[idx_fall] - mean(high_wind_vpd_mean[idx_fall])) / sd(high_wind_vpd_mean[idx_fall])
winter_high_wind_vpd_mean_anomaly[idx_winter] = (high_wind_vpd_mean[idx_winter] - mean(high_wind_vpd_mean[idx_winter])) / sd(high_wind_vpd_mean[idx_winter])

spring_high_wind_vpd_mean_fire_anomaly[idx_firespring] = spring_high_wind_vpd_mean_anomaly[idx_firespring]
summer_high_wind_vpd_mean_fire_anomaly[idx_firesummer] = summer_high_wind_vpd_mean_anomaly[idx_firesummer]
fall_high_wind_vpd_mean_fire_anomaly[idx_firefall] = fall_high_wind_vpd_mean_anomaly[idx_firefall]
winter_high_wind_vpd_mean_fire_anomaly[idx_firewinter] = winter_high_wind_vpd_mean_anomaly[idx_firewinter]

winter_high_wind_vpd_mean_fire_ma_anomaly[length(winter_high_wind_vpd_mean_fire_anomaly)-1]=winter_high_wind_vpd_mean_anomaly[length(winter_high_wind_vpd_mean_fire_anomaly)-1]

#Wind Data with high 95% VPD
spring_high_wind_vpd_max_anomaly<- rep(NA, length(high_wind_vpd_max))
summer_high_wind_vpd_max_anomaly<- rep(NA, length(high_wind_vpd_max))
fall_high_wind_vpd_max_anomaly<- rep(NA, length(high_wind_vpd_max))
winter_high_wind_vpd_max_anomaly<- rep(NA, length(high_wind_vpd_max))

spring_high_wind_vpd_max_fire_anomaly<- rep(NA, length(high_wind_vpd_max))
summer_high_wind_vpd_max_fire_anomaly<- rep(NA, length(high_wind_vpd_max))
fall_high_wind_vpd_max_fire_anomaly<- rep(NA, length(high_wind_vpd_max))
winter_high_wind_vpd_max_fire_anomaly<- rep(NA, length(high_wind_vpd_max))

spring_high_wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_max))
summer_high_wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_max))
fall_high_wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_max))
winter_high_wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_wind_vpd_max))

spring_high_wind_vpd_max_anomaly[idx_spring] = (high_wind_vpd_max[idx_spring] - mean(high_wind_vpd_max[idx_spring])) / sd(high_wind_vpd_max[idx_spring])
summer_high_wind_vpd_max_anomaly[idx_summer] = (high_wind_vpd_max[idx_summer] - mean(high_wind_vpd_max[idx_summer])) / sd(high_wind_vpd_max[idx_summer])
fall_high_wind_vpd_max_anomaly[idx_fall] = (high_wind_vpd_max[idx_fall] - mean(high_wind_vpd_max[idx_fall])) / sd(high_wind_vpd_max[idx_fall])
winter_high_wind_vpd_max_anomaly[idx_winter] = (high_wind_vpd_max[idx_winter] - mean(high_wind_vpd_max[idx_winter])) / sd(high_wind_vpd_max[idx_winter])

spring_high_wind_vpd_max_fire_anomaly[idx_firespring] = spring_high_wind_vpd_max_anomaly[idx_firespring]
summer_high_wind_vpd_max_fire_anomaly[idx_firesummer] = summer_high_wind_vpd_max_anomaly[idx_firesummer]
fall_high_wind_vpd_max_fire_anomaly[idx_firefall] = fall_high_wind_vpd_max_anomaly[idx_firefall]
winter_high_wind_vpd_max_fire_anomaly[idx_firewinter] = winter_high_wind_vpd_max_anomaly[idx_firewinter]

winter_high_wind_vpd_max_fire_ma_anomaly[length(winter_high_wind_vpd_max_fire_anomaly)-1]=winter_high_wind_vpd_max_anomaly[length(winter_high_wind_vpd_max_fire_anomaly)-1]

#Wind Data with high 99% VPD
spring_high_99wind_vpd_mean_anomaly<- rep(NA, length(high_99wind_vpd_mean))
summer_high_99wind_vpd_mean_anomaly<- rep(NA, length(high_99wind_vpd_mean))
fall_high_99wind_vpd_mean_anomaly<- rep(NA, length(high_99wind_vpd_mean))
winter_high_99wind_vpd_mean_anomaly<- rep(NA, length(high_99wind_vpd_mean))

spring_high_99wind_vpd_mean_fire_anomaly<- rep(NA, length(high_99wind_vpd_mean))
summer_high_99wind_vpd_mean_fire_anomaly<- rep(NA, length(high_99wind_vpd_mean))
fall_high_99wind_vpd_mean_fire_anomaly<- rep(NA, length(high_99wind_vpd_mean))
winter_high_99wind_vpd_mean_fire_anomaly<- rep(NA, length(high_99wind_vpd_mean))

spring_high_99wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_mean))
summer_high_99wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_mean))
fall_high_99wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_mean))
winter_high_99wind_vpd_mean_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_mean))

spring_high_99wind_vpd_mean_anomaly[idx_spring] = (high_99wind_vpd_mean[idx_spring] - mean(high_99wind_vpd_mean[idx_spring], na.rm=TRUE)) / sd(high_99wind_vpd_mean[idx_spring], na.rm=TRUE)
summer_high_99wind_vpd_mean_anomaly[idx_summer] = (high_99wind_vpd_mean[idx_summer] - mean(high_99wind_vpd_mean[idx_summer], na.rm=TRUE)) / sd(high_99wind_vpd_mean[idx_summer], na.rm=TRUE)
fall_high_99wind_vpd_mean_anomaly[idx_fall] = (high_99wind_vpd_mean[idx_fall] - mean(high_99wind_vpd_mean[idx_fall], na.rm=TRUE)) / sd(high_99wind_vpd_mean[idx_fall], na.rm=TRUE)
winter_high_99wind_vpd_mean_anomaly[idx_winter] = (high_99wind_vpd_mean[idx_winter] - mean(high_99wind_vpd_mean[idx_winter], na.rm=TRUE)) / sd(high_99wind_vpd_mean[idx_winter], na.rm=TRUE)

spring_high_99wind_vpd_mean_fire_anomaly[idx_firespring] = spring_high_99wind_vpd_mean_anomaly[idx_firespring]
summer_high_99wind_vpd_mean_fire_anomaly[idx_firesummer] = summer_high_99wind_vpd_mean_anomaly[idx_firesummer]
fall_high_99wind_vpd_mean_fire_anomaly[idx_firefall] = fall_high_99wind_vpd_mean_anomaly[idx_firefall]
winter_high_99wind_vpd_mean_fire_anomaly[idx_firewinter] = winter_high_99wind_vpd_mean_anomaly[idx_firewinter]

winter_high_99wind_vpd_mean_fire_ma_anomaly[length(winter_high_99wind_vpd_mean_fire_anomaly)-1]=winter_high_99wind_vpd_mean_anomaly[length(winter_high_99wind_vpd_mean_fire_anomaly)-1]

#Wind Data with high 99% VPD
spring_high_99wind_vpd_max_anomaly<- rep(NA, length(high_99wind_vpd_max))
summer_high_99wind_vpd_max_anomaly<- rep(NA, length(high_99wind_vpd_max))
fall_high_99wind_vpd_max_anomaly<- rep(NA, length(high_99wind_vpd_max))
winter_high_99wind_vpd_max_anomaly<- rep(NA, length(high_99wind_vpd_max))

spring_high_99wind_vpd_max_fire_anomaly<- rep(NA, length(high_99wind_vpd_max))
summer_high_99wind_vpd_max_fire_anomaly<- rep(NA, length(high_99wind_vpd_max))
fall_high_99wind_vpd_max_fire_anomaly<- rep(NA, length(high_99wind_vpd_max))
winter_high_99wind_vpd_max_fire_anomaly<- rep(NA, length(high_99wind_vpd_max))

spring_high_99wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_max))
summer_high_99wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_max))
fall_high_99wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_max))
winter_high_99wind_vpd_max_fire_ma_anomaly<- rep(NA, length(high_99wind_vpd_max))

spring_high_99wind_vpd_max_anomaly[idx_spring] = (high_99wind_vpd_max[idx_spring] - mean(high_99wind_vpd_max[idx_spring])) / sd(high_99wind_vpd_max[idx_spring])
summer_high_99wind_vpd_max_anomaly[idx_summer] = (high_99wind_vpd_max[idx_summer] - mean(high_99wind_vpd_max[idx_summer])) / sd(high_99wind_vpd_max[idx_summer])
fall_high_99wind_vpd_max_anomaly[idx_fall] = (high_99wind_vpd_max[idx_fall] - mean(high_99wind_vpd_max[idx_fall])) / sd(high_99wind_vpd_max[idx_fall])
winter_high_99wind_vpd_max_anomaly[idx_winter] = (high_99wind_vpd_max[idx_winter] - mean(high_99wind_vpd_max[idx_winter])) / sd(high_99wind_vpd_max[idx_winter])

spring_high_99wind_vpd_max_fire_anomaly[idx_firespring] = spring_high_99wind_vpd_max_anomaly[idx_firespring]
summer_high_99wind_vpd_max_fire_anomaly[idx_firesummer] = summer_high_99wind_vpd_max_anomaly[idx_firesummer]
fall_high_99wind_vpd_max_fire_anomaly[idx_firefall] = fall_high_99wind_vpd_max_anomaly[idx_firefall]
winter_high_99wind_vpd_max_fire_anomaly[idx_firewinter] = winter_high_99wind_vpd_max_anomaly[idx_firewinter]

winter_high_99wind_vpd_max_fire_ma_anomaly[length(winter_high_99wind_vpd_max_fire_anomaly)-1]=winter_high_99wind_vpd_max_anomaly[length(winter_high_99wind_vpd_max_fire_anomaly)-1]
