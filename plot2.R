#### Ploting Graph 2 #####
png(file="plot2.png") ## Open png device; create 'plot1.png' in current working directory

with(tidydata, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))       

dev.off()
