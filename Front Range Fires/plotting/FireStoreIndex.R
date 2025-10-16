library(sp)
library(sf)
library(rgdal)
library(lubridate)
library(PBSmapping)
library(tidyr)

MTBS_fires = st_read("~/Downloads/mtbs_perimeter_data/mtbs_perims_DD.shp")
Ig_Dates = MTBS_fires$Ig_Date
Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry
Example_latlim = c(37, 41)
Example_lonlim = c(-107, -103)
# Example_latlim = c(40, 42)
# Example_lonlim = c(-117 , -116)
store_fire_index = c()

# for(fi in 1:nfires){
#   current_fire = geoem[[fi]]
#   # geoem = current_fire[[1]]
#   nshapes = length(current_fire)
#   if(nshapes>=1 && !is.null(nshapes) ) {
#   for(si in 1:nshapes) {
#   lon_lat=current_fire[[si]][[1]]
#    print(lon_lat[,1])
#    print(lon_lat[,2])
#    # for (ti in 1:length(lon_lat))
#    # tt=lon_lat[[ti]]
#    # print(tt[,1])
#    # print(tt[,2])
#    }
#   }
# }


#store_all_lon_lat_for_event = c()

for (fi in 1:nfires) {
  current_ignition_date = Ig_Dates[1]
  current_fire = geoem[[1]] = geoem[[fi]]
  # geoem = current_fire[[1]]
  # nshapes = length(geoem)
  nshapes = length(current_fire)
  store_all_lon_lat_for_event = c()
  if (nshapes >= 1 && !is.null(nshapes)) {
    for (si in 1:nshapes) {
      # lon_lat = geoem[[si]]
      lon_lat = current_fire[[si]][[1]]
      #    DIM = dim(lon_lat)
      # if (length(DIM[,1]) > 3){
      # #plot for example:
      #  if (si == 1){
      #    plot(lon_lat[,1],lon_lat[,2],type="l",xlim = c(min(lon_lat[,1])-0.02 , max(lon_lat[,1]) + 0.02), ylim =c(min(lon_lat[,2])-0.02 , max(lon_lat[,2]) + 0.02) , main = "example plot of fire event for fi",xlab = "lon",ylab = "lat" )
      #  }
      # if (si > 1){
      #   lines(lon_lat[,1],lon_lat[,2])
      # }
      store_all_lon_lat_for_event = rbind(store_all_lon_lat_for_event, lon_lat)
    }
  }
  # DIM = dim(store_all_lon_lat_for_event)
  # if (length(DIM[, 1]) > 3) {
    lons = store_all_lon_lat_for_event[, 1]
    lats = store_all_lon_lat_for_event[, 2]
    idx = which(
        lons >= Example_lonlim[1] &
        lons <= Example_lonlim[2] &
        lats >= Example_latlim[1] & lats <= Example_latlim[2]
    )
    if (length(idx) > 0) {
      store_fire_index = rbind(store_fire_index, fi)
    }
 # }
 #  pp #inserted here to stop code within for loop for example purposes
  
}



#Apply index to trim
MTBS_fires_trim = MTBS_fires$geometry[store_fire_index]
Ig_Dates_trim = MTBS_fires$Ig_Date[store_fire_index]
BurnBndAc = MTBS_fires$BurnBndAc[store_fire_index]

#plot
plot(Ig_Dates_trim, BurnBndAc, type="l", col="red", lwd=5, xlab="Dates (Years)", ylab="Burned Area (Acres)", main="CO Burned Area from 1984-2022")



