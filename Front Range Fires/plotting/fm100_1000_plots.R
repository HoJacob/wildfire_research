source("~/Rstudio/FireStoreIndex.R")
source("~/Rstudio/small_plots/read.R")
#source("~/Rstudio/randomforest.R")
source("~/Rstudio/small_plots/read_with_fire.R")

### Calculating percentiles
# Remove NAs for percentile calculation

install.packages("scales")
library(scales)

plot(rescaled_mfm100F, main = "Percentile Fuel Moisture 100")
plot(mean_fm100_fire, main = "Fuel Moisture 100")

plot(mean_fm100_fire, Newrescaled_mfm100F, xlab = "Original FM100", ylab = "Rescaled FM100", 
     main = "Original FM100 vs. Rescaled FM100")

Newrescaled_mfm100F <- c(rescaled_mfm100F, rep(NA, length(mean_fm100_fire) - length(rescaled_mfm100F)))  #keep as integer
plot(Newrescaled_mfm100F)

plot(mean_fm100_nofire)
plot(mfm100F_valid_per)

mfm100F_rank <- rank(mean_fm100_fire, na.last="keep")
#fm100F_valid_ranks <- mfm100F_rank[!is.na(mfm100F_rank)]
rescaled_mfm100F <- rescale(mfm100F_rank)

mfm100N_rank <- rank(mean_fm100_nofire, na.last = "keep")
#fm100N_valid_ranks <- mfm100N_rank[!is.na(mfm100N_rank)]
rescaled_mfm100N <- rescale(mfm100N_rank)

mwsF_rank <- rank(mean_ws_fire, na.last = "keep")
#wsF_valid_ranks <- mwsF_rank[!is.na(mwsF_rank)]
rescaled_mwsF <- rescale(mwsF_rank)

mwsN_rank <- rank(mean_ws_nofire, na.last = "keep")
#wsN_valid_ranks <- mwsN_rank[!is.na(mwsN_rank)]
rescaled_mwsN <- rescale(mwsN_rank)

mult_F <- rescaled_mfm100F * rescaled_mwsF
mult_N <- rescaled_mfm100N * rescaled_mwsN

mult_F <- Map(`*`, rescaled_mfm100F, rescaled_mwsF)
mult_N <- Map(`*`, rescaled_mfm100N, rescaled_mwsN)

add_F <- rescaled_mfm100F + rescaled_mwsF
add_N <- rescaled_mfm100N + rescaled_mwsN

subset_mult_N <- sample(mult_N, length(mult_F))

boxplot(mult_F, mult_N)
boxplot(mult_F)
plot(rescaled_mwsF)

my_data <- do.call(rbind, mult_F)
colnames(my_data) <- names(mult_F)

# Create boxplot from the data frame
boxplot(my_data)

myD <- do.call(rbind, mult_N)
colnames(myD) <- names(mult_N)

# Create boxplot from the data frame
boxplot(myD)



boxplot(add_F, add_N)

DFs=c()
#DFs$mult_F <- c(mult_F)

DFs$mult_F <- c(mult_F, rep(NA, length(mult_N) - length(mult_F)))  #keep as integer
DFs$mult_N <- c(mult_N)
names(DFs) <- c("Fire Events", "Non Fire Events")
str(DFs) 
boxplot(DFs, outline = TRUE, main ="Fuel Moisture 100 x Mean Wind Speed", xlab = "", ylab = "FM100 x WS", mean = TRUE)
median(mult_F, na.rm = TRUE)
median(mult_N, na.rm = TRUE)



####

DF21 <- data.frame(FIRE = mean_fm100_fire,
                   NOFIRE = mean_fm100_nofire)
boxplot(DF21) 
title('mean_fm100')
DF22 <- data.frame(FIRE = max_fm100_fire,
                   NOFIRE = max_fm100_nofire)
boxplot(DF22) 
title('max_fm100')
DF23 <- data.frame(FIRE = pct95_fm100_fire,
                   NOFIRE = pct95_fm100_nofire)
boxplot(DF23)
title('pct95_fm100')


DF31 <- data.frame(FIRE = mean_fm1000_fire,
                   NOFIRE = mean_fm100_nofire)
boxplot(DF31) 
title('mean_fm1000')
DF32 <- data.frame(FIRE = max_fm1000_fire,
                   NOFIRE = max_fm1000_nofire)
boxplot(DF32) 
title('max_fm1000')
DF33 <- data.frame(FIRE = pct95_fm1000_fire,
                   NOFIRE = pct95_fm1000_nofire)
boxplot(DF33)
title('pct95_fm1000')

####Important
DF211 <- data.frame(NOFIRE = mean_fm100_nofire,
                    FIRE = mean_fm100_fire,
                    SMALLFIRE = mean_fm100_smallfire,
                    LARGEFIRE = mean_fm100_largefire)
boxplot(DF211, outline = FALSE) 
title('mean_fm100')
#####

DF221 <- data.frame(FIRE = max_fm100_fire,
                    NOFIRE = max_fm100_nofire,
                    SMALLFIRE = max_fm100_smallfire,
                    LARGEFIRE = max_fm100_largefire)
boxplot(DF221) 
title('max_fm100')

DF231 <- data.frame(NOFIRE = pct95_fm100_nofire,FIRE = pct95_fm100_fire,
                    SMALLFIRE = pct95_fm100_smallfire,
                    LARGEFIRE = pct95_fm100_largefire)
boxplot(DF231)
title('pct95_fm100')
di <- wilcox.test(pct95_fm100_nofire, pct95_fm100_fire, alternative = c("less"))
print(di)


DF311 <- data.frame(
                    NOFIRE = mean_fm1000_nofire,
                    FIRE = mean_fm1000_fire,
                    SMALLFIRE = mean_fm1000_smallfire,
                    LARGEFIRE = mean_fm1000_largefire)
boxplot(DF311, outline = FALSE) 
title('mean_fm1000')

DF315 <- data.frame(
  NOFIRE = mean_fm1000_nofire,
  FIRE = mean_fm1000_fire)
boxplot(DF315, outline = FALSE) 
title('mean_fm1000')


DF319 <- data.frame(
  NOFIRE = mean_fm100_nofire,
  FIRE = mean_fm1000_fire,
  SMALLFIRE = mean_fm1000_smallfire,
  LARGEFIRE = mean_fm1000_largefire)
boxplot(DF319, outline = FALSE) 
title('mean_fm1000')

wi <- wilcox.test(mean_fm100_nofire, mean_fm100_fire, alternative = c("greater"))
print(wi)

DF511 <- data.frame(NOFIRE = mean_ws_nofire,
                    Fire = mean_ws_fire,
                    SMALLFIRE = mean_ws_smallfire,
                    LARGEFIRE = mean_ws_largefire)
boxplot(DF511, outline=FALSE)
title('mean_ws')


DF321 <- data.frame(SMALLFIRE = max_fm1000_smallfire,
                    LARGEFIRE = max_fm1000_largefire)
boxplot(DF321) 
title('max_fm1000')
DF331 <- data.frame(SMALLFIRE = pct95_fm1000_smallfire,
                    LARGEFIRE = pct95_fm1000_largefire)
boxplot(DF331)
title('pct95_fm1000')

DF331 <- data.frame(SMALLFIRE = pct95_fm100_smallfire,
                    LARGEFIRE = pct95_fm100_largefire)
boxplot(DF331)
title('pct95_fm1000')

DF2 <- data.frame(
  x = c(
    c(mean_fm100_fire,
      max_fm100_fire,
      pct95_fm100_fire),
    c(mean_fm100_nofire,
      max_fm100_nofire,
      pct95_fm100_nofire)
  ),
  y = rep(c("Fire", "No_Fire"), each = nfm100),
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