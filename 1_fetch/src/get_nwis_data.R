
compile_nwis_data <- function(sites){
  ##this will take a list of file names, created by download_nwis_site_data and 
  ##open them up
  data_out<-data.frame()
  # loop through files to open 
  for (d in seq_along(sites)){
    
    # read the downloaded data and append it to the existing data.frame
   # these_data <- read_csv(filedirs[d], col_types = 'ccTdcc')
    data_out <- bind_rows(data_out, sites[[d]])
  }
  return(data_out)
}




nwis_site_info <- function(fileout, site_data){
  site_no <- unique(site_data$site_no)
  site_info <- dataRetrieval::readNWISsite(site_no)
  write_csv(site_info, fileout)
  return(fileout)
}


download_nwis_site_data <- function(site_num,outdir, parameterCd, startDate, endDate){
  
   # readNWISdata is from the dataRetrieval package
  data_out <- readNWISdata(sites=site_num, service="iv", 
                           parameterCd = parameterCd, startDate = startDate, endDate = endDate)

  # -- simulating a failure-prone web-sevice here, do not edit --
 # set.seed(Sys.time())
 # if (sample(c(T,F,F,F), 1)){
 #   stop(site_num, ' has failed due to connection timeout. Try tar_make() again')
 # }
  # -- end of do-not-edit block
 # filepath<-file.path(outdir,paste0(site_num, ".csv"))
 # write_csv(data_out, file = filepath)
 # return(filepath)
  return(data_out)
}






