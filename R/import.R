#libraries 
library(dplyr)
library(janitor)
library(readr)
#This data was sourced from:https://ghdx.healthdata.org/record/ihme-data/gbd-2019-smoking-tobacco-use-prevalence-1990-2019

#The import_data function the goes into the directory, checks for csv pattern and imports it as a list and then convert it to a data frame
import_data<-function(dir) {
  #if no csv files it sends a warning message
  if (!(length(list.files(dir, pattern = "\\.csv$")) > 0)) stop("There are no .csv files in the input dir.")
  data <- map(
    list.files(dir, pattern = "\\.csv$|\\.CSV$", full.names = TRUE,recursive = TRUE),
    ~ read_csv(
      file = .x)%>%
      clean_names()%>%
      #remove columns not used 
      select(-matches(c('measure_name','location_id','sex_id','age_group_id','age_group_name','upper','lower'))))%>%
    as.data.frame()
   return(data)
}

