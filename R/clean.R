#Cleaning the data 
#At the end, I want to have a table where the change rate from 1990-2019 is estimated for each gender per location (final processed data include in data\processed_data.csv)
#To do that I make sure I have start and end year per gender, per country
#I determine the change rate using start and end year
#I then spread the sex_name column so that I can have Female and Male as columns with rate_change as the values
clean_data<-function(df) {
  #Filter the start and end year of interest
  #Filter the gender, remove 'Both'
  df <-df%>%
          filter(year_id==1990 | year_id==2019 )%>%
            filter(sex_name != 'Both' ) %>% 
             unique( by = c("sex_name", "location_name"))%>%
            #Calculate percentage change for each gender
            group_by(location_name,sex_name) %>% 
              arrange(year_id, .by_group = TRUE) %>%
              mutate(rate_change = (val/lag(val) - 1))%>%
              drop_na(rate_change)%>%
              select(location_name,sex_name,rate_change)%>%
              #Make the sex_name values to be columns
              spread(sex_name, rate_change)
    return(df)
}