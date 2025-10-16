

boxplot(mean_ws,
        col = "white",
        horizontal = TRUE,
        main = "mean_ws")
stripchart(
  mean_ws[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  mean_ws[length(mean_ws) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)


boxplot(max_ws,
        col = "white",
        horizontal = TRUE,
        main = "max_ws")

stripchart(
  max_ws[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  max_ws[length(max_ws) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)

boxplot(
  pct95_wind,
  col = "white",
  horizontal = TRUE,
  main = "pct95_wind"
)
stripchart(
  pct95_wind[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  pct95_wind[length(pct95_wind) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)


boxplot(
  high_vpd_ws_mean,
  col = "white",
  horizontal = TRUE,
  main = "high_vpd_ws_mean"
)
stripchart(
  high_vpd_ws_mean[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_vpd_ws_mean[length(high_vpd_ws_mean) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_99vpd_ws_mean,
  col = "white",
  horizontal = TRUE,
  main = "high_99vpd_ws_mean"
)
stripchart(
  high_99vpd_ws_mean[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_99vpd_ws_mean[length(high_99vpd_ws_mean) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_vpd_ws_max,
  col = "white",
  horizontal = TRUE,
  main = "high_vpd_ws_max"
)
stripchart(
  high_vpd_ws_max[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)

stripchart(
  high_vpd_ws_max[length(high_vpd_ws_max) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_99vpd_ws_max,
  col = "white",
  horizontal = TRUE,
  main = "high_99vpd_ws_max"
)
stripchart(
  high_99vpd_ws_max[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_99vpd_ws_max[length(high_99vpd_ws_max) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)

boxplot(mean_vpd,
        col = "white",
        horizontal = TRUE,
        main = "mean_vpd")
stripchart(
  mean_vpd[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  mean_vpd[length(mean_vpd) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(max_vpd,
        col = "white",
        horizontal = TRUE,
        main = "max_vpd")
stripchart(
  max_vpd[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  max_vpd[length(max_vpd) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(pct95_vpd,
        col = "white",
        horizontal = TRUE,
        main = "pct95_vpd")
stripchart(
  pct95_vpd[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  pct95_vpd[length(pct95_vpd) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_wind_vpd_mean,
  col = "white",
  horizontal = TRUE,
  main = "high_wind_vpd_mean"
)
stripchart(
  high_wind_vpd_mean[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_wind_vpd_mean[length(high_wind_vpd_mean) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_99wind_vpd_mean,
  col = "white",
  horizontal = TRUE,
  main = "high_99wind_vpd_mean"
)
stripchart(
  high_99wind_vpd_mean[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_99wind_vpd_mean[length(high_99wind_vpd_mean)],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_wind_vpd_max,
  col = "white",
  horizontal = TRUE,
  main = "high_wind_vpd_max"
)
stripchart(
  high_wind_vpd_max[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_wind_vpd_max[length(high_wind_vpd_max) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
boxplot(
  high_99wind_vpd_max,
  col = "white",
  horizontal = TRUE,
  main = "high_99wind_vpd_max"
)
stripchart(
  high_99wind_vpd_max[store_fire_index],
  method = "jitter",
  pch = 19,
  col = 4,
  add = TRUE
)
stripchart(
  high_99wind_vpd_max[length(high_99wind_vpd_max) - 1],
  method = "jitter",
  pch = 19,
  col = "red",
  add = TRUE
)
