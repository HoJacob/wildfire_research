dfws <- tibble(
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
  max_ws_season = c(
    spring_max_ws_anomaly,
    summer_max_ws_anomaly,
    fall_max_ws_anomaly,
    winter_max_ws_anomaly
  ),
  max_ws_season_fire = c(
    spring_max_ws_fire_anomaly,
    summer_max_ws_fire_anomaly,
    fall_max_ws_fire_anomaly,
    winter_max_ws_fire_anomaly
  ),
  max_ws_season_fire_ma = c(
    spring_max_ws_fire_ma_anomaly,
    summer_max_ws_fire_ma_anomaly,
    fall_max_ws_fire_ma_anomaly,
    winter_max_ws_fire_ma_anomaly
  ),
  pct95_wind_season = c(
    spring_pct95_wind_anomaly,
    summer_pct95_wind_anomaly,
    fall_pct95_wind_anomaly,
    winter_pct95_wind_anomaly
  ),
  pct95_wind_season_fire = c(
    spring_pct95_wind_fire_anomaly,
    summer_pct95_wind_fire_anomaly,
    fall_pct95_wind_fire_anomaly,
    winter_pct95_wind_fire_anomaly
  ),
  pct95_wind_season_fire_ma = c(
    spring_pct95_wind_fire_ma_anomaly,
    summer_pct95_wind_fire_ma_anomaly,
    fall_pct95_wind_fire_ma_anomaly,
    winter_pct95_wind_fire_ma_anomaly
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
  high_vpd_ws_max_season = c(
    spring_high_vpd_ws_max_anomaly,
    summer_high_vpd_ws_max_anomaly,
    fall_high_vpd_ws_max_anomaly,
    winter_high_vpd_ws_max_anomaly
  ),
  high_vpd_ws_max_season_fire = c(
    spring_high_vpd_ws_max_fire_anomaly,
    summer_high_vpd_ws_max_fire_anomaly,
    fall_high_vpd_ws_max_fire_anomaly,
    winter_high_vpd_ws_max_fire_anomaly
  ),
  high_vpd_ws_max_season_fire_ma = c(
    spring_high_vpd_ws_mean_fire_ma_anomaly,
    summer_high_vpd_ws_mean_fire_ma_anomaly,
    fall_high_vpd_ws_mean_fire_ma_anomaly,
    winter_high_vpd_ws_mean_fire_ma_anomaly
  ),
  high_99vpd_ws_season = c(
    spring_high_99vpd_ws_mean_anomaly,
    summer_high_99vpd_ws_mean_anomaly,
    fall_high_99vpd_ws_mean_anomaly,
    winter_high_99vpd_ws_mean_anomaly
  ),
  high_99vpd_ws_season_fire = c(
    spring_high_99vpd_ws_mean_fire_anomaly,
    summer_high_99vpd_ws_mean_fire_anomaly,
    fall_high_99vpd_ws_mean_fire_anomaly,
    winter_high_99vpd_ws_mean_fire_anomaly
  ),
  high_99vpd_ws_season_fire_ma = c(
    spring_high_vpd_ws_mean_fire_ma_anomaly,
    summer_high_vpd_ws_mean_fire_ma_anomaly,
    fall_high_vpd_ws_mean_fire_ma_anomaly,
    winter_high_vpd_ws_mean_fire_ma_anomaly
  ),
  high_99vpd_ws_max_season = c(
    spring_high_99vpd_ws_max_anomaly,
    summer_high_99vpd_ws_max_anomaly,
    fall_high_99vpd_ws_max_anomaly,
    winter_high_99vpd_ws_max_anomaly
  ),
  high_99vpd_ws_max_season_fire = c(
    spring_high_99vpd_ws_max_fire_anomaly,
    summer_high_99vpd_ws_max_fire_anomaly,
    fall_high_99vpd_ws_max_fire_anomaly,
    winter_high_99vpd_ws_max_fire_anomaly
  ),
  high_99vpd_ws_max_season_fire_ma = c(
    spring_high_99vpd_ws_max_fire_ma_anomaly,
    summer_high_99vpd_ws_max_fire_ma_anomaly,
    fall_high_99vpd_ws_max_fire_ma_anomaly,
    winter_high_99vpd_ws_max_fire_ma_anomaly
  ),
  ws_season_name = c(
    rep("spring_ws_anomaly", n),
    rep("summer_ws_anomaly", n),
    rep("fall_ws_anomaly", n),
    rep("winter_ws_anomaly", n)
  ),
  max_ws_season_name = c(
    rep("spring_ws_max_anomaly", n),
    rep("summer_ws_max_anomaly", n),
    rep("fall_ws_max_anomaly", n),
    rep("winter_ws_max_anomaly", n)
  ),
  pct95_wind_season_name = c(
    rep("spring_pct95_wind_anomaly", n),
    rep("summer_pct95_wind_anomaly", n),
    rep("fall_pct95_wind_anomaly", n),
    rep("winter_pct95_wind_anomaly", n)
  ),
  high_vpd_ws_season_name = c(
    rep("spring_high_vpd_ws_anomaly", n),
    rep("summer_high_vpd_ws_anomaly", n),
    rep("fall_high_vpd_ws_anomaly", n),
    rep("winter_high_vpd_ws_anomaly", n)
  ),
  high_vpd_ws_max_season_name = c(
    rep("spring_high_vpd_ws_max_anomaly", n),
    rep("summer_high_vpd_ws_max_anomaly", n),
    rep("fall_high_vpd_ws_max_anomaly", n),
    rep("winter_high_vpd_ws_max_anomaly", n)
  ),
  high99_vpd_ws_season_name = c(
    rep("spring_99%_high_vpd_ws_anomaly", n),
    rep("summer_99%_high_vpd_ws_anomaly", n),
    rep("fall_99%_high_vpd_ws_anomaly", n),
    rep("winter_99%_high_vpd_ws_anomaly", n)
  ),  
  high99_vpd_ws_max_season_name = c(
    rep("spring_99%_high_vpd_ws_max_anomaly", n),
    rep("summer_99%_high_vpd_ws_max_anomaly", n),
    rep("fall_99%_high_vpd_ws_max_anomaly", n),
    rep("winter_99%_high_vpd_ws_max_anomaly", n)
  )
)