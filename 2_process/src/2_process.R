


source("2_process/src/process_and_style.R")

p2_targets_list <- list(
  tar_target(
    site_data_clean, 
    process_data(site_data)
  ),
  tar_target(
    site_data_annotated_csv,
    annotate_data(site_data_clean, site_filename = site_info_csv, fileout="2_process/out/site_data_annotated.csv"),
    format= "file"
  )
)