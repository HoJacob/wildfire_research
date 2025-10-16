source("~/Rstudio/FireStoreIndex.R")
source("~/Rstudio/small_plots/read.R")
source("~/Rstudio/randomforest.R")
source("~/Rstudio/small_plots/read_with_fire.R")
n <- length(mean_ws)

df123 <- tibble(
  ws = c(
    mean_ws,
    max_ws,
    pct95_wind
  ),
  ws_fire = c(
    mean_ws_fire,
    max_ws_fire,
    pct95_wind_fire
  ),
  ws_nofire = c(
    mean_ws_nofire,
    max_ws_nofire,
    pct95_wind_nofire
  ),
  ws_smallfire = c(
    mean_ws_smallfire,
    max_ws_smallfire,
    pct95_wind_smallfire
  ),
  ws_largefire = c(
    mean_ws_largefire,
    max_ws_largefire,
    pct95_wind_largefire
  ),
  ws_fire_ma = c(
    mean_ws_fire_ma,
    max_ws_fire_ma,
    pct95_wind_fire_ma
  ),
  ws_name = c(
    rep("mean_ws", n),
    rep("max_ws", n),
    rep("95pct_wind", n)
  )
)


df123 %>%
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
