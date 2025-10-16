source("~/Rstudio/FireStoreIndex.R")
source("~/Rstudio/small_plots/read.R")
source("~/Rstudio/randomforest.R")
source("~/Rstudio/small_plots/read_with_fire.R")

n <- length(mean_fm100)

df321 <- tibble(
  ws = c(
    mean_fm100,
    max_fm100,
    pct95_fm100
  ),
  ws_fire = c(
    mean_fm100_fire,
    max_fm100_fire,
    pct95_fm100_fire
  ),
  ws_smallfire = c(
    mean_fm100_smallfire,
    max_fm100_smallfire,
    pct95_fm100_smallfire
  ),
  ws_largefire = c(
    mean_fm100_largefire,
    max_fm100_largefire,
    pct95_fm100_largefire
  ),
  ws_name = c(
    rep("mean_fm100", n),
    rep("max_fm100", n),
    rep("pct95_fm100", n)
  )
)


df321 %>%
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
  labs(title = "Front Range FM100 Predictors", x = "FM100 Predictors")



n <- length(mean_fm100)

df333 <- tibble(
  ws = c(
    mean_fm1000,
    max_fm1000,
    pct95_fm1000
  ),
  ws_fire = c(
    mean_fm1000_fire,
    max_fm1000_fire,
    pct95_fm1000_fire
  ),
  ws_smallfire = c(
    mean_fm1000_smallfire,
    max_fm1000_smallfire,
    pct95_fm1000_smallfire
  ),
  ws_largefire = c(
    mean_fm1000_largefire,
    max_fm1000_largefire,
    pct95_fm1000_largefire
  ),
  ws_name = c(
    rep("mean_fm1000", n),
    rep("max_fm1000", n),
    rep("pct95_fm1000", n)
  )
)


df333 %>%
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
  labs(title = "Front Range FM1000 Predictors", x = "FM1000 Predictors")
