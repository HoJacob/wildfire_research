mean_ws_fire <- rep(NA, length(mean_ws))
mean_ws_nofire <- rep(NA, length(mean_ws))
mean_ws_largefire <- rep(NA, length(mean_ws))
mean_ws_smallfire <- rep(NA, length(mean_ws))
mean_ws_fire_ma <- rep(NA, length(mean_ws))
mean_ws_fire[store_fire_index] = mean_ws[store_fire_index]
mean_ws_nofire[-store_fire_index] = mean_ws[-store_fire_index]
mean_ws_largefire[large_fire_index] = mean_ws[large_fire_index]
mean_ws_smallfire[small_fire_index] = mean_ws[small_fire_index]
mean_ws_fire_ma[length(mean_ws)-1] = mean_ws[length(mean_ws)-1]

max_ws_fire <- rep(NA, length(max_ws)) 
max_ws_nofire <- rep(NA, length(max_ws))
max_ws_smallfire <- rep(NA, length(max_ws))
max_ws_largefire <- rep(NA, length(max_ws))
max_ws_fire_ma <- rep(NA, length(max_ws)) 
max_ws_fire[store_fire_index] = max_ws[store_fire_index]
max_ws_nofire[-store_fire_index] = max_ws[-store_fire_index]
max_ws_smallfire[small_fire_index] = max_ws[small_fire_index]
max_ws_largefire[large_fire_index] = max_ws[large_fire_index]
max_ws_fire_ma[length(mean_ws)-1] = max_ws[length(mean_ws)-1]

pct95_wind_fire <- rep(NA, length(pct95_wind)) 
pct95_wind_nofire <- rep(NA, length(pct95_wind)) 
pct95_wind_smallfire <- rep(NA, length(max_ws))
pct95_wind_largefire <- rep(NA, length(max_ws))
pct95_wind_fire_ma <- rep(NA, length(pct95_wind)) 
pct95_wind_fire[store_fire_index] = pct95_wind[store_fire_index]
pct95_wind_nofire[-store_fire_index] = pct95_wind[-store_fire_index]
pct95_wind_smallfire[small_fire_index] =pct95_wind[small_fire_index]
pct95_wind_largefire[large_fire_index] = pct95_wind[large_fire_index]
pct95_wind_fire_ma[length(mean_ws)-1] = pct95_wind[length(mean_ws)-1]

# pct2575_wind_fire <- rep(NA, length(pct2575_wind)) 
# pct2575_wind_nofire <- rep(NA, length(pct2575_wind)) 
# pct2575_wind_largefire <- rep(NA, length(max_ws))
# pct2575_wind_smallfire <- rep(NA, length(max_ws))
# pct2575_wind_fire_ma <- rep(NA, length(pct2575_wind)) 
# pct2575_wind_fire[store_fire_index] = pct2575_wind[store_fire_index]
# pct2575_wind_nofire[-store_fire_index] = pct2575_wind[-store_fire_index]
# pct2575_wind_smallfire[small_fire_index] =pct2575_wind[small_fire_index]
# pct2575_wind_largefire[large_fire_index] = pct2575_wind[large_fire_index]
# pct2575_wind_fire_ma[length(mean_ws)-1] = pct2575_wind[length(mean_ws)-1]

# high_vpd_ws_mean_fire <- rep(NA, length(high_vpd_ws_mean)) 
# high_vpd_ws_mean_nofire <- rep(NA, length(high_vpd_ws_mean))
# high_vpd_ws_mean_largefire <- rep(NA, length(max_ws))
# high_vpd_ws_mean_smallfire <- rep(NA, length(max_ws))
# high_vpd_ws_mean_fire_ma <- rep(NA, length(high_vpd_ws_mean)) 
# high_vpd_ws_mean_fire[store_fire_index] = high_vpd_ws_mean[store_fire_index]
# high_vpd_ws_mean_nofire[-store_fire_index] = high_vpd_ws_mean[-store_fire_index]
# high_vpd_ws_mean_smallfire[small_fire_index] =high_vpd_ws_mean[small_fire_index]
# high_vpd_ws_mean_largefire[large_fire_index] = high_vpd_ws_mean[large_fire_index]
# high_vpd_ws_mean_fire_ma[length(high_vpd_ws_mean)-1] = high_vpd_ws_mean[length(high_vpd_ws_mean)-1]
# 
# high_vpd_ws_max_fire <- rep(NA, length(high_vpd_ws_max)) 
# high_vpd_ws_max_nofire <- rep(NA, length(high_vpd_ws_max)) 
# high_vpd_ws_max_largefire <- rep(NA, length(max_ws))
# high_vpd_ws_max_smallfire <- rep(NA, length(max_ws))
# high_vpd_ws_max_fire_ma <- rep(NA, length(high_vpd_ws_max)) 
# high_vpd_ws_max_fire[store_fire_index] = high_vpd_ws_max[store_fire_index]
# high_vpd_ws_max_nofire[-store_fire_index] = high_vpd_ws_max[-store_fire_index]
# high_vpd_ws_max_smallfire[small_fire_index] =high_vpd_ws_max[small_fire_index]
# high_vpd_ws_max_largefire[large_fire_index] = high_vpd_ws_max[large_fire_index]
# high_vpd_ws_max_fire_ma[length(high_vpd_ws_max)-1] = high_vpd_ws_max[length(high_vpd_ws_max)-1]
# 
# high_99vpd_ws_mean_fire <- rep(NA, length(high_99vpd_ws_mean))
# high_99vpd_ws_mean_nofire <- rep(NA, length(high_99vpd_ws_mean))
# high_99vpd_ws_mean_largefire <- rep(NA, length(max_ws))
# high_99vpd_ws_mean_smallfire <- rep(NA, length(max_ws))
# high_99vpd_ws_mean_fire_ma <- rep(NA, length(high_99vpd_ws_mean)) 
# high_99vpd_ws_mean_fire[store_fire_index] = high_99vpd_ws_mean[store_fire_index]
# high_99vpd_ws_mean_nofire[-store_fire_index] = high_99vpd_ws_mean[-store_fire_index]
# high_99vpd_ws_mean_smallfire[small_fire_index] =high_99vpd_ws_mean[small_fire_index]
# high_99vpd_ws_mean_largefire[large_fire_index] = high_99vpd_ws_mean[large_fire_index]
# high_99vpd_ws_mean_fire_ma[length(mean_ws)-1] = high_99vpd_ws_mean[length(mean_ws)-1]
# 
# high_99vpd_ws_max_fire <- rep(NA, length(high_99vpd_ws_max)) 
# high_99vpd_ws_max_nofire <- rep(NA, length(high_99vpd_ws_max)) 
# high_99vpd_ws_max_largefire <- rep(NA, length(max_ws))
# high_99vpd_ws_max_smallfire <- rep(NA, length(max_ws))
# high_99vpd_ws_max_fire_ma <- rep(NA, length(high_99vpd_ws_max)) 
# high_99vpd_ws_max_fire[store_fire_index] = high_99vpd_ws_max[store_fire_index]
# high_99vpd_ws_max_nofire[-store_fire_index] = high_99vpd_ws_max[-store_fire_index]
# high_99vpd_ws_max_smallfire[small_fire_index] =high_99vpd_ws_max[small_fire_index]
# high_99vpd_ws_max_largefire[large_fire_index] = high_99vpd_ws_max[large_fire_index]
# high_99vpd_ws_max_fire_ma[length(mean_ws)-1] = high_99vpd_ws_max[length(mean_ws)-1]

mean_vpd_fire <- rep(NA, length(mean_vpd))
mean_vpd_nofire <- rep(NA, length(mean_vpd))
mean_vpd_smallfire <- rep(NA, length(mean_vpd))
mean_vpd_largefire <- rep(NA, length(mean_vpd))
mean_vpd_fire_ma <- rep(NA, length(mean_vpd))
mean_vpd_fire[store_fire_index] = mean_vpd[store_fire_index]
mean_vpd_nofire[-store_fire_index] = mean_vpd[-store_fire_index]
mean_vpd_smallfire[small_fire_index] =mean_vpd[small_fire_index]
mean_vpd_largefire[large_fire_index] = mean_vpd[large_fire_index]
mean_vpd_fire_ma[length(mean_vpd)-1] = mean_vpd[length(mean_vpd)-1]

max_vpd_fire <- rep(NA, length(max_vpd)) 
max_vpd_nofire <- rep(NA, length(max_vpd))
max_vpd_smallfire <- rep(NA, length(max_vpd))
max_vpd_largefire <- rep(NA, length(max_vpd))
max_vpd_fire_ma <- rep(NA, length(max_vpd)) 
max_vpd_fire[store_fire_index] = max_vpd[store_fire_index]
max_vpd_nofire[-store_fire_index] = max_vpd[-store_fire_index]
max_vpd_smallfire[small_fire_index] =max_vpd[small_fire_index]
max_vpd_largefire[large_fire_index] = max_vpd[large_fire_index]
max_vpd_fire_ma[length(mean_vpd)-1] = max_vpd[length(mean_vpd)-1]

pct95_vpd_fire <- rep(NA, length(pct95_vpd)) 
pct95_vpd_nofire <- rep(NA, length(pct95_vpd)) 
pct95_vpd_largefire <- rep(NA, length(max_ws))
pct95_vpd_smallfire <- rep(NA, length(max_ws))
pct95_vpd_fire_ma <- rep(NA, length(pct95_vpd)) 
pct95_vpd_fire[store_fire_index] = pct95_vpd[store_fire_index]
pct95_vpd_nofire[-store_fire_index] = pct95_vpd[-store_fire_index]
pct95_vpd_smallfire[small_fire_index] =pct95_vpd[small_fire_index]
pct95_vpd_largefire[large_fire_index] = pct95_vpd[large_fire_index]
pct95_vpd_fire_ma[length(mean_vpd)-1] = pct95_vpd[length(mean_vpd)-1]

# pct2575_vpd_fire <- rep(NA, length(pct2575_vpd)) 
# pct2575_vpd_nofire <- rep(NA, length(pct2575_vpd)) 
# pct2575_vpd_largefire <- rep(NA, length(max_ws))
# pct2575_vpd_smallfire <- rep(NA, length(max_ws))
# pct2575_vpd_fire_ma <- rep(NA, length(pct2575_vpd)) 
# pct2575_vpd_fire[store_fire_index] = pct2575_vpd[store_fire_index]
# pct2575_vpd_nofire[-store_fire_index] = pct2575_vpd[-store_fire_index]
# pct2575_vpd_smallfire[small_fire_index] =pct2575_vpd[small_fire_index]
# pct2575_vpd_largefire[large_fire_index] = pct2575_vpd[large_fire_index]
# pct2575_vpd_fire_ma[length(mean_vpd)-1] = pct2575_vpd[length(mean_vpd)-1]

# high_wind_vpd_mean_fire <- rep(NA, length(high_wind_vpd_mean)) 
# high_wind_vpd_mean_nofire <- rep(NA, length(high_wind_vpd_mean)) 
# high_wind_vpd_mean_largefire <- rep(NA, length(max_ws))
# high_wind_vpd_mean_smallfire <- rep(NA, length(max_ws))
# high_wind_vpd_mean_fire_ma <- rep(NA, length(high_wind_vpd_mean)) 
# high_wind_vpd_mean_fire[store_fire_index] = high_wind_vpd_mean[store_fire_index]
# high_wind_vpd_mean_nofire[-store_fire_index] = high_wind_vpd_mean[-store_fire_index]
# high_wind_vpd_mean_smallfire[small_fire_index] =high_wind_vpd_mean[small_fire_index]
# high_wind_vpd_mean_largefire[large_fire_index] = high_wind_vpd_mean[large_fire_index]
# high_wind_vpd_mean_fire_ma[length(high_wind_vpd_mean)-1] = high_wind_vpd_mean[length(high_wind_vpd_mean)-1]
# 
# high_wind_vpd_max_fire <- rep(NA, length(high_wind_vpd_max)) 
# high_wind_vpd_max_nofire <- rep(NA, length(high_wind_vpd_max)) 
# high_wind_vpd_max_largefire <- rep(NA, length(max_ws))
# high_wind_vpd_max_smallfire <- rep(NA, length(max_ws))
# high_wind_vpd_max_fire_ma <- rep(NA, length(high_wind_vpd_max)) 
# high_wind_vpd_max_fire[store_fire_index] = high_wind_vpd_max[store_fire_index]
# high_wind_vpd_max_nofire[-store_fire_index] = high_wind_vpd_max[-store_fire_index]
# high_wind_vpd_max_smallfire[small_fire_index] =high_wind_vpd_max[small_fire_index]
# high_wind_vpd_max_largefire[large_fire_index] = high_wind_vpd_max[large_fire_index]
# high_wind_vpd_max_fire_ma[length(high_wind_vpd_max)-1] = high_wind_vpd_max[length(high_wind_vpd_max)-1]
# 
# high_99wind_vpd_mean_fire <- rep(NA, length(high_99wind_vpd_mean)) 
# high_99wind_vpd_mean_nofire <- rep(NA, length(high_99wind_vpd_mean)) 
# high_99wind_vpd_mean_largefire <- rep(NA, length(max_ws))
# high_99wind_vpd_mean_smallfire <- rep(NA, length(max_ws))
# high_99wind_vpd_mean_fire_ma <- rep(NA, length(high_99wind_vpd_mean)) 
# high_99wind_vpd_mean_fire[store_fire_index] = high_99wind_vpd_mean[store_fire_index]
# high_99wind_vpd_mean_nofire[-store_fire_index] = high_99wind_vpd_mean[-store_fire_index]
# high_99wind_vpd_mean_smallfire[small_fire_index] =high_99wind_vpd_mean[small_fire_index]
# high_99wind_vpd_mean_largefire[large_fire_index] = high_99wind_vpd_mean[large_fire_index]
# high_99wind_vpd_mean_fire_ma[length(mean_ws)-1] = high_99wind_vpd_mean[length(mean_ws)-1]
# 
# high_99wind_vpd_max_fire <- rep(NA, length(high_99wind_vpd_max))
# high_99wind_vpd_max_nofire <- rep(NA, length(high_99wind_vpd_max))
# high_99wind_vpd_max_largefire <- rep(NA, length(max_ws))
# high_99wind_vpd_max_smallfire <- rep(NA, length(max_ws))
# high_99wind_vpd_max_fire_ma <- rep(NA, length(high_99wind_vpd_max)) 
# high_99wind_vpd_max_fire[store_fire_index] = high_99wind_vpd_max[store_fire_index]
# high_99wind_vpd_max_nofire[-store_fire_index] = high_99wind_vpd_max[-store_fire_index]
# high_99wind_vpd_max_smallfire[small_fire_index] =high_99wind_vpd_max[small_fire_index]
# high_99wind_vpd_max_largefire[large_fire_index] = high_99wind_vpd_max[large_fire_index]
# high_99wind_vpd_max_fire_ma[length(mean_ws)-1] = high_99wind_vpd_max[length(mean_ws)-1]

mean_fm100_fire <- rep(NA, length(mean_fm100))
mean_fm100_nofire <- rep(NA, length(mean_fm100))
mean_fm100_smallfire <- rep(NA, length(mean_fm100))
mean_fm100_largefire <- rep(NA, length(mean_fm100))
mean_fm100_fire_ma <- rep(NA, length(mean_fm100))
mean_fm100_fire[store_fire_index] = mean_fm100[store_fire_index]
mean_fm100_nofire[-store_fire_index] = mean_fm100[-store_fire_index]
mean_fm100_smallfire[small_fire_index] =mean_fm100[small_fire_index]
mean_fm100_largefire[large_fire_index] = mean_fm100[large_fire_index]
mean_fm100_fire_ma[length(mean_fm100)-1] = mean_fm100[length(mean_fm100)-1]

max_fm100_fire <- rep(NA, length(max_fm100)) 
max_fm100_nofire <- rep(NA, length(max_fm100))
max_fm100_largefire <- rep(NA, length(max_fm100))
max_fm100_smallfire <- rep(NA, length(max_fm100))
max_fm100_fire_ma <- rep(NA, length(max_fm100)) 
max_fm100_fire[store_fire_index] = max_fm100[store_fire_index]
max_fm100_nofire[-store_fire_index] = max_fm100[-store_fire_index]
max_fm100_smallfire[small_fire_index] =max_fm100[small_fire_index]
max_fm100_largefire[large_fire_index] = max_fm100[large_fire_index]
max_fm100_fire_ma[length(mean_fm100)-1] = max_fm100[length(mean_fm100)-1]

pct95_fm100_fire <- rep(NA, length(pct95_fm100)) 
pct95_fm100_nofire <- rep(NA, length(pct95_fm100)) 
pct95_fm100_largefire <- rep(NA, length(pct95_fm100))
pct95_fm100_smallfire <- rep(NA, length(pct95_fm100))
pct95_fm100_fire_ma <- rep(NA, length(pct95_fm100)) 
pct95_fm100_fire[store_fire_index] = pct95_fm100[store_fire_index]
pct95_fm100_nofire[-store_fire_index] = pct95_fm100[-store_fire_index]
pct95_fm100_smallfire[small_fire_index] =pct95_fm100[small_fire_index]
pct95_fm100_largefire[large_fire_index] = pct95_fm100[large_fire_index]
pct95_fm100_fire_ma[length(mean_fm100)-1] = pct95_fm100[length(mean_fm100)-1]

mean_fm1000_fire <- rep(NA, length(mean_fm1000))
mean_fm1000_nofire <- rep(NA, length(mean_fm1000))
mean_fm1000_smallfire <- rep(NA, length(mean_fm1000))
mean_fm1000_largefire <- rep(NA, length(mean_fm1000))
mean_fm1000_fire_ma <- rep(NA, length(mean_fm1000))
mean_fm1000_fire[store_fire_index] = mean_fm1000[store_fire_index]
mean_fm1000_nofire[-store_fire_index] = mean_fm1000[-store_fire_index]
mean_fm1000_smallfire[small_fire_index] =mean_fm1000[small_fire_index]
mean_fm1000_largefire[large_fire_index] = mean_fm1000[large_fire_index]
mean_fm1000_fire_ma[length(mean_fm1000)-1] = mean_fm1000[length(mean_fm1000)-1]

max_fm1000_fire <- rep(NA, length(max_fm1000)) 
max_fm1000_nofire <- rep(NA, length(max_fm1000))
max_fm1000_smallfire <- rep(NA, length(max_fm1000))
max_fm1000_largefire <- rep(NA, length(max_fm1000))
max_fm1000_fire_ma <- rep(NA, length(max_fm1000)) 
max_fm1000_fire[store_fire_index] = max_fm1000[store_fire_index]
max_fm1000_nofire[-store_fire_index] = max_fm1000[-store_fire_index]
max_fm1000_smallfire[small_fire_index] =max_fm1000[small_fire_index]
max_fm1000_largefire[large_fire_index] = max_fm1000[large_fire_index]
max_fm1000_fire_ma[length(mean_fm1000)-1] = max_fm1000[length(mean_fm1000)-1]

pct95_fm1000_fire <- rep(NA, length(pct95_fm1000)) 
pct95_fm1000_nofire <- rep(NA, length(pct95_fm1000)) 
pct95_fm1000_largefire <- rep(NA, length(max_ws))
pct95_fm1000_smallfire <- rep(NA, length(max_ws))
pct95_fm1000_fire_ma <- rep(NA, length(pct95_fm1000)) 
pct95_fm1000_fire[store_fire_index] = pct95_fm1000[store_fire_index]
pct95_fm1000_nofire[-store_fire_index] = pct95_fm1000[-store_fire_index]
pct95_fm1000_smallfire[small_fire_index] =pct95_fm1000[small_fire_index]
pct95_fm1000_largefire[large_fire_index] = pct95_fm1000[large_fire_index]
pct95_fm1000_fire_ma[length(mean_fm1000)-1] = pct95_fm1000[length(mean_fm1000)-1]

mean_pdsi_fire <- rep(NA, length(mean_pdsi))
mean_pdsi_nofire <- rep(NA, length(mean_pdsi))
mean_pdsi_smallfire <- rep(NA, length(mean_pdsi))
mean_pdsi_largefire <- rep(NA, length(mean_pdsi))
mean_pdsi_fire_ma <- rep(NA, length(mean_pdsi))
mean_pdsi_fire[store_fire_index] = mean_pdsi[store_fire_index]
mean_pdsi_nofire[-store_fire_index] = mean_pdsi[-store_fire_index]
mean_pdsi_smallfire[small_fire_index] =mean_pdsi[small_fire_index]
mean_pdsi_largefire[large_fire_index] = mean_pdsi[large_fire_index]
mean_pdsi_fire_ma[length(mean_pdsi)-1] = mean_pdsi[length(mean_pdsi)-1]

max_pdsi_fire <- rep(NA, length(max_pdsi)) 
max_pdsi_nofire <- rep(NA, length(max_pdsi))
max_pdsi_smallfire <- rep(NA, length(max_pdsi))
max_pdsi_largefire <- rep(NA, length(max_pdsi))
max_pdsi_fire_ma <- rep(NA, length(max_pdsi)) 
max_pdsi_fire[store_fire_index] = max_pdsi[store_fire_index]
max_pdsi_nofire[-store_fire_index] = max_pdsi[-store_fire_index]
max_pdsi_smallfire[small_fire_index] =max_pdsi[small_fire_index]
max_pdsi_largefire[large_fire_index] = max_pdsi[large_fire_index]
max_pdsi_fire_ma[length(mean_pdsi)-1] = max_pdsi[length(mean_pdsi)-1]

pct95_pdsi_fire <- rep(NA, length(pct95_pdsi)) 
pct95_pdsi_nofire <- rep(NA, length(pct95_pdsi)) 
pct95_pdsi_largefire <- rep(NA, length(pct95_pdsi))
pct95_pdsi_smallfire <- rep(NA, length(pct95_pdsi))
pct95_pdsi_fire_ma <- rep(NA, length(pct95_pdsi)) 
pct95_pdsi_fire[store_fire_index] = pct95_pdsi[store_fire_index]
pct95_pdsi_nofire[-store_fire_index] = pct95_pdsi[-store_fire_index]
pct95_pdsi_smallfire[small_fire_index] =pct95_pdsi[small_fire_index]
pct95_pdsi_largefire[large_fire_index] = pct95_pdsi[large_fire_index]
pct95_pdsi_fire_ma[length(mean_pdsi)-1] = pct95_pdsi[length(mean_pdsi)-1]

mean_pet_fire <- rep(NA, length(mean_pet))
mean_pet_nofire <- rep(NA, length(mean_pet))
mean_pet_smallfire <- rep(NA, length(mean_pet))
mean_pet_largefire <- rep(NA, length(mean_pet))
mean_pet_fire_ma <- rep(NA, length(mean_pet))
mean_pet_fire[store_fire_index] = mean_pet[store_fire_index]
mean_pet_nofire[-store_fire_index] = mean_pet[-store_fire_index]
mean_pet_smallfire[small_fire_index] =mean_pet[small_fire_index]
mean_pet_largefire[large_fire_index] = mean_pet[large_fire_index]
mean_pet_fire_ma[length(mean_pet)-1] = mean_pet[length(mean_pet)-1]

max_pet_fire <- rep(NA, length(max_pet)) 
max_pet_nofire <- rep(NA, length(max_pet))
max_pet_smallfire <- rep(NA, length(max_pet))
max_pet_largefire <- rep(NA, length(max_pet))
max_pet_fire_ma <- rep(NA, length(max_pet)) 
max_pet_fire[store_fire_index] = max_pet[store_fire_index]
max_pet_nofire[-store_fire_index] = max_pet[-store_fire_index]
max_pet_smallfire[small_fire_index] =max_pet[small_fire_index]
max_pet_largefire[large_fire_index] = max_pet[large_fire_index]
max_pet_fire_ma[length(mean_pet)-1] = max_pet[length(mean_pet)-1]

pct95_pet_fire <- rep(NA, length(pct95_pet)) 
pct95_pet_nofire <- rep(NA, length(pct95_pet)) 
pct95_pet_largefire <- rep(NA, length(pct95_pet))
pct95_pet_smallfire <- rep(NA, length(pct95_pet))
pct95_pet_fire_ma <- rep(NA, length(pct95_pet)) 
pct95_pet_fire[store_fire_index] = pct95_pet[store_fire_index]
pct95_pet_nofire[-store_fire_index] = pct95_pet[-store_fire_index]
pct95_pet_smallfire[small_fire_index] =pct95_pet[small_fire_index]
pct95_pet_largefire[large_fire_index] = pct95_pet[large_fire_index]
pct95_pet_fire_ma[length(mean_pet)-1] = pct95_pet[length(mean_pet)-1]

mean_spei90_fire <- rep(NA, length(mean_spei90))
mean_spei90_nofire <- rep(NA, length(mean_spei90))
mean_spei90_smallfire <- rep(NA, length(mean_spei90))
mean_spei90_largefire <- rep(NA, length(mean_spei90))
mean_spei90_fire_ma <- rep(NA, length(mean_spei90))
mean_spei90_fire[store_fire_index] = mean_spei90[store_fire_index]
mean_spei90_nofire[-store_fire_index] = mean_spei90[-store_fire_index]
mean_spei90_smallfire[small_fire_index] =mean_spei90[small_fire_index]
mean_spei90_largefire[large_fire_index] = mean_spei90[large_fire_index]
mean_spei90_fire_ma[length(mean_spei90)-1] = mean_spei90[length(mean_spei90)-1]

max_spei90_fire <- rep(NA, length(max_spei90)) 
max_spei90_nofire <- rep(NA, length(max_spei90))
max_spei90_smallfire <- rep(NA, length(max_spei90))
max_spei90_largefire <- rep(NA, length(max_spei90))
max_spei90_fire_ma <- rep(NA, length(max_spei90)) 
max_spei90_fire[store_fire_index] = max_spei90[store_fire_index]
max_spei90_nofire[-store_fire_index] = max_spei90[-store_fire_index]
max_spei90_smallfire[small_fire_index] =max_spei90[small_fire_index]
max_spei90_largefire[large_fire_index] = max_spei90[large_fire_index]
max_spei90_fire_ma[length(mean_spei90)-1] = max_spei90[length(mean_spei90)-1]

pct95_spei90_fire <- rep(NA, length(pct95_spei90)) 
pct95_spei90_nofire <- rep(NA, length(pct95_spei90)) 
pct95_spei90_largefire <- rep(NA, length(pct95_spei90))
pct95_spei90_smallfire <- rep(NA, length(pct95_spei90))
pct95_spei90_fire_ma <- rep(NA, length(pct95_spei90)) 
pct95_spei90_fire[store_fire_index] = pct95_spei90[store_fire_index]
pct95_spei90_nofire[-store_fire_index] = pct95_spei90[-store_fire_index]
pct95_spei90_smallfire[small_fire_index] =pct95_spei90[small_fire_index]
pct95_spei90_largefire[large_fire_index] = pct95_spei90[large_fire_index]
pct95_spei90_fire_ma[length(mean_spei90)-1] = pct95_spei90[length(mean_spei90)-1]

mean_sph_fire <- rep(NA, length(mean_sph))
mean_sph_nofire <- rep(NA, length(mean_sph))
mean_sph_smallfire <- rep(NA, length(mean_sph))
mean_sph_largefire <- rep(NA, length(mean_sph))
mean_sph_fire_ma <- rep(NA, length(mean_sph))
mean_sph_fire[store_fire_index] = mean_sph[store_fire_index]
mean_sph_nofire[-store_fire_index] = mean_sph[-store_fire_index]
mean_sph_smallfire[small_fire_index] =mean_sph[small_fire_index]
mean_sph_largefire[large_fire_index] = mean_sph[large_fire_index]
mean_sph_fire_ma[length(mean_sph)-1] = mean_sph[length(mean_sph)-1]

max_sph_fire <- rep(NA, length(max_sph)) 
max_sph_nofire <- rep(NA, length(max_sph))
max_sph_smallfire <- rep(NA, length(max_sph))
max_sph_largefire <- rep(NA, length(max_sph))
max_sph_fire_ma <- rep(NA, length(max_sph)) 
max_sph_fire[store_fire_index] = max_sph[store_fire_index]
max_sph_nofire[-store_fire_index] = max_sph[-store_fire_index]
max_sph_smallfire[small_fire_index] =max_sph[small_fire_index]
max_sph_largefire[large_fire_index] = max_sph[large_fire_index]
max_sph_fire_ma[length(mean_sph)-1] = max_sph[length(mean_sph)-1]

pct95_sph_fire <- rep(NA, length(pct95_sph)) 
pct95_sph_nofire <- rep(NA, length(pct95_sph)) 
pct95_sph_largefire <- rep(NA, length(pct95_sph))
pct95_sph_smallfire <- rep(NA, length(pct95_sph))
pct95_sph_fire_ma <- rep(NA, length(pct95_sph)) 
pct95_sph_fire[store_fire_index] = pct95_sph[store_fire_index]
pct95_sph_nofire[-store_fire_index] = pct95_sph[-store_fire_index]
pct95_sph_smallfire[small_fire_index] =pct95_sph[small_fire_index]
pct95_sph_largefire[large_fire_index] = pct95_sph[large_fire_index]
pct95_sph_fire_ma[length(mean_sph)-1] = pct95_sph[length(mean_sph)-1]

mean_spi90_fire <- rep(NA, length(mean_spi90))
mean_spi90_nofire <- rep(NA, length(mean_spi90))
mean_spi90_smallfire <- rep(NA, length(mean_spi90))
mean_spi90_largefire <- rep(NA, length(mean_spi90))
mean_spi90_fire_ma <- rep(NA, length(mean_spi90))
mean_spi90_fire[store_fire_index] = mean_spi90[store_fire_index]
mean_spi90_nofire[-store_fire_index] = mean_spi90[-store_fire_index]
mean_spi90_smallfire[small_fire_index] =mean_spi90[small_fire_index]
mean_spi90_largefire[large_fire_index] = mean_spi90[large_fire_index]
mean_spi90_fire_ma[length(mean_spi90)-1] = mean_spi90[length(mean_spi90)-1]

max_spi90_fire <- rep(NA, length(max_spi90)) 
max_spi90_nofire <- rep(NA, length(max_spi90))
max_spi90_smallfire <- rep(NA, length(max_spi90))
max_spi90_largefire <- rep(NA, length(max_spi90))
max_spi90_fire_ma <- rep(NA, length(max_spi90)) 
max_spi90_fire[store_fire_index] = max_spi90[store_fire_index]
max_spi90_nofire[-store_fire_index] = max_spi90[-store_fire_index]
max_spi90_smallfire[small_fire_index] =max_spi90[small_fire_index]
max_spi90_largefire[large_fire_index] = max_spi90[large_fire_index]
max_spi90_fire_ma[length(mean_spi90)-1] = max_spi90[length(mean_spi90)-1]

pct95_spi90_fire <- rep(NA, length(pct95_spi90)) 
pct95_spi90_nofire <- rep(NA, length(pct95_spi90)) 
pct95_spi90_largefire <- rep(NA, length(pct95_spi90))
pct95_spi90_smallfire <- rep(NA, length(pct95_spi90))
pct95_spi90_fire_ma <- rep(NA, length(pct95_spi90)) 
pct95_spi90_fire[store_fire_index] = pct95_spi90[store_fire_index]
pct95_spi90_nofire[-store_fire_index] = pct95_spi90[-store_fire_index]
pct95_spi90_smallfire[small_fire_index] =pct95_spi90[small_fire_index]
pct95_spi90_largefire[large_fire_index] = pct95_spi90[large_fire_index]
pct95_spi90_fire_ma[length(mean_spi90)-1] = pct95_spi90[length(mean_spi90)-1]

mean_tmmn_fire <- rep(NA, length(mean_tmmn))
mean_tmmn_nofire <- rep(NA, length(mean_tmmn))
mean_tmmn_smallfire <- rep(NA, length(mean_tmmn))
mean_tmmn_largefire <- rep(NA, length(mean_tmmn))
mean_tmmn_fire_ma <- rep(NA, length(mean_tmmn))
mean_tmmn_fire[store_fire_index] = mean_tmmn[store_fire_index]
mean_tmmn_nofire[-store_fire_index] = mean_tmmn[-store_fire_index]
mean_tmmn_smallfire[small_fire_index] =mean_tmmn[small_fire_index]
mean_tmmn_largefire[large_fire_index] = mean_tmmn[large_fire_index]
mean_tmmn_fire_ma[length(mean_tmmn)-1] = mean_tmmn[length(mean_tmmn)-1]

max_tmmn_fire <- rep(NA, length(max_tmmn)) 
max_tmmn_nofire <- rep(NA, length(max_tmmn))
max_tmmn_smallfire <- rep(NA, length(max_tmmn))
max_tmmn_largefire <- rep(NA, length(max_tmmn))
max_tmmn_fire_ma <- rep(NA, length(max_tmmn)) 
max_tmmn_fire[store_fire_index] = max_tmmn[store_fire_index]
max_tmmn_nofire[-store_fire_index] = max_tmmn[-store_fire_index]
max_tmmn_smallfire[small_fire_index] =max_tmmn[small_fire_index]
max_tmmn_largefire[large_fire_index] = max_tmmn[large_fire_index]
max_tmmn_fire_ma[length(mean_tmmn)-1] = max_tmmn[length(mean_tmmn)-1]

pct95_tmmn_fire <- rep(NA, length(pct95_tmmn)) 
pct95_tmmn_nofire <- rep(NA, length(pct95_tmmn)) 
pct95_tmmn_largefire <- rep(NA, length(pct95_tmmn))
pct95_tmmn_smallfire <- rep(NA, length(pct95_tmmn))
pct95_tmmn_fire_ma <- rep(NA, length(pct95_tmmn)) 
pct95_tmmn_fire[store_fire_index] = pct95_tmmn[store_fire_index]
pct95_tmmn_nofire[-store_fire_index] = pct95_tmmn[-store_fire_index]
pct95_tmmn_smallfire[small_fire_index] =pct95_tmmn[small_fire_index]
pct95_tmmn_largefire[large_fire_index] = pct95_tmmn[large_fire_index]
pct95_tmmn_fire_ma[length(mean_tmmn)-1] = pct95_tmmn[length(mean_tmmn)-1]

mean_tmmx_fire <- rep(NA, length(mean_tmmx))
mean_tmmx_nofire <- rep(NA, length(mean_tmmx))
mean_tmmx_smallfire <- rep(NA, length(mean_tmmx))
mean_tmmx_largefire <- rep(NA, length(mean_tmmx))
mean_tmmx_fire_ma <- rep(NA, length(mean_tmmx))
mean_tmmx_fire[store_fire_index] = mean_tmmx[store_fire_index]
mean_tmmx_nofire[-store_fire_index] = mean_tmmx[-store_fire_index]
mean_tmmx_smallfire[small_fire_index] =mean_tmmx[small_fire_index]
mean_tmmx_largefire[large_fire_index] = mean_tmmx[large_fire_index]
mean_tmmx_fire_ma[length(mean_tmmx)-1] = mean_tmmx[length(mean_tmmx)-1]

max_tmmx_fire <- rep(NA, length(max_tmmx)) 
max_tmmx_nofire <- rep(NA, length(max_tmmx))
max_tmmx_smallfire <- rep(NA, length(max_tmmx))
max_tmmx_largefire <- rep(NA, length(max_tmmx))
max_tmmx_fire_ma <- rep(NA, length(max_tmmx)) 
max_tmmx_fire[store_fire_index] = max_tmmx[store_fire_index]
max_tmmx_nofire[-store_fire_index] = max_tmmx[-store_fire_index]
max_tmmx_smallfire[small_fire_index] =max_tmmx[small_fire_index]
max_tmmx_largefire[large_fire_index] = max_tmmx[large_fire_index]
max_tmmx_fire_ma[length(mean_tmmx)-1] = max_tmmx[length(mean_tmmx)-1]

pct95_tmmx_fire <- rep(NA, length(pct95_tmmx)) 
pct95_tmmx_nofire <- rep(NA, length(pct95_tmmx)) 
pct95_tmmx_largefire <- rep(NA, length(pct95_tmmx))
pct95_tmmx_smallfire <- rep(NA, length(pct95_tmmx))
pct95_tmmx_fire_ma <- rep(NA, length(pct95_tmmx)) 
pct95_tmmx_fire[store_fire_index] = pct95_tmmx[store_fire_index]
pct95_tmmx_nofire[-store_fire_index] = pct95_tmmx[-store_fire_index]
pct95_tmmx_smallfire[small_fire_index] =pct95_tmmx[small_fire_index]
pct95_tmmx_largefire[large_fire_index] = pct95_tmmx[large_fire_index]
pct95_tmmx_fire_ma[length(mean_tmmx)-1] = pct95_tmmx[length(mean_tmmx)-1]
