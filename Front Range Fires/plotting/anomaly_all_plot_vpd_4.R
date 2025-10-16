dfvpd4 %>%
  ggplot(aes(x =  vpd_spring_name, y = vpd_spring)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  vpd_spring_name, y = vpd_spring_fire), color = "blue", position = "jitter" ,size=0.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Spring Vapor Pressure Deficit Anomaly Data", x = "vpd Anomaly Data", y='')

dfvpd4 %>%
  ggplot(aes(x =  vpd_summer_name, y = vpd_summer)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  vpd_summer_name, y = vpd_summer_fire), color = "blue", position = "jitter" ,size=0.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Summer Vapor Pressure Deficit Anomaly Data", x = "vpd Anomaly Data", y='')

dfvpd4 %>%
  ggplot(aes(x =  vpd_fall_name, y = vpd_fall)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  vpd_fall_name, y = vpd_fall_fire), color = "blue", position = "jitter" ,size=0.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Fall Vapor Pressure Deficit Anomaly Data", x = "vpd Anomaly Data", y='')

dfvpd4 %>%
  ggplot(aes(x =  vpd_winter_name, y = vpd_winter)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(x =  vpd_winter_name, y = vpd_winter_fire), color = "blue", position = "jitter" ,size=0.5)+
  geom_point(aes(x =  vpd_winter_name, y = vpd_winter_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Winter Vapor Pressure Deficit Anomaly Data", x = "vpd Anomaly Data", y='')
