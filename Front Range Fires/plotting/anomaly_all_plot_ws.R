dfws %>%
  ggplot(aes(x =  factor(
    ws_season_name,
    level = c(
      "spring_ws_anomaly",
      "summer_ws_anomaly",
      "fall_ws_anomaly",
      "winter_ws_anomaly"
    )
  ), y = ws_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  factor(
      ws_season_name,
      level = c(
        "spring_ws_anomaly",
        "summer_ws_anomaly",
        "fall_ws_anomaly",
        "winter_ws_anomaly"
      )
    ),
    y = ws_season_fire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  ws_season_name, y = ws_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")

dfws %>%
  ggplot(aes(x =  factor(
    max_ws_season_name,
    level = c(
      "spring_ws_max_anomaly",
      "summer_ws_max_anomaly",
      "fall_ws_max_anomaly",
      "winter_ws_max_anomaly"
    )
  ),
  y = max_ws_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  factor(
      max_ws_season_name,
      level = c(
        "spring_ws_max_anomaly",
        "summer_ws_max_anomaly",
        "fall_ws_max_anomaly",
        "winter_ws_max_anomaly"
      )
    ),
    y = max_ws_season_fire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  max_ws_season_name, y = max_ws_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Maximum Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")

dfws %>%
  ggplot(aes(x =  factor(
    pct95_wind_season_name,
    level = c(
      "spring_pct95_wind_anomaly",
      "summer_pct95_wind_anomaly",
      "fall_pct95_wind_anomaly",
      "winter_pct95_wind_anomaly"
    )
  ),
  y = pct95_wind_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  factor(
      pct95_wind_season_name,
      level = c(
        "spring_pct95_wind_anomaly",
        "summer_pct95_wind_anomaly",
        "fall_pct95_wind_anomaly",
        "winter_pct95_wind_anomaly"
      )
    ),
    y = pct95_wind_season_fire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  pct95_wind_season_name, y = pct95_wind_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")

dfws %>%
  ggplot(aes(
    x =   factor(
      high_vpd_ws_season_name,
      level = c(
        "spring_high_vpd_ws_anomaly",
        "summer_high_vpd_ws_anomaly",
        "fall_high_vpd_ws_anomaly",
        "winter_high_vpd_ws_anomaly"
      )
    ),
    y = high_vpd_ws_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high_vpd_ws_season_name,
        level = c(
          "spring_high_vpd_ws_anomaly",
          "summer_high_vpd_ws_anomaly",
          "fall_high_vpd_ws_anomaly",
          "winter_high_vpd_ws_anomaly"
        )
      ),
      y = high_vpd_ws_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  high_vpd_ws_season_name, y = high_vpd_ws_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT VPD Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")

dfws %>%
  ggplot(aes(
    x =   factor(
      high_vpd_ws_max_season_name,
      level = c(
        "spring_high_vpd_ws_max_anomaly",
        "summer_high_vpd_ws_max_anomaly",
        "fall_high_vpd_ws_max_anomaly",
        "winter_high_vpd_ws_max_anomaly"
      )
    ),
    y = high_vpd_ws_max_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high_vpd_ws_max_season_name,
        level = c(
          "spring_high_vpd_ws_max_anomaly",
          "summer_high_vpd_ws_max_anomaly",
          "fall_high_vpd_ws_max_anomaly",
          "winter_high_vpd_ws_max_anomaly"
        )
      ),
      y = high_vpd_ws_max_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  high_vpd_ws_max_season_name, y = high_vpd_ws_max_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT VPD Maximum Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")

dfws %>%
  ggplot(aes(
    x =  factor(
      high99_vpd_ws_season_name,
      level = c(
        "spring_99%_high_vpd_ws_anomaly",
        "summer_99%_high_vpd_ws_anomaly",
        "fall_99%_high_vpd_ws_anomaly",
        "winter_99%_high_vpd_ws_anomaly"
      )
    ),
    y = high_99vpd_ws_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high99_vpd_ws_season_name,
        level = c(
          "spring_99%_high_vpd_ws_anomaly",
          "summer_99%_high_vpd_ws_anomaly",
          "fall_99%_high_vpd_ws_anomaly",
          "winter_99%_high_vpd_ws_anomaly"
        )
      ),
      y = high_99vpd_ws_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(
      x =   factor(
        high99_vpd_ws_season_name,
        level = c(
          "spring_99%_high_vpd_ws_anomaly",
          "summer_99%_high_vpd_ws_anomaly",
          "fall_99%_high_vpd_ws_anomaly",
          "winter_99%_high_vpd_ws_anomaly"
        )
      ),
      y = high_99vpd_ws_season_fire_ma
    ),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 99 PCT VPD Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")

dfws %>%
  ggplot(aes(
    x =  factor(
      high99_vpd_ws_max_season_name,
      level = c(
        "spring_99%_high_vpd_ws_max_anomaly",
        "summer_99%_high_vpd_ws_max_anomaly",
        "fall_99%_high_vpd_ws_max_anomaly",
        "winter_99%_high_vpd_ws_max_anomaly"
      )
    ),
    y = high_99vpd_ws_max_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high99_vpd_ws_max_season_name,
        level = c(
          "spring_99%_high_vpd_ws_max_anomaly",
          "summer_99%_high_vpd_ws_max_anomaly",
          "fall_99%_high_vpd_ws_max_anomaly",
          "winter_99%_high_vpd_ws_max_anomaly"
        )
      ),
      y = high_99vpd_ws_max_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(
      x =   factor(
        high99_vpd_ws_max_season_name,
        level = c(
          "spring_99%_high_vpd_ws_max_anomaly",
          "summer_99%_high_vpd_ws_max_anomaly",
          "fall_99%_high_vpd_ws_max_anomaly",
          "winter_99%_high_vpd_ws_max_anomaly"
        )
      ),
      y = high_99vpd_ws_season_fire_ma
    ),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 99 PCT VPD Maximum Wind Speed Anomaly Data", x = "WS Predictor Anomaly Data", y = "")
