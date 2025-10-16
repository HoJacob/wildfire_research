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



