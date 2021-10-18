

source("1_fetch/src/get_nwis_data.R")


###download, save, and compile data for each site
p1_targets_list <- list(
  tar_target(
    p1_01427207,
    download_nwis_site_data(site_num= "01427207",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    p1_01432160,
    download_nwis_site_data(site_num= "01432160",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    p1_01436690,
    download_nwis_site_data(site_num= "01436690",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    p1_01466500,
    download_nwis_site_data(site_num= "01466500",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    p1_01435000,
    download_nwis_site_data(site_num= "01435000",outdir="1_fetch/out",parameterCd,startDate,endDate)
  ),
  tar_target(
    p1_site_data,
    compile_nwis_data(list(p1_01427207, p1_01432160,p1_01436690, p1_01466500,  p1_01435000)),
  ),
  tar_target(
    p1_site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv", p1_site_data),
    format = "file"
  )
)
