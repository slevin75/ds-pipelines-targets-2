

source("1_fetch/src/get_nwis_data.R")


###download, save, and compile data for each site
p1_targets_list <- list(
  tar_target(
    g01427207,
    download_nwis_site_data(site_num= "01427207",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    g01432160,
    download_nwis_site_data(site_num= "01432160",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    g01436690,
    download_nwis_site_data(site_num= "01436690",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    g01466500,
    download_nwis_site_data(site_num= "01466500",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    g01435000,
    download_nwis_site_data(site_num= "01435000",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    site_data,
    compile_nwis_data(list(g01427207, g01432160,g01436690, g01466500,  g01435000)),
  ),
  tar_target(
    site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv", site_data),
    format = "file"
  )
)
