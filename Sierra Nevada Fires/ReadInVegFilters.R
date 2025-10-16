# install if you haven’t already
install.packages("ncdf4")

library(ncdf4)
library(raster)
library(here)

#####BaseCodeDoNotRun#####
# open the file
ncVeg <- nc_open("~/Downloads/subFilterWorkingFile.nc")
ncLat <- nc_open("~/Downloads/latSubFilterWorkingFile.nc")
ncLon <- nc_open("~/Downloads/lonSubFilterWorkingFile.nc")

# create working matrices
veg_mat <- ncvar_get(ncVeg, "MCD12Q1_Data_Fields_LC_Type1")
lat_mat <- ncvar_get(ncLat, "Latitude_9")
lon_mat <- ncvar_get(ncLon, "Longitude_10")

# check 
dim(veg_mat)
dim(lat_mat)
dim(lon_mat)

# create df to map 
dfVeg <- data.frame(
  lon = as.vector(lon_mat),
  lat = as.vector(lat_mat),
  veg = as.vector(veg_mat)
)

# get rid of NA values 
dfVeg <- subset(dfVeg, !is.na(veg) & veg != 0)


#####RunOnlyThisSectionForSierraNevadaFires#######
##Open Data
# --- CA1 ---
ncCa1     <- nc_open(here("Sierra Nevada Fires", "vegGrids", "CA1.nc"))
ncCa1Lat  <- nc_open(here("Sierra Nevada Fires", "vegGrids", "latCA1.nc"))
ncCa1Lon  <- nc_open(here("Sierra Nevada Fires", "vegGrids", "lonCA1.nc"))

# --- CA2 ---
ncCa2     <- nc_open(here("Sierra Nevada Fires", "vegGrids", "CA2.nc"))
ncCa2Lat  <- nc_open(here("Sierra Nevada Fires", "vegGrids", "latCA2.nc"))
ncCa2Lon  <- nc_open(here("Sierra Nevada Fires", "vegGrids", "lonCA2.nc"))

# --- CA3 ---
ncCa3     <- nc_open(here("Sierra Nevada Fires", "vegGrids", "CA3.nc"))
ncCa3Lat  <- nc_open(here("Sierra Nevada Fires", "vegGrids", "latCA3.nc"))
ncCa3Lon  <- nc_open(here("Sierra Nevada Fires", "vegGrids", "lonCA3.nc"))

names(ncCa3$var)
names(ncCa3Lat$var)
names(ncCa3Lon$var)

##Create Matrices
veg_matCa1 <- ncvar_get(ncCa1, "MCD12Q1_Data_Fields_LC_Type1")
lat_matCa1 <- ncvar_get(ncCa1Lat, "Latitude_0")
lon_matCa1 <- ncvar_get(ncCa1Lon, "Longitude_1")

veg_matCa2 <- ncvar_get(ncCa2, "MCD12Q1_Data_Fields_LC_Type1")
lat_matCa2 <- ncvar_get(ncCa2Lat, "Latitude_0")
lon_matCa2 <- ncvar_get(ncCa2Lon, "Longitude_1")

veg_matCa3 <- ncvar_get(ncCa3, "MCD12Q1_Data_Fields_LC_Type1")
lat_matCa3 <- ncvar_get(ncCa3Lat, "Latitude_1")
lon_matCa3 <- ncvar_get(ncCa3Lon, "Longitude_2")

##Combine into df
dfVegCa1 <- data.frame(
  lon = as.vector(lon_matCa1),
  lat = as.vector(lat_matCa1),
  veg = as.vector(veg_matCa1)
)
dfVegCa1 <- subset(dfVegCa1, !is.na(veg) & veg != 0)


dfVegCa2 <- data.frame(
  lon = as.vector(lon_matCa2),
  lat = as.vector(lat_matCa2),
  veg = as.vector(veg_matCa2)
)
dfVegCa2 <- subset(dfVegCa2, !is.na(veg) & veg != 0)


dfVegCa3 <- data.frame(
  lon = as.vector(lon_matCa3),
  lat = as.vector(lat_matCa3),
  veg = as.vector(veg_matCa3)
)
dfVegCa3 <- subset(dfVegCa3, !is.na(veg) & veg != 0)

###Test####
dfVegCombined <- rbind(dfVegCa1, dfVegCa2, dfVegCa3)

library(sf)

# 1. Convert the combined vegetation df to an sf object
dfVeg_sf <- st_as_sf(dfVegCombined, coords = c("lon", "lat"), crs = 4326)

# 2. Read the Sierra Nevada shapefile
sn_sf <- st_read("~/Downloads/Sierra_Nevada_Conservancy_Boundary.shp")

# 3. Ensure both have the same CRS (Coordinate Reference System)
if (st_crs(dfVeg_sf) != st_crs(sn_sf)) {
  dfVeg_sf <- st_transform(dfVeg_sf, st_crs(sn_sf))
}

# 4. Subset points inside Sierra Nevada
dfVeg_sn <- dfVeg_sf[st_intersects(dfVeg_sf, sn_sf, sparse = FALSE), ]

df_out <- as.data.frame(st_drop_geometry(dfVeg_sn))

# Write to CSV
write.csv(df_out, "~/Downloads/SierraNevadaVeg.csv", row.names = FALSE)



###Combine Three HDF Files####
library(raster)

# Read each tile (choose correct subdataset index or name)
tile1_path <- "~/Downloads/MODIS_LC_DATA_CA/MCD12Q1.A2001001.h08v04.061.2022146034934.hdf"
tile2_path <- "~/Downloads/MODIS_LC_DATA_CA/MCD12Q1.A2001001.h08v05.061.2022146033917.hdf"
tile3_path <- "~/Downloads/MODIS_LC_DATA_CA/MCD12Q1.A2001001.h09v04.061.2022146030108.hdf"

tile1 <- raster(tile1_path, varname="LC_Type1")
tile2 <- raster(tile2_path, varname="LC_Type1")
tile3 <- raster(tile3_path, varname="LC_Type1")

merged <- merge(tile1, tile2, tile3)

merged_df <- as.data.frame(merged, xy=TRUE)
write.csv(merged_df, "~/Downloads/merged_vegMODIS.csv", row.names=FALSE)

writeRaster(merged, "~/Downloads/merged_MODIS_LC_Type1.tif", 
            format="GTiff", overwrite=TRUE)


