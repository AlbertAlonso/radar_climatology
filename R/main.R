# Author: Francesc Roura Adserias 29/08/2020
# this script is the main script of the radar_climatology repository

########################################################################
# It is excecuted in the form "Rscript main.R initial_date final_date" #
########################################################################
  argv <- commandArgs(trailingOnly = TRUE)
  date.ini <- as.Date(x=as.character(argv[1]),format="%Y%m%d")
  date.fin <- as.Date(x=as.character(argv[2]),format="%Y%m%d")
  date.ini <- as.Date(x=as.character(20190101),format="%Y%m%d")
  date.fin <- as.Date(x=as.character(20190110),format="%Y%m%d")

if(date.ini < as.Date(x=as.character(20130101),format="%Y%m%d")) {
	stop(paste0("Initial date ",date.ini ," is out of range"))
} else if (date.fin > as.Date(x=as.character(20191001),format="%Y%m%d")){
	stop(paste0("End date ", date.fin, " is out of range"))
}

# load configuration file
source("./config.R")

# load create available data vectors function
source("./data_check.R")

available.files <- exists.data(date.ini, date.fin, data.dir)

source("./cut.R")

#daily_cut
cut_files(available.files$daily, shp.dir, outdir)

#hourly cut
cut_files(available.files$hourly, shp.dir, outdir)