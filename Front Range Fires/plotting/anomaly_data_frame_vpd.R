n <- length(spring_vpd_anomaly)
dfvpd <- tibble(
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
  ),
  max_vpd_season = c(
    spring_max_vpd_anomaly,
    summer_max_vpd_anomaly,
    fall_max_vpd_anomaly,
    winter_max_vpd_anomaly
  ),
  max_vpd_season_fire = c(
    spring_max_vpd_fire_anomaly,
    summer_max_vpd_fire_anomaly,
    fall_max_vpd_fire_anomaly,
    winter_max_vpd_fire_anomaly
  ),
  max_vpd_season_fire_ma = c(
    spring_max_vpd_fire_ma_anomaly,
    summer_max_vpd_fire_ma_anomaly,
    fall_max_vpd_fire_ma_anomaly,
    winter_max_vpd_fire_ma_anomaly
  ),
  pct95_vpd_season = c(
    spring_pct95_vpd_anomaly,
    summer_pct95_vpd_anomaly,
    fall_pct95_vpd_anomaly,
    winter_pct95_vpd_anomaly
  ),
  pct95_vpd_season_fire = c(
    spring_pct95_vpd_fire_anomaly,
    summer_pct95_vpd_fire_anomaly,
    fall_pct95_vpd_fire_anomaly,
    winter_pct95_vpd_fire_anomaly
  ),
  pct95_vpd_season_fire_ma = c(
    spring_pct95_vpd_fire_ma_anomaly,
    summer_pct95_vpd_fire_ma_anomaly,
    fall_pct95_vpd_fire_ma_anomaly,
    winter_pct95_vpd_fire_ma_anomaly
  ),
  high_wind_vpd_season = c(
    spring_high_wind_vpd_mean_anomaly,
    summer_high_wind_vpd_mean_anomaly,
    fall_high_wind_vpd_mean_anomaly,
    winter_high_wind_vpd_mean_anomaly
  ),
  high_wind_vpd_season_fire = c(
    spring_high_wind_vpd_mean_fire_anomaly,
    summer_high_wind_vpd_mean_fire_anomaly,
    fall_high_wind_vpd_mean_fire_anomaly,
    winter_high_wind_vpd_mean_fire_anomaly
  ),
  high_wind_vpd_season_fire_ma = c(
    spring_high_wind_vpd_mean_fire_ma_anomaly,
    summer_high_wind_vpd_mean_fire_ma_anomaly,
    fall_high_wind_vpd_mean_fire_ma_anomaly,
    winter_high_wind_vpd_mean_fire_ma_anomaly
  ),
  high_wind_vpd_max_season = c(
    spring_high_wind_vpd_max_anomaly,
    summer_high_wind_vpd_max_anomaly,
    fall_high_wind_vpd_max_anomaly,
    winter_high_wind_vpd_max_anomaly
  ),
  high_wind_vpd_max_season_fire = c(
    spring_high_wind_vpd_max_fire_anomaly,
    summer_high_wind_vpd_max_fire_anomaly,
    fall_high_wind_vpd_max_fire_anomaly,
    winter_high_wind_vpd_max_fire_anomaly
  ),
  high_wind_vpd_max_season_fire_ma = c(
    spring_high_wind_vpd_mean_fire_ma_anomaly,
    summer_high_wind_vpd_mean_fire_ma_anomaly,
    fall_high_wind_vpd_mean_fire_ma_anomaly,
    winter_high_wind_vpd_mean_fire_ma_anomaly
  ),
  high_99wind_vpd_season = c(
    spring_high_99wind_vpd_mean_anomaly,
    summer_high_99wind_vpd_mean_anomaly,
    fall_high_99wind_vpd_mean_anomaly,
    winter_high_99wind_vpd_mean_anomaly
  ),
  high_99wind_vpd_season_fire = c(
    spring_high_99wind_vpd_mean_fire_anomaly,
    summer_high_99wind_vpd_mean_fire_anomaly,
    fall_high_99wind_vpd_mean_fire_anomaly,
    winter_high_99wind_vpd_mean_fire_anomaly
  ),
  high_99wind_vpd_season_fire_ma = c(
    spring_high_99wind_vpd_mean_fire_ma_anomaly,
    summer_high_99wind_vpd_mean_fire_ma_anomaly,
    fall_high_99wind_vpd_mean_fire_ma_anomaly,
    winter_high_99wind_vpd_mean_fire_ma_anomaly
  ),
  high_99wind_vpd_max_season = c(
    spring_high_99wind_vpd_max_anomaly,
    summer_high_99wind_vpd_max_anomaly,
    fall_high_99wind_vpd_max_anomaly,
    winter_high_99wind_vpd_max_anomaly
  ),
  high_99wind_vpd_max_season_fire = c(
    spring_high_99wind_vpd_max_fire_anomaly,
    summer_high_99wind_vpd_max_fire_anomaly,
    fall_high_99wind_vpd_max_fire_anomaly,
    winter_high_99wind_vpd_max_fire_anomaly
  ),
  high_99wind_vpd_max_season_fire_ma = c(
    spring_high_99wind_vpd_max_fire_ma_anomaly,
    summer_high_99wind_vpd_max_fire_ma_anomaly,
    fall_high_99wind_vpd_max_fire_ma_anomaly,
    winter_high_99wind_vpd_max_fire_ma_anomaly
  ),
  vpd_season_name = c(
    rep("spring_vpd_anomaly", n),
    rep("summer_vpd_anomaly", n),
    rep("fall_vpd_anomaly", n),
    rep("winter_vpd_anomaly", n)
  ),  
  max_vpd_season_name = c(
    rep("spring_vpd_max_anomaly", n),
    rep("summer_vpd_max_anomaly", n),
    rep("fall_vpd_max_anomaly", n),
    rep("winter_vpd_max_anomaly", n)
  ),
  pct95_vpd_season_name = c(
    rep("spring_pct95_vpd_anomaly", n),
    rep("summer_pct95_vpd_anomaly", n),
    rep("fall_pct95_vpd_anomaly", n),
    rep("winter_pct95_vpd_anomaly", n)
  ),
  high_wind_vpd_season_name = c(
    rep("spring_high_wind_vpd_anomaly", n),
    rep("summer_high_wind_vpd_anomaly", n),
    rep("fall_high_wind_vpd_anomaly", n),
    rep("winter_high_wind_vpd_anomaly", n)
  ),
  high_wind_vpd_max_season_name = c(
    rep("spring_high_wind_vpd_max_anomaly", n),
    rep("summer_high_wind_vpd_max_anomaly", n),
    rep("fall_high_wind_vpd_max_anomaly", n),
    rep("winter_high_wind_vpd_max_anomaly", n)
  ),
  high_99wind_vpd_season_name = c(
    rep("spring_99%_high_wind_vpd_anomaly", n),
    rep("summer_99%_high_wind_vpd_anomaly", n),
    rep("fall_99%_high_wind_vpd_anomaly", n),
    rep("winter_99%_high_wind_vpd_anomaly", n)
  ),  
  high_99wind_vpd_max_season_name = c(
    rep("spring_99%_high_wind_vpd_max_anomaly", n),
    rep("summer_99%_high_wind_vpd_max_anomaly", n),
    rep("fall_99%_high_wind_vpd_max_anomaly", n),
    rep("winter_99%_high_wind_vpd_max_anomaly", n)
  ),
  season_name = c(
    rep("spring", n),
    rep("summer", n),
    rep("fall", n),
    rep("winter", n)
  )
)