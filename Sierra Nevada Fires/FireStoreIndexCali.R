library(sp)
library(sf)
library(rgdal)
library(lubridate)
library(PBSmapping)
library(tidyr)
library(here)

###CA All BASE CODE DO NOT RUN####
#Read Data
#MTBS_fires = st_read("~/Downloads/mtbs_perimeter_data8424/mtbs_perims_DD.shp")
MTBS_fires <- st_read(here("Sierra Nevada Fires", "mtbs_perimeter_data8424", "mtbs_perims_DD.shp"))


#Initialize instance values
Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry

dfVeg$lon_r <- round(dfVeg$lon, 3)
dfVeg$lat_r <- round(dfVeg$lat, 3)
veg_coords_rounded <- paste0(dfVeg$lon_r, "_", dfVeg$lat_r)

store_fire_index = c() #Empty to store fire indices

for (fi in 1:nfires) {
  current_fire <- geoem[[fi]]
  nshapes <- length(current_fire)
  
  #Create empty matrix to store all lon/lat coordinates
  store_all_lon_lat_for_event <- NULL
  
  #Get all lon/lat coordinates of a fire
  if (nshapes >= 1 && !is.null(nshapes)) {
    for (si in 1:nshapes) {
      lon_lat <- current_fire[[si]][[1]]
      store_all_lon_lat_for_event <- 
        rbind(store_all_lon_lat_for_event, lon_lat)
    }
  }
  
  # If there were no shapes in the fire skip
  if (is.null(store_all_lon_lat_for_event)) next
  
  # Split into lon / lat vectors
  lons <- store_all_lon_lat_for_event[, 1]
  lats <- store_all_lon_lat_for_event[, 2]

  #Use rounded versions  
  lons_r <- round(lons, 3)
  lats_r <- round(lats, 3)
  
  # Create the same “lon_lat” string for each vertex
  fire_coords_rounded <- paste0(lons_r, "_", lats_r)
  
  # 5) If any of these rounded fire‐coords appear in veg_coords_rounded,
  #    that means this fire overlaps at least one dfVeg cell center.
  if (any(fire_coords_rounded %in% veg_coords_rounded)) {
    store_fire_index <- c(store_fire_index, fi)
  }
}
store_fire_index


###CA1####
#Read Data
MTBS_fires <- st_read(here("Sierra Nevada Fires", "mtbs_perimeter_data8424", "mtbs_perims_DD.shp"))

#Initialize instance values
Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry

dfVegCa1$lon_r <- round(dfVegCa1$lon, 3)
dfVegCa1$lat_r <- round(dfVegCa1$lat, 3)
veg_coords_roundedCa1 <- paste0(dfVegCa1$lon_r, "_", dfVegCa1$lat_r)

store_fire_indexCa1 = c() #Empty to store fire indices

for (fi in 1:nfires) {
  current_fire <- geoem[[fi]]
  nshapes <- length(current_fire)
  
  #Create empty matrix to store all lon/lat coordinates
  store_all_lon_lat_for_event <- NULL
  
  #Get all lon/lat coordinates of a fire
  if (nshapes >= 1 && !is.null(nshapes)) {
    for (si in 1:nshapes) {
      lon_lat <- current_fire[[si]][[1]]
      store_all_lon_lat_for_event <- 
        rbind(store_all_lon_lat_for_event, lon_lat)
    }
  }
  
  # If there were no shapes in the fire skip
  if (is.null(store_all_lon_lat_for_event)) next
  
  # Split into lon / lat vectors
  lons <- store_all_lon_lat_for_event[, 1]
  lats <- store_all_lon_lat_for_event[, 2]
  
  #Use rounded versions  
  lons_r <- round(lons, 3)
  lats_r <- round(lats, 3)
  
  # Create the same “lon_lat” string for each vertex
  fire_coords_rounded <- paste0(lons_r, "_", lats_r)
  
  # 5) If any of these rounded fire‐coords appear in veg_coords_rounded,
  #    that means this fire overlaps at least one dfVeg cell center.
  if (any(fire_coords_rounded %in% veg_coords_roundedCa1)) {
    store_fire_indexCa1 <- c(store_fire_indexCa1, fi)
  }
}
store_fire_indexCa1


###CA2####
#Read Data
MTBS_fires <- st_read(here("Sierra Nevada Fires", "mtbs_perimeter_data8424", "mtbs_perims_DD.shp"))

#Initialize instance values
Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry

dfVegCa2$lon_r <- round(dfVegCa2$lon, 3)
dfVegCa2$lat_r <- round(dfVegCa2$lat, 3)
veg_coords_roundedCa2 <- paste0(dfVegCa2$lon_r, "_", dfVegCa2$lat_r)

store_fire_indexCa2 = c() #Empty to store fire indices

for (fi in 1:nfires) {
  current_fire <- geoem[[fi]]
  nshapes <- length(current_fire)
  
  #Create empty matrix to store all lon/lat coordinates
  store_all_lon_lat_for_event <- NULL
  
  #Get all lon/lat coordinates of a fire
  if (nshapes >= 1 && !is.null(nshapes)) {
    for (si in 1:nshapes) {
      lon_lat <- current_fire[[si]][[1]]
      store_all_lon_lat_for_event <- 
        rbind(store_all_lon_lat_for_event, lon_lat)
    }
  }
  
  # If there were no shapes in the fire skip
  if (is.null(store_all_lon_lat_for_event)) next
  
  # Split into lon / lat vectors
  lons <- store_all_lon_lat_for_event[, 1]
  lats <- store_all_lon_lat_for_event[, 2]
  
  #Use rounded versions  
  lons_r <- round(lons, 3)
  lats_r <- round(lats, 3)
  
  # Create the same “lon_lat” string for each vertex
  fire_coords_rounded <- paste0(lons_r, "_", lats_r)
  
  # 5) If any of these rounded fire‐coords appear in veg_coords_rounded,
  #    that means this fire overlaps at least one dfVeg cell center.
  if (any(fire_coords_rounded %in% veg_coords_roundedCa2)) {
    store_fire_indexCa2 <- c(store_fire_indexCa2, fi)
  }
}
store_fire_indexCa2

###CA3####
#Read Data
MTBS_fires <- st_read(here("Sierra Nevada Fires", "mtbs_perimeter_data8424", "mtbs_perims_DD.shp"))

#Initialize instance values
Ig_Dates = MTBS_fires$Ig_Date
nfires = length(Ig_Dates)
geoem = MTBS_fires$geometry

dfVegCa3$lon_r <- round(dfVegCa3$lon, 3)
dfVegCa3$lat_r <- round(dfVegCa3$lat, 3)
veg_coords_roundedCa3 <- paste0(dfVegCa3$lon_r, "_", dfVegCa3$lat_r)

store_fire_indexCa3 = c() #Empty to store fire indices

for (fi in 1:nfires) {
  current_fire <- geoem[[fi]]
  nshapes <- length(current_fire)
  
  #Create empty matrix to store all lon/lat coordinates
  store_all_lon_lat_for_event <- NULL
  
  #Get all lon/lat coordinates of a fire
  if (nshapes >= 1 && !is.null(nshapes)) {
    for (si in 1:nshapes) {
      lon_lat <- current_fire[[si]][[1]]
      store_all_lon_lat_for_event <- 
        rbind(store_all_lon_lat_for_event, lon_lat)
    }
  }
  
  # If there were no shapes in the fire skip
  if (is.null(store_all_lon_lat_for_event)) next
  
  # Split into lon / lat vectors
  lons <- store_all_lon_lat_for_event[, 1]
  lats <- store_all_lon_lat_for_event[, 2]
  
  #Use rounded versions  
  lons_r <- round(lons, 3)
  lats_r <- round(lats, 3)
  
  # Create the same “lon_lat” string for each vertex
  fire_coords_rounded <- paste0(lons_r, "_", lats_r)
  
  # 5) If any of these rounded fire‐coords appear in veg_coords_rounded,
  #    that means this fire overlaps at least one dfVeg cell center.
  if (any(fire_coords_rounded %in% veg_coords_roundedCa3)) {
    store_fire_indexCa3 <- c(store_fire_indexCa3, fi)
  }
}
store_fire_indexCa3

###Combine fire indices####
store_fire_index_all <- sort(unique(c(store_fire_indexCa1, store_fire_indexCa2, store_fire_indexCa3)))


###Subset Only Sierra Nevada Fires####
library(sf)
sn_sf <- st_read("~/Downloads/Sierra_Nevada_Conservancy_Boundary.shp")
if (st_crs(sn_sf) != st_crs(MTBS_fires)) {
  sn_sf <- st_transform(sn_sf, st_crs(MTBS_fires))
}

MTBS_fires_trim <- MTBS_fires[store_fire_index_all, ]

sf::sf_use_s2(FALSE)
overlappingFires <- st_intersects(MTBS_fires_trim, sn_sf, sparse = TRUE)
firesInCali <- lengths(overlappingFires) > 0

cali_store_fire_index <- store_fire_index_all[firesInCali]

#remove prescribed fires to only have wildfires
Cali_fireTypes <- MTBS_fires$Incid_Type[cali_store_fire_index]
indices_to_remove <- which(Cali_fireTypes == "Prescribed Fire")

cali_store_fire_index <- cali_store_fire_index[-indices_to_remove] #should be 326 fires at this point

# Extract filtered fire geometries
sn_fires <- MTBS_fires[cali_store_fire_index, ]


library(ggplot2)
plot(st_geometry(sn_fires), col = 'red', main = "California Fires Overlapping Vegetation Grid")

ggplot() +
  geom_sf(data = sn_sf, fill = "gray90", color = "black") +
  geom_sf(data = sn_fires, fill = "firebrick", color = "black", alpha = 0.6) +
  labs(
    title = "Sierra Nevada Fires From 1984 to 2024",
    subtitle = "Included Fires Overlap MODIS Vegetation Grid"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12)
  )
###Subset Only Cali Fires BASE CODE DO NOT RUN####
library(sf)
cali_sf <- st_read("~/Downloads/ca_state/CA_State.shp")

if (st_crs(cali_sf) != st_crs(MTBS_fires)) {
  cali_sf <- st_transform(cali_sf, st_crs(MTBS_fires))
}

##MTBS_fires_trim = MTBS_fires$geometry[store_fire_index]
MTBS_fires_trim <- MTBS_fires[store_fire_index, ]

sf::sf_use_s2(FALSE)
overlappingFires <- st_intersects(MTBS_fires_trim, cali_sf, sparse = TRUE)
firesInCali <- lengths(overlappingFires) > 0

cali_store_fire_index <- store_fire_index[firesInCali]
cali_store_fire_index


# Extract filtered fire geometries
cali_fires <- MTBS_fires[cali_store_fire_index, ]

# Plot
plot(st_geometry(cali_fires), col = 'red', main = "California Fires Overlapping Vegetation Grid")


library(ggplot2)

ggplot() +
  geom_sf(data = cali_sf, fill = "gray90", color = "black") +
  geom_sf(data = MTBS_fires[cali_store_fire_index, ], fill = "firebrick", color = "black", alpha = 0.6) +
  labs(title = "California Fires 1984 to 2024 That Overlap Vegetation Grid") +
  theme_minimal()




###Apply index to trim####
Cali_MTBS_fires_trim = MTBS_fires$geometry[cali_store_fire_index]
Cali_Ig_Dates_trim = MTBS_fires$Ig_Date[cali_store_fire_index]
Cali_BurnBndAc = MTBS_fires$BurnBndAc[cali_store_fire_index]
Cali_Fire_type = MTBS_fires$Incid_Type[cali_store_fire_index]

MTBS_Fire_Names = MTBS_fires$Incid_Name[cali_store_fire_index]

###Plotting#####
data_to_save <- data.frame(
  Cali_Ig_Dates_trim,
  Cali_BurnBndAc
)
write.csv(data_to_save,file = "~/Rstudio/cali_data/CaliBurnAcres_TS.csv")

# write.csv(sort(Ig_Dates_trim),file='~/Rstudio/new_file.csv')
#plot
plot(Ig_Dates_trim, BurnBndAc, type="h", col="red", lwd=5, xlab="Dates (Years)", ylab="Burned Area (Acres)", main="Cali Burned Area from 1984-2022")
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
  labs(title = "Cali Burned Area from 1984-2024",
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

###Subset Large vs Small Fires####
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



###Getting out dates and fires####
dfrm <- data.frame(Time=Ig_Dates_trim, BrunAce=BurnBndAc,FireSize=FireSize)
write.table(dfrm, file='~/Rstudio/new_file.csv', sep=",", row.names=FALSE, col.names=TRUE)

#We want to get rid of the prescribed fires we only want wildfires, in our cali case they are all wildfires!,
#YAYYY

Ig_dates_NoPrescribed <- Cali_Ig_Dates_trim

length(Ig_dates_NoPrescribed)
length(Cali_Ig_Dates_trim)


library(here)

write.table(Ig_dates_NoPrescribed, file = here("Sierra Nevada Fires", "cali_data", "CaliNoPrescribedFireDates.csv"), sep = ",", col.names = FALSE, row.names = FALSE, quote = FALSE)














