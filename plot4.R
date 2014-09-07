#### Ploting Graph 4 #####
png(file="plot4.png") ## Open png device; create 'plot1.png' in current working directory

par(mfrow=c(2,2))

## plotting on row 1, col 1
with(tidydata, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))       


## plotting on row 1, col 2
with(tidydata, plot(DateTime,Voltage, type="l", xlab="", ylab="Voltage"))       


## plotting on row 2, col 1
with(tidydata, plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")) 
with(tidydata, lines(DateTime,Sub_metering_2, type="l", col="red")) 
with(tidydata, lines(DateTime,Sub_metering_3, type="l", col="blue")) 
##legend("topright", pch="__", col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plotting on row 2, col 2
with(tidydata, plot(DateTime,Global_active_power/10, xlab="", type="h") )      

dev.off()