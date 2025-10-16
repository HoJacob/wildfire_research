library(sp)
library(sf)
library(rgdal)
library(lubridate)
library(PBSmapping)
library(tidyr)
library(here)

MTBS_fires <- st_read(here("Front Range Fires", "mtbs_perimeter_data", "mtbs_perims_DD.shp"))

Ig_Dates = MTBS_fires$Ig_Date
Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry
Example_latlim = c(37, 41)
Example_lonlim = c(-107, -103)
# Example_latlim = c(40, 42)
# Example_lonlim = c(-117 , -116)
store_fire_index = c()


for (fi in 1:nfires) {
  current_ignition_date = Ig_Dates[1]
  current_fire = geoem[[1]] = geoem[[fi]]
  # geoem = current_fire[[1]]
  # nshapes = length(geoem)
  nshapes = length(current_fire)
  #fire_type = MTBS_fires$Incid_Type[[fi]]
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
        lats >= Example_latlim[1] & 
        lats <= Example_latlim[2]
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
Fire_type = MTBS_fires$Incid_Type[store_fire_index]
print(sort(Ig_Dates_trim))

data_to_save <- data.frame(
  Ig_Dates_trim,
  BurnBndAc
)
write.csv(data_to_save, file = "BurnAcres_TS.csv", row.names = FALSE)

 # write.csv(sort(Ig_Dates_trim),file='~/Rstudio/new_file.csv')
#plot
plot(Ig_Dates_trim, BurnBndAc, type="h", col="red", lwd=5, xlab="Dates (Years)", ylab="Burned Area (Acres)", main="Front Range Burned Area from 1984-2022")
#Apply index to trim

library(ggplot2)

# Assuming you have a data frame named "your_data" with columns "Ig_Dates_trim" and "BurnBndAc"
PlotDF <- data.frame(Time = Ig_Dates_trim,
                  BurnedArea = BurnBndAc)

ggplot(PlotDF, aes(x = Time, y = BurnedArea)) +
  geom_bar(stat = "identity", fill = "red", width = 40)
  labs(title = "Front Range Burned Area from 1984-2022",
     x = "Years", y = "Burned Area (Acres)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title = element_text(size = 15),
        axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)
  )

scale_x_date(expand = expansion(mult = c(0, 0.05)))  # Adjust x-axis limits to remove space below the x-axis


ggplot(mapping =  aes(x = Ig_Dates_trim, y = BurnBndAc)) +
  geom_bar(stat = "identity", fill = "red", width = 50) +
  labs(title = "Front Range Burned Area from 1984-2022",
       x = "Years", y = "Burned Area (Acres)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title = element_text(size = 12),
        axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)
        )

bar_plot <- ggplot(data = PlotDF, aes(x = Time, y = BurnedArea)) +
  geom_bar(stat = "identity", fill = "red", width = 0.7) +
  labs(title = "Front Range Burned Area from 1984-2022",
       x = "Years", y = "Burned Area (Acres)") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    axis.title = element_text(size = 15),
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)
  )

library(dplyr)
summarized_data <- PlotDF %>%
  group_by(Year = lubridate::year(Ig_Dates_trim)) %>%
  summarize(TotalBurnedAcres = sum(BurnBndAc))

bar_plot +
  geom_line(data = summarized_data, aes(x = as.Date(paste0(Year, "-01-01")), y = TotalBurnedAcres), color = "blue")

largeFire = quantile(BurnBndAc, probs = c(.25, .5, .75))
print(largeFire)

large_fire_index = c()
small_fire_index = c()
FireSize = c()
for (i in 1:length(store_fire_index) ){
  if(BurnBndAc[i]>9393) {
    large_fire_index = rbind(large_fire_index, store_fire_index[i])
    FireSize=rbind(FireSize, 'large')
  }
  else {
    small_fire_index = rbind(small_fire_index, store_fire_index[i])
    FireSize=rbind(FireSize, 'small')
  }
}

dfrm <- data.frame(Time=Ig_Dates_trim, BrunAce=BurnBndAc,FireSize=FireSize)
write.table(dfrm, file=here("Front Range Fires", "data", "new_file.csv"), sep=",", row.names=FALSE, col.names=TRUE)


MTBS_fires$Incid_Type

indexes_to_remove <- c(23,32,122,135,141,155)
Ig_dates_NoPrescribed <- Ig_Dates_trim[-indexes_to_remove]

write.table(Ig_dates_NoPrescribed, file = here("Front Range Fires", "data", "NoPrescribedFireDates.csv"), sep = ",", col.names = FALSE, row.names = FALSE, quote = FALSE)

