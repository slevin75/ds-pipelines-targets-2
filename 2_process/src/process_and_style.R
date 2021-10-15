process_data <- function(nwis_data){
  nwis_data_clean <- rename(nwis_data, water_temperature = X_00010_00000) %>% 
    select(-agency_cd, -X_00010_00000_cd, -tz_cd)
  
  return(nwis_data_clean)
}

annotate_data <- function(site_data_clean, site_filename,fileout){
  site_info <- read_csv(site_filename)
  annotated_data <- left_join(site_data_clean, site_info, by = "site_no") %>% 
    select(station_name = station_nm, site_no, dateTime, water_temperature, latitude = dec_lat_va, longitude = dec_long_va)
  mutate(annotated_data,station_name=as.factor(station_name))
  write_csv(annotated_data, file = fileout)
  return(fileout)
}

