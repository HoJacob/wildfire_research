library(plotly)
library(tidyverse)
#Columns

source("~/Rstudio/small_plots/read.R")
source("~/Rstudio/small_plots/read_with_fire.R")
# source("~/Rstudio/small_plots/individual_plot.R")
source("~/Rstudio/small_plots/all_plot_1.R")
source("~/Rstudio/small_plots/all_plot_final.R") # this one need to run in the file

plots.dir.path <- list.files(tempdir(), pattern="rs-graphics", full.names = TRUE) 
plots.png.paths <- list.files(plots.dir.path, pattern=".png", full.names = TRUE)

file.copy(from=plots.png.paths, to="~/Downloads")

#Anomaly Data
# (1) create a vector of nothing but NaN values that is the same length as your time series (e.g., empty_data <- rep(NA, length(WS))) 
# (2) define an index only corresponding to a given season (eg spring, idx_spring)
# (3) update the empty vector with anomaly values:
#   empty_data[idx_spring] = (original_ws_data[idx_spring] - mean(original_ws_data[idx_spring]) ) / std(original_ws_data[idx_spring])
# ... do this step for each of the 4 seasons.
# e.g.,:
#   original_ws_data[idx_fall] - mean(original_ws_data[idx_fall]) ) / std(original_ws_data[idx_fall])

#Wind Data
source("~/Rstudio/small_plots/anomaly_wind.R")
#VPD Data
source("~/Rstudio/small_plots/anomaly_vpd.R")

#7 winds in 7 plots for 4 season
source("~/Rstudio/small_plots/anomaly_data_frame_ws.R")
source("~/Rstudio/small_plots/anomaly_all_plot_ws.R") # this one need to run in the file

# one plot for each season, with all 7 winds
source("~/Rstudio/small_plots/anomaly_data_frame_ws_4.R")
source("~/Rstudio/small_plots/anomaly_all_plot_ws_4.R") # this one need to run in the file

#7 vpd in 7 plots for 4 season
source("~/Rstudio/small_plots/anomaly_data_frame_vpd.R")
source("~/Rstudio/small_plots/anomaly_all_plot_vpd.R") # this one need to run in the file

# one plot for each season, with all 7 vpds
source("~/Rstudio/small_plots/anomaly_data_frame_vpd_4.R")
source("~/Rstudio/small_plots/anomaly_all_plot_vpd_4.R") # this one need to run in the file

# source("~/Rstudio/small_plots/anomaly_individual_plot.R")




