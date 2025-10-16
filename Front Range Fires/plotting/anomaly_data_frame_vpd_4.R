dfvpd4 <- tibble(
  vpd_spring = c(
    spring_vpd_anomaly,
    spring_max_vpd_anomaly,
    spring_pct95_vpd_anomaly,
    spring_high_wind_vpd_mean_anomaly,
    spring_high_wind_vpd_max_anomaly,
    spring_high_99wind_vpd_mean_anomaly,
    spring_high_99wind_vpd_max_anomaly
  ),
  vpd_summer = c(
    summer_vpd_anomaly,
    summer_max_vpd_anomaly,
    summer_pct95_vpd_anomaly,
    summer_high_wind_vpd_mean_anomaly,
    summer_high_wind_vpd_max_anomaly,
    summer_high_99wind_vpd_mean_anomaly,
    summer_high_99wind_vpd_max_anomaly
  ),
  vpd_fall = c(
    fall_vpd_anomaly,
    fall_max_vpd_anomaly,
    fall_pct95_vpd_anomaly,
    fall_high_wind_vpd_mean_anomaly,
    fall_high_wind_vpd_max_anomaly,
    fall_high_99wind_vpd_mean_anomaly,
    fall_high_99wind_vpd_max_anomaly
  ),
  vpd_winter = c(
    winter_vpd_anomaly,
    winter_max_vpd_anomaly,
    winter_pct95_vpd_anomaly,
    winter_high_wind_vpd_mean_anomaly,
    winter_high_wind_vpd_max_anomaly,
    winter_high_99wind_vpd_mean_anomaly,
    winter_high_99wind_vpd_max_anomaly
  ),
  vpd_spring_fire = c(
    spring_vpd_fire_anomaly,
    spring_max_vpd_fire_anomaly,
    spring_pct95_vpd_fire_anomaly,
    spring_high_wind_vpd_mean_fire_anomaly,
    spring_high_wind_vpd_max_fire_anomaly,
    spring_high_99wind_vpd_mean_fire_anomaly,
    spring_high_99wind_vpd_max_fire_anomaly
  ),
  vpd_summer_fire = c(
    summer_vpd_fire_anomaly,
    summer_max_vpd_fire_anomaly,
    summer_pct95_vpd_fire_anomaly,
    summer_high_wind_vpd_mean_fire_anomaly,
    summer_high_wind_vpd_max_fire_anomaly,
    summer_high_99wind_vpd_mean_fire_anomaly,
    summer_high_99wind_vpd_max_fire_anomaly
  ),
  vpd_fall_fire = c(
    fall_vpd_fire_anomaly,
    fall_max_vpd_fire_anomaly,
    fall_pct95_vpd_fire_anomaly,
    fall_high_wind_vpd_mean_fire_anomaly,
    fall_high_wind_vpd_max_fire_anomaly,
    fall_high_99wind_vpd_mean_fire_anomaly,
    fall_high_99wind_vpd_max_fire_anomaly
  ),
  vpd_winter_fire = c(
    winter_vpd_fire_anomaly,
    winter_max_vpd_fire_anomaly,
    winter_pct95_vpd_fire_anomaly,
    winter_high_wind_vpd_mean_fire_anomaly,
    winter_high_wind_vpd_max_fire_anomaly,
    winter_high_99wind_vpd_mean_fire_anomaly,
    winter_high_99wind_vpd_max_fire_anomaly
  ),
  vpd_spring_fire_ma = c(
    spring_vpd_fire_ma_anomaly,
    spring_max_vpd_fire_ma_anomaly,
    spring_pct95_vpd_fire_ma_anomaly,
    spring_high_wind_vpd_mean_fire_ma_anomaly,
    spring_high_wind_vpd_max_fire_ma_anomaly,
    spring_high_99wind_vpd_mean_fire_ma_anomaly,
    spring_high_99wind_vpd_max_fire_ma_anomaly
  ),
  vpd_summer_fire_ma = c(
    summer_vpd_fire_ma_anomaly,
    summer_max_vpd_fire_ma_anomaly,
    summer_pct95_vpd_fire_ma_anomaly,
    summer_high_wind_vpd_mean_fire_ma_anomaly,
    summer_high_wind_vpd_max_fire_ma_anomaly,
    summer_high_99wind_vpd_mean_fire_ma_anomaly,
    summer_high_99wind_vpd_max_fire_ma_anomaly
  ),
  vpd_fall_fire_ma = c(
    fall_vpd_fire_ma_anomaly,
    fall_max_vpd_fire_ma_anomaly,
    fall_pct95_vpd_fire_ma_anomaly,
    fall_high_wind_vpd_mean_fire_ma_anomaly,
    fall_high_wind_vpd_max_fire_ma_anomaly,
    fall_high_99wind_vpd_mean_fire_ma_anomaly,
    fall_high_99wind_vpd_max_fire_ma_anomaly
  ),
  vpd_winter_fire_ma = c(
    winter_vpd_fire_ma_anomaly,
    winter_max_vpd_fire_ma_anomaly,
    winter_pct95_vpd_fire_ma_anomaly,
    winter_high_wind_vpd_mean_fire_ma_anomaly,
    winter_high_wind_vpd_max_fire_ma_anomaly,
    winter_high_99wind_vpd_mean_fire_ma_anomaly,
    winter_high_99wind_vpd_max_fire_ma_anomaly
  ),
  vpd_spring_name = c(
    rep("spring_vpd_anomaly", n),
    rep("spring_vpd_max_anomaly", n),
    rep("spring_pct95_vpd_anomaly", n),
    rep("spring_high_wind_vpd_anomaly", n),
    rep("spring_high_wind_vpd_max_anomaly", n),
    rep("spring_99%_high_wind_vpd_anomaly", n),
    rep("spring_99%_high_wind_vpd_max_anomaly", n)
  ),
  vpd_summer_name = c(
    rep("summer_vpd_anomaly", n),
    rep("summer_vpd_max_anomaly", n),
    rep("summer_pct95_vpd_anomaly", n),
    rep("summer_high_wind_vpd_anomaly", n),
    rep("summer_high_wind_vpd_max_anomaly", n),
    rep("summer_99%_high_wind_vpd_anomaly", n),
    rep("summer_99%_high_wind_vpd_max_anomaly", n)
  ),
  vpd_fall_name = c(
    rep("fall_vpd_anomaly", n),
    rep("fall_vpd_max_anomaly", n),
    rep("fall_pct95_vpd_anomaly", n),
    rep("fall_high_wind_vpd_anomaly", n),
    rep("fall_high_wind_vpd_max_anomaly", n),
    rep("fall_99%_high_wind_vpd_anomaly", n),
    rep("fall_99%_high_wind_vpd_max_anomaly", n)
  ),
  vpd_winter_name = c(
    rep("winter_vpd_anomaly", n),
    rep("winter_vpd_max_anomaly", n),
    rep("winter_pct95_vpd_anomaly", n),
    rep("winter_high_wind_vpd_anomaly", n),
    rep("winter_high_wind_vpd_max_anomaly", n),
    rep("winter_99%_high_wind_vpd_anomaly", n),
    rep("winter_99%_high_wind_vpd_max_anomaly", n)
  )
)