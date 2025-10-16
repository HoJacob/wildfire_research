library(plotly)

#Columns

xxx <- read.csv('~/Downloads/new_file.csv')
firedates = xxx$Time
print(firedates)



x <- read.csv('~/Downloads/VS84-21_average.csv')
mean_ws = x$GridMath.applyFunctionOverGrid2D.S
testDate = x$Time

store_fire_index = c()
start_ff = 1

for (fi in 1:length(firedates)) {
  for (ff in start_ff:length(testDate)) {
    if (grepl(firedates[fi], testDate[ff])) {
      store_fire_index = rbind(store_fire_index, ff)
      start_ff = ff
      break
    }
  }
}
print(store_fire_index)
print(length(store_fire_index))
xx <- read.csv('~/Downloads/VS84-21_max.csv')
max_ws = xx$GridMath.applyFunctionOverGrid2D.S

y <- read.csv('~/Downloads/VPD84-21_average.csv')
mean_vpd = y$GridMath.applyFunctionOverGrid2D.S

yy <- read.csv('~/Downloads/VPD84-21_max.csv')
max_vpd = yy$GridMath.applyFunctionOverGrid2D.S

z <- read.csv('~/Downloads/VS-95PRCNTLA.csv')
pct95_wind = z$GridMath.applyFunctionOverLevels.S

a <- read.csv('~/Downloads/VPD-95PRCNTLA.csv')
pct95_vpd = a$PPPPP

b <- read.csv('~/Downloads/VPDAVERAGE-VS95PRCNTLA.csv')
high_wind_vpd_mean = b$GridMath.applyFunctionOverGrid2D.S

c <- read.csv('~/Downloads/VPDmax-VS95PRCNTLA.csv')
high_wind_vpd_max = c$GridMath.applyFunctionOverGrid2D.S

d <- read.csv('~/Downloads/VSaverage-VPD95PRCNTLA.csv')
high_vpd_ws_mean = d$GridMath.applyFunctionOverGrid2D.S

e <- read.csv('~/Downloads/VSmax-VPD95PRCNTLA.csv')
high_vpd_ws_max = e$GridMath.applyFunctionOverGrid2D.S


length(mean_ws)
length(mean_vpd)


Predictors <-
  cbind(
    testDate,
    mean_ws,
    max_ws,
    mean_vpd,
    max_vpd,
    pct95_wind,
    pct95_vpd,
    high_wind_vpd_mean,
    high_wind_vpd_max,
    high_vpd_ws_mean,
    high_vpd_ws_max
  )
library(tidyverse)
n <- length(mean_ws)
df <- tibble(
  ws = c(
    mean_ws,
    max_ws,
    pct95_wind,
    high_vpd_ws_mean,
    high_vpd_ws_max
  ),
  vpd = c(
    mean_vpd,
    max_vpd,
    pct95_vpd,
    high_wind_vpd_mean,
    high_wind_vpd_max
  )
  ,
  ws_name = c(
    rep("mean_ws", n),
    rep("max_ws", n),
    rep("pct95_wind", n),
    rep("high_vpd_ws_mean", n),
    rep("high_vpd_ws_max", n)
  ),
  vpd_name = c(
    rep("mean_vpd", n),
    rep("max_vpd", n),
    rep("pct95_vpd", n),
    rep("high_wind_vpd_mean", n),
    rep("high_wind_vpd_max", n)
  )
)
# df %>%
#   ggplot(aes(x = name, y = ws)) +
#   geom_boxplot(width = 0.5, lwd = 1.5, aes(color = name)) +
#   geom_jitter(width = 0.15, aes(color = name)) +
#   labs(subtitle = "jacob")

df %>%
  ggplot(aes(x = ws_name, y = ws)) +
  geom_boxplot(width = 0.5, lwd = 1.5, aes(color = ws_name)) +
  # geom_jitter(width = 0.15, aes(color = name)) +
  labs(subtitle = "Wind")

df %>%
  ggplot(aes(x = vpd_name, y = vpd)) +
  geom_boxplot(width = 0.5, lwd = 1.5, aes(color = vpd_name)) +
  # geom_jitter(width = 0.15, aes(color = vpd_small)) +
  labs(subtitle = "VPD")

boxplot(mean_ws,
        col = "white",
        horizontal = TRUE,
        main = "mean_ws")
stripchart(
  mean_ws[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(max_ws,
        col = "white",
        horizontal = TRUE,
        main = "max_ws")
stripchart(
  max_ws[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(mean_vpd,
        col = "white",
        horizontal = TRUE,
        main = "mean_vpd")
stripchart(
  mean_vpd[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(max_vpd,
        col = "white",
        horizontal = TRUE,
        main = "max_vpd")
stripchart(
  max_vpd[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(
  pct95_wind,
  col = "white",
  horizontal = TRUE,
  main = "pct95_wind"
)
stripchart(
  pct95_wind[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(pct95_vpd,
        col = "white",
        horizontal = TRUE,
        main = "pct95_vpd")
stripchart(
  pct95_vpd[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(
  high_wind_vpd_mean,
  col = "white",
  horizontal = TRUE,
  main = "high_wind_vpd_mean"
)
stripchart(
  high_wind_vpd_mean[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(
  high_wind_vpd_max,
  col = "white",
  horizontal = TRUE,
  main = "high_wind_vpd_max"
)
stripchart(
  high_wind_vpd_max[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(
  high_vpd_ws_mean,
  col = "white",
  horizontal = TRUE,
  main = "high_vpd_ws_mean"
)
stripchart(
  high_vpd_ws_mean[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over

boxplot(
  high_vpd_ws_max,
  col = "white",
  horizontal = TRUE,
  main = "high_vpd_ws_max"
)
stripchart(
  high_vpd_ws_max[store_fire_index],
  # Data
  method = "jitter",
  # Random noise
  pch = 19,
  # Pch symbol
  col = 4,
  # Color of the symbol
  add = TRUE
)        # Add it over



