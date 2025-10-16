dfws4 %>%
  ggplot(aes(x =  ws_spring_name, y = ws_spring)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_spring_name, y = ws_spring_fire), color = "blue", position = "jitter" ,size=0.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Spring Wind Speed Anomaly Data", x = "WS Anomaly Data", y='')

dfws4 %>%
  ggplot(aes(x =  ws_summer_name, y = ws_summer)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_summer_name, y = ws_summer_fire), color = "blue", position = "jitter" ,size=0.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Summer Wind Speed Anomaly Data", x = "WS Anomaly Data", y='')

dfws4 %>%
  ggplot(aes(x =  ws_fall_name, y = ws_fall)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_fall_name, y = ws_fall_fire), color = "blue", position = "jitter" ,size=0.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Fall Wind Speed Anomaly Data", x = "WS Anomaly Data", y='')

dfws4 %>%
  ggplot(aes(x =  ws_winter_name, y = ws_winter)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  ws_winter_name, y = ws_winter_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  ws_winter_name, y = ws_winter_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Winter Wind Speed Anomaly Data", x = "WS Anomaly Data", y='')
