n <- length(mean_ws)
df <- tibble(
  ws = c(
    mean_ws,
    max_ws,
    pct95_wind,
    #pct2575_wind,
    high_vpd_ws_mean,
    high_vpd_ws_max,
    high_99vpd_ws_mean,
    high_99vpd_ws_max
  ),
  ws_fire = c(
    mean_ws_fire,
    max_ws_fire,
    pct95_wind_fire,
   # pct2575_wind_fire,
    high_vpd_ws_mean_fire,
    high_vpd_ws_max_fire,
    high_99vpd_ws_mean_fire,
    high_99vpd_ws_max_fire
  ),
  ws_nofire = c(
    mean_ws_nofire,
    max_ws_nofire,
    pct95_wind_nofire,
    #pct2575_wind_nofire,
    high_vpd_ws_mean_nofire,
    high_vpd_ws_max_nofire,
    high_99vpd_ws_mean_nofire,
    high_99vpd_ws_max_nofire
  ),
  ws_smallfire = c(
    mean_ws_smallfire,
    max_ws_smallfire,
    pct95_wind_smallfire,
    #pct2575_wind_smallfire,
    high_vpd_ws_mean_smallfire,
    high_vpd_ws_max_smallfire,
    high_99vpd_ws_mean_smallfire,
    high_99vpd_ws_max_smallfire
  ),
  ws_largefire = c(
    mean_ws_largefire,
    max_ws_largefire,
    pct95_wind_largefire,
    #pct2575_wind_largefire,
    high_vpd_ws_mean_largefire,
    high_vpd_ws_max_largefire,
    high_99vpd_ws_mean_largefire,
    high_99vpd_ws_max_largefire
  ),
  ws_fire_ma = c(
    mean_ws_fire_ma,
    max_ws_fire_ma,
    pct95_wind_fire_ma,
    #pct2575_wind_fire_ma,
    high_vpd_ws_mean_fire_ma,
    high_vpd_ws_max_fire_ma,
    high_99vpd_ws_mean_fire_ma,
    high_99vpd_ws_max_fire_ma
  ),
  vpd = c(
    mean_vpd,
    max_vpd,
    pct95_vpd,
    #pct2575_vpd,
    high_wind_vpd_mean,
    high_wind_vpd_max,
    high_99wind_vpd_mean,
    high_99wind_vpd_max
  )
  ,
  vpd_fire = c(
    mean_vpd_fire,
    max_vpd_fire,
    pct95_vpd_fire,
    #pct2575_vpd_fire,
    high_wind_vpd_mean_fire,
    high_wind_vpd_max_fire,
    high_99wind_vpd_mean_fire,
    high_99wind_vpd_max_fire
  ),
  vpd_nofire = c(
    mean_vpd_nofire,
    max_vpd_nofire,
    pct95_vpd_nofire,
    #pct2575_vpd_nofire,
    high_wind_vpd_mean_nofire,
    high_wind_vpd_max_nofire,
    high_99wind_vpd_mean_nofire,
    high_99wind_vpd_max_nofire
  ),
  vpd_smallfire = c(
    mean_vpd_smallfire,
    max_vpd_smallfire,
    pct95_vpd_smallfire,
    #pct2575_vpd_smallfire,
    high_wind_vpd_mean_smallfire,
    high_wind_vpd_max_smallfire,
    high_99wind_vpd_mean_smallfire,
    high_99wind_vpd_max_smallfire
  ),
  vpd_largefire = c(
    mean_vpd_largefire,
    max_vpd_largefire,
    pct95_vpd_largefire,
    #pct2575_vpd_largefire,
    high_wind_vpd_mean_largefire,
    high_wind_vpd_max_largefire,
    high_99wind_vpd_mean_largefire,
    high_99wind_vpd_max_largefire
  ),
  vpd_fire_ma = c(
    mean_vpd_fire_ma,
    max_vpd_fire_ma,
    pct95_vpd_fire_ma,
    #pct2575_vpd_fire_ma,
    high_wind_vpd_mean_fire_ma,
    high_wind_vpd_max_fire_ma,
    high_99wind_vpd_mean_fire_ma,
    high_99wind_vpd_max_fire_ma
  ),
  ws_name = c(
    rep("mean_ws", n),
    rep("max_ws", n),
    rep("95pct_wind", n),
    #rep("25-75pct_wind", n),
    rep("high_vpd_95pct_ws_mean", n),
    rep("high_vpd_95pct_ws_max", n),
    rep("high_vpd_99pct_ws_mean", n),
    rep("high_vpd_99pct_ws_max", n)
  ),
  vpd_name = c(
    rep("mean_vpd", n),
    rep("max_vpd", n),
    rep("pct95_vpd", n),
    #rep("pct25-75_vpd", n),
    rep("high_wind_95pct_vpd_mean", n),
    rep("high_wind_95pct_vpd_max", n),
    rep("high_wind_99pct_vpd_mean", n),
    rep("high_wind_99pct_vpd_max", n)
  )
)

df2 <- tibble(
  fm100 = c(mean_fm100,
            max_fm100,
            pct95_fm100),
  fm100_fire = c(mean_fm100_fire,
                 max_fm100_fire,
                 pct95_fm100_fire),
  fm100_nofire = c(mean_fm100_nofire,
                   max_fm100_nofire,
                   pct95_fm100_nofire),
  fm100_smallfire = c(
    mean_fm100_smallfire,
    max_fm100_smallfire,
    pct95_fm100_smallfire
  ),
  fm100_largefire = c(
    mean_fm100_largefire,
    max_fm100_largefire,
    pct95_fm100_largefire
  ),
  fm100_fire_ma = c(mean_fm100_fire_ma,
                    max_fm100_fire_ma,
                    pct95_fm100_fire_ma) ,
  fm100_name = c(
    rep("mean_fm100", n),
    rep("max_fm100", n),
    rep("pct95_fm100", n)
  )
)
df3 <- tibble(
  fm1000 = c(mean_fm1000,
             max_fm1000,
             pct95_fm1000),
  fm1000_fire = c(mean_fm1000_fire,
                  max_fm1000_fire,
                  pct95_fm1000_fire),
  fm1000_nofire = c(mean_fm1000_nofire,
                    max_fm1000_nofire,
                    pct95_fm1000_nofire),
  fm1000_smallfire = c(
    mean_fm1000_smallfire,
    max_fm1000_smallfire,
    pct95_fm1000_smallfire
  ),
  fm1000_largefire = c(
    mean_fm1000_largefire,
    max_fm1000_largefire,
    pct95_fm1000_largefire
  ),
  fm1000_fire_ma = c(
    mean_fm1000_fire_ma,
    max_fm1000_fire_ma,
    pct95_fm1000_fire_ma
  ) ,
  fm1000_name = c(
    rep("mean_fm1000", n),
    rep("max_fm1000", n),
    rep("pct95_fm1000", n)
  )
)
npdsi <- length(mean_pdsi)
df4 <- tibble(
  pdsi = c(mean_pdsi,
             max_pdsi,
             pct95_pdsi),
  pdsi_fire = c(mean_pdsi_fire,
                  max_pdsi_fire,
                  pct95_pdsi_fire),
  pdsi_nofire = c(mean_pdsi_nofire,
                    max_pdsi_nofire,
                    pct95_pdsi_nofire),
  pdsi_smallfire = c(
    mean_pdsi_smallfire,
    max_pdsi_smallfire,
    pct95_pdsi_smallfire
  ),
  pdsi_largefire = c(
    mean_pdsi_largefire,
    max_pdsi_largefire,
    pct95_pdsi_largefire
  ),
  pdsi_fire_ma = c(
    mean_pdsi_fire_ma,
    max_pdsi_fire_ma,
    pct95_pdsi_fire_ma
  ) ,
  pdsi_name = c(
    rep("mean_pdsi", npdsi),
    rep("max_pdsi", npdsi),
    rep("pct95_pdsi", npdsi)
  )
)

df5 <- tibble(
  pet = c(mean_pet,
          max_pet,
          pct95_pet),
  pet_fire = c(mean_pet_fire,
               max_pet_fire,
               pct95_pet_fire),
  pet_nofire = c(mean_pet_nofire,
                 max_pet_nofire,
                 pct95_pet_nofire),
  pet_smallfire = c(mean_pet_smallfire,
                    max_pet_smallfire,
                    pct95_pet_smallfire),
  pet_largefire = c(mean_pet_largefire,
                    max_pet_largefire,
                    pct95_pet_largefire),
  pet_fire_ma = c(mean_pet_fire_ma,
                  max_pet_fire_ma,
                  pct95_pet_fire_ma) ,
  pet_name = c(rep("mean_pet", n),
               rep("max_pet", n),
               rep("pct95_pet", n))
)
nspei90 <- length(mean_spei90)
df6 <- tibble(
  spei90 = c(mean_spei90,
           max_spei90,
           pct95_spei90),
  spei90_fire = c(mean_spei90_fire,
                max_spei90_fire,
                pct95_spei90_fire),
  spei90_nofire = c(mean_spei90_nofire,
                  max_spei90_nofire,
                  pct95_spei90_nofire),
  spei90_smallfire = c(
    mean_spei90_smallfire,
    max_spei90_smallfire,
    pct95_spei90_smallfire
  ),
  spei90_largefire = c(
    mean_spei90_largefire,
    max_spei90_largefire,
    pct95_spei90_largefire
  ),
  spei90_fire_ma = c(
    mean_spei90_fire_ma,
    max_spei90_fire_ma,
    pct95_spei90_fire_ma
  ) ,
  spei90_name = c(
    rep("mean_spei90", nspei90),
    rep("max_spei90", nspei90),
    rep("pct95_spei90", nspei90)
  )
)
df7 <- tibble(
  sph = c(mean_sph,
          max_sph,
          pct95_sph),
  sph_fire = c(mean_sph_fire,
               max_sph_fire,
               pct95_sph_fire),
  sph_nofire = c(mean_sph_nofire,
                 max_sph_nofire,
                 pct95_sph_nofire),
  sph_smallfire = c(mean_sph_smallfire,
                    max_sph_smallfire,
                    pct95_sph_smallfire),
  sph_largefire = c(mean_sph_largefire,
                    max_sph_largefire,
                    pct95_sph_largefire),
  sph_fire_ma = c(mean_sph_fire_ma,
                  max_sph_fire_ma,
                  pct95_sph_fire_ma) ,
  sph_name = c(rep("mean_sph", n),
               rep("max_sph", n),
               rep("pct95_sph", n))
)
nspi90 <- length(mean_spi90)
df8 <- tibble(
  spi90 = c(mean_spi90,
           max_spi90,
           pct95_spi90),
  spi90_fire = c(mean_spi90_fire,
                max_spi90_fire,
                pct95_spi90_fire),
  spi90_nofire = c(mean_spi90_nofire,
                  max_spi90_nofire,
                  pct95_spi90_nofire),
  spi90_smallfire = c(
    mean_spi90_smallfire,
    max_spi90_smallfire,
    pct95_spi90_smallfire
  ),
  spi90_largefire = c(
    mean_spi90_largefire,
    max_spi90_largefire,
    pct95_spi90_largefire
  ),
  spi90_fire_ma = c(
    mean_spi90_fire_ma,
    max_spi90_fire_ma,
    pct95_spi90_fire_ma
  ) ,
  spi90_name = c(
    rep("mean_spi90", nspi90),
    rep("max_spi90", nspi90),
    rep("pct95_spi90", nspi90)
  )
)
df9 <- tibble(
  tmmn = c(mean_tmmn,
           max_tmmn,
           pct95_tmmn),
  tmmn_fire = c(mean_tmmn_fire,
                max_tmmn_fire,
                pct95_tmmn_fire),
  tmmn_nofire = c(mean_tmmn_nofire,
                  max_tmmn_nofire,
                  pct95_tmmn_nofire),
  tmmn_smallfire = c(
    mean_tmmn_smallfire,
    max_tmmn_smallfire,
    pct95_tmmn_smallfire
  ),
  tmmn_largefire = c(
    mean_tmmn_largefire,
    max_tmmn_largefire,
    pct95_tmmn_largefire
  ),
  tmmn_fire_ma = c(mean_tmmn_fire_ma,
                   max_tmmn_fire_ma,
                   pct95_tmmn_fire_ma) ,
  tmmn_name = c(rep("mean_tmmn", n),
                rep("max_tmmn", n),
                rep("pct95_tmmn", n))
  
)
df10 <- tibble(
  tmmx = c(mean_tmmx,
                max_tmmx,
                pct95_tmmx),
  tmmx_fire = c(mean_tmmx_fire,
                max_tmmx_fire,
                pct95_tmmx_fire),
  tmmx_nofire = c(mean_tmmx_nofire,
                  max_tmmx_nofire,
                  pct95_tmmx_nofire),
  tmmx_smallfire = c(
    mean_tmmx_smallfire,
    max_tmmx_smallfire,
    pct95_tmmx_smallfire
  ),
  tmmx_largefire = c(
    mean_tmmx_largefire,
    max_tmmx_largefire,
    pct95_tmmx_largefire
  ),
  tmmx_fire_ma = c(mean_tmmx_fire_ma,
                   max_tmmx_fire_ma,
                   pct95_tmmx_fire_ma) ,
  tmmx_name = c(rep("mean_tmmx", n),
                rep("max_tmmx", n),
                rep("pct95_tmmx", n))
)

