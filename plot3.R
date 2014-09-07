#### Ploting Graph 3 #####
png(file="plot3.png") ## Open png device; create 'plot1.png' in current working directory

with(tidydata, plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")) 
with(tidydata, lines(DateTime,Sub_metering_2, type="l", col="red")) 
with(tidydata, lines(DateTime,Sub_metering_3, type="l", col="blue")) 
legend("topright", pch="__", col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
