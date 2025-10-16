library(plotly)
library(tidyverse)
library(sqldf)
library(here)
#Columns

xxx <- read.csv(here("Front Range Fires", "data", "new_file.csv"))
firedates = xxx$Time
brunace=xxx$BrunAce
fsize=xxx$FireSize

##have to run fire store index first

fireNoPrescribedDates <- read.csv(here("Front Range Fires", "data", "NoPrescribedFireDates.csv"),
                                  header = FALSE
)
fireNoPrescribedDates = fireNoPrescribedDates$V1

#fireNoPrescribedDates = Ig_dates_NoPrescribed

###Read in data####
library(here)
fr_data <- here("Front Range Fires", "data")

x <- read.csv(file.path(fr_data, "VS84-21_average.csv"))
xx <- read.csv(file.path(fr_data, "VS84-21_max.csv"))
y  <- read.csv(file.path(fr_data, "VPD84-21_average.csv"))
yy <- read.csv(file.path(fr_data, "VPD84-21_max.csv"))
z  <- read.csv(file.path(fr_data, "VS-95PRCNTLA.csv"))
a  <- read.csv(file.path(fr_data, "VPD-95PRCNTLA.csv"))
f1 <- read.csv(file.path(fr_data, "FM100-95percentile.csv"))
f2 <- read.csv(file.path(fr_data, "FM100-average.csv"))
f3 <- read.csv(file.path(fr_data, "FM100-max.csv"))
f4 <- read.csv(file.path(fr_data, "FM1000-95percentile.csv"))
f5 <- read.csv(file.path(fr_data, "FM1000-average.csv"))
f6 <- read.csv(file.path(fr_data, "FM1000-max.csv"))
f7 <- read.csv(file.path(fr_data, "PDSI-95percentile.csv"))
f8 <- read.csv(file.path(fr_data, "PDSI-average.csv"))
f9 <- read.csv(file.path(fr_data, "PDSI-max.csv"))
f10 <- read.csv(file.path(fr_data, "PET95percentile.csv"))
f11 <- read.csv(file.path(fr_data, "PETaverage.csv"))
f12 <- read.csv(file.path(fr_data, "PETmax.csv"))
f13 <- read.csv(file.path(fr_data, "SPEI90-95percentile.csv"))
f14 <- read.csv(file.path(fr_data, "SPEI90-average.csv"))
f15 <- read.csv(file.path(fr_data, "SPEI90-max.csv"))
f16 <- read.csv(file.path(fr_data, "SPH-95percentile.csv"))
f17 <- read.csv(file.path(fr_data, "SPH-average.csv"))
f18 <- read.csv(file.path(fr_data, "SPH-max.csv"))
f19 <- read.csv(file.path(fr_data, "SPI90-95percentile.csv"))
f20 <- read.csv(file.path(fr_data, "SPI90-average.csv"))
f21 <- read.csv(file.path(fr_data, "SPI90-max.csv"))
f22 <- read.csv(file.path(fr_data, "TMMN-95percentile.csv"))
f23 <- read.csv(file.path(fr_data, "TMMN-average.csv"))
f24 <- read.csv(file.path(fr_data, "TMMN-max.csv"))
f25 <- read.csv(file.path(fr_data, "TMMX-95percentile.csv"))
f26 <- read.csv(file.path(fr_data, "TMMX-average.csv"))
f27 <- read.csv(file.path(fr_data, "TMMX-max.csv"))

###Adjust Scaling in predictor####
#query adjusts dates in certain predictors
mean_ws = x$GridMath.applyFunctionOverGrid2D.S *10.0
testDate = x$Time
max_ws = xx$GridMath.applyFunctionOverGrid2D.S*10.0
mean_vpd = y$GridMath.applyFunctionOverGrid2D.S*100.0
max_vpd = yy$GridMath.applyFunctionOverGrid2D.S*100.0
pct95_wind = z$GridMath.applyFunctionOverLevels.S*10.0
pct95_vpd = a$PPPPP*100.0
pct95_fm100=f1$dead_fuel_moisture_100hr.unit.Percent.*10.0
mean_fm100=f2$dead_fuel_moisture_100hr.unit.Percent.*10.0
max_fm100=f3$dead_fuel_moisture_100hr.unit.Percent.*10.0
pct95_fm1000=f4$dead_fuel_moisture_1000hr.unit.Percent.*10.0
mean_fm1000=f5$dead_fuel_moisture_1000hr.unit.Percent.*10.0
max_fm1000=f6$dead_fuel_moisture_1000hr.unit.Percent.*10.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'pdsi.unit..' as a4
    from x as a
    left join f7 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
pct95_pdsi=result$a4

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'pdsi.unit..' as a4
    from x as a
    left join f8 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
mean_pdsi=result$a4

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'pdsi.unit..' as a4
    from x as a
    left join f9 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
max_pdsi=result$a4

pct95_pet=f10$potential_evapotranspiration.unit.mm.*10.0
mean_pet=f11$potential_evapotranspiration.unit.mm.*10.0
max_pet=f12$potential_evapotranspiration.unit.mm.*10.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'spei.unit..' as a4
    from x as a
    left join f13 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
pct95_spei90=result$a4*100.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'spei.unit..' as a4
    from x as a
    left join f14 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
mean_spei90=result$a4 *100.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'spei.unit..' as a4
    from x as a
    left join f15 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
max_spei90=result$a4*100.0

pct95_sph=f16$specific_humidity.unit.kg.kg.*100000.0
mean_sph=f17$specific_humidity.unit.kg.kg.*100000.0
max_sph=f18$specific_humidity.unit.kg.kg.*100000.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'spi.unit..' as a4
    from x as a
    left join f19 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
pct95_spi90=result$a4*100.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'spi.unit..' as a4
    from x as a
    left join f20 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
mean_spi90=result$a4*100.0

query <- "select a.'GridMath.applyFunctionOverGrid2D.S' as a1, a.Time as a2, 
b.Time as a3, b.'spi.unit..' as a4
    from x as a
    left join f21 as b on
             ' ' || b.Time || ' ' like ' ' || a.Time || ' %'"
result <- sqldf(query)
max_spi90=result$a4*100.0

pct95_tmmn=f22$air_temperature.unit.K.*10.0
mean_tmmn=f23$air_temperature.unit.K.*10.0
max_tmmn=f24$air_temperature.unit.K.*10.0
pct95_tmmx=f25$air_temperature.unit.K.*10.0
mean_tmmx=f26$air_temperature.unit.K.*10.0
max_tmmx=f27$air_temperature.unit.K.*10.0

###Initialize Indices####
store_fire_index = c()
idx_spring = c()
idx_summer = c()
idx_fall = c()
idx_winter = c()
idx_firespring = c()
idx_firesummer = c()
idx_firefall = c()
idx_firewinter = c()
start_ff = 1

for (fg in 1:length(testDate)) {
  mm=format(as.Date(testDate[fg], format = "%Y-%m-%d"),"%m")
  if (mm=="03" || mm=="04" || mm =="05") {
    idx_spring = rbind(idx_spring, fg)
  }
  if (mm=="06" || mm=="07" || mm =="08") {
    idx_summer = rbind(idx_summer, fg)
  }
  if (mm=="09" || mm=="10" || mm =="11") {
    idx_fall = rbind(idx_fall, fg)
  }
  if (mm=="12" || mm=="01" || mm =="02") {
    idx_winter = rbind(idx_winter, fg)
  }
}

for (fi in 1:length(fireNoPrescribedDates)) {
  mm=format(as.Date(fireNoPrescribedDates[fi], format = "%Y-%m-%d"),"%m")
  for (ff in start_ff:length(testDate)) {
    if (grepl(fireNoPrescribedDates[fi], testDate[ff])) {
      store_fire_index = rbind(store_fire_index, ff)
      if (mm=="03" || mm=="04" || mm =="05") {
        idx_firespring = rbind(idx_firespring, ff)
      }
      if (mm=="06" || mm=="07" || mm =="08") {
        idx_firesummer = rbind(idx_firesummer, ff)
      }
      if (mm=="09" || mm=="10" || mm =="11") {
        idx_firefall = rbind(idx_firefall, ff)
      }
      if (mm=="12" || mm=="01" || mm =="02") {
        idx_firewinter = rbind(idx_firewinter, ff)
      }
      start_ff = ff
      break
    }
  }
}

store_fire_index = c()
large_fire_index = c()
small_fire_index = c()
start_ff = 1
for (fi in 1:length(fireNoPrescribedDates)) {
  mm=format(as.Date(fireNoPrescribedDates[fi], format = "%Y-%m-%d"),"%m")
  for (ff in start_ff:length(testDate)) {
    if (grepl(fireNoPrescribedDates[fi], testDate[ff])) {
      store_fire_index = rbind(store_fire_index, ff)
      if (fsize[fi] =="small") {
        small_fire_index = rbind(small_fire_index, ff)
      }
      if (fsize[fi] =="large") {
        large_fire_index = rbind(large_fire_index, ff)
      }
      start_ff = ff
      break
    }
  }
}
# print(store_fire_index)
# print(large_fire_index)
# print(small_fire_index)

fire <- rep(0, length(mean_ws))

startff=1
for (fi in 1:length(fireNoPrescribedDates)) {
  for (ff in 1:length(testDate)) {
    if (grepl(fireNoPrescribedDates[fi], testDate[ff])) {
      fire[ff]=1
      break
    }
  }
}

which(fire >1)
which(fire >0)
which(fire ==1)

###Create data sets with factor and predictors####
FirePredictors <- cbind.data.frame(
  fire,
  pct95_wind,
  mean_ws,
  max_ws,
  pct95_vpd,
  mean_vpd,
  max_vpd,
  pct95_fm100,
  mean_fm100,
  max_fm100,
  pct95_fm1000,
  mean_fm1000,
  max_fm1000,
  pct95_pdsi,
  mean_pdsi,
  max_pdsi,
  pct95_pet,
  mean_pet,
  max_pet,
  pct95_spei90,
  mean_spei90,
  max_spei90,
  pct95_sph,
  mean_sph,
  max_sph,
  pct95_spi90,
  mean_spi90,
  max_spi90,
  pct95_tmmn,
  mean_tmmn,
  max_tmmn,
  pct95_tmmx,
  mean_tmmx,
  max_tmmx
)
str(FirePredictors)

##rescaled version of predictors
library(scales)
rescaled_pct95_wind = rescale(pct95_wind)
rescaled_mean_ws = rescale(mean_ws)
rescaled_max_ws = rescale(max_ws)
rescaled_pct95_vpd = rescale(pct95_vpd)
rescaled_mean_vpd = rescale(mean_vpd)
rescaled_max_vpd = rescale(max_vpd)
rescaled_pct95_fm100 = rescale(pct95_fm100)
rescaled_mean_fm100 = rescale(mean_fm100)
rescaled_max_fm100 = rescale(max_fm100)
rescaled_pct95_fm1000 = rescale(pct95_fm1000)
rescaled_mean_fm1000 = rescale(mean_fm1000)
rescaled_max_fm1000 = rescale(max_fm1000)
rescaled_pct95_pdsi = rescale(pct95_pdsi)
rescaled_mean_pdsi = rescale(mean_pdsi)
rescaled_max_pdsi = rescale(max_pdsi)
rescaled_pct95_pet = rescale(pct95_pet)
rescaled_mean_pet = rescale(mean_pet)
rescaled_max_pet = rescale(max_pet)
rescaled_pct95_spei90 = rescale(pct95_spei90)
rescaled_mean_spei90 = rescale(mean_spei90)
rescaled_max_spei90 = rescale(max_spei90)
rescaled_pct95_sph = rescale(pct95_sph)
rescaled_mean_sph = rescale(mean_sph)
rescaled_max_sph = rescale(max_sph)
rescaled_pct95_spi90 = rescale(pct95_spi90)
rescaled_mean_spi90 = rescale(mean_spi90)
rescaled_max_spi90 = rescale(max_spi90)
rescaled_pct95_tmmn = rescale(pct95_tmmn)
rescaled_mean_tmmn = rescale(mean_tmmn)
rescaled_max_tmmn = rescale(max_tmmn)
rescaled_pct95_tmmx = rescale(pct95_tmmx)
rescaled_mean_tmmx = rescale(mean_tmmx)
rescaled_max_tmmx = rescale(max_tmmx)

RescaledFirePredictors <- cbind.data.frame(
  fire,
  rescaled_pct95_wind,
  rescaled_mean_ws,
  rescaled_max_ws,
  rescaled_pct95_vpd,
  rescaled_mean_vpd,
  rescaled_max_vpd,
  rescaled_pct95_fm100,
  rescaled_mean_fm100,
  rescaled_max_fm100,
  rescaled_pct95_fm1000,
  rescaled_mean_fm1000,
  rescaled_max_fm1000,
  rescaled_pct95_pdsi,
  rescaled_mean_pdsi,
  rescaled_max_pdsi,
  rescaled_pct95_pet,
  rescaled_mean_pet,
  rescaled_max_pet,
  rescaled_pct95_spei90,
  rescaled_mean_spei90,
  rescaled_max_spei90,
  rescaled_pct95_sph,
  rescaled_mean_sph,
  rescaled_max_sph,
  rescaled_pct95_spi90,
  rescaled_mean_spi90,
  rescaled_max_spi90,
  rescaled_pct95_tmmn,
  rescaled_mean_tmmn,
  rescaled_max_tmmn,
  rescaled_pct95_tmmx,
  rescaled_mean_tmmx,
  rescaled_max_tmmx
)
str(RescaledFirePredictors)

##seasonal predictors
WinterFirePredictors <- cbind.data.frame(
  fire[idx_winter],
  pct95_wind[idx_winter],
  mean_ws[idx_winter],
  max_ws[idx_winter],
  pct95_vpd[idx_winter],
  mean_vpd[idx_winter],
  max_vpd[idx_winter],
  pct95_fm100[idx_winter],
  mean_fm100[idx_winter],
  max_fm100[idx_winter],
  pct95_fm1000[idx_winter],
  mean_fm1000[idx_winter],
  max_fm1000[idx_winter],
  pct95_pdsi[idx_winter],
  mean_pdsi[idx_winter],
  max_pdsi[idx_winter],
  pct95_pet[idx_winter],
  mean_pet[idx_winter],
  max_pet[idx_winter],
  pct95_spei90[idx_winter],
  mean_spei90[idx_winter],
  max_spei90[idx_winter],
  pct95_sph[idx_winter],
  mean_sph[idx_winter],
  max_sph[idx_winter],
  pct95_spi90[idx_winter],
  mean_spi90[idx_winter],
  max_spi90[idx_winter],
  pct95_tmmn[idx_winter],
  mean_tmmn[idx_winter],
  max_tmmn[idx_winter],
  pct95_tmmx[idx_winter],
  mean_tmmx[idx_winter],
  max_tmmx[idx_winter]
)
str(WinterFirePredictors)

SpringFirePredictors <- cbind.data.frame(
  fire[idx_spring],
  pct95_wind[idx_spring],
  mean_ws[idx_spring],
  max_ws[idx_spring],
  pct95_vpd[idx_spring],
  mean_vpd[idx_spring],
  max_vpd[idx_spring],
  pct95_fm100[idx_spring],
  mean_fm100[idx_spring],
  max_fm100[idx_spring],
  pct95_fm1000[idx_spring],
  mean_fm1000[idx_spring],
  max_fm1000[idx_spring],
  pct95_pdsi[idx_spring],
  mean_pdsi[idx_spring],
  max_pdsi[idx_spring],
  pct95_pet[idx_spring],
  mean_pet[idx_spring],
  max_pet[idx_spring],
  pct95_spei90[idx_spring],
  mean_spei90[idx_spring],
  max_spei90[idx_spring],
  pct95_sph[idx_spring],
  mean_sph[idx_spring],
  max_sph[idx_spring],
  pct95_spi90[idx_spring],
  mean_spi90[idx_spring],
  max_spi90[idx_spring],
  pct95_tmmn[idx_spring],
  mean_tmmn[idx_spring],
  max_tmmn[idx_spring],
  pct95_tmmx[idx_spring],
  mean_tmmx[idx_spring],
  max_tmmx[idx_spring]
)

SummerFirePredictors <- cbind.data.frame(
  fire[idx_summer],
  pct95_wind[idx_summer],
  mean_ws[idx_summer],
  max_ws[idx_summer],
  pct95_vpd[idx_summer],
  mean_vpd[idx_summer],
  max_vpd[idx_summer],
  pct95_fm100[idx_summer],
  mean_fm100[idx_summer],
  max_fm100[idx_summer],
  pct95_fm1000[idx_summer],
  mean_fm1000[idx_summer],
  max_fm1000[idx_summer],
  pct95_pdsi[idx_summer],
  mean_pdsi[idx_summer],
  max_pdsi[idx_summer],
  pct95_pet[idx_summer],
  mean_pet[idx_summer],
  max_pet[idx_summer],
  pct95_spei90[idx_summer],
  mean_spei90[idx_summer],
  max_spei90[idx_summer],
  pct95_sph[idx_summer],
  mean_sph[idx_summer],
  max_sph[idx_summer],
  pct95_spi90[idx_summer],
  mean_spi90[idx_summer],
  max_spi90[idx_summer],
  pct95_tmmn[idx_summer],
  mean_tmmn[idx_summer],
  max_tmmn[idx_summer],
  pct95_tmmx[idx_summer],
  mean_tmmx[idx_summer],
  max_tmmx[idx_summer]
)
FallFirePredictors <- cbind.data.frame(
  fire[idx_fall],
  pct95_wind[idx_fall],
  mean_ws[idx_fall],
  max_ws[idx_fall],
  pct95_vpd[idx_fall],
  mean_vpd[idx_fall],
  max_vpd[idx_fall],
  pct95_fm100[idx_fall],
  mean_fm100[idx_fall],
  max_fm100[idx_fall],
  pct95_fm1000[idx_fall],
  mean_fm1000[idx_fall],
  max_fm1000[idx_fall],
  pct95_pdsi[idx_fall],
  mean_pdsi[idx_fall],
  max_pdsi[idx_fall],
  pct95_pet[idx_fall],
  mean_pet[idx_fall],
  max_pet[idx_fall],
  pct95_spei90[idx_fall],
  mean_spei90[idx_fall],
  max_spei90[idx_fall],
  pct95_sph[idx_fall],
  mean_sph[idx_fall],
  max_sph[idx_fall],
  pct95_spi90[idx_fall],
  mean_spi90[idx_fall],
  max_spi90[idx_fall],
  pct95_tmmn[idx_fall],
  mean_tmmn[idx_fall],
  max_tmmn[idx_fall],
  pct95_tmmx[idx_fall],
  mean_tmmx[idx_fall],
  max_tmmx[idx_fall]
)

write.csv(WinterFirePredictors,
          here("Front Range Fires", "data", "WinterFirePredictors.csv"),
          row.names = FALSE)
write.csv(SpringFirePredictors,
          here("Front Range Fires", "data", "SpringFirePredictors.csv"),
          row.names = FALSE)
write.csv(SummerFirePredictors,
          here("Front Range Fires", "data", "SummerFirePredictors.csv"),
          row.names = FALSE)
write.csv(FallFirePredictors,
          here("Front Range Fires", "data", "FallFirePredictors.csv"),
          row.names = FALSE)


write.csv(FirePredictors,
          here("Front Range Fires", "data", "FirePredictors.csv"),
          row.names = FALSE)
write.csv(RescaledFirePredictors,
          here("Front Range Fires", "data", "RescaledFirePredictors.csv"),
          row.names = FALSE)

