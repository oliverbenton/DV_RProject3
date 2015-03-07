#Create two plots that compare net savings and food aid
first <- ggplot(savings, aes(x=FOODAID2000, y=NETSAVINGS2000,color=Country)) + geom_point()
second <- ggplot(savings, aes(x=FOODAID2008, y=NETSAVINGS2008,color=Country)) + geom_point()
#BEAUTIFUL PLOTTING
#Add titles 
first <- first + ggtitle('2000')
first <- first + theme(plot.title=element_text(size=20, face="bold", vjust=2))
second <- second + ggtitle('2008')
second <- second + theme(plot.title=element_text(size=20, face="bold", vjust=2))
#Change x and y labels
first <- first + labs(x="Food Aid(in 1000 MT)", y="Net Savings(% of Net Income)")
second <- second + labs(x="Food Aid(in 1000 MT)", y="Net Savings(% of Net Income)")
#Change colors of labels
first <- first + theme(
  axis.title.x=element_text(color="150", vjust=0.35),
  axis.title.y=element_text(color="139", vjust=0.35)
)
second <- second + theme(
  axis.title.x=element_text(color="150", vjust=0.35),
  axis.title.y=element_text(color="139", vjust=0.35)
)
#Set x limits to match both graphs
first <- first + xlim(c(0,400))
second <- second + xlim(c(0,400))
#Change the backgrounds
first <- first + theme(panel.background=element_rect(fill='gray'))
first <- first + theme(plot.background=element_rect(fill='white'), axis.text.x=element_text(angle=90))
second <- second + theme(panel.background=element_rect(fill='gray'))
second <- second + theme(plot.background=element_rect(fill='white'), axis.text.x=element_text(angle=90))
#Use pushViewport() to put both graphs together
library(grid)
pushViewport(viewport(layout=grid.layout(1,2), width = 1.1))
print(first,vp=viewport(layout.pos.row=1,layout.pos.col=1))
print(second,vp=viewport(layout.pos.row=1,layout.pos.col=2))
