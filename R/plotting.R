#Plotting the graph 
#Using ggplot I choose a scatter plot to represent the relationship between male and female wrt rate change.
ggplot(df, aes(Male, Female), scale="globalminmax") +labs(x="Change in male rate", y="Change in female rate", title='Daily smoking prevalence, 1990-2019, percentage-point change') +
  #Adding the centre line on x-axis and y-axis
  geom_vline(xintercept = 0, linetype = 2) +
  geom_hline(yintercept = 0, linetype = 2) +
  #colouring the points
  geom_point(colour='purple') +
  theme_minimal()+
  #Labeling the different parts of the Cartesian, defining the size and position of label
  annotate(geom = 'text', label = 'Female increase \n Male increase', x = 5, y = 8, size = 2, colour='brown') +
  annotate(geom = 'text', label = 'Female decrease \n Male increase', x = 5, y = -5, size = 2, colour='orange') +
  annotate(geom = 'text', label = 'Female decrease \n Male decrease', x = -2, y = -3, size = 2, colour='deepskyblue', angle=90) +
  annotate(geom = 'text', label = 'Female increase \n Male decrease', x = -2, y = 5,size = 2,colour='blue',angle=90)+
  #Size of title text, x-axis tile and y-axis title
  theme(plot.title = element_text(size=8),
        axis.title.x = element_text(size = 6),
        axis.title.y = element_text(size = 6))+
        #Adding labels to the dots : country labels
        geom_text(
        label=df$location_name, 
        nudge_x = 0.25, nudge_y = 0.25, 
        check_overlap = T, size=1.5
  )
