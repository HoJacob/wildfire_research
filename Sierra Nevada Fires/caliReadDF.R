library(plotly)
library(tidyverse)
library(sqldf)
library(here)

###Wind Speed#### 
#Average
vsAv1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVSCal1984To2004.csv"))
vsAv2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "averageVSCal2005To2015-1.csv"))
vsAv3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVSCal2016To2024.csv"))
names(vsAv1)
names(vsAv2)
names(vsAv3)
names(vsAv2)[names(vsAv2) == "wind_speed.unit.m.s._1"] <- "wind_speed.unit.m.s._0"
vsAv_all <- rbind(vsAv1, vsAv2, vsAv3)
write.csv(vsAv_all, here("Sierra Nevada Fires", "cali_data", "AverageVSCal_Combined.csv"), row.names = FALSE)

#Maximum
vsMax1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxVSCal1984To2004.csv"))
vsMax2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxVSCal2005To2015-1.csv"))
vsMax3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxVSCal2016To2024.csv"))
names(vsMax1)
names(vsMax2)
names(vsMax3)
names(vsMax2)[names(vsMax2) == "wind_speed.unit.m.s._1"] <- "wind_speed.unit.m.s._0"
vsMax_all <- rbind(vsMax1, vsMax2, vsMax3)
write.csv(vsMax_all, here("Sierra Nevada Fires", "cali_data", "MaxVSCal_Combined.csv"), row.names = FALSE)

#PCT95
vs95Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95VSCal1984To2004.csv"))
vs95Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95VSCal2005To2015-1.csv"))
vs95Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95VSCal2016To2024.csv"))
names(vs95Pct1)
names(vs95Pct2)
names(vs95Pct3)
names(vs95Pct1)[names(vs95Pct1) == "wind_speed.unit.m.s."] <- "wind_speed.unit.m.s._0"
names(vs95Pct2)[names(vs95Pct2) ==  "wind_speed.unit.m.s._1"] <- "wind_speed.unit.m.s._0"
vs95Pct_all <- rbind(vs95Pct1, vs95Pct2, vs95Pct3)
write.csv(vs95Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctVSCal_Combined.csv"), row.names = FALSE)

###VPD#### 
#Average
vpdAv1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVPDCal1984To1997.csv"))
vpdAv2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVPDCal1998To2012.csv"))
vpdAv3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVPDCal2013To2024.csv"))
names(vpdAv1)
names(vpdAv2)
names(vpdAv3)
names(vpdAv2)[names(vpdAv2) == "mean_vapor_pressure_deficit.unit.kPa."] <- "mean_vapor_pressure_deficit.unit.kPa._0"
names(vpdAv3)[names(vpdAv3) == "mean_vapor_pressure_deficit.unit.kPa._0"] <- "mean_vapor_pressure_deficit.unit.kPa._0"
names(vpdAv1)[names(vpdAv1) == "mean_vapor_pressure_deficit.unit.kPa._2"] <- "mean_vapor_pressure_deficit.unit.kPa._0"
vpdAv_all <- rbind(vpdAv1, vpdAv2, vpdAv3)
write.csv(vpdAv_all, here("Sierra Nevada Fires", "cali_data", "AverageVPDCal_Combined.csv"), row.names = FALSE)

#Maximum
vpdMax1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxVPDCal1984To1997.csv"))
vpdMax2 <- read.csv(here("Sierra Nevada Fires", "cali_data","maxVPDCal1998To2012.csv"))
vpdMax3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxVPDCal2013To2024.csv"))
names(vpdMax1)
names(vpdAv2)
names(vpdAv3)
names(vpdMax2)[names(vpdMax2) == "mean_vapor_pressure_deficit.unit.kPa."] <- "mean_vapor_pressure_deficit.unit.kPa._0"
names(vpdMax3)[names(vpdMax3) == "mean_vapor_pressure_deficit.unit.kPa._0"] <- "mean_vapor_pressure_deficit.unit.kPa._0"
names(vpdMax1)[names(vpdMax1) == "mean_vapor_pressure_deficit.unit.kPa._2"] <- "mean_vapor_pressure_deficit.unit.kPa._0"
vpdMax_all <- rbind(vpdMax1, vpdMax2, vpdMax3)
write.csv(vpdMax_all, here("Sierra Nevada Fires", "cali_data", "MaxVPDCal_Combined.csv"), row.names = FALSE)

#PCT95
vpd95Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95VPDCal1984To1997.csv"))
vpd95Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95VPDCal1998To2012.csv"))
vpd95Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95VPDCal2013To2024.csv"))
names(vpd95Pct2)[names(vpd95Pct2) == "mean_vapor_pressure_deficit.unit.kPa."] <- "mean_vapor_pressure_deficit.unit.kPa._0"
names(vpd95Pct3)[names(vpd95Pct3) == "mean_vapor_pressure_deficit.unit.kPa._0"] <- "mean_vapor_pressure_deficit.unit.kPa._0"
names(vpd95Pct1)[names(vpd95Pct1) == "mean_vapor_pressure_deficit.unit.kPa._2"] <- "mean_vapor_pressure_deficit.unit.kPa._0"
vpd95Pct_all <- rbind(vpd95Pct1, vpd95Pct2, vpd95Pct3)
write.csv(vpd95Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctVPDCal_Combined.csv"), row.names = FALSE)

###FM1000#### 
#Average
fm1000Av1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM1000Cal1984To1996.csv"))
fm1000Av2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM1000Cal1997To2009.csv"))
fm1000Av3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM1000Cal2010To2024.csv"))
names(fm1000Av1)
names(fm1000Av2)
names(fm1000Av3)
names(fm1000Av1)[names(fm1000Av1) == "dead_fuel_moisture_1000hr.unit.Percent._1"] <-  "dead_fuel_moisture_1000hr.unit.Percent._0"
fm1000Av_all <- rbind(fm1000Av1, fm1000Av2, fm1000Av3)
write.csv(fm1000Av_all, here("Sierra Nevada Fires", "cali_data", "AverageFM1000Cal_Combined.csv"), row.names = FALSE)

#Maximum
fm1000Max1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxFM1000Cal1984To1996.csv"))
fm1000Max2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxFM1000Cal1997To2009.csv"))
fm1000Max3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxFM1000Cal2010To2024.csv"))
names(fm1000Max1)
names(fm1000Max2)
names(fm1000Max3)
names(fm1000Max1)[names(fm1000Max1) == "dead_fuel_moisture_1000hr.unit.Percent._1"] <-  "dead_fuel_moisture_1000hr.unit.Percent._0"
fm1000Max_all <- rbind(fm1000Max1, fm1000Max2, fm1000Max3)
write.csv(fm1000Max_all, here("Sierra Nevada Fires", "cali_data", "MaxFM1000Cal_Combined.csv"), row.names = FALSE)

#PCT95
fm100095Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95FM1000Cal1984To1996.csv"))
fm100095Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95FM1000Cal1997To2009.csv"))
fm100095Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95FM1000Cal2010To2024.csv"))
names(fm100095Pct1)[names(fm100095Pct1) == "dead_fuel_moisture_1000hr.unit.Percent._1"] <-  "dead_fuel_moisture_1000hr.unit.Percent._0"
fm100095Pct_all <- rbind(fm100095Pct1, fm100095Pct2, fm100095Pct3)
write.csv(fm100095Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctFM1000Cal_Combined.csv"), row.names = FALSE)

###FM100#### 
#Average
fm100Av1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM100Cal1984To1996.csv"))
fm100Av2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM100Cal1997To2014.csv"))
fm100Av3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM100Cal2015To2024.csv"))
names(fm100Av1)
names(fm100Av2)
names(fm100Av3)
names(fm100Av3)[names(fm100Av3) ==   "dead_fuel_moisture_100hr.unit.Percent."] <- "dead_fuel_moisture_100hr.unit.Percent._0"
fm100Av_all <- rbind(fm100Av1, fm100Av2, fm100Av3)
write.csv(fm100Av_all, here("Sierra Nevada Fires", "cali_data", "AverageFM100Cal_Combined.csv"), row.names = FALSE)

#Maximum
fm100Max1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxFM100Cal1984To1996.csv"))
fm100Max2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxFM100Cal1997To2014.csv"))
fm100Max3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxFM100Cal2015To2024.csv"))
names(fm100Max1)
names(fm100Max2)
names(fm100Max3)
names(fm100Max3)[names(fm100Max3) ==   "dead_fuel_moisture_100hr.unit.Percent."] <- "dead_fuel_moisture_100hr.unit.Percent._0"
fm100Max_all <- rbind(fm100Max1, fm100Max2, fm100Max3)
write.csv(fm100Max_all, here("Sierra Nevada Fires", "cali_data", "MaxFM100Cal_Combined.csv"), row.names = FALSE)

#PCT95
fm10095Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95FM100Cal1984To1996.csv"))
fm10095Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95FM100Cal1997To2014.csv"))
fm10095Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95FM100Cal2015To2024.csv"))
names(fm10095Pct3)[names(fm10095Pct3) ==   "dead_fuel_moisture_100hr.unit.Percent."] <- "dead_fuel_moisture_100hr.unit.Percent._0"
fm10095Pct_all <- rbind(fm10095Pct1, fm10095Pct2, fm10095Pct3)
write.csv(fm10095Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctFM100Cal_Combined.csv"), row.names = FALSE)


###SPH#### 
#Average
sphAv1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageSPHCal1984To1996.csv"))
sphAv2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageSPHCal1997To2009.csv"))
sphAv3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageSPHCal2010To2024.csv"))
names(sphAv1)
names(sphAv2)
names(sphAv3)
sphAv_all <- rbind(sphAv1, sphAv2, sphAv3)
write.csv(sphAv_all, here("Sierra Nevada Fires", "cali_data", "AverageSPHCal_Combined.csv"), row.names = FALSE)

#Maximum
sphMax1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxSPHCal1984To1996.csv"))
sphMax2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxSPHCal1997To2009.csv"))
sphMax3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxSPHCal2010To2024.csv"))
names(sphMax1)
names(sphMax2)
names(sphMax3)
sphMax_all <- rbind(sphMax1, sphMax2, sphMax3)
write.csv(sphMax_all, here("Sierra Nevada Fires", "cali_data", "MaxSPHCal_Combined.csv"), row.names = FALSE)

#PCT95
sph95Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95SPHCal1984To1996.csv"))
sph95Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95SPHCal1997To2009.csv"))
sph95Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95SPHCal2010To2024.csv"))
sph95Pct_all <- rbind(sph95Pct1, sph95Pct2, sph95Pct3)
write.csv(sph95Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctSPHCal_Combined.csv"), row.names = FALSE)

###TMMN#### 
#Average
tmmnAv1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMNCal1984To1996.csv"))
tmmnAv2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMNCal1997To2009.csv"))
tmmnAv3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMNCal2010To2024.csv"))
names(tmmnAv1)
names(tmmnAv2)
names(tmmnAv3)
names(tmmnAv1)[names(tmmnAv1) == "air_temperature.unit.K._1"] <-  "air_temperature.unit.K._0"
tmmnAv_all <- rbind(tmmnAv1, tmmnAv2, tmmnAv3)
write.csv(tmmnAv_all, here("Sierra Nevada Fires", "cali_data", "AverageTMMNCal_Combined.csv"), row.names = FALSE)

#Maximum
tmmnMax1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxTMMNCal1984To1996.csv"))
tmmnMax2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxTMMNCal1997To2009.csv"))
tmmnMax3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxTMMNCal2010To2024.csv"))
names(tmmnMax1)
names(tmmnMax2)
names(tmmnMax3)
names(tmmnMax1)[names(tmmnMax1) == "air_temperature.unit.K._1"] <-  "air_temperature.unit.K._0"
tmmnMax_all <- rbind(tmmnMax1, tmmnMax2, tmmnMax3)
write.csv(tmmnMax_all, here("Sierra Nevada Fires", "cali_data", "MaxTMMNCal_Combined.csv"), row.names = FALSE)

#PCT95
tmmn95Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95TMMNCal1984To1996.csv"))
tmmn95Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95TMMNCal1997To2009.csv"))
tmmn95Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95TMMNCal2010To2024.csv"))
names(tmmn95Pct1)[names(tmmn95Pct1) == "air_temperature.unit.K._1"] <-  "air_temperature.unit.K._0"
tmmn95Pct_all <- rbind(tmmn95Pct1, tmmn95Pct2, tmmn95Pct3)
write.csv(tmmn95Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctTMMNCal_Combined.csv"), row.names = FALSE)


###TMMX#### 
#Average
tmmxAv1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMXCal1984To1996.csv"))
tmmxAv2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMXCal1997To2009.csv"))
tmmxAv3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMXCal2010To2024.csv"))
names(tmmxAv1)
names(tmmxAv2)
names(tmmxAv3)
tmmxAv_all <- rbind(tmmxAv1, tmmxAv2, tmmxAv3)
write.csv(tmmxAv_all, here("Sierra Nevada Fires", "cali_data", "AverageTMMXCal_Combined.csv"), row.names = FALSE)

#Maximum
tmmxMax1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxTMMXCal1984To1996.csv"))
tmmxMax2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "maxTMMXCal1997To2009.csv"))
tmmxMax3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxTMMXCal2010To2024.csv"))
names(tmmxMax1)
names(tmmxMax2)
names(tmmxMax3)
tmmxMax_all <- rbind(tmmxMax1, tmmxMax2, tmmxMax3)
write.csv(tmmxMax_all, '~/Rstudio/cali_data/MaxTMMXCal_Combined.csv', row.names = FALSE)

#PCT95
tmmx95Pct1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95TMMXCal1984To1996.csv"))
tmmx95Pct2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95TMMXCal1997To2009.csv"))
tmmx95Pct3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "Percentile95TMMXCal2010To2024.csv"))
tmmx95Pct_all <- rbind(tmmx95Pct1, tmmx95Pct2, tmmx95Pct3)
write.csv(tmmx95Pct_all, here("Sierra Nevada Fires", "cali_data", "95PctTMMXCal_Combined.csv"), row.names = FALSE)




###Read Data####
# --- Wind Speed ---
w1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVSCal_Combined.csv"))
w2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxVSCal_Combined.csv"))
w3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctVSCal_Combined.csv"))
caliMean_ws <- w1$wind_speed.unit.m.s._0
caliMax_ws <- w2$wind_speed.unit.m.s._0
caliPct95_ws <- w3$wind_speed.unit.m.s._0

# --- VPD ---
v1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageVPDCal_Combined.csv"))
v2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxVPDCal_Combined.csv"))
v3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctVPDCal_Combined.csv"))
caliMean_vpd <- v1$mean_vapor_pressure_deficit.unit.kPa._0
caliMax_vpd <- v2$mean_vapor_pressure_deficit.unit.kPa._0
caliPct95_vpd <- v3$mean_vapor_pressure_deficit.unit.kPa._0

# --- FM100 ---
f1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM100Cal_Combined.csv"))
f2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxFM100Cal_Combined.csv"))
f3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctFM100Cal_Combined.csv"))
caliMean_fm100 <- f1$dead_fuel_moisture_100hr.unit.Percent._0
caliMax_fm100 <- f2$dead_fuel_moisture_100hr.unit.Percent._0
caliPct95_fm100 <- f3$dead_fuel_moisture_100hr.unit.Percent._0

# --- FM1000 ---
ff1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageFM1000Cal_Combined.csv"))
ff2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxFM1000Cal_Combined.csv"))
ff3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctFM1000Cal_Combined.csv"))
caliMean_fm1000 <- ff1$dead_fuel_moisture_1000hr.unit.Percent._0
caliMax_fm1000 <- ff2$dead_fuel_moisture_1000hr.unit.Percent._0
caliPct95_fm1000 <- ff3$dead_fuel_moisture_1000hr.unit.Percent._0

# --- SPH ---
sp1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageSPHCal_Combined.csv"))
sp2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxSPHCal_Combined.csv"))
sp3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctSPHCal_Combined.csv"))
caliMean_sph <- sp1$specific_humidity.unit.kg.kg._0
caliMax_sph <- sp2$specific_humidity.unit.kg.kg._0
caliPct95_sph <- sp3$specific_humidity.unit.kg.kg._0

# --- TMMN ---
n1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMNCal_Combined.csv"))
n2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxTMMNCal_Combined.csv"))
n3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctTMMNCal_Combined.csv"))
caliMean_tmmn <- n1$air_temperature.unit.K._0
caliMax_tmmn <- n2$air_temperature.unit.K._0
caliPct95_tmmn <- n3$air_temperature.unit.K._0

# --- TMMX ---
x1 <- read.csv(here("Sierra Nevada Fires", "cali_data", "AverageTMMXCal_Combined.csv"))
x2 <- read.csv(here("Sierra Nevada Fires", "cali_data", "MaxTMMXCal_Combined.csv"))
x3 <- read.csv(here("Sierra Nevada Fires", "cali_data", "95PctTMMXCal_Combined.csv"))
caliMean_tmmx <- x1$air_temperature.unit.K._0
caliMax_tmmx <- x2$air_temperature.unit.K._0
caliPct95_tmmx <- x3$air_temperature.unit.K._0

###Create Fires####
caliTestDate <- as.character(caliMean_ws$Time)
noPrescribed <- read.csv(here("Sierra Nevada Fires", "cali_data", "CaliNoPrescribedFireDates.csv"), header = FALSE)
caliFireNoPrescribedDates <- as.character(noPrescribed$V1)


caliTestDate_clean <- substr(caliTestDate, 1, 10)

caliFire <- rep(0, length(caliTestDate))

# Loop through ignition dates and mark matches
for (fi in 1:length(caliFireNoPrescribedDates)) {
  match_index <- grep(caliFireNoPrescribedDates[fi], caliTestDate_clean)
  if (length(match_index) > 0) {
    caliFire[match_index[1]] <- 1
  }
}

# Check length
length(caliFire)
notAFire <- which(caliFire == 0)
isAFire <- which(caliFire ==1)

length(notAFire)
length(isAFire)

length(caliTestDate)
length(caliFireNoPrescribedDates)


###Fire Predictors Data Frame#####
CaliFirePredictors <- data.frame(
  caliFire,
  caliMean_ws,
  caliMax_ws,
  caliPct95_ws,
  caliMean_vpd,
  caliMax_vpd,
  caliPct95_vpd,
  caliMean_fm100,
  caliMax_fm100,
  caliPct95_fm100,
  caliMean_fm1000,
  caliMax_fm1000,
  caliPct95_fm1000,
  caliMean_sph,
  caliMax_sph,
  caliPct95_sph,
  caliMean_tmmn,
  caliMax_tmmn,
  caliPct95_tmmn,
  caliMean_tmmx,
  caliMax_tmmx,
  caliPct95_tmmx
)
str(CaliFirePredictors)
head(CaliFirePredictors)
write.csv(CaliFirePredictors, here("Sierra Nevada Fires", "cali_data", "CaliFirePredictors.csv" ), row.names=FALSE)

###Initialize Seasonal Indices####
idx_spring = c()
idx_summer = c()
idx_fall = c()
idx_winter = c()
idx_firespring = c()
idx_firesummer = c()
idx_firefall = c()
idx_firewinter = c()

for (fg in 1:length(caliTestDate)) {
  mm=format(as.Date(caliTestDate[fg], format = "%Y-%m-%d"),"%m")
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


length(caliTestDate)
a = length(idx_spring) + length(idx_summer) + length(idx_fall) + length(idx_winter)
print(a)

###Seasonal Fire Predictors Data Frame####
CaliWinterFirePredictors <- data.frame(
  caliFire[idx_winter],
  caliMean_ws[idx_winter],
  caliMax_ws[idx_winter],
  caliPct95_ws[idx_winter],
  caliMean_vpd[idx_winter],
  caliMax_vpd[idx_winter],
  caliPct95_vpd[idx_winter],
  caliMean_fm100[idx_winter],
  caliMax_fm100[idx_winter],
  caliPct95_fm100[idx_winter],
  caliMean_fm1000[idx_winter],
  caliMax_fm1000[idx_winter],
  caliPct95_fm1000[idx_winter],
  caliMean_sph[idx_winter],
  caliMax_sph[idx_winter],
  caliPct95_sph[idx_winter],
  caliMean_tmmn[idx_winter],
  caliMax_tmmn[idx_winter],
  caliPct95_tmmn[idx_winter],
  caliMean_tmmx[idx_winter],
  caliMax_tmmx[idx_winter],
  caliPct95_tmmx[idx_winter]
)
CaliSpringFirePredictors <- data.frame(
  caliFire[idx_spring],
  caliMean_ws[idx_spring],
  caliMax_ws[idx_spring],
  caliPct95_ws[idx_spring],
  caliMean_vpd[idx_spring],
  caliMax_vpd[idx_spring],
  caliPct95_vpd[idx_spring],
  caliMean_fm100[idx_spring],
  caliMax_fm100[idx_spring],
  caliPct95_fm100[idx_spring],
  caliMean_fm1000[idx_spring],
  caliMax_fm1000[idx_spring],
  caliPct95_fm1000[idx_spring],
  caliMean_sph[idx_spring],
  caliMax_sph[idx_spring],
  caliPct95_sph[idx_spring],
  caliMean_tmmn[idx_spring],
  caliMax_tmmn[idx_spring],
  caliPct95_tmmn[idx_spring],
  caliMean_tmmx[idx_spring],
  caliMax_tmmx[idx_spring],
  caliPct95_tmmx[idx_spring]
)
CaliSummerFirePredictors <- data.frame(
  caliFire[idx_summer],
  caliMean_ws[idx_summer],
  caliMax_ws[idx_summer],
  caliPct95_ws[idx_summer],
  caliMean_vpd[idx_summer],
  caliMax_vpd[idx_summer],
  caliPct95_vpd[idx_summer],
  caliMean_fm100[idx_summer],
  caliMax_fm100[idx_summer],
  caliPct95_fm100[idx_summer],
  caliMean_fm1000[idx_summer],
  caliMax_fm1000[idx_summer],
  caliPct95_fm1000[idx_summer],
  caliMean_sph[idx_summer],
  caliMax_sph[idx_summer],
  caliPct95_sph[idx_summer],
  caliMean_tmmn[idx_summer],
  caliMax_tmmn[idx_summer],
  caliPct95_tmmn[idx_summer],
  caliMean_tmmx[idx_summer],
  caliMax_tmmx[idx_summer],
  caliPct95_tmmx[idx_summer]
)
CaliFallFirePredictors <- data.frame(
  caliFire[idx_fall],
  caliMean_ws[idx_fall],
  caliMax_ws[idx_fall],
  caliPct95_ws[idx_fall],
  caliMean_vpd[idx_fall],
  caliMax_vpd[idx_fall],
  caliPct95_vpd[idx_fall],
  caliMean_fm100[idx_fall],
  caliMax_fm100[idx_fall],
  caliPct95_fm100[idx_fall],
  caliMean_fm1000[idx_fall],
  caliMax_fm1000[idx_fall],
  caliPct95_fm1000[idx_fall],
  caliMean_sph[idx_fall],
  caliMax_sph[idx_fall],
  caliPct95_sph[idx_fall],
  caliMean_tmmn[idx_fall],
  caliMax_tmmn[idx_fall],
  caliPct95_tmmn[idx_fall],
  caliMean_tmmx[idx_fall],
  caliMax_tmmx[idx_fall],
  caliPct95_tmmx[idx_fall]
)

fa <-length(which(caliFire[idx_fall] == 1))
win<- length(which(caliFire[idx_winter] == 1))
summer <- length(which(caliFire[idx_summer] == 1))
spring<-length(which(caliFire[idx_spring] == 1))

fa+win+summer+spring

write.csv(CaliWinterFirePredictors, here("Sierra Nevada Fires", "cali_data", "CaliWinterFirePredictors.csv" ), row.names=FALSE)
write.csv(CaliSpringFirePredictors, here("Sierra Nevada Fires", "cali_data", "CaliSpringFirePredictors.csv" ), row.names=FALSE)
write.csv(CaliSummerFirePredictors, here("Sierra Nevada Fires", "cali_data", "CaliSummerFirePredictors.csv" ), row.names=FALSE)
write.csv(CaliFallFirePredictors, here("Sierra Nevada Fires", "cali_data", "CaliFallFirePredictors.csv" ), row.names=FALSE)


