

df %>%
  ggplot(aes(x =  ws_name, y = ws)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  ws_name, y = ws_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  ws_name, y = ws_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  ws_name, y = ws_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  ws_name, y = ws_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range Wind Speed Predictors", x = "Wind Speed Predictors", y = "Wind Speed (m/s)")

df %>%
  ggplot(aes(x =  vpd_name, y = vpd)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  vpd_name, y = vpd_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  vpd_name, y = vpd_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  vpd_name, y = vpd_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  vpd_name, y = vpd_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range VPD Predictors", x = "VPD Predictors", y = "Wind Speed (m/s)")

df2 %>%
  ggplot(aes(x =  fm100_name, y = fm100)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  fm100_name, y = fm100_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  fm100_name, y = fm100_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  fm100_name, y = fm100_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  fm100_name, y = fm100_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range FM100 Predictors", x = "FM100 Predictors", y = "FM100")

df3 %>%
  ggplot(aes(x =  fm1000_name, y = fm1000)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  fm1000_name, y = fm1000_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  fm1000_name, y = fm1000_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  fm1000_name, y = fm1000_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  fm1000_name, y = fm1000_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range FM1000 Predictors", x = "FM1000 Predictors", y = "FM1000")
df4 %>%
  ggplot(aes(x =  pdsi_name, y = pdsi)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  pdsi_name, y = pdsi_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  pdsi_name, y = pdsi_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  pdsi_name, y = pdsi_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  pdsi_name, y = pdsi_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range pdsi Predictors", x = "pdsi Predictors", y = "pdsi")
df5 %>%
  ggplot(aes(x =  spei90_name, y = spei90)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  spei90_name, y = spei90_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  spei90_name, y = spei90_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  spei90_name, y = spei90_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  spei90_name, y = spei90_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range spei90 Predictors", x = "spei90 Predictors", y = "spei90")

df6 %>%
  ggplot(aes(x =  spei90_name, y = spei90)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  spei90_name, y = spei90_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  spei90_name, y = spei90_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  spei90_name, y = spei90_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  spei90_name, y = spei90_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range spei90 Predictors", x = "spei90 Predictors", y = "spei90")

df7 %>%
  ggplot(aes(x =  sph_name, y = sph)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  sph_name, y = sph_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  sph_name, y = sph_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  sph_name, y = sph_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  sph_name, y = sph_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range sph Predictors", x = "sph Predictors", y = "sph")
df8 %>%
  ggplot(aes(x =  spi90_name, y = spi90)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  spi90_name, y = spi90_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  spi90_name, y = spi90_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  spi90_name, y = spi90_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  spi90_name, y = spi90_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range spi90 Predictors", x = "spi90 Predictors", y = "spi90")
df9 %>%
  ggplot(aes(x =  tmmn_name, y = tmmn)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  tmmn_name, y = tmmn_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  tmmn_name, y = tmmn_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  tmmn_name, y = tmmn_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  tmmn_name, y = tmmn_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range tmmn Predictors", x = "tmmn Predictors", y = "tmmn")
df10 %>%
  ggplot(aes(x =  tmmx_name, y = tmmx)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(
    aes(x =  tmmx_name, y = tmmx_fire),
    color = "transparent",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  tmmx_name, y = tmmx_smallfire),
    color = "blue",
    position = "jitter" ,
    size = 0.5
  ) +
  geom_point(
    aes(x =  tmmx_name, y = tmmx_largefire),
    color = "red",
    position = "jitter" ,
    size = 1
  ) +
  #geom_point(aes(x =  tmmx_name, y = tmmx_fire_ma), color = "red", position = "jitter", size = 1.5)+
  #geom_jitter(width = 0.15, aes(color = name)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Front Range tmmx Predictors", x = "tmmx Predictors", y = "tmmx")

