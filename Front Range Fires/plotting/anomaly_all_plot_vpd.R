dfvpd %>%
  ggplot(aes(x =  factor(
    vpd_season_name,
    level = c(
      "spring_vpd_anomaly",
      "summer_vpd_anomaly",
      "fall_vpd_anomaly",
      "winter_vpd_anomaly"
    )
  ), y = vpd_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  factor(
      vpd_season_name,
      level = c(
        "spring_vpd_anomaly",
        "summer_vpd_anomaly",
        "fall_vpd_anomaly",
        "winter_vpd_anomaly"
      )
    ),
    y = vpd_season_fire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  vpd_season_name, y = vpd_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Predictor Anomaly Data", y =
         "")
dfvpd %>%
  ggplot(aes(x =  factor(
    max_vpd_season_name,
    level = c(
      "spring_vpd_max_anomaly",
      "summer_vpd_max_anomaly",
      "fall_vpd_max_anomaly",
      "winter_vpd_max_anomaly"
    )
  ),
  y = max_vpd_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  factor(
      max_vpd_season_name,
      level = c(
        "spring_vpd_max_anomaly",
        "summer_vpd_max_anomaly",
        "fall_vpd_max_anomaly",
        "winter_vpd_max_anomaly"
      )
    ),
    y = max_vpd_season_fire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  max_vpd_season_name, y = max_vpd_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Maximum Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Predictor Anomaly Data", y =
         "")

dfvpd %>%
  ggplot(aes(x =  factor(
    pct95_vpd_season_name,
    level = c(
      "spring_pct95_vpd_anomaly",
      "summer_pct95_vpd_anomaly",
      "fall_pct95_vpd_anomaly",
      "winter_pct95_vpd_anomaly"
    )
  ),
  y = pct95_vpd_season)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  factor(
      pct95_vpd_season_name,
      level = c(
        "spring_pct95_vpd_anomaly",
        "summer_pct95_vpd_anomaly",
        "fall_pct95_vpd_anomaly",
        "winter_pct95_vpd_anomaly"
      )
    ),
    y = pct95_vpd_season_fire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  pct95_vpd_season_name, y = pct95_vpd_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Predictor Anomaly Data", y =
         "")

dfvpd %>%
  ggplot(aes(
    x =   factor(
      high_wind_vpd_season_name,
      level = c(
        "spring_high_wind_vpd_anomaly",
        "summer_high_wind_vpd_anomaly",
        "fall_high_wind_vpd_anomaly",
        "winter_high_wind_vpd_anomaly"
      )
    ),
    y = high_wind_vpd_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high_wind_vpd_season_name,
        level = c(
          "spring_high_wind_vpd_anomaly",
          "summer_high_wind_vpd_anomaly",
          "fall_high_wind_vpd_anomaly",
          "winter_high_wind_vpd_anomaly"
        )
      ),
      y = high_wind_vpd_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  high_wind_vpd_season_name, y = high_wind_vpd_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT High Wind Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Predictor Anomaly Data", y =
         "")

dfvpd %>%
  ggplot(aes(
    x =   factor(
      high_wind_vpd_max_season_name,
      level = c(
        "spring_high_wind_vpd_max_anomaly",
        "summer_high_wind_vpd_max_anomaly",
        "fall_high_wind_vpd_max_anomaly",
        "winter_high_wind_vpd_max_anomaly"
      )
    ),
    y = high_wind_vpd_max_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high_wind_vpd_max_season_name,
        level = c(
          "spring_high_wind_vpd_max_anomaly",
          "summer_high_wind_vpd_max_anomaly",
          "fall_high_wind_vpd_max_anomaly",
          "winter_high_wind_vpd_max_anomaly"
        )
      ),
      y = high_wind_vpd_max_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  high_wind_vpd_max_season_name, y = high_wind_vpd_max_season_fire_ma),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 95 PCT High Wind Maximum Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Anomaly Data", y =
         "")

dfvpd %>%
  ggplot(aes(
    x =  factor(
      high_99wind_vpd_season_name,
      level = c(
        "spring_99%_high_wind_vpd_anomaly",
        "summer_99%_high_wind_vpd_anomaly",
        "fall_99%_high_wind_vpd_anomaly",
        "winter_99%_high_wind_vpd_anomaly"
      )
    ),
    y = high_99wind_vpd_season
  )) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high_99wind_vpd_season_name,
        level = c(
          "spring_99%_high_wind_vpd_anomaly",
          "summer_99%_high_wind_vpd_anomaly",
          "fall_99%_high_wind_vpd_anomaly",
          "winter_99%_high_wind_vpd_anomaly"
        )
      ),
      y = high_99wind_vpd_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(
      x =   factor(
        high_99wind_vpd_season_name,
        level = c(
          "spring_99%_high_wind_vpd_anomaly",
          "summer_99%_high_wind_vpd_anomaly",
          "fall_99%_high_wind_vpd_anomaly",
          "winter_99%_high_wind_vpd_anomaly"
        )
      ),
      y = high_99wind_vpd_season_fire_ma
    ),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 99 PCT High Wind Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Anomaly Data", y =
         '')

dfvpd %>%
  ggplot(
    aes(
      x =  factor(
        high_99wind_vpd_max_season_name,
        level = c(
          "spring_99%_high_wind_vpd_max_anomaly",
          "summer_99%_high_wind_vpd_max_anomaly",
          "fall_99%_high_wind_vpd_max_anomaly",
          "winter_99%_high_wind_vpd_max_anomaly"
        )
      ),
      y = high_99wind_vpd_max_season
    )
  ) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(
      x =   factor(
        high_99wind_vpd_max_season_name,
        level = c(
          "spring_99%_high_wind_vpd_max_anomaly",
          "summer_99%_high_wind_vpd_max_anomaly",
          "fall_99%_high_wind_vpd_max_anomaly",
          "winter_99%_high_wind_vpd_max_anomaly"
        )
      ),
      y = high_99wind_vpd_max_season_fire
    ),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(
      x =   factor(
        high_99wind_vpd_max_season_name,
        level = c(
          "spring_99%_high_wind_vpd_max_anomaly",
          "summer_99%_high_wind_vpd_max_anomaly",
          "fall_99%_high_wind_vpd_max_anomaly",
          "winter_99%_high_wind_vpd_max_anomaly"
        )
      ),
      y = high_99wind_vpd_max_season_fire_ma
    ),
    color = "red",
    position = "jitter",
    size = 1.5
  ) +
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range 99 PCT High Wind Maximum Vapor Pressure Deficit Anomaly Data", x = "Four Seasons VPD Predictor Anomaly Data", y =
         "")
