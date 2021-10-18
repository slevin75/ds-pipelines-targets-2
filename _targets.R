library(targets)
library(readr)


options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "dataRetrieval")) # Loading tidyverse because we need dplyr, ggplot2, readr, stringr, and purrr

##p1 target parameters
startDate<-"2014-05-01"
endDate<-"2015-05-01"
parameterCd<-'00010'

##p3 target parameters
p_width <- 12
p_height <- 7
p_units <- "in"


source("1_fetch/src/1_fetch.R")
source("2_process/src/2_process.R")
source("3_visualize/src/3_visualize.R")


# Return the complete list of targets
c(p1_targets_list, p2_targets_list, p3_targets_list)
