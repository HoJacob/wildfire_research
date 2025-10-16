x_labs <- paste(
  c(
    "mean_ws",
    "max_ws",
    "pct95_ws",
    "high_95vpd_ws_mean",
    "high_95vpd_ws_max",
    "high_99vpd_ws_mean",
    "high_99vpd_ws_max"
  )
)
boxplot(
  mean_ws,
  max_ws,
  pct95_wind,
  high_vpd_ws_mean,
  high_vpd_ws_max,
  high_99vpd_ws_mean,
  high_99vpd_ws_max,
  col = c("red", "orange", "yellow", "green", "blue", "purple", "violet"),
  xlab = "",
  ylab = "Wind Speed",
  xaxt = "n",
  main = "Wind Speed"
)
axis(1, labels = FALSE)

# Plot x labs at default x position
text(
  x = seq_along(x_labs),
  y = par("usr")[3] - (par("usr")[4] - par("usr")[3]) / 30,
  srt = 25,
  adj = 1,
  labels = x_labs,
  xpd = TRUE
)

x_labs <- paste(
  c(
    "mean_vpd",
    "max_vpd",
    "pct95_vpd",
    "high_95wind_vpd_mean",
    "high_95wind_vpd_max",
    "high_99wind_vpd_mean",
    "high_99wind_vpd_max"
  )
)

boxplot(
  mean_vpd,
  max_vpd,
  pct95_vpd,
  high_wind_vpd_mean,
  high_wind_vpd_max,
  high_99wind_vpd_mean,
  high_99wind_vpd_max,
  col = c("red", "orange", "yellow", "green", "blue", "purple", "violet"),
  xlab = "",
  ylab = "VPD",
  xaxt = "n",
  main = "VPD"
)
axis(1, labels = FALSE)

# Plot x labs at default x position
text(
  x = seq_along(x_labs),
  y = par("usr")[3] - (par("usr")[4] - par("usr")[3]) / 30,
  srt = 25,
  adj = 1,
  labels = x_labs,
  xpd = TRUE
)