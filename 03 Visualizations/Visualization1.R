bottom_el_joined <- joined_data %>% filter(as.numeric(ElectricityGeneration) < 50)

g <- ggplot(bottom_el_joined, aes(x=Population, y=as.numeric(ElectricityGeneration), color = Country)) + geom_point()

g + labs(title='Electricity Generation versus Population Size Year 2005') + theme(plot.title=element_text(size=15, face="bold", vjust=2, color="#006600")) + theme(panel.background=element_rect(fill='#CCFFCC')) + theme(panel.grid.major=element_line(colour="#66CC00",size=0.3)) + theme(panel.grid.minor=element_line(colour="#99FF99",size=0.3)) + theme(axis.title.x=element_text(color="#006600", vjust=0.35)) + theme(axis.title.y=element_text(color="#006600", vjust=1)) + labs(x="Population (Million)", y="Generated Electricity (Billion Kilowatthours)")