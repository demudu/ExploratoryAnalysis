# Create a data directory (electricdata) in the current working direcrory 

CheckDir <- function(dirname) {
  
    if (!file.exists(dirname)) {  ## check to see if the directory exist
    dir.create(dirname)         ## will create a directory if it doesn't exist
  }
}

CheckDir("electricdata")
# set R working directory to electricdata
setwd("./electricdata")

# get the zip file url
zipfileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# create a temporary directory
td = getwd()
# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")

# download into the placeholder file
download.file(zipfileurl, tf)

# get the name of the first file in the zip archive
fname = unzip(tf, list=TRUE)$Name[1]
# unzip the file to the temporary directory
unzip(tf, files=fname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
##fpath = file.path(td, fname) - Not needed as working directory already set to elecricdata
unlink(tf)
unlink(td)

## load data to R for day 1/2/2007 and 2/22007
require(sqldf)
data <- read.csv.sql( file=fname,sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE,row.names=NULL, stringsAsFactors=FALSE,
                      colClasses = c("character", "character", rep("numeric", 7)))


## make a new variable that consist of Date and Time togetther 
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

tidydata <- data[,3:10]

## writing the clean data to tidydata.txt
write.table(tidydata, "tidydata.txt", row.name=FALSE) #write tidy data to tidydata.txt


#### Ploting Graph #####
png(file="plot1.png") ## Open png device; create 'plot1.png' in current working directory
hist(tidydata$Global_active_power, col="red", main="Global Active Power", 
        ylab="Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
