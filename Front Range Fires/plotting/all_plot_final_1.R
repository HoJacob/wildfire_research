nws3 <- length(mean_ws_fire) * 3
nws <- length(mean_ws_fire)

DF2 <- data.frame(
  x = c(
    c(mean_ws_fire,
      max_ws_fire,
      pct95_wind_fire),
    c(mean_ws_nofire,
      max_ws_nofire,
      pct95_wind_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nws3),
  z = rep(rep(1:3, each = nws), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "wind speed",
  horiz = F
)
nvpd3 <- length(mean_vpd_fire) * 3
nvpd <- length(mean_vpd_fire)

DF2 <- data.frame(
  x = c(
    c(mean_vpd_fire,
      max_vpd_fire,
      pct95_vpd_fire),
    c(mean_vpd_nofire,
      max_vpd_nofire,
      pct95_vpd_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nvpd3),
  z = rep(rep(1:3, each = nvpd), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "vpd",
  horiz = F
)
nfm1003 <- length(mean_fm100_fire) * 3
nfm100 <- length(mean_fm100_fire)

DF2 <- data.frame(
  x = c(
    c(mean_fm100_fire,
      max_fm100_fire,
      pct95_fm100_fire),
    c(mean_fm100_nofire,
      max_fm100_nofire,
      pct95_fm100_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nfm1003),
  z = rep(rep(1:3, each = nfm100), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "fm100",
  horiz = F
)
nfm10003 <- length(mean_fm1000_fire) * 3
nfm1000 <- length(mean_fm1000_fire)

DF2 <- data.frame(
  x = c(
    c(mean_fm1000_fire,
      max_fm1000_fire,
      pct95_fm1000_fire),
    c(mean_fm1000_nofire,
      max_fm1000_nofire,
      pct95_fm1000_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nfm10003),
  z = rep(rep(1:3, each = nfm1000), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "fm1000",
  horiz = F
)
npdsi3 <- length(mean_pdsi_fire) * 3
npdsi <- length(mean_pdsi_fire)

DF2 <- data.frame(
  x = c(
    c(mean_pdsi_fire,
      max_pdsi_fire,
      pct95_pdsi_fire),
    c(mean_pdsi_nofire,
      max_pdsi_nofire,
      pct95_pdsi_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = npdsi3),
  z = rep(rep(1:3, each = npdsi), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "pdsi",
  horiz = F
)
npet3 <- length(mean_pet_fire) * 3
npet <- length(mean_pet_fire)

DF2 <- data.frame(
  x = c(
    c(mean_pet_fire,
      max_pet_fire,
      pct95_pet_fire),
    c(mean_pet_nofire,
      max_pet_nofire,
      pct95_pet_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = npet3),
  z = rep(rep(1:3, each = npet), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "pet",
  horiz = F
)
nspei903 <- length(mean_spei90_fire) * 3
nspei90 <- length(mean_spei90_fire)

DF2 <- data.frame(
  x = c(
    c(mean_spei90_fire,
      max_spei90_fire,
      pct95_spei90_fire),
    c(mean_spei90_nofire,
      max_spei90_nofire,
      pct95_spei90_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nspei903),
  z = rep(rep(1:3, each = nspei90), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "SPEI90",
  horiz = F
)
nsph3 <- length(mean_sph_fire) * 3
nsph <- length(mean_sph_fire)

DF2 <- data.frame(
  x = c(
    c(mean_sph_fire,
      max_sph_fire,
      pct95_sph_fire),
    c(mean_sph_nofire,
      max_sph_nofire,
      pct95_sph_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nsph3),
  z = rep(rep(1:3, each = nsph), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "SPH",
  horiz = F
)
nspi903 <- length(mean_spi90_fire) * 3
nspi90 <- length(mean_spi90_fire)

DF2 <- data.frame(
  x = c(
    c(mean_spi90_fire,
      max_spi90_fire,
      pct95_spi90_fire),
    c(mean_spi90_nofire,
      max_spi90_nofire,
      pct95_spi90_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nspi903),
  z = rep(rep(1:3, each = nspi90), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE,
  ylim = c(-3, 3)
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "SPI90",
  horiz = F
)
ntmmn3 <- length(mean_tmmn_fire) * 3
ntmmn <- length(mean_tmmn_fire)

DF2 <- data.frame(
  x = c(
    c(mean_tmmn_fire,
      max_tmmn_fire,
      pct95_tmmn_fire),
    c(mean_tmmn_nofire,
      max_tmmn_nofire,
      pct95_tmmn_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = ntmmn3),
  z = rep(rep(1:3, each = ntmmn), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "TMMN",
  horiz = F
)

ntmmx3 <- length(mean_tmmx_fire) * 3
ntmmx <- length(mean_tmmx_fire)

DF2 <- data.frame(
  x = c(
    c(mean_tmmx_fire,
      max_tmmx_fire,
      pct95_tmmx_fire),
    c(mean_tmmx_nofire,
      max_tmmx_nofire,
      pct95_tmmx_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = ntmmx3),
  z = rep(rep(1:3, each = ntmmx), 2),
  stringsAsFactors = FALSE
)
str(DF2)
par(mar = c(5, 4, 4, 8), xpd = TRUE)
cols <- rainbow(3, s = 0.5)
boxplot(
  x ~ z + y,
  data = DF2,
  at = c(1:3, 5:7),
  col = cols,
  names = c("", "Fire", "", "", "No Fire", ""),
  xaxs = FALSE
)
legend(
  "topright",
  inset = c(-0.3, .5),
  fill = cols,
  legend = c("mean", "max", "pct95"),
  pch = c(1, 3),
  title = "TMMX",
  horiz = F
)
