dfws4 <- tibble(
  ws_spring = c(
    spring_ws_anomaly,
    spring_max_ws_anomaly,
    spring_pct95_wind_anomaly,
    spring_high_vpd_ws_mean_anomaly,
    spring_high_vpd_ws_max_anomaly,
    spring_high_99vpd_ws_mean_anomaly,
    spring_high_99vpd_ws_max_anomaly
  ),
  ws_summer = c(
    summer_ws_anomaly,
    summer_max_ws_anomaly,
    summer_pct95_wind_anomaly,
    summer_high_vpd_ws_mean_anomaly,
    summer_high_vpd_ws_max_anomaly,
    summer_high_99vpd_ws_mean_anomaly,
    summer_high_99vpd_ws_max_anomaly
  ),
  ws_fall = c(
    fall_ws_anomaly,
    fall_max_ws_anomaly,
    fall_pct95_wind_anomaly,
    fall_high_vpd_ws_mean_anomaly,
    fall_high_vpd_ws_max_anomaly,
    fall_high_99vpd_ws_mean_anomaly,
    fall_high_99vpd_ws_max_anomaly
  ),
  ws_winter = c(
    winter_ws_anomaly,
    winter_max_ws_anomaly,
    winter_pct95_wind_anomaly,
    winter_high_vpd_ws_mean_anomaly,
    winter_high_vpd_ws_max_anomaly,
    winter_high_99vpd_ws_mean_anomaly,
    winter_high_99vpd_ws_max_anomaly
  ),
  ws_spring_fire = c(
    spring_ws_fire_anomaly,
    spring_max_ws_fire_anomaly,
    spring_pct95_wind_fire_anomaly,
    spring_high_vpd_ws_mean_fire_anomaly,
    spring_high_vpd_ws_max_fire_anomaly,
    spring_high_99vpd_ws_mean_fire_anomaly,
    spring_high_99vpd_ws_max_fire_anomaly
  ),
  ws_summer_fire = c(
    summer_ws_fire_anomaly,
    summer_max_ws_fire_anomaly,
    summer_pct95_wind_fire_anomaly,
    summer_high_vpd_ws_mean_fire_anomaly,
    summer_high_vpd_ws_max_fire_anomaly,
    summer_high_99vpd_ws_mean_fire_anomaly,
    summer_high_99vpd_ws_max_fire_anomaly
  ),
  ws_fall_fire = c(
    fall_ws_fire_anomaly,
    fall_max_ws_fire_anomaly,
    fall_pct95_wind_fire_anomaly,
    fall_high_vpd_ws_mean_fire_anomaly,
    fall_high_vpd_ws_max_fire_anomaly,
    fall_high_99vpd_ws_mean_fire_anomaly,
    fall_high_99vpd_ws_max_fire_anomaly
  ),
  ws_winter_fire = c(
    winter_ws_fire_anomaly,
    winter_max_ws_fire_anomaly,
    winter_pct95_wind_fire_anomaly,
    winter_high_vpd_ws_mean_fire_anomaly,
    winter_high_vpd_ws_max_fire_anomaly,
    winter_high_99vpd_ws_mean_fire_anomaly,
    winter_high_99vpd_ws_max_fire_anomaly
  ),
  ws_spring_fire_ma = c(
    spring_ws_fire_ma_anomaly,
    spring_max_ws_fire_ma_anomaly,
    spring_pct95_wind_fire_ma_anomaly,
    spring_high_vpd_ws_mean_fire_ma_anomaly,
    spring_high_vpd_ws_max_fire_ma_anomaly,
    spring_high_99vpd_ws_mean_fire_ma_anomaly,
    spring_high_99vpd_ws_max_fire_ma_anomaly
  ),
  ws_summer_fire_ma = c(
    summer_ws_fire_ma_anomaly,
    summer_max_ws_fire_ma_anomaly,
    summer_pct95_wind_fire_ma_anomaly,
    summer_high_vpd_ws_mean_fire_ma_anomaly,
    summer_high_vpd_ws_max_fire_ma_anomaly,
    summer_high_99vpd_ws_mean_fire_ma_anomaly,
    summer_high_99vpd_ws_max_fire_ma_anomaly
  ),
  ws_fall_fire_ma = c(
    fall_ws_fire_ma_anomaly,
    fall_max_ws_fire_ma_anomaly,
    fall_pct95_wind_fire_ma_anomaly,
    fall_high_vpd_ws_mean_fire_ma_anomaly,
    fall_high_vpd_ws_max_fire_ma_anomaly,
    fall_high_99vpd_ws_mean_fire_ma_anomaly,
    fall_high_99vpd_ws_max_fire_ma_anomaly
  ),
  ws_winter_fire_ma = c(
    winter_ws_fire_ma_anomaly,
    winter_max_ws_fire_ma_anomaly,
    winter_pct95_wind_fire_ma_anomaly,
    winter_high_vpd_ws_mean_fire_ma_anomaly,
    winter_high_vpd_ws_max_fire_ma_anomaly,
    winter_high_99vpd_ws_mean_fire_ma_anomaly,
    winter_high_99vpd_ws_max_fire_ma_anomaly
  ),
  ws_spring_name = c(
    rep("spring_ws_anomaly", n),
    rep("spring_ws_max_anomaly", n),
    rep("spring_pct95_wind_anomaly", n),
    rep("spring_high_vpd_ws_anomaly", n),
    rep("spring_high_vpd_ws_max_anomaly", n),
    rep("spring_99%_high_vpd_ws_anomaly", n),
    rep("spring_99%_high_vpd_ws_max_anomaly", n)
  ),
  ws_summer_name = c(
    rep("summer_ws_anomaly", n),
    rep("summer_ws_max_anomaly", n),
    rep("summer_pct95_wind_anomaly", n),
    rep("summer_high_vpd_ws_anomaly", n),
    rep("summer_high_vpd_ws_max_anomaly", n),
    rep("summer_99%_high_vpd_ws_anomaly", n),
    rep("summer_99%_high_vpd_ws_max_anomaly", n)
  ),
  ws_fall_name = c(
    rep("fall_ws_anomaly", n),
    rep("fall_ws_max_anomaly", n),
    rep("fall_pct95_wind_anomaly", n),
    rep("fall_high_vpd_ws_anomaly", n),
    rep("fall_high_vpd_ws_max_anomaly", n),
    rep("fall_99%_high_vpd_ws_anomaly", n),
    rep("fall_99%_high_vpd_ws_max_anomaly", n)
  ),
  ws_winter_name = c(
    rep("winter_ws_anomaly", n),
    rep("winter_ws_max_anomaly", n),
    rep("winter_pct95_wind_anomaly", n),
    rep("winter_high_vpd_ws_anomaly", n),
    rep("winter_high_vpd_ws_max_anomaly", n),
    rep("winter_99%_high_vpd_ws_anomaly", n),
    rep("winter_99%_high_vpd_ws_max_anomaly", n)
  )
)