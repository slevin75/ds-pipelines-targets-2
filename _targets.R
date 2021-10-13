library(targets)
library(readr)

source("1_fetch/src/get_nwis_data.R")
source("2_process/src/process_and_style.R")
source("3_visualize/src/plot_timeseries.R")

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "dataRetrieval")) # Loading tidyverse because we need dplyr, ggplot2, readr, stringr, and purrr
p_width <- 12
p_height <- 7
p_units <- "in"
startDate<-"2014-05-01"
endDate<-"2015-05-01"
parameterCd<-'00010'


###download, save, and compile data for each site
p1_targets_list <- list(
  tar_target(
    g01427207,
    download_nwis_site_data(site_num= "01427207",outdir="1_fetch/out",parameterCd,startDate,endDate), 
    format="file"
  ),
  tar_target(
    g01432160,
    download_nwis_site_data(site_num= "01432160",outdir="1_fetch/out",parameterCd,startDate,endDate), 
    format="file"
  ),
  tar_target(
    g01436690,
    download_nwis_site_data(site_num= "01436690",outdir="1_fetch/out",parameterCd,startDate,endDate), 
    format="file"
  ),
  tar_target(
    g01466500,
    download_nwis_site_data(site_num= "01466500",outdir="1_fetch/out",parameterCd,startDate,endDate), 
    format="file"
  ),
  tar_target(
    g01435000,
    download_nwis_site_data(site_num= "01435000",outdir="1_fetch/out",parameterCd,startDate,endDate), 
    format="file"
  ),
  tar_target(
    site_data,
    compile_nwis_data(c(g01427207, g01432160,g01436690, g01466500,  g01435000)),
  ),
  tar_target(
    site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv", site_data),
    format = "file"
  )
)



p2_targets_list <- list(
  tar_target(
    site_data_clean, 
    process_data(site_data)
  ),
  tar_target(
    site_data_annotated,
    annotate_data(site_data_clean, site_filename = site_info_csv)
  )
)

p3_targets_list <- list(
  tar_target(
    figure_1_png,
    plot_nwis_timeseries(fileout = "3_visualize/out/figure_1.png", site_data_annotated,
                         width=p_width,height=p_height,units=p_units),
    format = "file"
  )
)

# Return the complete list of targets
c(p1_targets_list, p2_targets_list, p3_targets_list)
