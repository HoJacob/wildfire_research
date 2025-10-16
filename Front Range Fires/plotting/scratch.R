library(sp)
library(sf)
library(rgdal)
library(lubridate)

MTBS_fires <- st_read("~/Downloads/mtbs_perimeter_data/mtbs_perims_DD.shp")


Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry
Example_latlim = c(38.24810461646648, 40.889848209898304)
Example_lonlim = c(-108.88426817150125,-103.51195371837625)
store_fire_index = c()

for(fi in 1:nfires){
  current_ignition_date = Ig_Dates[1]
  current_fire = geoem1 = geoem[fi]
  geoem = current_fire[[1]]
  nshapes = length(geoem)
  store_all_lon_lat_for_event = c()
  
  # for (si in 1:nshapes){
  #   lon_lat = geoem[[si]][[1]]
  #   
  #   #plot for example:
  #   if (si == 1){
  #   plot(lon_lat[,1],lon_lat[,2],type="l",xlim = c(min(lon_lat[,1])-0.02 , max(lon_lat[,1]) + 0.02), ylim =c(min(lon_lat[,2])-0.02 , max(lon_lat[,2]) + 0.02) , main = "example plot of fire event for fi",xlab = "lon",ylab = "lat" )
  #   }
  #   if (si > 1){
  #   lines(lon_lat[,1],lon_lat[,2])
  #   }
  #   store_all_lon_lat_for_event = rbind(store_all_lon_lat_for_event,lon_lat)
  }
  lons =store_all_lon_lat_for_event[,1]
  lats =store_all_lon_lat_for_event[,2]
  idx = which(lons >= Example_lonlim[1] & lons<= Example_lonlim[2] & lats >= Example_latlim[1] & lats <= Example_latlim[2])
  if (length(idx) > 0){
    store_fire_index = rbind(store_fire_index,fi)
  }
  file.name = paste0("TestFires/df_",fi,".shp")
  st_write(store_fire_index, file.name)
  pp #inserted here to stop code within for loop for example purposes
}

